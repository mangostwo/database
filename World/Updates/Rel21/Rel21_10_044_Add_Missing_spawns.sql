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
    SET @cOldContent = '043';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '044';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Add Missing spawns';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Add Missing spawns';

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

	-- Add missing spawns for NPC. 23929 (reused some guids from previous spawns)	
SET @guid := (SELECT MAX(guid) FROM `creature`);
DELETE FROM `creature` WHERE `id` = 23929;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState` , `MovementType`) VALUES
(107125,23929,571,1,0,0,1380.87,-6553.34,-46.0397,3.75887,120,5,0,6986,0,0,1),
(107126,23929,571,1,0,0,1178.16,-6519.18,-92.6671,3.49053,120,5,0,6986,0,0,1),
(107127,23929,571,1,0,0,1127.72,-6511.93,-94.9859,4.03204,120,5,0,6986,0,0,1),
(107132,23929,571,1,0,0,1084.16,-6485.23,-108.969,0.212526,120,5,0,6986,0,0,1),
(107133,23929,571,1,0,0,1720.83,-6354.17,-23.7564,3.14898,120,5,0,6986,0,0,1),
(107135,23929,571,1,0,0,1786.48,-6348.83,-15.2513,5.5867,120,5,0,6986,0,0,1),
(107136,23929,571,1,0,0,1874.23,-6321.7,-14.4408,3.35624,120,5,0,6986,0,0,1),
(107137,23929,571,1,0,0,1815.15,-6316.67,-13.0728,4.24623,120,5,0,6986,0,0,1),
(107138,23929,571,1,0,0,1751.38,-6316.02,-10.6918,3.97021,120,5,0,6986,0,0,1),
(107139,23929,571,1,0,0,1921.83,-6288.6,-31.8866,2.20375,120,5,0,6986,0,0,1),
(107140,23929,571,1,0,0,1776.06,-6286.88,-8.2746,2.98275,120,5,0,6986,0,0,1),
(107156,23929,571,1,0,0,1854.28,-6285.03,-2.87107,0.0351761,120,5,0,6986,0,0,1),
(107167,23929,571,1,0,0,2012.07,-6258.69,-24.4352,1.65296,120,5,0,6986,0,0,1),
(107168,23929,571,1,0,0,2013.99,-6254.52,-21.0002,1.11239,120,5,0,6986,0,0,1),
(@guid+1,23929,571,1,0,0,2184.75,-6251.81,-16.2896,5.52749,120,5,0,6986,0,0,1),
(@guid+2,23929,571,1,0,0,2450,-6250.84,-23.5807,5.0633,120,5,0,6986,0,0,1),
(@guid+3,23929,571,1,0,0,2087.86,-6250.41,-10.2408,1.35658,120,5,0,6986,0,0,1),
(@guid+4,23929,571,1,0,0,1812.82,-6244.17,1.26266,2.48745,120,5,0,6986,0,0,1),
(@guid+5,23929,571,1,0,0,2081.6,-6220.62,-5.55964,5.52056,120,5,0,6986,0,0,1),
(@guid+6,23929,571,1,0,0,2120.03,-6220.33,-5.7332,5.31485,120,5,0,6986,0,0,1),
(@guid+7,23929,571,1,0,0,2479.46,-6216.99,-9.75119,5.71361,120,5,0,6986,0,0,1),
(@guid+8,23929,571,1,0,0,2145.8,-6215.91,-7.7219,3.83821,120,5,0,6986,0,0,1),
(@guid+9,23929,571,1,0,0,2079.09,-6215.77,-5.04378,5.08146,120,5,0,6986,0,0,1),
(@guid+10,23929,571,1,0,0,2115,-6212.78,-4.30846,3.27798,120,5,0,6986,0,0,1),
(@guid+11,23929,571,1,0,0,2031.48,-6194.68,-3.0017,3.62125,120,5,0,6986,0,0,1),
(@guid+12,23929,571,1,0,0,2039.88,-6193.42,-3.0808,0.669874,120,5,0,6986,0,0,1),
(@guid+13,23929,571,1,0,0,2275.88,-6190.43,-3.25158,4.12133,120,5,0,6986,0,0,1),
(@guid+14,23929,571,1,0,0,2357.83,-6189.61,-5.10993,4.9512,120,5,0,6986,0,0,1),
(@guid+15,23929,571,1,0,0,2517.97,-6183.57,-14.0471,0.978736,120,5,0,6986,0,0,1),
(@guid+16,23929,571,1,0,0,2153.74,-6181.97,-3.17175,5.22499,120,5,0,6986,0,0,1),
(@guid+17,23929,571,1,0,0,2416.96,-6180.48,-10.0151,5.76622,120,5,0,6986,0,0,1),
(@guid+18,23929,571,1,0,0,2309.37,-6179.75,-1.2286,4.35545,120,5,0,6986,0,0,1),
(@guid+19,23929,571,1,0,0,2244.72,-6174,-2.61165,4.02546,120,5,0,6986,0,0,1),
(@guid+20,23929,571,1,0,0,2117.71,-6161.98,-0.612643,3.14159,120,5,0,6986,0,0,1),
(@guid+21,23929,571,1,0,0,2377.89,-6160.93,-19.9129,1.64061,120,5,0,6986,0,0,1),
(@guid+22,23929,571,1,0,0,2179.93,-6160.38,-2.80301,4.36779,120,5,0,6986,0,0,1),
(@guid+23,23929,571,1,0,0,2122.89,-6158.37,0.62808,0.982948,120,5,0,6986,0,0,1),
(@guid+24,23929,571,1,0,0,2071.58,-6157.18,0.163639,5.93208,120,5,0,6986,0,0,1),
(@guid+25,23929,571,1,0,0,2062.05,-6156.65,2.23745,2.62823,120,5,0,6986,0,0,1),
(@guid+26,23929,571,1,0,0,2221.76,-6150.81,-3.64033,6.07286,120,5,0,6986,0,0,1),
(@guid+27,23929,571,1,0,0,2268.05,-6148.23,0.821551,4.07243,120,5,0,6986,0,0,1),
(@guid+28,23929,571,1,0,0,2441.39,-6147.94,-9.38678,5.72769,120,5,0,6986,0,0,1),
(@guid+29,23929,571,1,0,0,2440.74,-6130.04,1.54857,0.089943,120,5,0,6986,0,0,1),
(@guid+30,23929,571,1,0,0,2271.88,-6126.52,-1.59584,4.71239,120,5,0,6986,0,0,1),
(@guid+31,23929,571,1,0,0,2259.83,-6126.42,-1.83034,5.52305,120,5,0,6986,0,0,1),
(@guid+32,23929,571,1,0,0,2125.11,-6124.74,3.69367,0.0787468,120,5,0,6986,0,0,1),
(@guid+33,23929,571,1,0,0,2219.4,-6119.52,-0.341469,5.78852,120,5,0,6986,0,0,1),
(@guid+34,23929,571,1,0,0,2074.68,-6119.5,5.27722,0.47133,120,5,0,6986,0,0,1),
(@guid+35,23929,571,1,0,0,2077.34,-6119.32,5.13345,4.80429,120,5,0,6986,0,0,1),
(@guid+36,23929,571,1,0,0,2074.84,-6118.76,5.49396,5.97088,120,5,0,6986,0,0,1),
(@guid+37,23929,571,1,0,0,2119.83,-6118.03,4.80304,4.13213,120,5,0,6986,0,0,1),
(@guid+38,23929,571,1,0,0,2481.23,-6117.84,-16.3463,0.0152843,120,5,0,6986,0,0,1),
(@guid+39,23929,571,1,0,0,2151.33,-6116.62,3.72677,0.791242,120,5,0,6986,0,0,1),
(@guid+40,23929,571,1,0,0,2351.13,-6115.32,-4.71268,3.42782,120,5,0,6986,0,0,1),
(@guid+41,23929,571,1,0,0,2431.06,-6115.15,1.2024,0.123614,120,5,0,6986,0,0,1),
(@guid+42,23929,571,1,0,0,2220.19,-6099.62,0.647043,4.56719,120,5,0,6986,0,0,1),
(@guid+43,23929,571,1,0,0,2384.59,-6092.62,-3.65338,5.48191,120,5,0,6986,0,0,1),
(@guid+44,23929,571,1,0,0,2254.74,-6091.32,-2.02408,5.40238,120,5,0,6986,0,0,1),
(@guid+45,23929,571,1,0,0,2436.97,-6086.43,-7.68864,2.88879,120,5,0,6986,0,0,1),
(@guid+46,23929,571,1,0,0,2335.33,-6080.07,1.33865,0.232657,120,5,0,6986,0,0,1),
(@guid+47,23929,571,1,0,0,2314.29,-6078.78,-3.04941,1.25522,120,5,0,6986,0,0,1),
(@guid+48,23929,571,1,0,0,2164.45,-6072.66,6.89298,2.31672,120,5,0,6986,0,0,1),
(@guid+49,23929,571,1,0,0,2386.74,-6067.29,-0.0482798,5.71414,120,5,0,6986,0,0,1),
(@guid+50,23929,571,1,0,0,2423.32,-6059,-6.10526,3.63626,120,5,0,6986,0,0,1),
(@guid+51,23929,571,1,0,0,2285.16,-6048.63,1.53001,1.07223,120,5,0,6986,0,0,1),
(@guid+52,23929,571,1,0,0,2343.83,-6044.39,1.27729,1.88351,120,5,0,6986,0,0,1),
(@guid+53,23929,571,1,0,0,2386.8,-6029.24,1.68957,5.42739,120,5,0,6986,0,0,1);

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


