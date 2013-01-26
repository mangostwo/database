--
-- Copyright (C) 2005-2013 MaNGOS <http://getmangos.com/>
-- Copyright (C) 2009-2013 MaNGOSTwo <https://github.com/mangostwo>
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
-- Table structure for table `dbscripts_on_spell`
--

DROP TABLE IF EXISTS `dbscripts_on_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbscripts_on_spell` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbscripts_on_spell`
--

LOCK TABLES `dbscripts_on_spell` WRITE;
/*!40000 ALTER TABLE `dbscripts_on_spell` DISABLE KEYS */;
INSERT INTO `dbscripts_on_spell` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(8593,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(16378,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(17166,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(23301,0,8,30220,1,0,0,0,0,0,0,0,0,0,0,0,''),
(25650,0,6,530,0,0,0,0,0,0,0,0,-589.976,4078.31,143.258,4.48305,''),
(25650,0,6,530,0,0,0,0,0,0,0,0,-593.429,4077.95,93.8245,5.32893,''),
(25652,0,6,530,0,0,0,0,0,0,0,0,-594,4079.26,93.85,5.28,''),
(25652,0,6,530,0,0,0,0,0,0,0,0,-589.976,4078.31,143.258,4.48305,''),
(26374,0,15,26636,0,0,0,0,0,0,0,0,0,0,0,0,'Elune\'s Candle - Visual effect'),
(27695,0,15,27696,0,0,0,4,0,0,0,0,0,0,0,0,'Cast Summon Bone Mage'),
(27695,0,15,27697,0,0,0,4,0,0,0,0,0,0,0,0,'Cast Summon Bone Mage'),
(27695,0,15,27698,0,0,0,4,0,0,0,0,0,0,0,0,'Cast Summon Bone Mage'),
(27695,0,15,27699,0,0,0,4,0,0,0,0,0,0,0,0,'Cast Summon Bone Mage'),
(31225,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(31550,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'Despawn Time Keepers'),
(31927,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(32042,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(32205,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(32979,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(33067,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(33531,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(33532,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(33655,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(34646,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(34874,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'Despawn Underbog Mushroom'),
(35113,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(35246,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(35372,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(35724,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(36374,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(37751,0,2,159,9,0,0,0,0,0,0,0,0,0,0,0,''),
(37751,1,4,46,33554434,0,0,0,0,0,0,0,0,0,0,0,''),
(37752,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(37752,1,1,26,0,0,0,0,0,0,0,0,0,0,0,0,''),
(37752,1,5,46,33554434,0,0,0,0,0,0,0,0,0,0,0,''),
(37834,0,14,37833,0,0,0,0,0,0,0,0,0,0,0,0,''),
(42323,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(42356,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(42564,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(43057,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(43233,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(43386,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(43404,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(43990,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45115,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45191,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45323,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45414,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45536,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45583,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45692,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45834,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45835,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45853,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(45958,1,20,2,0,25759,60,0,0,0,0,0,0,0,0,0,'start waypoint movement'),
(45958,10,0,0,0,25759,60,0,2000000193,0,0,0,0,0,0,0,'npc say to player'),
(45958,10,15,45981,0,0,0,8,0,0,0,0,0,0,0,0,'cast Escorting Alliance Deserter (as triggered)'),
(45990,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(46281,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(46574,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(46797,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(47530,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(47710,0,15,47707,0,0,0,4,0,0,0,0,0,0,0,0,''),
(47710,1,15,47708,0,0,0,4,0,0,0,0,0,0,0,0,''),
(47710,2,15,47709,0,0,0,4,0,0,0,0,0,0,0,0,''),
(47935,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(47978,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(48021,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(48218,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(48345,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(50001,0,0,1,0,0,0,0,2000000192,0,0,0,0,0,0,0,'player yell'),
(51247,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(51331,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(51333,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(51381,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(52160,2,0,0,0,0,0,0,2000000009,0,0,0,0,0,0,0,''),
(52163,2,0,0,0,0,0,0,2000000010,0,0,0,0,0,0,0,''),
(52227,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(53038,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(54620,0,6,571,0,0,0,0,0,0,0,0,5807.75,588.063,660.939,1.64659,''),
(55083,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(56275,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(56796,1,0,0,0,0,0,0,2000000274,0,0,0,0,0,0,0,'say Correct Time Period'),
(56797,1,0,0,0,0,0,0,2000000275,0,0,0,0,0,0,0,'say Incorrect Time Period'),
(58641,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template'),
(59910,0,15,59935,0,0,0,8,0,0,0,0,0,0,0,0,''),
(59910,0,15,59938,0,0,0,8,0,0,0,0,0,0,0,0,''),
(59910,0,15,59939,0,0,0,8,0,0,0,0,0,0,0,0,''),
(59910,0,15,59940,0,0,0,8,0,0,0,0,0,0,0,0,''),
(59910,0,15,59943,0,0,0,8,0,0,0,0,0,0,0,0,''),
(62138,0,15,62139,0,0,0,10,0,0,0,0,0,0,0,0,'Teleport inside Violet Hold'),
(62728,0,15,62594,0,0,0,2,0,0,0,0,0,0,0,0,'Stormwind Champion\'s Pennant'),
(63449,0,15,63406,0,0,0,2,0,0,0,0,0,0,0,0,'Darnassus Champion\'s Pennant'),
(63450,0,15,63423,0,0,0,2,0,0,0,0,0,0,0,0,'Exodar Champion\'s Pennant'),
(63452,0,15,63396,0,0,0,2,0,0,0,0,0,0,0,0,'Gnomeregan Champion\'s Pennant'),
(63453,0,15,63427,0,0,0,2,0,0,0,0,0,0,0,0,'Ironforge Champion\'s Pennant'),
(66390,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'create from quest_template');
/*!40000 ALTER TABLE `dbscripts_on_spell` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

