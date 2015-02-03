-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_01_Quest_Template_changes';

  -- Set the new revision string
  SET @cNewRev = 'required_20000_02_Tutenkash_Gong_scripted';

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

    -- Tuten'kash gong scripted (Razorfen Downs

    -- assign scriptdev script to the gong
    -- Remove and re-create the gong object
    DELETE FROM gameobject_template WHERE entry = 148917;
    INSERT INTO gameobject_template (entry, type, displayId, name, faction, flags, size, data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, mingold, maxgold, ScriptName) VALUES ('148917', '10', '2372', 'Gong', '0', '4', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'go_tutenkash_gong');

    -- add Creature Abilites (creature_ai_scripts)

    -- Tome Fiend

    -- enable scripts
    UPDATE creature_template SET AIName= 'EventAI', ScriptName = 'npc_tomb_creature' WHERE Entry= 7349;

    -- Poison: http://www.wowhead.com/spell=744
    DELETE FROM creature_ai_scripts WHERE creature_id = 7349;
    INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES ('734901', '7349', '0', '0', '100', '1', '3000', '10000', '120000', '125000', '11', '744', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Tome Fiend - Cast Poison');

    -- Tome Reaver

    -- enable scripts
    UPDATE creature_template SET AIName= 'EventAI', ScriptName='npc_tomb_creature' WHERE Entry= 7351;

    -- Virulent Poison: http://www.wowhead.com/spell=12251
    DELETE FROM creature_ai_scripts WHERE creature_id = 7351;
    INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES ('735102', '7351', '0', '0', '100', '1', '2000', '5000', '10000', '20000', '11', '12251', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Tome Reaver - Cast Virulent Poison');

    -- Tuten'kash

    -- enable scripts
    UPDATE creature_template SET AIName= 'EventAI' WHERE Entry= 7355;

    -- Virulent Poison: http://www.wowhead.com/spell=12251
    DELETE FROM creature_ai_scripts WHERE creature_id = 7355;
    INSERT INTO creature_ai_scripts (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment) VALUES ('735503', '7355', '0', '0', '100', '1', '2000', '5000', '10000', '20000', '11', '12251', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Tuten Kash - Cast Virulent Poison');

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
