-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2014 a las 02:21:11
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `osticket`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_api_key`
--

CREATE TABLE IF NOT EXISTS `ost_api_key` (
`id` int(10) unsigned NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_canned_attachment`
--

CREATE TABLE IF NOT EXISTS `ost_canned_attachment` (
  `canned_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_canned_attachment`
--

INSERT INTO `ost_canned_attachment` (`canned_id`, `file_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_canned_response`
--

CREATE TABLE IF NOT EXISTS `ost_canned_response` (
`canned_id` int(10) unsigned NOT NULL,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', '\r\nosTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 1, 'Sample (with variables)', '\r\n%{ticket.name},\r\n\r\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in %{ticket.dept.name} department.\r\n\r\n', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_config`
--

CREATE TABLE IF NOT EXISTS `ost_config` (
`id` tinyint(1) unsigned NOT NULL,
  `isonline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` float(3,1) NOT NULL DEFAULT '0.0',
  `enable_daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `staff_ip_binding` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `staff_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `staff_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `staff_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `passwd_reset_period` int(10) unsigned NOT NULL DEFAULT '0',
  `client_max_logins` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `client_login_timeout` int(10) unsigned NOT NULL DEFAULT '2',
  `client_session_timeout` int(10) unsigned NOT NULL DEFAULT '30',
  `max_page_size` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `max_open_tickets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `max_file_size` int(11) unsigned NOT NULL DEFAULT '1048576',
  `max_user_file_uploads` tinyint(3) unsigned NOT NULL,
  `max_staff_file_uploads` tinyint(3) unsigned NOT NULL,
  `autolock_minutes` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `overdue_grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `alert_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_email_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `default_dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `default_sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_priority_id` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `default_template_id` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `default_timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_smtp_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `allow_email_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clickable_urls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_priority_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_email_priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_kb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_premade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_captcha` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_auto_cron` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_mail_polling` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_sys_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_sql_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_mailparse_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `send_login_errors` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `save_email_headers` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `strip_quoted_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_ticket_activity` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ticket_alert_admin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ticket_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note_alert_laststaff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `note_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transfer_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `transfer_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overdue_alert_assigned` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_manager` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `overdue_alert_dept_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_alert_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `assigned_alert_staff` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `assigned_alert_team_lead` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_alert_team_members` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_assign_reopened_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_related_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_answered_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_notes_inline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hide_staff_name` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overlimit_notice_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_email_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_online_attachments_onlogin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `random_ticket_ids` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `log_level` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `log_graceperiod` int(10) unsigned NOT NULL DEFAULT '12',
  `upload_dir` varchar(255) NOT NULL DEFAULT '',
  `allowed_filetypes` varchar(255) NOT NULL DEFAULT '.doc, .pdf',
  `time_format` varchar(32) NOT NULL DEFAULT ' h:i A',
  `date_format` varchar(32) NOT NULL DEFAULT 'm/d/Y',
  `datetime_format` varchar(60) NOT NULL DEFAULT 'm/d/Y g:i a',
  `daydatetime_format` varchar(60) NOT NULL DEFAULT 'D, M j Y g:ia',
  `reply_separator` varchar(60) NOT NULL DEFAULT '-- do not edit --',
  `admin_email` varchar(125) NOT NULL DEFAULT '',
  `helpdesk_title` varchar(255) NOT NULL DEFAULT 'osTicket Support Ticket System',
  `helpdesk_url` varchar(255) NOT NULL DEFAULT '',
  `schema_signature` char(32) NOT NULL DEFAULT '',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_config`
--

INSERT INTO `ost_config` (`id`, `isonline`, `timezone_offset`, `enable_daylight_saving`, `staff_ip_binding`, `staff_max_logins`, `staff_login_timeout`, `staff_session_timeout`, `passwd_reset_period`, `client_max_logins`, `client_login_timeout`, `client_session_timeout`, `max_page_size`, `max_open_tickets`, `max_file_size`, `max_user_file_uploads`, `max_staff_file_uploads`, `autolock_minutes`, `overdue_grace_period`, `alert_email_id`, `default_email_id`, `default_dept_id`, `default_sla_id`, `default_priority_id`, `default_template_id`, `default_timezone_id`, `default_smtp_id`, `allow_email_spoofing`, `clickable_urls`, `allow_priority_change`, `use_email_priority`, `enable_kb`, `enable_premade`, `enable_captcha`, `enable_auto_cron`, `enable_mail_polling`, `send_sys_errors`, `send_sql_errors`, `send_mailparse_errors`, `send_login_errors`, `save_email_headers`, `strip_quoted_reply`, `log_ticket_activity`, `ticket_autoresponder`, `message_autoresponder`, `ticket_notice_active`, `ticket_alert_active`, `ticket_alert_admin`, `ticket_alert_dept_manager`, `ticket_alert_dept_members`, `message_alert_active`, `message_alert_laststaff`, `message_alert_assigned`, `message_alert_dept_manager`, `note_alert_active`, `note_alert_laststaff`, `note_alert_assigned`, `note_alert_dept_manager`, `transfer_alert_active`, `transfer_alert_assigned`, `transfer_alert_dept_manager`, `transfer_alert_dept_members`, `overdue_alert_active`, `overdue_alert_assigned`, `overdue_alert_dept_manager`, `overdue_alert_dept_members`, `assigned_alert_active`, `assigned_alert_staff`, `assigned_alert_team_lead`, `assigned_alert_team_members`, `auto_assign_reopened_tickets`, `show_related_tickets`, `show_assigned_tickets`, `show_answered_tickets`, `show_notes_inline`, `hide_staff_name`, `overlimit_notice_active`, `email_attachments`, `allow_attachments`, `allow_email_attachments`, `allow_online_attachments`, `allow_online_attachments_onlogin`, `random_ticket_ids`, `log_level`, `log_graceperiod`, `upload_dir`, `allowed_filetypes`, `time_format`, `date_format`, `datetime_format`, `daydatetime_format`, `reply_separator`, `admin_email`, `helpdesk_title`, `helpdesk_url`, `schema_signature`, `updated`) VALUES
(1, 1, 0.0, 0, 1, 4, 2, 30, 0, 4, 2, 30, 25, 0, 1048576, 0, 0, 3, 0, 2, 1, 1, 1, 2, 1, 8, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 12, '', '.doc, .pdf', ' h:i A', 'm/d/Y', 'm/d/Y g:i a', 'D, M j Y g:ia', '-- do not edit --', 'raga1992@yahoo.es', 'Help People', 'http://localhost/drupal-test/osticket/', 'd959a00e55c75e0c903b9e37324fd25d', '2014-11-02 01:19:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_department`
--

CREATE TABLE IF NOT EXISTS `ost_department` (
`dept_id` int(11) unsigned NOT NULL,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_name` varchar(128) NOT NULL DEFAULT '',
  `dept_signature` tinytext NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ost_department`
--

INSERT INTO `ost_department` (`dept_id`, `tpl_id`, `sla_id`, `email_id`, `autoresp_email_id`, `manager_id`, `dept_name`, `dept_signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `updated`, `created`) VALUES
(1, 0, 0, 1, 1, 0, 'Support', 'Support Dept', 1, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 1, 1, 1, 0, 'Billing', 'Billing Dept', 1, 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_email`
--

CREATE TABLE IF NOT EXISTS `ost_email` (
`email_id` int(11) unsigned NOT NULL,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(125) NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `email`, `name`, `userid`, `userpass`, `mail_active`, `mail_host`, `mail_protocol`, `mail_encryption`, `mail_port`, `mail_fetchfreq`, `mail_fetchmax`, `mail_archivefolder`, `mail_delete`, `mail_errors`, `mail_lasterror`, `mail_lastfetch`, `smtp_active`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_spoofing`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 'roguar2010@gmail.com', 'Support', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2014-11-01 20:14:51', '2014-11-01 20:14:51'),
(2, 0, 2, 1, 'alerts@gmail.com', 'osTicket Alerts', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2014-11-01 20:14:51', '2014-11-01 20:14:51'),
(3, 0, 2, 1, 'noreply@gmail.com', '', '', '', 0, '', 'POP', 'NONE', NULL, 5, 30, NULL, 0, 0, NULL, NULL, 0, '', NULL, 1, 1, 0, NULL, '2014-11-01 20:14:51', '2014-11-01 20:14:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_email_template`
--

CREATE TABLE IF NOT EXISTS `ost_email_template` (
`tpl_id` int(11) NOT NULL,
  `cfg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `ticket_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_autoresp_body` text NOT NULL,
  `ticket_autoreply_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_autoreply_body` text NOT NULL,
  `ticket_notice_subj` varchar(255) NOT NULL,
  `ticket_notice_body` text NOT NULL,
  `ticket_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_alert_body` text NOT NULL,
  `message_autoresp_subj` varchar(255) NOT NULL DEFAULT '',
  `message_autoresp_body` text NOT NULL,
  `message_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `message_alert_body` text NOT NULL,
  `note_alert_subj` varchar(255) NOT NULL,
  `note_alert_body` text NOT NULL,
  `assigned_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `assigned_alert_body` text NOT NULL,
  `transfer_alert_subj` varchar(255) NOT NULL DEFAULT '',
  `transfer_alert_body` text NOT NULL,
  `ticket_overdue_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overdue_body` text NOT NULL,
  `ticket_overlimit_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_overlimit_body` text NOT NULL,
  `ticket_reply_subj` varchar(255) NOT NULL DEFAULT '',
  `ticket_reply_body` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_email_template`
--

INSERT INTO `ost_email_template` (`tpl_id`, `cfg_id`, `isactive`, `name`, `notes`, `ticket_autoresp_subj`, `ticket_autoresp_body`, `ticket_autoreply_subj`, `ticket_autoreply_body`, `ticket_notice_subj`, `ticket_notice_body`, `ticket_alert_subj`, `ticket_alert_body`, `message_autoresp_subj`, `message_autoresp_body`, `message_alert_subj`, `message_alert_body`, `note_alert_subj`, `note_alert_body`, `assigned_alert_subj`, `assigned_alert_body`, `transfer_alert_subj`, `transfer_alert_body`, `ticket_overdue_subj`, `ticket_overdue_body`, `ticket_overlimit_subj`, `ticket_overlimit_body`, `ticket_reply_subj`, `ticket_reply_body`, `created`, `updated`) VALUES
(1, 1, 1, 'osTicket Default Template', 'Default osTicket templates', 'Support Ticket Opened [#%{ticket.number}]', '%{ticket.name},\r\n\r\nA request for support has been created and assigned ticket #%{ticket.number}. A representative will follow-up with you as soon as possible.\r\n\r\nYou can view this ticket''s progress online here: %{ticket.client_link}.\r\n\r\nIf you wish to send additional comments or information regarding this issue, please don''t open a new ticket. Simply login using the link above and update the ticket.\r\n\r\n%{signature}', 'Support Ticket Opened [#%{ticket.number}]', '%{ticket.name},\r\n\r\nA request for support has been created and assigned ticket #%{ticket.number} with the following auto-reply:\r\n\r\n%{response}\r\n\r\n\r\nWe hope this response has sufficiently answered your questions. If not, please do not open another ticket. If need be, representative will follow-up with you as soon as possible.\r\n\r\nYou can view this ticket''s progress online here: %{ticket.client_link}.', '[#%{ticket.number}] %{ticket.subject}', '%{ticket.name},\r\n\r\nOur customer care team has created a ticket, #%{ticket.number} on your behalf, with the following message.\r\n\r\n%{message}\r\n\r\nIf you wish to provide additional comments or information regarding this issue, please don''t open a new ticket. You can update or view this ticket''s progress online here: %{ticket.client_link}.\r\n\r\n%{signature}', 'New Ticket Alert', '%{recipient},\r\n\r\nNew ticket #%{ticket.number} created.\r\n\r\n-----------------------\r\nName: %{ticket.name}\r\nEmail: %{ticket.email}\r\nDept: %{ticket.dept.name}\r\n\r\n%{message}\r\n-----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.', '[#%{ticket.number}] Message Added', '%{ticket.name},\r\n\r\nYour reply to support request #%{ticket.number} has been noted.\r\n\r\nYou can view this support request progress online here: %{ticket.client_link}.\r\n\r\n%{signature}', 'New Message Alert', '%{recipient},\r\n\r\nNew message appended to ticket #%{ticket.number}\r\n\r\n----------------------\r\nName: %{ticket.name}\r\nEmail: %{ticket.email}\r\nDept: %{ticket.dept.name}\r\n\r\n%{message}\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.', 'New Internal Note Alert', '%{recipient},\r\n\r\nInternal note appended to ticket #%{ticket.number}\r\n\r\n----------------------\r\n* %{note.title} *\r\n\r\n%{note.message}\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.', 'Ticket #%{ticket.number} Assigned to you', '%{assignee},\r\n\r\nTicket #%{ticket.number} has been assigned to you by %{assigner}\r\n\r\n----------------------\r\n\r\n%{comments}\r\n\r\n----------------------\r\n\r\nTo view complete details, simply login to the support system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Support Ticket System - powered by osTicket.', 'Ticket Transfer #%{ticket.number} - %{ticket.dept.name}', '%{recipient},\r\n\r\nTicket #%{ticket.number} has been transferred to %{ticket.dept.name} department by %{staff.name}\r\n\r\n----------------------\r\n\r\n%{comments}\r\n\r\n----------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\n%{ticket.staff_link}\r\n\r\n- Your friendly Customer Support System - powered by osTicket.', 'Stale Ticket Alert', '%{recipient},\r\n\r\nA ticket, #%{ticket.number} assigned to you or in your department is seriously overdue.\r\n\r\n%{ticket.staff_link}\r\n\r\nWe should all work hard to guarantee that all tickets are being addressed in a timely manner.\r\n\r\n- Your friendly (although with limited patience) Support Ticket System - powered by osTicket.', 'Open Tickets Limit Reached', '%{ticket.name}\r\n\r\nYou have reached the maximum number of open tickets allowed.\r\n\r\nTo be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply login using the link below.\r\n\r\n%{url}/tickets.php?e=%{ticket.email}\r\n\r\nThank you.\r\n\r\nSupport Ticket System', '[#%{ticket.number}] %{ticket.subject}', '%{ticket.name},\r\n\r\nA customer support staff member has replied to your support request, #%{ticket.number} with the following response:\r\n\r\n%{response}\r\n\r\nWe hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or login to your account for a complete archive of all your support requests and responses.\r\n\r\n%{ticket.client_link}\r\n\r\n%{signature}', '2014-11-01 20:14:48', '2014-11-01 20:14:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_faq`
--

CREATE TABLE IF NOT EXISTS `ost_faq` (
`faq_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` date NOT NULL,
  `updated` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_faq_attachment`
--

CREATE TABLE IF NOT EXISTS `ost_faq_attachment` (
  `faq_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_faq_category`
--

CREATE TABLE IF NOT EXISTS `ost_faq_category` (
`category_id` int(10) unsigned NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_faq_topic`
--

CREATE TABLE IF NOT EXISTS `ost_faq_topic` (
  `faq_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_file`
--

CREATE TABLE IF NOT EXISTS `ost_file` (
`id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(25) NOT NULL DEFAULT '',
  `hash` varchar(125) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_file`
--

INSERT INTO `ost_file` (`id`, `type`, `size`, `hash`, `name`, `created`) VALUES
(1, 'text/plain', '25', '670c6cc1d1dfc97fad20e5470251b255', 'osTicket.txt', '2014-11-01 20:14:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_file_chunk`
--

CREATE TABLE IF NOT EXISTS `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x43616e6e6564206174746163686d656e747320726f636b210a);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_filter`
--

CREATE TABLE IF NOT EXISTS `ost_filter` (
`id` int(11) unsigned NOT NULL,
  `execorder` int(10) unsigned NOT NULL DEFAULT '99',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `match_all_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reject_ticket` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_replyto_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disable_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canned_response_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `match_all_rules`, `stop_onmatch`, `reject_ticket`, `use_replyto_email`, `disable_autoresponder`, `canned_response_id`, `email_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `target`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Any', 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2014-11-01 20:14:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_filter_rule`
--

CREATE TABLE IF NOT EXISTS `ost_filter_rule` (
`id` int(11) unsigned NOT NULL,
  `filter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `what` enum('name','email','subject','body','header') NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_filter_rule`
--

INSERT INTO `ost_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '2014-11-01 20:14:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_groups`
--

CREATE TABLE IF NOT EXISTS `ost_groups` (
`group_id` int(10) unsigned NOT NULL,
  `group_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_post_ticket_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_assign_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_transfer_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_premade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_faq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_view_staff_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ost_groups`
--

INSERT INTO `ost_groups` (`group_id`, `group_enabled`, `group_name`, `can_create_tickets`, `can_edit_tickets`, `can_post_ticket_reply`, `can_delete_tickets`, `can_close_tickets`, `can_assign_tickets`, `can_transfer_tickets`, `can_ban_emails`, `can_manage_premade`, `can_manage_faq`, `can_view_staff_stats`, `notes`, `created`, `updated`) VALUES
(1, 1, 'Admins', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'overlords', '2014-11-01 20:14:48', '2014-11-01 20:14:48'),
(2, 1, 'Managers', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', '2014-11-01 20:14:48', '2014-11-01 20:14:48'),
(3, 1, 'Staff', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, '', '2014-11-01 20:14:48', '2014-11-01 20:14:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_group_dept_access`
--

CREATE TABLE IF NOT EXISTS `ost_group_dept_access` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ost_group_dept_access`
--

INSERT INTO `ost_group_dept_access` (`group_id`, `dept_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_help_topic`
--

CREATE TABLE IF NOT EXISTS `ost_help_topic` (
`topic_id` int(11) unsigned NOT NULL,
  `topic_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `isactive`, `ispublic`, `noautoresp`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `topic`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 1, 0, 2, 1, 0, 0, 1, 'Support', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 1, 1, 0, 3, 1, 0, 0, 0, 'Billing', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_session`
--

CREATE TABLE IF NOT EXISTS `ost_session` (
  `session_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `session_data` longtext COLLATE utf8_unicode_ci,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'osTicket staff ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('7tkkhh10hkklhcubcde53u66i1', 'csrf|a:2:{s:5:"token";s:56:"ZmZjNWIxZDE0NjQ0OTlhMTNlMGVhZmNiNjhhOTMyYzBlY2VmZWJhMQ==";s:4:"time";i:1414891238;}TZ_OFFSET|s:4:"-5.0";TZ_DST|s:1:"0";_staff|a:1:{s:4:"auth";a:2:{s:4:"dest";s:26:"/drupal-test/osticket/scp/";s:3:"msg";s:23:"Requiere Autenticación";}}', '2014-11-02 20:20:49', '2014-11-01 20:20:49', 0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_sla`
--

CREATE TABLE IF NOT EXISTS `ost_sla` (
`id` int(11) unsigned NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_priority_escalation` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disable_overdue_alerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `isactive`, `enable_priority_escalation`, `disable_overdue_alerts`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 0, 48, 'Default SLA', NULL, '2014-11-01 20:14:49', '2014-11-01 20:14:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_staff`
--

CREATE TABLE IF NOT EXISTS `ost_staff` (
`staff_id` int(11) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` tinytext NOT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `group_id`, `dept_id`, `timezone_id`, `username`, `firstname`, `lastname`, `passwd`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `daylight_saving`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 8, 'roguar', 'Roguar', 'Admin', '$2a$08$G7VpkqNf4RoGySCosN0eHOiaN0FGslZvbV9pIdqjjwWozlPSDD9yW', 'raga1992@yahoo.es', '', NULL, '', '', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '2014-11-01 20:14:51', '2014-11-01 20:16:19', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_syslog`
--

CREATE TABLE IF NOT EXISTS `ost_syslog` (
`log_id` int(11) unsigned NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Felicitaciones! Completó la instalación basica de osTicket \n\nGracias por elegir osTicket!', '', '127.0.0.1', '2014-11-01 20:14:51', '2014-11-01 20:14:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_team`
--

CREATE TABLE IF NOT EXISTS `ost_team` (
`team_id` int(10) unsigned NOT NULL,
  `lead_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noalerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `isenabled`, `noalerts`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 'Level I Support', '', '2014-11-01 20:14:49', '2014-11-01 20:14:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_team_member`
--

CREATE TABLE IF NOT EXISTS `ost_team_member` (
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket`
--

CREATE TABLE IF NOT EXISTS `ost_ticket` (
`ticket_id` int(11) unsigned NOT NULL,
  `ticketID` int(11) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '2',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '[no subject]',
  `phone` varchar(16) DEFAULT NULL,
  `phone_ext` varchar(8) DEFAULT NULL,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `ticketID`, `dept_id`, `sla_id`, `priority_id`, `topic_id`, `staff_id`, `team_id`, `email`, `name`, `subject`, `phone`, `phone_ext`, `ip_address`, `status`, `source`, `isoverdue`, `isanswered`, `duedate`, `reopened`, `closed`, `lastmessage`, `lastresponse`, `created`, `updated`) VALUES
(1, 633550, 1, 0, 2, 1, 0, 0, 'support@osticket.com', 'osTicket Support', 'osTicket Installed!', NULL, NULL, '', 'open', 'Web', 0, 0, NULL, NULL, NULL, NULL, NULL, '2014-11-01 20:14:51', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket_attachment`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_attachment` (
`attach_id` int(11) unsigned NOT NULL,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ref_type` enum('M','R','N') NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket_email_info`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_email_info` (
  `message_id` int(11) unsigned NOT NULL,
  `email_mid` varchar(255) NOT NULL,
  `headers` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket_event`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_event` (
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL,
  `team_id` int(11) unsigned NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  `state` enum('created','closed','reopened','assigned','transferred','overdue') NOT NULL,
  `staff` varchar(255) NOT NULL DEFAULT 'SYSTEM',
  `annulled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket_lock`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_lock` (
`lock_id` int(11) unsigned NOT NULL,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket_priority`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_priority` (
`priority_id` tinyint(4) NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_ticket_thread`
--

CREATE TABLE IF NOT EXISTS `ost_ticket_thread` (
`id` int(11) unsigned NOT NULL,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_type` enum('M','R','N') NOT NULL,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ost_ticket_thread`
--

INSERT INTO `ost_ticket_thread` (`id`, `pid`, `ticket_id`, `staff_id`, `thread_type`, `poster`, `source`, `title`, `body`, `ip_address`, `created`, `updated`) VALUES
(1, 0, 1, 0, 'M', '', 'Web', 'osTicket Installed', 'Thank you for choosing osTicket.\r\n\r\nPlease make sure you join the osTicket forums at http://osticket.com/forums to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community.\r\n\r\nIf you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs.\r\n\r\nCheers,\r\n\r\n-\r\nosTicket Team\r\nhttp://osticket.com/\r\n\r\nPS. Don''t just make customers happy, make happy customers!\r\n', '', '2014-11-01 20:14:51', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ost_timezone`
--

CREATE TABLE IF NOT EXISTS `ost_timezone` (
`id` int(11) unsigned NOT NULL,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `ost_timezone`
--

INSERT INTO `ost_timezone` (`id`, `offset`, `timezone`) VALUES
(1, -12.0, 'Eniwetok, Kwajalein'),
(2, -11.0, 'Midway Island, Samoa'),
(3, -10.0, 'Hawaii'),
(4, -9.0, 'Alaska'),
(5, -8.0, 'Pacific Time (US & Canada)'),
(6, -7.0, 'Mountain Time (US & Canada)'),
(7, -6.0, 'Central Time (US & Canada), Mexico City'),
(8, -5.0, 'Eastern Time (US & Canada), Bogota, Lima'),
(9, -4.0, 'Atlantic Time (Canada), Caracas, La Paz'),
(10, -3.5, 'Newfoundland'),
(11, -3.0, 'Brazil, Buenos Aires, Georgetown'),
(12, -2.0, 'Mid-Atlantic'),
(13, -1.0, 'Azores, Cape Verde Islands'),
(14, 0.0, 'Western Europe Time, London, Lisbon, Casablanca'),
(15, 1.0, 'Brussels, Copenhagen, Madrid, Paris'),
(16, 2.0, 'Kaliningrad, South Africa'),
(17, 3.0, 'Baghdad, Riyadh, Moscow, St. Petersburg'),
(18, 3.5, 'Tehran'),
(19, 4.0, 'Abu Dhabi, Muscat, Baku, Tbilisi'),
(20, 4.5, 'Kabul'),
(21, 5.0, 'Ekaterinburg, Islamabad, Karachi, Tashkent'),
(22, 5.5, 'Bombay, Calcutta, Madras, New Delhi'),
(23, 6.0, 'Almaty, Dhaka, Colombo'),
(24, 7.0, 'Bangkok, Hanoi, Jakarta'),
(25, 8.0, 'Beijing, Perth, Singapore, Hong Kong'),
(26, 9.0, 'Tokyo, Seoul, Osaka, Sapporo, Yakutsk'),
(27, 9.5, 'Adelaide, Darwin'),
(28, 10.0, 'Eastern Australia, Guam, Vladivostok'),
(29, 11.0, 'Magadan, Solomon Islands, New Caledonia'),
(30, 12.0, 'Auckland, Wellington, Fiji, Kamchatka');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ost_api_key`
--
ALTER TABLE `ost_api_key`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `apikey` (`apikey`), ADD KEY `ipaddr` (`ipaddr`);

--
-- Indices de la tabla `ost_canned_attachment`
--
ALTER TABLE `ost_canned_attachment`
 ADD PRIMARY KEY (`canned_id`,`file_id`);

--
-- Indices de la tabla `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
 ADD PRIMARY KEY (`canned_id`), ADD UNIQUE KEY `title` (`title`), ADD KEY `dept_id` (`dept_id`), ADD KEY `active` (`isenabled`), ADD FULLTEXT KEY `resp` (`title`,`response`);

--
-- Indices de la tabla `ost_config`
--
ALTER TABLE `ost_config`
 ADD PRIMARY KEY (`id`), ADD KEY `isoffline` (`isonline`);

--
-- Indices de la tabla `ost_department`
--
ALTER TABLE `ost_department`
 ADD PRIMARY KEY (`dept_id`), ADD UNIQUE KEY `dept_name` (`dept_name`), ADD KEY `manager_id` (`manager_id`), ADD KEY `autoresp_email_id` (`autoresp_email_id`), ADD KEY `tpl_id` (`tpl_id`);

--
-- Indices de la tabla `ost_email`
--
ALTER TABLE `ost_email`
 ADD PRIMARY KEY (`email_id`), ADD UNIQUE KEY `email` (`email`), ADD KEY `priority_id` (`priority_id`), ADD KEY `dept_id` (`dept_id`);

--
-- Indices de la tabla `ost_email_template`
--
ALTER TABLE `ost_email_template`
 ADD PRIMARY KEY (`tpl_id`), ADD KEY `cfg_id` (`cfg_id`), ADD FULLTEXT KEY `message_subj` (`ticket_reply_subj`);

--
-- Indices de la tabla `ost_faq`
--
ALTER TABLE `ost_faq`
 ADD PRIMARY KEY (`faq_id`), ADD UNIQUE KEY `question` (`question`), ADD KEY `category_id` (`category_id`), ADD KEY `ispublished` (`ispublished`), ADD FULLTEXT KEY `faq` (`question`,`answer`,`keywords`);

--
-- Indices de la tabla `ost_faq_attachment`
--
ALTER TABLE `ost_faq_attachment`
 ADD PRIMARY KEY (`faq_id`,`file_id`);

--
-- Indices de la tabla `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
 ADD PRIMARY KEY (`category_id`), ADD KEY `ispublic` (`ispublic`);

--
-- Indices de la tabla `ost_faq_topic`
--
ALTER TABLE `ost_faq_topic`
 ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indices de la tabla `ost_file`
--
ALTER TABLE `ost_file`
 ADD PRIMARY KEY (`id`), ADD KEY `hash` (`hash`);

--
-- Indices de la tabla `ost_file_chunk`
--
ALTER TABLE `ost_file_chunk`
 ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indices de la tabla `ost_filter`
--
ALTER TABLE `ost_filter`
 ADD PRIMARY KEY (`id`), ADD KEY `target` (`target`), ADD KEY `email_id` (`email_id`);

--
-- Indices de la tabla `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`), ADD KEY `filter_id` (`filter_id`);

--
-- Indices de la tabla `ost_groups`
--
ALTER TABLE `ost_groups`
 ADD PRIMARY KEY (`group_id`), ADD KEY `group_active` (`group_enabled`);

--
-- Indices de la tabla `ost_group_dept_access`
--
ALTER TABLE `ost_group_dept_access`
 ADD UNIQUE KEY `group_dept` (`group_id`,`dept_id`), ADD KEY `dept_id` (`dept_id`);

--
-- Indices de la tabla `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
 ADD PRIMARY KEY (`topic_id`), ADD UNIQUE KEY `topic` (`topic`,`topic_pid`), ADD KEY `topic_pid` (`topic_pid`), ADD KEY `priority_id` (`priority_id`), ADD KEY `dept_id` (`dept_id`), ADD KEY `staff_id` (`staff_id`,`team_id`), ADD KEY `sla_id` (`sla_id`);

--
-- Indices de la tabla `ost_session`
--
ALTER TABLE `ost_session`
 ADD PRIMARY KEY (`session_id`), ADD KEY `updated` (`session_updated`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `ost_sla`
--
ALTER TABLE `ost_sla`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `ost_staff`
--
ALTER TABLE `ost_staff`
 ADD PRIMARY KEY (`staff_id`), ADD UNIQUE KEY `username` (`username`), ADD KEY `dept_id` (`dept_id`), ADD KEY `issuperuser` (`isadmin`), ADD KEY `group_id` (`group_id`,`staff_id`);

--
-- Indices de la tabla `ost_syslog`
--
ALTER TABLE `ost_syslog`
 ADD PRIMARY KEY (`log_id`), ADD KEY `log_type` (`log_type`);

--
-- Indices de la tabla `ost_team`
--
ALTER TABLE `ost_team`
 ADD PRIMARY KEY (`team_id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `isnabled` (`isenabled`), ADD KEY `lead_id` (`lead_id`);

--
-- Indices de la tabla `ost_team_member`
--
ALTER TABLE `ost_team_member`
 ADD PRIMARY KEY (`team_id`,`staff_id`);

--
-- Indices de la tabla `ost_ticket`
--
ALTER TABLE `ost_ticket`
 ADD PRIMARY KEY (`ticket_id`), ADD UNIQUE KEY `email_extid` (`ticketID`,`email`), ADD KEY `dept_id` (`dept_id`), ADD KEY `staff_id` (`staff_id`), ADD KEY `team_id` (`staff_id`), ADD KEY `status` (`status`), ADD KEY `priority_id` (`priority_id`), ADD KEY `created` (`created`), ADD KEY `closed` (`closed`), ADD KEY `duedate` (`duedate`), ADD KEY `topic_id` (`topic_id`), ADD KEY `sla_id` (`sla_id`);

--
-- Indices de la tabla `ost_ticket_attachment`
--
ALTER TABLE `ost_ticket_attachment`
 ADD PRIMARY KEY (`attach_id`), ADD KEY `ticket_id` (`ticket_id`), ADD KEY `ref_type` (`ref_type`), ADD KEY `ref_id` (`ref_id`), ADD KEY `file_id` (`file_id`);

--
-- Indices de la tabla `ost_ticket_email_info`
--
ALTER TABLE `ost_ticket_email_info`
 ADD KEY `message_id` (`email_mid`);

--
-- Indices de la tabla `ost_ticket_event`
--
ALTER TABLE `ost_ticket_event`
 ADD KEY `ticket_state` (`ticket_id`,`state`,`timestamp`), ADD KEY `ticket_stats` (`timestamp`,`state`);

--
-- Indices de la tabla `ost_ticket_lock`
--
ALTER TABLE `ost_ticket_lock`
 ADD PRIMARY KEY (`lock_id`), ADD UNIQUE KEY `ticket_id` (`ticket_id`), ADD KEY `staff_id` (`staff_id`);

--
-- Indices de la tabla `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
 ADD PRIMARY KEY (`priority_id`), ADD UNIQUE KEY `priority` (`priority`), ADD KEY `priority_urgency` (`priority_urgency`), ADD KEY `ispublic` (`ispublic`);

--
-- Indices de la tabla `ost_ticket_thread`
--
ALTER TABLE `ost_ticket_thread`
 ADD PRIMARY KEY (`id`), ADD KEY `ticket_id` (`ticket_id`), ADD KEY `staff_id` (`staff_id`), ADD KEY `pid` (`pid`), ADD FULLTEXT KEY `body` (`body`);

--
-- Indices de la tabla `ost_timezone`
--
ALTER TABLE `ost_timezone`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ost_api_key`
--
ALTER TABLE `ost_api_key`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
MODIFY `canned_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ost_config`
--
ALTER TABLE `ost_config`
MODIFY `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_department`
--
ALTER TABLE `ost_department`
MODIFY `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ost_email`
--
ALTER TABLE `ost_email`
MODIFY `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ost_email_template`
--
ALTER TABLE `ost_email_template`
MODIFY `tpl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_faq`
--
ALTER TABLE `ost_faq`
MODIFY `faq_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
MODIFY `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ost_file`
--
ALTER TABLE `ost_file`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_filter`
--
ALTER TABLE `ost_filter`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_groups`
--
ALTER TABLE `ost_groups`
MODIFY `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
MODIFY `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ost_sla`
--
ALTER TABLE `ost_sla`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_staff`
--
ALTER TABLE `ost_staff`
MODIFY `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_syslog`
--
ALTER TABLE `ost_syslog`
MODIFY `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_team`
--
ALTER TABLE `ost_team`
MODIFY `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_ticket`
--
ALTER TABLE `ost_ticket`
MODIFY `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_ticket_attachment`
--
ALTER TABLE `ost_ticket_attachment`
MODIFY `attach_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ost_ticket_lock`
--
ALTER TABLE `ost_ticket_lock`
MODIFY `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
MODIFY `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ost_ticket_thread`
--
ALTER TABLE `ost_ticket_thread`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ost_timezone`
--
ALTER TABLE `ost_timezone`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
