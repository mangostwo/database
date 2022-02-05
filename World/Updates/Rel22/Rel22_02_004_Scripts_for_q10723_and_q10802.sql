-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '02'; 
    SET @cOldContent = '003';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '02';
    SET @cNewContent = '004';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Scripts for q10723 and q10802';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Scripts for q10723 and q10802';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

	SET @goguid := (SELECT MAX(`guid`) FROM `gameobject`);
	SET @string_entry := (SELECT MAX(`entry`) FROM `db_script_string`);

	UPDATE `creature_template` SET `MovementType` = 0, `UnitFlags` = 514, `SpeedWalk` = 3, `SpeedRun` = 3 WHERE `Entry` = 21514; -- Adjust speed to something like in the videos
	UPDATE `creature_template` SET `ModelId2` = 0, `ModelId4` = 0 WHERE `Entry` = 22447; -- Remove wrong model
	UPDATE `creature` SET `position_x` = 3607.514893,`position_y` = 7184.140625, `position_z` = 139.595551 WHERE `id` = 22447; -- Adjust position
	UPDATE `quest_template` SET `ReqSourceId1` = 31754, `ReqSourceCount1` = 3, `ReqSpellCast1` = 0 WHERE `entry` IN (10723,10802); -- Add correct data

	DELETE FROM `creature_loot_template` WHERE `item` = 31754; -- Fix quest item to loot tables
	UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -50 WHERE `entry` = 21046 AND `item` = 31754;
	UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -45 WHERE `entry` = 21047 AND `item` = 31754;
	UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -5 WHERE `entry` = 21048 AND `item` = 31754;

	INSERT INTO `db_script_string` (`entry`,`content_default`,`COMMENT`) VALUES
	(@string_entry+1,'Who dares defile the altar of Gorgrom the Dragon-Eater?','Gorgrom SAY 1'),
	(@string_entry+2,'I will crush it and flay it and eat its meat and crack its bones one by one when I am done.','Gorgrom SAY 2');
	INSERT INTO db_script_string(entry,content_default,sound,type,emote,comment) VALUES (@string_entry+3,'Misha lets out a loud roar as she rakes her claws against the gronn\'s altar.',7933,2,35,'Misha EMOTE 1');

	DELETE FROM `spell_script_target` WHERE `entry` = 39185; -- add target for Trigger Trap
	INSERT INTO `spell_script_target` VALUES (39185,1,22447,0);

	DELETE FROM `gameobject_template` WHERE `entry` = 185295; -- add missing gameobject, thats used as a spell focus
	INSERT INTO `gameobject_template` (`entry`,`TYPE`,`name`,`data0`,`data1`) VALUES(185295,8,'Gorgrom\'s Corpse',1450,20);

	DELETE FROM `gameobject` WHERE `id` = 185295; -- add gameobject, respawned by script
	INSERT INTO `gameobject` VALUES (@goguid+1,185295,530,1,1,3608.252,7180.321777,140.029190,5.407311,0,0,0,0,-60,255,1);

	DELETE FROM `db_scripts` WHERE `id` IN (14536,14400);
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(8,14400,0,31,21514,20,0,0,8,0,0,0,0,0,0,0,0,'Gorgrom - Check for Gorgrom'), -- let him check if creature is alive
	(8,14536,0,31,21514,20,0,0,8,0,0,0,0,0,0,0,0,'Gorgrom - Check for Gorgrom'),
	(8,'14400', '1', '10', '10204', '30000', '0', '0', '0', '0', '0', '0', '0', '3605.5', '7186.44', '141.12', '5.444561', 'Gorgrom - Misha spawn'),
	(8,'14400', '3', '10', '21514', '70000', '0', '0', '0', '0', '0', '0', '0', '3624.955556', '7165.361328', '141.484894', '2.24', 'Gorgrom - Gorgrom spawn'),
	(8,'14536', '3', '10', '21514', '70000', '0', '0', '0', '0', '0', '0', '0', '3624.955556', '7165.361328', '141.484894', '2.24', 'Gorgrom - Gorgrom spawn'),
	(8,14400,3,25,0,0,21514,40,0,0,0,0,0,0,0,0,0,'Gorgrom - RUN OFF'),
	(8,14536,3,25,0,0,21514,40,0,0,0,0,0,0,0,0,0,'Gorgrom - RUN OFF');
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`dataint`,`buddy_entry`,`search_radius`,`data_flags`,`comments`) VALUES
	(8,14400,3,0,@string_entry+3,10204,40,0,'Gorgrom - Misha SAY 1'),
	(8,14536,4.5,0,@string_entry+1,21514,40,0,'Gorgrom - Gorgrom SAY 1'),
	(8,14400,4.5,0,@string_entry+1,21514,40,0,'Gorgrom - Gorgrom SAY 1'),
	(8,14536,7,0,@string_entry+2,21514,40,0,'Gorgrom - Gorgrom SAY 2'),
	(8,14400,7,0,@string_entry+2,21514,40,0,'Gorgrom - Gorgrom SAY 2');
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`x`,`y`,`z`,`o`,`buddy_entry`,`search_radius`,`data_flags`,`comments`) VALUES
	(8,14400,8,3,'3607.514893', '7184.140625', '139.595551', '2.24',21514,40,0,'Gorgrom - Gorgrom MOVE'),
	(8,14400,10,3,'3611.925049', '7192.390137', '139.486327', '3.824740',10204,40,0,'Gorgrom - Misha MOVE'),
	(8,14536,8,3,'3607.514893', '7184.140625', '139.595551', '2.24',21514,40,0,'Gorgrom - Gorgrom MOVE');
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`comments`) VALUES
	(8,14400,11,9,@goguid+1,60,'Gorgrom - RESPAWN GAMEOBJECT Gorgroms corpse'),
	(8,14536,11,9,@goguid+1,60,'Gorgrom - RESPAWN GAMEOBJECT Gorgroms corpse');
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`buddy_entry`,`search_radius`,`data_flags`,`comments`) VALUES
	(8,14400,11,15,39185,21514,40,12,'Gorgrom - CAST SPELL Trigger Trap'),
	(8,14536,11,15,39185,21514,40,12,'Gorgrom - CAST SPELL Trigger Trap'),
	(8,14400,11.5,15,38763,21514,40,12,'Gorgrom - CAST SPELL Suicide'),
	(8,14536,11.5,15,38763,21514,40,12,'Gorgrom - CAST SPELL Suicide');
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`buddy_entry`,`search_radius`,`data_flags`,`comments`) VALUES
	(8,14400,12,18,15000,10204,40,4,'Gorgrom - Misha DESPAWN'),
	(8,14536,12,18,60000,21514,40,1,'Gorgrom - Gorgrom DESPAWN'),
	(8,14400,12,18,60000,21514,40,1,'Gorgrom - Gorgrom DESPAWN');

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
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
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


