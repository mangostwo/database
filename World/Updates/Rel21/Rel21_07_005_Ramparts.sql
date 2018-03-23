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
    SET @cOldStructure = '07'; 
    SET @cOldContent = '004';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '005';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Ramparts';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Ramparts';

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

    -- Shattered Hand Warhound, Hellfire Watcher, Bonechewer Hungerer Waypoints. 
	-- Ported most of the waypoint data from MangosOne, although this data works, there is a lot of timing issues.
	UPDATE `creature` SET `MovementType` = '2' WHERE `guid` IN (62065,62066,62088,62089,61997,61996,140287,140288);
	DELETE FROM `creature_movement` WHERE id IN (62065,62066,62088,62089,61997,61996,140287,140288);
	INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
	(61996,1,-1337.58,1676.92,91.7461,0,0,0,0,0,0,0,0,0,2.14132,0,0),
	(61996,2,-1358.19,1701.99,84.6861,0,0,0,0,0,0,0,0,0,2.40209,0,0),
	(61996,3,-1337.58,1676.92,91.7461,0,0,0,0,0,0,0,0,0,2.14132,0,0),
	(61996,4,-1324.93,1661.38,93.0835,0,0,0,0,0,0,0,0,0,5.34654,0,0),
	(61997,1,-1341.47,1673.42,91.9497,0,0,0,0,0,0,0,0,0,2.3738,0,0),
	(61997,2,-1362.19,1696.98,85.4709,1200,0,0,0,0,0,0,0,0,2.5144,0,0),
	(61997,3,-1341.47,1673.42,91.9497,0,0,0,0,0,0,0,0,0,2.3738,0,0),
	(61997,4,-1328.64,1658.68,93.0325,0,0,0,0,0,0,0,0,0,5.43294,0,0),
	(62065,1,-1254.69,1651.98,67.6227,5000,0,0,0,0,0,0,0,0,1.89886,0,0),
	(62065,2,-1266.15,1665.13,68.6966,0,0,0,0,0,0,0,0,0,2.58216,0,0),
	(62065,3,-1246.15,1629.88,68.5187,0,0,0,0,0,0,0,0,0,5.00511,0,0),
	(62065,4,-1243.43,1594.26,68.5017,0,0,0,0,0,0,0,0,0,4.86374,0,0),
	(62066,1,-1261.15,1649.92,68.245,5000,0,0,0,0,0,0,0,0,1.80854,0,0),
	(62066,2,-1270.43,1661.05,68.8871,0,0,0,0,0,0,0,0,0,2.16982,0,0),
	(62066,3,-1252.28,1626.99,68.5677,0,0,0,0,0,0,0,0,0,5.06794,0,0),
	(62066,4,-1249.94,1592.31,68.537,0,0,0,0,0,0,0,0,0,4.65168,0,0),
	(62088,1,-1173.09,1475.87,68.441,1250,0,0,0,0,0,0,0,0,0.978148,0,0),
	(62088,2,-1174.64,1510.89,68.4544,1750,0,0,0,0,0,0,0,0,1.75727,0,0),
	(62088,3,-1198.89,1537.19,68.5069,1000,0,0,0,0,0,0,0,0,2.16489,0,0),
	(62088,4,-1174.64,1510.89,68.4544,3000,0,0,0,0,0,0,0,0,1.75727,0,0),
	(62088,5,-1173.09,1475.87,68.441,2000,0,0,0,0,0,0,0,0,0.978148,0,0),
	(62088,6,-1185.88,1453.9,68.4424,3700,0,0,0,0,0,0,0,0,1.4753,0,0),
	(62089,1,-1166.42,1473.43,68.4305,0,0,0,0,0,0,0,0,0,1.11009,0,0),
	(62089,2,-1166.19,1512.86,68.4341,0,0,0,0,0,0,0,0,0,1.8099,0,0),
	(62089,3,-1193.19,1544.67,68.4508,250,0,0,0,0,0,0,0,0,2.4382,0,0),
	(62089,4,-1166.19,1512.86,68.4341,300,0,0,0,0,0,0,0,0,1.8099,0,0),
	(62089,5,-1166.42,1473.43,68.4305,0,0,0,0,0,0,0,0,0,1.11009,0,0),
	(62089,6,-1177.59,1451.68,68.4293,5000,0,0,0,0,0,0,0,0,1.38027,0,0),
	(140287,1,-1289.36,1539.25,68.5901,0,0,0,0,0,0,0,0,0,100,0,0),
	(140287,2,-1279.81,1552.57,68.5851,30,0,0,0,0,0,0,0,0,100,0,0),
	(140287,3,-1267.42,1569.06,68.6271,350,0,0,0,0,0,0,0,0,100,0,0),
	(140287,4,-1289.23,1536.42,68.5873,240,0,0,0,0,0,0,0,0,100,0,0),
	(140287,5,-1289.77,1524.95,68.5844,150,0,0,0,0,0,0,0,0,100,0,0),
	(140287,6,-1280.87,1502.53,68.5742,0,0,0,0,0,0,0,0,0,100,0,0),
	(140287,7,-1257.94,1481.64,68.5684,80,0,0,0,0,0,0,0,0,100,0,0),
	(140287,8,-1229.54,1460.75,68.5746,200,0,0,0,0,0,0,0,0,100,0,0),
	(140287,9,-1210.81,1457.39,68.5413,3900,0,0,0,0,0,0,0,0,100,0,0),
	(140287,10,-1229.96,1460.89,68.575,250,0,0,0,0,0,0,0,0,100,0,0),
	(140287,11,-1244.58,1469.86,68.5707,190,0,0,0,0,0,0,0,0,100,0,0),
	(140287,12,-1274.92,1497.11,68.5682,0,0,0,0,0,0,0,0,0,100,0,0),
	(140287,13,-1287.01,1521.16,68.5775,400,0,0,0,0,0,0,0,0,100,0,0),
	(140288,1,-1294.37,1542.72,68.602,0,0,0,0,0,0,0,0,0,0.9388,0,0),
	(140288,2,-1272.88,1572.54,68.6008,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,3,-1297.15,1538.07,68.6,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,4,-1296.3,1524.55,68.5967,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,5,-1288.55,1500.25,68.5883,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,6,-1266.22,1475.75,68.5841,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,7,-1249.47,1462.39,68.5849,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,8,-1232,1453.83,68.5856,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,9,-1211.44,1449.15,68.557,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,10,-1229.43,1453.25,68.5838,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,11,-1246.05,1463.8,68.5792,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,12,-1263.1,1478.87,68.5778,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,13,-1278.24,1492.96,68.577,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,14,-1285.99,1504.05,68.5803,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,15,-1293.19,1518.94,68.5873,0,0,0,0,0,0,0,0,0,100,0,0),
	(140288,16,-1297.28,1534.09,68.6081,0,0,0,0,0,0,0,0,0,0.9388,0,0);
	-- Link Hellfire Sentry
	DELETE FROM `creature_linking` WHERE `guid` IN (63011, 63012) OR `master_guid` IN (63011, 63012);
	INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES (63011, 63012, 3);
	-- Reinforced Fel Iron Chest correctly positioned
	UPDATE `gameobject` SET `orientation` = 5.33003 , `rotation2` = 0.458741 , `rotation3` = -0.88857 WHERE `guid` = 20496;
    

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

