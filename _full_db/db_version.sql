/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` varchar(120) DEFAULT NULL,
  `creature_ai_version` varchar(120) DEFAULT NULL,
  `cache_id` int(10) DEFAULT '0',
  `required_20141028_mangos_spell_template` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Used DB version notes';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `db_version` VALUES ('UDB 0.12.2 (407) for CMaNGOS 12735 with SD2 SQL for rev. 3041','ACID 3.3.5a (Wrath of the Lich King) for CMaNGOS-WOTLK (3.3.5a Client)',407,NULL);
