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
    SET @cOldContent = '064';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '01';
    SET @cNewContent = '065';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Haren and Friends';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Haren and Friends';

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

	-- Haren Swifthoof <Horde Runner>
	-- Stats, Waypoints moved to template & links
	UPDATE `creature_template` SET `MinLevel` = 19, `MaxLevel` = 21, `MinLevelHealth` = 1347, `MaxLevelHealth` = 1563, `Armor` = 872, `MeleeBaseAttackTime` = 2000, `RangedBaseAttackTime` = 2000, `MeleeAttackPower` = 74, `MinMeleeDmg` = 27.6, `MaxMeleeDmg` = 40.5, `SpeedWalk` = 1.47, `EquipmentTemplateId` = 9, `MovementType` = 2 WHERE `Entry` = 2478;
	UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE `id` = 2478;
	DELETE FROM `creature_movement` WHERE `id` = 9203;
	DELETE FROM `creature_movement_template` WHERE `entry` = 2478;
	INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
	(2478,1,-5715,-3532.59,304.363,0,0,100),
	(2478,2,-5708.71,-3539.77,304.927,0,0,100),
	(2478,3,-5696.26,-3549.28,305.553,0,0,100),
	(2478,4,-5696.04,-3563.09,307.879,0,0,100),
	(2478,5,-5683.63,-3578.94,309.475,0,0,100),
	(2478,6,-5673.26,-3598.36,311.779,0,0,100),
	(2478,7,-5668.69,-3618.71,311.241,0,0,100),
	(2478,8,-5656.84,-3631.12,313.19,0,0,100),
	(2478,9,-5637.64,-3647.74,313.295,0,0,100),
	(2478,10,-5628.38,-3653.29,315.804,0,0,100),
	(2478,11,-5611.56,-3663.43,315.753,0,0,100),
	(2478,12,-5599.39,-3675.01,310.735,0,0,100),
	(2478,13,-5593.27,-3682.56,311.473,0,0,100),
	(2478,14,-5583.53,-3692.58,312.236,0,0,100),
	(2478,15,-5558.26,-3718.74,314.809,0,0,100),
	(2478,16,-5547.13,-3729.79,315.279,0,0,100),
	(2478,17,-5532.32,-3736.85,319.71,0,0,100),
	(2478,18,-5518.84,-3743.2,321.883,0,0,100),
	(2478,19,-5507.82,-3747.65,321.133,0,0,100),
	(2478,20,-5495.93,-3748.09,317.427,0,0,100),
	(2478,21,-5485.81,-3751.94,318.135,0,0,100),
	(2478,22,-5469.53,-3755.6,318.54,0,0,100),
	(2478,23,-5440.11,-3763.5,312.986,0,0,100),
	(2478,24,-5425.37,-3766.01,307.263,0,0,100),
	(2478,25,-5416.88,-3767.38,306.686,0,0,100),
	(2478,26,-5405.11,-3769.28,304.145,0,0,100),
	(2478,27,-5381.23,-3768.62,304.111,0,0,100),
	(2478,28,-5364.66,-3773.09,307.75,0,0,100),
	(2478,29,-5335.57,-3772.66,309.76,0,0,100),
	(2478,30,-5313.28,-3774.64,310.507,0,0,100),
	(2478,31,-5294.28,-3774.4,311.725,0,0,100),
	(2478,32,-5283.5,-3773.5,313.175,0,0,100),
	(2478,33,-5269.97,-3770.9,310.333,0,0,100),
	(2478,34,-5252.31,-3764.21,311.713,0,0,100),
	(2478,35,-5229.61,-3764.81,312.428,0,0,100),
	(2478,36,-5209.89,-3759.83,316.056,0,0,100),
	(2478,37,-5195.93,-3757.96,317.291,0,0,100),
	(2478,38,-5181.29,-3767.63,315.119,0,0,100),
	(2478,39,-5171.83,-3774.92,318.758,0,0,100),
	(2478,40,-5160.5,-3771.2,315.972,0,0,100),
	(2478,41,-5147.19,-3764.44,312.087,0,0,100),
	(2478,42,-5140.54,-3761.92,313.572,0,0,100),
	(2478,43,-5131.09,-3758.43,315.852,0,0,100),
	(2478,44,-5117.03,-3750.7,311.711,0,0,100),
	(2478,45,-5106.87,-3743.72,310.59,0,0,100),
	(2478,46,-5090.94,-3742.13,314.915,0,0,100),
	(2478,47,-5078.41,-3737.28,315.945,0,0,100),
	(2478,48,-5069.79,-3734.66,313.867,0,0,100),
	(2478,49,-5057.92,-3724.99,313.285,0,0,100),
	(2478,50,-5047.39,-3714.41,308.729,0,0,100),
	(2478,51,-5035.13,-3699.37,307.327,0,0,100),
	(2478,52,-5029.97,-3694.52,309.468,0,0,100),
	(2478,53,-5018.97,-3687.51,311.094,0,0,100),
	(2478,54,-5005.5,-3679.48,309.622,0,0,100),
	(2478,55,-4992.95,-3670.7,308.633,0,0,100),
	(2478,56,-4983.18,-3664.49,308.778,0,0,100),
	(2478,57,-4974.57,-3659.26,307.049,0,0,100),
	(2478,58,-4965.17,-3653.17,306.027,0,0,100),
	(2478,59,-4953.16,-3645.6,305.543,0,0,100),
	(2478,60,-4936.53,-3629.55,301.459,0,0,100),
	(2478,61,-4918.53,-3615.76,301.658,0,0,100),
	(2478,62,-4909.42,-3608,299.888,0,0,100),
	(2478,63,-4899.41,-3601.47,300.646,0,0,100),
	(2478,64,-4883.72,-3592.13,303,0,0,100),
	(2478,65,-4874.71,-3586.8,303.55,0,0,100),
	(2478,66,-4858.9,-3579.51,306.629,0,0,100),
	(2478,67,-4843.63,-3573.52,308.854,0,0,100),
	(2478,68,-4821.6,-3565.26,306.365,0,0,100),
	(2478,69,-4808.92,-3569.72,306.615,0,0,100),
	(2478,70,-4807.43,-3583.79,306.914,0,0,100),
	(2478,71,-4812.13,-3600.65,304.855,0,0,100),
	(2478,72,-4819.79,-3613.01,305.19,0,0,100),
	(2478,73,-4834.75,-3631.45,301.168,0,0,100),
	(2478,74,-4850.36,-3634.94,303.953,0,0,100),
	(2478,75,-4869.61,-3639.31,309.091,0,0,100),
	(2478,76,-4883.67,-3643.09,311.184,0,0,100),
	(2478,77,-4899.46,-3654.56,306.54,0,0,100),
	(2478,78,-4911.03,-3659.76,306.942,0,0,100),
	(2478,79,-4934.39,-3678.28,309.722,0,0,100),
	(2478,80,-4950.92,-3680.97,314.305,0,0,100),
	(2478,81,-4967.22,-3692.79,312.559,0,0,100),
	(2478,82,-4980.66,-3703.46,312.768,0,0,100),
	(2478,83,-4993.64,-3710.89,309.605,0,0,100),
	(2478,84,-5012.97,-3714.74,309.506,0,0,100),
	(2478,85,-5021.8,-3720.27,311.863,0,0,100),
	(2478,86,-5042.86,-3734.46,313.431,0,0,100),
	(2478,87,-5056.44,-3743.58,312.945,0,0,100),
	(2478,88,-5074.08,-3754.02,313.064,0,0,100),
	(2478,89,-5086.43,-3759.33,315.71,0,0,100),
	(2478,90,-5121.39,-3770.12,317.671,0,0,100),
	(2478,91,-5137.71,-3776.47,314.535,0,0,100),
	(2478,92,-5156.44,-3786.46,319.694,0,0,100),
	(2478,93,-5171.74,-3796.54,320.909,0,0,100),
	(2478,94,-5192.41,-3807.62,326.627,0,0,100),
	(2478,95,-5205.32,-3804.04,323.667,0,0,100),
	(2478,96,-5222.53,-3816.4,319.621,0,0,100),
	(2478,97,-5241.03,-3804.78,314.503,0,0,100),
	(2478,98,-5255.6,-3804.21,321.447,0,0,100),
	(2478,99,-5270.32,-3806.16,322.783,0,0,100),
	(2478,100,-5284.83,-3805.6,319.087,0,0,100),
	(2478,101,-5303.21,-3800.79,316.619,0,0,100),
	(2478,102,-5320.5,-3803.47,317.329,0,0,100),
	(2478,103,-5331.87,-3808.22,319.848,0,0,100),
	(2478,104,-5353.68,-3816.81,321.646,0,0,100),
	(2478,105,-5372.14,-3824.82,324.627,0,0,100),
	(2478,106,-5392.87,-3824.3,325.009,0,0,100),
	(2478,107,-5412.06,-3832.56,328.74,0,0,100),
	(2478,108,-5425.14,-3829.5,326.605,0,0,100),
	(2478,109,-5441.55,-3824.69,319.735,0,0,100),
	(2478,110,-5448.59,-3802.57,312.419,0,0,100),
	(2478,111,-5451.77,-3790.4,314.842,0,0,100),
	(2478,112,-5462.93,-3777.33,317.202,0,0,100),
	(2478,113,-5481.86,-3759.86,318.398,0,0,100),
	(2478,114,-5490.5,-3756.27,318.159,0,0,100),
	(2478,115,-5502.08,-3749.4,319.484,0,0,100),
	(2478,116,-5513.5,-3743.5,321.614,0,0,100),
	(2478,117,-5528.06,-3739.88,320.744,0,0,100),
	(2478,118,-5550.57,-3731.97,316.075,0,0,100),
	(2478,119,-5562.59,-3718.69,315.128,0,0,100),
	(2478,120,-5584.17,-3693.93,312.437,0,0,100),
	(2478,121,-5586.19,-3680.67,308.662,0,0,100),
	(2478,122,-5586.75,-3659.4,307.935,0,0,100),
	(2478,123,-5598.77,-3642.8,310.471,0,0,100),
	(2478,124,-5613.19,-3624.67,312.083,0,0,100),
	(2478,125,-5628.16,-3608.16,310.771,0,0,100),
	(2478,126,-5641.76,-3598.29,311.739,0,0,100),
	(2478,127,-5655.46,-3590.58,309.931,0,0,100),
	(2478,128,-5669.56,-3570.82,308.149,0,0,100),
	(2478,129,-5683.45,-3553.73,305.661,0,0,100),
	(2478,130,-5697.93,-3542.56,305.626,0,0,100),
	(2478,131,-5714.33,-3524.31,303.827,0,0,100);
	-- links
	DELETE FROM `creature_linking` WHERE `master_guid` = 9203;
	INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
	(9204, 9203, 512+1),
	(9205, 9203, 512+1);

	-- Gradok
	-- speed corrected & equip. added
	-- No waypoints req. - linked to Haren Swifthoof <Horde Runner>
	UPDATE `creature_template` SET `SpeedWalk` = 1.48, `EquipmentTemplateId` = 60, `MovementType` = 0 WHERE `Entry` = 2477;
	UPDATE `creature` SET `position_x` = -5719.179688, `position_y` = -3523.120117, `position_z` = 302.745056, `orientation` = 4.21382, `spawndist` = 0, `MovementType` = 0 WHERE `guid` = 9204;
	DELETE FROM `creature_movement` WHERE `id` = 9204;

	-- Thraggomm
	-- speed corrected & equip. added
	-- No waypoints req. - linked to Haren Swifthoof <Horde Runner>
	UPDATE `creature_template` SET `SpeedWalk` = 1.48, `EquipmentTemplateId` = 60, `MovementType` = 0 WHERE `Entry` = 7170;
	UPDATE `creature` SET `position_x` = -5721.733887, `position_y` = -3521.174316, `position_z` = 302.734222, `orientation` = 4.21382, `spawndist` = 0, `MovementType` = 0 WHERE `guid` = 9205;
	DELETE FROM `creature_movement` WHERE `id` = 9205;

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


