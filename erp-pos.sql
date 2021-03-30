-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 30, 2021 at 08:24 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp-pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `ac_chart_accounts`
--

DROP TABLE IF EXISTS `ac_chart_accounts`;
CREATE TABLE IF NOT EXISTS `ac_chart_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` date NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_chart_accounts_code_unique` (`code`),
  KEY `ac_chart_accounts_company_id_foreign` (`company_id`),
  KEY `ac_chart_accounts_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_chart_account_ledgers`
--

DROP TABLE IF EXISTS `ac_chart_account_ledgers`;
CREATE TABLE IF NOT EXISTS `ac_chart_account_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_date` date NOT NULL,
  `voucher_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `debit` double(15,2) NOT NULL DEFAULT 0.00,
  `credit` double(15,2) NOT NULL DEFAULT 0.00,
  `closing_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_chart_account_ledgers_account_code_foreign` (`account_code`),
  KEY `ac_chart_account_ledgers_voucher_code_foreign` (`voucher_code`),
  KEY `ac_chart_account_ledgers_currency_id_foreign` (`currency_id`),
  KEY `ac_chart_account_ledgers_closing_id_foreign` (`closing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_closing_accounts`
--

DROP TABLE IF EXISTS `ac_closing_accounts`;
CREATE TABLE IF NOT EXISTS `ac_closing_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `period_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_closing_accounts_from_account_id_foreign` (`from_account_id`),
  KEY `ac_closing_accounts_to_account_id_foreign` (`to_account_id`),
  KEY `ac_closing_accounts_period_account_id_foreign` (`period_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_journal_vouchers`
--

DROP TABLE IF EXISTS `ac_journal_vouchers`;
CREATE TABLE IF NOT EXISTS `ac_journal_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_date` date NOT NULL,
  `total_debit` double(15,2) NOT NULL DEFAULT 0.00,
  `total_credit` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_journal_vouchers_company_id_foreign` (`company_id`),
  KEY `ac_journal_vouchers_branch_id_foreign` (`branch_id`),
  KEY `ac_journal_vouchers_voucher_code_foreign` (`voucher_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_journal_voucher_items`
--

DROP TABLE IF EXISTS `ac_journal_voucher_items`;
CREATE TABLE IF NOT EXISTS `ac_journal_voucher_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `journal_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `debit` double(15,2) NOT NULL DEFAULT 0.00,
  `credit` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_journal_voucher_items_journal_transaction_id_foreign` (`journal_transaction_id`),
  KEY `ac_journal_voucher_items_account_code_foreign` (`account_code`),
  KEY `ac_journal_voucher_items_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_journal_voucher_transactions`
--

DROP TABLE IF EXISTS `ac_journal_voucher_transactions`;
CREATE TABLE IF NOT EXISTS `ac_journal_voucher_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `journal_voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `part_total_debit` double(15,2) NOT NULL DEFAULT 0.00,
  `part_total_credit` double(15,2) NOT NULL DEFAULT 0.00,
  `is_doe` tinyint(4) NOT NULL DEFAULT 0,
  `part_balance` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_journal_voucher_transactions_journal_voucher_id_foreign` (`journal_voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_scheduled_transactions`
--

DROP TABLE IF EXISTS `ac_scheduled_transactions`;
CREATE TABLE IF NOT EXISTS `ac_scheduled_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notification` int(11) NOT NULL DEFAULT 1,
  `amount` double(8,2) NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `credit_account` bigint(20) UNSIGNED NOT NULL,
  `debit_account` bigint(20) UNSIGNED NOT NULL,
  `auto_post` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_scheduled_transactions_currency_id_foreign` (`currency_id`),
  KEY `ac_scheduled_transactions_credit_account_foreign` (`credit_account`),
  KEY `ac_scheduled_transactions_debit_account_foreign` (`debit_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_transaction_invoices`
--

DROP TABLE IF EXISTS `ac_transaction_invoices`;
CREATE TABLE IF NOT EXISTS `ac_transaction_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_date` date NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_net` double(15,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,2) NOT NULL DEFAULT 0.00,
  `total_gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_transaction_invoices_company_id_foreign` (`company_id`),
  KEY `ac_transaction_invoices_branch_id_foreign` (`branch_id`),
  KEY `ac_transaction_invoices_account_id_foreign` (`account_id`),
  KEY `ac_transaction_invoices_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_transaction_invoice_items`
--

DROP TABLE IF EXISTS `ac_transaction_invoice_items`;
CREATE TABLE IF NOT EXISTS `ac_transaction_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `unit_price` double(15,2) NOT NULL DEFAULT 0.00,
  `discount` double(15,2) NOT NULL DEFAULT 0.00,
  `tax` double(15,2) NOT NULL DEFAULT 0.00,
  `gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_transaction_invoice_items_invoice_id_foreign` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ac_vouchers`
--

DROP TABLE IF EXISTS `ac_vouchers`;
CREATE TABLE IF NOT EXISTS `ac_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_vouchers_code_unique` (`code`),
  KEY `ac_vouchers_company_id_foreign` (`company_id`),
  KEY `ac_vouchers_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branches_email_unique` (`email`),
  UNIQUE KEY `branches_phone_unique` (`phone`),
  KEY `branches_company_id_foreign` (`company_id`),
  KEY `branches_country_id_foreign` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `company_id`, `country_id`, `address`, `postal_code`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Abou Abdo', 1, 118, 'Sin El Fil', '9001', 'abouabdo@abouabdo.com', '71400022', '2021-01-14 16:00:49', '2021-01-14 16:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `branch_structures`
--

DROP TABLE IF EXISTS `branch_structures`;
CREATE TABLE IF NOT EXISTS `branch_structures` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_structures_branch_id_foreign` (`branch_id`),
  KEY `branch_structures_department_id_foreign` (`department_id`),
  KEY `branch_structures_position_id_foreign` (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Main', 0, '2021-01-14 15:40:16', '2021-01-14 15:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_district_id_foreign` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(1, 'Al-Qalamoun', 1, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(2, 'Mina', 1, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(3, 'Tripoli', 1, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(4, 'Achache', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(5, 'Aintourine', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(6, 'Alma', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(7, 'Arabet Kozhaya', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(8, 'Arde', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(9, 'Arjess', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(10, 'Ayto', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(11, 'Basloukit', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(12, 'Bheyra', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(13, 'Bnachee', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(14, 'Bechnine', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(15, 'Daraya', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(16, 'Haret el Fouar', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(17, 'Iaal', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(18, 'Karem Saddeh', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(19, 'Kfard Lakouss', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(20, 'El Mareh', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(21, 'Kfaresghab', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(22, 'Kfarfou', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(23, 'Kfarhata', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(24, 'Besebhel', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(25, 'Kfaryachit', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(26, 'Kfarzayna', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(27, 'Korah Bach', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(28, 'Mazraat el Teffah', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(29, 'Mejdlaya', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(30, 'Haref', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(31, 'Hmays', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(32, 'Sakhra', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(33, 'Mezyara', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(34, 'Kadrieh', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(35, 'Miryata', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(36, 'Rachiine', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(37, 'Raskifa', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(38, 'Sebhel', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(39, 'Serhel', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(40, 'Aslout', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(41, 'Toula', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(42, 'Ehden', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(43, 'Zgharta', 2, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(44, 'Aaray', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(45, 'Aitouleh', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(46, 'Aramta', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(47, 'Aychieh', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(48, 'Azour', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(49, 'Benweteh', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(50, 'Bkassine', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(51, 'Bteddine el Lekech', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(52, 'Haytoura', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(53, 'Homsiyeh', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(54, 'Jarmak', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(55, 'Jernaya', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(56, 'Jezzine', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(57, 'Ain Majdaleyn', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(58, 'Karkha', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(59, 'Hidab', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(60, 'Kattine', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(61, 'Kfarfalous', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(62, 'Kfarhouna', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(63, 'Kfarjarrah', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(64, 'Lebaa', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(65, 'Louaizeh', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(66, 'Machmouche', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(67, 'Maknounieh', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(68, 'Midane', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(69, 'Mjeydel', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(70, 'Mlikh', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(71, 'Rihane', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(72, 'Chkadif', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(73, 'Rimat', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(74, 'Roum', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(75, 'Sabbah', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(76, 'Saydoun', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(77, 'Sfaray', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(78, 'Snaya', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(79, 'Sojod', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(80, 'Wadi Jezzine', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(81, 'Zhalta', 3, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(82, 'Abra ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(83, 'Adloun ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(84, 'Adousieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(85, 'Ain el Deleb ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(86, 'Ankoun ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(87, 'Bablieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(88, 'Barty ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(89, 'Bayssarieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(90, 'Bkosta ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(91, 'Bnaafoul ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(92, 'Bramieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(93, 'Dareb el Sim ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(94, 'Erkay ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(95, 'Ghazieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(96, 'Ghessanieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(97, 'Haret Saida ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(98, 'Hlalyeh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(99, 'Insariat ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(100, 'Irzay ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(101, 'Kaakaiyat el Snaoubar ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(102, 'Kawthariyet el Siyyad ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(103, 'Kfarhatta ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(104, 'Kfarmilke ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(105, 'Khartoum ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(106, 'Khrayeb ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(107, 'Knarite ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(108, 'Krayeh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(109, 'Loubieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(110, 'Maghdouche ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(111, 'Majdelyoun ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(112, 'Meemarieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(113, 'Merwanieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(114, 'Mieh Mieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(115, 'Najjarieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(116, 'Sidon ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(117, 'Saksakieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(118, 'Salhieh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(119, 'Sarafand ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(120, 'Tafahta ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(121, 'Tanbourit ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(122, 'Zeita ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(123, 'Zrariyeh ', 4, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(124, 'Aaytit ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(125, 'Abbassieh ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(126, 'Ain Baal ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(127, 'Alma el Chaab ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(128, 'Arzoun ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(129, 'Baflay ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(130, 'Barich ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(131, 'Batoulieh ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(132, 'Bayyad ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(133, 'Bazourieh ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(134, 'Bedyass ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(135, 'Borj el Chamali ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(136, 'Borj Rahal ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(137, 'Bourghlieh ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(138, 'Boustane ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(139, 'Chameh ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(140, 'Chehabie ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(141, 'Chehour ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(142, 'Chihine ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(143, 'Debaal ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(144, 'Deir Amess ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(145, 'Ras el Ain ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(146, 'Deir Kanoun ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(147, 'Deir Kanoun Naher ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(148, 'Derdghaya ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(149, 'Halloussieh ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(150, 'Hanawey ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(151, 'Henniye ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(152, 'Hmayri ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(153, 'Jebbine ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(154, 'Jwaya ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(155, 'Kana ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(156, 'Kolayleh ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(157, 'Maarake ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(158, 'Maaroub ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(159, 'Mahroune ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(160, 'Majadel ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(161, 'Majdalzoun ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(162, 'Mansouri ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(163, 'Marwahine ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(164, 'Mazraat Mechref ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(165, 'Nakoura ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(166, 'Ramadiye ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(167, 'Rechknanay ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(168, 'Selha ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(169, 'Siddikine ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(170, 'Srifa ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(171, 'Tayrdebba ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(172, 'Tayrfelsay ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(173, 'Tayrharfa ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(174, 'Toura ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(175, 'Tyre ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(176, 'Yanouh ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(177, 'Yarine ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(178, 'Zebkine ', 5, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(179, 'Aabboudiyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(180, 'Aabdeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(181, 'Aadbil ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(182, 'Aaidamoun ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(183, 'Aaiyat ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(184, 'Aakkar El Aatiqa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(185, 'Aamara ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(186, 'Aamaret El Baykat ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(187, 'Aamriyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(188, 'Aandqet ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(189, 'Aaouadeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(190, 'Aaouainat (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(191, 'Aarab Jourmnaya ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(192, 'Aarida (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(193, 'Aarqa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(194, 'Aayoun (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(195, 'Aayoun El Ghizlane ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(196, 'Ain Achma ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(197, 'Ain Al Zahab (Dinbou) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(198, 'Ain Ez Zayt ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(199, 'Ain Tinta ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(200, 'Ain Yaaqoub ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(201, 'Akroum ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(202, 'Baghdadi ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(203, 'Bani Sakher ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(204, 'Bebnine ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(205, 'Beino ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(206, 'Beit Ayoub ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(207, 'Beit El Hajj ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(208, 'Beit El Haouch ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(209, 'Beit Mellat ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(210, 'Beit Younes ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(211, 'Berbara (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(212, 'Berqayel ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(213, 'Bezbina (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(214, 'Bireh (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(215, 'Borj (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(216, 'Borj El Aarab ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(217, 'Boustane El Herch ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(218, 'Bqerzla ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(219, 'Bsatine (Fsiqine) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(220, 'Bzal ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(221, 'Chadra ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(222, 'Chane ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(223, 'Chaqdouf (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(224, 'Charbila ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(225, 'Cheikh Aayache (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(226, 'Cheikh Mohammad ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(227, 'Cheikh Taba ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(228, 'Cheikh Zennad ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(229, 'Cheikhlar ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(230, 'Daghleh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(231, 'Dahr Laissineh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(232, 'Dahr Qambar ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(233, 'Daoura (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(234, 'Daoussa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(235, 'Darine (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(236, 'Dayret En Nahr El Kabir (Khat Petrol) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(237, 'Deir Dalloum ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(238, 'Deir Jannine ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(239, 'Dibbabiyeh Ech Charqiyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(240, 'Douair Aadouiyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(241, 'Fardh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(242, 'Fnaydeq ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(243, 'Fraydis (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(244, 'Ghzayleh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(245, 'Habchit (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(246, 'Hakour  ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(247, 'Halba ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(248, 'Haouchab ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(249, 'Hayssa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(250, 'Haytla (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(251, 'Hayzouq ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(252, 'Hichi ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(253, 'Hmaireh (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(254, 'Hnaider ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(255, 'Hokr Ech Cheikh Taba ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(256, 'Hokr Ed Dahri ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(257, 'Houaich ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(258, 'Hrar ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(259, 'Ilat ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(260, 'Jdaidet Ej Joumeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(261, 'Jdaidet El Qayteaa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(262, 'Jebrayel (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(263, 'Karm Aasfour  ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(264, 'Karm Zebdine ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(265, 'Kfar Harra ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(266, 'Kfar Melki (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(267, 'Kfar Noun ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(268, 'Kfar Toun ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(269, 'Khirbet Char ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(270, 'Khirbet Daoud (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(271, 'Khreibeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(272, 'Khreibet Ej Jindi ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(273, 'Kneisseh (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(274, 'Kouachra ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(275, 'Koucha ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(276, 'Koueikhat ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(277, 'Kroum Aarab ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(278, 'Machha ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(279, 'Machta Hammoud ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(280, 'Machta Hassan ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(281, 'Majdala (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(282, 'Majdel Aakkar ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(283, 'Mar Touma ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(284, 'Massaaoudiyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(285, 'Mazraat Baldeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(286, 'Mazraat Beit Ghattas ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(287, 'Mazraat En Nahriyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(288, 'Mchaylha ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(289, 'Mechmech (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(290, 'Memneaa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(291, 'Mhammara (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(292, 'Minyara ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(293, 'Mounjez ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(294, 'Mounseh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(295, 'Mqaybleh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(296, 'Mqayteaa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(297, 'Mrah El Khaoukh (Akroum) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(298, 'Nahriyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(299, 'Nfisseh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(300, 'Noura El Faouqa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(301, 'Noura Et Tahta ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(302, 'Ouadi Ej Jamous ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(303, 'Ouadi El Haour ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(304, 'Ouadi Khaled ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(305, 'Qaabrine ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(306, 'Qabaait ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(307, 'Qachlaq ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(308, 'Qantara (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(309, 'Qarha (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(310, 'Qarqaf ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(311, 'Qbaiyat (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(312, 'Qboula ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(313, 'Qenia ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(314, 'Qleiaat (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(315, 'Qloud El Baqieh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(316, 'Qorneh (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(317, 'Qoubbet Chamra ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(318, 'Qraiyat (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(319, 'Rahbeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(320, 'Rama ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(321, 'Rihaniyeh (Aakkar) ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(322, 'Rmah ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(323, 'Rmoul ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(324, 'Saadine ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(325, 'Sahleh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(326, 'Sammaqiyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(327, 'Sammouniyeh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(328, 'Sayssouq ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(329, 'Semmaqli ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(330, 'Sfinet Ed Draib ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(331, 'Sfinet El Qayteaa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(332, 'Sindianet Zeidane ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(333, 'Souaisset Aakkar ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(334, 'Srar ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(335, 'Tacheaa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(336, 'Tall Aabbas Ech Charqi ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(337, 'Tall Aabbas El Gharbi ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(338, 'Tall Bibi ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(339, 'Tall Bireh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(340, 'Tall Hmayra ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(341, 'Tall Meaayane ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(342, 'Tallet Chattaha ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(343, 'Tikrit ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(344, 'Tleil ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(345, 'Zouarib ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(346, 'Zouq El Hassineh ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(347, 'Zouq El Hbalsa ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(348, 'Zouq El Moqachrine ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(349, 'Zouq Haddara ', 6, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(350, 'Aazoneyye ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(351, 'Aabey ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(352, 'Aghmeed ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(353, 'Ain Aanoub ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(354, 'Ainab ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(355, 'Ain Dara ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(356, 'Ain Drafil ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(357, 'Ain el Remaneh ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(358, 'Ain el Saydeh ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(359, 'Ain Trez ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(360, 'Aitat ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(361, 'Aley ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(362, 'Aramoun ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(363, 'Badghan ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(364, 'Basateen ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(365, 'Baissour ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(366, 'Bdadoun ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(367, 'Bchamoun ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(368, 'Bhamdoun ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(369, 'Bkheshtey ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(370, 'Bleibel ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(371, 'Bmahray ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(372, 'Bmakin ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(373, 'Bserrine ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(374, 'Bsous ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(375, 'Chartoun ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(376, 'Charoun ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(377, 'Chemlane ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(378, 'Choueifat City ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(379, 'Deir Koubel ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(380, 'Dfoun ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(381, 'Houmal ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(382, 'Kahale ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(383, 'Kaifun ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(384, 'Kfarmatta ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(385, 'Ktaily ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(386, 'Majd l Baana ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(387, 'Majdlaya ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(388, 'Mecherfe, Aley ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(389, 'Mrayjet ', 7, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(390, 'Qmatiye ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(391, 'Ramlieh ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(392, 'Rechmaya ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(393, 'Rimhala ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(394, 'Sarhmoul ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(395, 'Saoufar ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(396, 'Sharoun ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(397, 'Silfaya ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(398, 'Souk El Gharb ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(399, 'Shanay ', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `combos`
--

DROP TABLE IF EXISTS `combos`;
CREATE TABLE IF NOT EXISTS `combos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `combos_name_unique` (`name`),
  KEY `combos_company_id_foreign` (`company_id`),
  KEY `combos_branch_id_foreign` (`branch_id`),
  KEY `combos_category_id_foreign` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `combo_images`
--

DROP TABLE IF EXISTS `combo_images`;
CREATE TABLE IF NOT EXISTS `combo_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `combo_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `combo_images_combo_id_foreign` (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `combo_items`
--

DROP TABLE IF EXISTS `combo_items`;
CREATE TABLE IF NOT EXISTS `combo_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `combo_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `system_price` double(15,2) NOT NULL DEFAULT 0.00,
  `combo_price` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `combo_items_combo_id_foreign` (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax` double(5,2) NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_email_unique` (`email`),
  UNIQUE KEY `companies_phone_unique` (`phone`),
  KEY `companies_country_id_foreign` (`country_id`),
  KEY `companies_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `country_id`, `address`, `postal_code`, `email`, `phone`, `currency_id`, `tax`, `brand`, `tax_number`, `created_at`, `updated_at`) VALUES
(1, 'Abou Abdo', 118, 'Sin El Fil', '9001', 'abouabdo@abouabdo.com', '71400022', 1, 0.00, NULL, NULL, '2021-01-14 15:50:51', '2021-01-14 15:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `cost_centers`
--

DROP TABLE IF EXISTS `cost_centers`;
CREATE TABLE IF NOT EXISTS `cost_centers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_centers_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cost_centers`
--

INSERT INTO `cost_centers` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Kitchen', 1, '2021-01-14 16:01:18', '2021-01-14 16:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nicename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_name_unique` (`name`),
  UNIQUE KEY `countries_iso_unique` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `nicename`, `iso`, `iso3`, `numcode`, `phonecode`, `created_at`, `updated_at`) VALUES
(1, 'AFGHANISTAN', 'Afghanistan', 'AF', 'AFG', '4', '93', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(2, 'ALBANIA', 'Albania', 'AL', 'ALB', '8', '355', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(3, 'ALGERIA', 'Algeria', 'DZ', 'DZA', '12', '213', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(4, 'AMERICAN SAMOA', 'American Samoa', 'AS', 'ASM', '16', '1684', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(5, 'ANDORRA', 'Andorra', 'AD', 'AND', '20', '376', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(6, 'ANGOLA', 'Angola', 'AO', 'AGO', '24', '244', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(7, 'ANGUILLA', 'Anguilla', 'AI', 'AIA', '660', '1264', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(8, 'ANTARCTICA', 'Antarctica', 'AQ', NULL, NULL, '0', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(9, 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'AG', 'ATG', '28', '1268', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(10, 'ARGENTINA', 'Argentina', 'AR', 'ARG', '32', '54', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(11, 'ARMENIA', 'Armenia', 'AM', 'ARM', '51', '374', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(12, 'ARUBA', 'Aruba', 'AW', 'ABW', '533', '297', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(13, 'AUSTRALIA', 'Australia', 'AU', 'AUS', '36', '61', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(14, 'AUSTRIA', 'Austria', 'AT', 'AUT', '40', '43', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(15, 'AZERBAIJAN', 'Azerbaijan', 'AZ', 'AZE', '31', '994', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(16, 'BAHAMAS', 'Bahamas', 'BS', 'BHS', '44', '1242', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(17, 'BAHRAIN', 'Bahrain', 'BH', 'BHR', '48', '973', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(18, 'BANGLADESH', 'Bangladesh', 'BD', 'BGD', '50', '880', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(19, 'BARBADOS', 'Barbados', 'BB', 'BRB', '52', '1246', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(20, 'BELARUS', 'Belarus', 'BY', 'BLR', '112', '375', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(21, 'BELGIUM', 'Belgium', 'BE', 'BEL', '56', '32', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(22, 'BELIZE', 'Belize', 'BZ', 'BLZ', '84', '501', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(23, 'BENIN', 'Benin', 'BJ', 'BEN', '204', '229', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(24, 'BERMUDA', 'Bermuda', 'BM', 'BMU', '60', '1441', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(25, 'BHUTAN', 'Bhutan', 'BT', 'BTN', '64', '975', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(26, 'BOLIVIA', 'Bolivia', 'BO', 'BOL', '68', '591', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(27, 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BA', 'BIH', '70', '387', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(28, 'BOTSWANA', 'Botswana', 'BW', 'BWA', '72', '267', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(29, 'BOUVET ISLAND', 'Bouvet Island', 'BV', NULL, NULL, '0', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(30, 'BRAZIL', 'Brazil', 'BR', 'BRA', '76', '55', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(31, 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'IO', NULL, NULL, '246', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(32, 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BN', 'BRN', '96', '673', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(33, 'BULGARIA', 'Bulgaria', 'BG', 'BGR', '100', '359', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(34, 'BURKINA FASO', 'Burkina Faso', 'BF', 'BFA', '854', '226', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(35, 'BURUNDI', 'Burundi', 'BI', 'BDI', '108', '257', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(36, 'CAMBODIA', 'Cambodia', 'KH', 'KHM', '116', '855', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(37, 'CAMEROON', 'Cameroon', 'CM', 'CMR', '120', '237', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(38, 'CANADA', 'Canada', 'CA', 'CAN', '124', '1', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(39, 'CAPE VERDE', 'Cape Verde', 'CV', 'CPV', '132', '238', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(40, 'CAYMAN ISLANDS', 'Cayman Islands', 'KY', 'CYM', '136', '1345', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(41, 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CF', 'CAF', '140', '236', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(42, 'CHAD', 'Chad', 'TD', 'TCD', '148', '235', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(43, 'CHILE', 'Chile', 'CL', 'CHL', '152', '56', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(44, 'CHINA', 'China', 'CN', 'CHN', '156', '86', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(45, 'CHRISTMAS ISLAND', 'Christmas Island', 'CX', NULL, NULL, '61', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(46, 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', 'CC', NULL, NULL, '672', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(47, 'COLOMBIA', 'Colombia', 'CO', 'COL', '170', '57', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(48, 'COMOROS', 'Comoros', 'KM', 'COM', '174', '269', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(49, 'CONGO', 'Congo', 'CG', 'COG', '178', '242', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(50, 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'CD', 'COD', '180', '242', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(51, 'COOK ISLANDS', 'Cook Islands', 'CK', 'COK', '184', '682', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(52, 'COSTA RICA', 'Costa Rica', 'CR', 'CRI', '188', '506', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(53, 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CI', 'CIV', '384', '225', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(54, 'CROATIA', 'Croatia', 'HR', 'HRV', '191', '385', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(55, 'CUBA', 'Cuba', 'CU', 'CUB', '192', '53', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(56, 'CYPRUS', 'Cyprus', 'CY', 'CYP', '196', '357', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(57, 'CZECH REPUBLIC', 'Czech Republic', 'CZ', 'CZE', '203', '420', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(58, 'DENMARK', 'Denmark', 'DK', 'DNK', '208', '45', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(59, 'DJIBOUTI', 'Djibouti', 'DJ', 'DJI', '262', '253', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(60, 'DOMINICA', 'Dominica', 'DM', 'DMA', '212', '1767', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(61, 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DO', 'DOM', '214', '1809', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(62, 'ECUADOR', 'Ecuador', 'EC', 'ECU', '218', '593', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(63, 'EGYPT', 'Egypt', 'EG', 'EGY', '818', '20', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(64, 'EL SALVADOR', 'El Salvador', 'SV', 'SLV', '222', '503', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(65, 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GQ', 'GNQ', '226', '240', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(66, 'ERITREA', 'Eritrea', 'ER', 'ERI', '232', '291', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(67, 'ESTONIA', 'Estonia', 'EE', 'EST', '233', '372', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(68, 'ETHIOPIA', 'Ethiopia', 'ET', 'ETH', '231', '251', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(69, 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FK', 'FLK', '238', '500', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(70, 'FAROE ISLANDS', 'Faroe Islands', 'FO', 'FRO', '234', '298', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(71, 'FIJI', 'Fiji', 'FJ', 'FJI', '242', '679', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(72, 'FINLAND', 'Finland', 'FI', 'FIN', '246', '358', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(73, 'FRANCE', 'France', 'FR', 'FRA', '250', '33', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(74, 'FRENCH GUIANA', 'French Guiana', 'GF', 'GUF', '254', '594', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(75, 'FRENCH POLYNESIA', 'French Polynesia', 'PF', 'PYF', '258', '689', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(76, 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', 'TF', NULL, NULL, '0', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(77, 'GABON', 'Gabon', 'GA', 'GAB', '266', '241', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(78, 'GAMBIA', 'Gambia', 'GM', 'GMB', '270', '220', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(79, 'GEORGIA', 'Georgia', 'GE', 'GEO', '268', '995', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(80, 'GERMANY', 'Germany', 'DE', 'DEU', '276', '49', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(81, 'GHANA', 'Ghana', 'GH', 'GHA', '288', '233', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(82, 'GIBRALTAR', 'Gibraltar', 'GI', 'GIB', '292', '350', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(83, 'GREECE', 'Greece', 'GR', 'GRC', '300', '30', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(84, 'GREENLAND', 'Greenland', 'GL', 'GRL', '304', '299', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(85, 'GRENADA', 'Grenada', 'GD', 'GRD', '308', '1473', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(86, 'GUADELOUPE', 'Guadeloupe', 'GP', 'GLP', '312', '590', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(87, 'GUAM', 'Guam', 'GU', 'GUM', '316', '1671', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(88, 'GUATEMALA', 'Guatemala', 'GT', 'GTM', '320', '502', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(89, 'GUINEA', 'Guinea', 'GN', 'GIN', '324', '224', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(90, 'GUINEA-BISSAU', 'Guinea-Bissau', 'GW', 'GNB', '624', '245', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(91, 'GUYANA', 'Guyana', 'GY', 'GUY', '328', '592', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(92, 'HAITI', 'Haiti', 'HT', 'HTI', '332', '509', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(93, 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', 'HM', NULL, NULL, '0', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(94, 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VA', 'VAT', '336', '39', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(95, 'HONDURAS', 'Honduras', 'HN', 'HND', '340', '504', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(96, 'HONG KONG', 'Hong Kong', 'HK', 'HKG', '344', '852', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(97, 'HUNGARY', 'Hungary', 'HU', 'HUN', '348', '36', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(98, 'ICELAND', 'Iceland', 'IS', 'ISL', '352', '354', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(99, 'INDIA', 'India', 'IN', 'IND', '356', '91', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(100, 'INDONESIA', 'Indonesia', 'ID', 'IDN', '360', '62', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(101, 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IR', 'IRN', '364', '98', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(102, 'IRAQ', 'Iraq', 'IQ', 'IRQ', '368', '964', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(103, 'IRELAND', 'Ireland', 'IE', 'IRL', '372', '353', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(104, 'ISRAEL', 'Israel', 'IL', 'ISR', '376', '972', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(105, 'ITALY', 'Italy', 'IT', 'ITA', '380', '39', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(106, 'JAMAICA', 'Jamaica', 'JM', 'JAM', '388', '1876', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(107, 'JAPAN', 'Japan', 'JP', 'JPN', '392', '81', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(108, 'JORDAN', 'Jordan', 'JO', 'JOR', '400', '962', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(109, 'KAZAKHSTAN', 'Kazakhstan', 'KZ', 'KAZ', '398', '7', '2021-01-14 15:40:14', '2021-01-14 15:40:14'),
(110, 'KENYA', 'Kenya', 'KE', 'KEN', '404', '254', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(111, 'KIRIBATI', 'Kiribati', 'KI', 'KIR', '296', '686', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(112, 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', '408', '850', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(113, 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KR', 'KOR', '410', '82', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(114, 'KUWAIT', 'Kuwait', 'KW', 'KWT', '414', '965', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(115, 'KYRGYZSTAN', 'Kyrgyzstan', 'KG', 'KGZ', '417', '996', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(116, 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LA', 'LAO', '418', '856', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(117, 'LATVIA', 'Latvia', 'LV', 'LVA', '428', '371', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(118, 'LEBANON', 'Lebanon', 'LB', 'LBN', '422', '961', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(119, 'LESOTHO', 'Lesotho', 'LS', 'LSO', '426', '266', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(120, 'LIBERIA', 'Liberia', 'LR', 'LBR', '430', '231', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(121, 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LY', 'LBY', '434', '218', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(122, 'LIECHTENSTEIN', 'Liechtenstein', 'LI', 'LIE', '438', '423', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(123, 'LITHUANIA', 'Lithuania', 'LT', 'LTU', '440', '370', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(124, 'LUXEMBOURG', 'Luxembourg', 'LU', 'LUX', '442', '352', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(125, 'MACAO', 'Macao', 'MO', 'MAC', '446', '853', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(126, 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MK', 'MKD', '807', '389', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(127, 'MADAGASCAR', 'Madagascar', 'MG', 'MDG', '450', '261', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(128, 'MALAWI', 'Malawi', 'MW', 'MWI', '454', '265', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(129, 'MALAYSIA', 'Malaysia', 'MY', 'MYS', '458', '60', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(130, 'MALDIVES', 'Maldives', 'MV', 'MDV', '462', '960', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(131, 'MALI', 'Mali', 'ML', 'MLI', '466', '223', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(132, 'MALTA', 'Malta', 'MT', 'MLT', '470', '356', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(133, 'MARSHALL ISLANDS', 'Marshall Islands', 'MH', 'MHL', '584', '692', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(134, 'MARTINIQUE', 'Martinique', 'MQ', 'MTQ', '474', '596', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(135, 'MAURITANIA', 'Mauritania', 'MR', 'MRT', '478', '222', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(136, 'MAURITIUS', 'Mauritius', 'MU', 'MUS', '480', '230', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(137, 'MAYOTTE', 'Mayotte', 'YT', NULL, NULL, '269', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(138, 'MEXICO', 'Mexico', 'MX', 'MEX', '484', '52', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(139, 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FM', 'FSM', '583', '691', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(140, 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MD', 'MDA', '498', '373', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(141, 'MONACO', 'Monaco', 'MC', 'MCO', '492', '377', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(142, 'MONGOLIA', 'Mongolia', 'MN', 'MNG', '496', '976', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(143, 'MONTSERRAT', 'Montserrat', 'MS', 'MSR', '500', '1664', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(144, 'MOROCCO', 'Morocco', 'MA', 'MAR', '504', '212', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(145, 'MOZAMBIQUE', 'Mozambique', 'MZ', 'MOZ', '508', '258', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(146, 'MYANMAR', 'Myanmar', 'MM', 'MMR', '104', '95', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(147, 'NAMIBIA', 'Namibia', 'NA', 'NAM', '516', '264', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(148, 'NAURU', 'Nauru', 'NR', 'NRU', '520', '674', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(149, 'NEPAL', 'Nepal', 'NP', 'NPL', '524', '977', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(150, 'NETHERLANDS', 'Netherlands', 'NL', 'NLD', '528', '31', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(151, 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'AN', 'ANT', '530', '599', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(152, 'NEW CALEDONIA', 'New Caledonia', 'NC', 'NCL', '540', '687', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(153, 'NEW ZEALAND', 'New Zealand', 'NZ', 'NZL', '554', '64', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(154, 'NICARAGUA', 'Nicaragua', 'NI', 'NIC', '558', '505', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(155, 'NIGER', 'Niger', 'NE', 'NER', '562', '227', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(156, 'NIGERIA', 'Nigeria', 'NG', 'NGA', '566', '234', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(157, 'NIUE', 'Niue', 'NU', 'NIU', '570', '683', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(158, 'NORFOLK ISLAND', 'Norfolk Island', 'NF', 'NFK', '574', '672', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(159, 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MP', 'MNP', '580', '1670', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(160, 'NORWAY', 'Norway', 'NO', 'NOR', '578', '47', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(161, 'OMAN', 'Oman', 'OM', 'OMN', '512', '968', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(162, 'PAKISTAN', 'Pakistan', 'PK', 'PAK', '586', '92', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(163, 'PALAU', 'Palau', 'PW', 'PLW', '585', '680', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(164, 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', 'PS', NULL, NULL, '970', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(165, 'PANAMA', 'Panama', 'PA', 'PAN', '591', '507', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(166, 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PG', 'PNG', '598', '675', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(167, 'PARAGUAY', 'Paraguay', 'PY', 'PRY', '600', '595', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(168, 'PERU', 'Peru', 'PE', 'PER', '604', '51', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(169, 'PHILIPPINES', 'Philippines', 'PH', 'PHL', '608', '63', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(170, 'PITCAIRN', 'Pitcairn', 'PN', 'PCN', '612', '0', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(171, 'POLAND', 'Poland', 'PL', 'POL', '616', '48', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(172, 'PORTUGAL', 'Portugal', 'PT', 'PRT', '620', '351', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(173, 'PUERTO RICO', 'Puerto Rico', 'PR', 'PRI', '630', '1787', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(174, 'QATAR', 'Qatar', 'QA', 'QAT', '634', '974', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(175, 'REUNION', 'Reunion', 'RE', 'REU', '638', '262', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(176, 'ROMANIA', 'Romania', 'RO', 'ROM', '642', '40', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(177, 'RUSSIAN FEDERATION', 'Russian Federation', 'RU', 'RUS', '643', '70', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(178, 'RWANDA', 'Rwanda', 'RW', 'RWA', '646', '250', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(179, 'SAINT HELENA', 'Saint Helena', 'SH', 'SHN', '654', '290', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(180, 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KN', 'KNA', '659', '1869', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(181, 'SAINT LUCIA', 'Saint Lucia', 'LC', 'LCA', '662', '1758', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(182, 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'PM', 'SPM', '666', '508', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(183, 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '670', '1784', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(184, 'SAMOA', 'Samoa', 'WS', 'WSM', '882', '684', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(185, 'SAN MARINO', 'San Marino', 'SM', 'SMR', '674', '378', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(186, 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'ST', 'STP', '678', '239', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(187, 'SAUDI ARABIA', 'Saudi Arabia', 'SA', 'SAU', '682', '966', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(188, 'SENEGAL', 'Senegal', 'SN', 'SEN', '686', '221', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(189, 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', 'CS', NULL, NULL, '381', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(190, 'SEYCHELLES', 'Seychelles', 'SC', 'SYC', '690', '248', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(191, 'SIERRA LEONE', 'Sierra Leone', 'SL', 'SLE', '694', '232', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(192, 'SINGAPORE', 'Singapore', 'SG', 'SGP', '702', '65', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(193, 'SLOVAKIA', 'Slovakia', 'SK', 'SVK', '703', '421', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(194, 'SLOVENIA', 'Slovenia', 'SI', 'SVN', '705', '386', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(195, 'SOLOMON ISLANDS', 'Solomon Islands', 'SB', 'SLB', '90', '677', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(196, 'SOMALIA', 'Somalia', 'SO', 'SOM', '706', '252', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(197, 'SOUTH AFRICA', 'South Africa', 'ZA', 'ZAF', '710', '27', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(198, 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 'GS', NULL, NULL, '0', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(199, 'SPAIN', 'Spain', 'ES', 'ESP', '724', '34', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(200, 'SRI LANKA', 'Sri Lanka', 'LK', 'LKA', '144', '94', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(201, 'SUDAN', 'Sudan', 'SD', 'SDN', '736', '249', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(202, 'SURINAME', 'Suriname', 'SR', 'SUR', '740', '597', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(203, 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJ', 'SJM', '744', '47', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(204, 'SWAZILAND', 'Swaziland', 'SZ', 'SWZ', '748', '268', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(205, 'SWEDEN', 'Sweden', 'SE', 'SWE', '752', '46', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(206, 'SWITZERLAND', 'Switzerland', 'CH', 'CHE', '756', '41', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(207, 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SY', 'SYR', '760', '963', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(208, 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TW', 'TWN', '158', '886', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(209, 'TAJIKISTAN', 'Tajikistan', 'TJ', 'TJK', '762', '992', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(210, 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZ', 'TZA', '834', '255', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(211, 'THAILAND', 'Thailand', 'TH', 'THA', '764', '66', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(212, 'TIMOR-LESTE', 'Timor-Leste', 'TL', NULL, NULL, '670', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(213, 'TOGO', 'Togo', 'TG', 'TGO', '768', '228', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(214, 'TOKELAU', 'Tokelau', 'TK', 'TKL', '772', '690', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(215, 'TONGA', 'Tonga', 'TO', 'TON', '776', '676', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(216, 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TT', 'TTO', '780', '1868', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(217, 'TUNISIA', 'Tunisia', 'TN', 'TUN', '788', '216', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(218, 'TURKEY', 'Turkey', 'TR', 'TUR', '792', '90', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(219, 'TURKMENISTAN', 'Turkmenistan', 'TM', 'TKM', '795', '7370', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(220, 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TC', 'TCA', '796', '1649', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(221, 'TUVALU', 'Tuvalu', 'TV', 'TUV', '798', '688', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(222, 'UGANDA', 'Uganda', 'UG', 'UGA', '800', '256', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(223, 'UKRAINE', 'Ukraine', 'UA', 'UKR', '804', '380', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(224, 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'AE', 'ARE', '784', '971', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(225, 'UNITED KINGDOM', 'United Kingdom', 'GB', 'GBR', '826', '44', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(226, 'UNITED STATES', 'United States', 'US', 'USA', '840', '1', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(227, 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 'UM', NULL, NULL, '1', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(228, 'URUGUAY', 'Uruguay', 'UY', 'URY', '858', '598', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(229, 'UZBEKISTAN', 'Uzbekistan', 'UZ', 'UZB', '860', '998', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(230, 'VANUATU', 'Vanuatu', 'VU', 'VUT', '548', '678', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(231, 'VENEZUELA', 'Venezuela', 'VE', 'VEN', '862', '58', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(232, 'VIET NAM', 'Viet Nam', 'VN', 'VNM', '704', '84', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(233, 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VG', 'VGB', '92', '1284', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(234, 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VI', 'VIR', '850', '1340', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(235, 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WF', 'WLF', '876', '681', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(236, 'WESTERN SAHARA', 'Western Sahara', 'EH', 'ESH', '732', '212', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(237, 'YEMEN', 'Yemen', 'YE', 'YEM', '887', '967', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(238, 'ZAMBIA', 'Zambia', 'ZM', 'ZMB', '894', '260', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(239, 'ZIMBABWE', 'Zimbabwe', 'ZW', 'ZWE', '716', '263', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(240, 'SERBIA', 'Serbia', 'RS', 'SRB', '688', '381', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(241, 'ASIA PACIFIC REGION', 'Asia / Pacific Region', 'AP', '0', '0', '0', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(242, 'MONTENEGRO', 'Montenegro', 'ME', 'MNE', '499', '382', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(243, 'ALAND ISLANDS', 'Aland Islands', 'AX', 'ALA', '248', '358', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(244, 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '535', '599', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(245, 'CURACAO', 'Curacao', 'CW', 'CUW', '531', '599', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(246, 'GUERNSEY', 'Guernsey', 'GG', 'GGY', '831', '44', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(247, 'ISLE OF MAN', 'Isle of Man', 'IM', 'IMN', '833', '44', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(248, 'JERSEY', 'Jersey', 'JE', 'JEY', '832', '44', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(249, 'KOSOVO', 'Kosovo', 'XK', '---', '0', '381', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(250, 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BL', 'BLM', '652', '590', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(251, 'SAINT MARTIN', 'Saint Martin', 'MF', 'MAF', '663', '590', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(252, 'SINT MAARTEN', 'Sint Maarten', 'SX', 'SXM', '534', '1', '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(253, 'SOUTH SUDAN', 'South Sudan', 'SS', 'SSD', '728', '211', '2021-01-14 15:40:15', '2021-01-14 15:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `crm_corporates`
--

DROP TABLE IF EXISTS `crm_corporates`;
CREATE TABLE IF NOT EXISTS `crm_corporates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_corporates_country_id_foreign` (`country_id`),
  KEY `crm_corporates_district_id_foreign` (`district_id`),
  KEY `crm_corporates_city_id_foreign` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_corporate_contact_info_tables`
--

DROP TABLE IF EXISTS `crm_corporate_contact_info_tables`;
CREATE TABLE IF NOT EXISTS `crm_corporate_contact_info_tables` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `corporate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_corporate_contact_info_tables_corporate_id_foreign` (`corporate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_corporate_sister_companies`
--

DROP TABLE IF EXISTS `crm_corporate_sister_companies`;
CREATE TABLE IF NOT EXISTS `crm_corporate_sister_companies` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `corporate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_corporate_sister_companies_corporate_id_foreign` (`corporate_id`),
  KEY `crm_corporate_sister_companies_country_id_foreign` (`country_id`),
  KEY `crm_corporate_sister_companies_district_id_foreign` (`district_id`),
  KEY `crm_corporate_sister_companies_city_id_foreign` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_customers`
--

DROP TABLE IF EXISTS `crm_customers`;
CREATE TABLE IF NOT EXISTS `crm_customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social` int(11) NOT NULL DEFAULT 0 COMMENT '0:none, 1:facebook, 2:instagram',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_customers_country_id_foreign` (`country_id`),
  KEY `crm_customers_district_id_foreign` (`district_id`),
  KEY `crm_customers_city_id_foreign` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crm_customers`
--

INSERT INTO `crm_customers` (`id`, `first_name`, `last_name`, `birthday`, `phone_number`, `email`, `country_id`, `district_id`, `city_id`, `address1`, `address2`, `social`, `created_at`, `updated_at`) VALUES
(1, 'Hammad', 'Test', NULL, '03155186155', NULL, 118, 1, 1, 'Address Line 01', 'Address Line 02', 0, '2021-02-23 17:31:27', '2021-02-23 17:31:27'),
(2, 'Hotte', 'Shen', NULL, '12345678', NULL, 118, 1, 1, 'abc', 'def', 0, '2021-03-10 21:09:01', '2021-03-10 21:09:01'),
(3, 'Hotte', 'Shen', NULL, '12345678', NULL, 118, 1, 1, 'abc', 'defgh', 0, '2021-03-10 21:20:00', '2021-03-10 21:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `crm_email_templates`
--

DROP TABLE IF EXISTS `crm_email_templates`;
CREATE TABLE IF NOT EXISTS `crm_email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_settings`
--

DROP TABLE IF EXISTS `crm_settings`;
CREATE TABLE IF NOT EXISTS `crm_settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `twilio_account_sid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilio_auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilio_owner_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_driver` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_sms_templates`
--

DROP TABLE IF EXISTS `crm_sms_templates`;
CREATE TABLE IF NOT EXISTS `crm_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL DEFAULT 1.0000,
  `is_local` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `alias`, `rate`, `is_local`, `created_at`, `updated_at`) VALUES
(1, 'LBP', 'ل.ل.', 'Lebanese pound', 1.0000, 1, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(2, 'USD', '$', 'USD', 1500.0000, 0, '2021-01-14 16:01:54', '2021-01-14 16:01:54');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_country_id_foreign` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'Tripoli', 118, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(2, 'Zgharta', 118, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(3, 'Jezzine', 118, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(4, 'Sidon', 118, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(5, 'Tyre', 118, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(6, 'Akkar', 118, '2021-01-14 15:40:15', '2021-01-14 15:40:15'),
(7, 'Aley', 118, '2021-01-14 15:40:15', '2021-01-14 15:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Item name',
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Item code-- for example: 000001, 000002, ...',
  `category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Id of Category which contain this item name',
  `bar_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'barcode of  item',
  `purchase_um_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_um_size` bigint(20) UNSIGNED NOT NULL,
  `purchase_um_size_um_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_um_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_um_size` bigint(20) UNSIGNED NOT NULL,
  `product_um_size_um_id` bigint(20) UNSIGNED DEFAULT NULL,
  `recipe_um_id` bigint(20) UNSIGNED DEFAULT NULL,
  `waste_percentage` int(10) UNSIGNED NOT NULL,
  `min_quantity` double(5,2) DEFAULT NULL,
  `max_quantity` double(5,2) DEFAULT NULL,
  `is_sale` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Set as Sales item. 0 -> not sale, 1-> sale',
  `selling_price` double(15,2) NOT NULL DEFAULT 0.00,
  `selling_percentage` int(10) UNSIGNED DEFAULT NULL,
  `unit_cost` double(15,2) NOT NULL DEFAULT 0.00,
  `is_use` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `items_code_unique` (`code`),
  KEY `items_category_id_foreign` (`category_id`),
  KEY `items_purchase_um_id_foreign` (`purchase_um_id`),
  KEY `items_purchase_um_size_um_id_foreign` (`purchase_um_size_um_id`),
  KEY `items_product_um_id_foreign` (`product_um_id`),
  KEY `items_product_um_size_um_id_foreign` (`product_um_size_um_id`),
  KEY `items_recipe_um_id_foreign` (`recipe_um_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_choices`
--

DROP TABLE IF EXISTS `item_choices`;
CREATE TABLE IF NOT EXISTS `item_choices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `avg_price` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_choices_company_id_foreign` (`company_id`),
  KEY `item_choices_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_choice_items`
--

DROP TABLE IF EXISTS `item_choice_items`;
CREATE TABLE IF NOT EXISTS `item_choice_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_choice_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_choice_items_item_choice_id_foreign` (`item_choice_id`),
  KEY `item_choice_items_item_id_foreign` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_images`
--

DROP TABLE IF EXISTS `item_images`;
CREATE TABLE IF NOT EXISTS `item_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_images_item_id_foreign` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_images`
--

INSERT INTO `item_images` (`id`, `item_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '/uploads/pos/item/7ce40450a996a1afe0b41cd144e54a8273170015.jpg', '2021-01-14 16:04:36', '2021-01-14 16:04:36'),
(2, 2, '/uploads/pos/item/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg', '2021-01-14 16:05:17', '2021-01-14 16:05:17'),
(3, 3, '/uploads/pos/item/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg', '2021-03-05 18:23:59', '2021-03-05 18:23:59'),
(4, 4, '/uploads/pos/item/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png', '2021-03-05 18:24:29', '2021-03-05 18:24:29'),
(5, 5, '/uploads/pos/item/eb391180596fc6185fc248f9ee6bfc074dbcc82c.png', '2021-03-26 21:38:21', '2021-03-26 21:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `item_modifiers`
--

DROP TABLE IF EXISTS `item_modifiers`;
CREATE TABLE IF NOT EXISTS `item_modifiers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `modifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `recipe_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_modifiers_item_id_foreign` (`item_id`),
  KEY `item_modifiers_recipe_id_foreign` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_modifiers`
--

INSERT INTO `item_modifiers` (`id`, `item_id`, `modifier`, `price`, `recipe_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'No Ketchup', 0.00, NULL, '2021-01-14 16:04:36', '2021-01-14 16:04:36'),
(2, 1, 'Extra Ketchup', 0.00, NULL, '2021-01-14 16:04:36', '2021-01-14 16:04:36'),
(3, 1, 'Add Cheese', 0.00, NULL, '2021-01-14 16:04:36', '2021-01-14 16:04:36'),
(4, 1, 'No Cheese', 0.00, NULL, '2021-01-14 16:04:36', '2021-01-14 16:04:36'),
(5, 2, 'BBQ', 0.00, NULL, '2021-01-14 16:05:17', '2021-01-14 16:05:17'),
(6, 2, 'Buffalo', 0.00, NULL, '2021-01-14 16:05:17', '2021-01-14 16:05:17'),
(7, 2, 'Spicy BBQ', 0.00, NULL, '2021-01-14 16:05:17', '2021-01-14 16:05:17'),
(8, 2, 'Honey Mustard', 0.00, NULL, '2021-01-14 16:05:17', '2021-01-14 16:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `item_printers`
--

DROP TABLE IF EXISTS `item_printers`;
CREATE TABLE IF NOT EXISTS `item_printers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `printer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_printers_item_id_foreign` (`item_id`),
  KEY `item_printers_printer_id_foreign` (`printer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_suppliers`
--

DROP TABLE IF EXISTS `item_suppliers`;
CREATE TABLE IF NOT EXISTS `item_suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_suppliers_item_id_foreign` (`item_id`),
  KEY `item_suppliers_supplier_id_foreign` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_03_18_145042_create_currencies_table', 1),
(4, '2020_03_18_151555_create_countries_table', 1),
(5, '2020_03_18_155607_create_companies_table', 1),
(6, '2020_03_19_181113_add_position_email_phone_to_users_table', 1),
(7, '2020_03_19_185057_create_branches_table', 1),
(8, '2020_03_20_171651_create_cost_centers_table', 1),
(9, '2020_03_20_191333_create_units_table', 1),
(10, '2020_03_20_193153_create_suppliers_table', 1),
(11, '2020_03_21_223234_create_categories_table', 1),
(12, '2020_03_22_203215_create_items_table', 1),
(13, '2020_03_22_204435_create_production_recipes_table', 1),
(14, '2020_03_22_214256_create_production_recipe_items_table', 1),
(15, '2020_03_23_221655_create_recipes_table', 1),
(16, '2020_03_23_222753_create_recipe_items_table', 1),
(17, '2020_03_24_171308_create_purchase_requests_table', 1),
(18, '2020_03_24_184158_create_purchase_request_items_table', 1),
(19, '2020_03_25_170651_create_unit_factors_table', 1),
(20, '2020_03_25_213817_create_departments_table', 1),
(21, '2020_03_25_214018_create_positions_table', 1),
(22, '2020_03_26_134430_create_purchase_orders_table', 1),
(23, '2020_03_26_134513_create_purchase_order_items_table', 1),
(24, '2020_03_27_172306_create_branch_structures_table', 1),
(25, '2020_03_27_230642_create_user_structures_table', 1),
(26, '2020_03_28_103255_create_purchase_invoices_table', 1),
(27, '2020_03_28_182645_create_purchase_invoice_items_table', 1),
(28, '2020_03_30_160800_create_stocks_table', 1),
(29, '2020_03_31_183801_add_uom_id_to_production_recipe_items_table', 1),
(30, '2020_03_31_185237_create_requisitions_table', 1),
(31, '2020_03_31_185245_create_requisition_items_table', 1),
(32, '2020_04_01_075529_create_transfers_table', 1),
(33, '2020_04_01_075541_create_transfer_items_table', 1),
(34, '2020_04_02_004617_create_productions_table', 1),
(35, '2020_04_02_114012_create_pos_categories_table', 1),
(36, '2020_04_02_143339_create_pos_items_table', 1),
(37, '2020_04_02_153505_create_wastages_table', 1),
(38, '2020_04_02_180654_create_printers_table', 1),
(39, '2020_04_03_172122_add_max_min_quantity_to_items_table', 1),
(40, '2020_04_03_191120_create_item_suppliers_table', 1),
(41, '2020_04_03_213034_create_item_printers_table', 1),
(42, '2020_04_03_213050_create_item_images_table', 1),
(43, '2020_04_03_213106_create_item_modifiers_table', 1),
(44, '2020_04_03_220503_add_company_branch_to_pos_categories_table', 1),
(45, '2020_04_03_220537_add_company_branch_to_printers_table', 1),
(46, '2020_04_03_220600_add_company_branch_to_pos_items_table', 1),
(47, '2020_04_03_222239_add_foreign_key_to_pos_categories_table', 1),
(48, '2020_04_03_222835_add_foreign_key_to_printers_table', 1),
(49, '2020_04_03_223040_add_foreign_key_to_pos_items_table', 1),
(50, '2020_04_06_205519_create_wastage_items_table', 1),
(51, '2020_04_07_171020_create_sales_table', 1),
(52, '2020_04_07_171822_create_sale_items_table', 1),
(53, '2020_04_08_190819_create_stock_histories_table', 1),
(54, '2020_04_09_064333_add_cost_center_id_to_stock_histories_table', 1),
(55, '2020_04_09_160134_create_periods_table', 1),
(56, '2020_04_09_161233_add_period_id_to_stock_histories_table', 1),
(57, '2020_04_16_082640_add_pincode_to_users_table', 1),
(58, '2020_04_17_000053_create_promos_table', 1),
(59, '2020_04_17_000822_create_promo_items_table', 1),
(60, '2020_04_17_075101_create_combos_table', 1),
(61, '2020_04_17_124722_create_combo_items_table', 1),
(62, '2020_04_17_180921_create_item_choices_table', 1),
(63, '2020_04_17_181230_create_item_choice_items_table', 1),
(64, '2020_04_21_075125_create_combo_images_table', 1),
(65, '2020_04_21_083310_add_combo_type_to_combos_table', 1),
(66, '2020_04_21_085351_add_avg_price_to_item_choices_table', 1),
(67, '2020_04_23_064148_create_reservations_table', 1),
(68, '2020_04_26_094207_create_chart_accounts_table', 1),
(69, '2020_04_26_123818_create_vouchers_table', 1),
(70, '2020_04_28_060441_create_journal_vouchers_table', 1),
(71, '2020_05_02_055545_create_transaction_invoices_table', 1),
(72, '2020_05_02_055613_create_transaction_invoice_items_table', 1),
(73, '2020_05_11_162819_create_orders_table', 1),
(74, '2020_05_12_171042_create_chart_account_ledgers_table', 1),
(75, '2020_05_13_072801_create_pos_floorplans_table', 1),
(76, '2020_05_14_152549_add_plan_to_pos_floorplans', 1),
(77, '2020_05_16_081644_create_closing_accounts_table', 1),
(78, '2020_05_18_180504_create_districts_table', 1),
(79, '2020_05_18_180518_create_cities_table', 1),
(80, '2020_05_19_175823_create_crm_customers_table', 1),
(81, '2020_05_19_213625_add_address_to_crm_customers_table', 1),
(82, '2020_05_20_080430_create_crm_corporates_table', 1),
(83, '2020_05_20_142532_create_crm_corporate_sister_companies_table', 1),
(84, '2020_05_22_110621_add_parent_to_chart_account', 1),
(85, '2020_05_22_235152_add_closing_to_chart_account_ledgers', 1),
(86, '2020_05_24_210552_create_crm_settings_table', 1),
(87, '2020_05_25_204357_create_crm_email_templates_table', 1),
(88, '2020_05_25_211454_create_crm_sms_templates_table', 1),
(89, '2020_06_09_053552_create_journal_voucher_transactions_table', 1),
(90, '2020_06_09_060231_create_journal_voucher_items_table', 1),
(91, '2020_06_27_182044_add_display_order_to_pos_categories_table', 1),
(92, '2020_06_27_182254_add_display_order_to_pos_items_table', 1),
(93, '2020_07_04_231601_create_crm_corporate_contact_info_tables_table', 1),
(94, '2020_07_19_181006_create_pos_setups_table', 1),
(95, '2020_08_18_183047_add_cost_center_to_pos_items_table', 1),
(96, '2020_08_18_183310_add_foreign_key_cost_center_to_pos_items_table', 1),
(97, '2020_08_23_170914_create_pos_users_table', 1),
(98, '2020_09_01_175557_create_ac_scheduled_transactions_table', 1),
(99, '2020_09_02_071057_create_permission_tables', 1),
(100, '2020_12_26_205638_add_print_type_to_printers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\PosUser', 1),
(1, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordertype` int(11) NOT NULL COMMENT '1: takeaway, 2: delivery, 3: table',
  `ordercontent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerid` bigint(20) UNSIGNED DEFAULT NULL,
  `totalprice` double(15,2) NOT NULL DEFAULT 0.00,
  `subtotalprice` double(15,2) NOT NULL DEFAULT 0.00,
  `tax` double(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: new, 1: pending, 2: paid',
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderid`, `ordertype`, `ordercontent`, `discount`, `customerid`, `totalprice`, `subtotalprice`, `tax`, `status`, `reason`, `ended_at`, `created_at`, `updated_at`) VALUES
(1, '#1', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 15000.00, 15000.00, 0.00, 2, NULL, '2021-03-17 00:00:00', '2021-03-16 08:45:31', '2021-03-17 11:46:53'),
(2, '#2', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 15000.00, 15000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-16 09:03:53', '2021-03-17 11:46:53'),
(3, '#3', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 25000.00, 25000.00, 0.00, 2, NULL, '2021-03-17 00:00:00', '2021-03-16 09:10:40', '2021-03-17 11:46:53'),
(4, '#4', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 15000.00, 15000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 08:25:46', '2021-03-17 11:46:53'),
(5, '#5', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 43000.00, 43000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 08:58:11', '2021-03-17 11:46:53'),
(6, '#6', 1, '{\"items\":[{\"appliedModifiers\":[{\"qty\":32,\"modifiers\":[{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}]}],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 23000.00, 23000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 09:03:45', '2021-03-17 11:46:53'),
(7, '#7', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 15000.00, 15000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 09:12:50', '2021-03-17 11:46:53'),
(8, '#8', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 10000.00, 10000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 10:16:41', '2021-03-17 11:46:53'),
(9, '#9', 1, '{\"items\":[{\"appliedModifiers\":[{\"qty\":3,\"modifiers\":[{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}]}],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 15000.00, 15000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 10:21:40', '2021-03-17 11:46:53'),
(10, '#10', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 15000.00, 15000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 10:30:27', '2021-03-17 11:46:53'),
(11, '#11', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 33000.00, 33000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 10:31:14', '2021-03-17 11:46:53'),
(12, '#12', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 33000.00, 33000.00, 0.00, 1, NULL, '2021-03-17 00:00:00', '2021-03-17 10:43:02', '2021-03-17 11:46:53'),
(13, '#13', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 27000.00, 27000.00, 0.00, 1, NULL, '2021-03-23 00:00:00', '2021-03-17 11:48:01', '2021-03-23 15:02:02'),
(14, '#14', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 12000.00, 12000.00, 0.00, 1, NULL, '2021-03-23 00:00:00', '2021-03-17 11:48:06', '2021-03-23 15:02:02'),
(15, '#15', 2, '{\"items\":[{\"appliedModifiers\":[{\"qty\":2,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}]}],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 12000.00, 12000.00, 0.00, 2, NULL, '2021-03-23 00:00:00', '2021-03-17 11:48:25', '2021-03-23 15:02:02'),
(16, '#16', 2, '{\"items\":[{\"id\":2,\"company_id\":1,\"branch_id\":1,\"name\":\"Chicken Wings\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":15000,\"is_publish\":1,\"display_order\":2,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"qty\":2,\"promos\":[],\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"appliedModifiers\":[{\"qty\":2,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}]}],\"selectedPromos\":[],\"hasModifiers\":true,\"hasPromos\":false,\"image\":{\"id\":2,\"item_id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},\"kitchennote\":null},{\"id\":3,\"company_id\":1,\"branch_id\":1,\"name\":\"Tomato Sandwitch\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":8000,\"is_publish\":1,\"display_order\":3,\"created_at\":\"2021-03-05 18:23:59\",\"updated_at\":\"2021-03-05 18:23:59\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"qty\":1,\"promos\":[],\"modifiers\":[],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":false,\"hasPromos\":false,\"image\":{\"id\":3,\"item_id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"created_at\":\"2021-03-05 18:23:59\",\"updated_at\":\"2021-03-05 18:23:59\"}}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 38000.00, 38000.00, 0.00, 2, NULL, '2021-03-23 00:00:00', '2021-03-17 14:28:14', '2021-03-23 15:02:02'),
(17, '#17', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 30000.00, 30000.00, 0.00, 2, NULL, '2021-03-23 00:00:00', '2021-03-17 15:23:05', '2021-03-23 15:02:02'),
(18, '#18', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":4,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 48000.00, 48000.00, 0.00, 1, NULL, '2021-03-23 00:00:00', '2021-03-17 15:27:59', '2021-03-23 15:02:02'),
(19, '#19', 1, '{\"items\":[{\"appliedModifiers\":[{\"qty\":3,\"modifiers\":[{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}]}],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":\"This is a sample note\",\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":50000,\"promos\":[],\"qty\":4,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":10}', 1, 199800.00, 222000.00, 0.00, 1, NULL, '2021-03-23 00:00:00', '2021-03-17 23:10:30', '2021-03-23 15:02:02'),
(20, '#20', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 18000.00, 18000.00, 0.00, 2, NULL, '2021-03-23 00:00:00', '2021-03-17 23:10:43', '2021-03-23 15:02:02'),
(21, '#21', 2, '{\"items\":[{\"appliedModifiers\":[{\"qty\":5,\"modifiers\":[{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}]}],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":\"Very important note ...\",\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":3,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 2, 36000.00, 36000.00, 0.00, 2, NULL, '2021-03-23 00:00:00', '2021-03-17 23:11:12', '2021-03-23 15:02:02'),
(22, '#22', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 25000.00, 25000.00, 0.00, 1, NULL, '2021-03-26 00:00:00', '2021-03-24 19:20:28', '2021-03-26 14:28:12'),
(23, '#23', 2, '{\"items\":[{\"appliedModifiers\":[{\"qty\":2,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}]}],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 23000.00, 23000.00, 0.00, 1, NULL, '2021-03-26 00:00:00', '2021-03-24 19:21:11', '2021-03-26 14:28:12'),
(24, '#24', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 10000.00, 10000.00, 0.00, 2, NULL, '2021-03-26 00:00:00', '2021-03-24 19:21:41', '2021-03-26 14:28:12'),
(25, '#25', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 25000.00, 25000.00, 0.00, 3, 'canceld for test', '2021-03-26 00:00:00', '2021-03-24 20:14:04', '2021-03-26 14:28:12'),
(26, '#25', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, -25000.00, -25000.00, 0.00, 3, 'canceld for test', '2021-03-26 00:00:00', '2021-03-24 20:15:51', '2021-03-26 14:28:12'),
(27, '#27', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 25000.00, 25000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 15:11:12', '2021-03-28 23:03:56');
INSERT INTO `orders` (`id`, `orderid`, `ordertype`, `ordercontent`, `discount`, `customerid`, `totalprice`, `subtotalprice`, `tax`, `status`, `reason`, `ended_at`, `created_at`, `updated_at`) VALUES
(28, '#28', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":2,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 24000.00, 24000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 15:11:18', '2021-03-28 23:03:56'),
(29, '#29', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:24:29\",\"display_order\":4,\"hasModifiers\":false,\"hasPromos\":false,\"id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Burger\",\"price\":10000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:24:29\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 10000.00, 10000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 15:55:32', '2021-03-28 23:03:56'),
(30, '#30', 2, '{\"items\":[{\"id\":4,\"company_id\":1,\"branch_id\":1,\"name\":\"Chicken Burger\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":10000,\"is_publish\":1,\"display_order\":4,\"created_at\":\"2021-03-05 18:24:29\",\"updated_at\":\"2021-03-05 18:24:29\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"qty\":1,\"promos\":[],\"modifiers\":[],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":false,\"hasPromos\":false,\"image\":{\"id\":4,\"item_id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"created_at\":\"2021-03-05 18:24:29\",\"updated_at\":\"2021-03-05 18:24:29\"}}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 10000.00, 10000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 16:19:51', '2021-03-28 23:03:56'),
(31, '#31', 1, '{\"items\":[{\"id\":4,\"company_id\":1,\"branch_id\":1,\"name\":\"Chicken Burger\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":10000,\"is_publish\":1,\"display_order\":4,\"created_at\":\"2021-03-05 18:24:29\",\"updated_at\":\"2021-03-05 18:24:29\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"qty\":1,\"promos\":[],\"modifiers\":[],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":false,\"hasPromos\":false,\"image\":{\"id\":4,\"item_id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"created_at\":\"2021-03-05 18:24:29\",\"updated_at\":\"2021-03-05 18:24:29\"}}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 10000.00, 10000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 16:20:41', '2021-03-28 23:03:56'),
(32, '#32', 1, '{\"items\":[{\"id\":2,\"company_id\":1,\"branch_id\":1,\"name\":\"Chicken Wings\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":15000,\"is_publish\":1,\"display_order\":2,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"qty\":1,\"promos\":[],\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":true,\"hasPromos\":false,\"image\":{\"id\":2,\"item_id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}}],\"combos\":[]}', '{\"amount\":0,\"percentage\":11}', 0, 13350.00, 15000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 18:25:08', '2021-03-28 23:03:56'),
(33, '#33', 1, '{\"items\":[{\"id\":2,\"company_id\":1,\"branch_id\":1,\"name\":\"Chicken Wings\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":15000,\"is_publish\":1,\"display_order\":2,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"qty\":1,\"promos\":[],\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"recipe_id\":null,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":true,\"hasPromos\":false,\"image\":{\"id\":2,\"item_id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}},{\"id\":3,\"company_id\":1,\"branch_id\":1,\"name\":\"Tomato Sandwitch\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":8000,\"is_publish\":1,\"display_order\":3,\"created_at\":\"2021-03-05 18:23:59\",\"updated_at\":\"2021-03-05 18:23:59\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"qty\":1,\"promos\":[],\"modifiers\":[],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":false,\"hasPromos\":false,\"image\":{\"id\":3,\"item_id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"created_at\":\"2021-03-05 18:23:59\",\"updated_at\":\"2021-03-05 18:23:59\"}},{\"id\":4,\"company_id\":1,\"branch_id\":1,\"name\":\"Chicken Burger\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":10000,\"is_publish\":1,\"display_order\":4,\"created_at\":\"2021-03-05 18:24:29\",\"updated_at\":\"2021-03-05 18:24:29\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"qty\":1,\"promos\":[],\"modifiers\":[],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":false,\"hasPromos\":false,\"image\":{\"id\":4,\"item_id\":4,\"image\":\"\\/uploads\\/pos\\/item\\/98edfa68f9afe7fa1880ec81ad7d40c5dda053f5.png\",\"created_at\":\"2021-03-05 18:24:29\",\"updated_at\":\"2021-03-05 18:24:29\"}}],\"combos\":[]}', '{\"amount\":2000,\"percentage\":0}', 0, 31000.00, 33000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 18:25:24', '2021-03-28 23:03:56'),
(34, '#34', 1, '{\"items\":[{\"id\":3,\"company_id\":1,\"branch_id\":1,\"name\":\"Tomato Sandwitch\",\"cost_center_id\":1,\"category_id\":2,\"recipe_id\":null,\"price\":8000,\"is_publish\":1,\"display_order\":3,\"created_at\":\"2021-03-05 18:23:59\",\"updated_at\":\"2021-03-05 18:23:59\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"qty\":1,\"promos\":[],\"modifiers\":[],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":false,\"hasPromos\":false,\"image\":{\"id\":3,\"item_id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"created_at\":\"2021-03-05 18:23:59\",\"updated_at\":\"2021-03-05 18:23:59\"}}],\"combos\":[]}', '{\"amount\":1000,\"percentage\":0}', 0, 7000.00, 8000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 18:32:11', '2021-03-28 23:03:56'),
(35, '#35', 1, '{\"items\":[{\"id\":5,\"company_id\":1,\"branch_id\":1,\"name\":\"Chicken Sandwitch\",\"cost_center_id\":1,\"category_id\":6,\"recipe_id\":null,\"price\":20000,\"is_publish\":1,\"display_order\":5,\"created_at\":\"2021-03-26 21:38:21\",\"updated_at\":\"2021-03-26 21:38:21\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/eb391180596fc6185fc248f9ee6bfc074dbcc82c.png\",\"qty\":1,\"promos\":[],\"modifiers\":[],\"appliedModifiers\":[],\"selectedPromos\":[],\"hasModifiers\":false,\"hasPromos\":false,\"image\":{\"id\":5,\"item_id\":5,\"image\":\"\\/uploads\\/pos\\/item\\/eb391180596fc6185fc248f9ee6bfc074dbcc82c.png\",\"created_at\":\"2021-03-26 21:38:21\",\"updated_at\":\"2021-03-26 21:38:21\"}}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 20000.00, 20000.00, 0.00, 2, NULL, '2021-03-28 00:00:00', '2021-03-26 22:35:33', '2021-03-28 23:03:56'),
(36, '#36', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 20000.00, 20000.00, 0.00, 2, NULL, '2021-03-29 00:00:00', '2021-03-28 23:08:14', '2021-03-29 00:01:33'),
(37, '#37', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":3,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"},{\"appliedModifiers\":[{\"qty\":2,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}]}],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 39000.00, 39000.00, 0.00, 2, NULL, '2021-03-29 00:00:00', '2021-03-28 23:08:43', '2021-03-29 00:01:33'),
(38, '#38', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:04:36\",\"display_order\":1,\"hasModifiers\":true,\"hasPromos\":false,\"id\":1,\"image\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/7ce40450a996a1afe0b41cd144e54a8273170015.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":1,\"item_id\":1,\"modifier\":\"No Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":2,\"item_id\":1,\"modifier\":\"Extra Ketchup\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":3,\"item_id\":1,\"modifier\":\"Add Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"},{\"id\":4,\"item_id\":1,\"modifier\":\"No Cheese\",\"price\":0,\"created_at\":\"2021-01-14 16:04:36\",\"updated_at\":\"2021-01-14 16:04:36\"}],\"name\":\"Burger\",\"price\":12000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:04:36\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 20000.00, 20000.00, 0.00, 2, NULL, NULL, '2021-03-29 20:11:14', '2021-03-29 20:11:14'),
(39, '#39', 1, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-01-14 16:05:17\",\"display_order\":2,\"hasModifiers\":true,\"hasPromos\":false,\"id\":2,\"image\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/24071bf6380e876e42ad07ffc8c5bd4751b724c3.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[{\"id\":5,\"item_id\":2,\"modifier\":\"BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":6,\"item_id\":2,\"modifier\":\"Buffalo\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":7,\"item_id\":2,\"modifier\":\"Spicy BBQ\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"},{\"id\":8,\"item_id\":2,\"modifier\":\"Honey Mustard\",\"price\":0,\"created_at\":\"2021-01-14 16:05:17\",\"updated_at\":\"2021-01-14 16:05:17\"}],\"name\":\"Chicken Wings\",\"price\":15000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-01-14 16:05:17\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":6,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-26 21:38:21\",\"display_order\":5,\"hasModifiers\":false,\"hasPromos\":false,\"id\":5,\"image\":\"\\/uploads\\/pos\\/item\\/eb391180596fc6185fc248f9ee6bfc074dbcc82c.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/eb391180596fc6185fc248f9ee6bfc074dbcc82c.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Sandwitch\",\"price\":20000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-26 21:38:21\"},{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":6,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-26 21:38:21\",\"display_order\":5,\"hasModifiers\":false,\"hasPromos\":false,\"id\":5,\"image\":\"\\/uploads\\/pos\\/item\\/eb391180596fc6185fc248f9ee6bfc074dbcc82c.png\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/eb391180596fc6185fc248f9ee6bfc074dbcc82c.png\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Chicken Sandwitch\",\"price\":20000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-26 21:38:21\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 0, 55000.00, 55000.00, 0.00, 2, NULL, NULL, '2021-03-29 20:11:22', '2021-03-29 20:11:22'),
(40, '#40', 2, '{\"items\":[{\"appliedModifiers\":[],\"branch_id\":1,\"category_id\":2,\"company_id\":1,\"cost_center_id\":1,\"created_at\":\"2021-03-05 18:23:59\",\"display_order\":3,\"hasModifiers\":false,\"hasPromos\":false,\"id\":3,\"image\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"imagePath\":\"\\/uploads\\/pos\\/item\\/4b6173bc799e2d7491ec02054eae7b7b8035b6dd.jpg\",\"is_publish\":1,\"kitchennote\":null,\"modifiers\":[],\"name\":\"Tomato Sandwitch\",\"price\":8000,\"promos\":[],\"qty\":1,\"recipe_id\":null,\"selectedPromos\":[],\"updated_at\":\"2021-03-05 18:23:59\"}],\"combos\":[]}', '{\"amount\":0,\"percentage\":0}', 1, 8000.00, 8000.00, 0.00, 0, NULL, NULL, '2021-03-29 20:16:42', '2021-03-29 20:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
CREATE TABLE IF NOT EXISTS `periods` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `period` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `periods_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`id`, `period`, `user_id`, `is_active`) VALUES
(1, '2021-01-14 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'admin-module', 'admin', 0, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(2, 'company', 'admin', 1, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(3, 'company-list', 'admin', 2, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(4, 'company-create', 'admin', 2, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(5, 'company-edit', 'admin', 2, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(6, 'company-delete', 'admin', 2, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(7, 'branch', 'admin', 1, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(8, 'branch-list', 'admin', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(9, 'branch-create', 'admin', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(10, 'branch-edit', 'admin', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(11, 'branch-delete', 'admin', 7, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(12, 'department', 'admin', 1, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(13, 'department-list', 'admin', 12, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(14, 'department-create', 'admin', 12, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(15, 'department-edit', 'admin', 12, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(16, 'department-delete', 'admin', 12, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(17, 'position', 'admin', 1, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(18, 'position-list', 'admin', 17, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(19, 'position-create', 'admin', 17, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(20, 'position-edit', 'admin', 17, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(21, 'position-delete', 'admin', 17, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(22, 'system-user', 'admin', 1, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(23, 'system-user-list', 'admin', 22, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(24, 'system-user-create', 'admin', 22, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(25, 'system-user-edit', 'admin', 22, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(26, 'system-user-delete', 'admin', 22, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(27, 'district', 'admin', 1, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(28, 'district-list', 'admin', 27, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(29, 'district-create', 'admin', 27, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(30, 'district-edit', 'admin', 27, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(31, 'district-delete', 'admin', 27, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(32, 'city', 'admin', 1, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(33, 'city-list', 'admin', 32, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(34, 'city-create', 'admin', 32, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(35, 'city-edit', 'admin', 32, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(36, 'city-delete', 'admin', 32, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(37, 'user-permission-module', 'admin', 0, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(38, 'role', 'admin', 37, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(39, 'role-list', 'admin', 38, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(40, 'role-create', 'admin', 38, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(41, 'role-edit', 'admin', 38, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(42, 'role-delete', 'admin', 38, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(43, 'system-user-permission', 'admin', 37, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(44, 'sytem-user-permission-control', 'admin', 43, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(45, 'pos-user-permission', 'admin', 37, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(46, 'pos-user-permission-control', 'admin', 45, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(47, 'inventory-module', 'admin', 0, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(48, 'cost-center', 'admin', 47, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(49, 'cost-center-list', 'admin', 48, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(50, 'cost-center-create', 'admin', 48, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(51, 'cost-center-edit', 'admin', 48, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(52, 'cost-center-delete', 'admin', 48, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(53, 'currency', 'admin', 47, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(54, 'currency-list', 'admin', 53, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(55, 'currency-create', 'admin', 53, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(56, 'currency-edit', 'admin', 53, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(57, 'currency-delete', 'admin', 53, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(58, 'unit-measure', 'admin', 47, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(59, 'unit-measure-list', 'admin', 58, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(60, 'unit-measure-create', 'admin', 58, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(61, 'unit-measure-edit', 'admin', 58, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(62, 'unit-measure-delete', 'admin', 58, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(63, 'unit-measure-conversion-factor', 'admin', 47, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(64, 'unit-measure-conversion-factor-list', 'admin', 63, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(65, 'unit-measure-conversion-factor-create', 'admin', 63, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(66, 'unit-measure-conversion-factor-edit', 'admin', 63, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(67, 'unit-measure-conversion-factor-delete', 'admin', 63, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(68, 'supplier', 'admin', 47, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(69, 'supplier-list', 'admin', 68, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(70, 'supplier-create', 'admin', 68, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(71, 'supplier-edit', 'admin', 68, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(72, 'supplier-delete', 'admin', 68, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(73, 'category', 'admin', 47, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(74, 'category-list', 'admin', 73, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(75, 'category-create', 'admin', 73, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(76, 'category-edit', 'admin', 73, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(77, 'category-delete', 'admin', 73, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(78, 'item', 'admin', 47, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(79, 'item-list', 'admin', 78, '2021-01-14 15:40:17', '2021-01-14 15:40:17'),
(80, 'item-create', 'admin', 78, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(81, 'item-edit', 'admin', 78, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(82, 'item-delete', 'admin', 78, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(83, 'production-recipe', 'admin', 47, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(84, 'production-recipe-list', 'admin', 83, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(85, 'production-recipe-create', 'admin', 83, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(86, 'production-recipe-edit', 'admin', 83, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(87, 'production-recipe-delete', 'admin', 83, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(88, 'recipe', 'admin', 47, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(89, 'recipe-list', 'admin', 88, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(90, 'recipe-create', 'admin', 88, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(91, 'recipe-edit', 'admin', 88, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(92, 'recipe-delete', 'admin', 88, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(93, 'workflow-module', 'admin', 0, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(94, 'procurement', 'admin', 93, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(95, 'purchase-request-list', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(96, 'purchase-request-create', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(97, 'purchase-request-edit', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(98, 'purchase-request-delete', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(99, 'purchase-request-status-change', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(100, 'purchase-order-list', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(101, 'purchase-order-create', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(102, 'purchase-order-edit', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(103, 'purchase-order-delete', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(104, 'purchase-order-status-change', 'admin', 94, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(105, 'receiving', 'admin', 93, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(106, 'pending-delivery-list', 'admin', 105, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(107, 'pending-delivery-edit', 'admin', 105, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(108, 'pending-delivery-delete', 'admin', 105, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(109, 'pending-delivery-export', 'admin', 105, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(110, 'purchase-invoice-list', 'admin', 105, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(111, 'purchase-invoice-edit', 'admin', 105, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(112, 'purchase-invoice-delete', 'admin', 105, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(113, 'purchase-invoice-status-change', 'admin', 105, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(114, 'requisition', 'admin', 93, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(115, 'requisition-request-list', 'admin', 114, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(116, 'requisition-request-create', 'admin', 114, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(117, 'requisition-request-edit', 'admin', 114, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(118, 'requisition-request-delete', 'admin', 114, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(119, 'requisition-request-status-change', 'admin', 114, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(120, 'pending-requisition-list', 'admin', 114, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(121, 'pending-requisition-edit', 'admin', 114, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(122, 'transfer', 'admin', 93, '2021-01-14 15:40:18', '2021-01-14 15:40:18'),
(123, 'pending-transfer-list', 'admin', 122, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(124, 'pending-transfer-edit', 'admin', 122, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(125, 'pending-transfer-status-change', 'admin', 122, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(126, 'tranfer-history-list', 'admin', 122, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(127, 'production', 'admin', 93, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(128, 'production-history', 'admin', 127, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(129, 'production-produce', 'admin', 127, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(130, 'production-auto-produce', 'admin', 127, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(131, 'wastage', 'admin', 93, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(132, 'wastage-history', 'admin', 131, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(133, 'wastage-create', 'admin', 131, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(134, 'wastage-stock-calculation', 'admin', 131, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(135, 'sales-invoice', 'admin', 93, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(136, 'sales-invoice-list', 'admin', 135, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(137, 'sales-invoice-create', 'admin', 135, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(138, 'sales-invoice-export', 'admin', 135, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(139, 'stock-count', 'admin', 93, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(140, 'stock-view', 'admin', 139, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(141, 'stock-update', 'admin', 139, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(142, 'stock-import', 'admin', 139, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(143, 'stock-export', 'admin', 139, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(144, 'stock-close-period', 'admin', 139, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(145, 'stock-history', 'admin', 139, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(146, 'accounting-module', 'admin', 0, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(147, 'configuration', 'admin', 146, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(148, 'chart-account-list', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(149, 'chart-account-create', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(150, 'chart-account-update', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(151, 'chart-account-delete', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(152, 'chart-account-import', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(153, 'voucher-list', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(154, 'voucher-create', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(155, 'voucher-update', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(156, 'voucher-delete', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(157, 'account-close', 'admin', 147, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(158, 'transaction', 'admin', 146, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(159, 'journal-voucher-list', 'admin', 158, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(160, 'journal-voucher-create', 'admin', 158, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(161, 'journal-voucher-update', 'admin', 158, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(162, 'journal-voucher-delete', 'admin', 158, '2021-01-14 15:40:19', '2021-01-14 15:40:19'),
(163, 'invoice-list', 'admin', 158, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(164, 'invoice-create', 'admin', 158, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(165, 'invoice-delete', 'admin', 158, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(166, 'schedule-transaction-list', 'admin', 158, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(167, 'schedule-transaction-create', 'admin', 158, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(168, 'schedule-transaction-update', 'admin', 158, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(169, 'schedule-transaction-delete', 'admin', 158, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(170, 'reports', 'admin', 146, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(171, 'statement-account', 'admin', 170, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(172, 'trial-balance', 'admin', 170, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(173, 'POS-module', 'admin', 0, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(174, 'pos-category', 'admin', 173, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(175, 'pos-category-list', 'admin', 174, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(176, 'pos-category-create', 'admin', 174, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(177, 'pos-category-edit', 'admin', 174, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(178, 'pos-category-delete', 'admin', 174, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(179, 'pos-category-list-api', 'admin', 174, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(180, 'pos-category-order-change-api', 'admin', 174, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(181, 'pos-printer', 'admin', 173, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(182, 'pos-printer-list', 'admin', 181, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(183, 'pos-printer-create', 'admin', 181, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(184, 'pos-printer-edit', 'admin', 181, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(185, 'pos-printer-delete', 'admin', 181, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(186, 'pos-item', 'admin', 173, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(187, 'pos-item-list', 'admin', 186, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(188, 'pos-item-create', 'admin', 186, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(189, 'pos-item-edit', 'admin', 186, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(190, 'pos-item-delete', 'admin', 186, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(191, 'pos-item-list-api', 'admin', 186, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(192, 'pos-item-order-change-api', 'admin', 186, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(193, 'pos-item-choice', 'admin', 173, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(194, 'pos-item-choice-list', 'admin', 193, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(195, 'pos-item-choice-create', 'admin', 193, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(196, 'pos-item-choice-edit', 'admin', 193, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(197, 'pos-item-choice-delete', 'admin', 193, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(198, 'pos-promo', 'admin', 173, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(199, 'pos-promo-list', 'admin', 198, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(200, 'pos-promo-create', 'admin', 198, '2021-01-14 15:40:20', '2021-01-14 15:40:20'),
(201, 'pos-promo-edit', 'admin', 198, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(202, 'pos-promo-delete', 'admin', 198, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(203, 'pos-combo', 'admin', 173, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(204, 'pos-combo-list', 'admin', 203, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(205, 'pos-combo-create', 'admin', 203, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(206, 'pos-combo-edit', 'admin', 203, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(207, 'pos-combo-delete', 'admin', 203, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(208, 'pos-combo-list-api', 'admin', 203, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(209, 'pos-floorplan', 'admin', 173, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(210, 'pos-floorplan-list', 'admin', 209, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(211, 'pos-floorplan-create', 'admin', 209, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(212, 'pos-floorplan-edit', 'admin', 209, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(213, 'pos-floorplan-delete', 'admin', 209, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(214, 'pos-floorplan-set', 'admin', 209, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(215, 'pos-floorplan-get-api', 'admin', 209, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(216, 'pos-floorplan-set-api', 'admin', 209, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(217, 'pos-report', 'admin', 173, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(218, 'pos-report-view', 'admin', 217, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(219, 'pos-report-export', 'admin', 217, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(220, 'pos-history-view', 'admin', 217, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(221, 'pos-setup', 'admin', 173, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(222, 'pos-setup-list', 'admin', 221, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(223, 'pos-setup-setup', 'admin', 221, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(224, 'pos-user', 'admin', 173, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(225, 'pos-user-list', 'admin', 224, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(226, 'pos-user-create', 'admin', 224, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(227, 'pos-user-edit', 'admin', 224, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(228, 'pos-user-delete', 'admin', 224, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(229, 'pos-order', 'admin', 173, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(230, 'pos-order-list-api', 'admin', 229, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(231, 'pos-order-create-api', 'admin', 229, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(232, 'pos-order-view-api', 'admin', 229, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(233, 'pos-order-change-status-api', 'admin', 229, '2021-01-14 15:40:21', '2021-01-14 15:40:21'),
(234, 'pos-reservation', 'admin', 173, '2021-01-14 15:40:22', '2021-01-14 15:40:22'),
(235, 'pos-reservation-list-api', 'admin', 234, '2021-01-14 15:40:22', '2021-01-14 15:40:22'),
(236, 'pos-reservation-create-api', 'admin', 234, '2021-01-14 15:40:22', '2021-01-14 15:40:22'),
(237, 'pos-reservation-delete-api', 'admin', 234, '2021-01-14 15:40:22', '2021-01-14 15:40:22'),
(238, 'pos-customer', 'admin', 173, '2021-01-14 15:40:22', '2021-01-14 15:40:22'),
(239, 'pos-customer-list-api', 'admin', 238, '2021-01-14 15:40:22', '2021-01-14 15:40:22'),
(240, 'pos-customer-create-api', 'admin', 238, '2021-01-14 15:40:22', '2021-01-14 15:40:22'),
(241, 'pos-end-of-day-process-api', 'admin', 173, '2021-01-14 15:40:22', '2021-01-14 15:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
CREATE TABLE IF NOT EXISTS `positions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `positions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_categories`
--

DROP TABLE IF EXISTS `pos_categories`;
CREATE TABLE IF NOT EXISTS `pos_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_categories_company_id_foreign` (`company_id`),
  KEY `pos_categories_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_categories`
--

INSERT INTO `pos_categories` (`id`, `company_id`, `branch_id`, `name`, `image`, `parent_id`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'Main', NULL, 0, 0, '2021-01-14 15:40:16', '2021-01-14 15:40:16'),
(2, 1, 1, 'Food', '/uploads/pos/category/8fcaa25316ffa1368e89de69d579a8df7c604587.png', 1, 2, '2021-01-14 16:03:06', '2021-03-29 14:23:44'),
(3, 1, 1, 'Drinks', '/uploads/pos/category/e014a9fb0ea8f6ee1fb191eb1ee6bd9f80016853.png', 1, 1, '2021-01-14 16:03:26', '2021-03-29 14:23:44'),
(6, 1, 1, 'Sandwitch', '/uploads/pos/category/a756cf8fab0d82ef920a39ce4d50a64f398aecc0.png', 2, 3, '2021-03-04 23:53:29', '2021-03-04 23:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `pos_floorplans`
--

DROP TABLE IF EXISTS `pos_floorplans`;
CREATE TABLE IF NOT EXISTS `pos_floorplans` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_floorplans_company_id_foreign` (`company_id`),
  KEY `pos_floorplans_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_items`
--

DROP TABLE IF EXISTS `pos_items`;
CREATE TABLE IF NOT EXISTS `pos_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_center_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `recipe_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(12,2) NOT NULL,
  `is_publish` tinyint(1) NOT NULL DEFAULT 0,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_items_category_id_foreign` (`category_id`),
  KEY `pos_items_recipe_id_foreign` (`recipe_id`),
  KEY `pos_items_company_id_foreign` (`company_id`),
  KEY `pos_items_branch_id_foreign` (`branch_id`),
  KEY `pos_items_cost_center_id_foreign` (`cost_center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_items`
--

INSERT INTO `pos_items` (`id`, `company_id`, `branch_id`, `name`, `cost_center_id`, `category_id`, `recipe_id`, `price`, `is_publish`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Burger', 1, 2, NULL, 12000.00, 1, 1, '2021-01-14 16:04:36', '2021-01-14 16:04:36'),
(2, 1, 1, 'Chicken Wings', 1, 2, NULL, 15000.00, 1, 2, '2021-01-14 16:05:17', '2021-01-14 16:05:17'),
(3, 1, 1, 'Tomato Sandwitch', 1, 2, NULL, 8000.00, 1, 3, '2021-03-05 18:23:59', '2021-03-05 18:23:59'),
(4, 1, 1, 'Chicken Burger', 1, 2, NULL, 10000.00, 1, 4, '2021-03-05 18:24:29', '2021-03-05 18:24:29'),
(5, 1, 1, 'Chicken Sandwitch', 1, 6, NULL, 20000.00, 1, 5, '2021-03-26 21:38:21', '2021-03-26 21:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `pos_setups`
--

DROP TABLE IF EXISTS `pos_setups`;
CREATE TABLE IF NOT EXISTS `pos_setups` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `show_company_name` tinyint(4) NOT NULL DEFAULT 0,
  `show_branch_name` tinyint(4) NOT NULL DEFAULT 0,
  `show_branch_address` tinyint(4) NOT NULL DEFAULT 0,
  `show_vat_info` tinyint(4) NOT NULL DEFAULT 0,
  `show_phone_number` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_setups_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_users`
--

DROP TABLE IF EXISTS `pos_users`;
CREATE TABLE IF NOT EXISTS `pos_users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pos_users_username_unique` (`username`),
  UNIQUE KEY `pos_users_pincode_unique` (`pincode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_users`
--

INSERT INTO `pos_users` (`id`, `name`, `username`, `pincode`, `password`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Abdo Elasmar', 'admin', '1958', '$2y$10$tW3pIQRLsa5/ztY1r2r9XuQC1pIdfPorJq2GZoWJdGDbIxJpfY.BS', 1, '2021-01-14 16:05:48', '2021-01-14 16:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
CREATE TABLE IF NOT EXISTS `printers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 2,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `printers_name_unique` (`name`),
  KEY `printers_company_id_foreign` (`company_id`),
  KEY `printers_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productions`
--

DROP TABLE IF EXISTS `productions`;
CREATE TABLE IF NOT EXISTS `productions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `production_recipe_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `create_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `production_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productions_production_recipe_id_foreign` (`production_recipe_id`),
  KEY `productions_cost_center_id_foreign` (`cost_center_id`),
  KEY `productions_company_id_foreign` (`company_id`),
  KEY `productions_branch_id_foreign` (`branch_id`),
  KEY `productions_create_user_id_foreign` (`create_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_recipes`
--

DROP TABLE IF EXISTS `production_recipes`;
CREATE TABLE IF NOT EXISTS `production_recipes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serve_size` int(11) NOT NULL DEFAULT 0,
  `serve_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_serving` int(11) NOT NULL DEFAULT 1,
  `is_sale` tinyint(1) NOT NULL DEFAULT 0,
  `selling_price` double(15,2) DEFAULT NULL,
  `profit` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `production_recipes_code_unique` (`code`),
  KEY `production_recipes_category_id_foreign` (`category_id`),
  KEY `production_recipes_serve_unit_id_foreign` (`serve_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_recipe_items`
--

DROP TABLE IF EXISTS `production_recipe_items`;
CREATE TABLE IF NOT EXISTS `production_recipe_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uom_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double(11,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_recipe_items_recipe_id_foreign` (`recipe_id`),
  KEY `production_recipe_items_item_code_foreign` (`item_code`),
  KEY `production_recipe_items_uom_id_foreign` (`uom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

DROP TABLE IF EXISTS `promos`;
CREATE TABLE IF NOT EXISTS `promos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double(15,2) NOT NULL DEFAULT 0.00,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promos_name_unique` (`name`),
  KEY `promos_company_id_foreign` (`company_id`),
  KEY `promos_branch_id_foreign` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_items`
--

DROP TABLE IF EXISTS `promo_items`;
CREATE TABLE IF NOT EXISTS `promo_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `promo_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promo_items_item_id_foreign` (`item_id`),
  KEY `promo_items_promo_id_foreign` (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoices`
--

DROP TABLE IF EXISTS `purchase_invoices`;
CREATE TABLE IF NOT EXISTS `purchase_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `create_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `total_net` double(15,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,2) NOT NULL DEFAULT 0.00,
  `total_gross` double(15,2) NOT NULL DEFAULT 0.00,
  `invoice_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_invoices_invoice_number_unique` (`invoice_number`),
  UNIQUE KEY `purchase_invoices_order_code_unique` (`order_code`),
  KEY `purchase_invoices_company_id_foreign` (`company_id`),
  KEY `purchase_invoices_branch_id_foreign` (`branch_id`),
  KEY `purchase_invoices_create_user_id_foreign` (`create_user_id`),
  KEY `purchase_invoices_supplier_id_foreign` (`supplier_id`),
  KEY `purchase_invoices_cost_center_id_foreign` (`cost_center_id`),
  KEY `purchase_invoices_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice_items`
--

DROP TABLE IF EXISTS `purchase_invoice_items`;
CREATE TABLE IF NOT EXISTS `purchase_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_measure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `expiry_date` date DEFAULT NULL,
  `cost` double(15,2) NOT NULL DEFAULT 0.00,
  `tax` double(15,2) NOT NULL DEFAULT 0.00,
  `gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `purchase_invoice_items_item_code_foreign` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `create_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_net` double(15,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,2) NOT NULL DEFAULT 0.00,
  `total_gross` double(15,2) NOT NULL DEFAULT 0.00,
  `request_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `step` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_orders_order_code_unique` (`order_code`),
  KEY `purchase_orders_company_id_foreign` (`company_id`),
  KEY `purchase_orders_branch_id_foreign` (`branch_id`),
  KEY `purchase_orders_create_user_id_foreign` (`create_user_id`),
  KEY `purchase_orders_supplier_id_foreign` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

DROP TABLE IF EXISTS `purchase_order_items`;
CREATE TABLE IF NOT EXISTS `purchase_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_measure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `cost` double(15,2) NOT NULL DEFAULT 0.00,
  `tax` double(15,2) NOT NULL DEFAULT 0.00,
  `gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_items_order_id_foreign` (`order_id`),
  KEY `purchase_order_items_item_code_foreign` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_requests`
--

DROP TABLE IF EXISTS `purchase_requests`;
CREATE TABLE IF NOT EXISTS `purchase_requests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `request_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `create_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_net` double(15,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,2) NOT NULL DEFAULT 0.00,
  `total_gross` double(15,2) NOT NULL DEFAULT 0.00,
  `request_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `step` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_requests_request_code_unique` (`request_code`),
  KEY `purchase_requests_company_id_foreign` (`company_id`),
  KEY `purchase_requests_branch_id_foreign` (`branch_id`),
  KEY `purchase_requests_create_user_id_foreign` (`create_user_id`),
  KEY `purchase_requests_cost_center_id_foreign` (`cost_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request_items`
--

DROP TABLE IF EXISTS `purchase_request_items`;
CREATE TABLE IF NOT EXISTS `purchase_request_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_measure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `cost` double(15,2) NOT NULL DEFAULT 0.00,
  `tax` double(15,2) NOT NULL DEFAULT 0.00,
  `gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_request_items_request_id_foreign` (`request_id`),
  KEY `purchase_request_items_item_code_foreign` (`item_code`),
  KEY `purchase_request_items_supplier_id_foreign` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serve_size` int(11) NOT NULL DEFAULT 0,
  `serve_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_serving` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipes_code_unique` (`code`),
  KEY `recipes_category_id_foreign` (`category_id`),
  KEY `recipes_serve_unit_id_foreign` (`serve_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_items`
--

DROP TABLE IF EXISTS `recipe_items`;
CREATE TABLE IF NOT EXISTS `recipe_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('Item','Production Recipe') COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(11,2) NOT NULL DEFAULT 1.00,
  `uom_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_items_recipe_id_foreign` (`recipe_id`),
  KEY `recipe_items_item_code_foreign` (`item_code`),
  KEY `recipe_items_uom_id_foreign` (`uom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requisitions`
--

DROP TABLE IF EXISTS `requisitions`;
CREATE TABLE IF NOT EXISTS `requisitions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `requisition_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `create_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_net` double(15,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,2) NOT NULL DEFAULT 0.00,
  `total_gross` double(15,2) NOT NULL DEFAULT 0.00,
  `requisition_date` date DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `step` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requisitions_requisition_code_unique` (`requisition_code`),
  KEY `requisitions_company_id_foreign` (`company_id`),
  KEY `requisitions_create_user_id_foreign` (`create_user_id`),
  KEY `requisitions_from_branch_id_foreign` (`from_branch_id`),
  KEY `requisitions_from_cost_center_id_foreign` (`from_cost_center_id`),
  KEY `requisitions_to_branch_id_foreign` (`to_branch_id`),
  KEY `requisitions_to_cost_center_id_foreign` (`to_cost_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requisition_items`
--

DROP TABLE IF EXISTS `requisition_items`;
CREATE TABLE IF NOT EXISTS `requisition_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `requisition_id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_measure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `cost` double(15,2) NOT NULL DEFAULT 0.00,
  `tax` double(15,2) NOT NULL DEFAULT 0.00,
  `gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_items_requisition_id_foreign` (`requisition_id`),
  KEY `requisition_items_item_code_foreign` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL DEFAULT 0,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest` int(10) UNSIGNED NOT NULL,
  `reservated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `table_number` int(11) NOT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'admin', '2021-01-14 15:40:22', '2021-01-14 15:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `create_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_net` double(15,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,2) NOT NULL DEFAULT 0.00,
  `total_gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_invoice_code_unique` (`invoice_code`),
  KEY `sales_company_id_foreign` (`company_id`),
  KEY `sales_branch_id_foreign` (`branch_id`),
  KEY `sales_create_user_id_foreign` (`create_user_id`),
  KEY `sales_cost_center_id_foreign` (`cost_center_id`),
  KEY `sales_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
CREATE TABLE IF NOT EXISTS `sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_measure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `cost` double(15,2) NOT NULL DEFAULT 0.00,
  `discount` double(15,2) NOT NULL DEFAULT 0.00,
  `tax` double(15,2) NOT NULL DEFAULT 0.00,
  `gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_items_sale_id_foreign` (`sale_id`),
  KEY `sale_items_item_code_foreign` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0-item, 1-production',
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `in_quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `out_quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `expiry_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stocks_cost_center_id_foreign` (`cost_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_histories`
--

DROP TABLE IF EXISTS `stock_histories`;
CREATE TABLE IF NOT EXISTS `stock_histories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `unit_cost` double(15,2) NOT NULL DEFAULT 0.00,
  `was_process` tinyint(4) NOT NULL DEFAULT 0,
  `period_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_histories_cost_center_id_foreign` (`cost_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_term` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suppliers_code_unique` (`code`),
  UNIQUE KEY `suppliers_mobile_unique` (`mobile`),
  KEY `suppliers_country_id_foreign` (`country_id`),
  KEY `suppliers_currency_id_foreign` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE IF NOT EXISTS `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transfer_code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `create_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_net` double(15,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,2) NOT NULL DEFAULT 0.00,
  `total_gross` double(15,2) NOT NULL DEFAULT 0.00,
  `transfer_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `step` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transfers_transfer_code_unique` (`transfer_code`),
  KEY `transfers_company_id_foreign` (`company_id`),
  KEY `transfers_create_user_id_foreign` (`create_user_id`),
  KEY `transfers_from_branch_id_foreign` (`from_branch_id`),
  KEY `transfers_from_cost_center_id_foreign` (`from_cost_center_id`),
  KEY `transfers_to_branch_id_foreign` (`to_branch_id`),
  KEY `transfers_to_cost_center_id_foreign` (`to_cost_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_items`
--

DROP TABLE IF EXISTS `transfer_items`;
CREATE TABLE IF NOT EXISTS `transfer_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transfer_id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_measure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `cost` double(15,2) NOT NULL DEFAULT 0.00,
  `tax` double(15,2) NOT NULL DEFAULT 0.00,
  `gross` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_items_transfer_id_foreign` (`transfer_id`),
  KEY `transfer_items_item_code_foreign` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `units_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit_factors`
--

DROP TABLE IF EXISTS `unit_factors`;
CREATE TABLE IF NOT EXISTS `unit_factors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `from` bigint(20) UNSIGNED NOT NULL,
  `to` bigint(20) UNSIGNED NOT NULL,
  `rate` double(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_factors_from_foreign` (`from`),
  KEY `unit_factors_to_foreign` (`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_pincode_unique` (`pincode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `pincode`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin', NULL, NULL, NULL, '$2y$10$SGOoDBIDcNkXGAsszjb7u.tqaEoID1khUVJi669c0jtSPoHZcJlfy', '2021-01-14 15:40:23', '2021-01-14 15:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_structures`
--

DROP TABLE IF EXISTS `user_structures`;
CREATE TABLE IF NOT EXISTS `user_structures` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_structures_user_id_foreign` (`user_id`),
  KEY `user_structures_company_id_foreign` (`company_id`),
  KEY `user_structures_branch_id_foreign` (`branch_id`),
  KEY `user_structures_department_id_foreign` (`department_id`),
  KEY `user_structures_position_id_foreign` (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wastages`
--

DROP TABLE IF EXISTS `wastages`;
CREATE TABLE IF NOT EXISTS `wastages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wastage_date` date DEFAULT NULL,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `report_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wastages_cost_center_id_foreign` (`cost_center_id`),
  KEY `wastages_report_user_id_foreign` (`report_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wastage_items`
--

DROP TABLE IF EXISTS `wastage_items`;
CREATE TABLE IF NOT EXISTS `wastage_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wastage_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_measure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) NOT NULL DEFAULT 0.00,
  `unit_cost` double(15,2) NOT NULL DEFAULT 0.00,
  `total` double(15,2) NOT NULL DEFAULT 0.00,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wastage_items_wastage_id_foreign` (`wastage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ac_chart_accounts`
--
ALTER TABLE `ac_chart_accounts`
  ADD CONSTRAINT `ac_chart_accounts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_chart_accounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ac_chart_account_ledgers`
--
ALTER TABLE `ac_chart_account_ledgers`
  ADD CONSTRAINT `ac_chart_account_ledgers_account_code_foreign` FOREIGN KEY (`account_code`) REFERENCES `ac_chart_accounts` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_chart_account_ledgers_closing_id_foreign` FOREIGN KEY (`closing_id`) REFERENCES `ac_closing_accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_chart_account_ledgers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_chart_account_ledgers_voucher_code_foreign` FOREIGN KEY (`voucher_code`) REFERENCES `ac_vouchers` (`code`) ON DELETE SET NULL;

--
-- Constraints for table `ac_closing_accounts`
--
ALTER TABLE `ac_closing_accounts`
  ADD CONSTRAINT `ac_closing_accounts_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `ac_chart_accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_closing_accounts_period_account_id_foreign` FOREIGN KEY (`period_account_id`) REFERENCES `ac_chart_accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_closing_accounts_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `ac_chart_accounts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ac_journal_vouchers`
--
ALTER TABLE `ac_journal_vouchers`
  ADD CONSTRAINT `ac_journal_vouchers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_journal_vouchers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_journal_vouchers_voucher_code_foreign` FOREIGN KEY (`voucher_code`) REFERENCES `ac_vouchers` (`code`) ON DELETE SET NULL;

--
-- Constraints for table `ac_journal_voucher_items`
--
ALTER TABLE `ac_journal_voucher_items`
  ADD CONSTRAINT `ac_journal_voucher_items_account_code_foreign` FOREIGN KEY (`account_code`) REFERENCES `ac_chart_accounts` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_journal_voucher_items_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_journal_voucher_items_journal_transaction_id_foreign` FOREIGN KEY (`journal_transaction_id`) REFERENCES `ac_journal_voucher_transactions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ac_journal_voucher_transactions`
--
ALTER TABLE `ac_journal_voucher_transactions`
  ADD CONSTRAINT `ac_journal_voucher_transactions_journal_voucher_id_foreign` FOREIGN KEY (`journal_voucher_id`) REFERENCES `ac_journal_vouchers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ac_scheduled_transactions`
--
ALTER TABLE `ac_scheduled_transactions`
  ADD CONSTRAINT `ac_scheduled_transactions_credit_account_foreign` FOREIGN KEY (`credit_account`) REFERENCES `ac_chart_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ac_scheduled_transactions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ac_scheduled_transactions_debit_account_foreign` FOREIGN KEY (`debit_account`) REFERENCES `ac_chart_accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ac_transaction_invoices`
--
ALTER TABLE `ac_transaction_invoices`
  ADD CONSTRAINT `ac_transaction_invoices_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `ac_chart_accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_transaction_invoices_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_transaction_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_transaction_invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ac_transaction_invoice_items`
--
ALTER TABLE `ac_transaction_invoice_items`
  ADD CONSTRAINT `ac_transaction_invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `ac_transaction_invoices` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ac_vouchers`
--
ALTER TABLE `ac_vouchers`
  ADD CONSTRAINT `ac_vouchers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ac_vouchers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branches_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `branch_structures`
--
ALTER TABLE `branch_structures`
  ADD CONSTRAINT `branch_structures_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branch_structures_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branch_structures_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `combos`
--
ALTER TABLE `combos`
  ADD CONSTRAINT `combos_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `combos_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pos_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `combos_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `combo_images`
--
ALTER TABLE `combo_images`
  ADD CONSTRAINT `combo_images_combo_id_foreign` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `combo_items`
--
ALTER TABLE `combo_items`
  ADD CONSTRAINT `combo_items_combo_id_foreign` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `companies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cost_centers`
--
ALTER TABLE `cost_centers`
  ADD CONSTRAINT `cost_centers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crm_corporates`
--
ALTER TABLE `crm_corporates`
  ADD CONSTRAINT `crm_corporates_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `crm_corporates_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `crm_corporates_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `crm_corporate_contact_info_tables`
--
ALTER TABLE `crm_corporate_contact_info_tables`
  ADD CONSTRAINT `crm_corporate_contact_info_tables_corporate_id_foreign` FOREIGN KEY (`corporate_id`) REFERENCES `crm_corporates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `crm_corporate_sister_companies`
--
ALTER TABLE `crm_corporate_sister_companies`
  ADD CONSTRAINT `crm_corporate_sister_companies_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `crm_corporate_sister_companies_corporate_id_foreign` FOREIGN KEY (`corporate_id`) REFERENCES `crm_corporates` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `crm_corporate_sister_companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `crm_corporate_sister_companies_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `crm_customers`
--
ALTER TABLE `crm_customers`
  ADD CONSTRAINT `crm_customers_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `crm_customers_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `crm_customers_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `items_product_um_id_foreign` FOREIGN KEY (`product_um_id`) REFERENCES `units` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `items_product_um_size_um_id_foreign` FOREIGN KEY (`product_um_size_um_id`) REFERENCES `units` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `items_purchase_um_id_foreign` FOREIGN KEY (`purchase_um_id`) REFERENCES `units` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `items_purchase_um_size_um_id_foreign` FOREIGN KEY (`purchase_um_size_um_id`) REFERENCES `units` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `items_recipe_um_id_foreign` FOREIGN KEY (`recipe_um_id`) REFERENCES `units` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item_choices`
--
ALTER TABLE `item_choices`
  ADD CONSTRAINT `item_choices_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `item_choices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item_choice_items`
--
ALTER TABLE `item_choice_items`
  ADD CONSTRAINT `item_choice_items_item_choice_id_foreign` FOREIGN KEY (`item_choice_id`) REFERENCES `item_choices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_choice_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item_images`
--
ALTER TABLE `item_images`
  ADD CONSTRAINT `item_images_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_modifiers`
--
ALTER TABLE `item_modifiers`
  ADD CONSTRAINT `item_modifiers_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_modifiers_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `item_printers`
--
ALTER TABLE `item_printers`
  ADD CONSTRAINT `item_printers_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `pos_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_printers_printer_id_foreign` FOREIGN KEY (`printer_id`) REFERENCES `printers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_suppliers`
--
ALTER TABLE `item_suppliers`
  ADD CONSTRAINT `item_suppliers_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_suppliers_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `periods`
--
ALTER TABLE `periods`
  ADD CONSTRAINT `periods_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pos_categories`
--
ALTER TABLE `pos_categories`
  ADD CONSTRAINT `pos_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_floorplans`
--
ALTER TABLE `pos_floorplans`
  ADD CONSTRAINT `pos_floorplans_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_floorplans_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_items`
--
ALTER TABLE `pos_items`
  ADD CONSTRAINT `pos_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pos_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_items_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_items_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pos_setups`
--
ALTER TABLE `pos_setups`
  ADD CONSTRAINT `pos_setups_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `printers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productions`
--
ALTER TABLE `productions`
  ADD CONSTRAINT `productions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productions_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productions_create_user_id_foreign` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productions_production_recipe_id_foreign` FOREIGN KEY (`production_recipe_id`) REFERENCES `production_recipes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `production_recipes`
--
ALTER TABLE `production_recipes`
  ADD CONSTRAINT `production_recipes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `production_recipes_serve_unit_id_foreign` FOREIGN KEY (`serve_unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `production_recipe_items`
--
ALTER TABLE `production_recipe_items`
  ADD CONSTRAINT `production_recipe_items_item_code_foreign` FOREIGN KEY (`item_code`) REFERENCES `items` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `production_recipe_items_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `production_recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `production_recipe_items_uom_id_foreign` FOREIGN KEY (`uom_id`) REFERENCES `units` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `promos`
--
ALTER TABLE `promos`
  ADD CONSTRAINT `promos_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `promos_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `promo_items`
--
ALTER TABLE `promo_items`
  ADD CONSTRAINT `promo_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promo_items_promo_id_foreign` FOREIGN KEY (`promo_id`) REFERENCES `promos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  ADD CONSTRAINT `purchase_invoices_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_invoices_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_invoices_create_user_id_foreign` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_invoices_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_invoice_items`
--
ALTER TABLE `purchase_invoice_items`
  ADD CONSTRAINT `purchase_invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `purchase_invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_invoice_items_item_code_foreign` FOREIGN KEY (`item_code`) REFERENCES `items` (`code`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_orders_create_user_id_foreign` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_item_code_foreign` FOREIGN KEY (`item_code`) REFERENCES `items` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD CONSTRAINT `purchase_requests_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_requests_create_user_id_foreign` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  ADD CONSTRAINT `purchase_request_items_item_code_foreign` FOREIGN KEY (`item_code`) REFERENCES `items` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_request_items_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `purchase_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_request_items_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `recipes_serve_unit_id_foreign` FOREIGN KEY (`serve_unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `recipe_items`
--
ALTER TABLE `recipe_items`
  ADD CONSTRAINT `recipe_items_item_code_foreign` FOREIGN KEY (`item_code`) REFERENCES `items` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `recipe_items_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_items_uom_id_foreign` FOREIGN KEY (`uom_id`) REFERENCES `units` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `requisitions`
--
ALTER TABLE `requisitions`
  ADD CONSTRAINT `requisitions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `requisitions_create_user_id_foreign` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `requisitions_from_branch_id_foreign` FOREIGN KEY (`from_branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `requisitions_from_cost_center_id_foreign` FOREIGN KEY (`from_cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `requisitions_to_branch_id_foreign` FOREIGN KEY (`to_branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `requisitions_to_cost_center_id_foreign` FOREIGN KEY (`to_cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `requisition_items`
--
ALTER TABLE `requisition_items`
  ADD CONSTRAINT `requisition_items_item_code_foreign` FOREIGN KEY (`item_code`) REFERENCES `items` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `requisition_items_requisition_id_foreign` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_create_user_id_foreign` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_item_code_foreign` FOREIGN KEY (`item_code`) REFERENCES `items` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `stock_histories`
--
ALTER TABLE `stock_histories`
  ADD CONSTRAINT `stock_histories_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `suppliers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transfers_create_user_id_foreign` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transfers_from_branch_id_foreign` FOREIGN KEY (`from_branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transfers_from_cost_center_id_foreign` FOREIGN KEY (`from_cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transfers_to_branch_id_foreign` FOREIGN KEY (`to_branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transfers_to_cost_center_id_foreign` FOREIGN KEY (`to_cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `transfer_items`
--
ALTER TABLE `transfer_items`
  ADD CONSTRAINT `transfer_items_item_code_foreign` FOREIGN KEY (`item_code`) REFERENCES `items` (`code`) ON DELETE SET NULL,
  ADD CONSTRAINT `transfer_items_transfer_id_foreign` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `unit_factors`
--
ALTER TABLE `unit_factors`
  ADD CONSTRAINT `unit_factors_from_foreign` FOREIGN KEY (`from`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `unit_factors_to_foreign` FOREIGN KEY (`to`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_structures`
--
ALTER TABLE `user_structures`
  ADD CONSTRAINT `user_structures_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_structures_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_structures_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_structures_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_structures_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wastages`
--
ALTER TABLE `wastages`
  ADD CONSTRAINT `wastages_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wastages_report_user_id_foreign` FOREIGN KEY (`report_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wastage_items`
--
ALTER TABLE `wastage_items`
  ADD CONSTRAINT `wastage_items_wastage_id_foreign` FOREIGN KEY (`wastage_id`) REFERENCES `wastages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
