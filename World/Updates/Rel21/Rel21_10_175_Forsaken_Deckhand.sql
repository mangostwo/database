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
    SET @cOldContent = '174';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '175';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Forsaken Deckhand';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Forsaken Deckhand';

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
-- Missing Forsaken Deckhand spawns added.
DELETE FROM `creature` WHERE `id` = 23982;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(112374,23982,571,1,1,0,0,1585.26,-6439.69,8.1282,5.74213,300,0,0,20958,0,0,0),
(112397,23982,571,1,1,0,0,1693.28,-6480.37,4.67026,2.49582,300,0,0,20958,0,0,0),
(@guid+1,23982,571,1,1,0,0,1571.94,-6444.88,13.4798,4.64258,300,0,0,20958,0,0,0),
(@guid+2,23982,571,1,1,0,0,1560.88,-6554.92,7.85555,4.7822,300,0,0,20958,0,0,0),
(@guid+3,23982,571,1,1,0,0,1555.81,-6473.45,8.12772,1.8326,300,0,0,20958,0,0,0),
(@guid+4,23982,571,1,1,0,0,1648.43,-6518.75,7.92241,2.6529,300,0,0,20958,0,0,0),
(@guid+5,23982,571,1,1,0,0,1683.73,-6489.54,0.600268,3.38594,300,0,0,20958,0,0,0),
(@guid+6,23982,571,1,1,0,0,1659.26,-6516.77,12.9779,1.02974,300,0,0,20958,0,0,0),
(@guid+7,23982,571,1,1,0,0,1664.66,-6497.61,7.92616,0.349066,300,0,0,20958,0,0,0),
(@guid+8,23982,571,1,1,0,0,1569.21,-6459.58,0.798187,0.959931,300,0,0,20958,0,0,0),
(@guid+9,23982,571,1,1,0,0,1585.64,-6442.62,0.80031,0.907571,300,0,0,20958,0,0,0),
(@guid+10,23982,571,1,1,0,0,1661.93,-6510.17,0.595421,1.41372,300,0,0,20958,0,0,0),
(@guid+11,23982,571,1,1,0,0,1595.97,-6429.72,4.87117,5.88176,300,0,0,20958,0,0,0),
(@guid+12,23982,571,1,1,0,0,1667.07,-6513.15,7.92516,1.44862,300,0,0,20958,0,0,0),
(@guid+13,23982,571,1,1,0,0,1648.63,-6515.61,0.981542,0.0349066,300,0,0,20958,0,0,0),
(@guid+14,23982,571,1,1,0,0,1571.11,-6554.08,19.5447,4.2237,300,0,0,20958,0,0,0),
(@guid+15,23982,571,1,1,0,0,1641.51,-6496.98,19.3894,2.49582,300,0,0,20958,0,0,0),
(@guid+16,23982,571,1,1,0,0,1557.06,-6466.08,19.1378,0.191986,300,0,0,20958,0,0,0),
(@guid+17,23982,571,1,1,0,0,1667.19,-6503.34,13.7694,4.50295,300,0,0,20958,0,0,0),
(@guid+18,23982,571,1,1,0,0,1562.99,-6467.94,11.5577,0.872665,300,0,0,20958,0,0,0),
(@guid+19,23982,571,1,1,0,0,1693.21,-6481.45,20.3186,4.32842,300,0,0,20958,0,0,0),
(@guid+20,23982,571,1,1,0,0,1660.06,-6516.17,18.1532,0.401426,300,0,0,20958,0,0,0),
(@guid+21,23982,571,1,1,0,0,1556.01,-6468.7,1.18524,0.296706,300,0,0,20958,0,0,0),
(@guid+22,23982,571,1,1,0,0,1572.78,-6465.26,13.9275,2.02458,300,0,0,20958,0,0,0),
(@guid+23,23982,571,1,1,0,0,1608.47,-6469.64,11.9444,2.3911,300,0,0,20958,0,0,0),
(@guid+24,23982,571,1,1,0,0,1566.2,-6453.87,8.1297,5.20108,300,0,0,20958,0,0,0),
(@guid+25,23982,571,1,1,0,0,1633.75,-6476.69,5.27008,3.26377,300,0,0,20958,0,0,0),
(@guid+26,23982,571,1,1,0,0,1654.91,-6506.14,16.7789,0.734061,300,0,0,20958,0,0,0),
(@guid+27,23982,571,1,1,0,0,1592.84,-6430.96,20.0984,4.57276,300,0,0,20958,0,0,0),
(@guid+28,23982,571,1,1,0,0,1545.82,-6573.38,13.7573,0.366519,300,0,0,20958,0,0,0),
(@guid+29,23982,571,1,1,0,0,1676.57,-6488.01,7.84255,0.599511,300,0,0,20958,0,0,0),
(@guid+30,23982,571,1,1,0,0,1680.69,-6489.71,15.3545,4.69494,300,0,0,20958,0,0,0),
(@guid+31,23982,571,1,1,0,0,1678.84,-6484.38,7.92603,5.16617,300,0,0,20958,0,0,0),
(@guid+32,23982,571,1,1,0,0,90.354,-6339.57,7.26617,4.71239,300,0,0,20958,0,0,0),
(@guid+33,23982,571,1,1,0,0,138.983,-6343.52,0.738089,2.79253,300,0,0,20958,0,0,0),
(@guid+34,23982,571,1,1,0,0,51.7076,-6311.95,3.26146,5.77704,300,0,0,20958,0,0,0),
(@guid+35,23982,571,1,1,0,0,115.475,-6363.24,0.35067,2.40855,300,0,0,20958,0,0,0),
(@guid+36,23982,571,1,1,0,0,100.026,-6375.11,19.098,2.60054,300,0,0,20958,0,0,0),
(@guid+37,23982,571,1,1,0,0,119.949,-6359.69,13.327,5.20108,300,0,0,20958,0,0,0),
(@guid+38,23982,571,1,1,0,0,70.9303,-6330.43,3.64416,2.84489,300,0,0,20958,0,0,0),
(@guid+39,23982,571,1,1,0,0,86.4615,-6311.13,3.16059,4.53786,300,0,0,20958,0,0,0),
(@guid+40,23982,571,1,1,0,0,131.832,-6340.61,12.7331,0.820305,300,0,0,20958,0,0,0),
(@guid+41,23982,571,1,1,0,0,104.829,-6357.47,7.67447,5.23599,300,0,0,20958,0,0,0),
(@guid+42,23982,571,1,1,0,0,98.5699,-6344.55,7.78851,2.86234,300,0,0,20958,0,0,0),
(@guid+43,23982,571,1,1,0,0,97.1263,-6329.79,6.33893,5.37561,300,0,0,20958,0,0,0),
(@guid+44,23982,571,1,1,0,0,133.646,-6343.11,18.5296,1.48353,300,0,0,20958,0,0,0),
(@guid+45,23982,571,1,1,0,0,129.184,-6351.27,0.35067,3.49066,300,0,0,20958,0,0,0),
(@guid+46,23982,571,1,1,0,0,129.186,-6345.83,0.35067,5.5676,300,0,0,20958,0,0,0),
(@guid+47,23982,571,1,1,0,0,120.393,-6350.11,13.4889,4.15388,300,0,0,20958,0,0,0),
(@guid+48,23982,571,1,1,0,0,110.554,-6371.23,7.68106,1.27409,300,0,0,20958,0,0,0),
(@guid+49,23982,571,1,1,0,0,83.5573,-6293.27,2.66013,5.27089,300,0,0,20958,0,0,0),
(@guid+50,23982,571,1,1,0,0,103.771,-6368.57,0.356418,2.0944,300,0,0,20958,0,0,0),
(@guid+51,23982,571,1,1,0,0,96.0175,-6378.46,4.4255,5.53269,300,0,0,20958,0,0,0);

-- Add missing aura and emote on Forsaken Deckhand.
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` = 23982);
INSERT INTO `creature_addon` VALUES
(112374,0,0,0,0,333,0,NULL),
(112397,0,0,0,0,333,0,NULL),
(@guid+1,0,0,0,0,333,0,NULL),
(@guid+2,0,0,0,0,333,0,NULL),
(@guid+3,0,0,0,0,333,0,NULL),
(@guid+4,0,0,0,0,333,0,NULL),
(@guid+5,0,0,0,0,333,0,NULL),
(@guid+6,0,0,0,0,333,0,NULL),
(@guid+7,0,0,0,0,333,0,NULL),
(@guid+8,0,0,0,0,333,0,NULL),
(@guid+9,0,0,0,0,333,0,NULL),
(@guid+10,0,0,0,0,333,0,NULL),
(@guid+11,0,0,0,0,333,0,NULL),
(@guid+12,0,0,0,0,333,0,NULL),
(@guid+13,0,0,0,0,333,0,NULL),
(@guid+14,0,0,0,0,333,0,NULL),
(@guid+15,0,0,0,0,333,0,NULL),
(@guid+16,0,0,0,0,333,0,NULL),
(@guid+17,0,0,0,0,333,0,NULL),
(@guid+18,0,0,0,0,333,0,NULL),
(@guid+19,0,0,0,0,333,0,NULL),
(@guid+20,0,0,0,0,333,0,NULL),
(@guid+21,0,0,0,0,333,0,NULL),
(@guid+22,0,0,0,0,333,0,NULL),
(@guid+23,0,0,0,0,333,0,NULL),
(@guid+24,0,0,0,0,333,0,NULL),
(@guid+25,0,0,0,0,333,0,NULL),
(@guid+26,0,0,0,0,333,0,NULL),
(@guid+27,0,0,0,0,333,0,NULL),
(@guid+28,0,0,0,0,333,0,NULL),
(@guid+29,0,0,0,0,333,0,NULL),
(@guid+30,0,0,0,0,333,0,NULL),
(@guid+31,0,0,0,0,333,0,NULL),
(@guid+32,0,0,0,0,0,0,29266),
(@guid+33,0,0,0,0,0,0,29266),
(@guid+34,0,0,0,0,0,0,29266),
(@guid+35,0,0,0,0,0,0,29266),
(@guid+36,0,0,0,0,0,0,29266),
(@guid+37,0,0,0,0,0,0,29266),
(@guid+38,0,0,0,0,0,0,29266),
(@guid+39,0,0,0,0,0,0,29266),
(@guid+40,0,0,0,0,0,0,29266),
(@guid+41,0,0,0,0,0,0,29266),
(@guid+42,0,0,0,0,0,0,29266),
(@guid+43,0,0,0,0,0,0,29266),
(@guid+44,0,0,0,0,0,0,29266),
(@guid+45,0,0,0,0,0,0,29266),
(@guid+46,0,0,0,0,0,0,29266),
(@guid+47,0,0,0,0,0,0,29266),
(@guid+48,0,0,0,0,0,0,29266),
(@guid+49,0,0,0,0,0,0,29266),
(@guid+50,0,0,0,0,0,0,29266),
(@guid+51,0,0,0,0,0,0,29266);



   

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


