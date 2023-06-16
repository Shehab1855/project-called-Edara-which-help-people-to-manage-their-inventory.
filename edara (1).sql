-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 05:19 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edara`
--

-- --------------------------------------------------------

--
-- Table structure for table `product-model`
--

CREATE TABLE `product-model` (
  `Product-id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(550) NOT NULL,
  `photo-url` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `warehouse` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stockrequest-model`
--

CREATE TABLE `stockrequest-model` (
  `StockRequest-id` int(11) NOT NULL,
  `supervisor_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `warehouse_id:` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `status` varchar(100) NOT NULL COMMENT 'approved,\r\ndeclined, \r\npending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User-id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0-> active, 1->inactive	',
  `token` text NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User-id`, `email`, `password`, `phone`, `type`, `status`, `token`, `name`) VALUES
(1, 'amin.mostafa@gamil.com', '$2b$10$YCJxiaLx/QTCNfTteCICkOpe65YmHj1zxkT4ddhERH.O6bSkOtTVq', '', '', 0, 'c615c6b2653d6a5e2952699077172e4b', 'karim mostafa '),
(2, 'amin.mostafa@gamil.com', '$2b$10$Bwj8jxOcQrgbdlbTqHL5AumwQUfYMyxxPN7j55Q68OTZoovsfSPze', '', '', 0, 'b5c7fd4da0e926b4e6b019b837549ca8', 'karim mostafa '),
(3, 'amin.mostafa@gamil.com', '$2b$10$jugypnDii9zeoiPCf8nWteGphaBKtz8.3Mg.GN1W28sqbJxzvnOlu', '', 'admin', 0, 'a795f0851f795e16ccec649daa96bef5', 'karim mostafa '),
(4, 'karim@gamil.com', '$2b$10$Nl9rolTL8uPVBUJfdELfe./UiqQqOjdP/NbjVPqr3uUuc1Yb1vxIO', '', 'admin', 0, '6ae7397d5db367bf7b66af61b592acab', 'karim mostafa '),
(5, 'amin@gamil.com', '$2b$10$TsHsp6KJIR5zVIn7EPPEKOWEJ2j5vJdTUUmPECP1TfoRGNjtedyDS', '', 'user', 0, '4eae3fc5920aca41b92494a63542c162', 'karim mostafa ');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `Warehouse -id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` text NOT NULL,
  `status` text NOT NULL DEFAULT 'active' COMMENT '0->active, 1->inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`Warehouse -id`, `name`, `location`, `status`) VALUES
(1, 'karim mostafa ', 'amin.mostafa@gamil.com', '0'),
(2, 'karim mostafa ', 'amin.mostafa@gamil.com', '0'),
(3, 'karim mostafa ', 'amin.mostafa@gamil.com', 'admin'),
(4, 'karim mostafa ', 'amin.mostafa@gamil.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product-model`
--
ALTER TABLE `product-model`
  ADD PRIMARY KEY (`Product-id`),
  ADD KEY `warehouse-const` (`warehouse`);

--
-- Indexes for table `stockrequest-model`
--
ALTER TABLE `stockrequest-model`
  ADD PRIMARY KEY (`StockRequest-id`),
  ADD KEY `user-const-id` (`supervisor_id`),
  ADD KEY `prodect-const-id` (`product_id`),
  ADD KEY `wareheouse-const-id` (`warehouse_id:`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User-id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`Warehouse -id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product-model`
--
ALTER TABLE `product-model`
  MODIFY `Product-id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stockrequest-model`
--
ALTER TABLE `stockrequest-model`
  MODIFY `StockRequest-id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User-id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `Warehouse -id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product-model`
--
ALTER TABLE `product-model`
  ADD CONSTRAINT `warehouse-const` FOREIGN KEY (`warehouse`) REFERENCES `warehouse` (`Warehouse -id`);

--
-- Constraints for table `stockrequest-model`
--
ALTER TABLE `stockrequest-model`
  ADD CONSTRAINT `wareheouse-const-id` FOREIGN KEY (`warehouse_id:`) REFERENCES `warehouse` (`Warehouse -id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
