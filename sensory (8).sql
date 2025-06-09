-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2025 at 04:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sensory`
--

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_assignments`
--

CREATE TABLE `evaluation_assignments` (
  `id` int(11) NOT NULL,
  `request_no` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `triad_no` int(11) DEFAULT NULL,
  `triad_type` varchar(10) DEFAULT NULL,
  `code1` varchar(50) DEFAULT NULL,
  `code2` varchar(50) DEFAULT NULL,
  `code3` varchar(50) DEFAULT NULL,
  `is_submitted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_requests`
--

CREATE TABLE `evaluation_requests` (
  `s_id` int(11) NOT NULL,
  `request_no` varchar(100) NOT NULL,
  `lab_code_no` varchar(100) NOT NULL,
  `sample_code_no` varchar(100) NOT NULL,
  `date_of_computation` datetime DEFAULT current_timestamp(),
  `user_input_codes` text DEFAULT NULL COMMENT 'JSON of A1…O3 values',
  `sample_a_label` varchar(100) DEFAULT NULL,
  `sample_b_label` varchar(100) DEFAULT NULL,
  `samples_container` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`samples_container`)),
  `sensory_type` varchar(50) DEFAULT NULL,
  `status` enum('inactive','active') DEFAULT 'inactive',
  `user_id` int(11) DEFAULT NULL,
  `analyst` varchar(100) NOT NULL,
  `triangle_num` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hedonic`
--

CREATE TABLE `hedonic` (
  `id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `request_no` int(11) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `institution_name` varchar(255) DEFAULT NULL,
  `panelist_no` int(11) DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `date_checked` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `triangle_results`
--

CREATE TABLE `triangle_results` (
  `result_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `sample_code1` varchar(50) DEFAULT NULL,
  `sample_code2` varchar(50) DEFAULT NULL,
  `sample_code3` varchar(50) DEFAULT NULL,
  `odd_sample` varchar(100) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `request_no` varchar(100) DEFAULT NULL,
  `triad_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL CHECK (`role` in (1,2,3)),
  `code_name` varchar(50) DEFAULT NULL,
  `user_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `code_name`, `user_picture`, `created_at`) VALUES
(1, 'abellanosa', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Abellanosa, Phillip Anthony L.', NULL, '2025-05-14 06:00:00'),
(2, 'baculio', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Baculio, Julie Anne', NULL, '2025-05-14 06:00:00'),
(3, 'bañas', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Bañas, Hope', NULL, '2025-05-14 06:00:00'),
(4, 'batica', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Batica, Jeziel V.', NULL, '2025-05-14 06:00:00'),
(5, 'bayan', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Bayan, Ronya Mae L.', NULL, '2025-05-14 06:00:00'),
(6, 'belaca-ol', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Belaca-ol, Earl Jhon A.', NULL, '2025-05-14 06:00:00'),
(7, 'bolotaolo', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Bolotaolo, Angelica B.', NULL, '2025-05-14 06:00:00'),
(8, 'cabaluna', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Cabaluna, Ruel O. Jr.', NULL, '2025-05-14 06:00:00'),
(9, 'cagape', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Cagape, Sheila Mae N.', NULL, '2025-05-14 06:00:00'),
(10, 'clavano', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Clavano, Shane Marie S.', NULL, '2025-05-14 06:00:00'),
(11, 'dagala', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Dagala, James Mart E.', NULL, '2025-05-14 06:00:00'),
(12, 'estoque', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Estoque, Mary Claire A.', NULL, '2025-05-14 06:00:00'),
(13, 'gallardo', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Gallardo, Girly S.', NULL, '2025-05-14 06:00:00'),
(14, 'lam-an', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Lam-an, Gellie B.', NULL, '2025-05-14 06:00:00'),
(15, 'lumor', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Lumor, Jefferson L.', NULL, '2025-05-14 06:00:00'),
(16, 'macabodbod', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Macabodbod, Renato A. Jr.', NULL, '2025-05-14 06:00:00'),
(17, 'navarro', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Navarro, Flordemay S.', NULL, '2025-05-14 06:00:00'),
(18, 'olloves', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Olloves, Gerald S.', NULL, '2025-05-14 06:00:00'),
(19, 'omandam', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Omandam, Jennifer B.', NULL, '2025-05-14 06:00:00'),
(20, 'palaca', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Palaca, Judy G.', NULL, '2025-05-14 06:00:00'),
(21, 'petre', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Petre, Jason', NULL, '2025-05-14 06:00:00'),
(22, 'ragandang', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Ragandang, Ma. Sarah A.', NULL, '2025-05-14 06:00:00'),
(23, 'ratilla', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Ratilla, John Nico B.', NULL, '2025-05-14 06:00:00'),
(24, 'semilla', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Semilla, Jon Michael A.', NULL, '2025-05-14 06:00:00'),
(25, 'zambrano', '', '$2b$12$IiIAFR7wS7oWRcgFfc52j.BmthC5cilGeJZDDlyMhQUSWJ32nnooi', 3, 'Zambrano, Jessie B.', NULL, '2025-05-14 06:00:00'),
(100, 'admin', 'admin@gmail.com', '$2y$10$2DDnIxbEGPmu5ThG/JHzW.GP1NIokpA9zs8pCS7.qOSqD7vh0otsq', 1, 'admin', NULL, '2025-04-15 05:00:40'),
(123, 'analyst', 'analyst@gmail.com', '$2y$10$JcDDOD.yrXKBireAT6Lo0.BclHeeIWhwAWZIDFHw61grLVLmZxGDW', 2, 'analyst', '', '2025-06-09 14:56:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `evaluation_assignments`
--
ALTER TABLE `evaluation_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_no` (`request_no`,`user_id`);

--
-- Indexes for table `evaluation_requests`
--
ALTER TABLE `evaluation_requests`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `request_no` (`request_no`);

--
-- Indexes for table `hedonic`
--
ALTER TABLE `hedonic`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `triangle_results`
--
ALTER TABLE `triangle_results`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `evaluation_assignments`
--
ALTER TABLE `evaluation_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `evaluation_requests`
--
ALTER TABLE `evaluation_requests`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `hedonic`
--
ALTER TABLE `hedonic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `triangle_results`
--
ALTER TABLE `triangle_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
