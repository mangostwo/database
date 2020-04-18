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
    SET @cOldContent = '046';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '047';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Seething Hate';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Seething Hate';

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

UPDATE `creature` SET `MovementType` = 2 WHERE `id` = 32429;

UPDATE `creature` SET `position_x` = 3913.28, `position_y` = -2804.43, `position_z` = 176.136, `orientation` = 1.75467, `MovementType` = 2 WHERE `guid` = 56805;
UPDATE `creature` SET `position_x` = 3601.19, `position_y` = -3275.54, `position_z` = 222.069, `orientation` = 4.60829, `MovementType` = 2 WHERE `guid` = 56867;
UPDATE `creature` SET `position_x` = 3972.31, `position_y` = -2710.12, `position_z` = 165.749, `orientation` = 6.28272, `MovementType` = 2 WHERE `guid` = 56934;

DELETE FROM `creature_movement_template` WHERE `entry` = 32429;
DELETE FROM `creature_movement` WHERE `id` IN (56805,56867,56934);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(56805,1,3914.64,-2811.73,176.035),
(56805,2,3910.45,-2789.21,176.345),
(56805,3,3899.45,-2774.81,179.922),
(56805,4,3883.77,-2762.44,180.683),
(56805,5,3863.91,-2771.26,182.467),
(56805,6,3870.54,-2795.73,185.782),
(56805,7,3874.64,-2820.69,186.361),
(56805,8,3861.94,-2826.29,194.502),
(56805,9,3844.67,-2828.68,206.266),
(56805,10,3862.23,-2826.11,194.246),
(56805,11,3875.01,-2820.37,186.166),
(56805,12,3870.33,-2795.59,185.825),
(56805,13,3863.68,-2771.13,182.492),
(56805,14,3883.85,-2762.48,180.676),
(56805,15,3899.03,-2774.58,179.908),
(56805,16,3910.59,-2789.55,176.336),
(56867,1,3602.62,-3261.86,223.254),
(56867,2,3600.13,-3285.68,221.19),
(56867,3,3612.67,-3314.48,224.333),
(56867,4,3627.88,-3321.89,226.626),
(56867,5,3642.65,-3310.33,232.081),
(56867,6,3636.16,-3289.7,234.983),
(56867,7,3640.39,-3268.97,237.568),
(56867,8,3647.36,-3262.85,244.636),
(56867,9,3665.79,-3269.94,258.923),
(56867,10,3647.21,-3262.61,244.662),
(56867,11,3640.71,-3269.23,237.656),
(56867,12,3636.3,-3289.98,235.052),
(56867,13,3642.77,-3309.78,232.181),
(56867,14,3628.16,-3321.83,226.662),
(56867,15,3612.91,-3314.7,224.379),
(56867,16,3600.32,-3285.27,221.203),
(56934,1,3972.31,-2710.12,165.749),
(56934,2,3994.54,-2710.63,166.165),
(56934,3,4010.8,-2700.4,169.548),
(56934,4,4024.02,-2692.07,170.056),
(56934,5,4028.75,-2677.16,170.718),
(56934,6,4019.32,-2664.35,172.436),
(56934,7,3996.03,-2670.11,175.433),
(56934,8,3971.52,-2671.67,175.248),
(56934,9,3965.5,-2664.6,180.133),
(56934,10,3968,-2645.01,191.221),
(56934,11,3965.42,-2664.39,180.293),
(56934,12,3971.68,-2671.68,175.206),
(56934,13,3995.7,-2670.05,175.402),
(56934,14,4019.76,-2664.91,172.329),
(56934,15,4028.62,-2677.35,170.694),
(56934,16,4023.92,-2692.11,170.042),
(56934,17,4010.4,-2700.42,169.57),
(56934,18,3994.81,-2710.23,166.12);    

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


