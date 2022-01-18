-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2022 at 10:28 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
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
-- Database: `bdd_olist`
--

-- --------------------------------------------------------

--
-- Table structure for table `olist_customers_dataset`
--

CREATE TABLE `olist_customers_dataset` (
  `customer_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_unique_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_zip_code_prefix` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_state` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `olist_geolocation_dataset`
--

CREATE TABLE `olist_geolocation_dataset` (
  `geolocation_zip_code_prefix` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `geolocation_lat` float DEFAULT NULL,
  `geolocation_lng` float DEFAULT NULL,
  `geolocation_city` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `geolocation_state` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `olist_orders_dataset`
--

CREATE TABLE `olist_orders_dataset` (
  `order_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_status` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_purchase_timestamp` datetime DEFAULT NULL,
  `order_approved_at` datetime DEFAULT NULL,
  `order_delivered_carrier_date` datetime DEFAULT NULL,
  `order_delivered_customer_date` datetime DEFAULT NULL,
  `order_estimated_delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `olist_order_items_dataset`
--

CREATE TABLE `olist_order_items_dataset` (
  `order_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_item_id` tinyint NOT NULL,
  `product_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `seller_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shipping_limit_date` datetime DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `freight_value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `olist_order_payments_dataset`
--

CREATE TABLE `olist_order_payments_dataset` (
  `order_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_sequential` tinyint NOT NULL,
  `payment_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `payment_installments` tinyint DEFAULT NULL,
  `payment_value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `olist_order_reviews_dataset`
--

CREATE TABLE `olist_order_reviews_dataset` (
  `review_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review_score` tinyint DEFAULT NULL,
  `review_comment_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `review_comment_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `review_creation_date` datetime DEFAULT NULL,
  `review_answer_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `olist_products_dataset`
--

CREATE TABLE `olist_products_dataset` (
  `product_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name_lenght` int DEFAULT NULL,
  `product_description_lenght` int DEFAULT NULL,
  `product_photos_qty` int DEFAULT NULL,
  `product_weight_g` int DEFAULT NULL,
  `product_length_cm` int DEFAULT NULL,
  `product_height_cm` int DEFAULT NULL,
  `product_width_cm` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `olist_sellers_dataset`
--

CREATE TABLE `olist_sellers_dataset` (
  `seller_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seller_zip_code_prefix` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `seller_city` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `seller_state` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category_name_translation`
--

CREATE TABLE `product_category_name_translation` (
  `product_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_category_name_english` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
