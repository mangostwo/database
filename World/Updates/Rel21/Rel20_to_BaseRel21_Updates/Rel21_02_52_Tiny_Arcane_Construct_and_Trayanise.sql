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
    SET @cOldContent = '51';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '52';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Tiny_Arcane_Construct';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Tiny_Arcane_Construct_and_Trayanise';

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
-- Silvermoon City
 -- Tiny Arcane Construct & Trayanise
 UPDATE creature SET position_x = 9885.396484, position_y = -7178.180664, position_z = 31.035252, orientation = 2.174400, spawndist = 0, MovementType = 2 WHERE guid = 65505;
 UPDATE creature SET position_x = 9885.396484, position_y = -7178.180664, position_z = 31.035252, orientation = 2.174400, spawndist = 0, MovementType = 0 WHERE guid = 65501;
 DELETE FROM creature_movement WHERE id = 65505;
 UPDATE creature_template SET SpeedRun = 2.14286 WHERE entry = 18230;
 UPDATE creature_template SET MovementType = 2 WHERE entry = 18237;
 DELETE FROM creature_movement_template WHERE entry = 18237;
 INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
 (18237,1,9885.396484,-7178.180664,31.035252,0,1823701,2.174400,0,0),(18237,2,9874.66,-7162.49,30.9883,0,0,1.6849,0,0),(18237,3,9867.27,-7139.41,30.8761,0,0,2.7067,0,0),
 (18237,4,9854.31,-7131.54,30.8761,0,0,4.5838,0,0),(18237,5,9847.64,-7157.88,30.872,0,0,5.76032,0,0),(18237,6,9861.9,-7170.87,31.0189,0,0,6.05249,0,0),
 (18237,7,9873.74,-7173.99,31.0397,0,0,0.00492287,0,0),(18237,8,9890.37,-7171.11,32.1895,0,0,5.43674,0,0),(18237,9,9895.02,-7175.49,31.958,0,0,4.46547,0,0),
 (18237,10,9893.36,-7182.49,31.0275,0,0,4.92022,0,0),(18237,11,9895.51,-7193.74,31.0417,0,0,5.16841,0,0),(18237,12,9906.69,-7211.17,30.8854,0,0,5.81557,0,0),
 (18237,13,9931.21,-7214.64,30.862,0,0,5.76216,0,0),(18237,14,9940.99,-7221.3,30.864,0,0,0.741898,0,0),(18237,15,9954.58,-7211.49,30.8713,0,0,2.46271,0,0),
 (18237,16,9942.29,-7198.26,30.8727,0,0,2.97636,0,0),(18237,17,9926.37,-7194.28,30.8702,0,0,2.64256,0,0),(18237,18,9915.16,-7187.84,30.9266,0,0,3.17113,0,0),
 (18237,19,9897.61,-7190.49,31.0442,0,0,2.35529,0,0),(18237,20,9885.35,-7178.22,31.0347,0,0,2.32702,0,0);
 DELETE FROM dbscripts_on_creature_movement WHERE id = 1823701; 
 INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
 (1823701,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');
 -- link
 DELETE FROM creature_linking WHERE guid = 65501;
 INSERT INTO creature_linking (guid, master_guid, flag) VALUES
 (65501, 65505, 512);
 
-- Scripts http://paste2.org/xpbELfc3
 -- Trayanise
Delete from `creature_ai_scripts` where `creature_id`= 18230;
Insert into `creature_ai_scripts` values 
('1823001','18230','1','0','75','33','6000','18000','32000','48000','1','-1823001','-1823002','-1823003','1','-1823004','-1823005','0','0','0','0','0','Trayanise - Random say on OOC');
UPDATE creature_template SET AIName='EventAI' WHERE `entry` = '18230';
-- texts
DELETE FROM `creature_ai_texts` WHERE `entry` IN ('-1823001','-1823002','-1823003','-1823004','-1823005');
INSERT into `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES
('-1823001','The magister\'s going to kill me...','0','0','0','18230','0'),
('-1823002','Argh. They told me those crystals would work properly!','0','0','0','18230','0'),
('-1823003','When I catch you, I\'m going to disenchant your components, so help me...','0','0','0','18230','0'),
('-1823004','You stay out of the regent lord\'s way! I mean it!','0','0','0','18230','0'),
('-1823005','No, no, no! Come back here!','0','0','0','18230','0');

-- Also pls add these scripts:
-- Scarlet Commander Rodrick -- update -- agrro texts added
Delete from `creature_ai_scripts` where `creature_id`= 29000;
Insert into `creature_ai_scripts` values 
('2900001','29000','0','0','100','0','0','0','0','0','1','-9000','-9001','0','0','0','0','0','0','0','0','0','Scarlet Commander Rodrick - Random Say on Aggro'),
('2900002','29000','9','0','100','1','0','5','7000','13000','11','52835','1','0','0','0','0','0','0','0','0','0','Scarlet Commander Rodrick - Cast Cleave'),
('2900003','29000','2','0','100','1','30','0','7000','10000','11','31713','0','1','0','0','0','0','0','0','0','0','Scarlet Commander Rodrick - Cast Holy Light at 30% HP');
DELETE FROM `creature_ai_texts` WHERE `entry` IN ('-9000','-9001');
INSERT into `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
('-9000','I will present your head to Abbendis myself!','0','0','0','0','29000'), 
('-9001','Scourge filth! DIE!','0','0','0','0','29000'); 

-- Vinemaster Suntouched <Wine & Spirits Merchant>
-- Update
Delete from `creature_ai_scripts` where `id`= 1644202;
Insert into `creature_ai_scripts` values
('1644202','16442','1','0','75','1','2000','3500','6500','9000','5','1','0','0','0','0','0','0','0','0','0','0','Vinemaster Suntouched - Emote while OOC');
    

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

