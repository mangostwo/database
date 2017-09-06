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
    SET @cOldStructure = '06'; 
    SET @cOldContent = '062';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '063';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'NPC_21723_and_23219_rework';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'NPC_21723_and_23219_rework';

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
		
	-- Original `creature_table` credit @saltyteabag on Mangos forums
	SET @GUID := (SELECT MAX(guid) FROM `creature`);	
	DELETE FROM `creature_addon` WHERE `guid` IN (75829,23219,79020,132849,132850,132851,132852,132853,132854,132855,132856,132857);

	UPDATE `creature_template` SET `MovementType` = '1' WHERE `Entry` = '23219';
	
	DELETE FROM `creature` WHERE `id` in (21723,23219);
	-- Blackwind Sabercat
	INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
	(@GUID+1,21723,530,1,0,0,-3579.09,3127.08,316.218,4.46063,300,5,0,9082,0,0,2), 
	(@GUID+2,21723,530,1,0,0,-3521.83,3188.78,315.987,0.133883,300,5,0,9082,0,0,2), 
	(@GUID+3,21723,530,1,0,0,-3557.83,3210.94,309.894,0.701404,300,5,0,9082,0,0,2), 
	(@GUID+4,21723,530,1,0,0,-3522.41,3254.19,300.692,0.0237059,300,5,0,9082,0,0,2), 
	(@GUID+5,21723,530,1,0,0,-3491.7,3240.65,299.471,5.0402,300,5,0,9335,0,0,2), 
	(@GUID+6,21723,530,1,0,0,-3592,3108.93,313.471,3.65226,300,5,0,9082,0,0,1),
	(@GUID+7,21723,530,1,0,0,-3628,3152.13,312.232,5.46261,300,5,0,9082,0,0,1),
	(@GUID+8,21723,530,1,0,0,-3635.2,3195.33,313.079,1.25679,300,5,0,9082,0,0,1),
	(@GUID+9,21723,530,1,0,0,-3589.96,3078.44,312.028,0.121885,300,5,0,9082,0,0,1),
	(@GUID+10,21723,530,1,0,0,-3884.39,3663.14,282.98,1.71042,300,5,0,9082,0,0,1),
		-- Blackwind Warp Chaser
	(@GUID+11,23219,530,1,0,0,-3980.8,3843.33,311.171,4.91675,300,5,0,6761,0,0,1),
	(@GUID+12,23219,530,1,0,0,-4049.86,3838.69,311.338,5.54113,300,5,0,6761,0,0,1),
	(@GUID+13,23219,530,1,0,0,-3620.9,3830.29,252.654,5.46495,300,5,0,6761,0,0,1),
	(@GUID+14,23219,530,1,0,0,-4013.92,3816.53,295.209,4.84449,300,5,0,6761,0,0,1),
	(@GUID+15,23219,530,1,0,0,-3943.79,3820.7,304.288,5.0487,300,5,0,6761,0,0,1),
	(@GUID+16,23219,530,1,0,0,-4044.45,3812.25,322.578,5.92442,300,5,0,6761,0,0,1),
	(@GUID+17,23219,530,1,0,0,-3916,3789.33,292.158,6.0383,300,5,0,6761,0,0,1),
	(@GUID+18,23219,530,1,0,0,-3978.43,3772.52,297.621,5.83411,300,5,0,6761,0,0,1),
	(@GUID+19,23219,530,1,0,0,-3881.56,3743.59,292.811,6.01935,300,5,0,6761,0,0,1),
	(@GUID+20,23219,530,1,0,0,-3952,3746.13,295.164,1.2991,300,5,0,6761,0,0,1),
	(@GUID+21,23219,530,1,0,0,-3583.73,3703.56,297.135,3.5532,300,5,0,6761,0,0,1),
	(@GUID+22,23219,530,1,0,0,-4052.31,3710.37,306.278,5.53633,300,5,0,6761,0,0,1),
	(@GUID+23,23219,530,1,0,0,-3980.8,3659.73,283.776,0.878926,300,5,0,6761,0,0,1),
	(@GUID+24,23219,530,1,0,0,-4047.68,3668.24,306.398,0.00322247,300,5,0,6761,0,0,1),
	(@GUID+25,23219,530,1,0,0,-4011.21,3616.44,284.694,5.37536,300,5,0,6761,0,0,1),
	(@GUID+26,23219,530,1,0,0,-3990.23,3626.12,281.06,2.24555,300,5,0,6761,0,0,1),
	(@GUID+27,23219,530,1,0,0,-4067.39,3600.96,307.354,5.56385,300,5,0,6761,0,0,1),
	(@GUID+28,23219,530,1,0,0,-4036.84,3584.99,283.626,2.43012,300,5,0,6761,0,0,1),
	(@GUID+29,23219,530,1,0,0,-4078.97,3550.15,289.219,6.0783,300,5,0,6761,0,0,1),
	(@GUID+30,23219,530,1,0,0,-4102.72,3532.28,302.316,5.62277,300,5,0,6761,0,0,1),
	(@GUID+31,23219,530,1,0,0,-4038.4,3519.33,275.796,3.49434,300,5,0,6761,0,0,1),
	(@GUID+32,23219,530,1,0,0,-4120.8,3511.24,289.791,4.88449,300,5,0,6761,0,0,1),
	(@GUID+33,23219,530,1,0,0,-3447.12,3479.2,286.354,1.62508,300,5,0,6761,0,0,1),
	(@GUID+34,23219,530,1,0,0,-3586.72,3481.46,284.289,0.584409,300,5,0,6761,0,0,1),
	(@GUID+35,23219,530,1,0,0,-4055.58,3482.39,284.16,0.148523,300,5,0,6761,0,0,1),
	(@GUID+36,23219,530,1,0,0,-3613.94,3454.79,292.394,4.01661,300,5,0,6761,0,0,1),
	(@GUID+37,23219,530,1,0,0,-4119.98,3449.87,289.589,1.69969,300,5,0,6761,0,0,1),
	(@GUID+38,23219,530,1,0,0,-4182.4,3350.28,264.474,2.24552,300,5,0,6761,0,0,1),
	(@GUID+39,23219,530,1,0,0,-4133.33,3289.43,290.98,4.24043,300,5,0,6761,0,0,1),
	(@GUID+40,23219,530,1,0,0,-3951.45,3771.58,290.822,5.00226,300,5,0,6761,0,0,1),
	(@GUID+41,23219,530,1,0,0,-3897.48,3815.27,305.551,4.25535,300,5,0,6761,0,0,1),
	(@GUID+42,23219,530,1,0,0,-3995.75,3827.26,311.997,5.48056,300,5,0,6761,0,0,1),
	(@GUID+43,23219,530,1,0,0,-4026.86,3790.19,292.218,0.842772,300,5,0,6761,0,0,1);

	DELETE FROM `creature_movement` WHERE `id` IN (75893,75897,75899,140769,140770);
	INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
	(@GUID+1,1,-3568.68,3139.93,315.043,0,0,0,0,0,0,0,0,0,1.03754,0,0),
	(@GUID+1,2,-3561.34,3155.8,313.88,0,0,0,0,0,0,0,0,0,6.12849,0,0),
	(@GUID+1,3,-3548.51,3150.03,316.169,0,0,0,0,0,0,0,0,0,5.82848,0,0),
	(@GUID+1,4,-3539.39,3148.19,314.788,0,0,0,0,0,0,0,0,0,0.271785,0,0),
	(@GUID+1,5,-3526.79,3156.78,315.301,0,0,0,0,0,0,0,0,0,0.633107,0,0),
	(@GUID+1,6,-3522.28,3161.36,315.193,0,0,0,0,0,0,0,0,0,1.67376,0,0),
	(@GUID+1,7,-3535.61,3149.71,314.956,0,0,0,0,0,0,0,0,0,3.60898,0,0),
	(@GUID+1,8,-3545.89,3147.29,315.075,0,0,0,0,0,0,0,0,0,2.85186,0,0),
	(@GUID+1,9,-3551.95,3152.98,316.087,0,0,0,0,0,0,0,0,0,2.75997,0,0),
	(@GUID+1,10,-3561.65,3153.16,313.949,0,0,0,0,0,0,0,0,0,3.99922,0,0),
	(@GUID+1,11,-3568.63,3140.61,315.063,0,0,0,0,0,0,0,0,0,4.2584,0,0),
	(@GUID+1,12,-3582.56,3123.18,315.775,0,0,0,0,0,0,0,0,0,3.96388,0,0),
	(@GUID+2,1,-3527.22,3178.89,316.906,0,0,0,0,0,0,0,0,0,4.40628,0,0),
	(@GUID+2,2,-3527.43,3171.43,317.063,0,0,0,0,0,0,0,0,0,5.03067,0,0),
	(@GUID+2,3,-3522.81,3163.53,315.422,0,0,0,0,0,0,0,0,0,5.80039,0,0),	
	(@GUID+2,4,-3513.18,3160.94,316.212,0,0,0,0,0,0,0,0,0,5.85144,0,0),
	(@GUID+2,5,-3506.16,3153.53,314.594,0,0,0,0,0,0,0,0,0,5.43126,0,0),
	(@GUID+2,6,-3512.24,3160.96,316.164,0,0,0,0,0,0,0,0,0,2.69729,0,0),
	(@GUID+2,7,-3523.14,3162.26,315.303,0,0,0,0,0,0,0,0,0,2.15114,0,0),
	(@GUID+2,8,-3528.31,3175.28,317.054,0,0,0,0,0,0,0,0,0,1.52047,0,0),
	(@GUID+2,9,-3521.96,3187.97,316.155,0,0,0,0,0,0,0,0,0,0.880319,0,0),
	(@GUID+3,1,-3552.02,3222.28,307.958,0,0,0,0,0,0,0,0,0,1.13522,0,0),
	(@GUID+3,2,-3556.98,3209.75,309.921,0,0,0,0,0,0,0,0,0,4.90434,0,0),
	(@GUID+3,3,-3552.94,3200.65,310.456,0,0,0,0,0,0,0,0,0,5.47079,0,0),
	(@GUID+3,4,-3532.93,3189.69,314.899,0,0,0,0,0,0,0,0,0,5.76209,0,0),
	(@GUID+3,5,-3527.84,3183.87,316.585,0,0,0,0,0,0,0,0,0,5.38903,0,0),
	(@GUID+3,6,-3537.02,3193.84,313.544,0,0,0,0,0,0,0,0,0,2.73203,0,0),
	(@GUID+3,7,-3553.85,3201.59,310.415,0,0,0,0,0,0,0,0,0,2.33278,0,0),
	(@GUID+3,8,-3557.78,3208.74,310.26,0,0,0,0,0,0,0,0,0,2.0304,0,0),
	(@GUID+4,1,-3512.91,3253.65,298.684,0,0,0,0,0,0,0,0,0,5.52543,0,0),
	(@GUID+4,2,-3509.42,3247.42,297.527,0,0,0,0,0,0,0,0,0,4.89712,0,0),
	(@GUID+4,3,-3508.96,3238.18,291.435,0,0,0,0,0,0,0,0,0,2.40741,0,0),	
	(@GUID+4,4,-3509.74,3247.4,297.482,0,0,0,0,0,0,0,0,0,1.56703,0,0),
	(@GUID+4,5,-3510.9,3254.41,298.329,0,0,0,0,0,0,0,0,0,2.41352,0,0),
	(@GUID+4,6,-3520.29,3251.55,300.414,0,0,0,0,0,0,0,0,0,3.74712,0,0),
	(@GUID+4,7,-3529.47,3244.12,301.703,0,0,0,0,0,0,0,0,0,3.60732,0,0),
	(@GUID+4,8,-3544.26,3234.75,303.708,0,0,0,0,0,0,0,0,0,3.92855,0,0),
	(@GUID+4,9,-3550.47,3226.39,307.004,0,0,0,0,0,0,0,0,0,4.16495,0,0),
	(@GUID+4,10,-3543.36,3236.64,303.118,0,0,0,0,0,0,0,0,0,0.771562,0,0),
	(@GUID+4,11,-3523.98,3253.32,300.861,0,0,0,0,0,0,0,0,0,0.200578,0,0),
	(@GUID+5,1,-3491.98,3230.37,298.39,0,0,0,0,0,0,0,0,0,4.26973,0,0),
	(@GUID+5,2,-3499.64,3217.43,296.899,0,0,0,0,0,0,0,0,0,4.19904,0,0),
	(@GUID+5,3,-3490.54,3233.88,298.693,0,0,0,0,0,0,0,0,0,1.81536,0,0),
	(@GUID+5,4,-3497.68,3253.86,299.642,0,0,0,0,0,0,0,0,0,1.66849,0,0),
	(@GUID+5,5,-3499.37,3269.09,301.012,0,0,0,0,0,0,0,0,0,1.70383,0,0),
	(@GUID+5,6,-3501.71,3273.94,300.778,0,0,0,0,0,0,0,0,0,4.20925,0,0),
	(@GUID+5,7,-3498.72,3268.99,301.056,0,0,0,0,0,0,0,0,0,5.13994,0,0),
	(@GUID+5,8,-3498.38,3254.15,299.717,0,0,0,0,0,0,0,0,0,4.93181,0,0),
	(@GUID+5,9,-3491.69,3241.45,299.476,0,0,0,0,0,0,0,0,0,5.19491,0,0);


    
    

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

