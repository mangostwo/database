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
    SET @cOldContent = '001';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '002';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q.11676_ Merciful_Freedom';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q.11676_ Merciful_Freedom';

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

-- q.11676 'Merciful Freedom'
-- UDB Source
-- Scourge Prisoner
UPDATE creature SET spawntimesecs = 120 WHERE id = 25610;
DELETE FROM db_scripts WHERE id IN (187854,187855,187856,187857,187858,187859,187860,187861,187862,187863,187864,187865,187866,187867,187868,187870,187871,187872,187873,187874);
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
-- 187854
(7,187854,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187854,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187854,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187855
(7,187855,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187855,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187855,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187856
(7,187856,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187856,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187856,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187857
(7,187857,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187857,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187857,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187858
(7,187858,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187858,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187858,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187859
(7,187859,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187859,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187859,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187860
(7,187860,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187860,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187860,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187861
(7,187861,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187861,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187861,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187862
(7,187862,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187862,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187862,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187863
(7,187863,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187863,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187863,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187864
(7,187864,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187864,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187864,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187865
(7,187865,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187865,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187865,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187866
(7,187866,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187866,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187866,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187867
(7,187867,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187867,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187867,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187868
(7,187868,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187868,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187868,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187870
(7,187870,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187870,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187870,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187871
(7,187871,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187871,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187871,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187872
(7,187872,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187872,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187872,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187873
(7,187873,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187873,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187873,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp'),
-- 187874
(7,187874,1,0,0,0,25610,20,7,2000000558,2000000559,2000000560,2000000561,0,0,0,0,'random say'),
(7,187874,2,8,25610,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,187874,2,18,3000,0,25610,20,7,0,0,0,0,0,0,0,0,'desp');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000558 AND 2000000561;
INSERT INTO db_script_string (entry, content_default, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000558,'Thank you, friend.',0,0,0,1,NULL),
(2000000559,'I am forever indebted to you, friend.',0,0,0,1,NULL),
(2000000560,'Freedom at last! I must return to Warsong at once!',0,0,0,1,NULL),
(2000000561,'You have my thanks, stranger.',0,0,0,1,NULL);


-- ACID
-- ACID UDB 240
-- Scourge Prisoner
DELETE FROM `creature_ai_scripts` WHERE `creature_id`= 25610;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2561001','25610','1','0','33','1','2000','28000','56000','80000','1','-12000','-12001','-12002','0','0','0','0','0','0','0','0','Scourge Prisoner - Random say on OOC');
UPDATE creature_template SET AIName= 'EventAI' WHERE `entry` = '25610';
-- PLS SET correct TEXT in ACID
DELETE FROM `creature_ai_texts` WHERE `entry` IN ('-12000','-12001','-12002');
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES
('-12000','Kill me... Kill me now!','0','0','0','25610','1'),
('-12001','Somebody please... Help...','0','0','0','25610','1'),
('-12002','Don\'t let them turn me into one of those aberrations!','0','0','0','25610','1');    
    

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

