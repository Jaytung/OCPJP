-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: vgb
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

CREATE DATABASE IF NOT EXISTS vgb /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;



USE vgb;
--
-- Table structure for table customers
--

DROP TABLE IF EXISTS customers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customers (
  id char(10) NOT NULL,
  name varchar(20) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(20) NOT NULL,
  birthday date NOT NULL,
  gender char(1) NOT NULL,
  address varchar(100) NOT NULL DEFAULT '',
  phone varchar(20) NOT NULL DEFAULT '',
  subscribed tinyint NOT NULL DEFAULT '0',
  blood_type varchar(2) DEFAULT NULL,
  discount int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY email_UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table customers
--

LOCK TABLES customers WRITE;
/*!40000 ALTER TABLE customers DISABLE KEYS */;
INSERT INTO customers VALUES 
('A120568726','Chirs','ss123456@uuu.test.com.tw','wwww123456','1995-05-16','M','','',1,NULL,0),
('A123123123','Boris','sdadad@gmail.com','woww12345','1990-11-05','M','台北市復興北路166號','0988665202',1,'AB',0),
('A123456789','Jimmy','Test01@uuu.com.tw','asdq12345','2000-10-05','M','','',0,NULL,0),
('A123456798','Henry','Test02@uuu.com.tw','aaaaa12345','2002-10-10','M','','',0,NULL,0),
('A223456718','Mary','sdhna@gmail.com','oossa123456','1995-03-15','F','','',0,NULL,0);
/*!40000 ALTER TABLE customers ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-22 16:58:45
