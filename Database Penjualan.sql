-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2021 at 11:12 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `name`, `urutan`) VALUES
(1, 'samsung', 1),
(2, 'LG', 2),
(3, 'Huawei', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `name`, `urutan`) VALUES
(1, 'cellphone', 1),
(2, 'AC', 2),
(3, 'fridge', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gander` varchar(1) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `name`, `DOB`, `gander`, `address`, `payment_type`) VALUES
(1, 'Tono', '1988-01-01', 'M', 'Jln Imam bonjol', 'cash'),
(2, 'George', '1990-12-01', 'M', 'Jln Diponogori', 'credit'),
(3, 'Maria', '1989-08-30', 'F', 'Jln Cutmutia', 'credit'),
(4, 'Yunita', '1991-02-22', 'F', 'Jln Hasanuddin', 'credit'),
(5, 'Andi', '1988-04-15', 'M', 'Jln Sultan agung', 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `status` enum('ORDERED','SHIPPING','ARRIVED','DELIVERED','COMPLETED') DEFAULT NULL,
  `buat` datetime DEFAULT NULL,
  `perbarui` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `product_id`, `qty`, `customer_id`, `discount`, `status`, `buat`, `perbarui`) VALUES
(1, 1, 3, 1, 5, 'ORDERED', '2018-02-01 10:00:00', '2018-03-01 10:00:00'),
(2, 2, 2, 1, 5, 'SHIPPING', '2018-03-01 10:00:00', '2018-01-24 10:00:00'),
(3, 1, 2, 3, 10, 'ARRIVED', '2018-01-04 10:00:00', '2018-02-04 10:00:00'),
(4, 4, 5, 5, 5, 'DELIVERED', '2018-01-05 10:00:00', '2018-12-05 10:00:00'),
(5, 3, 2, 2, 5, 'COMPLETED', '2018-01-01 13:00:00', '2018-02-01 13:00:00'),
(6, 2, 4, 4, 5, 'ORDERED', '2018-02-01 13:00:00', '2018-01-13 13:00:00'),
(7, 2, 4, 2, 10, 'DELIVERED', '2018-01-10 13:00:00', '2018-05-01 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `category_id`, `brand_id`, `name`, `price`, `stok`) VALUES
(1, 1, 1, 'Samsung Edge S10', 9000000, 10),
(2, 1, 2, 'LG Cell X10', 950000, 7),
(3, 2, 3, 'Huawei cooler', 15000000, 5),
(4, 3, 2, 'LG freezer 10000', 13000000, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `id_product` (`product_id`),
  ADD KEY `id_customer` (`customer_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `id_category` (`category_id`),
  ADD KEY `id_brand` (`brand_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `id_customer` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`),
  ADD CONSTRAINT `id_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `id_brand` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand` (`brand_id`),
  ADD CONSTRAINT `id_category` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
