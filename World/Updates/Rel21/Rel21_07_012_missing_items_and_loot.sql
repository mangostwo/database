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
    SET @cOldContent = '011';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '012';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'missing_items_and_loot';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'missing_items_and_loot';

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
	SET @condition := (SELECT MAX(condition_entry) FROM `conditions`);

	-- Add missing item, Landro's Pet Box.
	DELETE FROM `item_template` WHERE `entry` = 50301;
	INSERT INTO `item_template` (`entry`, `class`, `name`, `displayid`, `Flags`, `Flags2`, `AllowableClass`, `description`, `Material`) VALUES 
	(50301, 15, 'Landro\'s Pet Box', 35407, 65540, 8192, 32767, 'NOTE: Not Guaranteed to Contain an Actual Pet', 4);

	-- Conditions for Landro's Pet Box and Landro's Gift Box. Will not drop items if players already has pet/mount spell.
	INSERT INTO `conditions` (`condition_entry`,`type`,`value1`,`value2`) VALUES
	(@condition+1,17,40549,1),
	(@condition+2,17,49964,1),
	(@condition+3,17,45127,1),
	(@condition+4,17,30174,1),
	(@condition+5,17,42777,1),
	(@condition+6,17,42776,1),
	(@condition+7,17,46199,1),
	(@condition+8,17,46197,1),
	(@condition+9,17, 51412,1);

	-- Add Landro's Pet Box to item_loot_table.
	-- Lando's Pet Box will not drop the following if the player already can summon this pet.
	-- Bananas, Ethereal Soul-Trader, Dragon Kite.
	DELETE FROM `item_loot_template` WHERE `Entry` IN (50301);
	INSERT INTO `item_loot_template` (`Entry`,`Item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES
	(50301,46779,36.36,1,50,50,0),
	(50301,35223,36.36,1,50,50,0),
	(50301,45047,27.28,1,50,50,0),
	(50301,32588,0.45,2,1,1,@condition+1),
	(50301,38050,0.45,2,1,1,@condition+2),
	(50301,34493,0.10,2,1,1,@condition+3);


	-- Landro's Gift Box will no longer drop the following if player can summon the mount.
	-- Riding Turtle, Reins of the Swift Spectral Tiger, Reins of the Spectral Tiger,X-51 Nether-Rocket X-TREME, X-51 Nether-Rocket, Big Battle Bear
	UPDATE `item_loot_template` SET `condition_id` = @condition+4 WHERE entry = 54218 AND item = 23720;
	UPDATE `item_loot_template` SET `condition_id` = @condition+5 WHERE entry = 54218 AND item = 49284;
	UPDATE `item_loot_template` SET `condition_id` = @condition+6 WHERE entry = 54218 AND item = 49283;
	UPDATE `item_loot_template` SET `condition_id` = @condition+7 WHERE entry = 54218 AND item = 49286;
	UPDATE `item_loot_template` SET `condition_id` = @condition+8 WHERE entry = 54218 AND item = 49285;
	UPDATE `item_loot_template` SET `condition_id` = @condition+9 WHERE entry = 54218 AND item = 49282;

	-- The "Spectral Tiger" summoned from the Sandbox Tiger can now be mounted and used.
	INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `cast_flags`) VALUES ('33357', '75648', '0', '1');

    
    

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

