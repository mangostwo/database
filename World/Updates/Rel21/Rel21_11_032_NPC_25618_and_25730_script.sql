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
    SET @cOldContent = '031';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '032';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'NPC 25618 and 25730 script';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'NPC 25618 and 25730 script';

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

 -- Source: https://github.com/ACID-Scripts/WOTLK/commit/3c4c78b

DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1433,-1434,-1435,-1436);
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`type`,`comment`) VALUES
(-1433,'%s\'s eyes glow red for a brief moment.',2,'25730'),
(-1434,'Is that the best you can do?',0,'25730'),
(-1435,'I require more bodies! Bring them to me at once!',1,'25618'),
(-1436,'Bring the Flenser the fallen Horde! They will be reanimated as soldiers of the Lich King!',1,'25618');

DELETE FROM `creature_ai_scripts` WHERE creature_id in (25618,25730);
INSERT INTO `creature_ai_scripts` VALUES
-- Varidus the Flenser   
(2561801,25618,11,0,100,0,0,0,0,0,11,45908,0,1,0,0,0,0,0,0,0,0,'Varidus the Flenser - cast Shield of Suffering on Spawn'),
(2561802,25618,1,0,100,1,2000,28000,240000,300000,1,-1435,-1436,0,0,0,0,0,0,0,0,0,'Varidus the Flenser - Random say on OOC'),
(2561803,25618,0,0,100,1,5000,9000,10000,13000,11,32711,0,0,0,0,0,0,0,0,0,0,'Varidus the Flenser - Cast Shadow Nova'),
(2561804,25618,0,0,100,1,9000,15000,20000,35000,11,50329,0,1,0,0,0,0,0,0,0,0,'Varidus the Flenser - Cast Shield of Suffering'),
(2561805,25618,6,0,100,0,0,0,0,0,26,11705,1,0,0,0,0,0,0,0,0,0,'Varidus the Flenser - quest credit on Death'),
-- Enkilah Necrolord
(2573001,25730,9,0,100,1,0,5,6000,8000,11,16044,4,0,0,0,0,0,0,0,0,0,'En\'kilah Necrolord - Cast Cleave'),     
(2573002,25730,9,0,100,1,0,5,16000,21000,11,26339,1,1,44,33,-1433,0,0,0,0,0,'En\'kilah Necrolord - Say and Cast Saurfang\'s Rage'),
(2573003,25730,0,0,100,1,6000,11000,6000,12000,11,24573,4,0,0,0,0,0,0,0,0,0,'En\'kilah Necrolord - Cast Mortal Strike'),
(2573004,25730,0,0,100,1,2000,4000,36000,51000,11,41097,0,1,0,0,0,0,0,0,0,0,'En\'kilah Necrolord - Cast Whirlwind'),
(2573005,25730,0,0,75,1,7000,15000,28000,43000,1,-1434,0,0,0,0,0,0,0,0,0,0,'En\'kilah Necrolord - 75% chance to say text');   

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


