/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `areatrigger_involvedrelation` VALUES (2946,6421),(3367,6025),(2327,4842),(2486,4811),(1205,2989),(482,1699),(362,1448),(302,1265),(231,984),(230,954),(225,944),(216,870),(196,578),(169,287),(98,201),(78,155),(178,503),(87,76),(88,62),(3986,8286),(4071,9193),(4200,9607),(4201,9608),(4291,9701),(4293,9716),(4298,9731),(4300,9752),(4301,9786),(1388,3505),(175,455),(246,1149),(232,984),(235,984),(4473,10269),(4475,10275),(2926,25),(522,1719),(171,273),(173,437),(2207,5156),(2726,6185),(4064,9160),(4170,9400),(4280,9700),(4581,10750),(4588,10772),(4963,11652),(4899,11890),(4950,12036),(4986,12263),(5003,12506),(5400,13816),(5401,13607),(822,2240),(3991,1658);
