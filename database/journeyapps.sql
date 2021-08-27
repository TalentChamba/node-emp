-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2021 at 08:52 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `journeyapps`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_login`
--

CREATE TABLE `employee_login` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_login`
--

INSERT INTO `employee_login` (`id`, `name`, `email`, `password`) VALUES
(8, 'Testing', 'testing1@testing.com', '$2a$08$kVDM2LDYYG/.P7zVqf7fAOFk5EVwrDlUu1sE97/J4UJBTV0W.mJFi'),
(10, 'Testings', 'testing1@testing.com', '$2a$08$aEnXr8xDKZ2/TRc/VHLPBOHY31lOU7VU/RvhJ6DoqtyF.4hCRi4DC');

-- --------------------------------------------------------

--
-- Table structure for table `users_file`
--

CREATE TABLE `users_file` (
  `id` int(10) NOT NULL,
  `file_src` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_file`
--

INSERT INTO `users_file` (`id`, `file_src`) VALUES
(2, '/images/ee450890-075c-11ec-a93e-e1e143988da0placeholder.jpg'),
(3, '/images/1012e730-075d-11ec-a93e-e1e143988da0placeholder.jpg'),
(4, '/images/2d532760-075d-11ec-9f2f-8df46e45b896placeholder.jpg'),
(5, '/images/5ff9cf10-075e-11ec-b432-2d5d30739785placeholder.jpg'),
(6, '/images/c8ac7b70-075e-11ec-b432-2d5d30739785placeholder.jpg'),
(7, '/images/cefb78f0-075e-11ec-b432-2d5d30739785placeholder.jpg'),
(8, '/images/8df90ec0-075f-11ec-a2a4-5548a630d7eeplaceholder.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee_login`
--
ALTER TABLE `employee_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_file`
--
ALTER TABLE `users_file`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee_login`
--
ALTER TABLE `employee_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_file`
--
ALTER TABLE `users_file`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
