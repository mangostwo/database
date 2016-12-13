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
    SET @cOldContent = '56';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '57';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Dreadcaller_Waypoints';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Dreadcaller_Waypoints';

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
-- Updated from M1
-- Dreadcaller 1 Pathing
SET @NPC := 69499;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-558.5822,`position_y`=2003.227,`position_z`=98.30606 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(@NPC,1,-558.5822,2003.227,98.30606,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,2,-557.4218,2005.291,99.07405,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,3,-559.7542,2056.054,96.38632,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,4,-540.9093,2062.701,104.2178,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,5,-538.0739,2083.637,102.7935,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,6,-531.9629,2100.469,104.145,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,7,-540.8042,2121.509,97.44407,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,8,-542.6715,2139.263,94.42299,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,9,-542.0955,2125.005,96.38588,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,10,-531.0101,2105.611,103.8495,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,11,-533.4691,2097.096,103.5421,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,12,-539.8324,2066.038,103.8721,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,13,-559.5454,2057.871,96.58672,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,14,-557.4636,2005.37,98.92694,0,0,0,0,0,0,0,0,0,0,0,0);

-- Dreadcaller 2 Pathing
SET @NPC := 69500;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=233.3709,`position_y`=2074.927,`position_z`=39.10539 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(@NPC,1,233.3709,2074.927,39.10539,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,2,228.1582,2076.218,39.70464,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,3,226.8357,2086.181,39.48833,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,4,227.4231,2100.461,39.53439,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,5,231.5971,2104.666,38.92635,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,6,237.6874,2098.439,39.00676,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,7,241.6207,2088.015,38.11906,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,8,238.947,2078.802,38.06547,0,0,0,0,0,0,0,0,0,0,0,0);

-- Dreadcaller 3 Pathing
SET @NPC := 69501;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=190.7178,`position_y`=2286.323,`position_z`=49.66181 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(@NPC,1,190.7178,2286.323,49.66181,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,2,210.6431,2285.845,53.60326,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,3,222.5459,2286.666,56.13475,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,4,231.5569,2296.63,60.31371,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,5,220.7462,2308.746,60.02021,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,6,208.7211,2311.991,57.36103,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,7,195.7977,2312.93,53.85427,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,8,181.254,2297.919,50.28107,0,0,0,0,0,0,0,0,0,0,0,0);

-- Dreadcaller 4 Pathing
SET @NPC := 69502;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=177.5729,`position_y`=2268.238,`position_z`=48.5948 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(@NPC,1,177.5729,2268.238,48.5948,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,2,206.0571,2228.519,54.04856,0,0,0,0,0,0,0,0,0,0,0,0);

-- Dreadcaller 5 Pathing
SET @NPC := 69503;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-523.7537,`position_y`=2008.213,`position_z`=82.43176 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUE
(@NPC,1,-523.7537,2008.213,82.43176,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,2,-513.3772,2034.226,82.13103,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,3,-501.1374,2063.957,81.46646,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,4,-490.7202,2097.977,79.50304,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,5,-495.6437,2124.143,75.1469,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,6,-500.0753,2152.032,70.07507,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,7,-497.6553,2131.211,73.99121,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,8,-488.903,2108.3,78.71799,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,9,-496.6252,2076.111,81.08714,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,10,-505.7927,2051.876,81.88617,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,11,-519.2833,2018.794,82.35017,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,12,-523.7976,2008.294,82.49103,0,0,0,0,0,0,0,0,0,0,0,0);

-- Dreadcaller 6 Pathing
SET @NPC := 69504;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-506.4011,`position_y`=1982.52,`position_z`=85.11931 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUE
(@NPC,1,-506.4011,1982.52,85.11931,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,2,-491.8763,2002.533,90.20009,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,3,-475.5587,2034.282,93.52704,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,4,-459.14,2057.011,93.19531,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,5,-488.9269,2006.812,90.64146,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,6,-506.4684,1982.384,85.10349,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,7,-459.1624,2056.984,93.22046,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,8,-453.0856,2078.318,92.4622,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,9,-458.4782,2105.915,91.30417,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,10,-453.1829,2091.579,91.92897,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,11,-454.6579,2067.877,92.86068,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,12,-471.7339,2040.147,93.86339,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,13,-488.8954,2006.772,90.6447,0,0,0,0,0,0,0,0,0,0,0,0),
(@NPC,14,-506.3882,1982.291,85.0636,0,0,0,0,0,0,0,0,0,0,0,0);

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

