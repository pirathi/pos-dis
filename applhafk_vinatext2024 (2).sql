-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2024 at 10:28 AM
-- Server version: 10.6.17-MariaDB-cll-lve
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `applhafk_vinatext2024`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `account_details` text DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `business_id`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-29 11:16:02', '2024-03-29 11:16:02'),
(2, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-29 23:46:16', '2024-03-29 23:46:16'),
(3, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 00:01:21', '2024-03-30 00:01:21'),
(4, 'default', 'added', 2, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\" Manager \"}', NULL, '2024-03-30 00:16:29', '2024-03-30 00:16:29'),
(5, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 00:16:34', '2024-03-30 00:16:34'),
(6, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-03-30 00:16:45', '2024-03-30 00:16:45'),
(7, 'default', 'added', 2, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":846}}', NULL, '2024-03-30 00:34:14', '2024-03-30 00:34:14'),
(8, 'default', 'edited', 2, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\" Manager \"}', NULL, '2024-03-30 01:17:18', '2024-03-30 01:17:18'),
(9, 'default', 'edited', 2, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\" Manager \"}', NULL, '2024-03-30 01:18:03', '2024-03-30 01:18:03'),
(10, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 10:36:17', '2024-03-30 10:36:17'),
(11, 'default', 'added', 3, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":900}}', NULL, '2024-03-30 10:40:00', '2024-03-30 10:40:00'),
(12, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 11:07:13', '2024-03-30 11:07:13'),
(13, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-03-30 11:31:22', '2024-03-30 11:31:22'),
(14, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 18:44:55', '2024-03-30 18:44:55'),
(15, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 18:46:27', '2024-03-30 18:46:27'),
(16, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 18:49:11', '2024-03-30 18:49:11'),
(17, 'default', 'added', 3, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\" Loges \"}', NULL, '2024-03-30 19:04:23', '2024-03-30 19:04:23'),
(18, 'default', 'added', 4, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\" kayanthan \"}', NULL, '2024-03-30 19:07:54', '2024-03-30 19:07:54'),
(19, 'default', 'edited', 3, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\" Loges \"}', NULL, '2024-03-30 19:08:07', '2024-03-30 19:08:07'),
(20, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 19:08:11', '2024-03-30 19:08:11'),
(21, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-30 19:08:19', '2024-03-30 19:08:19'),
(22, 'default', 'added', 2, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-30 19:09:18', '2024-03-30 19:09:18'),
(23, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-30 19:10:45', '2024-03-30 19:10:45'),
(24, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 19:10:58', '2024-03-30 19:10:58'),
(25, 'default', 'edited', 3, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\" Loges \"}', NULL, '2024-03-30 19:12:34', '2024-03-30 19:12:34'),
(26, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 19:12:40', '2024-03-30 19:12:40'),
(27, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-30 19:12:45', '2024-03-30 19:12:45'),
(28, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-30 19:16:36', '2024-03-30 19:16:36'),
(29, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 19:16:43', '2024-03-30 19:16:43'),
(30, 'default', 'sell_deleted', 2, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":2,\"invoice_no\":\"0001\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"846.0000\"}}', NULL, '2024-03-30 19:17:51', '2024-03-30 19:17:51'),
(31, 'default', 'sell_deleted', 3, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":3,\"invoice_no\":\"VT_2024-0002\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"900.0000\"}}', NULL, '2024-03-30 19:17:55', '2024-03-30 19:17:55'),
(32, 'default', 'added', 4, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":378000}}', NULL, '2024-03-30 19:21:50', '2024-03-30 19:21:50'),
(33, 'default', 'added', 5, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":1800}}', NULL, '2024-03-30 19:37:55', '2024-03-30 19:37:55'),
(34, 'default', 'payment_edited', 5, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"1800.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"1800.0000\"}}', NULL, '2024-03-30 19:38:09', '2024-03-30 19:38:09'),
(35, 'default', 'payment_edited', 5, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"1800.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"1800.0000\"}}', NULL, '2024-03-30 19:38:26', '2024-03-30 19:38:26'),
(36, 'default', 'payment_deleted', 6, 'App\\TransactionPayment', NULL, 1, 1, 'App\\User', '{\"id\":6,\"ref_no\":\"PP2024\\/0002\"}', NULL, '2024-03-30 19:38:26', '2024-03-30 19:38:26'),
(37, 'default', 'payment_edited', 5, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"1800.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"1800.0000\"}}', NULL, '2024-03-30 19:38:34', '2024-03-30 19:38:34'),
(38, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 19:43:47', '2024-03-30 19:43:47'),
(39, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-30 19:45:12', '2024-03-30 19:45:12'),
(40, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-30 20:44:31', '2024-03-30 20:44:31'),
(41, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-30 22:26:52', '2024-03-30 22:26:52'),
(42, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-31 00:03:24', '2024-03-31 00:03:24'),
(43, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-31 01:55:30', '2024-03-31 01:55:30'),
(44, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 01:59:33', '2024-03-31 01:59:33'),
(45, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 03:14:08', '2024-03-31 03:14:08'),
(46, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-31 09:43:43', '2024-03-31 09:43:43'),
(47, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 12:22:49', '2024-03-31 12:22:49'),
(48, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 13:47:22', '2024-03-31 13:47:22'),
(49, 'default', 'added', 10, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1250}}', NULL, '2024-03-31 14:23:24', '2024-03-31 14:23:24'),
(50, 'default', 'added', 11, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2750}}', NULL, '2024-03-31 14:24:40', '2024-03-31 14:24:40'),
(51, 'default', 'login', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2024-03-31 15:00:20', '2024-03-31 15:00:20'),
(52, 'default', 'edited', 4, 'App\\User', NULL, 1, 3, 'App\\User', '{\"name\":\" kayanthan \"}', NULL, '2024-03-31 15:00:37', '2024-03-31 15:00:37'),
(53, 'default', 'sell_deleted', 11, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"id\":11,\"invoice_no\":\"VT_2024-0004\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2750.0000\"}}', NULL, '2024-03-31 15:25:46', '2024-03-31 15:25:46'),
(54, 'default', 'sell_deleted', 10, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"id\":10,\"invoice_no\":\"VT_2024-0003\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1250.0000\"}}', NULL, '2024-03-31 15:26:13', '2024-03-31 15:26:13'),
(55, 'default', 'added', 3, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 15:29:49', '2024-03-31 15:29:49'),
(56, 'default', 'added', 12, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":27000}}', NULL, '2024-03-31 15:31:42', '2024-03-31 15:31:42'),
(57, 'default', 'added', 13, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2100}}', NULL, '2024-03-31 15:37:04', '2024-03-31 15:37:04'),
(58, 'default', 'edited', 13, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2100.0000\"}}', NULL, '2024-03-31 15:38:43', '2024-03-31 15:38:43'),
(59, 'default', 'added', 14, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":2000}}', NULL, '2024-03-31 15:40:58', '2024-03-31 15:40:58'),
(60, 'default', 'sell_deleted', 13, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"id\":13,\"invoice_no\":\"VT_2024-0005\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2000.0000\"}}', NULL, '2024-03-31 15:44:45', '2024-03-31 15:44:45'),
(61, 'default', 'purchase_deleted', 12, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"27000.0000\"}}', NULL, '2024-03-31 15:45:13', '2024-03-31 15:45:13'),
(62, 'default', 'purchase_deleted', 5, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"1800.0000\"}}', NULL, '2024-03-31 15:45:19', '2024-03-31 15:45:19'),
(63, 'default', 'purchase_deleted', 4, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"378000.0000\"}}', NULL, '2024-03-31 15:45:22', '2024-03-31 15:45:22'),
(64, 'default', 'added', 15, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":72000}}', NULL, '2024-03-31 15:57:27', '2024-03-31 15:57:27'),
(65, 'default', 'edited', 15, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":72000},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"72000.0000\"}}', NULL, '2024-03-31 15:59:46', '2024-03-31 15:59:46'),
(66, 'default', 'purchase_deleted', 15, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"72000.0000\"}}', NULL, '2024-03-31 16:06:30', '2024-03-31 16:06:30'),
(67, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 16:23:46', '2024-03-31 16:23:46'),
(68, 'default', 'added', 16, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":79900}}', NULL, '2024-03-31 16:28:00', '2024-03-31 16:28:00'),
(69, 'default', 'added', 4, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 16:39:12', '2024-03-31 16:39:12'),
(70, 'default', 'added', 17, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":79900}}', NULL, '2024-03-31 16:40:39', '2024-03-31 16:40:39'),
(71, 'default', 'added', 18, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2040}}', NULL, '2024-03-31 16:41:45', '2024-03-31 16:41:45'),
(72, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-31 16:54:37', '2024-03-31 16:54:37'),
(73, 'default', 'purchase_deleted', 16, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"79900.0000\"}}', NULL, '2024-03-31 17:05:52', '2024-03-31 17:05:52'),
(74, 'default', 'added', 5, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 17:11:55', '2024-03-31 17:11:55'),
(75, 'default', 'added', 19, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":427200}}', NULL, '2024-03-31 17:14:10', '2024-03-31 17:14:10'),
(76, 'default', 'added', 6, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 17:16:09', '2024-03-31 17:16:09'),
(77, 'default', 'added', 7, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 17:19:03', '2024-03-31 17:19:03'),
(78, 'default', 'added', 8, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 17:20:47', '2024-03-31 17:20:47'),
(79, 'default', 'edited', 17, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":79900},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"79900.0000\"}}', NULL, '2024-03-31 17:35:02', '2024-03-31 17:35:02'),
(80, 'default', 'sell_deleted', 18, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"id\":18,\"invoice_no\":\"VT_2024-0006\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2040.0000\"}}', NULL, '2024-03-31 17:36:43', '2024-03-31 17:36:43'),
(81, 'default', 'edited', 17, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":79900},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"79900.0000\"}}', NULL, '2024-03-31 17:37:12', '2024-03-31 17:37:12'),
(82, 'default', 'added', 20, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":185000}}', NULL, '2024-03-31 18:16:59', '2024-03-31 18:16:59'),
(83, 'default', 'added', 9, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 18:33:41', '2024-03-31 18:33:41'),
(84, 'default', 'added', 21, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":42230}}', NULL, '2024-03-31 18:36:50', '2024-03-31 18:36:50'),
(85, 'default', 'added', 22, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":37950}}', NULL, '2024-03-31 18:56:17', '2024-03-31 18:56:17'),
(86, 'default', 'added', 23, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":39900}}', NULL, '2024-03-31 19:26:26', '2024-03-31 19:26:26'),
(87, 'default', 'added', 24, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":22500}}', NULL, '2024-03-31 19:31:50', '2024-03-31 19:31:50'),
(88, 'default', 'added', 25, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":3150}}', NULL, '2024-03-31 19:45:38', '2024-03-31 19:45:38'),
(89, 'default', 'added', 26, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":30660}}', NULL, '2024-03-31 19:56:44', '2024-03-31 19:56:44'),
(90, 'default', 'added', 27, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":38250}}', NULL, '2024-03-31 20:09:49', '2024-03-31 20:09:49'),
(91, 'default', 'added', 10, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 20:17:00', '2024-03-31 20:17:00'),
(92, 'default', 'added', 28, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":12900}}', NULL, '2024-03-31 20:17:43', '2024-03-31 20:17:43'),
(93, 'default', 'added', 29, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":21800}}', NULL, '2024-03-31 20:20:45', '2024-03-31 20:20:45'),
(94, 'default', 'added', 30, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":30660}}', NULL, '2024-03-31 21:02:00', '2024-03-31 21:02:00'),
(95, 'default', 'added', 11, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 21:38:33', '2024-03-31 21:38:33'),
(96, 'default', 'added', 12, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 21:43:09', '2024-03-31 21:43:09'),
(97, 'default', 'edited', 30, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":30660},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"30660.0000\"}}', NULL, '2024-03-31 21:43:22', '2024-03-31 21:43:22'),
(98, 'default', 'added', 13, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 21:46:27', '2024-03-31 21:46:27'),
(99, 'default', 'edited', 29, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":21800},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"21800.0000\"}}', NULL, '2024-03-31 21:46:36', '2024-03-31 21:46:36'),
(100, 'default', 'edited', 28, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":12900},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"12900.0000\"}}', NULL, '2024-03-31 21:47:11', '2024-03-31 21:47:11'),
(101, 'default', 'added', 14, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-03-31 21:48:49', '2024-03-31 21:48:49'),
(102, 'default', 'edited', 27, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":38250},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"38250.0000\"}}', NULL, '2024-03-31 21:49:01', '2024-03-31 21:49:01'),
(103, 'default', 'edited', 26, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":30660},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"30660.0000\"}}', NULL, '2024-03-31 21:49:51', '2024-03-31 21:49:51'),
(104, 'default', 'edited', 25, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":3150},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"3150.0000\"}}', NULL, '2024-03-31 21:50:14', '2024-03-31 21:50:14'),
(105, 'default', 'edited', 24, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":22500},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"22500.0000\"}}', NULL, '2024-03-31 21:50:36', '2024-03-31 21:50:36'),
(106, 'default', 'edited', 23, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":39900},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"39900.0000\"}}', NULL, '2024-03-31 21:50:57', '2024-03-31 21:50:57'),
(107, 'default', 'edited', 22, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":37950},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"37950.0000\"}}', NULL, '2024-03-31 21:51:14', '2024-03-31 21:51:14'),
(108, 'default', 'edited', 21, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":42230},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"42230.0000\"}}', NULL, '2024-03-31 21:51:54', '2024-03-31 21:51:54'),
(109, 'default', 'edited', 19, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":427200},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"427200.0000\"}}', NULL, '2024-03-31 21:52:22', '2024-03-31 21:52:22'),
(110, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-31 21:56:29', '2024-03-31 21:56:29'),
(111, 'default', 'added', 31, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":28710}}', NULL, '2024-03-31 21:57:37', '2024-03-31 21:57:37'),
(112, 'default', 'added', 32, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":7000}}', NULL, '2024-03-31 22:00:09', '2024-03-31 22:00:09'),
(113, 'default', 'added', 33, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":8550}}', NULL, '2024-03-31 22:03:46', '2024-03-31 22:03:46'),
(114, 'default', 'added', 34, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":9540}}', NULL, '2024-03-31 22:15:05', '2024-03-31 22:15:05'),
(115, 'default', 'purchase_deleted', 26, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"30660.0000\"}}', NULL, '2024-03-31 22:29:22', '2024-03-31 22:29:22'),
(116, 'default', 'edited', 34, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":10600},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"9540.0000\"}}', NULL, '2024-03-31 22:43:29', '2024-03-31 22:43:29'),
(117, 'default', 'added', 35, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":25300}}', NULL, '2024-03-31 23:07:55', '2024-03-31 23:07:55'),
(118, 'default', 'added', 36, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":14700}}', NULL, '2024-03-31 23:13:26', '2024-03-31 23:13:26'),
(119, 'default', 'added', 37, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":5600}}', NULL, '2024-03-31 23:19:02', '2024-03-31 23:19:02'),
(120, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-03-31 23:31:14', '2024-03-31 23:31:14'),
(121, 'default', 'added', 38, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":81000}}', NULL, '2024-03-31 23:32:35', '2024-03-31 23:32:35'),
(122, 'default', 'added', 39, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":44400}}', NULL, '2024-03-31 23:38:13', '2024-03-31 23:38:13'),
(123, 'default', 'added', 40, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":48750}}', NULL, '2024-03-31 23:44:28', '2024-03-31 23:44:28'),
(124, 'default', 'edited', 40, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":48750},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"48750.0000\"}}', NULL, '2024-03-31 23:50:36', '2024-03-31 23:50:36'),
(125, 'default', 'edited', 40, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":29250},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"48750.0000\"}}', NULL, '2024-03-31 23:54:14', '2024-03-31 23:54:14'),
(126, 'default', 'added', 41, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase_return\",\"final_total\":19500}}', NULL, '2024-03-31 23:55:47', '2024-03-31 23:55:47'),
(127, 'default', 'edited', 41, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase_return\",\"payment_status\":\"due\",\"final_total\":19500},\"old\":{\"type\":\"purchase_return\",\"payment_status\":\"due\",\"final_total\":\"19500.0000\"}}', NULL, '2024-03-31 23:58:36', '2024-03-31 23:58:36'),
(128, 'default', 'payment_edited', 34, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"10600.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"10600.0000\"}}', NULL, '2024-04-01 00:06:57', '2024-04-01 00:06:57'),
(129, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-01 09:40:39', '2024-04-01 09:40:39'),
(130, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-01 12:36:09', '2024-04-01 12:36:09'),
(131, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-01 17:27:33', '2024-04-01 17:27:33'),
(132, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-01 21:01:23', '2024-04-01 21:01:23'),
(133, 'default', 'added', 42, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":10340}}', NULL, '2024-04-01 23:24:29', '2024-04-01 23:24:29'),
(134, 'default', 'added', 43, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":6600}}', NULL, '2024-04-01 23:32:05', '2024-04-01 23:32:05'),
(135, 'default', 'added', 44, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":12350}}', NULL, '2024-04-01 23:36:34', '2024-04-01 23:36:34'),
(136, 'default', 'added', 45, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":9000}}', NULL, '2024-04-01 23:39:45', '2024-04-01 23:39:45'),
(137, 'default', 'added', 46, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":9300}}', NULL, '2024-04-01 23:44:38', '2024-04-01 23:44:38'),
(138, 'default', 'added', 47, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":35880}}', NULL, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(139, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-02 00:05:40', '2024-04-02 00:05:40'),
(140, 'default', 'added', 48, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":70800}}', NULL, '2024-04-02 00:14:42', '2024-04-02 00:14:42'),
(141, 'default', 'added', 49, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":14750}}', NULL, '2024-04-02 00:20:17', '2024-04-02 00:20:17'),
(142, 'default', 'added', 50, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2160}}', NULL, '2024-04-02 00:23:55', '2024-04-02 00:23:55'),
(143, 'default', 'added', 51, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":33900}}', NULL, '2024-04-02 00:32:35', '2024-04-02 00:32:35'),
(144, 'default', 'sell_deleted', 50, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":50,\"invoice_no\":\"VT_2024-0007\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2160.0000\"}}', NULL, '2024-04-02 00:51:31', '2024-04-02 00:51:31'),
(145, 'default', 'added', 52, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2160}}', NULL, '2024-04-02 00:51:44', '2024-04-02 00:51:44'),
(146, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-02 01:26:31', '2024-04-02 01:26:31'),
(147, 'default', 'sell_deleted', 52, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":52,\"invoice_no\":\"VT_2024-0008\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"2160.0000\"}}', NULL, '2024-04-02 01:27:00', '2024-04-02 01:27:00'),
(148, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-02 10:17:56', '2024-04-02 10:17:56'),
(149, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-02 21:46:03', '2024-04-02 21:46:03'),
(150, 'default', 'added', 53, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":5000}}', NULL, '2024-04-02 23:23:21', '2024-04-02 23:23:21'),
(151, 'default', 'added', 54, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":6240}}', NULL, '2024-04-02 23:27:49', '2024-04-02 23:27:49'),
(152, 'default', 'added', 55, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":8500}}', NULL, '2024-04-02 23:31:29', '2024-04-02 23:31:29'),
(153, 'default', 'added', 56, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":8250}}', NULL, '2024-04-02 23:34:49', '2024-04-02 23:34:49'),
(154, 'default', 'added', 57, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":2925}}', NULL, '2024-04-02 23:45:23', '2024-04-02 23:45:23'),
(155, 'default', 'added', 58, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":6435}}', NULL, '2024-04-02 23:51:26', '2024-04-02 23:51:26'),
(156, 'default', 'added', 59, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":17490}}', NULL, '2024-04-02 23:55:55', '2024-04-02 23:55:55'),
(157, 'default', 'added', 60, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":4600}}', NULL, '2024-04-03 00:01:38', '2024-04-03 00:01:38'),
(158, 'default', 'added', 61, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":20160}}', NULL, '2024-04-03 00:12:47', '2024-04-03 00:12:47'),
(159, 'default', 'added', 15, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-03 00:18:47', '2024-04-03 00:18:47'),
(160, 'default', 'added', 62, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":102500}}', NULL, '2024-04-03 00:19:18', '2024-04-03 00:19:18'),
(161, 'default', 'added', 63, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":73075}}', NULL, '2024-04-03 00:27:32', '2024-04-03 00:27:32'),
(162, 'default', 'added', 16, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-03 00:30:20', '2024-04-03 00:30:20'),
(163, 'default', 'edited', 63, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":73075},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"73075.0000\"}}', NULL, '2024-04-03 00:30:29', '2024-04-03 00:30:29'),
(164, 'default', 'added', 64, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":49350}}', NULL, '2024-04-03 00:35:05', '2024-04-03 00:35:05'),
(165, 'default', 'added', 65, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":20560}}', NULL, '2024-04-03 00:40:53', '2024-04-03 00:40:53'),
(166, 'default', 'added', 66, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":25700}}', NULL, '2024-04-03 00:49:24', '2024-04-03 00:49:24'),
(167, 'default', 'edited', 66, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":25700},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"25700.0000\"}}', NULL, '2024-04-03 00:51:21', '2024-04-03 00:51:21'),
(168, 'default', 'edited', 66, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":25700},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"25700.0000\"}}', NULL, '2024-04-03 00:52:40', '2024-04-03 00:52:40'),
(169, 'default', 'purchase_deleted', 58, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"6435.0000\"}}', NULL, '2024-04-03 01:10:10', '2024-04-03 01:10:10'),
(170, 'default', 'added', 67, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":13080}}', NULL, '2024-04-03 01:18:54', '2024-04-03 01:18:54'),
(171, 'default', 'added', 68, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":25200}}', NULL, '2024-04-03 01:22:21', '2024-04-03 01:22:21'),
(172, 'default', 'added', 69, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":59400}}', NULL, '2024-04-03 01:25:31', '2024-04-03 01:25:31'),
(173, 'default', 'added', 70, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase_return\",\"final_total\":44550}}', NULL, '2024-04-03 01:29:26', '2024-04-03 01:29:26'),
(174, 'default', 'added', 71, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":19080}}', NULL, '2024-04-03 01:32:28', '2024-04-03 01:32:28'),
(175, 'default', 'added', 72, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":8100}}', NULL, '2024-04-03 01:36:35', '2024-04-03 01:36:35'),
(176, 'default', 'added', 73, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":38500}}', NULL, '2024-04-03 01:46:38', '2024-04-03 01:46:38'),
(177, 'default', 'added', 74, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":42350}}', NULL, '2024-04-03 01:53:44', '2024-04-03 01:53:44'),
(178, 'default', 'added', 75, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":4380}}', NULL, '2024-04-03 01:59:42', '2024-04-03 01:59:42'),
(179, 'default', 'edited', 75, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":122640},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"4380.0000\"}}', NULL, '2024-04-03 02:02:10', '2024-04-03 02:02:10'),
(180, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-03 11:29:39', '2024-04-03 11:29:39'),
(181, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-03 23:36:20', '2024-04-03 23:36:20'),
(182, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-04 00:52:03', '2024-04-04 00:52:03'),
(183, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-04 10:19:19', '2024-04-04 10:19:19'),
(184, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-05 00:13:59', '2024-04-05 00:13:59'),
(185, 'default', 'added', 17, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-05 02:22:25', '2024-04-05 02:22:25'),
(186, 'default', 'added', 76, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":38000}}', NULL, '2024-04-05 02:23:06', '2024-04-05 02:23:06'),
(187, 'default', 'added', 77, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":46250}}', NULL, '2024-04-05 03:07:09', '2024-04-05 03:07:09'),
(188, 'default', 'added', 78, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":35000}}', NULL, '2024-04-05 03:10:35', '2024-04-05 03:10:35'),
(189, 'default', 'added', 79, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":42000}}', NULL, '2024-04-05 03:15:04', '2024-04-05 03:15:04'),
(190, 'default', 'added', 18, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-05 03:19:51', '2024-04-05 03:19:51'),
(191, 'default', 'added', 80, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":24700}}', NULL, '2024-04-05 03:20:27', '2024-04-05 03:20:27'),
(192, 'default', 'added', 81, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":17500}}', NULL, '2024-04-05 03:24:26', '2024-04-05 03:24:26'),
(193, 'default', 'added', 82, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":37700}}', NULL, '2024-04-05 03:33:27', '2024-04-05 03:33:27'),
(194, 'default', 'added', 83, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":10350}}', NULL, '2024-04-05 03:40:04', '2024-04-05 03:40:04'),
(195, 'default', 'added', 84, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":10350}}', NULL, '2024-04-05 03:42:30', '2024-04-05 03:42:30'),
(196, 'default', 'added', 85, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":28800}}', NULL, '2024-04-05 03:47:54', '2024-04-05 03:47:54'),
(197, 'default', 'added', 86, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":23500}}', NULL, '2024-04-05 03:50:51', '2024-04-05 03:50:51'),
(198, 'default', 'added', 87, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":44500}}', NULL, '2024-04-05 03:55:51', '2024-04-05 03:55:51'),
(199, 'default', 'added', 88, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":31000}}', NULL, '2024-04-05 03:59:45', '2024-04-05 03:59:45'),
(200, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-05 10:15:43', '2024-04-05 10:15:43'),
(201, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-05 21:22:38', '2024-04-05 21:22:38'),
(202, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-07 00:21:14', '2024-04-07 00:21:14'),
(203, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-07 14:03:22', '2024-04-07 14:03:22'),
(204, 'default', 'added', 19, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-07 14:06:27', '2024-04-07 14:06:27'),
(205, 'default', 'added', 89, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":155400}}', NULL, '2024-04-07 14:14:04', '2024-04-07 14:14:04'),
(206, 'default', 'added', 90, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":65700}}', NULL, '2024-04-07 14:24:59', '2024-04-07 14:24:59'),
(207, 'default', 'edited', 89, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":155400},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"155400.0000\"}}', NULL, '2024-04-07 14:31:53', '2024-04-07 14:31:53'),
(208, 'default', 'added', 91, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":159120}}', NULL, '2024-04-07 16:38:48', '2024-04-07 16:38:48'),
(209, 'default', 'added', 92, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":33150}}', NULL, '2024-04-07 16:43:28', '2024-04-07 16:43:28'),
(210, 'default', 'added', 20, 'App\\Contact', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-07 16:49:15', '2024-04-07 16:49:15'),
(211, 'default', 'added', 93, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":184800}}', NULL, '2024-04-07 16:49:51', '2024-04-07 16:49:51'),
(212, 'default', 'added', 94, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":69000}}', NULL, '2024-04-07 18:02:47', '2024-04-07 18:02:47'),
(213, 'default', 'added', 95, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":90000}}', NULL, '2024-04-07 18:07:03', '2024-04-07 18:07:03'),
(214, 'default', 'added', 96, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":127500}}', NULL, '2024-04-07 19:01:10', '2024-04-07 19:01:10'),
(215, 'default', 'added', 97, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":89100}}', NULL, '2024-04-07 19:12:55', '2024-04-07 19:12:55'),
(216, 'default', 'added', 98, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":54000}}', NULL, '2024-04-07 19:17:25', '2024-04-07 19:17:25'),
(217, 'default', 'added', 99, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":5280}}', NULL, '2024-04-07 19:20:57', '2024-04-07 19:20:57'),
(218, 'default', 'added', 100, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":40500}}', NULL, '2024-04-07 19:26:41', '2024-04-07 19:26:41'),
(219, 'default', 'added', 101, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":63480}}', NULL, '2024-04-07 19:32:42', '2024-04-07 19:32:42'),
(220, 'default', 'added', 102, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":42300}}', NULL, '2024-04-07 19:36:55', '2024-04-07 19:36:55'),
(221, 'default', 'added', 103, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":35250}}', NULL, '2024-04-07 19:40:07', '2024-04-07 19:40:07'),
(222, 'default', 'added', 104, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":54000}}', NULL, '2024-04-07 19:44:49', '2024-04-07 19:44:49'),
(223, 'default', 'added', 105, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":69840}}', NULL, '2024-04-07 19:52:20', '2024-04-07 19:52:20'),
(224, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-04-07 23:07:36', '2024-04-07 23:07:36'),
(225, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-04-07 23:23:29', '2024-04-07 23:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 11:13:44', '2017-12-18 11:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 11:04:39', '2017-12-18 11:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 10:55:40', '2017-12-18 10:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 10:58:40', '2017-12-18 10:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 10:51:10', '2017-12-18 10:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 10:51:10', '2017-12-18 10:51:10'),
(7, '50*25', NULL, 1.9000, 0.9000, 3.9000, 0.0000, 0.0000, 0.0000, 0.0100, 0.0100, 2, 1, 1, 28, 1, '2024-03-30 19:25:06', '2024-03-31 15:15:24');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) NOT NULL,
  `booking_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Looker', NULL, 3, NULL, '2024-03-31 14:21:23', '2024-03-31 14:21:23'),
(2, 1, 'High-Toned', 'HT', 3, NULL, '2024-03-31 17:57:53', '2024-03-31 17:57:53'),
(3, 1, 'Comfy-White', NULL, 3, NULL, '2024-03-31 18:22:51', '2024-03-31 18:22:51'),
(4, 1, 'Vest-Comfy/Col', NULL, 3, NULL, '2024-03-31 18:48:30', '2024-03-31 18:48:30'),
(5, 1, 'Saree-Skirt-N', NULL, 3, NULL, '2024-03-31 19:09:24', '2024-03-31 19:09:24'),
(6, 1, 'Under wear-comfy-VC', NULL, 3, NULL, '2024-03-31 19:38:26', '2024-03-31 19:38:26'),
(7, 1, 'Under Wear-Comfy-VC-M,L,XL', NULL, 3, NULL, '2024-03-31 19:43:22', '2024-03-31 19:43:22'),
(8, 1, 'Bra-Cup-02', NULL, 3, NULL, '2024-03-31 19:54:46', '2024-03-31 19:54:46'),
(9, 1, 'Nandu', NULL, 3, NULL, '2024-03-31 20:02:42', '2024-03-31 20:02:42'),
(10, 1, 'KIBS', NULL, 3, NULL, '2024-03-31 20:05:24', '2024-03-31 20:05:24'),
(11, 1, 'Opulent', NULL, 3, NULL, '2024-03-31 20:33:16', '2024-03-31 20:33:16'),
(12, 1, 'Vest-Sleev', NULL, 3, NULL, '2024-03-31 20:47:48', '2024-03-31 20:47:48'),
(13, 1, 'Batic', NULL, 3, NULL, '2024-03-31 21:32:34', '2024-03-31 21:32:34'),
(14, 1, 'Under wear-comfy-Boxer', NULL, 3, NULL, '2024-04-02 00:03:14', '2024-04-02 00:03:14'),
(15, 1, 'Under wear-comfy-Boxer', NULL, 3, NULL, '2024-04-02 00:06:04', '2024-04-02 00:06:04'),
(16, 1, 'Veddy-Kattigo & Ottigo-Copper', NULL, 3, NULL, '2024-04-02 00:12:57', '2024-04-02 00:12:57'),
(17, 1, 'Veddy-Kattigo & Ottigo-Silver', NULL, 3, NULL, '2024-04-02 00:18:01', '2024-04-02 00:18:01'),
(18, 1, 'Veddy-Copper & Gold', NULL, 3, NULL, '2024-04-02 00:27:44', '2024-04-02 00:27:44'),
(19, 1, 'Veddy-8X4-VIP', NULL, 3, NULL, '2024-04-02 23:22:00', '2024-04-02 23:22:00'),
(20, 1, 'Veddy-Rainbow-8X4', NULL, 3, NULL, '2024-04-02 23:30:28', '2024-04-02 23:30:28'),
(21, 1, 'Veddy-Elite-8X4', NULL, 3, NULL, '2024-04-02 23:33:27', '2024-04-02 23:33:27'),
(22, 1, 'Salwai-Paddu-01', NULL, 3, NULL, '2024-04-02 23:43:40', '2024-04-02 23:43:40'),
(23, 1, 'Salwai-Oswal', NULL, 3, NULL, '2024-04-02 23:54:52', '2024-04-02 23:54:52'),
(24, 1, 'Salwai-Kashmiri', NULL, 3, NULL, '2024-04-02 23:59:12', '2024-04-02 23:59:12'),
(25, 1, 'Veddy-Cotton-9X5', NULL, 3, NULL, '2024-04-03 00:10:56', '2024-04-03 00:10:56'),
(26, 1, 'Saree-Copper-Bro', NULL, 3, NULL, '2024-04-03 00:15:53', '2024-04-03 00:15:53'),
(27, 1, 'Saree-Preksha', NULL, 3, NULL, '2024-04-03 00:23:34', '2024-04-03 00:23:34'),
(28, 1, 'Saree-Cotton-N', NULL, 3, NULL, '2024-04-03 00:33:09', '2024-04-03 00:33:09'),
(29, 1, 'Saree-Cotton-Box', NULL, 3, NULL, '2024-04-03 00:38:26', '2024-04-03 00:38:26'),
(30, 1, 'Saree-Cotton-N2', NULL, 3, NULL, '2024-04-03 00:46:57', '2024-04-03 00:46:57'),
(31, 1, 'Veddy-Chakaravarthi', NULL, 3, NULL, '2024-04-03 01:17:47', '2024-04-03 01:17:47'),
(32, 1, 'Saree-Roolex Pudda', NULL, 3, NULL, '2024-04-03 01:20:47', '2024-04-03 01:20:47'),
(33, 1, 'Saree-Mangalayogam', NULL, 3, NULL, '2024-04-03 01:23:46', '2024-04-03 01:23:46'),
(34, 1, 'Veddy-Mangalayogam', NULL, 3, NULL, '2024-04-03 01:24:26', '2024-04-03 01:24:26'),
(35, 1, 'Veddy-Murugar', NULL, 3, NULL, '2024-04-03 01:31:00', '2024-04-03 01:31:00'),
(36, 1, 'Saree-SNP-307', NULL, 3, NULL, '2024-04-03 01:35:06', '2024-04-03 01:35:06'),
(37, 1, 'Saree-Nikita', NULL, 3, NULL, '2024-04-03 01:38:43', '2024-04-03 01:38:43'),
(38, 1, 'Saree-Pattu', NULL, 3, NULL, '2024-04-03 01:50:26', '2024-04-03 01:50:26'),
(39, 1, 'Saree-Sofety-Digital', NULL, 3, NULL, '2024-04-03 01:56:18', '2024-04-03 01:56:18'),
(40, 1, 'Viscose-Batik-Print', NULL, 3, NULL, '2024-04-05 02:20:14', '2024-04-05 02:20:14'),
(41, 1, 'Batik-Ganesh-Full', NULL, 3, NULL, '2024-04-05 03:05:27', '2024-04-05 03:05:27'),
(42, 1, 'Batik-Ganesh-Half', NULL, 3, NULL, '2024-04-05 03:09:27', '2024-04-05 03:09:27'),
(43, 1, 'Batik-Ganesh-Aline', NULL, 3, NULL, '2024-04-05 03:13:55', '2024-04-05 03:13:55'),
(44, 1, 'Saree-Cotton-Checks', NULL, 3, NULL, '2024-04-05 03:18:44', '2024-04-05 03:18:44'),
(45, 1, 'Saree-Cotton-EE Checks', NULL, 3, NULL, '2024-04-05 03:23:17', '2024-04-05 03:23:17'),
(46, 1, 'Saree-Coton-GolEye', NULL, 3, NULL, '2024-04-05 03:26:25', '2024-04-05 03:26:25'),
(47, 1, 'Saree-Voil', NULL, 3, NULL, '2024-04-05 03:37:42', '2024-04-05 03:37:42'),
(48, 1, 'Saree-Voil-IA', NULL, 3, NULL, '2024-04-05 03:38:37', '2024-04-05 03:38:37'),
(49, 1, 'Saree-Voil-IE', NULL, 3, NULL, '2024-04-05 03:39:10', '2024-04-05 03:39:10'),
(50, 1, 'Viscose-Frocks-IA', NULL, 3, NULL, '2024-04-05 03:45:16', '2024-04-05 03:45:16'),
(51, 1, 'Viscose-Frocks-IT', NULL, 3, NULL, '2024-04-05 03:46:08', '2024-04-05 03:46:08'),
(52, 1, 'Frocks-VI', NULL, 3, NULL, '2024-04-05 03:49:57', '2024-04-05 03:49:57'),
(53, 1, 'Shirt-Upulent-Half-IA', NULL, 3, NULL, '2024-04-05 03:54:35', '2024-04-05 03:54:35'),
(54, 1, 'Jeans-Denim-IA', NULL, 3, NULL, '2024-04-05 03:58:22', '2024-04-05 03:58:22'),
(55, 1, 'Shirt-Leegance-LS-AY', NULL, 3, NULL, '2024-04-07 14:05:47', '2024-04-07 14:05:47'),
(56, 1, 'Shirt-Leegance-HF-GX', NULL, 3, NULL, '2024-04-07 14:20:43', '2024-04-07 14:20:43'),
(57, 1, 'Saree-Royal-Touch-VA', NULL, 3, NULL, '2024-04-07 16:37:58', '2024-04-07 16:37:58'),
(58, 1, 'Saree-Maya-SPL-IA', NULL, 3, NULL, '2024-04-07 16:42:26', '2024-04-07 16:42:26'),
(59, 1, 'Jeans-Best-Cotton-NT', NULL, 3, NULL, '2024-04-07 16:48:45', '2024-04-07 16:48:45'),
(60, 1, 'Jeans-Police-IA', NULL, 3, NULL, '2024-04-07 17:59:49', '2024-04-07 17:59:49'),
(61, 1, 'Jeans-Police-IA', NULL, 3, NULL, '2024-04-07 18:01:31', '2024-04-07 18:01:31'),
(62, 1, 'Saree-Arrthi-NE', NULL, 3, NULL, '2024-04-07 18:05:47', '2024-04-07 18:05:47'),
(63, 1, 'Shorts-Beach Wear-IS', NULL, 3, NULL, '2024-04-07 19:00:29', '2024-04-07 19:00:29'),
(64, 1, 'Saree-S37V-GZYZS', NULL, 3, NULL, '2024-04-07 19:11:07', '2024-04-07 19:11:07'),
(65, 1, 'Saree-7002A-NAYZS', NULL, 3, NULL, '2024-04-07 19:15:18', '2024-04-07 19:15:18'),
(66, 1, 'Saree-7030-AIEYS', NULL, 3, NULL, '2024-04-07 19:20:19', '2024-04-07 19:20:19'),
(67, 1, 'Saree-7002-NAYZS', NULL, 3, NULL, '2024-04-07 19:22:27', '2024-04-07 19:22:27'),
(68, 1, 'Saree-7002V-NAYZS', NULL, 3, NULL, '2024-04-07 19:24:58', '2024-04-07 19:24:58'),
(69, 1, 'Saree-SP7004PK-VYATYS', NULL, 3, NULL, '2024-04-07 19:31:50', '2024-04-07 19:31:50'),
(70, 1, 'Saree-Rich-Pallu-TYAYS', NULL, 3, NULL, '2024-04-07 19:35:28', '2024-04-07 19:35:28'),
(71, 1, 'Saree-Rich-Pallu-TYAYS', NULL, 3, NULL, '2024-04-07 19:39:20', '2024-04-07 19:39:20'),
(72, 1, 'Saree-Digital-Print-NAYZS', NULL, 3, NULL, '2024-04-07 19:44:00', '2024-04-07 19:44:00'),
(73, 1, 'Saree-Suma-AEIYS', NULL, 3, NULL, '2024-04-07 19:46:33', '2024-04-07 19:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) DEFAULT NULL,
  `tax_label_1` varchar(10) DEFAULT NULL,
  `tax_number_2` varchar(100) DEFAULT NULL,
  `tax_label_2` varchar(10) DEFAULT NULL,
  `code_label_1` varchar(191) DEFAULT NULL,
  `code_1` varchar(191) DEFAULT NULL,
  `code_label_2` varchar(191) DEFAULT NULL,
  `code_2` varchar(191) DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') NOT NULL DEFAULT 'includes',
  `logo` varchar(191) DEFAULT NULL,
  `sku_prefix` varchar(191) DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text DEFAULT NULL,
  `pos_settings` text DEFAULT NULL,
  `weighing_scale_setting` text NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') NOT NULL DEFAULT 'before',
  `enabled_modules` text DEFAULT NULL,
  `date_format` varchar(191) NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') NOT NULL DEFAULT '24',
  `currency_precision` tinyint(4) NOT NULL DEFAULT 2,
  `quantity_precision` tinyint(4) NOT NULL DEFAULT 2,
  `ref_no_prefixes` text DEFAULT NULL,
  `theme_color` char(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text DEFAULT NULL,
  `sms_settings` text DEFAULT NULL,
  `custom_labels` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `currency_precision`, `quantity_precision`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Vinayakar Pudavai Akam', 111, '2024-03-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Kolkata', 1, 'fifo', 0.00, 'includes', NULL, 'vpa-', 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"disable_draft\":\"1\",\"disable_express_checkout\":\"1\",\"disable_suspend\":\"1\",\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'd/m/Y', '24', 2, 2, '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null,\"custom_field_11\":null,\"custom_field_12\":null,\"custom_field_13\":null,\"custom_field_14\":null,\"custom_field_15\":null,\"custom_field_16\":null,\"custom_field_17\":null,\"custom_field_18\":null,\"custom_field_19\":null,\"custom_field_20\":null},\"product_cf_details\":{\"1\":{\"type\":null,\"dropdown_options\":null},\"2\":{\"type\":null,\"dropdown_options\":null},\"3\":{\"type\":null,\"dropdown_options\":null},\"4\":{\"type\":null,\"dropdown_options\":null},\"5\":{\"type\":null,\"dropdown_options\":null},\"6\":{\"type\":null,\"dropdown_options\":null},\"7\":{\"type\":null,\"dropdown_options\":null},\"8\":{\"type\":null,\"dropdown_options\":null},\"9\":{\"type\":null,\"dropdown_options\":null},\"10\":{\"type\":null,\"dropdown_options\":null},\"11\":{\"type\":null,\"dropdown_options\":null},\"12\":{\"type\":null,\"dropdown_options\":null},\"13\":{\"type\":null,\"dropdown_options\":null},\"14\":{\"type\":null,\"dropdown_options\":null},\"15\":{\"type\":null,\"dropdown_options\":null},\"16\":{\"type\":null,\"dropdown_options\":null},\"17\":{\"type\":null,\"dropdown_options\":null},\"18\":{\"type\":null,\"dropdown_options\":null},\"19\":{\"type\":null,\"dropdown_options\":null},\"20\":{\"type\":null,\"dropdown_options\":null}},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2024-03-29 11:15:48', '2024-04-07 19:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `landmark` text DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` char(7) NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_scheme_id` int(11) DEFAULT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `featured_products` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `sale_invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'Vinayakar Pudavai Akam', 'Jaffna', 'Sri Lanka', 'Northern', 'No 31, Muneeswaran Road, Jaffna', '40000', 1, 1, 1, 1, NULL, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"},\"custom_pay_4\":{\"is_enabled\":\"1\"},\"custom_pay_5\":{\"is_enabled\":\"1\"},\"custom_pay_6\":{\"is_enabled\":\"1\"},\"custom_pay_7\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2024-03-29 11:15:48', '2024-03-31 14:29:05'),
(2, 1, 'BL0002', 'Vinayakar tex 2', NULL, 'srilanka', 'northern', 'No 31, Muneeswaran Road, Jaffna', '40000', 1, 1, 1, 1, NULL, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"},\"custom_pay_4\":{\"is_enabled\":\"1\"},\"custom_pay_5\":{\"is_enabled\":\"1\"},\"custom_pay_6\":{\"is_enabled\":\"1\"},\"custom_pay_7\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2024-03-30 19:05:52', '2024-03-31 14:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `cash_denominations`
--

CREATE TABLE `cash_denominations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `total_count` int(11) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `denominations` text DEFAULT NULL,
  `closing_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-03-30 00:14:00', '2024-03-30 00:14:00'),
(2, 1, 1, 2, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-03-30 00:17:00', '2024-03-30 00:17:05'),
(3, 1, 1, 3, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-03-31 14:23:00', '2024-03-31 14:23:12'),
(4, 1, 2, 4, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-03-31 15:02:00', '2024-03-31 15:02:39');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) DEFAULT NULL,
  `type` enum('debit','credit') NOT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 100.0000, 'cash', 'credit', 'initial', NULL, '2024-03-30 00:14:00', '2024-03-30 00:14:00'),
(2, 2, 100.0000, 'cash', 'credit', 'initial', NULL, '2024-03-30 00:17:05', '2024-03-30 00:17:05'),
(7, 3, 1000.0000, 'cash', 'credit', 'initial', NULL, '2024-03-31 14:23:12', '2024-03-31 14:23:12'),
(11, 4, 1000.0000, 'cash', 'credit', 'initial', NULL, '2024-03-31 15:02:39', '2024-03-31 15:02:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `contact_type` varchar(191) DEFAULT NULL,
  `supplier_business_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `middle_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_id` varchar(191) DEFAULT NULL,
  `contact_status` varchar(191) NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `landline` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `shipping_custom_field_details` longtext DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) DEFAULT NULL,
  `export_custom_field_2` varchar(191) DEFAULT NULL,
  `export_custom_field_3` varchar(191) DEFAULT NULL,
  `export_custom_field_4` varchar(191) DEFAULT NULL,
  `export_custom_field_5` varchar(191) DEFAULT NULL,
  `export_custom_field_6` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `custom_field5` varchar(191) DEFAULT NULL,
  `custom_field6` varchar(191) DEFAULT NULL,
  `custom_field7` varchar(191) DEFAULT NULL,
  `custom_field8` varchar(191) DEFAULT NULL,
  `custom_field9` varchar(191) DEFAULT NULL,
  `custom_field10` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `contact_type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 1, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(2, 1, 'supplier', 'business', 'Upul', '', NULL, NULL, NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '52423453', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-30 19:09:18', '2024-03-30 19:09:18'),
(3, 1, 'supplier', 'business', 'Upul', '', NULL, NULL, NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 15:29:49', '2024-03-31 15:29:49'),
(4, 1, 'supplier', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'Upul-1', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '02', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 16:39:12', '2024-03-31 16:39:12'),
(5, 1, 'supplier', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'Upple-03', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 17:11:55', '2024-03-31 17:11:55'),
(6, 1, 'supplier', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'upple-3', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '02', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 17:16:09', '2024-03-31 17:16:09'),
(7, 1, 'supplier', 'business', NULL, '', NULL, NULL, NULL, NULL, NULL, 'Upple', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '02', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 17:19:03', '2024-03-31 17:19:03'),
(8, 1, 'supplier', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'upple-04', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 17:20:47', '2024-03-31 17:20:47'),
(9, 1, 'supplier', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'New Winner', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '778018974', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 18:33:41', '2024-03-31 18:33:41'),
(10, 1, 'supplier', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'Classic Terx', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2473132', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 20:17:00', '2024-03-31 20:17:00'),
(11, 1, 'supplier', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'New Winne', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '758009495', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 21:38:33', '2024-03-31 21:38:33'),
(12, 1, 'supplier', 'business', 'New Winner', '', NULL, NULL, NULL, NULL, NULL, 'New Winner1', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '758009495', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 21:43:09', '2024-03-31 21:43:09'),
(13, 1, 'supplier', 'business', 'Classic Tex (pvt) Ltd', '', NULL, NULL, NULL, NULL, NULL, 'Classic', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2431197', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 21:46:27', '2024-03-31 21:46:27'),
(14, 1, 'supplier', 'business', 'Sai Tex', '', NULL, NULL, NULL, NULL, NULL, 'Sai Tex', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '773753790', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 21:48:49', '2024-03-31 21:48:49'),
(15, 1, 'supplier', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'LS', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:18:47', '2024-04-03 00:18:47'),
(16, 1, 'supplier', 'business', 'LS', '', NULL, NULL, NULL, NULL, NULL, 'CO0016', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '02', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:30:20', '2024-04-03 00:30:20'),
(17, 1, 'supplier', 'business', 'Raj Tex', '', NULL, NULL, NULL, NULL, NULL, '22', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 02:22:25', '2024-04-05 02:22:25'),
(18, 1, 'supplier', 'business', 'Maha Mantra', '', NULL, NULL, NULL, NULL, NULL, '33', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '35', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:19:51', '2024-04-05 03:19:51'),
(19, 1, 'supplier', 'business', 'Vikines', '', NULL, NULL, NULL, NULL, NULL, '45', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 14:06:27', '2024-04-07 14:06:27'),
(20, 1, 'supplier', 'business', 'Kani', '', NULL, NULL, NULL, NULL, NULL, '52', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '52', NULL, NULL, NULL, NULL, NULL, 3, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 16:49:15', '2024-04-07 16:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `code` varchar(25) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `thousand_separator` varchar(10) NOT NULL,
  `decimal_separator` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `configuration` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) NOT NULL,
  `heading` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `header_text` text DEFAULT NULL,
  `invoice_no_prefix` varchar(191) DEFAULT NULL,
  `quotation_no_prefix` varchar(191) DEFAULT NULL,
  `invoice_heading` varchar(191) DEFAULT NULL,
  `sub_heading_line1` varchar(191) DEFAULT NULL,
  `sub_heading_line2` varchar(191) DEFAULT NULL,
  `sub_heading_line3` varchar(191) DEFAULT NULL,
  `sub_heading_line4` varchar(191) DEFAULT NULL,
  `sub_heading_line5` varchar(191) DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) DEFAULT NULL,
  `invoice_heading_paid` varchar(191) DEFAULT NULL,
  `quotation_heading` varchar(191) DEFAULT NULL,
  `sub_total_label` varchar(191) DEFAULT NULL,
  `discount_label` varchar(191) DEFAULT NULL,
  `tax_label` varchar(191) DEFAULT NULL,
  `total_label` varchar(191) DEFAULT NULL,
  `round_off_label` varchar(191) DEFAULT NULL,
  `total_due_label` varchar(191) DEFAULT NULL,
  `paid_label` varchar(191) DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) DEFAULT NULL,
  `client_tax_label` varchar(191) DEFAULT NULL,
  `date_label` varchar(191) DEFAULT NULL,
  `date_time_format` varchar(191) DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) DEFAULT NULL,
  `table_qty_label` varchar(191) DEFAULT NULL,
  `table_unit_price_label` varchar(191) DEFAULT NULL,
  `table_subtotal_label` varchar(191) DEFAULT NULL,
  `cat_code_label` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) DEFAULT NULL,
  `commission_agent_label` varchar(191) DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `module_info` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_letter_head` tinyint(1) NOT NULL DEFAULT 0,
  `letter_head` varchar(191) DEFAULT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text DEFAULT NULL,
  `design` varchar(190) DEFAULT 'classic',
  `cn_heading` varchar(191) DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) DEFAULT NULL,
  `cn_amount_label` varchar(191) DEFAULT NULL,
  `table_tax_headings` text DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) DEFAULT NULL,
  `change_return_label` varchar(191) DEFAULT NULL,
  `product_custom_fields` text DEFAULT NULL,
  `contact_custom_fields` text DEFAULT NULL,
  `location_custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_letter_head`, `letter_head`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 0, 0, 0, 0, 0, NULL, 1, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, '1711861304_b130e04a65d3720b9cac42f2304d32eb-transformed.jpeg', 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '<p style=\"text-align: center;\"><span style=\"font-size: 8pt;\">நன்றி மீண்டும் வருக | வாழ்க வளமுடன்!&nbsp;</span><br /><span style=\"font-size: 8pt; margin-bottom: -5px;\">விற்ற பொருட்கள் திரும்பப் பெறப்படமாட்டாது.</span></p>\r\n<hr style=\"margin: -5px 0 -1px;\" />\r\n<p style=\"text-align: center; margin-bottom: 50px;\"><span style=\"font-size: 8pt; font-family: \'comic sans ms\', sans-serif;\">Software by : AppleTech | 0717771346</span></p>\r\n<p style=\"text-align: center; margin-top: 5 !important;\">.</p>\r\n<p style=\"text-align: center; margin-top: 5 !important;\">&nbsp;</p>\r\n<p style=\"text-align: center; margin-top: 5 !important;\">&nbsp;</p>\r\n<p style=\"text-align: center; margin-top: 5 !important;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, '{\"proforma_heading\":null,\"sales_order_heading\":null,\"due_date_label\":null,\"total_quantity_label\":null,\"item_discount_label\":null,\"discounted_unit_price_label\":null,\"total_items_label\":null,\"num_to_word_format\":\"international\",\"tax_summary_label\":null}', 1, 1, 0, NULL, 0, NULL, 'slim', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-03-29 11:15:48', '2024-04-02 01:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `scheme_type` enum('blank','year') NOT NULL,
  `number_type` varchar(100) NOT NULL DEFAULT 'sequential',
  `prefix` varchar(191) DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `number_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'year', 'sequential', 'VT_', 1, 8, 4, 1, '2024-03-29 11:15:48', '2024-04-02 00:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_media_type` varchar(191) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_06_27_185405_create_packages_table', 1),
(116, '2018_06_28_182803_create_subscriptions_table', 1),
(117, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(118, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(119, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(120, '2018_07_17_182021_add_rows_to_system_table', 1),
(121, '2018_07_19_131721_add_options_to_packages_table', 1),
(122, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(123, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(124, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(125, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(126, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(127, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(128, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(129, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(130, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(131, '2018_08_17_155534_add_min_termination_alert_days', 1),
(132, '2018_08_28_105945_add_business_based_username_settings_to_system_table', 1),
(133, '2018_08_30_105906_add_superadmin_communicator_logs_table', 1),
(134, '2018_09_04_155900_create_accounts_table', 1),
(135, '2018_09_06_114438_create_selling_price_groups_table', 1),
(136, '2018_09_06_154057_create_variation_group_prices_table', 1),
(137, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(138, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(139, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(140, '2018_09_10_152703_create_account_transactions_table', 1),
(141, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(142, '2018_09_19_123914_create_notification_templates_table', 1),
(143, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(144, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(145, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(146, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(147, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(148, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(149, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(150, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(151, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(152, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(153, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(154, '2018_10_22_134428_modify_variable_product_data', 1),
(155, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(156, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(157, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(158, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(159, '2018_10_31_175627_add_user_contact_access', 1),
(160, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(161, '2018_11_02_130636_add_custom_permissions_to_packages_table', 1),
(162, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(163, '2018_11_05_161848_add_more_fields_to_packages_table', 1),
(164, '2018_11_08_105621_add_role_permissions', 1),
(165, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(166, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(167, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(168, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(169, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(170, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(171, '2018_12_10_124621_modify_system_table_values_null_default', 1),
(172, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(173, '2018_12_14_103307_modify_system_table', 1),
(174, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(175, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(176, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(177, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(178, '2018_12_24_154933_create_notifications_table', 1),
(179, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(180, '2019_01_10_124645_add_account_permission', 1),
(181, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(182, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(183, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(184, '2019_02_19_103118_create_discounts_table', 1),
(185, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(186, '2019_02_21_134324_add_permission_for_discount', 1),
(187, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(188, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(189, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(190, '2019_03_12_120336_create_activity_log_table', 1),
(191, '2019_03_15_132925_create_media_table', 1),
(192, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(193, '2019_05_10_132311_add_missing_column_indexing', 1),
(194, '2019_05_10_135434_add_missing_database_column_indexes', 1),
(195, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(196, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(197, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(198, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(199, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(200, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(201, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(202, '2019_07_15_165136_add_fields_for_combo_product', 1),
(203, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(204, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(205, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(206, '2019_08_08_162302_add_sub_units_related_fields', 1),
(207, '2019_08_16_115300_create_superadmin_frontend_pages_table', 1),
(208, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(209, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(210, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(211, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(212, '2019_09_04_184008_create_types_of_services_table', 1),
(213, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(214, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(215, '2019_09_12_105616_create_product_locations_table', 1),
(216, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(217, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(218, '2019_09_19_170927_close_all_active_registers', 1),
(219, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(220, '2019_10_18_155633_create_account_types_table', 1),
(221, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(222, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(223, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(224, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(225, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(226, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(227, '2019_12_02_105025_create_warranties_table', 1),
(228, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(229, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(230, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(231, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(232, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(233, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(234, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(235, '2020_01_08_133506_create_document_and_notes_table', 1),
(236, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(237, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(238, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(239, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(240, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(241, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(242, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(243, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(244, '2020_04_15_151802_add_user_type_to_users_table', 1),
(245, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(246, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(247, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(248, '2020_06_12_162245_modify_contacts_table', 1),
(249, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(250, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(251, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(252, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(253, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(254, '2020_09_22_121639_create_discount_variations_table', 1),
(255, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(256, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(257, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(258, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(259, '2020_11_10_152841_add_cash_register_permissions', 1),
(260, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(261, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(262, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(263, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(264, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(265, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(266, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(267, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(268, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(269, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1),
(270, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1),
(271, '2021_03_11_120229_add_sales_order_columns', 1),
(272, '2021_03_16_120705_add_business_id_to_activity_log_table', 1),
(273, '2021_03_16_153427_add_code_columns_to_business_table', 1),
(274, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1),
(275, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1),
(276, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1),
(277, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1),
(278, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1),
(279, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1),
(280, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1),
(281, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1),
(282, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1),
(283, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1),
(284, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1),
(285, '2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table', 1),
(286, '2021_09_01_063110_add_spg_column_to_discounts_table', 1),
(287, '2021_09_03_061528_modify_cash_register_transactions_table', 1),
(288, '2021_10_05_061658_add_source_column_to_transactions_table', 1),
(289, '2021_12_16_121851_add_parent_id_column_to_expense_categories_table', 1),
(290, '2022_04_14_075120_add_payment_type_column_to_transaction_payments_table', 1),
(291, '2022_04_21_083327_create_cash_denominations_table', 1),
(292, '2022_05_10_055307_add_delivery_date_column_to_transactions_table', 1),
(293, '2022_06_13_123135_add_currency_precision_and_quantity_precision_fields_to_business_table', 1),
(294, '2022_06_28_133342_add_secondary_unit_columns_to_products_sell_line_purchase_lines_tables', 1),
(295, '2022_07_13_114307_create_purchase_requisition_related_columns', 1),
(296, '2022_08_25_132707_add_service_staff_timer_fields_to_products_and_users_table', 1),
(297, '2023_01_28_114255_add_letter_head_column_to_invoice_layouts_table', 1),
(298, '2023_02_11_161510_add_event_column_to_activity_log_table', 1),
(299, '2023_02_11_161511_add_batch_uuid_column_to_activity_log_table', 1),
(300, '2023_03_02_170312_add_provider_to_oauth_clients_table', 1),
(301, '2023_03_21_122731_add_sale_invoice_scheme_id_business_table', 1),
(302, '2023_03_21_170446_add_number_type_to_invoice_scheme', 1),
(303, '2023_04_17_155216_add_custom_fields_to_products', 1),
(304, '2023_04_28_130247_add_price_type_to_group_price_table', 1),
(305, '2023_06_21_033923_add_delivery_person_in_transactions', 1),
(306, '2023_09_13_153555_add_service_staff_pin_columns_in_users', 1),
(307, '2023_09_15_154404_add_is_kitchen_order_in_transactions', 1),
(308, '2023_12_06_152840_add_contact_type_in_contacts', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(80, 'App\\User', 3),
(82, 'App\\User', 2),
(82, 'App\\User', 3),
(125, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 3),
(3, 'App\\User', 2),
(3, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `whatsapp_text` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  `bcc` varchar(191) DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(10, 1, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `location_count` int(11) NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable bookings',
  `kitchen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable tables',
  `invoice_count` int(11) NOT NULL,
  `interval` enum('days','months','years') NOT NULL,
  `interval_count` int(11) NOT NULL,
  `trial_days` int(11) NOT NULL,
  `price` decimal(22,4) NOT NULL,
  `custom_permissions` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_one_time` tinyint(1) NOT NULL DEFAULT 0,
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT 0,
  `custom_link` varchar(191) DEFAULT NULL,
  `custom_link_text` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `location_count`, `user_count`, `product_count`, `bookings`, `kitchen`, `order_screen`, `tables`, `invoice_count`, `interval`, `interval_count`, `trial_days`, `price`, `custom_permissions`, `created_by`, `sort_order`, `is_active`, `is_private`, `is_one_time`, `enable_custom_link`, `custom_link`, `custom_link_text`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Unlimited', 'Unlimited', 0, 0, 0, 0, 0, 0, 0, 0, 'years', 1, 15, 0.0000, '', 1, 1, 1, 0, 0, 0, '', '', NULL, '2024-03-29 11:17:28', '2024-03-29 11:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2024-03-29 11:13:11', NULL),
(2, 'direct_sell.access', 'web', '2024-03-29 11:13:11', NULL),
(3, 'product.opening_stock', 'web', '2024-03-29 11:13:12', '2024-03-29 11:13:12'),
(4, 'crud_all_bookings', 'web', '2024-03-29 11:13:12', '2024-03-29 11:13:12'),
(5, 'crud_own_bookings', 'web', '2024-03-29 11:13:12', '2024-03-29 11:13:12'),
(6, 'access_default_selling_price', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(7, 'purchase.payments', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(8, 'sell.payments', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(9, 'edit_product_price_from_sale_screen', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(11, 'roles.view', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(12, 'roles.create', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(13, 'roles.update', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(14, 'roles.delete', 'web', '2024-03-29 11:13:13', '2024-03-29 11:13:13'),
(15, 'account.access', 'web', '2024-03-29 11:13:14', '2024-03-29 11:13:14'),
(16, 'discount.access', 'web', '2024-03-29 11:13:14', '2024-03-29 11:13:14'),
(17, 'view_purchase_price', 'web', '2024-03-29 11:13:14', '2024-03-29 11:13:14'),
(18, 'view_own_sell_only', 'web', '2024-03-29 11:13:14', '2024-03-29 11:13:14'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2024-03-29 11:13:15', '2024-03-29 11:13:15'),
(20, 'edit_product_price_from_pos_screen', 'web', '2024-03-29 11:13:15', '2024-03-29 11:13:15'),
(21, 'access_shipping', 'web', '2024-03-29 11:13:15', '2024-03-29 11:13:15'),
(22, 'purchase.update_status', 'web', '2024-03-29 11:13:15', '2024-03-29 11:13:15'),
(23, 'list_drafts', 'web', '2024-03-29 11:13:15', '2024-03-29 11:13:15'),
(24, 'list_quotations', 'web', '2024-03-29 11:13:15', '2024-03-29 11:13:15'),
(25, 'view_cash_register', 'web', '2024-03-29 11:13:17', '2024-03-29 11:13:17'),
(26, 'close_cash_register', 'web', '2024-03-29 11:13:17', '2024-03-29 11:13:17'),
(27, 'print_invoice', 'web', '2024-03-29 11:13:18', '2024-03-29 11:13:18'),
(28, 'user.view', 'web', '2024-03-29 11:13:19', NULL),
(29, 'user.create', 'web', '2024-03-29 11:13:19', NULL),
(30, 'user.update', 'web', '2024-03-29 11:13:19', NULL),
(31, 'user.delete', 'web', '2024-03-29 11:13:19', NULL),
(32, 'supplier.view', 'web', '2024-03-29 11:13:19', NULL),
(33, 'supplier.create', 'web', '2024-03-29 11:13:19', NULL),
(34, 'supplier.update', 'web', '2024-03-29 11:13:19', NULL),
(35, 'supplier.delete', 'web', '2024-03-29 11:13:19', NULL),
(36, 'customer.view', 'web', '2024-03-29 11:13:19', NULL),
(37, 'customer.create', 'web', '2024-03-29 11:13:19', NULL),
(38, 'customer.update', 'web', '2024-03-29 11:13:19', NULL),
(39, 'customer.delete', 'web', '2024-03-29 11:13:19', NULL),
(40, 'product.view', 'web', '2024-03-29 11:13:19', NULL),
(41, 'product.create', 'web', '2024-03-29 11:13:19', NULL),
(42, 'product.update', 'web', '2024-03-29 11:13:19', NULL),
(43, 'product.delete', 'web', '2024-03-29 11:13:19', NULL),
(44, 'purchase.view', 'web', '2024-03-29 11:13:19', NULL),
(45, 'purchase.create', 'web', '2024-03-29 11:13:19', NULL),
(46, 'purchase.update', 'web', '2024-03-29 11:13:19', NULL),
(47, 'purchase.delete', 'web', '2024-03-29 11:13:19', NULL),
(48, 'sell.view', 'web', '2024-03-29 11:13:19', NULL),
(49, 'sell.create', 'web', '2024-03-29 11:13:19', NULL),
(50, 'sell.update', 'web', '2024-03-29 11:13:19', NULL),
(51, 'sell.delete', 'web', '2024-03-29 11:13:19', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2024-03-29 11:13:19', NULL),
(53, 'contacts_report.view', 'web', '2024-03-29 11:13:19', NULL),
(54, 'stock_report.view', 'web', '2024-03-29 11:13:19', NULL),
(55, 'tax_report.view', 'web', '2024-03-29 11:13:19', NULL),
(56, 'trending_product_report.view', 'web', '2024-03-29 11:13:19', NULL),
(57, 'register_report.view', 'web', '2024-03-29 11:13:19', NULL),
(58, 'sales_representative.view', 'web', '2024-03-29 11:13:19', NULL),
(59, 'expense_report.view', 'web', '2024-03-29 11:13:19', NULL),
(60, 'business_settings.access', 'web', '2024-03-29 11:13:19', NULL),
(61, 'barcode_settings.access', 'web', '2024-03-29 11:13:19', NULL),
(62, 'invoice_settings.access', 'web', '2024-03-29 11:13:19', NULL),
(63, 'brand.view', 'web', '2024-03-29 11:13:19', NULL),
(64, 'brand.create', 'web', '2024-03-29 11:13:19', NULL),
(65, 'brand.update', 'web', '2024-03-29 11:13:19', NULL),
(66, 'brand.delete', 'web', '2024-03-29 11:13:19', NULL),
(67, 'tax_rate.view', 'web', '2024-03-29 11:13:19', NULL),
(68, 'tax_rate.create', 'web', '2024-03-29 11:13:19', NULL),
(69, 'tax_rate.update', 'web', '2024-03-29 11:13:19', NULL),
(70, 'tax_rate.delete', 'web', '2024-03-29 11:13:19', NULL),
(71, 'unit.view', 'web', '2024-03-29 11:13:19', NULL),
(72, 'unit.create', 'web', '2024-03-29 11:13:19', NULL),
(73, 'unit.update', 'web', '2024-03-29 11:13:19', NULL),
(74, 'unit.delete', 'web', '2024-03-29 11:13:19', NULL),
(75, 'category.view', 'web', '2024-03-29 11:13:19', NULL),
(76, 'category.create', 'web', '2024-03-29 11:13:19', NULL),
(77, 'category.update', 'web', '2024-03-29 11:13:19', NULL),
(78, 'category.delete', 'web', '2024-03-29 11:13:19', NULL),
(79, 'expense.access', 'web', '2024-03-29 11:13:19', NULL),
(80, 'access_all_locations', 'web', '2024-03-29 11:13:19', NULL),
(81, 'dashboard.data', 'web', '2024-03-29 11:13:19', NULL),
(82, 'location.1', 'web', '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(83, 'view_export_buttons', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(84, 'edit_purchase_payment', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(85, 'delete_purchase_payment', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(86, 'edit_pos_payment', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(87, 'disable_pay_checkout', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(88, 'disable_draft', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(89, 'disable_express_checkout', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(90, 'disable_discount', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(91, 'disable_suspend_sale', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(92, 'disable_credit_sale', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(93, 'disable_quotation', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(94, 'disable_card', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(95, 'view_paid_sells_only', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(96, 'view_due_sells_only', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(97, 'view_partial_sells_only', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(98, 'view_overdue_sells_only', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(99, 'direct_sell.update', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(100, 'direct_sell.delete', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(101, 'view_commission_agent_sell', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(102, 'edit_sell_payment', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(103, 'delete_sell_payment', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(104, 'access_sell_return', 'web', '2024-03-29 11:26:41', '2024-03-29 11:26:41'),
(105, 'access_own_sell_return', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(106, 'edit_invoice_number', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(107, 'draft.update', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(108, 'draft.delete', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(109, 'quotation.update', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(110, 'quotation.delete', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(111, 'access_pending_shipments_only', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(112, 'access_commission_agent_shipping', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(113, 'view_product_stock_value', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(114, 'access_printers', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(115, 'expense.add', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(116, 'expense.edit', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(117, 'expense.delete', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(118, 'edit_account_transaction', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(119, 'delete_account_transaction', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(120, 'customer_with_no_sell_one_year', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(121, 'direct_sell.view', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(122, 'draft.view_all', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(123, 'quotation.view_all', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(124, 'all_expense.access', 'web', '2024-03-29 11:26:42', '2024-03-29 11:26:42'),
(125, 'location.2', 'web', '2024-03-30 19:05:52', '2024-03-30 19:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `connection_type` enum('network','windows','linux') NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `secondary_unit_id` int(11) DEFAULT NULL,
  `sub_unit_ids` text DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) DEFAULT NULL,
  `product_custom_field1` varchar(191) DEFAULT NULL,
  `product_custom_field2` varchar(191) DEFAULT NULL,
  `product_custom_field3` varchar(191) DEFAULT NULL,
  `product_custom_field4` varchar(191) DEFAULT NULL,
  `product_custom_field5` varchar(191) DEFAULT NULL,
  `product_custom_field6` varchar(191) DEFAULT NULL,
  `product_custom_field7` varchar(191) DEFAULT NULL,
  `product_custom_field8` varchar(191) DEFAULT NULL,
  `product_custom_field9` varchar(191) DEFAULT NULL,
  `product_custom_field10` varchar(191) DEFAULT NULL,
  `product_custom_field11` varchar(191) DEFAULT NULL,
  `product_custom_field12` varchar(191) DEFAULT NULL,
  `product_custom_field13` varchar(191) DEFAULT NULL,
  `product_custom_field14` varchar(191) DEFAULT NULL,
  `product_custom_field15` varchar(191) DEFAULT NULL,
  `product_custom_field16` varchar(191) DEFAULT NULL,
  `product_custom_field17` varchar(191) DEFAULT NULL,
  `product_custom_field18` varchar(191) DEFAULT NULL,
  `product_custom_field19` varchar(191) DEFAULT NULL,
  `product_custom_field20` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `preparation_time_in_minutes` int(11) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `product_description`, `created_by`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(13, 'Shirt-Looker-LS', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, NULL, 'exclusive', 1, 3.0000, 'vpa-0013', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 16:11:39', '2024-03-31 17:34:23'),
(14, 'Shirt-Looker-L/S', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, NULL, 'exclusive', 1, NULL, 'vpa-0014', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 17:10:49', '2024-03-31 17:23:05'),
(16, 'shirt-High Toned-LS', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, NULL, 'exclusive', 1, 3.0000, 'vpa-0016', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 18:15:07', '2024-03-31 18:15:07'),
(17, 'Vest-Comfy/W', 1, 'single', 1, NULL, NULL, 3, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0017', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 18:30:54', '2024-03-31 18:30:54'),
(19, 'Vest-Comfy/Col', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0019', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 18:52:41', '2024-03-31 18:52:41'),
(21, 'Saree-Skirt-N', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, NULL, 'exclusive', 1, 10.0000, 'vpa-0021', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 19:24:34', '2024-03-31 19:24:34'),
(22, 'Rainbow Batic', 1, 'single', 1, NULL, NULL, 13, NULL, NULL, NULL, 'exclusive', 1, 3.0000, 'vpa-0022', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 19:27:46', '2024-03-31 21:32:41'),
(23, 'Under Wear-Comfy-VC-XXL', 1, 'single', 1, NULL, NULL, 6, NULL, NULL, NULL, 'exclusive', 1, NULL, 'vpa-0023', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 19:42:04', '2024-03-31 19:42:04'),
(24, 'Under wear-comfy-VC', 1, 'single', 1, NULL, NULL, 7, NULL, NULL, NULL, 'exclusive', 1, NULL, 'vpa-0024', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 19:44:00', '2024-03-31 19:44:00'),
(25, 'Bra-Cup-01', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0025', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 19:53:58', '2024-03-31 21:17:06'),
(26, 'Bra-Cup-02', 1, 'single', 1, NULL, NULL, 8, NULL, NULL, NULL, 'exclusive', 1, 3.0000, 'vpa-0026', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 19:55:24', '2024-03-31 21:58:30'),
(28, 'Saram-Nandu', 1, 'single', 1, NULL, NULL, 9, NULL, NULL, NULL, 'exclusive', 1, 3.0000, 'vpa-0028', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 20:03:23', '2024-03-31 20:03:23'),
(29, 'Saram-Kibs-01', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, NULL, 'exclusive', 1, 3.0000, 'vpa-0029', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 20:09:34', '2024-03-31 20:09:34'),
(30, 'Saram-Kibs-02', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, NULL, 'exclusive', 1, 3.0000, 'vpa-0030', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 20:12:02', '2024-03-31 20:12:02'),
(31, 'Shirt-Upulent', 1, 'single', 1, NULL, NULL, 11, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0031', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 20:38:27', '2024-03-31 21:55:40'),
(32, 'Vest-Kibs-Sleev', 1, 'single', 1, NULL, NULL, 12, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0032', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 20:49:01', '2024-03-31 22:13:08'),
(33, 'Bra-Capri', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0033', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 23:04:47', '2024-03-31 23:04:47'),
(34, 'Bra-Haoqingxin', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0034', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 23:12:08', '2024-03-31 23:12:08'),
(35, 'Panties-Comfy', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0035', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 23:17:11', '2024-03-31 23:17:11'),
(36, 'Batik-Frocks-Plane', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0036', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 23:30:28', '2024-03-31 23:31:34'),
(37, 'Batik-Frocks-Plane-XL', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0037', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 23:36:40', '2024-03-31 23:36:40'),
(38, 'Batik-Frocks-Work', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0038', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-03-31 23:43:40', '2024-03-31 23:43:40'),
(40, 'Under-Skirts', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0040', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-01 23:22:24', '2024-04-01 23:22:24'),
(41, 'Towe-27X54', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0041', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-01 23:31:16', '2024-04-01 23:31:16'),
(42, 'towel-30X60', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0042', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-01 23:35:45', '2024-04-01 23:35:45'),
(43, 'towel-30X60-4', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0043', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-01 23:38:49', '2024-04-01 23:40:19'),
(44, 'Towel-30X60 Chines', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0044', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-01 23:43:54', '2024-04-01 23:43:54'),
(45, 'Under wear-comfy-Boxer', 1, 'variable', 1, NULL, NULL, 15, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0045', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-01 23:49:22', '2024-04-02 21:54:33'),
(46, 'Veddy-Kaddigo & Ottigo -Copper', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0046', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 00:13:37', '2024-04-02 00:13:37'),
(47, 'Veddy-Kattigo & Ottigo-Silver', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0047', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 00:19:17', '2024-04-02 00:19:17'),
(48, 'Veddy-Copper & Gold', 1, 'single', 1, NULL, NULL, 18, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0048', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 00:30:56', '2024-04-02 00:30:56'),
(49, 'Veddy-8X4-VIP', 1, 'single', 1, NULL, NULL, 19, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0049', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 23:22:20', '2024-04-02 23:22:20'),
(50, 'Veddy-3.60-VIP', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, 'vpa-0050', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 23:27:10', '2024-04-02 23:27:10'),
(51, 'Veddy-Rainbow-8X4', 1, 'single', 1, NULL, NULL, 20, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0051', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 23:30:50', '2024-04-02 23:30:50'),
(52, 'Veddy-Elite-8X', 1, 'single', 1, NULL, NULL, 21, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0052', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 23:34:06', '2024-04-02 23:34:06'),
(53, 'Salwai-Paddu-01', 1, 'single', 1, NULL, NULL, 22, NULL, NULL, NULL, 'exclusive', 1, 3.0000, 'vpa-0053', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 23:44:38', '2024-04-02 23:44:38'),
(54, 'Salwai-Oswal', 1, 'single', 1, NULL, NULL, 23, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0054', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 23:55:17', '2024-04-02 23:55:17'),
(55, 'Salwai-Kashmiri', 1, 'single', 1, NULL, NULL, 24, NULL, NULL, NULL, 'exclusive', 1, NULL, 'vpa-0055', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-02 23:59:27', '2024-04-03 00:01:02'),
(56, 'Veddy-Cotton-9X5', 1, 'single', 1, NULL, NULL, 25, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0056', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 00:11:29', '2024-04-03 00:12:04'),
(57, 'Saree-Copper-Bro', 1, 'single', 1, NULL, NULL, 26, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0057', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 00:18:01', '2024-04-03 00:18:01'),
(58, 'Saree-Preksha', 1, 'single', 1, NULL, NULL, 27, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 00:25:58', '2024-04-03 00:25:58'),
(59, 'Saree-Cotton-N', 1, 'single', 1, NULL, NULL, 28, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0059', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 00:34:01', '2024-04-03 00:34:01'),
(60, 'Saree-Cotton-Box', 1, 'single', 1, NULL, NULL, 29, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0060', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 00:40:08', '2024-04-03 00:40:08'),
(61, 'Saree-Cotton-N2', 1, 'single', 1, NULL, NULL, 30, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0061', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 00:48:22', '2024-04-03 00:51:59'),
(62, 'Veddy-Chakaravarthi', 1, 'single', 1, NULL, NULL, 31, NULL, NULL, NULL, 'exclusive', 1, NULL, 'vpa-0062', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 01:18:14', '2024-04-03 01:18:14'),
(63, 'Saree-Roolex Pudda', 1, 'single', 1, NULL, NULL, 32, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0063', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 01:21:13', '2024-04-03 01:21:13'),
(64, 'Veddy-Mangalayogam', 1, 'single', 1, NULL, NULL, 34, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0064', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 01:24:49', '2024-04-03 01:24:49'),
(65, 'Veddy-Murugar', 1, 'single', 1, NULL, NULL, 35, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0065', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 01:31:21', '2024-04-03 01:31:21'),
(66, 'Saree-SNP-307', 1, 'single', 1, NULL, NULL, 36, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0066', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 01:35:56', '2024-04-03 01:35:56'),
(67, 'Saree-Nikita', 1, 'single', 1, NULL, NULL, 37, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0067', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 01:41:42', '2024-04-03 01:41:42'),
(68, 'Saree-Pattu', 1, 'single', 1, NULL, NULL, 38, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0068', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 01:53:04', '2024-04-03 01:53:04'),
(69, 'Saree-Sofety-Digital', 1, 'single', 1, NULL, NULL, 39, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0069', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-03 01:58:51', '2024-04-03 01:58:51'),
(70, 'Viscose-Batik-Print', 1, 'single', 1, NULL, NULL, 40, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0070', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 02:21:10', '2024-04-05 02:21:10'),
(71, 'Batik-Ganesh-Full', 1, 'single', 1, NULL, NULL, 41, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0071', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 03:06:04', '2024-04-05 03:06:04'),
(72, 'Batik-Ganesh-Half', 1, 'single', 1, NULL, NULL, 42, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0072', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 03:09:51', '2024-04-05 03:09:51'),
(73, 'Batik-Ganesh-Aline', 1, 'single', 1, NULL, NULL, 43, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0073', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 03:14:17', '2024-04-05 03:14:17'),
(74, 'Saree-Cotton-Checks', 1, 'single', 1, NULL, NULL, 44, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0074', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 03:19:12', '2024-04-05 03:19:12'),
(75, 'Saree-Cotton-EE Checks', 1, 'single', 1, NULL, NULL, 45, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0075', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 03:23:42', '2024-04-05 03:23:42'),
(76, 'Frocks-VI', 1, 'single', 1, NULL, NULL, 52, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0076', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 03:28:34', '2024-04-05 03:50:08'),
(77, 'Shirt-Upulent-Half-IA', 1, 'single', 1, NULL, NULL, 53, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0077', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 03:54:45', '2024-04-05 03:54:45'),
(78, 'Jeans-Denim-IA', 1, 'single', 1, NULL, NULL, 54, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0078', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-05 03:58:28', '2024-04-05 04:05:52'),
(79, 'Shirt-Leegance-LS-AY', 1, 'single', 1, NULL, NULL, 55, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0079', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 14:05:58', '2024-04-07 14:29:47'),
(80, 'Shirt-Leegance-HF-GX', 1, 'single', 1, NULL, NULL, 56, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0080', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 14:20:55', '2024-04-07 14:23:57'),
(81, 'Saree-Royal-Touch-VA', 1, 'single', 1, NULL, NULL, 57, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0081', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 16:38:08', '2024-04-07 16:38:09'),
(82, 'Saree-Maya-SPL-IA', 1, 'single', 1, NULL, NULL, 58, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0082', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 16:42:40', '2024-04-07 16:42:40'),
(83, 'Jeans-Best-Cotton-NT', 1, 'single', 1, NULL, NULL, 59, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0083', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 16:48:50', '2024-04-07 16:48:50'),
(84, 'Jeans-Police-IA', 1, 'single', 1, NULL, NULL, 61, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0084', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 18:01:53', '2024-04-07 18:01:53'),
(85, 'Saree-Arrthi-NE', 1, 'single', 1, NULL, NULL, 62, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0085', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 18:06:00', '2024-04-07 18:06:00'),
(86, 'Shorts-Beach Wear-IS', 1, 'single', 1, NULL, NULL, 63, NULL, NULL, NULL, 'exclusive', 1, NULL, 'vpa-0086', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:00:37', '2024-04-07 19:00:37'),
(87, 'Saree-S37V-GZYZS', 1, 'single', 1, NULL, NULL, 64, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0087', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:11:15', '2024-04-07 19:11:15'),
(88, 'Saree-7002A-NAYZS', 1, 'single', 1, NULL, NULL, 65, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0088', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:16:34', '2024-04-07 19:16:34'),
(89, 'Saree-7030-AIEYS', 1, 'single', 1, NULL, NULL, 66, NULL, NULL, NULL, 'exclusive', 1, 5.0000, 'vpa-0089', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:20:23', '2024-04-07 19:20:23'),
(90, 'Saree-7002V-NAYZS', 1, 'single', 1, NULL, NULL, 68, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0090', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:25:56', '2024-04-07 19:25:56'),
(91, 'Saree-SP7004PK-VYATYS', 1, 'single', 1, NULL, NULL, 69, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0091', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:32:00', '2024-04-07 19:32:00'),
(92, 'Saree-Rich-Pallu-TYAYS', 1, 'single', 1, NULL, NULL, 70, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0092', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:36:15', '2024-04-07 19:36:15'),
(93, 'Saree-Rich-Pallu-TYAYS', 1, 'single', 1, NULL, NULL, 71, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0093', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:39:25', '2024-04-07 19:39:25'),
(94, 'Saree-Digital-Print-NAYZS', 1, 'single', 1, NULL, NULL, 72, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0094', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:44:03', '2024-04-07 19:44:03'),
(95, 'Saree-Suma-AEIYS', 1, 'single', 1, NULL, NULL, 73, NULL, NULL, NULL, 'exclusive', 1, 2.0000, 'vpa-0095', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '2024-04-07 19:51:39', '2024-04-07 19:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(10, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 1),
(8, 2),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(26, 1),
(26, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(92, 1),
(92, 2),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) DEFAULT NULL,
  `row` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(13, NULL, 'DUMMY', 13, 1, '2024-03-31 16:11:39', '2024-03-31 16:11:39'),
(14, NULL, 'DUMMY', 14, 1, '2024-03-31 17:10:49', '2024-03-31 17:10:49'),
(16, NULL, 'DUMMY', 16, 1, '2024-03-31 18:15:07', '2024-03-31 18:15:07'),
(17, NULL, 'DUMMY', 17, 1, '2024-03-31 18:30:54', '2024-03-31 18:30:54'),
(19, NULL, 'DUMMY', 19, 1, '2024-03-31 18:52:41', '2024-03-31 18:52:41'),
(21, NULL, 'DUMMY', 21, 1, '2024-03-31 19:24:34', '2024-03-31 19:24:34'),
(22, NULL, 'DUMMY', 22, 1, '2024-03-31 19:27:46', '2024-03-31 19:27:46'),
(23, NULL, 'DUMMY', 23, 1, '2024-03-31 19:42:04', '2024-03-31 19:42:04'),
(24, NULL, 'DUMMY', 24, 1, '2024-03-31 19:44:00', '2024-03-31 19:44:00'),
(25, NULL, 'DUMMY', 25, 1, '2024-03-31 19:53:58', '2024-03-31 19:53:58'),
(26, NULL, 'DUMMY', 26, 1, '2024-03-31 19:55:24', '2024-03-31 19:55:24'),
(28, NULL, 'DUMMY', 28, 1, '2024-03-31 20:03:23', '2024-03-31 20:03:23'),
(29, NULL, 'DUMMY', 29, 1, '2024-03-31 20:09:34', '2024-03-31 20:09:34'),
(30, NULL, 'DUMMY', 30, 1, '2024-03-31 20:12:02', '2024-03-31 20:12:02'),
(31, NULL, 'DUMMY', 31, 1, '2024-03-31 20:38:27', '2024-03-31 20:38:27'),
(32, NULL, 'DUMMY', 32, 1, '2024-03-31 20:49:01', '2024-03-31 20:49:01'),
(33, NULL, 'DUMMY', 33, 1, '2024-03-31 23:04:47', '2024-03-31 23:04:47'),
(34, NULL, 'DUMMY', 34, 1, '2024-03-31 23:12:08', '2024-03-31 23:12:08'),
(35, NULL, 'DUMMY', 35, 1, '2024-03-31 23:17:11', '2024-03-31 23:17:11'),
(36, NULL, 'DUMMY', 36, 1, '2024-03-31 23:30:28', '2024-03-31 23:30:28'),
(37, NULL, 'DUMMY', 37, 1, '2024-03-31 23:36:40', '2024-03-31 23:36:40'),
(38, NULL, 'DUMMY', 38, 1, '2024-03-31 23:43:40', '2024-03-31 23:43:40'),
(40, NULL, 'DUMMY', 40, 1, '2024-04-01 23:22:24', '2024-04-01 23:22:24'),
(41, NULL, 'DUMMY', 41, 1, '2024-04-01 23:31:16', '2024-04-01 23:31:16'),
(42, NULL, 'DUMMY', 42, 1, '2024-04-01 23:35:45', '2024-04-01 23:35:45'),
(43, NULL, 'DUMMY', 43, 1, '2024-04-01 23:38:49', '2024-04-01 23:38:49'),
(44, NULL, 'DUMMY', 44, 1, '2024-04-01 23:43:54', '2024-04-01 23:43:54'),
(45, 1, 'Size', 45, 0, '2024-04-01 23:49:22', '2024-04-01 23:49:22'),
(46, NULL, 'DUMMY', 46, 1, '2024-04-02 00:13:37', '2024-04-02 00:13:37'),
(47, NULL, 'DUMMY', 47, 1, '2024-04-02 00:19:17', '2024-04-02 00:19:17'),
(48, NULL, 'DUMMY', 48, 1, '2024-04-02 00:30:56', '2024-04-02 00:30:56'),
(49, NULL, 'DUMMY', 49, 1, '2024-04-02 23:22:20', '2024-04-02 23:22:20'),
(50, NULL, 'DUMMY', 50, 1, '2024-04-02 23:27:10', '2024-04-02 23:27:10'),
(51, NULL, 'DUMMY', 51, 1, '2024-04-02 23:30:50', '2024-04-02 23:30:50'),
(52, NULL, 'DUMMY', 52, 1, '2024-04-02 23:34:06', '2024-04-02 23:34:06'),
(53, NULL, 'DUMMY', 53, 1, '2024-04-02 23:44:38', '2024-04-02 23:44:38'),
(54, NULL, 'DUMMY', 54, 1, '2024-04-02 23:55:17', '2024-04-02 23:55:17'),
(55, NULL, 'DUMMY', 55, 1, '2024-04-02 23:59:27', '2024-04-02 23:59:27'),
(56, NULL, 'DUMMY', 56, 1, '2024-04-03 00:11:29', '2024-04-03 00:11:29'),
(57, NULL, 'DUMMY', 57, 1, '2024-04-03 00:18:01', '2024-04-03 00:18:01'),
(58, NULL, 'DUMMY', 58, 1, '2024-04-03 00:25:58', '2024-04-03 00:25:58'),
(59, NULL, 'DUMMY', 59, 1, '2024-04-03 00:34:01', '2024-04-03 00:34:01'),
(60, NULL, 'DUMMY', 60, 1, '2024-04-03 00:40:08', '2024-04-03 00:40:08'),
(61, NULL, 'DUMMY', 61, 1, '2024-04-03 00:48:22', '2024-04-03 00:48:22'),
(62, NULL, 'DUMMY', 62, 1, '2024-04-03 01:18:14', '2024-04-03 01:18:14'),
(63, NULL, 'DUMMY', 63, 1, '2024-04-03 01:21:13', '2024-04-03 01:21:13'),
(64, NULL, 'DUMMY', 64, 1, '2024-04-03 01:24:49', '2024-04-03 01:24:49'),
(65, NULL, 'DUMMY', 65, 1, '2024-04-03 01:31:21', '2024-04-03 01:31:21'),
(66, NULL, 'DUMMY', 66, 1, '2024-04-03 01:35:56', '2024-04-03 01:35:56'),
(67, NULL, 'DUMMY', 67, 1, '2024-04-03 01:41:42', '2024-04-03 01:41:42'),
(68, NULL, 'DUMMY', 68, 1, '2024-04-03 01:53:04', '2024-04-03 01:53:04'),
(69, NULL, 'DUMMY', 69, 1, '2024-04-03 01:58:51', '2024-04-03 01:58:51'),
(70, NULL, 'DUMMY', 70, 1, '2024-04-05 02:21:10', '2024-04-05 02:21:10'),
(71, NULL, 'DUMMY', 71, 1, '2024-04-05 03:06:04', '2024-04-05 03:06:04'),
(72, NULL, 'DUMMY', 72, 1, '2024-04-05 03:09:51', '2024-04-05 03:09:51'),
(73, NULL, 'DUMMY', 73, 1, '2024-04-05 03:14:17', '2024-04-05 03:14:17'),
(74, NULL, 'DUMMY', 74, 1, '2024-04-05 03:19:12', '2024-04-05 03:19:12'),
(75, NULL, 'DUMMY', 75, 1, '2024-04-05 03:23:42', '2024-04-05 03:23:42'),
(76, NULL, 'DUMMY', 76, 1, '2024-04-05 03:28:34', '2024-04-05 03:28:34'),
(77, NULL, 'DUMMY', 77, 1, '2024-04-05 03:54:45', '2024-04-05 03:54:45'),
(78, NULL, 'DUMMY', 78, 1, '2024-04-05 03:58:28', '2024-04-05 03:58:28'),
(79, NULL, 'DUMMY', 79, 1, '2024-04-07 14:05:58', '2024-04-07 14:05:58'),
(80, NULL, 'DUMMY', 80, 1, '2024-04-07 14:20:55', '2024-04-07 14:20:55'),
(81, NULL, 'DUMMY', 81, 1, '2024-04-07 16:38:09', '2024-04-07 16:38:09'),
(82, NULL, 'DUMMY', 82, 1, '2024-04-07 16:42:40', '2024-04-07 16:42:40'),
(83, NULL, 'DUMMY', 83, 1, '2024-04-07 16:48:50', '2024-04-07 16:48:50'),
(84, NULL, 'DUMMY', 84, 1, '2024-04-07 18:01:53', '2024-04-07 18:01:53'),
(85, NULL, 'DUMMY', 85, 1, '2024-04-07 18:06:00', '2024-04-07 18:06:00'),
(86, NULL, 'DUMMY', 86, 1, '2024-04-07 19:00:37', '2024-04-07 19:00:37'),
(87, NULL, 'DUMMY', 87, 1, '2024-04-07 19:11:15', '2024-04-07 19:11:15'),
(88, NULL, 'DUMMY', 88, 1, '2024-04-07 19:16:34', '2024-04-07 19:16:34'),
(89, NULL, 'DUMMY', 89, 1, '2024-04-07 19:20:23', '2024-04-07 19:20:23'),
(90, NULL, 'DUMMY', 90, 1, '2024-04-07 19:25:56', '2024-04-07 19:25:56'),
(91, NULL, 'DUMMY', 91, 1, '2024-04-07 19:32:00', '2024-04-07 19:32:00'),
(92, NULL, 'DUMMY', 92, 1, '2024-04-07 19:36:15', '2024-04-07 19:36:15'),
(93, NULL, 'DUMMY', 93, 1, '2024-04-07 19:39:25', '2024-04-07 19:39:25'),
(94, NULL, 'DUMMY', 94, 1, '2024-04-07 19:44:03', '2024-04-07 19:44:03'),
(95, NULL, 'DUMMY', 95, 1, '2024-04-07 19:51:39', '2024-04-07 19:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_requisition_line_id` int(11) DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_requisition_line_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(11, 17, 13, 13, 47.0000, 0.0000, 1700.0000, 0.00, 1700.0000, 1700.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 16:40:39', '2024-03-31 17:37:12'),
(12, 19, 14, 14, 267.0000, 0.0000, 1600.0000, 0.00, 1600.0000, 1600.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 17:14:10', '2024-03-31 21:52:22'),
(13, 20, 16, 16, 148.0000, 0.0000, 1250.0000, 0.00, 1250.0000, 1250.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 18:16:59', '2024-03-31 18:16:59'),
(14, 21, 17, 17, 103.0000, 0.0000, 410.0000, 0.00, 410.0000, 410.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 18:36:50', '2024-03-31 21:51:54'),
(15, 22, 19, 19, 69.0000, 0.0000, 550.0000, 0.00, 550.0000, 550.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 18:56:17', '2024-03-31 21:51:14'),
(16, 23, 21, 21, 105.0000, 0.0000, 380.0000, 0.00, 380.0000, 380.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 19:26:26', '2024-03-31 21:50:57'),
(17, 24, 22, 22, 25.0000, 0.0000, 900.0000, 0.00, 900.0000, 900.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 19:31:50', '2024-03-31 21:50:36'),
(18, 25, 23, 23, 10.0000, 0.0000, 315.0000, 0.00, 315.0000, 315.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 19:45:38', '2024-03-31 21:50:14'),
(20, 27, 28, 28, 30.0000, 0.0000, 1275.0000, 0.00, 1275.0000, 1275.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 20:09:49', '2024-03-31 21:49:01'),
(21, 28, 29, 29, 10.0000, 0.0000, 1290.0000, 0.00, 1290.0000, 1290.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 20:17:43', '2024-03-31 21:47:11'),
(22, 29, 30, 30, 20.0000, 0.0000, 1090.0000, 0.00, 1090.0000, 1090.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 20:20:45', '2024-03-31 21:46:36'),
(23, 30, 25, 25, 73.0000, 0.0000, 420.0000, 0.00, 420.0000, 420.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 21:02:00', '2024-03-31 21:43:22'),
(24, 31, 31, 31, 29.0000, 0.0000, 990.0000, 0.00, 990.0000, 990.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 21:57:37', '2024-03-31 21:57:37'),
(25, 32, 26, 26, 20.0000, 0.0000, 350.0000, 0.00, 350.0000, 350.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 22:00:09', '2024-03-31 22:00:09'),
(26, 33, 24, 24, 30.0000, 0.0000, 285.0000, 0.00, 285.0000, 285.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 22:03:46', '2024-03-31 22:03:46'),
(27, 34, 32, 32, 20.0000, 0.0000, 530.0000, 0.00, 530.0000, 530.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 22:15:05', '2024-03-31 22:43:29'),
(28, 35, 33, 33, 44.0000, 0.0000, 575.0000, 0.00, 575.0000, 575.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 23:07:55', '2024-03-31 23:07:55'),
(29, 36, 34, 34, 30.0000, 0.0000, 490.0000, 0.00, 490.0000, 490.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 23:13:26', '2024-03-31 23:13:26'),
(30, 37, 35, 35, 20.0000, 0.0000, 280.0000, 0.00, 280.0000, 280.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 23:19:02', '2024-03-31 23:19:02'),
(31, 38, 36, 36, 45.0000, 0.0000, 1800.0000, 0.00, 1800.0000, 1800.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 23:32:35', '2024-04-02 01:27:00'),
(32, 39, 37, 37, 24.0000, 0.0000, 1850.0000, 0.00, 1850.0000, 1850.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 23:38:13', '2024-03-31 23:38:13'),
(33, 40, 38, 38, 15.0000, 0.0000, 1950.0000, 0.00, 1950.0000, 1950.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 10.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-03-31 23:44:28', '2024-03-31 23:58:36'),
(34, 42, 40, 40, 47.0000, 0.0000, 220.0000, 0.00, 220.0000, 220.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:24:29', '2024-04-01 23:24:29'),
(35, 43, 41, 41, 12.0000, 0.0000, 550.0000, 0.00, 550.0000, 550.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:32:05', '2024-04-01 23:32:05'),
(36, 44, 42, 42, 13.0000, 0.0000, 950.0000, 0.00, 950.0000, 950.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:36:34', '2024-04-01 23:36:34'),
(37, 45, 43, 43, 12.0000, 0.0000, 750.0000, 0.00, 750.0000, 750.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:39:45', '2024-04-01 23:39:45'),
(38, 46, 44, 44, 12.0000, 0.0000, 775.0000, 0.00, 775.0000, 775.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:44:38', '2024-04-01 23:44:38'),
(39, 47, 45, 45, 12.0000, 0.0000, 620.0000, 0.00, 620.0000, 620.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(40, 47, 45, 46, 12.0000, 0.0000, 620.0000, 0.00, 620.0000, 620.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(41, 47, 45, 47, 12.0000, 0.0000, 620.0000, 0.00, 620.0000, 620.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(42, 47, 45, 48, 12.0000, 0.0000, 620.0000, 0.00, 620.0000, 620.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(43, 47, 45, 49, 9.0000, 0.0000, 680.0000, 0.00, 680.0000, 680.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(44, 48, 46, 50, 24.0000, 0.0000, 2950.0000, 0.00, 2950.0000, 2950.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 00:14:42', '2024-04-02 00:14:42'),
(45, 49, 47, 51, 5.0000, 0.0000, 2950.0000, 0.00, 2950.0000, 2950.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 00:20:17', '2024-04-02 00:20:17'),
(46, 51, 48, 52, 15.0000, 0.0000, 2260.0000, 0.00, 2260.0000, 2260.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 00:32:35', '2024-04-02 00:32:35'),
(47, 53, 49, 53, 5.0000, 0.0000, 1000.0000, 0.00, 1000.0000, 1000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 23:23:21', '2024-04-02 23:23:21'),
(48, 54, 50, 54, 8.0000, 0.0000, 780.0000, 0.00, 780.0000, 780.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 23:27:49', '2024-04-02 23:27:49'),
(49, 55, 51, 55, 5.0000, 0.0000, 1700.0000, 0.00, 1700.0000, 1700.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 23:31:29', '2024-04-02 23:31:29'),
(50, 56, 52, 56, 5.0000, 0.0000, 1650.0000, 0.00, 1650.0000, 1650.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 23:34:49', '2024-04-02 23:34:49'),
(51, 57, 53, 57, 5.0000, 0.0000, 585.0000, 0.00, 585.0000, 585.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 23:45:23', '2024-04-02 23:45:23'),
(53, 59, 54, 58, 11.0000, 0.0000, 1590.0000, 0.00, 1590.0000, 1590.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-02 23:55:54', '2024-04-02 23:55:54'),
(54, 60, 55, 59, 4.0000, 0.0000, 1150.0000, 0.00, 1150.0000, 1150.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 00:01:38', '2024-04-03 00:01:38'),
(55, 61, 56, 60, 6.0000, 0.0000, 3360.0000, 0.00, 3360.0000, 3360.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 00:12:47', '2024-04-03 00:12:47'),
(56, 62, 57, 61, 82.0000, 0.0000, 1250.0000, 0.00, 1250.0000, 1250.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 00:19:18', '2024-04-03 00:19:18'),
(57, 63, 58, 62, 79.0000, 0.0000, 925.0000, 0.00, 925.0000, 925.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 00:27:32', '2024-04-03 00:30:29'),
(58, 64, 59, 63, 42.0000, 0.0000, 1175.0000, 0.00, 1175.0000, 1175.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 00:35:05', '2024-04-03 00:35:05'),
(59, 65, 60, 64, 16.0000, 0.0000, 1285.0000, 0.00, 1285.0000, 1285.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 00:40:53', '2024-04-03 00:40:53'),
(60, 66, 61, 65, 20.0000, 0.0000, 1285.0000, 0.00, 1285.0000, 1285.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 00:49:24', '2024-04-03 00:52:40'),
(61, 67, 62, 66, 6.0000, 0.0000, 2180.0000, 0.00, 2180.0000, 2180.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 01:18:54', '2024-04-03 01:18:54'),
(62, 68, 63, 67, 24.0000, 0.0000, 1050.0000, 0.00, 1050.0000, 1050.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 01:22:21', '2024-04-03 01:22:21'),
(63, 69, 64, 68, 24.0000, 0.0000, 2475.0000, 0.00, 2475.0000, 2475.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 18.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 01:25:31', '2024-04-03 01:29:26'),
(64, 71, 65, 69, 6.0000, 0.0000, 3180.0000, 0.00, 3180.0000, 3180.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 01:32:28', '2024-04-03 01:32:28'),
(65, 72, 66, 70, 6.0000, 0.0000, 1350.0000, 0.00, 1350.0000, 1350.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 01:36:35', '2024-04-03 01:36:35'),
(66, 73, 67, 71, 20.0000, 0.0000, 1925.0000, 0.00, 1925.0000, 1925.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 01:46:37', '2024-04-03 01:46:37'),
(67, 74, 68, 72, 22.0000, 0.0000, 1925.0000, 0.00, 1925.0000, 1925.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 01:53:44', '2024-04-03 01:53:44'),
(69, 75, 69, 73, 28.0000, 0.0000, 4380.0000, 0.00, 4380.0000, 4380.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-03 02:02:10', '2024-04-03 02:02:10'),
(70, 76, 70, 74, 40.0000, 0.0000, 950.0000, 0.00, 950.0000, 950.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 02:23:05', '2024-04-05 02:23:05'),
(71, 77, 71, 75, 25.0000, 0.0000, 1850.0000, 0.00, 1850.0000, 1850.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:07:09', '2024-04-05 03:07:09'),
(72, 78, 72, 76, 20.0000, 0.0000, 1750.0000, 0.00, 1750.0000, 1750.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:10:35', '2024-04-05 03:10:35'),
(73, 79, 73, 77, 24.0000, 0.0000, 1750.0000, 0.00, 1750.0000, 1750.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:15:04', '2024-04-05 03:15:04'),
(74, 80, 74, 78, 38.0000, 0.0000, 650.0000, 0.00, 650.0000, 650.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:20:27', '2024-04-05 03:20:27'),
(75, 81, 75, 79, 20.0000, 0.0000, 875.0000, 0.00, 875.0000, 875.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:24:26', '2024-04-05 03:24:26'),
(76, 82, 76, 80, 26.0000, 0.0000, 1450.0000, 0.00, 1450.0000, 1450.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:33:27', '2024-04-05 03:33:27'),
(77, 83, 76, 80, 15.0000, 0.0000, 690.0000, 0.00, 690.0000, 690.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:40:04', '2024-04-05 03:40:04'),
(78, 84, 76, 80, 15.0000, 0.0000, 690.0000, 0.00, 690.0000, 690.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:42:30', '2024-04-05 03:42:30'),
(79, 85, 76, 80, 32.0000, 0.0000, 900.0000, 0.00, 900.0000, 900.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:47:54', '2024-04-05 03:47:54'),
(80, 86, 76, 80, 10.0000, 0.0000, 2350.0000, 0.00, 2350.0000, 2350.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:50:51', '2024-04-05 03:50:51'),
(81, 87, 77, 81, 50.0000, 0.0000, 890.0000, 0.00, 890.0000, 890.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:55:51', '2024-04-05 03:55:51'),
(82, 88, 78, 82, 20.0000, 0.0000, 1550.0000, 0.00, 1550.0000, 1550.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-05 03:59:45', '2024-04-05 03:59:45'),
(83, 89, 79, 83, 84.0000, 0.0000, 1850.0000, 0.00, 1850.0000, 1850.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 14:14:04', '2024-04-07 14:31:53'),
(84, 90, 80, 84, 36.0000, 0.0000, 1825.0000, 0.00, 1825.0000, 1825.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 14:24:59', '2024-04-07 14:24:59'),
(85, 91, 81, 85, 104.0000, 0.0000, 1530.0000, 0.00, 1530.0000, 1530.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 16:38:48', '2024-04-07 16:38:48'),
(86, 92, 82, 86, 34.0000, 0.0000, 975.0000, 0.00, 975.0000, 975.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 16:43:28', '2024-04-07 16:43:28'),
(87, 93, 83, 87, 84.0000, 0.0000, 2200.0000, 0.00, 2200.0000, 2200.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 16:49:51', '2024-04-07 16:49:51'),
(88, 94, 84, 88, 30.0000, 0.0000, 2300.0000, 0.00, 2300.0000, 2300.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 18:02:47', '2024-04-07 18:02:47'),
(89, 95, 85, 89, 150.0000, 0.0000, 600.0000, 0.00, 600.0000, 600.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 18:07:03', '2024-04-07 18:07:03'),
(90, 96, 86, 90, 102.0000, 0.0000, 1250.0000, 0.00, 1250.0000, 1250.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:01:10', '2024-04-07 19:01:10'),
(91, 97, 87, 91, 27.0000, 0.0000, 3300.0000, 0.00, 3300.0000, 3300.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:12:55', '2024-04-07 19:12:55'),
(92, 98, 88, 92, 12.0000, 0.0000, 4500.0000, 0.00, 4500.0000, 4500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:17:25', '2024-04-07 19:17:25'),
(93, 99, 89, 93, 1.0000, 0.0000, 5280.0000, 0.00, 5280.0000, 5280.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:20:57', '2024-04-07 19:20:57'),
(94, 100, 90, 94, 9.0000, 0.0000, 4500.0000, 0.00, 4500.0000, 4500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:26:41', '2024-04-07 19:26:41'),
(95, 101, 91, 95, 6.0000, 0.0000, 10580.0000, 0.00, 10580.0000, 10580.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:32:41', '2024-04-07 19:32:41'),
(96, 102, 92, 96, 6.0000, 0.0000, 7050.0000, 0.00, 7050.0000, 7050.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:36:55', '2024-04-07 19:36:55'),
(97, 103, 93, 97, 5.0000, 0.0000, 7050.0000, 0.00, 7050.0000, 7050.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:40:07', '2024-04-07 19:40:07'),
(98, 104, 94, 98, 12.0000, 0.0000, 4500.0000, 0.00, 4500.0000, 4500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:44:48', '2024-04-07 19:44:48'),
(99, 105, 95, 99, 12.0000, 0.0000, 5820.0000, 0.00, 5820.0000, 5820.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-04-07 19:52:20', '2024-04-07 19:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 20, 1, '2024-03-29 11:15:48', '2024-04-07 16:49:15'),
(2, 'business_location', 2, 1, '2024-03-29 11:15:48', '2024-03-30 19:05:52'),
(3, 'sell_payment', 14, 1, '2024-03-30 00:34:14', '2024-04-02 00:51:44'),
(4, 'purchase', 89, 1, '2024-03-30 19:21:49', '2024-04-07 19:52:20'),
(5, 'purchase_payment', 91, 1, '2024-03-30 19:21:49', '2024-04-07 19:52:20'),
(6, 'sell_return', 1, 1, '2024-03-31 15:40:58', '2024-03-31 15:40:58'),
(7, 'purchase_return', 2, 1, '2024-03-31 23:55:47', '2024-04-03 01:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(3, 'Manager#1', 'web', 1, 0, 0, '2024-03-29 11:26:41', '2024-03-29 11:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(25, 2),
(25, 3),
(26, 2),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 2),
(48, 3),
(49, 2),
(49, 3),
(50, 2),
(50, 3),
(51, 2),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(80, 2),
(81, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(88, 3),
(89, 3),
(91, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(122, 3),
(123, 3),
(124, 3);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(22,4) NOT NULL,
  `package_details` longtext NOT NULL,
  `created_id` int(10) UNSIGNED NOT NULL,
  `paid_via` varchar(191) DEFAULT NULL,
  `payment_transaction_id` varchar(191) DEFAULT NULL,
  `status` enum('approved','waiting','declined') NOT NULL DEFAULT 'waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `business_id`, `package_id`, `start_date`, `trial_end_date`, `end_date`, `package_price`, `package_details`, `created_id`, `paid_via`, `payment_transaction_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-03-29', '2025-04-13', '2025-03-29', 0.0000, '{\"location_count\":\"0\",\"user_count\":\"0\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"Unlimited\"}', 1, 'offline', NULL, 'approved', NULL, '2024-03-29 11:18:01', '2024-03-29 11:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_communicator_logs`
--

CREATE TABLE `superadmin_communicator_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_ids` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_frontend_pages`
--

CREATE TABLE `superadmin_frontend_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '5.40'),
(2, 'default_business_active_status', '1'),
(3, 'superadmin_version', '2.8'),
(4, 'app_currency_id', '2'),
(5, 'invoice_business_name', 'Vinayakar Tex'),
(6, 'invoice_business_landmark', 'Landmark'),
(7, 'invoice_business_zip', 'Zip'),
(8, 'invoice_business_state', 'State'),
(9, 'invoice_business_city', 'City'),
(10, 'invoice_business_country', 'Country'),
(11, 'email', 'superadmin@example.com'),
(12, 'package_expiry_alert_days', '5'),
(13, 'enable_business_based_username', '0'),
(14, 'superadmin_register_tc', NULL),
(15, 'welcome_email_subject', NULL),
(16, 'welcome_email_body', NULL),
(17, 'additional_js', NULL),
(18, 'additional_css', NULL),
(19, 'offline_payment_details', NULL),
(20, 'superadmin_enable_register_tc', '0'),
(21, 'allow_email_settings_to_businesses', '0'),
(22, 'enable_new_business_registration_notification', '0'),
(23, 'enable_new_subscription_notification', '0'),
(24, 'enable_welcome_email', '0'),
(25, 'enable_offline_payment', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `is_kitchen_order` tinyint(1) NOT NULL DEFAULT 0,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `sub_type` varchar(20) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `sub_status` varchar(191) DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `subscription_no` varchar(191) DEFAULT NULL,
  `subscription_repeat_on` varchar(191) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `shipping_status` varchar(191) DEFAULT NULL,
  `delivered_to` varchar(191) DEFAULT NULL,
  `delivery_person` bigint(20) DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_sub_category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `purchase_requisition_ids` text DEFAULT NULL,
  `prefer_payment_method` varchar(191) DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text DEFAULT NULL,
  `purchase_order_ids` text DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `service_custom_field_1` text DEFAULT NULL,
  `service_custom_field_2` text DEFAULT NULL,
  `service_custom_field_3` text DEFAULT NULL,
  `service_custom_field_4` text DEFAULT NULL,
  `service_custom_field_5` text DEFAULT NULL,
  `service_custom_field_6` text DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `is_kitchen_order`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `delivery_date`, `shipping_status`, `delivered_to`, `delivery_person`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `purchase_requisition_ids`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-29 20:09:00', 650.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 9750.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-30 00:12:59', '2024-03-30 00:12:59'),
(6, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:56:28', 1800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 18000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-30 19:56:28', '2024-03-30 19:56:28'),
(7, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 16:11:12', 1275.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 11475.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-30 20:11:12', '2024-03-30 20:11:12'),
(8, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 22:30:43', 500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 02:30:43', '2024-03-31 02:30:43'),
(9, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 10:22:58', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 14:22:58', '2024-03-31 14:22:58'),
(17, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 3, NULL, NULL, 'PO2024/0006', NULL, NULL, NULL, '2024-03-31 12:38:00', 79900.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 79900.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 16:40:39', '2024-03-31 17:37:12'),
(19, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 2, NULL, NULL, 'PO2024/0007', NULL, NULL, NULL, '2024-03-31 13:11:00', 427200.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 427200.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 17:14:10', '2024-03-31 21:52:22'),
(20, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 2, NULL, NULL, 'PO2024/0008', NULL, NULL, NULL, '2024-03-31 14:15:00', 185000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 185000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 18:16:59', '2024-03-31 18:16:59'),
(21, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0009', NULL, NULL, NULL, '2024-03-31 14:33:00', 42230.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 42230.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 18:36:50', '2024-03-31 21:51:54'),
(22, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0010', NULL, NULL, NULL, '2024-03-31 14:52:00', 37950.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 37950.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 18:56:17', '2024-03-31 21:51:14'),
(23, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0011', NULL, NULL, NULL, '2024-03-31 15:24:00', 39900.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 39900.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:26:26', '2024-03-31 21:50:57'),
(24, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0012', NULL, NULL, NULL, '2024-03-31 15:30:00', 22500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 22500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:31:50', '2024-03-31 21:50:36'),
(25, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0013', NULL, NULL, NULL, '2024-03-31 15:44:00', 3150.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3150.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:45:38', '2024-03-31 21:50:14'),
(27, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0015', NULL, NULL, NULL, '2024-03-31 16:07:00', 38250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 38250.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 20:09:49', '2024-03-31 21:49:01'),
(28, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 13, NULL, NULL, 'PO2024/0016', NULL, NULL, NULL, '2024-03-31 16:16:00', 12900.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 12900.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 20:17:43', '2024-03-31 21:47:11'),
(29, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 13, NULL, NULL, 'PO2024/0017', NULL, NULL, NULL, '2024-03-31 16:19:00', 21800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 21800.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 20:20:45', '2024-03-31 21:46:36'),
(30, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0018', NULL, NULL, NULL, '2024-03-31 17:00:00', 30660.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 30660.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 21:02:00', '2024-03-31 21:43:22'),
(31, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 2, NULL, NULL, 'PO2024/0019', NULL, NULL, NULL, '2024-03-31 17:55:00', 28710.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 28710.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 21:57:37', '2024-03-31 21:57:37'),
(32, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0020', NULL, NULL, NULL, '2024-03-31 17:58:00', 7000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 7000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 22:00:09', '2024-03-31 22:00:09'),
(33, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0021', NULL, NULL, NULL, '2024-03-31 18:02:00', 8550.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 8550.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 22:03:46', '2024-03-31 22:03:46'),
(34, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 13, NULL, NULL, 'PO2024/0022', NULL, NULL, NULL, '2024-03-31 18:13:00', 10600.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10600.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 22:15:05', '2024-04-01 00:06:57'),
(35, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0023', NULL, NULL, NULL, '2024-03-31 19:04:00', 25300.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25300.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 23:07:55', '2024-03-31 23:07:55'),
(36, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0024', NULL, NULL, NULL, '2024-03-31 19:12:00', 14700.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 14700.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 23:13:26', '2024-03-31 23:13:26'),
(37, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0025', NULL, NULL, NULL, '2024-03-31 19:17:00', 5600.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5600.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 23:19:02', '2024-03-31 23:19:02'),
(38, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0026', NULL, NULL, NULL, '2024-03-31 19:31:00', 81000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 81000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 23:32:35', '2024-03-31 23:32:35'),
(39, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0027', NULL, NULL, NULL, '2024-03-31 19:36:00', 44400.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 44400.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 23:38:13', '2024-03-31 23:38:13'),
(40, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0028', NULL, NULL, NULL, '2024-03-31 19:43:00', 29250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 29250.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 23:44:28', '2024-03-31 23:54:14'),
(41, 1, 1, 0, NULL, NULL, NULL, 'purchase_return', NULL, 'final', NULL, 0, 'due', NULL, 12, NULL, NULL, '2024/0001', NULL, NULL, NULL, '2024-03-31 19:55:47', 19500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 19500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, 40, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 23:55:47', '2024-03-31 23:58:36'),
(42, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0029', NULL, NULL, NULL, '2024-04-01 19:22:00', 10340.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10340.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 23:24:28', '2024-04-01 23:24:29'),
(43, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0030', NULL, NULL, NULL, '2024-04-01 19:31:00', 6600.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6600.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 23:32:05', '2024-04-01 23:32:05'),
(44, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0031', NULL, NULL, NULL, '2024-04-01 19:35:00', 12350.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 12350.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 23:36:34', '2024-04-01 23:36:34'),
(45, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0032', NULL, NULL, NULL, '2024-04-01 19:38:00', 9000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 9000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 23:39:45', '2024-04-01 23:39:45'),
(46, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0033', NULL, NULL, NULL, '2024-04-01 19:44:00', 9300.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 9300.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 23:44:38', '2024-04-01 23:44:38'),
(47, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'PO2024/0034', NULL, NULL, NULL, '2024-04-01 19:53:00', 35880.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 35880.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(48, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0035', NULL, NULL, NULL, '2024-04-01 20:13:00', 70800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 70800.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 00:14:42', '2024-04-02 00:14:42'),
(49, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0036', NULL, NULL, NULL, '2024-04-01 20:19:00', 14750.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 14750.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 00:20:17', '2024-04-02 00:20:17'),
(51, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0037', NULL, NULL, NULL, '2024-04-01 20:31:00', 33900.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 33900.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 00:32:35', '2024-04-02 00:32:35'),
(53, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0038', NULL, NULL, NULL, '2024-04-02 19:22:00', 5000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 23:23:21', '2024-04-02 23:23:21'),
(54, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0039', NULL, NULL, NULL, '2024-04-02 19:27:00', 6240.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6240.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 23:27:49', '2024-04-02 23:27:49'),
(55, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0040', NULL, NULL, NULL, '2024-04-02 19:30:00', 8500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 8500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 23:31:29', '2024-04-02 23:31:29'),
(56, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0041', NULL, NULL, NULL, '2024-04-02 19:34:00', 8250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 8250.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 23:34:49', '2024-04-02 23:34:49'),
(57, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0042', NULL, NULL, NULL, '2024-04-02 19:44:00', 2925.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2925.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 23:45:23', '2024-04-02 23:45:23'),
(59, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0044', NULL, NULL, NULL, '2024-04-02 19:55:00', 17490.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 17490.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 23:55:54', '2024-04-02 23:55:55'),
(60, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0045', NULL, NULL, NULL, '2024-04-02 20:01:00', 4600.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4600.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:01:38', '2024-04-03 00:01:38'),
(61, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0046', NULL, NULL, NULL, '2024-04-02 20:12:00', 20160.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20160.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:12:47', '2024-04-03 00:12:47'),
(62, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 15, NULL, NULL, 'PO2024/0047', NULL, NULL, NULL, '2024-04-02 20:18:00', 102500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 102500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:19:18', '2024-04-03 00:19:18'),
(63, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0048', NULL, NULL, NULL, '2024-04-02 20:26:00', 73075.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 73075.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:27:32', '2024-04-03 00:30:29'),
(64, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0049', NULL, NULL, NULL, '2024-04-02 20:34:00', 49350.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 49350.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:35:05', '2024-04-03 00:35:05'),
(65, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0050', NULL, NULL, NULL, '2024-04-02 20:40:00', 20560.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20560.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:40:53', '2024-04-03 00:40:53'),
(66, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0051', NULL, NULL, NULL, '2024-04-02 20:48:00', 25700.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25700.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 00:49:24', '2024-04-03 00:52:40'),
(67, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0052', NULL, NULL, NULL, '2024-04-02 21:18:00', 13080.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 13080.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:18:54', '2024-04-03 01:18:54'),
(68, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0053', NULL, NULL, NULL, '2024-04-02 21:21:00', 25200.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25200.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:22:21', '2024-04-03 01:22:21'),
(69, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0054', NULL, NULL, NULL, '2024-04-02 21:24:00', 59400.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 59400.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:25:31', '2024-04-03 01:25:31'),
(70, 1, 1, 0, NULL, NULL, NULL, 'purchase_return', NULL, 'final', NULL, 0, 'due', NULL, 14, NULL, NULL, '2024/0002', NULL, NULL, NULL, '2024-04-02 21:29:26', 44550.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 44550.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, 69, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:29:26', '2024-04-03 01:29:26'),
(71, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0055', NULL, NULL, NULL, '2024-04-02 21:31:00', 19080.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 19080.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:32:28', '2024-04-03 01:32:28'),
(72, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0056', NULL, NULL, NULL, '2024-04-02 21:36:00', 8100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 8100.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:36:35', '2024-04-03 01:36:35'),
(73, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0057', NULL, NULL, NULL, '2024-04-02 21:41:00', 38500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 38500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:46:37', '2024-04-03 01:46:37'),
(74, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0058', NULL, NULL, NULL, '2024-04-02 21:53:00', 42350.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 42350.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:53:44', '2024-04-03 01:53:44'),
(75, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'partial', NULL, 16, NULL, NULL, 'PO2024/0059', NULL, NULL, NULL, '2024-04-02 21:58:00', 122640.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 122640.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03 01:59:42', '2024-04-03 02:02:10'),
(76, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 17, NULL, NULL, 'PO2024/0060', NULL, NULL, NULL, '2024-04-04 22:21:00', 38000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 38000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 02:23:05', '2024-04-05 02:23:05'),
(77, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 17, NULL, NULL, 'PO2024/0061', NULL, NULL, NULL, '2024-04-04 23:06:00', 46250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 46250.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:07:09', '2024-04-05 03:07:09'),
(78, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 17, NULL, NULL, 'PO2024/0062', NULL, NULL, NULL, '2024-04-04 23:09:00', 35000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 35000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:10:35', '2024-04-05 03:10:35'),
(79, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 17, NULL, NULL, 'PO2024/0063', NULL, NULL, NULL, '2024-04-04 23:14:00', 42000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 42000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:15:04', '2024-04-05 03:15:04'),
(80, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 18, NULL, NULL, 'PO2024/0064', NULL, NULL, NULL, '2024-04-04 23:19:00', 24700.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24700.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:20:27', '2024-04-05 03:20:27'),
(81, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 18, NULL, NULL, 'PO2024/0065', NULL, NULL, NULL, '2024-04-04 23:23:00', 17500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 17500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:24:26', '2024-04-05 03:24:26'),
(82, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 18, NULL, NULL, 'PO2024/0066', NULL, NULL, NULL, '2024-04-04 23:32:00', 37700.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 37700.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:33:27', '2024-04-05 03:33:27'),
(83, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0067', NULL, NULL, NULL, '2024-04-04 23:39:00', 10350.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10350.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:40:04', '2024-04-05 03:40:04'),
(84, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0068', NULL, NULL, NULL, '2024-04-04 23:41:00', 10350.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 10350.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:42:30', '2024-04-05 03:42:30'),
(85, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0069', NULL, NULL, NULL, '2024-04-04 23:46:00', 28800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 28800.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:47:54', '2024-04-05 03:47:54'),
(86, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0070', NULL, NULL, NULL, '2024-04-04 23:50:00', 23500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 23500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:50:51', '2024-04-05 03:50:51');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `is_kitchen_order`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `delivery_date`, `shipping_status`, `delivered_to`, `delivery_person`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `purchase_requisition_ids`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(87, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 2, NULL, NULL, 'PO2024/0071', NULL, NULL, NULL, '2024-04-04 23:55:00', 44500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 44500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:55:51', '2024-04-05 03:55:51'),
(88, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 2, NULL, NULL, 'PO2024/0072', NULL, NULL, NULL, '2024-04-04 23:58:00', 31000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 31000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 03:59:45', '2024-04-05 03:59:45'),
(89, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 19, NULL, NULL, 'PO2024/0073', NULL, NULL, NULL, '2024-04-07 10:12:00', 155400.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 155400.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 14:14:03', '2024-04-07 14:31:53'),
(90, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 19, NULL, NULL, 'PO2024/0074', NULL, NULL, NULL, '2024-04-07 10:24:00', 65700.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 65700.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 14:24:59', '2024-04-07 14:24:59'),
(91, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0075', NULL, NULL, NULL, '2024-04-07 12:38:00', 159120.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 159120.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 16:38:48', '2024-04-07 16:38:48'),
(92, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 14, NULL, NULL, 'PO2024/0076', NULL, NULL, NULL, '2024-04-07 12:42:00', 33150.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 33150.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 16:43:28', '2024-04-07 16:43:28'),
(93, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 20, NULL, NULL, 'PO2024/0077', NULL, NULL, NULL, '2024-04-07 12:48:00', 184800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 184800.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 16:49:51', '2024-04-07 16:49:51'),
(94, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 20, NULL, NULL, 'PO2024/0078', NULL, NULL, NULL, '2024-04-07 14:01:00', 69000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 69000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 18:02:47', '2024-04-07 18:02:47'),
(95, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 19, NULL, NULL, 'PO2024/0079', NULL, NULL, NULL, '2024-04-07 14:06:00', 90000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 90000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 18:07:03', '2024-04-07 18:07:03'),
(96, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 20, NULL, NULL, 'PO2024/0080', NULL, NULL, NULL, '2024-04-07 15:00:00', 127500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 127500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:01:10', '2024-04-07 19:01:10'),
(97, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0081', NULL, NULL, NULL, '2024-04-07 15:11:00', 89100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 89100.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:12:55', '2024-04-07 19:12:55'),
(98, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0082', NULL, NULL, NULL, '2024-04-07 15:16:00', 54000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 54000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:17:25', '2024-04-07 19:17:25'),
(99, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0083', NULL, NULL, NULL, '2024-04-07 15:20:00', 5280.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5280.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:20:57', '2024-04-07 19:20:57'),
(100, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0084', NULL, NULL, NULL, '2024-04-07 15:26:00', 40500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 40500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:26:41', '2024-04-07 19:26:41'),
(101, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0085', NULL, NULL, NULL, '2024-04-07 15:32:00', 63480.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 63480.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:32:41', '2024-04-07 19:32:42'),
(102, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0086', NULL, NULL, NULL, '2024-04-07 15:36:00', 42300.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 42300.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:36:55', '2024-04-07 19:36:55'),
(103, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0087', NULL, NULL, NULL, '2024-04-07 15:39:00', 35250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 35250.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:40:07', '2024-04-07 19:40:07'),
(104, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0088', NULL, NULL, NULL, '2024-04-07 15:44:00', 54000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 54000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:44:48', '2024-04-07 19:44:49'),
(105, 1, 1, 0, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 16, NULL, NULL, 'PO2024/0089', NULL, NULL, NULL, '2024-04-07 15:51:00', 69840.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 69840.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 19:52:20', '2024-04-07 19:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `transaction_no` varchar(191) DEFAULT NULL,
  `card_transaction_number` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `card_holder_name` varchar(191) DEFAULT NULL,
  `card_month` varchar(191) DEFAULT NULL,
  `card_year` varchar(191) DEFAULT NULL,
  `card_security` varchar(5) DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` int(11) DEFAULT NULL COMMENT 'stores the contact id',
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `payment_ref_no` varchar(191) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `payment_type`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(16, 17, 1, 0, 79900.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 12:38:00', 3, 0, NULL, 0, 3, NULL, NULL, NULL, 'PP2024/0007', NULL, '2024-03-31 16:40:39', '2024-03-31 16:40:39'),
(19, 19, 1, 0, 427200.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 13:11:00', 3, 0, NULL, 0, 5, NULL, NULL, NULL, 'PP2024/0008', NULL, '2024-03-31 17:14:10', '2024-03-31 17:14:10'),
(20, 20, 1, 0, 185000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 14:15:00', 3, 0, NULL, 0, 2, NULL, NULL, NULL, 'PP2024/0009', NULL, '2024-03-31 18:16:59', '2024-03-31 18:16:59'),
(21, 21, 1, 0, 42230.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 14:33:00', 3, 0, NULL, 0, 9, NULL, NULL, NULL, 'PP2024/0010', NULL, '2024-03-31 18:36:50', '2024-03-31 18:36:50'),
(22, 22, 1, 0, 37950.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 14:52:00', 3, 0, NULL, 0, 9, NULL, NULL, NULL, 'PP2024/0011', NULL, '2024-03-31 18:56:17', '2024-03-31 18:56:17'),
(23, 23, 1, 0, 39900.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 15:24:00', 3, 0, NULL, 0, 9, NULL, NULL, NULL, 'PP2024/0012', NULL, '2024-03-31 19:26:26', '2024-03-31 19:26:26'),
(24, 24, 1, 0, 22500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 15:30:00', 3, 0, NULL, 0, 9, NULL, NULL, NULL, 'PP2024/0013', NULL, '2024-03-31 19:31:50', '2024-03-31 19:31:50'),
(25, 25, 1, 0, 3150.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 15:44:00', 3, 0, NULL, 0, 9, NULL, NULL, NULL, 'PP2024/0014', NULL, '2024-03-31 19:45:38', '2024-03-31 19:45:38'),
(27, 27, 1, 0, 38250.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 16:07:00', 3, 0, NULL, 0, 9, NULL, NULL, NULL, 'PP2024/0016', NULL, '2024-03-31 20:09:49', '2024-03-31 20:09:49'),
(28, 28, 1, 0, 12900.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 16:16:00', 3, 0, NULL, 0, 10, NULL, NULL, NULL, 'PP2024/0017', NULL, '2024-03-31 20:17:43', '2024-03-31 20:17:43'),
(29, 29, 1, 0, 21800.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 16:19:00', 3, 0, NULL, 0, 10, NULL, NULL, NULL, 'PP2024/0018', NULL, '2024-03-31 20:20:45', '2024-03-31 20:20:45'),
(30, 30, 1, 0, 30660.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 17:00:00', 3, 0, NULL, 0, 9, NULL, NULL, NULL, 'PP2024/0019', NULL, '2024-03-31 21:02:00', '2024-03-31 21:02:00'),
(31, 31, 1, 0, 28710.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 17:55:00', 3, 0, NULL, 0, 2, NULL, NULL, NULL, 'PP2024/0020', NULL, '2024-03-31 21:57:37', '2024-03-31 21:57:37'),
(32, 32, 1, 0, 7000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 17:58:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0021', NULL, '2024-03-31 22:00:09', '2024-03-31 22:00:09'),
(33, 33, 1, 0, 8550.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 18:02:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0022', NULL, '2024-03-31 22:03:46', '2024-03-31 22:03:46'),
(34, 34, 1, 0, 9540.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 18:13:00', 3, 0, NULL, 0, 13, NULL, NULL, NULL, 'PP2024/0023', NULL, '2024-03-31 22:15:05', '2024-03-31 22:15:05'),
(35, 35, 1, 0, 25300.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:04:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0024', NULL, '2024-03-31 23:07:55', '2024-03-31 23:07:55'),
(36, 36, 1, 0, 14700.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:12:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0025', NULL, '2024-03-31 23:13:26', '2024-03-31 23:13:26'),
(37, 37, 1, 0, 5600.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:17:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0026', NULL, '2024-03-31 23:19:02', '2024-03-31 23:19:02'),
(38, 38, 1, 0, 81000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:31:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0027', NULL, '2024-03-31 23:32:35', '2024-03-31 23:32:35'),
(39, 39, 1, 0, 44400.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:36:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0028', NULL, '2024-03-31 23:38:13', '2024-03-31 23:38:13'),
(40, 40, 1, 0, 48750.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 19:43:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0029', NULL, '2024-03-31 23:44:28', '2024-03-31 23:44:28'),
(41, 34, 1, 0, 1060.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-31 20:06:00', 3, 0, NULL, 0, 13, NULL, NULL, NULL, 'PP2024/0030', NULL, '2024-04-01 00:06:57', '2024-04-01 00:06:57'),
(42, 42, 1, 0, 10340.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 19:22:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0031', NULL, '2024-04-01 23:24:29', '2024-04-01 23:24:29'),
(43, 43, 1, 0, 6600.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 19:31:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0032', NULL, '2024-04-01 23:32:05', '2024-04-01 23:32:05'),
(44, 44, 1, 0, 12350.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 19:35:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0033', NULL, '2024-04-01 23:36:34', '2024-04-01 23:36:34'),
(45, 45, 1, 0, 9000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 19:38:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0034', NULL, '2024-04-01 23:39:45', '2024-04-01 23:39:45'),
(46, 46, 1, 0, 9300.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 19:44:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0035', NULL, '2024-04-01 23:44:38', '2024-04-01 23:44:38'),
(47, 47, 1, 0, 35880.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 19:53:00', 3, 0, NULL, 0, 12, NULL, NULL, NULL, 'PP2024/0036', NULL, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(48, 48, 1, 0, 70800.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 20:13:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0037', NULL, '2024-04-02 00:14:42', '2024-04-02 00:14:42'),
(49, 49, 1, 0, 14750.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 20:19:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0038', NULL, '2024-04-02 00:20:17', '2024-04-02 00:20:17'),
(51, 51, 1, 0, 33900.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01 20:31:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0039', NULL, '2024-04-02 00:32:35', '2024-04-02 00:32:35'),
(54, 53, 1, 0, 5000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 19:22:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0040', NULL, '2024-04-02 23:23:21', '2024-04-02 23:23:21'),
(55, 54, 1, 0, 6240.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 19:27:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0041', NULL, '2024-04-02 23:27:49', '2024-04-02 23:27:49'),
(56, 55, 1, 0, 8500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 19:30:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0042', NULL, '2024-04-02 23:31:29', '2024-04-02 23:31:29'),
(57, 56, 1, 0, 8250.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 19:34:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0043', NULL, '2024-04-02 23:34:49', '2024-04-02 23:34:49'),
(58, 57, 1, 0, 2925.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 19:44:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0044', NULL, '2024-04-02 23:45:23', '2024-04-02 23:45:23'),
(60, 59, 1, 0, 17490.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 19:55:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0046', NULL, '2024-04-02 23:55:55', '2024-04-02 23:55:55'),
(61, 60, 1, 0, 4600.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 20:01:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0047', NULL, '2024-04-03 00:01:38', '2024-04-03 00:01:38'),
(62, 61, 1, 0, 20160.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 20:12:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0048', NULL, '2024-04-03 00:12:47', '2024-04-03 00:12:47'),
(63, 62, 1, 0, 102500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 20:18:00', 3, 0, NULL, 0, 15, NULL, NULL, NULL, 'PP2024/0049', NULL, '2024-04-03 00:19:18', '2024-04-03 00:19:18'),
(64, 63, 1, 0, 73075.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 20:26:00', 3, 0, NULL, 0, 15, NULL, NULL, NULL, 'PP2024/0050', NULL, '2024-04-03 00:27:32', '2024-04-03 00:27:32'),
(65, 64, 1, 0, 49350.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 20:34:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0051', NULL, '2024-04-03 00:35:05', '2024-04-03 00:35:05'),
(66, 65, 1, 0, 20560.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 20:40:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0052', NULL, '2024-04-03 00:40:53', '2024-04-03 00:40:53'),
(67, 66, 1, 0, 25700.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 20:48:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0053', NULL, '2024-04-03 00:49:24', '2024-04-03 00:49:24'),
(68, 67, 1, 0, 13080.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 21:18:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0054', NULL, '2024-04-03 01:18:54', '2024-04-03 01:18:54'),
(69, 68, 1, 0, 25200.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 21:21:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0055', NULL, '2024-04-03 01:22:21', '2024-04-03 01:22:21'),
(70, 69, 1, 0, 59400.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 21:24:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0056', NULL, '2024-04-03 01:25:31', '2024-04-03 01:25:31'),
(71, 71, 1, 0, 19080.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 21:31:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0057', NULL, '2024-04-03 01:32:28', '2024-04-03 01:32:28'),
(72, 72, 1, 0, 8100.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 21:36:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0058', NULL, '2024-04-03 01:36:35', '2024-04-03 01:36:35'),
(73, 73, 1, 0, 38500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 21:41:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0059', NULL, '2024-04-03 01:46:37', '2024-04-03 01:46:37'),
(74, 74, 1, 0, 42350.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 21:53:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0060', NULL, '2024-04-03 01:53:44', '2024-04-03 01:53:44'),
(75, 75, 1, 0, 4380.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 21:58:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0061', NULL, '2024-04-03 01:59:42', '2024-04-03 01:59:42'),
(76, 76, 1, 0, 38000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 22:21:00', 3, 0, NULL, 0, 17, NULL, NULL, NULL, 'PP2024/0062', NULL, '2024-04-05 02:23:05', '2024-04-05 02:23:05'),
(77, 77, 1, 0, 46250.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:06:00', 3, 0, NULL, 0, 17, NULL, NULL, NULL, 'PP2024/0063', NULL, '2024-04-05 03:07:09', '2024-04-05 03:07:09'),
(78, 78, 1, 0, 35000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:09:00', 3, 0, NULL, 0, 17, NULL, NULL, NULL, 'PP2024/0064', NULL, '2024-04-05 03:10:35', '2024-04-05 03:10:35'),
(79, 79, 1, 0, 42000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:14:00', 3, 0, NULL, 0, 17, NULL, NULL, NULL, 'PP2024/0065', NULL, '2024-04-05 03:15:04', '2024-04-05 03:15:04'),
(80, 80, 1, 0, 24700.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:19:00', 3, 0, NULL, 0, 18, NULL, NULL, NULL, 'PP2024/0066', NULL, '2024-04-05 03:20:27', '2024-04-05 03:20:27'),
(81, 81, 1, 0, 17500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:23:00', 3, 0, NULL, 0, 18, NULL, NULL, NULL, 'PP2024/0067', NULL, '2024-04-05 03:24:26', '2024-04-05 03:24:26'),
(82, 82, 1, 0, 37700.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:32:00', 3, 0, NULL, 0, 18, NULL, NULL, NULL, 'PP2024/0068', NULL, '2024-04-05 03:33:27', '2024-04-05 03:33:27'),
(83, 83, 1, 0, 10350.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:39:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0069', NULL, '2024-04-05 03:40:04', '2024-04-05 03:40:04'),
(84, 84, 1, 0, 10350.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:41:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0070', NULL, '2024-04-05 03:42:30', '2024-04-05 03:42:30'),
(85, 85, 1, 0, 28800.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:46:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0071', NULL, '2024-04-05 03:47:54', '2024-04-05 03:47:54'),
(86, 86, 1, 0, 23500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:50:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0072', NULL, '2024-04-05 03:50:51', '2024-04-05 03:50:51'),
(87, 87, 1, 0, 44500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:55:00', 3, 0, NULL, 0, 2, NULL, NULL, NULL, 'PP2024/0073', NULL, '2024-04-05 03:55:51', '2024-04-05 03:55:51'),
(88, 88, 1, 0, 31000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04 23:58:00', 3, 0, NULL, 0, 2, NULL, NULL, NULL, 'PP2024/0074', NULL, '2024-04-05 03:59:45', '2024-04-05 03:59:45'),
(89, 89, 1, 0, 155400.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 10:12:00', 3, 0, NULL, 0, 19, NULL, NULL, NULL, 'PP2024/0075', NULL, '2024-04-07 14:14:04', '2024-04-07 14:14:04'),
(90, 90, 1, 0, 65700.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 10:24:00', 3, 0, NULL, 0, 19, NULL, NULL, NULL, 'PP2024/0076', NULL, '2024-04-07 14:24:59', '2024-04-07 14:24:59'),
(91, 91, 1, 0, 159120.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 12:38:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0077', NULL, '2024-04-07 16:38:48', '2024-04-07 16:38:48'),
(92, 92, 1, 0, 33150.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 12:42:00', 3, 0, NULL, 0, 14, NULL, NULL, NULL, 'PP2024/0078', NULL, '2024-04-07 16:43:28', '2024-04-07 16:43:28'),
(93, 93, 1, 0, 184800.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 12:48:00', 3, 0, NULL, 0, 20, NULL, NULL, NULL, 'PP2024/0079', NULL, '2024-04-07 16:49:51', '2024-04-07 16:49:51'),
(94, 94, 1, 0, 69000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 14:01:00', 3, 0, NULL, 0, 20, NULL, NULL, NULL, 'PP2024/0080', NULL, '2024-04-07 18:02:47', '2024-04-07 18:02:47'),
(95, 95, 1, 0, 90000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 14:06:00', 3, 0, NULL, 0, 19, NULL, NULL, NULL, 'PP2024/0081', NULL, '2024-04-07 18:07:03', '2024-04-07 18:07:03'),
(96, 96, 1, 0, 127500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:00:00', 3, 0, NULL, 0, 20, NULL, NULL, NULL, 'PP2024/0082', NULL, '2024-04-07 19:01:10', '2024-04-07 19:01:10'),
(97, 97, 1, 0, 89100.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:11:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0083', NULL, '2024-04-07 19:12:55', '2024-04-07 19:12:55'),
(98, 98, 1, 0, 54000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:16:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0084', NULL, '2024-04-07 19:17:25', '2024-04-07 19:17:25'),
(99, 99, 1, 0, 5280.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:20:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0085', NULL, '2024-04-07 19:20:57', '2024-04-07 19:20:57'),
(100, 100, 1, 0, 40500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:26:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0086', NULL, '2024-04-07 19:26:41', '2024-04-07 19:26:41'),
(101, 101, 1, 0, 63480.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:32:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0087', NULL, '2024-04-07 19:32:42', '2024-04-07 19:32:42'),
(102, 102, 1, 0, 42300.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:36:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0088', NULL, '2024-04-07 19:36:55', '2024-04-07 19:36:55'),
(103, 103, 1, 0, 35250.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:39:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0089', NULL, '2024-04-07 19:40:07', '2024-04-07 19:40:07'),
(104, 104, 1, 0, 54000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:44:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0090', NULL, '2024-04-07 19:44:49', '2024-04-07 19:44:49'),
(105, 105, 1, 0, 69840.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-07 15:51:00', 3, 0, NULL, 0, 16, NULL, NULL, NULL, 'PP2024/0091', NULL, '2024-04-07 19:52:20', '2024-04-07 19:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2024-03-29 11:15:48', '2024-04-01 22:15:33'),
(2, 1, 'Pair', 'Pair', 0, NULL, NULL, 3, NULL, '2024-04-01 22:16:08', '2024-04-01 22:16:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'user',
  `surname` char(10) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `language` char(7) NOT NULL DEFAULT 'en',
  `contact_no` char(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `available_at` datetime DEFAULT NULL COMMENT 'Service staff avilable at. Calculated from product preparation_time_in_minutes',
  `paused_at` datetime DEFAULT NULL COMMENT 'Service staff available time paused at, Will be nulled on resume.',
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') NOT NULL DEFAULT 'active',
  `is_enable_service_staff_pin` tinyint(1) NOT NULL DEFAULT 0,
  `service_staff_pin` text DEFAULT NULL,
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') DEFAULT NULL,
  `blood_group` char(10) DEFAULT NULL,
  `contact_number` char(20) DEFAULT NULL,
  `alt_number` varchar(191) DEFAULT NULL,
  `family_number` varchar(191) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `twitter_link` varchar(191) DEFAULT NULL,
  `social_media_1` varchar(191) DEFAULT NULL,
  `social_media_2` varchar(191) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `bank_details` longtext DEFAULT NULL,
  `id_proof_name` varchar(191) DEFAULT NULL,
  `id_proof_number` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `available_at`, `paused_at`, `max_sales_discount_percent`, `allow_login`, `status`, `is_enable_service_staff_pin`, `service_staff_pin`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', NULL, 'Pirathi', NULL, 'Pirathi', 'pirathi93@gmail.com', '$2y$10$OcA3o5J3XchcRJIIeSDZkeL5F9DEW8hmO2cPvu1kEvPL8fixNmiW6', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-29 11:15:48', '2024-03-29 11:15:48'),
(2, 'user', NULL, 'Manager', NULL, 'manager', 'manager@gmail.com', '$2y$10$qHdKmilo2aSWBs1NMOgBp.TgQlWO1WtSjKWJont4MDsCy/2lJAll.', 'en', NULL, NULL, NULL, 1, NULL, NULL, 5.00, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-03-30 00:16:29', '2024-03-30 01:18:03'),
(3, 'user', NULL, 'Loges', NULL, 'loges', 'loges@gmail.com', '$2y$10$2Xd2Tce6yUGWY7ubsZF7y./hFc7uIXXx4FKicTedPn/r/QMp0HWIe', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-03-30 19:04:23', '2024-03-30 19:12:34'),
(4, 'user', NULL, 'kayanthan', NULL, 'kayanthan', 'rsusan26@gmail.com', '$2y$10$S.gI1C6Qc0NeXLbfu5SFCOpjSuW9.bxXw3aHjUaRkl3bkGm7uiIxi', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-03-30 19:07:54', '2024-03-31 15:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text DEFAULT NULL COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(13, 'DUMMY', 13, 'vpa-0013', 13, NULL, 1700.0000, 1700.0000, 20.0000, 2040.0000, 2040.0000, '2024-03-31 16:11:39', '2024-03-31 17:34:23', NULL, '[]'),
(14, 'DUMMY', 14, 'vpa-0014', 14, NULL, 1600.0000, 1600.0000, 20.0000, 1920.0000, 1920.0000, '2024-03-31 17:10:49', '2024-03-31 17:23:05', NULL, '[]'),
(16, 'DUMMY', 16, 'vpa-0016', 16, NULL, 1250.0000, 1250.0000, 22.0000, 1525.0000, 1525.0000, '2024-03-31 18:15:07', '2024-03-31 18:15:07', NULL, '[]'),
(17, 'DUMMY', 17, 'vpa-0017', 17, NULL, 410.0000, 410.0000, 26.8300, 520.0000, 520.0000, '2024-03-31 18:30:54', '2024-03-31 18:30:54', NULL, '[]'),
(19, 'DUMMY', 19, 'vpa-0019', 19, NULL, 550.0000, 550.0000, 18.1800, 650.0000, 650.0000, '2024-03-31 18:52:41', '2024-03-31 18:52:41', NULL, '[]'),
(21, 'DUMMY', 21, 'vpa-0021', 21, NULL, 380.0000, 380.0000, 28.9500, 490.0000, 490.0000, '2024-03-31 19:24:34', '2024-03-31 19:24:34', NULL, '[]'),
(22, 'DUMMY', 22, 'vpa-0022', 22, NULL, 900.0000, 900.0000, 35.0000, 1215.0000, 1215.0000, '2024-03-31 19:27:46', '2024-03-31 21:32:41', NULL, '[]'),
(23, 'DUMMY', 23, 'vpa-0023', 23, NULL, 315.0000, 315.0000, 25.4000, 395.0000, 395.0000, '2024-03-31 19:42:04', '2024-03-31 19:42:04', NULL, '[]'),
(24, 'DUMMY', 24, 'vpa-0024', 24, NULL, 285.0000, 285.0000, 38.6000, 395.0000, 395.0000, '2024-03-31 19:44:00', '2024-03-31 19:44:00', NULL, '[]'),
(25, 'DUMMY', 25, 'vpa-0025', 25, NULL, 420.0000, 420.0000, 25.0000, 525.0000, 525.0000, '2024-03-31 19:53:58', '2024-03-31 21:17:06', NULL, '[]'),
(26, 'DUMMY', 26, 'vpa-0026', 26, NULL, 350.0000, 350.0000, 25.7100, 440.0000, 440.0000, '2024-03-31 19:55:24', '2024-03-31 21:58:30', NULL, '[]'),
(28, 'DUMMY', 28, 'vpa-0028', 28, NULL, 1275.0000, 1275.0000, 15.6900, 1475.0000, 1475.0000, '2024-03-31 20:03:23', '2024-03-31 20:03:23', NULL, '[]'),
(29, 'DUMMY', 29, 'vpa-0029', 29, NULL, 1290.0000, 1290.0000, 17.8300, 1520.0000, 1520.0000, '2024-03-31 20:09:34', '2024-03-31 20:09:34', NULL, '[]'),
(30, 'DUMMY', 30, 'vpa-0030', 30, NULL, 1090.0000, 1090.0000, 24.7700, 1360.0000, 1360.0000, '2024-03-31 20:12:02', '2024-03-31 20:12:02', NULL, '[]'),
(31, 'DUMMY', 31, 'vpa-0031', 31, NULL, 990.0000, 990.0000, 25.2500, 1240.0000, 1240.0000, '2024-03-31 20:38:27', '2024-03-31 21:55:40', NULL, '[]'),
(32, 'DUMMY', 32, 'vpa-0032', 32, NULL, 530.0000, 530.0000, 25.4700, 665.0000, 665.0000, '2024-03-31 20:49:01', '2024-03-31 22:13:08', NULL, '[]'),
(33, 'DUMMY', 33, 'vpa-0033', 33, NULL, 575.0000, 575.0000, 20.0000, 690.0000, 690.0000, '2024-03-31 23:04:47', '2024-03-31 23:04:47', NULL, '[]'),
(34, 'DUMMY', 34, 'vpa-0034', 34, NULL, 490.0000, 490.0000, 20.4100, 590.0000, 590.0000, '2024-03-31 23:12:08', '2024-03-31 23:12:08', NULL, '[]'),
(35, 'DUMMY', 35, 'vpa-0035', 35, NULL, 280.0000, 280.0000, 25.0000, 350.0000, 350.0000, '2024-03-31 23:17:11', '2024-03-31 23:17:11', NULL, '[]'),
(36, 'DUMMY', 36, 'vpa-0036', 36, NULL, 1800.0000, 1800.0000, 20.0000, 2160.0000, 2160.0000, '2024-03-31 23:30:28', '2024-03-31 23:31:34', NULL, '[]'),
(37, 'DUMMY', 37, 'vpa-0037', 37, NULL, 1850.0000, 1850.0000, 20.0000, 2220.0000, 2220.0000, '2024-03-31 23:36:40', '2024-03-31 23:36:40', NULL, '[]'),
(38, 'DUMMY', 38, 'vpa-0038', 38, NULL, 1950.0000, 1950.0000, 20.0000, 2340.0000, 2340.0000, '2024-03-31 23:43:40', '2024-03-31 23:43:40', NULL, '[]'),
(40, 'DUMMY', 40, 'vpa-0040', 40, NULL, 220.0000, 220.0000, 25.0000, 275.0000, 275.0000, '2024-04-01 23:22:24', '2024-04-01 23:22:24', NULL, '[]'),
(41, 'DUMMY', 41, 'vpa-0041', 41, NULL, 550.0000, 550.0000, 36.3600, 750.0000, 750.0000, '2024-04-01 23:31:16', '2024-04-01 23:31:16', NULL, '[]'),
(42, 'DUMMY', 42, 'vpa-0042', 42, NULL, 950.0000, 950.0000, 31.5800, 1250.0000, 1250.0000, '2024-04-01 23:35:45', '2024-04-01 23:35:45', NULL, '[]'),
(43, 'DUMMY', 43, 'vpa-0043', 43, NULL, 750.0000, 750.0000, 28.0000, 960.0000, 960.0000, '2024-04-01 23:38:49', '2024-04-01 23:40:19', NULL, '[]'),
(44, 'DUMMY', 44, 'vpa-0044', 44, NULL, 775.0000, 775.0000, 35.4800, 1050.0000, 1050.0000, '2024-04-01 23:43:54', '2024-04-01 23:43:54', NULL, '[]'),
(45, 'S', 45, 'vpa-0045-1', 45, 1, 620.0000, 620.0000, 27.4200, 790.0000, 790.0000, '2024-04-01 23:49:22', '2024-04-02 21:54:33', NULL, NULL),
(46, 'M', 45, 'vpa-0045-2', 45, 2, 620.0000, 620.0000, 27.4200, 790.0000, 790.0000, '2024-04-01 23:49:22', '2024-04-02 21:54:33', NULL, NULL),
(47, 'L', 45, 'vpa-0045-3', 45, 3, 620.0000, 620.0000, 27.4200, 790.0000, 790.0000, '2024-04-01 23:49:22', '2024-04-02 21:54:33', NULL, NULL),
(48, 'XL', 45, 'vpa-0045-4', 45, 4, 620.0000, 620.0000, 27.4200, 790.0000, 790.0000, '2024-04-01 23:49:22', '2024-04-02 21:54:33', NULL, NULL),
(49, 'XXL', 45, 'vpa-0045-5', 45, 5, 680.0000, 680.0000, 25.0000, 850.0000, 850.0000, '2024-04-01 23:49:22', '2024-04-02 21:54:33', NULL, NULL),
(50, 'DUMMY', 46, 'vpa-0046', 46, NULL, 2950.0000, 2950.0000, 20.0000, 3540.0000, 3540.0000, '2024-04-02 00:13:37', '2024-04-02 00:13:37', NULL, '[]'),
(51, 'DUMMY', 47, 'vpa-0047', 47, NULL, 2950.0000, 2950.0000, 20.0000, 3540.0000, 3540.0000, '2024-04-02 00:19:17', '2024-04-02 00:19:17', NULL, '[]'),
(52, 'DUMMY', 48, 'vpa-0048', 48, NULL, 2260.0000, 2260.0000, 25.0000, 2825.0000, 2825.0000, '2024-04-02 00:30:56', '2024-04-02 00:30:56', NULL, '[]'),
(53, 'DUMMY', 49, 'vpa-0049', 49, NULL, 1000.0000, 1000.0000, 25.0000, 1250.0000, 1250.0000, '2024-04-02 23:22:20', '2024-04-02 23:22:20', NULL, '[]'),
(54, 'DUMMY', 50, 'vpa-0050', 50, NULL, 780.0000, 780.0000, 26.9200, 990.0000, 990.0000, '2024-04-02 23:27:10', '2024-04-02 23:27:10', NULL, '[]'),
(55, 'DUMMY', 51, 'vpa-0051', 51, NULL, 1700.0000, 1700.0000, 25.0000, 2125.0000, 2125.0000, '2024-04-02 23:30:50', '2024-04-02 23:30:50', NULL, '[]'),
(56, 'DUMMY', 52, 'vpa-0052', 52, NULL, 1650.0000, 1650.0000, 26.6700, 2090.0000, 2090.0000, '2024-04-02 23:34:06', '2024-04-02 23:34:06', NULL, '[]'),
(57, 'DUMMY', 53, 'vpa-0053', 53, NULL, 585.0000, 585.0000, 35.0400, 790.0000, 790.0000, '2024-04-02 23:44:38', '2024-04-02 23:44:38', NULL, '[]'),
(58, 'DUMMY', 54, 'vpa-0054', 54, NULL, 1590.0000, 1590.0000, 24.5300, 1980.0000, 1980.0000, '2024-04-02 23:55:17', '2024-04-02 23:55:17', NULL, '[]'),
(59, 'DUMMY', 55, 'vpa-0055', 55, NULL, 1150.0000, 1150.0000, 26.0900, 1450.0000, 1450.0000, '2024-04-02 23:59:27', '2024-04-03 00:01:02', NULL, '[]'),
(60, 'DUMMY', 56, 'vpa-0056', 56, NULL, 3360.0000, 3360.0000, 16.0700, 3900.0000, 3900.0000, '2024-04-03 00:11:29', '2024-04-03 00:12:04', NULL, '[]'),
(61, 'DUMMY', 57, 'vpa-0057', 57, NULL, 1250.0000, 1250.0000, 24.8000, 1560.0000, 1560.0000, '2024-04-03 00:18:01', '2024-04-03 00:18:01', NULL, '[]'),
(62, 'DUMMY', 58, 'vpa-0058', 58, NULL, 925.0000, 925.0000, 35.1400, 1250.0000, 1250.0000, '2024-04-03 00:25:58', '2024-04-03 00:25:58', NULL, '[]'),
(63, 'DUMMY', 59, 'vpa-0059', 59, NULL, 1175.0000, 1175.0000, 10.6400, 1300.0000, 1300.0000, '2024-04-03 00:34:01', '2024-04-03 00:34:01', NULL, '[]'),
(64, 'DUMMY', 60, 'vpa-0060', 60, NULL, 1285.0000, 1285.0000, 24.5100, 1600.0000, 1600.0000, '2024-04-03 00:40:08', '2024-04-03 00:40:08', NULL, '[]'),
(65, 'DUMMY', 61, 'vpa-0061', 61, NULL, 1285.0000, 1285.0000, 12.8400, 1450.0000, 1450.0000, '2024-04-03 00:48:22', '2024-04-03 00:51:59', NULL, '[]'),
(66, 'DUMMY', 62, 'vpa-0062', 62, NULL, 2180.0000, 2180.0000, 25.0000, 2725.0000, 2725.0000, '2024-04-03 01:18:14', '2024-04-03 01:18:14', NULL, '[]'),
(67, 'DUMMY', 63, 'vpa-0063', 63, NULL, 1050.0000, 1050.0000, 28.5700, 1350.0000, 1350.0000, '2024-04-03 01:21:13', '2024-04-03 01:21:13', NULL, '[]'),
(68, 'DUMMY', 64, 'vpa-0064', 64, NULL, 2475.0000, 2475.0000, 19.1900, 2950.0000, 2950.0000, '2024-04-03 01:24:49', '2024-04-03 01:24:49', NULL, '[]'),
(69, 'DUMMY', 65, 'vpa-0065', 65, NULL, 3180.0000, 3180.0000, 25.0000, 3975.0000, 3975.0000, '2024-04-03 01:31:21', '2024-04-03 01:31:21', NULL, '[]'),
(70, 'DUMMY', 66, 'vpa-0066', 66, NULL, 1350.0000, 1350.0000, 25.1900, 1690.0000, 1690.0000, '2024-04-03 01:35:56', '2024-04-03 01:35:56', NULL, '[]'),
(71, 'DUMMY', 67, 'vpa-0067', 67, NULL, 1925.0000, 1925.0000, 25.1900, 2410.0000, 2410.0000, '2024-04-03 01:41:42', '2024-04-03 01:41:42', NULL, '[]'),
(72, 'DUMMY', 68, 'vpa-0068', 68, NULL, 1925.0000, 1925.0000, 25.1900, 2410.0000, 2410.0000, '2024-04-03 01:53:04', '2024-04-03 01:53:04', NULL, '[]'),
(73, 'DUMMY', 69, 'vpa-0069', 69, NULL, 4380.0000, 4380.0000, 25.0000, 5475.0000, 5475.0000, '2024-04-03 01:58:51', '2024-04-03 01:58:51', NULL, '[]'),
(74, 'DUMMY', 70, 'vpa-0070', 70, NULL, 950.0000, 950.0000, 24.2100, 1180.0000, 1180.0000, '2024-04-05 02:21:10', '2024-04-05 02:21:10', NULL, '[]'),
(75, 'DUMMY', 71, 'vpa-0071', 71, NULL, 1850.0000, 1850.0000, 25.4100, 2320.0000, 2320.0000, '2024-04-05 03:06:04', '2024-04-05 03:06:04', NULL, '[]'),
(76, 'DUMMY', 72, 'vpa-0072', 72, NULL, 1750.0000, 1750.0000, 26.2900, 2210.0000, 2210.0000, '2024-04-05 03:09:51', '2024-04-05 03:09:51', NULL, '[]'),
(77, 'DUMMY', 73, 'vpa-0073', 73, NULL, 1750.0000, 1750.0000, 26.2900, 2210.0000, 2210.0000, '2024-04-05 03:14:17', '2024-04-05 03:14:17', NULL, '[]'),
(78, 'DUMMY', 74, 'vpa-0074', 74, NULL, 650.0000, 650.0000, 36.9200, 890.0000, 890.0000, '2024-04-05 03:19:12', '2024-04-05 03:19:12', NULL, '[]'),
(79, 'DUMMY', 75, 'vpa-0075', 75, NULL, 875.0000, 875.0000, 31.4300, 1150.0000, 1150.0000, '2024-04-05 03:23:42', '2024-04-05 03:23:42', NULL, '[]'),
(80, 'DUMMY', 76, 'vpa-0076', 76, NULL, 2350.0000, 2350.0000, 12.7700, 2650.0000, 2650.0000, '2024-04-05 03:28:34', '2024-04-05 03:50:08', NULL, '[]'),
(81, 'DUMMY', 77, 'vpa-0077', 77, NULL, 890.0000, 890.0000, 25.8400, 1120.0000, 1120.0000, '2024-04-05 03:54:45', '2024-04-05 03:54:45', NULL, '[]'),
(82, 'DUMMY', 78, 'vpa-0078', 78, NULL, 1550.0000, 1550.0000, 25.1600, 1940.0000, 1940.0000, '2024-04-05 03:58:28', '2024-04-05 04:05:52', NULL, '[]'),
(83, 'DUMMY', 79, 'vpa-0079', 79, NULL, 1850.0000, 1850.0000, 40.0000, 2590.0000, 2590.0000, '2024-04-07 14:05:58', '2024-04-07 14:29:47', NULL, '[]'),
(84, 'DUMMY', 80, 'vpa-0080', 80, NULL, 1825.0000, 1825.0000, 39.7300, 2550.0000, 2550.0000, '2024-04-07 14:20:55', '2024-04-07 14:23:57', NULL, '[]'),
(85, 'DUMMY', 81, 'vpa-0081', 81, NULL, 1530.0000, 1530.0000, 15.0300, 1760.0000, 1760.0000, '2024-04-07 16:38:09', '2024-04-07 16:38:09', NULL, '[]'),
(86, 'DUMMY', 82, 'vpa-0082', 82, NULL, 975.0000, 975.0000, 25.1300, 1220.0000, 1220.0000, '2024-04-07 16:42:40', '2024-04-07 16:42:40', NULL, '[]'),
(87, 'DUMMY', 83, 'vpa-0083', 83, NULL, 2200.0000, 2200.0000, 47.7300, 3250.0000, 3250.0000, '2024-04-07 16:48:50', '2024-04-07 16:48:50', NULL, '[]'),
(88, 'DUMMY', 84, 'vpa-0084', 84, NULL, 2300.0000, 2300.0000, 25.0000, 2875.0000, 2875.0000, '2024-04-07 18:01:53', '2024-04-07 18:01:53', NULL, '[]'),
(89, 'DUMMY', 85, 'vpa-0085', 85, NULL, 600.0000, 600.0000, 48.3300, 890.0000, 890.0000, '2024-04-07 18:06:00', '2024-04-07 18:06:00', NULL, '[]'),
(90, 'DUMMY', 86, 'vpa-0086', 86, NULL, 1250.0000, 1250.0000, 26.0000, 1575.0000, 1575.0000, '2024-04-07 19:00:37', '2024-04-07 19:00:37', NULL, '[]'),
(91, 'DUMMY', 87, 'vpa-0087', 87, NULL, 3300.0000, 3300.0000, 9.0900, 3600.0000, 3600.0000, '2024-04-07 19:11:15', '2024-04-07 19:11:15', NULL, '[]'),
(92, 'DUMMY', 88, 'vpa-0088', 88, NULL, 4500.0000, 4500.0000, 35.5600, 6100.0000, 6100.0000, '2024-04-07 19:16:34', '2024-04-07 19:16:34', NULL, '[]'),
(93, 'DUMMY', 89, 'vpa-0089', 89, NULL, 5280.0000, 5280.0000, 42.8000, 7540.0000, 7540.0000, '2024-04-07 19:20:23', '2024-04-07 19:20:23', NULL, '[]'),
(94, 'DUMMY', 90, 'vpa-0090', 90, NULL, 4500.0000, 4500.0000, 42.6700, 6420.0000, 6420.0000, '2024-04-07 19:25:56', '2024-04-07 19:25:56', NULL, '[]'),
(95, 'DUMMY', 91, 'vpa-0091', 91, NULL, 10580.0000, 10580.0000, 53.1200, 16200.0000, 16200.0000, '2024-04-07 19:32:00', '2024-04-07 19:32:00', NULL, '[]'),
(96, 'DUMMY', 92, 'vpa-0092', 92, NULL, 7050.0000, 7050.0000, 16.3100, 8200.0000, 8200.0000, '2024-04-07 19:36:15', '2024-04-07 19:36:15', NULL, '[]'),
(97, 'DUMMY', 93, 'vpa-0093', 93, NULL, 7050.0000, 7050.0000, 12.7700, 7950.0000, 7950.0000, '2024-04-07 19:39:25', '2024-04-07 19:39:25', NULL, '[]'),
(98, 'DUMMY', 94, 'vpa-0094', 94, NULL, 4500.0000, 4500.0000, 25.0000, 5625.0000, 5625.0000, '2024-04-07 19:44:03', '2024-04-07 19:44:03', NULL, '[]'),
(99, 'DUMMY', 95, 'vpa-0095', 95, NULL, 5820.0000, 5820.0000, 0.5200, 5850.0000, 5850.0000, '2024-04-07 19:51:39', '2024-04-07 19:51:39', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `price_type` varchar(191) NOT NULL DEFAULT 'fixed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(8, 13, 13, 13, 1, 47.0000, '2024-03-31 16:28:00', '2024-03-31 17:36:43'),
(9, 14, 14, 14, 1, 267.0000, '2024-03-31 17:14:10', '2024-03-31 17:14:10'),
(10, 16, 16, 16, 1, 148.0000, '2024-03-31 18:16:59', '2024-03-31 18:16:59'),
(11, 17, 17, 17, 1, 103.0000, '2024-03-31 18:36:50', '2024-03-31 18:36:50'),
(12, 19, 19, 19, 1, 69.0000, '2024-03-31 18:56:17', '2024-03-31 18:56:17'),
(13, 21, 21, 21, 1, 105.0000, '2024-03-31 19:26:26', '2024-03-31 19:26:26'),
(14, 22, 22, 22, 1, 25.0000, '2024-03-31 19:31:50', '2024-03-31 19:31:50'),
(15, 23, 23, 23, 1, 10.0000, '2024-03-31 19:45:38', '2024-03-31 19:45:38'),
(16, 25, 25, 25, 1, 73.0000, '2024-03-31 19:56:44', '2024-03-31 22:29:22'),
(17, 28, 28, 28, 1, 30.0000, '2024-03-31 20:09:49', '2024-03-31 20:09:49'),
(18, 29, 29, 29, 1, 10.0000, '2024-03-31 20:17:43', '2024-03-31 20:17:43'),
(19, 30, 30, 30, 1, 20.0000, '2024-03-31 20:20:45', '2024-03-31 20:20:45'),
(20, 31, 31, 31, 1, 29.0000, '2024-03-31 21:57:37', '2024-03-31 21:57:37'),
(21, 26, 26, 26, 1, 20.0000, '2024-03-31 22:00:09', '2024-03-31 22:00:09'),
(22, 24, 24, 24, 1, 30.0000, '2024-03-31 22:03:46', '2024-03-31 22:03:46'),
(23, 32, 32, 32, 1, 20.0000, '2024-03-31 22:15:05', '2024-03-31 22:43:29'),
(24, 33, 33, 33, 1, 44.0000, '2024-03-31 23:07:55', '2024-03-31 23:07:55'),
(25, 34, 34, 34, 1, 30.0000, '2024-03-31 23:13:26', '2024-03-31 23:13:26'),
(26, 35, 35, 35, 1, 20.0000, '2024-03-31 23:19:02', '2024-03-31 23:19:02'),
(27, 36, 36, 36, 1, 45.0000, '2024-03-31 23:32:35', '2024-04-02 01:27:00'),
(28, 37, 37, 37, 1, 24.0000, '2024-03-31 23:38:13', '2024-03-31 23:38:13'),
(29, 38, 38, 38, 1, 5.0000, '2024-03-31 23:44:28', '2024-03-31 23:55:47'),
(30, 40, 40, 40, 1, 47.0000, '2024-04-01 23:24:29', '2024-04-01 23:24:29'),
(31, 41, 41, 41, 1, 12.0000, '2024-04-01 23:32:05', '2024-04-01 23:32:05'),
(32, 42, 42, 42, 1, 13.0000, '2024-04-01 23:36:34', '2024-04-01 23:36:34'),
(33, 43, 43, 43, 1, 12.0000, '2024-04-01 23:39:45', '2024-04-01 23:39:45'),
(34, 44, 44, 44, 1, 12.0000, '2024-04-01 23:44:38', '2024-04-01 23:44:38'),
(35, 45, 45, 45, 1, 12.0000, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(36, 45, 45, 46, 1, 12.0000, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(37, 45, 45, 47, 1, 12.0000, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(38, 45, 45, 48, 1, 12.0000, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(39, 45, 45, 49, 1, 9.0000, '2024-04-01 23:55:07', '2024-04-01 23:55:07'),
(40, 46, 46, 50, 1, 24.0000, '2024-04-02 00:14:42', '2024-04-02 00:14:42'),
(41, 47, 47, 51, 1, 5.0000, '2024-04-02 00:20:17', '2024-04-02 00:20:17'),
(42, 48, 48, 52, 1, 15.0000, '2024-04-02 00:32:35', '2024-04-02 00:32:35'),
(43, 49, 49, 53, 1, 5.0000, '2024-04-02 23:23:21', '2024-04-02 23:23:21'),
(44, 50, 50, 54, 1, 8.0000, '2024-04-02 23:27:49', '2024-04-02 23:27:49'),
(45, 51, 51, 55, 1, 5.0000, '2024-04-02 23:31:29', '2024-04-02 23:31:29'),
(46, 52, 52, 56, 1, 5.0000, '2024-04-02 23:34:49', '2024-04-02 23:34:49'),
(47, 53, 53, 57, 1, 5.0000, '2024-04-02 23:45:23', '2024-04-03 01:10:10'),
(48, 54, 54, 58, 1, 11.0000, '2024-04-02 23:55:54', '2024-04-02 23:55:54'),
(49, 55, 55, 59, 1, 4.0000, '2024-04-03 00:01:38', '2024-04-03 00:01:38'),
(50, 56, 56, 60, 1, 6.0000, '2024-04-03 00:12:47', '2024-04-03 00:12:47'),
(51, 57, 57, 61, 1, 82.0000, '2024-04-03 00:19:18', '2024-04-03 00:19:18'),
(52, 58, 58, 62, 1, 79.0000, '2024-04-03 00:27:32', '2024-04-03 00:27:32'),
(53, 59, 59, 63, 1, 42.0000, '2024-04-03 00:35:05', '2024-04-03 00:35:05'),
(54, 60, 60, 64, 1, 16.0000, '2024-04-03 00:40:53', '2024-04-03 00:40:53'),
(55, 61, 61, 65, 1, 20.0000, '2024-04-03 00:49:24', '2024-04-03 00:49:24'),
(56, 62, 62, 66, 1, 6.0000, '2024-04-03 01:18:54', '2024-04-03 01:18:54'),
(57, 63, 63, 67, 1, 24.0000, '2024-04-03 01:22:21', '2024-04-03 01:22:21'),
(58, 64, 64, 68, 1, 6.0000, '2024-04-03 01:25:31', '2024-04-03 01:29:26'),
(59, 65, 65, 69, 1, 6.0000, '2024-04-03 01:32:28', '2024-04-03 01:32:28'),
(60, 66, 66, 70, 1, 6.0000, '2024-04-03 01:36:35', '2024-04-03 01:36:35'),
(61, 67, 67, 71, 1, 20.0000, '2024-04-03 01:46:37', '2024-04-03 01:46:37'),
(62, 68, 68, 72, 1, 22.0000, '2024-04-03 01:53:44', '2024-04-03 01:53:44'),
(63, 69, 69, 73, 1, 28.0000, '2024-04-03 01:59:42', '2024-04-03 02:02:10'),
(64, 70, 70, 74, 1, 40.0000, '2024-04-05 02:23:05', '2024-04-05 02:23:05'),
(65, 71, 71, 75, 1, 25.0000, '2024-04-05 03:07:09', '2024-04-05 03:07:09'),
(66, 72, 72, 76, 1, 20.0000, '2024-04-05 03:10:35', '2024-04-05 03:10:35'),
(67, 73, 73, 77, 1, 24.0000, '2024-04-05 03:15:04', '2024-04-05 03:15:04'),
(68, 74, 74, 78, 1, 38.0000, '2024-04-05 03:20:27', '2024-04-05 03:20:27'),
(69, 75, 75, 79, 1, 20.0000, '2024-04-05 03:24:26', '2024-04-05 03:24:26'),
(70, 76, 76, 80, 1, 98.0000, '2024-04-05 03:33:27', '2024-04-05 03:50:51'),
(71, 77, 77, 81, 1, 50.0000, '2024-04-05 03:55:51', '2024-04-05 03:55:51'),
(72, 78, 78, 82, 1, 20.0000, '2024-04-05 03:59:45', '2024-04-05 03:59:45'),
(73, 79, 79, 83, 1, 84.0000, '2024-04-07 14:14:04', '2024-04-07 14:14:04'),
(74, 80, 80, 84, 1, 36.0000, '2024-04-07 14:24:59', '2024-04-07 14:24:59'),
(75, 81, 81, 85, 1, 104.0000, '2024-04-07 16:38:48', '2024-04-07 16:38:48'),
(76, 82, 82, 86, 1, 34.0000, '2024-04-07 16:43:28', '2024-04-07 16:43:28'),
(77, 83, 83, 87, 1, 84.0000, '2024-04-07 16:49:51', '2024-04-07 16:49:51'),
(78, 84, 84, 88, 1, 30.0000, '2024-04-07 18:02:47', '2024-04-07 18:02:47'),
(79, 85, 85, 89, 1, 150.0000, '2024-04-07 18:07:03', '2024-04-07 18:07:03'),
(80, 86, 86, 90, 1, 102.0000, '2024-04-07 19:01:10', '2024-04-07 19:01:10'),
(81, 87, 87, 91, 1, 27.0000, '2024-04-07 19:12:55', '2024-04-07 19:12:55'),
(82, 88, 88, 92, 1, 12.0000, '2024-04-07 19:17:25', '2024-04-07 19:17:25'),
(83, 89, 89, 93, 1, 1.0000, '2024-04-07 19:20:57', '2024-04-07 19:20:57'),
(84, 90, 90, 94, 1, 9.0000, '2024-04-07 19:26:41', '2024-04-07 19:26:41'),
(85, 91, 91, 95, 1, 6.0000, '2024-04-07 19:32:41', '2024-04-07 19:32:41'),
(86, 92, 92, 96, 1, 6.0000, '2024-04-07 19:36:55', '2024-04-07 19:36:55'),
(87, 93, 93, 97, 1, 5.0000, '2024-04-07 19:40:07', '2024-04-07 19:40:07'),
(88, 94, 94, 98, 1, 12.0000, '2024-04-07 19:44:48', '2024-04-07 19:44:48'),
(89, 95, 95, 99, 1, 12.0000, '2024-04-07 19:52:20', '2024-04-07 19:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'Size', 1, '2024-03-31 14:19:37', '2024-03-31 14:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, 'S', 1, '2024-03-31 14:19:37', '2024-03-31 14:19:37'),
(2, 'M', 1, '2024-03-31 14:19:37', '2024-03-31 14:19:37'),
(3, 'L', 1, '2024-03-31 14:19:37', '2024-03-31 14:19:37'),
(4, 'XL', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49'),
(5, 'XXL', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49'),
(6, 'XXXL', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49'),
(7, '4XL', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49'),
(8, '151/2', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49'),
(9, '16', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49'),
(10, '161/2', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49'),
(11, '17', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49'),
(12, '171/2', 1, '2024-04-01 22:10:49', '2024-04-01 22:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_denominations`
--
ALTER TABLE `cash_denominations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_denominations_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`),
  ADD KEY `invoice_schemes_number_type_index` (`number_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`),
  ADD KEY `products_secondary_unit_id_index` (`secondary_unit_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_business_id_foreign` (`business_id`),
  ADD KEY `subscriptions_package_id_index` (`package_id`),
  ADD KEY `subscriptions_created_id_index` (`created_id`);

--
-- Indexes for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `transactions_delivery_date_index` (`delivery_date`),
  ADD KEY `transactions_delivery_person_index` (`delivery_person`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`),
  ADD KEY `transaction_payments_payment_type_index` (`payment_type`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cash_denominations`
--
ALTER TABLE `cash_denominations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
