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
    SET @cOldContent = '022';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '023';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Quest items';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Quest items';

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

-- q.11227 'Let Them Eat Crow'
-- q item must be removed after q. completed
-- ReqSourceCount3 - to many items collected shouldnt be left in players inventory
UPDATE quest_template SET ReqSourceCount2 = 1, ReqSourceCount3 = 100 WHERE entry = 11227;

-- q.11281 'Mimicking Nature's Call'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount2 = 1 WHERE entry = 11281;

-- q.11314 'The Fallen Sisters'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount2 = 1 WHERE entry = 11314;

-- q.11319 'Seeds of the Blacksouled Keepers'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount2 = 1 WHERE entry = 11319;

-- q.11352 'The Rune of Command'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount3 = 1 WHERE entry = 11352;

-- q.11365 'March of the Giants'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount3 = 1 WHERE entry = 11365;

-- q.11366 'The Lodestone'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount3 = 1 WHERE entry = 11366;

-- q.11257 'Gruesome, But Necessary'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount1 = 1 WHERE entry = 11257;

-- q.11258 'Burn Skorn, Burn!'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount1 = 1 WHERE entry = 11258;

-- q.11259 'Towers of Certain Doom'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount1 = 1 WHERE entry = 11259;

-- q.11282 'A Lesson in Fear'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount4 = 1 WHERE entry = 11282;

-- q.11285 'Baleheim Must Burn!'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount4 = 1 WHERE entry = 11285;

-- q.11301 'Brains! Brains! Brains!'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount2 = 1 WHERE entry = 11301;

-- q.11399 'Bring Down Those Shields'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount1 = 1 WHERE entry = 11399;

-- q.11279 'Green Eggs and Whelps'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount2 = 1 WHERE entry = 11279;

-- q.11280 'Draconis Gastritis'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount1 = 1 WHERE entry = 11280;

-- q.11307 'Field Test'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount2 = 1 WHERE entry = 11307;

-- q.11310 'Warning: Some Assembly Required'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount2 = 1 WHERE entry = 11310;

-- q.11458 'Avenge Iskaal'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount2 = 1 WHERE entry = 11458;

-- q.11568 'A Return to Resting'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount4 = 1 WHERE entry = 11568;

-- q.12481 'Adding Injury to Insult'
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount3 = 1 WHERE entry = 12481;

-- q.11452/11453 'The Slumbering King' - -A -H
-- q item must be removed after q. completed
UPDATE quest_template SET ReqSourceCount1 = 1 WHERE entry IN (11452,11453);

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


