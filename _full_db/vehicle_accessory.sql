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
-- Table structure for table `vehicle_accessory`
--

DROP TABLE IF EXISTS `vehicle_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_accessory` (
  `vehicle_entry` int(10) unsigned NOT NULL COMMENT 'entry of the npc who has some accessory as vehicle',
  `seat` mediumint(8) unsigned NOT NULL COMMENT 'onto which seat shall the passenger be boarded',
  `accessory_entry` int(10) unsigned NOT NULL COMMENT 'entry of the passenger that is to be boarded',
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`vehicle_entry`,`seat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Vehicle Accessory (passengers that are auto-boarded onto a vehicle)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_accessory`
--

LOCK TABLES `vehicle_accessory` WRITE;
/*!40000 ALTER TABLE `vehicle_accessory` DISABLE KEYS */;
INSERT INTO `vehicle_accessory` (`vehicle_entry`, `seat`, `accessory_entry`, `comment`) VALUES
(28782,0,28768,'Acherus Deathcharger - Dark Rider of Acherus'),
(36891,0,31260,'Ymirjar Skycaller'),
(36678,1,38308,'Professor Putricide - trigger'),
(36678,0,38309,'Professor Putricide - trigger'),
(36661,0,36658,'Scourgelord Tyrannus and Rimefang'),
(36476,0,36477,'Krick and Ick'),
(35768,0,34701,'Colosos\' Mount'),
(35641,0,35570,'Zul\'tore\'s Mount'),
(35640,0,35571,'Runok Wildmane\'s Mount'),
(35638,0,35572,'Mokra the Skullcrusher\'s Mount'),
(35637,0,34705,'Marshal Jacob Alerius\' Mount'),
(35636,0,34703,'Lana Stouthammer\'s Mount'),
(35635,0,35569,'Eressea Dawnsinger\'s Mount'),
(35634,0,35617,'Deathstalker Visceri\'s Mount'),
(35633,0,34702,'Ambrose Boltspark\'s Mount'),
(35069,2,34778,'Isle of Conquest Siege Engine - flame turret 2 (horde)'),
(35069,1,34778,'Isle of Conquest Siege Engine - flame turret 1 (horde)'),
(35069,7,36355,'Isle of Conquest Siege Engine - main turret (horde)'),
(34776,2,36356,'Isle of Conquest Siege Engine  - flame turret 2 (ally)'),
(34776,1,36356,'Isle of Conquest Siege Engine  - flame turret 1 (ally)'),
(34776,7,34777,'Isle of Conquest Siege Engine  - main turret (ally)'),
(34658,0,34657,'Jaelyne Evensong\'s Mount'),
(33778,0,33780,'Tournament Hippogryph'),
(33687,2,33695,'Chillmaw'),
(33687,1,33695,'Chillmaw'),
(33687,0,33695,'Chillmaw'),
(33669,0,33666,'Demolisher Engineer Blastwrench'),
(33214,1,33218,'Mechanolift 304-A'),
(33114,2,33143,'Leviathan Defense Turret'),
(33114,1,33142,'Overload Control Device'),
(33113,7,33139,'Flame Leviathan'),
(33113,3,33114,'Flame Leviathan'),
(33113,2,33114,'Flame Leviathan'),
(33109,3,33167,'Salvaged Demolisher'),
(33109,2,33620,'Salvaged Demolisher'),
(33109,1,33167,'Salvaged Demolisher'),
(33060,7,33067,'Salvaged Siege Engine'),
(32930,1,32934,'Kologarn'),
(32930,0,32933,'Kologarn'),
(32640,2,32641,'Traveler Mammoth (H) - Vendor & Repairer'),
(32640,1,32642,'Traveler Mammoth (H) - Vendor'),
(32633,2,32639,'Traveler Mammoth (A) - Vendor & Repairer'),
(32633,1,32638,'Traveler Mammoth (A) - Vendor'),
(32627,7,32629,'Wintergrasp Siege Engine'),
(32189,0,32190,'Skybreaker Recon Fighter'),
(30330,0,30332,'Jotunheim Proto-Drake'),
(29931,0,29982,'Drakkari Rider on Drakkari Rhino'),
(29698,0,29699,'Drakuru Raptor'),
(29625,0,29694,'Hyldsmeet Proto-Drake'),
(29555,0,29556,'Goblin Sapper'),
(28614,0,28616,'Scarlet Gryphon Rider'),
(28312,7,28319,'Wintergrasp Siege Engine'),
(28054,0,28053,'Lucky Wilhelm - Apple'),
(24750,0,24751,'Excelsior rides Hidalgo the Master Falconer'),
(28710,0,28646,'Pilot Vic'),
(29433,0,29440,'Goblin Sapper in K3'),
(29579,0,29599,'Brann Snow Target'),
(29838,0,29836,'Drakkari Battle Rider on Drakkari Rhino, not minion'),
(28018,0,28006,'Thiassi the Light Bringer'),
(27661,0,27662,'Wintergarde Gryphon'),
(30234,0,30245,'Hover Disk - Nexus Lord'),
(30248,0,30249,'Hover Disk - Scion of Eternity'),
(31262,0,31263,'Carrion Hunter rides Blight Falconer'),
(31269,0,27559,'Kor\'kron Battle Wyvern'),
(31406,0,31408,'Alliance Bomber Seat on Alliance Infra-green Bomber'),
(31406,1,31407,'Alliance Turret Seat on Alliance Infra-green Bomber'),
(31406,2,31409,'Alliance Engineering Seat on rides Alliance Infra-green Bomber'),
(31406,3,32217,'Banner Bunny, Hanging, Alliance on Alliance Infra-green Bomber'),
(31406,4,32221,'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber'),
(31406,5,32221,'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber'),
(31406,6,32256,'Shield Visual Loc Bunny on Alliance Infra-green Bomber'),
(31406,7,32274,'Alliance Bomber Pilot rides Alliance Infra-green Bomber'),
(31583,1,31630,'Skytalon Explosion Bunny on Frostbrood Skytalon'),
(31881,0,31891,'Kor\'kron Transport Pilot rides Kor\'kron Troop Transport'),
(31881,1,31884,'Kor\'kron Suppression Turret on Kor\'kron Troop Transport'),
(31881,2,31882,'Kor\'kron Infiltrator on Kor\'kron Troop Transport'),
(31881,3,31882,'Kor\'kron Infiltrator on Kor\'kron Troop Transport'),
(31881,4,31882,'Kor\'kron Infiltrator on Kor\'kron Troop Transport'),
(31881,5,31882,'Kor\'kron Infiltrator on Kor\'kron Troop Transport'),
(31884,0,31882,'Kor\'kron Infiltrator rides Kor\'kron Suppression Turret'),
(32225,0,32223,'Skybreaker Transport Pilot rides Skybreaker Troop Transport'),
(32225,1,32227,'Skybreaker Suppression Turret on Skybreaker Troop Transport'),
(32225,2,32222,'Skybreaker Infiltrator on Skybreaker Troop Transport'),
(32225,3,32222,'Skybreaker Infiltrator on Skybreaker Troop Transport'),
(32225,4,32222,'Skybreaker Infiltrator on Skybreaker Troop Transport'),
(32225,5,32222,'Skybreaker Infiltrator on Skybreaker Troop Transport'),
(32227,0,32222,'Skybreaker Infiltrator rides Skybreaker Suppression Turret'),
(32344,0,32274,'Alliance Bomber Pilot rides Alliance Rescue Craft'),
(32344,2,32531,'Banner Bunny, Side, Alliance, Small rides Alliance Rescue Craft'),
(32490,0,32486,'Scourge Death Knight rides Scourge Deathcharger'),
(33293,0,33329,'XT-002 Deconstructor - Heart'),
(36896,1,28717,'Overlord Drakuru on Stonespine Gargoyle'),
(27626,0,27627,'Tatjana\'s Horse'),
(36794,0,36658,'Scourgelord Tyrannus - intro'),
(27241,0,27268,'Risen Gryphon'),
(32823,0,34812,'Bountiful Table - The Turkey Chair'),
(32823,1,34823,'Bountiful Table - The Cranberry Chair'),
(32823,2,34819,'Bountiful Table - The Stuffing Chair'),
(32823,3,34824,'Bountiful Table - The Sweet Potato Chair'),
(32823,4,34822,'Bountiful Table - The Pie Chair'),
(32823,5,32830,'Bountiful Table - Food Holder'),
(32823,6,32840,'Bountiful Table - Plate Holder'),
(32830,0,32824,'Food Holder - [PH] Pilgrim\'s Bounty Table - Turkey'),
(32830,1,32827,'Food Holder - [PH] Pilgrim\'s Bounty Table - Cranberry Sauce'),
(32830,2,32831,'Food Holder - [PH] Pilgrim\'s Bounty Table - Stuffing'),
(32830,3,32825,'Food Holder - [PH] Pilgrim\'s Bounty Table - Yams'),
(32830,4,32829,'Food Holder - [PH] Pilgrim\'s Bounty Table - Pie'),
(32840,0,32839,'Plate Holder - Sturdy Plate'),
(32840,1,32839,'Plate Holder - Sturdy Plate'),
(32840,2,32839,'Plate Holder - Sturdy Plate'),
(32840,3,32839,'Plate Holder - Sturdy Plate'),
(32840,4,32839,'Plate Holder - Sturdy Plate'),
(27213,0,27206,'Onslaught Warhorse - Onslaught Knight'),
(24083,0,24849,'Proto Drake Rider mounted to Enslaved Proto Drake');
/*!40000 ALTER TABLE `vehicle_accessory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

