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
    SET @cOldContent = '045';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '046';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q9514_Rune_Covered_Tablet';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q9514_Rune_Covered_Tablet';

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

-- q.9514 'Rune Covered Tablet'
INSERT INTO db_scripts  (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1,9514,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1,9514,1,21,1,0,17242,84433,7 | 0x10,0,0,0,0,0,0,0,0,'buddy active'),
(1,9514,2,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
(1,9514,4,36,0,0,17242,84433,0x01 | 0x10,0,0,0,0,0,0,0,0,'face buddy'),
(1,9514,6,0,0,0,0,0,0,2000000691,0,0,0,0,0,0,0,''),
(1,9514,8,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1,9514,9,36,0,0,17242,84433,3 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9514,11,0,0,0,17242,84433,7 | 0x10,2000000692,0,0,0,0,0,0,0,''),
(1,9514,13,1,1,0,17242,84433,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9514,16,3,0,0,17242,84433,7 | 0x10,0,0,0,0,-4699.7,-12419.6,11.6882,2.37188,''),
(1,9514,19,0,0,0,17242,84433,7 | 0x10,2000000693,0,0,0,0,0,0,0,''),
(1,9514,22,0,0,0,17242,84433,7 | 0x10,2000000694,0,0,0,0,0,0,0,''),
(1,9514,26,0,0,0,17242,84433,7 | 0x10,2000000695,0,0,0,0,0,0,0,''),
(1,9514,31,0,0,0,17242,84433,7 | 0x10,2000000696,0,0,0,0,0,0,0,''),
(1,9514,34,1,1,0,17242,84433,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9514,37,1,1,0,17242,84433,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1,9514,40,0,0,0,17242,84433,7 | 0x10,2000000697,0,0,0,0,0,0,0,''),
(1,9514,44,0,0,0,17242,84433,7 | 0x10,2000000698,0,0,0,0,0,0,0,''),
(1,9514,48,0,0,0,0,0,0,2000000699,0,0,0,0,0,0,0,''),
(1,9514,52,36,0.994838,0,0,0,0,0,0,0,0,0,0,0,0,'face reset'),
(1,9514,52,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'npc_flag added'),
(1,9514,53,3,0,0,17242,84433,7 | 0x10,0,0,0,0,-4693.81,-12423.1,11.8935,6.26573,''),
(1,9514,57,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive'),
(1,9514,57,21,0,0,17242,84433,7 | 0x10,0,0,0,0,0,0,0,0,'buddy unactive');
UPDATE quest_template SET CompleteScript = 9514 WHERE entry = 9514;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000691 AND 2000000699;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000691,'Adamant, could you please take a look at this tablet and try to decipher the runes?', 0, 0, 0, 1, NULL),
(2000000692,'Of course! Anything for you, darling!', 0, 0, 0, 5, NULL),
(2000000693,'Alright, let me take a look at that tablet.', 0, 0, 0, 1, NULL),
(2000000694,'%s slowly reads the tablet, mouthing the words in their native tongue.', 0, 2, 0, 0, NULL),
(2000000695,'Naga warlord! Oh dear...', 0, 0, 0, 5, NULL),
(2000000696,'Well, you aren\'t going to like what I have to tell you, young missy. This tablet is a naga communication. Their leader, Warlord Sriss\'tiz, has ordered his naga to take the rest of the island by force.', 0, 0, 0, 1, NULL),
(2000000697,'And it looks like he\'s got reinforcements comin\' from Nazjatar!', 0, 0, 0, 5, NULL),
(2000000698,'We\'ve got to do something about this!', 0, 0, 0, 5, NULL),
(2000000699,'Thank you, Adamant. I think I know just the person for the job.', 0, 0, 0, 2, NULL);

-- Rune Covered Tablet
-- Item must be droped from almost 1st creature .. it gaves continuation of chain.
-- Wowhead has wrong data: low % is an effect of killing creatures without req. for item. (pls check comments) 
UPDATE creature_loot_template SET ChanceOrQuestChance = 75, condition_id = 1047 WHERE item = 23759;
-- conditions 
-- item should be available for alliance only & after q.9506.
DELETE FROM conditions WHERE condition_entry IN (1038, 1043, 1044, 1045, 1046, 1047);
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1038, 8, 9506, 0), -- q. 9506 must be completed
(1043, 16, 23759, 1), -- not enough items yet.
(1044, 22, 9514, 0), -- not taken a quest yet.
(1045, -1, 22, 1038), -- alliance only + q. 9506 must be completed
(1046, -1, 1043, 1044), -- maxitem =1 + q.9514 not taken
(1047, -1, 1045, 1046);   
    

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

