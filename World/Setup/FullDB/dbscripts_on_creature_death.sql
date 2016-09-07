--
-- Copyright (C) 2005-2015 MaNGOS <http://getmangos.eu/>
-- Copyright (C) 2009-2015 MaNGOSTwo <https://github.com/mangostwo>
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
-- Table structure for table `dbscripts_on_creature_death`
--

DROP TABLE IF EXISTS `dbscripts_on_creature_death`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbscripts_on_creature_death` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_entry` int(10) unsigned NOT NULL DEFAULT '0',
  `search_radius` int(10) unsigned NOT NULL DEFAULT '0',
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
-- Dumping data for table `dbscripts_on_creature_death`
--

LOCK TABLES `dbscripts_on_creature_death` WRITE;
/*!40000 ALTER TABLE `dbscripts_on_creature_death` DISABLE KEYS */;
INSERT INTO `dbscripts_on_creature_death` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(21419,2,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'),
(27654,6,3,0,0,27658,75,0,0,0,0,0,939.73,1044.25,359.96,0,'Belgaristrasz - move out of the cage'),
(27654,6,3,0,0,27657,75,0,0,0,0,0,948.57,1032.11,359.96,0,'Verdisa - move out of the cage'),
(27654,6,3,0,0,27659,75,0,0,0,0,0,941.93,1060.08,359.96,0,'Eternos - move out of the cage'),
(27654,9,0,0,0,27658,75,0,2000005525,0,0,0,0,0,0,0,'Belgaristrasz - say greet'),
(27654,9,1,1,0,27658,75,0,0,0,0,0,0,0,0,0,'Belgaristrasz - emote greet'),
(27654,17,0,6,0,27447,360,0,2000005526,0,0,0,0,0,0,0,'Varos - yell intro, map wide'),
(27654,17,16,13648,8,27447,360,0,0,0,0,0,0,0,0,0,'Varos - yell intro sound, map wide'),
(27447,1,15,12980,0,28012,10,0,0,0,0,0,0,0,0,0,'Image of Belgaristrasz - cast teleport visual'),
(27447,5,0,0,0,28012,75,0,2000005527,0,0,0,0,0,0,0,'Image of Belgaristrasz - say after Varos'),
(27447,5,1,1,0,28012,75,0,0,0,0,0,0,0,0,0,'Image of Belgaristrasz - emote after Varos'),
(27655,1,15,12980,0,28012,10,0,0,0,0,0,0,0,0,0,'Image of Belgaristrasz - cast teleport visual'),
(27655,5,0,0,0,28012,75,0,2000005528,0,0,0,0,0,0,0,'Image of Belgaristrasz - say after Urom'),
(27655,5,1,1,0,28012,75,0,0,0,0,0,0,0,0,0,'Image of Belgaristrasz - emote after Urom'),
(27656,0,10,28012,180000,0,0,0,0,0,0,0,1022.39,1051.51,605.62,0.07,'Summon Image of Belgaristrasz'),
(27656,1,15,12980,0,28012,360,0,0,0,0,0,0,0,0,0,'Image of Belgaristrasz - cast teleport visual'),
(20427,0,0,0,0,21332,100,32,2000000330,0,0,0,0,0,0,0,'say veneratus epilogue 1'),
(20427,3,0,0,0,21332,100,32,2000000331,0,0,0,0,0,0,0,'say veneratus epilogue 2'),
(20427,5,15,36781,0,21332,100,32,0,0,0,0,0,0,0,0,'cast Despawn Spirit Hunter'),
(20427,6,14,36620,0,0,0,6,0,0,0,0,0,0,0,0,'remove Spirit Hunter aura'),
(20427,6,18,0,0,21332,100,32,0,0,0,0,0,0,0,0,'despawn spirit hunter'),
(33113,0,10,34145,0,0,0,0,0,0,0,0,162.208,-43.5786,409.887,6.254,'spawn Expedition Engineer'),
(33113,0,10,34145,0,0,0,0,0,0,0,0,166.747,-43.444,409.887,6.213,'spawn Expedition Engineer'),
(33113,0,10,34145,0,0,0,0,0,0,0,0,172.051,-43.6818,410.154,6.196,'spawn Expedition Engineer'),
(33113,0,10,34145,0,0,0,0,0,0,0,0,162.818,-28.7818,409.887,0.079,'spawn Expedition Engineer'),
(33113,0,10,34145,0,0,0,0,0,0,0,0,167.357,-28.6481,409.887,0.069,'spawn Expedition Engineer'),
(33113,0,10,34145,0,0,0,0,0,0,0,0,172.661,-28.886,409.887,0.147,'spawn Expedition Engineer'),
(33113,0,10,34144,0,0,0,0,0,0,0,0,162.703,-49.8037,409.887,6.263,'spawn Expedition Mercenary'),
(33113,0,10,34144,0,0,0,0,0,0,0,0,166.494,-49.8494,409.887,6.268,'spawn Expedition Mercenary'),
(33113,0,10,34144,0,0,0,0,0,0,0,0,171.773,-50.0509,409.887,0,'spawn Expedition Mercenary'),
(33113,0,10,34144,0,0,0,0,0,0,0,0,163.422,-36.5537,409.887,0.174,'spawn Expedition Mercenary'),
(33113,0,10,34144,0,0,0,0,0,0,0,0,167.213,-36.5988,409.887,0.174,'spawn Expedition Mercenary'),
(33113,0,10,34144,0,0,0,0,0,0,0,0,172.491,-36.8002,409.887,0.225,'spawn Expedition Mercenary'),
(23899,0,0,0,0,23900,100,0,2000005637,0,0,0,0,0,0,0,'yell_tethyr_dead'),
(23899,10,0,0,0,23900,100,0,2000005638,0,0,0,0,0,0,0,'yell_tethyr_dead'),
(23096,0,15,40156,0,23094,96675,23,0,0,0,0,0,0,0,0,''),
(23096,3,0,0,0,23093,100,4,2000005716,0,0,0,0,0,0,0,'force 23093 to: say text'),
(23096,3,15,6273,0,23093,100,7,0,0,0,0,0,0,0,0,''),
(23096,4,32,0,0,23093,100,7,0,0,0,0,0,0,0,0,'wp unpause'),
(23096,5,32,1,0,23094,96675,23,0,0,0,0,0,0,0,0,'wp pause'),
(23096,7,3,0,0,23094,96675,23,0,0,0,0,-2487.01,4723.86,153.009,4.90897,''),
(23096,22,3,0,0,23094,96675,23,0,0,0,0,-2473.62,4706.47,155.316,5.96323,''),
(23096,196,31,23100,100,0,0,0,0,0,0,0,0,0,0,0,''),
(23096,198,15,6273,0,23094,96675,23,0,0,0,0,0,0,0,0,''),
(23096,198,14,40156,0,23094,96675,23,0,0,0,0,0,0,0,0,''),
(23096,200,32,0,0,23094,96675,23,0,0,0,0,0,0,0,0,'wp unpause'),
(23097,0,15,40187,0,23094,96676,23,0,0,0,0,0,0,0,0,''),
(23097,3,0,0,0,23093,100,4,2000005716,0,0,0,0,0,0,0,'force 23093 to: say text'),
(23097,4,32,0,0,23093,100,7,0,0,0,0,0,0,0,0,'wp unpause'),
(23097,5,32,1,0,23094,96676,23,0,0,0,0,0,0,0,0,'wp pause'),
(23097,7,3,0,0,23094,96676,23,0,0,0,0,-2473.57,4671.96,159.079,2.99726,''),
(23097,22,3,0,0,23094,96676,23,0,0,0,0,-2484.73,4691.69,154.773,1.17985,''),
(23097,28,3,0,0,23094,96676,23,0,0,0,0,-2476.07,4702.61,155.047,6,''),
(23097,36,3,0,0,23094,96676,23,0,0,0,0,0,0,0,6.21425,''),
(23097,196,31,23100,100,0,0,0,0,0,0,0,0,0,0,0,''),
(23097,198,15,6273,0,23094,96676,23,0,0,0,0,0,0,0,0,''),
(23097,198,14,40187,0,23094,96676,23,0,0,0,0,0,0,0,0,''),
(23097,200,32,0,0,23094,96676,23,0,0,0,0,0,0,0,0,'wp unpause'),
(23098,0,15,40189,0,23094,96677,23,0,0,0,0,0,0,0,0,''),
(23098,3,0,0,0,23093,100,4,2000005716,0,0,0,0,0,0,0,'force 23093 to: say text'),
(23098,4,32,0,0,23093,100,7,0,0,0,0,0,0,0,0,'wp unpause'),
(23098,5,32,1,0,23094,96677,23,0,0,0,0,0,0,0,0,'wp pause'),
(23098,7,3,0,0,23094,96677,23,0,0,0,0,-2463.08,4659.54,159.652,2.50195,''),
(23098,22,3,0,0,23094,96677,23,0,0,0,0,-2482.7,4673.34,158.833,1.68474,''),
(23098,29,3,0,0,23094,96677,23,0,0,0,0,-2477.52,4696.75,155.098,1,''),
(23098,36,3,0,0,23094,96677,23,0,0,0,0,0,0,0,1.45415,''),
(23098,196,31,23100,100,0,0,0,0,0,0,0,0,0,0,0,''),
(23098,198,15,6273,0,23094,96677,23,0,0,0,0,0,0,0,0,''),
(23098,198,14,40189,0,23094,96677,23,0,0,0,0,0,0,0,0,''),
(23098,200,32,0,0,23094,96677,23,0,0,0,0,0,0,0,0,'wp unpause'),
(23099,0,15,40190,0,23094,96678,23,0,0,0,0,0,0,0,0,''),
(23099,3,0,0,0,23093,100,4,2000005716,0,0,0,0,0,0,0,'force 23093 to: say text'),
(23099,4,32,0,0,23093,100,7,0,0,0,0,0,0,0,0,'wp unpause'),
(23099,5,32,1,0,23094,96678,23,0,0,0,0,0,0,0,0,'wp pause'),
(23099,7,3,0,0,23094,96678,23,0,0,0,0,-2415.88,4588.63,160.551,1.35255,''),
(23099,12,3,0,0,23094,96678,23,0,0,0,0,-2407.72,4628.97,160.484,2.39556,''),
(23099,30,3,0,0,23094,96678,23,0,0,0,0,-2432.06,4655.25,160.581,2.71757,''),
(23099,42,3,0,0,23094,96678,23,0,0,0,0,-2475.86,4667.53,159.443,2.30052,''),
(23099,55,3,0,0,23094,96678,23,0,0,0,0,-2480.81,4682.19,156.044,1.40438,''),
(23099,65,3,0,0,23094,96678,23,0,0,0,0,-2472.25,4694.06,155.881,1.4,''),
(23099,70,3,0,0,23094,96678,23,0,0,0,0,0,0,0,1.00466,''),
(23099,196,31,23100,100,0,0,0,0,0,0,0,0,0,0,0,''),
(23099,198,15,6273,0,23094,96678,23,0,0,0,0,0,0,0,0,''),
(23099,198,14,40190,0,23094,96678,23,0,0,0,0,0,0,0,0,''),
(23099,200,32,0,0,23094,96678,23,0,0,0,0,0,0,0,0,'wp unpause'),
(23100,1,15,5,0,23094,96675,31,0,0,0,0,0,0,0,0,''),
(23100,1,15,5,0,23094,96676,31,0,0,0,0,0,0,0,0,''),
(23100,1,15,5,0,23094,96677,31,0,0,0,0,0,0,0,0,''),
(23100,1,15,5,0,23094,96678,31,0,0,0,0,0,0,0,0,''),
(3421,1,23,0,0,0,0,0,0,0,0,0,0,0,0,0,'demorph'),
(21292,0,10,21318,1200000,0,0,0,0,0,0,0,-3801.75,2600.4,90.2716,5.75959,'summon'),
(21292,2,1,1,0,21318,25,4,0,0,0,0,0,0,0,0,''),
(21075,0,31,19215,100,0,0,0,0,0,0,0,0,0,0,0,''),
(21075,1,15,33240,0,19215,68744,17,0,0,0,0,0,0,0,0,'cast 33240 on buddy'),
(21075,5,10,18946,0,19215,68744,23,0,0,0,0,0,0,0,0,'summon infernals'),
(20795,0,31,21027,25,0,0,0,0,0,0,0,0,0,0,0,''),
(20795,1,29,2,2,21027,25,4,0,0,0,0,0,0,0,0,''),
(20795,1,3,0,0,21027,25,4,0,0,0,0,-2638.89,1358.96,35.9607,0,''),
(20795,10,14,35921,0,21027,50,4,0,0,0,0,0,0,0,0,''),
(20795,14,0,0,0,21027,50,4,2000005766,0,0,0,0,0,0,0,''),
(20795,16,29,2,1,21027,50,4,0,0,0,0,0,0,0,0,''),
(21419,10,23,20577,0,0,0,8,0,0,0,0,0,0,0,0,'temp model removed!'),
(21877,1,14,37748,0,0,0,2,0,0,0,0,0,0,0,0,''),
(21797,0,23,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(21797,3,18,0,0,21877,50,7,0,0,0,0,0,0,0,0,'Karsius the Ancient Watcher despawn'),
(21797,3,14,37748,0,0,0,2,0,0,0,0,0,0,0,0,''),
(19554,0,0,0,0,20985,50,0,2000005784,0,0,0,0,0,0,0,'Captain Saeed - say quest complete'),
(19554,10,18,0,0,20985,50,7,0,0,0,0,0,0,0,0,'Captain Saeed - despawn self'),
(32273,0,14,60451,0,32281,50,0,0,0,0,0,0,0,0,0,'Guardian of Life - remove aura Corruption of Time'),
(32273,2,0,0,0,32281,50,0,2000005821,0,0,0,0,0,0,0,'Guardian of Life - say thank you'),
(32273,2,18,10000,0,32281,50,2,0,0,0,0,0,0,0,0,'Guardian of Life - Despawn');
/*!40000 ALTER TABLE `dbscripts_on_creature_death` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

