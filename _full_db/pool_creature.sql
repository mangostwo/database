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
-- Table structure for table `pool_creature`
--

DROP TABLE IF EXISTS `pool_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_creature` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pool_creature`
--

LOCK TABLES `pool_creature` WRITE;
/*!40000 ALTER TABLE `pool_creature` DISABLE KEYS */;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(79179,1499,30,'The Deadmines - Defias Miner'),
(83351,1506,0,'Auchenai Vindicator - Group 7'),
(83352,1505,0,'Auchenai Soulpriest - Group 6'),
(83353,1504,0,'Auchenai Soulpriest - Group 5'),
(83354,1505,0,'Auchenai Vindicator - Group 6'),
(83355,1504,0,'Auchenai Vindicator - Group 5'),
(83356,1506,0,'Auchenai Soulpriest - Group 7'),
(83357,1507,0,'Auchenai Soulpriest - Group 8'),
(83358,1501,0,'Auchenai Soulpriest - Group 2'),
(83359,1501,0,'Auchenai Vindicator - Group 2'),
(83360,1503,0,'Auchenai Soulpriest - Group 4'),
(83361,1502,0,'Auchenai Soulpriest - Group 3'),
(83362,1502,0,'Auchenai Vindicator - Group 3'),
(83363,1500,0,'Auchenai Soulpriest - Group 1'),
(83364,1503,0,'Auchenai Vindicator - Group 4'),
(83365,1500,0,'Auchenai Vindicator - Group 1'),
(83366,1507,0,'Auchenai Vindicator - Group 8'),
(83367,1508,0,'Auchenai Vindicator - Group 9'),
(83368,1508,0,'Auchenai Soulpriest - Group 9'),
(83370,1509,0,'Auchenai Vindicator - Group 10'),
(83371,1509,0,'Auchenai Soulpriest - Group 10'),
(84079,1499,0,'The Deadmines - Miner Johnson'),
(105955,1601,70,'Tormented Officer'),
(134515,1047,0,'Hematos (8976) - Spawn 1'),
(134517,1601,30,'Deathsworn Captain');
/*!40000 ALTER TABLE `pool_creature` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

