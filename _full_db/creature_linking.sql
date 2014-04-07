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
-- Table structure for table `creature_linking`
--

DROP TABLE IF EXISTS `creature_linking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_linking` (
  `guid` int(10) unsigned NOT NULL COMMENT 'creature.guid of the slave mob that is linked',
  `master_guid` int(10) unsigned NOT NULL COMMENT 'master to trigger events',
  `flag` mediumint(8) unsigned NOT NULL COMMENT 'flag - describing what should happen when',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature Linking System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creature_linking`
--

LOCK TABLES `creature_linking` WRITE;
/*!40000 ALTER TABLE `creature_linking` DISABLE KEYS */;
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(57507,57506,515),
(57527,57528,515),
(57596,57597,515),
(57595,57596,515),
(57594,57595,515),
(52283,52282,518),
(52293,52292,518),
(132955,69096,518),
(132956,69096,518),
(20858,20566,515),
(20859,20567,515),
(20855,20563,515),
(20856,20564,515),
(20857,20565,515),
(20863,20568,515),
(20864,20569,515),
(20865,20570,515),
(20867,20571,515),
(20868,20572,515),
(20866,20573,515),
(20869,20574,515),
(13991,13990,515),
(13992,13990,515),
(73646,73601,518),
(73645,73602,518),
(73640,73595,518),
(73641,73596,518),
(73644,73599,518),
(73642,73597,518),
(70875,70871,518),
(70873,70872,518),
(70874,70870,518),
(70846,76770,518),
(70847,76770,518),
(70848,76770,518),
(70849,76770,518),
(76127,76119,518),
(76123,76115,518),
(76128,76120,518),
(76082,76083,518),
(76083,76084,518),
(76085,76082,518),
(70888,76415,515),
(70887,76415,515),
(69091,69092,518),
(69081,69079,518),
(69097,69096,518);
/*!40000 ALTER TABLE `creature_linking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

