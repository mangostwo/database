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
    SET @cOldContent = '012';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '013';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'More Lunar event Updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'More Lunar event Updates';

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

-- Added target position to each teleport spell in Lunar Festival
DELETE FROM `spell_target_position` WHERE `id` IN (26448, 26454, 26452, 26450, 26453, 26456, 26455);
INSERT INTO `spell_target_position` VALUES
(26448, 1, 7571.95, -2202.04, 474.86, 5.4358),  -- To Moonglade
(26454, 0, -8748.48, 1073.61, 90.4898, 5.03789),  -- To Stormwind
(26452, 0, -4663, -955.663, 500.377, 0.722862),  -- To Ironforge
(26450, 1, 10150.1, 2602, 1330.83, 4.80894),  -- To Darnassus
(26453, 1, 1982.9, -4255.62, 31.6692, 3.31984),  -- To Orgrimmar
(26456, 0, 1642.01, 239.002, 62.5918, 3.02316),  -- To Undercity
(26455, 1, -1031.45, -230.867, 160.14, 3.28358);  -- To Thunderbluff

-- Added script to cast teleport spell on players
-- All teleports are handled by the same script triggerd by gameobject 300058 which is target by Lunar Invitation' spell
-- Selection of which teleports will be used is done by the nearby NPC (buddies) which are different for each teleport zone
DELETE FROM `db_scripts` WHERE `id` = 300058;
INSERT INTO `db_scripts` (`script_type`,id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(7,300058, 0, 15, 26448, 0, 15892, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival - Teleports Moonglade - Alliance'),
(7,300058, 0, 15, 26448, 0, 15891, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival - Teleports Moonglade - Horde'),
(7,300058, 0, 15, 26454, 0, 15694, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival - Teleports Storwimnd'),
(7,300058, 0, 15, 26452, 0, 15906, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival - Teleports Ironforge'),
(7,300058, 0, 15, 26450, 0, 15905, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival - Teleports Darnassus'),
(7,300058, 0, 15, 26453, 0, 15908, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival - Teleports Orgrimmar'),
(7,300058, 0, 15, 26456, 0, 15907, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival - Teleports Undercity'),
(7,300058, 0, 15, 26455, 0, 15719, 7, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival - Teleports Thunderbluff');
-- Added script target for Lunar Invitation spell to trigger teleport script
DELETE FROM `spell_script_target` WHERE `entry` = 26373;
INSERT INTO `spell_script_target` VALUES
(26373, 0, 300058, 0);

-- Minor NPC update.
UPDATE `creature` SET `spawndist` = 0, `curhealth` = 5000, `curmana` = 5751 WHERE `guid` = 200004;


SET @GUID_NPC := 152964;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID_NPC + 1 AND @GUID_NPC + 8;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(@GUID_NPC + 1, 15895, 1, 15871, 0, 10140.4, 2579.71, 1323.37, 4.38697, 0, 0, 5800, 5013, 0, 0),
(@GUID_NPC + 2, 15898, 1, 15870, 0, 10141.7, 2604.31, 1330.83, 6.17347, 0, 0, 1500, 5013, 0, 0),
(@GUID_NPC + 3, 15897, 1, 15294, 0, 10150.1, 2602.49, 1330.83, 4.36754, 0, 0, 4120, 0, 0, 0),
(@GUID_NPC + 4, 15893, 1, 0, 0, 10150.9, 2602.31, 1330.91, 2.47837, 0, 0, 4120, 0, 0, 0),
(@GUID_NPC + 5, 15894, 1, 0, 0, 10150.8, 2602.45, 1330.91, 6.23082, 0, 0, 4120, 0, 0, 0),
(@GUID_NPC + 6, 15892, 1, 0, 0, 10149.8, 2607.96, 1330.83, 4.84179, 0, 0, 5725, 0, 0, 0),
(@GUID_NPC + 7, 15892, 1, 0, 0, 10155.8, 2601.27, 1330.83, 2.8211, 0, 0, 5725, 0, 0, 0),
(@GUID_NPC + 8, 15892, 1, 0, 0, 10145.7, 2598.17, 1330.83, 0.767279, 0, 0, 5725, 0, 0, 0);


DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @GUID_NPC + 1 AND @GUID_NPC + 8;
INSERT INTO `game_event_creature` VALUES
(@GUID_NPC + 1, 7),
(@GUID_NPC + 2, 7),
(@GUID_NPC + 3, 7),
(@GUID_NPC + 4, 7),
(@GUID_NPC + 5, 7),
(@GUID_NPC + 6, 7),
(@GUID_NPC + 7, 7),
(@GUID_NPC + 8, 7);

DELETE FROM `creature_addon` WHERE `guid` = @GUID_NPC + 3;
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `emote`, `moveflags`, `auras`) VALUES
(@GUID_NPC + 3, 0, 0, 1, 0, 0, '25824');

   

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

