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
    SET @cOldContent = '043';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '044';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Totem_of_Vark';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Totem_of_Vark';

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
-- q.9542 'Totem of Vark'
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(0,9542,1,10,17393,360000,0,0,0,0,0,0,0,-4637.05,-13067.3,-13.5973,0.26767,'summon Stillpine Ancestor Yor'),
(0,9542,2,21,1,0,17393,30,7,0,0,0,0,0,0,0,0,'active'),
(0,9542,2,36,0,0,17393,50,0,0,0,0,0,0,0,0,0,'face player'),
(0,9542,2,0,0,0,17393,50,0,2000000675,0,0,0,0,0,0,0,''),
(0,9542,3,3,0,0,17393,100,7,0,0,0,0,-4646.63,-13015.4,-1.38673,1.6751,''),
(0,9542,26,23,16995,0,17393,100,7 | 0x08,0,0,0,0,0,0,0,0,''),
(0,9542,28,3,0,0,17393,100,7,0,0,0,0,-4679.14,-12985,0.5803,1.93085,''),
(0,9542,43,20,0,0,17393,100,7,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(0,9542,44,36,0,0,17393,100,0,0,0,0,0,0,0,0,0,'face player'),
(0,9542,47,0,0,0,17393,100,0,2000000676,0,0,0,0,0,0,0,''),
(0,9542,50,15,30447,0,17393,100,7,0,0,0,0,0,0,0,0,''),
(0,9542,51,15,30448,0,17393,100,0,0,0,0,0,0,0,0,0,''),
(0,9542,53,0,0,0,17393,100,0,2000000677,0,0,0,0,0,0,0,''),
(0,9542,58,20,2,0,17393,100,7,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoints');
UPDATE quest_template SET SrcSpell = 0, StartScript = 9542 WHERE entry = 9542;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000675 AND 2000000678;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000675,'[Furbolg] Come, $n. Let us leave the water together, purified.',0,0,0,0,NULL),
(2000000676,'[Furbolg] We go now, together. We will seek Vark.',0,0,0,0,NULL),
(2000000677,'[Furbolg] Follow me to Vark.',0,0,0,0,NULL),
(2000000678,'[Furbolg] Hurry, $n. Vark awaits you.',0,0,0,0,NULL);

-- Stillpine Ancestor Yor
UPDATE creature_template SET SpeedRun = 1, MovementType = 0 WHERE Entry = 17393; -- maypoints will be set by script
DELETE FROM creature_movement_template WHERE entry = 17393;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17393, 1, -4679.14,-12985,0.5803, 2000, 1739301, 100, 0, 0),
(17393, 2, -4680.61,-12963.3,2.66436, 0, 0,1.62004, 0, 0),
(17393, 3, -4681.2,-12949.7,5.54, 0, 0,1.60826, 0, 0),
(17393, 4, -4682.73,-12929.5,3.47035, 0, 0,1.01921, 0, 0),
(17393, 5, -4667.73,-12909.8,1.50962, 0, 0,0.913182, 0, 0),
(17393, 6, -4647.96,-12887.9,2.97161, 0, 0,0.829145, 0, 0),
(17393, 7, -4639.09,-12877.2,4.9471, 0, 0,1.18179, 0, 0),
(17393, 8, -4630.71,-12855.1,4.28118, 0, 0,1.20142, 0, 0),
(17393, 9, -4620.17,-12829.9,6.06746, 0, 0,1.06005, 0, 0),
(17393, 10, -4612,-12814,7.12509, 0, 0,1.06791, 0, 0),
(17393, 11, -4601.96,-12795.7,3.27105, 0, 0,1.06791, 0, 0),
(17393, 12, -4588.53,-12774.2,7.44323, 0, 0,0.824432, 0, 0),
(17393, 13, -4575.77,-12760.8,6.10979, 0, 0,0.942242, 0, 0),
(17393, 14, -4563.73,-12744.2,9.99685, 0, 0,0.981512, 0, 0),
(17393, 15, -4554.96,-12729,12.2105, 0, 0,1.17393, 0, 0),
(17393, 16, -4547.41,-12712.1,9.81412, 0, 0,1.17001, 0, 0),
(17393, 17, -4538.2,-12689.2,12.5838, 0, 0,1.1975, 0, 0),
(17393, 18, -4533.22,-12668.1,16.8651, 0, 0,1.40955, 0, 0),
(17393, 19, -4532.96,-12656.8,15.2664, 0, 0,1.56663, 0, 0),
(17393, 20, -4532.78,-12637.9,16.5789, 0, 0,1.58234, 0, 0),
(17393, 21, -4533.02,-12619.1,12.0263, 0, 0,1.39385, 0, 0),
(17393, 22, -4532.77,-12592.5,14.642, 0, 0,1.58627, 0, 0),
(17393, 23, -4535.16,-12572.5,11.9603, 0, 0,1.06948, 0, 0),
(17393, 24, -4521.38,-12547.2,8.20642, 0, 0,1.10089, 0, 0),
(17393, 25, -4506.74,-12520.5,2.71515, 0, 0,1.0577, 0, 0),
(17393, 26, -4492.57,-12495.4,4.36968, 0, 0,1.08518, 0, 0),
(17393, 27, -4476.92,-12469.2,2.26036, 0, 0,1.11267, 0, 0),
(17393, 28, -4462.38,-12438.4,2.68436, 0, 0,6.13529, 0, 0),
(17393, 29, -4430.42,-12442,2.38524, 0, 0,0.680702, 0, 0),
(17393, 30, -4419.91,-12429.3,3.2091, 0, 0,1.24776, 0, 0),
(17393, 31, -4408.61,-12400.1,5.02559, 0, 0,1.72293, 0, 0),
(17393, 32, -4414.42,-12370.4,5.99229, 0, 0,1.90357, 0, 0),
(17393, 33, -4423.44,-12345,8.29463, 0, 0,1.93498, 0, 0),
(17393, 34, -4435.58,-12315.7,10.3162, 0, 0,2.55545, 0, 0),
(17393, 35, -4457.19,-12304.2,12.3064, 0, 0,2.68111, 0, 0),
(17393, 36, -4475.24,-12294,13.9122, 0, 0,2.39051, 0, 0),
(17393, 37, -4490.89,-12279.7,15.2792, 0, 0,1.9232, 0, 0),
(17393, 38, -4503.42,-12249.6,16.3871, 0, 0,1.97033, 0, 0),
(17393, 39, -4510.15,-12229.8,17.1362, 0, 0,1.87215, 0, 0),
(17393, 40, -4513.27,-12209.5,16.9777, 0, 0,1.70329, 0, 0),
(17393, 41, -4513.64,-12189.1,16.9593, 0, 0,1.31452, 0, 0),
(17393, 42, -4502.99,-12158,16.1291, 0, 0,1.67188, 0, 0),
(17393, 43, -4508.94,-12122.7,16.9898, 0, 0,1.53207, 0, 0),
(17393, 44, -4505.31,-12095.6,18.8873, 0, 0,1.41426, 0, 0),
(17393, 45, -4500.36,-12071.2,21.4168, 0, 0,2.12505, 0, 0),
(17393, 46, -4516.81,-12050.5,24.2492, 0, 0,2.28606, 0, 0),
(17393, 47, -4528.22,-12037.5,26.0347, 0, 0,1.81089, 0, 0),
(17393, 48, -4531.9,-12008.6,28.4037, 0, 0,1.85801, 0, 0),
(17393, 49, -4538.61,-11984.4,29.7635, 0, 0,1.83445, 0, 0),
(17393, 50, -4543.79,-11963.5,29.1954, 0, 0,1.29331, 0, 0),
(17393, 51, -4537.48,-11934.2,27.0094, 0, 0,1.36007, 0, 0),
(17393, 52, -4533.18,-11906.3,22.686, 0, 0,0.836996, 0, 0),
(17393, 53, -4504.71,-11879,17.5661, 0, 0,1.38397, 0, 0),
(17393, 54, -4500.36,-11845.7,15.0063, 0, 0,1.91411, 0, 0),
(17393, 55, -4510.63,-11816.8,13.8306, 0, 0,2.05941, 0, 0),
(17393, 56, -4531.7,-11786.6,15.5384, 0, 0,2.18115, 0, 0),
(17393, 57, -4555.94,-11756.9,17.6289, 0, 0,1.38004, 0, 0),
(17393, 58, -4546.7,-11735.9,19.533, 0, 0,1.14835, 0, 0),
(17393, 59, -4535.96,-11712.4,18.2368, 0, 0,0.653548, 0, 0),
(17393, 60, -4519.88,-11702.4,17.8815, 0, 0,0.523958, 0, 0),
(17393, 61, -4507,-11694.5,13.2184, 0, 0,0.916657, 0, 0),
(17393, 62, -4490.14,-11673,10.8723, 0, 0,1.15228, 0, 0),
(17393, 63, -4486.34,-11658,10.6353, 10000, 1739302, 1.51827, 0, 0);
DELETE FROM db_scripts WHERE id IN (1739301,1739302);
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1739301,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(3,1739302,1,0,0,0,0,0,0,2000000678,0,0,0,0,0,0,0,''),
(3,1739302,1,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(3,1739302,5,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive'),
(3,1739302,6,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'');

-- Acid 
-- Stillpine Ancestor Yor - update
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 17393;
INSERT INTO `creature_ai_scripts` VALUES
('1739301','17393','11','0','100','0','0','0','0','0','11','25035','0','1','3','0','17002','0','0','0','0','0','Stillpine Ancestor Yor - Cast Elemental Spawn-in and set correct modelid on Spawn');


-- q.9542 'Totem of Vark'
-- end part of quest
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1,9542,1,14,30448,0,0,0,2,0,0,0,0,0,0,0,0,''),
(1,9542,3,10,17410,15000,0,0,0,0,0,0,0,-4489.97,-11645.7,11.577,2.5501,'summon Stillpine Ancestor Vark'),
(1,9542,6,0,0,0,17410,50,0,2000000679,0,0,0,0,0,0,0,'');
UPDATE quest_template SET CompleteScript = 9542 WHERE entry = 9542;
DELETE FROM db_script_string WHERE entry = 2000000679;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000679,' [Furbolg] Bear witness to the savage acts of our adversaries, $n. They steal our young... our weak... Imprisoned here, they are left to the devices of the Bristlelimb. Set them free, Promised One!',0,0,0,0,NULL);
UPDATE creature_template SET MovementType = 0 WHERE Entry = 17410;

-- Acid 
-- Stillpine Ancestor Vark - update
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 17410;
INSERT INTO `creature_ai_scripts` VALUES
('1741001','17410','11','0','100','0','0','0','0','0','11','25035','0','1','3','0','17109','0','0','0','0','0','Stillpine Ancestor Vark - Cast Elemental Spawn-in and set correct modelid on Spawn');
UPDATE creature_template SET AIName = 'EventAI' WHERE `entry` = '17410';    
    

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

