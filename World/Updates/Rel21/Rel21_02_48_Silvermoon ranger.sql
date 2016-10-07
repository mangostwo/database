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
    SET @cOldStructure = '02'; 
    SET @cOldContent = '47';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '48';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Silvermoon ranger';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Silvermoon ranger';

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
-- UDB [165] Silvermoon Ranger UPDATE
-- Silvermoon City
 -- targets for 'Shoot Bow' corrected
 DELETE FROM spell_script_target WHERE entry IN (29120,29121,29122);
 INSERT INTO spell_script_target (entry, type, targetEntry, inverseEffectMask) VALUES 
 (29120, 1, 16897, 0),
 (29121, 1, 16899, 0),
 (29122, 1, 16898, 0);
 
 -- Silvermoon Ranger
 UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid IN (64950,64951,64952,64953);
 DELETE FROM creature_movement WHERE id IN (64950,64951,64952,64953);
 INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
 (64950,1,9838.61,-7405.78,13.702,90000,1814701,1.13446,0,0),
 (64951,1,9833.02,-7399.31,13.6929,70000,1814702,1.02974,0,0),
 (64952,1,9867.85,-7406.05,13.5941,120000,1814703,1.74533,0,0),
 (64953,1,9931.92,-7423.83,12.4414,27000,1814704,0.663225,0,0);
 DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 1814701 AND 1814704; 
 INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
 (1814701,3,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814701,7,1,274,0,0,0,0,1,71,0,0,0,0,0,0,''),
 (1814701,14,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814701,29,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814701,31,0,0,0,0,0,0,2000000482,2000000483,2000000484,2000000485,0,0,0,0,''),
 (1814701,53,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814701,79,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814702,1,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814702,16,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814702,35,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814702,58,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814702,61,1,1,0,0,0,0,274,71,0,0,0,0,0,0,''),
 (1814703,4,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814703,8,1,274,0,0,0,0,1,71,0,0,0,0,0,0,''),
 (1814703,16,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814703,36,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814703,40,1,274,0,0,0,0,1,71,0,0,0,0,0,0,''),
 (1814703,73,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814703,76,0,0,0,0,0,0,2000000483,2000000484,2000000485,2000000482,0,0,0,0,''),
 (1814703,90,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814704,2,15,29122,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814704,13,15,29122,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
 (1814704,21,15,29122,0,0,0,0x08,0,0,0,0,0,0,0,0,'');
 DELETE FROM db_script_string WHERE entry BETWEEN 2000000482 AND 2000000485;
 INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
 (2000000482,'What a beautiful shot!',0,0,0,0,NULL),
 (2000000483,'Hah! Bullseye!',0,0,0,0,NULL),
 (2000000484,'Agh... a chill ran up my spine.',0,0,0,0,NULL),
 (2000000485,'They\'ll see the light, I hope.',0,0,0,0,NULL);
 
 -- Honor Hold Target Dummy Right -- correct spawn point
 UPDATE creature_template SET InhabitType = 4 WHERE entry = 16898;
 UPDATE creature SET position_x = 9943.406, position_y = -7418.763, position_z = 13.46426, Spawndist = 0, MovementType = 0 WHERE guid = 58460;
    

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

