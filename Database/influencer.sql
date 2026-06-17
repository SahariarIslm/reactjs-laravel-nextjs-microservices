-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jun 17, 2026 at 10:45 PM
-- Server version: 9.7.0
-- PHP Version: 8.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `influencer`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"a98e05ab-c4ae-45b7-ae2c-404641ed8edd\",\"displayName\":\"App\\\\Jobs\\\\AdminAdded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AdminAdded\",\"command\":\"O:19:\\\"App\\\\Jobs\\\\AdminAdded\\\":0:{}\",\"batchId\":null},\"createdAt\":1781600924,\"delay\":null}', 0, NULL, 1781600924, 1781600924),
(2, 'default', '{\"uuid\":\"b5435347-7630-44ea-9954-31e71e819351\",\"displayName\":\"App\\\\Jobs\\\\AdminAdded\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AdminAdded\",\"command\":\"O:19:\\\"App\\\\Jobs\\\\AdminAdded\\\":0:{}\",\"batchId\":null},\"createdAt\":1781601102,\"delay\":null}', 0, NULL, 1781601102, 1781601102);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `code`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'ujC3BZ', 22, '2026-06-08 10:54:51', '2026-06-08 10:54:51'),
(2, 'uhPq95', 22, '2026-06-10 02:48:40', '2026-06-10 02:48:40'),
(3, 'knYsz5', 22, '2026-06-10 03:23:57', '2026-06-10 03:23:57'),
(4, 'CeG5Sd', 22, '2026-06-14 11:24:22', '2026-06-14 11:24:22'),
(5, 'MsM7MJ', 22, '2026-06-14 11:48:06', '2026-06-14 11:48:06'),
(6, 'zwaMDs', 22, '2026-06-14 11:52:53', '2026-06-14 11:52:53'),
(7, '1AuCD6', 22, '2026-06-17 22:07:28', '2026-06-17 22:07:28'),
(8, 'JQxEJH', 23, '2026-06-17 22:17:43', '2026-06-17 22:17:43'),
(9, 'fvabPs', 23, '2026-06-17 22:17:53', '2026-06-17 22:17:53');

-- --------------------------------------------------------

--
-- Table structure for table `link_products`
--

CREATE TABLE `link_products` (
  `id` bigint UNSIGNED NOT NULL,
  `link_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `link_products`
--

INSERT INTO `link_products` (`id`, `link_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 3, 3, NULL, NULL),
(6, 3, 4, NULL, NULL),
(7, 4, 1, NULL, NULL),
(8, 5, 1, NULL, NULL),
(9, 5, 2, NULL, NULL),
(10, 6, 1, NULL, NULL),
(11, 7, 1, NULL, NULL),
(12, 7, 2, NULL, NULL),
(13, 8, 1, NULL, NULL),
(14, 8, 3, NULL, NULL),
(15, 9, 1, NULL, NULL),
(16, 9, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_05_22_080436_create_personal_access_tokens_table', 1),
(5, '2026_05_23_033548_create_roles_table', 1),
(6, '2026_05_23_050454_add_role_id_to_users_table', 1),
(7, '2026_05_23_062826_create_products_table', 1),
(8, '2026_05_23_102959_create_orders_table', 1),
(9, '2026_05_23_103025_create_order_items_table_table', 1),
(10, '2026_05_23_130756_create_permissions_table', 1),
(11, '2026_05_23_131206_create_role_permission_table', 1),
(12, '2026_06_03_090758_add_is_influencer_column_to_users_table', 2),
(13, '2026_06_03_094649_create_user_roles_table', 3),
(14, '2026_06_03_104545_drop_role_id_column_to_users_table', 4),
(17, '2026_06_08_080336_create_links_table', 5),
(18, '2026_06_08_081450_create_link_products_table', 5),
(19, '2026_06_10_033916_add_fields_to_orders_table', 6),
(20, '2026_06_10_034609_add_fields_to_order_items_table', 6),
(21, '2026_06_10_053254_add_transection_id_to_orders_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `influencer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complete` tinyint NOT NULL DEFAULT '0',
  `transection_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `influencer_revenue` decimal(8,2) NOT NULL,
  `admin_revenue` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_title`, `price`, `quantity`, `created_at`, `updated_at`, `influencer_revenue`, `admin_revenue`) VALUES
(1, 2, 'Quia recusandae nemo aut autem. Aut illo adipisci ab quas. Quisquam et laudantium sed quibusdam.', 60.00, 1, '2026-06-10 04:43:47', '2026-06-10 04:43:47', 6.00, 54.00),
(2, 2, 'Illo voluptas inventore molestiae nihil. Culpa aspernatur et eos. Quia ut amet aut.', 85.00, 2, '2026-06-10 04:43:47', '2026-06-10 04:43:47', 17.00, 153.00),
(13, 8, 'new title 30', 32.00, 1, '2026-06-15 14:12:50', '2026-06-15 14:12:50', 3.20, 28.80),
(14, 8, 'Et iusto odit amet ratione ut facilis. Illum sapiente voluptas voluptatem omnis impedit rerum rerum. Quod possimus iste ut rerum. Sit deserunt distinctio quod necessitatibus eum illo.', 59.00, 1, '2026-06-15 14:12:50', '2026-06-15 14:12:50', 5.90, 53.10),
(15, 9, 'new title 30', 32.00, 1, '2026-06-15 14:13:43', '2026-06-15 14:13:43', 3.20, 28.80),
(16, 9, 'Et iusto odit amet ratione ut facilis. Illum sapiente voluptas voluptatem omnis impedit rerum rerum. Quod possimus iste ut rerum. Sit deserunt distinctio quod necessitatibus eum illo.', 59.00, 4, '2026-06-15 14:13:43', '2026-06-15 14:13:43', 23.60, 212.40),
(17, 10, 'new title 30', 32.00, 1, '2026-06-15 14:16:36', '2026-06-15 14:16:36', 3.20, 28.80),
(18, 10, 'Et iusto odit amet ratione ut facilis. Illum sapiente voluptas voluptatem omnis impedit rerum rerum. Quod possimus iste ut rerum. Sit deserunt distinctio quod necessitatibus eum illo.', 59.00, 1, '2026-06-15 14:16:36', '2026-06-15 14:16:36', 5.90, 53.10),
(19, 11, 'new title 30', 32.00, 1, '2026-06-15 14:34:08', '2026-06-15 14:34:08', 3.20, 28.80),
(20, 11, 'Et iusto odit amet ratione ut facilis. Illum sapiente voluptas voluptatem omnis impedit rerum rerum. Quod possimus iste ut rerum. Sit deserunt distinctio quod necessitatibus eum illo.', 59.00, 1, '2026-06-15 14:34:08', '2026-06-15 14:34:08', 5.90, 53.10),
(21, 12, 'new title 30', 32.00, 2, '2026-06-15 16:12:54', '2026-06-15 16:12:54', 6.40, 57.60),
(22, 12, 'Et iusto odit amet ratione ut facilis. Illum sapiente voluptas voluptatem omnis impedit rerum rerum. Quod possimus iste ut rerum. Sit deserunt distinctio quod necessitatibus eum illo.', 59.00, 2, '2026-06-15 16:12:54', '2026-06-15 16:12:54', 11.80, 106.20),
(25, 14, 'new title 30', 32.00, 1, '2026-06-17 22:18:27', '2026-06-17 22:18:27', 3.20, 28.80),
(26, 14, 'Quia recusandae nemo aut autem. Aut illo adipisci ab quas. Quisquam et laudantium sed quibusdam.', 60.00, 1, '2026-06-17 22:18:27', '2026-06-17 22:18:27', 6.00, 54.00);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'view_users', NULL, NULL),
(2, 'edit_users', NULL, NULL),
(3, 'view_roles', NULL, NULL),
(4, 'edit_roles', NULL, NULL),
(5, 'view_products', NULL, NULL),
(6, 'edit_products', NULL, NULL),
(7, 'view_orders', NULL, NULL),
(8, 'edit_orders', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '491e21262c7b0f377a042b259a0a04b9fb8434b91f97e0303ed7dfac52496737', '[\"*\"]', '2026-06-03 06:23:34', NULL, '2026-06-03 05:09:03', '2026-06-03 06:23:34'),
(2, 'App\\Models\\User', 1, 'auth_token', 'afff2ae4d91cd20345b30c8d3636e4be9c8000962b5e12d97b973bf7a1c9d601', '[\"*\"]', '2026-06-03 09:34:28', NULL, '2026-06-03 09:05:03', '2026-06-03 09:34:28'),
(3, 'App\\Models\\User', 21, 'auth_token', 'f23c2827b155d06c708febd66668deb968824f188ca9a047ffc35dce2b7dec7a', '[\"*\"]', '2026-06-03 09:44:12', NULL, '2026-06-03 09:41:02', '2026-06-03 09:44:12'),
(4, 'App\\Models\\User', 22, 'auth_token', '1b63f60b6244112b2eabbf58f740410e875637e2a234964465d595df7fd0b2bb', '[\"*\"]', '2026-06-03 09:45:22', NULL, '2026-06-03 09:44:57', '2026-06-03 09:45:22'),
(5, 'App\\Models\\User', 1, 'auth_token', 'a7ad6bdf87867698436407737366fe9431fa969f0369e2a511b666c6f90a7aa4', '[\"*\"]', '2026-06-03 11:54:16', NULL, '2026-06-03 10:43:30', '2026-06-03 11:54:16'),
(6, 'App\\Models\\User', 22, 'auth_token', '74138cc3433570d310ca572c2455102215f79fa02e3389b06bff2f9bb6de8ecb', '[\"*\"]', '2026-06-03 11:55:31', NULL, '2026-06-03 11:54:42', '2026-06-03 11:55:31'),
(7, 'App\\Models\\User', 22, 'auth_token', '7b6dd4637d33a81c85788d8fe301b3c30415427c33d1e027a1ee4547b6fdd20c', '[]', '2026-06-03 12:14:16', NULL, '2026-06-03 12:10:18', '2026-06-03 12:14:16'),
(8, 'App\\Models\\User', 1, 'auth_token', '892bda00c09ef1392420f4104b3bd70d180b119051dc109832093b00fbc1f13a', '[\"admin\"]', '2026-06-03 12:15:28', NULL, '2026-06-03 12:15:01', '2026-06-03 12:15:28'),
(9, 'App\\Models\\User', 22, 'auth_token', '1ea29e3cdbdb0af3a3774915f47fd2117ea00ebf42094d7ba0444d950501ed68', '[\"*\"]', '2026-06-03 12:16:35', NULL, '2026-06-03 12:15:46', '2026-06-03 12:16:35'),
(10, 'App\\Models\\User', 22, 'auth_token', '5108919633c2704c1fecb62d2ce4484817ad907ef72989fda1bb93ca76b31526', '[]', '2026-06-03 12:35:44', NULL, '2026-06-03 12:17:37', '2026-06-03 12:35:44'),
(11, 'App\\Models\\User', 22, 'auth_token', 'b76a9cc07f94f5698d0d1bffec4984756b40172f35999bd2e6f80b633151ad90', '[\"influencer\"]', '2026-06-03 12:37:31', NULL, '2026-06-03 12:36:49', '2026-06-03 12:37:31'),
(12, 'App\\Models\\User', 1, 'auth_token', '53da9827086d873424f11961a905972a61e1cae0f8de292b69a620741ef81dd9', '[\"admin\"]', NULL, NULL, '2026-06-08 06:26:41', '2026-06-08 06:26:41'),
(13, 'App\\Models\\User', 22, 'auth_token', 'fdd1b239f7342cfca6dae527889afcde3028c2f037fc64f3e3c2fc78cb1080a3', '[\"influencer\"]', '2026-06-08 06:56:48', NULL, '2026-06-08 06:27:59', '2026-06-08 06:56:48'),
(14, 'App\\Models\\User', 22, 'auth_token', '356ef7f917f421fdf8b68c7c79a469dfbdc4e6f8e962a781ab69820ec8e15f37', '[\"influencer\"]', '2026-06-10 02:48:39', NULL, '2026-06-08 10:51:56', '2026-06-10 02:48:39'),
(15, 'App\\Models\\User', 1, 'auth_token', 'f2dc46a4ec1130ba2a80144f43ddf5bddb2bcdff8e6a2bfca39505b3defab882', '[\"admin\"]', '2026-06-10 03:07:19', NULL, '2026-06-10 02:53:42', '2026-06-10 03:07:19'),
(16, 'App\\Models\\User', 22, 'auth_token', '26839c2d73fa4c90559c59f7f6ec1f456d5678036718c64646a6c47d82de5d13', '[\"influencer\"]', '2026-06-10 03:23:57', NULL, '2026-06-10 03:07:50', '2026-06-10 03:23:57'),
(17, 'App\\Models\\User', 22, 'auth_token', '135cc768023d76728e4a1df3f9dffd95c36db4ce47ce38f212d829081d9d2c2b', '[\"influencer\"]', '2026-06-11 05:19:15', NULL, '2026-06-10 09:56:54', '2026-06-11 05:19:15'),
(18, 'App\\Models\\User', 1, 'auth_token', '0ee0400a87f400cb8689230cee7e94d8bf0677093e18ab4892bd6bccb3ab2e70', '[\"admin\"]', '2026-06-11 03:44:27', NULL, '2026-06-11 03:39:45', '2026-06-11 03:44:27'),
(19, 'App\\Models\\User', 22, 'auth_token', '677571ff375849cab7b65fe86e1cd24ebb5caffe8839af160b350b38cbe70a85', '[\"influencer\"]', NULL, NULL, '2026-06-11 03:40:46', '2026-06-11 03:40:46'),
(20, 'App\\Models\\User', 1, 'auth_token', '4c4fd33b3a6662f0b9cd4134c915707d15c3df20570ee5580f842f1a95e0ee08', '[\"admin\"]', '2026-06-11 04:14:00', NULL, '2026-06-11 04:09:46', '2026-06-11 04:14:00'),
(21, 'App\\Models\\User', 22, 'auth_token', '9457a894f4f495947ac978a36fd451418e6fa6439df149aa1e47438f6afe1b35', '[\"influencer\"]', NULL, NULL, '2026-06-11 04:10:54', '2026-06-11 04:10:54'),
(22, 'App\\Models\\User', 1, 'auth_token', 'f7e5e17d949c3e1011cd9293eea690e2fc952fc7a702b6ef6517019850d58aff', '[\"admin\"]', '2026-06-11 06:45:54', NULL, '2026-06-11 06:45:06', '2026-06-11 06:45:54'),
(23, 'App\\Models\\User', 23, 'auth_token', '7692f8a17ac1fe318798efd5d91f19c7663bfac59e453c697399a7f8051c6264', '[\"influencer\"]', NULL, NULL, '2026-06-13 06:43:28', '2026-06-13 06:43:28'),
(24, 'App\\Models\\User', 23, 'auth_token', 'ef204f5f2320ee9b0e1f15dcb6cfaf3c64620a50ada106e34a94726799637de8', '[\"influencer\"]', '2026-06-14 06:21:00', NULL, '2026-06-14 06:19:45', '2026-06-14 06:21:00'),
(25, 'App\\Models\\User', 23, 'auth_token', '98659d83380d48f2ad4c6f0156464090a7a3b205c03743026c5641a0730115be', '[\"influencer\"]', NULL, NULL, '2026-06-14 06:26:01', '2026-06-14 06:26:01'),
(26, 'App\\Models\\User', 21, 'auth_token', '9e8056b4a30946ddf29f72fddf5b0a257b56b36994c94b292de96fbc91eda141', '[\"influencer\"]', NULL, NULL, '2026-06-14 06:26:39', '2026-06-14 06:26:39'),
(27, 'App\\Models\\User', 21, 'auth_token', 'a6916a529c2a58d322cd1d217297c37b2047890ed80a28ce134b82f4101ab04f', '[\"influencer\"]', '2026-06-14 06:28:51', NULL, '2026-06-14 06:27:58', '2026-06-14 06:28:51'),
(28, 'App\\Models\\User', 23, 'auth_token', 'b75aca18f309fb0de675251ce5aa37a73d244f07a08d1d5b68d19e2c4d5d1520', '[\"influencer\"]', '2026-06-14 07:02:53', NULL, '2026-06-14 06:28:44', '2026-06-14 07:02:53'),
(29, 'App\\Models\\User', 23, 'auth_token', '51ac1206679a64591a13b7a2b0f8f69184c92071f6cd8b037e9f1e67001791bf', '[\"influencer\"]', '2026-06-14 09:28:37', NULL, '2026-06-14 07:18:44', '2026-06-14 09:28:37'),
(30, 'App\\Models\\User', 21, 'auth_token', 'f2a312164363b8f3d55abfbe94a86dd2f7f71a4ab2c422c02ae4f013195254be', '[\"influencer\"]', '2026-06-14 09:29:37', NULL, '2026-06-14 09:28:25', '2026-06-14 09:29:37'),
(31, 'App\\Models\\User', 22, 'auth_token', '425b87fae5a437005e8d33c160cf8a2a762fb8b7d0878aed5da0f2a60698d5f2', '[\"influencer\"]', '2026-06-14 11:48:06', NULL, '2026-06-14 09:29:29', '2026-06-14 11:48:06'),
(32, 'App\\Models\\User', 22, 'auth_token', 'e99a581d2be3c52e500f355e47231935fc54170e81a92cd2ce85aff79ccdf2e5', '[\"influencer\"]', '2026-06-17 22:07:27', NULL, '2026-06-14 11:48:52', '2026-06-17 22:07:27'),
(33, 'App\\Models\\User', 1, 'auth_token', '35cfe0af5d950baa96b8d0c7fb221f35d3dbf917fd99b7f2b07f0d532f00550a', '[\"admin\"]', '2026-06-17 22:23:50', NULL, '2026-06-17 22:07:03', '2026-06-17 22:23:50'),
(34, 'App\\Models\\User', 22, 'auth_token', 'c3749823746434429d7ca68944b1c18be021bf16480cc28e90b70ba7103484a3', '[\"influencer\"]', NULL, NULL, '2026-06-17 22:12:12', '2026-06-17 22:12:12'),
(35, 'App\\Models\\User', 22, 'auth_token', '9a3d2547a3de0712a3bfcdf1300da3561acf630df0344edc11cb3c99a8474de7', '[\"influencer\"]', '2026-06-17 22:14:03', NULL, '2026-06-17 22:13:27', '2026-06-17 22:14:03'),
(36, 'App\\Models\\User', 23, 'auth_token', '7c4df0756baa9f299e9876627a6d43e966421e4e06d2b2a277a1bbb65cc30273', '[\"influencer\"]', '2026-06-17 22:22:53', NULL, '2026-06-17 22:17:01', '2026-06-17 22:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `image`, `price`, `created_at`, `updated_at`) VALUES
(1, 'new title 30', NULL, 'https://via.placeholder.com/640x480.png/004488?text=placeat', 32.00, '2026-06-02 11:51:37', '2026-06-11 04:14:00'),
(2, 'Et iusto odit amet ratione ut facilis. Illum sapiente voluptas voluptatem omnis impedit rerum rerum. Quod possimus iste ut rerum. Sit deserunt distinctio quod necessitatibus eum illo.', NULL, 'https://via.placeholder.com/640x480.png/001199?text=aperiam', 59.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(3, 'Quia recusandae nemo aut autem. Aut illo adipisci ab quas. Quisquam et laudantium sed quibusdam.', NULL, 'https://via.placeholder.com/640x480.png/00eebb?text=impedit', 60.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(4, 'Illo voluptas inventore molestiae nihil. Culpa aspernatur et eos. Quia ut amet aut.', NULL, 'https://via.placeholder.com/640x480.png/00cc11?text=sint', 85.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(5, 'Quo perspiciatis error qui a quia velit sed debitis. Deserunt qui impedit voluptas nam dolor aut. Veniam nihil velit autem quam tenetur quibusdam.', NULL, 'https://via.placeholder.com/640x480.png/00eeff?text=dignissimos', 69.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(6, 'Aut cum quidem error reiciendis vitae in odio. Aliquam quas error maiores magnam. Eius in voluptatem ut pariatur.', NULL, 'https://via.placeholder.com/640x480.png/0077ff?text=ex', 49.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(7, 'Provident ab consequatur nostrum sed molestiae delectus voluptatem. Itaque veniam accusamus alias est veniam qui. Fugit ut ipsam ratione esse molestiae pariatur qui.', NULL, 'https://via.placeholder.com/640x480.png/00bb44?text=maxime', 94.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(8, 'Inventore assumenda minima dolorem laborum dolor sed. Non nam minus enim ut eligendi necessitatibus. Excepturi veritatis debitis et aut mollitia voluptatum asperiores.', NULL, 'https://via.placeholder.com/640x480.png/0011bb?text=ipsa', 55.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(9, 'Quam eaque dolores voluptas sit et quidem. Provident id voluptas aut corporis labore quas eos. Facilis et in ut velit in. Quaerat eum veniam id impedit ut quam aspernatur fugiat.', NULL, 'https://via.placeholder.com/640x480.png/000033?text=nesciunt', 10.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(10, 'Corporis asperiores quae iste earum. Quasi dolore harum velit labore accusantium cupiditate rerum. Et in aliquid reiciendis. Commodi veniam perspiciatis sint aperiam.', NULL, 'https://via.placeholder.com/640x480.png/006666?text=doloribus', 90.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(11, 'Blanditiis est natus vel aliquid. Error voluptatem commodi quisquam et minima. Qui id sit distinctio iure dolores velit. Consequuntur pariatur veniam sunt voluptates.', NULL, 'https://via.placeholder.com/640x480.png/000066?text=odit', 84.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(12, 'Perspiciatis voluptatem aspernatur veritatis voluptatibus. Aut minima amet et nihil saepe. Magni eaque sint blanditiis eaque.', NULL, 'https://via.placeholder.com/640x480.png/0011cc?text=itaque', 29.00, '2026-06-02 11:51:37', '2026-06-02 11:51:37'),
(13, 'Minus aut temporibus eius nihil at quam nesciunt. Reiciendis facilis iure quo officiis quas tenetur voluptatem voluptate. Aspernatur porro omnis omnis doloribus at dolor amet.', NULL, 'https://via.placeholder.com/640x480.png/0088ee?text=nesciunt', 97.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(14, 'Dolorem sequi vitae molestiae iure molestiae et. Error molestias ut nostrum nulla. Minima et quia accusantium unde et. Iusto consequatur ut et in mollitia similique doloremque.', NULL, 'https://via.placeholder.com/640x480.png/00ff66?text=temporibus', 54.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(15, 'Tempora praesentium laborum reprehenderit distinctio blanditiis. Sunt beatae expedita impedit illo. Voluptatem quaerat autem qui neque.', NULL, 'https://via.placeholder.com/640x480.png/00ee00?text=fuga', 50.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(16, 'Perspiciatis officia nisi ipsam. Quis recusandae dolorem dolore consectetur. Voluptates dolor eveniet nam consequatur est. Eum accusantium eveniet necessitatibus.', NULL, 'https://via.placeholder.com/640x480.png/00ccee?text=natus', 67.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(17, 'Tenetur fugit inventore iure doloremque est. Placeat accusamus sunt vel ut sint adipisci. Ducimus voluptatem occaecati explicabo enim sapiente.', NULL, 'https://via.placeholder.com/640x480.png/0077aa?text=in', 25.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(18, 'Qui est sed adipisci exercitationem in. Porro nemo distinctio vero numquam. Nemo beatae voluptates qui deserunt qui. Quis rerum iure possimus placeat.', NULL, 'https://via.placeholder.com/640x480.png/00aa44?text=et', 99.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(19, 'Voluptatum velit rerum veniam eaque aut incidunt mollitia dignissimos. Reiciendis sapiente occaecati aut.', NULL, 'https://via.placeholder.com/640x480.png/0077dd?text=illum', 50.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(20, 'Ipsum velit velit incidunt alias consequatur dolore. Doloremque quos rerum quam. Placeat optio eveniet voluptas ullam molestiae.', NULL, 'https://via.placeholder.com/640x480.png/0044ee?text=laboriosam', 67.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(21, 'Sit vero dolor animi ipsam. Accusamus ut et dicta non aut earum. Sit molestias nemo nemo quia praesentium.', NULL, 'https://via.placeholder.com/640x480.png/0033ff?text=rerum', 39.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(22, 'Deserunt a velit aut dignissimos mollitia ipsa numquam. Eum qui doloribus sunt. Perspiciatis ut unde molestiae in doloribus voluptatibus.', NULL, 'https://via.placeholder.com/640x480.png/001133?text=deserunt', 35.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(23, 'Non quidem odio est nihil dolorum harum. Ullam rerum cum veniam velit. Voluptatem ullam et tenetur eos aperiam et eligendi ut.', NULL, 'https://via.placeholder.com/640x480.png/000088?text=harum', 79.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(24, 'Expedita officia doloremque et odio eum in. Voluptas sed ipsa sed dolor eligendi cum harum. Tenetur occaecati tempora ut expedita.', NULL, 'https://via.placeholder.com/640x480.png/0022cc?text=eaque', 85.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(25, 'Velit iste quia ut veniam in sed et. Modi at facilis consectetur. Quasi vero corrupti ipsum cum.', NULL, 'https://via.placeholder.com/640x480.png/00aa99?text=debitis', 22.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(26, 'Ad ipsum quibusdam quam enim adipisci. Laudantium consequatur possimus omnis adipisci. Mollitia corrupti dignissimos occaecati explicabo autem. Porro eaque nemo inventore rerum nisi nisi.', NULL, 'https://via.placeholder.com/640x480.png/0022cc?text=voluptas', 68.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(27, 'Quaerat consequuntur odio est quo. Enim ipsam nobis et accusamus commodi. Fugit nihil mollitia sint blanditiis dolor dicta et.', NULL, 'https://via.placeholder.com/640x480.png/00bb99?text=quas', 49.00, '2026-06-02 11:51:38', '2026-06-02 11:51:38'),
(28, 'Ut rerum est autem molestiae. Optio sequi temporibus sapiente ipsum dolore quod. Dignissimos nihil ut hic consequatur sint.', NULL, 'https://via.placeholder.com/640x480.png/0011ff?text=porro', 57.00, '2026-06-02 11:51:39', '2026-06-02 11:51:39'),
(29, 'Qui modi neque possimus eos magni ipsam sapiente. Deserunt odit tenetur voluptatem dignissimos modi explicabo occaecati. Non doloremque voluptatibus saepe velit quis.', NULL, 'https://via.placeholder.com/640x480.png/004422?text=culpa', 61.00, '2026-06-02 11:51:39', '2026-06-02 11:51:39'),
(30, 'Qui totam eaque accusamus. Sit est magnam tenetur non nam perferendis enim. Tenetur ducimus qui occaecati hic et est non. Vel in dolorem itaque unde ut qui.', NULL, 'https://via.placeholder.com/640x480.png/001100?text=sequi', 77.00, '2026-06-02 11:51:39', '2026-06-02 11:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2026-06-02 11:51:34', '2026-06-02 11:51:34'),
(2, 'Editor', '2026-06-02 11:51:34', '2026-06-02 11:51:34'),
(3, 'Viewer', '2026-06-02 11:51:34', '2026-06-02 11:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 2, 1),
(10, 2, 2),
(11, 2, 3),
(12, 2, 5),
(13, 2, 6),
(14, 2, 7),
(15, 2, 8),
(16, 3, 1),
(17, 3, 3),
(18, 3, 5),
(19, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4HdXQHwg90e2s8D4XULJL3BTIBD5McF1Tggx204C', NULL, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJZaWp1ZDZiUkxPaWxuRzhoYWR4OVNKc01zNVpyWWNBUnVjWEJRNVU5IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1781061605),
('i0fQJQZR5iu6KFEYdL6KXOYqMo0kDJGtFjSscigF', NULL, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIyMUxLcml0ZjI3MmJGSFMwWkRVT0tNR054Sll6Vlk5ZDZkOHJuZUw2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1781688981),
('leht9s9OMap8zhs6OZmoR3DpxYcjmR32jGG37FQo', NULL, '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJkSzI1TXhIRW1LenpqYnBwVW81ODVxRXpTSDk0c1ZkNVNncTc1QVlGIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1781688511);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_influencer` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_influencer`) VALUES
(1, 'Lavern', 'Buckridge', 'admin@abc.com', '2026-06-02 11:51:35', '$2y$12$LfBn0OdDh7JyJau7rTLXK.ZMeRENXnALQrAHVpjHR6bU3uBZvTnV2', 'QJPLSEBntp', '2026-06-02 11:51:35', '2026-06-03 10:43:30', 0),
(2, 'Arjun', 'Kirlin', 'cshields@example.com', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', '9m6VeOkFIq', '2026-06-02 11:51:35', '2026-06-02 11:51:35', 0),
(3, 'Ibrahim', 'Jaskolski', 'odessa.johns@example.net', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 's1l91TWLSQ', '2026-06-02 11:51:35', '2026-06-02 11:51:35', 0),
(4, 'Delphia', 'Blanda', 'darrick.bogan@example.net', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'EUrrB9aYun', '2026-06-02 11:51:35', '2026-06-02 11:51:35', 0),
(5, 'Hosea', 'Bahringer', 'gemmerich@example.com', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', '1kTfdH0PiA', '2026-06-02 11:51:35', '2026-06-02 11:51:35', 0),
(6, 'Bailey', 'Homenick', 'wisoky.gwen@example.net', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', '2mQXvZPetK', '2026-06-02 11:51:35', '2026-06-02 11:51:35', 0),
(7, 'Ramona', 'Altenwerth', 'friesen.bert@example.com', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'pa6rTMeiRk', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(8, 'Easton', 'Grimes', 'nratke@example.com', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'XnLPeOpwdC', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(9, 'Emmet', 'Runolfsson', 'archibald61@example.org', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 't2ru25uEEQ', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(10, 'Cedrick', 'Casper', 'kristofer22@example.org', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'd95b6oeqnQ', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(11, 'Keely', 'Dietrich', 'schuster.selina@example.net', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'rZJ2yC9GmF', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(12, 'Patsy', 'Abbott', 'jane.ullrich@example.net', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'BL6lcKlnFZ', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(13, 'Johnnie', 'Hermiston', 'gutmann.orie@example.org', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'rp7jRbtM1r', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(14, 'Percival', 'Hermiston', 'maggio.elvera@example.net', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'dEADlX29aN', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(15, 'Woodrow', 'Simonis', 'alicia.kassulke@example.com', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'wtGMpmQ6mk', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(16, 'Lucie', 'Tromp', 'kattie85@example.org', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', '0lCBSh2neu', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(17, 'Erika', 'Johnson', 'abeier@example.org', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', '8FvNQxsCJi', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(18, 'Yessenia', 'Nitzsche', 'chandler60@example.net', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'jPpCZSKiqo', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(19, 'Al', 'O\'Keefe', 'huel.simone@example.net', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'mmdAm8yuJv', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(20, 'Kayleigh', 'Volkman', 'nienow.eino@example.org', '2026-06-02 11:51:35', '$2y$12$vmG06rgulqRnhZmf3lXxhOWQr1DxZnV9QaKknjLMffnRBRty8JZ52', 'e9P3p1MnHI', '2026-06-02 11:51:36', '2026-06-02 11:51:36', 0),
(21, 'Influencer', 'Influencer', 'i@i.com', NULL, '$2y$12$VaRrA2mYAErJZQS5aKXMGOcXazdhVtabMdKNOmcq8gGN7BU8CWpRK', NULL, '2026-06-03 09:40:21', '2026-06-14 06:27:58', 1),
(22, 'Influencer', 'Influencer', 'j@j.com', NULL, '$2y$12$p/cornTM55oybsxg87vt5.oRtwMLC54cRw5HmoKhNTj.8L5ipJ4vS', NULL, '2026-06-03 09:44:42', '2026-06-03 09:44:42', 1),
(23, 'k', 'k', 'k@k.com', NULL, '$2y$12$p/cornTM55oybsxg87vt5.oRtwMLC54cRw5HmoKhNTj.8L5ipJ4vS', NULL, '2026-06-13 06:32:01', '2026-06-13 06:32:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 3),
(6, 6, 2),
(7, 7, 1),
(8, 8, 3),
(9, 9, 1),
(10, 10, 3),
(11, 11, 2),
(12, 12, 1),
(13, 13, 3),
(14, 14, 3),
(15, 15, 1),
(16, 16, 3),
(17, 17, 3),
(18, 18, 3),
(19, 19, 3),
(20, 20, 2),
(21, 21, 3),
(22, 22, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `links_code_unique` (`code`),
  ADD KEY `links_user_id_foreign` (`user_id`);

--
-- Indexes for table `link_products`
--
ALTER TABLE `link_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_products_link_id_foreign` (`link_id`),
  ADD KEY `link_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_roles_user_id_unique` (`user_id`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `link_products`
--
ALTER TABLE `link_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `link_products`
--
ALTER TABLE `link_products`
  ADD CONSTRAINT `link_products_link_id_foreign` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`),
  ADD CONSTRAINT `link_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
