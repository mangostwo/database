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
-- Table structure for table `dbscripts_on_go_use`
--

DROP TABLE IF EXISTS `dbscripts_on_go_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbscripts_on_go_use` (
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
-- Dumping data for table `dbscripts_on_go_use`
--

LOCK TABLES `dbscripts_on_go_use` WRITE;
/*!40000 ALTER TABLE `dbscripts_on_go_use` DISABLE KEYS */;
INSERT INTO `dbscripts_on_go_use` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(21608,5,10,15083,900000,0,0,0,0,0,0,0,-11901.3,-1906.52,65.36,0.87,''),
(21609,5,10,15084,900000,0,0,0,0,0,0,0,-11901.3,-1906.52,65.36,0.87,''),
(21610,5,10,15085,900000,0,0,0,0,0,0,0,-11901.3,-1906.52,65.36,0.87,''),
(28704,5,10,15082,900000,0,0,0,0,0,0,0,-11901.3,-1906.52,65.36,0.87,''),
(35843,2,10,11142,900000,0,0,0,0,0,0,0,3496.26,-3295.4,130.98,5.34,''),
(35843,2,10,11142,900000,0,0,0,0,0,0,0,3503.16,-3294.9,131.09,4.28,''),
(35843,2,10,11142,900000,0,0,0,0,0,0,0,34.93,-3300.28,130.47,0.07,''),
(35844,2,10,11142,900000,0,0,0,0,0,0,0,3568.5,-3356.91,131.06,2.07,''),
(35844,2,10,11142,900000,0,0,0,0,0,0,0,3570.91,-3351.01,130.57,2.71,''),
(35844,2,10,11142,900000,0,0,0,0,0,0,0,3562.79,-3353.38,130.78,0.81,''),
(35845,2,10,11142,900000,0,0,0,0,0,0,0,3659.46,-3634.96,138.33,1.28,''),
(35845,2,10,11142,900000,0,0,0,0,0,0,0,3656.25,-3635.08,138.36,1.02,''),
(35845,2,10,11142,900000,0,0,0,0,0,0,0,3661.24,-3621,138.4,3.58,''),
(35846,2,10,11142,900000,0,0,0,0,0,0,0,3657.14,-3475.36,138.7,4.91,''),
(35846,2,10,11142,900000,0,0,0,0,0,0,0,3669.61,-3478.49,137.49,3.39,''),
(35846,2,10,11142,900000,0,0,0,0,0,0,0,3651.67,-3477.88,138.05,5.59,''),
(35847,2,10,11142,900000,0,0,0,0,0,0,0,3675.35,-3395.92,132.86,5.83,''),
(35847,2,10,11142,900000,0,0,0,0,0,0,0,3679.93,-3408.58,133.18,1.04,''),
(35847,2,10,11142,900000,0,0,0,0,0,0,0,3687.89,-3410.59,133.04,1.64,'');
/*!40000 ALTER TABLE `dbscripts_on_go_use` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

