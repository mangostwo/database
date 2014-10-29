/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_learn_spell` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `spell_learn_spell` VALUES (53428,53341,1),(5784,33388,1),(13819,33388,1),(23161,33391,1),(23214,33391,1),(34767,33391,1),(34769,33388,1),(53428,53343,1),(17002,24867,0),(24866,24864,0),(33872,47179,0),(33873,47180,0),(33943,34090,1),(58984,21009,1),(56815,56816,0),(20271,21084,1),(53407,21084,1),(53408,21084,1);
