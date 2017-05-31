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
    SET @cOldContent = '029';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '030';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Wind_Trader_Marid_Support';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Wind_Trader_Marid_Support';

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
UPDATE `creature` SET `MovementType` = '2' WHERE `guid` = '71519';
UPDATE `creature_template` SET `GossipMenuId` = '20071', `MovementType` = '2' WHERE `Entry` = '20071';
DELETE FROM `gossip_menu` WHERE `entry` = 20071;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES('20071','9971','0','0');

DELETE FROM `conditions` WHERE `condition_entry` = 1734;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES('1734','9','10273','0');

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 20071;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES('20071','0','0','Wind Trader Marid, I\'ve returned with more information on the nether drakes.\r\nI\'m prepared to be your business partner, and for an extra sum, I\'ll take care of that troublesome elf and her human friend.','1','1','-1','0','2007101','0','0',NULL,'1734');

DELETE FROM `db_script_string` WHERE `entry` IN (2000005832, 2000005833, 2000005834);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('2000005832','Let us hold or discussion in a more... private place. Follow me, $n.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Wind Trader Marid - Say 1'),
('2000005833','You didn\'t really think I\'d do business with you again, did you? Sometimes, the best way to return to profitability is to know when to cut your losses.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Wind Trader Marid - Say 2');


DELETE FROM `creature_movement_template` WHERE `entry` = 20071;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
('20071','1','4279.62','2232.24','124.3','0','2007102','0','0','0','0','0','0','0','0','0','0','0'),
('20071','2','4279.62','2232.24','124.3','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','3','4283.74','2231.3','124.2','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','4','4295.62','2222.03','124.21','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','5','4297.24','2214.54','120.36','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','6','4306.71','2198.7','119.78','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','7','4308.41','2188.93','115.471','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','8','4309.93','2182.38','117.51','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','9','4309.77','2166.84','117.59','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','10','4312.71','2161.49','122.01','0','0','0','0','0','0','0','0','0','0','0','0','0'),
('20071','11','4304.34','2140.47','129.87','0','2007103','0','0','0','0','0','0','0','0','0','0','0'),
('20071','12','4304.81','2140.6','129.74','0','0','0','0','0','0','0','0','0','0','0','0','0');




DELETE FROM  `dbscripts_on_creature_movement` WHERE `id` IN (2007102, 2007103);
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `X`, `Y`, `z`, `o`, `comments`) VALUES
('2007103','3','22','1796','0','0','0','0','0','0','0','0','0','0','0','0','Wind Trader Marid - Faction change- Argo'),
('2007103','0','0','0','0','0','0','0','2000005833','0','0','0','0','0','0','0','Wind Trader Marid - Say 2'),
('2007103','0','32','1','0','0','0','0','0','0','0','0','0','0','0','0','Wind Trader Marid - Hold WP'),
('2007102','0','22','1731','0','0','0','0','0','0','0','0','0','0','0','0','Wind Trader Marid - Faction - Revert on spawn'),
('2007102','0','32','1','0','0','0','0','0','0','0','0','0','0','0','0','Wind Trader Marid - Hold WP');

DELETE FROM `dbscripts_on_gossip` WHERE `id` = 2007101;
INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('2007101','2','32','0','0','0','0','0','0','0','0','0','0','0','0','0',' - Wind Trader MaridActivate Wp'),
('2007101','1','0','0','0','0','0','0','2000005832','0','0','0','0','0','0','0','Wind Trader Marid - Say 1');


DELETE FROM `creature_ai_summons` WHERE id IN (27, 28);
INSERT INTO `creature_ai_summons` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `comment`) VALUES
('27','4326.47','2134.90','126.43','2.9599','1','20101'),
('28','4322.74','2149.48','124.22','3.572','1','20101');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (200711, 200712, 200713);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('200711','20071','4','0','100','0','0','0','0','0','32','20101','6','27','0','0','0','0','0','0','0','0','Force Summon Nether-Stalker'),
('200712','20071','4','0','100','0','0','0','0','0','32','20101','6','28','0','0','0','0','0','0','0','0',' Force Summon Nether-Stalker'),
('200713','20071','7','0','100','0','0','0','0','0','41','60000','0','0','0','0','0','0','0','0','0','0','Wind Trader Marid - Despawn on evade');

UPDATE `creature_template` SET `UnitFlags` = '0', `AIName` = 'EventAI' WHERE `entry` IN (20071);
UPDATE `creature_template` SET `UnitFlags` = '0', `FactionAlliance` = '1796', `FactionHorde` = '1796' WHERE `entry` IN (20101);


    

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

