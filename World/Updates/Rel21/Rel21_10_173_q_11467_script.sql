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
    SET @cOldContent = '172';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '173';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q 11467 script';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q 11467 script';

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

-- Source: https://github.com/cmangos/wotlk-db/commit/39b8226
-- Black Conrad's Ghost
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` IN (24790,24796);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (24790,24796);
INSERT INTO `creature_ai_scripts` values 
(2479001,24790,11,0,100,0,0,0,0,0,18,256,0,0,0,0,0,0,0,0,0,0,'Black Conrad\s Ghost - Set Unitflags on Spawn(q.11467)'),
(2479002,24790,0,0,100,0,0,0,0,0,11,51211,0,1,0,0,0,0,0,0,0,0,'Black Conrad\s Ghost - Say and cast Blade Flurry on Aggro(q.11467)'),
(2479003,24790,9,0,100,1,0,5,22000,28000,11,31022,1,0,0,0,0,0,0,0,0,0,'Black Conrad\s Ghost - Cast Ghostly Strike'),
-- Spectral Sailor
(2479601,24796,11,0,100,0,0,0,0,0,18,256,0,0,0,0,0,0,0,0,0,0,'Spectral Sailor - Set Unitflags on Spawn(q.11467)'),
(2479602,24796,29,0,100,0,3000,3000,0,0,19,256,0,0,0,0,0,0,0,0,0,0,'Spectral Sailor - Remove Unitflags on OOC Timer(q.11467)');


-- q.11467 'Dead Man's Debt"

-- Resp for object
UPDATE `gameobject` SET `spawntimesecs` = 120 WHERE `guid` = 18521;

DELETE FROM `db_scripts` WHERE id = 16326;
INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES 
(8,16326,1,10,24790,300000,0,0,0x08,0,0,0,0,688.9122,-3377.737,67.87585,1.291544,'summon Black Conrad\'s Ghost'),
(8,16326,1,10,24796,300000,0,0,0x08,0,0,0,0,687.27,-3374.881,67.92136,1.047198,'summon Spectral Sailor'),
(8,16326,1,10,24796,300000,0,0,0x08,0,0,0,0,691.5706,-3375.863,68.09953,1.308997,'summon Spectral Sailor'),
(8,16326,2,0,0,0,24790,100,7,2000001489,0,0,0,0,0,0,0,''),
(8,16326,5,0,0,0,24796,100,7,2000001490,0,0,0,0,0,0,0,'');
-- texts
DELETE FROM `db_script_string` WHERE entry IN (2000001489,2000001490,2000001491);
INSERT INTO `db_script_string` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(2000001489,'Yarrrr!  If it\'s me treasure yer lookin\' for... yer gonna have to fight for it!',0,0,0,1,'Black Conrad\'s Ghost'),
(2000001490,'Yer dead, landlubber!',0,0,0,0,'Spectral Sailor'),
(2000001491,'Yarrrrr... dead again!',0,0,0,0,'Black Conrad\'s Ghost');
-- Spectral Sailor
DELETE FROM `db_scripts` WHERE id = 24796;
INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES 
(4,24796,0,5,59,256,24790,500,0x04,0,0,0,0,0,0,0,0,'buddy - Remove Unitflags'),
(4,24796,1,21,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'unactive');
-- Black Conrad's Ghost
DELETE FROM `db_scripts` WHERE id = 24790;
INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES 
(4,24790,0,0,0,0,0,0,0,2000001491,0,0,0,0,0,0,0,''),
(4,24790,1,21,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'unactive');

-- Remove static spawn for Black Conrad's Ghost
DELETE FROM `creature` WHERE `id` = 24790;    

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


