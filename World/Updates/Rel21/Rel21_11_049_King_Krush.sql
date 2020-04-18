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
    SET @cOldStructure = '11'; 
    SET @cOldContent = '048';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '049';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'King Krush';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'King Krush';

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

SET @guid := (SELECT MAX(`guid`) FROM `creature`);
SET @Entry := (SELECT MAX(`entry`) FROM `pool_template`);

DELETE FROM `creature` WHERE `id` = 32485;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@guid+1,32485,571,1,65535,0,0,4865.04,4679.54,-69.2385,1.14987,28800,0,0,42540,0,0,2),
(@guid+2,32485,571,1,65535,0,0,6087.94,4603.13,-96.8083,2.44102,28800,0,0,42540,0,0,2);


INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@guid+1,1,4852.48,4658.75,-68.0755,4.16891),
(@guid+1,2,4834.96,4629.75,-65.1811,4.16891),
(@guid+1,3,4831.86,4606.22,-64.2916,4.57339),
(@guid+1,4,4837.14,4578.93,-64.3191,4.97159),
(@guid+1,5,4822.47,4552.46,-64.2898,3.93015),
(@guid+1,6,4826.08,4528.52,-64.6461,5.0572),
(@guid+1,7,4845.94,4492.84,-65.1639,5.24098),
(@guid+1,8,4865.39,4459.53,-64.2489,5.24098),
(@guid+1,9,4910.93,4452.52,-67.4561,6.16697),
(@guid+1,10,4933.42,4444.17,-73.4655,5.96119),
(@guid+1,11,4935.58,4409.57,-70.2226,4.73833),
(@guid+1,12,4927.75,4382.8,-64.4083,3.76444),
(@guid+1,13,4893.4,4358.12,-62.1188,3.76444),
(@guid+1,14,4859.81,4334.92,-56.4282,3.65134),
(@guid+1,15,4856.73,4307.48,-50.7256,4.509),
(@guid+1,16,4845.49,4277.39,-43.4954,4.30872),
(@guid+1,17,4872.21,4250.46,-43.7953,5.67217),
(@guid+1,18,4877.08,4216.57,-41.2896,4.84907),
(@guid+1,19,4865.22,4181.4,-31.0699,4.38726),
(@guid+1,20,4877.96,4151.9,-27.3891,5.06741),
(@guid+1,21,4903.26,4139.06,-35.1567,5.86852),
(@guid+1,22,4938.2,4125.18,-34.7225,5.94627),
(@guid+1,23,4996.3,4104.83,-32.8699,5.94627),
(@guid+1,24,4938.2,4125.18,-34.7225,2.84473),
(@guid+1,25,4903.26,4139.06,-35.1567,2.69629),
(@guid+1,26,4877.96,4151.9,-27.3891,2.69629),
(@guid+1,27,4865.22,4181.4,-31.0699,1.98236),
(@guid+1,28,4877.08,4216.57,-41.2896,1.42394),
(@guid+1,29,4872.21,4250.46,-43.7953,1.66427),
(@guid+1,30,4845.49,4277.39,-43.4954,2.3994),
(@guid+1,31,4856.73,4307.48,-50.7256,1.18282),
(@guid+1,32,4859.81,4334.92,-56.4282,1.60929),
(@guid+1,33,4893.4,4358.12,-62.1188,0.608693),
(@guid+1,34,4927.75,4382.8,-64.4083,0.608693),
(@guid+1,35,4935.58,4409.57,-70.2226,1.39802),
(@guid+1,36,4933.42,4444.17,-73.4655,1.67919),
(@guid+1,37,4910.93,4452.52,-67.4561,2.82901),
(@guid+1,38,4865.39,4459.53,-64.2489,2.82901),
(@guid+1,39,4845.94,4492.84,-65.1639,2.08446),
(@guid+1,40,4826.08,4528.52,-64.6461,2.08446),
(@guid+1,41,4822.47,4552.46,-64.2898,1.54567),
(@guid+1,42,4837.14,4578.93,-64.3191,0.998251),
(@guid+1,43,4831.86,4606.22,-64.2916,1.87633),
(@guid+1,44,4834.96,4629.75,-65.1811,1.4365),
(@guid+1,45,4852.48,4658.75,-68.0755,0.940917),
(@guid+1,46,4865.04,4679.54,-69.2385,1.31241),
(@guid+2,1,6075.78,4618.8,-97.4729,2.23054),
(@guid+2,2,6054.02,4672.94,-94.5744,1.91716),
(@guid+2,3,6051.04,4746.6,-94.5742,1.60143),
(@guid+2,4,6018.71,4785.66,-96.6111,2.27373),
(@guid+2,5,5990.8,4818.6,-101.822,2.27373),
(@guid+2,6,6013.69,4847.13,-99.2773,0.825459),
(@guid+2,7,6036.09,4881.62,-94.7494,1.00924),
(@guid+2,8,6096.53,4912.39,-96.888,0.544287),
(@guid+2,9,6036.09,4881.62,-94.7494,3.69609),
(@guid+2,10,6013.69,4847.13,-99.2773,4.14927),
(@guid+2,11,5990.8,4818.6,-101.822,4.13199),
(@guid+2,12,6018.71,4785.66,-96.6111,5.50958),
(@guid+2,13,6051.04,4746.6,-94.5742,5.35407),
(@guid+2,14,6054.02,4672.94,-94.5744,4.72653),
(@guid+2,15,6075.78,4618.8,-97.4729,5.03912),
(@guid+2,16,6087.94,4603.13,-96.8083,5.27239);

INSERT INTO `pool_template` VALUES
(@Entry+1,1,'RARE King Krush (32485)');
DELETE FROM `pool_creature_template` WHERE `id` = 32485;
INSERT INTO `pool_creature_template` VALUES
(32485,@Entry+1,0,'RARE King Krush - 32485');
    

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


