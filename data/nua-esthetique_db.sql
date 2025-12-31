-- phpMyAdmin SQL Dump
-- version 5.2.3-dev+20250818.dd3d8baef3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2025 at 02:24 AM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 8.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nua-esthetique_db`
--
CREATE DATABASE IF NOT EXISTS `nua-esthetique_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `nua-esthetique_db`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL DEFAULT current_timestamp(),
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `deleted_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `deleted_at`) VALUES
(1, 'Lash Extensions', ' ', '2025-11-27', '2025-11-27'),
(2, 'Tools', ' ', '2025-11-27', '2025-11-27'),
(3, 'Adhesive', '', '2025-11-27', '2025-11-27'),
(4, 'Serum', '', '2025-11-27', '2025-11-27'),
(5, 'Accessories', '', '2025-11-27', '2025-11-27'),
(6, 'Brow Products', '', '2025-11-27', '2025-11-27');

-- --------------------------------------------------------

--
-- Table structure for table `category_images`
--

CREATE TABLE `category_images` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_images`
--

INSERT INTO `category_images` (`id`, `category_id`, `file_path`) VALUES
(1, 1, 'public\\assets\\images\\categories\\9ec245bada190233d930c3bd820c43481b17544d.jpg'),
(2, 2, 'public\\assets\\images\\categories\\a5bfc96be871c77101fd2fa549e89717062c6b82.jpg'),
(3, 3, 'public\\assets\\images\\categories\\48fa2a45ec8656c94fc5f413f390feb7ad44bbbb.jpg'),
(4, 4, 'public\\assets\\images\\categories\\c4e06d217990880e5b11db738af412202bcfa134.jpg'),
(5, 5, 'public\\assets\\images\\categories\\18d47ab94bb1ef9e1abe8097b98ba30e0218c78e.jpg'),
(6, 6, 'public\\assets\\images\\categories\\919d041c362f482df58bd29f39c7f989b73439cc.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_number` varchar(50) NOT NULL,
  `order_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `tracking_number`, `order_date`) VALUES
(27, 2, '4485624', '2025-12-17');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`product_id`, `order_id`, `quantity`) VALUES
(1, 27, 1),
(2, 27, 1),
(3, 27, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL,
  `InStock` tinyint(1) NOT NULL DEFAULT 1,
  `description` text NOT NULL,
  `promotion_percentage` int(11) DEFAULT NULL,
  `isBulk` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `price`, `quantity`, `InStock`, `description`, `promotion_percentage`, `isBulk`) VALUES
(1, 2, 'NUA Lash Extensions – Midnight Luxe', 25, 50, 1, 'Ultra-black matte-finish lash extensions designed for a bold and defined look.', 40, 0),
(2, 3, 'NUA Lash Extensions – Cocoa Luxe', 20, 50, 1, 'Soft, lightweight lash extensions ideal for warm and natural looks.', 15, 0),
(3, 2, 'NUA Tweezers – Volume & Precision', 20, 50, 1, 'Professional tweezers with textured grip and angled tip for precision.', 0, 0),
(4, 3, 'NUA Lash Adhesive – 5ml', 30, 50, 1, 'Fast-drying professional adhesive with long-lasting retention.', 20, 0),
(5, 4, 'NUA Eyelash & Eyebrow Growth Serum', 35, 50, 1, 'Nourishing formula that strengthens and boosts lash and brow growth.', NULL, 0),
(6, 5, 'Portable Mini Fan – Fast Drying', 20, 50, 1, 'Compact rechargeable fan ideal for adhesive curing.', NULL, 0),
(7, 6, 'NUA Brow Freeze Gel', 20, 50, 1, 'Lightweight brow gel that delivers a laminated effect.', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `file_path`) VALUES
(1, 7, 'public\\assets\\images\\Brow Freeze Gel.png'),
(2, 2, 'public\\assets\\images\\Cocoa_Luxe.png'),
(3, 5, 'public\\assets\\images\\Growth_Serum.png'),
(4, 4, 'public\\assets\\images\\Lash_Adhesive.png'),
(5, 1, 'public\\assets\\images\\Midnight_Luxe.png'),
(6, 6, 'public\\assets\\images\\Mini_Fan.png'),
(8, 3, 'public\\assets\\images\\Tweezers.png');

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_auth`
--

CREATE TABLE `two_factor_auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT 0,
  `enabled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('customer','admin') NOT NULL DEFAULT 'customer',
  `address` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_ at` date NOT NULL DEFAULT current_timestamp(),
  `date_of_birth` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `password_hash`, `role`, `address`, `created_at`, `updated_ at`, `date_of_birth`, `postal_code`, `phone_number`) VALUES
(1, 'Luke Ryan', 'Nwantoly', 'NwantolyLuke@gmail.com', 'Luke', '$2y$12$xs5xdIx7aN2vhDHU9DIzIORudu0n4//KKkhMZ.a8kklLdAJk4fSAa', 'admin', '5975 Rue Croissant Précourt Laval QC', '2025-12-02', '2025-12-02', '2025-12-15', 'H7H 2W2', '4383785400'),
(2, 'Luke Ryan', 'Nwantoly', 'LukeNwantoly@gmail.com', 'Ryan', '$2y$12$pyUT5Ip0Vo9Xa6nq3B4w9OFaKKoiPTjPFoJWisCfl.SEP9kzB4R3y', 'customer', '5975 Rue Croissant Précourt Laval QC', '2025-12-03', '2025-12-03', '2025-12-24', 'H7H 2W2', '4383785406'),
(7, 'Luke Ryan', 'Nwantoly', 'Mike@gmail.com', 'Mike', '$2y$12$UuCMW3BMcNYJlWCICjC5Z.Nql7Qz9GEOtS1N4Qde6Z4ZzmNDUmtAq', 'customer', '5975 Rue Croissant Précourt', '2025-12-16', '2025-12-16', '2025-12-10', 'H7H 2W2', '4383785400'),
(8, 'Customer', 'Generic', 'Generic@gmail.com', 'Generic', '$2y$12$1mAszTn9cAcRrw5vWHcKRu26R9r0/EXpxDTeSluJxmUQ.i83XRFuO', 'customer', '1234 Rue Generic', '2025-12-16', '2025-12-16', '2025-12-01', 'A1A 2B2', '514-123-1234'),
(9, 'Mike', 'Test', 'Jack@gmail.com', 'Jack', '$2y$12$ZKQa/AGx/oQu00FiOSdNGO8QyaaBFwgF1gv/T66Q4SoDRibrlmXsG', 'customer', '5975 Rue Croissant Précourt', '2025-12-17', '2025-12-17', '2007-01-01', 'H7H 2W2', '514-123-1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_images`
--
ALTER TABLE `category_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_images_category_FK` (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id_FK` (`customer_id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD KEY `order_id_FK` (`order_id`),
  ADD KEY `product_id_FK` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_category_id_FK` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_FK` (`product_id`);

--
-- Indexes for table `two_factor_auth`
--
ALTER TABLE `two_factor_auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_images`
--
ALTER TABLE `category_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `two_factor_auth`
--
ALTER TABLE `two_factor_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_images`
--
ALTER TABLE `category_images`
  ADD CONSTRAINT `category_images_category_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `customer_id_FK` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `order_id_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_category_id_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_id_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `two_factor_auth`
--
ALTER TABLE `two_factor_auth`
  ADD CONSTRAINT `2FA_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
