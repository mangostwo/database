/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_convert` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `item_convert` VALUES (50338,44135),(50337,44136),(50335,44133),(50336,44134),(50370,44152),(50367,44149),(50368,44159),(50369,44150),(50372,44701),(50373,44702);
