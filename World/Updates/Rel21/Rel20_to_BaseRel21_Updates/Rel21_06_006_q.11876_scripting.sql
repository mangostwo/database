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
    SET @cOldContent = '005';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '006';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q.11876_scripting';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q.11876_scripting';

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
-- UDB Update
-- q.11876 'Help Those That Cannot Help Themselves'
DELETE FROM db_scripts WHERE id = 188022;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
-- 188022
(7,188022,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188022,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188022,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188022,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188022,3,3,0,700,25850,20,7,0,0,0,0,3276.23,5413.31,49.3704,0.675494,'move'),
(7,188022,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp');
DELETE FROM db_scripts WHERE id BETWEEN 188024 AND 188044;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
-- 188024
(7,188024,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188024,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188024,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188024,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188024,3,3,0,700,25850,20,7,0,0,0,0,3299.35,5363.28,41.8167,3.66393,'move'),
(7,188024,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188025
(7,188025,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188025,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188025,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188025,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188025,3,3,0,700,25850,20,7,0,0,0,0,3362.58,5456,60.0403,5.69271,'move'),
(7,188025,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188026
(7,188026,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188026,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188026,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188026,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188026,3,3,0,700,25850,20,7,0,0,0,0,3446.66,5462.18,61.6627,6.1993,'move'),
(7,188026,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188027
(7,188027,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188027,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188027,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188027,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188027,3,3,0,700,25850,20,7,0,0,0,0,3419.23,5416.17,54.9207,1.35731,'move'),
(7,188027,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188028
(7,188028,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188028,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188028,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188028,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188028,3,3,0,700,25850,20,7,0,0,0,0,3178.18,5411.58,57.057,5.59453,'move'),
(7,188028,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188029
(7,188029,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188029,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188029,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188029,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188029,3,3,0,700,25850,20,7,0,0,0,0,3309.39,5270.96,37.4582,2.87312,'move'),
(7,188029,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188030
(7,188030,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188030,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188030,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188030,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188030,3,3,0,700,25850,20,7,0,0,0,0,3454.62,5226.88,30.3313,5.59452,'move'),
(7,188030,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188031
(7,188031,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188031,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188031,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188031,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188031,3,3,0,700,25850,20,7,0,0,0,0,3473.22,5307.9,40.8232,6.09324,'move'),
(7,188031,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188032
(7,188032,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188032,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188032,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188032,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188032,3,3,0,700,25850,20,7,0,0,0,0,3497.57,5200.39,26.4596,4.26326,'move'),
(7,188032,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188033
(7,188033,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188033,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188033,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188033,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188033,3,3,0,700,25850,20,7,0,0,0,0,3580.01,5312.17,25.1742,5.73195,'move'),
(7,188033,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188034
(7,188034,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188034,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188034,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188034,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188034,3,3,0,700,25850,20,7,0,0,0,0,3584.18,5186.49,27.8103,3.12836,'move'),
(7,188034,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188035
(7,188035,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188035,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188035,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188035,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188035,3,3,0,700,25850,20,7,0,0,0,0,3612,5235.54,26.2156,3.77631,'move'),
(7,188035,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188036
(7,188036,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188036,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188036,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188036,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188036,3,3,0,700,25850,20,7,0,0,0,0,3713.86,5141.2,26.4649,6.0791,'move'),
(7,188036,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188037
(7,188037,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188037,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188037,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188037,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188037,3,3,0,700,25850,20,7,0,0,0,0,3697.41,5369.45,35.9247,1.67455,'move'),
(7,188037,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188038
(7,188038,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188038,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188038,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188038,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188038,3,3,0,700,25850,20,7,0,0,0,0,3759.02,5221.55,25.32,4.6726,'move'),
(7,188038,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188039
(7,188039,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188039,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188039,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188039,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188039,3,3,0,700,25850,20,7,0,0,0,0,3849.19,5355.75,26.2609,6.09634,'move'),
(7,188039,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188040
(7,188040,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188040,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188040,2,0,0,0,25850,20,7,2000000562,0,0,0,0,0,0,0,''),
(7,188040,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188040,3,3,0,700,25850,20,7,0,0,0,0,3711.01,5472.49,38.0436,1.77665,'move'),
(7,188040,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188041
(7,188041,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188041,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188041,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188041,3,3,0,700,25850,20,7,0,0,0,0,3805.27,5536.42,41.6955,1.56066,'move'),
(7,188041,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188042
(7,188042,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188042,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188042,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188042,3,3,0,700,25850,20,7,0,0,0,0,3899.58,5375.65,24.2348,3.46918,'move'),
(7,188042,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188043
(7,188043,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188043,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188043,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188043,3,3,0,700,25850,20,7,0,0,0,0,4062.82,5402.11,28.7337,5.80181,'move'),
(7,188043,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 188044
(7,188044,1,31,25850,20,0,0,0,0,0,0,0,0,0,0,0,'search for 25850'),
(7,188044,2,15,46200,0,0,0,0x04,0,0,0,0,0,0,0,0,'q. credit'),
(7,188044,2,28,0,0,25850,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(7,188044,3,3,0,700,25850,20,7,0,0,0,0,4055.24,5549.79,39.9905,1.5803,'move'),
(7,188044,3,18,5000,0,25850,20,7,0,0,0,0,0,0,0,0,'desp');
-- Trapped Mammoth Calf - missing creature added

SET @GUID := (SELECT MAX(guid) FROM `creature`);
INSERT INTO creature (guid, id, modelid, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana, MovementType) VALUES
(@GUID+1,25850,0,571,1,1,3157.15,5430.63,56.9338,1.35731,120,0,6986,0,0),
(@GUID+2,25850,0,571,1,1,3333.38,5265.18,35.5353,4.46355,120,0,6986,0,0),
(@GUID+3,25850,0,571,1,1,3700.09,5342.13,36.0727,0.578173,120,0,6986,0,0);

UPDATE creature SET spawntimesecs = 120 WHERE id = 25850; -- sync with trap
DELETE FROM creature_template_addon WHERE entry = 25850;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(25850,0,7,1,0,0,0,NULL);
DELETE FROM db_script_string WHERE entry = 2000000562;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000562,'%s trumpets in approval!',0,2,0,377,NULL);
-- Mammoth trap
UPDATE gameobject SET spawntimesecs = 120, animprogress = 255 WHERE id = 188022; -- sync with creature
UPDATE gameobject SET spawntimesecs = 120, animprogress = 255 WHERE id BETWEEN 188024 AND 188044; -- sync with creature
UPDATE gameobject_template SET data2 = 120000 WHERE entry = 188022; -- Type button - must back to his default state
UPDATE gameobject_template SET data2 = 120000 WHERE entry BETWEEN 188024 AND 188044; -- Type button - must back to his default state    
    

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

