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
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '12'; 
    SET @cOldContent = '016';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '12';
    SET @cNewContent = '017';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'The Honored Dead';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'The Honored Dead';

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

UPDATE `creature_ai_scripts` SET `action2_param1` = 5000 WHERE `id` IN (2534201,2534301);

-- q.11593 'The Honored Dead'

-- ID - 45474 Ragefist's Torch
DELETE FROM `db_scripts` WHERE `script_type` = 5 AND `id` = 45474;
INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`)VALUES
(5,45474,0,9,0,60000,182071,10,7,0,0,0,0,0,0,0,0,'Ragefist\'sTorch');

-- Dead Caravan Guard/Dead Caravan Worker - respawntime sync with objects
UPDATE `creature` SET `spawntimesecs` = 180 WHERE `id` IN (25342,25343);

-- Small Chapel Fire
-- missing added - WoTLKDB free guids reused
-- DELETE FROM gameobject WHERE `id` = 182071;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(182071, 571, 1,1,4080.66, 5808.39, 72.167, 2.81378, 0, 0, 0.986598, 0.163171, -60, 255, 1),
(182071, 571, 1,1,4065.5, 5851.05, 73.3949, 4.0131, 0, 0, 0.906553, -0.422092, -60, 255, 1),
(182071, 571, 1,1,4021.6, 5830.61, 74.8438, 3.06669, 0, 0, 0.999299, 0.0374428, -60, 255, 1),
(182071, 571, 1,1,4041.5, 5798.76, 75.5912, 3.0824, 0, 0, 0.999562, 0.0295929, -60, 255, 1),
(182071, 571, 1,1,4020.28, 5780.61, 72.6594, 0.906845, 0, 0, 0.438045, 0.898953, -60, 255, 1),
(182071, 571, 1,1,4034.29, 5763.64, 68.6445, 5.44251, 0, 0, 0.408067, -0.912952, -60, 255, 1),
(182071, 571, 1,1,4017.82, 5744.74, 63.6805, 2.97244, 0, 0, 0.996426, 0.0844765, -60, 255, 1),
(182071, 571, 1,1,3980.96, 5762.16, 71.07, 4.15446, 0, 0, 0.87448, -0.485062, -60, 255, 1),
(182071, 571, 1,1,3935.54, 5785.57, 71.3869, 4.74744, 0, 0, 0.694608, -0.719388, -60, 255, 1),
(182071, 571, 1,1,3860.48, 5773.77, 68.8292, 5.43859, 0, 0, 0.409859, -0.912149, -60, 255, 1),
(182071, 571, 1,1,3875.57, 5723.96, 66.7869, 0.757613, 0, 0, 0.369812, 0.929107, -60, 255, 1),
(182071, 571, 1,1,3900.49, 5689.92, 61.2389, 1.85717, 0, 0, 0.800772, 0.598969, -60, 255, 1),
(182071, 571, 1,1,3912.29, 5655.52, 54.1501, 2.30877, 0, 0, 0.914547, 0.40448, -60, 255, 1),
(182071, 571, 1,1,3945.4, 5659.36, 52.4441, 2.45407, 0, 0, 0.941493, 0.337031, -60, 255, 1),
(182071, 571, 1,1,3966.18, 5666.9, 53.2775, 1.2799, 0, 0, 0.597155, 0.802126, -60, 255, 1),
(182071, 571, 1,1,3941.45, 5686.93, 60.8272, 1.28383, 0, 0, 0.598729, 0.800952, -60, 255, 1),
(182071, 571, 1,1,3991.37, 5672.29, 53.8893, 2.08886, 0, 0, 0.864638, 0.502396, -60, 255, 1),
(182071, 571, 1,1,4001.13, 5643.05, 50.0221, 2.6503, 0, 0, 0.969981, 0.243182, -60, 255, 1),
(182071, 571, 1,1,4041.53, 5684.11, 48.7276, 2.27331, 0, 0, 0.907232, 0.420631, -60, 255, 1),
(182071, 571, 1,1,4007.46, 5699.32, 58.3988, 1.14234, 0, 0, 0.540615, 0.84127, -60, 255, 1),
(182071, 571, 1,1,4022.78, 5713.47, 60.0338, 3.18437, 0, 0, 0.999771, -0.0213889, -60, 255, 1),
(182071, 571, 1,1,3970.37, 5705.07, 59.1499, 2.22619, 0, 0, 0.89707, 0.441888, -60, 255, 1),
(182071, 571, 1,1,3944.7, 5737.16, 64.1186, 1.73531, 0, 0, 0.762816, 0.646616, -60, 255, 1),
(182071, 571, 1,1,4073.88, 5714.88, 58.0056, 1.01275, 0, 0, 0.485009, 0.874509, -60, 255, 1),
(182071, 571, 1,1,4074.64, 5773.15, 67.7993, 2.04948, 0, 0, 0.854578, 0.519323, -60, 255, 1),
(182071, 571, 1,1,4062.43, 5750.32, 64.7853, 2.06126, 0, 0, 0.857622, 0.51428, -60, 255, 1),
(182071, 571, 1,1,4050.19, 5774.55, 72.4324, 2.19791, 0, 0, 0.890733, 0.454526, -60, 255, 1),
(182071, 571, 1,1,3988.85, 5724.61, 63.0779, 0.561139, 0, 0, 0.276903, 0.960898, -60, 255, 1);    

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


