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
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '12'; 
    SET @cOldContent = '038';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '12';
    SET @cNewContent = '039';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Plagued Dragonflayers script';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Plagued Dragonflayers script';

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

    
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` IN (23564,24198,24199);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (23564,24198,24199);
INSERT INTO `creature_ai_scripts` VALUES
-- Plagued Dragonflayer Tribesman
(2356401,23564,4,0,75,0,0,0,0,0,11,43506,0,0,11,21862,0,0,0,0,0,0,'Plagued Dragonflayer Tribesman - Cast Plague Blight on Aggro'),
(2356402,23564,0,0,100,1,3000,5000,5000,8000,11,15496,1,0,0,0,0,0,0,0,0,0,'Plagued Dragonflayer Tribesman - Cast Cleave'),
(2356403,23564,0,0,100,1,9000,12000,12000,15000,11,32736,1,1,0,0,0,0,0,0,0,0,'Plagued Dragonflayer Tribesman - Cast Mortal Strike'),
(2356404,23564,2,0,100,0,10,0,0,0,11,42167,0,0,0,0,0,0,0,0,0,0,'Plagued Dragonflayer Tribesman - Cast Plagued Blood Explosion at 10% HP'),
(2356405,23564,8,0,100,0,43381,-1,0,0,11,43384,7,0,1,-1406,0,0,0,0,0,0,'Plagued Dragonflayer Tribesman - cast Spray Credit on SpellHIT'),
-- Plagued Dragonflayer Rune-Caster
(2419801,24198,9,0,100,1,0,30,16000,19000,11,47782,1,0,0,0,0,0,0,0,0,0,'Plagued Dragonflayer Rune-Caster - Cast Corruption'),
(2419802,24198,0,0,100,1,6000,11000,24000,29000,11,15616,1,1,0,0,0,0,0,0,0,0,'Plagued Dragonflayer Rune-Caster - Cast Flame Shock'),
(2419803,24198,2,0,100,0,10,0,0,0,11,42167,0,0,0,0,0,0,0,0,0,0,'Plagued Dragonflayer Rune-Caster - Cast Plagued Blood Explosion at 10% HP'),
(2419804,24198,8,0,100,0,43381,-1,0,0,11,43384,7,0,1,-1406,0,0,0,0,0,0,'Plagued Dragonflayer Rune-Caster - cast Spray Credit on SpellHIT'), 
-- Plagued Dragonflayer Handler
(2419901,24199,4,0,75,0,0,0,0,0,11,43506,0,0,11,21862,0,0,0,0,0,0,'Plagued Dragonflayer Handler - Cast Plague Blight on Aggro'),
(2419902,24199,2,0,100,0,10,0,0,0,11,42167,0,0,0,0,0,0,0,0,0,0,'Plagued Dragonflayer Handler - Cast Plagued Blood Explosion at 10% HP'),
(2419903,24199,8,0,100,0,43381,-1,0,0,11,43384,7,0,1,-1406,0,0,0,0,0,0,'Plagued Dragonflayer Handler - cast Spray Credit on SpellHIT');

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


