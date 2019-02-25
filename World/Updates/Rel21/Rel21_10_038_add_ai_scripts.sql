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
    SET @cOldContent = '037';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '038';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'add ai scripts';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'add ai scripts';

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

    -- Aura update to fix start up error.
UPDATE `creature_template_addon` SET `auras` = '(NULL)' WHERE `entry` = 10426;


UPDATE creature_template SET DamageSchool=4, AIName = 'EventAI' WHERE entry = 17155;
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 19768;
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 19788;
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 19789;
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 19767;
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 19762;
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 17154;
UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 11365;

SET @aitext := (SELECT MIN(entry) FROM `creature_ai_texts`); 
INSERT INTO `creature_ai_texts` VALUES
(@aitext-1,'%s raises his shield in a vigorous defense!',0,0,0,0,0,0,0,0,0,2,0,0,'Coilskar Sorceress');

-- Lake Surger
-- Coilskar Muckwatcher
-- Coilskar Waterkeeper
-- Coilskar Sorceress
-- Coilskar Defender
-- Muck Spawn
-- ZulianPanther

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (17155,19768,19788,19789,19767,19762,17154,11365);
INSERT INTO `creature_ai_scripts` VALUES
(1715501,17155,0,0,100,1,0,5000,15000,21000,11,32012,1,0,0,0,0,0,0,0,0,0,'Lake Surger - Cast Surge'),
(1976801,19768,0,0,100,1,0,1000,2500,4700,11,32011,1,0,0,0,0,0,0,0,0,0,'Coilskar Siren - Cast Water Bolt'),
(1976802,19768,2,0,100,1,99,0,30000,35000,11,38026,0,0,0,0,0,0,0,0,0,0,'Coilskar Siren - Cast Viscous Shield When Below 99% HP'),
(1978801,19788,0,0,100,1,0,5000,25000,30000,11,38232,0,0,0,0,0,0,0,0,0,0,'Coilskar Muckwatcher - Cast Battle Shout'),
(1978802,19788,13,0,100,1,8000,12000,0,0,11,38029,1,0,0,0,0,0,0,0,0,0,'Coilskar Muckwatcher - Cast Stab on Target Casting'),
(1978901,19789,0,0,100,1,0,0,5000,10000,11,9672,1,0,0,0,0,0,0,0,0,0,'Coilskar Waterkeeper - Cast Water Bolt'),
(1978902,19789,9,0,100,1,0,10,12000,16500,11,38033,0,0,0,0,0,0,0,0,0,0,'Coilskar Waterkeeper - Cast Frost Nova'),
(1976701,19767,0,0,100,1,0,1000,2500,4700,11,32011,1,0,0,0,0,0,0,0,0,0,'Coilskar Sorceress - Cast Water Bolt'),
(1976702,19767,2,0,100,1,99,0,30000,35000,11,38026,0,0,0,0,0,0,0,0,0,0,'Coilskar Sorceress - Cast Viscous Shield When Below 99% HP'),
(1976201,19762,13,0,100,1,10000,15000,0,0,11,38233,1,0,0,0,0,0,0,0,0,0,'Coilskar Defender - Cast Shield Bash on Target Casting'),
(1976202,19762,2,0,100,1,25,0,25000,45000,11,38031,0,0,22,1,0,0,0,0,0,0,'Coilskar Defender - Cast Shield Block and Set Phase 1 When Below 25% HP'),
(1976203,19762,0,1,100,0,0,0,0,0,1,@aitext-1,0,0,0,0,0,0,0,0,0,0,'Coilskar Defender - Text Emote (Phase 1)'),
(1976204,19762,7,0,100,0,0,0,0,0,22,0,0,0,0,0,0,0,0,0,0,0,'Coilskar Defender - Set Phase to 0 on Evade)'),
(1715401,17154,4,0,100,0,0,0,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Muck Spawn - Set Phase 1 on Aggro'),
(1715402,17154,0,5,100,1,0,0,5000,14000,11,21067,1,0,0,0,0,0,0,0,0,0,'Muck Spawn - Cast Poison Bolt (Phase 1)'),
(1715403,17154,24,5,100,1,21067,3,5000,5000,22,2,0,0,0,0,0,0,0,0,0,0,'Muck Spawn - Set Phase 2 on Target Max Poison Bolt Aura Stack (Phase 1)'),
(1715404,17154,28,3,100,1,21067,1,5000,5000,22,1,0,0,0,0,0,0,0,0,0,0,'Muck Spawn - Set Phase 1 on Target Missing Poison Bolt Aura Stack (Phase 2)'),
(1715405,17154,0,0,100,1,5000,15000,18000,40000,11,32013,1,0,0,0,0,0,0,0,0,0,'Muck Spawn - Cast Mucky Sludge'),
(1715406,17154,7,0,100,0,0,0,0,0,22,0,0,0,0,0,0,0,0,0,0,0,'Muck Spawn - Set Phase to 0 on Evade'),
(1136501,11365,28,0,100,1,24332,1,1000,3000,11,24332,1,0,0,0,0,0,0,0,0,0,'Zulian Panther - Cast Rake on Missing Aura Rake'),
(1136502,11365,0,0,100,1,3000,3000,15000,20000,11,24333,1,0,0,0,0,0,0,0,0,0,'Zulian Panther - Cast Ravage'),
(1136503,11365,0,0,100,1,3000,3000,5000,12000,11,8355,1,0,0,0,0,0,0,0,0,0,'Zulian Panther - Cast Exploit Weakness');

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


