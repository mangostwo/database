/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dungeonfinder_item_rewards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `min_level` smallint(3) unsigned NOT NULL COMMENT 'dbc value',
  `max_level` smallint(3) unsigned NOT NULL COMMENT 'dbc value',
  `item_reward` mediumint(8) unsigned NOT NULL,
  `item_amount` mediumint(4) unsigned NOT NULL,
  `dungeon_type` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `dungeonfinder_item_rewards` VALUES (1,15,25,51999,1,0),(2,26,35,52000,1,0),(3,36,45,52001,1,0),(4,46,55,52002,1,0),(5,56,60,52003,1,0),(6,61,64,52004,1,1),(7,65,68,52005,1,1),(8,69,80,29434,12,3),(9,80,82,49426,2,4),(10,70,75,0,0,2);
