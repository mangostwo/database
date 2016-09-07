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
-- Table structure for table `gossip_texts`
--

DROP TABLE IF EXISTS `gossip_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gossip_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gossip Texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gossip_texts`
--

LOCK TABLES `gossip_texts` WRITE;
/*!40000 ALTER TABLE `gossip_texts` DISABLE KEYS */;
INSERT INTO `gossip_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES
(-3000000,'[PH] SD2 unknown text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ID_UNKNOWN_TEXT'),
(-3000101,'Taruk send me to collect what you owe.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'silvermoon harry GOSSIP_ITEM_GAMBLING_DEBT'),
(-3000102,'Pay up, Harry!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'silvermoon harry GOSSIP_ITEM_PAYING'),
(-3000103,'I am ready to travel to you village now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rainspeaker GOSSIP_ITEM_READY'),
(-3000104,'<Check for pulse...>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mosswalker victim GOSSIP_ITEM_PULSE'),
(-3000105,'Ezekiel said that you might have a certain book...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dirty larry GOSSIP_ITEM_BOOK'),
(-3000106,'Let Marshal Windsor know that I am ready.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'squire rowe GOSSIP_ITEM_WINDSOR'),
(-3000107,'I am ready, as are my forces. Let us end this masquerade!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'reginald windsor GOSSIP_ITEM_START'),
(-3000108,'I need a moment of your time, sir.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'prospector anvilward GOSSIP_ITEM_MOMENT'),
(-3000109,'I am ready, Oronok. Let us destroy Cyrukh and free the elements!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'oronok torn-heart GOSSIP_ITEM_FIGHT'),
(-3000110,'Why... yes, of course. I\'ve something to show you right inside this building, Mr. Anvilward.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'prospector anvilward GOSSIP_ITEM_SHOW'),
(-3000111,'I am ready, Anchorite. Let us begin the exorcism.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anchorite barada GOSSIP_ITEM_EXORCISM'),
(-3000112,'I\'m ready - let\'s get out of here.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'injured goblin miner GOSSIP_ITEM_ESCORT_READY'),
(-3000113,'Go on, you\'re free. Get out of here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'saronite mine slave GOSSIP_ITEM_SLAVE_FREE'),
(-3000114,'I\'m ready to start the distillation, uh, Tipsy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tipsy mcmanus GOSSIP_ITEM_START_DISTILLATION'),
(-3033000,'Please unlock the courtyard door.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'deathstalker adamant/ sorcerer ashcrombe - GOSSIP_ITEM_DOOR'),
(-3043000,'Let the event begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Disciple of Naralex - GOSSIP_ITEM_BEGIN'),
(-3090000,'I am ready to begin.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'emi shortfuse GOSSIP_ITEM_START'),
(-3230000,'You\'re free, Dughal! Get out of here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dughal GOSSIP_ITEM_DUGHAL'),
(-3230001,'Get out of here, Tobias, you\'re free!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tobias GOSSIP_ITEM_TOBIAS'),
(-3230002,'Your bondage is at an end, Doom\'rel. I challenge you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'doomrel GOSSIP_ITEM_CHALLENGE'),
(-3409000,'Tell me more.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'majordomo_executus GOSSIP_ITEM_SUMMON_1'),
(-3409001,'What else do you have to say?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'majordomo_executus GOSSIP_ITEM_SUMMON_2'),
(-3409002,'You challenged us and we have come. Where is this master you speak of?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'majordomo_executus GOSSIP_ITEM_SUMMON_3'),
(-3469000,'I\'ve made no mistakes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'victor_nefarius GOSSIP_ITEM_NEFARIUS_1'),
(-3469001,'You have lost your mind, Nefarius. You speak in riddles.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'victor_nefarius GOSSIP_ITEM_NEFARIUS_2'),
(-3469002,'Please do.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'victor_nefarius GOSSIP_ITEM_NEFARIUS_3'),
(-3469003,'I cannot, Vaelastrasz! Surely something can be done to heal you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vaelastrasz GOSSIP_ITEM_VAEL_1'),
(-3469004,'Vaelastrasz, no!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vaelastrasz GOSSIP_ITEM_VAEL_2'),
(-3509000,'Let\'s find out.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'andorov GOSSIP_ITEM_START'),
(-3509001,'Let\'s see what you have.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'andorov GOSSIP_ITEM_TRADE'),
(-3532000,'Teleport me to the Guardian\'s Library',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'berthold GOSSIP_ITEM_TELEPORT'),
(-3532001,'I\'m not an actor.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barnes GOSSIP_ITEM_OPERA_1'),
(-3532002,'Ok, I\'ll give it a try, then.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barnes GOSSIP_ITEM_OPERA_2'),
(-3532003,'I\'ve never been more ready.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barnes GOSSIP_ITEM_OPERA_JULIANNE_WIPE'),
(-3532004,'The wolf\'s going down.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barnes GOSSIP_ITEM_OPERA_WOLF_WIPE'),
(-3532005,'What phat lewtz you have grandmother?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'grandma GOSSIP_ITEM_GRANDMA'),
(-3532006,'Control Orc Grunt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'orc grunt GOSSIP_ITEM_ORC_GRUNT'),
(-3532007,'Control Orc Wolf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'orc wolf GOSSIP_ITEM_ORC_WOLF'),
(-3532008,'Control Summoned Daemon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'summoned deamon GOSSIP_ITEM_SUMMONED_DEAMON'),
(-3532009,'Control Orc Warlock',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'orc warlock GOSSIP_ITEM_ORC_WARLOCK'),
(-3532010,'Control Orc Necrolyte',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'orc necrolyte GOSSIP_ITEM_ORC_NECROLYTE'),
(-3532011,'Control Warchief Blackhand',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'warchief blackhand GOSSIP_ITEM_WARCHIEF_BLACKHAND'),
(-3532012,'Control Human Footman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'human footman GOSSIP_ITEM_HUMAN_FOOTMAN'),
(-3532013,'Control Human Charger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'human charger GOSSIP_ITEM_HUMAN_CHARGER'),
(-3532014,'Control Conjured Water Elemental',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'conjured water elemental GOSSIP_ITEM_WATER_ELEMENTAL'),
(-3532015,'Control Human Conjurer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'human conjurer GOSSIP_ITEM_HUMAN_CONJURER'),
(-3532016,'Control Human Cleric',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'human cleric GOSSIP_ITEM_HUMAN_CLERIC'),
(-3532017,'Control King Llane',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'king llane GOSSIP_ITEM_KING_LLANE'),
(-3532018,'Please reset the chess board, we would like to play again.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'medivh GOSSIP_ITEM_RESET_BOARD'),
(-3534000,'My companions and I are with you, Lady Proudmoore.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jaina GOSSIP_ITEM_JAIN_START'),
(-3534001,'We are ready for whatever Archimonde might send our way, Lady Proudmoore.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jaina GOSSIP_ITEM_ANATHERON'),
(-3534002,'Until we meet again, Lady Proudmoore.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jaina GOSSIP_ITEM_SUCCESS'),
(-3534003,'I am with you, Thrall.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'thrall GOSSIP_ITEM_THRALL_START'),
(-3534004,'We have nothing to fear.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'thrall GOSSIP_ITEM_AZGALOR'),
(-3534005,'Until we meet again, Thrall.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'thrall GOSSIP_ITEM_SUCCESS'),
(-3534006,'I would be grateful for any aid you can provide, Priestess.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tyrande GOSSIP_ITEM_AID'),
(-3560000,'We are ready to get you out of here, Thrall. Let\'s go!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'thrall GOSSIP_ITEM_START'),
(-3560001,'I need a pack of Incendiary Bombs.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'erozion GOSSIP_ITEM_NEED_BOMBS'),
(-3560002,'Taretha cannot see you, Thrall.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'thrall GOSSIP_ITEM_SKARLOC1'),
(-3560003,'The situation is rather complicated, Thrall. It would be best for you to head into the mountains now, before more of Blackmoore\'s men show up. We\'ll make sure Taretha is safe.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'thrall GOSSIP_ITEM_SKARLOC2'),
(-3560004,'We\'re ready, Thrall.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'thrall GOSSIP_ITEM_TARREN_2'),
(-3560005,'Strange wizard?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'taretha GOSSIP_ITEM_EPOCH1'),
(-3560006,'We\'ll get you out. Taretha. Don\'t worry. I doubt the wizard would wander too far away.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'taretha GOSSIP_ITEM_EPOCH2'),
(-3560007,'Tarren Mill.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'thrall GOSSIP_ITEM_TARREN_1'),
(-3564000,'I\'m with you, Akama.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'akama(shade) GOSSIP_ITEM_START_ENCOUNTER'),
(-3564001,'I\'m ready, Akama.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'akama(illidan) GOSSIP_ITEM_PREPARE'),
(-3564002,'We\'re ready to face Illidan.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'akama(illidan) GOSSIP_ITEM_START_EVENT'),
(-3568000,'Thanks for the concern, but we intend to explore Zul\'Aman.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'harrison jones GOSSIP_ITEM_BEGIN'),
(-3595000,'What do you think they\'re up to?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chromie GOSSIP_ITEM_ENTRANCE_1'),
(-3595001,'You want me to do what?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chromie GOSSIP_ITEM_ENTRANCE_2'),
(-3595002,'Very well, Chromie.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chromie GOSSIP_ITEM_ENTRANCE_3'),
(-3595003,'Why have I been sent back to this particular place and time?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chromie GOSSIP_ITEM_INN_1'),
(-3595004,'What was this decision?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chromie GOSSIP_ITEM_INN_2'),
(-3595005,'So how does the Infinite Dragonflight plan to interfere?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chromie GOSSIP_ITEM_INN_3'),
(-3595006,'Chromie, you and I both know what\'s going to happen in this time stream. We\'ve seen this all before.$B$BCan you just skip us ahead to all the real action?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chromie GOSSIP_ITEM_INN_SKIP'),
(-3595007,'Yes, please!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chromie GOSSIP_ITEM_INN_TELEPORT'),
(-3599000,'Brann, it would be our honor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'brann GOSSIP_ITEM_ID_START'),
(-3599001,'Let\'s move Brann, enough of the history lessons!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'brann GOSSIP_ITEM_ID_PROGRESS'),
(-3603000,'Teleport to the Expedition Base Camp.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_BASE_CAMP'),
(-3603001,'Teleport to the Formation Grounds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_FORMATION_GROUNDS'),
(-3603002,'Teleport to the Colossal Forge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_COLOSSAR_FORGE'),
(-3603003,'Teleport to the Scrapyard.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_SCRAPYARD'),
(-3603004,'Teleport to the Antechamber of Ulduar.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_ANTECHAMBER'),
(-3603005,'Teleport to the Shattered Walkway.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_WALKWAY'),
(-3603006,'Teleport to the Conservatory of Life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_CONSERVATORY'),
(-3603007,'Teleport to the Spark of Imagination.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_SPARK_IMAGINATION'),
(-3603008,'Teleport to the Prison of Yogg-Saron.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GOSSIP_ITEM_TELE_YOGG_SARON'),
(-3603009,'We are ready to help!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Expedition Commander GOSSIP_ITEM_START_RAZORSCALE'),
(-3603010,'Activate secondary defensive systems.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lore Keeper of Norgannon GOSSIP_ITEM_ACTIVATE_SYSTEMS'),
(-3603011,'Confirmed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lore Keeper of Norgannon GOSSIP_ITEM_CONFIRMED'),
(-3603012,'We\'re ready. Begin the assault!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brann Bronzebeard GOSSIP_ITEM_BEGIN_ASSAULT'),
(-3603013,'Lend us your aid, keeper. Together we will defeat Yogg-Saron.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ulduar Keeper GOSSIP_ITEM_LEND_AID'),
(-3603014,'Yes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ulduar Keeper GOSSIP_ITEM_KEEPER_CONFIRM'),
(-3608000,'Activate the crystals when we get in trouble, right?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sinclari GOSSIP_ITEM_INTRO'),
(-3608001,'Get your people to safety, we\'ll keep the Blue Dragonflight\'s forces at bay.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sinclari GOSSIP_ITEM_START'),
(-3608002,'I\'m not fighting, so send me in now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sinclari GOSSIP_ITEM_TELEPORT'),
(-3609000,'I challenge you, death knight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Death Knight Initiate GOSSIP_ITEM_ACCEPT_DUEL'),
(-3609001,'I am ready, Highlord. Let the siege of Light\'s Hope begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Highlord Darion Mograine GOSSIP_ITEM_READY'),
(-3649000,'Yes. We are prepared for the challenges ahead of us.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_BEAST_INIT'),
(-3649001,'Bring forth the first challenge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_BEAST_START'),
(-3649002,'We want another shot at those beasts!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_BEAST_WIPE_INIT'),
(-3649003,'What new challenge awaits us?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_JARAXXUS_INIT'),
(-3649004,'We\'re ready to fight the sorceror again.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_JARAXXUS_WIPE_INIT'),
(-3649005,'Of course!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_PVP_INIT'),
(-3649006,'Give the signal! We\'re ready to go!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_PVP_START'),
(-3649007,'That tough, huh?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_TWINS_INIT'),
(-3649008,'Val\'kyr? We\'re ready for them',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_TWINS_START'),
(-3649009,'Your words of praise are appreciated, Coliseum Master.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_ANUB_INIT'),
(-3649010,'That is strange...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'barrett GOSSIP_ITEM_ANUB_START'),
(-3650000,'I am ready.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'herald GOSSIP_ITEM_READY'),
(-3650001,'I am ready. However, I\'d like to skip the pageantry.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'herald GOSSIP_ITEM_READY_SKIP_INTRO'),
(-3650002,'I am ready for the next challenge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'herald GOSSIP_ITEM_READY_NEXT_CHALLENGE');
/*!40000 ALTER TABLE `gossip_texts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

