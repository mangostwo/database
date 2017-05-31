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
    SET @cOldContent = '025';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '026';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'game_object_2846';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Tattered Chest, pool and loot drop';

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

SET @GUID := (SELECT MAX(guid) FROM `gameobject`);

-- Tattered Chest o.2846
-- missing objects added
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(@GUID+1, 2846, 530, 1,1,-2415.964, -11222.41, 24.28668, 2.722713, 0, 0, 0.9781475, 0.2079121, 1200, 255, 1),
(@GUID+2, 2846, 530, 1,1,-1523.141, -11818.05, 23.2169, 0.2792516, 0, 0, 0.1391726, 0.9902682, 1200, 255, 1),
(@GUID+3, 2846, 530, 1,1,-1622.558, -11917.32, 9.328012, 4.450591, 0, 0, -0.7933531, 0.6087617, 1200, 255, 1),
(@GUID+4, 2846, 530, 1,1,-2187.591, -12299.38, 56.22134, 3.455756, 0, 0, -0.9876881, 0.1564362, 1200, 255, 1),
(@GUID+5, 2846, 530, 1,1,-2537.432, -12280.47, 14.01218, 3.647741, 0, 0, -0.9681473, 0.2503814, 1200, 255, 1),
(@GUID+6, 2846, 530, 1,1,-2816.792, -11521.46, 3.551014, 6.0912, 0, 0, -0.09584522, 0.9953963, 1200, 255, 1),
(@GUID+7, 2846, 530, 1,1,-2514.786, -11127.4, 16.80916, 3.961899, 0, 0, -0.9170599, 0.3987495, 1200, 255, 1),
(@GUID+8, 2846, 530, 1,1,-1806.039, -11684.3, 33.98169, 3.926996, 0, 0, -0.9238787, 0.3826855, 1200, 255, 1),
(@GUID+9, 2846, 530, 1,1,-1845.209, -12093.42, 33.01601, 1.012289, 0, 0, 0.4848089, 0.8746201, 1200, 255, 1),
(@GUID+10, 2846, 530, 1,1,-2508.188, -11249.02, 36.19548, 5.550147, 0, 0, -0.3583679, 0.9335805, 1200, 255, 1),
(@GUID+11, 2846, 530, 1,1,-2532.938, -11961.82, 20.45258, 0, 0, 0, 0, 1, 1200, 255, 1),
(@GUID+12, 2846, 530, 1,1,-1485.679, -11930.55, 19.05024, 3.211419, 0, 0, -0.9993906, 0.03490613, 1200, 255, 1),
(@GUID+13, 2846, 530, 1,1,-2513.007, -12197.33, 27.98298, 5.77924, 0, 0, 0.7716246, 0.6360782, 1200, 255, 1),
(@GUID+14, 2846, 530, 1,1,-2816.554, -11721, 0.128298, 0.6981314, 0, 0, 0.34202, 0.9396927, 1200, 255, 1),
(@GUID+15, 2846, 530, 1,1,-2820.95, -11420.7, 5.26642, 6.07981, 0, 0, 0.101514, -0.994834, 1200, 255, 1),
(@GUID+16, 2846, 530, 1,1,-2315.082, -11191.03, 13.9421, 1.902409, 0, 0, 0.8141155, 0.580703, 1200, 255, 1),
(@GUID+17, 2846, 530, 1,1,-2816.642, -11219.69, 2.085383, 1.326448, 0, 0, 0.6156607, 0.7880114, 1200, 255, 1),
(@GUID+18, 2846, 530, 1,1,-2259.26, -12321.5, 57.2953, 6.24316, 0, 0, 0.0200129, -0.9998, 1200, 255, 1);

-- Pools 
DELETE FROM pool_template WHERE entry BETWEEN 25552 AND 25558;
INSERT INTO pool_template (entry, max_limit, description) VALUES 
(25552,1,'Bloodmyst Isle - Tattered Chest - Pool 1'),
(25553,1,'Bloodmyst Isle - Tattered Chest - Pool 2'),
(25554,1,'Bloodmyst Isle - Tattered Chest - Pool 3'),
(25555,1,'Bloodmyst Isle - Tattered Chest - Pool 4'),
(25556,1,'Bloodmyst Isle - Tattered Chest - Pool 5'),
(25557,1,'Bloodmyst Isle - Tattered Chest - Pool 6'),
(25558,1,'Bloodmyst Isle - Tattered Chest - Pool 7');
-- only one can be spawned on each of pools.
DELETE FROM pool_gameobject WHERE guid IN (85442,91361,85470,85438,85472,85471);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES 
-- 2 random spawns
(@GUID+11,25552,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 1'),
(85442,25552,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 1'),
-- Bristlelimb enclave
(@GUID+5,25553,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 2'),
(@GUID+13,25553,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 2'),
(91361,25553,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 2'),
 -- Bladewood
(@GUID+8,25554,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 3'),
(85470,25554,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 3'),
(85438,25554,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 3'),
-- Nazzivian
(@GUID+10,25555,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 4'),
(@GUID+7,25555,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 4'),
(@GUID+1,25555,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 4'),
(@GUID+16,25555,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 4'),
-- Ragefeather Ridge
(@GUID+3,25556,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 5'),
(@GUID+12,25556,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 5'),
(@GUID+2,25556,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 5'),
(85472,25556,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 5'),
-- Blacksilt shore
(@GUID+14,25557,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 6'),
(@GUID+6,25557,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 6'),
(@GUID+15,25557,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 6'),
(@GUID+17,25557,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 6'),
-- Ruins of Loreth'Aran & Wrathscale Lair
(@GUID+9,25558,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 7'),
(@GUID+4,25558,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 7'),
(85471,25558,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 7'),
(@GUID+18,25558,0,'2846 - Bloodmyst Isle - Tattered Chest - Pool 7');

-- Drop Redone
DELETE FROM gameobject_loot_template WHERE entry = 2278;
INSERT INTO gameobject_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id) VALUES
-- consumable items - grup 1
(2278,2455,0,1,1,2,0),
(2278,858,0,1,1,2,0),
(2278,118,0,1,2,3,0),
-- consumable items - grup 2
(2278,1179,0,2,1,1,0),
(2278,414,0,2,1,1,0),
(2278,2287,0,2,1,1,0),
(2278,4541,0,2,1,1,0),
(2278,4537,0,2,1,1,0),
(2278,4605,0,2,1,1,0),
-- craft items - grup 3
(2278,2589,0,3,1,3,0),
(2278,2318,0,3,2,3,0),
(2278,2996,0,3,1,1,0),
(2278,2835,0,3,2,3,0),
(2278,2770,0,3,2,3,0),
(2278,785,0,3,1,2,0),
(2278,2447,0,3,2,4,0),
(2278,2450,0,3,1,2,0),
(2278,2449,0,3,2,3,0),
(2278,783,0,3,1,1,0),
(2278,765,0,3,1,1,0),
-- craft items(rare) - grup 4
(2278,774,9,4,1,1,0),
(2278,818,9,4,1,1,0),
(2278,1210,6,4,1,1,0),
(2278,1206,5,4,1,1,0),
(2278,2842,3,4,1,2,0),
(2278,3577,2,4,1,1,0),
-- carry items - grup 5
(2278,38,0,5,1,1,0),
(2278,6269,0,5,1,1,0),
(2278,6537,0,5,1,1,0),
(2278,6267,0,5,1,1,0),
(2278,9762,0,5,1,1,0),
(2278,6510,0,5,1,1,0),
(2278,2961,0,5,1,1,0),
(2278,2632,0,5,1,1,0),
(2278,6337,0,5,1,1,0),
(2278,6268,0,5,1,1,0),
(2278,15933,0,5,1,1,0),
(2278,9747,0,5,1,1,0),
(2278,4569,0,5,1,1,0),
(2278,6543,0,5,1,1,0),
(2278,9759,0,5,1,1,0),
(2278,4689,0,5,1,1,0),
(2278,2971,0,5,1,1,0),
(2278,3213,0,5,1,1,0),
(2278,6336,0,5,1,1,0),
(2278,6542,0,5,1,1,0),
(2278,9755,0,5,1,1,0),
(2278,9751,0,5,1,1,0),
(2278,3207,0,5,1,1,0),
(2278,9742,0,5,1,1,0),
(2278,3651,0,5,1,1,0),
(2278,9761,0,5,1,1,0),
(2278,1511,0,5,1,1,0),
(2278,2777,0,5,1,1,0),
(2278,2763,0,5,1,1,0),
(2278,3375,0,5,1,1,0),
(2278,1497,0,5,1,1,0),
(2278,1495,0,5,1,1,0),
(2278,2778,0,5,1,1,0),
(2278,1512,0,5,1,1,0),
(2278,1513,0,5,1,1,0),
(2278,1514,0,5,1,1,0),
(2278,1503,0,5,1,1,0),
(2278,1506,0,5,1,1,0),
(2278,1731,0,5,1,1,0),
(2278,1732,0,5,1,1,0),
(2278,1735,0,5,1,1,0),
(2278,1501,0,5,1,1,0),
(2278,1499,0,5,1,1,0),
(2278,1515,0,5,1,1,0),
(2278,1504,0,5,1,1,0),
(2278,1498,0,5,1,1,0),
(2278,1502,0,5,1,1,0),
(2278,1509,0,5,1,1,0),
(2278,1734,0,5,1,1,0),
(2278,1510,0,5,1,1,0),
(2278,1516,0,5,1,1,0),
(2278,1730,0,5,1,1,0),
(2278,1737,0,5,1,1,0),
(2278,3374,0,5,1,1,0),
(2278,2214,0,5,1,1,0),
(2278,1507,0,5,1,1,0),
(2278,2215,0,5,1,1,0),
(2278,4570,0,5,1,1,0),
(2278,2598,0,5,1,1,0),
(2278,2657,0,5,1,1,0),
(2278,4577,0,5,1,1,0),
(2278,2073,0,5,1,1,0),
(2278,6271,0,5,1,1,0),
(2278,2555,0,5,1,1,0),
(2278,5069,0,5,1,1,0),
(2278,8180,0,5,1,1,0),
(2278,2408,0,5,1,1,0),
(2278,4561,0,5,1,1,0),
(2278,4408,0,5,1,1,0),
(2278,5071,0,5,1,1,0),
(2278,4566,0,5,1,1,0),
(2278,5573,0,5,1,1,0);
-- update for gold drop
UPDATE gameobject_template SET mingold = 49, maxgold = 58 WHERE entry = 2846;

    
    

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

