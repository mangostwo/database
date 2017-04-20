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
    SET @cOldContent = '028';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '029';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Class_trainers';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Class_trainers_Gossip_Update';

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

-- Warrior Trainers

-- Llane Beshere c.911
DELETE FROM npc_gossip WHERE npc_guid = 79964;
DELETE FROM gossip_menu WHERE entry = 4650;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4650, 5721, 0, 0), -- all 
(4650, 1216, 0, 74); -- warrior only

-- Thran Khorman c.912
DELETE FROM npc_gossip WHERE npc_guid = 406;
DELETE FROM gossip_menu WHERE entry = 4684;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4684, 5724, 0, 0), -- all 
(4684, 1215, 0, 74); -- warrior only

-- Lyria Du Lac   c.913
-- Ander Germaine c.914
DELETE FROM npc_gossip WHERE npc_guid = 80333;
UPDATE creature_template SET GossipMenuId = 4649 WHERE entry = 913;
DELETE FROM gossip_menu WHERE entry = 4649;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4649, 5721, 0, 0), -- all 
(4649, 1216, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4649 AND ID = 2;            
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4649','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','633');

-- Malosh c.985
DELETE FROM npc_gossip WHERE npc_guid = 34156;
UPDATE creature_template SET GossipMenuId = 523 WHERE entry = 985;
DELETE FROM gossip_menu WHERE entry = 523;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(523, 4985, 0, 0), -- all 
(523, 1040, 0, 74); -- warrior only

-- Granis Swiftaxe c.1229
DELETE FROM npc_gossip WHERE npc_guid = 196;
DELETE FROM gossip_menu WHERE entry = 4683;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4683, 5724, 0, 0), -- all 
(4683, 1215, 0, 74); -- warrior only

-- Mogwah c.1403
-- not in game

-- Kelstrum Stonebreaker c.1901
DELETE FROM npc_gossip WHERE npc_guid = 83;
DELETE FROM gossip_menu WHERE entry = 4569;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4569, 5724, 0, 0), -- all 
(4569, 1215, 0, 74); -- warrior only

-- Dannal Stern c.2119
DELETE FROM npc_gossip WHERE npc_guid = 28464;
UPDATE creature_template SET GossipMenuId = 4653 WHERE entry = 2119;
DELETE FROM gossip_menu WHERE entry = 4653;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4653, 4984, 0, 0), -- all 
(4653, 1219, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4653;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4653,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4653,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4653,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Austil de Mon c.2131
DELETE FROM npc_gossip WHERE npc_guid = 33720;
UPDATE creature_template SET GossipMenuId = 656 WHERE entry = 2131;
DELETE FROM gossip_menu WHERE entry = 656;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(656, 4984, 0, 0), -- all 
(656, 1219, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 656;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(656,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(656,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(656,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Torm Ragetotem c.3041
DELETE FROM npc_gossip WHERE npc_guid = 26759;
DELETE FROM gossip_menu WHERE entry = 4526;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4526, 4973, 0, 0), -- all 
(4526, 1218, 0, 74); -- warrior only

-- Sark Ragetotem c.3042
DELETE FROM npc_gossip WHERE npc_guid = 26768;
DELETE FROM gossip_menu WHERE entry = 4525;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4525, 4973, 0, 0), -- all 
(4525, 1218, 0, 74); -- warrior only

-- Ker Ragetotem c.3043
DELETE FROM npc_gossip WHERE npc_guid = 26770;
DELETE FROM gossip_menu WHERE entry = 4527;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4527, 4973, 0, 0), -- all 
(4527, 1218, 0, 74); -- warrior only

-- Harutt Thunderhorn c.3059
DELETE FROM npc_gossip WHERE npc_guid = 26897;
DELETE FROM gossip_menu WHERE entry = 4645;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4645, 4973, 0, 0), -- all 
(4645, 1218, 0, 74); -- warrior only

-- Krang Stonehoof c.3063
DELETE FROM npc_gossip WHERE npc_guid = 26902;
DELETE FROM gossip_menu WHERE entry = 655;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(655, 4973, 0, 0), -- all 
(655, 1218, 0, 74); -- warrior only

-- Frang c.3153
-- Tarshaw Jaggedscar c.3169
DELETE FROM npc_gossip WHERE npc_guid IN (7291,7651);
UPDATE creature_template SET GossipMenuId = 523 WHERE entry IN (2131,3169);
DELETE FROM gossip_menu WHERE entry = 523;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(523, 4985, 0, 0), -- all 
(523, 1040, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 523;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(523,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(523,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(523,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Grezz Ragefist c.3353
DELETE FROM npc_gossip WHERE npc_guid = 7971;
UPDATE creature_template SET GossipMenuId = 4509 WHERE entry = 3353;
DELETE FROM gossip_menu WHERE entry = 4509;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4509, 4985, 0, 0), -- all 
(4509, 1040, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4509;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4509,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4509,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4509,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Sorek c.3354
DELETE FROM npc_gossip WHERE npc_guid = 7443;
UPDATE creature_template SET GossipMenuId = 4511 WHERE entry = 3354;
DELETE FROM gossip_menu WHERE entry = 4511;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4511, 4985, 0, 0), -- all 
(4511, 1040, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4511;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4511,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4511,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4511,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Zel'mak c.3408
DELETE FROM npc_gossip WHERE npc_guid = 6610;
UPDATE creature_template SET GossipMenuId = 4510 WHERE entry = 3408;
DELETE FROM gossip_menu WHERE entry = 4510;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4510, 4986, 0, 0), -- all 
(4510, 4987, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4510;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4510,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4510,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4510,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Alyissia c.3593
DELETE FROM npc_gossip WHERE npc_guid = 46178;
UPDATE creature_template SET GossipMenuId = 4697 WHERE entry = 3593;
DELETE FROM gossip_menu WHERE entry = 4697;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4697, 5725, 0, 0), -- all 
(4697, 1217, 0, 74); -- warrior only

-- Kyra Windblade c.3598
-- Arias'ta Bladesinger c.4087
-- Darnath Bladesinger c.7315
DELETE FROM npc_gossip WHERE npc_guid IN (46184,46809,49851);
UPDATE creature_template SET GossipMenuId = 4697 WHERE entry IN (3598,4087,7315);

-- Sildanair c.4089
UPDATE creature_template SET GossipMenuId = 4578 WHERE entry = 4089;
DELETE FROM gossip_menu WHERE entry = 4578;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4578, 5725, 0, 0), -- all 
(4578, 1217, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4578;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4578,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4578,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4578,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Christoph Walker c.4593
DELETE FROM npc_gossip WHERE npc_guid = 31897;
UPDATE creature_template SET GossipMenuId = 4548 WHERE entry = 4593;
DELETE FROM gossip_menu WHERE entry = 4548;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4548, 4984, 0, 0), -- all 
(4548, 1219, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4548;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4548,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4548,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4548,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Angela Curthas c.4594
DELETE FROM npc_gossip WHERE npc_guid = 41841;
UPDATE creature_template SET GossipMenuId = 4546 WHERE entry = 4594;
DELETE FROM gossip_menu WHERE entry = 4546;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4546, 4984, 0, 0), -- all 
(4546, 1219, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4546;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4546,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4546,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4546,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Baltus Fowler c.4595
DELETE FROM npc_gossip WHERE npc_guid = 38128;
UPDATE creature_template SET GossipMenuId = 4547 WHERE entry = 4595;
DELETE FROM gossip_menu WHERE entry = 4547;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4547, 4984, 0, 0), -- all 
(4547, 1219, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4547;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4547,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4547,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4547,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- World Warrior Trainer c.4992
-- not in game

-- Kelv Sternhammer c.5113
DELETE FROM npc_gossip WHERE npc_guid = 2019;
UPDATE creature_template SET GossipMenuId = 4570 WHERE entry = 5113;
DELETE FROM gossip_menu WHERE entry = 4570;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4570, 5724, 0, 0), -- all 
(4570, 1217, 0, 74); -- warrior only
DELETE FROM gossip_menu_option WHERE menu_id = 4570;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4570,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4570,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4570,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Bilban Tosslespanner c.5114
DELETE FROM npc_gossip WHERE npc_guid = 84;
UPDATE creature_template SET GossipMenuId = 4568 WHERE entry = 5113;
DELETE FROM gossip_menu WHERE entry = 4568;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4568, 4988, 0, 0), -- all 
(4568, 4989, 0, 74); -- warrior only

-- Wu Shen c.5479
DELETE FROM npc_gossip WHERE npc_guid = 79779;
UPDATE creature_template SET GossipMenuId = 4482 WHERE entry = 5113;
DELETE FROM gossip_menu WHERE entry = 4482;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4482, 5721, 0, 0), -- all 
(4482, 1216, 0, 74); -- warrior only

-- Ilsa Corbin c.4649
DELETE FROM npc_gossip WHERE npc_guid = 79778;
UPDATE creature_template SET GossipMenuId = 4649 WHERE entry = 5113;

-- World Dwarf Male Warrior Trainer c.5959
-- World Night Elf Male Warrior Trainer c.5966
-- World Dwarf Female Warrior Trainer c.5967
-- all not in game

-- Captain Evencane c.8141
DELETE FROM npc_gossip WHERE npc_guid = 30650;
UPDATE creature_template SET GossipMenuId = 4091 WHERE entry = 8141;
DELETE FROM gossip_menu WHERE entry = 4091;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4091, 4991, 0, 0), 
(4091, 4992, 0, 74),
(4091, 4993, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4091;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(4091,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4091,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4091,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',633);

-- Krysteea c.10291
-- not in game

-- Kore c.16503
DELETE FROM npc_gossip WHERE npc_guid = 84574;
UPDATE creature_template SET GossipMenuId = 7263 WHERE entry = 16503;
DELETE FROM gossip_menu WHERE entry = 7263;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7263, 8588, 0, 0), -- all 
(7263, 8587, 0, 74); -- warrior only

-- Ahonan c.16771
DELETE FROM npc_gossip WHERE npc_guid = 85590;
UPDATE creature_template SET GossipMenuId = 7263 WHERE entry = 16503;

-- Behomat c.17120
DELETE FROM npc_gossip WHERE npc_guid = 85589;
UPDATE creature_template SET GossipMenuId = 7263 WHERE entry = 17120;

-- Ruada c.17480
DELETE FROM npc_gossip WHERE npc_guid = 62994;
UPDATE creature_template SET GossipMenuId = 7263 WHERE entry = 17480;

-- Kazi c.17504
DELETE FROM npc_gossip WHERE npc_guid = 63005;
UPDATE creature_template SET GossipMenuId = 7263 WHERE entry = 17504;

-- Paladin Trainers

-- Brother Sammuel c.925
DELETE FROM npc_gossip WHERE npc_guid = 79967;
DELETE FROM gossip_menu WHERE entry = 4663;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4663, 3976, 0, 0),
(4663, 3977, 0, 0);

-- Bromos Grummner c.926
DELETE FROM npc_gossip WHERE npc_guid = 403;
DELETE FROM gossip_menu WHERE entry = 4678;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4678, 3974, 0, 92), -- Paladin 
(4678, 3975, 0, 0);

-- Brother Wilhelm c.927
DELETE FROM npc_gossip WHERE npc_guid = 80325;
DELETE FROM gossip_menu WHERE entry = 4664;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4664, 3976, 0, 0),
(4664, 3977, 0, 0);

-- Lord Grayson Shadowbreaker c.928
DELETE FROM npc_gossip WHERE npc_guid = 5000;
DELETE FROM gossip_menu WHERE entry = 4471;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4471, 3976, 0, 0),
(4471, 3977, 0, 0);

-- Azar Stronghammer c.1232
DELETE FROM npc_gossip WHERE npc_guid = 194;
DELETE FROM gossip_menu WHERE entry = 4677;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4677, 3974, 0, 92), -- Paladin 
(4677, 3975, 0, 0);

-- World Paladin Trainer c.4988
-- not in game

-- Valgar Highforge c.5147
DELETE FROM npc_gossip WHERE npc_guid = 1778;
DELETE FROM gossip_menu WHERE entry = 4557;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4557, 3974, 0, 92), -- Paladin 
(4557, 3975, 0, 0);

-- Beldruk Doombrow c.5148
DELETE FROM npc_gossip WHERE npc_guid = 1769;
DELETE FROM gossip_menu WHERE entry = 4556;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4556, 3974, 0, 92), -- Paladin 
(4556, 3975, 0, 0);

-- Brandur Ironhammer c.5149
DELETE FROM npc_gossip WHERE npc_guid = 1781;
DELETE FROM gossip_menu WHERE entry = 2304;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(2304, 3974, 0, 92), -- Paladin 
(2304, 3975, 0, 0);

-- Arthur the Faithful c.5491
DELETE FROM npc_gossip WHERE npc_guid = 37585;
DELETE FROM gossip_menu WHERE entry = 4469;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4469, 3976, 0, 0),
(4469, 3977, 0, 0);

-- Katherine the Pure c.5492
DELETE FROM npc_gossip WHERE npc_guid = 37586;
DELETE FROM gossip_menu WHERE entry = 4470;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4470, 3976, 0, 0),
(4470, 3977, 0, 0);

-- Brother Karman c.8140
DELETE FROM npc_gossip WHERE npc_guid = 30655;
DELETE FROM gossip_menu WHERE entry = 4662;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4662, 3976, 0, 0),
(4662, 3977, 0, 0);

-- Jesthenis Sunstriker c.15280
DELETE FROM npc_gossip WHERE npc_guid = 54985;
DELETE FROM gossip_menu WHERE entry = 6647;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6647, 7904, 0, 92),  -- Paladin
(6647, 9193, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 6647;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('6647','0','3','I would like to train further in the ways of the Light.','5','16','0','0','0','0','0','','0'),
('6647','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','541'),
('6647','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','645');

-- Noellene c.16275
DELETE FROM npc_gossip WHERE npc_guid = 56983;

-- Aurelon c.16501
DELETE FROM npc_gossip WHERE npc_guid = 57212;
UPDATE creature_template SET GossipMenuId = 7260 WHERE entry = 16501;
DELETE FROM gossip_menu WHERE entry = 7260;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7260, 8582, 0, 92),  -- Paladin
(7260, 8584, 0, 0);

-- Osselan c.16679
DELETE FROM npc_gossip WHERE npc_guid = 57669;

-- Ithelis c.16680
DELETE FROM npc_gossip WHERE npc_guid = 57670;

-- Champion Bachi c.16681
DELETE FROM npc_gossip WHERE npc_guid = 57671;

-- Master Pyreanor c.23128
DELETE FROM npc_gossip WHERE npc_guid = 6503;

-- Baatun c.16761
DELETE FROM npc_gossip WHERE npc_guid = 57748;
UPDATE creature_template SET GossipMenuId = 7260 WHERE entry = 16761;

-- Kavaan c.17121
DELETE FROM npc_gossip WHERE npc_guid = 59520;
UPDATE creature_template SET GossipMenuId = 7260 WHERE entry = 17121;

-- Tullas c.17483
DELETE FROM npc_gossip WHERE npc_guid = 84577;
UPDATE creature_template SET GossipMenuId = 7260 WHERE entry = 17483;

-- Jol c.17509
DELETE FROM npc_gossip WHERE npc_guid = 63007;
UPDATE creature_template SET GossipMenuId = 7260 WHERE entry = 17509;

-- Champion Cyssa Dawnrose c.20406
DELETE FROM npc_gossip WHERE npc_guid = 32066;
UPDATE creature_template SET GossipMenuId = 8111 WHERE entry = 20406;
DELETE FROM gossip_menu WHERE entry = 8111;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(8111, 10040, 0, 92),  -- Paladin
(8111, 10041, 0, 0);

-- Rukua c.35281
DELETE FROM npc_gossip WHERE npc_guid = 49817;
UPDATE creature_template SET GossipMenuId = 7260 WHERE entry = 35281;

-- Hunter Trainers

-- Thorgas Grimson c.895
DELETE FROM npc_gossip WHERE npc_guid = 407;
UPDATE creature_template SET GossipMenuId = 4675 WHERE entry = 895;
DELETE FROM gossip_menu WHERE entry = 4675;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4675, 5000, 0, 0),     
(4675, 4999, 0, 82); -- hunter

-- [UNUSED] Brannon Aybara (TEMP) c.897
-- not in game

-- Ogromm c.987
DELETE FROM npc_gossip WHERE npc_guid = 31949;
UPDATE creature_template SET GossipMenuId = 4101 WHERE entry = 987;
DELETE FROM gossip_menu WHERE entry = 4101;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4101, 5001, 0, 82), -- hunter    
(4101, 5002, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4101;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4101','0','3','I seek training in the ways of the Hunter.','5','16','0','0','0','0','0','','0'),
('4101','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4101','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Grif Wildheart c.1231
DELETE FROM npc_gossip WHERE npc_guid = 222;
UPDATE creature_template SET GossipMenuId = 4007 WHERE entry = 1231;
DELETE FROM gossip_menu WHERE entry = 4007;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4007, 4999, 0, 82), -- hunter  
(4007, 5000, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4007;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4007','0','3','I seek training in the ways of the Hunter.','5','16','0','0','0','0','0','','0'),
('4007','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4007','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Kragg c.1404
DELETE FROM npc_gossip WHERE npc_guid = 364;
UPDATE creature_template SET GossipMenuId = 4657 WHERE entry = 1404;
DELETE FROM gossip_menu WHERE entry = 4657;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4657, 5001, 0, 82), -- hunter    
(4657, 5002, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4657;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4657','0','3','I seek training in the ways of the Hunter.','5','16','0','0','0','0','0','','0'),
('4657','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4657','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Undead Hunter Trainer c.2218
-- not in game

-- Kary Thunderhorn c.3038
DELETE FROM npc_gossip WHERE npc_guid = 26755;
UPDATE creature_template SET GossipMenuId = 4011 WHERE entry = 3038;
DELETE FROM gossip_menu WHERE entry = 4011;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4011, 4867, 0, 82), -- hunter    
(4011, 4998, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4011;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4011','0','3','I seek training in the ways of the Hunter.','5','16','0','0','0','0','0','','0'),
('4011','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4011','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Holt Thunderhorn c.3039
DELETE FROM npc_gossip WHERE npc_guid = 26756;
UPDATE creature_template SET GossipMenuId = 4023 WHERE entry = 3039;
DELETE FROM gossip_menu WHERE entry = 4023;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4023, 4868, 0, 82), -- hunter    
(4023, 4996, 0, 0);

-- Urek Thunderhorn c.3040
DELETE FROM npc_gossip WHERE npc_guid = 26758;
UPDATE creature_template SET GossipMenuId = 4524 WHERE entry = 3040;
DELETE FROM gossip_menu WHERE entry = 4524;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4524, 4997, 0, 82), -- hunter    
(4524, 4998, 0, 0);

-- Lanka Farshot c.3061
DELETE FROM npc_gossip WHERE npc_guid = 26899;
UPDATE creature_template SET GossipMenuId = 4647 WHERE entry = 3061;
DELETE FROM gossip_menu WHERE entry = 4647;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4647, 4997, 0, 82), -- hunter    
(4647, 4998, 0, 0);

-- Yaw Sharpmane c.3065
DELETE FROM npc_gossip WHERE npc_guid = 26905;
UPDATE creature_template SET GossipMenuId = 4012 WHERE entry = 3065;
DELETE FROM gossip_menu WHERE entry = 4012;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4012, 4868, 0, 82), -- hunter    
(4012, 4998, 0, 0);

-- Jen'shan c.3154
DELETE FROM npc_gossip WHERE npc_guid = 7649;
UPDATE creature_template SET GossipMenuId = 4648 WHERE entry = 3154;
DELETE FROM gossip_menu WHERE entry = 4648;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4648, 4987, 0, 82), -- hunter    
(4648, 5004, 0, 0);

-- Thotar c.3171
DELETE FROM npc_gossip WHERE npc_guid = 7293;
UPDATE creature_template SET GossipMenuId = 4017 WHERE entry = 3171;
DELETE FROM gossip_menu WHERE entry = 4017;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4017, 4888, 0, 82), -- hunter    
(4017, 4998, 0, 0);

-- Ormak Grimshot c.3352
DELETE FROM npc_gossip WHERE npc_guid = 7449;
UPDATE creature_template SET GossipMenuId = 4010 WHERE entry = 3352;
DELETE FROM gossip_menu WHERE entry = 4010;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4010, 4866, 0, 82), -- hunter    
(4010, 5003, 0, 0);

-- Xor'juul c.3406
DELETE FROM npc_gossip WHERE npc_guid = 7972;
UPDATE creature_template SET GossipMenuId = 4506 WHERE entry = 3406;
DELETE FROM gossip_menu WHERE entry = 4506;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4506, 4987, 0, 82), -- hunter    
(4506, 5004, 0, 0);

-- Sian'dur c.3407
DELETE FROM npc_gossip WHERE npc_guid = 6620;
UPDATE creature_template SET GossipMenuId = 4506 WHERE entry = 3406;

-- Ayanna Everstride c.3596
DELETE FROM npc_gossip WHERE npc_guid = 46182;
UPDATE creature_template SET GossipMenuId = 4695 WHERE entry = 3596;
DELETE FROM gossip_menu WHERE entry = 4695;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4695, 4863, 0, 82), -- hunter    
(4695, 4993, 0, 0);

-- Dazalar c.3601
DELETE FROM npc_gossip WHERE npc_guid = 46188;
UPDATE creature_template SET GossipMenuId = 4009 WHERE entry = 3601;
DELETE FROM gossip_menu WHERE entry = 4009;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4009, 4316, 0, 82), -- hunter    
(4009, 4993, 0, 0);

-- Danlaar Nightstride c.3963
DELETE FROM npc_gossip WHERE npc_guid = 32703;
UPDATE creature_template SET GossipMenuId = 4092 WHERE entry = 3963;
DELETE FROM gossip_menu WHERE entry = 4092;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4092, 4867, 0, 82), -- hunter    
(4092, 4993, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4092;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4092','0','3','I seek training in the ways of the Hunter.','5','16','0','0','0','0','0','','0'),
('4092','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4092','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Jeen'ra Nightrunner c.4138
DELETE FROM npc_gossip WHERE npc_guid = 46217;
UPDATE creature_template SET GossipMenuId = 4621 WHERE entry = 4138;
DELETE FROM gossip_menu WHERE entry = 4621;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4621, 4994, 0, 82), -- hunter    
(4621, 4993, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4621;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4621','0','3','I\'d like to train.','5','16','0','0','0','0','0','','0'),
('4621','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4621','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Jocaste c.4146
DELETE FROM npc_gossip WHERE npc_guid = 46221;
UPDATE creature_template SET GossipMenuId = 4008 WHERE entry = 4146;

-- Dorion c.4205
DELETE FROM npc_gossip WHERE npc_guid = 46415;
UPDATE creature_template SET GossipMenuId = 4693 WHERE entry = 4205;
DELETE FROM gossip_menu WHERE entry = 4693;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4693, 6160, 0, 82), -- hunter    
(4693, 4993, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4693;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4693','0','3','I\'d like to train.','5','16','0','0','0','0','0','','0'),
('4693','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4693','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- World Hunter Trainer c.4986
-- not in game

-- Daera Brightspear c.5115
DELETE FROM npc_gossip WHERE npc_guid = 2020;
UPDATE creature_template SET GossipMenuId = 4549 WHERE entry = 4205;
DELETE FROM gossip_menu WHERE entry = 4549;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4549, 4999, 0, 82), -- hunter    
(4549, 5000, 0, 0);

-- Olmin Burningbeard c.5116
DELETE FROM npc_gossip WHERE npc_guid = 87;
UPDATE creature_template SET GossipMenuId = 4550 WHERE entry = 5116;
DELETE FROM gossip_menu WHERE entry = 4550;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4550, 4890, 0, 82), -- hunter    
(4550, 5000, 0, 0);

-- Regnus Thundergranite c.5117
DELETE FROM npc_gossip WHERE npc_guid = 82;
UPDATE creature_template SET GossipMenuId = 4551 WHERE entry = 5116;
DELETE FROM gossip_menu WHERE entry = 4551;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4551, 4999, 0, 82), -- hunter    
(4551, 5000, 0, 0);

-- Kaerbrus c.5501
DELETE FROM npc_gossip WHERE npc_guid = 39666;
UPDATE creature_template SET GossipMenuId = 4694 WHERE entry = 5501;
DELETE FROM gossip_menu WHERE entry = 4694;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4694, 6160, 0, 82), -- hunter    
(4694, 4993, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4694;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4694','0','3','I\'d like to train.','5','16','0','0','0','0','0','','0'),
('4694','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4694','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Einris Brightspear c.5515
DELETE FROM npc_gossip WHERE npc_guid = 37608;
UPDATE creature_template SET GossipMenuId = 4474 WHERE entry = 5515;
DELETE FROM gossip_menu WHERE entry = 4474;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4474, 4893, 0, 82), -- hunter    
(4474, 5000, 0, 0);

-- Ulfir Ironbeard c.5516
DELETE FROM npc_gossip WHERE npc_guid = 37609;
UPDATE creature_template SET GossipMenuId = 4473 WHERE entry = 5516;
DELETE FROM gossip_menu WHERE entry = 4473;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4473, 4893, 0, 82), -- hunter    
(4473, 5000, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4473;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4473','0','3','I\'d like to train.','5','16','0','0','0','0','0','','0'),
('4473','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4473','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Thorfin Stoneshield c.5517
DELETE FROM npc_gossip WHERE npc_guid = 37609;
UPDATE creature_template SET GossipMenuId = 4472 WHERE entry = 5517;
DELETE FROM gossip_menu WHERE entry = 4472;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4472, 4893, 0, 82), -- hunter    
(4472, 5000, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4472;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4472','0','3','I\'d like to train.','5','16','0','0','0','0','0','','0'),
('4472','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4472','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Alenndaar Lapidaar c.8308
DELETE FROM npc_gossip WHERE npc_guid = 32678;
UPDATE creature_template SET GossipMenuId = 4092 WHERE entry = 8308;
DELETE FROM gossip_menu WHERE entry = 4092;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4092, 4867, 0, 82), -- hunter    
(4092, 4993, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4092;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4092','0','3','I\'d like to train.','5','16','0','0','0','0','0','','0'),
('4092','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4092','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Dargh Trueaim c.10930
DELETE FROM npc_gossip WHERE npc_guid = 8277;
UPDATE creature_template SET GossipMenuId = 4674 WHERE entry = 10930;
DELETE FROM gossip_menu WHERE entry = 4674;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4674, 4999, 0, 82), -- hunter    
(4674, 5000, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4674;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4674','0','3','I seek training in the ways of the Hunter.','5','16','0','0','0','0','0','','0'),
('4674','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','542'),
('4674','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','646');

-- Ranger Sallina c.15513
DELETE FROM npc_gossip WHERE npc_guid = 55431;
UPDATE creature_template SET GossipMenuId = 6652 WHERE entry = 15513;

-- Hannovia c.16270
DELETE FROM npc_gossip WHERE npc_guid = 56979;
UPDATE creature_template SET GossipMenuId = 6652 WHERE entry = 16270;

-- Keilnei c.16499
DELETE FROM npc_gossip WHERE npc_guid = 84585;
UPDATE creature_template SET GossipMenuId = 7262 WHERE entry = 16499;
DELETE FROM gossip_menu WHERE entry = 7262;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7262, 8585, 0, 82), -- hunter    
(7262, 8586, 0, 0);

-- Tana c.16672
DELETE FROM npc_gossip WHERE npc_guid = 87662;
UPDATE creature_template SET GossipMenuId = 6652 WHERE entry = 16672;

-- Oninath c.16673
DELETE FROM npc_gossip WHERE npc_guid = 57663;
UPDATE creature_template SET GossipMenuId = 6652 WHERE entry = 16673;

-- Zandine c.16674
DELETE FROM npc_gossip WHERE npc_guid = 57664;
UPDATE creature_template SET GossipMenuId = 6652 WHERE entry = 16674;

-- Deremiis c.16738
DELETE FROM npc_gossip WHERE npc_guid = 57737;
UPDATE creature_template SET GossipMenuId = 7262 WHERE entry = 16738;

-- Acteon c.17110
-- redone in prev paths.

-- Vord c.17122
DELETE FROM npc_gossip WHERE npc_guid = 59521; 
UPDATE creature_template SET GossipMenuId = 7262 WHERE entry = 17122;

-- Killac c.17505
DELETE FROM npc_gossip WHERE npc_guid = 63006;
UPDATE creature_template SET GossipMenuId = 7262 WHERE entry = 17505;

-- Mage Trainers

-- Khelden Bremen c.198
DELETE FROM npc_gossip WHERE npc_guid = 79962;
UPDATE creature_template SET GossipMenuId = 4660 WHERE entry = 198;

-- Zaldimar Wefhellt c.328
DELETE FROM npc_gossip WHERE npc_guid = 80344;
UPDATE creature_template SET GossipMenuId = 4661 WHERE entry = 328;

-- Marryk Nurribit c.944
-- Bink c.5144
-- Nittlebur Sparkfizzle c.5146
DELETE FROM npc_gossip WHERE npc_guid IN (1025,1773,1782);
UPDATE creature_template SET GossipMenuId = 4552 WHERE entry IN (944,5144,5146);
DELETE FROM gossip_menu WHERE entry = 4552;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4552, 560, 0, 79), -- Mage 
(4552, 561, 0, 0);

-- Magis Sparkmantle c.1228
DELETE FROM npc_gossip WHERE npc_guid = 192;
UPDATE creature_template SET GossipMenuId = 4685 WHERE entry = 1228;
DELETE FROM gossip_menu WHERE entry = 4685;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4685, 560, 0, 79), -- Mage 
(4685, 561, 0, 0);

-- Isabella c.2124
DELETE FROM npc_gossip WHERE npc_guid = 28463;
UPDATE creature_template SET GossipMenuId = 4654 WHERE entry = 2124;
DELETE FROM gossip_menu WHERE entry = 4654;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4654, 562, 0, 79), -- Mage 
(4654, 563, 0, 0);

-- Cain Firesong c.2128
-- Derek the Undying c.23103
DELETE FROM npc_gossip WHERE npc_guid IN (28476,41829);
UPDATE creature_template SET GossipMenuId = 63 WHERE entry IN (2128,23103);
UPDATE creature_template SET NpcFlags = 49 WHERE entry = 23103; -- gossip
DELETE FROM gossip_menu WHERE entry = 63;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(63, 562, 0, 79), -- Mage 
(63, 563, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 63;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('63','0','3','I am interested in mage training.','5','16','0','0','0','0','0','','0'),
('63','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','523'),
('63','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','643');

-- Archmage Shymm c.3047
DELETE FROM npc_gossip WHERE npc_guid = 26774;
UPDATE creature_template SET GossipMenuId = 4534 WHERE entry = 3047;
DELETE FROM gossip_menu WHERE entry = 4534;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4534, 562, 0, 79), -- Mage 
(4534, 563, 0, 0);

-- Ursyn Ghull c.3048
DELETE FROM npc_gossip WHERE npc_guid = 26775;
UPDATE creature_template SET GossipMenuId = 4536 WHERE entry = 3048;
DELETE FROM gossip_menu WHERE entry = 4536;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4536, 562, 0, 79), -- Mage 
(4536, 563, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4536;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4536','0','3','I am interested in mage training.','5','16','0','0','0','0','0','','0'),
('4536','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','523'),
('4536','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','643');

-- Thurston Xane c.3049
DELETE FROM npc_gossip WHERE npc_guid = 26776;
UPDATE creature_template SET GossipMenuId = 4535 WHERE entry = 3049;
DELETE FROM gossip_menu WHERE entry = 4535;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4535, 562, 0, 79), -- Mage 
(4535, 563, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4535;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4535','0','3','I am interested in mage training.','5','16','0','0','0','0','0','','0'),
('4535','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','523'),
('4535','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','643');

-- Kaelystia Hatebringer c.4566
DELETE FROM npc_gossip WHERE npc_guid = 31869;
UPDATE creature_template SET GossipMenuId = 4539 WHERE entry = 4566;
DELETE FROM gossip_menu WHERE entry = 4539;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4539, 562, 0, 79), -- Mage 
(4539, 563, 0, 0);

-- Pierce Shackleton c.4567
DELETE FROM npc_gossip WHERE npc_guid = 38416;
UPDATE creature_template SET GossipMenuId = 4538 WHERE entry = 4567;
DELETE FROM gossip_menu WHERE entry = 4538;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4538, 562, 0, 79), -- Mage 
(4538, 563, 0, 0);

-- Anastasia Hartwell c.4568
DELETE FROM npc_gossip WHERE npc_guid = 38422;
UPDATE creature_template SET GossipMenuId = 4537 WHERE entry = 4568;
DELETE FROM gossip_menu WHERE entry = 4537;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4537, 562, 0, 79), -- Mage 
(4537, 563, 0, 0);

-- World Mage Trainer c.4987
-- not in game

-- Juli Stormkettle c.5145
DELETE FROM npc_gossip WHERE npc_guid = 1779;
UPDATE creature_template SET GossipMenuId = 4554 WHERE entry = 5145;

-- Jennea Cannon c.5497
DELETE FROM npc_gossip WHERE npc_guid = 90462;
UPDATE creature_template SET GossipMenuId = 4485 WHERE entry = 5497;

-- Elsharin c.5498
DELETE FROM npc_gossip WHERE npc_guid = 90463;
UPDATE creature_template SET GossipMenuId = 4484 WHERE entry = 5498;

-- Un'Thuwa c.5880
-- Pephredo c.5882
-- Enyo c.5883
-- Mai'ah c.5884
-- Deino c.5885
-- Uthel'nay c.7311
DELETE FROM npc_gossip WHERE npc_guid IN (6398,3471,3616,4798,3474,3648);
UPDATE creature_template SET GossipMenuId = 64 WHERE entry IN (5880,5882,5883,5884,5885,7311);
DELETE FROM gossip_menu WHERE entry = 64;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(64, 564, 0, 79), -- Mage 
(64, 565, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 64;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('64','0','3','I am interested in mage training.','5','16','0','0','0','0','0','','0'),
('64','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','523'),
('64','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','643');

-- World Gnome Male Mage Trainer c.5961
-- World Gnome Female Mage Trainer c.5969
-- not in game

-- Dink c.7312
DELETE FROM npc_gossip WHERE npc_guid = 1774;
UPDATE creature_template SET GossipMenuId = 4553 WHERE entry = 7312;
DELETE FROM gossip_menu WHERE entry = 4553;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4553, 560, 0, 79), -- Mage 
(4553, 561, 0, 0);

-- Haka'wani c.7488
-- not in game

-- Julia Sunstriker c.15279
-- Garridel c.16269
-- Zaedana c.16651
-- Quithas c.16652
-- Inethven c.16653
DELETE FROM npc_gossip WHERE npc_guid IN (54985,56978,57644,57645,57646);
UPDATE creature_template SET GossipMenuId = 6648 WHERE entry IN (15279,16269,16651,16652,16653);

-- Valaatu c.16500
-- Edirah c.16749
-- Semid c.17481 
-- Harnan c.17513
-- Bati c.17514
DELETE FROM npc_gossip WHERE npc_guid IN (84581,57742,62995,63009,63010);
UPDATE creature_template SET GossipMenuId = 7264 WHERE entry IN (16500,16749,17481,17513,17514);

-- Emissary Valustraa c.17105
DELETE FROM npc_gossip WHERE npc_guid = 47640;
UPDATE creature_template SET GossipMenuId = 7366 WHERE entry = 17105;
DELETE FROM gossip_menu WHERE entry = 7366;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7366, 8799, 0, 79), -- Mage 
(7366, 8800, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 7366;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('7366','0','3','I am interested in mage training.','5','16','0','0','0','0','0','','0'),
('7366','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','523'),
('7366','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','643');

-- Horace Alder c.27704
DELETE FROM npc_gossip WHERE npc_guid = 88813;
UPDATE creature_template SET GossipMenuId = 9580 WHERE entry = 27704;

-- Warcaster Fanoraithe c.28956
-- Jessa Weaver c.28958
DELETE FROM npc_gossip WHERE npc_guid IN (98417,98820);
UPDATE creature_template SET GossipMenuId = 9990 WHERE entry IN (28956,28958);

-- Warlock Trainers

-- Drusilla La Salle c.459
DELETE FROM npc_gossip WHERE npc_guid = 79966;
UPDATE creature_template SET GossipMenuId = 1503 WHERE entry = 459;

-- Alamar Grimm c.460
DELETE FROM npc_gossip WHERE npc_guid = 1024;
UPDATE creature_template SET GossipMenuId = 4681 WHERE entry = 460;
DELETE FROM gossip_menu WHERE entry = 4681;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4681, 2193, 0, 103), -- Warlock 
(4681, 5723, 0, 0);

-- Demisette Cloyce c.461
DELETE FROM npc_gossip WHERE npc_guid = 26838;
UPDATE creature_template SET GossipMenuId = 4503 WHERE entry = 461;
DELETE FROM gossip_menu WHERE entry = 4503;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4503, 5722, 0, 0), 
(4503, 5693, 0, 103);  -- Warlock

-- Maximillian Crowe c.906
DELETE FROM npc_gossip WHERE npc_guid = 80353;
UPDATE creature_template SET GossipMenuId = 4667 WHERE entry = 906;

-- Kartosh c.988
DELETE FROM npc_gossip WHERE npc_guid = 32091;
UPDATE creature_template SET GossipMenuId = 4642 WHERE entry = 988;
DELETE FROM gossip_menu WHERE entry = 4642;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4642, 5714, 0, 103), -- Warlock
(4642, 5715, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4642;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4642','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4642','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4642','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Thragg c.1408
-- not in game

-- Maximillion c.2126
DELETE FROM npc_gossip WHERE npc_guid = 28467;
UPDATE creature_template SET GossipMenuId = 4655 WHERE entry = 2126;
DELETE FROM gossip_menu WHERE entry = 4655;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4655, 5719, 0, 103), -- Warlock
(4655, 5720, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4655;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4655','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4655','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4655','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Rupert Boch c.2127
DELETE FROM npc_gossip WHERE npc_guid = 33752;
UPDATE creature_template SET GossipMenuId = 4656 WHERE entry = 2127;
DELETE FROM gossip_menu WHERE entry = 4656;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4656, 5719, 0, 103), -- Warlock
(4656, 5720, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4656;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4656','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4656','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4656','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Nartok c.3156
DELETE FROM npc_gossip WHERE npc_guid = 4800;
UPDATE creature_template SET GossipMenuId = 4643 WHERE entry = 3156;
DELETE FROM gossip_menu WHERE entry = 4643;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4643, 5714, 0, 103), -- Warlock
(4643, 5715, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4643;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4643','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4643','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4643','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Dhugru Gorelust c.3172
DELETE FROM npc_gossip WHERE npc_guid = 6389;
UPDATE creature_template SET GossipMenuId = 4641 WHERE entry = 3172;
DELETE FROM gossip_menu WHERE entry = 4641;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4641, 5714, 0, 103), -- Warlock
(4641, 5715, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4641;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4641','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4641','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4641','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Grol'dar c.3324
DELETE FROM npc_gossip WHERE npc_guid = 3461;
UPDATE creature_template SET GossipMenuId = 4603 WHERE entry = 3324;
DELETE FROM gossip_menu WHERE entry = 4603;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4603, 2193, 0, 103), -- Warlock
(4603, 5723, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4603;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4603','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4603','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4603','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Mirket c.3325
DELETE FROM npc_gossip WHERE npc_guid = 3452;
UPDATE creature_template SET GossipMenuId = 4604 WHERE entry = 3325;
DELETE FROM gossip_menu WHERE entry = 4604;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4604, 2193, 0, 103), -- Warlock
(4604, 5723, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4604;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4604','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4604','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4604','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Zevrost c.3326
DELETE FROM npc_gossip WHERE npc_guid = 6596;
UPDATE creature_template SET GossipMenuId = 2384 WHERE entry = 3326;
DELETE FROM gossip_menu WHERE entry = 2384;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(2384, 2193, 0, 103), -- Warlock
(2384, 5722, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 2384;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('2384','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('2384','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('2384','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Kaal Soulreaper c.4563
DELETE FROM npc_gossip WHERE npc_guid = 41834;
UPDATE creature_template SET GossipMenuId = 2383 WHERE entry = 4563;
DELETE FROM gossip_menu WHERE entry = 2383;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(2383, 5714, 0, 103), -- Warlock
(2383, 5715, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 2383;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('2383','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('2383','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('2383','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Luther Pickman c.4564
DELETE FROM npc_gossip WHERE npc_guid = 38071;
UPDATE creature_template SET GossipMenuId = 4609 WHERE entry = 4564;
DELETE FROM gossip_menu WHERE entry = 4609;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4609, 5719, 0, 103), -- Warlock
(4609, 5720, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4609;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4609','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4609','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4609','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Richard Kerwin c.4565
DELETE FROM npc_gossip WHERE npc_guid = 31863;
UPDATE creature_template SET GossipMenuId = 4610 WHERE entry = 4565;
DELETE FROM gossip_menu WHERE entry = 4610;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4610, 5719, 0, 103), -- Warlock
(4610, 5720, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4610;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4610','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4610','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4610','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- World Warlock Trainer c.4993
-- not in game

-- Thistleheart c.5171
DELETE FROM npc_gossip WHERE npc_guid = 1804;
UPDATE creature_template SET GossipMenuId = 4567 WHERE entry = 5171;
DELETE FROM gossip_menu WHERE entry = 4567;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4567, 2193, 0, 103), -- Warlock
(4567, 5723, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4567;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4567','0','3','I am interested in warlock training.','5','16','0','0','0','0','0','','0'),
('4567','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','543'),
('4567','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','642');

-- Briarthorn c.5172
DELETE FROM npc_gossip WHERE npc_guid = 1807;
UPDATE creature_template SET GossipMenuId = 2381 WHERE entry = 5172;

-- Alexander Calder c.5173
DELETE FROM npc_gossip WHERE npc_guid = 1803;
UPDATE creature_template SET GossipMenuId = 4667 WHERE entry = 5173;

-- Ursula Deline c.5495
DELETE FROM npc_gossip WHERE npc_guid = 90460;
UPDATE creature_template SET GossipMenuId = 4505 WHERE entry = 5495;
DELETE FROM gossip_menu WHERE entry = 4505;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4505, 5722, 0, 0), 
(4505, 5693, 0, 103);  -- Warlock

-- Sandahl c.5496
DELETE FROM npc_gossip WHERE npc_guid = 90461;
UPDATE creature_template SET GossipMenuId = 4504 WHERE entry = 5496;
DELETE FROM gossip_menu WHERE entry = 4504;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4504, 5722, 0, 0), 
(4504, 5693, 0, 103);  -- Warlock

-- Gimrizz Shadowcog c.5612
DELETE FROM npc_gossip WHERE npc_guid = 218;
UPDATE creature_template SET GossipMenuId = 4682 WHERE entry = 5612;
DELETE FROM gossip_menu WHERE entry = 4682;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4682, 2193, 0, 103), -- Warlock
(4682, 5722, 0, 0);

-- World Orc Male Warlock Trainer c.5962
-- World Orc Female Warlock Trainer c.5970
-- not in game

-- Summoner Teli'Larien c.15283
DELETE FROM npc_gossip WHERE npc_guid = 54989;
UPDATE creature_template SET GossipMenuId = 7437 WHERE entry = 15283;

-- Celoenus c.16266
-- Zanien c.16648
-- Alamma c.16646
DELETE FROM npc_gossip WHERE npc_guid IN (56976,57641,57639);
UPDATE creature_template SET GossipMenuId = 7566 WHERE entry IN (16266,16648,16646);

-- Talionia c.16647
DELETE FROM npc_gossip WHERE npc_guid = 57640;
UPDATE creature_template SET GossipMenuId = 7437 WHERE entry = 16647;

-- Exodar Warlock Trainer c.16770
-- not in game

-- Babagaya Shadowcleft c.23534
DELETE FROM npc_gossip WHERE npc_guid = 20943;
UPDATE creature_template SET GossipMenuId = 1522 WHERE entry = 23534;
DELETE FROM gossip_menu WHERE entry = 1522;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(1522, 5722, 0, 0), 
(1522, 5693, 0, 103);  -- Warlock

-- Rogue Trainers

-- Jorik Kerridan c.915
DELETE FROM npc_gossip WHERE npc_guid = 79986;
UPDATE creature_template SET GossipMenuId = 4659 WHERE entry = 915;
DELETE FROM gossip_menu WHERE entry = 4659;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4659, 4835, 0, 73), -- Rogue  
(4659, 4837, 0, 0);

-- Solm Hargrin c.916
DELETE FROM npc_gossip WHERE npc_guid = 421;
UPDATE creature_template SET GossipMenuId = 4659 WHERE entry = 4676;

-- Keryn Sylvius c.917
DELETE FROM npc_gossip WHERE npc_guid = 79645;
UPDATE creature_template SET GossipMenuId = 381 WHERE entry = 917;

-- Osborne the Night Man c.918
DELETE FROM npc_gossip WHERE npc_guid = 79788;
UPDATE creature_template SET GossipMenuId = 4502 WHERE entry = 918;
UPDATE gossip_menu_option SET id = 2 WHERE menu_id = 4502 AND option_text = 'Learn about Dual Talent Specialization.';

-- Hogral Bakkan c.1234
DELETE FROM npc_gossip WHERE npc_guid = 188;
UPDATE creature_template SET GossipMenuId = 410 WHERE entry = 918;

-- Ian Strom c.1411
DELETE FROM npc_gossip WHERE npc_guid = 644;
UPDATE creature_template SET GossipMenuId = 4658 WHERE entry = 1411;
DELETE FROM gossip_menu WHERE entry = 4658;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4658, 6165, 0, 73), -- Rogue  
(4658, 6164, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4658;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4658','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('4658','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('4658','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- David Trias c.2122
DELETE FROM npc_gossip WHERE npc_guid = 28466;
UPDATE creature_template SET GossipMenuId = 85 WHERE entry = 2122;
DELETE FROM gossip_menu WHERE entry = 85;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(85, 581, 0, 73), -- Rogue  
(85, 4796, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 85;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('85','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('85','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('85','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Marion Call c.2130
DELETE FROM npc_gossip WHERE npc_guid = 28479;
UPDATE creature_template SET GossipMenuId = 85 WHERE entry = 2130;

-- Rwag c.3155
DELETE FROM npc_gossip WHERE npc_guid = 7284;
UPDATE creature_template SET GossipMenuId = 141 WHERE entry = 3155;
DELETE FROM gossip_menu WHERE entry = 141;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(141, 638, 0, 73), -- Rogue  
(141, 4793, 0, 0);

-- Kaplak c.3170
DELETE FROM npc_gossip WHERE npc_guid = 8422;
UPDATE creature_template SET GossipMenuId = 141 WHERE entry = 3170;

-- Gest c.3327
DELETE FROM npc_gossip WHERE npc_guid = 3454;
UPDATE creature_template SET GossipMenuId = 4513 WHERE entry = 3327;
DELETE FROM gossip_menu WHERE entry = 4513;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4513, 638, 0, 73), -- Rogue  
(4513, 4793, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4513;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4513','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('4513','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('4513','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Ormok c.3328
DELETE FROM npc_gossip WHERE npc_guid = 6593;
UPDATE creature_template SET GossipMenuId = 4512 WHERE entry = 3328;
DELETE FROM gossip_menu WHERE entry = 4512;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4512, 638, 0, 73), -- Rogue  
(4512, 4793, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4512;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4512','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('4512','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('4512','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Shenthul c.3401
DELETE FROM npc_gossip WHERE npc_guid = 6594;
UPDATE creature_template SET GossipMenuId = 21221 WHERE entry = 3401;
DELETE FROM gossip_menu WHERE entry = 21221; -- source TC - not sure if its correct
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(21221, 1124, 0, 73), -- Rogue  
(21221, 4793, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 21221;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('21221','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('21221','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('21221','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Frahun Shadewhisper c.3594
DELETE FROM npc_gossip WHERE npc_guid = 46179;
UPDATE creature_template SET GossipMenuId = 4690 WHERE entry = 3594;

-- Jannok Breezesong c.3599
DELETE FROM npc_gossip WHERE npc_guid = 46185;
UPDATE creature_template SET GossipMenuId = 436 WHERE entry = 3599;

-- Syurna c.4163
DELETE FROM npc_gossip WHERE npc_guid = 46312;
UPDATE creature_template SET GossipMenuId = 4576 WHERE entry = 4163;

-- Erion Shadewhisper c.4214
DELETE FROM npc_gossip WHERE npc_guid = 46469;
UPDATE creature_template SET GossipMenuId = 4576 WHERE entry = 4214;

-- Anishar c.4215
DELETE FROM npc_gossip WHERE npc_guid = 46470;
UPDATE creature_template SET GossipMenuId = 4576 WHERE entry = 4215;

-- Carolyn Ward c.4582
DELETE FROM npc_gossip WHERE npc_guid = 38095;
UPDATE creature_template SET GossipMenuId = 4542 WHERE entry = 4582;
DELETE FROM gossip_menu WHERE entry = 4542;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4542, 581, 0, 73), -- Rogue  
(4542, 4796, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4542;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4542','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('4542','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('4542','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Miles Dexter c.4583
DELETE FROM npc_gossip WHERE npc_guid = 31885;
UPDATE creature_template SET GossipMenuId = 4540 WHERE entry = 4583;
DELETE FROM gossip_menu WHERE entry = 4540;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4540, 581, 0, 73), -- Rogue  
(4540, 4796, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4540;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4540','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('4540','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('4540','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Gregory Charles c.4584
DELETE FROM npc_gossip WHERE npc_guid = 31889;
UPDATE creature_template SET GossipMenuId = 4541 WHERE entry = 4584;
DELETE FROM gossip_menu WHERE entry = 4541;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4541, 581, 0, 73), -- Rogue  
(4541, 4796, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4541;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4541','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('4541','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('4541','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- World Rogue Trainer c.4990
-- not in game

-- Hulfdan Blackbeard c.5165
DELETE FROM npc_gossip WHERE npc_guid = 1810;
UPDATE creature_template SET GossipMenuId = 411 WHERE entry = 5165;
DELETE FROM gossip_menu WHERE entry = 411;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(411, 908, 0, 73), -- Rogue  
(411, 4798, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 411;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('411','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('411','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('411','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Ormyr Flinteye c.5166
DELETE FROM npc_gossip WHERE npc_guid = 1806;
UPDATE creature_template SET GossipMenuId = 4562 WHERE entry = 5166;
DELETE FROM gossip_menu WHERE entry = 4562;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4562, 4834, 0, 73), -- Rogue  
(4562, 4833, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4562;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4562','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('4562','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('4562','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Fenthwick c.5167
DELETE FROM npc_gossip WHERE npc_guid = 1809;
UPDATE creature_template SET GossipMenuId = 4561 WHERE entry = 5167;
DELETE FROM gossip_menu WHERE entry = 4561;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4561, 5695, 0, 73), -- Rogue  
(4561, 4833, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4561;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4561','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('4561','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('4561','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- World Human Male Rogue Trainer c.5960
-- World Human Female Rogue Trainer c.5968
-- not in game

-- Lord Tony Romano c.13283
DELETE FROM npc_gossip WHERE npc_guid = 79787;
UPDATE creature_template SET GossipMenuId = 5061 WHERE entry = 13283;
DELETE FROM gossip_menu WHERE entry = 5061;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(5061, 4835, 0, 73), -- Rogue  
(5061, 4837, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 5061;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('5061','0','3','Can you train me how to use rogue skills?','5','16','0','0','0','0','0','','0'),
('5061','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','530'),
('5061','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','632');

-- Pathstalker Kariel c.15285
DELETE FROM npc_gossip WHERE npc_guid = 54991;
UPDATE creature_template SET GossipMenuId = 6650 WHERE entry = 15285;
DELETE FROM gossip_menu WHERE entry = 6650;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6650, 9188, 0, 73), -- Rogue  
(6650, 9187, 0, 0);

-- Tannaria c.16279
DELETE FROM npc_gossip WHERE npc_guid = 56987;
UPDATE creature_template SET GossipMenuId = 6650 WHERE entry = 16279;

-- Zelanis c.16684
DELETE FROM npc_gossip WHERE npc_guid = 57673;
UPDATE creature_template SET GossipMenuId = 6650 WHERE entry = 16684;

-- Elara c.16685
DELETE FROM npc_gossip WHERE npc_guid = 57674;
UPDATE creature_template SET GossipMenuId = 6650 WHERE entry = 16685;

-- Nerisen c.16686
DELETE FROM npc_gossip WHERE npc_guid = 57675;
UPDATE creature_template SET GossipMenuId = 6650 WHERE entry = 16686;

-- Saran Nozzlevolt c.16759
-- not in game

-- Shaman Trainers

-- [UNUSED] Grall Twomoons c.354
-- not in game

-- Murak Winterborn c.373
-- not in game

-- Haromm c.986
DELETE FROM npc_gossip WHERE npc_guid = 34147;
UPDATE creature_template SET GossipMenuId = 4104 WHERE entry = 986;
DELETE FROM gossip_menu WHERE entry = 4104;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4104, 5005, 0, 93), -- Shaman  
(4104, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4104;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4104','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4104','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4104','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Ghok c.1406
-- not in game

-- Undead Shaman Trainer c.2219
-- not in game

-- Siln Skychaser c.3030
DELETE FROM npc_gossip WHERE npc_guid = 26656;
UPDATE creature_template SET GossipMenuId = 4528 WHERE entry = 3030;
DELETE FROM gossip_menu WHERE entry = 4528;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4528, 5005, 0, 93), -- Shaman  
(4528, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4528;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4528','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4528','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4528','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Tigor Skychaser c.3031
DELETE FROM npc_gossip WHERE npc_guid = 26658;
UPDATE creature_template SET GossipMenuId = 4530 WHERE entry = 3031;
DELETE FROM gossip_menu WHERE entry = 4530;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4530, 5005, 0, 93), -- Shaman  
(4530, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4530;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4530','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4530','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4530','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Beram Skychaser c.3032
DELETE FROM npc_gossip WHERE npc_guid = 26659;
UPDATE creature_template SET GossipMenuId = 4529 WHERE entry = 3032;
DELETE FROM gossip_menu WHERE entry = 4529;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4529, 5005, 0, 93), -- Shaman  
(4529, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4529;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4529','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4529','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4529','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Meela Dawnstrider c.3062
DELETE FROM npc_gossip WHERE npc_guid = 26900;
UPDATE creature_template SET GossipMenuId = 4103 WHERE entry = 3062;
DELETE FROM gossip_menu WHERE entry = 4103;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4103, 5005, 0, 93), -- Shaman  
(4103, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4103;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4103','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4103','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4103','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Narm Skychaser c.3066
DELETE FROM npc_gossip WHERE npc_guid = 26906;
UPDATE creature_template SET GossipMenuId = 4103 WHERE entry = 3066;

-- Shikrik c.3157
DELETE FROM npc_gossip WHERE npc_guid = 7281;
UPDATE creature_template SET GossipMenuId = 4652 WHERE entry = 3157;
DELETE FROM gossip_menu WHERE entry = 4652;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4652, 5005, 0, 93), -- Shaman  
(4652, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4652;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4652','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4652','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4652','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Swart c.3173
DELETE FROM npc_gossip WHERE npc_guid = 8419;
UPDATE creature_template SET GossipMenuId = 4104 WHERE entry = 3173;
DELETE FROM gossip_menu WHERE entry = 4104;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4104, 5005, 0, 93), -- Shaman  
(4104, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4104;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4104','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4104','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4104','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Kardris Dreamseeker c.3344
DELETE FROM npc_gossip WHERE npc_guid = 4663;
UPDATE creature_template SET GossipMenuId = 4516 WHERE entry = 3344;
DELETE FROM gossip_menu WHERE entry = 4516;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4516, 5005, 0, 93), -- Shaman  
(4516, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4516;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4516','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4516','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4516','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Sian'tsu c.3403
DELETE FROM npc_gossip WHERE npc_guid = 4665;
UPDATE creature_template SET GossipMenuId = 4515 WHERE entry = 3403;
DELETE FROM gossip_menu WHERE entry = 4515;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4515, 5007, 0, 93), -- Shaman  
(4515, 5008, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4515;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4515','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('4515','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('4515','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- World Shaman Trainer c.4991
-- World Troll Male Shaman Trainer c.5965
-- World Troll Female Shaman Trainer c.5971
-- not in game

-- Sagorne Creststrider c.13417
DELETE FROM npc_gossip WHERE npc_guid = 4664;
UPDATE creature_template SET GossipMenuId = 5123 WHERE entry = 13417;
DELETE FROM gossip_menu WHERE entry = 5123;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(5123, 5005, 0, 93), -- Shaman  
(5123, 5006, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 5123;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('5123','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('5123','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('5123','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644');

-- Gez'li c.16661
-- not in game

-- Firmanvaar c.17089
DELETE FROM npc_gossip WHERE npc_guid = 59513;
UPDATE creature_template SET GossipMenuId = 7522 WHERE entry = 17089;

-- Farseer Nobundo c.17204
DELETE FROM npc_gossip WHERE npc_guid = 61719;
UPDATE creature_template SET GossipMenuId = 7377 WHERE entry = 17204;
DELETE FROM gossip_menu WHERE entry = 7377;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7377, 8829, 0, 93), -- Shaman  
(7377, 8828, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 7377;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('7377','0','3','Teach me the ways of the spirits.','5','16','0','0','0','0','0','','0'),
('7377','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','561'),
('7377','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','644'),
('7377','3','0','Tell me of your past, Farseer.','1','1','7502','0','0','0','0','','0');

-- Tuluun c.17212
DELETE FROM npc_gossip WHERE npc_guid = 61721;
UPDATE creature_template SET GossipMenuId = 7467 WHERE entry = 17212;

-- Sulaa c.17219
-- Hobahken c.17519
-- Gurrag c.17520
-- Farseer Javad c.23127
DELETE FROM npc_gossip WHERE npc_guid IN (61958,63013,63014,1815);
UPDATE creature_template SET GossipMenuId = 7357 WHERE entry IN (17219,17519,17520,23127);
DELETE FROM gossip_menu WHERE entry = 7357;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7357, 8786, 0, 93), -- Shaman  
(7357, 8785, 0, 0);

-- Kruugall c.18270
-- not in game

-- Farseer Umbrua c.20407
DELETE FROM npc_gossip WHERE npc_guid = 79860;
UPDATE creature_template SET GossipMenuId = 8110 WHERE entry = 20407;

-- Priest Trainers

-- Priestess Anetta c.375
DELETE FROM npc_gossip WHERE npc_guid = 79963;
UPDATE creature_template SET GossipMenuId = 4665 WHERE entry = 375;
DELETE FROM gossip_menu WHERE entry = 4665;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4665, 4433, 0, 77), -- Priest  
(4665, 4434, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4665;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4665','0','3','I would like to train further in the ways of the Light.','5','16','0','0','0','0','0','','0'),
('4665','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4665','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- High Priestess Laurena c.376
DELETE FROM npc_gossip WHERE npc_guid = 79963;
UPDATE creature_template SET GossipMenuId = 4666 WHERE entry = 376;
DELETE FROM gossip_menu WHERE entry = 4665;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4665, 4433, 0, 77), -- Priest  
(4665, 4434, 0, 0);

-- Priestess Josetta c.377
DELETE FROM npc_gossip WHERE npc_guid = 80347;
UPDATE creature_template SET GossipMenuId = 4666 WHERE entry = 377;

-- Branstock Khalder c.837
DELETE FROM npc_gossip WHERE npc_guid = 1023;
UPDATE creature_template SET GossipMenuId = 4680 WHERE entry = 837;
DELETE FROM gossip_menu WHERE entry = 4680;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4680, 4436, 0, 77), -- Priest  
(4680, 4435, 0, 0);

-- Maxan Anvol c.1226
DELETE FROM npc_gossip WHERE npc_guid = 206;
UPDATE creature_template SET GossipMenuId = 4680 WHERE entry = 1226;

-- Dark Cleric Duesten c.2123
DELETE FROM npc_gossip WHERE npc_guid = 28469;
UPDATE creature_template SET GossipMenuId = 3645 WHERE entry = 2123;
DELETE FROM gossip_menu WHERE entry = 3645;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(3645, 4439, 0, 77), -- Priest  
(3645, 4442, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 3645;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('3645','0','3','Train me.','5','16','0','0','0','0','0','','0'),
('3645','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('3645','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Dark Cleric Beryl c.2129
DELETE FROM npc_gossip WHERE npc_guid = 28477;
UPDATE creature_template SET GossipMenuId = 3645 WHERE entry = 2129;

-- Miles Welsh c.3044
DELETE FROM npc_gossip WHERE npc_guid = 26771;
UPDATE creature_template SET GossipMenuId = 4533 WHERE entry = 3044;
DELETE FROM gossip_menu WHERE entry = 4533;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4533, 4439, 0, 77), -- Priest  
(4533, 4442, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4533;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4533','0','1','I want to browse your goods.','3','128','0','0','0','0','0','','0'),
('4533','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4533','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4533','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Malakai Cross c.3045
DELETE FROM npc_gossip WHERE npc_guid = 26772;
UPDATE creature_template SET GossipMenuId = 4531 WHERE entry = 3045;
DELETE FROM gossip_menu WHERE entry = 4531;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4531, 4439, 0, 77), -- Priest  
(4531, 4442, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4531;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4531','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4531','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4531','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Father Cobb c.3046
DELETE FROM npc_gossip WHERE npc_guid = 26773;
UPDATE creature_template SET GossipMenuId = 4532 WHERE entry = 3046;
DELETE FROM gossip_menu WHERE entry = 4532;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4532, 4439, 0, 77), -- Priest  
(4532, 4442, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4532;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4532','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4532','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4532','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Shanda c.3595
DELETE FROM npc_gossip WHERE npc_guid = 46181;
UPDATE creature_template SET GossipMenuId = 4691 WHERE entry = 3595;
DELETE FROM gossip_menu WHERE entry = 4691;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4691, 4437, 0, 77), -- Priest  
(4691, 4438, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4691;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4691','0','3','I would like to train further in the ways of the Light.','5','16','0','0','0','0','0','','0'),
('4691','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4691','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Laurna Morninglight c.3600
DELETE FROM npc_gossip WHERE npc_guid = 46186;
UPDATE creature_template SET GossipMenuId = 4691 WHERE entry = 3600;

-- Tai'jin c.3706
DELETE FROM npc_gossip WHERE npc_guid = 10429;
UPDATE creature_template SET GossipMenuId = 3644 WHERE entry = 3706;
DELETE FROM gossip_menu WHERE entry = 3644;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(3644, 4441, 0, 77), -- Priest  
(3644, 4440, 0, 0);

-- Ken'jai c.3707
DELETE FROM npc_gossip WHERE npc_guid = 4912;
UPDATE creature_template SET GossipMenuId = 3644 WHERE entry = 3707;

-- Astarii Starseeker c.4090
DELETE FROM npc_gossip WHERE npc_guid = 49859;
UPDATE creature_template SET GossipMenuId = 4691 WHERE entry = 4090;

-- Jandria c.4091
-- Lariia c.4092
DELETE FROM npc_gossip WHERE npc_guid IN (49903,49934);
UPDATE creature_template SET GossipMenuId = 4691 WHERE entry IN (4091,4092);

-- Aelthalyste c.4606
DELETE FROM npc_gossip WHERE npc_guid = 31866;
UPDATE creature_template SET GossipMenuId = 4544 WHERE entry = 4606;
DELETE FROM gossip_menu WHERE entry = 4544;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4544, 4439, 0, 77), -- Priest  
(4544, 4442, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4544;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4544','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4544','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4544','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Father Lankester c.4607
DELETE FROM npc_gossip WHERE npc_guid = 41835;
UPDATE creature_template SET GossipMenuId = 4545 WHERE entry = 4607;
DELETE FROM gossip_menu WHERE entry = 4545;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4545, 4439, 0, 77), -- Priest  
(4545, 4442, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4545;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4545','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4545','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4545','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Father Lazarus c.4608
DELETE FROM npc_gossip WHERE npc_guid = 31865;
UPDATE creature_template SET GossipMenuId = 4543 WHERE entry = 4608;
DELETE FROM gossip_menu WHERE entry = 4543;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4543, 4439, 0, 77), -- Priest  
(4543, 4442, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4543;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4543','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4543','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4543','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- World Priest Trainer c.4989
-- not in game

-- Theodrus Frostbeard c.5141
-- Braenna Flintcrag c.5142
-- Toldren Deepiron c.5143
DELETE FROM npc_gossip WHERE npc_guid IN (1780,1770,1772);
UPDATE creature_template SET GossipMenuId = 4680 WHERE entry IN (5141,5142,5143);

-- Brother Benjamin c.5484
DELETE FROM npc_gossip WHERE npc_guid = 37556;
UPDATE creature_template SET GossipMenuId = 4468 WHERE entry = 5484;
DELETE FROM gossip_menu WHERE entry = 4468;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4468, 4433, 0, 77), -- Priest  
(4468, 4434, 0, 0);

-- Brother Joshua c.5489
DELETE FROM npc_gossip WHERE npc_guid = 37571;
UPDATE creature_template SET GossipMenuId = 4666 WHERE entry = 5489;
DELETE FROM gossip_menu WHERE entry = 4666;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4666, 4433, 0, 77), -- Priest  
(4666, 4434, 0, 0);

-- World Undead Male Priest Trainer c.5964
-- World Undead Female Priest Trainer c.5973
-- not in game

-- X'yera c.6014
DELETE FROM npc_gossip WHERE npc_guid = 3473;
UPDATE creature_template SET GossipMenuId = 4523 WHERE entry = 6014;
DELETE FROM gossip_menu WHERE entry = 4523;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4523, 4441, 0, 77), -- Priest  
(4523, 4440, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4523;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4523','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4523','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4523','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Zayus c.5994
DELETE FROM npc_gossip WHERE npc_guid = 3615;
UPDATE creature_template SET GossipMenuId = 4522 WHERE entry = 5994;
DELETE FROM gossip_menu WHERE entry = 4522;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4522, 4441, 0, 77), -- Priest  
(4522, 4440, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4522;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4522','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4522','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4522','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Ur'kyo c.6018
DELETE FROM npc_gossip WHERE npc_guid = 3472;
UPDATE creature_template SET GossipMenuId = 4521 WHERE entry = 6018;
DELETE FROM gossip_menu WHERE entry = 4521;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4521, 4441, 0, 77), -- Priest  
(4521, 4440, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4521;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4521','1','3','Train me.','5','16','0','0','0','0','0','','0'),
('4521','2','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4521','3','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Nara Meideros c.11397
DELETE FROM npc_gossip WHERE npc_guid = 90480;
UPDATE creature_template SET GossipMenuId = 3643 WHERE entry = 11397;
DELETE FROM gossip_menu WHERE entry = 3643;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(3643, 4437, 0, 77), -- Priest  
(3643, 4438, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 3643;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('3643','0','3','I would like to train further in the ways of the Light.','5','16','0','0','0','0','0','','0'),
('3643','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('3643','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Priestess Alathea c.11401
DELETE FROM npc_gossip WHERE npc_guid = 46567;
UPDATE creature_template SET GossipMenuId = 4691 WHERE entry = 11401;
DELETE FROM gossip_menu WHERE entry = 4691;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4691, 4437, 0, 77), -- Priest  
(4691, 4438, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4691;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4691','0','3','I would like to train further in the ways of the Light.','5','16','0','0','0','0','0','','0'),
('4691','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('4691','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- High Priest Rohan c.11406
DELETE FROM npc_gossip WHERE npc_guid = 1777;
UPDATE creature_template SET GossipMenuId = 3642 WHERE entry = 11406;
DELETE FROM gossip_menu WHERE entry = 3642;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(3642, 4436, 0, 77), -- Priest  
(3642, 4435, 0, 0);

-- Matron Arena c.15284
-- Ponaris c.16276
-- Aldrae c.16658
-- Lotheolan c.16659
-- Belestra c.16660
DELETE FROM npc_gossip WHERE npc_guid IN (54990,56984,57650,57651,57652);
UPDATE creature_template SET GossipMenuId = 6649 WHERE entry IN (15284,16276,16658,16659,16660);

-- Zalduun c.16502
DELETE FROM npc_gossip WHERE npc_guid = 57213;
UPDATE creature_template SET GossipMenuId = 7349 WHERE entry = 16502;
DELETE FROM gossip_menu WHERE entry = 7349;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7349, 8591, 0, 77), -- Priest  
(7349, 8768, 0, 0);

-- Caedmos c.16756
-- Guvan c.17482
-- Izmir c.17510
-- Fallat c.17511
DELETE FROM npc_gossip WHERE npc_guid IN (85628,62996,85624,85626);
UPDATE creature_template SET GossipMenuId = 7265 WHERE entry IN (16756,17482,17510,17511);
DELETE FROM gossip_menu WHERE entry = 7265;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7265, 8591, 0, 77), -- Priest  
(7265, 8592, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 7265;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('7265','0','3','I would like to train further in the ways of the Light.','5','16','0','0','0','0','0','','0'),
('7265','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','566'),
('7265','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','648');

-- Nuolla Dawncaller c.19247
-- not in game

-- Driud Trainers

-- Califex of the Deep Wood c.542
-- not in game

-- Moorah Stormhoof c.1409
-- not in game

-- Undead Druid Trainer c.2217
-- not in game

-- Turak Runetotem c.3033
DELETE FROM npc_gossip WHERE npc_guid = 26661;
UPDATE creature_template SET GossipMenuId = 3921 WHERE entry = 3033;

-- Sheal Runetotem c.3034
DELETE FROM npc_gossip WHERE npc_guid = 26662;
UPDATE creature_template SET GossipMenuId = 4606 WHERE entry = 3034;
DELETE FROM gossip_menu WHERE entry = 4606;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4606, 5716, 0, 102), -- Driud 
(4606, 5717, 0, 0);

-- Kym Wildmane c.3036
DELETE FROM npc_gossip WHERE npc_guid = 26753;
UPDATE creature_template SET GossipMenuId = 4607 WHERE entry = 3036;
DELETE FROM gossip_menu WHERE entry = 4607;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4607, 5716, 0, 102), -- Driud 
(4607, 5717, 0, 0);

-- Gart Mistrunner c.3060
DELETE FROM npc_gossip WHERE npc_guid = 26898;
UPDATE creature_template SET GossipMenuId = 4644 WHERE entry = 3060;
DELETE FROM gossip_menu WHERE entry = 4644;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4644, 5716, 0, 102), -- Driud 
(4644, 5717, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4644;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4644','0','3','I seek training as a druid.','5','16','0','0','0','0','0','','0'),
('4644','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','529'),
('4644','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','647');

-- Gennia Runetotem c.3064
DELETE FROM npc_gossip WHERE npc_guid = 26903;
UPDATE creature_template SET GossipMenuId = 3926 WHERE entry = 3064;
DELETE FROM gossip_menu WHERE entry = 3926;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(3926, 4786, 0, 102), -- Driud 
(3926, 4785, 0, 0);

-- Mardant Strongoak c.3597
DELETE FROM npc_gossip WHERE npc_guid = 46183;
UPDATE creature_template SET GossipMenuId = 4688 WHERE entry = 3597;
DELETE FROM gossip_menu WHERE entry = 4688;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4688, 4784, 0, 102), -- Driud 
(4688, 4783, 0, 0);

-- Kal c.3602
DELETE FROM npc_gossip WHERE npc_guid = 46189;
UPDATE creature_template SET GossipMenuId = 3923 WHERE entry = 3602;
DELETE FROM gossip_menu WHERE entry = 3923;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(3923, 4779, 0, 102), -- Driud 
(3923, 4780, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 3923;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('3923','0','3','I seek training as a druid.','5','16','0','0','0','0','0','','0'),
('3923','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','529'),
('3923','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','647');

-- Mathrengyl Bearwalker c.4217
DELETE FROM npc_gossip WHERE npc_guid = 46472;
UPDATE creature_template SET GossipMenuId = 1403 WHERE entry = 4217;

-- Denatharion c.4218
DELETE FROM npc_gossip WHERE npc_guid = 46474;
UPDATE creature_template SET GossipMenuId = 3924 WHERE entry = 4218;
DELETE FROM gossip_menu WHERE entry = 3924;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(3924, 4782, 0, 102), -- Driud 
(3924, 4781, 0, 0);

-- Fylerian Nightwing c.4219
DELETE FROM npc_gossip WHERE npc_guid = 46475;
UPDATE creature_template SET GossipMenuId = 4571 WHERE entry = 4219;
DELETE FROM gossip_menu WHERE entry = 4571;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4571, 4782, 0, 102), -- Driud 
(4571, 4781, 0, 0);

-- World Druid Trainer c.4985
-- not in game

-- Sheldras Moontree c.5504
DELETE FROM npc_gossip WHERE npc_guid = 90465;
UPDATE creature_template SET GossipMenuId = 4508 WHERE entry = 5504;
DELETE FROM gossip_menu WHERE entry = 4508;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4508, 5694, 0, 102), -- Driud 
(4508, 4783, 0, 0);

-- Theridran c.5505
-- Golhine the Hooded c.9465
DELETE FROM npc_gossip WHERE npc_guid IN (90466,39665);
UPDATE creature_template SET GossipMenuId = 3925 WHERE entry IN (5505,9465);
DELETE FROM gossip_menu WHERE entry = 3925;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(3925, 4784, 0, 102), -- Driud 
(3925, 4783, 0, 0);

-- Maldryn c.5506
DELETE FROM npc_gossip WHERE npc_guid = 90467;
UPDATE creature_template SET GossipMenuId = 4507 WHERE entry = 5506;
DELETE FROM gossip_menu WHERE entry = 4507;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4507, 5694, 0, 102), -- Driud 
(4507, 4783, 0, 0);

-- World Tauren Male Druid Trainer c.5963
-- World Tauren Female Druid Trainer c.5972
-- not in game

-- Jannos Lighthoof c.8142
DELETE FROM npc_gossip WHERE npc_guid = 51301;
UPDATE creature_template SET GossipMenuId = 4646 WHERE entry = 8142;
DELETE FROM gossip_menu WHERE entry = 4646;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4646, 5716, 0, 102), -- Driud 
(4646, 5717, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 4646;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('4646','0','3','I seek training as a druid.','5','16','0','0','0','0','0','','0'),
('4646','1','0','I wish to unlearn my talents.','1','1','4461','0','0','0','0','','529'),
('4646','2','0','Learn about Dual Talent Specialization.','1','1','10371','0','0','0','0','','647');

-- Loganaar c.12042
DELETE FROM npc_gossip WHERE npc_guid = 42415;
UPDATE creature_template SET GossipMenuId = 4687 WHERE entry = 12042;
DELETE FROM gossip_menu WHERE entry = 4687;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4687, 4784, 0, 102), -- Driud 
(4687, 4783, 0, 0);

-- Harene Plainwalker c.16655
DELETE FROM npc_gossip WHERE npc_guid = 57648;
UPDATE creature_template SET GossipMenuId = 4605 WHERE entry = 16655;

-- Shalannius c.16721
DELETE FROM npc_gossip WHERE npc_guid = 57708;
UPDATE creature_template SET GossipMenuId = 7567 WHERE entry = 16721;    
    

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

