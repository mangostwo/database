/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_proc_item_enchant` (
  `entry` mediumint(8) unsigned NOT NULL,
  `ppmRate` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `spell_proc_item_enchant` VALUES (8034,9),(8680,8.5714),(13218,21.4286),(13897,6),(20004,6),(20005,1.6),(44525,3.4),(44578,3.4);
