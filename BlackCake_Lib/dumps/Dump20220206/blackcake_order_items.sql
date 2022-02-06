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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int unsigned NOT NULL,
  `product_id` int NOT NULL,
  `size_name` varchar(10) NOT NULL,
  `spicy_name` varchar(10) NOT NULL DEFAULT '',
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`,`size_name`,`spicy_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,'','',500,1),(1,5,'小盒','',100,4),(2,1,'','',500,1),(2,5,'小盒','',100,4),(3,1,'','',500,1),(3,5,'大盒','',200,1),(4,1,'','',400,1),(4,5,'','',100,1),(5,1,'','',400,4),(6,1,'','',400,10),(7,6,'','',100,2),(8,1,'','',400,2),(9,1,'','',400,3),(10,2,'','大辣',300,3),(11,2,'','大辣',300,3),(12,5,'大盒','',200,2),(13,1,'','',400,3),(13,2,'','中辣',300,2),(20,1,'','',400,3),(21,2,'','不辣',300,1),(22,2,'','不辣',300,1),(23,2,'','不辣',300,4),(24,5,'大盒','',200,5),(25,5,'大盒','',200,2),(25,5,'小盒','',100,2),(26,2,'','不辣',300,4),(27,2,'','中辣',300,4),(28,2,'','大辣',300,4),(29,3,'','小辣',250,5),(29,6,'','',100,1),(30,8,'','',600,3),(31,8,'','',600,3),(32,2,'','不辣',300,2),(33,8,'','',600,3),(34,1,'','',400,2),(35,2,'','不辣',300,6),(35,5,'小盒','',100,4);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-06 17:21:41
