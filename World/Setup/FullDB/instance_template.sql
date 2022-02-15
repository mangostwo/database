-- ---------------------------------------- 
-- --        CLEAR DOWN THE TABLE        -- 
-- ---------------------------------------- 
TRUNCATE TABLE `instance_template`; 
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
-- Dumping data for table `instance_template`
--

LOCK TABLES `instance_template` WRITE;
/*!40000 ALTER TABLE `instance_template` DISABLE KEYS */;
INSERT INTO `instance_template` (`map`, `parent`, `levelMin`, `levelMax`) VALUES 
(30,0,10,0),
(33,0,14,30),
(34,0,15,32),
(36,0,10,20),
(43,0,10,21),
(47,0,17,38),
(48,0,19,32),
(70,0,30,47),
(90,0,15,38),
(109,0,35,55),
(129,0,25,46),
(189,0,20,45),
(209,0,35,54),
(229,0,45,0),
(230,0,40,0),
(249,0,50,0),
(269,0,66,0),
(289,0,45,0),
(309,0,50,0),
(329,0,45,60),
(349,0,30,55),
(389,0,8,18),
(409,230,50,0),
(429,0,45,60),
(469,229,60,0),
(489,0,10,0),
(509,0,50,0),
(529,0,10,0),
(531,0,50,0),
(532,0,68,0),
(533,0,80,0),
(534,0,70,0),
(540,0,55,0),
(542,0,55,0),
(543,0,55,0),
(544,0,65,0),
(545,0,55,0),
(546,0,55,0),
(547,0,55,0),
(548,0,68,0),
(550,0,68,0),
(552,0,68,0),
(553,0,68,0),
(554,0,68,0),
(555,0,65,0),
(556,0,55,0),
(557,0,55,0),
(558,0,55,0),
(559,0,10,0),
(560,0,66,0),
(562,0,10,0),
(564,0,70,0),
(565,0,65,0),
(566,0,10,0),
(568,0,68,70),
(572,0,10,0),
(574,0,65,0),
(575,0,75,0),
(576,0,66,0),
(578,0,75,0),
(580,0,70,0),
(585,0,65,0),
(595,0,75,0),
(599,0,72,0),
(600,0,69,0),
(601,0,67,0),
(602,0,75,0),
(603,0,80,0),
(604,0,71,0),
(608,0,70,0),
(615,0,80,0),
(616,0,80,0),
(617,0,80,80),
(618,0,80,80),
(619,0,68,0),
(624,0,80,0),
(631,0,80,0),
(632,0,80,0),
(649,0,80,0),
(650,0,80,0),
(658,0,75,0),
(668,0,75,0),
(724,0,80,0);
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

-- Dump completed on 2022-02-15 13:58:13
