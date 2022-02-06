-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blackcake
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order_status_log`
--

DROP TABLE IF EXISTS `order_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `old_status` int unsigned NOT NULL,
  `new_status` int unsigned NOT NULL,
  `old_payment_note` varchar(100) DEFAULT NULL,
  `new_payment_note` varchar(100) DEFAULT NULL,
  `old_shipping_note` varchar(100) DEFAULT NULL,
  `new_shipping_note` varchar(100) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_log`
--

LOCK TABLES `order_status_log` WRITE;
/*!40000 ALTER TABLE `order_status_log` DISABLE KEYS */;
INSERT INTO `order_status_log` VALUES (1,31,0,1,'','','','','2022-01-22 12:06:56'),(2,31,1,2,'','','','','2022-01-22 12:07:09'),(3,31,2,3,'','','','','2022-01-22 12:07:26'),(4,1,0,1,'','銀行:恆逸銀行,帳號後5碼54321,金額:1942.0元,於2022-01-15 08:30轉帳','','','2022-01-22 13:56:05'),(5,32,0,1,'','銀行:恆逸銀行,帳號後5碼54321,金額:1942.0元,於2022-01-15 08:30轉帳','','','2022-01-22 16:50:26'),(6,32,1,2,'銀行:恆逸銀行,帳號後5碼54321,金額:1942.0元,於2022-01-15 08:30轉帳','銀行:恆逸銀行,帳號後5碼54321,金額:1942.0元,於2022-01-15 08:30轉帳','','','2022-01-22 17:20:56'),(7,30,0,1,'','銀行:恆逸銀行,帳號後5碼:54321,金額:1942.0,2022-01-22 15:30完成轉帳','','','2022-01-22 17:40:12'),(8,33,0,1,'','銀行:合作金庫,帳號後5碼:54321,金額:1900.0,2022-01-22 17:30完成轉帳','','','2022-01-22 18:00:47'),(9,35,0,2,'','信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2022-02-06T16:02:47.379139300','','','2022-02-06 16:02:47');
/*!40000 ALTER TABLE `order_status_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-06 17:21:42
