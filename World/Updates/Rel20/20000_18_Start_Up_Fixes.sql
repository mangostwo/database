-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_17_missing_gameobject_template';

  -- Set the new revision string
  SET @cNewRev = 'required_20000_18_Start_Up_Fixes';

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
    
    
--                Start Up Error Fixes - This kills all errors at this time (12th of February, 2015
    
-- ScriptDev2

UPDATE gameobject_template SET ScriptName='go_gordunni_trap' WHERE entry=144050;
UPDATE gameobject_template SET ScriptName='go_pirate_treasure' WHERE entry=142194;
UPDATE gameobject_template SET ScriptName='go_inconspicuous_landmark' WHERE entry=142189;
UPDATE creature_template SET ScriptName='boss_netherspite' WHERE Entry=17367;
UPDATE creature_template SET ScriptName='boss_netherspite' WHERE Entry=17368;
UPDATE creature_template SET ScriptName='boss_netherspite' WHERE Entry=17369;


-- EventAI
-- scripting done by SD2
UPDATE creature_template SET AIName='' WHERE Entry=5764;
-- incorrect value used, 48 should be used for stand state (was set to 47)
UPDATE creature_ai_scripts SET action1_type=48 WHERE id=840003;
UPDATE creature_ai_scripts SET action1_type=48 WHERE id=1029903;
UPDATE creature_ai_scripts SET action1_type=48 WHERE id=454207;


-- World Database

-- Developer items (Martin ...)
UPDATE item_template SET displayid=7016, sheath=3, DisenchantID=0 WHERE entry=17;
UPDATE item_template SET dmg_type2=0, sheath=3, DisenchantID=0 WHERE entry=192;
-- unused entries 
DELETE FROM gossip_menu WHERE entry IN (8671, 8685, 8689, 8690, 8691, 8706, 8707, 8708, 8709);

-- entry 6535 unused + text_id 7737 and 7738
-- need to locate which core these are from, if any .... looking like Cata

-- COPY OF REMOVED RECORDS
-- ===========================
-- *** To Be Used If The Records Are To Go Back Into The WOTLK/Three Database *** -- 

-- 6535 (gossip_menu entries)
-- '6535', '7737', '0', '1801' <-- condition does not exist
-- '6535', '7738', '0', '1802' <-- condition does not exist

-- INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (6535, 7738, 0, 1802);
-- INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (6535, 7737, 0, 1801);


-- 7737 npc_text record entry: 
-- '7737', 'The ashes from the burning wickerman radiate magical power.', NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0'

-- 7738 npc_text record entry: 
-- '7738', 'The ashes from the burning wickerman radiate magical power. You have already applied the ashes to your face.', NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0'

-- INSERT INTO npc_text (ID, text0_0, lang0, prob0, em0_0, em0_1, em0_2, em0_3, em0_4, em0_5, lang1, prob1, em1_0, em1_1, em1_2, em1_3, em1_4, em1_5, lang2, prob2, em2_0, em2_1, em2_2, em2_3, em2_4, em2_5, lang3, prob3, em3_0, em3_1, em3_2, em3_3, em3_4, em3_5, lang4, prob4, em4_0, em4_1, em4_2, em4_3, em4_4, em4_5, lang5, prob5, em5_0, em5_1, em5_2, em5_3, em5_4, em5_5, lang6, prob6, em6_0, em6_1, em6_2, em6_3, em6_4, em6_5, lang7, prob7, em7_0, em7_1, em7_2, em7_3, em7_4, em7_5) VALUES (7738, 'The ashes from the burning wickerman radiate magical power. You have already applied the ashes to your face.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- INSERT INTO npc_text (ID, text0_0, lang0, prob0, em0_0, em0_1, em0_2, em0_3, em0_4, em0_5, lang1, prob1, em1_0, em1_1, em1_2, em1_3, em1_4, em1_5, lang2, prob2, em2_0, em2_1, em2_2, em2_3, em2_4, em2_5, lang3, prob3, em3_0, em3_1, em3_2, em3_3, em3_4, em3_5, lang4, prob4, em4_0, em4_1, em4_2, em4_3, em4_4, em4_5, lang5, prob5, em5_0, em5_1, em5_2, em5_3, em5_4, em5_5, lang6, prob6, em6_0, em6_1, em6_2, em6_3, em6_4, em6_5, lang7, prob7, em7_0, em7_1, em7_2, em7_3, em7_4, em7_5) VALUES (7737, 'The ashes from the burning wickerman radiate magical power.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ===================================
-- END OF COPY OF REMOVED RECORDS

-- http://www.wowhead.com/quest=29376/a-time-to-build-up
-- Cata !!!!

DELETE FROM gossip_menu WHERE entry = 6535;
DELETE FROM npc_text WHERE id IN (7737, 7738);
-- Copy of records made above, just-in-case they do belong in WOTLK, but judging by the link, they are Cata
    
    
    
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
