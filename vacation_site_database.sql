-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2019 at 03:39 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vacation_site_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `mail`, `password`, `role`) VALUES
(14, 'yoni', 'aizenshtein', 'yoni@gmail.com', '315835876', 2),
(15, 'jack', 'varabei', 'jack@jacko.com', '123456789', 0),
(16, 'wili', 'alaberd', 'wili@walla.com', '123456', 0),
(17, 'gabi', 'abra', 'g@s.com', '123456789', 0),
(18, 'jack', 'varabey', 'sparow@pirate.com', '123', 0),
(19, 'yoni2', 'dcas', 'yon@fewa.com', '3158358762', 0),
(20, 'flocky', 'odasim', 'yon@fdas.com', '1234', 0),
(21, 'gorgio', 'armani', 'armani@goerge.com', '112233', 0),
(22, 'newUser', 'newUserLast', 'new@walla.com', '123456', 0),
(23, 'newUser', 'newUserLast', 'newUser@walla.com', 'newUsernewUser', 0),
(24, 'local', 'storage', 'local@storage.com', '123', 0),
(25, 'newMan', 'newMan123', 'newMan@newMan.newMan', 'newMan', 0),
(26, 'user', 'user123', 'user123@gmail.com', 'user123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_vacation`
--

CREATE TABLE `users_vacation` (
  `id` int(11) NOT NULL,
  `uId` int(11) NOT NULL,
  `vacationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_vacation`
--

INSERT INTO `users_vacation` (`id`, `uId`, `vacationId`) VALUES
(33, 14, 3),
(34, 15, 5),
(36, 15, 4),
(38, 14, 1),
(47, 17, 3),
(48, 17, 2),
(49, 24, 3),
(50, 24, 2),
(52, 20, 2),
(53, 20, 3),
(54, 20, 7),
(55, 20, 8),
(59, 15, 2),
(61, 15, 8),
(63, 15, 7),
(64, 15, 3),
(65, 26, 8);

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vacation`
--

INSERT INTO `vacation` (`id`, `title`, `location`, `image`, `start_date`, `end_date`, `price`) VALUES
(8, 'new', 'russia', 'https://www.history.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_faces:center%2Cq_auto:good%2Cw_768/MTYyNzYyODMyNTM2OTM4MDcy/topic-russia-gettyimages-605536834-feature.jpg', '2019-07-09', '2019-07-09', 123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_vacation`
--
ALTER TABLE `users_vacation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users_vacation`
--
ALTER TABLE `users_vacation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
