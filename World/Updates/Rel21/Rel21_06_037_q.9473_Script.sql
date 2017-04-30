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
    SET @cOldContent = '036';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '037';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q.9473_Script';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q.9473_Script';

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
-- q.9473 'An Alternative Alternative'
DELETE FROM db_scripts WHERE id = 9473;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1,9473,1,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
(1,9473,2,3,0,0,0,0,0,0,0,0,0,-4191.78,-12474,45.8086,3.92804,''),
(1,9473,4,3,0,0,0,0,0,0,0,0,0,-4196.96,-12475.7,45.72,2.56773,''),
(1,9473,6,3,0,0,0,0,0,0,0,0,0,-4200.02,-12472.6,45.6286,1.87579,''),
(1,9473,8,0,0,0,0,0,0,2000000655,0,0,0,0,0,0,0,''),
(1,9473,11,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1,9473,13,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1,9473,16,0,0,0,0,0,0,2000000656,0,0,0,0,0,0,0,''),
(1,9473,19,0,0,0,17117,84578,7 | 0x10,2000000657,0,0,0,0,0,0,0,''),
(1,9473,22,0,0,0,17117,84578,7 | 0x10,2000000658,0,0,0,0,0,0,0,''),
(1,9473,22,28,1,0,17117,84578,7 | 0x10,0,0,0,0,0,0,0,0,'STATE_SIT'),
(1,9473,24,0,0,0,17117,84578,7 | 0x10,2000000659,0,0,0,0,0,0,0,''),
(1,9473,29,0,0,0,17117,84578,7 | 0x10,2000000660,0,0,0,0,0,0,0,''),
(1,9473,32,1,25,0,17117,84578,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9473,38,0,0,0,17117,84578,7 | 0x10,2000000661,0,0,0,0,0,0,0,''),
(1,9473,38,28,3,0,17117,84578,7 | 0x10,0,0,0,0,0,0,0,0,'STATE_SLEEP'),
(1,9473,38,3,0,0,0,0,0,0,0,0,0,-4197.28,-12474.5,45.6484,0.101384,''),
(1,9473,40,3,0,0,0,0,0,0,0,0,0,-4192.1,-12472.7,45.7121,0.999094,''),
(1,9473,42,3,0,0,0,0,0,0,0,0,0,-4191.15,-12470,45.6375,1.24414,''),
(1,9473,45,3,0,0,0,0,0,0,0,0,0,-4191.15,-12470,45.6375,3.80482,''),
(1,9473,45,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'npc_flag added');
UPDATE quest_template SET CompleteScript = 9473 WHERE entry = 9473;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000655 AND 2000000661;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000655,'This should do it...',0,0,0,69,NULL),
(2000000656,'Wake up little creature. Wake up from your slumber... You are safe now.',0,0,0,0,NULL),
(2000000657,'%s groans.',0,2,0,0,NULL),
(2000000658,'%s sits up.',0,2,0,0,NULL),
(2000000659,'Whe... Where am I? What... What is this place?',0,0,0,5,NULL),
(2000000660,'BY THE LIGHT OF ELUNE! Eredar! Cursed demons, what have you to me? I have not come alone, we will fight you as we have in the past! I...',0,0,0,6,NULL),
(2000000661,'%s falls back into a coma.',0,2,0,0,NULL);
    
    

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

