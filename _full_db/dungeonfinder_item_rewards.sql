-- MySQL dump 10.13  Distrib 5.5.39, for FreeBSD10.0 (i386)
--
-- Host: localhost    Database: m2_world
-- ------------------------------------------------------
-- Server version	5.5.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dungeonfinder_item_rewards`
--

DROP TABLE IF EXISTS `dungeonfinder_item_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dungeonfinder_item_rewards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `min_level` smallint(3) unsigned NOT NULL COMMENT 'dbc value',
  `max_level` smallint(3) unsigned NOT NULL COMMENT 'dbc value',
  `item_reward` mediumint(8) unsigned NOT NULL,
  `item_amount` mediumint(4) unsigned NOT NULL,
  `dungeon_type` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dungeonfinder_item_rewards`
--

LOCK TABLES `dungeonfinder_item_rewards` WRITE;
/*!40000 ALTER TABLE `dungeonfinder_item_rewards` DISABLE KEYS */;
INSERT INTO `dungeonfinder_item_rewards` VALUES (1,15,25,51999,1,0),(2,26,35,52000,1,0),(3,36,45,52001,1,0),(4,46,55,52002,1,0),(5,56,60,52003,1,0),(6,61,64,52004,1,1),(7,65,68,52005,1,1),(8,69,80,29434,12,3),(9,80,82,49426,2,4),(10,70,75,0,0,2);
/*!40000 ALTER TABLE `dungeonfinder_item_rewards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-06 17:48:04
