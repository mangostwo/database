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
    SET @cOldStructure = '06'; 
    SET @cOldContent = '038';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '039';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Tuluun_update';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Tuluun_update';

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

    -- Tuluun
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 61721;
UPDATE creature_template SET movementType = 2 WHERE entry = 17212;
DELETE FROM creature_movement WHERE id = 61721;
DELETE FROM creature_movement_template WHERE entry = 17212;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17212, 1, -4162.33, -12456.1, 44.3411, 120000, 0, 4.13643, 0, 0),
(17212, 2, -4162.33, -12456.1, 44.3411, 15000, 1721201, 4.13643, 0, 0),
(17212, 3, -4162.33, -12456.1, 44.3411, 300000, 0, 4.13643, 0, 0),
(17212, 4, -4162.33, -12456.1, 44.3411, 13000, 1721202, 4.13643, 0, 0),
(17212, 5, -4162.33, -12456.1, 44.3411, 400000, 0, 4.13643, 0, 0),
(17212, 6, -4162.33, -12456.1, 44.3411, 18000, 1721203, 4.13643, 0, 0),
(17212, 7, -4162.33, -12456.1, 44.3411, 300000, 0, 4.13643, 0, 0);
DELETE FROM db_scripts WHERE id BETWEEN 1721201 AND 1721203;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1721201,1,1,0,0,17228,63770,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721201,3,36,0,0,17228,63770,3 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721201,4,36,0,0,17228,63770,1 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721201,6,0,0,0,17228,63770,3 | 0x10,2000000663,0,0,0,0,0,0,0,''),
(3,1721201,10,0,0,0,17228,63770,3 | 0x10,2000000664,0,0,0,0,0,0,0,''),
(3,1721201,13,36,5.67608,0,17228,63770,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721201,15,1,234,0,17228,63770,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721202,1,1,0,0,17228,63770,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721202,3,36,0,0,17228,63770,3 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721202,4,36,0,0,17228,63770,1 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721202,6,0,0,0,17228,63770,3 | 0x10,2000000662,0,0,0,0,0,0,0,''),
(3,1721202,10,36,5.67608,0,17228,63770,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721202,13,1,234,0,17228,63770,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721203,1,1,0,0,17228,63770,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721203,3,3,0,0,17228,63770,7 | 0x10,0,0,0,0,-4160.31,-12458.7,44.5919,2.08552,''),
(3,1721203,6,36,0,0,17228,63770,1 | 0x10,0,0,0,0,0,0,0,0,''),
(3,1721203,9,0,0,0,17228,63770,3 | 0x10,2000000665,0,0,0,0,0,0,0,''),
(3,1721203,12,3,0,0,17228,63770,7 | 0x10,0,0,0,0,-4149.24,-12465,45.3466,5.67608,''),
(3,1721203,19,1,234,0,17228,63770,7 | 0x10,0,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000662 AND 2000000665;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES 
(2000000662,'Turning to face Tuluun, the Draenei Artificer sneers contemptuously.',0,2,0,0,NULL),
(2000000663,'How can I be expected to get any work done with that thing spreading its heresy?',0,0,0,0,NULL),
(2000000664,'%s sighs disgustedly as he turns back to his work.',0,2,0,0,NULL),
(2000000665,'We do not need your kind here.',0,0,0,0,NULL);
    

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

