-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_19_Synching_of_EventAI_Action_Types'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_20_Quest_Hunting_for_Ectoplasm_fix';

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

        
    -- IMPORTANT! THIS REQUIRES THE CURRENT VERSION OF THE SERVER CORE !!!!!!!!!!!!!
    -- ===============================================================
    -- This makes use of the condition: CONDITION_GAMEOBJECT_IN_RANGE 38 (see GameObject.h and GameObject.cpp)

    -- Quest: Hunting for Ectoplasm 

    -- conditions table
    -- Create new record for Ectoplasmic Distiller using the new condition (CONDITION_GAMEOBJECT_IN_RANGE)
    DELETE FROM conditions WHERE condition_entry = 1733 AND type = 38;
    INSERT INTO conditions (condition_entry, type, value1, value2) VALUES (1733, 38, 181054, 12);

    -- creature_loot_template
    -- Tortured Sentinel (http://www.wowhead.com/?npc=12179)
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=12179 and item=21937;

    -- Tortured Druid (http://www.wowhead.com/?npc=12178)
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=12178 and item=21937;

    -- Suffering Highborne (http://www.wowhead.com/?npc=7523)
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=7523 and item=21936;

    -- Anguished Highborne (http://www.wowhead.com/?npc=7524
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=7524 and item=21936;

    -- Eyeless Watcher (http://www.wowhead.com/?npc=8539)
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=8539 and item=23198;

    -- Death Singer (http://www.wowhead.com/?npc=8542)
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=8542 and item=21935;

    -- Hate Shrieker (http://www.wowhead.com/?npc=8541)
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=8541 and item=21935;

    -- Unseen Servant (http://www.wowhead.com/?npc=8538)
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=8538 and item=21935;

    -- Torn Screamer (http://www.wowhead.com/?npc=8540)
    UPDATE creature_loot_template SET condition_id=1733 WHERE entry=8540 and item=21935;
     
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
