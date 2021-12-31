-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '01'; 
    SET @cOldContent = '065';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '01';
    SET @cNewContent = '066';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Wolfsbane Root';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Wolfsbane Root';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

    -- Wolfsbane Root 189313
-- missing spawns added

DELETE FROM `gameobject` WHERE `id` = 189313;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values
(59267,189313,571,1,1,4212.35,-2556.24,238.033,-1.97222,0,0,-0.833885,0.551938,300,100,1),
(59268,189313,571,1,1,4268.08,-2625.2,246.517,1.32645,0,0,0.615661,0.788011,300,100,1),
(59269,189313,571,1,1,4286.69,-2610.54,248.793,0.226892,0,0,0.113203,0.993572,300,100,1),
(59270,189313,571,1,1,4371.47,-2631.16,254.471,-1.25664,0,0,-0.587786,0.809016,300,100,1),
(59271,189313,571,1,1,4288.42,-2645.13,254.847,-3.00195,0,0,-0.997563,0.0697646,300,100,1),
(59272,189313,571,1,1,4309.4,-2689.75,266.868,2.3911,0,0,0.930417,0.366502,300,100,1),
(59273,189313,571,1,1,4324.01,-2630.51,254.477,0.506145,0,0,0.25038,0.968148,300,100,1),
(59274,189313,571,1,1,4271.55,-2682.73,256.585,-0.034906,0,0,-0.0174521,0.999848,300,100,1),
(59275,189313,571,1,1,4354.21,-2653.53,259.513,-1.46608,0,0,-0.669132,0.743144,300,100,1),
(59276,189313,571,1,1,4289.31,-2673.92,259.085,-0.506145,0,0,-0.25038,0.968148,300,100,1),
(59277,189313,571,1,1,4269.22,-2392.16,231.086,2.87979,0,0,0.991445,0.130528,300,100,1),
(59278,189313,571,1,1,4221.19,-2646.62,242.384,0.558504,0,0,0.275637,0.961262,300,100,1),
(59279,189313,571,1,1,4174.01,-2649.11,237.091,3.14159,0,0,1,0.00000126759,300,100,1),
(59280,189313,571,1,1,4199.68,-2649.86,240.99,2.74016,0,0,0.979924,0.199371,300,100,1),
(59281,189313,571,1,1,4211.19,-2363.36,229.523,0.785397,0,0,0.382683,0.92388,300,100,1),
(59282,189313,571,1,1,4230.84,-2404.67,230.914,1.13446,0,0,0.537298,0.843393,300,100,1),
(59283,189313,571,1,1,4186.11,-2398.56,231.397,0.523598,0,0,0.258819,0.965926,300,100,1),
(59289,189313,571,1,1,4174.34,-2601.43,234.533,2.19912,0,0,0.891008,0.453988,300,100,1),
(59290,189313,571,1,1,4189.97,-2586.57,236.355,-0.925024,0,0,-0.446198,0.894934,300,100,1),
(59291,189313,571,1,1,4165.32,-2492.82,225.133,-2.79252,0,0,-0.984807,0.173652,300,100,1),
(59292,189313,571,1,1,4145.77,-2546.27,227.063,-2.9845,0,0,-0.996917,0.0784656,300,100,1),
(59293,189313,571,1,1,4197.67,-2530.1,232.952,-1.65806,0,0,-0.737276,0.675591,300,100,1),
(59294,189313,571,1,1,4159.58,-2438.43,228.917,-2.33874,0,0,-0.920505,0.390732,300,100,1);
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values
(189313,571,1,1,4310.33,-2349.06,224.606,1.88495,0,0,0.809016,0.587786,300,100,1),
(189313,571,1,1,4184.83,-2470.08,230.206,2.28638,0,0,0.909961,0.414694,300,100,1),
(189313,571,1,1,4162.37,-2583.97,231.911,0.401425,0,0,0.199367,0.979925,300,100,1),
(189313,571,1,1,4152.55,-2488.3,223.872,-1.72787,0,0,-0.760405,0.649449,300,100,1),
(189313,571,1,1,4167.29,-2461.39,229.074,-0.610864,0,0,-0.300705,0.953717,300,100,1),
(189313,571,1,1,4138.93,-2448.44,226.15,1.69297,0,0,0.748956,0.66262,300,100,1),
(189313,571,1,1,4285.19,-2348.93,226.843,-0.785397,0,0,-0.382683,0.92388,300,100,1),
(189313,571,1,1,4335.33,-2375.92,228.162,2.09439,0,0,0.866025,0.500001,300,100,1),
(189313,571,1,1,4207.6,-2403.05,230.602,0.628317,0,0,0.309016,0.951057,300,100,1),
(189313,571,1,1,4345.33,-2356.93,220.701,0.994837,0,0,0.477158,0.878817,300,100,1),
(189313,571,1,1,4402.92,-2352.93,214.863,-0.453785,0,0,-0.224951,0.97437,300,100,1),
(189313,571,1,1,4412.8,-2318.25,196.552,-0.087266,0,0,-0.0436192,0.999048,300,100,1),
(189313,571,1,1,4439.01,-2293.36,188.475,-0.95993,0,0,-0.461748,0.887011,300,100,1),
(189313,571,1,1,4443.19,-2387.94,218.856,-2.79252,0,0,-0.984807,0.173652,300,100,1);

-- Pools
-- 37 total spawns (max spawned 20) 
DELETE FROM `pool_template` WHERE `entry` = 20002;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES 
(20002,20,'Grizzly Hills - Wolfsbane Root - 189313');
DELETE FROM `pool_gameobject_template` WHERE `pool_entry` = 20002;
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
(189313, 20002, 0, 'Grizzly Hills - Wolfsbane Root - 189313');


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
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
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


