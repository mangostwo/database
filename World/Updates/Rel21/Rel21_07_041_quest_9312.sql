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
    SET @cOldContent = '040';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '041';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'quest_9312';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'quest_9312';

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

    SET @string_entry := (SELECT MAX(entry) FROM `db_script_string`);
-- q.9312 'The Emitter'

INSERT INTO `db_script_string` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(@string_entry+1,'By the seven Ata\'mal crystals!  Others have survived the crash!  Zhanaa, is that you?  It is so good to see you again!',0,0,0,0,NULL),
(@string_entry+2,'And who do we have here?  No doubt th... crzzzk ...ade this communication possible?  I give you greetings fro... psshzzzk... Azure Watch.',0,0,0,0,NULL),
(@string_entry+3,'Judging by your signal, we put you... ust southeast of the larger part of the island we crashed onto.  Cross the Crystalbrook River to ge... kshhhhk zzzt. Sorry, there\'s a lot of stat...',0,0,0,0,NULL),
(@string_entry+4,'This is great news!  Your efforts have indeed saved us, $N!',0,0,0,0,NULL);

DELETE FROM `db_scripts` WHERE `id` IN (1707101,9312);
INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(3,1707101,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3,1707101,28,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1,9312,1,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
(1,9312,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''), -- in case if she has 69 state emote
(1,9312,1,3,0,0,0,0,0,0,0,0,0,-4184.55,-13733.1,74.1389,1.91986,''), -- she must go back to place where she should be
(1,9312,1,13,0,0,181286,50,0x02,0,0,0,0,0,0,0,0,''),
(1,9312,2,10,16550,47000,0,0,0,0,0,0,0,-4187.708,-13738.72,75.65491,1.850049,'summon Image of Technician Dyvuun'),
(1,9312,4,3,0,0,0,0,0,0,0,0,0,0,0,0,3.92457,''),
(1,9312,4,36,0,0,16550,50,3,0,0,0,0,0,0,0,0,''),
(1,9312,4,0,0,0,16550,50,7,@string_entry+1,0,0,0,0,0,0,0,''),
(1,9312,5,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1,9312,5,1,70,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1,9312,12,36,0,0,16550,50,0,0,0,0,0,0,0,0,0,''),
(1,9312,15,0,0,0,16550,50,0,@string_entry+2,0,0,0,0,0,0,0,''),
(1,9312,29,0,0,0,16550,50,0,@string_entry+3,0,0,0,0,0,0,0,''),
(1,9312,46,3,0,0,0,0,0,0,0,0,0,0,0,0,1.91986,''),
(1,9312,49,0,0,0,0,0,0,@string_entry+4,0,0,0,0,0,0,0,''),
(1,9312,50,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoints'),
(1,9312,50,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'npc_flag added');

UPDATE `quest_template` SET `CompleteScript` = 9312 WHERE `entry` = 9312;


-- Technician Zhanaa
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = 7978;
DELETE FROM `creature_movement` WHERE `id` = 7978;
UPDATE `creature_template` SET `MovementType` = 2 WHERE `entry` = 17071;
DELETE FROM `creature_movement_template` WHERE `entry` = 17071;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`, `model1`, `model2`) VALUES
(17071,1,-4184.55,-13733.1,74.1389,40000,0,1.91986,0,0),
(17071,2,-4186.46,-13736,74.4728,30000,1707101,3.92457,0,0),
(17071,3,-4184.26,-13734,74.3718,0,0,100,0,0),
(17071,4,-4180.06,-13736.4,74.5934,30000,1707101,5.88493,0,0),
(17071,5,-4184.55,-13733.1,74.1389,240000,0,1.91986,0,0);


-- Image of Technician Dyvuun
UPDATE creature_template SET UnitFlags = 33587968, movementType = 0, Inhabittype = 4 WHERE entry = 16550; -- correct flags
    

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

