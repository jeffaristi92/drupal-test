<?php
/*********************************************************************
    helptopics.php

    Help Topics.

    Peter Rotich <peter@osticket.com>
    Copyright (c)  2006-2013 osTicket
    http://www.osticket.com

    Released under the GNU General Public License WITHOUT ANY WARRANTY.
    See LICENSE.TXT for details.

    vim: expandtab sw=4 ts=4 sts=4:
**********************************************************************/
require('admin.inc.php');
include_once(INCLUDE_DIR.'class.topic.php');

$topic=null;
if($_REQUEST['id'] && !($topic=Topic::lookup($_REQUEST['id'])))
    $errors['err']=__('Unknown or invalid help topic ID.');

if($_POST){
    switch(strtolower($_POST['do'])){
        case 'update':
            if(!$topic){
                $errors['err']=__('Unknown or invalid help topic.');
            }elseif($topic->update($_POST,$errors)){
                $msg=__('Help topic updated successfully');
            }elseif(!$errors['err']){
                $errors['err']=__('Error updating help topic. Try again!');
            }
            break;
        case 'create':
            if(($id=Topic::create($_POST,$errors))){
                $msg=__('Help topic added successfully');
                $_REQUEST['a']=null;
            }elseif(!$errors['err']){
                $errors['err']=__('Unable to add help topic. Correct error(s) below and try again.');
            }
            break;
        case 'mass_process':
            if(!$_POST['ids'] || !is_array($_POST['ids']) || !count($_POST['ids'])) {
                $errors['err'] = __('You must select at least one help topic');
            } else {
                $count=count($_POST['ids']);

                switch(strtolower($_POST['a'])) {
                    case 'enable':
                        $sql='UPDATE '.TOPIC_TABLE.' SET isactive=1 '
                            .' WHERE topic_id IN ('.implode(',', db_input($_POST['ids'])).')';
                    
                        if(db_query($sql) && ($num=db_affected_rows())) {
                            if($num==$count)
                                $msg = __('Selected help topics enabled');
                            else
                                $warn = sprintf(__('%1$d of %2$d selected help topics enabled'), $num, $count);
                        } else {
                            $errors['err'] = __('Unable to enable selected help topics.');
                        }
                        break;
                    case 'disable':
                        $sql='UPDATE '.TOPIC_TABLE.' SET isactive=0 '
                            .' WHERE topic_id IN ('.implode(',', db_input($_POST['ids'])).')';
                        if(db_query($sql) && ($num=db_affected_rows())) {
                            if($num==$count)
                                $msg = __('Selected help topics disabled');
                            else
                                $warn = sprintf(__('%1$d of %2$d selected help topics disabled'), $num, $count);
                        } else {
                            $errors['err'] =__('Unable to disable selected help topic(s)');
                        }
                        break;
                    case 'delete':
                        $i=0;
                        foreach($_POST['ids'] as $k=>$v) {
                            if(($t=Topic::lookup($v)) && $t->delete())
                                $i++;
                        }

                        if($i && $i==$count)
                            $msg = __('Selected help topics deleted successfully');
                        elseif($i>0)
                            $warn = sprintf(__('%1$d of %2$d selected help topics deleted'), $i, $count);
                        elseif(!$errors['err'])
                            $errors['err']  = __('Unable to delete selected help topics');

                        break;
                    default:
                        $errors['err']=__('Unknown action - get technical help.');
                }
            }
            break;
        default:
            $errors['err']=__('Unknown command/action');
            break;
    }
}

$page='helptopics.inc.php';
if($topic || ($_REQUEST['a'] && !strcasecmp($_REQUEST['a'],'add')))
    $page='helptopic.inc.php';

$nav->setTabActive('manage');
require(STAFFINC_DIR.'header.inc.php');
require(STAFFINC_DIR.$page);
include(STAFFINC_DIR.'footer.inc.php');
?>
