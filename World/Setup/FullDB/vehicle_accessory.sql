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
/*!40103 SET @OLD_TIME_ZONE=@@SESSION.TIME_ZONE */;
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
INSERT INTO `vehicle_accessory` VALUES (27241,0,27268,'Risen Gryphon'),
(27626,0,27627,'Tatjana\'s Horse'),
(27661,0,27662,'Wintergarde Gryphon'),
(28018,0,28006,'Thiassi the Light Bringer'),
(28054,0,28053,'Lucky Wilhelm - Apple'),
(28312,7,28319,'Wintergrasp Siege Engine'),
(28614,0,28616,'Scarlet Gryphon Rider'),
(29555,0,29556,'Goblin Sapper'),
(29625,0,29694,'Hyldsmeet Proto-Drake'),
(29698,0,29699,'Drakuru Raptor'),
(29931,0,29982,'Drakkari Rider on Drakkari Rhino'),
(30330,0,30332,'Jotunheim Proto-Drake'),
(32189,0,32190,'Skybreaker Recon Fighter'),
(32627,7,32629,'Wintergrasp Siege Engine'),
(32633,1,32638,'Traveler Mammoth (A) - Vendor'),
(32633,2,32639,'Traveler Mammoth (A) - Vendor & Repairer'),
(32640,1,32642,'Traveler Mammoth (H) - Vendor'),
(32640,2,32641,'Traveler Mammoth (H) - Vendor & Repairer'),
(34146,1,34137,'Winter Jormungar'),
(34146,0,34137,'Winter Jormungar'),
(33060,7,33067,'Salvaged Siege Engine'),
(33109,1,33167,'Salvaged Demolisher'),
(33109,2,33620,'Salvaged Demolisher'),
(33109,3,33167,'Salvaged Demolisher'),
(33113,2,33114,'Flame Leviathan'),
(33113,3,33114,'Flame Leviathan'),
(33113,7,33139,'Flame Leviathan'),
(33114,1,33142,'Overload Control Device'),
(33114,2,33143,'Leviathan Defense Turret'),
(33214,1,33218,'Mechanolift 304-A'),
(33669,0,33666,'Demolisher Engineer Blastwrench'),
(33687,0,33695,'Chillmaw'),
(33687,1,33695,'Chillmaw'),
(33687,2,33695,'Chillmaw'),
(33778,0,33780,'Tournament Hippogryph'),
(34776,7,34777,'Isle of Conquest Siege Engine  - main turret (ally)'),
(34776,1,36356,'Isle of Conquest Siege Engine  - flame turret 1 (ally)'),
(34776,2,36356,'Isle of Conquest Siege Engine  - flame turret 2 (ally)'),
(35069,7,36355,'Isle of Conquest Siege Engine - main turret (horde)'),
(35069,1,34778,'Isle of Conquest Siege Engine - flame turret 1 (horde)'),
(35069,2,34778,'Isle of Conquest Siege Engine - flame turret 2 (horde)'),
(35633,0,34702,'Ambrose Boltspark\'s Mount'),
(35634,0,35617,'Deathstalker Visceri\'s Mount'),
(35635,0,35569,'Eressea Dawnsinger\'s Mount'),
(35636,0,34703,'Lana Stouthammer\'s Mount'),
(35637,0,34705,'Marshal Jacob Alerius\' Mount'),
(35638,0,35572,'Mokra the Skullcrusher\'s Mount'),
(35640,0,35571,'Runok Wildmane\'s Mount'),
(35641,0,35570,'Zul\'tore\'s Mount'),
(36678,0,38309,'Professor Putricide - trigger'),
(36678,1,38308,'Professor Putricide - trigger'),
(27213,0,27206,'Onslaught Warhorse - Onslaught Knight'),
(24083,0,24849,'Proto Drake Rider mounted to Enslaved Proto Drake'),
(24750,0,24751,'Excelsior rides Hidalgo the Master Falconer'),
(28710,0,28646,'Pilot Vic'),
(29433,0,29440,'Goblin Sapper in K3'),
(29579,0,29599,'Brann Snow Target'),
(29838,0,29836,'Drakkari Battle Rider on Drakkari Rhino, not minion'),
(29931,1,29982,'Drakkari Rider on Drakkari Rhino'),
(29931,2,29982,'Drakkari Rider on Drakkari Rhino'),
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
(33364,1,33365,'Thorim\'s Hammer Targetting Reticle'),
(36896,1,28717,'Overlord Drakuru on Stonespine Gargoyle'),
(28782,0,28768,'Acherus Deathcharger - Dark Rider of Acherus'),
(36794,0,36658,'Scourgelord Tyrannus - intro'),
(36891,0,31260,'Iceborn Proto-Drake'),
(33369,1,33370,'Mimiron\'s Inferno Targetting Reticle'),
(33108,1,33212,'Hodir\'s Fury Targetting Reticle'),
(33366,1,33367,'Freya\'s Ward Targetting Reticle'),
(34161,1,33216,'Mechanostriker 54-A'),
(34146,2,34137,'Winter Jormungar'),
(34146,3,34137,'Winter Jormungar'),
(34150,0,34137,'Winter Jormungar'),
(34150,1,34137,'Winter Jormungar'),
(34150,2,34137,'Winter Jormungar'),
(34150,3,34137,'Winter Jormungar'),
(34150,4,34137,'Winter Jormungar'),
(34150,5,34137,'Winter Jormungar'),
(34151,0,34137,'Winter Jormungar'),
(34151,1,34137,'Winter Jormungar'),
(34151,2,34137,'Winter Jormungar'),
(34151,3,34137,'Winter Jormungar'),
(34151,4,34137,'Winter Jormungar'),
(34151,5,34137,'Winter Jormungar'),
(34151,6,34137,'Winter Jormungar'),
(34151,7,34137,'Winter Jormungar'),
(33651,5,34050,'Rocket (Mimiron Visual)'),
(33651,6,34050,'Rocket (Mimiron Visual)'),
(34183,1,34184,'Clockwork Mechanic'),
(29500,0,29498,'Brunnhildar Warmaiden'),
(30174,0,30175,'Hyldsmeet Bear Rider'),
(40081,0,40083,'Orb Carrier'),
(40081,1,40100,'Orb Carrier');

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