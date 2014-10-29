/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_model_race` (
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `racemask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `creature_entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'option 1, modelid_N from creature_template',
  `modelid_racial` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'option 2, explicit modelid',
  PRIMARY KEY (`modelid`,`racemask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Model system';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `creature_model_race` VALUES (892,690,0,8571),(2281,690,0,2289),(21243,690,0,21244),(20857,690,0,20872),(4587,1024,19638,0),(4588,1024,19637,0),(4589,1024,19636,0),(4590,1024,19639,0),(4587,128,37773,0),(4588,128,37768,0),(4589,128,37771,0),(4590,128,37769,0),(4587,2,37772,0),(4588,2,37767,0),(4589,2,37770,0),(4590,2,37766,0),(4587,4,37752,0),(4588,4,37750,0),(4589,4,37751,0),(4590,4,37749,0);
