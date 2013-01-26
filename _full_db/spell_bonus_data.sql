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
-- Table structure for table `spell_bonus_data`
--

DROP TABLE IF EXISTS `spell_bonus_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_bonus_data` (
  `entry` mediumint(8) unsigned NOT NULL,
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_bonus_data`
--

LOCK TABLES `spell_bonus_data` WRITE;
/*!40000 ALTER TABLE `spell_bonus_data` DISABLE KEYS */;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(116,0.8143,0,0,0,'Mage - Frost Bolt'),
(133,1,0,0,0,'Mage - Fire Ball'),
(172,0,0.2,0,0,'Warlock - Corruption'),
(331,1.6106,0,0,0,'Shaman - Healing Wave'),
(339,0,0.1,0,0,'Druid - Entangling Roots'),
(348,0.2,0.2,0,0,'Warlock - Immolate'),
(379,0,0,0,0,'Shaman - Earth Shield Triggered'),
(403,0.7143,0,0,0,'Shaman - Lightning Bolt'),
(585,0.714,0,0,0,'Priest - Smite'),
(603,0,2,0,0,'Warlock - Curse of Doom'),
(635,1.66,0,0,0,'Paladin - Holy Light'),
(703,0,0,0,0.07,'Rogue - Garrote'),
(755,0,0.4485,0,0,'Warlock - Health Funnel'),
(879,0.15,0,0.15,0,'Paladin - Exorcism'),
(974,0.4762,0,0,0,'Shaman - Earth Shield'),
(980,0,0.1,0,0,'Warlock - Curse of Agony'),
(1120,0,0.4286,0,0,'Warlock - Drain Soul'),
(1463,0.8053,0,0,0,'Mage - Mana Shield'),
(1495,0,0,0.2,0,'Hunter - Mongoose Bite'),
(1776,0,0,0.21,0,'Rogue - Gouge'),
(1822,0,0,0,0.06,'Druid - Rake'),
(1949,0,0.0946,0,0,'Warlock - Hellfire'),
(1978,0,0,0,0.04,'Hunter - Serpent Sting'),
(2120,0.2357,0.122,0,0,'Mage - Flamestrike'),
(2812,0.07,0,0.07,0,'Paladin - Holy Wrath'),
(2818,0,0,0,0.03,'Rogue - Deadly Poison'),
(2944,0,0.1849,0,0,'Priest - Devouring Plague'),
(3044,0,0,0.15,0,'Hunter - Arcane Shot'),
(3606,0.1667,0,0,0,'Shaman - Searing Totem Attack Rank 1'),
(3674,0,0,0,0.02,'Hunter - Black Arrow'),
(5138,0,0,0,0,'Warlock - Drain Mana'),
(5176,0.5714,0,0,0,'Druid - Wrath'),
(5185,1.6104,0,0,0,'Druid - Healing Touch'),
(5570,0,0.2,0,0,'Druid - Insect Swarm'),
(5672,0.08272,0,0,0,'Shaman - Healing Stream Totem Aura'),
(5707,0,0,0,0,'Item - Lifestone Regeneration'),
(5857,0.1428,0,0,0,'Warlock - Hellfire Effect on Enemy Rank 1'),
(6229,0.3,0,0,0,'Warlock - Shadow Ward'),
(6353,1.15,0,0,0,'Warlock - Soul Fire'),
(7268,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 1'),
(8026,0.1,0,0,0,'Shaman - Flametongue Weapon Proc Rank 1'),
(8034,0.1,0,0,0,'Shaman - Frostbrand Attack Rank 1'),
(8042,0.3858,0,0,0,'Shaman - Earth Shock'),
(8050,0.2142,0.1,0,0,'Shaman - Flame Shock'),
(8056,0.3858,0,0,0,'Shaman - Frost Shock'),
(8129,0,0,0,0,'Priest - Mana Burn'),
(8188,0.1,0,0,0,'Shaman - Magma Totam Passive Rank 1'),
(8680,0,0,0.1,0,'Rogue - Instant Poison'),
(8921,0.1515,0.13,0,0,'Druid - Moonfire'),
(8936,0.539,0.188,0,0,'Druid - Regrowth'),
(9007,0,0,0,0.03,'Druid - Pounce Bleed'),
(10444,0,0,0,0,'Shaman - Flametongue Attack'),
(11366,1.15,0.05,0,0,'Mage - Pyroblast'),
(11538,0,0,0,0,'Item - Six Demon Bag - Frostbolt'),
(13218,0,0,0.04,0,'Rogue - Wound Poison'),
(13797,0,0,0,0.02,'Hunter - Immolation Trap'),
(13812,0,0,0.1,0.1,'Hunter - Explosive Trap'),
(14914,0.5711,0.024,0,0,'Priest - Holy Fire'),
(15237,0.1606,0,0,0,'Priest - Holy Nova Damage'),
(15662,0,0,0,0,'Item - Six Demon Bag - Fireball'),
(17712,0,0,0,0,'Item - Lifestone Healing'),
(17962,0,0,0,0,NULL),
(18220,0.96,0,0,0,'Warlock - Dark Pact Rank 1'),
(18562,0,0,0,0,'Druid - Swiftmend'),
(18790,0,0,0,0,'Warlock - Fel Stamina'),
(19306,0,0,0.2,0,'Hunter - Counterattack'),
(19750,1,0,0,0,'Paladin - Flash of Light'),
(20267,0.1,0,0.1,0,'Paladin - Judgement of Light Proc'),
(20424,0,0,0,0,'Paladin - Seal of Command Proc'),
(20467,0.25,0,0.16,0,'Paladin - Judgement of Command'),
(20925,0.09,0,0.056,0,'Paladin - Holy Shield'),
(21179,0,0,0,0,'Item - Six Demon Bag - Chain Lightning'),
(23455,0.3035,0,0,0,'Priest - Holy Nova Heal Rank 1'),
(25742,0.07,0,0.039,0,'Paladin - Seal of Righteousness Dummy Proc'),
(25997,0,0,0,0,'Paladin - Eye for an Eye'),
(26364,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 1'),
(26573,0,0.04,0,0.04,'Paladin - Consecration'),
(27243,0.2129,0.25,0,0,'Warlock - Seed of Corruption'),
(27813,0,0,0,0,'Priest - Blessed Recovery'),
(28176,0,0,0,0,'Warlock - Fel Armor'),
(30294,0,0,0,0,'Warlock - Soul Leech'),
(30455,0.1429,0,0,0,'Mage - Ice Lance'),
(31024,0,0,0,0,'Item - Living Ruby Pedant'),
(31117,1.8,0,0,0,'Warlock - Unstable Affliction Dispell'),
(31804,0,0,0,0,'Paladin - Judgement of Vengeance'),
(33619,0,0,0,0,'Priest - Reflective Shield'),
(33745,0,0,0.01,0.01,'Druid - Lacerate'),
(33763,0,0.09518,0,0,'Druid - Lifebloom'),
(34433,0.65,0,0,0,'Priest - Shadowfiend'),
(34913,0,0,0,0,'Mage - Molten Armor Triggered Rank 1'),
(34914,0,0.4,0,0,'Priest - Vampiric Touch'),
(38395,0,0,0,0,'Item - Siphon Essence'),
(40293,0,0,0,0,'Item - Siphon Essence'),
(42208,0.1437,0,0,0,'Mage - Blizzard Triggered'),
(42223,0.285714,0,0,0,'Warlock - Rain of Fire Triggered'),
(42231,0.12898,0,0,0,'Druid - Hurricane Triggered'),
(42243,0,0,0.0837,0,'Hunter - Volley'),
(42463,0,0,0.003,0,'Paladin - Seal of Vengeance (full stack proc)'),
(43733,0,0,0,0,'Item - Lightning Zap'),
(44203,0.538,0,0,0,'Druid - Tranquility Triggered'),
(44425,0.714286,0,0,0,'Mage - Arcane Barrage'),
(44614,0.8571,0,0,0,'Mage - Frostfire Bolt'),
(45477,0,0,0.1,0,'Death Knight - Icy Touch'),
(46567,0,0,0,0,'Item - Goblin Rocket Launcher'),
(47476,0,0,0.06,0,'Death Knight - Strangulate'),
(47632,0,0,0.15,0,'Death Knight - Death Coil Damage'),
(47633,0,0,0.15,0,'Death Knight - Death Coil Heal'),
(47666,0.229,0,0,0,'Penance - dmg effect'),
(47750,0.537,0,0,0,'Penance - heal effect'),
(47897,0.1064,0,0,0,'Warlock - Shadowflame Direct'),
(47960,0,0.06666,0,0,'Warlock - Shadowflame DoT'),
(48181,0.4729,0,0,0,'Warlock - Haunt'),
(48438,0,0.11505,0,0,'Druid - Wild Growth'),
(48628,0,0,0,0.15,'Druid - Lock Jaw'),
(48721,0,0,0.04,0,'Death Knight - Blood Boil'),
(48743,0,0,0,0,'Death Knight - Death Pact'),
(49184,0,0,0.2,0,'Death Knight - Howling Blast'),
(49821,0.2857,0,0,0,'Priest - Mind Sear Trigger'),
(50288,0.3,0,0,0,'Druid - Starfall'),
(50294,0.13,0,0,0,'Druid - Starfall AOE'),
(50401,0,0,0,0,'Death Knight - Razor Frost'),
(50444,0,0,0.105,0,'Death Knight - Corpse Explosion Triggered'),
(50464,0.6611,0,0,0,'Druid - Nourish'),
(50536,0,0,0,0.013,'Death Knight - Unholy Blight Triggered'),
(50842,0,0,0.04,0,'Death Knight - Pestilence'),
(52212,0,0,0.0475,0,'Death Knight - Death and Decay Triggered'),
(53595,0,0,0,0,'Paladin - Hammer of the Righteous'),
(53600,0,0,0,0,'Paladin - Shield of Righteousness'),
(53733,0,0,0,0,'Paladin - Judgement of Corruption'),
(53739,0,0,0.003,0,'Paladin - Seal of Corruption (full stack proc)'),
(54158,0.25,0,0,0,'Paladin - Judgement'),
(54181,0,0,0,0,'Warlock - Fel Synergy'),
(54757,0,0,0,0,'Generic - Pyro Rocket'),
(55078,0,0,0,0.06325,'Death Knight - Blood Plague'),
(55095,0,0,0,0.06325,'Death Knight - Frost Fever'),
(56131,0,0,0,0,'Item - Glyph of Dispel Magic'),
(56160,0,0,0,0,'Item - Glyph of Power Word: Shield'),
(56903,0,0,0,0,'Death Knight - Lichflame'),
(58381,0.257143,0,0,0,'Priest - Mind Flay Triggered'),
(60089,0,0,0.15,0,'Druid - Faerie Fire (Feral) Triggered'),
(61295,0.4,0.18,0,0,'Shaman - Riptide'),
(63106,0,0,0,0,'Warlock - Siphon Life Triggered'),
(63544,0,0,0,0,'Priest - Empowered Renew Triggered'),
(63675,0,0,0,0,'Priest - Improved Devouring Plague Triggered'),
(64085,1.2,0,0,0,'Priest - Vampiric Touch Dispel'),
(64569,0,0,0,0,'Item - Blood Reserve'),
(71824,0,0,0,0,'Item - Shaman T9 Elemental 4P Bonus');
/*!40000 ALTER TABLE `spell_bonus_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

