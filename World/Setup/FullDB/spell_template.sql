-- ---------------------------------------- 
-- --        CLEAR DOWN THE TABLE        -- 
-- ---------------------------------------- 
TRUNCATE TABLE `spell_template`; 
-- ---------------------------------------- 
-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: localhost    Database: mangos2
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.8-MariaDB

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
-- Dumping data for table `spell_template`
--

LOCK TABLES `spell_template` WRITE;
/*!40000 ALTER TABLE `spell_template` DISABLE KEYS */;
INSERT INTO `spell_template` (`id`, `attr`, `attr_ex`, `attr_ex2`, `attr_ex3`, `proc_flags`, `proc_chance`, `duration_index`, `effect0`, `effect0_implicit_target_a`, `effect0_implicit_target_b`, `effect0_radius_idx`, `effect0_apply_aura_name`, `effect0_misc_value`, `effect0_misc_value_b`, `effect0_trigger_spell`, `comments`) VALUES 
(11756,384,268435456,0,0,0,101,4,76,47,0,15,0,144064,0,0,'Summon Gordunni chest (COBALT)'),
(19394,384,268435456,0,0,0,101,4,76,47,0,15,0,177681,0,0,'Summon Gordunni chest (JUNK)'),
(21387,320,268435456,0,0,40,15,21,6,1,0,0,42,0,0,21388,'Melt-Weapon trigger aura related used by Ragnaros'),
(21883,384,268435456,0,0,0,101,225,76,22,0,0,0,178904,0,0,'Summon Healed Celebrian Vine'),
(23363,256,0,0,0,0,101,21,76,18,0,0,0,179804,0,0,'Summon Drakonid Corpse Trigger'),
(23770,612368640,268435592,1,1048576,0,101,367,6,25,0,0,4,0,0,0,'Sayge\'s timer - Darkmoon Faire'),
(25192,256,0,4,0,0,101,21,76,18,0,0,0,180619,0,0,'Summon Ossirian Crystal'),
(26133,256,0,0,0,0,101,21,76,18,0,0,0,180795,0,0,'Summon Sandworm Base'),
(33242,384,0,4,0,0,101,21,28,18,0,7,0,19259,64,0,'summon Infernal Invader'),
(34810,0,0,0,0,0,101,21,28,42,0,8,0,20083,64,0,'Summon Summoned Bloodwarder Mender behind of the caster'),
(34817,0,0,0,0,0,101,21,28,44,0,8,0,20078,64,0,'Summon Summoned Bloodwarder Reservist right of the caster'),
(34818,0,0,0,0,0,101,21,28,43,0,8,0,20078,64,0,'Summon Summoned Bloodwarder Reservist left of the caster'),
(34819,0,0,0,0,0,101,21,28,41,0,8,0,20078,64,0,'Summon Summoned Bloodwarder Reservist front of the caster'),
(35153,0,0,0,0,0,101,21,28,42,0,8,0,20405,64,0,'Summon Nether Charge behind of the caster'),
(35904,0,0,0,0,0,101,21,28,44,0,8,0,20405,64,0,'Summon Nether Charge right of the caster'),
(35905,0,0,0,0,0,101,21,28,43,0,8,0,20405,64,0,'Summon Nether Charge left of the caster'),
(35906,0,0,0,0,0,101,21,28,41,0,8,0,20405,64,0,'Summon Nether Charge front of the caster'),
(37264,384,0,4,0,0,101,21,28,18,0,7,0,21729,64,0,'Power Converters: Summon Electromental (from cata)'),
(37278,384,0,4,0,0,101,21,28,18,0,1,0,21737,64,0,'Power Converters: Summon Mini-Electromental (from cata)'),
(37365,384,0,4,0,0,101,21,28,18,0,1,0,21757,64,0,'Power Converters: Summon Big Flavor Electromental (from cata)'),
(38096,384,0,9,0,0,101,21,6,38,0,0,4,0,0,0,'[DND]Destroy Sun Gate Portal Controller'),
(39240,0,0,0,0,0,101,4,28,41,0,8,0,22483,64,0,'Summon Summon Sand Gnome front of the caster'),
(39241,0,0,0,0,0,101,4,28,41,0,8,0,22482,64,0,'Summon Mature Bone Sifter front of the caster'),
(44920,0,0,0,0,0,101,21,6,1,0,0,56,24941,0,0,'Model - Shattered Sun Marksman - BE Male Tier 4'),
(44924,0,0,0,0,0,101,21,6,1,0,0,56,24945,0,0,'Model - Shattered Sun Marksman - BE Female Tier 4'),
(44928,0,0,0,0,0,101,21,6,1,0,0,56,24949,0,0,'Model - Shattered Sun Marksman - Draenei Male Tier 4'),
(44932,0,0,0,0,0,101,21,6,1,0,0,56,24953,0,0,'Model - Shattered Sun Marksman - Draenei Female Tier 4'),
(45158,0,0,0,0,0,101,21,6,1,0,0,56,25119,0,0,'Model - Shattered Sun Warrior - BE Female Tier 4'),
(45162,0,0,0,0,0,101,21,6,1,0,0,56,25123,0,0,'Model - Shattered Sun Warrior - BE Male Tier 4'),
(45166,0,0,0,0,0,101,21,6,1,0,0,56,25127,0,0,'Model - Shattered Sun Warrior - Draenei Female Tier 4'),
(45170,0,0,0,0,0,101,21,6,1,0,0,56,25131,0,0,'Model - Shattered Sun Warrior - Draenei Male Tier 4'),
(50574,256,0,0,0,0,101,0,90,25,0,11,0,28042,0,0,'Captain Brandon Kill Credit'),
(58630,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - Mal\'Ganis'),
(59046,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - Tribunal of Ages'),
(59450,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - The Four Horsemen'),
(62388,0,0,0,0,0,101,21,6,1,0,0,4,0,0,0,'Aura required for Demonic Circle 48020'),
(64899,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - Hodir'),
(64985,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - Thorim'),
(65074,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - Freya'),
(65195,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - Assembly of Iron'),
(68184,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - Faction Champions'),
(72845,8388992,0,5,0,0,101,37,6,22,7,28,4,0,0,0,'Achievement check - Pit of Saron - Don\'t Look Up');
/*!40000 ALTER TABLE `spell_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-15 13:58:25
