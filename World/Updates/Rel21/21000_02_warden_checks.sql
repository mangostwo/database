ALTER TABLE db_version CHANGE COLUMN `required_21000_01_Release21_initial` `required_21000_02_warden_checks` BIT;

-- version
INSERT IGNORE INTO `db_version` SET `Version` = 'MaNGOSTwo Database Rev 21000_02';


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `warden_checks`
-- ----------------------------
DROP TABLE IF EXISTS `warden_checks`;
CREATE TABLE `warden_checks` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` TINYINT(3) UNSIGNED DEFAULT NULL,
  `data` VARCHAR(48) DEFAULT '',
  `str` VARCHAR(20) DEFAULT '',
  `address` INT(10) UNSIGNED DEFAULT NULL,
  `length` TINYINT(3) UNSIGNED DEFAULT NULL,
  `result` VARCHAR(24) DEFAULT '',
  `comment` VARCHAR(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=790 DEFAULT CHARSET=utf8;

