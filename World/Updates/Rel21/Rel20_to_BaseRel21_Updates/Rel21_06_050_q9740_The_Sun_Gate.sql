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
    SET @cOldContent = '049';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '050';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q9740_The_Sun_Gate';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q9740_The_Sun_Gate';

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

-- q.9740 'The Sun Gate'

-- Sun Gate Event Manager
SET @GUID := (SELECT MAX(guid) FROM `creature`);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(@GUID+1,17889,530,1,1,0,0,-2143.43,-10692,64.7658,4.939282,300,0,0,42,0,0,0);

-- visual effects
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (63582,63583,63584,63585);
DELETE FROM creature_movement WHERE id IN (63582,63583,63584,63585);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(63583,1,-2147.35,-10741.1,73.9034, 10000, 1786601,2.1293, 0, 0),
(63584,1,-2128.94,-10726,66.3358, 10000, 1786602,2.1293, 0, 0),
(63585,1,-2107.07,-10703,65.1894, 10000, 1786603,2.46091, 0, 0),
(63582,1,-2098.62,-10688.5,65.2181, 10000, 1786604,2.74017, 0, 0);
DELETE FROM db_scripts WHERE id BETWEEN 1786601 AND 1786604;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1786601,2,15,31411,0,17889,63610,1 | 0x08,0,0,0,0,0,0,0,0,''),
(3,1786601,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3,1786602,2,15,31412,0,17889,@GUID+1,1 | 0x08,0,0,0,0,0,0,0,0,''),
(3,1786602,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3,1786603,2,15,31413,0,17889,63611,1 | 0x08,0,0,0,0,0,0,0,0,''),
(3,1786603,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3,1786604,2,15,31414,0,17889,63609,1 | 0x08,0,0,0,0,0,0,0,0,''),
(3,1786604,3,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Sunhawk Portal Controlers
DELETE FROM db_scripts WHERE id IN (12164,12166,12168,12173);
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(6,12168, 1, 15, 5, 0, 17886, 63582, 7, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6,12173, 1, 15, 5, 0, 17886, 63585, 7, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6,12164, 1, 15, 5, 0, 17886, 63584, 7, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6,12166, 1, 15, 5, 0, 17886, 63583, 7, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM db_scripts WHERE id IN (17886);
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(4,17886, 1, 31, 17886, 80, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, '[DND]Sunhawk Portal Controller - terminate script if alive'),
(4,17886, 3, 27, 8, 0, 182026, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sun Gate - allow GO interact');

-- synchr. objects with creatures
UPDATE creature SET spawntimesecs = 90 WHERE id = 17886;
UPDATE gameobject SET spawntimesecs = 90 WHERE id = 184850;

-- 184850 -- sun gate objext
-- soutce @TrinityCore
DELETE FROM spell_template WHERE id = 38096;
INSERT INTO spell_template (id, attr, attr_ex, attr_ex2, attr_ex3, proc_flags, proc_chance, duration_index, effect0, effect0_implicit_target_a, effect0_implicit_target_b, effect0_radius_idx, effect0_apply_aura_name, effect0_misc_value, effect0_misc_value_b, effect0_trigger_spell, comments) VALUES
(38096, 384, 0, 9, 0, 0, 101, 21, 6, 38, 0, 0, 4, 0, 0, 0, '[DND]Destroy Sun Gate Portal Controller');
-- spell must have a target
DELETE FROM spell_script_target WHERE entry = 38096;
INSERT INTO spell_script_target (entry, type, targetEntry, inverseEffectMask) VALUES
(38096, 1, 17886, 0);    
    

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

