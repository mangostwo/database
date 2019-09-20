-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
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
    SET @cOldContent = '112';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '113';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'NPC 25419 and 25417';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'NPC 25419 and 25417';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

-- Blistering Pool & Charred Rise - Borean Tundra
SET @guid := (SELECT MAX(guid) FROM `creature`);

UPDATE `creature_template` SET `InhabitType` = 1 WHERE `entry` IN (25419,25417);
DELETE FROM `creature` WHERE `id` IN (25419,25417);
-- Boiling Spirit
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(102626,25419,571,1,1,0,0,4412.49,5909.43,56.0777,1.18241,300,7,0,7984,0,0,1),
(102645,25419,571,1,1,0,0,4280.44,5921.65,56.7261,1.48904,300,7,0,7984,0,0,1),
(102648,25419,571,1,1,0,0,4350.95,5883.12,55.9104,3.37322,300,7,0,7984,0,0,1),
(102649,25419,571,1,1,0,0,4444.39,5948.66,57.404,2.86132,300,7,0,7984,0,0,1),
(102650,25419,571,1,1,0,0,4409.63,5936.75,56.0231,3.51294,300,7,0,7984,0,0,1),
(102651,25419,571,1,1,0,0,4372.43,5917.19,55.9769,3.68386,300,7,0,7984,0,0,1),
(102652,25419,571,1,1,0,0,4351.32,5912.07,59.7775,5.83977,300,7,0,7984,0,0,1),
(102661,25419,571,1,1,0,0,4282.48,5882.59,59.2814,2.17811,300,7,0,7984,0,0,1),
(102662,25419,571,1,1,0,0,4357.06,5856.45,55.6655,1.31559,300,7,0,7984,0,0,1),
(102663,25419,571,1,1,0,0,4319.17,5858.5,57.74,0.04315,300,7,0,7984,0,0,1),
(102664,25419,571,1,1,0,0,4394.71,5881.44,55.6874,2.84787,300,7,0,7984,0,0,1),
(102665,25419,571,1,1,0,0,4319.82,5880.66,56.2993,0.902202,300,7,0,7984,0,0,1),
(102666,25419,571,1,1,0,0,4292.18,5846.93,59.0948,3.29536,300,7,0,7984,0,0,1),
(@guid+1,25419,571,1,1,0,0,4454.11,5850.52,69.9883,3.55315,300,7,0,7984,0,0,1),
(@guid+2,25419,571,1,1,0,0,4428.05,5854.34,66.428,2.41354,300,7,0,8982,0,0,1),
(@guid+3,25419,571,1,1,0,0,4458.14,5891.1,60.9139,0.438265,300,7,0,8982,0,0,1),
(@guid+4,25419,571,1,1,0,0,4449.2,5914.84,57.7831,0.438265,300,7,0,8982,0,0,1),
(@guid+5,25419,571,1,1,0,0,4420.31,5892.99,55.7857,2.93426,300,7,0,8982,0,0,1),
(@guid+6,25419,571,1,1,0,0,4391.94,5839.84,67.9,2.06795,300,7,0,8982,0,0,1),
(@guid+7,25419,571,1,1,0,0,4372.96,5814.76,70.9189,2.06795,300,7,0,7984,0,0,1),
(@guid+8,25419,571,1,1,0,0,4312.03,5919.66,57.8488,0.854509,300,7,0,8982,0,0,1),
(@guid+9,25419,571,1,1,0,0,4350.27,5811.51,68.5782,2.2831,300,7,0,8982,0,0,1),
(@guid+10,25419,571,1,1,0,0,4311.54,5796.73,66.9308,4.6333,300,7,0,7984,0,0,1),
(@guid+11,25419,571,1,1,0,0,4376.78,5736.54,82.9569,2.34167,300,7,0,7984,0,0,1),
(@guid+12,25419,571,1,1,0,0,4433.69,5833.32,71.0137,1.3213,300,7,0,8982,0,0,1),
-- Raging Spirit
(102600,25417,571,1,1,0,0,4349.01,5913.17,59.8202,-0.443351,300,7,0,7984,0,0,1),
(102601,25417,571,1,1,0,0,4391.75,5882.34,55.6874,2.84747,300,7,0,7984,0,0,1),
(@guid+13,25417,571,1,1,0,0,4421.01,5823.65,71.0762,3.86022,300,7,0,7984,0,0,1),
(@guid+14,25417,571,1,1,0,0,4344.56,5872.01,56.1841,1.32361,300,7,0,7984,0,0,1),
(@guid+15,25417,571,1,1,0,0,4313.36,5793.47,67.7126,4.2341,300,7,0,7984,0,0,1),
(@guid+16,25417,571,1,1,0,0,4374.72,5782.12,75.9369,2.32361,300,7,0,8982,0,0,1),
(@guid+17,25417,571,1,1,0,0,4296.03,5820.25,62.43,4.32361,300,7,0,8982,0,0,1),
(@guid+18,25417,571,1,1,0,0,4259.6,5779.15,67.7533,2.2313,300,7,0,7984,0,0,1),
(@guid+19,25417,571,1,1,0,0,4278.4,5790.92,68.2941,0.222,300,7,0,8982,0,0,1),
(@guid+20,25417,571,1,1,0,0,4354.14,5721.39,85.5152,2.2344,300,7,0,7984,0,0,1),
(@guid+21,25417,571,1,1,0,0,4314.42,5716.63,89.2879,3.97018,300,7,0,8982,0,0,1),
(@guid+22,25417,571,1,1,0,0,4370.85,5750.76,80.877,4.9754,300,7,0,7984,0,0,1),
(@guid+23,25417,571,1,1,0,0,4280.17,5752.32,67.4897,3.23,300,7,0,8982,0,0,1),
(@guid+24,25417,571,1,1,0,0,4345.42,5745.68,82.2789,1.97,300,7,0,7984,0,0,1),
(@guid+25,25417,571,1,1,0,0,4323.79,5751.81,81.0993,3.97018,300,7,0,7984,0,0,1),
(@guid+26,25417,571,1,1,0,0,4397.82,5784.3,77.046,1.9839,300,7,0,7984,0,0,1),
(@guid+27,25417,571,1,1,0,0,4256.58,5721.21,57.9788,1.9839,300,7,0,7984,0,0,1),
(@guid+28,25417,571,1,1,0,0,4373.27,5721.01,84.533,3.75889,300,7,0,8982,0,0,1),
(@guid+29,25417,571,1,1,0,0,4243.69,5760.06,66.4825,2.40015,300,7,0,8982,0,0,1),
(@guid+30,25417,571,1,1,0,0,4314.8,5667.14,93.884,2.40015,300,7,0,7984,0,0,1),
(@guid+31,25417,571,1,1,0,0,4311.2,5652.97,94.3324,4.30866,300,7,0,8982,0,0,1),
(@guid+32,25417,571,1,1,0,0,4222.18,5721.32,59.5068,4.30866,300,7,0,7984,0,0,1),
(@guid+33,25417,571,1,1,0,0,4426.34,5781.09,78.1236,5.66343,300,7,0,8982,0,0,1),
(@guid+34,25417,571,1,1,0,0,4345.01,5804.92,68.2855,4.22948,300,7,0,7984,0,0,1),
(@guid+35,25417,571,1,1,0,0,4408.29,5748.94,81.0357,3.28879,300,7,0,7984,0,0,1);

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
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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


