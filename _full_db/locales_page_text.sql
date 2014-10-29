/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
