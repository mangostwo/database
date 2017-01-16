-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_21000_01_Release21_initial'; 

  -- Set the new revision string
  SET @cNewRev = 'required_21000_02_warden_checks';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

 
  -- Only Proceed if the old values match
  IF @cThisRev = @cOldRev THEN
    -- Make this all a single transaction
    START TRANSACTION;

	-- version
	INSERT IGNORE INTO `db_version` SET `Version` = 'MaNGOSTwo Database Rev 21000_02';

    -- Apply the Version Change from Old Version to New Version
    SET @query = CONCAT('ALTER TABLE db_version CHANGE COLUMN ',@cOldRev, ' ' ,@cNewRev,' bit;');
    PREPARE stmt1 FROM @query;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
    -- The Above block is required for making table changes

    -- -- -- -- Normal Update / Insert / Delete statements will go here  -- -- -- -- --
          
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
     
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    
    -- If we get here ok, commit the changes
    IF bRollback = TRUE THEN
      ROLLBACK;
      SELECT '* UPDATE FAILED *' AS 'Status',@cThisRev AS 'DB is on Version';
    ELSE
      COMMIT;
      SELECT '* UPDATE COMPLETE *' AS 'Status',@cNewRev AS 'DB is now on Version';
    END IF;
  ELSE
    SELECT '* UPDATE SKIPPED *' AS 'Status',@cOldRev AS 'Required Version',@cThisRev AS 'Found Version';
  END IF;

END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;
