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
    SET @cOldStructure = '03'; 
    SET @cOldContent = '04';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '05';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q.3463_Set_Them_Ablaze!';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q.3463_Set_Them_Ablaze!';

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

-- UDB UPDATE [221] q.3463 'Set Them Ablaze!'
-- q.3463 'Set Them Ablaze!'
DELETE FROM dbscripts_on_quest_end WHERE id = 3463;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3463,1,31,8479,100,0,0,0,0,0,0,0,0,0,0,0,'search for Kalaran Windblade'),
(3463,2,18,0,0,8479,5921,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(3463,3,10,8480,54000,0,0,0,0,0,0,0,-6679.93,-1194.36,240.297,2.96706,'summon Kalaran the Deceiver');
UPDATE quest_template SET CompleteScript = 3463 WHERE entry = 3463;

-- Kalaran Windblade
UPDATE creature SET spawntimesecs = 120 WHERE id = 8479;

-- Kalaran the Deceiver
UPDATE creature_template SET MovementType = 2 WHERE entry = 8480;
DELETE FROM creature_movement_template WHERE entry = 8480;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(8480, 1, -6679.93,-1194.36,240.297,45000,848001,2.96706,0,0),
(8480, 2, -6879.3,-1187.34,253.384,0,0,3.10877,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 848001;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(848001,1,21,1,0,0,0,0x04,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - active'),
(848001,1,0,0,0,0,0,0,2000000526,0,0,0,0,0,0,0,''),
(848001,3,0,0,0,0,0,0,2000000527,0,0,0,0,0,0,0,''),
(848001,7,0,0,0,0,0,0,2000000528,0,0,0,0,0,0,0,''),
(848001,13,0,0,0,8509,20,7,2000000529,0,0,0,0,0,0,0,''),
(848001,15,3,0,0,0,0,0,0,0,0,0,0,0,0,4.65994,''),
(848001,18,0,0,0,0,0,0,2000000530,0,0,0,0,0,0,0,''),
(848001,22,0,0,0,0,0,0,2000000531,0,0,0,0,0,0,0,''),
(848001,27,0,0,0,0,0,0,2000000532,0,0,0,0,0,0,0,''),
(848001,32,0,0,0,8509,20,7,2000000533,0,0,0,0,0,0,0,''),
(848001,35,0,0,0,0,0,0,2000000534,0,0,0,0,0,0,0,''),
(848001,38,0,0,0,0,0,0,2000000535,0,0,0,0,0,0,0,''),
(848001,41,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(848001,44,0,0,0,0,0,0,2000000536,0,0,0,0,0,0,0,''),
(848001,48,21,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - unactive');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000526 AND 2000000536;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000526,'Glorious, indeed, Maltrake. It looks as if my plan worked perfectly. Wouldn\'t you say so, mortal?',0,0,0,0,NULL),
(2000000527,'%s lets loose a reptilian laugh... at least you think it\'s a laugh.',0,2,0,0,NULL),
(2000000528,'You would not have helped the legion of Blackrock had we just asked for your assistance, now would you?',0,0,0,0,NULL),
(2000000529,'What will we do with them, master? They are of no use to us anymore.',0,0,0,1,NULL),
(2000000530,'SILENCE FOOL!',0,0,0,0,NULL),
(2000000531,'They will live of only to see the fruits of their labor: the destruction and chaos that will surely ensue as the legion of Blackrock invade the gorge.',0,0,0,0,NULL),
(2000000532,'I leave you now, mortals. Alive and with these trinkets. Maltrake! Present them with the trinkets!',0,0,0,0,NULL),
(2000000533,'Right away, master!',0,0,0,0,NULL),
(2000000534,'%s begins to flap his massive wings faster. He is preparing for flight.',0,2,0,0,NULL),
(2000000535,'Oh yes, the molt - do not lose it. There are those of my kin in the Burning Steppes that would craft items that only the molt of the black dragonflight could fortify.',0,0,0,0,NULL),
(2000000536,'The legion of Blackrock comes, dwarflings! We shall scorch the earth and set fire to the heavens. None shall survive...',0,1,0,0,NULL);
    

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

