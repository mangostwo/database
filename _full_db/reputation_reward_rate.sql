/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reputation_reward_rate` (
  `faction` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reputation_reward_rate` VALUES (529,2,1,2),(609,2,1,2),(576,4,1,4),(1073,2,2,2),(1119,1.3,1.3,1.3),(1106,1.3,1.3,1.3),(1090,1.3,1.3,1.3),(1098,1.3,1.3,1.3),(1091,1.3,1.3,1.3),(970,3,1,3),(978,2,1,2),(941,2,1,2),(1105,2,2,2),(1104,2,2,2);
