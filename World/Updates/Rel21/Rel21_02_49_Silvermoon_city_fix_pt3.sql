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
    SET @cOldStructure = '02'; 
    SET @cOldContent = '48';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '49';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Silvermoon_city_fix_pt3';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Silvermoon_city_fix_pt3';

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

-- UDB update
-- Silvermoon City
 -- Innkeeper Jovia <Innkeeper>
 UPDATE creature_template SET GossipMenuId = 7288 WHERE Entry = 17630;
 DELETE FROM gossip_menu WHERE entry = 7288;
 INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
 (7288, 8618, 0, 0);
 
 -- Winthren <Shield Merchant>
 UPDATE creature SET position_x = 9451.738, position_y = -7122.863, position_z = 16.14618, orientation = 6.128479, Spawndist = 0, MovementType = 2 WHERE guid = 57682;
 DELETE FROM creature_movement WHERE id = 57682;
 UPDATE creature_template SET MovementType = 2 WHERE entry = 16693;
 DELETE FROM creature_movement_template WHERE entry = 16693;
 INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
 (16693,1,9451.738,-7122.863,16.14618,30000,0,6.128479,0,0),
 (16693,2,9452.37,-7125.35,16.1465,30000,1669301,5.8332,0,0),
 (16693,3,9451.99,-7128.64,16.1465,30000,1669301,4.45247,0,0),
 (16693,4,9451.738,-7122.863,16.14618,0,0,1.57634,0,0),
 (16693,5,9451.738,-7122.863,16.14618,30000,0,6.128479,0,0);
 DELETE FROM dbscripts_on_creature_movement WHERE id = 1669301; 
 INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
 (1669301,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
 (1669301,28,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
 
 -- Tynna <Plate Armor Merchant>
 UPDATE `creature_template_addon` SET `emote` = '0' WHERE `entry` = '16626'; -- Update to support new WP
 UPDATE creature SET position_x = 9453.12, position_y = -7138.64, position_z = 16.1464, orientation = 0.186189, Spawndist = 0, MovementType = 2 WHERE guid = 57621;
 DELETE FROM creature_movement WHERE id = 57621;
 UPDATE creature_template SET MovementType = 2 WHERE entry = 16626;
 DELETE FROM creature_movement_template WHERE entry = 16626;
 INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
 (16626,1,9453.12,-7138.64,16.1464,45000,0,0.186189,0,0),
 (16626,2,9455.66,-7135.42,16.1352,0,0,2.63973,0,0),
 (16626,3,9453.97,-7134.69,16.1431,30000,1662601,2.99316,0,0),
 (16626,4,9451.153,-7138.656,16.14635,30000,1662601,3.255405,0,0),
 (16626,5,9453.12,-7138.64,16.1464,240000,0,0.186189,0,0);
 DELETE FROM dbscripts_on_creature_movement WHERE id = 1662601; 
 INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
 (1662601,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
 (1662601,28,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
    

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

