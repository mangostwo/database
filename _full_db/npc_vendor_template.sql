/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npc_vendor_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`,`ExtendedCost`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `npc_vendor_template` VALUES (33238,44605,0,0,0,0),(33238,33451,0,0,0,0),(33238,33454,0,0,0,0),(33238,35954,0,0,0,0),(33238,33443,0,0,0,0),(33238,33449,0,0,0,0),(33238,33452,0,0,0,0),(33238,35949,0,0,0,0),(33238,22148,0,0,0,0),(33238,16583,0,0,0,0),(33238,21177,0,0,0,0),(33238,17026,0,0,0,0),(33238,17020,0,0,0,0),(33238,5565,0,0,0,0),(33238,37201,0,0,0,0),(33238,17021,0,0,0,0),(33238,17028,0,0,0,0),(33238,17032,0,0,0,0),(33238,17030,0,0,0,0),(33238,17033,0,0,0,0),(33238,17034,0,0,0,0),(33238,17031,0,0,0,0),(33238,4470,0,0,0,0),(5,17402,0,0,0,0),(5,17403,0,0,0,0),(5,17404,0,0,0,0),(5,17405,0,0,0,0),(5,17406,0,0,0,0),(5,17407,0,0,0,0),(5,17408,0,0,0,0),(5,34410,0,0,0,0),(5,34412,0,0,0,0),(6,17194,0,0,0,0),(6,17196,0,0,0,0),(6,17200,0,0,0,0),(6,17201,0,0,0,0),(6,17202,0,0,0,0),(6,17303,0,0,0,0),(6,17304,0,0,0,0),(6,17307,0,0,0,0),(6,17344,0,0,0,0);
