/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) NOT NULL DEFAULT '2',
  `subject_loc1` varchar(100) NOT NULL DEFAULT '',
  `subject_loc2` varchar(100) NOT NULL DEFAULT '',
  `subject_loc3` varchar(100) NOT NULL DEFAULT '',
  `subject_loc4` varchar(100) NOT NULL DEFAULT '',
  `subject_loc5` varchar(100) NOT NULL DEFAULT '',
  `subject_loc6` varchar(100) NOT NULL DEFAULT '',
  `subject_loc7` varchar(100) NOT NULL DEFAULT '',
  `subject_loc8` varchar(100) NOT NULL DEFAULT '',
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  PRIMARY KEY (`entry`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
