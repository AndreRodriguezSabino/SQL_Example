-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 26, 2022 at 02:48 PM
-- Server version: 8.0.29-0ubuntu0.22.04.2
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `people_profile`
--
CREATE DATABASE IF NOT EXISTS `people_profile` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `people_profile`;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id_course` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text,
  `total_hours` int UNSIGNED DEFAULT NULL,
  `total_class` int NOT NULL,
  `course_year` year DEFAULT '2022',
  PRIMARY KEY (`id_course`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Truncate table before insert `course`
--

TRUNCATE TABLE `course`;
--
-- Dumping data for table `course`
--

INSERT DELAYED IGNORE INTO `course` (`id_course`, `name`, `description`, `total_hours`, `total_class`, `course_year`) VALUES
(1, 'PHP', 'Oriented Object Programation', 40, 15, 2020),
(2, 'HTML5', 'HTML5 is a course, offers the possibility to show your page with design.', 50, 20, 2019),
(3, 'CSS', 'With a combination with HTML5 you can deliver beautiful pages.', 30, 12, 2020),
(4, 'Excel', 'You are going to learn how to use financial tables.', 35, 16, 2018),
(5, 'Wordpress', 'You are going to learn how to build web pages using templates.', 30, 18, 2019),
(6, 'Python3', 'Very good course to who is starting on the programmatic world.', 50, 30, 2019),
(7, 'Photoshop', 'Course for design people.', 30, 12, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `job_name` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(3,2) DEFAULT NULL,
  `nacionality` varchar(20) DEFAULT 'United Kingdom',
  `preferred_course` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preferred_course` (`preferred_course`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Truncate table before insert `person`
--

TRUNCATE TABLE `person`;
--
-- Dumping data for table `person`
--

INSERT DELAYED IGNORE INTO `person` (`id`, `name`, `job_name`, `birthday`, `gender`, `weight`, `height`, `nacionality`, `preferred_course`) VALUES
(1, 'Andre', 'Programmer', '1986-07-15', 'M', '100.20', '1.80', 'Brazilian', 1),
(2, 'Graci', 'General Manager', '1988-11-07', 'F', '65.00', '1.62', 'Spanish', 2),
(3, 'Lucas', 'Gamer', '2012-11-22', 'M', '50.00', '1.50', 'Brazilian', 7),
(4, 'Jack', 'Bartender', '1994-07-18', 'M', '89.30', '1.79', 'United Kingdom', 2),
(5, 'Tereso', 'Macumbeiro', '1987-10-04', 'M', '89.30', '1.74', 'Portugal', 1),
(6, 'Michael', 'Saler', '1990-09-13', 'M', '91.20', '1.78', 'Australian', 3),
(7, 'Chambis', 'Nurse', '1991-05-16', 'F', '78.12', '1.65', 'German', 4),
(8, 'Clamisa', 'Cook', '1984-02-10', 'F', '92.00', '1.91', 'Nigerian', 5),
(9, 'Paul', 'Waiter', '1986-05-03', 'M', '98.20', '1.93', 'United Kingdom', 6),
(10, 'Magda', 'Teacher', '1988-09-15', 'F', '73.50', '1.74', 'United Kingdom', 7),
(11, 'Seth', 'Bar Back', '1994-06-22', 'M', '85.60', '1.88', 'United Kingdom', 1);

-- --------------------------------------------------------

--
-- Table structure for table `person_attend_course`
--

DROP TABLE IF EXISTS `person_attend_course`;
CREATE TABLE IF NOT EXISTS `person_attend_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attend_date` date DEFAULT NULL,
  `id_person` int DEFAULT NULL,
  `id_attend_course` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_person` (`id_person`),
  KEY `id_attend_course` (`id_attend_course`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Truncate table before insert `person_attend_course`
--

TRUNCATE TABLE `person_attend_course`;
--
-- Dumping data for table `person_attend_course`
--

INSERT DELAYED IGNORE INTO `person_attend_course` (`id`, `attend_date`, `id_person`, `id_attend_course`) VALUES
(1, '2022-07-15', 1, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`preferred_course`) REFERENCES `course` (`id_course`);

--
-- Constraints for table `person_attend_course`
--
ALTER TABLE `person_attend_course`
  ADD CONSTRAINT `person_attend_course_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `person_attend_course_ibfk_2` FOREIGN KEY (`id_attend_course`) REFERENCES `course` (`id_course`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
