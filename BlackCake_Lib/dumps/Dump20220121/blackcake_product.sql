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
  `photo_url` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(600) NOT NULL DEFAULT '',
  `size` varchar(10) NOT NULL DEFAULT '',
  `shelf_date` date NOT NULL DEFAULT (curdate()),
  `unit_Discount` int NOT NULL DEFAULT '0',
  `category` varchar(45) NOT NULL DEFAULT '',
  `brand` varchar(45) NOT NULL DEFAULT '',
  `photo_url_1` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'純干貝XO醬',400,9,'imgs/純干貝xo商品.jpg','滿滿的干貝顆粒，享受頂級澎湃的海鮮風味～<br>\n<br>\n此款僅販售小辣<br>\n本款添加辣椒醬，鹹、辣程度稍高，適合用來增添風味和辣度<br>\n<br>\n內容物：干貝、辣椒、鹽、油、辣椒醬、調味料<br>\n<br>\n重量：450g±10<br>\n<br>\n保存期限：一年(常溫下不開罐)<br>','','2021-12-23',0,'罐醬','鮮記','imgs/純干貝xo內容.jpg'),(2,'頂級海鮮XO醬',300,10,'imgs/頂級xo醬商品.jpg','使用新鮮丁香、干貝、蝦米，是澎湖最經典暢銷的XO醬！<br>\n<br>\n此款干貝多、較大顆；干貝醬丁香魚多，適合送禮<br>\n內容物：干貝、丁香、蝦米、辣椒、油、菜脯、豆鼓、沙茶、糖<br>\n<br>\n重量：450g±10<br>\n<br>\n保存方式：請放冰箱冷藏保存<br>\n<br>\n保存期限：一年(常溫下不開罐)','','2021-12-21',0,'罐醬','鮮記','imgs/頂級xo醬 內容.jpg'),(3,'海鮮XO醬',250,5,'imgs/海鮮XO醬商品.jpg','使用新鮮丁香、干貝、蝦米，是澎湖最經典暢銷的XO醬！<br>\n<br>\n此款丁香魚多，適合送禮<br>\n內容物：干貝、丁香、蝦米、辣椒、油、菜脯、豆鼓、沙茶、糖<br>\n<br>\n重量：450g±10<br>\n<br>\n保存方式：請放冰箱冷藏保存<br>\n<br>\n保存期限：一年(常溫下不開罐)','','2021-12-19',0,'罐醬','鮮記','imgs/海鮮XO醬內容.jpg'),(4,'小管辣醬',300,17,'imgs/小管辣醬商品.jpg','整罐滿滿的小管辣醬，能品嘗到整隻小管在嘴裡翻滾～<br>\n <br>\n此款僅販售小辣<br>\n內容物：小管、辣椒、鹽、油、調味料、菜脯<br>\n <br>\n重量：450g±10<br>\n <br>\n保存方式：請放置冰箱冷藏保存<br>\n <br>\n保存期限：六個月(常溫下不開罐)','','2022-01-15',0,'罐醬','鮮記','imgs/小管辣醬內容.jpg'),(5,'黑糖糕',100,50,'imgs/黑糖糕商品.jpg','運送方式：常溫運送（配送都是使用當天出爐的黑糖糕，收到時為有效期限的第二天）可以接受再行下單。<br>\n<br>\n賞味期限：常溫未開封四天、拆封未食畢可冷凍七天<br>\n<br>\n保存方式：製造過程未添加防腐劑，請置放於陰涼處、避免潮濕，高溫日曬、悶熱環境，請于有效期限內儘速食用完畢。<br>\n<br>\n主要成份：黑糖、麵粉、水、糯米粉、芝麻 重量:520公克<br>\n','','2021-12-20',0,'糕點','鮮記','imgs/黑糖糕內容.jpg'),(6,'冬瓜糕',100,0,'imgs/冬瓜糕商品.jpg','以冬瓜為餡的傳統式糕餅，甜而不膩，香酥的外皮層次分明，更為冬瓜糕的口感加分！<br>\n <br>\n賞味期限：60天<br>\n <br>\n保存方式：開封後要儘快吃完或用密封罐裝起來以免受潮<br>\n <br>\n主要成份：麵粉、芥花油、蔗糖、冬瓜醬、芝麻<br>\n <br>\n重量：600公克<br>','','2021-12-15',0,'糕點','鮮記','imgs/冬瓜糕內容.jpg'),(7,'紅豆糕',100,35,'imgs/紅豆糕商品.jpg','運送方式：常溫運送（配送都是使用當天出爐的紅豆糕，收到時為有效期限的第二天）可以接受再行下單。<br>\n<br>\n賞味期限：常溫未開封四天、拆封未食畢可冷凍七天<br>\n<br>\n保存方式：製造過程未添加防腐劑，請置放於陰涼處、避免潮濕，高溫日曬、悶熱環境，請于有效期限內儘速食用完畢。<br>\n<br>\n主要成份：黑糖、麵粉、水、糯米粉、紅豆 重量:520公克<br>','','2021-12-25',0,'糕點','鮮記','imgs/紅豆糕內容.jpg'),(8,'小管片',600,25,'imgs/小管片商品.jpg','每一片皆由一隻小管，經手工處理、曬乾、烘烤而成<br>\n<br>\n製作過程繁瑣但原料使用簡單，保留小管最原有的嚼勁與甜味<br>\n是最道地澎湖味的名產，澎湖人最愛！<br>\n<br>\n重量：300g±10<br>\n<br>\n保存方式：無論有無拆封，請放置冰箱冷藏保存<br>\n<br>\n保存期限：常溫7天，冷藏90天<br>','','2021-12-25',0,'海鮮','鮮記','imgs/小管片內容.jpg'),(9,'照燒小管片',160,35,'imgs/照燒小管片商品.jpg','照燒小管是近年竄升的新商品之一<br>\n<br>\n口感Q軟帶嚼勁，微甜微辣<br>\n<br>\n保存方式：收件後要儘快吃完或冷藏保存唷<br>\n<br>\n保存期限:3個月<br>\n<br>\n主要成份：新鮮小管、鹽、砂糖、味精、調味料<br>','','2022-01-03',0,'海鮮','鮮記','imgs/照燒小管片內容.jpg'),(10,'飛捲片',350,24,'imgs/飛捲片商品.jpg','飛卷片是近年竄升的人氣商品之一<br>\n口感Q軟帶嚼勁，微甜微辣<br>\n<br>\n老闆挑選的這款飛卷片，回購率很高唷~\n<br>\n保存方式：一個禮拜內不管有無開封，請記得放置冰箱冷藏保存<br>\n<br>\n此商品無添加防腐劑，拆封後請儘速食用完畢<br>\n<br>\n保存期限：常溫7天，冷藏90天<br>','','2022-01-15',0,'海鮮','鮮記','imgs/飛捲片內容.jpg'),(11,'小卷燒',150,18,'imgs/小卷燒商品.jpg','小卷燒採用遠洋小管製成<br>\n<br>\n厚度較章魚花厚一些，甜甜微辣帶Q勁，<br>\n硬度和嚼勁偏軟唷！<br>\n<br>\n重量：150g±10公克<br>\n<br>\n主要成份：小管、鹽、砂糖、味精、調味料<br>\n<br>\n保存期限：常溫7天，冷藏90天','','2022-01-15',0,'海鮮','鮮記','imgs/小卷燒內容.jpg'),(12,'魷魚片',250,32,'imgs/魷魚片商品.jpg','炭烤魷魚片<br>\n<br>\n口感：偏軟<br>\n<br>\n甜度：微甜無辣<br>\n<br>\n炭烤魷魚片是本店熱銷的前五名商品喔！<br>\n<br>\n魷魚的味道帶著一點碳香味以及淡淡的蜂蜜甜味，<br>\n<br>\n保存期限:1個月\n','','2022-01-15',0,'海鮮','鮮記','imgs/魷魚片內容.jpg'),(13,'蜜汁魷魚片',250,15,'imgs/蜜汁魷魚片商品.jpg','鎖住魷魚的鮮甜，搭配蜜汁提味，鹹甜好吃！<br>\n<br>\n口感：偏軟<br>\n<br>\n甜度：微甜無辣<br>\n<br>\n主要成份：新鮮魷魚、糖、鹽、辣椒、調味料<br>\n<br>\n保存期限:1個月,冷藏90天','','2022-01-15',0,'海鮮','鮮記','imgs/蜜汁魷魚片內容.jpg'),(14,'魷魚絲',250,19,'imgs/魷魚絲商品.jpg','台灣人都愛的零嘴，使用澎湖島新鮮魷魚製成的更是尤其好吃阿！<br>\n<br>\n口感：偏軟<br>\n<br>\n甜度：微甜無辣<br>\n<br>\n保存方式：收件後要儘快吃完或冷藏保存唷<br>\n<br>\n主要成份：新鮮魷魚、糖、鹽、調味料<br>\n<br>\n保存期限:1個月,冷藏90天','','2022-01-15',0,'海鮮','鮮記','imgs/魷魚絲內容.jpg');
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

-- Dump completed on 2022-01-21 20:16:32
