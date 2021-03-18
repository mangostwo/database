-- ---------------------------------------- 
-- --        CLEAR DOWN THE TABLE        -- 
-- ---------------------------------------- 
TRUNCATE TABLE `dungeonfinder_requirements`; 
-- ---------------------------------------- 
-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: localhost    Database: mangos2
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@SESSION.TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `dungeonfinder_requirements`
--

LOCK TABLES `dungeonfinder_requirements` WRITE;
/*!40000 ALTER TABLE `dungeonfinder_requirements` DISABLE KEYS */;
INSERT INTO `dungeonfinder_requirements` (`mapId`, `difficulty`, `min_item_level`, `item`, `item_2`, `alliance_quest`, `horde_quest`, `achievement`, `quest_incomplete_text`, `comment`) VALUES 
(269,0,0,0,0,10285,10285,0,'You must complete the quest \"Return to Andormu\" before entering the Black Morass.','Caverns Of Time,Black Morass (Entrance)'),
(269,1,0,30635,0,10285,10285,0,'You must complete the quest \"Return to Andormu\" and be level 70 before entering the Heroic difficulty of the Black Morass.','Caverns Of Time,Black Morass (Entrance)'),
(540,1,0,30637,30622,0,0,0,NULL,'The Shattered Halls (Entrance)'),
(542,1,0,30637,30622,0,0,0,NULL,'The Blood Furnace (Entrance)'),
(543,1,0,30637,30622,0,0,0,NULL,'Hellfire Ramparts (Entrance)'),
(545,1,0,30623,0,0,0,0,NULL,'The Steamvault (Entrance)'),
(546,1,0,30623,0,0,0,0,NULL,'The Underbog (Entrance)'),
(547,1,0,30623,0,0,0,0,NULL,'The Slave Pens (Entrance)'),
(552,1,0,30634,0,0,0,0,NULL,'The Arcatraz (Entrance)'),
(553,1,0,30634,0,0,0,0,NULL,'The Botanica (Entrance)'),
(554,1,0,30634,0,0,0,0,NULL,'The Mechanar (Entrance)'),
(555,1,0,30633,0,0,0,0,NULL,'Shadow Labyrinth (Entrance)'),
(556,1,0,30633,0,0,0,0,NULL,'Sethekk Halls (Entrance)'),
(557,1,0,30633,0,0,0,0,NULL,'Mana Tombs (Entrance)'),
(558,1,0,30633,0,0,0,0,NULL,'Auchenai Crypts (Entrance)'),
(560,1,0,30635,0,0,0,0,NULL,'Caverns Of Time,Old Hillsbrad Foothills (Entrance)'),
(574,1,180,0,0,0,0,0,NULL,'Utgarde Keep (entrance)'),
(575,1,180,0,0,0,0,0,NULL,'Utgarde Pinnacle (entrance)'),
(576,1,180,0,0,0,0,0,NULL,'The Nexus (entrance)'),
(578,1,180,0,0,0,0,0,NULL,'The Oculus (entrance)'),
(585,1,0,0,0,11492,11492,0,NULL,'Magisters\' Terrace (Entrance)'),
(595,1,180,0,0,0,0,0,NULL,'Culling of Stratholme (entrance)'),
(599,1,180,0,0,0,0,0,NULL,'Ulduar,Halls of Stone (entrance)'),
(600,1,180,0,0,0,0,0,NULL,'Drak\'Tharon Keep (entrance)'),
(601,1,180,0,0,0,0,0,NULL,'Azjol-Nerub (entrance)'),
(602,1,180,0,0,0,0,0,NULL,'Ulduar,Halls of Lightning (entrance)'),
(604,1,180,0,0,0,0,0,NULL,'Gundrak (entrance north)'),
(608,1,180,0,0,0,0,0,NULL,'Violet Hold (entrance)'),
(619,1,180,0,0,0,0,0,NULL,'Ahn\'Kahet (entrance)'),
(631,2,0,0,0,0,0,4530,NULL,'IceCrown Citadel (Entrance)'),
(631,3,0,0,0,0,0,4597,NULL,'IceCrown Citadel (Entrance)'),
(632,0,200,0,0,0,0,0,NULL,'Forge of Souls (Entrance)'),
(632,1,200,0,0,0,0,0,NULL,'Forge of Souls (Entrance)'),
(649,3,0,0,0,0,0,0,NULL,'Trial of the Crusader'),
(650,0,200,0,0,0,0,0,NULL,'Trial of the Champion'),
(650,1,200,0,0,0,0,0,NULL,'Trial of the Champion'),
(658,0,200,0,0,24499,24511,0,NULL,'Pit of Saron (Entrance)'),
(658,1,200,0,0,24499,24511,0,NULL,'Pit of Saron (Entrance)'),
(668,0,219,0,0,24710,24712,0,NULL,'Halls of Reflection (Entrance)'),
(668,1,219,0,0,24710,24712,0,NULL,'Halls of Reflection (Entrance)');
/*!40000 ALTER TABLE `dungeonfinder_requirements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 22:15:28
