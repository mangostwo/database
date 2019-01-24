-- ----------------------------------------
-- Added to prevent timeout's while loading
-- ----------------------------------------
SET GLOBAL net_read_timeout=30;
SET GLOBAL net_write_timeout=60;
SET GLOBAL net_buffer_length=1000000; 
SET GLOBAL max_allowed_packet=1000000000;
SET GLOBAL connect_timeout=10000000;

-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.3)
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '10'; 
    SET @cOldContent = '0013';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '0014';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'various ai script updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'various ai script updates';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;

        -- UPDATE THE DB VERSION
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
        SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

-- Set EventAI.
UPDATE `creature_template` set `AIName` = 'EventAI' where `Entry` IN (22011,22012,22019,22335);
-- thereal Thief - fix spell id for Disarm ability.
UPDATE `creature_ai_scripts` SET `action1_param1` = 30013, `action1_param2` = 1, `action1_param3` = 0 WHERE `id` = 1654403 AND `creature_id` = 16544;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (22011,22012,22019,22335,16345);
INSERT INTO `creature_ai_scripts` VALUES
-- Corok the Mighty scripted.
(2201101,22011,9,0,100,1,0,5,10000,12000,11,12612,0,0,0,0,0,0,0,0,0,0,'Corok the Mighty - Cast Stomp'),
(2201102,22011,9,0,100,1,0,10,8000,15000,11,15550,0,0,0,0,0,0,0,0,0,0,'Corok the Mighty - Cast Trample'),
-- Chancellor Bloodleaf scripted.
(2201201,22012,4,0,100,0,0,0,0,0,21,1,0,0,22,1,0,0,0,0,0,0,'Chancellor Bloodleaf - Enable Dynamic Movement and Set Phase 1 on Aggro'),
(2201202,22012,9,5,100,1,0,30,5000,7000,11,15790,1,0,0,0,0,0,0,0,0,0,'Chancellor Bloodleaf - Cast Arcane Missiles (Phase 1)'),
(2201203,22012,9,5,100,1,0,10,5000,10000,11,34517,0,0,0,0,0,0,0,0,0,0,'Chancellor Bloodleaf - Cast Arcane Explosion (Phase 1)'),
(2201204,22012,9,5,100,1,9,80,1000,1000,21,1,0,0,0,0,0,0,0,0,0,0,'Chancellor Bloodleaf - Enable Dynamic Movement at 9-80 Yards (Phase 1)'),
(2201205,22012,9,0,100,1,0,8,1000,1000,21,0,0,0,0,0,0,0,0,0,0,0,'Chancellor Bloodleaf - Disable Dynamic Movement at 0-8 Yards'),
(2201206,22012,3,5,100,0,7,0,0,0,21,0,0,0,22,2,0,0,0,0,0,0,'Chancellor Bloodleaf - Disable Dynamic Movement and Set Phase 2 at 7% MP (Phase 1)'),
(2201207,22012,3,3,100,1,100,15,1000,1000,22,1,0,0,0,0,0,0,0,0,0,0,'Chancellor Bloodleaf - Set Phase 1 at 15% MP (Phase 2)'),
(2201208,22012,7,0,100,0,0,0,0,0,22,0,0,0,0,0,0,0,0,0,0,0,'Chancellor Bloodleaf - Set Phase to 0 on Evade'),
-- Kolphis Darkscale scripted.
(2201901,22019,9,0,100,1,0,5,7000,13000,11,17207,0,0,0,0,0,0,0,0,0,0,'Kolphis Darkscale - Cast Whirlwind'),
(2201902,22019,2,0,100,0,25,0,0,0,11,8599,0,0,0,0,0,0,0,0,0,0,'Kolphis Darkscale - Cast Enrage at 25% HP'),
-- Mushrom Spell Effect scripted.
(2233501,22335,11,0,100,3,0,0,0,0,11,38730,0,0,0,0,0,0,0,0,0,0,'Mushrom Spell Effect - Cast Refreshing Mist on Spawn'),
-- Shadowpine Catlord scripted.
(1634501,16345,11,0,100,0,0,0,0,0,11,28904,0,1,0,0,0,0,0,0,0,0,'Shadowpine Catlord  - Cast Summon Ghostclaw Lynx on Spawn'),
(1634502,16345,16,0,100,1,28902,30,20000,40000,11,28902,6,0,0,0,0,0,0,0,0,0,'Shadowpine Catlord - Cast Bloodlust on Friendlies');
    

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
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
		ELSE
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
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

