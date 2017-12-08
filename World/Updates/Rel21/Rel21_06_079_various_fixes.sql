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
    SET @cOldContent = '078';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '079';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'various_fixes';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'various_fixes';

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

    	SET @GO_GUID := (SELECT MAX(guid) FROM `gameobject`);
	SET @CREATURE_GUID := (SELECT MAX(guid) FROM `creature`);
	SET @gossipM_entry := (SELECT MAX(entry) FROM `gossip_menu`);
	SET @text_ID := (SELECT MAX(ID) FROM `npc_text`);
	SET @script_ID := (SELECT MAX(id) FROM `db_scripts`);
	SET @condition := (SELECT MAX(condition_entry) FROM `conditions`);

	-- Update stats for item 17 for supported patch 3.3.x
	UPDATE `item_template` SET `subclass` = 0, `Quality` = 0, `ItemLevel` = 1, `RequiredLevel` = 0, `StatsCount` = 0, `stat_value1` = 0, `stat_type2` = 0, `stat_value2` = 0, `stat_type3` = 0, `armor` = 0, `socketColor_1` = 0, `socketColor_2` = 0, `RequiredDisenchantSkill` = -1, `MaxDurability` = 04 WHERE `entry` = 17;

	-- Update item 192 to correct stats and name for supported patch 3.3.x
	UPDATE `item_template` SET `name` = 'Martin\s Broken Staff', `Quality` = 0, `StatsCount` = 0, `stat_type1` = 0, `stat_value1` = 0, `stat_type2` = 0, `stat_value2` = 0, `stat_type3` = 0, `stat_value3` = 0, `stat_type4` = 0, `stat_value4` = 0, `dmg_min1` = 4, `dmg_max1` = 8, `dmg_min2` = 0, `dmg_max2` = 0, `armor` = 0, `fire_res` = 0, `nature_res` = 0, `frost_res` = 0, `shadow_res` = 0, `MaxDurability` = 0, `socketColor_1` = 0, `socketColor_2` = 0, `RequiredDisenchantSkill` = -1 WHERE `entry` = 192;

	-- Update item 3034 to correct data and name for supported patch 3.3.x
	UPDATE `item_template` SET `name`= 'Deprecated BKP "Impact" Shot', `Quality`= 1, `Flags`= 16, `Flags2`= 8192, `BuyCount`= 200, `BuyPrice`= 450, `SellPrice`= 0, `ItemLevel`= 35, `RequiredLevel`= 30, `stackable`= 1000, `StatsCount`= 0, `stat_type1`= 0, `stat_value1`= 0, `stat_type2`= 0, `stat_value2`= 0, `dmg_min1`= 9, `dmg_max1`= 9, `armor`= 0, `delay`= 3000, `bonding`= 0, `MaxDurability`= 0, `BagFamily`= 2, `RequiredDisenchantSkill`= -1, `DisenchantID`= 0 WHERE `entry`= 3034;

	-- Disenchat loot added
	UPDATE `item_template` SET `DisenchantID` = '2' WHERE `entry` = '46349';

	-- Correctly implement Tome of Conjure Mana Gem II
	DELETE FROM `item_template` WHERE `entry` = 8840;
	INSERT INTO `item_template` (`entry`,`class`,`subclass`,`unk0`,`name`,`displayid`,`Quality`,`Flags`,`Flags2`,`BuyCount`,`BuyPrice`,`SellPrice`,`InventoryType`,`AllowableClass`,`AllowableRace`,`ItemLevel`,`RequiredLevel`,`RequiredSkill`,`RequiredSkillRank`,`requiredspell`,`requiredhonorrank`,`RequiredCityRank`,`RequiredReputationFaction`,`RequiredReputationRank`,`maxcount`,`stackable`,`ContainerSlots`,`StatsCount`,`stat_type1`,`stat_value1`,`stat_type2`,`stat_value2`,`stat_type3`,`stat_value3`,`stat_type4`,`stat_value4`,`stat_type5`,`stat_value5`,`stat_type6`,`stat_value6`,`stat_type7`,`stat_value7`,`stat_type8`,`stat_value8`,`stat_type9`,`stat_value9`,`stat_type10`,`stat_value10`,`ScalingStatDistribution`,`ScalingStatValue`,`dmg_min1`,`dmg_max1`,`dmg_type1`,`dmg_min2`,`dmg_max2`,`dmg_type2`,`armor`,`holy_res`,`fire_res`,`nature_res`,`frost_res`,`shadow_res`,`arcane_res`,`delay`,`ammo_type`,`RangedModRange`,`spellid_1`,`spelltrigger_1`,`spellcharges_1`,`spellppmRate_1`,`spellcooldown_1`,`spellcategory_1`,`spellcategorycooldown_1`,`spellid_2`,`spelltrigger_2`,`spellcharges_2`,`spellppmRate_2`,`spellcooldown_2`,`spellcategory_2`,`spellcategorycooldown_2`,`spellid_3`,`spelltrigger_3`,`spellcharges_3`,`spellppmRate_3`,`spellcooldown_3`,`spellcategory_3`,`spellcategorycooldown_3`,`spellid_4`,`spelltrigger_4`,`spellcharges_4`,`spellppmRate_4`,`spellcooldown_4`,`spellcategory_4`,`spellcategorycooldown_4`,`spellid_5`,`spelltrigger_5`,`spellcharges_5`,`spellppmRate_5`,`spellcooldown_5`,`spellcategory_5`,`spellcategorycooldown_5`,`bonding`,`description`,`PageText`,`LanguageID`,`PageMaterial`,`startquest`,`lockid`,`Material`,`sheath`,`RandomProperty`,`RandomSuffix`,`block`,`itemset`,`MaxDurability`,`area`,`Map`,`BagFamily`,`TotemCategory`,`socketColor_1`,`socketContent_1`,`socketColor_2`,`socketContent_2`,`socketColor_3`,`socketContent_3`,`socketBonus`,`GemProperties`,`RequiredDisenchantSkill`,`ArmorDamageModifier`,`Duration`,`ItemLimitCategory`,`HolidayId`,`DisenchantID`,`FoodType`,`minMoneyLoot`,`maxMoneyLoot`,`ExtraFlags`) VALUES(8840,9,0,-1,'Tome of Conjure Mana Gem II',1103,3,64,0,1,18000,4500,0,31360,-1,36,38,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,483,0,-1,-1,-1,0,-1,3552,6,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,'Teaches Conjure Mana Gem (Rank 2).',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0);

	-- Gameobject Updates
	UPDATE `gameobject_template` SET `data0`=0, `data2`=2066 WHERE `entry` IN (126337,126338,126339,126340,126341,126342,126345);
	UPDATE `gameobject_template` SET `size` = 2 WHERE `entry` = 187882;
	UPDATE `gameobject_template` SET `size` = 1 WHERE `entry` = 188067;
	UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 188072;
	UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 188073;
	UPDATE `gameobject_template` SET `size` = 2 WHERE `entry` = 188077;
	UPDATE `gameobject_template` SET `size` = 2 WHERE `entry` = 188142;
	UPDATE `gameobject_template` SET `size` = .5 WHERE `entry` = 194752;
	UPDATE `gameobject_template` SET `size` = .17 WHERE `entry` =  202931;

	-- Gossip Updates


	-- Wickerman Ashes gossip/buff added
	INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES(@condition+1,'1','24705','0');
	INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES(@condition+2,'-3',@condition+1,'0');

	INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES 
	(@text_ID+1, 'The ashes from the burning wickerman radiate magical powers.'),
	(@text_ID+2, 'The ashes from the burning wickerman radiate magical power. You have already applied the ashes to your face.');
	INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
	(6535,@text_ID+1,0,0),
	(6535,@text_ID+2,0,@condition+1);
	INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
	(6535,0,0,'Smear the ash on my face like war paint!',1,1,-1,0,@script_ID+1,0,0,NULL,@condition+2);
	INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
	(2,@script_ID+1,0,15,24705,0,0,0,2,0,0,0,0,0,0,0,0,'ash');
	SET @GO_GUID := (SELECT MAX(guid) FROM `gameobject`);
	SET @CREATURE_GUID := (SELECT MAX(guid) FROM `creature`);
	UPDATE `gameobject_template` SET `flags` = 17 WHERE `entry` = 180433;
	DELETE FROM `gameobject` WHERE id IN (180432,180433,180434,180437,180405,180406) AND `guid` BETWEEN @GO_GUID+00 AND @GO_GUID+13;
	INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
	-- Forsaken Banner
	(@GO_GUID+1,180432,0,1,1,1749.28,507.611,39.2312,1.49635,0,0,0.680301,0.732933,300,0,1),
	(@GO_GUID+2,180432,0,1,1,1712.63,507.05,38.2495,1.58824,0,0,0.713246,0.700914,300,0,1),
	-- The Wickerman
	(@GO_GUID+3,180433,0,1,1,1734.04,504.05,42.2861,1.4131,0,0,0.649213,0.760607,300,0,0),
	-- Bonfire
	(@GO_GUID+4,180434,0,1,1,1758.89,513.276,35.8655,1.28897,0,0,0.600788,0.799409,300,0,1),
	(@GO_GUID+5,180434,0,1,1,1704.48,518.689,35.4045,1.30704,0,0,0.607984,0.793949,300,0,1),
	(@GO_GUID+6,180434,0,1,1,1739.78,473.238,61.6565,1.59371,0,0,0.71516,0.698961,300,0,1),
	(@GO_GUID+7,180434,0,1,1,1717.32,472.723,61.6566,1.59371,0,0,0.71516,0.698961,300,0,1),
	-- Wickerman Ember
	(@GO_GUID+8,180437,0,1,1,1744.62,504.954,40.8518,1.23403,0,0,0.578603,0.81561,300,0,1),
	(@GO_GUID+9,180437,0,1,1,1729.13,510.378,40.8719,1.23403,0,0,0.578603,0.81561,300,0,1),
	(@GO_GUID+10,180437,0,1,1,1721.77,503.938,41.1381,1.23403,0,0,0.578603,0.81561,300,0,1),
	(@GO_GUID+11,180437,0,1,1,1744.96,496.25,41.44,1.24581,0,0,0.583397,0.812187,300,0,1);

	DELETE FROM `creature` WHERE `id` IN (15195,15197,15199);
	INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
	-- Wickerman Guardian
	(@CREATURE_GUID+1,15195,0,1,1,0,0,1713.1,511.295,37.2005,1.48063,300,0,0,45780,0,0),
	(@CREATURE_GUID+2,15195,0,1,1,0,0,1750.57,511.697,37.7587,1.25444,300,0,0,45780,0,0),
	(@CREATURE_GUID+3,15195,0,1,1,0,0,1732.31,520.874,36.3326,1.30942,300,0,0,45780,0,0),
	-- Darkcaller Yanka
	(@CREATURE_GUID+4,15197,0,1,1,0,0,1734.6,508.803,41.2847,1.6173,300,0,0,15260,0,0),
	-- Sergeant Hartman
	(@CREATURE_GUID+5,15199,0,1,1,0,0,-813.614,-547.184,15.6377,1.69193,300,0,0,15260,0,0);
	INSERT INTO `game_event_gameobject` VALUES
	(@GO_GUID+1,12),
	(@GO_GUID+2,12),
	(@GO_GUID+3,12),
	(@GO_GUID+4,12),
	(@GO_GUID+5,12),
	(@GO_GUID+6,12),
	(@GO_GUID+7,12),
	(@GO_GUID+8,12),
	(@GO_GUID+9,12),
	(@GO_GUID+10,12),
	(@GO_GUID+11,12);
	INSERT INTO `game_event_creature` VALUES
	(@CREATURE_GUID+1,12),
	(@CREATURE_GUID+2,12),
	(@CREATURE_GUID+3,12),
	(@CREATURE_GUID+4,12),
	(@CREATURE_GUID+5,12);
    

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

