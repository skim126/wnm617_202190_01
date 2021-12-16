-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2021 at 08:47 PM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seungwoo_wnm608`
--

-- --------------------------------------------------------

--
-- Table structure for table `track_users`
--

CREATE TABLE `track_users` (
  `id` int(13) NOT NULL,
  `name` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(32) NOT NULL,
  `img` varchar(256) NOT NULL,
  `date_create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_users`
--

INSERT INTO `track_users` (`id`, `name`, `username`, `email`, `password`, `img`, `date_create`) VALUES
(1, 'Autumn Parrish123', 'user1', 'user1@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'uploads/1638926373.5207_annie-spratt-STETfTufvFM-unsplash.jpg', '2020-11-16 01:38:42'),
(2, 'Berger Booker', 'user2', 'user2@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/910/fff/?text=user2', '2021-06-21 06:53:10'),
(3, 'Hilary Hughes', 'user3', 'user3@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/810/fff/?text=user3', '2021-10-24 03:35:38'),
(4, 'Coleen Hobbs', 'user4', 'user4@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/904/fff/?text=user4', '2020-12-01 12:22:56'),
(5, 'Christa English', 'user5', 'user5@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/726/fff/?text=user5', '2021-06-10 06:55:00'),
(6, 'Anderson Thomas', 'user6', 'user6@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/936/fff/?text=user6', '2020-04-03 12:02:07'),
(7, 'Chase Mercer', 'user7', 'user7@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/855/fff/?text=user7', '2020-02-22 03:44:38'),
(8, 'Jerry Everett', 'user8', 'user8@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/911/fff/?text=user8', '2021-02-22 02:17:10'),
(9, 'Nina Emerson', 'user9', 'user9@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/918/fff/?text=user9', '2021-08-24 03:22:21'),
(10, 'Watson Mcgee', 'user10', 'user10@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/830/fff/?text=user10', '2021-10-09 07:57:09'),
(11, 'Seungwoo', 'user11', 'user11@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'https://via.placeholder.com/400/976/fff/?text=user1', '2021-11-22 18:37:00'),
(12, 'SeungwooKim', 'user0', 'user0@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'uploads/1639019580.4399_SW.png', '2020-11-16 01:38:42'),
(13, '', 'sw', 'kim.seungwoo126@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'http://via.placeholder.com/400/?text=USER', '2021-12-07 23:52:54'),
(14, '', 'SW1', 'seungwoo126@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'http://via.placeholder.com/400/?text=USER', '2021-12-07 23:54:15'),
(15, '', 'SW2', 'ungwoo126@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'http://via.placeholder.com/400/?text=USER', '2021-12-07 23:56:55'),
(16, '', 'abcd', 'hahahoho123@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'uploads/1639514235.6679_Jobb logo.png', '2021-12-14 13:36:24'),
(17, '', 'user final', 'kim.seun@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'uploads/1639626029.2391_Another Cafe.png', '2021-12-15 20:39:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `track_users`
--
ALTER TABLE `track_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `track_users`
--
ALTER TABLE `track_users`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
