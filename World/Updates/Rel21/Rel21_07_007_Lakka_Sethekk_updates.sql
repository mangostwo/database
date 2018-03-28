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
    SET @cOldStructure = '07'; 
    SET @cOldContent = '006';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '007';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Lakka_Sethekk_updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Lakka_Sethekk_updates';

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

    SET @DBSstring := (SELECT MAX(entry) FROM `db_script_string`);
	SET @condition := (SELECT MAX(condition_entry) FROM `conditions`);

	-- Correct position set for The Talon King's coffer
	UPDATE `gameobject` SET `rotation2` = 0.01 , `rotation3` = 0.997502 WHERE `id` = 187372;

	-- Sethekk Cage flag update to support Lakka scripts
	UPDATE `gameobject_template` SET `flags` = 36 WHERE `entry` = 183051;

	-- Lakka Spawn time update
	UPDATE `creature` SET `spawntimesecs` = '3600' WHERE `guid` = 132569;

	-- Set Condition
	DELETE FROM `conditions` WHERE `type` = 9 AND `value1` = 10097;
	INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
	(@condition+1,9,10097,0);

	-- Gossip updates
	UPDATE `gossip_menu_option` SET `action_menu_id` = '-1', `condition_id` = @condition+1, `action_script_id` = 18956 WHERE `menu_id` = 7868 AND `id` = 0;

	-- Lakka Yell
	INSERT INTO `db_script_string` (`entry`, `content_default`, `type`, `comment`) VALUES 
	(@DBSstring+1, 'Well done! Hurry, though, we don\'t want to be caught!', 1, 'Lakka yell on Darkweaver Syth death.'),
	(@DBSstring+2,'Thank you for freeing me, $N! I\'m going to make my way to Shattrath!', 0, 'Lakka say on interaction.');

	-- Scripting for Lakka
	DELETE FROM `db_scripts` WHERE `id` IN (18472,18956);
	INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
	(4,18472,0,0,0,0,18956,80,0,@DBSstring+1,0,0,0,0,0,0,0,'Lakka yell on Darkweaver Syth death'),
	(2,18956,0,0,0,0,0,0,0,@DBSstring+2,0,0,0,0,0,0,0,'Lakka Say on interaction'),
	(2,18956,0,29,1,2,0,0,0,0,0,0,0,0,0,0,0,'Remove Gossip from Lakka'),
	(2,18956,3,8,18956,1,0,0,0,0,0,0,0,0,0,0,0,'Lakka Kill Credit'),
	(2,18956,3,13,0,0,183051,10,1,0,0,0,0,0,0,0,0,'open'),
	(2,18956,4,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'Lakka Set move to waypoint'),
	(3,18956,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'Despawn Lakka');


	DELETE FROM `creature_movement_template` WHERE entry = 18956;
	INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
	(18956,1,-160.813,157.043,0.094095,0,0,0,0,0,0,0,0,0,0,1.0821,0,0),
	(18956,2,-156.7,160.843,0.010773,0,0,0,0,0,0,0,0,0,0,100,0,0),
	(18956,3,-146.93,163.551,0.010773,0,0,0,0,0,0,0,0,0,0,100,0,0),
	(18956,4,-138.504,165.892,0.010773,0,0,0,0,0,0,0,0,0,0,100,0,0),
	(18956,5,-134.105,172.18,0.010773,0,0,0,0,0,0,0,0,0,0,100,0,0),
	(18956,6,-133.561,174.155,0.010773,0,0,0,0,0,0,0,0,0,0,100,0,0),
	(18956,7,-131.21,174.777,0.010773,0,0,0,0,0,0,0,0,0,0,100,0,0),
	(18956,8,-70.6547,168.835,0.01005,0,0,0,0,0,0,0,0,0,0,100,0,0),
	(18956,9,-70.7984,137.84,0.007258,0,0,0,0,0,0,0,0,0,0,6.24292,0,0),
	(18956,10,-67.5385,119.423,0.00734,0,0,0,0,0,0,0,0,0,0,3.25995,0,0),
	(18956,11,-56.6444,109.451,0.007764,0,0,0,0,0,0,0,0,0,0,3.21041,0,0),
	(18956,12,-50.5946,100.709,0.007322,0,0,0,0,0,0,0,0,0,0,3.37349,0,0),
	(18956,13,-27.2817,100.42,0.007361,0,0,0,0,0,0,0,0,0,0,3.37349,0,0),
	(18956,14,-4.80826,100.298,0.007441,0,0,0,0,0,0,0,0,0,0,6.26341,0,0),
	(18956,15,6.6345,100.071,0.219709,0,0,0,0,0,0,0,0,0,0,5.47487,0,0),
	(18956,16,21.3792,75.4389,0.348982,0,0,0,0,0,0,0,0,0,0,5.26674,0,0),
	(18956,17,28.9546,72.1081,0.704597,0,0,0,0,0,0,0,0,0,0,5.89506,0,0),
	(18956,18,44.0055,69.2469,0.009486,0,0,0,0,0,0,0,0,0,0,4.64706,0,0),
	(18956,19,43.2135,37.9012,0.008092,0,0,0,0,0,0,0,0,0,0,4.68711,0,0),
	(18956,20,42.1774,4.77928,0.006881,0,0,0,0,0,0,0,0,0,0,3.27026,0,0),
	(18956,21,37.081,0.87821,0.006881,0,0,0,0,0,0,0,0,0,0,3.43676,0,0),
	(18956,22,1.25812,-0.140004,0.005954,0,18956,0,0,0,0,0,0,0,0,3.15402,0,0);
    

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

