-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2024 at 03:22 PM
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
-- Database: `traffic_offense_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `drivers_list`
--

CREATE TABLE `drivers_list` (
  `id` int(30) NOT NULL,
  `license_id_no` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = active, 2 = suspended, 3 = banned',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers_list`
--

INSERT INTO `drivers_list` (`id`, `license_id_no`, `name`, `status`, `date_created`, `date_updated`) VALUES
(1, 'WSC-062314', 'Kumela, Debere D', 1, '2021-08-19 10:45:48', '2024-06-23 20:20:24'),
(4, 'WSC-10140715', 'Gizachew, Brhan M', 1, '2021-08-19 14:56:09', '2024-06-23 20:18:58'),
(5, 'bn-2021', 'Mengistu, Abnezer Tewodros  ', 1, '2024-05-28 22:29:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `drivers_meta`
--

CREATE TABLE `drivers_meta` (
  `driver_id` int(30) DEFAULT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers_meta`
--

INSERT INTO `drivers_meta` (`driver_id`, `meta_field`, `meta_value`, `date_updated`) VALUES
(5, 'license_id_no', 'bn-2021', '2024-05-28 22:29:42'),
(5, 'lastname', 'Mengistu', '2024-05-28 22:29:42'),
(5, 'firstname', 'Abnezer Tewodros ', '2024-05-28 22:29:42'),
(5, 'middlename', '', '2024-05-28 22:29:42'),
(5, 'dob', '2024-04-30', '2024-05-28 22:29:42'),
(5, 'present_address', '13406 Philadelphia Street, Whittier, CA', '2024-05-28 22:29:42'),
(5, 'permanent_address', '13406 Philadelphia Street, Whittier, CA', '2024-05-28 22:29:42'),
(5, 'civil_status', 'Single', '2024-05-28 22:29:42'),
(5, 'nationality', 'Ethiopian', '2024-05-28 22:29:42'),
(5, 'contact', '123456789', '2024-05-28 22:29:42'),
(5, 'license_type', 'Student', '2024-05-28 22:29:42'),
(5, 'image_path', '', '2024-05-28 22:29:42'),
(5, 'driver_id', '5', '2024-05-28 22:29:42'),
(4, 'license_id_no', 'WSC-10140715', '2024-06-23 20:18:58'),
(4, 'lastname', 'Gizachew', '2024-06-23 20:18:58'),
(4, 'firstname', 'Brhan', '2024-06-23 20:18:58'),
(4, 'middlename', 'm', '2024-06-23 20:18:58'),
(4, 'dob', '2003-01-14', '2024-06-23 20:18:58'),
(4, 'present_address', 'Address 123', '2024-06-23 20:18:58'),
(4, 'permanent_address', 'Address 123', '2024-06-23 20:18:58'),
(4, 'civil_status', 'Married', '2024-06-23 20:18:58'),
(4, 'nationality', 'Ethiopian', '2024-06-23 20:18:58'),
(4, 'contact', '09123789456', '2024-06-23 20:18:58'),
(4, 'license_type', 'Non-Professional', '2024-06-23 20:18:58'),
(4, 'image_path', 'uploads/drivers/4.jpg', '2024-06-23 20:18:58'),
(4, 'driver_id', '4', '2024-06-23 20:18:58'),
(1, 'license_id_no', 'WSC-062314', '2024-06-23 20:20:24'),
(1, 'lastname', 'Kumela', '2024-06-23 20:20:24'),
(1, 'firstname', 'Debere', '2024-06-23 20:20:24'),
(1, 'middlename', 'D', '2024-06-23 20:20:24'),
(1, 'dob', '1997-07-23', '2024-06-23 20:20:24'),
(1, 'present_address', 'Address 3216', '2024-06-23 20:20:24'),
(1, 'permanent_address', ' Address 3216', '2024-06-23 20:20:24'),
(1, 'civil_status', 'Married', '2024-06-23 20:20:24'),
(1, 'nationality', 'Ethiopian', '2024-06-23 20:20:24'),
(1, 'contact', '09123456789', '2024-06-23 20:20:24'),
(1, 'license_type', 'Professional', '2024-06-23 20:20:24'),
(1, 'image_path', 'uploads/drivers/1.jpg', '2024-06-23 20:20:24'),
(1, 'driver_id', '1', '2024-06-23 20:20:24');

-- --------------------------------------------------------

--
-- Table structure for table `offenses`
--

CREATE TABLE `offenses` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `fine` float NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Inactive, 1=Active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offenses`
--

INSERT INTO `offenses` (`id`, `code`, `name`, `description`, `fine`, `status`, `date_created`, `date_updated`) VALUES
(1, 'OT-1001', 'Driving without License', 'This is a traffic offense for driving without License', 650, 1, '2021-08-19 09:14:43', '2021-08-19 09:17:50'),
(2, 'TO-1002', 'Running Over Speed Limit', '&lt;p&gt;Sample Traffic offense or violation for over speed limit.&lt;/p&gt;', 1000, 1, '2021-08-19 13:54:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offense_items`
--

CREATE TABLE `offense_items` (
  `driver_offense_id` int(30) NOT NULL,
  `offense_id` int(30) DEFAULT NULL,
  `fine` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offense_items`
--

INSERT INTO `offense_items` (`driver_offense_id`, `offense_id`, `fine`, `status`, `date_created`) VALUES
(3, 1, 650, 0, '2024-06-24 01:46:00'),
(3, 2, 1000, 0, '2024-06-24 01:46:00'),
(1, 1, 650, 1, '2021-08-18 15:00:00'),
(1, 2, 1000, 1, '2021-08-18 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `offense_list`
--

CREATE TABLE `offense_list` (
  `id` int(30) NOT NULL,
  `driver_id` int(30) NOT NULL,
  `officer_name` text NOT NULL,
  `officer_id` text NOT NULL,
  `ticket_no` text NOT NULL,
  `total_amount` float NOT NULL,
  `remarks` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offense_list`
--

INSERT INTO `offense_list` (`id`, `driver_id`, `officer_name`, `officer_id`, `ticket_no`, `total_amount`, `remarks`, `status`, `date_created`, `date_updated`) VALUES
(1, 1, 'samson', 'OFC-789456123', '123456789', 1650, 'Sample Traffic Offense Record Only.', 1, '2021-08-18 15:00:00', '2024-06-23 20:49:00'),
(3, 1, 'abenezer', 'id 231654', 'no1234', 1650, '', 0, '2024-06-24 01:46:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Wolaita Sodo City Traffic Offense Management System '),
(6, 'short_name', 'Wolaita Sodo City Traffic Management'),
(11, 'logo', 'uploads/1719162960_policelogo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1719162960_desktop-wallpaper-autodesk-website-background.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(9, 'abenezer', 'tewodros', 'abeni', '25d55ad283aa400af464c76d713c07ad', 'uploads/1719162600_photo_2024-05-28_21-29-39.jpg', NULL, 2, '2021-08-19 09:24:25', '2024-06-23 20:10:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drivers_list`
--
ALTER TABLE `drivers_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers_meta`
--
ALTER TABLE `drivers_meta`
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `offenses`
--
ALTER TABLE `offenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offense_items`
--
ALTER TABLE `offense_items`
  ADD KEY `driver_offense_id` (`driver_offense_id`),
  ADD KEY `offense_id` (`offense_id`);

--
-- Indexes for table `offense_list`
--
ALTER TABLE `offense_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `drivers_list`
--
ALTER TABLE `drivers_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `offenses`
--
ALTER TABLE `offenses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offense_list`
--
ALTER TABLE `offense_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drivers_meta`
--
ALTER TABLE `drivers_meta`
  ADD CONSTRAINT `drivers_meta_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `offense_items`
--
ALTER TABLE `offense_items`
  ADD CONSTRAINT `offense_items_ibfk_1` FOREIGN KEY (`driver_offense_id`) REFERENCES `offense_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offense_items_ibfk_2` FOREIGN KEY (`offense_id`) REFERENCES `offenses` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `offense_list`
--
ALTER TABLE `offense_list`
  ADD CONSTRAINT `offense_list_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
