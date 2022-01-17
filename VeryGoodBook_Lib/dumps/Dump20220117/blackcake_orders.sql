-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: blackcake
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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` varchar(30) NOT NULL,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL,
  `receipt_name` varchar(20) NOT NULL,
  `receipt_email` varchar(100) NOT NULL,
  `receipt_phone` varchar(20) NOT NULL,
  `shipping_addres` varchar(100) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_fee` double NOT NULL,
  `payment_note` varchar(100) NOT NULL DEFAULT '',
  `shipping_type` varchar(10) NOT NULL,
  `shipping_fee` double NOT NULL,
  `shipping_note` varchar(100) NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'jimmy@gmail.com','2022-01-14','16:51:54','Henry','Henry@gmail.com','0988665209','敦化北路158號','STORE',30,'','BLACKCAT',80,'',0),(2,'jimmy@gmail.com','2022-01-14','16:52:36','Henry','Henry@gmail.com','0988665209','敦化北路158號','STORE',30,'','BLACKCAT',80,'',0),(3,'jimmy@gmail.com','2022-01-14','17:02:29','Henry','Henry@gmail.com','0988665209','敦化北路158號','STORE',30,'','BLACKCAT',80,'',0),(4,'jimmy@gmail.com','2022-01-17','12:38:59','Henry','Henry@gmail.com','0988665209','敦化北路158號','STORE',30,'','BLACKCAT',80,'',0),(5,'jimmy@gmail.com','2022-01-17','16:35:16','Jimmy','Jimmy@gmail.com','0988665209','敦化北路158號','STORE',30,'','BLACKCAT',80,'',0),(6,'jimmy@gmail.com','2022-01-17','17:00:54','Jimmy','jimmy@gmail.com','0912345670','testaddress','STORE',30,'','FAMILY',60,'',0),(7,'jimmy@gmail.com','2022-01-17','18:32:54','Jimmy','jimmy@gmail.com','0912345670','testaddress','STORE',30,'','OK',45,'',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-17 19:27:57
