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
    SET @cOldContent = '58';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '59';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Tirisfal_Pumpkin';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Tirisfal Pumpkin grow in more locations';

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

		
-- UDB UPDATE [556] Tirisfal Pumpkin
-- Adding Tirisfal Pumpkin

DELETE FROM game_event_gameobject WHERE guid IN (45043, 200003, 200004, 200005, 200006, 200007, 200008, 200009, 200010, 200011, 200012, 200013, 200014, 200015, 200016, 200017, 200018, 200019, 200020, 200021, 200022);
DELETE FROM gameobject_battleground WHERE guid IN (45043, 200003, 200004, 200005, 200006, 200007, 200008, 200009, 200010, 200011, 200012, 200013, 200014, 200015, 200016, 200017, 200018, 200019, 200020, 200021, 200022);
DELETE FROM gameobject WHERE guid IN (45043, 200003, 200004, 200005, 200006, 200007, 200008, 200009, 200010, 200011, 200012, 200013, 200014, 200015, 200016, 200017, 200018, 200019, 200020, 200021, 200022);

INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES 
(45043, 375, 0, 1,1,2351.13, 1324.59, 33.3334, 0.293625, 0, 0, 0.146286, 0.989242, 120, 255, 1),
(200003, 375, 0, 1,1,2363.91, 1348.38, 33.3324, 3.84784, 0, 0, 0.938297, -0.345831, 120, 255, 1),
(200004, 375, 0, 1,1,2360.47, 1399.62, 33.0846, 3.9146, 0, 0, 0.926233, -0.376952, 120, 255, 1),
(200005, 375, 0, 1,1,2340.72, 1352.37, 33.3341, 0.344954, 0, 0, 0.171623, 0.985163, 120, 255, 1),
(200006, 375, 0, 1,1,2341.88, 1344.28, 33.3341, 5.63673, 0, 0, 0.31763, -0.948215, 120, 255, 1),
(200007, 375, 0, 1,1,2305.16, 1357.46, 33.3335, 4.13272, 0, 0, 0.879701, -0.475526, 120, 255, 1),
(200008, 375, 0, 1,1,2329.93, 1378.17, 33.3335, 0.446058, 0, 0, 0.221185, 0.975232, 120, 255, 1),
(200009, 375, 0, 1,1,2318.93, 1398, 33.3335, 2.74335, 0, 0, 0.980241, 0.197809, 120, 255, 1),
(200010, 375, 0, 1,1,2305.13, 1347.16, 33.3334, 4.94245, 0, 0, 0.621275, -0.783592, 120, 255, 1),
(200011, 375, 0, 1,1,2300.79, 1352.3, 33.3334, 3.07713, 0, 0, 0.999481, 0.0322268, 120, 255, 1),
(200012, 375, 0, 1,1,2276.21, 1362.27, 33.3335, 3.29704, 0, 0, 0.996981, -0.0776452, 120, 255, 1),
(200013, 375, 0, 1,1,2265.59, 1354.08, 33.3335, 4.40528, 0, 0, 0.80694, -0.590634, 120, 255, 1),
(200014, 375, 0, 1,1,2268.72, 1403.56, 33.3334, 0.24895, 0, 0, 0.124154, 0.992263, 120, 255, 1),
(200015, 375, 0, 1,1,2287.5, 1419.42, 33.3334, 0.307855, 0, 0, 0.153321, 0.988177, 120, 255, 1),
(200016, 375, 0, 1,1,2304.68, 1471.36, 33.3334, 1.05791, 0, 0, 0.504632, 0.863335, 120, 255, 1),
(200017, 375, 0, 1,1,2304.19, 1477.65, 33.3334, 1.05791, 0, 0, 0.504632, 0.863335, 120, 255, 1),
(200018, 375, 0, 1,1,2294.94, 1477.74, 33.3334, 6.25332, 0, 0, 0.0149322, -0.999889, 120, 255, 1),
(200019, 375, 0, 1,1,2333.19, 1478.31, 33.3334, 0.468867, 0, 0, 0.232292, 0.972646, 120, 255, 1),
(200020, 375, 0, 1,1,2339.75, 1485.74, 33.435, 0.417816, 0, 0, 0.207392, 0.978258, 120, 255, 1),
(200021, 375, 0, 1,1,2362.05, 1474.94, 33.3341, 5.06267, 0, 0, 0.57308, -0.8195, 120, 255, 1),
(200022, 375, 0, 1,1,2337, 1446.25, 33.3341, 4.10919, 0, 0, 0.885234, -0.465147, 120, 255, 1),
(200023, 375, 0, 1,1,2337.31, 1453.2, 33.3341, 2.26351, 0, 0, 0.905159, 0.425073, 120, 255, 1);

-- update for existing ones
UPDATE gameobject SET spawntimesecs = 120 WHERE id = 375;

-- pools
-- should be spawned max 15 (31 total spawns)
DELETE FROM pool_template WHERE entry = 25559;
INSERT INTO pool_template (entry, max_limit, description) VALUES 
(25559,15,'Tirisfal Pumpkin');
DELETE FROM pool_gameobject_template WHERE pool_entry = 25559;
INSERT INTO pool_gameobject_template (id, pool_entry, chance, description) VALUES
(375, 25559, 0, '375 - Tirisfal Pumpkin');
    

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

