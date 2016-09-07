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
-- Table structure for table `battlemaster_entry`
--

DROP TABLE IF EXISTS `battlemaster_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlemaster_entry`
--

LOCK TABLES `battlemaster_entry` WRITE;
/*!40000 ALTER TABLE `battlemaster_entry` DISABLE KEYS */;
INSERT INTO `battlemaster_entry` (`entry`, `bg_template`) VALUES
(347,1),
(857,3),
(907,3),
(2302,2),
(2804,2),
(3890,2),
(5118,1),
(7410,1),
(7427,1),
(10360,2),
(12197,1),
(12198,3),
(14942,1),
(14981,2),
(14982,2),
(14990,3),
(14991,3),
(15006,3),
(15007,3),
(15008,3),
(15102,2),
(15103,1),
(15105,2),
(15106,1),
(16694,3),
(16695,1),
(16696,2),
(16711,3),
(17506,1),
(17507,2),
(18895,6),
(19855,3),
(19858,6),
(19859,6),
(19905,3),
(19906,1),
(19907,1),
(19908,2),
(19909,6),
(19910,2),
(19911,6),
(19912,6),
(19915,6),
(19923,6),
(19925,6),
(20002,2),
(20118,2),
(20119,1),
(20120,3),
(20269,2),
(20271,1),
(20272,2),
(20273,3),
(20274,3),
(20276,1),
(20362,7),
(20374,7),
(20381,7),
(20382,7),
(20383,7),
(20384,7),
(20385,7),
(20386,7),
(20388,7),
(20390,7),
(20497,6),
(20499,6),
(21235,6),
(22013,7),
(22015,7),
(25991,6),
(29533,10),
(29568,10),
(29667,2),
(29668,3),
(29669,1),
(29670,7),
(29671,9),
(29672,2),
(29673,3),
(29674,1),
(29675,7),
(29676,9),
(30231,3),
(30566,9),
(30567,9),
(30578,9),
(30579,9),
(30580,9),
(30581,9),
(30582,9),
(30583,9),
(30584,9),
(30586,9),
(30587,9),
(30590,9),
(32330,10),
(32332,10),
(32333,10),
(32617,1),
(32619,3),
(32620,7),
(32623,9),
(32625,2),
(34948,30),
(34949,30),
(34950,30),
(34951,30),
(34952,30),
(34953,30),
(34955,32),
(34972,32),
(34973,32),
(34976,32),
(34978,32),
(34983,32),
(34985,32),
(34986,32),
(34987,32),
(34988,32),
(34989,32),
(34991,32),
(34997,32),
(34998,32),
(34999,32),
(35000,32),
(35001,32),
(35002,32),
(35007,32),
(35008,32),
(35017,30),
(35022,30),
(35023,30),
(35024,30),
(35025,30),
(35026,30);
/*!40000 ALTER TABLE `battlemaster_entry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

