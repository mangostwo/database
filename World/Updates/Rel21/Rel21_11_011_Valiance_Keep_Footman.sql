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
    SET @cOldContent = '010';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '011';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Valiance Keep Footman';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Valiance Keep Footman';

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

SET @dbscript_id := (SELECT MAX(`id`) FROM `db_scripts`);

-- Update Valiance Keep Footman Move.
UPDATE `creature` SET `MovementType` = 2 where `guid` IN (111383,111376,111377,111378,111379,111380,111381,111403,111382,111370);

INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(3,@dbscript_id+1,1,1,4,0,0,0,0,5,21,0,0,0,0,0,0,'Valiance Keep Footman Emote random 1'),
(3,@dbscript_id+2,1,1,36,0,0,0,0,43,0,0,0,0,0,0,0,'Valiance Keep Footman Emote random 2');

-- Valiance Keep Footman Waypoints added.
DELETE FROM `creature_movement` WHERE `id` IN (111383,111376,111377,111378,111379,111380,111381,111403,111382,111370);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(111370,1,2112.32,5280,45.7232,2.45,0,0),
(111370,2,2108.87,5282.85,45.7232,1.36,0,0),
(111370,3,2110.99,5291.02,45.7234,2.21,0,0),
(111370,4,2105.67,5300.09,45.7237,1.28,0,0),
(111370,5,2111.98,5317.25,45.7237,0.51,0,0),
(111370,6,2121,5322.04,45.7239,0.96,0,0),
(111370,7,2124.46,5329.21,45.7239,6.16,0,0),
(111370,8,2131.68,5328.6,45.7239,6.01,0,0),
(111370,9,2139.26,5322.95,45.7252,5.98,0,0),
(111370,10,2156.41,5317.43,45.727,0.01,0,0),
(111370,11,2167.32,5316.74,45.7238,5.17,0,0),
(111370,12,2171.67,5309.2,45.7238,4.36,0,0),
(111370,13,2168.38,5304.05,45.7238,4.36,0,0),
(111370,14,2159.92,5279.2,45.7253,4.73,0,0),
(111370,15,2159.6,5271.47,45.7238,3.91,0,0),
(111370,16,2156.23,5269.9,45.7238,3.51,0,0),
(111370,17,2151.21,5267.44,45.7238,2.78,0,0),
(111370,18,2142.85,5272.95,45.7246,2.66,0,0),
(111370,19,2124.72,5278.97,45.7268,2.84,0,0),
(111376,1,2353.95,5225.06,7.71537,5.18363,9000,@dbscript_id+2),
(111377,1,2358.55,5204.63,7.71538,5.89921,4000,@dbscript_id+2),
(111378,1,2343.82,5212.07,7.71537,6.03884,12000,@dbscript_id+1),
(111378,2,2343.82,5212.07,7.71537,6.03884,15000,@dbscript_id+1),
(111379,1,2354.85,5223.55,7.71538,2.18166,1000,@dbscript_id+2),
(111379,2,2354.85,5223.55,7.71538,2.18166,9000,@dbscript_id+2),
(111380,1,2350.78,5210.33,7.71537,3.29867,3000,0),
(111380,2,2350.78,5210.33,7.71537,3.29867,3000,@dbscript_id+2),
(111381,1,2349.15,5209.93,7.71537,0.349066,2000,0),
(111381,2,2349.15,5209.93,7.71537,0.349066,9000,@dbscript_id+2),
(111382,1,2349.19,5225.74,7.71537,5.95157,5000,0),
(111382,2,2349.19,5225.74,7.71537,5.95157,16000,@dbscript_id+1),
(111382,3,2349.19,5225.74,7.71537,5.95157,11000,@dbscript_id+1),
(111383,1,2364.89,5221.37,7.71537,6.05629,2000,0),
(111383,2,2364.89,5221.37,7.71537,6.05629,4000,@dbscript_id+2),
(111403,1,2119.65,5274.81,45.7252,5.94453,0,0),
(111403,2,2141.74,5267.52,45.7257,5.95316,0,0),
(111403,3,2149.27,5267.87,45.7243,0.176555,0,0),
(111403,4,2154.02,5269.57,45.7243,6.25082,0,0),
(111403,5,2158.62,5269.62,45.7243,1.16616,0,0),
(111403,6,2160.46,5273.87,45.723,0.798569,0,0),
(111403,7,2163.87,5277.47,45.7241,1.25253,0,0),
(111403,8,2171.3,5297.91,45.7266,1.20933,0,0),
(111403,9,2171.5,5306.5,45.7236,1.66094,0,0),
(111403,10,2169.53,5312.24,45.7236,2.01829,0,0),
(111403,11,2166.52,5317.13,45.7236,2.79584,0,0),
(111403,12,2164.14,5317.97,45.7239,2.82333,0,0),
(111403,13,2161.3,5321.61,45.724,2.94674,0,0),
(111403,14,2137.44,5328.99,45.7252,3.15636,0,0),
(111403,15,2130.8,5328.72,45.7236,3.27181,0,0),
(111403,16,2124.69,5328.4,45.7236,4.09962,0,0),
(111403,17,2119.3,5320.15,45.7238,3.47523,0,0),
(111403,18,2113.66,5318.81,45.7239,3.55691,0,0),
(111403,19,2105.93,5316.01,45.7208,4.32424,0,0),
(111403,20,2102.26,5304.51,45.7208,5.15284,0,0),
(111403,21,2109.79,5291.32,45.7236,4.67846,0,0),
(111403,22,2108.79,5283.74,45.7236,5.52198,0,0),
(111403,23,2114.3,5279.47,45.7236,5.95394,0,0),
(111403,24,2116.45,5278.52,45.7236,5.91075,0,0);

-- Slight adjustment to a Valiance Keep Footman's current waypoints.
UPDATE `creature_movement` SET `position_x` = 2224.28, `position_y` = 5319.164 WHERE `id` = 112681 AND `point` IN (6,7,8);

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


