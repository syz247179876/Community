-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: javakeshe
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `starttime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `endtime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `thesis` varchar(30) DEFAULT NULL,
  `praise` int DEFAULT '0',
  `opposition` int DEFAULT '0',
  `rid` int DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `fk_rid` (`rid`),
  CONSTRAINT `fk_rid` FOREIGN KEY (`rid`) REFERENCES `resident` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (7,'2020-05-26 09:00:00','2020-05-26 11:00:00','如何规范社区内车辆停放的有序性？',0,0,31,'书苑名家旁的茶楼旁边的菜市场左边的B栋大楼15楼302房间','居民区2'),(8,'2020-05-23 21:00:00','2020-05-23 23:49:19','如何对孩子实行正确的教育措施？',0,0,31,'微信视频吧~','居民区3'),(9,'2020-05-25 12:00:00','2020-05-26 00:00:00','测试会议的标题',0,0,31,'测试会议的地点','居民区4'),(10,'','','测试会议',0,0,31,'测试会议','居民区2'),(11,'2020-06-14 17:36:53','2020-06-17 00:00:00','测试会议',0,0,31,'测试会议','居民区2');
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `hid` int NOT NULL AUTO_INCREMENT,
  `number` varchar(50) NOT NULL,
  `location` varchar(25) NOT NULL,
  `owner_time` date NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `situation` varchar(30) NOT NULL,
  `owner_name` varchar(30) NOT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `starttime` varchar(20) DEFAULT NULL,
  `notice_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (38,'云社区正式上线了~为其5天的工程（从开发到部署）','首先说明一下，因为我不是特别擅长java开发，没有使用一些奇淫技巧。sql语句的没有进行特别的优化。不过这个系统中，光是用mysql肯定是不够的啦~有些功能还需完善，对于房产证，不动产，这个东西根本搞不到几个，本身就是特别隐私的东西，所以我目前没打算加进去，不然注册的测试用户数量根本上不来。以后有兴趣了我再加进去。算是课设的一个小漏洞吧。','2020-04-23 20:39:02','系统公告','司云中','社区管理人员'),(39,'关于博客友链的通知','之前一直没有完善的博客友链功能，目前正在开发中，预计两天之内上线。有兴趣的小伙伴可以互换友链，到我的博客留言板，留下你的友链。\n\n我的博客地址：http://syzzjw.cn/home_page','2020-04-23 20:41:53','博客友链','司云中','社区管理人员'),(40,'公告测试','公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试！！！','2020-05-14 17:12:45','公告测试','司云中','社区管理人员');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  `praise` int DEFAULT '0',
  `oppose` int DEFAULT '0',
  `abandon` int DEFAULT '0',
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`),
  CONSTRAINT `problems_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `conference` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (26,'问题：你认为迈凯伦和劳斯莱斯谁帅？选迈凯伦的赞同，选劳斯莱斯的否认',0,0,0,7),(27,'应该给孩子玩手机嘛？',0,0,0,8),(30,'PHP到底是不是世界上最好的语言（滑稽）？',0,0,0,9);
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resident`
--

DROP TABLE IF EXISTS `resident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resident` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `sex` varchar(3) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `id_card` varchar(18) DEFAULT NULL,
  `residence` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resident`
--

LOCK TABLES `resident` WRITE;
/*!40000 ALTER TABLE `resident` DISABLE KEYS */;
INSERT INTO `resident` VALUES (31,'司云中','男','1999-05-20','321081199906666666','江苏省仪征市白沙路浦东三村20幢501室','44eb5b04af14d5b07c446ff9c6f1d403','社区管理人员','居民区2','13787866666'),(32,'曾靖文','女','1999-09-24','430922199906666666','湖南省桃江县石牛江镇田庄湾村曾家屋村民组','8c47272791283528c946b875c7e34070','居民','居民区1','13873319466'),(33,'周先超','男','1998-05-29','430721199805296410','湖南省安乡县安丰乡出口洲村08021号','283465c95b22bc5fa94c2690a9d7ef25','居民','居民区2','18073690597'),(34,'许昊','男','1999-06-02','430602199906026116','湖南省岳阳市岳阳楼区白石岭村大屋组','e1613bcdeda8d78296e7d9d7e8eb0a19','居民','居民区1','15173087931'),(35,'葛庆','男','1999-12-15','320683199912157174','江苏省南通市崇川区观音山镇十八弯村十九组109号','35b8af69cb9e0bcdb6bc61e18e917db1','居民','居民区1','18944315569'),(36,'王琳','女','2000-10-18','431023200010180124','湖南省永兴县塘门口镇新湾村石里组1号','a32871e21d60059a83080804467f6670','居民','居民区1','1231231231'),(37,'李玉龙','男','1976-09-18','340403197609181616','湖南省株洲市荷塘区大坪路19号集体宿舍2号','3b92ba1fecbbee89291c8057e188d011','居民','居民区1','');
/*!40000 ALTER TABLE `resident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(30) DEFAULT NULL,
  `project_content` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `public_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rid` int DEFAULT NULL,
  `recipient_username` varchar(30) DEFAULT NULL,
  `recipient_phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_service_rid` (`rid`),
  CONSTRAINT `fk_service_rid` FOREIGN KEY (`rid`) REFERENCES `resident` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (8,'便民维修工具','哪位大佬借我个榔头呀？',1,'2020-04-23 20:54:29',31,'司云中','13787833290'),(9,'交通工具','哪位仁兄借我个吊车耍耍？',1,'2020-04-23 20:55:09',31,'王琳','1231231231'),(10,'生活器具','拖车',1,'2020-04-25 14:58:21',37,'司云中','13787833290'),(11,'生活器具','我需要一个测试',0,'2020-05-14 17:44:54',31,NULL,NULL);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-17 23:22:36
