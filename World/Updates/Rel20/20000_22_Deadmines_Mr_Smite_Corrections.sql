-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_21_Tutenkash_Gong_fix'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_22_Deadmines_Mr_Smite_Corrections';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

 
  -- Only Proceed if the old values match
  IF @cThisRev = @cOldRev THEN
    -- Make this all a single transaction
    START TRANSACTION;

    -- Apply the Version Change from Old Version to New Version
    SET @query = CONCAT('ALTER TABLE db_version CHANGE COLUMN ',@cOldRev, ' ' ,@cNewRev,' bit;');
    PREPARE stmt1 FROM @query;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
    -- The Above block is required for making table changes

    -- -- -- -- Normal Update / Insert / Delete statements will go here  -- -- -- -- --
            

    -- Add creature linking to Mr. Smite's adds (GUID = 79345 and 79346)
    -- This also starts the fight if you add or attack his adds at the bottom of the ramp (blizzlike)

    DELETE FROM `creature_linking` where `guid` IN (79345,79346) and master_guid = 79337;

    INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`)
    VALUES
        (79345, 79337, 1167),
        (79346, 79337, 1167);

    -- Changed Mr. Smite's faction ID to another Defias Brotherhood faction ID where he wouldn't add the nearby pirates on combat start
    -- Reference: https://github.com/cmangos/issues/wiki/FactionTemplate.dbc
    UPDATE `creature_template` SET `FactionAlliance`='27', `FactionHorde`='27' WHERE `Entry`='646';

    -- Changed Mr. Smite's orientation and position
    UPDATE `creature` SET `position_x`='-24.733', `position_y`='-798.865', `position_z`='19.4144', `orientation`='0.750789' WHERE `guid`='79337';
     
     
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
