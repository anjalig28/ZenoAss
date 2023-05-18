-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2023 at 08:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drugmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_factories`
--

CREATE TABLE `db_factories` (
  `id` int(9) NOT NULL,
  `name` varchar(31) NOT NULL,
  `uid` varchar(31) NOT NULL,
  `class` varchar(63) NOT NULL,
  `icon` varchar(31) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `db_factories`
--

INSERT INTO `db_factories` (`id`, `name`, `uid`, `class`, `icon`, `summary`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test Factory', 'test001', 'Factories\\Tests\\NewFactory', 'fas fa-puzzle-piece', 'Longer sample text for testing', NULL, '2023-05-17 18:49:35', '2023-05-17 18:49:35'),
(2, 'Widget Factory', 'widget', 'Factories\\Tests\\WidgetPlant', 'fas fa-puzzle-piece', 'Create widgets in your factory', NULL, NULL, NULL),
(3, 'Evil Factory', 'evil-maker', 'Factories\\Evil\\MyFactory', 'fas fa-book-dead', 'Abandon all hope, ye who enter here', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_migrations`
--

CREATE TABLE `db_migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `db_migrations`
--

INSERT INTO `db_migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(17, '2020-02-22-222222', 'Tests\\Support\\Database\\Migrations\\ExampleMigration', 'tests', 'Tests\\Support', 1684349375, 1);

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `id` bigint(255) UNSIGNED NOT NULL,
  `drug_name` varchar(255) NOT NULL,
  `mrp` decimal(4,2) NOT NULL,
  `retailer_price` decimal(4,2) NOT NULL,
  `expiry_date` varchar(8) DEFAULT NULL,
  `barcode` varchar(255) NOT NULL,
  `type` enum('Ethical','Generic') NOT NULL DEFAULT 'Ethical'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`id`, `drug_name`, `mrp`, `retailer_price`, `expiry_date`, `barcode`, `type`) VALUES
(2, 'crocin', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical'),
(3, 'crocin1', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical'),
(4, 'crocin2', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical'),
(5, 'crocin3', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical'),
(6, 'crocin4', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical'),
(7, 'crocin5', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical'),
(8, 'crocin6', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical'),
(9, 'crocin7', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical'),
(10, 'crocin8', 30.00, 28.00, '2022-09', 'fdfdsfdsfdsfdsfd', 'Ethical');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2023-05-16-192135', 'App\\Database\\Migrations\\AddDrug', 'default', 'App', 1684265831, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'test@gmail.com', '$2y$10$avh3soqyl8oX0B9uBj44C.TDrRaKlwiYXddMrr8Che/doMNrQ01HG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_factories`
--
ALTER TABLE `db_factories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `uid` (`uid`),
  ADD KEY `deleted_at_id` (`deleted_at`,`id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `db_migrations`
--
ALTER TABLE `db_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_factories`
--
ALTER TABLE `db_factories`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_migrations`
--
ALTER TABLE `db_migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `drug`
--
ALTER TABLE `drug`
  MODIFY `id` bigint(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
