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
    SET @cOldStructure = '03'; 
    SET @cOldContent = '12';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '13';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Draenei Youngling..';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Draenei Youngling..';

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

-- UDB UPDATE [415] Draenei Youngling..
-- Draenei Youngling
UPDATE creature_template SET UnitFlags = 32784 WHERE entry = 17587;
UPDATE creature_template_addon SET b2_1_pvp_state = 1 WHERE entry = 17587;
-- 1st spawn corrected
UPDATE creature SET spawndist = 30, MovementType = 1 WHERE guid = 63170;
-- other spawns   
-- missing added - UDB free guids reused
DELETE FROM creature WHERE guid IN (37522,60821,60825,60838);
DELETE FROM creature_addon WHERE guid IN (37522,60821,60825,60838);
DELETE FROM creature_movement WHERE id IN (37522,60821,60825,60838);
DELETE FROM game_event_creature WHERE guid IN (37522,60821,60825,60838);
DELETE FROM game_event_creature_data WHERE guid IN (37522,60821,60825,60838);
DELETE FROM creature_battleground WHERE guid IN (37522,60821,60825,60838);
DELETE FROM creature_linking WHERE guid IN (37522,60821,60825,60838)
OR master_guid IN (37522,60821,60825,60838);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(37522,17587,530,1,1,0,404,-4643.23,-12159.8,34.6878,3.32633,300,30,0,680,0,0,1),
(60821,17587,530,1,1,0,404,-4409.25,-12797,16.8544,4.66544,300,30,0,680,0,0,1),
(60825,17587,530,1,1,0,404,-4023.08,-12850,6.73636,5.87496,300,30,0,680,0,0,1),
(60838,17587,530,1,1,0,404,-3369.35,-12052.8,23.251,4.46517,300,30,0,680,0,0,1);
-- Only one can be spawned at at the same time
DELETE FROM pool_template WHERE entry = 25523;
INSERT INTO pool_template (entry, max_limit, description) VALUES 
(25523,1,'Draenei Youngling');
DELETE FROM pool_creature_template WHERE pool_entry = 25523;
INSERT INTO pool_creature_template (id, pool_entry, chance, description) VALUES
(17587, 25523, 0, 'Draenei Youngling - 17587');

-- Acid
DELETE FROM `creature_ai_texts` WHERE `entry` in ('-1410', '-1411', '-1412', '-1413', '-1414', '-1415', '-1416', '-1417');
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES
('-1410','My death matters little... the Hammer will still fall!','0','0','0','Common Text','0'),
('-1411','Hrm, azure snapdragons? Where do they come up with these names? Daedal has gone mad!','0','0','0','17587','0'),
('-1412','Where in the Nether are these damnable lashers?','0','0','0','17587','0'),
('-1413','These stags are nothing like talbuks.','0','0','0','17587','0'),
('-1414','I wonder what that little purple creature at the village is...It\'s certainly beautiful.','0','0','0','17587','0'),
('-1415','I\'m supposed to be hunting infected nightstalkers...this should be easy.','0','0','0','17587','0'),
('-1416','Time to meet your maker!','0','0','0','17587','0'),
('-1417','Thanks for the heal, $N!','0','0','0','17587','0');

DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN '1758701' AND '1758703';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
-- Draenei Youngling (17587)
 ('1758701','17587','1','0','75','33','10000','60000','120000','240000','1','-1411','-1412','-1413','1','-1414','-1415','0','0','0','0','0','Draenei Youngling - Randomized Say OOC'),
 ('1758702','17587','4','0','50','0','0','0','0','0','1','-1416','0','0','0','0','0','0','0','0','0','0','Draenei Youngling - Say on Aggro'),
 ('1758703','17587','8','0','100','1','59542','-1','0','0','1','-1417','0','0','0','0','0','0','0','0','0','0','Draenei Youngling - Say on SpellHIT');    
    

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

