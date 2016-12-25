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
    SET @cOldStructure = '03'; 
    SET @cOldContent = '08';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '09';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q.1059Reclaiming_the_Charred';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q.1059Reclaiming_the_Charred';

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

-- [222] q.1059 'Reclaiming the Charred Vale 2'
-- q.1059 'Reclaiming the Charred Vale 2'
DELETE FROM dbscripts_on_quest_end WHERE id = 1059;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1059,0,29,2,2,0,0,0,0,0,0,0,0,0,0,0,'npcFlags removed'),
(1059,1,0,0,0,0,0,0,2000000537,0,0,0,0,0,0,0,''),
(1059,2,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:iwaypoints');
UPDATE quest_template SET CompleteScript = 1059 WHERE entry = 1059;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000537 AND 2000000539;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000537, 'We must hurry.', 0, 0, 0, 1, NULL),
(2000000538, 'Spirits of the forest come forth and heed nature\'s call!', 0, 0, 0, 1, NULL),
(2000000539, 'Spirits of the forest, you are needed! Make haste to the Charred Vale!', 0, 0, 0, 25, NULL);

-- Falfindel Waywarder
UPDATE creature SET Spawndist = 0, MovementType = 0 WHERE id = 4048; -- movement will be set by q.
DELETE FROM creature_movement WHERE id = 51337;
UPDATE creature_template SET MovementType = 0 WHERE entry = 4048;
DELETE FROM creature_movement_template WHERE entry = 4048;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(4048, 1, -4524.24, -782.628, -41.5763, 0,0,0,0,0),
(4048, 2, -4520.69, -775.438, -41.0733, 0,0,0,0,0),
(4048, 3, -4514.55, -770.937, -40.0658, 0,0,0,0,0),
(4048, 4, -4503.63, -774.032, -40.224, 0,0,0,0,0),
(4048, 5, -4488.25, -767.98, -36.61, 27000,404801,0,0,0),
(4048, 6, -4499.17, -773.174, -39.449, 0,0,0,0,0),
(4048, 7, -4514.09, -771.136, -40.0971, 0,0,0,0,0),
(4048, 8, -4520.48, -775.049, -41.0191, 0,0,0,0,0),
(4048, 9, -4524.16, -782.978, -41.2406, 0,0,0,0,0),
(4048, 10, -4524.12, -788.099, -41.6929, 0,0,0,0,0),
(4048, 11, -4524.12, -788.099, -41.6929, 3000,404802,5.0091,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 404801 AND 404802;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(404801 ,1, 21,1,0,0,0,0x04,0,0,0,0,0,0,0,0,'Falfindel Waywarder - active'),
(404801, 2, 0, 0, 0, 0, 0, 0, 2000000538, 0, 0, 0, 0, 0, 0, 0, ''),
(404801, 4, 15, 6537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(404801, 6, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4479.45, -768.01, -37.36, 0, ''),
(404801, 7, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4486.55, -769.80, -37.23, 0, ''),
(404801, 8, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4484.95, -767.87, -36.61, 0, ''),
(404801, 9, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4484.90, -770.79, -37.62, 0, ''),
(404801, 10, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4484.07, -765.04, -35.74, 0, ''),
(404801, 11, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4485.88, -764.05, -35.19, 0, ''),
(404801, 14, 0, 0, 0, 0, 0, 0, 2000000539, 0, 0, 0, 0, 0, 0, 0, ''),
(404801, 13, 14, 6537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(404802, 1, 20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(404802, 1, 29,2,1,0,0,0,0,0,0,0,0,0,0,0,'npcFlags added'),
(404802 ,2, 21,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'Falfindel Waywarder - unactive');

-- Forest Spirit
UPDATE creature_template SET MovementType = 0 WHERE entry = 4059;
DELETE FROM creature_movement_template WHERE entry = 4059;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(4059, 1, -4484.5, -759, -33.57, 0, 405901, 0, 0, 0),
(4059, 2, -4484.5, -759, -33.57, 0, 0, 0, 0, 0),
(4059, 3, -4483, -755.56, -31.94, 0, 0, 0, 0, 0),
(4059, 4, -4481, -686.51, -14.39, 0, 0, 0, 0, 0),
(4059, 5, -4472, -571.90, 5.91, 40000, 0, 0, 0, 0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 405901;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(405901, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'RUN ON');



-- ACID script
-- q.1059 'Reclaiming the Charred Vale 2' UDB[222]
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 4059;
INSERT INTO `creature_ai_scripts` VALUES
(405901, 4059, 1, 0, 100, 0, 7500, 10500, 0, 0, 48, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Wisp - Start WP movement after 7 sec');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` = 4059;   
    

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

