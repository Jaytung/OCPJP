CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `unit_price` double NOT NULL,
  `stock` int NOT NULL,
  `photh_url` varchar(100) DEFAULT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `size` varchar(10) NOT NULL DEFAULT '',
  `shelf_date` date NOT NULL DEFAULT (curdate()),
  `unit_Discount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci