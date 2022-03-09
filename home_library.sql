-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 03:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `home_library`
--
CREATE DATABASE IF NOT EXISTS `home_library` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `home_library`;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `name`) VALUES
(1, 'Joanne K. Rowling');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `part` int(11) DEFAULT NULL,
  `series` varchar(20) DEFAULT NULL,
  `imprint` varchar(10) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `released` year(4) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `fk_cover` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `part`, `series`, `imprint`, `edition`, `released`, `description`, `pages`, `lang`, `price`, `fk_cover`) VALUES
(1, 'Harry Potter and the Philosopher\'s Stone', 1, 'Harry Potter', NULL, NULL, 1997, NULL, 223, 'English', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booktoauthor`
--

CREATE TABLE `booktoauthor` (
  `fk_author` int(11) NOT NULL,
  `fk_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booktoauthor`
--

INSERT INTO `booktoauthor` (`fk_author`, `fk_book`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `booktogenre`
--

CREATE TABLE `booktogenre` (
  `fk_genre` int(11) NOT NULL,
  `fk_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booktogenre`
--

INSERT INTO `booktogenre` (`fk_genre`, `fk_book`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `booktopublisher`
--

CREATE TABLE `booktopublisher` (
  `fk_pub` int(11) NOT NULL,
  `fk_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booktopublisher`
--

INSERT INTO `booktopublisher` (`fk_pub`, `fk_book`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `booktoreading`
--

CREATE TABLE `booktoreading` (
  `fk_reading` int(11) NOT NULL,
  `fk_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booktotranslator`
--

CREATE TABLE `booktotranslator` (
  `fk_trans` int(11) NOT NULL,
  `fk_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `covers`
--

CREATE TABLE `covers` (
  `cover_id` int(11) NOT NULL,
  `fk_book` int(11) NOT NULL,
  `src` varchar(150) DEFAULT NULL,
  `design` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `covers`
--

INSERT INTO `covers` (`cover_id`, `fk_book`, `src`, `design`) VALUES
(1, 1, 'https://images-na.ssl-images-amazon.com/images/I/51mtZy7oJVL.jpg', NULL),
(2, 1, 'https://images-na.ssl-images-amazon.com/images/I/51UDJ6EbhXL._SX323_BO1,204,203,200_.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre`) VALUES
(1, 'Fantasy');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `pub_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`pub_id`, `name`, `country`) VALUES
(1, 'Bloomsbury', 'United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `readings`
--

CREATE TABLE `readings` (
  `fk_book` int(11) DEFAULT NULL,
  `reading_id` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `hours` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translators`
--

CREATE TABLE `translators` (
  `trans_id` int(11) NOT NULL,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_cover` (`fk_cover`);

--
-- Indexes for table `booktoauthor`
--
ALTER TABLE `booktoauthor`
  ADD PRIMARY KEY (`fk_author`,`fk_book`),
  ADD KEY `fk_book` (`fk_book`);

--
-- Indexes for table `booktogenre`
--
ALTER TABLE `booktogenre`
  ADD PRIMARY KEY (`fk_genre`,`fk_book`),
  ADD KEY `fk_book` (`fk_book`);

--
-- Indexes for table `booktopublisher`
--
ALTER TABLE `booktopublisher`
  ADD PRIMARY KEY (`fk_pub`,`fk_book`),
  ADD KEY `fk_book` (`fk_book`);

--
-- Indexes for table `booktoreading`
--
ALTER TABLE `booktoreading`
  ADD PRIMARY KEY (`fk_reading`,`fk_book`);

--
-- Indexes for table `booktotranslator`
--
ALTER TABLE `booktotranslator`
  ADD PRIMARY KEY (`fk_trans`,`fk_book`),
  ADD KEY `fk_book` (`fk_book`);

--
-- Indexes for table `covers`
--
ALTER TABLE `covers`
  ADD PRIMARY KEY (`cover_id`,`fk_book`),
  ADD KEY `fk_book` (`fk_book`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`pub_id`);

--
-- Indexes for table `readings`
--
ALTER TABLE `readings`
  ADD PRIMARY KEY (`reading_id`),
  ADD KEY `reading_ibfk_1` (`fk_book`);

--
-- Indexes for table `translators`
--
ALTER TABLE `translators`
  ADD PRIMARY KEY (`trans_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `covers`
--
ALTER TABLE `covers`
  MODIFY `cover_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `readings`
--
ALTER TABLE `readings`
  MODIFY `reading_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translators`
--
ALTER TABLE `translators`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`fk_cover`) REFERENCES `covers` (`cover_id`);

--
-- Constraints for table `booktoauthor`
--
ALTER TABLE `booktoauthor`
  ADD CONSTRAINT `booktoauthor_ibfk_1` FOREIGN KEY (`fk_author`) REFERENCES `authors` (`author_id`),
  ADD CONSTRAINT `booktoauthor_ibfk_2` FOREIGN KEY (`fk_book`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `booktogenre`
--
ALTER TABLE `booktogenre`
  ADD CONSTRAINT `booktogenre_ibfk_2` FOREIGN KEY (`fk_book`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `booktogenre_ibfk_3` FOREIGN KEY (`fk_genre`) REFERENCES `genres` (`genre_id`) ON UPDATE CASCADE;

--
-- Constraints for table `booktopublisher`
--
ALTER TABLE `booktopublisher`
  ADD CONSTRAINT `booktopublisher_ibfk_1` FOREIGN KEY (`fk_book`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `booktopublisher_ibfk_2` FOREIGN KEY (`fk_pub`) REFERENCES `publishers` (`pub_id`);

--
-- Constraints for table `booktoreading`
--
ALTER TABLE `booktoreading`
  ADD CONSTRAINT `booktoreading_ibfk_1` FOREIGN KEY (`fk_reading`) REFERENCES `readings` (`reading_id`);

--
-- Constraints for table `booktotranslator`
--
ALTER TABLE `booktotranslator`
  ADD CONSTRAINT `booktotranslator_ibfk_1` FOREIGN KEY (`fk_trans`) REFERENCES `translators` (`trans_id`),
  ADD CONSTRAINT `booktotranslator_ibfk_2` FOREIGN KEY (`fk_book`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `covers`
--
ALTER TABLE `covers`
  ADD CONSTRAINT `covers_ibfk_1` FOREIGN KEY (`fk_book`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `readings`
--
ALTER TABLE `readings`
  ADD CONSTRAINT `readings_ibfk_1` FOREIGN KEY (`fk_book`) REFERENCES `books` (`book_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
