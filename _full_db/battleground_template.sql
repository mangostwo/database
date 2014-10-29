/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `battleground_template` VALUES (1,40,40,611,2.72532,610,2.27452),(2,10,10,769,3.14159,770,0.00391),(3,15,15,890,3.91992,889,0.88828),(4,5,5,929,0,936,3.14159),(5,5,5,939,0,940,3.14159),(6,5,5,0,0,0,0),(7,15,15,1103,3.22092,1104,0.01649),(8,5,5,1258,0,1259,3.14159),(9,15,15,1367,0,1368,0),(10,5,5,1362,0,1363,0),(11,5,5,1364,0,1365,0),(30,40,40,1485,0,1486,0),(32,5,40,0,0,0,0);
