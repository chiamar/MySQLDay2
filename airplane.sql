-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 03:31 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airplane`
--
CREATE DATABASE IF NOT EXISTS `airplane` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `airplane`;

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `airportCode` char(25) NOT NULL,
  `city` char(25) NOT NULL,
  `country` char(25) NOT NULL,
  `fk_flightid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`airportCode`, `city`, `country`, `fk_flightid`) VALUES
('DXB', 'United Arab Emirates', 'Dubai', 6),
('JFK', 'New York', 'USA', 5),
('LPA', 'Gran Canaria', 'Spain', 4);

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flightId` int(11) NOT NULL,
  `origin` char(25) NOT NULL,
  `destination` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flightId`, `origin`, `destination`) VALUES
(4, 'Vienna', 'Gran Canaria'),
(5, 'Vienna', 'New York'),
(6, 'Belgrad', 'Dubai');

-- --------------------------------------------------------

--
-- Table structure for table `manufactor`
--

CREATE TABLE `manufactor` (
  `manufactorId` int(11) NOT NULL,
  `planeName` char(25) NOT NULL,
  `productionYear` char(25) NOT NULL,
  `productionCost` char(25) NOT NULL,
  `productionTime` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufactor`
--

INSERT INTO `manufactor` (`manufactorId`, `planeName`, `productionYear`, `productionCost`, `productionTime`) VALUES
(1, 'BOEING 747', '2020', '418400100', '43 Days'),
(2, 'BOEING 747', '2022', '500150700', '50'),
(3, 'Airbus A340', '2019', '350120750', '240 Days');

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE `planes` (
  `regNumb` int(11) NOT NULL,
  `manufactor` char(25) NOT NULL,
  `model` char(25) NOT NULL,
  `capacity` int(11) NOT NULL,
  `flightRange` int(11) NOT NULL,
  `fk_storageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `planes`
--

INSERT INTO `planes` (`regNumb`, `manufactor`, `model`, `capacity`, `flightRange`, `fk_storageId`) VALUES
(1, 'BOEING', '747', 120, 3540, 3),
(2, 'BOEING', '747', 150, 6823, 3),
(3, 'Airbus', 'A340', 250, 3800, 3);

-- --------------------------------------------------------

--
-- Table structure for table `planestomanufactor`
--

CREATE TABLE `planestomanufactor` (
  `planesToManufactorId` int(11) NOT NULL,
  `fk_regNumb` int(11) NOT NULL,
  `fk_manufactorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `planestomanufactor`
--

INSERT INTO `planestomanufactor` (`planesToManufactorId`, `fk_regNumb`, `fk_manufactorId`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `storageId` int(11) NOT NULL,
  `startingTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `passengerCheckIn` int(11) NOT NULL,
  `fk_flightId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`storageId`, `startingTime`, `endTime`, `passengerCheckIn`, `fk_flightId`) VALUES
(1, '2022-03-07 14:18:36', '2022-03-08 14:18:36', 105, 4),
(2, '2022-03-01 14:18:36', '2022-03-02 09:18:36', 95, 5),
(3, '2022-03-25 14:18:36', '2022-03-26 00:18:36', 201, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`airportCode`),
  ADD KEY `fk_flightid` (`fk_flightid`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flightId`);

--
-- Indexes for table `manufactor`
--
ALTER TABLE `manufactor`
  ADD PRIMARY KEY (`manufactorId`);

--
-- Indexes for table `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`regNumb`),
  ADD KEY `fk_storageId` (`fk_storageId`);

--
-- Indexes for table `planestomanufactor`
--
ALTER TABLE `planestomanufactor`
  ADD PRIMARY KEY (`planesToManufactorId`),
  ADD KEY `fk_regNumb` (`fk_regNumb`),
  ADD KEY `fk_manufactorId` (`fk_manufactorId`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`storageId`),
  ADD KEY `fk_flightId` (`fk_flightId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flightId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `manufactor`
--
ALTER TABLE `manufactor`
  MODIFY `manufactorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `planes`
--
ALTER TABLE `planes`
  MODIFY `regNumb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `planestomanufactor`
--
ALTER TABLE `planestomanufactor`
  MODIFY `planesToManufactorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `storageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`fk_flightid`) REFERENCES `flights` (`flightId`);

--
-- Constraints for table `planes`
--
ALTER TABLE `planes`
  ADD CONSTRAINT `planes_ibfk_1` FOREIGN KEY (`fk_storageId`) REFERENCES `storage` (`storageId`);

--
-- Constraints for table `planestomanufactor`
--
ALTER TABLE `planestomanufactor`
  ADD CONSTRAINT `planestomanufactor_ibfk_1` FOREIGN KEY (`fk_regNumb`) REFERENCES `planes` (`regNumb`),
  ADD CONSTRAINT `planestomanufactor_ibfk_2` FOREIGN KEY (`fk_manufactorId`) REFERENCES `manufactor` (`manufactorId`);

--
-- Constraints for table `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`fk_flightId`) REFERENCES `flights` (`flightId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
