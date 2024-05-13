-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2024 at 06:00 PM
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
-- Database: `hostel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `reg_date`, `updation_date`) VALUES
(1, 'likitha', 'khatri.likitha2021@vitbhopal.ac.in', 'likitha', '2024-01-31 20:31:45', '2024-02-10');

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complainthistory`
--

CREATE TABLE `complainthistory` (
  `id` int(11) NOT NULL,
  `complaintid` int(11) DEFAULT NULL,
  `compalintStatus` varchar(255) DEFAULT NULL,
  `complaintRemark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complainthistory`
--

INSERT INTO `complainthistory` (`id`, `complaintid`, `compalintStatus`, `complaintRemark`, `postingDate`) VALUES
(1, 1, 'In Process', 'We checking the issue.', '2024-04-07 17:32:30'),
(3, 1, 'Closed', 'The issue is fixed. Complaint solved', '2024-04-07 17:35:23'),
(4, 4, 'In Process', 'Plumber is assigned. visit your room soon\r\n', '2024-04-07 18:23:29'),
(5, 4, 'Closed', 'Plumbing issue is solved', '2024-04-07 18:23:54'),
(6, 5, 'In Process', 'Sorry for your inconvenience.', '2024-04-09 05:25:53'),
(7, 5, 'Closed', 'We take an action further this mistake is not repeated ', '2024-04-09 05:26:54'),
(8, 2, 'In Process', 'In-process', '2024-04-09 06:02:26'),
(9, 6, 'Closed', 'Test complaint\r\n', '2024-04-17 11:38:40'),
(10, 7, 'In Process', 'Electrrician is assigned', '2024-04-17 11:39:30'),
(11, 7, 'Closed', 'LED light changed', '2024-04-17 11:39:50'),
(12, 2, 'In Process', 'ngfnf', '2024-05-13 08:59:43'),
(13, 9, 'Closed', 'fgvdfvdfd', '2024-05-13 09:00:47'),
(14, 11, 'In Process', '', '2024-05-13 11:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `ComplainNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `complaintDoc` varchar(255) DEFAULT NULL,
  `complaintStatus` varchar(255) DEFAULT NULL,
  `registrationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `ComplainNumber`, `userId`, `complaintType`, `complaintDetails`, `complaintDoc`, `complaintStatus`, `registrationDate`) VALUES
(1, 473906789, 4, 'Electrical', 'This is for test purpose', 'bc0037e941ee50dbff488eef4c685f32.pdf', 'Closed', '2024-04-07 09:06:16'),
(2, 296166607, 4, 'Electrical', 'This is for test purpose', '684f9df8912bb035fa3f3a569f40d052.pdf', 'In Process', '2024-04-07 11:38:48'),
(3, 461558892, 4, 'Electrical', 'This is for test purpose', '769e3a6e21b74288480b14c2e6cf66dd.pdf', NULL, '2024-04-07 11:40:42'),
(4, 950749466, 3, 'Plumbing', 'Plumbing issue in my room', 'c7444a1c5a9e78424303236267882ebf.pdf', 'Closed', '2024-04-07 18:22:23'),
(5, 740539183, 5, 'Food Related', 'Food is not hygiene ', '6c77c0c0527914a8d295ce2c84bfc46f.jpg', 'Closed', '2024-04-09 05:19:17'),
(6, 100515426, 6, 'Food Related', 'Room not clean', 'ee2caeb05d35fcbe710b9d5d0f5ca1fc.pdf', 'Closed', '2024-04-17 11:37:26'),
(7, 316012785, 6, 'Electrical', 'Led Ligh not working', NULL, 'Closed', '2024-04-17 11:39:03'),
(8, 646501702, 7, 'Fee Related', 'dfhtrgfnb', NULL, NULL, '2024-05-10 18:40:57'),
(9, 353033418, 1, 'Room Related', 'food is not goood', '7fa3c2520b9328f715c4cffdcc3cb210jpeg', 'Closed', '2024-05-11 16:16:09'),
(10, 565589109, 8, 'Fee Related', 'ccfgfb', NULL, NULL, '2024-05-12 14:04:03'),
(11, 303644370, 11, 'Discipline', 'No Discipline', '1d041c2451757950bab8a1209621de2b.png', 'In Process', '2024-05-13 08:57:45'),
(12, 131769751, 12, 'Electrical', 'Fan not working', NULL, NULL, '2024-05-13 11:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `roomno` int(11) DEFAULT NULL,
  `seater` int(11) DEFAULT NULL,
  `feespm` int(11) DEFAULT NULL,
  `foodstatus` int(11) DEFAULT NULL,
  `stayfrom` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `course` varchar(500) DEFAULT NULL,
  `regno` int(11) DEFAULT NULL,
  `firstName` varchar(500) DEFAULT NULL,
  `middleName` varchar(500) DEFAULT NULL,
  `lastName` varchar(500) DEFAULT NULL,
  `gender` varchar(250) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `emailid` varchar(500) DEFAULT NULL,
  `egycontactno` bigint(11) DEFAULT NULL,
  `guardianName` varchar(500) DEFAULT NULL,
  `guardianRelation` varchar(500) DEFAULT NULL,
  `guardianContactno` bigint(11) DEFAULT NULL,
  `corresAddress` varchar(500) DEFAULT NULL,
  `corresCIty` varchar(500) DEFAULT NULL,
  `corresState` varchar(500) DEFAULT NULL,
  `corresPincode` int(11) DEFAULT NULL,
  `pmntAddress` varchar(500) DEFAULT NULL,
  `pmntCity` varchar(500) DEFAULT NULL,
  `pmnatetState` varchar(500) DEFAULT NULL,
  `pmntPincode` int(11) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `roomno`, `seater`, `feespm`, `foodstatus`, `stayfrom`, `duration`, `course`, `regno`, `firstName`, `middleName`, `lastName`, `gender`, `contactno`, `emailid`, `egycontactno`, `guardianName`, `guardianRelation`, `guardianContactno`, `corresAddress`, `corresCIty`, `corresState`, `corresPincode`, `pmntAddress`, `pmntCity`, `pmnatetState`, `pmntPincode`, `postingDate`, `updationDate`) VALUES
(7, 100, 5, 8000, 0, '2014-09-14', 8, NULL, 21, 'Akansha', '', 'Yadav', 'female', 8695564926, 'akansha.yadav2021@vitbhopal.ac.in', 8154515452, 'Vijaya', 'Father', 8465498264, '9c-257-1, gundlappa doddi, kalyandrug', 'Anantapur', 'Andhra Pradesh', 515761, '9c-257-1, gundlappa doddi, kalyandrug', 'Anantapur', 'Andhra Pradesh', 515761, '2024-05-11 18:38:34', NULL),
(8, 112, 3, 4000, 1, '2024-05-13', 2, NULL, 21, 'Sita', 'Rani', 'Patro', 'female', 6723450945, 'sita23@gmail.com', 4562318907, 'Ram', 'Father', 6751239088, 'Ganjam,Odisha', 'Buguda', 'Odisha', 761117, 'Ganjam,Odisha', 'Buguda', 'Odisha', 761117, '2024-05-13 11:14:00', NULL),
(9, 201, 2, 6000, 0, '2024-05-13', 2, NULL, 21, 'Something', '', 'sahoo', 'female', 1234567808, 'something@gmail.com', 2345678901, 'Some', 'Father', 6789012345, 'Hyderabad', 'Hyderabad', 'Telangana', 760987, 'Hyderabad', 'Hyderabad', 'Telangana', 760987, '2024-05-13 13:20:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `seater` int(11) DEFAULT NULL,
  `room_no` int(11) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `posting_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `seater`, `room_no`, `fees`, `posting_date`) VALUES
(1, 5, 100, 80005, '2024-02-19 22:45:43'),
(2, 2, 201, 6000, '2024-02-19 22:45:43'),
(3, 2, 200, 6000, '2024-02-19 22:45:43'),
(4, 3, 112, 4000, '2024-02-19 22:45:43'),
(5, 5, 132, 2000, '2024-02-19 22:45:43'),
(6, 3, 145, 3000, '2024-04-17 11:41:16'),
(7, 1, 0, 1521, '2024-05-12 19:32:41'),
(8, 2, 423, 1289, '2024-05-13 11:09:45'),
(9, 2, 45, 1521, '2024-05-13 12:23:04'),
(10, 2, 125, 5525, '2024-05-13 13:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `State` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `State`) VALUES
(1, 'Andaman and Nicobar Island (UT)'),
(2, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh (UT)'),
(7, 'Chhattisgarh'),
(8, 'Dadra and Nagar Haveli (UT)'),
(9, 'Daman and Diu (UT)'),
(10, 'Delhi (NCT)'),
(11, 'Goa'),
(12, 'Gujarat'),
(13, 'Haryana'),
(14, 'Himachal Pradesh'),
(15, 'Jammu and Kashmir'),
(16, 'Jharkhand'),
(17, 'Karnataka'),
(18, 'Kerala'),
(19, 'Lakshadweep (UT)'),
(20, 'Madhya Pradesh'),
(21, 'Maharashtra'),
(22, 'Manipur'),
(23, 'Meghalaya'),
(24, 'Mizoram'),
(25, 'Nagaland'),
(26, 'Odisha'),
(27, 'Puducherry (UT)'),
(28, 'Punjab'),
(29, 'Rajastha'),
(30, 'Sikkim'),
(31, 'Tamil Nadu'),
(32, 'Telangana'),
(33, 'Tripura'),
(34, 'Uttarakhand'),
(35, 'Uttar Pradesh'),
(36, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userIp` varbinary(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `userEmail`, `userIp`, `city`, `country`, `loginTime`) VALUES
(1, 4, 'hohn@gmail.com', 0x3a3a31, '', '', '2024-03-14 05:15:31'),
(2, 4, 'hohn@gmail.com', 0x3a3a31, '', '', '2024-03-14 06:09:44'),
(3, 4, 'hohn@gmail.com', 0x3a3a31, '', '', '2024-04-07 18:19:48'),
(4, 4, 'hohn@gmail.com', 0x3a3a31, '', '', '2024-04-07 18:19:49'),
(5, 3, 'test@gmail.com', 0x3a3a31, '', '', '2024-04-07 18:22:03'),
(6, 5, 'john@gmail.com', 0x3a3a31, '', '', '2024-04-09 05:06:35'),
(7, 5, 'john@gmail.com', 0x3a3a31, '', '', '2024-04-09 06:23:52'),
(8, 5, 'john@gmail.com', 0x3a3a31, '', '', '2024-04-17 11:29:34'),
(9, 6, 'amit123@gmail.com', 0x3a3a31, '', '', '2024-04-17 11:34:03'),
(10, 6, 'amit123@gmail.com', 0x3a3a31, '', '', '2024-04-17 17:13:08'),
(11, 7, '21BCE11671', 0x3a3a31, '', '', '2024-05-09 21:13:10'),
(12, 7, '21BCE11671', 0x3a3a31, '', '', '2024-05-10 17:31:50'),
(13, 7, '21BCE11671', 0x3a3a31, '', '', '2024-05-10 17:55:08'),
(14, 7, '21BCE11671', 0x3a3a31, '', '', '2024-05-10 17:56:23'),
(15, 7, '21BCE11671', 0x3a3a31, '', '', '2024-05-10 18:39:36'),
(16, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-10 19:16:36'),
(17, 9, 'Audrija.Adak2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-10 19:25:24'),
(18, 7, '21BCE11671', 0x3a3a31, '', '', '2024-05-10 20:04:20'),
(19, 9, 'Audrija.Adak2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-10 20:19:43'),
(20, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-11 16:09:28'),
(21, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-11 16:19:14'),
(22, 7, 'khatri.likitha2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-11 16:19:29'),
(23, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-11 17:04:45'),
(24, 7, 'khatri.likitha2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-11 17:21:50'),
(25, 7, 'khatri.likitha2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 13:31:52'),
(26, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 14:00:24'),
(27, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 14:03:54'),
(28, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 14:04:49'),
(29, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 17:05:28'),
(30, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 18:04:30'),
(31, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 18:36:27'),
(32, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 18:38:27'),
(33, 7, 'khatri.likitha2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 18:40:25'),
(34, 7, 'khatri.likitha2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 18:40:25'),
(35, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 19:17:58'),
(36, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 19:28:41'),
(37, 7, 'khatri.likitha2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 19:31:00'),
(38, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 19:34:10'),
(39, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-12 21:46:21'),
(40, 11, 'rohit.rana2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 08:56:30'),
(41, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 09:29:50'),
(42, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 10:07:31'),
(43, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 10:45:36'),
(44, 12, '21BHI10091', 0x3a3a31, '', '', '2024-05-13 11:02:29'),
(45, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 11:16:14'),
(46, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 12:21:22'),
(47, 9, 'Audrija.Adak2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 12:50:04'),
(48, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 14:27:34'),
(49, 8, 'Yashika.Sharma2021@vitbhopal.ac.in', 0x3a3a31, '', '', '2024-05-13 15:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `regNo` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `contactNo` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(45) DEFAULT NULL,
  `passUdateDate` varchar(45) DEFAULT NULL,
  `block` varchar(255) DEFAULT NULL,
  `roomNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`id`, `regNo`, `firstName`, `middleName`, `lastName`, `gender`, `contactNo`, `email`, `password`, `regDate`, `updationDate`, `passUdateDate`, `block`, `roomNo`) VALUES
(7, '21BCE11671', 'Likitha', '', 'Khatri', 'female', 8143615774, 'khatri.likitha2021@vitbhopal.ac.in', 'likitha', '2024-05-09 21:12:47', '11-05-2024 01:49:32', NULL, '2', 'C302'),
(8, ' 21BCG10119', 'Yashika', '', 'Sharma', 'female', 8143615774, 'Yashika.Sharma2021@vitbhopal.ac.in', 'yash', '2024-05-10 19:16:22', '11-05-2024 09:41:05', NULL, '2', 'D220'),
(9, ' 21BHI10039', 'Audrija', '', 'Adak', 'female', 8143615774, 'Audrija.Adak2021@vitbhopal.ac.in', 'aAudrija', '2024-05-10 19:25:16', '11-05-2024 01:33:43', NULL, '2', 'C302'),
(10, '21BCE115999', 'Akansha', '', 'Yadav', 'female', 8695564926, 'akansha.yadav2021@vitbhopal.ac.in', '8695564926', '2024-05-11 18:38:34', NULL, NULL, NULL, NULL),
(11, '21BCE11666', 'Rohit', '', 'Rana', 'female', 8594325925, 'rohit.rana2021@vitbhopal.ac.in', 'rohit', '2024-05-13 08:55:57', '13-05-2024 02:28:26', NULL, '5', 'A520'),
(12, '21BHI10091', 'Sanjana', '', 'Senapati', 'female', 9777554070, 'sanjana.a2021@vitbhopal.ac.in', 'Senapa123', '2024-05-13 11:01:47', '13-05-2024 04:34:20', '13-05-2024 04:34:50', '1', '324'),
(13, '21BHI10092', 'Sita', 'Rani', 'Patro', 'female', 6723450945, 'sita23@gmail.com', '6723450945', '2024-05-13 11:14:00', NULL, NULL, NULL, NULL),
(14, '21BHI10089', 'Something', '', 'sahoo', 'female', 1234567808, 'something@gmail.com', '1234567808', '2024-05-13 13:20:17', NULL, NULL, NULL, NULL),
(15, '21OTH12654', 'me', '', 'myself', 'female', 5585686855, 'memyself25@gmail.com', 'me', '2024-05-13 13:28:25', NULL, NULL, NULL, NULL),
(16, '21BGF651545', 'vfgfgfb', '', 'vfvfv', 'female', 6854568656, 'vfgfbvfvbfgv558@gmail.com', 'likitha', '2024-05-13 13:32:45', NULL, NULL, NULL, NULL),
(17, '21BHG585651', 'FGVFDVF', '', 'VFVFV', 'female', 546565585, 'VRFGFVVF@gmail.com', 'likitha', '2024-05-13 13:38:53', NULL, NULL, NULL, NULL),
(18, '21bgf95565', 'vfvbf', '', 'vfvf', 'male', 54544564684, 'vdrgffbgfg@gmail.com', 'likitha', '2024-05-13 14:09:46', NULL, NULL, NULL, NULL),
(19, 'bfbgngfbgf', 'bfgbfg', '', 'fbfbgnbg', 'male', 65852156, 'vrgthtyh2021@vitbhopal.ac.in', 'likitha', '2024-05-13 14:12:08', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complainthistory`
--
ALTER TABLE `complainthistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_no` (`room_no`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complainthistory`
--
ALTER TABLE `complainthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
