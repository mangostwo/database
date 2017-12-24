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
    SET @cOldContent = '081';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '082';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'various_updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'various_updates';

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

	-- PX-238 Winter Wondervolt TRAP will activate and cast spell correctly.
	UPDATE `gameobject_template` SET `faction` = 0 , `data2` = .5 WHERE `entry` = 180797;

	-- Add Clockwork Rocket Bot to Winter Veil Gift.
	DELETE FROM `item_loot_template`  WHERE `entry` = 34426 AND `item` = 34425;
	INSERT INTO `item_loot_template` (`entry`, `item`) VALUES (34426, 34425);
	-- Added Horde loot to Bountiful Cookbook.
	DELETE FROM `item_loot_template`  WHERE `entry` = 46810 AND `item` IN (46807,46806,46805,46804,46803);
	INSERT INTO `item_loot_template` (`entry`, `item`) VALUES 
	(46810, 46807),
	(46810, 46806),
	(46810, 46805),
	(46810, 46804),
	(46810, 46803);
	-- Added Alliance loot to Bountiful Cookbook.
	DELETE FROM `item_loot_template`  WHERE `entry` = 46809 AND `item` IN (44861,44859,44858,44862,44860);
	INSERT INTO `item_loot_template` (`entry`, `item`) VALUES 
	(46809, 44861),
	(46809, 44859),
	(46809, 44858),
	(46809, 44862),
	(46809, 44860);

	-- Added Snowball loot to Pocket Full of Snow.
	DELETE FROM `item_loot_template`  WHERE `entry` = 35512 AND `item` IN (17202);
	INSERT INTO `item_loot_template` (`entry`, `item`, `mincountOrRef`, `maxcount`) VALUES (35512, 17202, 2, 5);

	-- Loot added to Crudely Wrapped Gift
	DELETE FROM `item_loot_template`  WHERE `entry` = 34077 AND `item` IN (34068,37586,37011,36877);
	INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
	(34077,34068,100,0,3,3,0),
	(34077,37586,95,0,1,1,0),
	(34077,37011,32,0,1,1,0),
	(34077,36877,25,0,1,1,0);

	-- Loot added to Dertrok's Wand Case.
	DELETE FROM `item_loot_template`  WHERE `entry` = 30650 AND `item` IN (30654,30653,30652,30651);
	INSERT INTO `item_loot_template` (`entry`, `item`) values
	(30650,30654),
	(30650,30653),
	(30650,30652),
	(30650,30651);

	-- Curmudgeon's Payoff contains 5 gold.
	UPDATE `item_template` SET `minMoneyLoot` = 50000 , `maxMoneyLoot` = 50000 WHERE `entry` = 23022;

	-- Fix Z axis for NPCs, Kaymard Copperpinch, Penney Copperpinch, and Great Father Winter
	-- Credit: https://github.com/Aokromes/TrinityCore/commit/a7d04aa09d1b31dd7df9a07db3890041ebefe870
	UPDATE `Creature` SET `position_z`=17.3676 WHERE `guid`=53620;
	UPDATE `Creature` SET `position_z`=17.0995 WHERE `guid`=53618;
	UPDATE `Creature` SET `position_z`=15.8220 WHERE `guid`=53646;

    

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

