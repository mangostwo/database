-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
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
    SET @cOldStructure = '10'; 
    SET @cOldContent = '099';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '100';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'quest 12920 updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'quest 12920 updates';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

SET @cond := (SELECT MAX(condition_entry) FROM `conditions`);
SET @text := (SELECT MAX(entry) FROM `db_script_string`);

-- Set conditions
INSERT INTO `conditions` VALUES
(@cond+1,9,12920,0,'Has quest Catching up with Brann'),
(@cond+2,9,12926,0,'Has quest Pieces of the Puzzle'),
(@cond+3,24,40971,1,'No item 40971'),
(@cond+4,-1,@cond+1,@cond+3,'No item 40971');

-- Add gossip
UPDATE `creature_template` SET `NpcFlags` = 3, `GossipMenuId` = 9853 WHERE `Entry` = 29579;

-- Correct quest order of availability
UPDATE `quest_template` SET `PrevQuestId` = 12917 WHERE `entry` = 12920; -- Horde
UPDATE `quest_template` SET `PrevQuestId` = 12928 WHERE `entry` IN (12929,13273); -- Horde
UPDATE `quest_template` SET `PrevQuestId` = 12854 WHERE `entry` = 12855; -- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 12872 WHERE `entry` IN (12871,12885); -- Alliance

-- Menu Options
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9853;
INSERT INTO `gossip_menu_option` VALUES
(9853,0,0,'Do you understand me? We should be able to understand each other now.',1,1,-1,0,29579,0,0,NULL,@cond+1),
(9853,1,0,'What kind of help do you require?',1,1,10145,0,0,0,0,NULL,@cond+2),
(9854,0,0,'I lost Brann\'s Communicator and need a replacement.',1,1,-1,0,29937,0,0,NULL,@cond+4);

-- Add gossip
DELETE FROM `gossip_menu` WHERE `entry` IN (10145,9853);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(9853, 13641),
(10145,14089);

-- Add missing script strings.
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(@text+1,'I... I can understand you now! Well, now that we can talk to each other, you have some explaining to do!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(@text+2,'How did you get my communicator from the Explorers\' League?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(@text+3,'You have my thanks for dispatching the iron dwarves. But why would the Horde have an interest in me?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,6,NULL),
(@text+4,'That wouldn\'t be Scout Vor\'takh, would it? Even I know of his reputation for ruthlessness. He means to abduct me, then?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(@text+5,'If you\'ve seen the journal, then you know what I\'ve been discovering. The titans\' own creations are at war with each other!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(@text+6,'Loken and his iron dwarf minions have ousted the Earthen from Ulduar and taken over the city.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(@text+7,'If we spend our time and strength fighting with each other, Loken will use Ulduar\'s resources to destroy both Horde and Alliance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,6,NULL),
(@text+8,'Speak to the commander at your post, lad, and persuade him to abandon Vor\'takh\'s foolish plan.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,6,NULL),
(@text+9,'If the Explorers\' League sent men, I didn\'t see any trace of them. I found your note buried in a camp overrun by iron dwarves.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(@text+10,'A scout found the remains of your journal in Thor Modan. We\'ve been looking for you ever since.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);

-- Add script
DELETE FROM `db_scripts` WHERE `id` IN (29937,29579);
INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(2,29579,1,0,0,0,0,0,0,@text+1,0,0,0,0,0,0,0,'Brann Image say 1 Q.12920'),
(2,29579,7,0,0,0,0,0,0,@text+2,0,0,0,0,0,0,0,'Brann Image say 2 Q.12920'),
(2,29579,12,0,0,0,0,0,2,@text+9,0,0,0,0,0,0,0,'Player force say 1 Q.12920'),
(2,29579,20,0,0,0,0,0,0,@text+3,0,0,0,0,0,0,0,'Brann Image say 3 Q.12920'),
(2,29579,26,0,0,0,0,0,2,@text+10,0,0,0,0,0,0,0,'Player force say 1 Q.12920'),
(2,29579,31,0,0,0,0,0,0,@text+4,0,0,0,0,0,0,0,'Brann Image say 4 Q.12920'),
(2,29579,37,0,0,0,0,0,0,@text+5,0,0,0,0,0,0,0,'Brann Image say 5 Q.12920'),
(2,29579,45,0,0,0,0,0,0,@text+6,0,0,0,0,0,0,0,'Brann Image say 6 Q.12920'),
(2,29579,52,0,0,0,0,0,0,@text+7,0,0,0,0,0,0,0,'Brann Image say 7 Q.12920'),
(2,29579,63,0,0,0,0,0,0,@text+8,0,0,0,0,0,0,0,'Brann Image say 8 Q.12920'),
(2,29579,63,8,29579,0,0,0,0,0,0,0,0,0,0,0,0,'Quest 12920 kill credit'),
(2,29579,4,1,25,0,0,0,0,0,0,0,0,0,0,0,0,'Brann Image emote point Q.12920'),
(2,29937,0,17,40971,1,0,0,0,0,0,0,0,0,0,0,0,'Create Item 40971 Q.12920');

-- Allow quest item drop.
UPDATE `quest_template` SET `ReqSourceId1` = 40971 , `ReqSourceCount1` = 1 WHERE `entry` = 12910; -- Horde
UPDATE `quest_template` SET `ReqSourceId2` = 40971 , `ReqSourceCount2` = 1, `ReqSourceCount3` = 1 WHERE `entry` = 12855; -- Alliance

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
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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


