-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220513.fb9d9feb74
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2022 at 06:36 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotman`
--

-- --------------------------------------------------------

--
-- Table structure for table `acroom`
--

CREATE TABLE `acroom` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(2, 'hotman', '@hotman');

-- --------------------------------------------------------

--
-- Table structure for table `admin_edit`
--

CREATE TABLE `admin_edit` (
  `admin_id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `admin_edit`
--
DELIMITER $$
CREATE TRIGGER `Audit_ac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'AC') THEN
            INSERT INTO acroom

    SET  
	roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	price = 900,

	status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Audit_delux` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
     IF ( NEW.roomtype = 'deluxAC') THEN
        INSERT INTO deluxacroom
           SET
    
            roomno = NEW.roomno,

            roomtype =  NEW.roomtype,

           price = 1100,

           status = 'un book';
      
            
      END IF;
   
    

    

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Audit_nonac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'nonAC') THEN
            INSERT INTO nonac

    SET  
	    roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	   price = 700,

	   status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `card details`
--

CREATE TABLE `card details` (
  `id` int(11) NOT NULL,
  `cardno` bigint(16) NOT NULL,
  `cvv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card details`
--

INSERT INTO `card details` (`id`, `cardno`, `cvv`) VALUES
(1, 1111111111111111, 111),
(2, 2222222222222222, 222),
(3, 3333333333333333, 333),
(4, 4444444444444444, 444);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deluxacroom`
--

CREATE TABLE `deluxacroom` (
  `id` int(11) NOT NULL,
  `roomno` int(20) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deluxacroom`
--

INSERT INTO `deluxacroom` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(25, 0, 'Delux A.C.', 1500, 'book'),
(26, 0, 'Delux A.C.', 1500, 'book'),
(27, 0, 'Delux A.C.', 1500, 'book'),
(28, 0, 'Delux A.C.', 1500, 'book');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `feedback` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(255) NOT NULL,
  `full_name` text NOT NULL,
  `phone` bigint(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `full_name`, `phone`, `address`) VALUES
(29, 'Atul Rajput', 9761452894, 'Vill kamalpur, Post mandawar');

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE `hall` (
  `id` int(11) NOT NULL,
  `hallyype` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`id`, `hallyype`, `price`, `status`) VALUES
(1, 'marriage', 10000, 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `hall_details`
--

CREATE TABLE `hall_details` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `members` int(11) NOT NULL,
  `function` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nonac`
--

CREATE TABLE `nonac` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registered_users`
--

CREATE TABLE `registered_users` (
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registered_users`
--

INSERT INTO `registered_users` (`name`, `username`, `email`, `password`) VALUES
('atul', 'ar', 'paritul9@gmail.com', '$2y$10$AJAFRexkbt8WW0PDwIIVJeIILF8rezXj1xfIeiYehQ21XT2RLZM3K');

-- --------------------------------------------------------

--
-- Table structure for table `room booking`
--

CREATE TABLE `room booking` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `cin` varchar(20) NOT NULL,
  `cout` varchar(20) NOT NULL,
  `members` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `no of rooms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room booking`
--

INSERT INTO `room booking` (`id`, `name`, `address`, `state`, `city`, `email`, `cin`, `cout`, `members`, `roomtype`, `no of rooms`) VALUES
(95, 'Atul Rajput', 'Vill kamalpur, Post ', 'Uttar Pradesh', 'Bijnor', 'paritul9@gmail.com', '2022-04-30', '2022-05-04', 2, 'Delux AC', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acroom`
--
ALTER TABLE `acroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_edit`
--
ALTER TABLE `admin_edit`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `card details`
--
ALTER TABLE `card details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deluxacroom`
--
ALTER TABLE `deluxacroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall_details`
--
ALTER TABLE `hall_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nonac`
--
ALTER TABLE `nonac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registered_users`
--
ALTER TABLE `registered_users`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `room booking`
--
ALTER TABLE `room booking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acroom`
--
ALTER TABLE `acroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_edit`
--
ALTER TABLE `admin_edit`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card details`
--
ALTER TABLE `card details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deluxacroom`
--
ALTER TABLE `deluxacroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hall`
--
ALTER TABLE `hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hall_details`
--
ALTER TABLE `hall_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nonac`
--
ALTER TABLE `nonac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room booking`
--
ALTER TABLE `room booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



