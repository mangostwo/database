-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
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
    SET @cOldStructure = '10'; 
    SET @cOldContent = '127';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '128';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'the gossip update';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'the gossip update';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

SET @condition := (SELECT MAX(condition_entry) FROM `conditions`);
SET @gossipmenu := (SELECT MAX(entry) FROM `gossip_menu`); 

UPDATE `creature_template` SET `GossipMenuId` = 6036 WHERE `Entry` = 14729;
UPDATE `creature_template` SET `GossipMenuId` = 6035 WHERE `Entry` = 14726;
UPDATE `creature_template` SET `GossipMenuId` = 5741 WHERE `Entry` = 14374;
UPDATE `creature_template` SET `GossipMenuId` = 5108 WHERE `Entry` = 4613;
UPDATE `creature_template` SET `GossipMenuId` = 4578 WHERE `Entry` = 4578;
UPDATE `creature_template` SET `GossipMenuId` = 4693 WHERE `Entry` = 4205;
UPDATE `creature_template` SET `GossipMenuId` = 4546 WHERE `Entry` = 2131;
UPDATE `creature_template` SET `GossipMenuId` = 1017 WHERE `Entry` = 2998;
UPDATE `creature_template` SET `GossipMenuId` = 1914 WHERE `Entry` = 9299;
UPDATE `creature_template` SET `GossipMenuId` = 1922 WHERE `Entry` = 7879;
UPDATE `creature_template` SET `GossipMenuId` = 2189 WHERE `Entry` = 8659;
UPDATE `creature_template` SET `GossipMenuId` = 2501 WHERE `Entry` = 10136;
UPDATE `creature_template` SET `GossipMenuId` = 2748 WHERE `Entry` = 10278;
UPDATE `creature_template` SET `GossipMenuId` = 2941 WHERE `Entry` = 10781;
UPDATE `creature_template` SET `GossipMenuId` = 3662 WHERE `Entry` = 11835;
UPDATE `creature_template` SET `GossipMenuId` = 4016 WHERE `Entry` = 7954;
UPDATE `creature_template` SET `GossipMenuId` = 4121 WHERE `Entry` = 11044;
UPDATE `creature_template` SET `GossipMenuId` = 4132 WHERE `Entry` = 4611;
UPDATE `creature_template` SET `GossipMenuId` = 4144 WHERE `Entry` = 4586;
UPDATE `creature_template` SET `GossipMenuId` = 4147 WHERE `Entry` = 11029;
UPDATE `creature_template` SET `GossipMenuId` = 4149 WHERE `Entry` = 11031;
UPDATE `creature_template` SET `GossipMenuId` = 4150 WHERE `Entry` = 5174;
UPDATE `creature_template` SET `GossipMenuId` = 4157 WHERE `Entry` = 11067;
UPDATE `creature_template` SET `GossipMenuId` = 4160 WHERE `Entry` = 5157;
UPDATE `creature_template` SET `GossipMenuId` = 4166 WHERE `Entry` = 4616;
UPDATE `creature_template` SET `GossipMenuId` = 4188 WHERE `Entry` = 223;
UPDATE `creature_template` SET `GossipMenuId` = 4210 WHERE `Entry` = 4588;
UPDATE `creature_template` SET `GossipMenuId` = 4265 WHERE `Entry` = 2855;
UPDATE `creature_template` SET `GossipMenuId` = 4268 WHERE `Entry` = 11048;
UPDATE `creature_template` SET `GossipMenuId` = 4307 WHERE `Entry` = 2858;
UPDATE `creature_template` SET `GossipMenuId` = 4282 WHERE `Entry` = 4551;
UPDATE `creature_template` SET `GossipMenuId` = 4308 WHERE `Entry` = 12656;
UPDATE `creature_template` SET `GossipMenuId` = 4325 WHERE `Entry` = 8359;
UPDATE `creature_template` SET `GossipMenuId` = 4347 WHERE `Entry` = 3363;
UPDATE `creature_template` SET `GossipMenuId` = 4352 WHERE `Entry` = 11049;
UPDATE `creature_template` SET `GossipMenuId` = 4354 WHERE `Entry` = 4576;
UPDATE `creature_template` SET `GossipMenuId` = 4466 WHERE `Entry` = 376;
UPDATE `creature_template` SET `GossipMenuId` = 4467 WHERE `Entry` = 5489;
UPDATE `creature_template` SET `GossipMenuId` = 523 WHERE `Entry` = 3153;
UPDATE `creature_template` SET `GossipMenuId` = 4502 WHERE `Entry` = 918;
UPDATE `creature_template` SET `GossipMenuId` = 4550 WHERE `Entry` = 5116;
UPDATE `creature_template` SET `GossipMenuId` = 4566 WHERE `Entry` = 5173;
UPDATE `creature_template` SET `GossipMenuId` = 4569 WHERE `Entry` = 1801;
UPDATE `creature_template` SET `gossipmenuid` = 4570 WHERE `entry` = 5113;
UPDATE `creature_template` SET `GossipMenuId` = 4692 WHERE `Entry` = 3595;
UPDATE `creature_template` SET `GossipMenuId` = 4574 WHERE `Entry` = 4090;
UPDATE `creature_template` SET `GossipMenuId` = 4573 WHERE `Entry` = 4091;
UPDATE `creature_template` SET `GossipMenuId` = 4572 WHERE `Entry` = 4092;
UPDATE `creature_template` SET `GossipMenuId` = 4679 WHERE `Entry` = 837;
UPDATE `creature_template` SET `GossipMenuId` = 4558 WHERE `Entry` = 5142;
UPDATE `creature_template` SET `GossipMenuId` = 4560 WHERE `Entry` = 5143;
UPDATE `creature_template` SET `GossipMenuId` = 3642 WHERE `Entry` = 11406;
UPDATE `creature_template` SET `GossipMenuId` = 6563 WHERE `Entry` = 15177;
UPDATE `creature_template` SET `GossipMenuId` = 6645 WHERE `Entry` = 15503;
UPDATE `creature_template` SET `GossipMenuId` = 6655 WHERE `Entry` = 15504;
UPDATE `creature_template` SET `GossipMenuId` = 7243 WHERE `Entry` = 16442;
UPDATE `creature_template` SET `GossipMenuId` = 7346 WHERE `Entry` = 17056;


UPDATE `gossip_menu` SET `entry` = @gossipmenu+1 , `condition_id` = 0 WHERE `entry` = 1802 AND `text_id` = 2434 AND `script_id` = 0;
UPDATE `gossip_menu` SET `text_id` = 559 WHERE `entry` = 4685 AND `text_id` = 560 AND `script_id` = 0;
UPDATE `gossip_menu` SET `condition_id` = 0 WHERE `entry` = 1403 AND `text_id` = 2037 AND `script_id` = 0;
UPDATE `gossip_menu` SET `condition_id` = 0 WHERE `entry` = 3921 AND `text_id` = 4774 AND `script_id` = 0;
UPDATE `gossip_menu` SET `entry` = 6186 WHERE `entry` = 6189 AND `text_id` = 7393 AND `script_id` = 0;

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(@condition+1,-2,102,93),
(@condition+2,9,9067,0);

UPDATE `gossip_menu` SET `entry` = 6341, `condition_id` = @condition+1 WHERE `entry` = 6441 AND `text_id` = 7634 AND `script_id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 4091 AND `text_id` = 4991;
DELETE FROM `gossip_menu` WHERE `entry` in(7243,5710,4696,3642,4558,4560,4679,4680,3643,4572,4573,4574,4691,4692,4016,161,656,1582,1801,2352,4013,4686,4689,5711,5712,5713,6442,4566);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) values 
(7243,8549,0),
(7243,8550,@condition+2),
(3642,4436,77),
(3642,4437,0),
(4558,4436,77),
(4558,4437,0),
(4560,4436,77),
(4560,4437,0),
(4679,4435,0),
(4679,4436,77),
(4680,4435,0),
(4680,4436,77),
(3643,4437,77),
(3643,4438,0),
(4572,4437,77),
(4572,4438,0),
(4573,4437,77),
(4573,4438,0),
(4574,4437,77),
(4574,4438,0),
(4691,4437,77),
(4691,4438,0),
(4692,4437,77),
(4692,4438,0),
(2189,2823,0),
(@gossipmenu+2,12646,0),
(4566,2193,103),
(4466,4433,77),
(4467,4433,77),
(4016, 4878,0);


DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (5710,4558,4560,4679,4558,4560,4679,4558,4560,4679,4572,4573,4574,4692,1802,656,1582,2352,1017,4016,5711,5712,5713);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
(4679,0,3,'I seek more training in the priestly ways.',5,16,0,0,0,0,0,'',0),
(4679,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4679,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',648),
(4560,0,3,'I seek more training in the priestly ways.',5,16,0,0,0,0,0,'',0),
(4560,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4560,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',648),
(4558,0,3,'I seek more training in the priestly ways.',5,16,0,0,0,0,0,'',0),
(4558,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4558,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',648),
(4572,0,3,'I would like to train further in the ways of the Light.',5,16,0,0,0,0,0,'',0),
(4572,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4572,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',648),
(4573,0,3,'I would like to train further in the ways of the Light.',5,16,0,0,0,0,0,'',0),
(4573,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4573,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',648),
(4574,0,3,'I would like to train further in the ways of the Light.',5,16,0,0,0,0,0,'',0),
(4574,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4574,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',648),
(4692,0,3,'I would like to train further in the ways of the Light.',5,16,0,0,0,0,0,'',0),
(4692,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4692,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',648),
(1802,0,0,'Can you tell me how I can get a Videre Elixir?',1,128,@gossipmenu+1,0,0,0,0,'',157),
(1802,1,1,'Buy somethin\', will ya?',3,128,0,0,0,0,0,'',0),
(@gossipmenu+1,0,0,'How can I get Evoroot?', 1, 128,1915,0,0,0,0,'',0),
(1017,0,0,'Train me.', 5, 16,0,0,0,0,0,'',0),
(2189,0,0,'Where is Un\'Goro Crater?',1,3,2823,0,0,0,0,'',0),
(4016,0,3,'I seek training to ride a steed.',5,16,0,0,0,0,0,'',0);

UPDATE `gossip_menu_option` SET `action_menu_id` = 5716 WHERE `menu_id` = 5667 AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 566 WHERE `menu_id` = 3642 AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 648 WHERE `menu_id` = 3642 AND `id` = 2;
UPDATE `gossip_menu_option` SET `condition_id` = 0 WHERE `menu_id` = 4554 AND `id` = 0;
UPDATE `gossip_menu_option` SET `action_menu_id` = 6585 WHERE `menu_id` = 6586;

UPDATE `npc_text` SET `text0_0` = 'In the Light we all cast shadows, my $g brother : sister;.  Do you seek further guidance today?', `text0_1` = '' WHERE `ID` = 8591;
UPDATE `npc_text` SET `text0_1` = '' WHERE `ID` = 8592;

DELETE FROM `npc_text` WHERE `ID` IN (5740,12549);

   

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
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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


