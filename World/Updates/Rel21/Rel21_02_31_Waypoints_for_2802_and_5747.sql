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
    SET @cOldStructure = '02'; 
    SET @cOldContent = '30';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '31';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Waypoints_for_2802_and_5747';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Waypoints_for_2802_and_5747';

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

-- Backported from ClasicDB (Thanks to Tobschinski from UDB)

-- waypoints
-- Susan Tillinghas
UPDATE `creature` SET `position_x`='1390.215', `position_y`='35.21756', `position_z`='-62.19329', `orientation`='2.079669', `MovementType`='2' WHERE `id`= 2802;
DELETE FROM `creature_movement` WHERE `id`= 38101;
DELETE FROM `creature_movement_template` WHERE `entry`= 2802;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(2802, '01', '1378.640', '55.96495', '-62.27666', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '02', '1383.241', '83.34830', '-62.27637', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '03', '1399.806', '97.16917', '-62.28856', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '04', '1417.964', '141.0208', '-62.29459', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '05', '1433.981', '149.9107', '-62.28405', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '06', '1447.694', '137.1492', '-62.29281', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '07', '1461.869', '120.9715', '-60.18844', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '08', '1464.949', '111.2182', '-60.18949', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '09', '1479.520', '98.09299', '-60.19012', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '10', '1484.867', '94.61426', '-62.24970', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '11', '1500.437', '81.32889', '-62.29831', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '12', '1481.725', '47.70671', '-62.29490', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '13', '1442.540', '36.23264', '-62.27830', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '14', '1416.399', '21.24002', '-62.27507', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '15', '1405.658', '23.78299', '-62.27616', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '16', '1387.197', '36.69661', '-62.27608', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
-- Hepzibah Sedgewick
UPDATE `creature` SET `position_x`='1533.843', `position_y`='202.2378', `position_z`='-62.18006', `orientation`='5.400798', `MovementType`='2' WHERE `id`= 5747;
DELETE FROM `creature_movement` WHERE `id`= 38100;
DELETE FROM `creature_movement_template` WHERE `entry`= 5747;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(5747, '01', '1542.791', '191.3619', '-62.18080', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '02', '1559.787', '178.5941', '-62.18031', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '03', '1577.523', '172.1603', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '04', '1587.420', '169.3764', '-62.17775', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '05', '1594.174', '161.3339', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '06', '1594.491', '131.5768', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '07', '1592.605', '113.0221', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '08', '1582.281', '104.4307', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '09', '1563.744', '107.6496', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '10', '1547.055', '113.0844', '-62.14216', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '11', '1537.052', '122.4526', '-61.50877', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '12', '1532.863', '139.5267', '-62.17167', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '13', '1521.765', '154.1877', '-62.16089', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '14', '1509.385', '165.7573', '-62.14750', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '15', '1501.144', '174.2727', '-62.16182', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '16', '1488.744', '180.8999', '-62.17804', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '17', '1474.736', '188.0014', '-62.18966', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '18', '1465.005', '201.3092', '-62.17617', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '19', '1462.536', '211.2530', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '20', '1461.918', '229.9350', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '21', '1474.278', '240.6842', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '22', '1514.806', '238.4358', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '23', '1525.648', '233.3281', '-62.17818', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '24', '1526.560', '219.5792', '-62.17558', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '25', '1531.405', '205.2021', '-62.17986', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    

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

