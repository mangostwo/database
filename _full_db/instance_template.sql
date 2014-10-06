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
-- Table structure for table `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_template` (
  `map` smallint(5) unsigned NOT NULL,
  `parent` smallint(5) unsigned NOT NULL DEFAULT '0',
  `levelMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `levelMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_template`
--

LOCK TABLES `instance_template` WRITE;
/*!40000 ALTER TABLE `instance_template` DISABLE KEYS */;
INSERT INTO `instance_template` VALUES (33,0,14,30,'instance_shadowfang_keep'),(34,0,15,32,''),(36,0,10,20,'instance_deadmines'),(43,0,10,21,'instance_wailing_caverns'),(47,0,17,38,'instance_razorfen_kraul'),(48,0,19,32,'instance_blackfathom_deeps'),(70,0,30,47,'instance_uldaman'),(90,0,15,38,'instance_gnomeregan'),(109,0,35,55,'instance_sunken_temple'),(129,0,25,46,''),(189,0,20,45,'instance_scarlet_monastery'),(209,0,35,54,'instance_zulfarrak'),(229,0,45,0,'instance_blackrock_spire'),(230,0,40,0,'instance_blackrock_depths'),(249,0,50,0,'instance_onyxias_lair'),(269,0,66,0,'instance_dark_portal'),(289,0,45,0,'instance_scholomance'),(309,0,50,0,'instance_zulgurub'),(329,0,45,60,'instance_stratholme'),(349,0,30,55,''),(389,0,8,18,''),(409,230,50,0,'instance_molten_core'),(429,0,45,60,'instance_dire_maul'),(469,229,60,0,'instance_blackwing_lair'),(509,0,50,0,'instance_ruins_of_ahnqiraj'),(531,0,50,0,'instance_temple_of_ahnqiraj'),(532,0,68,0,'instance_karazhan'),(615,0,80,0,'instance_obsidian_sanctum'),(534,0,70,0,'instance_hyjal'),(540,0,55,0,'instance_shattered_halls'),(542,0,55,0,'instance_blood_furnace'),(543,0,55,0,'instance_ramparts'),(544,0,65,0,'instance_magtheridons_lair'),(545,0,55,0,'instance_steam_vault'),(546,0,55,0,''),(547,0,55,0,''),(548,0,68,0,'instance_serpent_shrine'),(550,0,68,0,'instance_the_eye'),(552,0,68,0,'instance_arcatraz'),(553,0,68,0,''),(554,0,68,0,'instance_mechanar'),(555,0,65,0,'instance_shadow_labyrinth'),(556,0,55,0,'instance_sethekk_halls'),(557,0,55,0,''),(558,0,55,0,''),(560,0,66,0,'instance_old_hillsbrad'),(564,0,70,0,'instance_black_temple'),(565,0,65,0,'instance_gruuls_lair'),(568,0,68,70,'instance_zulaman'),(580,0,70,0,'instance_sunwell_plateau'),(585,0,65,0,'instance_magisters_terrace'),(489,0,10,0,''),(30,0,10,0,''),(529,0,10,0,''),(566,0,10,0,''),(559,0,10,0,''),(562,0,10,0,''),(572,0,10,0,''),(574,0,65,0,'instance_utgarde_keep'),(575,0,75,0,'instance_pinnacle'),(576,0,66,0,'instance_nexus'),(578,0,75,0,'instance_oculus'),(533,0,80,0,'instance_naxxramas'),(608,0,70,0,'instance_violet_hold'),(604,0,71,0,'instance_gundrak'),(602,0,75,0,'instance_halls_of_lightning'),(599,0,72,0,'instance_halls_of_stone'),(601,0,67,0,'instance_azjol-nerub'),(619,0,68,0,'instance_ahnkahet'),(600,0,69,0,'instance_draktharon_keep'),(595,0,75,0,'instance_culling_of_stratholme'),(616,0,80,0,'instance_eye_of_eternity'),(624,0,80,0,''),(603,0,80,0,'instance_ulduar'),(650,0,80,0,''),(632,0,80,0,'instance_forge_of_souls'),(649,0,80,0,'instance_trial_of_the_crusader'),(631,0,80,0,'instance_icecrown_citadel'),(658,0,75,0,'instance_pit_of_saron'),(668,0,75,0,''),(724,0,80,0,'instance_ruby_sanctum'),(617,0,80,80,''),(618,0,80,80,'');
/*!40000 ALTER TABLE `instance_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-06 17:48:05
