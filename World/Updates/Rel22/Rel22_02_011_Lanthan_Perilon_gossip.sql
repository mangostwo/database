-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '02'; 
    SET @cOldContent = '010';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '02';
    SET @cNewContent = '011';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Lanthan Perilon gossip';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Lanthan Perilon gossip';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

	-- Set condition, Gossip should only be available to player with Quest:24960 active.
	SET @condition := (SELECT MAX(`condition_entry`) FROM `conditions`);
	DELETE FROM `conditions` WHERE `value1` IN (8325,8347);
	INSERT INTO `conditions` (`condition_entry`,`type`,`value1`,`value2`,`comments`) VALUES
	(@condition+1,8,8325,0,'NPC text display - check q.8325 completed'),
	(@condition+2,8,8347,0,'NPC text display - check q.8347 completed'),
	(@condition+3,9,8347,0,'NPC text display - check q.8347 taken'),
	(@condition+4,-2,@condition+2,@condition+3,'NPC text display - check q.8347 taken/completed');
	
	DELETE FROM `gossip_menu` WHERE `entry` = 6570;
	INSERT INTO `gossip_menu` (`entry`,`text_id`,`condition_id`) VALUES
	(6570,7868,0),
	(6570,7785,@condition+1),
	(6570,7869,@condition+4);
	
	UPDATE `creature_template` SET `GossipMenuId` = 6570 WHERE `Entry` = 15281;

	DELETE FROM `npc_text` WHERE `ID` = 7868;
	INSERT INTO`npc_text`(`ID`,`text0_0`,`text0_1`,`prob0`,`em0_0_delay`,`em0_0`,`em0_1_delay`,`em0_1`,`em0_2_delay`,`em0_2`,`text1_0`,`text1_1`,`em1_0_delay`,`em1_0`,`em1_1_delay`,`em1_1`,`em1_2_delay`,`em1_2`,`text2_0`,`text2_1`,`em2_0_delay`,`em2_0`,`em2_1_delay`,`em2_1`,`em2_2_delay`,`em2_2`,`text3_0`,`text3_1`,`em3_0_delay`,`em3_0`,`em3_1_delay`,`em3_1`,`em3_2_delay`,`em3_2`,`text4_0`,`text4_1`,`em4_0_delay`,`em4_0`,`em4_1_delay`,`em4_1`,`em4_2_delay`,`em4_2`,`text5_0`,`text5_1`,`em5_0_delay`,`em5_0`,`em5_1_delay`,`em5_1`,`em5_2_delay`,`em5_2`,`text6_0`,`text6_1`,`em6_0_delay`,`em6_0`,`em6_1_delay`,`em6_1`,`em6_2_delay`,`em6_2`,`text7_0`,`text7_1`,`em7_0_delay`,`em7_0`,`em7_1_delay`,`em7_1`,`em7_2_delay`,`em7_2`) VALUES
	(7868,'If you have not spoken to Magistrix Erona at the Sunspire. I recommend you do so immediately. There are pressing matters to attend to, and she - as do we all - need your help!','',1,0,1,0,0,0,0,'','',0,0,0,0,0,0,'','',0,0,0,0,0,0,'','',0,0,0,0,0,0,'','',0,0,0,0,0,0,'','',0,0,0,0,0,0,'','',0,0,0,0,0,0,'','',0,0,0,0,0,0);
	

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;
        ELSE
            COMMIT;
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;


