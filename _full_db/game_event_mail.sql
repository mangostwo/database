/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_mail` (
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Negatives value to send at event stop, positive value for send at event start.',
  `raceMask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`,`raceMask`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Game event system';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `game_event_mail` VALUES (45,1101,12278,197,27487),(46,1101,12278,198,27487),(47,1101,12278,199,27487),(48,1101,12278,200,27487),(49,1101,12278,201,27487),(50,1101,12278,202,27487),(51,1101,12278,203,27487),(52,1101,12278,204,27487),(53,1101,12278,205,27487),(54,1101,12278,206,27487),(55,1101,12278,207,27487),(56,1101,12278,208,27487),(45,690,12306,212,27487),(46,690,12306,213,27487),(47,690,12306,214,27487),(48,690,12306,215,27487),(49,690,12306,216,27487),(50,690,12306,217,27487),(51,690,12306,218,27487),(52,690,12306,219,27487),(53,690,12306,220,27487),(54,690,12306,221,27487),(55,690,12306,222,27487),(56,690,12306,223,27487);
