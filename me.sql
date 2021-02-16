-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 16, 2021 at 10:51 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `me`
--

-- --------------------------------------------------------

--
-- Table structure for table `accept_estimates`
--

DROP TABLE IF EXISTS `accept_estimates`;
CREATE TABLE IF NOT EXISTS `accept_estimates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `estimate_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `signature` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accept_estimates_estimate_id_foreign` (`estimate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
CREATE TABLE IF NOT EXISTS `attendances` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `clock_in_time` datetime NOT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `clock_in_ip` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `clock_out_ip` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `working_from` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'office',
  `late` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `half_day` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_settings`
--

DROP TABLE IF EXISTS `attendance_settings`;
CREATE TABLE IF NOT EXISTS `attendance_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `office_start_time` time NOT NULL,
  `office_end_time` time NOT NULL,
  `halfday_mark_time` time DEFAULT NULL,
  `late_mark_duration` tinyint(4) NOT NULL,
  `clockin_in_day` int(11) NOT NULL DEFAULT '1',
  `employee_clock_in_out` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `office_open_days` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[1,2,3,4,5]',
  `ip_address` text COLLATE utf8_unicode_ci,
  `radius` int(11) DEFAULT NULL,
  `radius_check` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `ip_check` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance_settings`
--

INSERT INTO `attendance_settings` (`id`, `office_start_time`, `office_end_time`, `halfday_mark_time`, `late_mark_duration`, `clockin_in_day`, `employee_clock_in_out`, `office_open_days`, `ip_address`, `radius`, `radius_check`, `ip_check`, `created_at`, `updated_at`) VALUES
(1, '09:00:00', '18:00:00', NULL, 20, 2, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2021-02-15 21:39:55', '2021-02-15 21:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

DROP TABLE IF EXISTS `client_contacts`;
CREATE TABLE IF NOT EXISTS `client_contacts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_contacts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_details`
--

DROP TABLE IF EXISTS `client_details`;
CREATE TABLE IF NOT EXISTS `client_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `shipping_address` text COLLATE utf8_unicode_ci,
  `website` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `linkedin` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gst_number` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_details_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_details`
--

INSERT INTO `client_details` (`id`, `user_id`, `company_name`, `address`, `shipping_address`, `website`, `note`, `linkedin`, `facebook`, `twitter`, `skype`, `gst_number`, `created_at`, `updated_at`) VALUES
(1, 2, 'Company 1', 'Sample 123 Company Address, City', 'Shipping Sample 123 Company Address, City', 'https://company.com', 'Custom Demo Notes', 'company1', 'company1', 'company1', 'skypecom1', '87643875241832', '2021-02-15 22:57:06', '2021-02-15 22:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
CREATE TABLE IF NOT EXISTS `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `original_amount` decimal(15,2) NOT NULL,
  `contract_type_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `original_start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `original_end_date` date NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `contract_detail` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_client_id_foreign` (`client_id`),
  KEY `contracts_contract_type_id_foreign` (`contract_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_discussions`
--

DROP TABLE IF EXISTS `contract_discussions`;
CREATE TABLE IF NOT EXISTS `contract_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_discussions_contract_id_foreign` (`contract_id`),
  KEY `contract_discussions_from_foreign` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_renews`
--

DROP TABLE IF EXISTS `contract_renews`;
CREATE TABLE IF NOT EXISTS `contract_renews` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `renewed_by` int(10) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_renews_renewed_by_foreign` (`renewed_by`),
  KEY `contract_renews_contract_id_foreign` (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_signs`
--

DROP TABLE IF EXISTS `contract_signs`;
CREATE TABLE IF NOT EXISTS `contract_signs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `signature` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_signs_contract_id_foreign` (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

DROP TABLE IF EXISTS `contract_types`;
CREATE TABLE IF NOT EXISTS `contract_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
CREATE TABLE IF NOT EXISTS `conversation` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_two` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_user_one_foreign` (`user_one`),
  KEY `conversation_user_two_foreign` (`user_two`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_reply`
--

DROP TABLE IF EXISTS `conversation_reply`;
CREATE TABLE IF NOT EXISTS `conversation_reply` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `reply` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_reply_conversation_id_foreign` (`conversation_id`),
  KEY `conversation_reply_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

DROP TABLE IF EXISTS `credit_notes`;
CREATE TABLE IF NOT EXISTS `credit_notes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `cn_number` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_type` enum('percent','fixed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('closed','open') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `recurring` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `billing_frequency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `billing_cycle` int(11) DEFAULT NULL,
  `file` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_original_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_notes_project_id_foreign` (`project_id`),
  KEY `credit_notes_currency_id_foreign` (`currency_id`),
  KEY `credit_notes_client_id_foreign` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes_invoice`
--

DROP TABLE IF EXISTS `credit_notes_invoice`;
CREATE TABLE IF NOT EXISTS `credit_notes_invoice` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `credit_notes_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `credit_amount` double(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_note_items`
--

DROP TABLE IF EXISTS `credit_note_items`;
CREATE TABLE IF NOT EXISTS `credit_note_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `taxes` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_note_items_credit_note_id_foreign` (`credit_note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `usd_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `is_cryptocurrency`, `usd_price`, `created_at`, `updated_at`) VALUES
(1, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2021-02-15 21:40:11', '2021-02-15 21:40:11'),
(2, 'Pounds', '£', 'GBP', NULL, 'no', NULL, '2021-02-15 21:40:11', '2021-02-15 21:40:11'),
(3, 'Euros', '€', 'EUR', NULL, 'no', NULL, '2021-02-15 21:40:11', '2021-02-15 21:40:11'),
(4, 'Rupee', 'Rs.', 'PKR', NULL, 'no', NULL, '2021-02-15 21:40:11', '2021-02-15 21:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `custom_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `values` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

DROP TABLE IF EXISTS `custom_fields_data`;
CREATE TABLE IF NOT EXISTS `custom_fields_data` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_fields_data_custom_field_id_foreign` (`custom_field_id`),
  KEY `custom_fields_data_model_index` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

DROP TABLE IF EXISTS `custom_field_groups`;
CREATE TABLE IF NOT EXISTS `custom_field_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_groups_model_index` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_field_groups`
--

INSERT INTO `custom_field_groups` (`id`, `name`, `model`) VALUES
(1, 'Client', 'App\\ClientDetails'),
(2, 'Employee', 'App\\EmployeeDetails'),
(3, 'Project', 'App\\Project'),
(4, 'Invoice', 'App\\Invoice'),
(5, 'Estimate', 'App\\Estimate'),
(6, 'Task', 'App\\Task'),
(7, 'Expense', 'App\\Expense');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
CREATE TABLE IF NOT EXISTS `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `widget_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `widget_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'total_clients', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(2, 'total_employees', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(3, 'total_projects', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(4, 'total_unpaid_invoices', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(5, 'total_hours_logged', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(6, 'total_pending_tasks', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(7, 'total_today_attendance', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(8, 'total_unresolved_tickets', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(9, 'recent_earnings', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(10, 'settings_leaves', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(11, 'new_tickets', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(12, 'overdue_tasks', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(13, 'pending_follow_up', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(14, 'project_activity_timeline', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05'),
(15, 'user_activity_timeline', 1, '2021-02-15 21:40:05', '2021-02-15 21:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
CREATE TABLE IF NOT EXISTS `designations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
CREATE TABLE IF NOT EXISTS `discussions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `discussion_category_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci DEFAULT '#232629',
  `user_id` int(10) UNSIGNED NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `best_answer_id` int(10) UNSIGNED DEFAULT NULL,
  `last_reply_by_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_discussion_category_id_foreign` (`discussion_category_id`),
  KEY `discussions_project_id_foreign` (`project_id`),
  KEY `discussions_user_id_foreign` (`user_id`),
  KEY `discussions_best_answer_id_foreign` (`best_answer_id`),
  KEY `discussions_last_reply_by_id_foreign` (`last_reply_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_categories`
--

DROP TABLE IF EXISTS `discussion_categories`;
CREATE TABLE IF NOT EXISTS `discussion_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discussion_categories`
--

INSERT INTO `discussion_categories` (`id`, `order`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', '#3498DB', '2021-02-15 21:40:09', '2021-02-15 21:40:09');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_replies`
--

DROP TABLE IF EXISTS `discussion_replies`;
CREATE TABLE IF NOT EXISTS `discussion_replies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_replies_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_replies_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_notification_settings`
--

DROP TABLE IF EXISTS `email_notification_settings`;
CREATE TABLE IF NOT EXISTS `email_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `send_email` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `send_slack` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `send_push` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_notification_settings`
--

INSERT INTO `email_notification_settings` (`id`, `setting_name`, `send_email`, `send_slack`, `send_push`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'New Expense/Added by Admin', 'yes', 'no', 'no', '2021-02-15 21:39:54', '2021-02-15 21:40:09', 'new-expenseadded-by-admin'),
(2, 'New Expense/Added by Member', 'yes', 'no', 'no', '2021-02-15 21:39:54', '2021-02-15 21:40:09', 'new-expenseadded-by-member'),
(3, 'Expense Status Changed', 'yes', 'no', 'no', '2021-02-15 21:39:54', '2021-02-15 21:40:09', 'expense-status-changed'),
(4, 'New Support Ticket Request', 'yes', 'no', 'no', '2021-02-15 21:39:55', '2021-02-15 21:40:09', 'new-support-ticket-request'),
(5, 'New Leave Application', 'yes', 'no', 'no', '2021-02-15 21:39:56', '2021-02-15 21:40:09', 'new-leave-application'),
(6, 'Task Completed', 'yes', 'no', 'no', '2021-02-15 21:39:56', '2021-02-15 21:40:09', 'task-completed'),
(7, 'Invoice Create/Update Notification', 'yes', 'no', 'no', '2021-02-15 21:40:04', '2021-02-15 21:40:09', 'invoice-createupdate-notification'),
(8, 'Discussion Reply', 'yes', 'no', 'no', '2021-02-15 21:40:10', '2021-02-15 21:40:10', 'discussion-reply'),
(9, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2021-02-15 21:40:11', '2021-02-15 21:40:11', 'user-registrationadded-by-admin'),
(10, 'Employee Assign to Project', 'yes', 'no', 'no', '2021-02-15 21:40:11', '2021-02-15 21:40:11', 'employee-assign-to-project'),
(11, 'New Notice Published', 'no', 'no', 'no', '2021-02-15 21:40:11', '2021-02-15 21:40:11', 'new-notice-published'),
(12, 'User Assign to Task', 'yes', 'no', 'no', '2021-02-15 21:40:11', '2021-02-15 21:40:11', 'user-assign-to-task');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

DROP TABLE IF EXISTS `employee_details`;
CREATE TABLE IF NOT EXISTS `employee_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `employee_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `hourly_rate` double DEFAULT NULL,
  `slack_username` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joining_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_details_slack_username_unique` (`slack_username`),
  UNIQUE KEY `employee_details_employee_id_unique` (`employee_id`),
  KEY `employee_details_user_id_foreign` (`user_id`),
  KEY `employee_details_designation_id_foreign` (`designation_id`),
  KEY `employee_details_department_id_foreign` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `user_id`, `employee_id`, `address`, `hourly_rate`, `slack_username`, `department_id`, `designation_id`, `created_at`, `updated_at`, `joining_date`, `last_date`) VALUES
(1, 1, 'emp-1', '71278 Damien Inlet\r\nHansenside, HI 31477', 71, NULL, NULL, NULL, '2021-02-15 21:40:11', '2021-02-15 22:33:55', '2021-02-16 02:40:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_docs`
--

DROP TABLE IF EXISTS `employee_docs`;
CREATE TABLE IF NOT EXISTS `employee_docs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hashname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_docs_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_skills`
--

DROP TABLE IF EXISTS `employee_skills`;
CREATE TABLE IF NOT EXISTS `employee_skills` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_skills_user_id_foreign` (`user_id`),
  KEY `employee_skills_skill_id_foreign` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_teams`
--

DROP TABLE IF EXISTS `employee_teams`;
CREATE TABLE IF NOT EXISTS `employee_teams` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `team_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_teams_team_id_foreign` (`team_id`),
  KEY `employee_teams_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
CREATE TABLE IF NOT EXISTS `estimates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `estimate_number` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valid_till` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_type` enum('percent','fixed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('declined','accepted','waiting','sent') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'waiting',
  `note` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estimates_estimate_number_unique` (`estimate_number`),
  KEY `estimates_client_id_foreign` (`client_id`),
  KEY `estimates_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

DROP TABLE IF EXISTS `estimate_items`;
CREATE TABLE IF NOT EXISTS `estimate_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `estimate_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `item_summary` text COLLATE utf8_unicode_ci,
  `type` enum('item','discount','tax') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `taxes` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estimate_items_estimate_id_foreign` (`estimate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `label_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `where` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `repeat` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `repeat_every` int(11) DEFAULT NULL,
  `repeat_cycles` int(11) DEFAULT NULL,
  `repeat_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'day',
  `send_reminder` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `remind_time` int(11) DEFAULT NULL,
  `remind_type` enum('day','hour','minute') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_attendees`
--

DROP TABLE IF EXISTS `event_attendees`;
CREATE TABLE IF NOT EXISTS `event_attendees` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_attendees_user_id_foreign` (`user_id`),
  KEY `event_attendees_event_id_foreign` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_from` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `bill` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `can_claim` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `expenses_currency_id_foreign` (`currency_id`),
  KEY `expenses_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_settings`
--

DROP TABLE IF EXISTS `file_storage_settings`;
CREATE TABLE IF NOT EXISTS `file_storage_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `filesystem` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `auth_keys` text COLLATE utf8_unicode_ci,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `file_storage_settings`
--

INSERT INTO `file_storage_settings` (`id`, `filesystem`, `auth_keys`, `status`, `created_at`, `updated_at`) VALUES
(1, 'local', NULL, 'enabled', '2021-02-15 21:39:57', '2021-02-15 21:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `gdpr_settings`
--

DROP TABLE IF EXISTS `gdpr_settings`;
CREATE TABLE IF NOT EXISTS `gdpr_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `enable_gdpr` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer_area` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer_footer` tinyint(1) NOT NULL DEFAULT '0',
  `top_information_block` longtext COLLATE utf8_unicode_ci,
  `enable_export` tinyint(1) NOT NULL DEFAULT '0',
  `data_removal` tinyint(1) NOT NULL DEFAULT '0',
  `lead_removal_public_form` tinyint(1) NOT NULL DEFAULT '0',
  `terms_customer_footer` tinyint(1) NOT NULL DEFAULT '0',
  `terms` longtext COLLATE utf8_unicode_ci,
  `policy` longtext COLLATE utf8_unicode_ci,
  `public_lead_edit` tinyint(1) NOT NULL DEFAULT '0',
  `consent_customer` tinyint(1) NOT NULL DEFAULT '0',
  `consent_leads` tinyint(1) NOT NULL DEFAULT '0',
  `consent_block` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gdpr_settings`
--

INSERT INTO `gdpr_settings` (`id`, `enable_gdpr`, `show_customer_area`, `show_customer_footer`, `top_information_block`, `enable_export`, `data_removal`, `lead_removal_public_form`, `terms_customer_footer`, `terms`, `policy`, `public_lead_edit`, `consent_customer`, `consent_leads`, `consent_block`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, '2021-02-15 21:40:05', '2021-02-15 21:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE IF NOT EXISTS `holidays` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `occassion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_number` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_type` enum('percent','fixed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('paid','unpaid','partial','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `recurring` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `billing_cycle` int(11) DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_original_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `credit_note` tinyint(1) NOT NULL DEFAULT '0',
  `show_shipping_address` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estimate_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  KEY `invoices_project_id_foreign` (`project_id`),
  KEY `invoices_currency_id_foreign` (`currency_id`),
  KEY `invoices_estimate_id_foreign` (`estimate_id`),
  KEY `invoices_client_id_foreign` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `item_summary` text COLLATE utf8_unicode_ci,
  `type` enum('item','discount','tax') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `taxes` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_settings`
--

DROP TABLE IF EXISTS `invoice_settings`;
CREATE TABLE IF NOT EXISTS `invoice_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_prefix` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_digit` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `estimate_prefix` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EST',
  `estimate_digit` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `credit_note_prefix` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'CN',
  `credit_note_digit` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `template` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `due_after` int(11) NOT NULL,
  `invoice_terms` text COLLATE utf8_unicode_ci NOT NULL,
  `gst_number` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_gst` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_settings`
--

INSERT INTO `invoice_settings` (`id`, `invoice_prefix`, `invoice_digit`, `estimate_prefix`, `estimate_digit`, `credit_note_prefix`, `credit_note_digit`, `template`, `due_after`, `invoice_terms`, `gst_number`, `show_gst`, `created_at`, `updated_at`, `logo`) VALUES
(1, 'INV', 3, 'EST', 3, 'CN', 3, 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, 'no', '2021-02-15 21:39:54', '2021-02-15 21:39:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
CREATE TABLE IF NOT EXISTS `issues` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','resolved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_user_id_foreign` (`user_id`),
  KEY `issues_project_id_foreign` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_settings`
--

DROP TABLE IF EXISTS `language_settings`;
CREATE TABLE IF NOT EXISTS `language_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `language_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `language_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language_settings`
--

INSERT INTO `language_settings` (`id`, `language_code`, `language_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'Arabic', 'disabled', NULL, NULL),
(2, 'de', 'German', 'disabled', NULL, NULL),
(3, 'es', 'Spanish', 'enabled', NULL, NULL),
(4, 'et', 'Estonian', 'disabled', NULL, NULL),
(5, 'fa', 'Farsi', 'disabled', NULL, NULL),
(6, 'fr', 'French', 'enabled', NULL, NULL),
(7, 'gr', 'Greek', 'disabled', NULL, NULL),
(8, 'it', 'Italian', 'disabled', NULL, NULL),
(9, 'nl', 'Dutch', 'disabled', NULL, NULL),
(10, 'pl', 'Polish', 'disabled', NULL, NULL),
(11, 'pt', 'Portuguese', 'disabled', NULL, NULL),
(12, 'pt-br', 'Portuguese (Brazil)', 'disabled', NULL, NULL),
(13, 'ro', 'Romanian', 'disabled', NULL, NULL),
(14, 'ru', 'Russian', 'enabled', NULL, NULL),
(15, 'tr', 'Turkish', 'disabled', NULL, NULL),
(16, 'zh-CN', 'Chinese (S)', 'disabled', NULL, NULL),
(17, 'zh-TW', 'Chinese (T)', 'disabled', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
CREATE TABLE IF NOT EXISTS `leads` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `client_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `client_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `next_follow_up` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_agent_id_foreign` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_agents`
--

DROP TABLE IF EXISTS `lead_agents`;
CREATE TABLE IF NOT EXISTS `lead_agents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_agents_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_files`
--

DROP TABLE IF EXISTS `lead_files`;
CREATE TABLE IF NOT EXISTS `lead_files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hashname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `google_url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_files_lead_id_foreign` (`lead_id`),
  KEY `lead_files_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_follow_up`
--

DROP TABLE IF EXISTS `lead_follow_up`;
CREATE TABLE IF NOT EXISTS `lead_follow_up` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `next_follow_up_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_follow_up_lead_id_foreign` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

DROP TABLE IF EXISTS `lead_sources`;
CREATE TABLE IF NOT EXISTS `lead_sources` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_sources_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'email', NULL, NULL),
(2, 'google', NULL, NULL),
(3, 'facebook', NULL, NULL),
(4, 'friend', NULL, NULL),
(5, 'direct visit', NULL, NULL),
(6, 'tv ad', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_status`
--

DROP TABLE IF EXISTS `lead_status`;
CREATE TABLE IF NOT EXISTS `lead_status` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_status_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lead_status`
--

INSERT INTO `lead_status` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'pending', NULL, NULL),
(2, 'inprocess', NULL, NULL),
(3, 'converted', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
CREATE TABLE IF NOT EXISTS `leaves` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `duration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `leave_date` date NOT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('approved','pending','rejected') COLLATE utf8_unicode_ci NOT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaves_user_id_foreign` (`user_id`),
  KEY `leaves_leave_type_id_foreign` (`leave_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE IF NOT EXISTS `leave_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `no_of_leaves` int(11) NOT NULL DEFAULT '5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `type_name`, `color`, `no_of_leaves`, `created_at`, `updated_at`) VALUES
(1, 'Casual', 'success', 5, '2021-02-15 21:39:56', '2021-02-15 21:39:56'),
(2, 'Sick', 'danger', 5, '2021-02-15 21:39:56', '2021-02-15 21:39:56'),
(3, 'Earned', 'info', 5, '2021-02-15 21:39:56', '2021-02-15 21:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `log_time_for`
--

DROP TABLE IF EXISTS `log_time_for`;
CREATE TABLE IF NOT EXISTS `log_time_for` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_time_for` enum('project','task') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'project',
  `auto_timer_stop` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approval_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `log_time_for`
--

INSERT INTO `log_time_for` (`id`, `log_time_for`, `auto_timer_stop`, `created_at`, `updated_at`, `approval_required`) VALUES
(1, 'project', 'no', '2021-02-15 21:39:59', '2021-02-15 21:39:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
CREATE TABLE IF NOT EXISTS `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `translate_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `setting_menu` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `translate_name`, `route`, `module`, `icon`, `setting_menu`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'app.menu.dashboard', 'admin.dashboard', 'visibleToAll', 'icon-speedometer', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(2, 'customers', 'app.menu.customers', NULL, 'customers', 'icon-people', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(3, 'clients', 'app.menu.clients', 'admin.clients.index', 'clients', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(4, 'leads', 'app.menu.lead', 'admin.leads.index', 'leads', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(5, 'hr', 'app.menu.hr', NULL, 'hr', 'ti-user', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(6, 'employees', 'app.menu.employeeList', 'admin.employees.index', 'employees', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(7, 'department', 'app.department', 'admin.department.index', 'employees', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(8, 'designation', 'app.menu.designation', 'admin.designations.index', 'employees', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(9, 'attendance', 'app.menu.attendance', 'admin.attendances.summary', 'attendance', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(10, 'holidays', 'app.menu.holiday', 'admin.holidays.index', 'holidays', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(11, 'leaves', 'app.menu.leaves', 'admin.leaves.pending', 'leaves', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(12, 'work', 'app.menu.work', NULL, 'work', 'icon-layers', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(13, 'contracts', 'app.menu.contracts', 'admin.contracts.index', 'contracts', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(14, 'projects', 'app.menu.projects', 'admin.projects.index', 'projects', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(15, 'tasks', 'app.menu.tasks', 'admin.all-tasks.index', 'tasks', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(16, 'taskBoard', 'modules.tasks.taskBoard', 'admin.taskboard.index', 'tasks', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(17, 'taskCalendar', 'app.menu.taskCalendar', 'admin.task-calendar.index', 'tasks', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(18, 'timelogs', 'app.menu.timeLogs', 'admin.all-time-logs.index', 'timelogs', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(19, 'finance', 'app.menu.finance', NULL, 'finance', 'fa fa-money', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(20, 'estimates', 'app.menu.estimates', 'admin.estimates.index', 'estimates', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(21, 'invoices', 'app.menu.invoices', 'admin.all-invoices.index', 'invoices', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(22, 'payments', 'app.menu.payments', 'admin.payments.index', 'payments', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(23, 'expenses', 'app.menu.expenses', 'admin.expenses.index', 'expenses', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(24, 'credit-note', 'app.menu.credit-note', 'admin.all-credit-notes.index', 'invoices', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(25, 'products', 'app.menu.products', 'admin.products.index', 'products', 'icon-basket', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(26, 'tickets', 'app.menu.tickets', 'admin.tickets.index', 'tickets', 'ti-ticket', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(27, 'messages', 'app.menu.messages', 'admin.user-chat.index', 'messages', 'icon-envelope', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(28, 'events', 'app.menu.Events', 'admin.events.index', 'events', 'icon-calender', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(29, 'noticeBoard', 'app.menu.noticeBoard', 'admin.notices.index', 'notices', 'ti-layout-media-overlay', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(30, 'reports', 'app.menu.reports', NULL, 'visibleToAll', 'ti-pie-chart', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(31, 'taskReport', 'app.menu.taskReport', 'admin.task-report.index', 'visibleToAll', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(32, 'timeLogReport', 'app.menu.timeLogReport', 'admin.time-log-report.index', 'visibleToAll', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(33, 'financeReport', 'app.menu.financeReport', 'admin.finance-report.index', 'visibleToAll', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(34, 'incomeVsExpenseReport', 'app.menu.incomeVsExpenseReport', 'admin.income-expense-report.index', 'visibleToAll', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(35, 'leaveReport', 'app.menu.leaveReport', 'admin.leave-report.index', 'visibleToAll', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(36, 'attendanceReport', 'app.menu.attendanceReport', 'admin.attendance-report.index', 'visibleToAll', NULL, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(37, 'settings', 'app.menu.settings', 'admin.settings.index', 'visibleToAll', 'ti-settings', 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(38, 'accountSettings', 'app.menu.accountSettings', 'admin.settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(39, 'profileSettings', 'app.menu.profileSettings', 'admin.profile-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(40, 'notificationSettings', 'app.menu.notificationSettings', 'admin.email-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(41, 'emailSettings', 'app.menu.emailSettings', 'admin.email-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(42, 'slackSettings', 'app.menu.slackSettings', 'admin.slack-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(43, 'pushNotifications', 'app.menu.pushNotifications', 'admin.push-notification-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(44, 'pusherSettings', 'app.menu.pusherSettings', 'admin.pusher-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(45, 'currencySettings', 'app.menu.currencySettings', 'admin.currency.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(46, 'paymentGatewayCredential', 'app.menu.paymentGatewayCredential', 'admin.payment-gateway-credential.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(47, 'onlinePayment', 'app.menu.onlinePayment', 'admin.payment-gateway-credential.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(48, 'offlinePaymentMethod', 'app.menu.offlinePaymentMethod', 'admin.offline-payment-setting.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(49, 'financeSettings', 'app.menu.financeSettings', 'admin.invoice-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(50, 'ticketSettings', 'app.menu.ticketSettings', 'admin.ticket-agents.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(51, 'ticketAgents', 'app.menu.ticketAgents', 'admin.ticket-agents.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(52, 'ticketTypes', 'app.menu.ticketTypes', 'admin.ticketTypes.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(53, 'ticketChannel', 'app.menu.ticketChannel', 'admin.ticketChannels.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(54, 'replyTemplates', 'app.menu.replyTemplates', 'admin.replyTemplates.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(55, 'projectSettings', 'app.menu.projectSettings', 'admin.project-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(56, 'attendanceSettings', 'app.menu.attendanceSettings', 'admin.attendance-settings.index', 'attendance', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(57, 'leaveSettings', 'app.menu.leaveSettings', 'admin.leaves-settings.index', 'leaves', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(58, 'customFields', 'app.menu.customFields', 'admin.custom-fields.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(59, 'menuSetting', 'app.menu.menuSetting', 'admin.menu-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(60, 'moduleSettings', 'app.menu.moduleSettings', 'admin.module-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(61, 'adminModule', 'app.menu.adminModule', 'admin.module-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(62, 'employeeModule', 'app.menu.employeeModule', 'admin.module-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(63, 'clientModule', 'app.menu.clientModule', 'admin.module-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(64, 'customModule', 'app.menu.customModule', 'admin.custom-modules.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(65, 'rolesPermission', 'app.menu.rolesPermission', 'admin.role-permission.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(66, 'messageSettings', 'app.menu.messageSettings', 'admin.message-settings.index', 'messages', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(67, 'storageSettings', 'app.menu.storageSettings', 'admin.storage-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(68, 'languageSettings', 'app.menu.languageSettings', 'admin.language-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(69, 'leadSettings', 'app.menu.leadSettings', 'admin.lead-source-settings.index', 'leads', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(70, 'leadSource', 'app.menu.leadSource', 'admin.lead-source-settings.index', 'leads', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(71, 'leadStatus', 'app.menu.leadStatus', 'admin.lead-status-settings.index', 'leads', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(72, 'leadAgent', 'modules.lead.leadAgent', 'admin.lead-agent-settings.index', 'leads', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(73, 'timeLogSettings', 'app.menu.timeLogSettings', 'admin.log-time-settings.index', 'timelogs', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(74, 'taskSettings', 'app.menu.taskSettings', 'admin.task-settings.index', 'tasks', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(75, 'gdpr', 'app.menu.gdpr', 'admin.gdpr.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(76, 'general', 'app.menu.general', 'admin.gdpr.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(77, 'rightToDataPortability', 'app.menu.rightToDataPortability', 'admin.gdpr.right-to-data-portability', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(78, 'rightToErasure', 'app.menu.rightToErasure', 'admin.gdpr.right-to-erasure', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(79, 'rightToBeInformed', 'app.menu.rightToBeInformed', 'admin.gdpr.right-to-informed', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(80, 'rightOfRectification', 'app.menu.rightOfRectification', 'admin.gdpr.right-of-access', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(81, 'consent', 'app.menu.consent', 'admin.gdpr.consent', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(82, 'updates', 'app.menu.updates', 'admin.update-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(83, 'themeSettings', 'app.menu.themeSettings', 'admin.theme-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(84, 'socialAuthSettings', 'app.menu.socialAuthSettings', 'admin.social-auth-settings.index', 'visibleToAll', NULL, 1, '2021-02-15 21:40:10', '2021-02-15 21:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `menu_settings`
--

DROP TABLE IF EXISTS `menu_settings`;
CREATE TABLE IF NOT EXISTS `menu_settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `main_menu` longtext COLLATE utf8_unicode_ci,
  `default_main_menu` longtext COLLATE utf8_unicode_ci,
  `setting_menu` longtext COLLATE utf8_unicode_ci,
  `default_setting_menu` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_settings`
--

INSERT INTO `menu_settings` (`id`, `main_menu`, `default_main_menu`, `setting_menu`, `default_setting_menu`, `created_at`, `updated_at`) VALUES
(1, '[{\"id\":1},{\"id\":2,\"children\":[{\"id\":3},{\"id\":4}]},{\"id\":5,\"children\":[{\"id\":6},{\"id\":7},{\"id\":8},{\"id\":9},{\"id\":10},{\"id\":11}]},{\"id\":12,\"children\":[{\"id\":13},{\"id\":14},{\"id\":15},{\"id\":16},{\"id\":17},{\"id\":18}]},{\"id\":19,\"children\":[{\"id\":20},{\"id\":21},{\"id\":22},{\"id\":23},{\"id\":24}]},{\"id\":25},{\"id\":26},{\"id\":27},{\"id\":28},{\"id\":29},{\"id\":30,\"children\":[{\"id\":31},{\"id\":32},{\"id\":33},{\"id\":34},{\"id\":35},{\"id\":36}]},{\"id\":37}]', '[{\"id\":1},{\"id\":2,\"children\":[{\"id\":3},{\"id\":4}]},{\"id\":5,\"children\":[{\"id\":6},{\"id\":7},{\"id\":8},{\"id\":9},{\"id\":10},{\"id\":11}]},{\"id\":12,\"children\":[{\"id\":13},{\"id\":14},{\"id\":15},{\"id\":16},{\"id\":17},{\"id\":18}]},{\"id\":19,\"children\":[{\"id\":20},{\"id\":21},{\"id\":22},{\"id\":23},{\"id\":24}]},{\"id\":25},{\"id\":26},{\"id\":27},{\"id\":28},{\"id\":29},{\"id\":30,\"children\":[{\"id\":31},{\"id\":32},{\"id\":33},{\"id\":34},{\"id\":35},{\"id\":36}]},{\"id\":37}]', '[{\"id\":38},{\"id\":39},{\"id\":40,\"children\":[{\"id\":41},{\"id\":42},{\"id\":43},{\"id\":44}]},{\"id\":45},{\"id\":46,\"children\":[{\"id\":47},{\"id\":48}]},{\"id\":49},{\"id\":50,\"children\":[{\"id\":51},{\"id\":52},{\"id\":53},{\"id\":54}]},{\"id\":55},{\"id\":56},{\"id\":57},{\"id\":58},{\"id\":59},{\"id\":60,\"children\":[{\"id\":61},{\"id\":62},{\"id\":63},{\"id\":64}]},{\"id\":65},{\"id\":66},{\"id\":67},{\"id\":68},{\"id\":69,\"children\":[{\"id\":70},{\"id\":71},{\"id\":72}]},{\"id\":73},{\"id\":74},{\"id\":75,\"children\":[{\"id\":76},{\"id\":77},{\"id\":78},{\"id\":79},{\"id\":80},{\"id\":81}]},{\"id\":82},{\"id\":83},{\"id\":84}]', '[{\"id\":38},{\"id\":39},{\"id\":40,\"children\":[{\"id\":41},{\"id\":42},{\"id\":43},{\"id\":44}]},{\"id\":45},{\"id\":46,\"children\":[{\"id\":47},{\"id\":48}]},{\"id\":49},{\"id\":50,\"children\":[{\"id\":51},{\"id\":52},{\"id\":53},{\"id\":54}]},{\"id\":55},{\"id\":56},{\"id\":57},{\"id\":58},{\"id\":59},{\"id\":60,\"children\":[{\"id\":61},{\"id\":62},{\"id\":63},{\"id\":64}]},{\"id\":65},{\"id\":66},{\"id\":67},{\"id\":68},{\"id\":69,\"children\":[{\"id\":70},{\"id\":71},{\"id\":72}]},{\"id\":73},{\"id\":74},{\"id\":75,\"children\":[{\"id\":76},{\"id\":77},{\"id\":78},{\"id\":79},{\"id\":80},{\"id\":81}]},{\"id\":82},{\"id\":83},{\"id\":84}]', '2021-02-15 21:40:09', '2021-02-15 21:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `message_settings`
--

DROP TABLE IF EXISTS `message_settings`;
CREATE TABLE IF NOT EXISTS `message_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `allow_client_admin` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `allow_client_employee` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_settings`
--

INSERT INTO `message_settings` (`id`, `allow_client_admin`, `allow_client_employee`, `created_at`, `updated_at`) VALUES
(1, 'no', 'no', '2021-02-15 21:39:56', '2021-02-15 21:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_20_112951_create_user_chat_table', 1),
(5, '2017_03_23_110416_add_column_users_table', 1),
(6, '2017_03_23_111036_create_client_details_table', 1),
(7, '2017_03_23_112028_create_client_contacts_table', 1),
(8, '2017_03_23_112353_create_employee_details_table', 1),
(9, '2017_03_23_114438_create_organisation_settings_table', 1),
(10, '2017_03_23_122646_create_project_category_table', 1),
(11, '2017_03_23_123601_create_projects_table', 1),
(12, '2017_03_23_125424_create_project_members_table', 1),
(13, '2017_03_23_125625_create_project_time_logs_table', 1),
(14, '2017_03_23_130413_create_project_files_table', 1),
(15, '2017_03_24_051800_create_tasks_table', 1),
(16, '2017_03_24_054355_create_notices_table', 1),
(17, '2017_03_24_055005_create_conversation_table', 1),
(18, '2017_03_24_055539_create_conversation_reply_table', 1),
(19, '2017_03_24_055859_create_invoices_table', 1),
(20, '2017_03_24_060421_create_invoice_items_table', 1),
(21, '2017_03_24_060751_create_quotations_table', 1),
(22, '2017_03_24_061241_create_quotation_items_table', 1),
(23, '2017_03_24_061505_create_sticky_notes_table', 1),
(24, '2017_03_24_064541_create_issues_table', 1),
(25, '2017_03_29_123858_entrust_setup_tables', 1),
(26, '2017_04_04_193158_AddColumnsProjectFilesTable', 1),
(27, '2017_04_05_063103_change_clientid_projectid_invoice_table', 1),
(28, '2017_04_06_051401_add_discount_column_invoice_table', 1),
(29, '2017_04_06_054728_add_status_column_issues_table', 1),
(30, '2017_04_08_152902_add_total_hours_column_time_log_table', 1),
(31, '2017_04_18_095809_create_project_activity_table', 1),
(32, '2017_04_18_103815_create_user_activities_table', 1),
(33, '2017_04_19_101519_create_email_notification_settings_table', 1),
(34, '2017_04_20_185211_add_colour_column_sticky_notes_table', 1),
(35, '2017_04_28_114154_create_notifications_table', 1),
(36, '2017_05_03_131016_add_project_completion_field_projects', 1),
(37, '2017_05_03_174333_create_currencies_table', 1),
(38, '2017_05_05_124330_create_module_settings_table', 1),
(39, '2017_05_05_233111_add_status_column_invoices', 1),
(40, '2017_05_11_140502_add_currency_symbol_column_invoices', 1),
(41, '2017_05_11_170244_add_currency_id_column_organisation_settings_table', 1),
(42, '2017_05_22_172748_add_timezone_column_settings_table', 1),
(43, '2017_05_24_120216_create_smtp_settings_table', 1),
(44, '2017_05_31_112158_create_universal_search_table', 1),
(45, '2017_06_22_131112_add_locale_organisation_settings_table', 1),
(46, '2017_07_13_091922_add_calculate_task_progress_column_project_table', 1),
(47, '2017_07_20_093528_on_delete_setnull_timelog', 1),
(48, '2017_07_21_120958_create_theme_settings_table', 1),
(49, '2017_07_24_113657_add_link_color_column_theme_settings_table', 1),
(50, '2017_07_24_123050_add_login_background_organisation_settings_table', 1),
(51, '2017_07_27_101351_add_column_type_invoice_items_table', 1),
(52, '2017_07_28_102010_create_estimates_table', 1),
(53, '2017_07_28_103230_create_estimate_items_table', 1),
(54, '2017_08_04_064431_create_payments_table', 1),
(55, '2017_08_05_103940_create_payment_gateway_credential_table', 1),
(56, '2017_08_08_055908_add_enable_paypal_column_payment_gateway_table', 1),
(57, '2017_08_09_054230_create_expenses_table', 1),
(58, '2017_08_21_065430_add_exchange_rate_column_currency_table', 1),
(59, '2017_08_21_131318_create_invoice_setting_table', 1),
(60, '2017_08_22_055908_add_expense_email_setting_to_email_notification_setting_table', 1),
(61, '2017_08_28_110759_add_recurring_columns_in_invoice_table', 1),
(62, '2017_08_30_061016_add_plan_id_to_payments_table', 1),
(63, '2017_08_30_093400_create_settings_table', 1),
(64, '2017_08_30_123956_add_slack_username_column_employee_details_table', 1),
(65, '2017_08_30_133725_add_send_slack_column_email_notification_settings_table', 1),
(66, '2017_09_01_060715_add_stipe_column_to_payment_credentials_table', 1),
(67, '2017_09_01_090124_add_customer_id_column_to_payments_table', 1),
(68, '2017_09_02_084049_add_locale_column_users_table', 1),
(69, '2017_09_14_095429_create_ticket_reply_templates_table', 1),
(70, '2017_09_14_095815_create_ticket_types_table', 1),
(71, '2017_09_14_100400_create_ticket_groups_table', 1),
(72, '2017_09_14_100530_create_ticket_tag_list_table', 1),
(73, '2017_09_14_114900_create_ticket_channels_table', 1),
(74, '2017_09_14_115003_create_ticket_agent_groups_table', 1),
(75, '2017_09_14_115004_create_tickets_table', 1),
(76, '2017_09_14_115005_create_ticket_tags_table', 1),
(77, '2017_09_18_064917_add_status_column_ticket_agent_group_table', 1),
(78, '2017_09_24_101700_create_ticket_replies_table', 1),
(79, '2017_09_25_060229_drop_description_column_ticket_table', 1),
(80, '2017_09_25_072611_add_deleted_at_column_tickets', 1),
(81, '2017_09_25_072627_add_deleted_at_column_ticket_reply', 1),
(82, '2017_10_03_094922_ticket_notification_migration', 1),
(83, '2017_10_03_134003_add_latitude_longitude_column', 1),
(84, '2017_10_12_111741_create_attendance_setting_table', 1),
(85, '2017_10_13_051909_create_attendance_table', 1),
(86, '2017_10_26_051335_add_mail_from_email_column_smtp_settings_table', 1),
(87, '2017_10_26_112253_add_office_open_days_column_attendance_settings_table', 1),
(88, '2017_11_01_054603_add_columns_to_client_details', 1),
(89, '2017_11_02_045542_change_on_cascade_project_members', 1),
(90, '2017_11_07_054438_add_project_admin_column_project_table', 1),
(91, '2017_11_07_125619_remove_project_admin_role', 1),
(92, '2017_11_08_045549_make_project_id_nullable_tasks_table', 1),
(93, '2017_11_09_071318_create_taskboard_columns_table', 1),
(94, '2017_11_09_092817_add_column_tasks_table', 1),
(95, '2017_11_20_070830_create_custom_fields_table', 1),
(96, '2017_11_20_071758_create_custom_fields__data_table', 1),
(97, '2017_11_22_071535_create_events_table', 1),
(98, '2017_11_23_065323_add_cryptocurrency_columns', 1),
(99, '2017_11_24_103957_create_event_attendees_table', 1),
(100, '2017_12_07_034433_change cascade users in time log table', 1),
(101, '2017_12_12_071823_create_modules_table', 1),
(102, '2017_12_12_073501_add_module_id_column_permissions_table', 1),
(103, '2017_12_21_114839_change_upload_folder', 1),
(104, '2017_12_28_112910_create_leave_types_table', 1),
(105, '2017_12_30_184422_create_leaves_table', 1),
(106, '2018_01_02_122442_add_leaves_notification_setting', 1),
(107, '2018_01_05_062543_add_user_css_column_theme_settings', 1),
(108, '2018_01_09_180937_add_task_completed_notification_setting', 1),
(109, '2018_01_29_073527_create_message_setting_table', 1),
(110, '2018_04_12_100452_add_dropbox_link_column_project_files_table', 1),
(111, '2018_04_12_123243_create_file_storage_table', 1),
(112, '2018_04_13_072732_create_groups_table', 1),
(113, '2018_04_13_092757_create_employee_groups_table', 1),
(114, '2018_04_17_113657_set_attendance_late_column_default', 1),
(115, '2018_05_07_065407_alter_invoice_id_null_payments', 1),
(116, '2018_05_07_065557_add_currency_id_column_payments_table', 1),
(117, '2018_05_08_064539_add_note_column_invoices', 1),
(118, '2018_05_15_072536_add_project_id_column_payments', 1),
(119, '2018_05_28_094515_set_gateway_column_null_payments_table', 1),
(120, '2018_05_29_070343_change_completed_on_column_to_datetime', 1),
(121, '2018_05_29_114402_populate_file_storage_settings_table', 1),
(122, '2018_05_30_051128_add_google_url_to_project_files_table', 1),
(123, '2018_06_05_092136_create_sub_tasks_table', 1),
(124, '2018_06_06_091511_create_task_comments_table', 1),
(125, '2018_06_11_054204_create_push_subscriptions_table', 1),
(126, '2018_06_14_094059_create_taxes_table', 1),
(127, '2018_06_18_065034_add_tax_id_column_invoice_items_table', 1),
(128, '2018_06_18_071442_add_discount_column_invoice_items_table', 1),
(129, '2018_06_21_052408_change_default_taskboard_columns', 1),
(130, '2018_06_26_160023_add_leave_count_column_leave_types_table', 1),
(131, '2018_06_27_072813_add_leaves_start_from_column', 1),
(132, '2018_06_27_075233_add_joining_date_column', 1),
(133, '2018_06_27_113713_add_gender_column_users_table', 1),
(134, '2018_06_28_054604_add_client_view_task_column_project_table', 1),
(135, '2018_06_28_191256_create_language_settings_table', 1),
(136, '2018_06_29_060331_add_active_theme_column_settings', 1),
(137, '2018_06_29_081128_add_manual_timelog_column_project_timelog', 1),
(138, '2018_06_29_104709_seed_languages', 1),
(139, '2018_08_02_121259_add_minutes_column_time_log_table', 1),
(140, '2018_08_22_103829_add_leaves_module', 1),
(141, '2018_08_22_104302_add_leaves_permissions', 1),
(142, '2018_08_27_114329_add_module_list_in_module_settings', 1),
(143, '2018_08_30_065158_add_status_column_users_table', 1),
(144, '2018_08_31_095814_create_lead_table', 1),
(145, '2018_08_31_095815_create_lead_source_table', 1),
(146, '2018_08_31_095815_create_lead_status_table', 1),
(147, '2018_08_31_095816_create_lead_follow_up_table', 1),
(148, '2018_09_04_095158_alter_lead_table', 1),
(149, '2018_09_04_095816_add_lead_module', 1),
(150, '2018_09_05_102010_create_proposal_table', 1),
(151, '2018_09_05_113230_create_proposal_items_table', 1),
(152, '2018_09_07_051239_alter_lead_website_table', 1),
(153, '2018_09_15_174026_add_default_lead_settings', 1),
(154, '2018_09_17_045718_add_leads_permission', 1),
(155, '2018_09_19_091643_add_remarks_to_payments_table', 1),
(156, '2018_09_19_100708_create_products_table', 1),
(157, '2018_09_21_095816_create_offline_payment_method_table', 1),
(158, '2018_09_25_065158_alter_payment_table', 1),
(159, '2018_09_28_110029_create_log_time_for_table', 1),
(160, '2018_09_28_965158_alter_project_time_log_table', 1),
(161, '2018_10_08_091643_alter_project_table', 1),
(162, '2018_10_08_110029_create_lead_files_table', 1),
(163, '2018_10_10_110029_create_holidays_table', 1),
(164, '2018_10_10_123601_create_project_templates_table', 1),
(165, '2018_10_10_125424_create_project_template_members_table', 1),
(166, '2018_10_10_135816_add_holiday_module', 1),
(167, '2018_10_10_251800_create_project_template_tasks_table', 1),
(168, '2018_10_16_095816_add_holiday_module_detail', 1),
(169, '2018_10_17_081757_remove_config_datatable_file', 1),
(170, '2018_10_17_965158_alter_leads_address_table', 1),
(171, '2018_10_17_965168_alter_leads_phone_table', 1),
(172, '2018_10_18_091643_alter_attendance_setting_table', 1),
(173, '2018_10_19_045718_add_holidays_permission', 1),
(174, '2018_10_20_094413_add_products_module', 1),
(175, '2018_10_20_094504_add_products_permissions', 1),
(176, '2018_10_21_051239_alter_holiday_website_table', 1),
(177, '2018_10_24_071300_add_file_column_to_invoices_table', 1),
(178, '2018_10_24_965158_alter_employee_detail_table', 1),
(179, '2018_10_29_965158_alter_attendance_setting_default_table', 1),
(180, '2018_11_10_071300_alter_user_table', 1),
(181, '2018_11_10_122646_create_task_category_table', 1),
(182, '2018_11_30_965158_alter_invoice_item_table', 1),
(183, '2018_12_12_965158_alter_invoice_estimate_response_table', 1),
(184, '2018_12_14_094504_add_expenses_permissions', 1),
(185, '2018_12_14_194504_add_expenses_permissions_detail', 1),
(186, '2018_12_20_1065158_alter_company_setting_table', 1),
(187, '2018_12_20_965158_alter_estimate_quantity_table', 1),
(188, '2018_12_27_074504_check_verify_purchase_file', 1),
(189, '2018_12_28_075730_create_push_notification_settings_table', 1),
(190, '2018_12_28_082056_add_send_push_column_email_notification_table', 1),
(191, '2018_12_28_123245_add_onesignal_player_id_column_users_table', 1),
(192, '2019_01_02_1065158_alter_module_setting_table', 1),
(193, '2019_01_02_2065158_insert_module_setting_client_table', 1),
(194, '2019_01_04_110029_create_employee_docs_table', 1),
(195, '2019_01_21_1065158_alter_task_creator_table', 1),
(196, '2019_02_06_1065158_alter_attendance_check_table', 1),
(197, '2019_02_11_1065158_alter_log_time_for_table', 1),
(198, '2019_02_12_2065158_insert_module_setting_client_task_table', 1),
(199, '2019_02_13_110029_create_skills_table', 1),
(200, '2019_02_13_130029_create_employee_skills_table', 1),
(201, '2019_02_15_1065158_alter_employee_end_date_table', 1),
(202, '2019_02_15_1165158_alter_custom_status_table', 1),
(203, '2019_02_20_074848_create_jobs_table', 1),
(204, '2019_02_22_1165158_add_company_currency_api_google_api', 1),
(205, '2019_03_11_965158_alter_expenses_quantity_table', 1),
(206, '2019_04_03_965158_alter_project_deadline_table', 1),
(207, '2019_04_04_074848_alter_invoice_setting_table', 1),
(208, '2019_04_04_075848_alter_client_Details_table', 1),
(209, '2019_04_10_075848_alter_setting_task_table', 1),
(210, '2019_04_10_122921_add_weather_key_column', 1),
(211, '2019_04_12_100242_add_columns_projects_table', 1),
(212, '2019_04_15_115700_add_budget_columns_projects_table', 1),
(213, '2019_04_17_070105_create_project_milestones_table', 1),
(214, '2019_04_23_062017_add_item_summary_column_invoice_item_table', 1),
(215, '2019_04_23_083812_add_invoice_created_column_project_milestones_table', 1),
(216, '2019_04_23_101747_add_milestone_id_column_tasks_table', 1),
(217, '2019_06_04_180628_change_project_budget_field_type', 1),
(218, '2019_06_07_070913_add_tax_id_column_estimate_items_table', 1),
(219, '2019_06_07_080053_add_discount_column_estimates_table', 1),
(220, '2019_07_01_192543_change_size_price_in_double', 1),
(221, '2019_07_02_072314_add_description_column_products_table', 1),
(222, '2019_07_15_110127_add_project_id_column_in_expenses_table', 1),
(223, '2019_08_13_073129_update_settings_add_envato_key', 1),
(224, '2019_08_13_073129_update_settings_add_support_key', 1),
(225, '2019_08_16_080219_change_price_size_proposal', 1),
(226, '2019_08_17_072443_add_datepicker_format_column_in_settings', 1),
(227, '2019_08_19_085009_add_google_recaptcha_columns_in_organisation_settings_table', 1),
(228, '2019_08_19_120826_add_app_debug_column_in_organisation_settings_table', 1),
(229, '2019_08_22_055908_add_invoice_email_setting_to_email_notification_setting_table', 1),
(230, '2019_08_22_121805_add_external_link_column_project_files_table', 1),
(231, '2019_08_26_120718_add_offline_method_id_column_payments_table', 1),
(232, '2019_08_28_081847_update_smtp_setting_verified', 1),
(233, '2019_08_29_140115_make_smtp_type_nullable', 1),
(234, '2019_08_30_102114_add_reminder_fields_in_events_table', 1),
(235, '2019_09_03_103533_add_razorpay_column', 1),
(236, '2019_09_04_115714_add_recurring_task_id_column_in_tasks_table', 1),
(237, '2019_09_05_061308_create_project_settings_table', 1),
(238, '2019_09_09_045256_add_estimate_number_column_in_estimates_table', 1),
(239, '2019_09_09_081030_add_rounded_theme_column', 1),
(240, '2019_09_09_115714_add_cron_job_message_hide_table', 1),
(241, '2019_09_10_1074848_create_designation_table', 1),
(242, '2019_09_10_111909_add_columns_in_invoice_settings_table', 1),
(243, '2019_09_10_115714_add_team_field_employee_table', 1),
(244, '2019_09_10_161408_create_credit_note_table', 1),
(245, '2019_09_10_161418_create_credit_note_item_table', 1),
(246, '2019_09_10_161428_add_credit_note_column_in_invoices_table', 1),
(247, '2019_09_14_074854_add_status_column_projects_table', 1),
(248, '2019_09_16_101138_create_gdpr_settings_table', 1),
(249, '2019_09_17_091214_create_removal_requests_table', 1),
(250, '2019_09_18_191957_add_payments_module_clients', 1),
(251, '2019_09_25_095015_create_removal_requests_lead_table', 1),
(252, '2019_09_25_183130_create_dashboard_widgets_table', 1),
(253, '2019_09_27_212735_add_timelog_module_clients', 1),
(254, '2019_10_04_101818_add_paypal_mode_in_payment_gateway_credentials_table', 1),
(255, '2019_10_10_115133_alter_status_column_in_estimates_table', 1),
(256, '2019_10_14_060314_create_accept_estimates_table', 1),
(257, '2019_10_14_090840_alter_project_id_column_in_invoices_table', 1),
(258, '2019_10_14_110606_add_estimate_id_column_in_invoices_table', 1),
(259, '2019_10_15_052931_create_contract_types_table', 1),
(260, '2019_10_15_052932_create_contracts_table', 1),
(261, '2019_10_15_084310_add_contract_module_in_module_settings', 1),
(262, '2019_10_15_115655_create_contract_signs_table', 1),
(263, '2019_10_15_120940_create_invoice_credit_note_pivot_table', 1),
(264, '2019_10_17_051544_create_contract_discussions_table', 1),
(265, '2019_10_18_045028_alter_credit_note_status_in_credit_notes_table', 1),
(266, '2019_10_21_130413_create_task_files_table', 1),
(267, '2019_10_21_230413_create_ticket_files_table', 1),
(268, '2019_10_22_063419_add_dependent_task_id_in_tasks_table', 1),
(269, '2019_10_23_122412_create_contract_renews_table', 1),
(270, '2019_10_24_045038_add_column_module_type_in_universal_search_table', 1),
(271, '2019_10_24_120220_add_origin_amount_column_in_contracts_table', 1),
(272, '2019_10_30_045045_add_column_invoice_item_table', 1),
(273, '2019_10_30_122412_create_lead_agent_table', 1),
(274, '2019_10_31_045055_add_column_credit_note_item_table', 1),
(275, '2019_10_31_045065_add_column_estimate_item_table', 1),
(276, '2019_11_01_045075_add_column_products_table', 1),
(277, '2019_11_01_142619_add_column_to_in_notices_table', 1),
(278, '2019_11_05_082637_add_client_id_in_invoices_table', 1),
(279, '2019_11_07_082637_add_purchase_allow_in_product_table', 1),
(280, '2019_11_12_054145_add_system_update_column_in_organisation_settings_table', 1),
(281, '2019_11_13_054155_add_employee_id_column_in_employee_details_table', 1),
(282, '2019_11_14_054145_add_discount_column_in_proposal_table', 1),
(283, '2019_11_14_064145_add_tax_column_in_proposal_item_table', 1),
(284, '2019_11_21_064155_add_task_module_in_module_setting_table', 1),
(285, '2019_12_01_115133_alter_invoice_status_table', 1),
(286, '2019_12_09_171149_make_taxes_nullable_propsal_items_table', 1),
(287, '2019_12_18_115133_alter_proposal_items_table', 1),
(288, '2019_12_19_115850_add_timelogs_client_modules', 1),
(289, '2019_12_20_143625_add_logo_background_color_column_settings_table', 1),
(290, '2020_01_09_100241_add_client_id_credit_note_table', 1),
(291, '2020_01_09_105514_set_default_status_credit_note_open', 1),
(292, '2020_01_09_121406_add_task_reminder_columns', 1),
(293, '2020_01_22_122009_add_is_private_column_tasks_table', 1),
(294, '2020_01_23_062328_create_task_history_table', 1),
(295, '2020_01_24_134008_add_default_task_status_column_organisation_settings', 1),
(296, '2020_01_27_122145_create_pusher_settings_table', 1),
(297, '2020_02_01_101914_update_settings_review', 1),
(298, '2020_02_04_061753_add_team_id_field_in_projects_table', 1),
(299, '2020_02_04_132100_add_contracts_permission', 1),
(300, '2020_02_10_093726_create_table_menu', 1),
(301, '2020_02_14_102832_create_task_users_table', 1),
(302, '2020_02_17_143257_add_slug_email_notification_table', 1),
(303, '2020_02_21_121956_update_storage_settings_to_local', 1),
(304, '2020_02_24_060416_update_invoice_setting_logo', 1),
(305, '2020_03_11_054833_add_shipping_address_field_in_client_details_table', 1),
(306, '2020_03_11_085729_add_show_shipping_field_in_invoices_table', 1),
(307, '2020_03_17_411909_alter_invocie_number_in_invoice_table', 1),
(308, '2020_03_19_112832_create_project_template_task_users_table', 1),
(309, '2020_03_20_2065158_insert_modules_setting_client_table', 1),
(310, '2020_03_23_185549_make_message_nullable_ticket_reply_table', 1),
(311, '2020_04_06_130331_create_discussion_categories_table', 1),
(312, '2020_04_06_132027_create_discussions_table', 1),
(313, '2020_04_06_133759_create_discussion_replies_table', 1),
(314, '2020_04_08_094325_add_best_answer_id_discussions_table', 1),
(315, '2020_04_08_125803_add_discussion_reply_email_notification_settings_table', 1),
(316, '2020_04_09_102411_add_last_reply_by_discussions_table', 1),
(317, '2020_04_12_2065158_insert_contract_employee_modules_setting_table', 1),
(318, '2020_04_14_144941_add_last_login_column_users_table', 1),
(319, '2020_04_20_083724_add_hourly_rate_project_timelogs', 1),
(320, '2020_04_20_114349_add_hourly_rate_project_members', 1),
(321, '2020_04_20_173833_add_project_id_value_for_tasks_timelogs', 1),
(322, '2020_04_23_124301_add_billable_column_tasks_table', 1),
(323, '2020_04_24_115049_add_approved_invoice_id_column_project_time_logs', 1),
(324, '2020_04_24_122510_add_approval_required_column_log_time_for', 1),
(325, '2020_05_13_070505_change_earning_by_minutes_timelogs', 1),
(326, '2020_05_13_113533_add_receipt_column_payments_table', 1),
(327, '2020_05_19_114539_add_custom_field_groups', 1),
(328, '2020_05_20_131017_change_project_team_id_cascade', 1),
(329, '2020_05_21_041143_create_social_auth_settings_table', 1),
(330, '2020_05_26_084027_add_column_expenses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'clients', '', NULL, NULL),
(2, 'employees', '', NULL, NULL),
(3, 'projects', 'User can view the basic details of projects assigned to him even without any permission.', NULL, NULL),
(4, 'attendance', 'User can view his own attendance even without any permission.', NULL, NULL),
(5, 'tasks', 'User can view the tasks assigned to him even without any permission.', NULL, NULL),
(6, 'estimates', '', NULL, NULL),
(7, 'invoices', '', NULL, NULL),
(8, 'payments', '', NULL, NULL),
(9, 'timelogs', '', NULL, NULL),
(10, 'tickets', 'User can view the tickets generated by him as default even without any permission.', NULL, NULL),
(11, 'events', 'User can view the events to be attended by him as default even without any permission.', NULL, NULL),
(12, 'notice board', '', NULL, NULL),
(13, 'leaves', 'User can view the leaves applied by him as default even without any permission.', NULL, NULL),
(14, 'leads', NULL, NULL, NULL),
(15, 'holidays', NULL, '2021-02-15 21:40:00', '2021-02-15 21:40:00'),
(16, 'products', NULL, '2021-02-15 21:40:00', '2021-02-15 21:40:00'),
(17, 'expenses', 'User can view and add(self expenses) the expenses as default even without any permission.', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(18, 'contracts', 'User can view all contracts', '2021-02-15 21:40:06', '2021-02-15 21:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

DROP TABLE IF EXISTS `module_settings`;
CREATE TABLE IF NOT EXISTS `module_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('admin','employee','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_settings`
--

INSERT INTO `module_settings` (`id`, `module_name`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'clients', 'active', 'admin', NULL, NULL),
(2, 'employees', 'active', 'admin', NULL, NULL),
(3, 'attendance', 'active', 'admin', NULL, NULL),
(4, 'projects', 'active', 'admin', NULL, NULL),
(5, 'tasks', 'active', 'admin', NULL, NULL),
(6, 'estimates', 'active', 'admin', NULL, NULL),
(7, 'invoices', 'active', 'admin', NULL, NULL),
(8, 'payments', 'active', 'admin', NULL, NULL),
(9, 'expenses', 'active', 'admin', NULL, NULL),
(10, 'timelogs', 'active', 'admin', NULL, NULL),
(11, 'tickets', 'active', 'admin', NULL, NULL),
(12, 'messages', 'active', 'admin', NULL, NULL),
(13, 'events', 'active', 'admin', NULL, NULL),
(14, 'leaves', 'active', 'admin', NULL, NULL),
(15, 'notices', 'active', 'admin', NULL, NULL),
(16, 'leads', 'active', 'admin', '2021-02-15 21:39:59', '2021-02-15 21:39:59'),
(17, 'holidays', 'active', 'admin', '2021-02-15 21:40:00', '2021-02-15 21:40:00'),
(18, 'products', 'active', 'admin', '2021-02-15 21:40:00', '2021-02-15 21:40:00'),
(19, 'clients', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(21, 'employees', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(23, 'attendance', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(25, 'projects', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(27, 'tasks', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(29, 'estimates', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(31, 'invoices', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(33, 'payments', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(35, 'expenses', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(37, 'timelogs', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(39, 'tickets', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(41, 'messages', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(43, 'events', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(45, 'leaves', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(47, 'notices', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(49, 'leads', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(51, 'holidays', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(53, 'products', 'active', 'employee', '2021-02-15 21:40:01', '2021-02-15 21:40:01'),
(65, 'contracts', 'active', 'admin', '2021-02-15 21:40:06', '2021-02-15 21:40:06'),
(67, 'projects', 'active', 'client', '2021-02-15 21:40:07', '2021-02-15 21:40:07'),
(68, 'tickets', 'active', 'client', '2021-02-15 21:40:07', '2021-02-15 21:40:07'),
(69, 'invoices', 'active', 'client', '2021-02-15 21:40:07', '2021-02-15 21:40:07'),
(70, 'estimates', 'active', 'client', '2021-02-15 21:40:07', '2021-02-15 21:40:07'),
(71, 'events', 'active', 'client', '2021-02-15 21:40:07', '2021-02-15 21:40:07'),
(72, 'product', 'active', 'client', '2021-02-15 21:40:07', '2021-02-15 21:40:07'),
(73, 'messages', 'active', 'client', '2021-02-15 21:40:07', '2021-02-15 21:40:07'),
(74, 'tasks', 'active', 'client', '2021-02-15 21:40:07', '2021-02-15 21:40:07'),
(75, 'timelogs', 'active', 'client', '2021-02-15 21:40:08', '2021-02-15 21:40:08'),
(76, 'contracts', 'active', 'client', '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(77, 'notices', 'active', 'client', '2021-02-15 21:40:09', '2021-02-15 21:40:09'),
(78, 'contracts', 'active', 'employee', '2021-02-15 21:40:10', '2021-02-15 21:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE IF NOT EXISTS `notices` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `to` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'employee',
  `heading` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

DROP TABLE IF EXISTS `offline_payment_methods`;
CREATE TABLE IF NOT EXISTS `offline_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `status` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organisation_settings`
--

DROP TABLE IF EXISTS `organisation_settings`;
CREATE TABLE IF NOT EXISTS `organisation_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_background` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `date_format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'd-m-Y',
  `date_picker_format` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'h:i a',
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `latitude` decimal(10,8) NOT NULL DEFAULT '26.91243360',
  `longitude` decimal(11,8) NOT NULL DEFAULT '75.78727090',
  `leaves_start_from` enum('joining_date','year_start') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'joining_date',
  `active_theme` enum('default','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `currency_converter_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_map_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_self` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weather_key` text COLLATE utf8_unicode_ci NOT NULL,
  `purchase_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `google_recaptcha` tinyint(1) NOT NULL DEFAULT '0',
  `google_recaptcha_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_recaptcha_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_debug` tinyint(1) NOT NULL DEFAULT '0',
  `rounded_theme` tinyint(1) NOT NULL,
  `hide_cron_message` tinyint(1) NOT NULL DEFAULT '0',
  `system_update` tinyint(1) NOT NULL DEFAULT '1',
  `logo_background_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#171e28',
  `before_days` int(11) NOT NULL,
  `after_days` int(11) NOT NULL,
  `on_deadline` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `default_task_status` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `show_review_modal` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `organisation_settings_last_updated_by_foreign` (`last_updated_by`),
  KEY `organisation_settings_currency_id_foreign` (`currency_id`),
  KEY `organisation_settings_default_task_status_foreign` (`default_task_status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `organisation_settings`
--

INSERT INTO `organisation_settings` (`id`, `company_name`, `company_email`, `company_phone`, `logo`, `login_background`, `address`, `website`, `currency_id`, `timezone`, `date_format`, `date_picker_format`, `time_format`, `locale`, `latitude`, `longitude`, `leaves_start_from`, `active_theme`, `last_updated_by`, `currency_converter_key`, `google_map_key`, `task_self`, `created_at`, `updated_at`, `weather_key`, `purchase_code`, `supported_until`, `google_recaptcha`, `google_recaptcha_key`, `google_recaptcha_secret`, `app_debug`, `rounded_theme`, `hide_cron_message`, `system_update`, `logo_background_color`, `before_days`, `after_days`, `on_deadline`, `default_task_status`, `show_review_modal`) VALUES
(1, 'Management', 'company@wilcode.com', '1234567891', '86fe1cee664ea423f2475bd48921d331.png', NULL, 'Company address', 'www.domain.com', 4, 'Asia/Karachi', 'd-m-Y', 'dd-mm-yyyy', 'h:i A', 'en', '26.91243360', '75.78727090', 'joining_date', 'custom', 1, '6c12788708871d0c499d', NULL, 'yes', '2021-02-15 21:40:11', '2021-02-16 05:44:06', '', NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, 'rgb(0, 189, 255)', 0, 0, 'yes', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `gateway` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('complete','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'complete',
  `paid_on` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `offline_method_id` int(10) UNSIGNED DEFAULT NULL,
  `bill` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_transaction_id_unique` (`transaction_id`),
  UNIQUE KEY `payments_plan_id_unique` (`plan_id`),
  UNIQUE KEY `payments_event_id_unique` (`event_id`),
  KEY `payments_currency_id_foreign` (`currency_id`),
  KEY `payments_project_id_foreign` (`project_id`),
  KEY `payments_invoice_id_foreign` (`invoice_id`),
  KEY `payments_offline_method_id_foreign` (`offline_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_credentials`
--

DROP TABLE IF EXISTS `payment_gateway_credentials`;
CREATE TABLE IF NOT EXISTS `payment_gateway_credentials` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `paypal_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `stripe_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_webhook_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `razorpay_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `razorpay_status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `paypal_mode` enum('sandbox','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sandbox',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_gateway_credentials`
--

INSERT INTO `payment_gateway_credentials` (`id`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `stripe_client_id`, `stripe_secret`, `stripe_webhook_secret`, `stripe_status`, `created_at`, `updated_at`, `razorpay_key`, `razorpay_secret`, `razorpay_status`, `paypal_mode`) VALUES
(1, NULL, NULL, 'active', NULL, NULL, NULL, 'active', '2021-02-15 21:39:53', '2021-02-15 21:39:53', NULL, NULL, 'inactive', 'sandbox');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`),
  KEY `permissions_module_id_foreign` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 'add_clients', 'Add Clients', NULL, 1, NULL, NULL),
(2, 'view_clients', 'View Clients', NULL, 1, NULL, NULL),
(3, 'edit_clients', 'Edit Clients', NULL, 1, NULL, NULL),
(4, 'delete_clients', 'Delete Clients', NULL, 1, NULL, NULL),
(5, 'add_employees', 'Add Employees', NULL, 2, NULL, NULL),
(6, 'view_employees', 'View Employees', NULL, 2, NULL, NULL),
(7, 'edit_employees', 'Edit Employees', NULL, 2, NULL, NULL),
(8, 'delete_employees', 'Delete Employees', NULL, 2, NULL, NULL),
(9, 'add_projects', 'Add Project', NULL, 3, NULL, NULL),
(10, 'view_projects', 'View Project', NULL, 3, NULL, NULL),
(11, 'edit_projects', 'Edit Project', NULL, 3, NULL, NULL),
(12, 'delete_projects', 'Delete Project', NULL, 3, NULL, NULL),
(13, 'add_attendance', 'Add Attendance', NULL, 4, NULL, NULL),
(14, 'view_attendance', 'View Attendance', NULL, 4, NULL, NULL),
(15, 'add_tasks', 'Add Tasks', NULL, 5, NULL, NULL),
(16, 'view_tasks', 'View Tasks', NULL, 5, NULL, NULL),
(17, 'edit_tasks', 'Edit Tasks', NULL, 5, NULL, NULL),
(18, 'delete_tasks', 'Delete Tasks', NULL, 5, NULL, NULL),
(19, 'add_estimates', 'Add Estimates', NULL, 6, NULL, NULL),
(20, 'view_estimates', 'View Estimates', NULL, 6, NULL, NULL),
(21, 'edit_estimates', 'Edit Estimates', NULL, 6, NULL, NULL),
(22, 'delete_estimates', 'Delete Estimates', NULL, 6, NULL, NULL),
(23, 'add_invoices', 'Add Invoices', NULL, 7, NULL, NULL),
(24, 'view_invoices', 'View Invoices', NULL, 7, NULL, NULL),
(25, 'edit_invoices', 'Edit Invoices', NULL, 7, NULL, NULL),
(26, 'delete_invoices', 'Delete Invoices', NULL, 7, NULL, NULL),
(27, 'add_payments', 'Add Payments', NULL, 8, NULL, NULL),
(28, 'view_payments', 'View Payments', NULL, 8, NULL, NULL),
(29, 'edit_payments', 'Edit Payments', NULL, 8, NULL, NULL),
(30, 'delete_payments', 'Delete Payments', NULL, 8, NULL, NULL),
(31, 'add_timelogs', 'Add Timelogs', NULL, 9, NULL, NULL),
(32, 'view_timelogs', 'View Timelogs', NULL, 9, NULL, NULL),
(33, 'edit_timelogs', 'Edit Timelogs', NULL, 9, NULL, NULL),
(34, 'delete_timelogs', 'Delete Timelogs', NULL, 9, NULL, NULL),
(35, 'add_tickets', 'Add Tickets', NULL, 10, NULL, NULL),
(36, 'view_tickets', 'View Tickets', NULL, 10, NULL, NULL),
(37, 'edit_tickets', 'Edit Tickets', NULL, 10, NULL, NULL),
(38, 'delete_tickets', 'Delete Tickets', NULL, 10, NULL, NULL),
(39, 'add_events', 'Add Events', NULL, 11, NULL, NULL),
(40, 'view_events', 'View Events', NULL, 11, NULL, NULL),
(41, 'edit_events', 'Edit Events', NULL, 11, NULL, NULL),
(42, 'delete_events', 'Delete Events', NULL, 11, NULL, NULL),
(43, 'add_notice', 'Add Notice', NULL, 12, NULL, NULL),
(44, 'view_notice', 'View Notice', NULL, 12, NULL, NULL),
(45, 'edit_notice', 'Edit Notice', NULL, 12, NULL, NULL),
(46, 'delete_notice', 'Delete Notice', NULL, 12, NULL, NULL),
(47, 'add_leave', 'Add Leave', NULL, 13, NULL, NULL),
(48, 'view_leave', 'View Leave', NULL, 13, NULL, NULL),
(49, 'edit_leave', 'Edit Leave', NULL, 13, NULL, NULL),
(50, 'delete_leave', 'Delete Leave', NULL, 13, NULL, NULL),
(51, 'add_lead', 'Add Lead', NULL, 14, NULL, NULL),
(52, 'view_lead', 'View Lead', NULL, 14, NULL, NULL),
(53, 'edit_lead', 'Edit Lead', NULL, 14, NULL, NULL),
(54, 'delete_lead', 'Delete Lead', NULL, 14, NULL, NULL),
(55, 'add_holiday', 'Add Holiday', NULL, 15, NULL, NULL),
(56, 'view_holiday', 'View Holiday', NULL, 15, NULL, NULL),
(57, 'edit_holiday', 'Edit Holiday', NULL, 15, NULL, NULL),
(58, 'delete_holiday', 'Delete Holiday', NULL, 15, NULL, NULL),
(59, 'add_product', 'Add Product', NULL, 16, NULL, NULL),
(60, 'view_product', 'View Product', NULL, 16, NULL, NULL),
(61, 'edit_product', 'Edit Product', NULL, 16, NULL, NULL),
(62, 'delete_product', 'Delete Product', NULL, 16, NULL, NULL),
(63, 'add_expenses', 'Add Expenses', NULL, 17, NULL, NULL),
(64, 'view_expenses', 'View Expenses', NULL, 17, NULL, NULL),
(65, 'edit_expenses', 'Edit Expenses', NULL, 17, NULL, NULL),
(66, 'delete_expenses', 'Delete Expenses', NULL, 17, NULL, NULL),
(67, 'add_contract', 'Add Contract', NULL, 18, NULL, NULL),
(68, 'view_contract', 'View Contract', NULL, 18, NULL, NULL),
(69, 'edit_contract', 'Edit Contract', NULL, 18, NULL, NULL),
(70, 'delete_contract', 'Delete Contract', NULL, 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `taxes` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `project_summary` mediumtext COLLATE utf8_unicode_ci,
  `project_admin` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `team_id` int(10) UNSIGNED DEFAULT NULL,
  `feedback` mediumtext COLLATE utf8_unicode_ci,
  `manual_timelog` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `client_view_task` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `allow_client_notification` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `completion_percent` tinyint(4) NOT NULL,
  `calculate_task_progress` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `project_budget` double(20,2) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `hours_allocated` double(8,2) DEFAULT NULL,
  `status` enum('not started','in progress','on hold','canceled','finished') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'in progress',
  PRIMARY KEY (`id`),
  KEY `projects_category_id_foreign` (`category_id`),
  KEY `projects_client_id_foreign` (`client_id`),
  KEY `projects_project_admin_foreign` (`project_admin`),
  KEY `projects_currency_id_foreign` (`currency_id`),
  KEY `projects_team_id_foreign` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_activity`
--

DROP TABLE IF EXISTS `project_activity`;
CREATE TABLE IF NOT EXISTS `project_activity` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED NOT NULL,
  `activity` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_activity_project_id_foreign` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
CREATE TABLE IF NOT EXISTS `project_category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
CREATE TABLE IF NOT EXISTS `project_files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `google_url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_link` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `project_files_user_id_foreign` (`user_id`),
  KEY `project_files_project_id_foreign` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

DROP TABLE IF EXISTS `project_members`;
CREATE TABLE IF NOT EXISTS `project_members` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hourly_rate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_members_project_id_foreign` (`project_id`),
  KEY `project_members_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_milestones`
--

DROP TABLE IF EXISTS `project_milestones`;
CREATE TABLE IF NOT EXISTS `project_milestones` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `milestone_title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `summary` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `cost` double(8,2) NOT NULL,
  `status` enum('complete','incomplete') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_created` tinyint(1) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_milestones_project_id_foreign` (`project_id`),
  KEY `project_milestones_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_settings`
--

DROP TABLE IF EXISTS `project_settings`;
CREATE TABLE IF NOT EXISTS `project_settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `send_reminder` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `remind_time` int(11) NOT NULL,
  `remind_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remind_to` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '["admins","members"]',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_settings`
--

INSERT INTO `project_settings` (`id`, `send_reminder`, `remind_time`, `remind_type`, `remind_to`, `created_at`, `updated_at`) VALUES
(1, 'no', 5, 'days', '[\"admins\",\"members\"]', '2021-02-15 21:40:04', '2021-02-15 21:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `project_templates`
--

DROP TABLE IF EXISTS `project_templates`;
CREATE TABLE IF NOT EXISTS `project_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `project_summary` mediumtext COLLATE utf8_unicode_ci,
  `notes` longtext COLLATE utf8_unicode_ci,
  `feedback` mediumtext COLLATE utf8_unicode_ci,
  `client_view_task` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `allow_client_notification` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `manual_timelog` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_templates_category_id_foreign` (`category_id`),
  KEY `project_templates_client_id_foreign` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_members`
--

DROP TABLE IF EXISTS `project_template_members`;
CREATE TABLE IF NOT EXISTS `project_template_members` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_template_members_user_id_foreign` (`user_id`),
  KEY `project_template_members_project_template_id_foreign` (`project_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_tasks`
--

DROP TABLE IF EXISTS `project_template_tasks`;
CREATE TABLE IF NOT EXISTS `project_template_tasks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `heading` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `project_template_id` int(10) UNSIGNED NOT NULL,
  `priority` enum('low','medium','high') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_template_tasks_project_template_id_foreign` (`project_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_task_users`
--

DROP TABLE IF EXISTS `project_template_task_users`;
CREATE TABLE IF NOT EXISTS `project_template_task_users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_template_task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_template_task_users_project_template_task_id_foreign` (`project_template_task_id`),
  KEY `project_template_task_users_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_time_logs`
--

DROP TABLE IF EXISTS `project_time_logs`;
CREATE TABLE IF NOT EXISTS `project_time_logs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci NOT NULL,
  `total_hours` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_minutes` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edited_by_user` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hourly_rate` int(11) NOT NULL,
  `earnings` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_time_logs_edited_by_user_foreign` (`edited_by_user`),
  KEY `project_time_logs_project_id_foreign` (`project_id`),
  KEY `project_time_logs_user_id_foreign` (`user_id`),
  KEY `project_time_logs_task_id_foreign` (`task_id`),
  KEY `project_time_logs_approved_by_foreign` (`approved_by`),
  KEY `project_time_logs_invoice_id_foreign` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

DROP TABLE IF EXISTS `proposals`;
CREATE TABLE IF NOT EXISTS `proposals` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `valid_till` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8_unicode_ci NOT NULL,
  `discount` double NOT NULL,
  `invoice_convert` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('declined','accepted','waiting') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'waiting',
  `note` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proposals_lead_id_foreign` (`lead_id`),
  KEY `proposals_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_items`
--

DROP TABLE IF EXISTS `proposal_items`;
CREATE TABLE IF NOT EXISTS `proposal_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `proposal_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `item_summary` text COLLATE utf8_unicode_ci,
  `taxes` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proposal_items_proposal_id_foreign` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent`
--

DROP TABLE IF EXISTS `purpose_consent`;
CREATE TABLE IF NOT EXISTS `purpose_consent` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent_leads`
--

DROP TABLE IF EXISTS `purpose_consent_leads`;
CREATE TABLE IF NOT EXISTS `purpose_consent_leads` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `purpose_consent_id` int(10) UNSIGNED NOT NULL,
  `status` enum('agree','disagree') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'agree',
  `ip` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `additional_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purpose_consent_leads_lead_id_foreign` (`lead_id`),
  KEY `purpose_consent_leads_purpose_consent_id_foreign` (`purpose_consent_id`),
  KEY `purpose_consent_leads_updated_by_id_foreign` (`updated_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent_users`
--

DROP TABLE IF EXISTS `purpose_consent_users`;
CREATE TABLE IF NOT EXISTS `purpose_consent_users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `purpose_consent_id` int(10) UNSIGNED NOT NULL,
  `status` enum('agree','disagree') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'agree',
  `ip` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED NOT NULL,
  `additional_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purpose_consent_users_client_id_foreign` (`client_id`),
  KEY `purpose_consent_users_purpose_consent_id_foreign` (`purpose_consent_id`),
  KEY `purpose_consent_users_updated_by_id_foreign` (`updated_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pusher_settings`
--

DROP TABLE IF EXISTS `pusher_settings`;
CREATE TABLE IF NOT EXISTS `pusher_settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pusher_app_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pusher_app_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pusher_app_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pusher_cluster` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `force_tls` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pusher_settings`
--

INSERT INTO `pusher_settings` (`id`, `pusher_app_id`, `pusher_app_key`, `pusher_app_secret`, `pusher_cluster`, `force_tls`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, 0, 0, '2021-02-15 21:40:08', '2021-02-15 21:40:08');

-- --------------------------------------------------------

--
-- Table structure for table `push_notification_settings`
--

DROP TABLE IF EXISTS `push_notification_settings`;
CREATE TABLE IF NOT EXISTS `push_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `onesignal_app_id` text COLLATE utf8_unicode_ci,
  `onesignal_rest_api_key` text COLLATE utf8_unicode_ci,
  `notification_logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `push_notification_settings`
--

INSERT INTO `push_notification_settings` (`id`, `onesignal_app_id`, `onesignal_rest_api_key`, `notification_logo`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'inactive', '2021-02-15 21:40:01', '2021-02-15 21:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

DROP TABLE IF EXISTS `push_subscriptions`;
CREATE TABLE IF NOT EXISTS `push_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `endpoint` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `public_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `push_subscriptions_endpoint_unique` (`endpoint`),
  KEY `push_subscriptions_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

DROP TABLE IF EXISTS `quotations`;
CREATE TABLE IF NOT EXISTS `quotations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `client_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `client_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

DROP TABLE IF EXISTS `quotation_items`;
CREATE TABLE IF NOT EXISTS `quotation_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotation_items_quotation_id_foreign` (`quotation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `removal_requests`
--

DROP TABLE IF EXISTS `removal_requests`;
CREATE TABLE IF NOT EXISTS `removal_requests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `removal_requests_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `removal_requests_lead`
--

DROP TABLE IF EXISTS `removal_requests_lead`;
CREATE TABLE IF NOT EXISTS `removal_requests_lead` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `removal_requests_lead_lead_id_foreign` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2021-02-15 21:40:11', '2021-02-15 21:40:11'),
(2, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2021-02-15 21:40:11', '2021-02-15 21:40:11'),
(3, 'client', 'Client', 'Client can see own tasks and projects.', '2021-02-15 21:40:11', '2021-02-15 21:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slack_settings`
--

DROP TABLE IF EXISTS `slack_settings`;
CREATE TABLE IF NOT EXISTS `slack_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slack_webhook` text COLLATE utf8_unicode_ci,
  `slack_logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slack_settings`
--

INSERT INTO `slack_settings` (`id`, `slack_webhook`, `slack_logo`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '2021-02-15 21:39:54', '2021-02-15 21:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_settings`
--

DROP TABLE IF EXISTS `smtp_settings`;
CREATE TABLE IF NOT EXISTS `smtp_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mail_driver` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'smtp',
  `mail_host` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'smtp.gmail.com',
  `mail_port` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '587',
  `mail_username` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'youremail@gmail.com',
  `mail_password` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'your password',
  `mail_from_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'your name',
  `mail_from_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'from@email.com',
  `mail_encryption` enum('tls','ssl') COLLATE utf8_unicode_ci DEFAULT 'tls',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `smtp_settings`
--

INSERT INTO `smtp_settings` (`id`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_from_name`, `mail_from_email`, `mail_encryption`, `created_at`, `updated_at`, `verified`) VALUES
(1, 'smtp', 'smtp.gmail.com', '465', 'myemail@gmail.com', 'mypassword', 'Worksuite', 'from@email.com', 'ssl', '2021-02-15 21:40:11', '2021-02-15 21:40:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

DROP TABLE IF EXISTS `socials`;
CREATE TABLE IF NOT EXISTS `socials` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `social_id` text COLLATE utf8_unicode_ci NOT NULL,
  `social_service` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_settings`
--

DROP TABLE IF EXISTS `social_auth_settings`;
CREATE TABLE IF NOT EXISTS `social_auth_settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `facebook_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_secret_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_status` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `google_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_secret_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_status` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `twitter_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_secret_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_status` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `linkedin_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin_secret_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin_status` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_auth_settings`
--

INSERT INTO `social_auth_settings` (`id`, `facebook_client_id`, `facebook_secret_id`, `facebook_status`, `google_client_id`, `google_secret_id`, `google_status`, `twitter_client_id`, `twitter_secret_id`, `twitter_status`, `linkedin_client_id`, `linkedin_secret_id`, `linkedin_status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'disable', NULL, NULL, 'disable', NULL, NULL, 'disable', NULL, NULL, 'disable', '2021-02-15 21:40:10', '2021-02-15 21:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `sticky_notes`
--

DROP TABLE IF EXISTS `sticky_notes`;
CREATE TABLE IF NOT EXISTS `sticky_notes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `note_text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `colour` enum('blue','yellow','red','gray','purple','green') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'blue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sticky_notes_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_tasks`
--

DROP TABLE IF EXISTS `sub_tasks`;
CREATE TABLE IF NOT EXISTS `sub_tasks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` enum('incomplete','complete') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_tasks_task_id_foreign` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taskboard_columns`
--

DROP TABLE IF EXISTS `taskboard_columns`;
CREATE TABLE IF NOT EXISTS `taskboard_columns` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `column_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskboard_columns_column_name_unique` (`column_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taskboard_columns`
--

INSERT INTO `taskboard_columns` (`id`, `column_name`, `slug`, `label_color`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Incomplete', 'incomplete', '#d21010', 1, '2021-02-15 21:39:55', '2021-02-15 21:40:02'),
(2, 'Completed', 'completed', '#679c0d', 2, '2021-02-15 21:39:58', '2021-02-15 21:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `heading` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `due_date` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_category_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` enum('low','medium','high') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('incomplete','completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `board_column_id` int(10) UNSIGNED DEFAULT '1',
  `column_priority` int(11) NOT NULL,
  `completed_on` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `recurring_task_id` int(10) UNSIGNED DEFAULT NULL,
  `dependent_task_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `milestone_id` int(10) UNSIGNED DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '1',
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_board_column_id_foreign` (`board_column_id`),
  KEY `tasks_task_category_id_foreign` (`task_category_id`),
  KEY `tasks_created_by_foreign` (`created_by`),
  KEY `tasks_milestone_id_foreign` (`milestone_id`),
  KEY `tasks_recurring_task_id_foreign` (`recurring_task_id`),
  KEY `tasks_dependent_task_id_foreign` (`dependent_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_category`
--

DROP TABLE IF EXISTS `task_category`;
CREATE TABLE IF NOT EXISTS `task_category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

DROP TABLE IF EXISTS `task_comments`;
CREATE TABLE IF NOT EXISTS `task_comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_comments_user_id_foreign` (`user_id`),
  KEY `task_comments_task_id_foreign` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_files`
--

DROP TABLE IF EXISTS `task_files`;
CREATE TABLE IF NOT EXISTS `task_files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `google_url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_files_user_id_foreign` (`user_id`),
  KEY `task_files_task_id_foreign` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_history`
--

DROP TABLE IF EXISTS `task_history`;
CREATE TABLE IF NOT EXISTS `task_history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_id` int(10) UNSIGNED NOT NULL,
  `sub_task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `board_column_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_history_task_id_foreign` (`task_id`),
  KEY `task_history_sub_task_id_foreign` (`sub_task_id`),
  KEY `task_history_user_id_foreign` (`user_id`),
  KEY `task_history_board_column_id_foreign` (`board_column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_users`
--

DROP TABLE IF EXISTS `task_users`;
CREATE TABLE IF NOT EXISTS `task_users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_users_task_id_foreign` (`task_id`),
  KEY `task_users_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
CREATE TABLE IF NOT EXISTS `taxes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `rate_percent` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `team_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

DROP TABLE IF EXISTS `theme_settings`;
CREATE TABLE IF NOT EXISTS `theme_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `panel` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `header_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `sidebar_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `sidebar_text_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `link_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#ffffff',
  `user_css` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `panel`, `header_color`, `sidebar_color`, `sidebar_text_color`, `link_color`, `user_css`, `created_at`, `updated_at`) VALUES
(1, 'admin', '#40c6ed', '#292929', '#cbcbcb', '#ffffff', '/*Enter your custom css after this line*/', '2021-02-15 21:40:11', '2021-02-16 05:43:53'),
(2, 'project_admin', '#5475ed', '#292929', '#cbcbcb', '#ffffff', NULL, '2021-02-15 21:40:11', '2021-02-15 21:40:11'),
(3, 'employee', '#f7c80c', '#292929', '#cbcbcb', '#ffffff', '/*Enter your custom css after this line*/', '2021-02-15 21:40:11', '2021-02-16 05:43:53'),
(4, 'client', '#00c292', '#292929', '#cbcbcb', '#ffffff', '/*Enter your custom css after this line*/', '2021-02-15 21:40:11', '2021-02-16 05:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('open','pending','resolved','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `priority` enum('low','medium','high','urgent') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'medium',
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_foreign` (`user_id`),
  KEY `tickets_agent_id_foreign` (`agent_id`),
  KEY `tickets_channel_id_foreign` (`channel_id`),
  KEY `tickets_type_id_foreign` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_agent_groups`
--

DROP TABLE IF EXISTS `ticket_agent_groups`;
CREATE TABLE IF NOT EXISTS `ticket_agent_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_agent_groups_agent_id_foreign` (`agent_id`),
  KEY `ticket_agent_groups_group_id_foreign` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_channels`
--

DROP TABLE IF EXISTS `ticket_channels`;
CREATE TABLE IF NOT EXISTS `ticket_channels` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_channels_channel_name_unique` (`channel_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_channels`
--

INSERT INTO `ticket_channels` (`id`, `channel_name`, `created_at`, `updated_at`) VALUES
(1, 'Email', '2021-02-15 21:39:54', '2021-02-15 21:39:54'),
(2, 'Phone', '2021-02-15 21:39:54', '2021-02-15 21:39:54'),
(3, 'Twitter', '2021-02-15 21:39:54', '2021-02-15 21:39:54'),
(4, 'Facebook', '2021-02-15 21:39:54', '2021-02-15 21:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_files`
--

DROP TABLE IF EXISTS `ticket_files`;
CREATE TABLE IF NOT EXISTS `ticket_files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ticket_reply_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `google_url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_files_user_id_foreign` (`user_id`),
  KEY `ticket_files_ticket_reply_id_foreign` (`ticket_reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_groups`
--

DROP TABLE IF EXISTS `ticket_groups`;
CREATE TABLE IF NOT EXISTS `ticket_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_groups`
--

INSERT INTO `ticket_groups` (`id`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'Sales', '2021-02-15 21:39:54', '2021-02-15 21:39:54'),
(2, 'Code', '2021-02-15 21:39:54', '2021-02-15 21:39:54'),
(3, 'Management', '2021-02-15 21:39:54', '2021-02-15 21:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
CREATE TABLE IF NOT EXISTS `ticket_replies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_replies_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply_templates`
--

DROP TABLE IF EXISTS `ticket_reply_templates`;
CREATE TABLE IF NOT EXISTS `ticket_reply_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reply_heading` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `reply_text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tags`
--

DROP TABLE IF EXISTS `ticket_tags`;
CREATE TABLE IF NOT EXISTS `ticket_tags` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_tags_tag_id_foreign` (`tag_id`),
  KEY `ticket_tags_ticket_id_foreign` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tag_list`
--

DROP TABLE IF EXISTS `ticket_tag_list`;
CREATE TABLE IF NOT EXISTS `ticket_tag_list` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

DROP TABLE IF EXISTS `ticket_types`;
CREATE TABLE IF NOT EXISTS `ticket_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_types_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Question', '2021-02-15 21:39:54', '2021-02-15 21:39:54'),
(2, 'Problem', '2021-02-15 21:39:54', '2021-02-15 21:39:54'),
(3, 'Incident', '2021-02-15 21:39:54', '2021-02-15 21:39:54'),
(4, 'Feature Request', '2021-02-15 21:39:54', '2021-02-15 21:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `universal_search`
--

DROP TABLE IF EXISTS `universal_search`;
CREATE TABLE IF NOT EXISTS `universal_search` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `searchable_id` int(11) NOT NULL,
  `module_type` enum('ticket','invoice','notice','proposal','task','creditNote','client','employee','project','estimate','lead') COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `route_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `universal_search`
--

INSERT INTO `universal_search` (`id`, `searchable_id`, `module_type`, `title`, `route_name`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Ashtyn Leffler III', 'admin.employees.show', '2021-02-15 21:40:11', '2021-02-15 21:40:11'),
(2, 2, 'client', 'Client1', 'admin.clients.edit', '2021-02-15 22:57:06', '2021-02-15 22:57:06'),
(3, 2, 'client', 'client1@company.com', 'admin.clients.edit', '2021-02-15 22:57:06', '2021-02-15 22:57:06'),
(4, 2, 'client', 'Company 1', 'admin.clients.edit', '2021-02-15 22:57:06', '2021-02-15 22:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','others') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `login` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enable',
  `onesignal_player_id` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `image`, `mobile`, `gender`, `locale`, `status`, `login`, `onesignal_player_id`, `created_at`, `updated_at`, `last_login`) VALUES
(1, 'Test Admin', 'admin@wilcode.com', '$2y$10$X1v9HMwrdgkqyAVE6IYSrelifodXkUBEgd3gPvlDEb0Pnd9gj6hRa', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2021-02-15 21:40:11', '2021-02-15 22:43:16', '2021-02-15 22:43:16'),
(2, 'Client1', 'client1@company.com', '$2y$10$1p3r1./5Adqj1aNNrq7vKert2GqWDr5xyRZDuFafeiofCV5VpgxMK', NULL, NULL, '03123456789', 'male', 'en', 'active', 'enable', NULL, '2021-02-15 22:57:06', '2021-02-15 22:57:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_chat`
--

DROP TABLE IF EXISTS `users_chat`;
CREATE TABLE IF NOT EXISTS `users_chat` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `from` int(10) UNSIGNED DEFAULT NULL,
  `to` int(10) UNSIGNED DEFAULT NULL,
  `message_seen` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_chat_user_one_foreign` (`user_one`),
  KEY `users_chat_user_id_foreign` (`user_id`),
  KEY `users_chat_from_foreign` (`from`),
  KEY `users_chat_to_foreign` (`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

DROP TABLE IF EXISTS `user_activities`;
CREATE TABLE IF NOT EXISTS `user_activities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `activity` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_activities_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_activities`
--

INSERT INTO `user_activities` (`id`, `user_id`, `activity`, `created_at`, `updated_at`) VALUES
(1, 1, 'Updated profile.', '2021-02-15 22:33:55', '2021-02-15 22:33:55');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accept_estimates`
--
ALTER TABLE `accept_estimates`
  ADD CONSTRAINT `accept_estimates_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD CONSTRAINT `client_contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_details`
--
ALTER TABLE `client_details`
  ADD CONSTRAINT `client_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_contract_type_id_foreign` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_discussions`
--
ALTER TABLE `contract_discussions`
  ADD CONSTRAINT `contract_discussions_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_discussions_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_renews`
--
ALTER TABLE `contract_renews`
  ADD CONSTRAINT `contract_renews_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_renews_renewed_by_foreign` FOREIGN KEY (`renewed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_signs`
--
ALTER TABLE `contract_signs`
  ADD CONSTRAINT `contract_signs_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `conversation_user_one_foreign` FOREIGN KEY (`user_one`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_user_two_foreign` FOREIGN KEY (`user_two`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  ADD CONSTRAINT `conversation_reply_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_reply_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD CONSTRAINT `credit_notes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_note_items`
--
ALTER TABLE `credit_note_items`
  ADD CONSTRAINT `credit_note_items_credit_note_id_foreign` FOREIGN KEY (`credit_note_id`) REFERENCES `credit_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD CONSTRAINT `custom_fields_custom_field_group_id_foreign` FOREIGN KEY (`custom_field_group_id`) REFERENCES `custom_field_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD CONSTRAINT `custom_fields_data_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_best_answer_id_foreign` FOREIGN KEY (`best_answer_id`) REFERENCES `discussion_replies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_discussion_category_id_foreign` FOREIGN KEY (`discussion_category_id`) REFERENCES `discussion_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_last_reply_by_id_foreign` FOREIGN KEY (`last_reply_by_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD CONSTRAINT `discussion_replies_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD CONSTRAINT `employee_details_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_docs`
--
ALTER TABLE `employee_docs`
  ADD CONSTRAINT `employee_docs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD CONSTRAINT `employee_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_skills_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_teams`
--
ALTER TABLE `employee_teams`
  ADD CONSTRAINT `employee_teams_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `estimates`
--
ALTER TABLE `estimates`
  ADD CONSTRAINT `estimates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD CONSTRAINT `estimate_items_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_attendees`
--
ALTER TABLE `event_attendees`
  ADD CONSTRAINT `event_attendees_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_attendees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `lead_agents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_agents`
--
ALTER TABLE `lead_agents`
  ADD CONSTRAINT `lead_agents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_files`
--
ALTER TABLE `lead_files`
  ADD CONSTRAINT `lead_files_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  ADD CONSTRAINT `lead_follow_up_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organisation_settings`
--
ALTER TABLE `organisation_settings`
  ADD CONSTRAINT `organisation_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `organisation_settings_default_task_status_foreign` FOREIGN KEY (`default_task_status`) REFERENCES `taskboard_columns` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `organisation_settings_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `project_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_project_admin_foreign` FOREIGN KEY (`project_admin`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project_activity`
--
ALTER TABLE `project_activity`
  ADD CONSTRAINT `project_activity_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_files`
--
ALTER TABLE `project_files`
  ADD CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD CONSTRAINT `project_milestones_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_milestones_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_templates`
--
ALTER TABLE `project_templates`
  ADD CONSTRAINT `project_templates_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `project_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_templates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project_template_members`
--
ALTER TABLE `project_template_members`
  ADD CONSTRAINT `project_template_members_project_template_id_foreign` FOREIGN KEY (`project_template_id`) REFERENCES `project_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_template_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  ADD CONSTRAINT `project_template_tasks_project_template_id_foreign` FOREIGN KEY (`project_template_id`) REFERENCES `project_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_template_task_users`
--
ALTER TABLE `project_template_task_users`
  ADD CONSTRAINT `project_template_task_users_project_template_task_id_foreign` FOREIGN KEY (`project_template_task_id`) REFERENCES `project_template_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_template_task_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  ADD CONSTRAINT `project_time_logs_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_edited_by_user_foreign` FOREIGN KEY (`edited_by_user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposals`
--
ALTER TABLE `proposals`
  ADD CONSTRAINT `proposals_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposals_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposal_items`
--
ALTER TABLE `proposal_items`
  ADD CONSTRAINT `proposal_items_proposal_id_foreign` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purpose_consent_leads`
--
ALTER TABLE `purpose_consent_leads`
  ADD CONSTRAINT `purpose_consent_leads_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_leads_purpose_consent_id_foreign` FOREIGN KEY (`purpose_consent_id`) REFERENCES `purpose_consent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_leads_updated_by_id_foreign` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purpose_consent_users`
--
ALTER TABLE `purpose_consent_users`
  ADD CONSTRAINT `purpose_consent_users_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_users_purpose_consent_id_foreign` FOREIGN KEY (`purpose_consent_id`) REFERENCES `purpose_consent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_users_updated_by_id_foreign` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD CONSTRAINT `push_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD CONSTRAINT `quotation_items_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `removal_requests`
--
ALTER TABLE `removal_requests`
  ADD CONSTRAINT `removal_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `removal_requests_lead`
--
ALTER TABLE `removal_requests_lead`
  ADD CONSTRAINT `removal_requests_lead_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  ADD CONSTRAINT `sticky_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  ADD CONSTRAINT `sub_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_board_column_id_foreign` FOREIGN KEY (`board_column_id`) REFERENCES `taskboard_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_dependent_task_id_foreign` FOREIGN KEY (`dependent_task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_milestone_id_foreign` FOREIGN KEY (`milestone_id`) REFERENCES `project_milestones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_recurring_task_id_foreign` FOREIGN KEY (`recurring_task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_task_category_id_foreign` FOREIGN KEY (`task_category_id`) REFERENCES `task_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_files`
--
ALTER TABLE `task_files`
  ADD CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_history`
--
ALTER TABLE `task_history`
  ADD CONSTRAINT `task_history_board_column_id_foreign` FOREIGN KEY (`board_column_id`) REFERENCES `taskboard_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_sub_task_id_foreign` FOREIGN KEY (`sub_task_id`) REFERENCES `sub_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_users`
--
ALTER TABLE `task_users`
  ADD CONSTRAINT `task_users_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `ticket_channels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `ticket_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  ADD CONSTRAINT `ticket_agent_groups_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_agent_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ticket_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD CONSTRAINT `ticket_files_ticket_reply_id_foreign` FOREIGN KEY (`ticket_reply_id`) REFERENCES `ticket_replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD CONSTRAINT `ticket_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `ticket_tag_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_tags_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD CONSTRAINT `users_chat_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_user_one_foreign` FOREIGN KEY (`user_one`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD CONSTRAINT `user_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
