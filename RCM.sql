-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 23, 2021 at 08:19 PM
-- Server version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.34-18+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RCM`
--

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `ID` int(11) NOT NULL,
  `Name` varchar(10000) NOT NULL,
  `Address` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`ID`, `Name`, `Address`) VALUES
(1, 'Nuwan', 'Galle'),
(2, 'Dinesh', 'Mathara');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `ID` int(255) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `Mobile number` int(255) NOT NULL,
  `position ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`ID`, `Name`, `Address`, `Mobile number`, `position ID`) VALUES
(1, 'Asha', 'Maradana, colombo - 10', 770112376, 1),
(2, 'Shameela Ashker ', 'Warakapola', 765431234, 2),
(3, 'Tharmila Vijayan', 'Jaffna ', 770495367, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Employee position`
--

CREATE TABLE `Employee position` (
  `ID` int(255) NOT NULL,
  `Name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Employee position`
--

INSERT INTO `Employee position` (`ID`, `Name`) VALUES
(1, 'Software engineer '),
(2, 'Quality Assurance Engineer '),
(3, 'Senior software engineer'),
(4, 'Associate software engineer'),
(5, 'Senior quality assurance engineer'),
(6, 'Business analyst');

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `ID` int(255) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `Client ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Project`
--

INSERT INTO `Project` (`ID`, `Name`, `Client ID`) VALUES
(1, 'Teaching and learning system ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Requirement`
--

CREATE TABLE `Requirement` (
  `ID` int(255) NOT NULL,
  `Project ID` int(255) NOT NULL,
  `Employee ID` int(255) NOT NULL,
  `requirement` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Requirement`
--

INSERT INTO `Requirement` (`ID`, `Project ID`, `Employee ID`, `requirement`) VALUES
(1, 1, 2, 'Home page login form color should be in black '),
(2, 1, 2, 'Home page login form font type should Arial'),
(3, 1, 2, 'Home page login form login button should be in blue colour'),
(4, 1, 2, 'Home page registration form button should be in blue color'),
(5, 1, 2, 'user profile should have a account setting feature');

-- --------------------------------------------------------

--
-- Table structure for table `Requirement change`
--

CREATE TABLE `Requirement change` (
  `ID` int(255) NOT NULL,
  `Project ID` int(255) NOT NULL,
  `Requirement change` varchar(2000) NOT NULL,
  `user interface` varchar(1000) NOT NULL,
  `main component` varchar(1000) NOT NULL,
  `sub component` varchar(1000) NOT NULL,
  `mini component` varchar(1000) NOT NULL,
  `type of requirement change` varchar(1000) NOT NULL,
  `impact ratio` int(255) NOT NULL,
  `impact complexity` varchar(1000) NOT NULL,
  `effort` int(255) NOT NULL,
  `cost` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Requirement hierarchy`
--

CREATE TABLE `Requirement hierarchy` (
  `ID` int(255) NOT NULL,
  `requirement ID` int(255) NOT NULL,
  `user interface ID` int(255) NOT NULL,
  `main component` varchar(1000) NOT NULL,
  `sub component` varchar(1000) NOT NULL,
  `mini component` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Requirement hierarchy`
--

INSERT INTO `Requirement hierarchy` (`ID`, `requirement ID`, `user interface ID`, `main component`, `sub component`, `mini component`) VALUES
(1, 1, 1, 'login form', 'color\r\n', ''),
(2, 2, 1, 'login form', 'font type\r\n', ''),
(3, 3, 1, 'login form', 'login button\r\n', ''),
(4, 4, 1, 'registration form', 'button\r\n', ''),
(5, 5, 2, 'account setting', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user interface`
--

CREATE TABLE `user interface` (
  `ID` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user interface`
--

INSERT INTO `user interface` (`ID`, `Name`) VALUES
(1, 'Home '),
(2, 'User profile');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_position_ID` (`position ID`);

--
-- Indexes for table `Employee position`
--
ALTER TABLE `Employee position`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_client_ID` (`Client ID`);

--
-- Indexes for table `Requirement`
--
ALTER TABLE `Requirement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_project_ID` (`Project ID`),
  ADD KEY `Fk_employee_ID` (`Employee ID`);

--
-- Indexes for table `Requirement change`
--
ALTER TABLE `Requirement change`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `foreign_key_project_ID` (`Project ID`);

--
-- Indexes for table `Requirement hierarchy`
--
ALTER TABLE `Requirement hierarchy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Requirement_ID` (`requirement ID`),
  ADD KEY `Fk_UserInterface_ID` (`user interface ID`);

--
-- Indexes for table `user interface`
--
ALTER TABLE `user interface`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Employee position`
--
ALTER TABLE `Employee position`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Requirement`
--
ALTER TABLE `Requirement`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Requirement change`
--
ALTER TABLE `Requirement change`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Requirement hierarchy`
--
ALTER TABLE `Requirement hierarchy`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user interface`
--
ALTER TABLE `user interface`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `FK_position_ID` FOREIGN KEY (`position ID`) REFERENCES `Employee position` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Project`
--
ALTER TABLE `Project`
  ADD CONSTRAINT `FK_client_ID` FOREIGN KEY (`Client ID`) REFERENCES `Client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Requirement`
--
ALTER TABLE `Requirement`
  ADD CONSTRAINT `FK_project_ID` FOREIGN KEY (`Project ID`) REFERENCES `Project` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_employee_ID` FOREIGN KEY (`Employee ID`) REFERENCES `Employee` (`ID`);

--
-- Constraints for table `Requirement change`
--
ALTER TABLE `Requirement change`
  ADD CONSTRAINT `foreign_key_project_ID` FOREIGN KEY (`Project ID`) REFERENCES `Project` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Requirement hierarchy`
--
ALTER TABLE `Requirement hierarchy`
  ADD CONSTRAINT `FK_Requirement_ID` FOREIGN KEY (`requirement ID`) REFERENCES `Requirement` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_UserInterface_ID` FOREIGN KEY (`user interface ID`) REFERENCES `user interface` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
