/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_quest` (
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'entry from quest_template',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'entry from game_event',
  PRIMARY KEY (`quest`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Game event system';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `game_event_quest` VALUES (171,10),(172,10),(1468,10),(8356,12),(8860,6),(8861,6),(8980,8),(8981,8),(8983,8),(8993,8),(9024,8),(9025,8),(9027,8),(10942,10),(10943,10),(10968,10),(11356,12),(11357,12),(11441,26),(11446,26),(11970,1),(11971,1),(12752,17),(12753,17),(12772,17),(12775,17),(12777,17),(12782,17),(12783,17),(12784,17),(12808,17),(12811,17),(13484,28),(14022,37),(14036,37),(24803,24),(24806,24),(24806,40);
