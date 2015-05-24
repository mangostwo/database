-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_24_Quest_Hypercapacitor_Gizmo'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_25_Tortured_skeleton_issue_fix';

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
          
	
    -- == Shadow Labyrinth: Tortured Skeleton should stand up when being aggro == --

    -- Use of an EnventAI
    UPDATE creature_template SET MechanicImmuneMask = 1  WHERE entry = 17916;
    DELETE FROM creature_ai_scripts where id = 1879701 AND creature_id = 18797;
    INSERT INTO creature_ai_scripts (id,creature_id,event_type,event_inverse_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action1_type,action1_param1,action1_param2,action1_param3,action2_type,action2_param1,action2_param2,action2_param3,action3_type,action3_param1,action3_param2,action3_param3,comment)
    VALUES
    (1879701,18797,4,0,100,6,0,0,0,0,47,0,0,0,0,0,0,0,0,0,0,0,'Tortured skeleton - stand on aggro');
    UPDATE creature_template SET AIName = 'EventAI' WHERE Entry = 18797;

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