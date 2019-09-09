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
    SET @cOldContent = '109';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '110';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Dalaran Image NPC';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Dalaran Image NPC';

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

-- "Image" NPCs located in Dalaran within the The Violet Hold area have been reworked. The correct NPCs will spawn and the few that had already been there will now stay put and not walk around.
		SET @entry := (SELECT MAX(entry) FROM `pool_template`); 
SET @guid := (SELECT MAX(guid) FROM `creature`); 
DELETE FROM `creature_template_addon` WHERE entry IN 
(31622,31584,31631,31634,37849,37850,37851,37853,37854,37855,37856,37858,37859,37861,37862,37864);
UPDATE `creature_template` SET `InhabitType` = 4, `UnitFlags` = 33555264, `MovementTemplateId` = 0, `AIName` = 'EventAI' WHERE `entry` IN 
(37854,37849,37850,37851,37853,37855,37856,37858,37859,37861,37862,37864);



DELETE FROM `creature` WHERE `id` IN (31622,31584,31631,31634,37854,37849,37850,37851,37853,37855,37856,37858,37859,37861,37862,37864);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(88743,37854,571,1,1,0,0,5703.08,583.976,654.934,3.90954,3,0,0,168512,0,0,0),
(@guid+1,37849,571,1,1,30799,0,5703.08,583.976,654.934,3.92699,3,0,0,13481,0,0,0),
(@guid+2,37850,571,1,1,30800,0,5703.08,583.976,654.934,3.90954,3,0,0,13481,0,0,0),
(@guid+3,37851,571,1,1,30801,0,5703.08,583.976,654.934,3.90954,3,0,0,13481,0,0,0),
(@guid+4,37853,571,1,1,30802,0,5703.08,583.976,654.934,3.90954,3,0,0,13481,0,0,0),
(@guid+5,37855,571,1,1,30804,0,5703.08,583.876,654.934,3.92699,3,0,0,13481,0,0,0),
(@guid+6,37856,571,1,1,30805,0,5703.08,583.979,654.934,3.90954,3,0,0,13481,0,0,0),
(@guid+7,37858,571,1,1,30806,0,5703.08,583.976,654.934,3.92699,3,0,0,13481,0,0,0),
(@guid+8,37859,571,1,1,30807,0,5703.08,583.979,654.934,3.90954,3,0,0,13481,0,0,0),
(@guid+9,37861,571,1,1,30808,0,5703.08,583.979,654.934,3.90954,3,0,0,13481,0,0,0),
(@guid+10,37862,571,1,1,30809,0,5703.08,583.979,654.934,3.90954,3,0,0,13481,0,0,0),
(@guid+11,37864,571,1,1,30810,0,5703.08,583.979,654.934,3.90954,3,0,0,13481,0,0,0);

INSERT INTO `pool_template` VALUES
(@entry+1,1,'Dalaran - Violet Hold image - South');


INSERT INTO `pool_creature` VALUES
(88743,@entry+1,0,'Patchwerk Image'),
(@guid+1,@entry+1,0,'Sartharion Image'),
(@guid+2,@entry+1,0,'Anub\'Rekhan Image'),
(@guid+3,@entry+1,0,'Noth the Plaguebringer Image'),
(@guid+4,@entry+1,0,'Instructor Razuvious Image'),
(@guid+5,@entry+1,0,'Malygos Image'),
(@guid+6,@entry+1,0,'Flame Leviathan Image'),
(@guid+7,@entry+1,0,'Razorscale Image'),
(@guid+8,@entry+1,0,'Ignis the Furnace Master Image'),
(@guid+9,@entry+1,0,'XT-002 Deconstructor Image'),
(@guid+10,@entry+1,0,'Lord Jaraxxus Image'),
(@guid+11,@entry+1,0,'Lord Marrowgar Image');

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


