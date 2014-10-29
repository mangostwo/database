/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world_template` (
  `map` smallint(5) unsigned NOT NULL,
  `ScriptName` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `world_template` VALUES (1,'world_map_kalimdor'),(0,'world_map_eastern_kingdoms'),(530,'world_map_outland'),(571,'world_map_northrend'),(609,'world_map_ebon_hold');
