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
    SET @cOldContent = '005';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '12';
    SET @cNewContent = '006';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'En\'kilah Necromancer';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'En\'kilah Necromancer';

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
		
-- Edited from source: Cmangos DB
SET @guid := (SELECT MAX(`guid`) FROM `creature`);
SET @script_id := (SELECT MAX(`id`) FROM `db_scripts`);
-- En'kilah Necromancer WP scripts, can sometime cause issues with NPCs standing in stuck casting state when argo from PC.
INSERT INTO `db_scripts` (`script_type`, `id`, `delay`,`command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`,`comments`) VALUES
(3,@script_id+1,1000,31,15214,149,0,0,0,0,0,0,0,0,0,0,0,''),
(3,@script_id+1,2000,15,61382,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3,@script_id+1,3000,15,61383,4,15214,150,1,0,0,0,0,0,0,0,0,''),
(3,@script_id+2,1000,31,15214,40,0,0,0,0,0,0,0,0,0,0,0,''),
(3,@script_id+2,2000,15,45491,4,15214,40,1,0,0,0,0,0,0,0,0,''),
(3,@script_id+2,3000,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'idle'),
(3,@script_id+3,1000,31,25391,30,0,0,0,0,0,0,0,0,0,0,0,''),
(3,@script_id+3,2000,15,45491,4,25391,30,1,0,0,0,0,0,0,0,0,''),
(3,@script_id+3,23000,14,45491,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3,@script_id+4,1000,31,25534,30,0,0,0,0,0,0,0,0,0,0,0,''),
(3,@script_id+4,2000,15,45491,4,25534,30,1,0,0,0,0,0,0,0,0,''),
(3,@script_id+4,23000,14,45491,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Re-work En'kilah Necromancer spawn locations.
DELETE FROM `creature` WHERE `id` = 25378;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(99160,25378,571,1,1,0,0,3842.22,3730.25,47.3423,2.30383,300,0,0,7432,7332,0,2),
(99161,25378,571,1,1,0,0,3890.13,3719.33,46.9187,3.00197,300,0,0,7432,7332,0,2),
(99162,25378,571,1,1,0,0,3838.99,3724.43,47.1457,3.89265,300,0,0,7432,7332,0,2),
(@guid+1,25378,571,1,1,0,0,4078.25,3542.32,128.418,4.50119,300,0,0,7432,7332,0,2), -- Right
(@guid+2,25378,571,1,1,0,0,4046.06,3486.33,128.423,0.991056,300,0,0,7432,7332,0,2), -- Left
(@guid+3,25378,571,1,1,0,0,3900.85,3515.07,46.7483,4.92183,300,0,0,7432,7332,0,2),
(@guid+4,25378,571,1,1,0,0,3887.79,3748.57,46.6426,1.8326,300,0,0,7432,7332,0,2),
(@guid+5,25378,571,1,1,0,0,3945.44,3731.83,62.3845,1.71042,300,0,0,7432,7332,0,2),
(@guid+6,25378,571,1,1,0,0,3978.72,3737.65,62.6344,1.27144,300,0,0,7432,7332,0,2),
(@guid+7,25378,571,1,1,0,0,4003.14,3791.94,62.6789,1.67552,300,0,0,7432,7332,0,2),
(@guid+8,25378,571,1,1,0,0,4104.68,3755.17,92.747,5.3058,120,0,0,7432,7332,0,2),
(@guid+9,25378,571,1,1,0,0,4120.86,3713.72,92.7478,1.76278,120,0,0,7432,7332,0,2),
(@guid+10,25378,571,1,1,0,0,4127.5,3741.05,92.7561,3.78736,120,0,0,7432,7332,0,2),
(@guid+11,25378,571,1,1,0,0,4031.61,3765.3,88.1413,2.77507,300,0,0,7432,7332,0,2),
(@guid+12,25378,571,1,1,0,0,4042.49,3745.19,88.5087,3.24631,300,0,0,7432,7332,0,2),
(@guid+13,25378,571,1,1,0,0,4059.95,3772.84,88.2722,2.07694,300,0,0,7432,7332,0,2),
(@guid+14,25378,571,1,1,0,0,4084.62,3781.45,88.1413,1.309,300,0,0,7432,7332,0,2),
(@guid+15,25378,571,1,1,0,0,4061.82,3641.45,88.1108,2.63545,300,0,0,7432,7332,0,2),
(@guid+16,25378,571,1,1,0,0,4073.15,3662.26,88.3091,2.70526,300,0,0,7432,7332,0,2),
(@guid+17,25378,571,1,1,0,0,4101.85,3536.83,109.293,2.54818,300,0,0,7432,7332,0,2),
(@guid+18,25378,571,1,1,0,0,4111.82,3499.67,109.121,5.86431,300,0,0,7432,7332,0,2),
(@guid+19,25378,571,1,1,0,0,4062.42,3465.1,109.268,2.63545,300,0,0,7432,7332,0,2),
(@guid+20,25378,571,1,1,0,0,4099.07,3478.4,109.105,5.75959,300,0,0,7432,7332,0,2),
(@guid+21,25378,571,1,1,0,0,4091.81,3448.9,108.985,5.74402,300,0,0,7432,7332,0,2);

-- Add waypoints for En'kilah Necromancer.
DELETE FROM `creature_movement` WHERE `id` IN (99160,99161,99162);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(99160,1,3842.22,3730.25,47.3423,2.30383,12000,@script_id+1),
(99161,1,3890.13,3719.33,46.9187,3.00197,22000,@script_id+1),
(99162,1,3833.78,3715.32,47.4691,4.04113,0,0),
(99162,2,3828.52,3708.95,47.1453,3.99011,0,0),
(99162,3,3833.55,3715.01,47.4744,0.927061,0,0),
(99162,4,3847.03,3731.86,47.1584,0.860302,0,0),
(99162,5,3855.91,3740.3,47.0806,0.742492,0,0),
(99162,6,3865.85,3748.08,46.8735,0.402414,0,0),
(99162,7,3883.23,3754.87,46.8874,0.0450581,0,0),
(99162,8,3896.32,3753.1,47.3064,6.15153,0,0),
(99162,9,3884,3754.97,46.8824,3.19843,0,0),
(99162,10,3866.27,3748.35,46.873,3.68538,0,0),
(99162,11,3855.88,3740.07,47.0831,3.92493,0,0),
(99162,12,3847.2,3731.94,47.1514,4.0231,0,0),
(@guid+1,1,4075.94,3538.68,128.424,4.15136,0,0),
(@guid+1,2,4066.31,3524.12,115.691,4.11209,0,0),
(@guid+1,3,4071.13,3531.39,121.841,0.986207,0,0),
(@guid+1,4,4075.66,3538.02,128.425,1.02548,0,0),
(@guid+1,5,4079.35,3543.55,128.417,5.76221,0,0),
(@guid+1,6,4091.78,3536.89,128.42,5.83211,0,0),
(@guid+1,7,4107.23,3529.95,128.423,5.74572,0,0),
(@guid+1,8,4124.69,3520.53,128.422,5.74965,0,0),
(@guid+1,9,4143.62,3509.16,128.414,4.22991,0,0),
(@guid+1,10,4131.01,3488.79,128.419,4.15137,0,0),
(@guid+1,11,4143.28,3508.68,128.414,2.62377,0,0),
(@guid+1,12,4124.84,3520.51,128.42,2.56664,0,0),
(@guid+1,13,4107.2,3529.54,128.424,2.71513,0,0),
(@guid+1,14,4092.4,3536.82,128.422,2.68537,0,0),
(@guid+1,15,4079.52,3543.58,128.417,3.9852,0,0),
(@guid+2,1,4053.37,3500.65,116.317,1.12065,0,0),
(@guid+2,2,4055.54,3505.12,115.679,1.11672,0,0),
(@guid+2,3,4053.47,3500.85,116.159,4.24261,0,0),
(@guid+2,4,4050.8,3494.85,121.156,4.27402,0,0),
(@guid+2,5,4046.77,3486.96,128.425,4.20857,0,0),
(@guid+2,6,4043.44,3481.25,128.417,5.63013,0,0),
(@guid+2,7,4056.39,3472.66,128.419,5.69296,0,0),
(@guid+2,8,4068.88,3464.95,128.422,5.77543,0,0),
(@guid+2,9,4084.04,3456.42,128.424,5.78328,0,0),
(@guid+2,10,4096.97,3449.36,128.421,5.78328,0,0),
(@guid+2,11,4106.17,3444.99,128.415,0.399379,0,0),
(@guid+2,12,4117.23,3463.23,128.419,1.0385,0,0),
(@guid+2,13,4106.54,3445.01,128.415,2.66821,0,0),
(@guid+2,14,4084.42,3456.26,128.421,2.67606,0,0),
(@guid+2,15,4069.36,3464.56,128.423,2.6525,0,0),
(@guid+2,16,4056.67,3472.24,128.422,2.57396,0,0),
(@guid+2,17,4043.43,3480.76,128.417,1.07385,0,0),
(@guid+2,18,4045.79,3485.8,128.423,1.0385,0,0),
(@guid+3,1,3900.85,3515.07,46.7483,4.92183,16000,@script_id+1),
(@guid+4,1,3887.79,3748.57,46.6426,1.8326,15000,@script_id+1),
(@guid+5,1,3945.44,3731.83,62.3845,1.71042,18000,@script_id+1),
(@guid+6,1,3982.38,3750.6,62.5329,1.33523,0,0),
(@guid+6,2,3982.51,3765.67,62.5285,1.61012,0,0),
(@guid+6,3,3980.7,3788,62.5929,1.77505,0,0),
(@guid+6,4,3982.44,3766.17,62.5302,4.76349,0,0),
(@guid+6,5,3982.45,3750.79,62.5312,4.44541,0,0),
(@guid+6,6,3975.91,3729.22,61.9239,4.38706,0,0),
(@guid+6,7,3975.91,3729.22,61.9239,3.4996,15000,0),
(@guid+6,8,3978.72,3737.65,62.6344,1.27144,0,0),
(@guid+7,1,4003.14,3791.94,62.6789,1.67552,13000,@script_id+1),
(@guid+8,1,4104.68,3755.17,92.747,5.3058,5000,@script_id+2),
(@guid+9,1,4120.86,3713.72,92.7478,1.76278,5000,@script_id+2),
(@guid+10,1,4127.5,3741.05,92.7561,3.78736,5000,@script_id+2),
(@guid+11,1,4031.61,3765.3,88.1413,2.77507,25000,@script_id+3),
(@guid+12,1,4042.49,3745.19,88.5087,3.24631,25000,@script_id+3),
(@guid+13,1,4059.95,3772.84,88.2722,2.07694,25000,@script_id+3),
(@guid+14,1,4084.62,3781.45,88.1413,1.309,25000,@script_id+3),
(@guid+15,1,4061.82,3641.45,88.1108,2.63545,25000,@script_id+3),
(@guid+16,1,4073.15,3662.26,88.3091,2.70526,25000,@script_id+3),
(@guid+17,1,4101.85,3536.83,109.293,2.54818,25000,@script_id+4),
(@guid+18,1,4111.82,3499.67,109.121,5.86431,25000,@script_id+4),
(@guid+19,1,4062.42,3465.1,109.268,2.63545,25000,@script_id+4),
(@guid+20,1,4099.07,3478.4,109.105,5.75958,25000,@script_id+4),
(@guid+21,1,4103.61,3442.29,108.905,0.835695,0,0),
(@guid+21,2,4111.29,3454.22,108.92,1.05188,0,0),
(@guid+21,3,4121.38,3472.15,108.995,1.07545,0,0),
(@guid+21,4,4129.27,3486.76,108.954,1.07545,0,0),
(@guid+21,5,4137.17,3500.96,108.941,1.04403,0,0),
(@guid+21,6,4144.14,3511.97,108.921,2.46403,0,0),
(@guid+21,7,4129.5,3521.58,109.037,2.63749,0,0),
(@guid+21,8,4117.96,3527.54,109.142,4.23577,0,0),
(@guid+21,9,4108.87,3512.31,109.042,4.20828,0,0),
(@guid+21,10,4099.02,3494.96,109.006,4.23577,0,0),
(@guid+21,11,4092.62,3483.4,109.02,4.21221,0,0),
(@guid+21,12,4084.03,3466.62,109.043,4.21613,0,0),
(@guid+21,13,4078.69,3456.59,109.122,5.79871,0,0),
(@guid+21,14,4091.13,3449.38,108.997,5.78693,0,0);

-- Error clean up that seems to have been hidden.
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` IN (57661,72885,72886,72887,72888,72889,72890,72892,
72894,72895,72896,78222,90994,90995,90996,90997,
90998,90999,91000,91001,91002,91003,91004,91005,
91006,91007,91008,111808,129390,129391,129440,129459,
132326,137593,137594,137595,137596,137597,137598,151032);

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


