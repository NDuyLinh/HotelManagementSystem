-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2018 at 04:53 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlykhachsan`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `UserName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PasssWord` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Active` bit(1) DEFAULT NULL,
  `Statee` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `ID` int(11) NOT NULL,
  `IDRent` int(11) DEFAULT NULL,
  `IDService` int(11) DEFAULT NULL,
  `IDEmployee` int(11) DEFAULT NULL,
  `Quantyties` int(11) DEFAULT NULL,
  `Paid` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CMND` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IDAccount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CMND` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IDAccount` int(11) DEFAULT NULL,
  `IDPosition` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `ID` int(11) NOT NULL,
  `NamePosition` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `ID` int(11) NOT NULL,
  `IDCustomer` int(11) DEFAULT NULL,
  `IDRoom` int(11) DEFAULT NULL,
  `DateIN` datetime DEFAULT NULL,
  `DateOut` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `ID` int(11) NOT NULL,
  `TypeRoom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Descriptionn` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Statuss` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ID` int(11) NOT NULL,
  `NameServices` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_bill_Rent` (`IDRent`),
  ADD KEY `fk_bill_Services` (`IDService`),
  ADD KEY `fk_bill_Employee` (`IDEmployee`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Customer_Account` (`IDAccount`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Employee_Account` (`IDAccount`),
  ADD KEY `fk_Employee_Position` (`IDPosition`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Rent_Customer` (`IDCustomer`),
  ADD KEY `fk_Rent_Room` (`IDRoom`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_bill_Employee` FOREIGN KEY (`IDEmployee`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `fk_bill_Rent` FOREIGN KEY (`IDRent`) REFERENCES `rent` (`ID`),
  ADD CONSTRAINT `fk_bill_Services` FOREIGN KEY (`IDService`) REFERENCES `services` (`ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_Customer_Account` FOREIGN KEY (`IDAccount`) REFERENCES `account` (`ID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_Employee_Account` FOREIGN KEY (`IDAccount`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `fk_Employee_Position` FOREIGN KEY (`IDPosition`) REFERENCES `positions` (`ID`);

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `fk_Rent_Customer` FOREIGN KEY (`IDCustomer`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `fk_Rent_Room` FOREIGN KEY (`IDRoom`) REFERENCES `rooms` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
