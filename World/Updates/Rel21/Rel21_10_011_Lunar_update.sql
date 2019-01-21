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
    SET @cOldContent = '010';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '011';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Lunar update';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Lunar update';

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

-- Add missing Greater Moonlight target GO.
SET @GO_guid := (SELECT MAX(`guid`) FROM `gameobject`); 
DELETE FROM `gameobject` WHERE `id` = 300058;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GO_guid+1,300058,1,-1031.45,-230.867,160.14,3.28358,0,0,0.997481,-0.0709363,25,100,1),
(@GO_guid+2,300058,0,1642.01,239.002,62.5918,3.02316,0,0,0.998247,0.0591816,25,100,1),
(@GO_guid+3,300058,1,1982.9,-4255.62,31.6692,3.31984,0,0,0.996031,-0.0890062,25,100,1),
(@GO_guid+4,300058,1,10150.1,2602,1330.83,4.80894,0,0,0.672159,-0.740407,25,100,1),
(@GO_guid+5,300058,0,-4663,-955.663,500.377,0.722862,0,0,0.353613,0.935392,25,100,1),
(@GO_guid+6,300058,0,-8748.48,1073.61,90.4898,5.03789,0,0,0.583186,-0.812338,25,100,1),
(@GO_guid+7,300058,1,7603.94,-2211.17,471.606,3.78647,0,0,0.948466,-0.316878,25,100,1),
(@GO_guid+8,300058,1,7575.26,-2238.68,469.858,1.03679,0,0,0.495486,0.868616,25,100,1),
(@GO_guid+9,300058,1,7595.67,-2246.32,466.965,1.30382,0,0,0.606707,0.794925,25,100,1),
(@GO_guid+10,300058,1,7610.97,-2228.92,468.71,2.96651,0,0,0.996171,0.0874282,25,100,1),
(@GO_guid+11,300058,1,7570.31,-2220.8,473.445,0.357419,0,0,0.17776,0.984074,25,100,1),
(@GO_guid+12,300058,1,7585.47,-2205.31,475.281,4.91744,0,0,0.631024,-0.775763,25,100,1);

INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES 
(@GO_guid+1,7),
(@GO_guid+2,7),
(@GO_guid+3,7),
(@GO_guid+4,7),
(@GO_guid+5,7),
(@GO_guid+6,7),
(@GO_guid+7,7),
(@GO_guid+8,7),
(@GO_guid+9,7),
(@GO_guid+10,7),
(@GO_guid+11,7),
(@GO_guid+12,7);

-- Added missing addon for NPC 15607 (Elder Farwhisper)
DELETE FROM `creature_template_addon` WHERE `entry` = 15607;
INSERT INTO `creature_template_addon` VALUES
(15607, 0, 0, 1, 16, 0, 0, '25824');

-- Added missing spawn for 15607 involved in Lunar Festival
SET @NPC_guid := (SELECT MAX(`guid`) FROM `creature`);
INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation) VALUES
(@NPC_guid+1, 15607, 329, 3705.5, -3466.29, 130.77, 6.22097);

INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(@NPC_guid+1, 7);
    

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

