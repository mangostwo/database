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
    SET @cOldStructure = '07'; 
    SET @cOldContent = '035';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '036';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Event NPC and object updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Event NPC and object updates';

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

    SET @guid := (SELECT MAX(guid) FROM `gameobject`);
	-- Add missing goldshire pumpkins and a few water buckets around the water barrel.
	INSERT INTO `gameobject` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
	(@guid+1,186614,-9433.631,61.946,56.573,0.58519,0.241407,-0.511511,25,255,1),
	(@guid+2,186614,-9433.751,62.583,56.573,0.68513,0.253407,-0.591511,25,255,1),
	(@guid+3,186615,-9432.897,62.883 ,56.573 ,0.68513 ,0.253407,-0.14151,25,255,1),
	(@guid+4,180405,-9452.66 ,42.7137,57.0306,0,0.72516,0.0563,25,255,1),
	(@guid+5,180406,-9461.07,46.59,56.6073,1.82325,0.9345,0.08463,25,255,1),
	(@guid+6,180406,-9463,91.3957,73.8382,1.81461,0.187848,-0.615869,25,255,1),
	(@guid+7,180407,-9463.12,96.6898,73.832,5.46279,0.898791,-0.617042,25,255,1),
	(@guid+8,180405,-9457.08,96.9598,73.8402,0,-0.8573,-0.13398,25,255,1),
	(@guid+9,180407,-9456.95,91.9268,73.8134,5.32928,-0.55978,-0.98837,25,255,1),
	(@guid+10,180407,-9464.65,79.1945,57.2862,1.48712,0.1769,0.73234,25,255,1),
	(@guid+11,180407,-9452.74,31.4145,58.0487,1.26642,-0.98179,-0.7163,25,255,1),
	(@guid+12,180405,-9454.51,15.029,58.0487,1.26642,-0.98179,-0.7163,25,255,1);

	-- Added the above objects into correct event.
	INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUE 
	(@guid+1,12),
	(@guid+2,12),
	(@guid+3,12),
	(@guid+4,12),
	(@guid+5,12),
	(@guid+6,12),
	(@guid+7,12),
	(@guid+8,12),
	(@guid+9,12),
	(@guid+10,12),
	(@guid+11,12),
	(@guid+12,12);

	-- Remove extra Forsaken Commoner spawns.
	DELETE FROM `creature` WHERE `guid` IN (11002,86846,11003,11004);

	-- Removed extra Forsaken Commoner event spawns.
	DELETE FROM `game_event_creature` WHERE `guid` IN (11003,11004);
	-- Fix Forsaken Commoner event models.
	UPDATE `creature` SET `modelid` = 16444 WHERE guid IN (94932,94931,94930,94933);
	UPDATE `creature` SET `modelid` = 18810 WHERE guid IN (86235);
	UPDATE `creature` SET `modelid` = 18811 WHERE guid IN (86355,89422,86236);
	UPDATE `creature` SET `modelid` = 18875 WHERE guid IN (91575,91574);
	UPDATE `creature` SET `modelid` = 18876 WHERE guid IN (91576,91573);
	UPDATE `creature` SET `modelid` = 22380 WHERE guid IN (11001);
	UPDATE `creature` SET `modelid` = 22381 WHERE guid IN (85986,86847,86168);


	-- Lakeshire Inn apple bobbing location updated
	-- Provided by @fly-man 
	UPDATE `gameobject` SET `position_y` = -2148.561035 WHERE `guid` = 39881;

	-- Update position of water barrel.
	UPDATE `gameobject` SET `position_x` = -9432.6875, `position_y` = 60.5124, `position_z` =56.573 WHERE `guid` = 300157;
    

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

