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
    SET @cOldStructure = '02'; 
    SET @cOldContent = '014';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '02';
    SET @cNewContent = '015';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Quest11656 full script';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Quest11656 full script';

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

	-- Thanks for cmangos for the base outline to get this working.
	UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` IN (25510,25511,25512,25513);
	UPDATE `creature` SET `phaseMask` = 2, `spawndist` = 0, `spawntimesecs` = 300, `MovementType` = 0 WHERE `id` IN (25510,25511,25512,25513);

	DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (25510,25511,25512,25513);
	INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
	(2551001,25510,8,0,100,1,45692,-1,0,0,1,-20250,0,0,48,2,0,0,0,0,0,0,'1st Kvaldir Vessel (The Serpent\'s Maw) - BOSS_EMOTE and Set Waypoint on Spellhit'),
	(2551101,25511,8,0,100,1,45692,-1,0,0,1,-20251,0,0,48,2,0,0,0,0,0,0,'2nd Kvaldir Vessel (The Kur Drakkar) - BOSS_EMOTE and Set Waypoint on Spellhit'),
	(2551201,25512,8,0,100,1,45692,-1,0,0,1,-20252,0,0,48,2,0,0,0,0,0,0,'3rd Kvaldir Vessel (Bor\'s Hammer) - BOSS_EMOTE and Set Waypoint on Spellhit'),
	(2551301,25513,8,0,100,1,45692,-1,0,0,01,-20253,0,0,48,2,0,0,0,0,0,0,'4th Kvaldir Vessel (Bor\'s Anvil) - BOSS_EMOTE and Set Waypoint on Spellhit');

	DELETE FROM `creature_ai_texts` WHERE `entry` IN (-20250,-20251,-20252,-20253);
	INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
	(-20253,'Bor\'s Anvil is engulfed in tuskarr fire!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,25513),
	(-20252,'Bor\'s Hammer is engulfed in tuskarr fire!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,25512),
	(-20251,'The Kur Drakkar is engulfed in tuskarr fire!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,25511),
	(-20250,'The Serpent\'s Maw is engulfed in tuskarr fire!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,25510);

	DELETE FROM `creature_movement_template` WHERE `entry` IN (25510,25511,25512,25513);
	INSERT INTO `creature_movement_template` (`entry`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`script_id`) VALUES
	(25510,1,3048.65,6752.09,6.49282,4.29351,3000,2551001),
	(25511,1,3027.45,6788.63,6.59145,4.11898,3000,2551101),
	(25512,1,2868.42,6864.51,3.80855,2.02458,3000,2551201),
	(25513,1,2521.02,6849.6,3.03381,4.85202,3000,2551301);

	DELETE FROM `db_scripts` WHERE `id` IN (2551001,2551101,2551201,2551301);
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(3,2551001,2,9,515611,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551001,2,9,515612,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551001,2,9,515613,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551001,2,9,515614,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551001,2,9,515615,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551001,59,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'1st Kvaldir Vessel movement chenged to 0:idle'),
	(3,2551101,2,9,515616,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551101,2,9,515617,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551101,2,9,515618,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551101,2,9,515619,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551101,2,9,515620,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551101,59,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'2nd Kvaldir Vessel movement chenged to 0:idle'),
	(3,2551201,2,9,515621,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551201,2,9,515622,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551201,2,9,515623,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551201,2,9,515624,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551201,2,9,515625,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551201,59,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'3rd Kvaldir Vessel movement chenged to 0:idle'),
	(3,2551301,2,9,515626,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551301,2,9,515627,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551301,2,9,515628,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551301,2,9,515629,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551301,2,9,515630,60,0,0,0,0,0,0,0,0,0,0,0,'respawn Kvaldir Inferno'),
	(3,2551301,59,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'4th Kvaldir Vessel movement chenged to 0:idle');

	DELETE FROM `gameobject` WHERE `guid` IN (515611,515612,515613,515614,515615,515616,515617,515618,515619,515620,515621,515622,515623,515624,515625,515626,515627,515628,515629,515630);
	INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecS`,`animprogress`,`state`) VALUES
	(515611,187704,571,1,2,3043.89,6745.26,10.3406,6.14356,0,0,-0.0697555,0.997564,-60,255,1),
	(515612,187704,571,1,2,3049.33,6757.82,5.4179,5.35816,0,0,-0.446198,0.894934,-60,255,1),
	(515613,187704,571,1,2,3054.12,6764.73,3.6063,1.50098,0,0,0.681998,0.731354,-60,255,1),
	(515614,187704,571,1,2,3053.36,6773.64,3.81377,2.42601,0,0,0.936672,0.350207,-60,255,1),
	(515615,187704,571,1,2,3064.19,6785.3,8.44076,4.04917,0,0,-0.898793,0.438373,-60,255,1),
	(515616,187704,571,1,2,3025.19,6784.23,8.37501,6.03884,0,0,-0.121869,0.992546,-60,255,1),
	(515617,187704,571,1,2,3035.19,6794.02,4.21026,3.83973,0,0,-0.939692,0.342021,-60,255,1),
	(515618,187704,571,1,2,3044.21,6799.38,3.34549,4.7822,0,0,-0.681998,0.731354,-60,255,1),
	(515619,187704,571,1,2,3056.19,6807.48,7.09576,0.872664,0,0,0.422618,0.906308,-60,255,1),
	(515620,187704,571,1,2,3043.33,6791.39,3.04209,4.4855,0,0,-0.782608,0.622515,-60,255,1),
	(515621,187704,571,1,2,2877.17,6855.26,15.0139,4.36332,0,0,-0.819152,0.573577,-60,255,1),
	(515622,187704,571,1,2,2867.66,6862.61,3.956,3.26377,0,0,-0.998135,0.0610518,-60,255,1),
	(515623,187704,571,1,2,2862.17,6871.53,2.13493,0.977383,0,0,0.469471,0.882948,-60,255,1),
	(515624,187704,571,1,2,2866.58,6875.24,2.7175,4.69494,0,0,-0.71325,0.70091,-60,255,1),
	(515625,187704,571,1,2,2852.2,6875.29,1.91545,4.08407,0,0,-0.891007,0.453991,-60,255,1),
	(515626,187704,571,1,2,2515.69,6852.45,3.77591,5.16618,0,0,-0.529919,0.848048,-60,255,1),
	(515627,187704,571,1,2,2524.15,6848.55,5.44467,1.93731,0,0,0.824125,0.566408,-60,255,1),
	(515628,187704,571,1,2,2524.67,6853.06,4.36284,3.42085,0,0,-0.990268,0.139175,-60,255,1),
	(515629,187704,571,1,2,2522.52,6851.04,4.77891,3.76991,0,0,-0.951056,0.309017,-60,255,1),
	(515630,187704,571,1,2,2520.26,6846.32,5.93863,1.5708,0,0,0.707107,0.707107,-60,255,1);

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


