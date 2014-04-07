--
-- Copyright (C) 2005-2014 MaNGOS <http://getmangos.eu/>
-- Copyright (C) 2009-2014 MaNGOSTwo <https://github.com/mangostwo>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

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
-- Table structure for table `spell_threat`
--

DROP TABLE IF EXISTS `spell_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `Threat` smallint(6) NOT NULL,
  `multiplier` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `ap_bonus` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_threat`
--

LOCK TABLES `spell_threat` WRITE;
/*!40000 ALTER TABLE `spell_threat` DISABLE KEYS */;
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES
(78,20,1,0),
(284,39,1,0),
(285,59,1,0),
(770,108,1,0),
(1608,78,1,0),
(1672,180,1,0),
(1715,61,1,0),
(6572,155,1,0),
(6574,195,1,0),
(469,40,1,0),
(7372,101,1,0),
(7373,141,1,0),
(7379,235,1,0),
(7386,100,1,0),
(47436,78,1,0),
(2048,70,1,0),
(25289,62,1,0),
(11551,56,1,0),
(11550,48,1,0),
(11564,98,1,0),
(11565,118,1,0),
(11566,137,1,0),
(11567,145,1,0),
(11600,275,1,0),
(11601,315,1,0),
(17735,200,1,0),
(17750,300,1,0),
(17751,450,1,0),
(17752,600,1,0),
(20736,100,1,0),
(23922,160,1,0),
(23923,190,1,0),
(23924,220,1,0),
(23925,250,1,0),
(24394,580,1,0),
(25286,175,1,0),
(25288,355,1,0),
(11549,40,1,0),
(52212,0,1.9,0),
(20243,0,1,0.05),
(6343,0,1.75,0),
(29707,196,1,0),
(30324,220,1,0),
(6192,32,1,0),
(25258,286,1,0),
(30356,323,1,0),
(25269,400,1,0),
(30357,483,1,0),
(29704,230,1,0),
(5242,26,1,0),
(6673,18,1,0),
(48568,515,0.5,0),
(16857,108,1,0),
(33878,129,1,0),
(33986,180,1,0),
(33987,232,1,0),
(20925,20,1,0),
(20927,30,1,0),
(20928,40,1,0),
(27179,54,1,0),
(2139,300,1,0),
(47439,60,1,0),
(47440,80,1,0),
(1160,16,1,0),
(6190,26,1,0),
(11554,30,1,0),
(11555,37,1,0),
(11556,43,1,0),
(25202,50,1,0),
(25203,55,1,0),
(47437,63,1,0),
(845,10,1,0),
(7369,40,1,0),
(11608,60,1,0),
(11609,70,1,0),
(20569,100,1,0),
(25231,130,1,0),
(47519,180,1,0),
(47520,225,1,0),
(5676,0,2,0),
(779,0,1.5,0),
(676,104,1,0),
(47450,259,1,0),
(47449,236,1,0),
(57823,500,1,0),
(72,293,1,0),
(47488,770,1,0),
(47487,520,1,0),
(56815,0,1.75,0),
(57755,0,1.5,0),
(48480,422,1,0),
(48479,345,1,0),
(26996,212,1,0),
(9881,140,1,0),
(9880,106,1,0),
(9745,75,1,0),
(8972,47,1,0),
(6809,27,1,0),
(6808,20,1,0),
(6807,13,1,0),
(48560,62,1,0),
(48559,54,1,0),
(26998,49,1,0),
(9898,42,1,0),
(9747,36,1,0),
(9490,29,1,0),
(1735,25,1,0),
(99,15,1,0),
(48567,409,0.5,0),
(33745,182,0.5,0);
/*!40000 ALTER TABLE `spell_threat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

