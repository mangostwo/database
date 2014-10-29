/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_expire_convert` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item Convert System';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `item_expire_convert` VALUES (44623,44625),(39878,39883),(44625,44627),(44632,44626),(44626,44629),(44717,44718);
