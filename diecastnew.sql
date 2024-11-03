-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2023 at 07:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diecastnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `amount`
--

CREATE TABLE `amount` (
  `AmountID` int(11) NOT NULL,
  `PaymentID` int(11) DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `QuantitySold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amount`
--

INSERT INTO `amount` (`AmountID`, `PaymentID`, `TotalAmount`, `QuantitySold`) VALUES
(1, 1, 29.99, 1),
(2, 2, 19.99, 2),
(3, 3, 9.99, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `Email`, `Address`, `Phone`, `RegistrationDate`) VALUES
(1, 'Julius', 'julius@mail.com', '123 Main St, City, Country', '555-123-4567', '2023-01-15'),
(2, 'Vinh', 'vinh@mail.com', '456 Elm St, Town, Country', '555-987-6543', '2023-02-20'),
(3, 'Bob', 'bobn@mail.com', '789 Oak St, Village, Country', '555-234-5678', '2023-03-10'),
(4, 'N/A', 'N/A', 'N/A', 'N/A', '2023-05-24');

-- --------------------------------------------------------

--
-- Table structure for table `fact_sales`
--

CREATE TABLE `fact_sales` (
  `CustomerID` int(11) NOT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `TotalAmount` bigint(20) DEFAULT NULL,
  `CustomerID_1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fact_sales`
--

INSERT INTO `fact_sales` (`CustomerID`, `OrderDate`, `TotalAmount`, `CustomerID_1`) VALUES
(1, '2023-05-21 00:00:00', NULL, 1),
(2, '2023-05-22 00:00:00', NULL, 2),
(3, '2023-05-23 00:00:00', NULL, 3),
(1, '2023-05-21 00:00:00', NULL, 1),
(2, '2023-05-22 00:00:00', NULL, 2),
(3, '2023-05-23 00:00:00', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentMethod` varchar(255) DEFAULT NULL,
  `CreditCardType` varchar(20) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `PaymentMethod`, `CreditCardType`, `PaymentStatus`, `OrderDate`) VALUES
(1, 'Credit Card', 'Visa', 'Paid', '2023-01-15'),
(2, 'PayPal', 'MasterCard', 'Paid', '2023-02-20'),
(3, 'Credit Card', 'Amex', 'Paid', '2023-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `paymentinfo`
--

CREATE TABLE `paymentinfo` (
  `PaymentID` bigint(20) DEFAULT NULL,
  `PaymentMethod` varchar(11) DEFAULT NULL,
  `CreditCardType` varchar(10) DEFAULT NULL,
  `PaymentStatus` varchar(4) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Year` bigint(20) DEFAULT NULL,
  `Quarter` bigint(20) DEFAULT NULL,
  `Month` bigint(20) DEFAULT NULL,
  `Day` bigint(20) DEFAULT NULL,
  `AmountID` bigint(20) DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `QuantitySold` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paymentinfo`
--

INSERT INTO `paymentinfo` (`PaymentID`, `PaymentMethod`, `CreditCardType`, `PaymentStatus`, `OrderDate`, `Year`, `Quarter`, `Month`, `Day`, `AmountID`, `TotalAmount`, `QuantitySold`) VALUES
(1, 'Credit Card', 'Visa', 'Paid', '2023-01-15 00:00:00', 2023, 1, 1, 15, 1, 29.99, 1),
(2, 'PayPal', 'MasterCard', 'Paid', '2023-02-20 00:00:00', 2023, 1, 2, 20, 2, 19.99, 2),
(3, 'Credit Card', 'Amex', 'Paid', '2023-03-10 00:00:00', 2023, 1, 3, 10, 3, 9.99, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `CarModel` varchar(255) DEFAULT NULL,
  `Scale` varchar(10) DEFAULT NULL,
  `Brand` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `CarModel`, `Scale`, `Brand`, `Price`, `Description`) VALUES
(115, 'Maisto Ford GT', 'Ford GT', '1:18', 'Maisto', 31.00, 'Iconic American sports car'),
(116, 'Bburago Bugatti Chiron', 'Bugatti Chiron', '1:24', 'Bburago', 37.00, 'High-performance supercar'),
(117, 'Welly Mercedes-Benz GLE', 'Mercedes-Benz GLE', '1:32', 'Welly', 26.00, 'Luxury SUV replica'),
(118, 'Jada Chevrolet Camaro', '', '1:18', 'Jada', 29.00, 'Muscle car powerhouse'),
(119, 'Hotwheels Aston Martin Vantage', 'Aston Martin Vantage', '1:24', 'Hotwheels', 35.00, 'British elegance on wheels'),
(120, 'Maisto Toyota Land Cruiser', 'Toyota Land Cruiser', '1:32', 'Maisto', 28.00, 'Off-road adventure-ready');

-- --------------------------------------------------------

--
-- Table structure for table `salesdata`
--

CREATE TABLE `salesdata` (
  `CustomerID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `TotalAmount` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesdata`
--

INSERT INTO `salesdata` (`CustomerID`, `OrderDate`, `TotalAmount`) VALUES
(1, '2023-11-22', 500),
(2, '2023-11-23', 750),
(3, '2023-11-24', 1000),
(4, '2023-11-24', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `salesdata1`
--

CREATE TABLE `salesdata1` (
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `OrderDate` date NOT NULL,
  `Year` int(11) DEFAULT NULL,
  `Quarter` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`OrderDate`, `Year`, `Quarter`, `Month`, `Day`) VALUES
('2023-01-15', 2023, 1, 1, 15),
('2023-02-20', 2023, 1, 2, 20),
('2023-03-10', 2023, 1, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tr_sales`
--

CREATE TABLE `tr_sales` (
  `PaymentID` varchar(15) DEFAULT NULL,
  `PaymentMethod` varchar(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `AmountID` bigint(20) DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `QuantitySold` bigint(20) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tr_sales`
--

INSERT INTO `tr_sales` (`PaymentID`, `PaymentMethod`, `OrderDate`, `AmountID`, `TotalAmount`, `QuantitySold`, `CustomerID`, `CustomerName`, `ProductID`) VALUES
('1', 'Credit Card', '2023-01-15 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
('2', 'PayPal', '2023-02-20 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
('3', 'Credit Card', '2023-03-10 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amount`
--
ALTER TABLE `amount`
  ADD PRIMARY KEY (`AmountID`),
  ADD KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderDate` (`OrderDate`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `salesdata1`
--
ALTER TABLE `salesdata1`
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`OrderDate`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amount`
--
ALTER TABLE `amount`
  ADD CONSTRAINT `amount_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderDate`) REFERENCES `time` (`OrderDate`);

--
-- Constraints for table `salesdata1`
--
ALTER TABLE `salesdata1`
  ADD CONSTRAINT `salesdata1_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
