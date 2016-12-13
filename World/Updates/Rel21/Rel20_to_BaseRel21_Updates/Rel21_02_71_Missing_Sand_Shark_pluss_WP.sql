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
    SET @cOldContent = '70';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '71';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Missing_Sand_Shark_pluss_WP';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Missing_Sand_Shark_added_pluss_WP';

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

-- Main credit goes to [072] ClassicDB Backoprt#2 Part1. (Thx to @Cala and @Tobschinski) with slight modifications for mangos db.
-- Add Sand Shark
DELETE FROM creature WHERE guid = 151045;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES ('151045','5435','1','1','1','0','0','3221.89','1710.46','-49.2366','-49.2366','300','0','0','903','0','0','2');

-- Waypoints 
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151045;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151045, (@POINT := @POINT + 1), 3195.662, 1723.264, -48.04173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3172.181, 1728.667, -46.73510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3159.840, 1742.105, -47.11641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3150.543, 1759.820, -48.98943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3145.209, 1779.996, -48.55008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3150.675, 1795.498, -43.96499, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3159.018, 1808.918, -46.86113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3147.042, 1829.820, -48.91264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3124.375, 1836.323, -49.30346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3110.177, 1853.608, -49.30346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3098.962, 1879.044, -49.19866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3099.791, 1899.643, -45.14495, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3093.299, 1918.567, -48.78092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3074.238, 1939.806, -49.20982, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3047.839, 1955.769, -49.31664, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3028.469, 1970.392, -49.24512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3019.160, 1982.827, -48.99512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2988.323, 1998.347, -49.14025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2980.851, 2004.864, -48.03909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2954.493, 2018.016, -47.80416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2925.328, 2045.097, -49.28268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2893.023, 2053.511, -49.19867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2865.849, 2054.294, -48.97533, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2843.767, 2055.249, -49.08995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2822.482, 2054.119, -48.85473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2788.695, 2062.917, -48.87340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2765.504, 2066.172, -48.06932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2788.695, 2062.917, -48.87340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2822.482, 2054.119, -48.85473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2843.767, 2055.249, -49.08995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2865.849, 2054.294, -48.97533, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2893.023, 2053.511, -49.19867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2925.328, 2045.097, -49.28268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2954.493, 2018.016, -47.80416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2980.851, 2004.864, -48.03909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 2988.323, 1998.347, -49.14025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3019.160, 1982.827, -48.99512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3028.469, 1970.392, -49.24512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3047.839, 1955.769, -49.31664, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3074.238, 1939.806, -49.20982, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3093.299, 1918.567, -48.78092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3099.791, 1899.643, -45.14495, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3098.962, 1879.044, -49.19866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3110.177, 1853.608, -49.30346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3124.375, 1836.323, -49.30346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3147.042, 1829.820, -48.91264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3159.018, 1808.918, -46.86113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3150.675, 1795.498, -43.96499, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3145.209, 1779.996, -48.55008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3150.505, 1759.881, -48.99666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3159.840, 1742.105, -47.11641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3172.181, 1728.667, -46.73510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3195.662, 1723.264, -48.04173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151045, (@POINT := @POINT + 1), 3222.932, 1722.388, -49.26390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    

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

