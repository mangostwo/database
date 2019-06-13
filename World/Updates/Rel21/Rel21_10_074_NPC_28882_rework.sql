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
    SET @cOldContent = '073';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '074';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'NPC 28882 rework';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'NPC 28882 rework';

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
SET @guid := (SELECT MAX(guid) FROM `creature`); 
-- Update  script, Spirit Burn is now supported via creature_addon.
DELETE FROM `creature_ai_scripts` WHERE `id` = 2888201 AND `creature_id` = 28882;
UPDATE `creature_ai_scripts` SET`id` = 2888201 WHERE `id`= 2888202 AND `creature_id` = 28882;

-- Reworked spawn locations some MovementTypes and missing spawns.
DELETE FROM `creature` WHERE `id` = 28882;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`, `curmana`, `MovementType`) VALUES
(115833,28882,571,6588.17,-4020.24,490.592,4.90438,300,0,11001,3643,0),
(115832,28882,571,6580.19,-3967.34,486.127,0,300,0,11001,3643,0),
(115831,28882,571,6563.52,-4027.12,483.392,4.57276,300,0,11001,3643,0),
(115830,28882,571,6558.42,-3791.73,488.396,1.33697,300,6,11001,3643,1),
(115829,28882,571,6554.08,-3890.06,491.293,3.19395,300,0,11001,3643,0),
(115828,28882,571,6553.98,-4006.03,483.14,3.05433,300,0,11001,3643,0),
(115827,28882,571,6553.85,-3977.93,482.591,3.08923,300,0,11001,3643,0),
(115826,28882,571,6553.46,-3917.45,491.02,3.10669,300,0,11001,3643,0),
(115825,28882,571,6545.94,-3943.64,491.595,4.7473,300,0,11001,3643,0),
(115824,28882,571,6545.78,-3860.77,491.42,1.55334,300,0,11001,3643,0),
(115823,28882,571,6537.9,-4077.25,468.617,1.51835,300,10,11001,3643,1),
(115822,28882,571,6518.02,-3890.55,482.491,3.15905,300,0,11001,3643,0),
(115821,28882,571,6516.84,-3919.04,482.338,3.08923,300,0,11001,3643,0),
(115820,28882,571,6512.63,-3952.8,482.358,0.88118,300,7,11001,3643,1),
(115819,28882,571,6510.91,-4044.12,468.976,5.48121,300,8,11001,3643,1),
(115818,28882,571,6509.36,-3842.43,482.348,5.00836,300,10,11001,3643,1),
(115817,28882,571,6497.08,-4105.45,469.054,4.01426,300,0,11001,3643,0),
(115816,28882,571,6492.6,-3782.31,470.715,1.46021,300,6,11001,3643,1),
(115815,28882,571,6488.46,-3899.49,483.733,3.92521,300,10,11001,3643,1),
(115814,28882,571,6482.06,-3966.48,482.039,3.9492,300,0,11001,3643,2),
(115813,28882,571,6474.38,-4078.73,468.95,2.96706,300,0,11001,3643,0),
(115812,28882,571,6473.16,-4019.36,470.915,3.03687,300,0,11001,3643,0),
(115811,28882,571,6471.05,-3991.99,471.46,3.12414,300,0,11001,3643,0),
(115810,28882,571,6469.21,-3869.75,482.28,3.30148,300,8,11001,3643,1),
(115809,28882,571,6464.81,-3928.34,482.302,2.52063,300,8,11001,3643,1),
(115808,28882,571,6464.7,-4048.99,468.278,4.11898,300,0,11001,3643,0),
(115807,28882,571,6459.62,-3785.04,470.799,6.24828,300,0,11001,3643,0),
(115806,28882,571,6440.44,-3900.44,470.84,2.98451,300,0,11001,3643,0),
(115805,28882,571,6437.55,-3974.85,470.824,2.97711,300,9,11001,3643,1),
(115804,28882,571,6432.91,-4016.68,472.965,3.87463,300,0,11001,3643,0),
(115803,28882,571,6432.43,-3806.22,470.799,4.67748,300,0,11001,3643,0),
(115802,28882,571,6428.94,-3830.58,470.724,2.06213,300,10,11001,3643,1),
(115801,28882,571,6427.3,-3866.62,470.801,1.58764,300,6,11001,3643,1),
(115800,28882,571,6425.76,-3934.07,470.764,2.92227,300,6,11001,3643,1),
(115799,28882,571,6411.97,-3992.99,473.178,3.83972,300,0,11001,3643,0),
(115798,28882,571,6411.45,-3902.44,470.833,5.93527,300,10,11001,3643,1),
(115797,28882,571,6390.47,-3772.85,473.21,3.12414,300,0,11001,3643,0),
(115796,28882,571,6390.07,-3809.9,473.198,3.08923,300,0,11001,3643,0),
(115795,28882,571,6389.13,-3839.67,473.35,3.00197,300,0,11001,3643,0),
(115792,28882,571,6388.12,-3970.03,473.157,3.92699,300,0,11001,3643,0),
(115789,28882,571,6377.64,-3907.95,472.169,3.24631,300,0,11001,3643,0),
(@guid+1,28882,571,6377.56,-3941.59,472.422,3.28122,300,0,11001,3643,0),
(@guid+2,28882,571,6375.78,-3873.08,474.452,3.12414,300,0,11001,3643,0);

-- Added missigng waypoints
DELETE FROM `creature_movement` WHERE `id` = 115814;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(115814,1,6468.51,-3967.28,476.65),
(115814,2,6456.76,-3966.48,470.76),
(115814,3,6432.88,-3966.22,470.76),
(115814,4,6408.63,-3951.46,470.76),
(115814,5,6408.01,-3933.6,470.76),
(115814,6,6407.89,-3915.91,470.83),
(115814,7,6407.05,-3900.08,470.83),
(115814,8,6407.39,-3885.26,470.75),
(115814,9,6407.86,-3866.48,470.68),
(115814,10,6407.77,-3847.17,470.68),
(115814,11,6432.9,-3829.65,470.72),
(115814,12,6456.96,-3829.42,470.84),
(115814,13,6467.95,-3829.13,476.32),
(115814,14,6485.63,-3828.97,481.97),
(115814,15,6494.09,-3844.11,482.44),
(115814,16,6487.43,-3859,482.69),
(115814,17,6465.31,-3875.13,482.26),
(115814,18,6464.95,-3901.06,482.3),
(115814,19,6465.89,-3923.73,482.3),
(115814,20,6482.68,-3938.78,482.96),
(115814,21,6493.83,-3954.18,482.34),
(115814,22,6481.75,-3966.81,482.03);


INSERT INTO `creature_addon` (`guid`, `b2_0_sheath`, `emote`, `auras`) VALUES
(115833,1,375,'52617 52619 54647'),
(115832,1,375,'52618 52619 54647'),
(115831,1,375,'52614 52619 54647'),
(115830,1,375,'52617 52619 54647'),
(115829,1,375,'52618 52619 54647'),
(115828,1,375,'52614 52619 54647'),
(115827,1,375,'52617 52619 54647'),
(115826,1,375,'52618 52619 54647'),
(115825,1,375,'52614 52619 54647'),
(115824,1,375,'52617 52619 54647'),
(115823,1,375,'52618 52619 54647'),
(115822,1,375,'52614 52619 54647'),
(115821,1,375,'52617 52619 54647'),
(115820,1,375,'52618 52619 54647'),
(115819,1,375,'52614 52619 54647'),
(115818,1,375,'52617 52619 54647'),
(115817,1,375,'52618 52619 54647'),
(115816,1,375,'52614 52619 54647'),
(115815,1,375,'52617 52619 54647'),
(115814,1,375,'52618 52619 54647'),
(115813,1,375,'52614 52619 54647'),
(115812,1,375,'52617 52619 54647'),
(115811,1,375,'52618 52619 54647'),
(115810,1,375,'52614 52619 54647'),
(115809,1,375,'52617 52619 54647'),
(115808,1,375,'52618 52619 54647'),
(115807,1,375,'52614 52619 54647'),
(115806,1,375,'52617 52619 54647'),
(115805,1,375,'52618 52619 54647'),
(115804,1,375,'52614 52619 54647'),
(115803,1,375,'52617 52619 54647'),
(115802,1,375,'52618 52619 54647'),
(115801,1,375,'52614 52619 54647'),
(115800,1,375,'52617 52619 54647'),
(115799,1,375,'52618 52619 54647'),
(115798,1,375,'52614 52619 54647'),
(115797,1,375,'52617 52619 54647'),
(115796,1,375,'52618 52619 54647'),
(115795,1,375,'52614 52619 54647'),
(115792,1,375,'52617 52619 54647'),
(115789,1,375,'52618 52619 54647'),
(@guid+1,1,375,'52614 52619 54647'),
(@guid+2,1,375,'52617 52619 54647');

    

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


