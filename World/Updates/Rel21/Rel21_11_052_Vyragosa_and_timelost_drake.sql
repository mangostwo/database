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
    SET @cOldContent = '051';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '052';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Vyragosa and timelost drake';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Vyragosa and timelost drake';

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

SET @Entry := (SELECT MAX(`entry`) FROM `pool_template`);
SET @guid := (SELECT MAX(`guid`) FROM `creature`);

DELETE FROM `creature` WHERE `id` IN (32630,32491);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(@guid+1,32630,571,1,1,0,0,6916,-1802.03,892.007,1.11367,28800,0,0,18900,0,2),
(@guid+2,32630,571,1,1,0,0,7060.99,-413.62,853.643,4.60036,28800,0,0,18900,0,2),
(@guid+3,32630,571,1,1,0,0,6654.52,-755.374,813.789,3.42982,28800,0,0,18900,0,2),
(@guid+4,32630,571,1,1,0,0,8515.188,-1962.858,1494.143,1.097086,28800,0,0,18900,0,2),
-- No WP no share with time-lost
(@guid+5,32630,571,1,1,0,0,7939.88,-3033.68,1124.32,5.09516,28800,10,0,18900,0,1),
-- Time-lost Proto-drake
(@guid+6,32491,571,1,1,0,0,6916,-1802.03,892.007,1.11367,28800,0,0,18900,0,2),
(@guid+7,32491,571,1,1,0,0,7060.99,-413.62,853.643,4.60036,28800,0,0,18900,0,2),
(@guid+8,32491,571,1,1,0,0,6654.52,-755.374,813.789,3.42982,28800,0,0,18900,0,2),
(@guid+9,32491,571,1,1,0,0,8515.188,-1962.858,1494.143,1.097086,28800,0,0,18900,0,2);
-- Waypoints 
-- Vyragosa
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@guid+1,1,7025.49,-1624.87,957.369,0),
(@guid+1,2,7167.58,-1501.69,962.569,0),
(@guid+1,3,7440.4,-1295.86,997.291,0),
(@guid+1,4,7210.96,-1046.89,1006.18,0),
(@guid+1,5,6998.46,-1076.85,1024.82,0),
(@guid+1,6,6874.25,-1097.38,927.736,0),
(@guid+1,7,6614.79,-875.755,812.765,0),
(@guid+1,8,6563.27,-811.767,749.876,0),
(@guid+1,9,6299.5,-797.577,529.126,0),
(@guid+1,10,6194.55,-1013.14,501.542,0),
(@guid+1,11,6319.25,-1251.66,468.626,0),
(@guid+1,12,6309.16,-1537.86,615.042,0),
(@guid+1,13,6748.21,-1664.31,919.312,0),
(@guid+1,14,6913.31,-1725.26,954.792,0),
(@guid+1,15,7167.58,-1501.69,962.569,0),
(@guid+1,16,7440.4,-1295.86,997.291,0),
(@guid+1,17,7024.75,-1625.54,957.369,0),
(@guid+2,1,7057.17,-466.25,878.12,0),
(@guid+2,2,7074.111,-579.634,910.851,4.855991),
(@guid+2,3,7132.651,-760.866,1049.512,5.197625),
(@guid+2,4,7249.247,-970.96,1084.81,5.680636),
(@guid+2,5,7788.704,-1057.802,1179.593,0.013980),
(@guid+2,6,8101.072,-1032.902,1136.867,0.288869),
(@guid+2,7,8227.78,-789.624,1092.933,1.164588),
(@guid+2,8,8128.776,-582.57,1018.569,2.468349),
(@guid+2,9,7762.937,-221.778,985.429,2.527254),
(@guid+2,10,7424.92,-80.348,881.146,2.990639),
(@guid+2,11,7103.024,-184.687,947.389,4.396498),
(@guid+3,1,6554.92,-787.56,724.434,3.12025),
(@guid+3,2,6377.25,-800.248,610,2.9396),
(@guid+3,3,6275.84,-653.719,571.571,1.98535),
(@guid+3,4,6261.36,-488.61,615.349,1.30598),
(@guid+3,5,6414.35,-154.561,778.213,1.03501),
(@guid+3,6,6558.44,-18.986,847.958,0.013992),
(@guid+3,7,6683.49,-37.556,904.065,5.95553),
(@guid+3,8,7089.38,-202.136,909.205,4.63606),
(@guid+3,9,7071.88,-356.094,853.934,4.55359),
(@guid+3,10,7075.8,-538.166,865.169,4.61641),
(@guid+3,11,7026.14,-719.014,880.747,3.38806),
(@guid+3,12,6656.17,-774.494,776.981,3.32759),
(@guid+4,1,8602.454,-1838.237,1486.341,0.637596),
(@guid+4,2,8812.235,-1575.332,1399.9,0.853580),
(@guid+4,3,8826.364,-1286.917,1268.18,1.525096),
(@guid+4,4,8852.777,-982.445,1229.653,1.682170),
(@guid+4,5,8918.378,-891.475,1215.956,2.349759),
(@guid+4,6,8629.153,-527.619,1261.838,2.290854),
(@guid+4,7,8391.57, -58.755,1115.712,3.001639),
(@guid+4,8,7874.929,-122.783,1116.793,3.245113),
(@guid+4,9,7717.852,-131.445,1057.465,2.632501),
(@guid+4,10,7446.307,-125.012,1113.602,3.213696),
(@guid+4,11,7137.615,-245.838,1049.317,4.073709),
(@guid+4,12,7150.045,-561.944,1032.258,4.772713),
(@guid+4,13,7234.804,-841.187,1059.515,5.059377),
(@guid+4,14,7396.082,-1159.771,1083.054,5.086866),
(@guid+4,15,7538.841,-1442.676,1357.651,5.208600),
(@guid+4,16,7874.599,-1885.267,1626.82,0.233100),
(@guid+4,17,8142.232,-1601.708,1594.764,0.814295),
(@guid+4,18,8319.001,-1442.868,1493.406,0.708266),
(@guid+4,19,8450.752,-1714.86,1486.377,4.945488),
-- Time-lost proto-drake
(@guid+6,1,7025.49,-1624.87,957.369,0),
(@guid+6,2,7167.58,-1501.69,962.569,0),
(@guid+6,3,7440.4,-1295.86,997.291,0),
(@guid+6,4,7210.96,-1046.89,1006.18,0),
(@guid+6,5,6998.46,-1076.85,1024.82,0),
(@guid+6,6,6874.25,-1097.38,927.736,0),
(@guid+6,7,6614.79,-875.755,812.765,0),
(@guid+6,8,6563.27,-811.767,749.876,0),
(@guid+6,9,6299.5,-797.577,529.126,0),
(@guid+6,10,6194.55,-1013.14,501.542,0),
(@guid+6,11,6319.25,-1251.66,468.626,0),
(@guid+6,12,6309.16,-1537.86,615.042,0),
(@guid+6,13,6748.21,-1664.31,919.312,0),
(@guid+6,14,6913.31,-1725.26,954.792,0),
(@guid+6,15,7167.58,-1501.69,962.569,0),
(@guid+6,16,7440.4,-1295.86,997.291,0),
(@guid+6,17,7024.75,-1625.54,957.369,0),
(@guid+7,1,7057.17,-466.25,878.12,0),
(@guid+7,2,7074.111,-579.634,910.851,4.855991),
(@guid+7,3,7132.651,-760.866,1049.512,5.197625),
(@guid+7,4,7249.247,-970.96,1084.81,5.680636),
(@guid+7,5,7788.704,-1057.802,1179.593,0.013980),
(@guid+7,6,8101.072,-1032.902,1136.867,0.288869),
(@guid+7,7,8227.78,-789.624,1092.933,1.164588),
(@guid+7,8,8128.776,-582.57,1018.569,2.468349),
(@guid+7,9,7762.937,-221.778,985.429,2.527254),
(@guid+7,10,7424.92,-80.348,881.146,2.990639),
(@guid+7,11,7103.024,-184.687,947.389,4.396498),
(@guid+8,1,6554.92,-787.56,724.434,3.12025),
(@guid+8,2,6377.25,-800.248,610,2.9396),
(@guid+8,3,6275.84,-653.719,571.571,1.98535),
(@guid+8,4,6261.36,-488.61,615.349,1.30598),
(@guid+8,5,6414.35,-154.561,778.213,1.03501),
(@guid+8,6,6558.44,-18.986,847.958,0.013992),
(@guid+8,7,6683.49,-37.556,904.065,5.95553),
(@guid+8,8,7089.38,-202.136,909.205,4.63606),
(@guid+8,9,7071.88,-356.094,853.934,4.55359),
(@guid+8,10,7075.8,-538.166,865.169,4.61641),
(@guid+8,11,7026.14,-719.014,880.747,3.38806),
(@guid+8,12,6656.17,-774.494,776.981,3.32759),
(@guid+9,1,8602.454,-1838.237,1486.341,0.637596),
(@guid+9,2,8812.235,-1575.332,1399.9,0.853580),
(@guid+9,3,8826.364,-1286.917,1268.18,1.525096),
(@guid+9,4,8852.777,-982.445,1229.653,1.682170),
(@guid+9,5,8918.378,-891.475,1215.956,2.349759),
(@guid+9,6,8629.153,-527.619,1261.838,2.290854),
(@guid+9,7,8391.57, -58.755,1115.712,3.001639),
(@guid+9,8,7874.929,-122.783,1116.793,3.245113),
(@guid+9,9,7717.852,-131.445,1057.465,2.632501),
(@guid+9,10,7446.307,-125.012,1113.602,3.213696),
(@guid+9,11,7137.615,-245.838,1049.317,4.073709),
(@guid+9,12,7150.045,-561.944,1032.258,4.772713),
(@guid+9,13,7234.804,-841.187,1059.515,5.059377),
(@guid+9,14,7396.082,-1159.771,1083.054,5.086866),
(@guid+9,15,7538.841,-1442.676,1357.651,5.208600),
(@guid+9,16,7874.599,-1885.267,1626.82,0.233100),
(@guid+9,17,8142.232,-1601.708,1594.764,0.814295),
(@guid+9,18,8319.001,-1442.868,1493.406,0.708266),
(@guid+9,19,8450.752,-1714.86,1486.377,4.945488);

-- Allow flight animation.
DELETE FROM `creature_template_addon` WHERE `entry` IN (32491,32630);
INSERT INTO `creature_template_addon` VALUES
(32491,0,50331648,1,0,0,0,''),
(32630,0,50331648,1,0,0,0,'');
-- Adjust movement speed
UPDATE `creature_template` SET `SpeedWalk` = 1.44444, `SpeedRun` = 1.5873 WHERE `Entry` IN (32630,32491);
-- Add spawn pool and % rate Vyragosa / Time-lost proto-drake
INSERT INTO `pool_template` VALUES
(@Entry+1,1,'RARE Vyragosa / Time-lost proto-drake (32630/32491)');
INSERT INTO `pool_creature` VALUES
(@guid+1,@Entry+1,16,'RARE Vyragosa - 32630 Spawn 1'),
(@guid+2,@Entry+1,16,'RARE Vyragosa - 32630 Spawn 2'),
(@guid+3,@Entry+1,16,'RARE Vyragosa - 32630 Spawn 3'),
(@guid+4,@Entry+1,16,'RARE Vyragosa - 32630 Spawn 4'),
(@guid+5,@Entry+1,16,'RARE Vyragosa - 32630 Spawn 5'),
(@guid+6,@Entry+1,5,'Time-lost proto-drake - 32491 Spawn 1'),
(@guid+7,@Entry+1,5,'Time-lost proto-drake - 32491 Spawn 2'),
(@guid+8,@Entry+1,5,'Time-lost proto-drake - 32491 Spawn 3'),
(@guid+9,@Entry+1,5,'Time-lost proto-drake - 32491 Spawn 4');

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


