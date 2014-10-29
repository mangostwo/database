/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_level_reward` (
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `raceMask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`raceMask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Mail System';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `mail_level_reward` VALUES (20,512,232,16280),(20,1024,227,20914),(20,4,226,4772),(20,64,228,7954),(20,1,224,4732),(20,8,225,4753),(20,2,231,4752),(20,32,229,3690),(20,128,230,7953),(20,16,233,4773),(40,512,272,16280),(40,1024,273,20914),(40,4,274,4772),(40,64,275,7954),(40,1,276,4732),(40,8,277,4753),(40,2,278,4752),(40,32,279,3690),(40,128,280,7953),(40,16,281,4773),(60,690,282,35093),(60,1101,283,35100),(70,1101,284,35133),(70,690,285,35135);
