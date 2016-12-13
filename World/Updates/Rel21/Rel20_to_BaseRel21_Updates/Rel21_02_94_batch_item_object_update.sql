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
    SET @cOldContent = '93';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '94';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'batch_item_object_update';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'batch_item_object_update';

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

-- rename Item 46767 to correct name
UPDATE `item_template` SET `name` = 'Warbot Ignition Key' WHERE `entry` = 46767;


-- UDB [540] Item: 'Crown Chemical Co. Supplies'
-- Crown Chemical Co. Supplies
-- missing template added
DELETE FROM item_template WHERE entry = 49867;
INSERT INTO item_template (entry, class, subclass, unk0, NAME, displayid, Quality, Flags, Flags2, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace, ItemLevel, RequiredLevel, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, StatsCount, stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, stat_type7, stat_value7, stat_type8, stat_value8, stat_type9, stat_value9, stat_type10, stat_value10, ScalingStatDistribution, ScalingStatValue, dmg_min1, dmg_max1, dmg_type1, dmg_min2, dmg_max2, dmg_type2, armor, holy_res, fire_res, nature_res, frost_res, shadow_res, arcane_res, delay, ammo_type, RangedModRange, spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1, spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2, spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3, spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4, spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5, bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, AREA, Map, BagFamily, TotemCategory, socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, RequiredDisenchantSkill, ArmorDamageModifier, Duration, ItemLimitCategory, HolidayId, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, ExtraFlags) VALUES
(49867,12,0,-1,'Crown Chemical Co. Supplies',11448,1,0,0,1,0,0,0,-1,-1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,4,'You can hear the clink of glass... don\'t drop it!',0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,423,0,0,0,0,0);

-- UDB [297] Flags for few items...
-- frozen halls entrance teleport
DELETE FROM game_tele WHERE id = 1426; 
INSERT INTO game_tele (id, position_x, position_y, position_z, orientation, map, name) VALUES
(1426, 5632.477, 2016.71, 798.27, 4.73, 571, 'frozenhalls');

-- fix for few items
-- now they will display correct info (and 100% they're not part of milling)
UPDATE item_template SET Flags = 2048 WHERE entry = 37020;
UPDATE item_template SET Flags = 2048 WHERE entry = 37200;
UPDATE item_template SET Flags = 64 WHERE entry = 40652;
UPDATE item_template SET Flags = 2112 WHERE entry = 40970;
UPDATE item_template SET Flags = 2048 WHERE entry = 41843;

-- UDB [369] Milly's Harvest / Update for [369]
DELETE FROM pool_template WHERE entry = 25517;
INSERT INTO pool_template (entry, max_limit, description) VALUES 
(25517,10,'Milly\'s Harvest');
DELETE FROM pool_gameobject_template WHERE pool_entry = 25517;
INSERT INTO pool_gameobject_template (id, pool_entry, chance, description) VALUES
(161557, 25517, 0, '161557 - Milly\'s Harvest');

-- UDB [371] Altar of the Deeps + Script updated for Morridune

-- Altar of the Deeps
DELETE FROM dbscripts_on_go_template_use WHERE id = 103016; 
INSERT INTO dbscripts_on_go_template_use (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(103016,1,31,4829,50,0,0,0x08,0,0,0,0,0,0,0,0,'search for 4829'), -- boss must be killed
(103016,2,31,6729,50,0,0,0x08,0,0,0,0,0,0,0,0,'search for 6729'), -- only one must be spawned
(103016,3,10,6729,300000,0,0,0,0,0,0,0,-857.158,-467.636,-33.9256,5.90677,'');
-- Morridune
UPDATE creature_template SET UnitFlags = 2, MovementType = 2 WHERE entry = 6729;
DELETE FROM creature_movement_template WHERE entry = 6729;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(6729,1,-857.158,-467.636,-33.9256,1000,672901,5.90677,0,0),
(6729,2,-840.903,-474.555,-34.0673,5000,672902,1.86432,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 672901; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(672901,0,29,1,2,0,0,0,0,0,0,0,0,0,0,0,'npcFlags removed'),
(672902,1,0,0,0,0,0,0,2000000813,0,0,0,0,0,0,0,''),
(672902,1,29,1,1,0,0,0,0,0,0,0,0,0,0,0,'npcFlags added'),
(672902,2,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'wp pause');
DELETE FROM db_script_string WHERE entry = 2000000813;
INSERT INTO db_script_string (entry,content_default,sound,TYPE,LANGUAGE,emote,COMMENT) VALUES
(2000000813,'Speak with me to hear my tale.',0,0,0,0,'');
-- teleport possition corrected
DELETE FROM spell_target_position WHERE id = 9268;
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES
(9268, 1, 9664.01, 2526.15, 1332.16, 0);

UPDATE `creature_ai_scripts` SET `comment` = 'Morridune - Yell on Spawn' WHERE id = 672901;
UPDATE `creature_ai_texts` SET `type` = 1 WHERE `entry` = '-569';

-- UDB [519] Fix Grim Batol sign position in Wetlands
-- Fix Grim Batol sign position in Wetlands
UPDATE gameobject SET position_x = -3597.3, position_y = -2714.84, position_z = 17.02, orientation = 2.47837, rotation0 = 0, rotation1 = 0, rotation2 = 0.945519, rotation3 = 0.325567, spawntimesecs = 7200, animprogress = 100, state = 1 WHERE guid = 13764;


    

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

