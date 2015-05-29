-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_26_Fel_Stalker_issue_fix'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_27_Terl_Arakor_Wetlands_gossip_text';

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

    
    -- ============ Terl Arakor missing gossip text added ============ --
    
    -- npc_text
    DELETE FROM npc_text WHERE ID = 16528;
    INSERT INTO npc_text (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES ('16528', 'This is MY WAGON!$B$BMINE!', '', '0', '1', '0', '0', '0', '0', '0', '0', '', 'On my way down here from Dun Algaz I saw a gnoll hunting Threshadons in the middle of a lake. If you\'ve never seen a dog try to use a spear, you\'re in for a treat!', '0', '1', '0', '0', '0', '0', '0', '0', '', 'I was up at Whelgar\'s a few days ago attempting to...er...liberate...some titan relics from the bones of the dead raptors, and I saw him! Sarltooth lives! Well, he\'s undead, so I guess he doesn\'t live, but he exists. Sarltooth exists!', '0', '1', '0', '0', '0', '0', '0', '0', 'They say that the raptor matriarch lives deep within Raptor Ridge, protecting her clutch of eggs.', '', '0', '1', '0', '0', '0', '0', '0', '0', 'The Dragonmaw are attempting to push out of the Angerfang Encampment and are already raiding the caravan to the east. They\'ve called in two powerful warriors who are leading the charge. If you\'re up for a challenge, you might find them at the Encampment, planning and strategizing and doing other evil Orcish things.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
    
    -- gossip_menu
    DELETE FROM gossip_menu WHERE entry = 11788;
    INSERT INTO gossip_menu (`entry`, `text_id`, `script_id`, `condition_id`) VALUES ('11788', '16528', '0', '0');
      
    -- Link gossip text to NPC
    UPDATE creature_template SET `GossipMenuId`='11788' WHERE `Entry`='2153';

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