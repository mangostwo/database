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
    SET @cOldContent = '041';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '042';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Totem_of_Tikti';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Totem_of_Tikti';

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

    -- q.9540 'Totem of Tikti'
DELETE FROM db_scripts WHERE id = 9540;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(0,9540,1,10,17391,35000,0,0,0,0,0,0,0,-3922.01,-12746.9,96.767,2.11154,'summon Stillpine Ancestor Coo'),
(0,9540,2,21,1,0,17391,30,7,0,0,0,0,0,0,0,0,'active'),
(0,9540,4,36,0,0,17391,50,0,0,0,0,0,0,0,0,0,'face player'),
(0,9540,5,0,0,0,17391,50,0,2000000668,0,0,0,0,0,0,0,''),
(0,9540,7,3,0,0,17391,50,7,0,0,0,0,-3925.63,-12752,97.7171,4.78528,''),
(0,9540,9,3,0,0,17391,50,7,0,0,0,0,-3925.8,-12755.8,99.4512,4.87481,''),
(0,9540,11,3,0,0,17391,50,7,0,0,0,0,-3924.27,-12761.5,101.829,4.9861,''),
(0,9540,14,0,0,0,17391,50,0,2000000669,0,0,0,0,0,0,0,''),
(0,9540,18,15,30424,0,17391,50,0,0,0,0,0,0,0,0,0,''),
(0,9540,21,0,0,0,17391,50,0,2000000670,0,0,0,0,0,0,0,''),
(0,9540,23,0,0,0,17391,50,0,2000000671,0,0,0,0,0,0,0,''),
(0,9540,24,23,17019,0,17391,50,7 |0x08,0,0,0,0,0,0,0,0,''),
(0,9540,25,39,1,0,17391,50,7,0,0,0,0,0,0,0,0,''),
(0,9540,27,3,0,0,17391,50,7,0,0,0,0,-3923.5,-12795,107.213,4.87004,''),
(0,9540,32,21,0,0,17391,100,7,0,0,0,0,0,0,0,0,'unactive'),
(0,9540,33,18,0,0,17391,100,7,0,0,0,0,0,0,0,0,'');
UPDATE quest_template SET StartScript = 9540 WHERE entry = 9540;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000668 AND 2000000671;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000668,'%s motions for you to follow him.',0,2,0,0,NULL),
(2000000669,'[Furbolg] Ritk kin\'chikx azul azure summit...',0,0,0,0,NULL),
(2000000670,'[Furbolg] Coo xip fly... Jump ilos river. Find Tikti.',0,0,0,0,NULL),
(2000000671,'%s points across the river.',0,2,0,0,NULL);
-- Stillpine Ancestor Coo
UPDATE creature_template SET MovementType = 0 WHERE Entry = 17391;

-- Acid 
-- Stillpine Ancestor Coo - update
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 17391;
INSERT INTO `creature_ai_scripts` VALUES
('1739101','17391','11','0','100','0','0','0','0','0','11','25035','0','1','3','0','16995','0','0','0','0','0','Stillpine Ancestor Coo - Cast Elemental Spawn-in ans set correct modelid on Spawn');
    

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

