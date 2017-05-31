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
    SET @cOldContent = '046';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '047';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q9294_Healing_the_Lake';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q9294_Healing_the_Lake';

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

-- q.9294 'Healing the Lake'
-- part at lake
-- Volatile Mutation - missing added
SET @GUID := (SELECT MAX(guid) FROM `creature`);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(@GUID+1, 16516, 530, 1, 1, 0, 0, -4059.08, -13711.4, 73.5015, 5.3435, 5, 0, 0, 42, 0, 0, 2);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(@GUID+1, 1, -4059.08, -13711.4, 73.5015, 5000, 1651601, 5.3435, 0, 0);
DELETE FROM db_scripts WHERE id = 1651601;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1651601,1,35,5,15,0,0,0,0,0,0,0,0,0,0,0,'SEND_AI_EVENT'),
(3,1651601,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle');

INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(8,13021,1,0,0,0,20239,71935,3 | 0x10,2000000633,0,0,0,0,0,0,0,'');
-- ending event

INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1,9294,1,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'NPCFlags removed'),
(1,9294,1,0,0,0,0,0,0,2000000634,0,0,0,0,0,0,0,''),
(1,9294,3,0,0,0,20227,84586,7 | 0x10,2000000635,0,0,0,0,0,0,0,''),
(1,9294,6,1,133,0,20227,84586,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9294,9,1,0,0,20227,84586,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9294,9,13,0,0,181370,20,2,0,0,0,0,0,0,0,0,''),
(1,9294,10,3,0,0,16516,@GUID+1,7 | 0x10,0,0,0,0,-4055.89,-13714.2,73.0501,100,''),
(1,9294,13,3,0,0,20227,84586,7 | 0x10,0,0,0,0,0,0,0,4.46927,''),
(1,9294,13,20,0,0,16516,@GUID+1,7 | 0x10,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1,9294,14,0,0,0,20227,84586,7 | 0x10,2000000636,0,0,0,0,0,0,0,''),
(1,9294,15,1,133,0,20227,84586,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9294,19,1,0,0,20227,84586,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9294,19,15,35068,0,16516,@GUID+1,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9294,21,0,0,0,20227,84586,7 | 0x10,2000000637,0,0,0,0,0,0,0,''),
(1,9294,21,3,0,0,16516,@GUID+1,7 | 0x10,0,0,0,0,-4050.97,-13711.8,73.7115,1.35348,''),
(1,9294,23,3,0,0,16516,@GUID+1,7 | 0x10,0,0,0,0,-4049.35,-13698.3,72.7258,1.15871,''),
(1,9294,25,3,0,0,20227,84586,7 | 0x10,0,0,0,0,0,0,0,3.26976,''),
(1,9294,26,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'NPCFlags added'),
(1,9294,26,18,0,0,16516,@GUID+1,7 | 0x10,0,0,0,0,0,0,0,0,'');
UPDATE quest_template SET CompleteScript = 9294 WHERE entry = 9294;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000633 AND 2000000637;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000633, 'As the neutralizing agent mixes into the waters of the lake, the water that was irradiated by the crystal seems to clear.', 0, 2, 0, 0, NULL),
(2000000634, 'Tedon, go ahead and try the neutralizing agent on the mutated creature.', 0, 0, 0, 1, NULL),
(2000000635, 'Looks like it\'s time to let you out of this cage.', 0, 0, 0, 1, NULL),
(2000000636, 'Now, to put the neutralizing agent on it...', 0, 0, 0, 0, NULL),
(2000000637, 'Success!', 0, 0, 0, 71, NULL);

-- Apprentice Tedon
-- Quest req. -- 9294
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 20227;
INSERT INTO `creature_ai_scripts` VALUES
('2022701','20227','30','0','100','1','5','16516','0','0','18','256','10','0','0','0','0','0','0','0','0','0','Apprentice Meledor - change targets unitFlag on Receive AI Event');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` = 20227;
    

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

