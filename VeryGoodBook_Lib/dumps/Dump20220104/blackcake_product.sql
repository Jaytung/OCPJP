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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `unit_price` double NOT NULL,
  `stock` int NOT NULL,
  `photo_url` varchar(100) DEFAULT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `size` varchar(10) NOT NULL DEFAULT '',
  `shelf_date` date NOT NULL DEFAULT (curdate()),
  `unit_Discount` int NOT NULL DEFAULT '0',
  `category` varchar(45) NOT NULL DEFAULT '',
  `brand` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'純干貝xo醬(大辣)',500,20,'imgs/XO醬01.png','','','2021-12-23',0,'罐醬','鮮記'),(3,'純干貝xo醬(中辣)',500,10,'imgs/XO醬01.png','','','2021-12-21',0,'罐醬','鮮記'),(4,'純干貝xo醬(小辣)',500,5,'imgs/XO醬01.png','','','2021-12-19',0,'罐醬','鮮記'),(5,'黑糖糕',100,50,'imgs/slide1.png','黑糖糕9折優惠','','2021-12-20',10,'糕點','鮮記'),(6,'黑糖糕',200,40,'imgs/slide1.png','黑糖糕9折優惠','','2021-12-15',10,'糕點','鮮記'),(7,'黑糖糕',100,35,'imgs/slide1.png','黑糖糕8折優惠','','2021-12-25',20,'糕點','媽宮'),(8,'黑糖糕',200,25,'imgs/slide1.png','黑糖糕8折優惠','','2021-12-25',20,'糕點','媽宮'),(9,'小館片',100,35,'/imgs/小館片1.png','','','2022-01-03',0,'海鮮','鮮記');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-04 15:46:18
