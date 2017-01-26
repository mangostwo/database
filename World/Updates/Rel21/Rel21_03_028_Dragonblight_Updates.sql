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
    SET @cOldContent = '027';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '028';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Dragonblight_Updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Dragonblight_Updates';

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

-- Magister Keldonus and Grand Magus Telestra argo conversations
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '26832';
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2682806, 2682807, 2682808, 2683200, 2683201);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2682806','26828','4','0','100','0','0','0','0','0','45','5','200','0','0','0','0','0','0','0','0','0','On argo, 26828 say / Send event to 26832'),
('2682807','26828','2','0','100','0','75','0','0','0','1','-268320','0','0','0','0','0','0','0','0','0','0','say at 75%'),
('2682808','26828','6','0','100','0','0','0','0','0','45','6','200','0','0','0','0','0','0','0','0','0','On death, Send event to 26832'),
('2683200','26832','30','0','100','0','5','0','0','0','1','-268280','0','0','0','0','0','0','0','0','0','0','EVENT recieve and force 26832 say'),
('2683201','26832','30','0','100','0','6','0','0','0','1','-268321','0','0','0','0','0','0','0','0','0','0','EVENT recieve and force 26832 say');
DELETE FROM `creature_ai_texts` WHERE `entry` IN ('-268320', '-268280', '-268321');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-268321','This transgression against the Blue Dragonsflight has been noted. I will take extra pleasure in separating the life energy from your body!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','26832'),
('-268320','You test my patience, you now see the true might of the Blue.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','26832'),
('-268280','Deal with this interruption, Keldonus. After you are through, bring the head of the one they call $n. I will decorate my chambers with their skull.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','26828');


-- Captain Emmy Malin
DELETE FROM `creature_ai_texts` WHERE `entry` IN ('-267620', '-267621');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-267621','I\'m sorry, daddy....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','7','0','26762'),
('-267620','Keep them away from the focus!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','26762');
UPDATE `creature_ai_scripts` SET `action3_type` = '1' , `action3_param1` = '-267620', `comment` = 'Captain Emmy Malin - Cast Frostbolt and Set Phase 1 on Aggro - Say' WHERE `id` = '2676202';
DELETE FROM `creature_ai_scripts` WHERE `id` = '2676214';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `comment`) VALUES 
('2676214', '26762', '6', '1', '-267621', 'Captain Emmu Malin - Say on death');

-- Goramosh say on argo
DELETE FROM `creature_ai_texts` WHERE `entry` = '-263490';
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-263490','You\'re too late! The accord has been negotiated. Only the details remain. Small details... like you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','26349');
UPDATE `creature_ai_scripts` SET `action3_type` = '1' , `action3_param1` = '-263490' , `comment` = 'Goramosh - Cast Frostbolt and Set Phase 1 on Aggro - Say' WHERE `id` = '2634902';


-- Delete duplicate
DELETE FROM `creature` WHERE `guid` = '105034';
DELETE FROM `creature_addon` WHERE guid = '105034';

-- Captain Shely
DELETE FROM `creature_ai_texts` WHERE `entry` IN ('-272320');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-272320','Filthy cretin. Your kind doesn\'t deserve to live. Have at thee!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','27232'); 
DELETE FROM `creature_ai_scripts` WHERE `id` = '2723200';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `comment`) VALUES 
('2723200', '27232', '4', '1', '-272320', 'Captain Shely - Say on argo');

-- Lieutenant Ta'zinni
DELETE FROM `creature_ai_scripts` WHERE `id` = '2681511';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `action1_param1`, `comment`) VALUES ('2681511', '26815', '6', '1', '-268152', 'Liutenant Ta\'zinni - Say on death');
UPDATE `creature_ai_scripts` SET `action3_type` = '1' , `action3_param1` = '-268151' , `comment` = 'Lieutenant Ta\'zinni - Cast Frostfire Bolt and say and Set Phase 1 on Aggro' WHERE `id` = '2681502';
DELETE FROM `creature_ai_texts` WHERE `entry` IN ('-268151', '-268152');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `comment`) VALUES ('-268151', 'Ya shouldn\'a taken the boat north, mon!', '26815'); -- On argo
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `language`, `comment`) VALUES ('-268152', 'Ah, Deino, mah sistah. Ta\'zinni die now.', '14', '26815'); -- On Death




-- The Focus on the Beach
UPDATE `creature_template` SET `UnitFlags` = '33554432' WHERE `Entry` = '26773';
UPDATE `spell_script_target` SET `targetEntry` = '26773' WHERE `entry` = '50546' AND `type` = '1' AND `targetEntry` = '24021' AND `inverseEffectMask` = '0';
UPDATE `spell_script_target` SET `targetEntry` = '26773' WHERE `entry` = '47374' AND `type` = '1' AND `targetEntry` = '24021' AND `inverseEffectMask` = '0';
UPDATE `creature` SET `id` = '26773' WHERE `guid` IN (115947, 116021, 115925, 116025, 116020, 115948, 116024, 116026, 116035, 116023, 116029, 115927, 116030, 116032, 116022, 115926, 116031, 116033, 115924);
-- Atop the Woodlands
UPDATE `creature_template` SET `UnitFlags` = '33554432' WHERE `Entry` = '26831';
UPDATE `spell_script_target` SET `targetEntry` = '26831' WHERE `entry` = '47469' AND `type` = '1' AND `targetEntry` = '24021' AND `inverseEffectMask` = '0';
UPDATE `spell_script_target` SET `targetEntry` = '26831' WHERE `entry` = '50547' AND `type` = '1' AND `targetEntry` = '24021' AND `inverseEffectMask` = '0';
UPDATE `creature` SET `id` = '26831' WHERE `guid` IN  (115921, 115923, 115922, 115946, 115920, 115945, 116044, 116046, 116038, 116037, 116049, 116050, 116045, 116043, 116047, 116039, 116040, 116042);
-- The End of the Line
UPDATE `creature_template` SET `UnitFlags` = '33554432' WHERE `Entry` = '26887';
UPDATE `spell_script_target` SET `targetEntry` = '26887' WHERE `entry` = '47634' AND `type` = '1' AND `targetEntry` = '24021' AND `inverseEffectMask` = '0';
UPDATE `spell_script_target` SET `targetEntry` = '26887' WHERE `entry` = '50548' AND `type` = '1' AND `targetEntry` = '24021' AND `inverseEffectMask` = '0';
UPDATE `creature` SET `id` = '26887' WHERE `guid` IN  (115975, 115976, 115959, 115958, 115974, 115973, 116053, 116055, 116054, 116058, 116060, 116057, 116051, 116065, 116056, 116061, 116059);   
    

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

