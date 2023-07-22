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
    SET @cOldContent = '012';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '03';
    SET @cNewContent = '013';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Evanor\'s Prison';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Evanor\'s Prison';

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

	SET @db_string_entry := (SELECT MAX(`entry`) FROM `db_script_string`);
	SET @db_script_id := (SELECT MAX(`id`) FROM `db_scripts`);

	-- Add missing db_script text.
	INSERT INTO `db_script_string` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
	(@db_string_entry+1,'I thank you, friend of Dalaran.',0,0,0,0,'Evanor say 1'),
	(@db_string_entry+2,'We mustn\'t tarry here... stay close - I\'ll take us somehwere safe',0,0,0,0,'Evanor say 2'),
	(@db_string_entry+3,'Mages! Take wing!',0,1,0,0,'Warmage Anzim yell on Q.11681 start.'),
	(@db_string_entry+4,'For Dalaran! Attack!!',0,1,0,0,'Warmage Archus.');

	-- Add db_script to Evanor's Prison.
	DELETE FROM `db_scripts` WHERE `id` = 61130;
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES 
	(6,61130,3,10,25784,10000,0,0,0,0,0,0,0,3211.72,6091.78,138,0,'Summon Evanor'),
	(6,61130,3,0,0,0,25784,10,0,@db_string_entry+1,0,0,0,0,0,0,0,'Evanor say 1'),
	(6,61130,8,0,0,0,25784,10,0,@db_string_entry+2,0,0,0,0,0,0,0,'Evanor say 2'),
	(6,61130,9,15,51347,0,25784,10,4,0,0,0,0,0,0,0,0,'Teleport (Visual ONLY)'),
	(6,61130,10,6,571,0,0,0,0,0,0,0,0,3646.96,5893.19,174.485,0.623603,'Teleport Player - Amber Ledge');

	-- Warmage Anzim yell on Q.11681 start. 
	DELETE FROM `db_scripts` WHERE `id` = 11681;
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(0,11681,0,0,0,0,0,0,0,@db_string_entry+3,0,0,0,0,0,0,0,'Warmage Anzim yell On Q.11681 start.'),
	(0,11681,0,32,0,0,27888,30,4,0,0,0,0,0,0,0,0,'Warmage Archus - Start Movement'),
	(0,11681,0,32,0,0,25727,40,4,0,0,0,0,0,0,0,0,'Warmage Moran - Start Movement'),
	(0,11681,0,32,0,0,25733,30,4,0,0,0,0,0,0,0,0,'Warmage Austin - Start Movement'),
	(0,11681,0,32,0,0,25732,30,4,0,0,0,0,0,0,0,0,'Warmage Preston - Start Movement');

	-- Quest Script added to quest_template.
	UPDATE `quest_template` SET `StartScript` = 11681 WHERE `entry` = 11681;

	-- Missing auras added to Warmage Archus, Warmage Preston and Warmage Austin.
	DELETE FROM `creature_addon` WHERE `guid` IN (107998,108027,118574);
	DELETE FROM `creature_template_addon` WHERE `entry` IN (25732,27888,25733);
	INSERT INTO `creature_template_addon` (`entry`, `mount`, `b2_0_sheath`) VALUES
	(25732,23524,1),
	(27888,23524,1),
	(25733,23524,1);

	-- Warmage Flight team script.
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(3,@db_script_id+1,0,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'Warmage WP - Pause'),
	(3,@db_script_id+1,0,59,1,0,0,0,0,0,0,0,0,0,0,0,0,'Warmage Set - Fly ON'),
	(3,@db_script_id+2,0,15,45913,1,25724,20,4,0,0,0,0,0,0,0,0,'Cast - Warmage Drake Fireball'),
	(3,@db_script_id+3,0,15,45913,1,25724,20,4,0,0,0,0,0,0,0,0,'Archus - Cast - Warmage Drake Fireball'),
	(3,@db_script_id+3,0,0,0,0,0,0,0,@db_string_entry+4,0,0,0,0,0,0,0,'Warmage Archus Yell - WP.'),
	(3,@db_script_id+4,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'Warmage Desespawn (Help prevent possible dysinc issue)');

	-- Warmage Moran
	UPDATE `creature` SET `spawntimesecs` = 2, `MovementType` = 2 WHERE `guid` = 107602;
	UPDATE `creature_template` SET `SpeedWalk` = 9.3 WHERE `Entry` = 25727;
	DELETE FROM `creature_movement` WHERE `id` = 107602;
	INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`orientation`,`model1`,`model2`) VALUES
	(107602,0,3437.1,5915.95,145.724,0,@db_script_id+1,0,0,0,0,0,0,0,2.74017,0,0),
	(107602,1,3437.1,5915.95,145.724,0,0,0,0,0,0,0,0,0,2.74017,0,0),
	(107602,2,3151.901,6082.669,132.63,0,0,0,0,0,0,0,0,0,100,0,0),
	(107602,3,3161.065,6124.368,132.63,0,0,0,0,0,0,0,0,0,100,0,0),
	(107602,4,3195.64,6102.67,130,0,0,0,0,0,0,0,0,0,100,0,0),
	(107602,5,3195.64,6102.67,147.557,200,@db_script_id+2,0,0,0,0,0,0,0,100,0,0),
	(107602,6,3449.632,5926.109,151.55,0,0,0,0,0,0,0,0,0,100,0,0),
	(107602,7,3459.296,5906.203,154.25,0,0,0,0,0,0,0,0,0,100,0,0),
	(107602,8,3437.1,5915.95,145.724,0,@db_script_id+4,0,0,0,0,0,0,0,2.74017,0,0);

	-- Warmage Austin
	UPDATE `creature` SET `spawntimesecs` = 2, `MovementType` = 2 WHERE `guid` = 108027;
	UPDATE `creature_template` SET `SpeedWalk` = 9 WHERE `Entry` = 25733;
	DELETE FROM `creature_movement` WHERE `id` = 108027;
	INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`orientation`,`model1`,`model2`) VALUES
	(108027,0,3435.27,5889.9,151.063,0,@db_script_id+1,0,0,0,0,0,0,0,3.66519,0,0),
	(108027,1,3435.27,5889.9,151.063,0,0,0,0,0,0,0,0,0,3.66519,0,0),
	(108027,2,3250.303,6130.681,130,0,0,0,0,0,0,0,0,0,100,0,0),
	(108027,3,3224.34,6110.71,130,6100,0,0,0,0,0,0,0,0,100,0,0),
	(108027,4,3224.34,6110.71,147.557,200,@db_script_id+2,0,0,0,0,0,0,0,100,0,0),
	(108027,5,3446.394,5896,156.3411,0,0,0,0,0,0,0,0,0,100,0,0),
	(108027,6,3435.27,5889.9,151.063,0,@db_script_id+4,0,0,0,0,0,0,0,3.66519,0,0);

	-- Warmage Preston
	UPDATE `creature` SET `spawntimesecs` = 2, `MovementType` = 2 WHERE `guid` = 107998;
	UPDATE `creature_template` SET `SpeedWalk` = 10 WHERE `Entry` = 25732;
	DELETE FROM `creature_movement` WHERE `id` = 107998;
	INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`orientation`,`model1`,`model2`) VALUES
	(107998,0,3460.5,5877.44,149.538,0,@db_script_id+1,0,0,0,0,0,0,0,0.0821,0,0),
	(107998,1,3460.5,5877.44,149.538,0,0,0,0,0,0,0,0,0,0.0821,0,0),
	(107998,2,3232.701,6083.04,130.557,4800,0,0,0,0,0,0,0,0,100,0,0),
	(107998,3,3232.701,6083.04,147,200,@db_script_id+2,0,0,0,0,0,0,0,100,0,0),
	(107998,4,3388.895,5893.361,173.345,0,0,0,0,0,0,0,0,0,0.0821,0,0),
	(107998,5,3441.048,5840.3156,166.151,0,0,0,0,0,0,0,0,0,0.0821,0,0),
	(107998,6,3460.5,5877.44,149.538,0,@db_script_id+4,0,0,0,0,0,0,0,0.0821,0,0);

	-- Warmage Archus
	UPDATE `creature` SET `spawntimesecs` = 2, `MovementType` = 2 WHERE `guid` = 118574;
	UPDATE `creature_template` SET `SpeedWalk` = 10 WHERE `Entry` = 27888;
	DELETE FROM `creature_movement` WHERE `id` = 118574;
	INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`orientation`,`model1`,`model2`) VALUES
	(118574,0,3457.75,5892.67,147.381,0,@db_script_id+1,0,0,0,0,0,0,0,0.750492,0,0),
	(118574,1,3457.75,5892.67,147.381,0,0,0,0,0,0,0,0,0,0.750492,0,0),
	(118574,2,3435.987, 5901.077,157.984,0,0,0,0,0,0,0,0,0,100,0,0),
	(118574,3,3195.54,6065.71,130,0,0,0,0,0,0,0,0,0,100,0,0),
	(118574,4,3199.17,6071.71,130,4100,0,0,0,0,0,0,0,0,100,0,0),
	(118574,5,3199.17,6071.71,147.557,200,@db_script_id+3,0,0,0,0,0,0,0,100,0,0),
	(118574,6,3449.218,5883.694,154.4481,0,0,0,0,0,0,0,0,0,100,0,0),
	(118574,7,3457.75,5892.67,147.381,0,@db_script_id+4,0,0,0,0,0,0,0,0.750492,0,0);

	-- Assended Mage Hunter EventAI.
	UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` = 25724;
	DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 25724;
	INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
	(2572401,25724,8,0,100,1,45913,-1,0,0,37,0,0,0,11,42726,0,-1,0,0,0,0,'Kill/Cast on Spell Hit');

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


