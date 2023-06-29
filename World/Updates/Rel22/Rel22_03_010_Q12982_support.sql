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
    SET @cOldStructure = '03'; 
    SET @cOldContent = '009';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '03';
    SET @cNewContent = '010';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Q12982 support';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Q12982 support';

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

	SET @Cage_Entry := (SELECT MAX(`entry`) FROM `gameobject_template`);
	SET @Text_Entry := (SELECT MIN(`entry`) FROM `creature_ai_texts`);
	SET @npc_guid := (SELECT MAX(`guid`) FROM `creature`);

	-- Prevent Ebon Blade Prisoner from attacking / being attacked.
	UPDATE `creature_template` SET `UnitFlags` = 4864 WHERE `Entry` IN (30195,30196,30194,30186);

	-- Players can interact with the Jotunheim Cage.
	UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 192135;
	
	-- New objects to support quest scripts.
	INSERT INTO `gameobject_template` VALUES
	(@Cage_Entry+1,10,8235,'Jotunheim Cage','','','',0,32,1,0,0,0,0,0,0,1803,0,0,600000,0,0,0,0,0,0,38078,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0), -- Human
	(@Cage_Entry+2,10,8235,'Jotunheim Cage','','','',0,32,1,0,0,0,0,0,0,1803,0,0,600000,0,0,0,0,0,0,38078,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0), -- Night Elf
	(@Cage_Entry+3,10,8235,'Jotunheim Cage','','','',0,32,1,0,0,0,0,0,0,1803,0,0,600000,0,0,0,0,0,0,38078,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0); -- Troll

	-- Update current objects with new Entry IDs.
	UPDATE `gameobject` SET `id` = @Cage_Entry+1 WHERE `guid` IN 
	(62555,62533,62552,62545,62510,62515,62548,62546,62547);
	UPDATE `gameobject` SET `id` = @Cage_Entry+2 WHERE `guid` IN 
	(62556,62516,62526,62540,62521,62511,62543,62553,62551,62530,62531);
	UPDATE `gameobject` SET `id` = @Cage_Entry+3 WHERE `guid` IN 
	(62537,62536,62550,62517,62538,62527,62529,62524,62512,62513,62528,62525,62549,62541,62539);


	-- Correct Spawn Location.
	UPDATE `creature` SET `position_x` = 6789.81, `position_y` = 3993.81, `position_z` = 615.926, `orientation` = 6.276387 WHERE `guid` = 124735;

	-- Script support Check for Entry, despawn, cast pet follower, and quest credit.
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(7,@Cage_Entry+1,1,31,30186,10,0,0,0,0,0,0,0,0,0,0,0,'Check for Entry: 30186 (Human)'),
	(7,@Cage_Entry+1,1,18,0,0,30186,10,1,0,0,0,0,0,0,0,0,'Despawn Entry: 30186 (Human)'),
	(7,@Cage_Entry+1,1,15,56207,0,0,0,2,0,0,0,0,0,0,0,0,'Cast Human Follower'),
	(7,@Cage_Entry+1,3,8,30186,0,0,0,0,0,0,0,0,0,0,0,0,'Kill Credit Quest: 12982');
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(7,@Cage_Entry+2,1,31,30194,10,0,0,0,0,0,0,0,0,0,0,0,'Check for 30194 (Night Elf)'),
	(7,@Cage_Entry+2,1,18,0,0,30194,10,1,0,0,0,0,0,0,0,0,'Despawn Entry: 30194 (Night Elf)'),
	(7,@Cage_Entry+2,1,15,56209,0,0,0,2,0,0,0,0,0,0,0,0,'Cast Night Elf Follower'),
	(7,@Cage_Entry+2,3,8,30186,0,0,0,0,0,0,0,0,0,0,0,0,'Kill Credit Quest: 12982');
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(7,@Cage_Entry+3,1,31,30196,10,0,0,0,0,0,0,0,0,0,0,0,'Check for Entry: 30196 (Troll)'),
	(7,@Cage_Entry+3,1,18,0,0,30196,10,1,0,0,0,0,0,0,0,0,'Despawn Entry: 30196 (Troll)'),
	(7,@Cage_Entry+3,1,15,56214,0,0,0,2,0,0,0,0,0,0,0,0,'Cast Troll Follower'),
	(7,@Cage_Entry+3,3,8,30186,0,0,0,0,0,0,0,0,0,0,0,0,'Kill Credit Quest: 12982');
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(7,192135,1,31,30195,10,0,0,0,0,0,0,0,0,0,0,0,'Check for Entry: 30195 (Orc)'),
	(7,192135,1,18,0,0,30195,10,1,0,0,0,0,0,0,0,0,'Despawn Entry: 30195 (Orc)'),
	(7,192135,1,15,56212,0,0,0,2,0,0,0,0,0,0,0,0,'Cast Orc Follower'),
	(7,192135,3,8,30186,0,0,0,0,0,0,0,0,0,0,0,0,'Kill Credit Quest: 12982');

	-- Set Say Script for Ebon Blade Prisoner.
	INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `comment`) VALUES
	(@Text_Entry-1,'Let\'s do this!','Say'),
	(@Text_Entry-2,'Thank you $c, I owe you.','Say'),
	(@Text_Entry-3,'It\'s time for revenge!','Say'),
	(@Text_Entry-4,'Thanks, How can I help?','Say');

	-- Script support for Random say when cage is opened.
	UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` IN (30195,30196,30194,30186);
	INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_flags`,`event_param1`,`event_param2`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`comment`) VALUES 
	(3019501,30195,8,1,22096,-1,1,@Text_Entry-1,@Text_Entry-2,@Text_Entry-3,'Random say on spell hit.'),
	(3019601,30196,8,1,22096,-1,1,@Text_Entry-2,@Text_Entry-3,@Text_Entry-4,'Random say on spell hit.'),
	(3019401,30194,8,1,22096,-1,1,@Text_Entry-1,@Text_Entry-2,@Text_Entry-3,'Random say on spell hit.'),
	(3018601,30186,8,1,22096,-1,1,@Text_Entry-2,@Text_Entry-3,@Text_Entry-4,'Random say on spell hit.');

	-- Add missing Ebon Blade Prisoner.
	INSERT INTO `creature` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`curmana`) VALUES
	(@npc_guid+1,30195,571,7047.31,3979.06,535.307,2.041497,300,11379,3725);

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


