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
-- Temporary view structure for view `product_real_time_stock`
--

DROP TABLE IF EXISTS `product_real_time_stock`;
/*!50001 DROP VIEW IF EXISTS `product_real_time_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_real_time_stock` AS SELECT 
 1 AS `id`,
 1 AS `the_size_name`,
 1 AS `spicy_name`,
 1 AS `real_time_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `black_cake_product`
--

DROP TABLE IF EXISTS `black_cake_product`;
/*!50001 DROP VIEW IF EXISTS `black_cake_product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `black_cake_product` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `unit_price`,
 1 AS `stock`,
 1 AS `photo_url`,
 1 AS `description`,
 1 AS `size`,
 1 AS `shelf_date`,
 1 AS `unit_Discount`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `product_real_time_stock`
--

/*!50001 DROP VIEW IF EXISTS `product_real_time_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_real_time_stock` AS select `product`.`id` AS `id`,ifnull(ifnull(`products_sizes`.`size_name`,`products_spicy`.`size_name`),'') AS `the_size_name`,ifnull(`products_spicy`.`spicy_name`,'') AS `spicy_name`,ifnull(ifnull(`products_spicy`.`stock`,`products_sizes`.`stock`),`product`.`stock`) AS `real_time_stock` from ((`product` left join `products_sizes` on((`product`.`id` = `products_sizes`.`product_id`))) left join `products_spicy` on(((`product`.`id` = `products_spicy`.`product_id`) and ((`products_sizes`.`size_name` = `products_spicy`.`size_name`) or ((`products_sizes`.`size_name` is null) and (`products_spicy`.`size_name` = '')))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `black_cake_product`
--

/*!50001 DROP VIEW IF EXISTS `black_cake_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `black_cake_product` AS select `product`.`id` AS `id`,`product`.`name` AS `name`,`product`.`unit_price` AS `unit_price`,`product`.`stock` AS `stock`,`product`.`photo_url` AS `photo_url`,`product`.`description` AS `description`,`product`.`size` AS `size`,`product`.`shelf_date` AS `shelf_date`,`product`.`unit_Discount` AS `unit_Discount` from `product` where (`product`.`name` like '%黑糖糕%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-21 20:16:33
