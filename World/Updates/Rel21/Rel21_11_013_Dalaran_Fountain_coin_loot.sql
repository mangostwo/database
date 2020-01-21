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
    SET @cOldStructure = '11'; 
    SET @cOldContent = '012';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '013';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Dalaran Fountain coin loot';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Dalaran Fountain coin loot';

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
-- This is an attempt to correct the fishing loot for the achievement 'The Coin Master'.
SET @con_entry := (SELECT MAX(`condition_entry`) FROM `conditions`);
INSERT INTO `conditions` VALUES
(@con_entry+1,4,4568,0,'The Coin Master - Dalaran Fountain');

DELETE FROM `fishing_loot_template` WHERE `item` IN 
(43702,43703,43704,43705,43706,43707,43708,43709,43710,43711,43712,43713,43714,43715,43716
,43717,43718,43719,43720,43721,43722,43723,43643,43644,43675,43676,43677,43678,43679,43680
,43681,43682,43683,43684,43685,43686,43687,43627,43628,43629,43630,43631,43632,43633,43634
,43635,43636,43637,43638,43639,43640,43641);
INSERT INTO `fishing_loot_template` VALUES
-- Copper Coins
(0,43702,0.3,1,1,1,@con_entry+1),
(0,43703,0.3,1,1,1,@con_entry+1),
(0,43704,0.4,1,1,1,@con_entry+1),
(0,43705,0.3,1,1,1,@con_entry+1),
(0,43706,0.3,1,1,1,@con_entry+1),
(0,43707,0.3,1,1,1,@con_entry+1),
(0,43708,0.3,1,1,1,@con_entry+1),
(0,43709,0.3,1,1,1,@con_entry+1),
(0,43710,0.4,1,1,1,@con_entry+1),
(0,43711,0.4,1,1,1,@con_entry+1),
(0,43712,0.4,1,1,1,@con_entry+1),
(0,43713,0.3,1,1,1,@con_entry+1),
(0,43714,0.4,1,1,1,@con_entry+1),
(0,43715,0.4,1,1,1,@con_entry+1),
(0,43716,0.4,1,1,1,@con_entry+1),
(0,43717,0.4,1,1,1,@con_entry+1),
(0,43718,0.4,1,1,1,@con_entry+1),
(0,43719,0.4,1,1,1,@con_entry+1),
(0,43720,0.3,1,1,1,@con_entry+1),
(0,43721,0.3,1,1,1,@con_entry+1),
(0,43722,0.4,1,1,1,@con_entry+1),
(0,43723,0.4,1,1,1,@con_entry+1),
-- Silver coins
(0,43643,0.2,1,1,1,@con_entry+1),
(0,43644,0.2,1,1,1,@con_entry+1),
(0,43675,0.3,1,1,1,@con_entry+1),
(0,43676,0.2,1,1,1,@con_entry+1),
(0,43677,0.3,1,1,1,@con_entry+1),
(0,43678,0.3,1,1,1,@con_entry+1),
(0,43679,0.2,1,1,1,@con_entry+1),
(0,43680,0.3,1,1,1,@con_entry+1),
(0,43681,0.3,1,1,1,@con_entry+1),
(0,43682,0.2,1,1,1,@con_entry+1),
(0,43683,0.3,1,1,1,@con_entry+1),
(0,43684,0.4,1,1,1,@con_entry+1),
(0,43685,0.3,1,1,1,@con_entry+1),
(0,43686,0.2,1,1,1,@con_entry+1),
(0,43687,0.4,1,1,1,@con_entry+1),
-- Gold coins
(0,43627,0.2,1,1,1,@con_entry+1),
(0,43628,0.2,1,1,1,@con_entry+1),
(0,43629,0.2,1,1,1,@con_entry+1),
(0,43630,0.2,1,1,1,@con_entry+1),
(0,43631,0.2,1,1,1,@con_entry+1),
(0,43632,0.2,1,1,1,@con_entry+1),
(0,43633,0.2,1,1,1,@con_entry+1),
(0,43634,0.2,1,1,1,@con_entry+1),
(0,43635,0.2,1,1,1,@con_entry+1),
(0,43636,0.2,1,1,1,@con_entry+1),
(0,43637,0.2,1,1,1,@con_entry+1),
(0,43638,0.2,1,1,1,@con_entry+1),
(0,43639,0.2,1,1,1,@con_entry+1),
(0,43640,0.2,1,1,1,@con_entry+1),
(0,43641,0.2,1,1,1,@con_entry+1);    

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


