-- r3046
UPDATE creature_template SET ScriptName='npc_darkness' WHERE entry=25879;
UPDATE creature_template SET ScriptName='npc_singularity' WHERE entry=25855;
UPDATE creature_template SET ScriptName='' WHERE entry=25782;

-- r3048
UPDATE creature_template SET ScriptName='npc_flame_breath_trigger' WHERE entry=28351;

-- r3050
UPDATE creature_template SET ScriptName='npc_dimensius' WHERE entry=19554;

-- r3051
UPDATE creature_template SET ScriptName='npc_glob_of_viscidus' WHERE entry=15667;

-- r3054
UPDATE creature_template SET ScriptName='npc_magister_aledis' WHERE entry=20159;

-- r3055
UPDATE creature_template SET ScriptName='npc_emily' WHERE entry=26588;

-- r3059
UPDATE creature_template SET ScriptName='npc_saronite_vapor' WHERE entry=33488;

-- r3060
UPDATE creature_template SET ScriptName='npc_arthas' WHERE entry=26499;

-- r3064
UPDATE creature_template SET ScriptName='npc_spell_dummy_crusader_strike' WHERE entry IN (28167,28169);

-- r3068
UPDATE instance_template SET ScriptName='instance_trial_of_the_champion' WHERE map=650;
UPDATE creature_template SET ScriptName='npc_toc_herald' WHERE entry IN (35004, 35005);

-- r3070
DELETE FROM scripted_areatrigger WHERE entry=3587;
INSERT INTO scripted_areatrigger VALUES
(3587,'at_ancient_leaf');

-- r3071
UPDATE gameobject_template SET ScriptName='go_fathom_stone' WHERE entry=177964;

-- r3075
UPDATE creature_template SET ScriptName='boss_champion_warrior' WHERE entry IN (34705,35572);
UPDATE creature_template SET ScriptName='boss_champion_mage' WHERE entry IN (34702,35569);
UPDATE creature_template SET ScriptName='boss_champion_shaman' WHERE entry IN (34701,35571);
UPDATE creature_template SET ScriptName='boss_champion_hunter' WHERE entry IN (34657,35570);
UPDATE creature_template SET ScriptName='boss_champion_rogue' WHERE entry IN (34703,35617);
UPDATE creature_template SET ScriptName='npc_champion_mount' WHERE entry IN (35644,36559,35637,35633,35768,34658,35636,35638,35635,35640,35641,35634);

-- r3091
UPDATE creature_template SET ScriptName='npc_trial_grand_champion' WHERE entry IN (35328,35331,35330,35332,35329,35314,35326,35325,35323,35327);

-- r3096
UPDATE instance_template SET ScriptName='instance_razorfen_downs' WHERE map=129;
DELETE FROM scripted_event WHERE id=3130;
INSERT INTO scripted_event VALUES (3130, 'event_go_tutenkash_gong');
-- quest 12711 'Abandoned Mail'
DELETE FROM dbscripts_on_quest_end WHERE id = 12711;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(12711,0,38,236,28930,0,0,0,0,0,0,0,0,0,0,0,'');
UPDATE quest_template SET CompleteScript = 12711 WHERE entry = 12711;

-- Abandoned Mail - player should be able to 'interact' with object only during q.12711
UPDATE gameobject SET animprogress = 255 WHERE id = 190917;
UPDATE gameobject_template SET flags = 36 WHERE entry = 190917;
-- Convert quest_template.RewMailTemplateId to dbscripts_on_quest_end, SCRIPT_COMMAND_SEND_MAIL

DELETE FROM dbscripts_on_quest_end WHERE id IN (1141, 3644, 3645, 3646, 3647, 5128, 5237, 5238, 6001, 6002, 6125, 6130, 6962, 6984, 7025, 7045, 7735, 7738, 8149, 8150, 8240, 8323, 8324, 8619, 8635, 8636, 8642, 8643, 8644, 8645, 8646, 8647, 8648, 8649, 8650, 8651, 8652, 8653, 8654, 8670, 8671, 8672, 8673, 8674, 8675, 8676, 8677, 8678, 8679, 8680, 8681, 8682, 8683, 8684, 8685, 8686, 8688, 8713, 8714, 8715, 8716, 8717, 8718, 8719, 8720, 8721, 8722, 8723, 8724, 8725, 8726, 8727, 8746, 8762, 8866, 9671, 10588, 12278, 12306);

INSERT INTO dbscripts_on_quest_end (id, command, datalong, datalong2, dataint, comments) VALUES
(1141, 38, 87, 0, 0, 'Send Mail on QuestReward'),
(3644, 38, 103, 0, 86400, 'Send Mail on QuestReward'),
(3645, 38, 99, 0, 86400, 'Send Mail on QuestReward'),
(3646, 38, 104, 0, 86400, 'Send Mail on QuestReward'),
(3647, 38, 100, 0, 86400, 'Send Mail on QuestReward'),
(5128, 38, 98, 0, 86400, 'Send Mail on QuestReward'),
(5237, 38, 101, 0, 86400, 'Send Mail on QuestReward'),
(5238, 38, 107, 0, 86400, 'Send Mail on QuestReward'),
(6001, 38, 112, 0, 21600, 'Send Mail on QuestReward'),
(6002, 38, 116, 0, 21600, 'Send Mail on QuestReward'),
(6125, 38, 115, 0, 21600, 'Send Mail on QuestReward'),
(6130, 38, 114, 0, 21600, 'Send Mail on QuestReward'),
(6962, 38, 102, 0, 7200, 'Send Mail on QuestReward'),
(6984, 38, 108, 0, 86400, 'Send Mail on QuestReward'),
(7025, 38, 118, 0, 7200, 'Send Mail on QuestReward'),
(7045, 38, 117, 0, 86400, 'Send Mail on QuestReward'),
(7735, 38, 119, 0, 0, 'Send Mail on QuestReward'),
(7738, 38, 120, 0, 0, 'Send Mail on QuestReward'),
(8149, 38, 113, 0, 86400, 'Send Mail on QuestReward'),
(8150, 38, 111, 0, 86400, 'Send Mail on QuestReward'),
(8240, 38, 109, 0, 86400, 'Send Mail on QuestReward'),
(8323, 38, 93, 0, 21600, 'Send Mail on QuestReward'),
(8324, 38, 94, 0, 21600, 'Send Mail on QuestReward'),
(8619, 38, 84, 0, 21600, 'Send Mail on QuestReward'),
(8635, 38, 85, 0, 21600, 'Send Mail on QuestReward'),
(8636, 38, 86, 0, 21600, 'Send Mail on QuestReward'),
(8642, 38, 88, 0, 21600, 'Send Mail on QuestReward'),
(8643, 38, 89, 0, 21600, 'Send Mail on QuestReward'),
(8644, 38, 90, 0, 21600, 'Send Mail on QuestReward'),
(8645, 38, 91, 0, 21600, 'Send Mail on QuestReward'),
(8646, 38, 92, 0, 21600, 'Send Mail on QuestReward'),
(8647, 38, 95, 0, 21600, 'Send Mail on QuestReward'),
(8648, 38, 96, 0, 21600, 'Send Mail on QuestReward'),
(8649, 38, 97, 0, 21600, 'Send Mail on QuestReward'),
(8650, 38, 121, 0, 21600, 'Send Mail on QuestReward'),
(8651, 38, 124, 0, 21600, 'Send Mail on QuestReward'),
(8652, 38, 125, 0, 21600, 'Send Mail on QuestReward'),
(8653, 38, 126, 0, 21600, 'Send Mail on QuestReward'),
(8654, 38, 127, 0, 21600, 'Send Mail on QuestReward'),
(8670, 38, 128, 0, 21600, 'Send Mail on QuestReward'),
(8671, 38, 129, 0, 21600, 'Send Mail on QuestReward'),
(8672, 38, 130, 0, 21600, 'Send Mail on QuestReward'),
(8673, 38, 131, 0, 21600, 'Send Mail on QuestReward'),
(8674, 38, 132, 0, 21600, 'Send Mail on QuestReward'),
(8675, 38, 133, 0, 21600, 'Send Mail on QuestReward'),
(8676, 38, 134, 0, 21600, 'Send Mail on QuestReward'),
(8677, 38, 135, 0, 21600, 'Send Mail on QuestReward'),
(8678, 38, 136, 0, 21600, 'Send Mail on QuestReward'),
(8679, 38, 137, 0, 21600, 'Send Mail on QuestReward'),
(8680, 38, 138, 0, 21600, 'Send Mail on QuestReward'),
(8681, 38, 139, 0, 21600, 'Send Mail on QuestReward'),
(8682, 38, 140, 0, 21600, 'Send Mail on QuestReward'),
(8683, 38, 141, 0, 21600, 'Send Mail on QuestReward'),
(8684, 38, 142, 0, 21600, 'Send Mail on QuestReward'),
(8685, 38, 143, 0, 21600, 'Send Mail on QuestReward'),
(8686, 38, 144, 0, 21600, 'Send Mail on QuestReward'),
(8688, 38, 145, 0, 21600, 'Send Mail on QuestReward'),
(8713, 38, 146, 0, 21600, 'Send Mail on QuestReward'),
(8714, 38, 147, 0, 21600, 'Send Mail on QuestReward'),
(8715, 38, 148, 0, 21600, 'Send Mail on QuestReward'),
(8716, 38, 149, 0, 21600, 'Send Mail on QuestReward'),
(8717, 38, 150, 0, 21600, 'Send Mail on QuestReward'),
(8718, 38, 151, 0, 21600, 'Send Mail on QuestReward'),
(8719, 38, 152, 0, 21600, 'Send Mail on QuestReward'),
(8720, 38, 153, 0, 21600, 'Send Mail on QuestReward'),
(8721, 38, 154, 0, 21600, 'Send Mail on QuestReward'),
(8722, 38, 155, 0, 21600, 'Send Mail on QuestReward'),
(8723, 38, 156, 0, 21600, 'Send Mail on QuestReward'),
(8724, 38, 157, 0, 21600, 'Send Mail on QuestReward'),
(8725, 38, 158, 0, 21600, 'Send Mail on QuestReward'),
(8726, 38, 159, 0, 21600, 'Send Mail on QuestReward'),
(8727, 38, 160, 0, 21600, 'Send Mail on QuestReward'),
(8746, 38, 122, 0, 172800, 'Send Mail on QuestReward'),
(8762, 38, 161, 0, 172800, 'Send Mail on QuestReward'),
(8866, 38, 168, 0, 21600, 'Send Mail on QuestReward'),
(9671, 38, 180, 0, 0, 'Send Mail on QuestReward'),
(10588, 38, 183, 0, 0, 'Send Mail on QuestReward'),
(12278, 38, 209, 0, 0, 'Send Mail on QuestReward'),
(12306, 38, 210, 0, 0, 'Send Mail on QuestReward');

UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=1141;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=3644;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=3645;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=3646;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=3647;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=5128;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=5237;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=5238;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=6001;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=6002;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=6125;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=6130;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=6962;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=6984;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=7025;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=7045;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=7735;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=7738;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8149;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8150;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8240;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8323;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8324;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8619;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8635;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8636;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8642;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8643;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8644;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8645;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8646;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8647;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8648;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8649;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8650;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8651;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8652;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8653;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8654;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8670;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8671;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8672;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8673;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8674;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8675;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8676;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8677;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8678;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8679;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8680;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8681;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8682;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8683;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8684;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8685;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8686;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8688;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8713;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8714;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8715;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8716;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8717;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8718;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8719;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8720;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8721;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8722;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8723;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8724;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8725;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8726;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8727;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8746;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8762;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=8866;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=9671;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=10588;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=12278;
UPDATE quest_template SET RewMailTemplateId=0, RewMailDelaySecs=0, CompleteScript=entry WHERE entry=12306;
-- Toc5
-- faction and unit flags fix
UPDATE creature_template SET FactionAlliance=35, FactionHorde=35, UnitFlags=32768 WHERE entry=34928;
UPDATE creature_template SET UnitFlags=320 WHERE entry=35451;
UPDATE creature_template SET UnitFlags=256 WHERE entry=35491;

-- Script target for the black knight intro
DELETE FROM spell_script_target WHERE entry IN (66798,67482);
INSERT INTO spell_script_target VALUES
(67482, 1, 35451, 0),
(66798, 1, 35005, 0),
(66798, 1, 35004, 0);

-- creature linking for paletress memories
DELETE FROM creature_linking_template WHERE entry IN (35029,34942,35028,35030,35031,35032,35033,35034,35036,35037,35038,35039,35040,
35041,35042,35043,35044,35045,35046,35047,35048,35049,35050,35051,35052);
INSERT INTO creature_linking_template VALUES
(34942,650,34928,4096,0),
(35028,650,34928,4096,0),
(35029,650,34928,4096,0),
(35030,650,34928,4096,0),
(35031,650,34928,4096,0),
(35032,650,34928,4096,0),
(35033,650,34928,4096,0),
(35034,650,34928,4096,0),
(35036,650,34928,4096,0),
(35037,650,34928,4096,0),
(35038,650,34928,4096,0),
(35039,650,34928,4096,0),
(35040,650,34928,4096,0),
(35041,650,34928,4096,0),
(35042,650,34928,4096,0),
(35043,650,34928,4096,0),
(35044,650,34928,4096,0),
(35045,650,34928,4096,0),
(35046,650,34928,4096,0),
(35047,650,34928,4096,0),
(35048,650,34928,4096,0),
(35049,650,34928,4096,0),
(35050,650,34928,4096,0),
(35051,650,34928,4096,0),
(35052,650,34928,4096,0);

-- black knight gryphon movement
DELETE FROM creature_movement_template WHERE entry=35491;
INSERT INTO creature_movement_template (entry,point,position_x,position_y,position_z,waittime,script_id,orientation) VALUES 
(35491, 1, 766.987, 657.161, 457.434, 0, 0, 0),
(35491, 2, 747.283, 659.713, 440.490, 0, 0, 0),
(35491, 3, 730.031, 639.588, 428.157, 0, 0, 0),
(35491, 4, 721.130, 621.494, 423.157, 0, 0, 0),
(35491, 5, 731.715, 599.807, 421.993, 0, 0, 0),
(35491, 6, 753.711, 591.092, 420.631, 0, 0, 0),
(35491, 7, 776.531, 597.520, 418.047, 0, 0, 0),
(35491, 8, 787.382, 617.067, 417.491, 0, 0, 0),
(35491, 9, 777.059, 636.975, 416.574, 0, 0, 0),
(35491, 10, 760.600, 642.116, 414.714, 0, 0, 0),
(35491, 11, 752.583, 632.347, 411.631, 9000, 0, 4.792),
(35491, 12, 748.888, 633.612, 415.239, 0, 0, 0),
(35491, 13, 740.421, 636.307, 418.321, 0, 0, 0),
(35491, 14, 727.489, 637.399, 422.238, 0, 0, 0),
(35491, 15, 716.593, 617.987, 422.238, 0, 0, 0),
(35491, 16, 727.177, 599.288, 422.238, 0, 0, 0),
(35491, 17, 746.630, 587.769, 422.238, 0, 0, 0),
(35491, 18, 765.602, 599.517, 422.238, 0, 0, 0),
(35491, 19, 777.013, 618.793, 422.238, 0, 0, 0),
(35491, 20, 761.840, 642.177, 422.238, 0, 0, 0),
(35491, 21, 746.092, 670.331, 429.682, 0, 0, 0),
(35491, 22, 748.017, 728.222, 466.680, 0, 0, 0),
(35491, 23, 779.444, 797.487, 477.792, 0, 0, 0),
(35491, 24, 859.140, 807.975, 477.792, 0, 0, 0);


DELETE FROM spell_template WHERE id IN (68572,68574,68575);
INSERT INTO spell_template VALUES
(68572, 0x00800180, 0x00000000, 0x00000005, 0x00000000, 0x00000000, 101,  37,   6,  22,    7,  28,   4, 0,       0,    0,     'Achievement check - Grand Champions'),
(68574, 0x00800180, 0x00000000, 0x00000005, 0x00000000, 0x00000000, 101,  37,   6,  22,    7,  28,   4, 0,       0,    0,     'Achievement check - Confessor Paletress'),
(68575, 0x00800180, 0x00000000, 0x00000005, 0x00000000, 0x00000000, 101,  37,   6,  22,    7,  28,   4, 0,       0,    0,     'Achievement check - Eadric the Pure');-- r3098
UPDATE creature_template SET ScriptName='boss_eadric' WHERE entry=35119;
UPDATE creature_template SET ScriptName='boss_paletress' WHERE entry=34928;

-- r3101
UPDATE creature_template SET ScriptName='boss_black_knight' WHERE entry=35451;
UPDATE creature_template SET ScriptName='npc_black_knight_gryphon' WHERE entry=35491;-- Shadow Council Warlock
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (74594,74595,74596,74597,74598,74599,74600,74603);
DELETE FROM creature_movement WHERE id IN (74594,74595,74596,74597,74598,74599,74600,74603);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(74594,1,-3401.26,2934.17,170.004,120000,2130204,2.28638,0,0),
(74595,1,-3379.28,2966.64,170.004,120000,2130204,5.70723,0,0),
(74596,1,-3364.12,2957.05,170.004,120000,2130204,2.32129,0,0),
(74597,1,-3376.43,2954.69,169.962,120000,2130204,0.921754,0,0),
(74598,1,-3411.34,2947.12,169.963,120000,2130204,5.28835,0,0),
(74599,1,-3400.16,2946.26,170.564,120000,2130204,3.90954,0,0),
(74600,1,-3413.22,2935.1,170.004,120000,2130204,0.680678,0,0),
(74603,1,-3366.95,2968.94,169.963,120000,2130204,4.17134,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2130204; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2130204,1,15,33346,0,21348,30,1 | 0x08,0,0,0,0,0,0,0,0,''),
(2130204,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle');
-- Sunfury Warlock
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (75408,75409,75410,75411,75412);
DELETE FROM creature_movement WHERE id IN (75408,75409,75410,75411,75412);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES 
(75409,1,-3821.185059,388.192596,120.564316,120000,2150301,3.542035,0,0),
(75410,1,-3844.86499,388.54379,120.416885,120000,2150301,5.969026,0,0),
(75411,1,-3841.58496,376.102,120.403328,120000,2150301,0.9948376,0,0),
(75412,1,-3824.62988,374.3699,120.57457,120000,2150301,2.234,0,0),
(75408,1,-3839.98,403.547,120.641,120000,2150301,5.25344,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2150301; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2150301,0,15,38722,0,21506,30,1 | 0x08,0,0,0,0,0,0,0,0,'visual - channel'),
(2150301,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle');
-- Toc5
-- Script target for the black knight intro
DELETE FROM spell_script_target WHERE entry IN (67705,67715,67751);
INSERT INTO spell_script_target VALUES
(67705, 1, 35005, 0),
(67715, 1, 35004, 0),
(67751, 1, 35590, 0),
(67751, 1, 35545, 0),
(67751, 1, 35564, 0);
-- creature linking for paletress memories
DELETE FROM creature_linking_template WHERE entry IN (35545,35564,35590);
INSERT INTO creature_linking_template VALUES
(35545,650,35451,4096,0),
(35564,650,35451,4096,0),
(35590,650,35451,4096,0);
-- achiev criteria
DELETE FROM achievement_criteria_requirement WHERE criteria_id=11789 AND type=18;
INSERT INTO achievement_criteria_requirement VALUES
(11789, 18, 0, 0);
-- Cannoneer Whessan
UPDATE creature SET position_x = -2087.010986, position_y = -3500.132568, position_z = 130.084259, orientation = 3.583393 WHERE guid = 12166;
-- Fix unit flags for Algalon - Ulduar
UPDATE creature_template SET UnitFlags=33024 WHERE entry=32871;
-- Torch will now open door in Solomance.
DELETE FROM dbscripts_on_go_template_use WHERE id = 176767; 
INSERT INTO dbscripts_on_go_template_use (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(176767,1,11,45427,15,0,0,0,0,0,0,0,0,0,0,0,'');
-- q.10909 'Fel Spirits'
DELETE FROM spell_script_target WHERE entry IN (39184,39206);
INSERT INTO spell_script_target (entry, type, targetEntry, inverseEffectMask) values 
(39184,1,16878,0),
(39206,1,22444,0);
DELETE FROM dbscripts_on_spell WHERE id = 39190;
INSERT INTO dbscripts_on_spell (id, command, datalong, data_flags, comments) VALUES
(39190,15,39206,0,'Cast - Summon Fel Spirit');
-- Anchorite Relic - we shouldnt be able to despawn this object
UPDATE gameobject_template SET flags = 4 WHERE entry = 185298;
-- Shattered Hand Berserker
UPDATE creature SET position_x = -1059.401001, position_y = 3215.944580, position_z = 61.930363, orientation = 4.758759, spawndist = 2, MovementType = 1 WHERE guid = 58291;
 -- q.961 'Onu is meditating'
-- extra part for quest: q.944 'The Master's Glaive' 
-- this was first atempt for gossip menus (if source item is missing then this will come up)
-- unfortunately we are not able to reproduce this temp. mechanic ... so we do not need this extra q. to be able all the time!
DELETE FROM creature_questrelation WHERE id = 3616 AND quest = 961; 
DELETE FROM creature_involvedrelation WHERE id = 3616 AND quest = 961; 
-- Twilight Tome - rotation update
UPDATE gameobject SET rotation0 = -0.402262,  rotation1 = -0.303519, rotation2 = -0.679092, rotation3 = 0.533756 WHERE guid = 48529;
  -- ToC25 - Gormok the Impaler
DELETE FROM creature_linking_template WHERE entry IN (34800);
INSERT INTO creature_linking_template VALUES
(34800,649,34796,4097,0);
DELETE FROM dbscripts_on_spell WHERE id=66313;
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, data_flags, comments) VALUES
(66313, 1, 10, 34854, 30000, 2, 'spell Fire Bomb - summon Fire Bomb');
DELETE FROM spell_script_target WHERE entry=66636;
INSERT INTO spell_script_target VALUES
(66636, 1, 34796, 0);
-- ---------------------------
-- DK Starting Zone - phase 4   part 1.
-- ---------------------------

-- Duplicates --
DELETE FROM creature WHERE guid IN (130015,129723,130021,129653,129643,129702,129724,130005,129709,129810,129813,129767,129787,129750,129766,129733,129732,129768,130343,130340,130341,130342,130338,130339,129696);
DELETE FROM creature_addon WHERE guid IN (130015,129723,130021,129653,129643,129702,129724,130005,129709,129810,129813,129767,129787,129750,129766,129733,129732,129768,130343,130340,130341,130342,130338,130339,129696);
DELETE FROM creature_movement WHERE id IN (130015,129723,130021,129653,129643,129702,129724,130005,129709,129810,129813,129767,129787,129750,129766,129733,129732,129768,130343,130340,130341,130342,130338,130339,129696);
DELETE FROM game_event_creature WHERE guid IN (130015,129723,130021,129653,129643,129702,129724,130005,129709,129810,129813,129767,129787,129750,129766,129733,129732,129768,130343,130340,130341,130342,130338,130339,129696);
DELETE FROM game_event_creature_data WHERE guid IN (130015,129723,130021,129653,129643,129702,129724,130005,129709,129810,129813,129767,129787,129750,129766,129733,129732,129768,130343,130340,130341,130342,130338,130339,129696);
DELETE FROM creature_battleground WHERE guid IN (130015,129723,130021,129653,129643,129702,129724,130005,129709,129810,129813,129767,129787,129750,129766,129733,129732,129768,130343,130340,130341,130342,130338,130339,129696);
DELETE FROM creature_linking WHERE guid IN (130015,129723,130021,129653,129643,129702,129724,130005,129709,129810,129813,129767,129787,129750,129766,129733,129732,129768,130343,130340,130341,130342,130338,130339,129696) 
OR master_guid IN (130015,129723,130021,129653,129643,129702,129724,130005,129709,129810,129813,129767,129787,129750,129766,129733,129732,129768,130343,130340,130341,130342,130338,130339,129696);

-- missing creatures -- 
-- empty guids reused -- UDB ONLY (must be added after DK-PArt6)
DELETE FROM creature WHERE guid IN (74476,74477,74478,74479);
DELETE FROM creature_addon WHERE guid IN (74476,74477,74478,74479);
DELETE FROM creature_movement WHERE id IN (74476,74477,74478,74479);
DELETE FROM game_event_creature WHERE guid IN (74476,74477,74478,74479);
DELETE FROM game_event_creature_data WHERE guid IN (74476,74477,74478,74479);
DELETE FROM creature_battleground WHERE guid IN (74476,74477,74478,74479);
DELETE FROM creature_linking WHERE guid IN (74476,74477,74478,74479) OR master_guid IN (74476,74477,74478,74479);
INSERT INTO creature (guid, id, modelid, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana, MovementType) VALUES
-- Scarlet Marksman
(74476,28610,0,609,1,4,1491,-5933,132.781,5.5541,180,5,2614,2117,1),
-- Scarlet Commander
(74477,28936,0,609,1,4,1685.49,-5832.3,116.131,3.92065,180,0,2699,2163,2),
(74478,28936,0,609,1,4,1691.28,-5882.19,116.142,3.73829,180,0,2614,2117,2),
(74479,28939,0,609,1,4,1560.14,-5897.21,123.958,3.04261,180,0,2453,1982,2);

-- UPDATES -- 
UPDATE gossip_menu_option SET action_menu_id = 9753 WHERE menu_id = 9754; -- Noth the Plaguebringer
UPDATE creature_template SET inhabittype = 4 WHERE entry IN (28804,29038,28906); 
UPDATE creature_template SET ExtraFlags = 4096 WHERE entry = 28889; -- extra active
UPDATE creature SET position_x = 1629.940552, position_y = -6024.646973, position_z = 143.560715, orientation = 1.46 WHERE guid = 129699;
UPDATE creature SET position_x = 1754.297241, position_y = -5945.717773, position_z = 116.123177, orientation = 1.17 WHERE guid = 129671;
UPDATE creature SET position_x = 2333.83, position_y = -5995.26, position_z = 56.932, spawndist = 10, MovementType = 1 WHERE guid = 130309;
UPDATE creature SET position_x = 1415.26, position_y = -5858.53, position_z = 131.53, spawndist = 10, MovementType = 1 WHERE guid = 130032;
UPDATE creature SET position_x = 1724.94, position_y = -5802.69, position_z = 117.32, spawndist = 5, MovementType = 1 WHERE guid = 129676;
UPDATE creature SET position_x = 1742.46, position_y = -5734.76, position_z = 112.5, spawndist = 10, MovementType = 1  WHERE guid = 130023;
UPDATE creature SET position_x = 1616.89, position_y = -5882.22, position_z = 115.91, spawndist = 10, MovementType = 1 WHERE guid = 129710;
UPDATE creature SET position_x = 1488.149048, position_y = -5811.750000, position_z = 131.213638, orientation = 1.898082 WHERE guid = 129657;
UPDATE creature SET position_x = 1487.345947, position_y = -5849.651367, position_z = 131.214386, orientation = 3.349499 WHERE guid = 129654;
UPDATE creature SET position_x = 1610.545288, position_y = -5770.593750, position_z = 116.114716, orientation = 5.664675 WHERE guid = 129656;
UPDATE creature SET position_x = 1697.878418, position_y = -5749.197754, position_z = 109.773010, orientation = 4.757549 WHERE guid = 129644;
UPDATE creature SET position_x = 1733.923828, position_y = -5776.864258, position_z = 115.784103, orientation = 0.249357 WHERE guid = 129651;
UPDATE creature SET position_x = 1736.884888, position_y = -5929.806641, position_z = 117.481873, orientation = 0.825981, spawndist = 10, MovementType = 1 WHERE guid = 129670;
UPDATE creature SET position_x = 1665.335449, position_y = -5821.938477, position_z = 117.471611, orientation = 3.148665, spawndist = 15, MovementType = 1 WHERE guid = 129725;
UPDATE creature SET position_x = 1768.745728, position_y = -5783.970703, position_z = 116.123192, orientation = 4.962763, spawndist = 15, MovementType = 1 WHERE guid = 129679;
UPDATE creature SET position_x = 1783.516846, position_y = -5807.990723, position_z = 114.257050, orientation = 6.089830, spawndist = 0, MovementType = 0 WHERE guid = 129649;
UPDATE creature SET position_x = 1781.896362, position_y = -5801.923340, position_z = 115.135803, orientation = 5.912445, spawndist = 0, MovementType = 0 WHERE guid = 129648;
UPDATE creature SET position_x = 1812.887573, position_y = -5796.937500, position_z = 116.069069, orientation = 5.765442, spawndist = 0, MovementType = 0 WHERE guid = 130018;
UPDATE creature SET position_x = 1802.113770, position_y = -5800.691406, position_z = 115.556595, orientation = 5.613868, spawndist = 0, MovementType = 0 WHERE guid = 130019;
UPDATE creature SET position_x = 1802.234985, position_y = -5800.728027, position_z = 115.562492, orientation = 5.627406, spawndist = 0, MovementType = 0 WHERE guid = 83012;
UPDATE creature SET position_x = 1792.531616, position_y = -5824.551758, position_z = 111.479637, orientation = 6.211735, spawndist = 0, MovementType = 0 WHERE guid = 130022;
UPDATE creature SET position_x = 1791.961548, position_y = -5811.046875, position_z = 111.580521, orientation = 0.091129, spawndist = 0, MovementType = 0 WHERE guid = 130027;
UPDATE creature SET position_x = 1789.263062, position_y = -5803.730957, position_z = 113.554192, orientation = 5.855959, spawndist = 0, MovementType = 0 WHERE guid = 130029;
UPDATE creature SET position_x = 1787.844360, position_y = -5832.341309, position_z = 115.062073, orientation = 0.281136, spawndist = 0, MovementType = 0 WHERE guid = 130033;
UPDATE creature SET position_x = 1579.620850, position_y = -5703.322266, position_z = 121.681549, orientation = 2.945991, spawndist = 0, MovementType = 0 WHERE guid = 129809;
UPDATE creature SET position_x = 1828.536743, position_y = -5918.959473, position_z = 109.820824, orientation = 0.376951, spawndist = 0, MovementType = 0 WHERE guid = 130031;
UPDATE creature SET position_x = 1833.080444, position_y = -5932.240723, position_z = 111.163170, orientation = 0.244101, spawndist = 0, MovementType = 0 WHERE guid = 130030;
UPDATE creature SET position_x = 1825.181641, position_y = -5907.274414, position_z = 115.891685, orientation = 6.098576, spawndist = 0, MovementType = 0 WHERE guid = 130012;
UPDATE creature SET position_x = 1821.618530, position_y = -5916.443848, position_z = 111.221413, orientation = 6.210087, spawndist = 0, MovementType = 0 WHERE guid = 130017;
UPDATE creature SET position_x = 1832.372803, position_y = -5937.548828, position_z = 112.914291, orientation = 0.873289, spawndist = 0, MovementType = 0 WHERE guid = 130016;
UPDATE creature SET position_x = 1825.616577, position_y = -5943.870605, position_z = 115.999161, orientation = 0.734298, spawndist = 0, MovementType = 0 WHERE guid = 129645;
UPDATE creature SET position_x = 1825.279663, position_y = -5936.830566, position_z = 113.658310, orientation = 0.573291, spawndist = 0, MovementType = 0 WHERE guid = 129641;
UPDATE creature SET position_x = 1813.636719, position_y = -5922.254883, position_z = 114.224655, orientation = 6.276883, spawndist = 0, MovementType = 0 WHERE guid = 129642;
UPDATE creature SET position_x = 1808.542114, position_y = -5915.114258, position_z = 115.840347, orientation = 6.127660, spawndist = 0, MovementType = 0 WHERE guid = 129650;
UPDATE creature SET spawndist = 10, MovementType = 1 WHERE guid = 129681;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (129992,130022);

-- Koltira Deathweaver
UPDATE creature_template_addon SET auras = '' WHERE entry = 28912 ; -- aura will be added by event
-- Scarlet Commander Rodrick
UPDATE creature_template SET MovementType = 2 WHERE entry = 29000;
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 129850;
DELETE FROM creature_movement WHERE id = 129850;
DELETE FROM creature_movement_template WHERE entry = 29000;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(29000,1,1639.78,-6041.07,149.956,3000,0,4.5283,0,0),(29000,2,1640.91,-6036.38,149.956,0,0,0.866774,0,0),(29000,3,1643.6,-6035.02,149.956,0,0,0.0939419,0,0),
(29000,4,1653.47,-6035.67,149.956,0,0,5.83913,0,0),(29000,5,1654.72,-6038.94,149.956,0,0,4.82597,0,0),(29000,6,1654.2,-6042.88,149.956,3000,0,4.58643,0,0),
(29000,7,1654.64,-6037.4,149.956,0,0,1.81947,0,0),(29000,8,1653.42,-6035.7,149.956,0,0,2.50513,0,0),(29000,9,1641.93,-6034.81,149.956,0,0,4.14819,0,0);
-- Knight Commander Plaguefist
UPDATE creature_template SET MovementType = 2 WHERE entry = 29053;
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 129947;
DELETE FROM creature_movement WHERE id = 129947;
DELETE FROM creature_movement_template WHERE entry = 29053;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(29053,1,1368.39,-5722.43,136.415,0,0,3.51444,0,0),(29053,2,1361.03,-5724.37,136.415,0,0,3.05262,0,0),(29053,3,1355.26,-5723.52,136.415,0,0,2.82379,0,0),
(29053,4,1351.62,-5721.32,136.415,0,0,2.61566,0,0),(29053,5,1346.5,-5715.25,136.415,0,0,2.28972,0,0),(29053,6,1351.87,-5721.74,136.415,0,0,5.64886,0,0),
(29053,7,1356.59,-5724.55,136.415,0,0,5.94417,0,0),(29053,8,1362.26,-5725.54,136.415,0,0,0.22961,0,0),(29053,9,1370.14,-5721.54,136.415,0,0,0.625451,0,0),
(29053,10,1381.61,-5711.69,136.516,0,0,0.777495,0,0);
-- 'Death Knight' must cast spell on '[Chapter II] Torch Toss Dummy'
DELETE FROM spell_script_target WHERE entry = 52953;
INSERT INTO spell_script_target (entry,type,targetEntry) VALUES
(52953,1,29038);
-- [Chapter II] Torch Toss Dummy
UPDATE creature_template SET FactionAlliance = 2084, FactionHorde = 2084 WHERE entry = 29038;
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (129945,129927,129913,129944,129925,129923,129931);
DELETE FROM creature_movement WHERE id IN (129945,129927,129913,129944,129925,129923,129931);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES 
(129945,1,1386.32,-5704.46,137.525,11000,2903801,0,0,0),
(129927,1,1383.72,-5689.47,148.14,11000,2903801,0,0,0),
(129913,1,1367.1,-5677.61,148.005,11000,2903801,0,0,0),
(129944,1,1355.92,-5681,138.388,11000,2903801,0,0,0),
(129925,1,1366.53,-5701.25,147.083,11000,2903801,0,0,0),
(129923,1,1380.16,-5701.69,164.215,11000,2903801,0,0,0),
(129931,1,1383.72,-5700.96,145.792,11000,2903801,0,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2903801; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2903801,1,15,52955,0,0,0,0x04 | 0x08,0,0,0,0,0,0,0,0,'cast 52955');
-- Scarlet Commander
DELETE FROM creature_addon WHERE guid IN (129638,129639,129640,129641,129642,129644,129646,129647,129648,129649,129650,129651,129652,129654,129655,129656,129657);
DELETE FROM creature_template_addon WHERE entry = 28936;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(28936,2404,0,1,0,0,0,48356);
DELETE FROM dbscripts_on_creature_death WHERE id = 28936;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(28936,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,'unmount');
-- New Avalon Councilman
DELETE FROM creature_addon WHERE guid IN (129808,129809,129811,129812,129814);
-- Scarlet Crusader
UPDATE creature_addon SET auras = 48356 WHERE guid IN (129688,129698,129700,129701,129703,129705,129706,129707,129708,129713,129716,129718,129720,129721);
UPDATE creature_addon SET auras = '48356 52103' WHERE guid IN (129722,129726);
-- Scarlet Marksman
UPDATE creature_addon SET auras = NULL WHERE guid IN (130007,130010,130012,130018,130030);
-- Scarlet Captain -- phase 1
DELETE FROM creature_addon WHERE guid IN (129292,129296,129297,129299,129300,129301,129302,129303,129304);
DELETE FROM creature_template_addon WHERE entry = 28611;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(28611,2404,0,1,0,0,0,48356);

-- Citizen of New Avalon -- 28941
DELETE FROM creature_addon WHERE guid BETWEEN 129728 AND 129768;
INSERT INTO creature_addon (guid, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(129753,0,0,1,0,0,0,52742); -- individual
DELETE FROM creature_template_addon WHERE entry = 28941;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(28941,0,0,1,0,0,0,NULL);
-- Citizen of New Avalon -- 28942
UPDATE creature_template SET DynamicFlags = 0 WHERE entry = 28942;
DELETE FROM creature_addon WHERE guid BETWEEN 129770 AND 129805;
INSERT INTO creature_addon (guid, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(129791,0,0,1,0,0,0,52742);  -- individual
DELETE FROM creature_template_addon WHERE entry = 28942;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(28942,0,0,1,0,0,0,NULL);
-- Citizen of New Avalon
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (129788,129744,129735,129770,129730,129731,129755,129805,129786,129800,129785,129783,129749,129760,129761,129764);
DELETE FROM creature_movement WHERE id IN (129788,129744,129735,129770,129730,129731,129755,129805,129786,129800,129785,129783,129749,129760,129761,129764);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(129788,1,1613.81,-5738.64,119.954,65000,2894101,2.3911,0,0),(129744,1,1644,-5802.56,117.206,70000,2894102,5.8294,0,0),(129735,1,1608.69,-5727.34,120.107,55000,2894103,2.74017,0,0),
(129770,1,1621.09,-5730.3,120.442,6000,0,2.82743,0,0),(129770,2,1621.09,-5730.3,120.442,80000,2894101,2.82743,0,0),(129730,1,1617.68,-5724.73,121.047,3000,0,3.01942,0,0),
(129730,2,1617.68,-5724.73,121.047,100000,2894102,3.01942,0,0),(129731,1,1622.47,-5718.77,120.503,60000,2894103,3.26377,0,0),(129755,1,1782.08,-5876.27,109.579,3000,0,1.20428,0,0),
(129755,2,1782.08,-5876.27,109.579,76000,2894102,1.20428,0,0),(129805,1,1621.59,-5711.63,120.777,3000,0,3.52556,0,0),(129805,2,1621.59,-5711.63,120.777,48000,2894101,3.52556,0,0),
(129786,1,1581.9,-5755.35,120.052,3000,0,1.36136,0,0),(129786,2,1581.9,-5755.35,120.052,61000,2894103,1.36136,0,0),(129800,1,1580.21,-5745.24,120.06,59000,2894102,1.11701,0,0),
(129785,1,1574.99,-5751.52,120.84,90000,2894101,1.0472,0,0),(129783,1,1576.71,-5758.37,120.031,87000,2894103,1.22173,0,0),(129749,1,1568.59,-5753.39,120.402,2000,0,0.890118,0,0),
(129749,2,1568.59,-5753.39,120.402,53000,2894102,0.890118,0,0),(129760,1,1567.16,-5748.23,120.936,3000,0,0.715585,0,0),(129760,2,1567.16,-5748.23,120.936,67000,2894101,0.715585,0,0),
(129761,1,1562.42,-5742.34,120.245,7000,0,0.436332,0,0),(129761,2,1562.42,-5742.34,120.245,65000,2894102,0.436332,0,0),(129764,1,1557.79,-5752.63,120.207,5000,0,0.645772,0,0),
(129764,2,1557.79,-5752.63,120.207,95000,2894103,0.645772,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 2894101 AND 2894103; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
-- first set
(2894101,1,0,0,0,0,0,0,2000000414,2000000415,2000000416,2000000417,0,0,0,0,''),
(2894101,20,0,0,0,0,0,0,2000000418,2000000419,2000000420,2000000421,0,0,0,0,''),
(2894101,40,0,0,0,0,0,0,2000000422,2000000423,2000000424,2000000425,0,0,0,0,''),
-- 2nd set
(2894102,12,0,0,0,0,0,0,2000000424,2000000422,2000000420,2000000418,0,0,0,0,''),
(2894102,32,0,0,0,0,0,0,2000000416,2000000414,2000000425,2000000423,0,0,0,0,''),
(2894102,52,0,0,0,0,0,0,2000000419,2000000417,2000000415,2000000424,0,0,0,0,''),
-- 2nd set
(2894103,7,0,0,0,0,0,0,2000000416,2000000424,2000000422,2000000425,0,0,0,0,''),
(2894103,27,0,0,0,0,0,0,2000000415,2000000418,2000000419,2000000417,0,0,0,0,''),
(2894103,47,0,0,0,0,0,0,2000000419,2000000421,2000000415,2000000423,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000414 AND 2000000425;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, type, language, emote, comment) VALUES
(2000000414,'So much for the Scarlet "paradise!"',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000415,'I assure you this much, Quimby, you won\'t be getting my vote next term!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000416,'This is a slap in the face! We demand answers!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000417,'Where are those ships going, Quimby! Tell us the truth!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000418,'If you don\'t come out, we\'ll tear this place apart!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,22,NULL),
(2000000419,'I want on that last ship! Don\'t leave us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,22,NULL),
(2000000420,'Everybody is dying! Help us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000421,'No more lies, Quimby! We want answers!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000422,'What\'s "Crimson Dawn!" We deserve to know the truth, Quimby!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000423,'You\'re useless, Quimby!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000424,'QUIMBY!!!!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000425,'We were promised safety! Security!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL);

-- Scarlet Miner - q. req. (should respawn almost instant after despawn) -- update for phase 1
UPDATE creature SET spawntimesecs = 60 WHERE id = 28822;


-- Waypoints --
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (130350,129948,129949,129660,130349,129850,130014,129722,129657,129654,130009,129726,129639,129667,129656,129672,129644,
129675,129651,129677,129655,129673,74477,129674,74478,129678,74479,129640,129971,129814,129671,129652,129680,129699);
DELETE FROM creature_movement WHERE id IN (130350,129948,129949,129660,130349,130014,129722,129657,129654,130009,129726,129639,129667,129656,129672,129644,129675,129651,129677,129655,
129673,74477,129674,74478,129678,74479,129640,129971,129814,129671,129652,129680,129699);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- Dark Rider of Acherus #1
(130350,1,2346.4,-5697.16,153.92,0,0,5.41571,0,0),(130350,2,2371.42,-5724.47,153.92,0,0,5.47461,0,0),(130350,3,2402.05,-5752.73,153.92,3000,0,5.55708,0,0),
(130350,4,2372.02,-5723.27,153.92,0,0,2.37229,0,0),(130350,5,2346.33,-5696.99,153.92,0,0,2.32124,0,0),(130350,6,2321.38,-5668.72,153.885,3000,0,2.28589,0,0),
-- Dark Rider of Acherus #2
(130349,1,2204.07,-5661.79,119.802,0,0,0.706393,0,0),(130349,2,2264.61,-5647.21,139.297,0,0,6.2513,0,0),(130349,3,2228.91,-5646.4,129.903,0,0,3.37361,0,0),
(130349,4,2220.98,-5648.89,127.362,0,0,3.7396,0,0),(130349,5,2203.75,-5661.75,119.738,0,0,3.82443,0,0),(130349,6,2181.98,-5680.18,111.624,3000,0,3.86762,0,0),
-- Plague Spreader #1
(129948,1,2204.05,-6093.6,11.6666,0,0,0,0,0),(129948,2,2228.43,-6083.14,11.6666,0,0,0,0,0),(129948,3,2235.87,-6081.08,11.6666,0,0,0,0,0),
(129948,4,2246.84,-6082.63,11.6666,0,0,0,0,0),(129948,5,2269.48,-6106.42,11.6666,0,0,0,0,0),(129948,6,2274.37,-6130.37,11.6666,0,0,0,0,0),
(129948,7,2243.96,-6154.67,11.6666,0,0,0,0,0),(129948,8,2219.91,-6150.99,11.6666,0,0,0,0,0),(129948,9,2203.39,-6129.08,11.6666,0,0,0,0,0),
(129948,10,2198.25,-6111.61,11.6666,0,0,0,0,0),
-- Plague Spreader #2
(129949,1,2180.905,-6107.839,12.80337,0,0,0,0,0),(129949,2,2162.869,-6081.49,12.80337,0,0,0,0,0),(129949,3,2125.024,-6078.062,12.80337,0,0,0,0,0),
(129949,4,2107.367,-6089.924,12.80337,0,0,0,0,0),(129949,5,2102.505,-6102.334,12.80337,0,0,0,0,0),(129949,6,2113.609,-6140.162,12.80337,0,0,0,0,0),
(129949,7,2129.026,-6150.702,12.80337,0,0,0,0,0),(129949,8,2144.816,-6154.626,12.80337,0,0,0,0,0),(129949,9,2181.376,-6134.367,12.80337,0,0,0,0,0),
-- Crypt Guardian
(129660,1,1861.66,-5745.29,95.5409,0,0,0.797985,0,0),(129660,2,1864.73,-5742.86,95.521,0,0,6.2243,0,0),(129660,3,1876.91,-5743.56,89.9868,0,0,4.9262,0,0),
(129660,4,1877.41,-5746.46,90.0144,0,0,4.67887,0,0),(129660,5,1877.38,-5757.07,83.8928,0,0,4.69065,0,0),(129660,6,1877.63,-5746.5,90.0132,0,0,1.53329,0,0),
(129660,7,1877.35,-5744.09,89.9926,0,0,1.92599,0,0),(129660,8,1873.76,-5742.6,89.9781,0,0,3.18655,0,0),(129660,9,1865.2,-5742.89,95.5197,0,0,3.19832,0,0),
(129660,10,1862.54,-5743.21,95.5214,0,0,3.84234,0,0),(129660,11,1861.35,-5746.39,95.5492,0,0,4.69135,0,0),(129660,12,1861.77,-5759.61,105.036,0,0,4.78481,0,0),
(129660,13,1861.83,-5763.45,105.072,0,0,4.76125,0,0),(129660,14,1861.82,-5759.57,105.037,0,0,1.56075,0,0),
-- Scarlet Marksman #1
(130014,1,1461.29,-5922.39,131.277,0,0,5.93638,0,0),(130014,2,1468.61,-5923.06,131.394,0,0,0.166059,0,0),(130014,3,1475.44,-5918.01,131.601,0,0,0.97659,0,0),
(130014,4,1478.5,-5913.42,131.665,0,0,1.85309,0,0),(130014,5,1471.08,-5903.83,131.601,0,0,2.35889,0,0),(130014,6,1449.96,-5882.85,131.214,0,0,2.57723,0,0),
(130014,7,1442.68,-5879.27,131.214,0,0,3.1223,0,0),(130014,8,1435.07,-5883.9,131.213,0,0,4.17395,0,0),(130014,9,1434.92,-5896.06,131.213,0,0,5.14156,0,0),
(130014,10,1448.42,-5910.95,131.328,0,0,5.50048,0,0),
-- Scarlet Marksman #2
(130009,1,1428,-5783.36,131.211,0,0,0.965293,0,0),(130009,2,1433.35,-5779.88,131.211,0,0,0.094362,0,0),(130009,3,1449.37,-5792.75,131.211,0,0,5.45706,0,0),
(130009,4,1471.83,-5814.99,131.214,0,0,5.27249,0,0),(130009,5,1472.55,-5819.78,131.223,0,0,4.61433,0,0),(130009,6,1469.86,-5824.61,131.286,0,0,3.93339,0,0),
(130009,7,1464.37,-5826.39,131.304,0,0,3.02469,0,0),(130009,8,1457.02,-5822.06,131.285,0,0,2.46391,0,0),(130009,9,1442.45,-5808.9,131.211,0,0,2.3626,0,0),
(130009,10,1429.82,-5795.7,131.211,0,0,2.29762,0,0),(130009,11,1425.52,-5787.21,131.211,0,0,1.51458,0,0),
-- Scarlet Crusader #1
(129722,1,1483,-5886.27,131.993,0,0,5.46907,0,0),(129722,2,1490.41,-5894.84,132.365,0,0,5.12428,0,0),(129722,3,1490,-5901.06,132.331,0,0,4.14726,0,0),
(129722,4,1484.78,-5904.88,132.01,0,0,3.45297,0,0),(129722,5,1478.18,-5902.88,131.733,0,0,2.45394,0,0),(129722,6,1469.27,-5896.52,131.538,0,0,2.37069,0,0),
(129722,7,1457.95,-5885.54,131.226,0,0,2.29529,0,0),(129722,8,1451.73,-5879.22,131.214,0,0,2.10993,0,0),(129722,9,1449.65,-5872.62,131.214,0,0,1.60571,0,0),
(129722,10,1452.97,-5866.33,131.214,0,0,0.82188,0,0),(129722,11,1459.24,-5864.36,131.237,0,0,6.23563,0,0),(129722,12,1466.11,-5869.13,131.48,0,0,5.47381,0,0),
-- Scarlet Crusader #2
(129726,1,1430.46,-5802.17,131.211,0,0,2.37616,0,0),(129726,2,1424.36,-5796.9,131.211,0,0,2.70682,0,0),(129726,3,1417.5,-5796.18,131.211,0,0,3.51028,0,0),
(129726,4,1412.83,-5799.62,131.211,0,0,4.1598,0,0),(129726,5,1411.98,-5804.96,131.211,0,0,4.87372,0,0),(129726,6,1421.25,-5816.64,131.211,0,0,5.44392,0,0),
(129726,7,1442.1,-5837.12,131.214,0,0,5.85311,0,0),(129726,8,1449.07,-5837.56,131.219,0,0,0.42272,0,0),(129726,9,1454.39,-5833.33,131.249,0,0,1.15,0,0),
(129726,10,1453.09,-5825.2,131.289,0,0,2.23385,0,0),(129726,11,1443.02,-5814.95,131.225,0,0,2.39486,0,0),
-- Scarlet Commander #1
(129657,1,1484.85,-5802.34,131.228,0,0,2.09093,0,0),(129657,2,1474.38,-5788.07,131.232,0,0,2.24565,0,0),(129657,3,1451.5,-5759.41,131.232,0,0,2.40901,0,0),
(129657,4,1438.17,-5750.76,131.21,0,0,2.77606,0,0),(129657,5,1425.59,-5747.92,131.21,0,0,3.33919,0,0),(129657,6,1416.48,-5752.81,131.263,0,0,3.84342,0,0),
(129657,7,1410.85,-5760.42,131.447,0,0,4.38253,0,0),(129657,8,1397.58,-5797.64,131.217,0,0,4.52391,0,0),(129657,9,1398.15,-5805.79,131.242,0,0,5.00299,0,0),
(129657,10,1402.93,-5815.12,131.215,0,0,5.33678,0,0),(129657,11,1431.32,-5846.87,131.209,0,0,5.47815,0,0),(129657,12,1439.07,-5853.76,131.21,0,0,5.82529,0,0),
(129657,13,1449.41,-5855.99,131.22,0,0,0.0101976,0,0),(129657,14,1478.43,-5856.03,131.237,0,0,0.0438187,0,0),(129657,15,1487.95,-5854.48,131.214,0,0,0.642292,0,0),
(129657,16,1491.59,-5851.32,131.214,0,0,1.09625,0,0),(129657,17,1493.68,-5843.79,131.213,0,0,1.60511,0,0),(129657,18,1488.45,-5813.26,131.21,0,0,1.81953,0,0),
-- Scarlet Commander #2
(129654,1,1451.43,-5852.32,131.316,0,0,2.97292,0,0),(129654,2,1441.34,-5848.45,131.214,0,0,2.31868,0,0),(129654,3,1415.71,-5822.71,131.208,0,0,2.34224,0,0),
(129654,4,1402.84,-5805.23,131.217,0,0,1.9087,0,0),(129654,5,1403.41,-5795.93,131.212,0,0,1.30316,0,0),(129654,6,1414.64,-5764.5,131.301,0,0,1.2741,0,0),
(129654,7,1421.97,-5754.72,131.213,0,0,0.747881,0,0),(129654,8,1431.54,-5753.59,131.21,0,0,6.13021,0,0),(129654,9,1440.86,-5758.25,131.21,0,0,5.51839,0,0),
(129654,10,1465.74,-5787.2,131.213,0,0,5.4532,0,0),(129654,11,1479.13,-5805.14,131.211,0,0,5.30005,0,0),(129654,12,1485.4,-5822.49,131.219,0,0,4.99375,0,0),
(129654,13,1487.73,-5844.53,131.216,0,0,4.72279,0,0),(129654,14,1486.62,-5849.06,131.214,0,0,4.1039,0,0),(129654,15,1482.41,-5851.55,131.217,0,0,3.45988,0,0),
-- Scarlet Commander #3
(129639,1,1472.19,-6104.45,116.409,0,0,1.41102,0,0),(129639,2,1474.29,-6087.87,116.607,0,0,1.56495,0,0),(129639,3,1473.82,-6062.56,116.304,0,0,1.61208,0,0),
(129639,4,1473.17,-6036.38,116.29,0,0,1.49427,0,0),(129639,5,1478.06,-6012.66,116.284,0,0,1.06623,0,0),(129639,6,1486.23,-6001.87,116.314,0,0,0.644466,0,0),
(129639,7,1505.69,-5994.36,116.633,0,0,0.325594,0,0),(129639,8,1514.02,-5993.44,116.612,0,0,5.9569,0,0),(129639,9,1517.62,-5999.02,116.688,0,0,4.98772,0,0),
(129639,10,1521.9,-6029.15,116.664,0,0,4.87384,0,0),(129639,11,1524.52,-6054.87,116.62,0,0,4.77174,0,0),(129639,12,1524.53,-6076.48,116.408,0,0,4.55104,0,0),
(129639,13,1519.56,-6094.36,116.335,0,0,4.27301,0,0),(129639,14,1509.33,-6107.59,116.284,0,0,3.89288,0,0),(129639,15,1487.71,-6118.92,116.278,0,0,3.4075,0,0),
(129639,16,1475.95,-6120.35,116.278,0,0,2.90956,0,0),
-- Scarlet Commander #4
(129656,1,1625,-5778.52,116.113,0,0,6.10448,0,0),(129656,2,1653.12,-5780.38,116.133,0,0,6.24585,0,0),(129656,3,1658.9,-5782.13,116.12,0,0,5.51622,0,0),
(129656,4,1661.2,-5788.39,116.12,0,0,4.80286,0,0),(129656,5,1661.32,-5800.77,116.12,3000,0,4.71646,0,0),(129656,6,1661.26,-5788.32,116.12,0,0,1.76415,0,0),
(129656,7,1658.24,-5781.99,116.121,0,0,2.49379,0,0),(129656,8,1652.77,-5779.65,116.135,0,0,3.00194,0,0),(129656,9,1623.94,-5778.43,116.115,0,0,2.90612,0,0),
(129656,10,1610.78,-5770.42,116.113,3000,0,2.15999,0,0),
-- Scarlet Commander #5
(129644,1,1698.96,-5769.22,112.386,0,0,4.7204,0,0),(129644,2,1697.47,-5737.85,108.036,0,0,1.62985,0,0),(129644,3,1697.27,-5693.11,100.955,0,0,1.55917,0,0),
(129644,4,1697.01,-5674.14,100.934,0,0,1.58666,0,0),(129644,5,1697.25,-5694.12,100.977,0,0,4.70469,0,0),(129644,6,1697.72,-5749.36,109.797,0,0,4.74003,0,0),
-- Scarlet Commander #6
(129651,1,1720.21,-5779.78,114.513,0,0,3.26662,0,0),(129651,2,1705.87,-5780.64,113.715,0,0,3.52973,0,0),(129651,3,1701.25,-5783.59,113.924,0,0,4.04338,0,0),
(129651,4,1699.86,-5789.38,114.431,0,0,4.63557,0,0),(129651,5,1699.99,-5804.38,115.619,0,0,4.69054,0,0),(129651,6,1699.76,-5789.17,114.415,0,0,1.38951,0,0),
(129651,7,1701.13,-5783.71,113.934,0,0,0.859368,0,0),(129651,8,1739.68,-5775.38,116.067,0,0,0.217698,0,0),
-- Scarlet Commander #7
(129655,1,1724.56,-5872.18,116.14,0,0,6.18687,0,0),(129655,2,1700.94,-5870.79,116.136,0,0,2.5544,0,0),(129655,3,1696.75,-5866.47,116.143,0,0,1.67827,0,0),
(129655,4,1699.11,-5836.6,116.134,0,0,1.55751,0,0),(129655,5,1696.83,-5866.13,116.146,0,0,5.13342,0,0),(129655,6,1701.01,-5870.74,116.138,0,0,6.06411,0,0),
-- Scarlet Commander #8
(74477,1,1671.07,-5842.12,116.156,0,0,3.75022,0,0),(74477,2,1654.14,-5843.03,116.132,0,0,3.1376,0,0),(74477,3,1671.63,-5842.28,116.156,0,0,0.253621,0,0),
(74477,4,1685.39,-5832.77,116.131,0,0,0.0109327,0,0),(74477,5,1693.22,-5833.96,116.134,0,0,0.160941,0,0),(74477,6,1704.13,-5830.75,116.127,0,0,0.533219,0,0),
(74477,7,1709.5,-5824.58,116.122,0,0,1.2173,0,0),(74477,8,1709.35,-5817.58,116.122,0,0,1.93908,0,0),(74477,9,1701.58,-5809.6,115.928,0,0,2.67814,0,0),
(74477,10,1695.93,-5810.12,115.956,0,0,3.48396,0,0),(74477,11,1689.94,-5818.01,116.121,0,0,4.21909,0,0),(74477,12,1685.4,-5832.19,116.13,0,0,4.38796,0,0),
-- Scarlet Commander #9
(74478,1,1659.23,-5899.66,116.131,0,0,3.87809,0,0),(74478,2,1653.38,-5908.31,116.313,0,0,4.48756,0,0),(74478,3,1653.9,-5925.85,120.91,0,0,4.69647,0,0),
(74478,4,1654.15,-5937.76,123.758,0,0,4.71611,0,0),(74478,5,1653.42,-5970.72,132.078,0,0,4.69647,0,0),(74478,6,1654.15,-5937.04,123.624,0,0,1.60986,0,0),
(74478,7,1653.9,-5926.42,121.083,0,0,1.58237,0,0),(74478,8,1653.91,-5908.43,116.332,0,0,1.32711,0,0),(74478,9,1657.71,-5901.09,116.135,0,0,0.655597,0,0),
(74478,10,1691.15,-5882.08,116.141,0,0,0.537992,0,0),
-- Scarlet Commander #10
(129640,1,1536.25,-5893.34,128.873,0,0,2.97364,0,0),(129640,2,1510,-5885.73,131.049,0,0,2.83227,0,0),(129640,3,1536.94,-5893.69,128.792,0,0,6.00841,0,0),
(129640,4,1571.34,-5899.74,121.971,0,0,6.11522,0,0),(129640,5,1593.38,-5907.72,117.219,0,0,6.10344,0,0),(129640,6,1610.75,-5911.35,116.134,0,0,6.16863,0,0),
(129640,7,1637.24,-5913.05,116.274,0,0,6.2511,0,0),(129640,8,1610.65,-5911.36,116.133,0,0,2.9862,0,0),(129640,9,1592.72,-5907.52,117.344,0,0,2.83304,0,0),
(129640,10,1569.86,-5899.58,122.251,0,0,2.97049,0,0),
-- Scarlet Commander #11
(129652,1,1764.34,-5925.82,116.118,0,0,1.48752,0,0),(129652,2,1762.36,-5920.05,116.119,0,0,2.19674,0,0),(129652,3,1733.13,-5907.12,116.13,0,0,2.6075,0,0),
(129652,4,1704.95,-5888.31,116.137,0,0,2.55959,0,0),(129652,5,1733.48,-5907.3,116.13,0,0,5.83549,0,0),(129652,6,1761.79,-5919.54,116.119,0,0,5.46714,0,0),
(129652,7,1764.58,-5923.79,116.119,0,0,4.92286,0,0),(129652,8,1762.14,-5931.22,116.116,0,0,4.23406,0,0),(129652,9,1747.14,-5959.18,116.282,0,0,4.22464,0,0),
(129652,10,1755.09,-5944.02,116.123,0,0,1.08697,0,0),
-- Scarlet Preacher #1
(129667,1,1553.22,-5960.2,118.69,0,0,0.957545,0,0),(129667,2,1575.06,-5932.33,119.438,0,0,0.906494,0,0),(129667,3,1560.64,-5949.38,119.818,0,0,4.05987,0,0),
(129667,4,1550.88,-5963.25,118.318,0,0,3.9397,0,0),(129667,5,1525.7,-5985.65,116.341,0,0,3.84545,0,0),
-- Scarlet Preacher #2
(129672,1,1625,-5778.52,116.113,0,0,6.10448,0,0),(129672,2,1653.12,-5780.38,116.133,0,0,6.24585,0,0),(129672,3,1658.9,-5782.13,116.12,0,0,5.51622,0,0),
(129672,4,1661.2,-5788.39,116.12,0,0,4.80286,0,0),(129672,5,1661.32,-5800.77,116.12,3000,0,4.71646,0,0),(129672,6,1661.26,-5788.32,116.12,0,0,1.76415,0,0),
(129672,7,1658.24,-5781.99,116.121,0,0,2.49379,0,0),(129672,8,1652.77,-5779.65,116.135,0,0,3.00194,0,0),(129672,9,1623.94,-5778.43,116.115,0,0,2.90612,0,0),
(129672,10,1610.78,-5770.42,116.113,3000,0,2.15999,0,0),
-- Scarlet Preacher #3
(129675,1,1698.96,-5769.22,112.386,0,0,4.7204,0,0),(129675,2,1697.47,-5737.85,108.036,0,0,1.62985,0,0),(129675,3,1697.27,-5693.11,100.955,0,0,1.55917,0,0),
(129675,4,1697.01,-5674.14,100.934,0,0,1.58666,0,0),(129675,5,1697.25,-5694.12,100.977,0,0,4.70469,0,0),(129675,6,1697.72,-5749.36,109.797,0,0,4.74003,0,0),
-- Scarlet Preacher #4
(129677,1,1720.21,-5779.78,114.513,0,0,3.26662,0,0),(129677,2,1705.87,-5780.64,113.715,0,0,3.52973,0,0),(129677,3,1701.25,-5783.59,113.924,0,0,4.04338,0,0),
(129677,4,1699.86,-5789.38,114.431,0,0,4.63557,0,0),(129677,5,1699.99,-5804.38,115.619,0,0,4.69054,0,0),(129677,6,1699.76,-5789.17,114.415,0,0,1.38951,0,0),
(129677,7,1701.13,-5783.71,113.934,0,0,0.859368,0,0),(129677,8,1739.68,-5775.38,116.067,0,0,0.217698,0,0),
-- Scarlet Preacher #5
(129673,1,1724.56,-5872.18,116.14,0,0,6.18687,0,0),(129673,2,1700.94,-5870.79,116.136,0,0,2.5544,0,0),(129673,3,1696.75,-5866.47,116.143,0,0,1.67827,0,0),
(129673,4,1699.11,-5836.6,116.134,0,0,1.55751,0,0),(129673,5,1696.83,-5866.13,116.146,0,0,5.13342,0,0),(129673,6,1701.01,-5870.74,116.138,0,0,6.06411,0,0),
-- Scarlet Preacher #6
(129674,1,1671.07,-5842.12,116.156,0,0,3.75022,0,0),(129674,2,1654.14,-5843.03,116.132,0,0,3.1376,0,0),(129674,3,1671.63,-5842.28,116.156,0,0,0.253621,0,0),
(129674,4,1685.39,-5832.77,116.131,0,0,0.0109327,0,0),(129674,5,1693.22,-5833.96,116.134,0,0,0.160941,0,0),(129674,6,1704.13,-5830.75,116.127,0,0,0.533219,0,0),
(129674,7,1709.5,-5824.58,116.122,0,0,1.2173,0,0),(129674,8,1709.35,-5817.58,116.122,0,0,1.93908,0,0),(129674,9,1701.58,-5809.6,115.928,0,0,2.67814,0,0),
(129674,10,1695.93,-5810.12,115.956,0,0,3.48396,0,0),(129674,11,1689.94,-5818.01,116.121,0,0,4.21909,0,0),(129674,12,1685.4,-5832.19,116.13,0,0,4.38796,0,0),
-- Scarlet Preacher #7
(129678,1,1659.23,-5899.66,116.131,0,0,3.87809,0,0),(129678,2,1653.38,-5908.31,116.313,0,0,4.48756,0,0),(129678,3,1653.9,-5925.85,120.91,0,0,4.69647,0,0),
(129678,4,1654.15,-5937.76,123.758,0,0,4.71611,0,0),(129678,5,1653.42,-5970.72,132.078,0,0,4.69647,0,0),(129678,6,1654.15,-5937.04,123.624,0,0,1.60986,0,0),
(129678,7,1653.9,-5926.42,121.083,0,0,1.58237,0,0),(129678,8,1653.91,-5908.43,116.332,0,0,1.32711,0,0),(129678,9,1657.71,-5901.09,116.135,0,0,0.655597,0,0),
(129678,10,1691.15,-5882.08,116.141,0,0,0.537992,0,0),
-- Scarlet Preacher #8
(74479,1,1536.25,-5893.34,128.873,0,0,2.97364,0,0),(74479,2,1510,-5885.73,131.049,0,0,2.83227,0,0),(74479,3,1536.94,-5893.69,128.792,0,0,6.00841,0,0),
(74479,4,1571.34,-5899.74,121.971,0,0,6.11522,0,0),(74479,5,1593.38,-5907.72,117.219,0,0,6.10344,0,0),(74479,6,1610.75,-5911.35,116.134,0,0,6.16863,0,0),
(74479,7,1637.24,-5913.05,116.274,0,0,6.2511,0,0),(74479,8,1610.65,-5911.36,116.133,0,0,2.9862,0,0),(74479,9,1592.72,-5907.52,117.344,0,0,2.83304,0,0),
(74479,10,1569.86,-5899.58,122.251,0,0,2.97049,0,0),
-- Scarlet Preacher #9
(129671,1,1764.34,-5925.82,116.118,0,0,1.48752,0,0),(129671,2,1762.36,-5920.05,116.119,0,0,2.19674,0,0),(129671,3,1733.13,-5907.12,116.13,0,0,2.6075,0,0),
(129671,4,1704.95,-5888.31,116.137,0,0,2.55959,0,0),(129671,5,1733.48,-5907.3,116.13,0,0,5.83549,0,0),(129671,6,1761.79,-5919.54,116.119,0,0,5.46714,0,0),
(129671,7,1764.58,-5923.79,116.119,0,0,4.92286,0,0),(129671,8,1762.14,-5931.22,116.116,0,0,4.23406,0,0),(129671,9,1747.14,-5959.18,116.282,0,0,4.22464,0,0),
(129671,10,1755.09,-5944.02,116.123,0,0,1.08697,0,0),
-- Scarlet Preacher #10
(129680,1,1821.2,-5928.63,112.896,0,0,0.332973,0,0),(129680,2,1807.92,-5933.55,115.415,0,0,3.82171,0,0),(129680,3,1806.9,-5942.48,115.854,0,0,4.71157,0,0),
(129680,4,1807.3,-5984.78,116.081,0,0,4.75476,0,0),(129680,5,1806.34,-5937.93,115.71,0,0,1.37519,0,0),(129680,6,1808.15,-5933.44,115.395,0,0,0.381662,0,0),
-- Scarlet Champion
(129971,1,1290.19,-6086.8,14.0143,0,0,1.94614,0,0),(129971,2,1284.27,-6068.68,15.3243,0,0,1.58015,0,0),(129971,3,1286.62,-6056.83,18.3116,0,0,1.21886,0,0),
(129971,4,1297.85,-6030.64,29.8068,0,0,1.17959,0,0),(129971,5,1310.86,-6012.47,40.2979,0,0,0.643166,0,0),(129971,6,1323.23,-6006.51,45.5835,0,0,0.459383,0,0),
(129971,7,1339.81,-5999.64,55.212,0,0,0.486087,0,0),(129971,8,1348.97,-5994.98,60.7586,0,0,0.673011,0,0),(129971,9,1360.1,-5985.95,71.251,0,0,0.716208,0,0),
(129971,10,1374.29,-5970.46,84.0289,0,0,0.837945,0,0),(129971,11,1384.73,-5962.79,91.1262,0,0,0.268531,0,0),(129971,12,1394.15,-5962.58,95.8656,0,0,6.1119,0,0),
(129971,13,1384.56,-5963.28,90.8885,0,0,3.48081,0,0),(129971,14,1371.88,-5971.18,82.9792,0,0,3.87351,0,0),(129971,15,1358.94,-5985.89,70.6782,0,0,3.79969,0,0),
(129971,16,1350.07,-5994.35,61.6231,0,0,3.58998,0,0),(129971,17,1336.75,-6001.13,53.5872,0,0,3.59862,0,0),(129971,18,1322.14,-6006.03,45.4004,0,0,3.62611,0,0),
(129971,19,1307.26,-6014.68,38.3932,0,0,3.86566,0,0),(129971,20,1294.97,-6036.74,26.848,0,0,4.27406,0,0),(129971,21,1285.56,-6058.13,17.794,0,0,4.52931,0,0),
(129971,22,1284.73,-6070.54,15.0786,0,0,4.84818,0,0),(129971,23,1288.9,-6085.51,14.0181,0,0,5.17412,0,0),(129971,24,1301.28,-6101.91,14.0403,0,0,5.10186,0,0),
(129971,25,1301.2,-6120.5,13.9759,0,0,4.6911,0,0),(129971,26,1301.34,-6102.27,14.0355,0,0,1.65161,0,0),
-- New Avalon Councilman
(129814,1,1595.39,-5741.17,119.235,0,0,2.08888,0,0),(129814,2,1592.73,-5735.73,121.68,0,0,1.9907,0,0),(129814,3,1586.46,-5722.66,121.679,0,0,2.85857,0,0),
(129814,4,1583.72,-5721.36,121.679,0,0,3.33374,0,0),(129814,5,1573.3,-5725.97,120.779,0,0,2.96695,0,0),(129814,6,1570.01,-5722.42,121.681,0,0,2.09281,0,0),
(129814,7,1564.42,-5709.98,121.681,0,0,0.658667,0,0),(129814,8,1572.67,-5705.6,121.681,0,0,5.26267,0,0),(129814,9,1576.47,-5712.84,121.681,0,0,3.60862,0,0),
(129814,10,1568.84,-5719.77,121.681,0,0,4.96273,0,0),(129814,11,1572.37,-5725.47,120.78,0,0,6.05993,0,0),(129814,12,1577.77,-5723.99,120.858,0,0,0.499302,0,0),
(129814,13,1582.97,-5721.46,121.68,0,0,5.76854,0,0),(129814,14,1589.05,-5727.91,121.68,0,0,5.24233,0,0),(129814,15,1592.89,-5735.62,121.68,0,0,5.16771,0,0),
(129814,16,1595.56,-5741.08,119.234,0,0,5.16771,0,0),(129814,17,1603.22,-5755.53,119.255,0,0,5.21484,0,0),
-- Scarlet Crusader
(129699,1,1630.92,-6013.96,148.662,0,0,1.55542,0,0),(129699,2,1633.65,-6010.28,148.662,0,0,0.550893,0,0),(129699,3,1663.46,-6012.85,148.662,0,0,5.57745,0,0),
(129699,4,1667.49,-6017.52,148.662,0,0,4.65846,0,0),(129699,5,1666.49,-6027.57,143.561,0,0,4.41656,0,0),(129699,6,1665.2,-6030.42,143.561,0,0,3.65002,0,0),
(129699,7,1659.98,-6031.31,143.561,0,0,2.96908,0,0),(129699,8,1634.38,-6029.13,143.561,0,0,2.70519,0,0),(129699,9,1629.98,-6024.52,143.561,0,0,1.72265,0,0);



-- Pools --
-- Pool Templates -- Pool 1
DELETE FROM pool_template WHERE entry = 25468;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25468, 1, 'New Avalon - Scarlet Commander/Scarlet Preacher - Pool 1');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25468;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(129644, 25468, 0, 'New Avalon - Scarlet Commander'),
(129675, 25468, 0, 'New Avalon - Scarlet Preacher');
-- Pool Templates  -- Pool 2 
DELETE FROM pool_template WHERE entry = 25469;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25469, 1, 'New Avalon - Scarlet Commander/Scarlet Preacher - Pool 2');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25469;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(129656, 25469, 0, 'New Avalon - Scarlet Commander'),
(129672, 25469, 0, 'New Avalon - Scarlet Preacher');
-- Pool Templates  -- Pool 3 
DELETE FROM pool_template WHERE entry = 25470;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25470, 1, 'New Avalon - Scarlet Commander/Scarlet Preacher - Pool 3');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25470;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(129651, 25470, 0, 'New Avalon - Scarlet Commander'),
(129677, 25470, 0, 'New Avalon - Scarlet Preacher');
-- Pool Templates  -- Pool 4 
DELETE FROM pool_template WHERE entry = 25471;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25471, 1, 'New Avalon - Scarlet Commander/Scarlet Preacher - Pool 4');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25471;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(129655, 25471, 0, 'New Avalon - Scarlet Commander'),
(129673, 25471, 0, 'New Avalon - Scarlet Preacher');
-- Pool Templates  -- Pool 5 
DELETE FROM pool_template WHERE entry = 25472;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25472, 1, 'New Avalon - Scarlet Commander/Scarlet Preacher - Pool 5');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25472;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(74477, 25472, 0, 'New Avalon - Scarlet Commander'),
(129674, 25472, 0, 'New Avalon - Scarlet Preacher');
-- Pool Templates  -- Pool 6 
DELETE FROM pool_template WHERE entry = 25473;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25473, 1, 'New Avalon - Scarlet Commander/Scarlet Preacher - Pool 6');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25473;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(74478, 25473, 0, 'New Avalon - Scarlet Commander'),
(129678, 25473, 0, 'New Avalon - Scarlet Preacher');
-- Pool Templates  -- Pool 7 
DELETE FROM pool_template WHERE entry = 25474;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25474, 1, 'New Avalon - Scarlet Commander/Scarlet Preacher - Pool 7');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25474;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(74479, 25474, 0, 'New Avalon - Scarlet Commander'),
(129640, 25474, 0, 'New Avalon - Scarlet Preacher');
-- Pool Templates  -- Pool 8 
DELETE FROM pool_template WHERE entry = 25475;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25475, 1, 'New Avalon - Scarlet Commander/Scarlet Preacher - Pool 8');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25475;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(129652, 25475, 0, 'New Avalon - Scarlet Commander'),
(129671, 25475, 0, 'New Avalon - Scarlet Preacher');


-- Links --
DELETE FROM creature_linking WHERE guid = 129972;
-- Scarlet Champion #1 with Scarlet Champion #2
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(129972, 129971, 512+128);


-- missing objects
-- reuse empty guids -- UDB ONLY
DELETE FROM gameobject WHERE guid IN (66147);
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
-- aura
(66147,191206,609,1,4,2460.06,-5593.7,367.394,0.556369,0,0,0.27461,0.961556,180,255,1);
-- ---------------------------
-- DK Starting Zone - phase 4   part 2. Acherus Necromancer - Invaders Event
-- ---------------------------

-- missing creatures -- 
-- empty guids reused -- UDB ONLY (must be added after DK-PArt7)
DELETE FROM creature WHERE guid IN (125640,128499,128517,128518,128519,128520,128521,128554,128555,128556,128616);
DELETE FROM creature_addon WHERE guid IN (125640,128499,128517,128518,128519,128520,128521,128554,128555,128556,128616);
DELETE FROM creature_movement WHERE id IN (125640,128499,128517,128518,128519,128520,128521,128554,128555,128556,128616);
DELETE FROM game_event_creature WHERE guid IN (125640,128499,128517,128518,128519,128520,128521,128554,128555,128556,128616);
DELETE FROM game_event_creature_data WHERE guid IN (125640,128499,128517,128518,128519,128520,128521,128554,128555,128556,128616);
DELETE FROM creature_battleground WHERE guid IN (125640,128499,128517,128518,128519,128520,128521,128554,128555,128556,128616);
DELETE FROM creature_linking WHERE guid IN (125640,128499,128517,128518,128519,128520,128521,128554,128555,128556,128616) 
OR master_guid IN (125640,128499,128517,128518,128519,128520,128521,128554,128555,128556,128616);
INSERT INTO creature (guid, id, modelid, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana, MovementType) VALUES
-- Acherus Necromancer
(125640,28889,0,609,1,4,2105.21,-6131.12,6.17389,0.168441,360,0,8982,0,0),
(128499,28889,0,609,1,4,2117.44,-5762.23,98.3189,1.36616,360,0,8982,0,0),
(128517,28889,0,609,1,4,2153.62,-5878.11,101.263,4.94146,360,0,8982,0,0),
-- Scarlet Ghoul -- fast respawntime needed for event
(128518,28897,0,609,1,4,2077.1,-5744.47,99.3915,3.69346,30,0,925,0,2),
(128519,28897,0,609,1,4,2090.98,-5772.49,99.1364,3.00624,30,0,891,0,2),
(128520,28897,0,609,1,4,2130.24,-5786.56,98.8595,3.53639,30,0,925,0,2),
(128521,28897,0,609,1,4,2132.06,-5680.27,101.872,3.74295,30,0,925,0,2),
(128554,28897,0,609,1,4,2146.72,-5850.4,101.348,2.97874,30,0,960,0,2),
(128555,28897,0,609,1,4,2146.68,-5891.05,101.386,2.83344,30,0,891,0,2),
(128556,28897,0,609,1,4,2170.08,-5862.69,101.377,3.13975,30,0,960,0,2),
(128616,28897,0,609,1,4,2163.73,-5819.37,101.347,3.34395,30,0,960,0,2);

-- Updates --

-- Scarlet Fleet Defender
UPDATE creature SET DeathState = 0 WHERE guid BETWEEN 130076 AND 130111; -- its done by aura
UPDATE creature_template SET UnitFlags = 33587968, DynamicFlags = 32 WHERE entry = 28886; -- correct flags 
DELETE FROM creature_addon WHERE guid BETWEEN 130076 AND 130111;
DELETE FROM creature_template_addon WHERE entry = 28886;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(28886,0,0,1,0,0,0,29266);
-- Scarlet Gryphon
UPDATE creature SET DeathState = 0 WHERE guid BETWEEN 130219 AND 130222; -- its done by aura
DELETE FROM creature_addon WHERE guid BETWEEN 130219 AND 130222;
-- Scarlet Infantryman
UPDATE creature SET DeathState = 0 WHERE guid BETWEEN 130233 AND 130251; -- its done by aura
DELETE FROM creature_addon WHERE guid BETWEEN 130233 AND 130251;
-- Scarlet Captain
UPDATE creature SET DeathState = 0 WHERE guid BETWEEN 130256 AND 130261; -- its done by aura
DELETE FROM creature_addon WHERE guid BETWEEN 130256 AND 130261;
-- Scarlet Medic
UPDATE creature SET DeathState = 0 WHERE guid BETWEEN 130227 AND 130232; -- its done by aura
DELETE FROM creature_addon WHERE guid BETWEEN 130227 AND 130232;
-- Scarlet Miner
UPDATE creature SET DeathState = 0 WHERE guid BETWEEN 130122 AND 130187; -- its done by aura
DELETE FROM creature_addon WHERE guid BETWEEN 130122 AND 130187;
-- Scourge Plaguehound
UPDATE creature_template SET SpeedWalk = 1.6, SpeedRun = 1.71429 WHERE entry = 28903;
-- Scralet Ghoul
UPDATE creature_template SET MovementType = 0, InhabitType = 3 WHERE entry = 28897;
DELETE FROM creature_movement_template WHERE entry = 28897;
INSERT INTO creature_movement_template (entry,point,position_x,position_y,position_z,waittime,script_id,orientation,model1,model2) VALUES
(28897,1,2109.46,-6060.24,5.68025,1000,2889702,2.33773,0,0),(28897,2,2070.14,-6009.97,14.1785,0,0,2.58278,0,0),(28897,3,2026.73,-5988.91,34.4922,0,0,2.79326,0,0),
(28897,4,2012.75,-5986.29,41.7496,0,0,3.00139,0,0),(28897,5,1968.02,-5981.75,78.1271,0,0,3.02496,0,0),(28897,6,1940.42,-5973.18,100.583,0,0,2.6244,0,0),
(28897,7,1889.64,-5929.67,103.984,0,0,2.70137,0,0),(28897,8,1853.33,-5918.92,105.118,0,0,3.2378,0,0),(28897,9,1805.12,-5934.13,115.66,0,0,3.32184,0,0),
(28897,10,1724.81,-5922.4,117.299,300000,2889701,2.90558,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2889701,2889702); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2889701,1,20,1,100,0,0,0x08,0,0,0,0,0,0,0,0,'movement chenged to 1:random'),
(2889702,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(2889702,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');
DELETE FROM dbscripts_on_creature_death WHERE id = 28897;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(28897,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
-- Scourge Gryphon
UPDATE creature_template SET MovementType = 0, InhabitType = 4, SpeedWalk = 2.4, SpeedRun = 2.57143 WHERE entry = 28906;
DELETE FROM dbscripts_on_creature_death WHERE id = 28906;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(28906,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
-- Gluttonous Geist
UPDATE creature_template SET SpeedWalk = 1.6, SpeedRun = 1.42857 WHERE entry = 28905;
UPDATE creature SET spawndist = 10, MovementType = 1, spawntimesecs = 25 WHERE guid BETWEEN 130297 AND 130331;
DELETE FROM dbscripts_on_creature_death WHERE id = 28905;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(28905,0,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self');
UPDATE creature SET position_x = 2179.580078, position_y = -5735.517578, position_z = 102.051216, orientation = 0.28 WHERE guid = 130321;
UPDATE creature SET position_x = 2285.824463, position_y = -5825.710938, position_z = 100.934158, orientation = 6.24 WHERE guid = 130316;
UPDATE creature SET position_x = 2424.753418, position_y = -5879.221191, position_z = 104.670280, orientation = 2.05 WHERE guid = 130323;
UPDATE creature SET position_x = 2352.291992, position_y = -5857.714844, position_z = 102.684357, orientation = 1.54 WHERE guid = 130315;
UPDATE creature SET position_x = 2237.403320, position_y = -5911.937988, position_z = 100.284546, orientation = 5.57 WHERE guid = 130311;
UPDATE creature SET position_x = 2207.168457, position_y = -5783.182617, position_z = 101.517105, orientation = 4.78 WHERE guid = 130320;
UPDATE creature SET position_x = 2108.11, position_y = -5844.99, position_z = 102.581, orientation = 3.31 WHERE guid = 130301;
-- Acherus Necromancer
UPDATE creature SET position_x = 2239.78, position_y = -6059.1, position_z = 5.76, orientation = 4.1 WHERE guid = 130118;
UPDATE creature SET position_x = 2193.64, position_y = -6099.1, position_z = 1.52, orientation = 1.84 WHERE guid = 130120;
UPDATE creature SET position_x = 2251.14, position_y = -6139.8, position_z = 1.86, orientation = 1.98 WHERE guid = 130119;
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (130118,130119,130120,125640,128499,128517);
DELETE FROM creature_movement WHERE id IN (130118,130119,130120,125640,128499,128517);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- 1st
(130118,1,2234.99,-6065.31,5.73,10000,2888902,4.29,0,0),
(130118,2,2240.05,-6060.546,5.688,3000,0,0,0,0),
(130118,3,2248.52,-6078.31,6.09,12000,2888902,4.90,0,0),
(130118,4,2240.05,-6060.546,5.688,11000,2888901,0,0,0),
-- 2nd
(130120,1,2199.24,-6095.62,1.83137,10000,2888902,0.639755,0,0),
(130120,2,2193.64,-6099.1,1.52,5000,0,0,0,0),
(130120,3,2188.74,-6091.56,1.91467,12000,2888902,1.92388,0,0),
(130120,4,2193.64,-6099.1,1.52,11000,2888901,0,0,0),
-- 3rd
(130119,1,2258.88,-6144.58,2.50571,13000,2888902,5.62306,0,0),
(130119,2,2251.14,-6139.8,1.86,4000,0,0,0,0),
(130119,3,2247.4,-6147.9,2.02971,10000,2888902,4.47245,0,0),
(130119,4,2251.14,-6139.8,1.86,11000,2888901,0,0,0),
-- 4th
(125640,1,2115.99,-6144.1,3.84152,11000,2888902,5.46595,0,0),
(125640,2,2105.21,-6131.12,6.17389,2000,0,0,0,0),
(125640,3,2112.93,-6120.35,7.26217,11000,2888902,1.12662,0,0),
(125640,4,2105.21,-6131.12,6.17389,11000,2888901,0,0,0),
-- 5th
(128499,1,2124.6,-5749.84,98.8654,11000,2888903,1.02847,0,0),
(128499,2,2117.44,-5762.23,98.3189,2000,0,0,0,0),
(128499,3,2109.09,-5755.77,98.9729,11000,2888903,2.48049,0,0),
(128499,4,2117.44,-5762.23,98.3189,11000,2888901,0,0,0),
-- 6th
(128517,1,2149.98,-5888.45,101.283,11000,2888903,3.84142,0,0),
(128517,2,2153.62,-5878.11,101.263,3000,0,0,0,0),
(128517,3,2162.13,-5881.28,101.332,11000,2888903,6.04446,0,0),
(128517,4,2153.62,-5878.11,101.263,11000,2888901,0,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 2888901 AND 2888903;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2888901,1,20,1,5,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 1:random'),
(2888901,10,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'),
(2888902,3,31,28886,15,0,0,0,0,0,0,0,0,0,0,0,''),
(2888902,4,15,52683,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(2888902,6,25,1,0,28897,15,7,0,0,0,0,0,0,0,0,'RUN ON'),
(2888902,7,20,2,0,28897,15,7,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'),
(2888903,3,31,28892,15,0,0,0,0,0,0,0,0,0,0,0,''),
(2888903,4,15,52683,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(2888903,6,21,1,0,28897,15,7,0,0,0,0,0,0,0,0,'active'),
(2888903,7,3,0,700,28897,15,7 | 0x08,0,0,0,0,1783.51,-5818.18,113.877,3.19587,'');  -- 0x08 temp 

-- Gothik the Harvester
UPDATE creature_template SET SpeedWalk = 1.6, SpeedRun = 1.714286 WHERE entry = 28890;
UPDATE creature SET position_x = 2107.563721, position_y = -5742.198730, position_z = 99.855499, orientation = 1.374185 WHERE guid = 130121;
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 130121;
DELETE FROM creature_movement WHERE id = 130121;
DELETE FROM creature_movement_template WHERE entry = 28890;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(28890,1,2109.85,-5727.25,100.257,0,0,0.413397,0,0),(28890,2,2156.03,-5712.91,102.291,0,0,6.15937,0,0),(28890,3,2177.85,-5738.68,101.921,0,0,5.56012,0,0),
(28890,4,2188.7,-5759.94,101.649,10000,2889001,5.14936,0,0),(28890,5,2225.29,-5781.82,101.775,0,0,5.67557,0,0),(28890,6,2252.21,-5806.7,100.959,0,0,5.36848,0,0),
(28890,7,2265.43,-5827.23,100.945,0,0,5.03548,0,0),(28890,8,2267.51,-5839.93,100.944,0,0,5.03941,0,0),(28890,9,2284.81,-5845.79,100.935,10000,2889004,5.98189,0,0),
(28890,10,2259.68,-5866.16,101.605,0,0,3.82989,0,0),(28890,11,2241.44,-5886.94,100.764,0,0,4.04195,0,0),(28890,12,2228.81,-5899.27,100.89,0,0,3.64925,0,0),
(28890,13,2201.1,-5902.2,100.88,0,0,3.12696,0,0),(28890,14,2179.59,-5890.74,101.109,0,0,2.15307,0,0),(28890,15,2181.51,-5888.24,100.93,10000,2889002,0.693798,0,0),
(28890,16,2165.13,-5866.72,101.331,0,0,2.28265,0,0),(28890,17,2143.17,-5825.25,101.125,0,0,1.94886,0,0),(28890,18,2130.2,-5789.78,98.9462,10000,2889003,1.48547,0,0),
(28890,19,2115.31,-5769.12,98.1968,0,0,1.93551,0,0),(28890,20,2107.57,-5742.3,99.8496,0,0,1.70931,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2889001,2889002,2889003,2889004); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2889001,2,0,0,0,0,0,0,2000000426,2000000427,0,0,0,0,0,0,''),
(2889001,3,31,28893,15,0,0,0,0,0,0,0,0,0,0,0,''),
(2889001,4,15,52685,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(2889001,6,21,1,0,28906,15,7,0,0,0,0,0,0,0,0,'active'),
(2889001,7,3,0,2000,28906,15,7,0,0,0,0,1781.18,-5818.34,114.383,3.25503,''),
(2889002,2,0,0,0,0,0,0,2000000428,2000000429,0,0,0,0,0,0,''),
(2889002,3,31,28896,15,0,0,0,0,0,0,0,0,0,0,0,''),
(2889002,4,15,52683,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(2889002,6,21,1,0,28897,15,7,0,0,0,0,0,0,0,0,'active'),
(2889002,7,3,0,700,28897,15,7 | 0x08,0,0,0,0,1783.51,-5818.18,113.877,3.19587,''), -- 0x08 temp
(2889003,2,0,0,0,0,0,0,2000000429,2000000428,0,0,0,0,0,0,''),
(2889003,3,31,28898,15,0,0,0,0,0,0,0,0,0,0,0,''),
(2889003,4,15,52683,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(2889003,6,21,1,0,28897,15,7,0,0,0,0,0,0,0,0,'active'),
(2889003,7,3,0,700,28897,15,7 | 0x08,0,0,0,0,1783.51,-5818.18,113.877,3.19587,''),  -- 0x08 temp
(2889004,2,0,0,0,0,0,0,2000000426,2000000427,0,0,0,0,0,0,''),
(2889004,3,31,28893,15,0,0,0,0,0,0,0,0,0,0,0,''),
(2889004,4,15,52685,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(2889004,6,21,1,0,28906,15,7,0,0,0,0,0,0,0,0,'active'),
(2889004,7,3,0,2000,28906,15,7,0,0,0,0,1818.18,-5930.02,113.669,3.43102,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000426 AND 2000000429;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, type, language, emote, comment) VALUES
(2000000426,'Rise, minion. Rise and fly for the Scourge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000427,'You will fly again, beast...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000428,'Surprise, surprise! Another ghoul!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000429,'Is Gothik the Harvester going to have to choke a geist?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL);

-- Waypoints
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (128518,128519,128520,128521,128554,128555,128556,128616);
DELETE FROM creature_movement WHERE id IN (128518,128519,128520,128521,128554,128555,128556,128616);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- Scarlet Ghoul
-- #1
(128518,1,2077.1,-5744.47,99.3915,2000,2889702,3.69346,0,0),(128518,2,2037.4,-5753.16,98.4207,0,0,3.62744,0,0),(128518,3,2016.68,-5768.47,102.027,0,0,3.85128,0,0),
(128518,4,1988.66,-5790.4,100.921,0,0,3.76096,0,0),(128518,5,1955.34,-5805.9,101.012,0,0,3.41931,0,0),(128518,6,1923.02,-5809.99,100.145,0,0,3.17191,0,0),
(128518,7,1883.31,-5811.93,102.057,0,0,3.26223,0,0),(128518,8,1845.49,-5811.9,100.457,0,0,3.13657,0,0),(128518,9,1818.34,-5814.16,104.528,0,0,3.23081,0,0),
(128518,10,1790.43,-5813.92,112.024,0,0,3.11301,0,0),(128518,11,1771.37,-5801.06,116.041,0,0,2.57501,0,0),(128518,12,1744.92,-5785.9,116.122,0,0,2.81063,0,0),
(128518,13,1699.92,-5778.87,113.453,300000,2889701,0,0,0),
-- #2
(128519,1,2090.98,-5772.49,99.1364,2000,2889702,3.00624,0,0),(128519,2,2074.1,-5788.09,101.267,0,0,3.81592,0,0),(128519,3,2057.83,-5799.68,101.801,0,0,3.66277,0,0),
(128519,4,2034.62,-5803.96,100.546,0,0,3.23473,0,0),(128519,5,1989.39,-5810.89,100.804,0,0,3.23866,0,0),(128519,6,1940.36,-5843.1,100.335,0,0,3.54496,0,0),
(128519,7,1893.36,-5846.78,101.331,0,0,3.14441,0,0),(128519,8,1852.1,-5836.64,101.806,0,0,2.89308,0,0),(128519,9,1836.54,-5830.45,100.72,0,0,2.71244,0,0),
(128519,10,1812.11,-5822.54,105.733,0,0,2.90643,0,0),(128519,11,1792.25,-5822.46,111.503,0,0,3.18918,0,0),(128519,12,1749.64,-5832.9,116.486,300000,2889701,0,0,0),
-- #3
(128520,1,2130.24,-5786.56,98.8595,2000,2889702,3.53639,0,0),(128520,2,2108.39,-5791.13,99.6639,0,0,3.31091,0,0),(128520,3,2083.15,-5805.23,102.845,0,0,3.7743,0,0),
(128520,4,2068.88,-5827.84,102.066,0,0,4.01385,0,0),(128520,5,2036.77,-5848.15,100.365,0,0,3.61329,0,0),(128520,6,1978.2,-5853.32,100.708,0,0,3.08314,0,0),
(128520,7,1939.37,-5848.67,100.858,0,0,3.1499,0,0),(128520,8,1889.51,-5831.7,101.353,0,0,2.8593,0,0),(128520,9,1842.17,-5818.86,100.294,0,0,3.13262,0,0),
(128520,10,1806.12,-5818.45,107.736,0,0,3.0423,0,0),(128520,11,1775.45,-5818.74,115.4,300000,2889701,0,0,0),
-- #4
(128521,1,2132.06,-5680.27,101.872,2000,2889702,3.74295,0,0),(128521,2,2095.29,-5701.47,100.297,0,0,3.67382,0,0),(128521,3,2044.51,-5738.45,98.9834,0,0,3.47747,0,0),
(128521,4,1991.4,-5752.36,101.254,0,0,3.38715,0,0),(128521,5,1934.35,-5757.02,105.033,0,0,3.75079,0,0),(128521,6,1881.51,-5781.34,103.301,0,0,3.527,0,0),
(128521,7,1841.71,-5798.38,101.761,0,0,3.40919,0,0),(128521,8,1807.28,-5817.31,107.472,0,0,3.25996,0,0),(128521,9,1775.64,-5821.64,115.384,0,0,3.12252,0,0),
(128521,10,1735.1,-5821.55,116.123,0,0,2.98115,0,0),(128521,11,1699.1,-5781.46,113.715,300000,2889701,0,0,0),
-- #5
(128554,1,2146.72,-5850.4,101.348,2000,2889702,2.97874,0,0),(128554,2,2113.71,-5845.58,103.176,0,0,2.69361,0,0),(128554,3,2062.49,-5812.86,103.405,0,0,2.8664,0,0),
(128554,4,2033.06,-5803.11,100.477,0,0,3.12165,0,0),(128554,5,1981.41,-5808.84,100.994,0,0,3.41617,0,0),(128554,6,1938.5,-5809.06,100.369,0,0,3.01719,0,0),
(128554,7,1887.08,-5806.34,101.47,0,0,3.10359,0,0),(128554,8,1837.55,-5812.48,101.002,0,0,3.24103,0,0),(128554,9,1762.94,-5838.98,116.452,300000,2889701,0,0,0),
-- #6
(128555,1,2146.68,-5891.05,101.386,2000,2889702,2.83344,0,0),(128555,2,2118.53,-5903.55,104.329,0,0,3.53163,0,0),(128555,3,2076.95,-5910.58,106.063,0,0,3.31957,0,0),
(128555,4,2024.11,-5921.23,105.048,0,0,3.42167,0,0),(128555,5,1974.84,-5932.61,103.075,0,0,2.95463,0,0),(128555,6,1901.55,-5926.27,102.896,0,0,3.04888,0,0),
(128555,7,1838.23,-5925.68,108.629,0,0,3.19418,0,0),(128555,8,1805.08,-5924.84,115.492,0,0,2.96641,0,0),(128555,9,1754.33,-5910.94,116.066,300000,2889701,0,0,0),
-- #7
(128556,1,2170.08,-5862.69,101.377,2000,2889702,3.13975,0,0),(128556,2,2142.05,-5859.07,101.352,0,0,2.97007,0,0),(128556,3,2082.66,-5886.58,104.147,0,0,3.64944,0,0),
(128556,4,2028.09,-5908.18,104.992,0,0,3.31957,0,0),(128556,5,1961.21,-5907.68,102.35,0,0,3.13107,0,0),(128556,6,1895.26,-5906.86,101.947,0,0,3.17034,0,0),
(128556,7,1850.95,-5908.88,104.766,0,0,3.36277,0,0),(128556,8,1813.52,-5931.68,114.631,300000,2889701,0,0,0),
-- #8
(128616,1,2163.73,-5819.37,101.347,2000,2889702,3.34395,0,0),(128616,2,2113.22,-5847.34,103.411,0,0,3.45855,0,0),(128616,3,2052.44,-5861.79,102.836,0,0,3.33682,0,0),
(128616,4,2001.1,-5892.32,101.117,0,0,3.77271,0,0),(128616,5,1981.55,-5900.67,102.871,0,0,3.33053,0,0),(128616,6,1911.11,-5907.35,101.617,0,0,3.25985,0,0),
(128616,7,1858.52,-5910.56,104.28,0,0,3.17738,0,0),(128616,8,1804.56,-5934.23,115.703,300000,2889701,3.59757,0,0);

-- Spells --
-- targets for 52683
DELETE FROM spell_script_target WHERE entry = 52683;
INSERT INTO spell_script_target (entry, type, targetEntry, inverseEffectMask) VALUES
(52683, 1, 28892, 0),(52683, 1, 28897, 0),(52683, 1, 28886, 0),(52683, 1, 28896, 0),(52683, 1, 28898, 0);
-- Death Knight Initiate -- corrected
DELETE FROM dbscripts_on_creature_movement WHERE id  = 2840606;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2840606,1,22,2084,0x01 | 0x10 | 0x20,0,0,0,0,0,0,0,0,0,0,0,'temp faction');
-- Scarlet Infantryman -- correct spawn point
UPDATE creature SET position_x = 2412.590332, position_y = -5854.412109, position_z = 106.358147, orientation = 0.654703 WHERE guid = 129278;
-- q.2240 'The Hidden Chamber' -- Uldaman

-- Ironaya is summoned, so remove the static spawn.
DELETE FROM creature WHERE guid = 54080;

-- Ironaya
UPDATE creature_template SET EquipmentTemplateId = 17 WHERE entry = 7228;
DELETE FROM creature_movement_template WHERE entry = 7228;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, orientation, waittime, script_id) VALUES
(7228, 1, -234.8384, 304.7419, -47.59481, 0, 0, 0), 
(7228, 2, -234.5273, 289.1205, -48.02008, 0, 0, 0), 
(7228, 3, -233.9544, 270.4161, -50.40104, 0, 0, 0), 
(7228, 4, -233.4224, 252.0556, -49.44788, 0, 0, 0), 
(7228, 5, -231.1759, 245.8255, -49.14987, -1.2249, 1000, 722801);
DELETE FROM dbscripts_on_creature_movement WHERE id = 722801;
INSERT INTO dbscripts_on_creature_movement (id, command, datalong, comments) VALUES
(722801, 32, 1, 'pause Ironaya');
-- Ironaya event
DELETE FROM dbscripts_on_go_template_use WHERE id = 124371;
INSERT INTO dbscripts_on_go_template_use (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, x, y, z, o, dataint, comments) VALUES
(124371, 1, 10, 7228, 9000000, 0, 0, 0, -235.673, 309.639, -47.5976, 4.74317, 0, 'Summon Ironaya'),
(124371, 27, 11, 14394, 9000000, 0, 0, 0, 0, 0, 0, 0, 0, 'Open the Seal of Khaz\'Mul'),
(124371, 28, 0, 1, 0, 7228, 100, 0, 0, 0, 0, 0, 2000000430, 'Ironaya yell'),
(124371, 28, 20, 2, 0, 7228, 100, 0, 0, 0, 0, 0, 0, 'Ironaya starts moving');
DELETE FROM db_script_string WHERE entry = 2000000430;
INSERT INTO db_script_string (entry, content_default,sound,type,language,emote,comment) VALUES
(2000000430, 'None may steal the secrets of the Makers!',5851,1,0,0,'Ironaya yell');
-- The 'Gni'kiv Medallion' and 'The Shaft of Tsol' -- 100% drop guarantee
-- Playes should be able to get to BOSS Ironaya - with or without quest!
DELETE FROM conditions WHERE condition_entry IN (15,31);
DELETE FROM gameobject_loot_template WHERE entry = 5066 AND item = 44012;
DELETE FROM reference_loot_template WHERE entry = 44012 AND item = 7740;
UPDATE creature_loot_template SET condition_id = 0 WHERE entry = 6910;
UPDATE gameobject_loot_template SET condition_id = 0 WHERE entry = 5066 AND item = 7740;
-- q.12716 'The Plaguebringer's Request'
DELETE FROM dbscripts_on_quest_end WHERE id = 12716;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(12716,0,0,0,0,0,0,0,2000000431,0,0,0,0,0,0,0,''),
(12716,1,15,52706,0,0,0,0,0,0,0,0,0,0,0,0,'');
UPDATE quest_template SET CompleteScript = 12716 WHERE entry = 12716;
DELETE FROM db_script_string WHERE entry = 2000000431;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, type, language, emote, comment) VALUES
(2000000431,'My task is done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL);
-- Plague Cauldron -- we can interact with object only after quest 12716
UPDATE gameobject_template SET flags = 36 WHERE entry = 190936;

-- Citizen of New Avalon -- wrong one taken for event
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 129755;
DELETE FROM creature_movement WHERE id = 129755;
 -- q.12723 'Behind Scarlet Lines'
-- Quest can be taken only after 3 quests finished 
UPDATE quest_template SET PrevQuestId = 12719, NextQuestId = 12723, ExclusiveGroup = -12720, NextQuestinChain = 12723 WHERE entry = 12720; -- How To Win Friends And Influence Enemies
UPDATE quest_template SET PrevQuestId = 12716, NextQuestId = 12723, ExclusiveGroup = -12720, NextQuestinChain = 12718 WHERE entry = 12717; -- Noth's Special Brew
UPDATE quest_template SET PrevQuestId = 12715, NextQuestId = 12723, ExclusiveGroup = -12720, NextQuestinChain = 12723 WHERE entry = 12722; -- Lambs To The Slaughter
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0 WHERE entry = 12723;
 -- Brothers In Death(q.12725) 
DELETE FROM dbscripts_on_quest_start WHERE id = 12725;
INSERT INTO dbscripts_on_quest_start (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(12725,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Thassarian active'),
(12725,1,0,0,0,28914,20,7,2000000432,0,0,0,0,0,0,0,'Orbaz - text'),
(12725,8,28,0,0,28914,20,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(12725,9,3,0,0,28914,20,7,0,0,0,0,0,0,0,3.00062,''),
(12725,11,0,0,0,28914,20,7,2000000433,0,0,0,0,0,0,0,'Orbaz - text'),
(12725,15,0,0,0,28914,20,7,2000000434,0,0,0,0,0,0,0,'Orbaz - text'),
(12725,18,3,0,0,0,0,0,0,0,0,0,0,0,0,0.0962126,''),
(12725,20,0,0,0,0,0,0,2000000435,0,0,0,0,0,0,0,''),
(12725,25,0,0,0,0,0,0,2000000436,0,0,0,0,0,0,0,''),
(12725,30,0,0,0,0,0,0,2000000437,0,0,0,0,0,0,0,''),
(12725,37,0,0,0,0,0,0,2000000438,0,0,0,0,0,0,0,''),
(12725,40,3,0,0,0,0,0,0,0,0,0,0,0,0,5.48033,''),
(12725,41,0,0,0,28914,20,7,2000000439,0,0,0,0,0,0,0,'Orbaz - text'),
(12725,44,3,0,0,28914,20,7,0,0,0,0,0,0,0,5.23599,''),
(12725,45,28,8,0,28914,20,7,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(12725,47,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Thassarian unactive');
UPDATE quest_template SET StartScript = 12725 WHERE entry = 12725;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000432 AND 2000000439;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000432,'Why do you care, Thassarian?',0,0,0,6,NULL),
(2000000433,'His weakness led to his capture.',0,0,0,1,NULL),
(2000000434,'Only the strong should survive. Not to mention...',0,0,0,1,NULL),
(2000000435,'What, Orbaz? That he\'s a blood elf?',0,0,0,6,NULL),
(2000000436,'In life we were hated enemies - this is true...',0,0,0,1,NULL),
(2000000437,'But in death... We are the children of the damned. The orphaned sons and daughters of the Scourge.',0,0,0,1,NULL),
(2000000438,'In death we are brothers.',0,0,0,1,NULL),
(2000000439,'To hell with you, Thassarian.',0,0,0,25,NULL);-- Bloody Breakout(q.12727) 
DELETE FROM dbscripts_on_quest_start WHERE id = 12727;
INSERT INTO dbscripts_on_quest_start (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(12727,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Koltira active'),
(12727,1,29,2,2,0,0,0,0,0,0,0,0,0,0,0,'quest flag removed'),
(12727,2,0,0,0,0,0,0,2000000440,0,0,0,0,0,0,0,''),
(12727,3,28,1,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_SIT'),
(12727,7,0,0,0,0,0,0,2000000441,0,0,0,0,0,0,0,''),
(12727,8,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(12727,10,3,0,0,0,0,0,0,0,0,0,1653.36,-6038.34,127.584,1.78556,''),  -- JumpGravity: 137.7387 (should jump here)
(12727,11,3,0,0,0,0,0,0,0,0,0,1653.94,-6034.72,127.584,1.29819,''), 
(12727,14,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(12727,15,0,0,0,29011,129877,7 | 0x10,2000000442,0,0,0,0,0,0,0,'Valroth - text'),
(12727,16,15,52899,0,0,0,0x04,0,0,0,0,0,0,0,0,''),
(12727,16,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(12727,18,3,0,0,0,0,0,0,0,0,0,1651.89,-6037.101,127.5844,3.839724,''),
(12727,18,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,19,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,19,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,20,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(12727,20,0,0,0,0,0,0,2000000443,0,0,0,0,0,0,0,''),
(12727,21,15,52894,0,0,0,0x04 | 0x08,0,0,0,0,0,0,0,0,''),
(12727,24,0,0,0,0,0,0,2000000444,0,0,0,0,0,0,0,''),
(12727,24,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(12727,64,0,0,0,0,0,0,2000000445,0,0,0,0,0,0,0,''),
(12727,65,0,0,0,29011,129877,7 | 0x10,2000000446,0,0,0,0,0,0,0,'Valroth - text'),
(12727,66,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,67,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,67,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,99,0,0,0,0,0,0,2000000447,0,0,0,0,0,0,0,''),
(12727,100,0,0,0,29011,129877,7 | 0x10,2000000448,0,0,0,0,0,0,0,'Valroth - text'),
(12727,101,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,102,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,102,10,29007,300000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon Crimson Acolyte'),
(12727,144,0,0,0,0,0,0,2000000449,0,0,0,0,0,0,0,''),
(12727,145,0,0,0,29011,129877,7 | 0x10,2000000450,0,0,0,0,0,0,0,'Valroth - text'),
(12727,146,10,29001,420000,0,0,0,0,0,0,0,1640.65,-6032.49,134.739,4.58821,'summon High Inquisitor Valroth');
UPDATE quest_template SET StartScript = 12727 WHERE entry = 12727;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000440 AND 2000000451;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000440,'Damn the Crusade! I think my ribs are broken and I might be bleeding internally.',0,0,0,1,NULL),
(2000000441,'I\'ll need to get my runeblade and armor... Just need a little more time.',0,0,0,0,NULL),
(2000000442,'Acolytes, chain them up! Prepare them for questioning!',0,1,0,0,NULL),
(2000000443,'I\'m still weak, but I think I can get an anti-magic barrier up. Stay inside it or you\'ll be destroyed by their spells.',0,0,0,0,NULL),
(2000000444,'Maintaining this barrier will require all of my concentration. Kill them all!',0,0,0,0,NULL),
(2000000445,'There are more comming. Defend yourself! Don\'t fall out of anti-magic field! They\'ll tear you apart without its protection!',0,0,0,0,NULL),
(2000000446,'Scourge filth! By the Light be cleansed!',0,1,0,0,NULL),
(2000000447,'I can\'t keep this barrier up much longer... Where is that coward?',0,0,0,0,NULL),
(2000000448,'The Crusade will purge your kind from this world!',0,1,0,0,NULL),
(2000000449,'The Hight Inquisitor comes! Be ready, death knight! Do not let him draw you out of the protective bounds of my anti-magic field! Kill him and take his head!',0,0,0,0,NULL),
(2000000450,'It seams that I\'ll need to deal with you myself. The HIgh Inquisitor comes for you, Scourge!',0,1,0,0,NULL),
(2000000451,'%s\'s remains fall on the ground.',0,3,0,0,NULL);
-- Crimson Acolyte
UPDATE creature_template SET MaxLevel = 55, MovementType = 2, Expansion = 0, UnitFlags = 33026, HealthMultiplier = 0.3124, MinLevelHealth = 633, MinLevelHealth = 653, MinLevelMana = 1020, MaxLevelMana = 1058 WHERE entry = 29007;
DELETE FROM creature_movement_template WHERE entry = 29007;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(29007,1,1640.65,-6032.49,134.739,2000,2900701,4.58821,0,0),
(29007,2,1647.06,-6043.39,127.583,10000,2900702,0.570896,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2900701,2900702); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2900701,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Valroth active'),
(2900701,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2900701,4,22,2103,0x01 | 0x08,0,0,0,0,0,0,0,0,0,0,0,'temp faction'), -- only flag is removed here
(2900702,1,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'wp pause');
-- High Inquisitor Valroth
UPDATE creature_template SET MovementType = 2, Expansion = 0, UnitFlags = 33026, HealthMultiplier = 3.7503, MinLevelMana = 6489, MaxLevelMana = 6489 WHERE entry = 29001;
DELETE FROM creature_movement_template WHERE entry = 29001;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(29001,1,1640.65,-6032.49,134.739,2000,2900101,4.58821,0,0),
(29001,2,1647.06,-6043.39,127.583,200000,0,0.570896,0,0),
(29001,3,1647.06,-6043.39,127.583,150000,2900102,0.570896,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2900101,2900102); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2900101,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Valroth active'),
(2900101,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2900101,5,22,2103,0x01 | 0x08,0,0,0,0,0,0,0,0,0,0,0,'temp faction'), -- only flag is removed here
(2900102,1,31,28912,100,0,0,0,0,0,0,0,0,0,0,0,''), -- check if source is still there
(2900102,2,15,5,0,28912,100,7,0,0,0,0,0,0,0,0,''),
(2900102,3,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'desp self');
DELETE FROM dbscripts_on_creature_death WHERE id = 29001;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(29001,0,0,0,0,0,0,0,2000000451,0,0,0,0,0,0,0,''),
(29001,0,15,52929,0,0,0,0,0,0,0,0,0,0,0,0,''),
(29001,1,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,''),
(29001,1,28,0,0,28912,50,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(29001,2,14,52894,0,28912,50,7,0,0,0,0,0,0,0,0,''),
(29001,3,20,2,0,28912,50,7,0,0,0,0,0,0,0,0,'movement chenged to 2:movement');
-- Koltira Deathweaver
UPDATE creature_template_addon SET b2_0_sheath = 0, auras = NULL WHERE entry = 28912;
UPDATE creature SET spawntimesecs = 60 WHERE guid = 130354;
UPDATE creature_template SET MovementType = 0, UnitFlags = 33282, ExtraFlags = 2 WHERE entry = 28912; -- movement 2 will be set by EVENT
DELETE FROM creature_movement_template WHERE entry = 28912;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(28912,1,1651.89,-6037.101,127.5844,18000,2891201,3.839724,0,0),
(28912,2,1640.65,-6032.49,134.739,0,0,0,0,0),
(28912,3,1639.1,-6028.1,134.739,0,0,2.67357,0,0),
(28912,4,1628.37,-6026.34,134.739,0,0,2.29266,0,0),
(28912,5,1625.79,-6021.81,134.739,0,0,1.41301,0,0),
(28912,6,1627.06,-6016.95,134.739,0,0,0.692014,0,0),
(28912,7,1639.85,-6015.64,134.748,0,0,0.0668366,0,0),
(28912,8,1648.06,-6013.66,133.24,0,0,0.82239,0,0),
(28912,9,1652.9,-5973.75,132.524,1000,2891202,1.51513,0,0),
(28912,10,1653.61,-5927.44,121.345,0,0,1.57404,0,0),
(28912,11,1656.07,-5905.5,116.21,0,0,1.14364,0,0),
(28912,12,1668.06,-5894.89,116.141,0,0,0.396723,0,0),
(28912,13,1694.23,-5882.54,116.138,6000,2891203,0.141469,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2891201,2891202,2891203); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2891201,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Koltira active'),
(2891201,1,0,0,0,0,0,0,2000000452,0,0,0,0,0,0,0,''),
(2891201,9,0,0,0,0,0,0,2000000453,0,0,0,0,0,0,0,''),
(2891201,15,0,0,0,0,0,0,2000000454,0,0,0,0,0,0,0,''),
(2891201,16,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2891202,1,24,25445,0,0,0,0x08,0,0,0,0,0,0,0,0,'mount'),
(2891203,0,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'quest flag added'),
(2891203,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Koltira unactive'),
(2891203,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,'unmount'),
(2891203,0,23,29011,0,0,0,0,0,0,0,0,0,0,0,0,'temp morph'),
(2891203,1,15,5,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2891203,2,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'desp');
DELETE FROM dbscripts_on_creature_death WHERE id = 28912;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(28912,1,23,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(28912,1,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'quest flag added'),
(28912,1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Koltira unactive');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000452 AND 2000000454;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000452,'The death of the High Inquisitor of New Avalon will not go unnoticed. You need to get out of here at once! Go, before more of them show up. I\'ll be fine on my own.',0,0,0,1,NULL),
(2000000453,'I\'ll draw their fire, you make your escape behind me.',0,0,0,1,NULL),
(2000000454,'Your High Inquisitor is nothing more than a pile of meat, Crusaders! There are none beyond the grasp of the Scourge!',0,1,0,1,NULL);-- ToC25 - Faction Champions
-- creature addons
DELETE FROM creature_template_addon WHERE entry IN (34450,34461,34460,34469,34467,34468,34465,34471,34466,34473,34472,34463,
34470,34474,34475,34458,34451,34459,34448,34449,34445,34456,34447,34441,34454,34455,34444,34453);
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, auras) VALUES
(34450, 0, 0x0, 0x1, '68595'),
(34461, 0, 0x0, 0x1, '68595'),
(34460, 0, 0x0, 0x1, '68595'),
(34469, 0, 0x0, 0x1, '68595'),
(34467, 0, 0x0, 0x1, '68595'),
(34468, 0, 0x0, 0x1, '68595'),
(34465, 0, 0x0, 0x1, '68595'),
(34471, 0, 0x0, 0x1, '68595'),
(34466, 0, 0x0, 0x1, '68595'),
(34473, 0, 0x0, 0x1, '68595'),
(34472, 0, 0x0, 0x1, '68595'),
(34463, 0, 0x0, 0x1, '68595'),
(34470, 0, 0x0, 0x1, '68595'),
(34474, 0, 0x0, 0x1, '68595'),
(34475, 0, 0x0, 0x1, '68595'),
(34458, 0, 0x0, 0x1, '68595'),
(34451, 0, 0x0, 0x1, '68595'),
(34459, 0, 0x0, 0x1, '68595'),
(34448, 0, 0x0, 0x1, '68595'),
(34449, 0, 0x0, 0x1, '68595'),
(34445, 0, 0x0, 0x1, '68595'),
(34456, 0, 0x0, 0x1, '68595'),
(34447, 0, 0x0, 0x1, '68595'),
(34441, 0, 0x0, 0x1, '68595'),
(34454, 0, 0x0, 0x1, '68595'),
(34444, 0, 0x0, 0x1, '68595'),
(34453, 0, 0x0, 0x1, '68595');
-- factions and flags
UPDATE creature_template SET FactionAlliance=16, FactionHorde=16, UnitFlags=320 WHERE entry IN (34450,34461,34460,34469,34467,34468,34465,34471,34466,34473,34472,34463,
34470,34474,34475,34458,34451,34459,34448,34449,34445,34456,34447,34441,34454,34455,34444,34453);
-- spawn masks
UPDATE creature SET spawnMask=15 WHERE map=649;
UPDATE gameobject SET spawnMask=15 WHERE id IN (195527,195647,195648,195649,195650,195485,195478,195479,195480,195481,195477,195486) AND map=649;
-- Fixed quests 7481 & 7482 (Elven Legends - Alliance / Horde)
-- Corrected for UDB req.
-- Thx to: @Cala
DELETE FROM dbscripts_on_gossip WHERE id IN (5743, 5744);
INSERT INTO dbscripts_on_gossip VALUES
(5743, 0, 7, 7482, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5743, 2, 3, 0, 0, 14368, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0.7, ''),
(5743, 4, 0, 0, 0, 14368, 20, 0, 2000000455, 0, 0, 0, 0, 0, 0, 0, ''),
(5743, 7, 0, 0, 0, 14368, 20, 0, 2000000456, 0, 0, 0, 0, 0, 0, 0, ''),
(5743, 13, 0, 0, 0, 14368, 20, 0, 2000000457, 0, 0, 0, 0, 0, 0, 0, ''),
(5743, 20, 3, 0, 0, 14368, 20, 0, 0, 0, 0, 0, 0, 0, 0, 3.07178, ''),
(5744, 0, 7, 7481, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5744, 2, 3, 0, 0, 14368, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0.7, ''),
(5744, 4, 0, 0, 0, 14368, 20, 0, 2000000455, 0, 0, 0, 0, 0, 0, 0, ''),
(5744, 7, 0, 0, 0, 14368, 20, 0, 2000000456, 0, 0, 0, 0, 0, 0, 0, ''),
(5744, 13, 0, 0, 0, 14368, 20, 0, 2000000457, 0, 0, 0, 0, 0, 0, 0, ''),
(5744, 20, 3, 0, 0, 14368, 20, 0, 0, 0, 0, 0, 0, 0, 0, 3.07178, '');

DELETE FROM db_script_string WHERE entry IN (2000000455, 2000000456, 2000000457);
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000455, 'I very much doubt that he will have anything to say, stranger...', 0, 0, 0, 1, NULL),
(2000000456, 'I personally didn\'t mind him. It was the Prince who took exception to a high elf in his domain. Alas, I am not one to question the Prince. In his defense, he did not incinerate Master Winthalus immediately.', 0, 0, 0, 1, NULL),
(2000000457, 'We most definitely do not need any more attention drawn to us, stranger. Return to those that sent you in search of the lost master and tell them that nothing could be found. When this is done - and I will know when it is so - return and I shall reveal the secrets of the deceased.', 0, 0, 0, 1, NULL);
-- Classic [0901]
-- Dire Maul: North - Carrion Swarmer were correctly added in Dire Maul.
DELETE FROM creature WHERE id = 13160;
DELETE FROM creature WHERE guid IN (128650,128651,128662,128663,128664,128665,128666,128667,128668,128669,128670,128671,128672,128673,128674,128675,128676,128677,128678,128679,128680,128681,128682,128683,128684,
128685,128686,128697,128698,128699,128700,128701,128702,128703,128704,128705,128706,128707,128708,128709,128710,128711,128712,128713,128714,128715,128716,128717,128718,128719);
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128650, 13160, 429, 0, 0, 532.7290, 535.45750, -25.31940, 4.485496, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128651, 13160, 429, 0, 0, 478.7725, 542.63710, -25.28667, 4.625123, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128662, 13160, 429, 0, 0, 506.4361, 541.64470, -25.30522, 4.555309, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128663, 13160, 429, 0, 0, 494.0698, 531.72560, -25.30895, 4.590216, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128664, 13160, 429, 0, 0, 512.3397, 556.75360, -25.31533, 4.537856, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128665, 13160, 429, 0, 0, 479.4313, 534.18290, -25.30033, 4.625123, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128666, 13160, 429, 0, 0, 520.4340, 531.47490, -25.31460, 4.520403, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128667, 13160, 429, 0, 0, 480.3777, 551.96770, -25.29888, 4.625123, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128668, 13160, 429, 0, 0, 522.0546, 543.64770, -25.31568, 4.520403, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128669, 13160, 429, 0, 0, 533.7919, 552.40670, -25.31940, 4.502949, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128670, 13160, 429, 0, 0, 462.8175, 251.53500, 8.8173770, 4.555309, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128671, 13160, 429, 0, 0, 449.7683, 243.47860, 11.297720, 4.660029, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128672, 13160, 429, 0, 0, 462.6022, 260.84490, 8.9096290, 4.572762, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128673, 13160, 429, 0, 0, 477.1857, 250.99920, 2.9512510, 4.433136, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128674, 13160, 429, 0, 0, 471.8947, 252.93710, 4.9657260, 4.485496, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128675, 13160, 429, 0, 0, 452.4716, 260.48950, 11.303170, 4.642576, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128676, 13160, 429, 0, 0, 448.1017, 251.62600, 11.296410, 4.677482, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128677, 13160, 429, 0, 0, 452.7207, 247.39500, 11.300130, 4.642576, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128678, 13160, 429, 0, 0, 455.3728, 253.91550, 11.303900, 4.625123, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128679, 13160, 429, 0, 0, 448.4704, 258.71660, 11.298890, 4.677482, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128680, 13160, 429, 0, 0, 474.5892, 316.70310, 2.9362390, 4.537856, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128681, 13160, 429, 0, 0, 467.4713, 316.58610, 2.9362500, 4.590216, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128682, 13160, 429, 0, 0, 483.9162, 328.99870, 2.9362550, 4.502949, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128683, 13160, 429, 0, 0, 494.2127, 319.36020, 2.9362270, 4.450590, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128684, 13160, 429, 0, 0, 490.8800, 329.76070, 2.9362490, 4.468043, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128685, 13160, 429, 0, 0, 471.9471, 324.63260, 2.9362590, 4.572762, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128686, 13160, 429, 0, 0, 485.1870, 320.71150, 2.9362340, 4.485496, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128697, 13160, 429, 0, 0, 478.2815, 324.03800, 2.9362510, 4.537856, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128698, 13160, 429, 0, 0, 486.4880, 313.60010, 2.9362180, 4.485496, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128699, 13160, 429, 0, 0, 493.1786, 309.85220, 2.9362050, 4.433136, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128700, 13160, 429, 0, 0, 396.8296, -98.32212, -3.803594, 1.378810, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128701, 13160, 429, 0, 0, 400.0482, -105.0312, -3.803111, 1.396263, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128702, 13160, 429, 0, 0, 403.6488, -110.2321, -3.802753, 1.413717, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128703, 13160, 429, 0, 0, 414.9770, -98.74563, -3.803658, 1.448623, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128704, 13160, 429, 0, 0, 414.4864, -108.6242, -3.802916, 1.448623, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128705, 13160, 429, 0, 0, 427.6517, -100.8249, -3.803568, 1.500983, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128706, 13160, 429, 0, 0, 424.8745, -110.3578, -3.802841, 1.500983, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128707, 13160, 429, 0, 0, 437.5299, -108.4350, -3.803006, 1.553343, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128708, 13160, 429, 0, 0, 445.7453, -113.9387, -3.802556, 1.570796, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128709, 13160, 429, 0, 0, 444.6700, -99.75545, -3.803718, 1.570796, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128710, 13160, 429, 0, 0, 460.2359, -68.97313, -3.803645, 1.500983, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128711, 13160, 429, 0, 0, 456.6826, -57.28893, -4.253410, 1.500983, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128712, 13160, 429, 0, 0, 464.6496, -53.98102, -3.803182, 1.553343, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128713, 13160, 429, 0, 0, 470.4993, -60.37534, -3.802882, 1.570796, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128714, 13160, 429, 0, 0, 470.6470, -70.00087, -3.802982, 1.570796, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128715, 13160, 429, 0, 0, 471.2401, -46.80048, -3.802765, 1.710423, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128716, 13160, 429, 0, 0, 461.8682, -40.83654, -3.803358, 1.658063, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128717, 13160, 429, 0, 0, 472.6571, -33.71276, -3.802353, 1.727876, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128718, 13160, 429, 0, 0, 460.3629, -24.53695, -3.803384, 1.658063, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1),
(128719, 13160, 429, 0, 0, 473.4761, -22.86045, -3.801760, 1.745329, 7200, 2, 0, (SELECT MaxLevelHealth FROM creature_template WHERE entry = 13160), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 13160), 0, 1);

-- Classic [0900]
-- Dire Maul: North was finally populated by Gordok Reavers.
DELETE FROM creature WHERE guid = 134876; -- Gordok Captain being replaced by Reaver. Should be pooled properly, but addition to the system are needed.
DELETE FROM creature WHERE id = 11450;
DELETE FROM creature WHERE guid IN (52150,128636,128637,128638,128639,128640,128641,128642,128643,128644,128645,128646,128647,128648,128649);
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(52150, 11450, 429, 0, 0, 387.4085, 462.7724, -7.148942, 2.6878070, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128636, 11450, 429, 0, 0, 419.0150, 538.2688, -18.26003, 0.4886922, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128637, 11450, 429, 0, 0, 530.1689, 580.4394, -25.31940, 1.4137170, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128638, 11450, 429, 0, 0, 530.2059, 600.8753, -25.31940, 4.8694690, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128639, 11450, 429, 0, 0, 593.2279, 565.1199, -4.671438, 3.1066860, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128640, 11450, 429, 0, 0, 484.1014, 523.8082, 27.997650, 1.4486230, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128641, 11450, 429, 0, 0, 497.7333, 523.8073, 27.998240, 1.6406100, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128642, 11450, 429, 0, 0, 480.2641, 558.1676, 27.995270, 1.8500490, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128643, 11450, 429, 0, 0, 485.1412, 564.9458, 27.995090, 3.2114060, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128644, 11450, 429, 0, 0, 565.9363, 486.7255, 29.547450, 4.2586040, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128645, 11450, 429, 0, 0, 559.2202, 477.3137, 29.547450, 0.8552113, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128646, 11450, 429, 0, 0, 688.4595, 505.9162, 29.552950, 2.3038350, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128647, 11450, 429, 0, 0, 541.6950, 582.7410, -4.671440, 5.6723200, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128648, 11450, 429, 0, 0, 522.9580, 554.5040, 28.000600, 2.1991100, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0),
(128649, 11450, 429, 0, 0, 748.4830, 433.1610, 28.266480, 3.5604720, 7200, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry = 11450), (SELECT MaxLevelMana FROM creature_template WHERE Entry = 11450), 0, 0);

-- Classic [0899]
-- Fixed Traps should be of the same size as Broken Traps.
UPDATE gameobject_template SET size = 3 WHERE entry = 179512;

-- Classic [0897]
-- Dire Maul: North -- UPDATES
UPDATE creature_template SET FactionAlliance = 190, FactionHorde = 190 WHERE Entry = 2914; -- Snake
UPDATE creature_template SET FactionAlliance = 31, FactionHorde = 31 WHERE Entry = 4075; -- Rat
UPDATE creature_template SET FactionAlliance = 188, FactionHorde = 188 WHERE Entry = 4076; -- Roach
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 11441; -- Gordok Brute
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 11444; -- Gordok Mage-Lord
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 13036; -- Gordok Mastiff
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 11448; -- Gordok Warlock
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 11450; -- Gordok Reaver
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 11445; -- Gordok Captain
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 11446; -- Gordok Spirit
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 14351; -- Gordok Bushwacker
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 14385; -- Doomguard Minion
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 14386; -- Wandering Eye of Kilrogg
UPDATE creature_template SET FactionAlliance = 14, FactionHorde = 14 WHERE Entry = 13160; -- Carrion Swarmer
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 14322; -- Stomper Kreeg <The Drunk>
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 14326; -- Guard Moldar
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 14321; -- Guard Fengus
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 14323; -- Guard Slipkik
UPDATE creature_template SET FactionAlliance = 1374, FactionHorde = 1374 WHERE Entry = 14325; -- Captain Kromcrush
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 14324; -- ChoRush the Observer
UPDATE creature_template SET FactionAlliance = 45, FactionHorde = 45 WHERE Entry = 11501; -- King Gordok
UPDATE creature_template SET FactionAlliance = 35, FactionHorde = 35 WHERE Entry = 14338; -- Knot Thimblejack
UPDATE creature_template SET FactionAlliance = 35, FactionHorde = 35 WHERE Entry = 14353; -- Mizzle the Crafty
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 2914; -- Snake
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 4075; -- Rat
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 4076; -- Roach
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11441; -- Gordok Brute
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11444; -- Gordok Mage-Lord
UPDATE creature_template SET MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 13036; -- Gordok Mastiff
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11448; -- Gordok Warlock
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11450; -- Gordok Reaver
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11445; -- Gordok Captain
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11446; -- Gordok Spirit
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14351; -- Gordok Bushwacker
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14385; -- Doomguard Minion
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14386; -- Wandering Eye of Kilrogg
UPDATE creature_template SET MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 13160; -- Carrion Swarmer
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14322; -- Stomper Kreeg <The Drunk>
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14326; -- Guard Moldar
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14321; -- Guard Fengus
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14323; -- Guard Slipkik
UPDATE creature_template SET MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 14325; -- Captain Kromcrush
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14324; -- ChoRush the Observer
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11501; -- King Gordok
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14338; -- Knot Thimblejack
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14353; -- Mizzle the Crafty

-- Classic [0896]
-- Badlands - Quest: Disharmony of Fire should not be available if you didn't complete 'Disharmony of Flame'.
UPDATE quest_template SET PrevQuestId = 3906 WHERE entry = 3907;

-- Classic [0894]
-- BRD - Thunderbrew Lager Kegs are now spawned correctly.
DELETE FROM gameobject WHERE id = 164911;
DELETE FROM gameobject WHERE guid IN (66158,66161,66163);
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(66158, 164911, 230, 914.3752, -146.9912, -49.75655, 0, 0, 0, -0.9636297, 0.2672410, 604800, 100, 1),
(66161, 164911, 230, 915.7144, -149.2887, -49.75705, 0, 0, 0, -0.9681473, 0.2503814, 604800, 100, 1),
(66163, 164911, 230, 917.0272, -151.5825, -49.75756, 0, 0, 0, -0.9681473, 0.2503814, 604800, 100, 1);

-- Classic [0893]
-- Fixed quest text of quest 348 (Stranglethorn Fever) because it was obviously manually added and wrong
UPDATE quest_template SET Objectives = 'Sick...so...very s-s-sick....$b$b...have contracted Stranglethorn Fever...deadly v-v-virus...$b$b...only cure...is...is...to eat the heart of M-m-m-m-mokk the Savage...elusive white beast...$b$b...Witch doctor Unbagwa...only one who can s-s-summon....$b$b...seek Unbagwa in hidden cave on southern cape...$b$b...hurry...dying...dying....' WHERE entry = 348;

-- Classic [0890]
-- Felvine Shards are not available until you kill Alzzin and were slighty off position.
DELETE FROM gameobject WHERE id = 179559;
DELETE FROM gameobject WHERE guid IN (66151,66153,66154,66155,66157);
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(66151, 179559, 429, 275.8198, -424.0976, -119.9618, 0, 0, 0, -0.8241262, 0.56640610, -604800, 0, 1),
(66153, 179559, 429, 274.3399, -424.0255, -119.9618, 0, 0, 0, 0.30901620, 0.95105680, -604800, 0, 1),
(66154, 179559, 429, 275.1532, -424.8906, -119.9618, 0, 0, 0, -0.6494474, 0.76040640, -604800, 0, 1),
(66155, 179559, 429, 275.2957, -423.4662, -119.9618, 0, 0, 0, -0.9816265, 0.19081240, -604800, 0, 1),
(66157, 179559, 429, 275.3406, -422.5365, -119.9618, 0, 0, 0, 0.98325440, 0.18223800, -604800, 0, 1);

-- Classic [0889]
-- Fixed NPC 9198 (Spirestone Mystics) who were skinnable though being humanoids
UPDATE creature_template SET SkinningLootId = 0 WHERE Entry = 9198;
DELETE FROM skinning_loot_template WHERE entry = 9198;

-- Classic [0888]
-- Linked NPCs 15542 (Twilight Marauder) and NPC 15541 (Twilight Marauder Morna): they will now engage with their master and respawn with her
-- Set Run speed for creatures 15542 and 15541
-- Adjust spawn time (4 minutes for master, followers are linked)
-- Fixed model of NPC 15542 which had wrong alternate model similar to NPC 15541
DELETE FROM creature_linking_template WHERE entry = 15542;
INSERT INTO creature_linking_template VALUES
(15542, 1, 15541, 1 + 2 + 128 + 8192, 0);
UPDATE creature SET spawntimesecs = 4 * 60 WHERE id = 15541;
UPDATE creature SET spawntimesecs = 4 * 60 WHERE id = 15542;
UPDATE creature_model_info SET modelid_other_gender = 0 WHERE modelid = 15552;
DELETE FROM dbscripts_on_creature_movement WHERE id = 1554101;
INSERT INTO dbscripts_on_creature_movement VALUES
(1554101, 2, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'RUN ON - Twilight Marauder Morna'),
(1554101, 1, 25, 1, 0, 15542, 43202, 0x10, 0, 0, 0, 0, 0, 0, 0, 0, 'RUN ON - Twilight Marauder 1'),
(1554101, 0, 25, 1, 0, 15542, 43203, 0x10, 0, 0, 0, 0, 0, 0, 0, 0, 'RUN ON - Twilight Marauder 2');
DELETE FROM creature_movement WHERE id = (SELECT guid FROM creature WHERE id = 15541);
DELETE FROM creature_movement_template WHERE entry = 15541;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(15541, 1, -6381.83, 522.263, 6.33608, 0, 0, 4.08546, 0, 0),(15541, 2, -6388.62, 511.913, 6.40844, 0, 1554101, 4.11295, 0, 0),(15541, 3, -6396.02, 501.126, 5.96868, 0, 0, 3.97158, 0, 0),
(15541, 4, -6403.3, 493.654, 4.30304, 0, 0, 3.94409, 0, 0),(15541, 5, -6408.62, 486.992, 2.68521, 0, 0, 4.04619, 0, 0),(15541, 6, -6414.09, 479.644, 0.827286, 0, 0, 4.28181, 0, 0),
(15541, 7, -6415.84, 474.03, -1.00684, 0, 0, 4.43889, 0, 0),(15541, 8, -6418.49, 464.595, 0.523592, 0, 0, 4.43889, 0, 0),(15541, 9, -6418.49, 464.595, 0.523592, 0, 0, 4.44674, 0, 0),
(15541, 10, -6425.01, 441.027, 2.01444, 0, 0, 4.39962, 0, 0),(15541, 11, -6430.5, 429.614, 2.89218, 0, 0, 4.00299, 0, 0),(15541, 12, -6434.42, 425.346, 3.12233, 0, 0, 3.89696, 0, 0),
(15541, 13, -6452.57, 408.975, 3.49116, 0, 0, 3.93231, 0, 0),(15541, 14, -6469.84, 391.597, 2.38939, 0, 0, 3.92053, 0, 0),(15541, 15, -6471.76, 389.704, 2.10586, 0, 0, 3.73596, 0, 0),
(15541, 16, -6471.76, 389.704, 2.10586, 0, 0, 3.73596, 0, 0),(15541, 17, -6499.13, 374.662, 2.13876, 0, 0, 3.4807, 0, 0),(15541, 18, -6501.03, 373.994, 2.01011, 0, 0, 2.44005, 0, 0),
(15541, 19, -6527.96, 388.841, 4.81061, 0, 0, 3.46107, 0, 0),(15541, 20, -6530.47, 388.01, 4.49237, 0, 0, 4.31322, 0, 0),(15541, 21, -6541.67, 369.928, 1.47049, 0, 0, 3.79879, 0, 0),
(15541, 22, -6544.27, 367.978, 1.26933, 0, 0, 3.7281, 0, 0),(15541, 23, -6544.27, 367.978, 1.26933, 0, 0, 3.7281, 0, 0),(15541, 24, -6568.99, 350.006, 3.62838, 0, 0, 4.07368, 0, 0),
(15541, 25, -6581.04, 334.773, 0.99317, 0, 0, 3.93623, 0, 0),(15541, 26, -6581.04, 334.773, 0.99317, 0, 0, 3.95979, 0, 0),(15541, 27, -6581.04, 334.773, 0.99317, 0, 0, 3.95979, 0, 0),
(15541, 28, -6604.63, 310.711, 3.49995, 0, 0, 3.68883, 0, 0),(15541, 29, -6608.37, 309.531, 3.46286, 0, 0, 3.35896, 0, 0),(15541, 30, -6623.45, 305.414, 3.13978, 0, 0, 3.7281, 0, 0),
(15541, 31, -6634.63, 297.475, 3.05937, 0, 0, 3.91267, 0, 0),(15541, 32, -6640.44, 291.236, 2.59651, 0, 0, 3.97943, 0, 0),(15541, 33, -6649.03, 282.408, 2.2899, 0, 0, 3.84984, 0, 0),
(15541, 34, -6660.82, 271.363, 4.43145, 0, 0, 3.96372, 0, 0),(15541, 35, -6660.82, 271.363, 4.43145, 0, 0, 3.96372, 0, 0),(15541, 36, -6677.3, 253.233, 3.84925, 0, 0, 3.99121, 0, 0),
(15541, 37, -6695.4, 233.018, 2.69341, 0, 0, 3.80664, 0, 0),(15541, 38, -6708.32, 223.081, 2.06455, 0, 0, 4.01085, 0, 0),(15541, 39, -6720.52, 207.81, 2.13145, 0, 0, 4.13651, 0, 0),
(15541, 40, -6728.84, 193.182, 3.85769, 0, 0, 4.59204, 0, 0),(15541, 41, -6729.12, 189.274, 3.89565, 0, 0, 4.55669, 0, 0),(15541, 42, -6733.38, 165.157, 2.50309, 0, 0, 4.59204, 0, 0),
(15541, 43, -6733.73, 161.548, 2.26791, 0, 0, 4.72555, 0, 0),(15541, 44, -6733.41, 137.063, 4.09396, 0, 0, 4.72555, 0, 0),(15541, 45, -6740.68, 126.034, 4.11355, 0, 0, 3.91267, 0, 0),
(15541, 46, -6752.78, 121.21, 2.5664, 0, 0, 3.49641, 0, 0),(15541, 47, -6763.03, 119.278, 1.11022, 0, 0, 3.44536, 0, 0),(15541, 48, -6770.36, 116.385, 0.736461, 0, 0, 3.69668, 0, 0),
(15541, 49, -6786.8, 109.532, 4.10522, 0, 0, 3.1901, 0, 0),(15541, 50, -6786.8, 109.532, 4.10522, 0, 0, 2.01986, 0, 0),(15541, 51, -6798.34, 133.72, 3.8605, 0, 0, 2.01593, 0, 0),
(15541, 52, -6803.13, 143.68, 3.29543, 0, 0, 1.83136, 0, 0),(15541, 53, -6806.7, 156.926, 1.91714, 0, 0, 1.93739, 0, 0),(15541, 54, -6809.22, 162.987, 1.34973, 0, 0, 2.29082, 0, 0),
(15541, 55, -6822.97, 177.835, 0.423451, 0, 0, 2.41648, 0, 0),(15541, 56, -6830.98, 184.459, 1.24963, 0, 0, 2.41256, 0, 0),(15541, 57, -6847.84, 202.184, 3.13678, 0, 0, 2.31831, 0, 0),
(15541, 58, -6853.92, 213.165, 2.3177, 0, 0, 2.03164, 0, 0),(15541, 59, -6853.92, 213.165, 2.3177, 0, 0, 2.03164, 0, 0),(15541, 60, -6862.69, 230.697, 0.189849, 0, 0, 2.13374, 0, 0),
(15541, 61, -6875.76, 248.494, 0.714978, 0, 0, 2.35365, 0, 0),(15541, 62, -6886.87, 260.405, 3.01083, 0, 0, 2.10625, 0, 0),(15541, 63, -6890.23, 268.041, 3.75853, 0, 0, 1.66643, 0, 0),
(15541, 64, -6891.84, 282.321, 3.93235, 0, 0, 1.851, 0, 0),(15541, 65, -6898.99, 305.754, 3.84856, 0, 0, 1.86671, 0, 0),(15541, 66, -6908.82, 323.496, 3.55015, 0, 0, 2.41256, 0, 0),
(15541, 67, -6908.82, 323.496, 3.55015, 0, 0, 2.53429, 0, 0),(15541, 68, -6928.57, 337.92, 3.2281, 0, 0, 2.47932, 0, 0),(15541, 69, -6937.24, 345.285, 4.01963, 0, 0, 2.33794, 0, 0),
(15541, 70, -6951.84, 361.005, 5.90094, 0, 0, 2.23584, 0, 0),(15541, 71, -6964.7, 382.142, 5.41806, 0, 0, 2.00022, 0, 0),(15541, 72, -6968.47, 401.663, 3.03619, 0, 0, 1.55255, 0, 0),
(15541, 73, -6968.47, 401.663, 3.03619, 0, 0, 1.62716, 0, 0),(15541, 74, -6970.83, 418.38, 5.32879, 0, 0, 2.012, 0, 0),(15541, 75, -6981.98, 440.13, 8.42832, 0, 0, 1.97666, 0, 0),
(15541, 76, -6983.44, 444.071, 8.45617, 0, 0, 1.87063, 0, 0),(15541, 77, -6994.07, 473.436, 8.02054, 0, 0, 2.41648, 0, 0),(15541, 78, -7006.97, 484.434, 5.74935, 0, 0, 1.77638, 0, 0),
(15541, 79, -7008.14, 488.174, 6.09104, 0, 0, 1.87456, 0, 0),(15541, 80, -7010.18, 493.008, 8.48791, 0, 0, 1.96881, 0, 0),(15541, 81, -7014.82, 499.297, 9.05018, 0, 0, 2.45968, 0, 0),
(15541, 82, -7024.9, 503.993, 8.78707, 0, 0, 4.12472, 0, 0),(15541, 83, -7024.9, 503.993, 8.78707, 0, 0, 4.19934, 0, 0),(15541, 84, -7035.93, 484.679, 9.25159, 0, 0, 4.06975, 0, 0),
(15541, 85, -7054.55, 463.783, 9.08453, 0, 0, 3.25686, 0, 0),(15541, 86, -7059.05, 460.609, 8.44962, 0, 0, 4.39569, 0, 0),(15541, 87, -7059.05, 460.609, 8.44962, 0, 0, 4.39569, 0, 0),
(15541, 88, -7066.06, 434.783, 8.65003, 0, 0, 4.21112, 0, 0),(15541, 89, -7076.38, 423.931, 8.2561, 0, 0, 3.85376, 0, 0),(15541, 90, -7083.91, 418.745, 7.81772, 0, 0, 3.08407, 0, 0),
(15541, 91, -7090.38, 419.532, 6.20053, 0, 0, 2.91521, 0, 0),(15541, 92, -7094.1, 423.171, 6.0317, 0, 0, 2.17694, 0, 0),(15541, 93, -7103.52, 439.507, 5.07884, 0, 0, 1.92168, 0, 0),
(15541, 94, -7106.42, 449.528, 5.01998, 0, 0, 1.83922, 0, 0),(15541, 95, -7112.86, 467.14, 6.73329, 0, 0, 2.08662, 0, 0),(15541, 96, -7112.86, 467.14, 6.73329, 0, 0, 2.08662, 0, 0),
(15541, 97, -7125.08, 487.981, 3.37296, 0, 0, 2.14552, 0, 0),(15541, 98, -7125.08, 487.981, 3.37296, 0, 0, 2.14552, 0, 0),(15541, 99, -7138.8, 508.267, 3.89067, 0, 0, 2.19657, 0, 0),
(15541, 100, -7138.8, 508.267, 3.89067, 0, 0, 2.19657, 0, 0),(15541, 101, -7138.8, 508.267, 3.89067, 0, 0, 2.19657, 0, 0),(15541, 102, -7152.07, 526.486, 7.64068, 0, 0, 2.3026, 0, 0),
(15541, 103, -7152.07, 526.486, 7.64068, 0, 0, 2.3026, 0, 0),(15541, 104, -7169.3, 543.895, 4.61447, 0, 0, 2.38114, 0, 0),(15541, 105, -7169.3, 543.895, 4.61447, 0, 0, 2.38114, 0, 0),
(15541, 106, -7195.62, 568.831, 4.7267, 0, 0, 2.49895, 0, 0),(15541, 107, -7204.96, 574.829, 3.99974, 0, 0, 2.78169, 0, 0),(15541, 108, -7215.56, 577.951, 2.85007, 0, 0, 3.04087, 0, 0),
(15541, 109, -7215.56, 577.951, 2.85007, 0, 0, 3.04087, 0, 0),(15541, 110, -7215.56, 577.951, 2.85007, 0, 0, 3.04087, 0, 0),(15541, 111, -7250.56, 582.17, 4.64078, 0, 0, 2.87201, 0, 0),
(15541, 112, -7263.12, 585.77, 3.49723, 0, 0, 2.96234, 0, 0),(15541, 113, -7263.12, 585.77, 3.49723, 0, 0, 2.96234, 0, 0),(15541, 114, -7291.6, 592.721, 0.04386, 0, 0, 2.68745, 0, 0),
(15541, 115, -7296.71, 595.531, 0.542263, 0, 0, 2.58142, 0, 0),(15541, 116, -7296.71, 595.531, 0.542263, 0, 0, 2.58142, 0, 0),(15541, 117, -7321.67, 613.23, 1.97044, 0, 0, 2.67174, 0, 0),
(15541, 118, -7323.46, 614.139, 1.88293, 0, 0, 1.96488, 0, 0),(15541, 119, -7323.46, 614.139, 1.88293, 0, 0, 1.96488, 0, 0),(15541, 120, -7335.5, 645.596, -0.95606, 0, 0, 1.5604, 0, 0),
(15541, 121, -7335.5, 645.596, -0.95606, 0, 0, 1.5604, 0, 0),(15541, 122, -7335.02, 670.041, 2.23719, 0, 0, 1.62323, 0, 0),(15541, 123, -7335.76, 680.791, 2.78817, 0, 0, 1.76068, 0, 0),
(15541, 124, -7339.75, 697.307, 2.04653, 0, 0, 1.8667, 0, 0),(15541, 125, -7340.77, 700.481, 1.524, 0, 0, 1.98844, 0, 0),(15541, 126, -7340.77, 700.481, 1.524, 0, 0, 1.98844, 0, 0),
(15541, 127, -7349.28, 720.233, 1.48185, 0, 0, 1.87849, 0, 0),(15541, 128, -7355.21, 742.987, 4.43733, 0, 0, 1.72533, 0, 0),(15541, 129, -7355.21, 742.987, 4.43733, 0, 0, 1.72533, 0, 0),
(15541, 130, -7358.45, 767.271, 3.88032, 0, 0, 1.69784, 0, 0),(15541, 131, -7359.12, 772.767, 3.10525, 0, 0, 1.62323, 0, 0),(15541, 132, -7359.12, 772.767, 3.10525, 0, 0, 1.62323, 0, 0),
(15541, 133, -7360.41, 797.233, 2.03258, 0, 0, 1.62716, 0, 0),(15541, 134, -7360.41, 797.233, 2.03258, 0, 0, 1.62716, 0, 0),(15541, 135, -7364.25, 832.479, 6.24249, 0, 0, 1.32871, 0, 0),
(15541, 136, -7364.25, 832.479, 6.24249, 0, 0, 1.32871, 0, 0),(15541, 137, -7359.69, 852.841, 5.61188, 0, 0, 1.48579, 0, 0),(15541, 138, -7359.75, 868.507, 4.5219, 0, 0, 1.78424, 0, 0),
(15541, 139, -7364.21, 879.221, 3.08032, 0, 0, 2.38114, 0, 0),(15541, 140, -7369.78, 884.806, 2.19951, 0, 0, 2.25155, 0, 0),(15541, 141, -7379.47, 897.887, 1.88811, 0, 0, 2.13767, 0, 0),
(15541, 142, -7385.87, 909.284, 1.4183, 0, 0, 2.01986, 0, 0),(15541, 143, -7385.87, 909.284, 1.4183, 0, 0, 1.92561, 0, 0),(15541, 144, -7385.87, 909.284, 1.4183, 0, 0, 1.92561, 0, 0),
(15541, 145, -7394.29, 932.24, 3.78666, 0, 0, 1.92168, 0, 0),(15541, 146, -7401.88, 952.018, 4.22339, 0, 0, 2.03949, 0, 0),(15541, 147, -7408.17, 962.726, 3.8838, 0, 0, 2.26333, 0, 0),
(15541, 148, -7419.52, 973.376, 3.74543, 0, 0, 2.58927, 0, 0),(15541, 149, -7419.52, 973.376, 3.74543, 0, 0, 2.58927, 0, 0),(15541, 150, -7440.39, 985.459, 3.41013, 0, 0, 2.70708, 0, 0),
(15541, 151, -7463.75, 996.742, 3.0073, 0, 0, 2.55393, 0, 0),(15541, 152, -7463.75, 996.742, 3.0073, 0, 0, 2.55393, 0, 0),(15541, 153, -7482.49, 1008.83, 1.90533, 0, 0, 2.82096, 0, 0),
(15541, 154, -7500.16, 1012.46, 2.21159, 0, 0, 3.20188, 0, 0),(15541, 155, -7507.99, 1011.99, 2.44511, 0, 0, 3.58673, 0, 0),(15541, 156, -7529.33, 1002.12, 1.56887, 0, 0, 3.41001, 0, 0),
(15541, 157, -7542.13, 999.824, 2.58838, 0, 0, 3.20188, 0, 0),(15541, 158, -7562.8, 1001.46, 2.63714, 0, 0, 2.91521, 0, 0),(15541, 159, -7562.8, 1001.46, 2.63714, 0, 0, 2.61676, 0, 0),
(15541, 160, -7562.8, 1001.46, 2.63714, 0, 0, 2.61676, 0, 0),(15541, 161, -7591.28, 1015.61, 3.19717, 0, 0, 2.99375, 0, 0),(15541, 162, -7591.28, 1015.61, 3.19717, 0, 0, 2.32224, 0, 0),
(15541, 163, -7607.47, 1031.64, 5.29972, 0, 0, 2.57749, 0, 0),(15541, 164, -7614.83, 1035.81, 4.79784, 0, 0, 2.8406, 0, 0),(15541, 165, -7624.34, 1038.39, 4.65626, 0, 0, 2.8838, 0, 0),
(15541, 166, -7643.9, 1043.74, 4.92598, 0, 0, 2.77777, 0, 0),(15541, 167, -7661.32, 1052.34, 4.82357, 0, 0, 2.53037, 0, 0),(15541, 168, -7661.32, 1052.34, 4.82357, 0, 0, 2.33402, 0, 0),
(15541, 169, -7678.65, 1069.65, 3.93121, 0, 0, 2.40863, 0, 0),(15541, 170, -7691.84, 1080.81, 3.53004, 0, 0, 2.51859, 0, 0),(15541, 171, -7696.62, 1084.24, 3.41852, 0, 0, 2.48717, 0, 0),
(15541, 172, -7708.09, 1093.96, 2.98749, 0, 0, 2.36151, 0, 0),(15541, 173, -7718.06, 1105.22, 2.59431, 0, 0, 2.2594, 0, 0),(15541, 174, -7733.52, 1124.22, 1.73916, 0, 0, 2.23977, 0, 0),
(15541, 175, -7741.22, 1134.37, 1.33201, 0, 0, 2.05127, 0, 0),(15541, 176, -7751.82, 1156.45, 0.576632, 0, 0, 2.00808, 0, 0),(15541, 177, -7762.49, 1178.51, -0.154873, 0, 0, 2.02771, 0, 0),
(15541, 178, -7762.49, 1178.51, -0.154873, 0, 0, 2.02771, 0, 0),(15541, 179, -7773.03, 1200.62, -1.26206, 0, 0, 2.00808, 0, 0),(15541, 180, -7783.37, 1222.83, -3.7369, 0, 0, 2.00022, 0, 0),
(15541, 181, -7793.09, 1245.32, -6.71451, 0, 0, 1.98451, 0, 0),(15541, 182, -7800.12, 1259.61, -9.0872, 0, 0, 2.09447, 0, 0),(15541, 183, -7806.61, 1270.22, -10.4451, 0, 0, 1.48971, 0, 0),
(15541, 184, -7802.96, 1289.36, -8.34551, 0, 0, 1.26195, 0, 0),(15541, 185, -7802.96, 1289.36, -8.34551, 0, 0, 1.26195, 0, 0),(15541, 186, -7795.69, 1314.38, -5.09394, 0, 0, 2.36151, 0, 0),
(15541, 187, -7810.15, 1326.26, -7.40606, 0, 0, 2.9859, 0, 0),(15541, 188, -7822.73, 1319.24, -10.681, 0, 0, 4.29751, 0, 0),(15541, 189, -7826.93, 1308.33, -10.038, 0, 0, 4.40354, 0, 0),
(15541, 190, -7828.93, 1298.77, -9.55642, 0, 0, 4.74519, 0, 0),(15541, 191, -7826.23, 1286.24, -11.5585, 0, 0, 5.23606, 0, 0),(15541, 192, -7826.23, 1286.24, -11.5585, 0, 0, 5.42063, 0, 0),
(15541, 193, -7826.23, 1286.24, -11.5585, 0, 0, 5.42063, 0, 0),(15541, 194, -7803.98, 1261.54, -9.61223, 0, 0, 5.33816, 0, 0),(15541, 195, -7798.21, 1252.14, -7.91404, 0, 0, 5.23606, 0, 0),
(15541, 196, -7786.57, 1230.64, -4.86232, 0, 0, 5.15752, 0, 0),(15541, 197, -7776.76, 1208.36, -1.91932, 0, 0, 5.10254, 0, 0),(15541, 198, -7776.76, 1208.36, -1.91932, 0, 0, 5.10254, 0, 0),
(15541, 199, -7767.4, 1185.77, -0.426412, 0, 0, 5.1261, 0, 0),(15541, 200, -7751.14, 1153.63, 0.568985, 0, 0, 5.29889, 0, 0),(15541, 201, -7742.45, 1142.21, 0.981252, 0, 0, 5.40492, 0, 0),
(15541, 202, -7726.66, 1123.48, 1.76707, 0, 0, 5.42848, 0, 0),(15541, 203, -7726.66, 1123.48, 1.76707, 0, 0, 5.42848, 0, 0),(15541, 204, -7710.6, 1105.02, 2.66458, 0, 0, 5.43241, 0, 0),
(15541, 205, -7694.26, 1086.76, 3.33483, 0, 0, 5.45204, 0, 0),(15541, 206, -7677.74, 1068.78, 3.94982, 0, 0, 5.48346, 0, 0),(15541, 207, -7659.43, 1052.14, 4.91582, 0, 0, 5.75049, 0, 0),
(15541, 208, -7649.08, 1046.71, 4.95878, 0, 0, 6.04109, 0, 0),(15541, 209, -7649.08, 1046.71, 4.95878, 0, 0, 6.04109, 0, 0),(15541, 210, -7625.01, 1042.15, 4.46894, 0, 0, 6.10392, 0, 0),
(15541, 211, -7603.3, 1040.11, 4.48228, 0, 0, 0.005301, 0, 0),(15541, 212, -7579.12, 1039.98, 3.99961, 0, 0, 6.17853, 0, 0),(15541, 213, -7579.12, 1039.98, 3.99961, 0, 0, 6.17853, 0, 0),
(15541, 214, -7554.95, 1036.01, 3.35316, 0, 0, 6.09999, 0, 0),(15541, 215, -7530.86, 1031.55, 2.74821, 0, 0, 6.09999, 0, 0),(15541, 216, -7518.82, 1029.07, 2.71235, 0, 0, 5.98218, 0, 0),
(15541, 217, -7518.82, 1029.07, 2.71235, 0, 0, 5.98218, 0, 0),(15541, 218, -7489.37, 1018.31, 1.95638, 0, 0, 6.01753, 0, 0),(15541, 219, -7462.4, 1006.38, 2.20385, 0, 0, 5.53843, 0, 0),
(15541, 220, -7455.77, 998.396, 2.89252, 0, 0, 5.03578, 0, 0),(15541, 221, -7455.77, 998.396, 2.89252, 0, 0, 5.03578, 0, 0),(15541, 222, -7448.96, 974.863, 4.33075, 0, 0, 4.98473, 0, 0),
(15541, 223, -7441.17, 948.264, 1.65803, 0, 0, 5.20857, 0, 0),(15541, 224, -7441.17, 948.264, 1.65803, 0, 0, 5.20857, 0, 0),(15541, 225, -7428.39, 927.429, 3.78599, 0, 0, 5.29496, 0, 0),
(15541, 226, -7423.08, 919.427, 3.25806, 0, 0, 5.55414, 0, 0),(15541, 227, -7415.13, 912.745, 2.17476, 0, 0, 5.75834, 0, 0),(15541, 228, -7415.13, 912.745, 2.17476, 0, 0, 5.75834, 0, 0),
(15541, 229, -7393.35, 901.621, 1.19573, 0, 0, 5.76227, 0, 0),(15541, 230, -7377.8, 892.678, 1.60292, 0, 0, 5.65232, 0, 0),(15541, 231, -7368.15, 885.076, 2.38997, 0, 0, 5.50309, 0, 0),
(15541, 232, -7356.76, 872.538, 4.52426, 0, 0, 5.3735, 0, 0),(15541, 233, -7349.03, 859.142, 5.9086, 0, 0, 4.78053, 0, 0),(15541, 234, -7349.03, 859.142, 5.9086, 0, 0, 4.78053, 0, 0),
(15541, 235, -7347.9, 834.669, 5.75347, 0, 0, 4.75696, 0, 0),(15541, 236, -7347.27, 820.669, 4.12543, 0, 0, 4.59596, 0, 0),(15541, 237, -7345.37, 799.572, 0.922967, 0, 0, 5.23213, 0, 0),
(15541, 238, -7341.02, 793.882, 2.23596, 0, 0, 5.61305, 0, 0),(15541, 239, -7328.22, 783.823, 3.96613, 0, 0, 5.47953, 0, 0),(15541, 240, -7318.78, 766.824, 5.08772, 0, 0, 5.09861, 0, 0),
(15541, 241, -7312.81, 748.878, 5.60424, 0, 0, 4.99651, 0, 0),(15541, 242, -7308.44, 735.218, 4.81518, 0, 0, 5.18108, 0, 0),(15541, 243, -7308.44, 735.218, 4.81518, 0, 0, 5.18893, 0, 0),
(15541, 244, -7297.61, 713.247, 1.50116, 0, 0, 5.16537, 0, 0),(15541, 245, -7292.83, 704.299, 2.73024, 0, 0, 5.44812, 0, 0),(15541, 246, -7292.83, 704.299, 2.73024, 0, 0, 5.57771, 0, 0),
(15541, 247, -7292.83, 704.299, 2.73024, 0, 0, 5.57771, 0, 0),(15541, 248, -7273.99, 688.644, 6.33373, 0, 0, 5.60912, 0, 0),(15541, 249, -7262.51, 679.462, 8.53285, 0, 0, 5.55807, 0, 0),
(15541, 250, -7262.51, 679.462, 8.53285, 0, 0, 5.55807, 0, 0),(15541, 251, -7240.23, 661.377, 9.91954, 0, 0, 5.56985, 0, 0),(15541, 252, -7232.97, 654.869, 8.79697, 0, 0, 5.44812, 0, 0),
(15541, 253, -7220.35, 638.217, 5.59505, 0, 0, 5.27926, 0, 0),(15541, 254, -7218.06, 632.807, 4.35276, 0, 0, 5.05935, 0, 0),(15541, 255, -7218.06, 632.807, 4.35276, 0, 0, 5.05935, 0, 0),
(15541, 256, -7209.08, 610.059, 3.65591, 0, 0, 5.10254, 0, 0),(15541, 257, -7209.08, 610.059, 3.65591, 0, 0, 5.10254, 0, 0),(15541, 258, -7199.58, 587.481, 4.66785, 0, 0, 5.14574, 0, 0),
(15541, 259, -7187.62, 565.051, 5.23083, 0, 0, 5.40492, 0, 0),(15541, 260, -7187.62, 565.051, 5.23083, 0, 0, 5.46775, 0, 0),(15541, 261, -7168.85, 548.013, 4.94201, 0, 0, 5.73479, 0, 0),
(15541, 262, -7164.35, 545.33, 4.51328, 0, 0, 5.75049, 0, 0),(15541, 263, -7164.35, 545.33, 4.51328, 0, 0, 5.84081, 0, 0),(15541, 264, -7149.8, 539.532, 5.34474, 0, 0, 6.08821, 0, 0),
(15541, 265, -7141.45, 538.382, 6.5345, 0, 0, 6.19031, 0, 0),(15541, 266, -7124.94, 539.611, 8.79837, 0, 0, 0.594349, 0, 0),(15541, 267, -7124.94, 539.611, 8.79837, 0, 0, 0.594349, 0, 0),
(15541, 268, -7096.07, 559.827, 9.06105, 0, 0, 0.519737, 0, 0),(15541, 269, -7074.14, 570.737, 9.21615, 0, 0, 0.452978, 0, 0),(15541, 270, -7055.48, 579.401, 8.91715, 0, 0, 0.339095, 0, 0),
(15541, 271, -7033.3, 581.961, 7.69663, 0, 0, 5.8251, 0, 0),(15541, 272, -7027.81, 578.488, 7.82374, 0, 0, 5.61305, 0, 0),(15541, 273, -7003.35, 560.111, 10.0738, 0, 0, 5.77012, 0, 0),
(15541, 274, -6994.12, 555.279, 10.789, 0, 0, 5.89971, 0, 0),(15541, 275, -6971.16, 545.977, 12.5531, 0, 0, 5.71907, 0, 0),(15541, 276, -6963.99, 539.302, 11.223, 0, 0, 5.44811, 0, 0),
(15541, 277, -6963.99, 539.302, 11.223, 0, 0, 5.44811, 0, 0),(15541, 278, -6951.38, 523.417, 7.45497, 0, 0, 0.064206, 0, 0),(15541, 279, -6932.52, 525.206, 6.87967, 0, 0, 0.405854, 0, 0),
(15541, 280, -6910.77, 536.454, 5.98403, 0, 0, 0.441197, 0, 0),(15541, 281, -6890.04, 545.287, 4.17121, 0, 0, 0.339095, 0, 0),(15541, 282, -6866.77, 552.948, 1.73102, 0, 0, 0.315533, 0, 0),
(15541, 283, -6849.96, 556.929, -0.124853, 0, 0, 0.107403, 0, 0),(15541, 284, -6828.53, 556.161, -1.31591, 0, 0, 5.96647, 0, 0),(15541, 285, -6811.72, 549.231, -0.449676, 0, 0, 5.52665, 0, 0),
(15541, 286, -6805.68, 540.093, -0.889439, 0, 0, 5.07112, 0, 0),(15541, 287, -6797.24, 517.093, -0.001643, 0, 0, 5.06327, 0, 0),(15541, 288, -6789.19, 494.001, 3.80897, 0, 0, 5.00044, 0, 0),
(15541, 289, -6789.19, 494.001, 3.80897, 0, 0, 5.00044, 0, 0),(15541, 290, -6782.8, 470.402, 6.88729, 0, 0, 4.9651, 0, 0),(15541, 291, -6777.81, 448.479, 8.23635, 0, 0, 4.863, 0, 0),
(15541, 292, -6777.81, 448.479, 8.23635, 0, 0, 4.863, 0, 0),(15541, 293, -6775.02, 424.207, 10.8402, 0, 0, 4.8198, 0, 0),(15541, 294, -6772.4, 399.848, 12.9945, 0, 0, 4.8198, 0, 0),
(15541, 295, -6771.25, 375.415, 13.9048, 0, 0, 4.75697, 0, 0),(15541, 296, -6770.56, 353.532, 12.4543, 0, 0, 4.65094, 0, 0),(15541, 297, -6772.69, 329.132, 8.25087, 0, 0, 4.5724, 0, 0),
(15541, 298, -6772.69, 329.132, 8.25087, 0, 0, 4.5724, 0, 0),(15541, 299, -6776.96, 305.008, 5.71315, 0, 0, 4.52528, 0, 0),(15541, 300, -6780.88, 278.513, 4.82217, 0, 0, 5.27533, 0, 0),
(15541, 301, -6774.67, 270.074, 3.44356, 0, 0, 5.36172, 0, 0),(15541, 302, -6774.67, 270.074, 3.44356, 0, 0, 5.36172, 0, 0),(15541, 303, -6761.04, 254.448, 2.76589, 0, 0, 5.46775, 0, 0),
(15541, 304, -6746.12, 240.139, 3.58501, 0, 0, 5.82511, 0, 0),(15541, 305, -6743.11, 238.827, 3.47093, 0, 0, 5.94684, 0, 0),(15541, 306, -6723.7, 233.256, 0.354174, 0, 0, 6.19817, 0, 0),
(15541, 307, -6707.6, 234.206, 2.14407, 0, 0, 0.401932, 0, 0),(15541, 308, -6690.34, 243.172, 3.02167, 0, 0, 0.759288, 0, 0),(15541, 309, -6690.34, 243.172, 3.02167, 0, 0, 0.759288, 0, 0),
(15541, 310, -6673.31, 260.704, 3.89955, 0, 0, 0.841755, 0, 0),(15541, 311, -6657.19, 279.159, 3.90556, 0, 0, 0.86139, 0, 0),(15541, 312, -6657.19, 279.159, 3.90556, 0, 0, 0.86139, 0, 0),
(15541, 313, -6637.75, 301.124, 3.42846, 0, 0, 0.61399, 0, 0),(15541, 314, -6616.3, 313.404, 3.37217, 0, 0, 0.276268, 0, 0),(15541, 315, -6610.57, 314.709, 3.38045, 0, 0, 0.17024, 0, 0),
(15541, 316, -6588.86, 319.15, 2.14188, 0, 0, 0.908514, 0, 0),(15541, 317, -6583.84, 326.755, -0.328794, 0, 0, 0.987054, 0, 0),(15541, 318, -6583.84, 326.755, -0.328794, 0, 0, 0.987054, 0, 0),
(15541, 319, -6583.84, 326.755, -0.328794, 0, 0, 0.987054, 0, 0),(15541, 320, -6564.96, 355.03, 3.12191, 0, 0, 0.806412, 0, 0),(15541, 321, -6564.96, 355.03, 3.12191, 0, 0, 0.806412, 0, 0),
(15541, 322, -6564.96, 355.03, 3.12191, 0, 0, 0.806412, 0, 0),(15541, 323, -6546.82, 371.491, 0.773827, 0, 0, 0.739654, 0, 0),(15541, 324, -6538.95, 379.691, 2.40596, 0, 0, 0.849609, 0, 0),
(15541, 325, -6538.95, 379.691, 2.40596, 0, 0, 0.849609, 0, 0),(15541, 326, -6522.84, 398.149, 5.48816, 0, 0, 0.853536, 0, 0),(15541, 327, -6511.4, 411.906, 5.84552, 0, 0, 0.9792, 0, 0),
(15541, 328, -6494.62, 442.794, 5.71744, 0, 0, 1.24624, 0, 0),(15541, 329, -6494.62, 442.794, 5.71744, 0, 0, 0.723946, 0, 0),(15541, 330, -6480.24, 455.155, 4.56112, 0, 0, 0.621844, 0, 0),
(15541, 331, -6467.78, 463.666, 3.73075, 0, 0, 0.578647, 0, 0),(15541, 332, -6463.69, 466.871, 2.66855, 0, 0, 0.665041, 0, 0),(15541, 333, -6459.07, 469.336, 0.357515, 0, 0, 0.488326, 0, 0),
(15541, 334, -6452.34, 473.297, 1.23904, 0, 0, 0.578647, 0, 0),(15541, 335, -6447.84, 477.083, 2.19392, 0, 0, 0.723946, 0, 0),(15541, 336, -6441.07, 484.1, 3.19477, 0, 0, 0.806412, 0, 0),
(15541, 337, -6441.07, 484.1, 3.19477, 0, 0, 0.743581, 0, 0),(15541, 338, -6422.88, 500.376, 4.78336, 0, 0, 0.727873, 0, 0),(15541, 339, -6411.08, 510.095, 5.67832, 0, 0, 0.621844, 0, 0),
(15541, 340, -6390.46, 523.301, 6.31597, 0, 0, 0.559012, 0, 0),(15541, 341, -6390.46, 523.301, 6.31597, 0, 0, 0.559012, 0, 0),(15541, 342, -6370.45, 536.218, 6.39885, 0, 0, 0.05243, 0, 0);

-- Classic [0881]
-- Scarlet Monastery - The Secret Door and the High Inquisitor's Door should not be targetable by common players.
UPDATE gameobject_template SET faction = 1375 WHERE entry IN (97700, 104600);

-- Classic [0880]
-- Fixed gossip menu of creature 13278 (Duke Hydraxis) in Azshara
-- Now players will be able to get the required items to summon Majordomo
-- Executus in Molten Core
DELETE FROM gossip_menu WHERE entry = 5065;
INSERT INTO gossip_menu VALUES
(5065, 6108, 0, 0),
(5065, 6109, 0, 981),
(5065, 6158, 0, 982),
(5065, 8541, 0, 990),
(5065, 8542, 0, 988);
DELETE FROM gossip_menu_option WHERE menu_id = 5065;
INSERT INTO gossip_menu_option VALUES
(5065, 0, 0, '[PH] I desire an aqual quintessence, Duke Hydraxis.', 1, 1, -1, 0, 506501, 0, 0, '', 987),
(5065, 1, 0, 'I desire this eternal quintessence, Duke Hydraxis.', 1, 1, -1, 0, 506502, 0, 0, '', 990);
DELETE FROM conditions WHERE condition_entry BETWEEN 981 AND 990;
INSERT INTO conditions VALUES
(981, 8, 6805, 0), -- Quest "Stormers and Rumblers" rewarded
(982, 8, 6824, 0), -- Quest "Hands of the Enemy" rewarded
(983, 30, 749, 5), -- Reputation Hydraxian Waterlords is at max Honored
(984, -1, 982, 983),
(985, 5, 749, 6), -- Reputation Hydraxian Waterlords is at least Revered
(986, 24, 17333, 1), -- Does not have item Aqual Quintessence
(987, -1, 984, 986),
(988, -1, 982, 985),
(989, 24, 22754, 1), -- Does not have item Eternal Quintessence
(990, -1, 988, 989);
DELETE FROM dbscripts_on_gossip WHERE id IN (506501, 506502);
INSERT INTO dbscripts_on_gossip VALUES
(506501, 0, 15, 21357, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'create aqual quintessence'),
(506502, 0, 15, 28439, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'create eternal quintessence');

-- Classic [0878]
-- Improved script for quest 656 (Summoning the Princess) in Arathi Highlands
-- Now Myzrael has a speech and will engage players on spawn
UPDATE creature_template SET MinLevel = 44, MaxLevel = 44, MinLevelHealth = 11408, MaxLevelHealth=11408, HealthMultiplier = 8, PowerMultiplier = 3, ArmorMultiplier = 1 WHERE Entry = 2755;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000461 AND 2000000463;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000461, 'What? $N, you served me well, but...',  0, 0, 0, 0, NULL),
(2000000462, 'Why have you summoned me so soon? I haven\t yet reached my full power!', 0, 0, 0, 0, NULL),
(2000000463, 'No matter. You were a fool to help me, and now you will pay!', 0, 0, 0, 0, NULL);
DELETE FROM dbscripts_on_event WHERE id = 420;
INSERT INTO dbscripts_on_event (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(420, 0, 10, 2755, 3000000, 0, 0, 0, 0, 0, 0, 0, -931.73, -3111.81, 48.517, 3.27404,' quest 656'),
(420, 3, 0, 0, 0, 2755, 50, 3, 2000000461, 0, 0, 0, 0, 0, 0, 0, ''),
(420, 6, 0, 0, 0, 2755, 50, 3, 2000000462, 0, 0, 0, 0, 0, 0, 0, ''),
(420, 11, 0, 0, 0, 2755, 50, 3, 2000000463, 0, 0, 0, 0, 0, 0, 0, ''),
(420, 12, 26, 0, 0, 2755, 50, 3, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Classic [0877]
-- Added random movement to creature 1493 (Mok'Rash) near Booty Bay
-- Also fixed its respawn time to 2h instead of 30 min
UPDATE creature SET MovementType = 1, spawndist = 10, spawntimesecs = 2 * 60 * 60 WHERE id = 1493;

-- Classic [0871]
-- Fixed rank of creature 8217 (Mith'rethis the Enchanter) in the Hinterlands because this NPC is rare and elite
-- Added waypoint movement to NPC 8217 (source: TBC-DB)
-- Fixed rank of creature 8217 (Mith'rethis the Enchanter) in the Hinterlands
-- because this NPC is rare and elite
-- Added waypoint movement to NPC 8217 (source: TBC-DB)
UPDATE creature_template SET rank = 2, MovementType = 2 WHERE Entry = 8217;
UPDATE creature SET MovementType = 2 WHERE id = 8217;
DELETE FROM creature_movement_template WHERE entry = 8217;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES 
(8217, 1, -517.333, -4054.25, 216.023, 0, 0, 4.81696, 0, 0),(8217, 2, -528.477, -4075.78, 215.853, 0, 0, 4.22791, 0, 0),(8217, 3, -530.916, -4084.3, 215.575, 0, 0, 2.96263, 0, 0),
(8217, 4, -547.423, -4085.67, 216.281, 0, 0, 3.18254, 0, 0),(8217, 5, -558.864, -4085.86, 225.49, 0, 0, 3.14249, 0, 0),(8217, 6, -570.652, -4085.87, 234.629, 0, 0, 3.14249, 0, 0),
(8217, 7, -578.233, -4085.87, 240.068, 0, 0, 3.14249, 0, 0),(8217, 8, -593.878, -4085.89, 238.362, 0, 0, 3.14249, 0, 0),(8217, 9, -616.638, -4064.5, 238.217, 0, 0, 2.39557, 0, 0),
(8217, 10, -616.833, -4047.42, 238.046, 0, 0, 2.21179, 0, 0),(8217, 11, -652.808, -4040.06, 238.274, 0, 0, 2.93436, 0, 0),(8217, 12, -672.615, -4022.63, 238.229, 0, 0, 2.41992, 0, 0),
(8217, 13, -676.225, -4016.49, 238.145, 0, 0, 2.10262, 0, 0),(8217, 14, -672.621, -4011.21, 238.248, 0, 0, 1.0062, 0, 0),(8217, 15, -664.151, -4010.24, 238.159, 0, 0, 0.113991, 0, 0),
(8217, 16, -655.342, -4029.7, 238.255, 0, 0, 5.1374, 0, 0),(8217, 17, -637.653, -4043.85, 238.07, 0, 0, 5.60864, 0, 0),(8217, 18, -624.501, -4043.49, 238.073, 0, 0, 0.085717, 0, 0),
(8217, 19, -617.972, -4032.87, 237.873, 0, 0, 0.986569, 0, 0),(8217, 20, -617.911, -3980.06, 238.482, 0, 0, 1.59918, 0, 0),(8217, 21, -611.216, -3963.89, 238.351, 0, 0, 1.17821, 0, 0),
(8217, 22, -570.672, -3938.64, 238.326, 0, 0, 0.471347, 0, 0),(8217, 23, -568.836, -3931.76, 237.925, 0, 0, 1.31015, 0, 0),(8217, 24, -556.458, -3939.03, 237.937, 0, 0, 0.21138, 0, 0),
(8217, 25, -537.875, -3940.39, 238.764, 0, 0, 3.32627, 0, 0),(8217, 26, -566.704, -3951.51, 238.427, 0, 0, 3.52419, 0, 0),(8217, 27, -613.806, -3933.84, 238.346, 0, 0, 2.78906, 0, 0),
(8217, 28, -620.501, -3938.32, 238.463, 0, 0, 3.73153, 0, 0),(8217, 29, -616.96, -3970.3, 238.351, 0, 0, 4.85936, 0, 0),(8217, 30, -618.1, -4023.04, 237.988, 0, 0, 4.68658, 0, 0),
(8217, 31, -617.327, -4059.77, 238.279, 0, 0, 4.72663, 0, 0),(8217, 32, -624.179, -4061.62, 238.351, 0, 0, 3.37967, 0, 0),(8217, 33, -638.711, -4062.04, 247.263, 0, 0, 3.19903, 0, 0),
(8217, 34, -618.277, -4063.46, 238.307, 0, 0, 6.25345, 0, 0),(8217, 35, -602.99, -4082.45, 238.351, 0, 0, 5.37302, 0, 0),(8217, 36, -600.118, -4115.69, 238.504, 0, 0, 4.83973, 0, 0),
(8217, 37, -610.419, -4140.24, 238.351, 0, 0, 4.31508, 0, 0),(8217, 38, -599.085, -4160.05, 238.431, 0, 0, 5.23871, 0, 0),(8217, 39, -593.493, -4164.29, 238.355, 0, 0, 5.70995, 0, 0),
(8217, 40, -587.6, -4160.74, 238.352, 0, 0, 0.554599, 0, 0),(8217, 41, -593.862, -4137.4, 238.387, 0, 0, 1.83637, 0, 0),(8217, 42, -629.492, -4119.94, 238.351, 0, 0, 2.68617, 0, 0),
(8217, 43, -642.951, -4106.99, 238.504, 0, 0, 2.37515, 0, 0),(8217, 44, -591.144, -4085.34, 238.368, 0, 0, 0.381026, 0, 0),(8217, 45, -577.325, -4085.64, 239.868, 0, 0, 6.24559, 0, 0),
(8217, 46, -564.315, -4085.87, 229.775, 0, 0, 6.16548, 0, 0),(8217, 47, -544.956, -4085.42, 215.861, 0, 0, 0.026026, 0, 0),(8217, 48, -532.116, -4085.08, 215.547, 0, 0, 0.026026, 0, 0),
(8217, 49, -529.232, -4073.31, 215.856, 0, 0, 1.42561, 0, 0),(8217, 50, -539.105, -4053.94, 216.756, 0, 0, 1.95496, 0, 0),(8217, 51, -531.195, -4035.23, 215.861, 0, 0, 1.19391, 0, 0),
(8217, 52, -505.494, -4008.01, 215.944, 0, 0, 0.802785, 0, 0),(8217, 53, -524.022, -4030.32, 215.86, 0, 0, 4.05669, 0, 0),(8217, 54, -524.191, -4036.51, 215.86, 0, 0, 4.68501, 0, 0);

-- Classic [0867]
-- Improved Stitches script used at end of quest 252 (Translation to Ello) to make it closer
-- to what it was on retail:
-- Stitches is now neutral at spawn and will no longer kill Abercombrie
-- Stitches turns hostile when reaching the road
-- Stitches now attacks the Night Watch guards on its way to Darkshire
-- Town Crier (creature 468) now has several yells to inform players of Stitches progress toward Darkshire
-- Prevented Stitches to spawn twice
-- Source: http://www.wowwiki.com/Quest:Translation_to_Ello
-- http://www.wowwiki.com/Stitches
-- http://www.youtube.com/watch?v=rS0rjcQ6YMc
SET @NIGHTWATCH := 888;
SET @NIGHTWATCH2 := 499;
SET @TOWNCRIER := 468;
SET @CRIER_GUID := (SELECT guid FROM creature WHERE id = @TOWNCRIER);
SET @SEARCH_RANGE := 100000;
UPDATE creature_template SET FactionAlliance = 7, FactionHorde = 7,  ExtraFlags = ExtraFlags | 0x1000 WHERE Entry = 412;
UPDATE creature_template SET ExtraFlags = ExtraFlags | 0x1000 WHERE Entry = 468; -- Makes Town Crier an active object
UPDATE dbscripts_on_quest_end SET delay = 1 WHERE id = 252;
DELETE FROM dbscripts_on_quest_end WHERE id = 252 AND delay = 0;
INSERT INTO dbscripts_on_quest_end VALUES
(252, 0, 34, 980, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'stop if stitches already spawned');
DELETE FROM conditions WHERE condition_entry = 980;
INSERT INTO conditions VALUES
(980, 37, 412, @SEARCH_RANGE);
DELETE FROM dbscripts_on_creature_movement WHERE id = 41204 AND command = 22;
INSERT INTO dbscripts_on_creature_movement VALUES
(41204, 0, 22, 93, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'stitches faction hostile');
UPDATE creature_movement_template SET script_id = 41204 WHERE entry = 412 AND point = 35;
DELETE FROM dbscripts_on_creature_movement WHERE id = 41205;
INSERT INTO dbscripts_on_creature_movement VALUES
(41205, 0, 0, 6, 0, @TOWNCRIER, @CRIER_GUID, 0x10, 2000000458, 0, 0, 0, 0, 0, 0, 0, 'stitches - town crier 1st yell');
UPDATE creature_movement_template SET script_id = 41205 WHERE entry = 412 AND point = 47;
DELETE FROM dbscripts_on_creature_movement WHERE id = 41206;
INSERT INTO dbscripts_on_creature_movement VALUES
(41206, 0, 26, 0, 0, @NIGHTWATCH, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'stitches attacks night watch'),
(41206, 1, 26, 0, 0, @NIGHTWATCH2, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2nd night watch attacks stitches');
UPDATE creature_movement_template SET script_id = 41206, waittime = 0 WHERE entry = 412 AND point = 49;
DELETE FROM dbscripts_on_creature_movement WHERE id = 41202 AND delay = 4;
INSERT INTO dbscripts_on_creature_movement VALUES
(41202, 4, 0, 6, 0, @TOWNCRIER, @CRIER_GUID, 0x10, 2000000459, 0, 0, 0, 0, 0, 0, 0, 'stitches - town crier 2nd yell');
UPDATE creature_movement_template SET script_id = 0 WHERE entry = 412 AND point = 69;
UPDATE creature_movement_template SET script_id = 41202 WHERE entry = 412 AND point = 50;
DELETE FROM dbscripts_on_creature_death WHERE id = 412;
INSERT INTO dbscripts_on_creature_death VALUES
(412, 5, 0, 6, 0, @TOWNCRIER, @CRIER_GUID, 0x10, 2000000460, 0, 0, 0, 0, 0, 0, 0, 'stitches - town crier 3rd yell');
DELETE FROM db_script_string WHERE entry IN (2000000458, 2000000459, 2000000460);
INSERT INTO db_script_string VALUES
(2000000458, 'An abomination of the undead is approaching!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6, 7, 0, NULL),
(2000000459, 'The abomination has overrun the Night Watch camp! Quickly, we must intercept it before it reaches town!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6, 7, 0, NULL),
(2000000460, 'The beast is slain! All is well in Darkshire.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6, 7, 0, NULL);
UPDATE db_script_string SET type = 6 WHERE entry IN (2000000161, 2000000162);


-- Classic [0866]
-- Fixed quest 2882 (Cuergo's Gold) by adding script on GO use
-- for GO 142189 (Inconspicuous Landmark)
DELETE FROM dbscripts_on_go_template_use WHERE id = 142189;
INSERT INTO dbscripts_on_go_template_use (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES  
(142189, 0, 15, 11462, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- summons NPC trigger 7898
(142189, 3, 15, 11487, 0, 7898, 50, 2, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(142189, 4, 15, 11485, 0, 7898, 50, 2, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(142189, 9, 15, 11463, 0, 7898, 50, 2, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(142189, 10, 15, 11463, 0, 7898, 50, 2, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(142189, 11, 15, 11487, 0, 7898, 50, 2, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE creature_template SET MovementType = 1 WHERE Entry IN (7899, 7902, 7901);

-- Classic [0854]
-- Diremaul - Wandering Eyes of Kilrogg -- should remember their name, no one ever called them Idling Eyes of Kilrogg.
SET @EYEOFKILROGG := 14386;
DELETE FROM creature WHERE id = @EYEOFKILROGG;
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128634, @EYEOFKILROGG, 429, 0, 0, 560.9175, 545.4094, -25.31721, 1.005476, 900, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry=@EYEOFKILROGG), (SELECT MaxLevelMana FROM creature_template WHERE Entry=@EYEOFKILROGG), 0, 2),
(128635, @EYEOFKILROGG, 429, 0, 0, 446.8329, 542.6426, -21.81278, 3.261362, 900, 0, 0, (SELECT MaxLevelHealth FROM creature_template WHERE Entry=@EYEOFKILROGG), (SELECT MaxLevelMana FROM creature_template WHERE Entry=@EYEOFKILROGG), 0, 2);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 128634;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(128634, (@POINT := @POINT + 1), 577.1039, 570.9245, -25.40290, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 572.0755, 582.9881, -25.40273, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 544.6523, 593.1812, -25.40273, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 500.8310, 579.0237, -25.40101, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 484.0373, 575.8411, -25.40182, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 476.5366, 584.7387, -25.40356, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 494.3848, 591.6921, -20.39891, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 534.3132, 590.4163, -4.754774, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 550.6912, 591.4011, -4.754772, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 568.8508, 584.2122, -4.754771, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 581.8668, 574.6851, -4.755718, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 587.1575, 556.0428, -1.718680, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 587.0223, 535.8848, 6.7701660, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 568.9283, 535.3513, 13.090810, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 545.4929, 534.3782, 25.665700, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 568.9283, 535.3513, 13.090810, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 587.0223, 535.8848, 6.7701660, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 587.1575, 556.0428, -1.718680, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 581.8668, 574.6851, -4.755718, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 568.8508, 584.2122, -4.754771, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 550.6912, 591.4011, -4.754772, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 534.3132, 590.4163, -4.754774, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 494.3848, 591.6921, -20.39891, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 481.7606, 590.6141, -25.40754, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 484.0373, 575.8411, -25.40182, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 500.8310, 579.0237, -25.40101, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 544.6523, 593.1812, -25.40273, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 572.0755, 582.9881, -25.40273, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 577.1039, 570.9245, -25.40290, 0, 0, 0, 0, 0),
(128634, (@POINT := @POINT + 1), 563.5419, 547.6833, -25.39905, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 128635;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(128635, (@POINT := @POINT + 1), 428.5866, 550.3541, -18.33062, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 413.2478, 549.2036, -18.33061, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 410.8050, 537.9805, -18.00485, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 399.8401, 525.5711, -12.77508, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 389.6866, 500.6979, -12.01533, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 385.3872, 475.1862, -7.219529, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 395.8070, 468.8721, -7.219531, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 396.1824, 455.4167, -7.219535, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 388.5278, 448.8068, -7.219536, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 384.2072, 434.8414, -5.553133, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 384.5225, 423.3623, -3.128052, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 385.2957, 413.9088, -1.672135, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 384.2072, 434.8414, -5.553133, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 388.5278, 448.8068, -7.219536, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 396.1824, 455.4167, -7.219535, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 395.8070, 468.8721, -7.219531, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 385.3872, 475.1862, -7.219529, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 389.6866, 500.6979, -12.01533, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 399.6569, 525.3637, -12.77500, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 410.8050, 537.9805, -18.00485, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 413.2478, 549.2036, -18.33061, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 428.5866, 550.3541, -18.33062, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 445.9710, 542.5389, -21.56523, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 494.6815, 542.8771, -25.38725, 0, 0, 0, 0, 0),
(128635, (@POINT := @POINT + 1), 445.9710, 542.5389, -21.56523, 0, 0, 0, 0, 0);

-- Classic [0853]
-- should only be usable if you are on certain quests
-- was incorrectly positioned
UPDATE gameobject SET position_x = 129.4811, position_y = 544.9671, position_z = -48.46632, orientation = 0, rotation2 = 0.7253742, rotation3 = 0.6883547, spawntimesecs = 0, animprogress = 100 WHERE id = 179517;
UPDATE gameobject_template SET flags = 4 WHERE entry = 179517;

-- Classic [0852]
-- Diremaul - Doors and Keys
-- Both, the Gordok Courtyard Key and the Gordok Inner Door Key are now bound to Diremaul and will be destroyed if their holders make it out of the dungeon alive.
-- The Gordok Inner Door will now require the use of the Gordok Inner Door Key in order to be opened.
-- Lots of doors in the western and northern wing of Diremaul had their size and opening animation fixed.
UPDATE gameobject SET position_x = 491.2043, position_y = 515.1331, position_z = 29.467530, orientation = 0, rotation2 = 0.70710660, rotation3 = 0.7071069, spawntimesecs = 0, animprogress = 100 WHERE id = 177217;
UPDATE gameobject SET position_x = 385.3268, position_y = 374.2315, position_z = -1.343140, orientation = 0, rotation2 = 0.70710660, rotation3 = 0.7071069, spawntimesecs = 0, animprogress = 100 WHERE id = 177219;
UPDATE gameobject SET position_x = 351.5679, position_y = 88.67347, position_z = -36.39297, orientation = 0, rotation2 = 0.70710660, rotation3 = 0.7071069, spawntimesecs = 0, animprogress = 100 WHERE id = 179549;
UPDATE gameobject SET position_x = 83.25511, position_y = 630.5456, position_z = -24.63151, orientation = 0, rotation2 = -0.3131638, rotation3 = 0.9496992, spawntimesecs = 0, animprogress = 100 WHERE id = 179550;
UPDATE gameobject SET position_x = 50.58631, position_y = 501.9406, position_z = -23.14985, orientation = 0, rotation2 = -0.7071066, rotation3 = 0.7071069, spawntimesecs = 0, animprogress = 100 WHERE id = 177221;
UPDATE gameobject_template SET flags = 34, size = 1.482917 WHERE entry = 177217;
UPDATE gameobject_template SET flags = 34 WHERE entry = 177219;
UPDATE gameobject_template SET faction = 0 WHERE entry = 179549;
UPDATE gameobject_template SET size = 1.02 WHERE entry = 179550;
UPDATE gameobject_template SET size = 0.465763 WHERE entry = 177221;
UPDATE item_template SET area = 2557, Map = 429 WHERE entry = 18268;
UPDATE item_template SET area = 2557, Map = 429 WHERE entry = 18266;

-- Classic [0850]
-- DM:N - Misc 
-- Cho'Rush the Observer was moved and will now assist the Ogre King.
UPDATE creature SET position_x = 833.9951, position_y = 489.5435, position_z = 37.40153, orientation = 3.211406, MovementType = 0 WHERE id = 14324;
-- Guard Fengus will now move constantly around.
SET @FENGUS := 14321; -- Guard Fengus
SET @GUID := (SELECT guid FROM creature WHERE id = @FENGUS);
SET @POINT := 0;
UPDATE creature SET position_x = 356.795, position_y = 258.3065, position_z = 11.65384, orientation = 3.142583, MovementType = 2 WHERE id = @FENGUS;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @FENGUS;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(@FENGUS, (@POINT := @POINT + 1), 316.5439, 258.2672, 11.22405, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 287.7441, 260.7287, 2.869437, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 290.6053, 280.1005, 2.848812, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 289.7671, 310.0473, 2.853041, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 300.0063, 328.7043, 2.852961, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 294.1508, 290.1005, 2.849759, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 288.6681, 260.1472, 2.870163, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 318.0658, 258.1307, 11.22347, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 352.2249, 259.8816, 11.20577, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 379.2898, 259.8564, 11.43955, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 383.1255, 280.3708, 12.23591, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 384.3981, 315.2444, 11.21198, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 385.5048, 342.4915, 2.862235, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 350.4333, 341.1977, 2.853369, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 313.9085, 338.8922, 2.852938, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 356.0100, 342.2071, 2.853216, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 388.9794, 340.4667, 2.864845, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 423.3712, 340.0448, 2.853797, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 454.4482, 336.7815, 2.855228, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 417.1513, 339.7217, 2.853512, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 390.7901, 340.0213, 2.865798, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 386.5863, 316.9394, 10.87668, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 385.8260, 281.0563, 12.23588, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 385.6659, 260.2018, 11.43955, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 407.4470, 256.0239, 12.23423, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 444.0919, 255.3879, 11.20982, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 407.4797, 258.5080, 12.23421, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 384.6136, 256.4120, 11.43955, 0, 0, 0, 0, 0),
(@FENGUS, (@POINT := @POINT + 1), 358.8656, 258.3085, 12.23409, 0, 0, 0, 0, 0);
-- The Tribute and Fengus's Chest were moved.
UPDATE gameobject SET position_x = 808.3697, position_y = 482.1281, position_z = 37.31820, orientation = 0, rotation2 = -0.9996567, rotation3 = 0.02620165 WHERE guid = 35834;
UPDATE gameobject SET position_x = 380.6145, position_y = 260.0570, position_z = 11.43955, orientation = 0, rotation2 = -0.4848089, rotation3 = 0.87462010 WHERE guid = 35832;

-- Classic [0849]
-- DM:N - Guard Slip'Kik is now constatly moving through the Halls of Destruction and no longer easy to skip on your Tribute Run.
SET @SLIPKIK := 14323; -- Guard SlipKik
SET @GUID := (SELECT guid FROM creature WHERE id = @SLIPKIK);
SET @POINT := 0;
UPDATE creature SET position_x = 550.3804, position_y = 533.7247, position_z = -25.31852, orientation = 3.926991, MovementType = 2 WHERE id = @SLIPKIK;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @SLIPKIK;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(@SLIPKIK, (@POINT := @POINT + 1), 558.6339, 549.9158, -25.39908, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 573.5057, 563.2197, -25.40176, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 573.2263, 586.4570, -25.40273, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 524.0547, 587.0665, -25.40254, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 510.3508, 606.5667, -25.40364, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 486.8481, 606.4826, -25.40477, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 478.1636, 594.9525, -25.40531, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 477.4341, 579.6123, -25.40210, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 504.7797, 574.7651, -25.40086, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 477.4341, 579.6123, -25.40210, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 478.1636, 594.9525, -25.40531, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 486.8481, 606.4826, -25.40477, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 510.3508, 606.5667, -25.40364, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 524.0547, 587.0665, -25.40254, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 573.2263, 586.4570, -25.40273, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 573.5057, 563.2197, -25.40176, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 558.6339, 549.9158, -25.39908, 0, 0, 0, 0, 0),
(@SLIPKIK, (@POINT := @POINT + 1), 550.9423, 528.1198, -25.40169, 0, 0, 0, 0, 0);

-- Classic [0848]
-- STV - Item: Encrusted Tail Fin * should only drop from Murlcos located in the Vile Reef.
-- ( Patch 1.2.0 (18-Dec-2004): Murkgill Murlocs in Stranglethorn no longer drop Encrusted Tail Fin.)
DELETE FROM creature_loot_template WHERE item = 5796 AND entry IN (4457, 4458, 4459, 4460, 4461);

-- Classic [0846]
-- Hearthsinger Forresten - Stratholme
DELETE FROM creature WHERE id = 10558;
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128630, 10558, 329, 0, 0, 3595.755, -3509.928, 137.5008, 5.742133, 604800, 0, 0, 6960, 0, 0, 0),
(128631, 10558, 329, 0, 0, 3680.273, -3512.372, 136.1522, 2.042035, 604800, 0, 0, 6960, 0, 0, 0),
(128632, 10558, 329, 0, 0, 3692.933, -3363.162, 130.7527, 3.246312, 604800, 0, 0, 6960, 0, 0, 0),
(128633, 10558, 329, 0, 0, 3683.747, -3334.066, 125.3195, 3.141593, 604800, 0, 0, 6960, 0, 0, 0);
DELETE FROM pool_template WHERE entry = 25480;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25480, 1, 'Stratholme - Hearthsinger Forresten');
DELETE FROM pool_creature WHERE pool_entry = 25480;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(128630, 25480, 25, 'Stratholme - Hearthsinger Forresten'),
(128631, 25480, 25, 'Stratholme - Hearthsinger Forresten'),
(128632, 25480, 25, 'Stratholme - Hearthsinger Forresten'),
(128633, 25480, 25, 'Stratholme - Hearthsinger Forresten');

-- Classic [0838]
-- Fixed drop chance of item 5339 (Serpent Bloom) in Wailing Caverns
-- Though a quest objective, it is lootable by everyone and should have a 100% drop chance
-- Also removed wrong loot content in GO 13891 (Serpent Bloom)
-- Thanks TheTrueAnimal for reporting, Sinoxan for researching.
UPDATE gameobject_loot_template SET ChanceOrQuestChance = 100 WHERE item = 5339;
DELETE FROM gameobject_loot_template WHERE entry = 2772 AND item <> 5339;

-- Classic [0837]
-- Fixed respawntime of GO 177287 (Unfinished Painting) 
-- Thanks TheTrueAnimal for reporting. This closes #676  
 -- Source: https://www.youtube.com/watch?v=2Dm3YwxxJUo 
 UPDATE gameobject SET spawntimesecs = 0 WHERE id = 177287; 

-- Classic [0836]
-- Fixed graveyard for Alliance in Ratchet. Thanks Metalica for pointing.
DELETE FROM game_graveyard_zone WHERE id = 249 AND ghost_zone = 215;
UPDATE game_graveyard_zone SET faction = 0 WHERE id = 249 AND ghost_zone = 17;
-- Alliance players dying in Mulgore and Thunder Bluff are now ported to Bloodhoof Village graveyard
-- as they should instead of Ratchet
-- Source: http://www.wowwiki.com/Mulgore#Patch_changes
UPDATE game_graveyard_zone SET faction = 0 WHERE id = 89 AND ghost_zone = 215;
UPDATE game_graveyard_zone SET id = 89 WHERE faction = 469 AND ghost_zone = 1638;

-- Classic [0835]
-- Added missing GO 175966 (Enchanted Scarlet Thread) in Stratholme
-- Also put them into a pool
DELETE FROM gameobject WHERE guid IN (66149, 66150);
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(66149, 175966, 329, 3457.5, -3111.17, 137.482, 2.023, 0, 0, 0.847629, 0.53059, 43200, 100, 1),
(66150, 175966, 329, 3585.85, -3061.59, 136.515, 5.31, 0, 0, 0.467617, -0.883931, 43200, 100, 1);
DELETE FROM pool_gameobject_template WHERE id = 175966;
INSERT INTO pool_gameobject_template VALUES
(175966, 25479, 0, 'Enchanted Scarlet Thread (175966)');
DELETE FROM pool_template WHERE entry = 25479;
INSERT INTO pool_template VALUES
(25479, 2, 'Enchanted Scarlet Thread (175966) - Stratholme');

-- Classic [0823]
-- Added missing rare spawns NPCs in Zul'Farrak
-- Source: http://www.wowhead.com/npc=10080#comments
-- http://www.wowhead.com/npc=10081#comments
-- http://www.wowhead.com/npc=10082#comments
-- ----------------------------
-- Sandarr Dunereaver (10080)
-- ----------------------------
DELETE FROM creature WHERE guid IN (54080,128620);
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(54080, 10080, 209, 0, 0, 1546.25, 1017.14, 8.87683, 0.0109968, 7200, 0, 0, 5544, 0, 0, 0), -- Sandarr Dunereaver
(128620, 7269, 209, 0, 0, 1546.25, 1017.14, 8.87683, 0.0109968, 60, 5, 0, 1782, 0, 0, 1); -- Sandarr Dunereaver placeholder
DELETE FROM pool_creature WHERE guid IN (54080, 128620);
INSERT INTO pool_creature VALUES
(54080, 25476, 10, 'Zul\'Farrak - Sandarr Dunereaver (Zul\'Farrak)'),
(128620, 25476, 0, 'Zul\'Farrak - Sandarr Dunereaver placeholder (Zul\'Farrak)');
DELETE FROM pool_template WHERE entry = 25476;
INSERT INTO pool_template VALUES
(25476, 1, 'Zul\'Farrak - Sandarr Dunereaver/Sandarr Dunereaver placeholder');
-- ----------------------------
-- Dustwraith (10081)
-- ----------------------------
DELETE FROM creature WHERE guid IN (128627, 128628);
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128627, 10081, 209, 0, 0, 1627.47, 1186.85, 8.87693, 0.647954, 7200, 15, 0, 5757, 0, 0, 1), -- Dustwraith
(128628, 7269, 209, 0, 0, 1627.47, 1186.85, 8.87693, 0.647954, 60, 5, 0, 1782, 0, 0, 1); -- Dustwraith placeholder
DELETE FROM pool_creature WHERE guid IN (128627, 128628);
INSERT INTO pool_creature VALUES
(128627, 25477, 10, 'Zul\'Farrak - Dustwraith'),
(128628, 25477, 0, 'Zul\'Farrak - Dustwraith placeholder');
DELETE FROM pool_template WHERE entry = 25477;
INSERT INTO pool_template VALUES
(25477, 1, 'Zul\'Farrak - Dustwraith/Dustwraith placeholder');
-- ----------------------------
-- Zerillis (10082)
-- ----------------------------
DELETE FROM creature WHERE guid = 128629;
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128629, 10082, 209, 0, 0, 1628.94, 952.042, 8.87684, 5.43152, 7200, 0, 0, 5544, 0, 0, 2); -- Zerillis
UPDATE creature_template SET MovementType = 2 WHERE Entry = 10082;
DELETE FROM creature_movement_template WHERE entry = 10082;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, script_id, waittime, orientation) VALUES
(10082, 1, 1648.93, 929.182, 9.0735, 0, 400, 0),
(10082, 2, 1676.93, 909.081, 8.8778, 0, 400, 0),
(10082, 3, 1679.64, 896.14, 8.8778, 0, 0, 0),
(10082, 4, 1662.26, 892.587, 8.87689, 0, 300, 0),
(10082, 5, 1653.05, 908.666, 8.87689, 0, 0, 0),
(10082, 6, 1649.56, 928.862, 8.97394, 0, 0, 0),
(10082, 7, 1628.18, 951.86, 8.87694, 0, 1000, 0);
DELETE FROM pool_creature WHERE guid IN (128629, 44170);
INSERT INTO pool_creature VALUES
(128629, 25478, 30, 'Zul\'Farrak - Zerillis'),
(44170, 25478, 0, 'Zul\'Farrak - Zerillis placeholder');
DELETE FROM pool_template WHERE entry = 25478;
INSERT INTO pool_template VALUES
(25478, 1, 'Zul\'Farrak - Zerillis/Zerillis placeholder');

-- Classic [0822]
-- Fixed loot table of bosses in Zul'Farrak.
-- Thanks Patman for reporting.
UPDATE creature_loot_template SET ChanceOrQuestChance = 40 WHERE entry = 7271 AND item = 18083;
UPDATE creature_loot_template SET ChanceOrQuestChance = 20 WHERE entry = 7271 AND item = 18082;
DELETE FROM creature_loot_template WHERE entry = 7271 AND item IN (24036, 24041, 24043, 24045);
INSERT INTO creature_loot_template VALUES
(7271, 24036, 10, 0, -24036, 1, 0), -- grey items
(7271, 24041, 10, 1, -24041, 1, 0), -- green items
(7271, 24043, 10, 1, -24043, 1, 0), -- green items
(7271, 24045, 10, 1, -24045, 1, 0); -- green items
DELETE FROM creature_loot_template WHERE entry = 7275 AND item IN (24036, 24041, 24043, 24045);
INSERT INTO creature_loot_template VALUES
(7275, 24036, 10, 0, -24036, 1, 0), -- grey items
(7275, 24041, 10, 1, -24041, 1, 0), -- green items
(7275, 24045, 10, 1, -24045, 1, 0); -- green items
UPDATE creature_loot_template SET maxcount = 4 WHERE item IN (4338, 4306) AND entry IN (8127, 7272, 7271, 7796, 7795, 7273, 7275, 7797, 7267);
UPDATE creature_loot_template SET mincountOrRef = 2, maxcount = 5 WHERE item = 9523 AND entry IN (8127, 7272, 7271, 7796, 7795, 7273, 7275, 7797, 7267);

--  Classic [0821]
-- Added waypoint movement to creature 7795 (Hydromancer Velratha) in Zul'Farrak.
-- She will now move around the sacred pool.
UPDATE creature SET MovementType = 2 WHERE id = 7795;
UPDATE creature_template SET MovementType = 2 WHERE Entry = 7795;
DELETE FROM creature_movement_template WHERE entry = 7795;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, script_id, waittime, orientation) VALUES
(7795, 1, 1704.96, 1202.13, 9.24427, 0, 0, 0),
(7795, 2, 1684.78, 1225.34, 8.87707, 0, 0, 0),
(7795, 3, 1706.28, 1200.92, 9.22012, 0, 0, 0),
(7795, 4, 1681.82, 1180.19, 8.89546, 0, 0, 0);
-- Fixed walk speed for creature 7273 (Gahz'rilla) in Zul'Farrak because it was moving way to quickly 
UPDATE creature_template SET SpeedWalk = 1.14286 WHERE Entry = 7273;
-- Fixed addon for creature 5648 (Sandfury Shadowcaster) because they were using an aura addon and an EventAI 
-- script to add the same spell 20798 (Demon Skin) resulting in the spell being self canceled 
DELETE FROM creature_addon WHERE auras = '20798' AND guid IN (SELECT guid FROM creature WHERE id = 5648); 

-- Classic [0819]
-- Fixed spawn time of NPC 11489 (Tendris Warpwood) in Dire Maul
-- Thanks TheTrueAnimal for pointing.
UPDATE creature SET spawntimesecs = 3 * 3600 WHERE id = 11489;-- Classic [0970]
-- You have to loot more than just one box to get your equipment.
UPDATE gameobject_loot_template SET ChanceOrQuestChance = -10 WHERE entry = 9677 and item = 10715;
UPDATE gameobject_loot_template SET ChanceOrQuestChance = -10 WHERE entry = 9677 and item = 10717;
UPDATE gameobject_loot_template SET ChanceOrQuestChance = -10 WHERE entry = 9677 and item = 10718;
UPDATE gameobject_loot_template SET ChanceOrQuestChance = -10 WHERE entry = 9677 and item = 10722;

-- Classic [0969]
-- Fixed quest 5581 (Portal of the Legion) in Desolace
DELETE FROM dbscripts_on_go_template_use WHERE id IN (177243,177365,177366,177367,177368,177369,177397,177398,177399,177400);
INSERT INTO dbscripts_on_go_template_use VALUES 
(177243, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177365, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177366, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177367, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177368, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177369, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177397, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177398, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177399, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(177400, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian');

-- Classic [0968]
-- Fixed NPC vendors items for vendors 10856 (Argent Quartermaster Hasana ), 10857 (Argent Quartermaster Lightspark ) & 11536 (Quartermaster Miranda Breechlock )
-- items are now available only once the related quests are completed
-- Also removed repeat flag for quest 5517, 5521, 5524 (Chromatic Mantle of the Dawn)
-- Prevented players to complete all Mantle of the Dawn quests as they should be able to do only one by tier (two tiers)
DELETE FROM conditions WHERE condition_entry BETWEEN 991 AND 1000;
INSERT INTO conditions VALUES 
(991, 8, 5513, 0),
(992, 8, 5507, 0),
(993, 8, 5504, 0),
(994, -2, 991, 992),
(995, -2, 993, 994),
(996, 8, 5524, 0),
(997, 8, 5521, 0),
(998, 8, 5517, 0),
(999, -2, 996, 997),
(1000, -2, 998, 999);
UPDATE npc_vendor SET condition_id = 995 WHERE item IN (18169,18170,18171,18172,18173);
UPDATE npc_vendor SET condition_id = 1000 WHERE item = 18182;
UPDATE quest_template SET ExclusiveGroup = 5504 WHERE entry IN (5504,5507,5513);
UPDATE quest_template SET ExclusiveGroup = 5517, SpecialFlags = 0 WHERE entry IN (5517,5521,5524);

-- Classic [0967] 
-- Fixed rewards of quest 8867 (Lunar Fireworks)
DELETE FROM item_loot_template WHERE entry IN (21740, 21743);
INSERT INTO item_loot_template VALUES 
(21740, 21724, 0, 1, 1, 1, 0),
(21740, 21725, 0, 1, 1, 1, 0),
(21740, 21726, 0, 1, 1, 1, 0),
(21743, 21733, 0, 1, 1, 1, 0),
(21743, 21734, 0, 1, 1, 1, 0),
(21743, 21735, 0, 1, 1, 1, 0);

-- Classic [0965]
-- Removed spawns of NPC 11258 from Scholomance : this NPC is summoned 
DELETE FROM creature WHERE id = 11258 AND map = 289;
DELETE FROM creature_addon WHERE guid IN (91405,91406,91407,91421,91422,91427);

-- Classic [0943] and part of [945]
-- Quest: An Imp's Request should have quest level 50/52, instead of 52/60
-- Creature: Sea Elemental should deal frost instead of physical melee damage.
-- Creature: Sea Spray should also deal frost damage
UPDATE creature_template SET DamageSchool = 4 WHERE Entry = 5461;
UPDATE creature_template SET DamageSchool = 4 WHERE Entry = 5462;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52, RewMoneyMaxLevel = 2280 WHERE entry = 8419;

-- Classic [0938]
-- Quest 7046 (The Scepter of Celebras) needs quest 7044 (Legends of Maraudon) as prerequist
UPDATE quest_template SET PrevQuestId= 7044 WHERE entry = 7046;

-- Classic [0937]
-- Added patrol of NPC 13599 (Stolid Snapjaw) in Maraudon
DELETE FROM creature_linking WHERE guid IN (55115, 55116, 55117);
INSERT INTO creature_linking VALUES
(55115, 55118, 512),
(55116, 55118, 512),
(55117, 55118, 512);
UPDATE creature SET MovementType = 2 WHERE guid = 55118;
DELETE FROM creature_movement WHERE id = 55118;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(55118, 1, 560.44, 74.1416, -96.3128, 0, 0, 1.94883, 0, 0),(55118, 2, 556.001, 97.5598, -96.3128, 0, 0, 1.35115, 0, 0),(55118, 3, 562.821, 116.938, -96.3128, 0, 0, 0.716542, 0, 0),
(55118, 4, 558.737, 80.2023, -96.3128, 0, 0, 4.70244, 0, 0),(55118, 5, 567.894, 47.7771, -96.3128, 0, 0, 4.88465, 0, 0),(55118, 6, 573.623, 24.1758, -96.3128, 0, 0, 5.21452, 0, 0),
(55118, 7, 583.107, 6.90322, -96.3128, 0, 0, 5.56323, 0, 0),(55118, 8, 597.509, 5.07898, -96.3128, 0, 0, 1.18385, 0, 0),(55118, 9, 600.013, 21.6183, -96.3128, 0, 0, 2.22686, 0, 0),
(55118, 10, 575.202, 46.2133, -96.3128, 0, 0, 2.10748, 0, 0);

-- Classic [0936]
-- Fixed speed of NPC 12222 (Creeping Sludge) in Maraudon
UPDATE creature_template SET SpeedWalk = 0.3, SpeedRun = 0.4 WHERE Entry = 12222;

-- Classic [0934] 
-- Added missing NPCs 12224 and 12237 in Maraudon 
-- Spawned missing NPCs in Maraudon : 12224 (Cavern Shambler)
-- Added movement to some of the spawns
-- Fixed rank (is rare elite) and movement of  NPC 12237 (Meshlok the Harvester)
-- Placed NPC 12237 (Meshlok the Harvester) into a pool with its placeholder
DELETE FROM creature WHERE guid IN (54571, 54645);
-- Spawned missing NPCs in Maraudon : 12224 (Cavern Shambler)
DELETE FROM creature WHERE guid BETWEEN 128720 AND 128725;
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128720, 12237, 349, 0, 0, 632.101, -92.409, -57.4999, 3.49563, 7200, 0, 0, 5757, 0, 0, 2),
(128721, 12224, 349, 0, 0, 748.725, -81.8362, -57.4696, 0.620471, 7200, 0, 0, 4434, 2301, 0, 2),
(128722, 12224, 349, 0, 0, 632.101, -92.409, -57.4999, 3.49563, 7200, 0, 0, 4434, 2301, 0, 2),
(128723, 12224, 349, 0, 0, 818.573, -215.097, -77.1489, 4.14281, 7200, 0, 0, 4434, 2301, 0, 2),
(128724, 12224, 349, 0, 0, 813.453, -370.449, -59.2094, 6.02488, 7200, 5, 0, 4434, 2301, 0, 1),
(128725, 12224, 349, 0, 0, 719.899, -83.8715, -57.2155, 3.48941, 7200, 5, 0, 4434, 2301, 0, 1);
-- Added movement to some of the spawns
DELETE FROM creature_movement WHERE id IN (128721, 128722, 128723);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- NPC 1
(128721, 1, 747.806, -79.9688, -57.4744, 0, 0, 3.30872, 0, 0),(128721, 2, 750.866, -86.8807, -57.4595, 0, 0, 2.95922, 0, 0),(128721, 3, 741.016, -94.8653, -57.4978, 0, 0, 1.6319, 0, 0),
(128721, 4, 745.803, -84.0748, -57.4833, 0, 0, 1.16459, 0, 0),(128721, 5, 738.607, -70.5452, -57.4977, 0, 0, 4.23156, 0, 0),(128721, 6, 751.253, -70.6902, -57.3912, 0, 0, 4.39257, 0, 0),
(128721, 7, 744.367, -78.7708, -57.4887, 0, 0, 5.06801, 0, 0),(128721, 8, 756.588, -80.4979, -57.3727, 0, 0, 3.98809, 0, 0),(128721, 9, 736.461, -89.3428, -57.4996, 0, 0, 3.35192, 0, 0),
(128721, 10, 734.7, -80.3283, -57.4996, 0, 0, 0.198547, 0, 0),(128721, 11, 744.209, -79.5844, -57.4915, 0, 0, 0.045395, 0, 0),(128721, 12, 734.044, -71.701, -57.4977, 0, 0, 4.40828, 0, 0),
-- NPC 2
(128722, 1, 632.101, -92.409, -57.4999, 0, 0, 0.240159, 0, 0),(128722, 2, 642.895, -89.225, -57.4999, 0, 0, 0.306918, 0, 0),(128722, 3, 654.193, -88.5337, -57.4999, 0, 0, 6.19348, 0, 0),
(128722, 4, 666.728, -91.7718, -57.4999, 0, 0, 6.01284, 0, 0),(128722, 5, 675.549, -93.9197, -57.4999, 0, 0, 6.13457, 0, 0),(128722, 6, 690.764, -89.7546, -57.4999, 0, 0, 0.61715, 0, 0),
(128722, 7, 702.83, -84.753, -57.4631, 0, 0, 0.173401, 0, 0),(128722, 8, 715.159, -83.791, -57.1193, 0, 0, 0.114496, 0, 0),(128722, 9, 708.503, -83.9885, -57.2554, 0, 0, 3.35426, 0, 0),
(128722, 10, 699.353, -86.647, -57.5, 0, 0, 3.55454, 0, 0),(128722, 11, 681.834, -93.4817, -57.5, 0, 0, 3.35034, 0, 0),(128722, 12, 674.938, -93.0037, -57.5, 0, 0, 2.78878, 0, 0),
(128722, 13, 665.508, -90.6338, -57.5, 0, 0, 2.91051, 0, 0),(128722, 14, 652.935, -87.6942, -57.5, 0, 0, 3.10686, 0, 0),(128722, 15, 634.167, -92.0013, -57.5, 0, 0, 3.60559, 0, 0),
-- NPC 3
(128723, 1, 818.873, -216.343, -77.1489, 0, 0, 2.28534, 0, 0),(128723, 2, 813.487, -210.328, -77.1489, 0, 0, 2.30105, 0, 0),(128723, 3, 806.875, -204.634, -77.1489, 0, 0, 2.43064, 0, 0),
(128723, 4, 804.811, -193.5, -77.1489, 0, 0, 1.55099, 0, 0),(128723, 5, 806.356, -184.124, -77.1489, 0, 0, 1.35857, 0, 0),(128723, 6, 813.319, -173.6, -77.2995, 0, 0, 0.541757, 0, 0),
(128723, 7, 808.847, -175.006, -77.3074, 0, 0, 5.0146, 0, 0),(128723, 8, 805.501, -182.277, -77.1489, 0, 0, 4.41377, 0, 0),(128723, 9, 804.538, -193.051, -77.1489, 0, 0, 4.92428, 0, 0),
(128723, 10, 807.906, -203.501, -77.1489, 0, 0, 5.34446, 0, 0);
-- Fixed rank (is rare elite) and movement of  NPC 12237 (Meshlok the Harvester)
UPDATE creature_template SET MovementType = 2 WHERE Entry = 12237;
DELETE FROM creature_movement_template WHERE entry = 12237;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(12237, 1, 632.101, -92.409, -57.4999, 0, 0, 0.240159, 0, 0),(12237, 2, 642.895, -89.225, -57.4999, 0, 0, 0.306918, 0, 0),(12237, 3, 654.193, -88.5337, -57.4999, 0, 0, 6.19348, 0, 0),
(12237, 4, 666.728, -91.7718, -57.4999, 0, 0, 6.01284, 0, 0),(12237, 5, 675.549, -93.9197, -57.4999, 0, 0, 6.13457, 0, 0),(12237, 6, 690.764, -89.7546, -57.4999, 0, 0, 0.61715, 0, 0),
(12237, 7, 702.83, -84.753, -57.4631, 0, 0, 0.173401, 0, 0),(12237, 8, 715.159, -83.791, -57.1193, 0, 0, 0.114496, 0, 0),(12237, 9, 708.503, -83.9885, -57.2554, 0, 0, 3.35426, 0, 0),
(12237, 10, 699.353, -86.647, -57.5, 0, 0, 3.55454, 0, 0),(12237, 11, 681.834, -93.4817, -57.5, 0, 0, 3.35034, 0, 0),(12237, 12, 674.938, -93.0037, -57.5, 0, 0, 2.78878, 0, 0),
(12237, 13, 665.508, -90.6338, -57.5, 0, 0, 2.91051, 0, 0),(12237, 14, 652.935, -87.6942, -57.5, 0, 0, 3.10686, 0, 0),(12237, 15, 634.167, -92.0013, -57.5, 0, 0, 3.60559, 0, 0);
-- Placed NPC 12237 (Meshlok the Harvester) into a pool with its placeholder
DELETE FROM pool_creature WHERE guid IN (54652, 128720, 128723);
INSERT INTO pool_creature VALUES
(128720, 1211, 30, 'Maraudon - Meshlok the Harvester'),
(128723, 1211, 0, 'Maraudon - Meshlok the Harvester placeholder'),
(54652, 1211, 0, 'Maraudon - Meshlok the Harvester placeholder');
DELETE FROM pool_template WHERE entry = 1211;
INSERT INTO pool_template VALUES
(1211, 1, 'Maraudon - Meshlok the Harvester');

-- Classic [0933]
-- Linked NPC 11784 (Theradrim Guardian) with its small adds 11783 (Theradrim Shardling) in Maraudon
-- The adds will engage along with their master and follow it
DELETE FROM creature_linking_template WHERE entry = 11783;
INSERT creature_linking_template VALUES
(11783, 349, 11784, 1 + 2 + 512, 15);
-- Removed all spawns of NPC 11783 (Theradrim Shardling) in Maraudon
-- because they are summoned
DELETE FROM creature WHERE id = 11783;
-- Removed duplicate NPC 11784 (Theradrim Guardian)
DELETE FROM creature WHERE guid = 55466;
-- Theradrim Guardians now patrol in the last part of Maraudon
UPDATE creature SET MovementType = 2 WHERE id = 11784;
DELETE FROM creature_movement WHERE id = 55465;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id,  orientation, model1, model2) VALUES
(55465, 1, 248.538, -93.024, -129.62, 0, 0, 3.48821, 0, 0),(55465, 2, 219.021, -92.1171, -129.607, 0, 0, 1.77761, 0, 0),(55465, 3, 258.14, -97.1733, -129.619, 0, 0, 4.76526, 0, 0),
(55465, 4, 246.967, -145.304, -130.844, 0, 0, 4.31759, 0, 0),(55465, 5, 213.934, -199.873, -131.159, 0, 0, 4.56106, 0, 0),(55465, 6, 248.627, -140.739, -131.005, 0, 0, 1.24747, 0, 0),
(55465, 7, 259.8, -98.2245, -129.619, 0, 0, 2.83554, 0, 0);
DELETE FROM creature_movement WHERE id = 55471;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id,  orientation, model1, model2) VALUES
(55471, 1, 200.354, -133.505, -101.058, 0, 0, 0.888545, 0, 0),(55471, 9, 199.686, -134.684, -101.541, 0, 0, 4.06627, 0, 0),(55471, 8, 226.955, -112.811, -89.7437, 0, 0, 3.15442, 0, 0),
(55471, 7, 276.408, -121.048, -83.6496, 0, 0, 2.72323, 0, 0),(55471, 6, 299.577, -148.794, -69.9433, 0, 0, 1.75562, 0, 0),(55471, 5, 298.76, -178.312, -59.8991, 0, 0, 4.52729, 0, 0),
(55471, 4, 300.187, -149.075, -69.7502, 0, 0, 4.81004, 0, 0),(55471, 3, 278.173, -121.002, -83.4807, 0, 0, 5.93787, 0, 0),(55471, 2, 230.841, -109.688, -88.8687, 0, 0, 0.20996, 0, 0),
(55471, 10, 183.329, -185.544, -111.375, 0, 0, 4.68595, 0, 0);
DELETE FROM creature_movement WHERE id = 88989;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id,  orientation, model1, model2) VALUES
(88989, 1, 109.037, -268.553, -108.677, 0, 0, 6.01719, 0, 0),(88989, 2, 151.884, -275.712, -108.677, 0, 0, 0.864195, 0, 0),(88989, 3, 143.666, -231.173, -108.852, 0, 0, 2.20251, 0, 0),
(88989, 4, 156.17, -275.286, -108.676, 0, 0, 3.58089, 0, 0),(88989, 5, 138.876, -278.577, -108.676, 0, 0, 2.8379, 0, 0),(88989, 6, 79.5604, -259.988, -108.678, 0, 0, 2.8379, 0, 0),
(88989, 7, 62.416, -207.188, -109.659, 0, 0, 1.94569, 0, 0),(88989, 8, 8.187, -127.348, -123.845, 0, 0, 1.395, 0, 0),(88989, 9, 28.705, -38.025, -128.761, 0, 0, 1.282, 0, 0),
(88989, 10, 8.187, -127.348, -123.845, 0, 0, 5.134, 0, 0),(88989, 11, 62.416, -207.188, -109.659, 0, 0, 1.94569, 0, 0),(88989, 12, 79.0383, -255.555, -108.677, 0, 0, 5.96536, 0, 0);
DELETE FROM creature_movement WHERE id = 56485;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id,  orientation, model1, model2) VALUES
(56485, 1, 150.49, -193.898, -171.747, 0, 0, 4.68202, 0, 0),(56485, 2, 152.233, -231.891, -170.382, 0, 0, 4.4087, 0, 0),(56485, 3, 125.841, -257.66, -168.113, 0, 0, 5.52554, 0, 0),
(56485, 4, 155.987, -284.034, -168.989, 0, 0, 5.89625, 0, 0),(56485, 5, 148.455, -238.759, -169.543, 0, 0, 1.08961, 0, 0),(56485, 6, 155.062, -199.53, -171.957, 0, 0, 3.02876, 0, 0),
(56485, 7, 104.937, -185.658, -167.457, 0, 0, 2.76329, 0, 0),(56485, 8, 100.198, -176.082, -167.457, 0, 0, 1.16972, 0, 0),(56485, 9, 111.893, -160.596, -167.328, 0, 0, 5.89781, 0, 0),
(56485, 10, 121.304, -176.939, -167.457, 0, 0, 5.01502, 0, 0),(56485, 11, 128.284, -191.12, -168.26, 0, 0, 5.77529, 0, 0);
DELETE FROM creature_movement WHERE id = 56501;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id,  orientation, model1, model2) VALUES
(56501, 1, 177.079, -304.031, -172.328, 0, 0, 3.46308, 0, 0),(56501, 2, 146.519, -316.403, -174.591, 0, 0, 4.85009, 0, 0),(56501, 3, 153.733, -376.576, -175.003, 0, 0, 5.94886, 0, 0),
(56501, 4, 211.381, -381.672, -160.691, 0, 0, 6.21354, 0, 0),(56501, 5, 156.615, -376.11, -175.002, 0, 0, 1.73206, 0, 0),(56501, 6, 148.461, -317.13, -174.589, 0, 0, 0.314416, 0, 0);
DELETE FROM creature_movement WHERE id = 56515;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id,  orientation, model1, model2) VALUES
(56515, 1, 312.737, -343.241, -117.348, 0, 0, 1.19013, 0, 0),(56515, 11, 251.778, -396.72, -139.555, 0, 0, 6.22297, 0, 0),(56515, 10, 256.965, -328.427, -140.451, 0, 0, 1.59383, 0, 0),
(56515, 9, 250.345, -396.668, -139.555, 0, 0, 3.10022, 0, 0),(56515, 8, 325.14, -394.223, -124.867, 0, 0, 4.68437, 0, 0),(56515, 7, 317.848, -331.827, -116.777, 0, 0, 4.80689, 0, 0),
(56515, 6, 331.665, -290.395, -118.061, 0, 0, 4.19978, 0, 0),(56515, 5, 345.634, -276.933, -117.941, 0, 0, 4.20528, 0, 0),(56515, 4, 337.697, -262.309, -118.049, 0, 0, 6.10123, 0, 0),
(56515, 3, 320.637, -268.75, -117.912, 0, 0, 0.612865, 0, 0),(56515, 2, 328.91, -288.013, -118.069, 0, 0, 1.41947, 0, 0),(56515, 12, 319.125, -403.751, -124.866, 0, 0, 1.55692, 0, 0);

-- Classic [0930]
-- Linked NPC 12225 (Celebras the Cursed) with its 3 adds 13743 (Corrupt Force of Nature) in Maraudon
-- The adds will engage along with their master, respawn when it evades, despawn when it dies
DELETE FROM creature_linking_template WHERE entry = 13743;
INSERT creature_linking_template VALUES
(13743, 349, 12225, 1 + 2 + 4 + 16, 0);

-- Classic [0928]
-- Linked NPC 12236 (Lord Vyletongue) in Maraudon to its two adds
DELETE FROM creature_linking WHERE guid IN (54676, 54675);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(54675, 54579, 3),
(54676, 54579, 3);

-- Classic [0927]
-- Fixed stats of NPC 12238 (Zaetar's Spirit) in Maraudon
UPDATE creature_template SET UnitClass = 2, MinLevelHealth = 3297, MaxLevelHealth = 3297, MinLevelMana = 2434, MaxLevelMana = 2434, HealthMultiplier = 1.35, ArmorMultiplier = 1 WHERE Entry = 12238;

-- Classic [0926]
-- Prevent NPCs 12238 (Zaetar's Spirit) and 13716 (Celebras the Redeemed) to roam
-- around their spawn point. Now, players will be able to speak with them
-- and get the quest they offer without having the window abruptly closed
-- every few seconds
UPDATE creature_template SET MovementType = 0 WHERE Entry IN (12238, 13716);

-- Classic [0925]
-- BRD - Vault Improvements 
-- Relic Coffer are not selectable by default, to prevent abuse. They should become acessible as soon as you open the doors
DELETE FROM dbscripts_on_go_template_use WHERE buddy_entry = 160836;
INSERT INTO dbscripts_on_go_template_use (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(174554, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174555, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174556, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174557, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174558, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174559, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174560, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174561, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174562, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174563, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174564, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer'),
(174566, 0, 27, 8, 0, 160836, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - Access: Relic Coffer');

-- Classic [0922] 
-- Fixed model of NPC 12423 (Guard Roberts) and 1642 (Northshire Guard) who were using wrong alternate model
-- Fixed model of NPC 1281 (Mountaineer Zaren) who were using an male alternate model though she is female.
UPDATE creature_model_info SET modelid_other_gender = 0 WHERE modelid IN (3257, 3258);
UPDATE creature_template SET modelid2 = 0 WHERE Entry = 1642; -- Northshire Guard
UPDATE creature_model_info SET modelid_other_gender = 3167 WHERE modelid = 5446;
UPDATE creature_model_info SET modelid_other_gender = 0 WHERE modelid IN (1812, 4887);

-- Classic [0921]
-- Fixed stats of NPC 13696 (Noxxious Scion) in Maraudon in order to make the quest 7029 and 7041 (Vyletongue Corruption - Alliance and Horde)
-- completable as the spawns were too strong
UPDATE creature_template SET Rank = 0, MinLevelHealth = 1848, MaxLevelHealth = 1919, HealthMultiplier = 1,
DamageMultiplier = 1.57, MinMeleeDmg = 72, MaxMeleeDmg = 96 WHERE Entry = 13696;

-- Classic [0920]
-- Removed duplicate NPC 12219 (Barbed Lasher) in Maraudon
DELETE FROM creature WHERE guid = 54310;

-- Classic [0919]
-- Huntress Skymane was tired of listening to Archaelogist Greywhiskers
-- 'stories' all day everyday and has joined her colleagues patrolling
-- around Darnassus
UPDATE creature SET MovementType = 2 WHERE id = 14378;
UPDATE creature_template SET MovementType = 2 WHERE Entry = 14378;
DELETE FROM creature_movement_template WHERE entry = 14378;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES 
(14378, 1, 9656.18, 2598.45, 1335.68, 0, 0, 5.42763, 0, 0),(14378, 2, 9660.32, 2598.62, 1335.68, 0, 0, 5.67758, 0, 0),(14378, 3, 9664.55, 2596.83, 1335.68, 0, 0, 5.59118, 0, 0),
(14378, 4, 9668.79, 2593.05, 1335.68, 0, 0, 5.54799, 0, 0),(14378, 5, 9681.01, 2581.18, 1335.68, 0, 0, 5.4773, 0, 0),(14378, 6, 9700.06, 2560.13, 1335.68, 0, 0, 5.46553, 0, 0),
(14378, 7, 9704.62, 2554.05, 1335.68, 0, 0, 5.25347, 0, 0),(14378, 8, 9706.54, 2550.39, 1335.68, 0, 0, 5.09247, 0, 0),(14378, 9, 9710.17, 2537.88, 1335.68, 0, 0, 4.80187, 0, 0),
(14378, 10, 9710.75, 2520.64, 1335.69, 0, 0, 4.75475, 0, 0),(14378, 11, 9710.52, 2513.64, 1335.69, 0, 0, 4.68406, 0, 0),(14378, 12, 9709.42, 2508.07, 1335.68, 0, 0, 4.47201, 0, 0),
(14378, 13, 9707.4, 2500.94, 1335.68, 0, 0, 4.40525, 0, 0),(14378, 14, 9705.06, 2494.84, 1335.68, 0, 0, 4.23247, 0, 0),(14378, 15, 9701.5, 2489.61, 1335.68, 0, 0, 4.00078, 0, 0),
(14378, 16, 9696.14, 2483, 1335.68, 0, 0, 3.99292, 0, 0),(14378, 17, 9689.93, 2476.24, 1335.68, 0, 0, 3.96936, 0, 0),(14378, 18, 9671.14, 2457.36, 1335.68, 0, 0, 3.87904, 0, 0),
(14378, 19, 9665.81, 2451.59, 1335.68, 0, 0, 4.03612, 0, 0),(14378, 20, 9662.34, 2445.56, 1335.68, 0, 0, 4.28744, 0, 0),(14378, 21, 9658.51, 2433.99, 1335.68, 0, 0, 4.58196, 0, 0),
(14378, 22, 9656.64, 2416.64, 1335.68, 0, 0, 4.6605, 0, 0),(14378, 23, 9656.21, 2411.23, 1335.68, 0, 0, 5.33201, 0, 0),(14378, 24, 9657.62, 2407.5, 1335.68, 0, 0, 0.087112, 0, 0),
(14378, 25, 9660.41, 2404.48, 1335.68, 0, 0, 1.0885, 0, 0),(14378, 26, 9663.79, 2405, 1335.68, 0, 0, 1.52832, 0, 0),(14378, 27, 9666.78, 2408.15, 1335.68, 0, 0, 1.1631, 0, 0),
(14378, 28, 9667.68, 2414.61, 1335.68, 0, 0, 1.60685, 0, 0),(14378, 29, 9666.67, 2431.41, 1335.68, 0, 0, 1.52438, 0, 0),(14378, 30, 9666.84, 2434.89, 1335.68, 0, 0, 1.4105, 0, 0),
(14378, 31, 9668.17, 2437.16, 1335.68, 0, 0, 0.923555, 0, 0),(14378, 32, 9671.37, 2439.07, 1335.68, 0, 0, 0.534783, 0, 0),(14378, 33, 9682.48, 2445.66, 1335.68, 0, 0, 0.534783, 0, 0),
(14378, 34, 9686.26, 2448.24, 1335.68, 0, 0, 0.6683, 0, 0),(14378, 35, 9689.86, 2451.4, 1335.68, 0, 0, 0.735059, 0, 0),(14378, 36, 9699.59, 2460.19, 1335.68, 0, 0, 0.617249, 0, 0),
(14378, 37, 9704.56, 2466.22, 1335.68, 0, 0, 0.970683, 0, 0),(14378, 38, 9711.66, 2477.24, 1335.68, 0, 0, 0.998172, 0, 0),(14378, 39, 9716.87, 2487.32, 1335.68, 0, 0, 1.15918, 0, 0),
(14378, 40, 9723.13, 2504.55, 1335.68, 0, 0, 1.24557, 0, 0),(14378, 41, 9723.82, 2507.46, 1335.68, 0, 0, 0.954975, 0, 0),(14378, 42, 9725.99, 2508.91, 1335.68, 0, 0, 0.562276, 0, 0),
(14378, 43, 9728.13, 2509.97, 1335.11, 0, 0, 0.358073, 0, 0),(14378, 47, 9765.19, 2520.92, 1322.01, 0, 0, 0.275602, 0, 0),(14378, 48, 9769, 2521.82, 1320.64, 0, 0, 0.161719, 0, 0),
(14378, 49, 9777.07, 2522.24, 1318.95, 0, 0, 0.043909, 0, 0),(14378, 50, 9887.82, 2524.85, 1318.66, 0, 0, 0.024274, 0, 0),(14378, 51, 9893.16, 2527.88, 1317.06, 0, 0, 0.177427, 0, 0),
(14378, 52, 9900.56, 2529.79, 1315.35, 0, 0, 0.338434, 0, 0),(14378, 53, 9905.75, 2532.06, 1316.06, 0, 0, 0.515148, 0, 0),(14378, 54, 9909.68, 2535.14, 1316.31, 0, 0, 0.809673, 0, 0),
(14378, 55, 9913.72, 2539.99, 1316.71, 0, 0, 0.872505, 0, 0),(14378, 56, 9916.63, 2543.21, 1316.93, 0, 0, 0.73506, 0, 0),(14378, 57, 9921.87, 2547.48, 1317.18, 0, 0, 0.487659, 0, 0),
(14378, 58, 9928.26, 2550.77, 1317.37, 0, 0, 0.436608, 0, 0),(14378, 59, 9942.23, 2554.12, 1316.52, 0, 0, 0.126376, 0, 0),(14378, 60, 9948.7, 2553.54, 1316.38, 0, 0, 6.06791, 0, 0),
(14378, 61, 9954.08, 2551.81, 1316.45, 0, 0, 5.85979, 0, 0),(14378, 62, 9969.74, 2542.73, 1316.55, 0, 0, 5.67915, 0, 0),(14378, 63, 9975.08, 2537.6, 1316.39, 0, 0, 5.4828, 0, 0),
(14378, 64, 9981.07, 2529.62, 1316.28, 0, 0, 5.1176, 0, 0),(14378, 65, 9982.52, 2524.88, 1316.41, 0, 0, 4.75631, 0, 0),(14378, 66, 9981.29, 2520.33, 1316.73, 0, 0, 4.19083, 0, 0),
(14378, 67, 9974.37, 2515.55, 1317.4, 0, 0, 3.66461, 0, 0),(14378, 68, 9970.36, 2511.68, 1317.56, 0, 0, 4.22617, 0, 0),(14378, 69, 9967.51, 2504.84, 1317.04, 0, 0, 4.37147, 0, 0),
(14378, 70, 9964.53, 2499.52, 1316.68, 0, 0, 4.10051, 0, 0),(14378, 71, 9955.46, 2488.89, 1316.39, 0, 0, 4.00233, 0, 0),(14378, 72, 9952.66, 2484.78, 1316.27, 0, 0, 4.24581, 0, 0),
(14378, 73, 9951.14, 2479.14, 1316.13, 0, 0, 4.6817, 0, 0),(14378, 74, 9951.26, 2476.07, 1316.13, 0, 0, 4.7838, 0, 0),(14378, 75, 9954.01, 2390.72, 1329.11, 0, 0, 4.7406, 0, 0),
(14378, 76, 9954.07, 2376.3, 1329.95, 0, 0, 4.69348, 0, 0),(14378, 77, 9953.15, 2341.6, 1330.78, 0, 0, 4.68562, 0, 0),(14378, 78, 9952.9, 2336.6, 1331.57, 0, 0, 4.69348, 0, 0),
(14378, 79, 9952.84, 2329.64, 1333.63, 0, 0, 4.71704, 0, 0),(14378, 80, 9952.91, 2323.1, 1335.56, 0, 0, 4.72882, 0, 0),(14378, 81, 9954.13, 2282.49, 1341.39, 0, 0, 4.7406, 0, 0),
(14378, 82, 9954.13, 2273.11, 1341.39, 0, 0, 4.71311, 0, 0),(14378, 83, 9954.69, 2263.74, 1338.3, 0, 0, 4.85448, 0, 0),(14378, 84, 9955.94, 2257.77, 1336.06, 0, 0, 4.98799, 0, 0),
(14378, 85, 9956.46, 2254.1, 1335.34, 0, 0, 4.77594, 0, 0),(14378, 86, 9955.66, 2143.38, 1327.65, 0, 0, 4.70526, 0, 0),(14378, 87, 9955.42, 2140.11, 1327.64, 0, 0, 4.45393, 0, 0),
(14378, 88, 9953.75, 2133.55, 1327.65, 0, 0, 4.47357, 0, 0),(14378, 89, 9953.16, 2129.89, 1327.65, 0, 0, 4.64242, 0, 0),(14378, 90, 9952.9, 2125.32, 1327.65, 0, 0, 4.68169, 0, 0),
(14378, 91, 9953.07, 2118.56, 1327.64, 0, 0, 4.81521, 0, 0),(14378, 92, 9953.7, 2114.02, 1327.64, 0, 0, 5.02726, 0, 0),(14378, 93, 9954.83, 2110.26, 1327.7, 0, 0, 4.96836, 0, 0),
(14378, 94, 9955.46, 2106.18, 1327.72, 0, 0, 4.7406, 0, 0),(14378, 95, 9955.73, 2095.28, 1327.72, 0, 0, 4.73274, 0, 0),(14378, 96, 9955.64, 2091.79, 1327.72, 0, 0, 4.52069, 0, 0),
(14378, 97, 9954.58, 2088.01, 1327.7, 0, 0, 4.40288, 0, 0),(14378, 98, 9952.2, 2079.61, 1327.69, 0, 0, 4.50891, 0, 0),(14378, 99, 9951.83, 2074.18, 1327.75, 0, 0, 4.77987, 0, 0),
(14378, 100, 9952.93, 2071.12, 1327.79, 0, 0, 5.19613, 0, 0),(14378, 101, 9958.11, 2062.54, 1327.98, 0, 0, 5.28252, 0, 0),(14378, 102, 9960.81, 2058.57, 1328.06, 0, 0, 5.17649, 0, 0),
(14378, 103, 9962.73, 2054.9, 1328.13, 0, 0, 5.32964, 0, 0),(14378, 104, 9965.36, 2051.71, 1328.16, 0, 0, 5.50635, 0, 0),(14378, 105, 9966.79, 2050.07, 1328.16, 0, 0, 5.26288, 0, 0),
(14378, 106, 9967.93, 2046.62, 1328.15, 0, 0, 4.73274, 0, 0),(14378, 107, 9966.99, 2045.42, 1328.17, 0, 0, 4.02588, 0, 0),(14378, 108, 9964.74, 2044.57, 1328.21, 0, 0, 3.26012, 0, 0),
(14378, 109, 9962.34, 2046.65, 1328.25, 0, 0, 2.37262, 0, 0),(14378, 110, 9960.36, 2049.51, 1328.27, 0, 0, 2.20376, 0, 0),(14378, 111, 9959.07, 2052.04, 1328.26, 0, 0, 2.00741, 0, 0),
(14378, 112, 9950.28, 2069.64, 1327.87, 0, 0, 2.0349, 0, 0),(14378, 113, 9948.29, 2074.48, 1327.77, 0, 0, 1.90531, 0, 0),(14378, 114, 9948.3, 2084.36, 1327.76, 0, 0, 1.43799, 0, 0),
(14378, 115, 9949.6, 2089.89, 1327.76, 0, 0, 1.36731, 0, 0),(14378, 116, 9951.77, 2094.43, 1327.73, 0, 0, 1.5558, 0, 0),(14378, 117, 9951.88, 2102.69, 1327.76, 0, 0, 1.73252, 0, 0),
(14378, 118, 9951.08, 2106.76, 1327.74, 0, 0, 1.81891, 0, 0),(14378, 119, 9949.91, 2112.98, 1327.66, 0, 0, 1.67754, 0, 0),(14378, 120, 9949.73, 2123.24, 1327.65, 0, 0, 1.56366, 0, 0),
(14378, 121, 9950.77, 2216.92, 1330.02, 0, 0, 1.55973, 0, 0),(14378, 122, 9950.73, 2222.15, 1330.64, 0, 0, 1.59115, 0, 0),(14378, 123, 9950.12, 2272.14, 1341.39, 0, 0, 1.57544, 0, 0),
(14378, 124, 9949.18, 2292.22, 1341.39, 0, 0, 1.60293, 0, 0),(14378, 125, 9948.65, 2319.06, 1336.55, 0, 0, 1.60293, 0, 0),(14378, 126, 9945.79, 2405.51, 1328.19, 0, 0, 1.599, 0, 0),
(14378, 127, 9944.77, 2436.95, 1324.25, 0, 0, 1.60293, 0, 0),(14378, 128, 9943.98, 2461.62, 1319.47, 0, 0, 1.30448, 0, 0),(14378, 129, 9946.07, 2472.11, 1316.96, 0, 0, 1.38302, 0, 0),
(14378, 130, 9946.62, 2477.31, 1316.07, 0, 0, 1.58329, 0, 0),(14378, 131, 9945.8, 2482.44, 1316.18, 0, 0, 1.7443, 0, 0),(14378, 132, 9944.39, 2485.33, 1316.42, 0, 0, 2.39225, 0, 0),
(14378, 133, 9939.86, 2488.75, 1317.01, 0, 0, 2.56112, 0, 0),(14378, 134, 9937.21, 2490.67, 1317.35, 0, 0, 2.36476, 0, 0),(14378, 135, 9935.45, 2493.64, 1317.81, 0, 0, 1.91709, 0, 0),
(14378, 136, 9935.56, 2497.12, 1317.81, 0, 0, 1.44978, 0, 0),(14378, 137, 9936.5, 2501.6, 1317.84, 0, 0, 1.1042, 0, 0),(14378, 138, 9938.76, 2506.57, 1317.83, 0, 0, 1.23379, 0, 0),
(14378, 139, 9937.61, 2510.13, 1317.81, 0, 0, 2.74568, 0, 0),(14378, 140, 9933.53, 2505.2, 1317.86, 0, 0, 4.1594, 0, 0),(14378, 141, 9932.98, 2502.82, 1317.82, 0, 0, 3.87273, 0, 0),
(14378, 142, 9930.73, 2501.57, 1317.82, 0, 0, 3.22478, 0, 0),(14378, 143, 9926.17, 2501.67, 1318.13, 0, 0, 2.97345, 0, 0),(14378, 144, 9921.99, 2503.47, 1317.86, 0, 0, 2.46687, 0, 0),
(14378, 145, 9918.42, 2506.99, 1317.34, 0, 0, 2.2823, 0, 0),(14378, 146, 9916.02, 2511.1, 1317.06, 0, 0, 1.99955, 0, 0),(14378, 147, 9915.6, 2522.91, 1317.01, 0, 0, 2.21161, 0, 0),
(14378, 148, 9911.31, 2527.55, 1316.39, 0, 0, 2.41189, 0, 0),(14378, 149, 9901.36, 2531.99, 1315.34, 0, 0, 2.75746, 0, 0),(14378, 150, 9890.5, 2534.01, 1317.81, 0, 0, 2.94988, 0, 0),
(14378, 151, 9884.43, 2535.28, 1318.87, 0, 0, 3.15801, 0, 0),(14378, 152, 9777.34, 2532, 1318.99, 0, 0, 3.16587, 0, 0),(14378, 153, 9735.71, 2535.47, 1332.35, 0, 0, 3.29153, 0, 0),
(14378, 154, 9730.37, 2536.56, 1334.2, 0, 0, 2.95774, 0, 0),(14378, 155, 9727.23, 2537.47, 1335.28, 0, 0, 2.62001, 0, 0),(14378, 156, 9723.26, 2538.83, 1335.68, 0, 0, 2.43937, 0, 0),
(14378, 157, 9719.95, 2541.6, 1335.68, 0, 0, 2.08202, 0, 0),(14378, 158, 9717.02, 2545.67, 1335.68, 0, 0, 1.96421, 0, 0),(14378, 159, 9712.54, 2553.65, 1335.68, 0, 0, 1.91708, 0, 0),
(14378, 160, 9708.45, 2562.34, 1335.68, 0, 0, 2.04275, 0, 0),(14378, 161, 9704.53, 2567.86, 1335.68, 0, 0, 2.21946, 0, 0),(14378, 162, 9694.25, 2580.62, 1335.68, 0, 0, 2.29407, 0, 0),
(14378, 163, 9689.33, 2585.89, 1335.68, 0, 0, 2.34512, 0, 0),(14378, 164, 9683.97, 2591, 1335.68, 0, 0, 2.41581, 0, 0),(14378, 165, 9678.26, 2595.75, 1335.68, 0, 0, 2.47079, 0, 0),
(14378, 166, 9672.37, 2599.93, 1335.68, 0, 0, 2.56896, 0, 0),(14378, 167, 9665.34, 2604.32, 1335.68, 0, 0, 2.47471, 0, 0),(14378, 168, 9662.25, 2608.53, 1335.68, 0, 0, 2.99308, 0, 0),
(14378, 169, 9660.53, 2612.76, 1335.68, 0, 0, 3.48395, 0, 0),(14378, 170, 9660.33, 2624.77, 1335.68, 0, 0, 4.03373, 0, 0),(14378, 171, 9659.92, 2629.83, 1335.68, 0, 0, 5.29429, 0, 0),
(14378, 172, 9656.99, 2633.21, 1335.68, 0, 0, 2.63898, 0, 0),(14378, 173, 9652.51, 2633.65, 1335.68, 0, 0, 3.23588, 0, 0),(14378, 174, 9650.51, 2632.43, 1335.68, 0, 0, 3.95845, 0, 0),
(14378, 175, 9649.64, 2628.57, 1335.68, 0, 0, 4.30794, 0, 0),(14378, 176, 9649.42, 2625.32, 1335.68, 0, 0, 4.78703, 0, 0),(14378, 177, 9650.64, 2608.98, 1335.68, 0, 0, 4.78703, 0, 0),
(14378, 178, 9653.03, 2601.61, 1335.68, 0, 0, 5.16009, 0, 0);

-- Classic [0918]
-- Blackrock Depths - Lord Roccor -- Waypoints
SET @POINT := 0;
UPDATE creature SET position_x = 654.6364, position_y = -172.4347, position_z = -73.61314, orientation = 5.094945, modelid = 0, spawndist = 0 WHERE id = 9025;
DELETE FROM creature_movement WHERE id = (SELECT guid FROM creature WHERE id = 9025);
DELETE FROM creature_movement_template WHERE entry = 9025;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(9025, @POINT := @POINT + 1, 657.9712, -180.7225, -74.74625, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 658.9824, -196.5155, -76.57832, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 657.6954, -216.0597, -80.31235, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 640.0506, -245.6001, -83.58563, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 615.5219, -267.3967, -83.59071, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 601.0486, -274.4931, -83.14562, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 578.9769, -274.0088, -80.12082, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 556.1347, -263.5568, -73.27393, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 578.9769, -274.0088, -80.12082, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 601.0486, -274.4931, -83.14562, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 615.5219, -267.3967, -83.59071, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 640.0062, -245.6395, -83.58392, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 657.6954, -216.0597, -80.31235, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 658.9824, -196.5155, -76.57832, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 657.9712, -180.7225, -74.74625, 0, 0, 0, 0, 0),
(9025, @POINT := @POINT + 1, 651.8094, -164.6052, -72.57027, 0, 0, 0, 0, 0);

-- Classic [0914]
-- Hillsbrad Foothills - Quest: Elixir of Suffering, Pain & Agony 
-- These chains are not consecutive, you can have all three in your questlog.
UPDATE quest_template SET PrevQuestId = 0 WHERE entry = 509; 
UPDATE quest_template SET PrevQuestId = 0 WHERE entry = 501; 

-- Classic [0912]
UPDATE quest_template SET PrevQuestId = 0 WHERE entry = 3761;

-- Classic [0911]
-- 1k Needles - Vile Sting should move around and enjoy his life.
UPDATE creature SET spawndist = 30, MovementType = 1 WHERE id = 5937;

-- Classic [0910]
-- Blackrock Depths - Mistress Nagmara wasn't serving the lower part of Plugger Spazzring's bar.
SET @POINT := 0;
UPDATE creature SET position_x = 874.3762, position_y = -187.6327, position_z = -43.62038, orientation = 2.164208, modelid = 0, spawndist = 0 WHERE id = 9500;
DELETE FROM creature_movement WHERE id = (SELECT guid FROM creature WHERE id = 9500);
DELETE FROM creature_movement_template WHERE entry = 9500;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(9500, @POINT := @POINT + 1, 876.3792, -197.3044, -43.70371, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 865.9424, -201.7926, -43.70371, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 856.1331, -216.7420, -43.70494, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 847.7590, -219.7263, -43.70203, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 847.7590, -219.7263, -43.70203, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 842.4940, -211.2741, -43.69165, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 834.2650, -195.0288, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 834.2650, -195.0288, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 827.3196, -180.0794, -49.75323, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 830.1271, -170.9186, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 830.1271, -170.9186, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 837.7622, -167.4380, -49.75323, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 834.8788, -158.4584, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 834.8788, -158.4584, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 850.8875, -158.5179, -49.75803, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 860.3868, -144.9282, -49.75497, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 860.3868, -144.9282, -49.75497, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 873.7460, -150.5549, -49.75750, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 873.7460, -150.5549, -49.75750, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 871.8535, -157.4179, -49.75930, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 860.0489, -158.3442, -49.75855, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 843.7286, -164.5333, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 843.7286, -164.5333, -49.75323, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 831.4695, -174.8025, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 831.4695, -174.8025, -49.75323, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 832.6170, -186.6620, -49.75323, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 839.8559, -204.9304, -46.02564, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 839.8559, -204.9304, -46.02564, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 849.8252, -218.7138, -43.70274, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 855.3878, -214.2639, -43.70450, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 855.3878, -214.2639, -43.70450, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 867.6884, -203.8905, -43.70837, 0, 0, 0, 0, 0),
-- (9500, @POINT := @POINT + 1, 890.0127, -185.4018, -43.70371, 0, 0, 0, 0, 0),
(9500, @POINT := @POINT + 1, 890.0127, -185.4018, -43.70371, 0, 0, 0, 0, 0);

-- Classic [0907]
-- Blackrock Depths - The Phalanx 
UPDATE creature_template SET MovementType = 0 WHERE Entry = 9502;
UPDATE creature SET modelid = 0, position_x = 847.848, position_y = -230.0667, position_z = -43.61398, orientation = 1.64061, spawntimesecs = 604800 WHERE id = 9502;

-- Classic [0905]
-- Fixed drop chance of item 20378 (Twilight Tablet Fragment) in Silithus
-- The item should not drop 100% of the time for players on the quest as
-- the main source intented are the GO on the ground
UPDATE creature_loot_template SET ChanceOrQuestChance = -5 WHERE item = 20378;

-- Classic [0904]
-- Fixed Z position of GO 30856 (Atal'ai Artifact) in Swamp of Sorrows
UPDATE gameobject SET position_z = 18.79 WHERE guid = 30561;

-- Classic [0903]
-- Added missing recipes/plans loots in item 20469 (Decoded True Believer Clippings)
-- Source: http://www.wowhead.com/item=20469#contains
DELETE FROM item_loot_template WHERE entry = 20469 AND item IN (20546, 20547, 20548, 20553, 20554, 20555);
INSERT INTO item_loot_template VALUES
(20469, 20546, 5, 0, 1, 1, 0),
(20469, 20547, 5, 0, 1, 1, 0),
(20469, 20548, 5, 0, 1, 1, 0),
(20469, 20553, 5, 0, 1, 1, 0),
(20469, 20554, 5, 0, 1, 1, 0),
(20469, 20555, 5, 0, 1, 1, 0);

-- Classic [0902]
-- Fixed drop chance of item 4892 (Durotar Tiger Fur) which was too low
UPDATE creature_loot_template SET ChanceOrQuestChance = -35 WHERE item = 4892;-- q.11128 'Propaganda War'
DELETE FROM dbscripts_on_quest_end WHERE id = 11128;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(11128,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Calia active'),
(11128,1,29,2,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
(11128,1,0,0,0,0,0,0,2000000464,0,0,0,0,0,0,0,''),
(11128,3,3,0,0,0,0,0,0,0,0,0,-3817.38,-4566.12,8.84245,1.07843,''),
(11128,5,3,0,0,0,0,0,0,0,0,0,-3816.62,-4564.31,8.97211,1.1499,''),
(11128,6,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11128,15,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11128,15,3,0,0,0,0,0,0,0,0,0,-3817.38,-4566.12,8.84245,0,''),
(11128,16,3,0,0,0,0,0,0,0,0,0,-3819.74,-4562.35,9.14216,2.40855,''),
(11128,17,0,0,0,0,0,0,2000000465,0,0,0,0,0,0,0,''),
(11128,19,29,2,1,0,0,0,0,0,0,0,0,0,0,0,'npc_flag added'),
(11128,20,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Calia unactive');
UPDATE quest_template SET CompleteScript = 11128 WHERE entry = 11128;
DELETE FROM db_script_string WHERE entry IN (2000000464,2000000465);
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000464,'It would be a shame to let these leaflets go to waste, wouldn\'t it?',0,0,0,1,NULL),
(2000000465,'With just a little creative editing, these are much more useful... ',0,0,0,0,NULL);
-- Theramore -- Update
-- Sergeant Amelyn -- waypoints
-- Theramore Guards came back frome future (cata) -- and now have correct (wotlk) waypoints
-- Missing ones added
-- also small update for: Stitched Horror - correct spawn

-- Sergeant Amelyn -- waypoints
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 18589;
DELETE FROM creature_movement WHERE id = 18589;
UPDATE creature_template SET MovementType = 2 WHERE entry = 23835;
DELETE FROM creature_movement_template WHERE entry = 23835;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(23835,1,-3845.5,-4561.34,8.42438,0,0,5.89954,0,0),(23835,2,-3838.69,-4562.43,8.51284,0,0,0.255656,0,0),(23835,3,-3834.04,-4560.31,8.67834,0,0,0.699406,0,0),
(23835,4,-3831.14,-4555.43,8.90911,0,0,1.3183,0,0),(23835,5,-3832.25,-4547.09,9.17283,0,0,2.25921,0,0),(23835,6,-3837.1,-4542.97,9.21158,0,0,2.65074,0,0),
(23835,7,-3843.13,-4541.69,9.09676,0,0,3.36152,0,0),(23835,8,-3849.58,-4544.78,8.78854,0,0,3.84454,0,0),(23835,9,-3852.47,-4549.77,8.59729,0,0,4.50507,0,0),
(23835,10,-3850.63,-4556.64,8.43525,0,0,5.49623,0,0),(23835,11,-3846.7,-4558.22,8.51499,0,0,5.51351,0,0),(23835,12,-3846.7,-4558.22,8.51499,150000,0,3.89208,0,0);

-- Theramore Guards -- spawn point corrected
UPDATE creature SET position_x = -3864.047119, position_y = -4574.887207, position_z = 8.050746, orientation = 3.975231, spawndist = 15, MovementType = 1 WHERE guid = 30656;

-- Theramore Guards should work in pairs
-- 30634 and 30634 - wrong wps fixed. + link 
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 30634;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 30633;
DELETE FROM creature_movement WHERE id IN (30634,30633);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(30634,1,-3618.87,-4338.46,8.92569,0,0,0.670259,0,0),(30634,2,-3605.54,-4327.62,9.43362,0,0,0.685966,0,0),(30634,3,-3595.24,-4319,7.52476,3000,0,0.639628,0,0),
(30634,4,-3596.5,-4325.37,8.36596,0,0,3.70033,0,0),(30634,5,-3611.79,-4337.68,9.46105,0,0,3.80636,0,0),(30634,6,-3623.07,-4346.82,7.74394,0,0,3.80089,0,0),
(30634,7,-3629.41,-4351.74,5.99012,0,0,3.80089,0,0),(30634,8,-3651.49,-4369.54,9.3791,2000,0,3.8417,0,0),(30634,9,-3649.29,-4363.62,9.23098,0,0,0.660052,0,0),
(30634,10,-3631.88,-4349.01,6.05115,0,0,0.692253,0,0);
DELETE FROM creature_linking WHERE guid = 30633;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(30633, 30634, 512);
-- 30644 and 30643 - wrong wps fixed + link
UPDATE creature SET position_x = -3684.833740, position_y = -4475.191895, position_z = 11.761748, orientation = 0.844338 WHERE guid = 30643;
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 30643;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 30644;
DELETE FROM creature_movement WHERE id IN (30643,30644);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(30643,1,-3679.7,-4468.75,11.5796,1000,497901,1.15329,0,0),(30643,2,-3675.39,-4456.55,11.4846,0,0,1.47138,0,0),(30643,3,-3673.94,-4419.96,11.2135,0,0,1.54599,0,0),
(30643,4,-3674.24,-4400.51,10.7088,0,0,1.73213,0,0),(30643,5,-3675.96,-4394.77,10.624,0,0,2.19316,0,0),(30643,6,-3680.25,-4392.75,10.6125,0,0,3.02568,0,0),
(30643,7,-3696.75,-4392.7,13.5437,0,0,3.12464,0,0),(30643,8,-3703.1,-4392.73,15.9825,0,0,3.57782,0,0),(30643,9,-3707.81,-4395.67,17.7928,0,0,3.92187,0,0),
(30643,10,-3711.49,-4401.82,20.4451,0,0,4.24388,0,0),(30643,11,-3714.61,-4409.16,23.324,0,0,4.08602,0,0),(30643,12,-3721.77,-4415.38,26.1858,3000,0,3.83941,0,0),
(30643,13,-3720.04,-4409.84,24.4707,0,0,0.827402,0,0),(30643,14,-3716.21,-4404.82,22.4493,0,0,1.12585,0,0),(30643,15,-3713.1,-4397.83,19.645,0,0,0.982126,0,0),
(30643,16,-3709.22,-4392.7,17.7584,0,0,0.61613,0,0),(30643,17,-3704.55,-4390.33,16.2071,0,0,0.273697,0,0),(30643,18,-3696.17,-4389.93,13.1989,0,0,6.25843,0,0),
(30643,19,-3689.48,-4389.6,11.1495,0,0,0.27998,0,0),(30643,20,-3682.87,-4387.13,10.6097,0,0,0.118188,0,0),(30643,21,-3676.26,-4387.96,10.4594,0,0,5.65368,0,0),
(30643,22,-3671.9,-4393.95,10.5895,0,0,4.95546,0,0),(30643,23,-3670.12,-4407.01,10.613,0,0,4.78111,0,0),(30643,24,-3670.61,-4434.57,11.2723,0,0,4.65937,0,0),
(30643,25,-3671.58,-4453.53,11.3598,0,0,4.48344,0,0),(30643,26,-3675.29,-4467.09,11.3622,0,0,4.17007,0,0),(30643,27,-3681.77,-4477.23,11.4931,0,0,3.91561,0,0),
(30643,28,-3691.84,-4485.12,11.9509,0,0,3.68313,0,0),(30643,29,-3704.93,-4492,12.2934,0,0,3.56532,0,0),(30643,30,-3722.11,-4499.53,12.6519,0,0,3.52212,0,0),
(30643,31,-3737.38,-4504.39,12.7619,0,0,3.41217,0,0),(30643,32,-3755.25,-4509.12,12.5852,0,0,3.41452,0,0),(30643,33,-3771.1,-4512.03,12.2303,0,0,3.3242,0,0),
(30643,34,-3795.2,-4513.99,11.5415,0,0,3.46636,0,0),(30643,35,-3807.35,-4521.96,9.75797,0,0,3.91168,0,0),(30643,36,-3822.92,-4537.21,9.21865,0,0,3.91718,0,0),
(30643,37,-3830.78,-4545.17,9.21865,0,0,4.06797,0,0),(30643,38,-3830.35,-4551.46,9.06977,0,0,4.6688,0,0),(30643,39,-3831.51,-4558.27,8.85811,0,0,4.346,0,0),
(30643,40,-3836.16,-4563.35,8.56187,0,0,3.5881,0,0),(30643,41,-3843.31,-4564.34,8.37255,0,0,3.01683,0,0),(30643,42,-3850.33,-4561.42,8.30779,0,0,2.45291,0,0),
(30643,43,-3854.74,-4554.54,8.38975,0,0,1.717,0,0),(30643,44,-3852.95,-4546.57,8.63064,0,0,1.10351,0,0),(30643,45,-3848.58,-4542.12,9.00319,0,0,0.421784,0,0),
(30643,46,-3840.52,-4541.22,9.1465,0,0,6.15755,0,0),(30643,47,-3835.21,-4543.37,9.18398,0,0,0.279628,0,0),(30643,48,-3825.16,-4533.75,9.21787,0,0,0.79485,0,0),
(30643,49,-3809.29,-4519.13,9.85881,0,0,0.649551,0,0),(30643,50,-3800.73,-4512.63,11.4626,0,0,0.429639,0,0),(30643,51,-3793.88,-4509.93,11.5422,0,0,0.0589311,0,0),
(30643,52,-3777.41,-4509.2,12.2954,0,0,0.122582,0,0),(30643,53,-3755.42,-4504.67,12.9063,0,0,0.17756,0,0),(30643,54,-3731.24,-4498.58,13.0048,0,0,0.236465,0,0),
(30643,55,-3716.4,-4493.13,12.7937,0,0,0.377837,0,0),(30643,56,-3701.82,-4486.44,12.3934,0,0,0.436742,0,0),(30643,57,-3691.81,-4480.81,12.0252,0,0,0.625237,0,0),
(30643,58,-3685.02,-4475.38,11.7683,1000,497902,0.774463,0,0);
DELETE FROM creature_linking WHERE guid = 30644;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(30644, 30643, 512);
-- 30638 and 30639 - wrong wps fixed + link
UPDATE creature SET position_x = -3692.260010, position_y = -4377.211914, position_z = 10.612564, orientation = 5.529586 WHERE guid = 30638;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 30638;
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 30639;
DELETE FROM creature_movement WHERE id IN (30638,30639);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(30639,1,-3680.76,-4381.97,10.5645,1000,497901,5.72122,0,0),(30639,2,-3673.04,-4391.08,10.5271,0,0,5.05442,0,0),(30639,3,-3669.26,-4409.72,10.6197,0,0,4.77561,0,0),
(30639,4,-3669.39,-4431.5,11.264,0,0,4.68529,0,0),(30639,5,-3671.5,-4454.84,11.3452,0,0,4.66094,0,0),(30639,6,-3675.31,-4467.79,11.3624,0,0,4.14415,0,0),
(30639,7,-3687.56,-4481.97,11.7599,0,0,3.86063,0,0),(30639,8,-3706.28,-4492.55,12.3353,0,0,3.57003,0,0),(30639,9,-3727.55,-4501.54,12.7,0,0,3.37761,0,0),
(30639,10,-3749.83,-4508,12.6542,0,0,3.4208,0,0),(30639,11,-3768.59,-4511.94,12.275,0,0,3.33441,0,0),(30639,12,-3784.12,-4513.69,11.8161,0,0,3.22053,0,0),
(30639,13,-3791.71,-4513.16,11.5189,0,0,2.81605,0,0),(30639,14,-3798.05,-4508.75,11.5403,0,0,2.26705,0,0),(30639,15,-3806.97,-4489.25,11.9206,0,0,1.96389,0,0),
(30639,16,-3814.24,-4470.58,12.6997,0,0,1.80759,0,0),(30639,17,-3814.65,-4447.15,12.7041,0,0,1.54527,0,0),(30639,18,-3814.78,-4427.61,12.7665,0,0,1.60025,0,0),
(30639,19,-3811.63,-4414.81,12.7831,0,0,1.23504,0,0),(30639,20,-3804.17,-4401.99,11.7984,0,0,0.700967,0,0),(30639,21,-3790.15,-4393.62,10.4463,0,0,0.286277,0,0),
(30639,22,-3766.9,-4387.99,10.8432,0,0,0.422151,0,0),(30639,23,-3735.79,-4371.46,10.6132,0,0,0.492837,0,0),(30639,24,-3720.68,-4364.3,10.6123,0,0,0.313766,0,0),
(30639,25,-3706.65,-4364.11,10.613,0,0,5.8901,0,0),(30639,26,-3691.2,-4375.61,10.6133,1000,497902,5.81774,0,0);
DELETE FROM creature_linking WHERE guid = 30638;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(30638, 30639, 512);
-- 54310 and 54571 -- missing added + link
-- UDB empty guids reused
DELETE FROM creature WHERE guid IN (54310,54571);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(54310,4979,1,1,1,0,0,-3807.06,-4479.2,12.6748,5.12423,360,0,0,5071,0,0,2),
(54571,4979,1,1,1,0,0,-3808.67,-4479.9,12.6631,5.12423,360,0,0,5071,0,0,0);
DELETE FROM creature_movement WHERE id IN (54310,54571);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54310,1,-3800.44,-4494.17,11.5613,1000,497901,5.11638,0,0),(54310,2,-3797.36,-4503.56,11.5546,0,0,4.77001,0,0),(54310,3,-3798.16,-4511.52,11.5428,0,0,4.30035,0,0),
(54310,4,-3805.8,-4520.85,9.95399,0,0,3.96577,0,0),(54310,5,-3822.64,-4538.08,9.21827,0,0,3.93435,0,0),(54310,6,-3830.74,-4544.93,9.21827,0,0,3.76785,0,0),
(54310,7,-3836.15,-4546.38,9.25034,0,0,2.96046,0,0),(54310,8,-3842.03,-4544.86,9.22394,0,0,3.08933,0,0),(54310,9,-3847.31,-4546.23,8.90135,0,0,3.79383,0,0),
(54310,10,-3850.49,-4551.63,8.63787,0,0,4.67868,0,0),(54310,11,-3848.9,-4557.78,8.43152,0,0,5.3981,0,0),(54310,12,-3843.6,-4561.7,8.45701,0,0,6.18977,0,0),
(54310,13,-3836.59,-4560.35,8.69577,0,0,0.54119,0,0),(54310,14,-3832.98,-4555.53,8.8495,0,0,1.20407,0,0),(54310,15,-3832.91,-4548.91,9.08172,0,0,1.73028,0,0),
(54310,16,-3831.78,-4542.91,9.21922,0,0,0.994365,0,0),(54310,17,-3825.16,-4534.65,9.21922,0,0,0.721831,0,0),(54310,18,-3802.37,-4512.15,11.3335,3000,0,0.803513,0,0),
(54310,19,-3801.35,-4504.08,11.573,0,0,1.7185,0,0),(54310,20,-3804.61,-4493.02,11.66,0,0,1.88736,0,0),(54310,21,-3811.27,-4476.45,12.6976,0,0,1.75542,0,0),
(54310,22,-3813.51,-4466.46,12.6997,0,0,1.62347,0,0),(54310,23,-3813.86,-4450.22,12.7001,0,0,1.58027,0,0),(54310,24,-3813.57,-4428.9,12.7114,0,0,1.43026,0,0),
(54310,25,-3811.28,-4417.94,12.7054,0,0,1.13809,0,0),(54310,26,-3804.17,-4404.95,12.0706,0,0,0.908756,0,0),(54310,27,-3795.55,-4396.78,10.7908,0,0,0.428092,0,0),
(54310,28,-3783.55,-4392.79,10.6013,0,0,0.251378,0,0),(54310,29,-3764.57,-4388,10.7648,0,0,0.395891,0,0),(54310,30,-3744.72,-4376.1,10.6153,0,0,0.549044,0,0),
(54310,31,-3722.36,-4366.04,10.6126,0,0,0.415526,0,0),(54310,32,-3718.78,-4363.55,10.6126,0,0,0.970803,0,0),(54310,33,-3717.35,-4355.41,10.6126,0,0,1.50723,0,0),
(54310,34,-3716.43,-4347.11,10.6126,0,0,1.2504,0,0),(54310,35,-3712.34,-4341.61,10.6126,4000,0,0.890489,0,0),(54310,36,-3715.46,-4364.03,10.6124,0,0,4.14754,0,0),
(54310,37,-3722.47,-4368.69,10.6124,0,0,3.7428,0,0),(54310,38,-3743.64,-4379.64,10.6884,0,0,3.60536,0,0),(54310,39,-3763.98,-4390.51,10.7454,0,0,3.49147,0,0),
(54310,40,-3791.73,-4398.1,10.5897,0,0,3.37759,0,0),(54310,41,-3800.01,-4403.57,11.464,0,0,3.85904,0,0),(54310,42,-3808.22,-4416.12,12.7012,0,0,4.39704,0,0),
(54310,43,-3810.66,-4428.11,12.7104,0,0,4.78345,0,0),(54310,44,-3811.06,-4452.62,12.7018,0,0,4.68135,0,0),(54310,45,-3811.04,-4466.99,12.718,0,0,4.96409,0,0),
(54310,46,-3807.09,-4479.09,12.6775,1000,497902,5.08975,0,0);
DELETE FROM creature_linking WHERE guid = 54571;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(54571, 54310, 512);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 497901 AND 497902; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(497901,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Theramore Guard - active'),
(497902,1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Theramore Guard - unactive');

-- Stitched Horror - correct spawn
UPDATE creature SET position_x = 3359.098633, position_y = -3048.040527, position_z = 165.255981, orientation = 2.147723 WHERE guid = 86295;
-- Classic [0904] + UDB correct (ClassicDB was to high)
-- Fixed Z position of GO 30856 (Atal'ai Artifact) in Swamp of Sorrows
UPDATE gameobject SET position_z = 18.6 WHERE guid = 30561;
-- q.3382 'A Crew Under Fire'
DELETE FROM dbscripts_on_quest_start WHERE id = 3382;
INSERT INTO dbscripts_on_quest_start  (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3382,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Calia active'),
(3382,1,0,0,0,0,0,0,2000000466,0,0,0,0,0,0,0,''),
(3382,1,22,495,0x01,0,0,0,0,0,0,0,0,0,0,0,'temp faction'),
(3382,2,15,6245,0,8386,35900,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3382,2,15,6245,0,8386,35905,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3382,2,15,6245,0,8386,35906,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3382,2,15,6245,0,8386,35904,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3382,2,15,6245,0,8386,35903,7 | 0x10,0,0,0,0,0,0,0,0,''),
(3382,3,22,495,0x01,8386,35900,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,3,22,495,0x01,8386,35905,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,3,22,495,0x01,8386,35906,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,3,22,495,0x01,8386,35904,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,3,22,495,0x01,8386,35903,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,4,22,495,0x01,8381,35890,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,4,22,495,0x01,8378,35884,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,4,22,495,0x01,8382,35891,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,4,22,495,0x01,8382,35891,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,5,22,495,0x01,8386,35899,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(3382,5,10,12205,300000,0,0,0,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'1st wave'),
(3382,6,10,12204,300000,0,0,0,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'1st wave'),
(3382,6,10,12204,300000,0,0,0,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'1st wave'),
(3382,6,10,12204,300000,0,0,0,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'1st wave'),
(3382,59,34,944,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if player is dead or out of range'),
(3382,59,34,945,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if npc is dead'),
(3382,60,10,12204,300000,0,0,0,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'2nd wave'),
(3382,61,10,12204,300000,0,0,0,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'2nd wave'),
(3382,61,10,12205,300000,0,0,0,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'2nd wave'),
(3382,62,10,12204,300000,0,0,0,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'2nd wave'),
(3382,114,34,944,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if player is dead or out of range'),
(3382,114,34,945,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if npc is dead'),
(3382,115,10,12204,300000,0,0,0,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'3rd wave'),
(3382,115,10,12205,300000,0,0,0,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'3rd wave'),
(3382,116,10,12204,300000,0,0,0,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'3rd wave'),
(3382,116,10,12204,300000,0,0,0,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'3rd wave'),
(3382,169,34,944,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if player is dead or out of range'),
(3382,169,34,945,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if npc is dead'),
(3382,170,10,12204,300000,0,0,0,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'4th wave'),
(3382,170,10,12204,300000,0,0,0,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'4th wave'),
(3382,170,10,12204,300000,0,0,0,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'4th wave'),
(3382,170,10,12205,300000,0,0,0,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'4th wave'),
(3382,224,34,944,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if player is dead or out of range'),
(3382,224,34,945,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if npc is dead'),
(3382,225,10,12205,300000,0,0,0,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'5th wave'),
(3382,226,10,12204,300000,0,0,0,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'5th wave'),
(3382,226,10,12204,300000,0,0,0,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'5th wave'),
(3382,227,10,12205,300000,0,0,0,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'5th wave'),
(3382,279,34,944,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if player is dead or out of range'),
(3382,279,34,945,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if npc is dead'),
(3382,280,10,12205,300000,0,0,0,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'final wave'),
(3382,281,10,12204,300000,0,0,0,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'final wave'),
(3382,281,10,12204,300000,0,0,0,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'final wave'),
(3382,282,10,12205,300000,0,0,0,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'final wave'),
(3382,334,34,944,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if player is dead or out of range'),
(3382,334,34,945,3382,0,0,0,0,0,0,0,0,0,0,0,'Stop script if npc is dead'),
(3382,335,7,3382,0,0,0,0,0,0,0,0,0,0,0,0,'quest credit'),
(3382,337,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Calia unactive');
UPDATE quest_template SET SpecialFlags = 3, StartScript = 3382 WHERE entry = 3382;
DELETE FROM db_script_string WHERE entry = 2000000466;
INSERT INTO db_script_string (entry,content_default,sound,type,language,emote,comment) VALUES
(2000000466,'Stand Prepared! The naga won\'t wait long to press their advantage once they know we\'re alive.',0,0,0,5,'');
-- Spitelash Witch
UPDATE creature_template SET MovementType = 2 WHERE entry = 12205;
DELETE FROM creature_movement_template WHERE entry = 12205;
INSERT INTO creature_movement_template (entry,point,position_x,position_y,position_z,waittime,script_id,orientation,model1,model2) VALUES
(12205,1,2370.83,-5893.06,10.6607,1000,1220501,5.45564,0,0),
(12205,2,2377.23,-5904.07,11.067,0,0,4.84696,0,0),
(12205,3,2378.04,-5915.15,10.7378,0,0,4.5383,0,0),
(12205,4,2374.96,-5932,9.66682,0,0,4.76293,0,0),
(12205,5,2374.06,-5963.62,9.89577,300000,0,4.63726,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1220501;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1220501,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');
-- Spitelash Raider
UPDATE creature_template SET MovementType = 2 WHERE entry = 12204;
DELETE FROM creature_movement_template WHERE entry = 12204;
INSERT INTO creature_movement_template (entry,point,position_x,position_y,position_z,waittime,script_id,orientation,model1,model2) VALUES
(12204,1,2370.83,-5893.06,10.6607,1000,1220401,5.45564,0,0),
(12204,2,2379.97,-5904.9,10.7712,0,0,4.45113,0,0),
(12204,3,2376.15,-5924.8,9.84824,0,0,4.53485,0,0),
(12204,4,2373.41,-5962.79,9.70075,300000,0,4.66837,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1220401;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1220401,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');
-- Captain Vanessa Beltis
DELETE FROM gossip_menu WHERE entry = 1641; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(1641, 2293, 0, 0),
(1641, 3073, 0, 1001);
DELETE FROM conditions WHERE condition_entry = 1001;
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1001, 9, 3382, 0);
-- Horizon Scout Crewman
UPDATE creature SET orientation = 2.43043 WHERE guid = 35899;
-- q.5151'Hypercapacitor Gizmo'
-- Enraged Panther will attack player after cage open.
DELETE FROM dbscripts_on_go_template_use WHERE id = 176195;
INSERT INTO dbscripts_on_go_template_use (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,comments) VALUES
(176195, 3, 26, 0, 0, 10992, 50, 3, 'Enraged Panther - attack');
-- r3103
UPDATE creature_template SET ScriptName='npc_black_knight_ghoul' WHERE entry IN (35545,35564,35590);

-- r3116
UPDATE creature_template SET ScriptName='boss_crusader_death_knight' WHERE entry IN (34461,34458);
UPDATE creature_template SET ScriptName='boss_crusader_druid_balance' WHERE entry IN (34460,34451);
UPDATE creature_template SET ScriptName='boss_crusader_druid_resto' WHERE entry IN (34469,34459);
UPDATE creature_template SET ScriptName='boss_crusader_hunter' WHERE entry IN (34467,34448);
UPDATE creature_template SET ScriptName='boss_crusader_mage' WHERE entry IN (34468,34449);
UPDATE creature_template SET ScriptName='boss_crusader_paladin_holy' WHERE entry IN (34465,34445);
UPDATE creature_template SET ScriptName='boss_crusader_paladin_retri' WHERE entry IN (34471,34456);
UPDATE creature_template SET ScriptName='boss_crusader_priest_disc' WHERE entry IN (34466,34447);
UPDATE creature_template SET ScriptName='boss_crusader_priest_shadow' WHERE entry IN (34473,34441);
UPDATE creature_template SET ScriptName='boss_crusader_rogue' WHERE entry IN (34472,34454);
UPDATE creature_template SET ScriptName='boss_crusader_shaman_enha' WHERE entry IN (34463,34455);
UPDATE creature_template SET ScriptName='boss_crusader_shaman_resto' WHERE entry IN (34470,34444);
UPDATE creature_template SET ScriptName='boss_crusader_warlock' WHERE entry IN (34474,34450);
UPDATE creature_template SET ScriptName='boss_crusader_warrior' WHERE entry IN (34475,34453);-- ToC25 - Valkyrs
-- addons
DELETE FROM creature_template_addon WHERE entry IN (34628,34630);
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, auras) VALUES
(34628, 0, 0x0, 0x1, '65796'),
(34630, 0, 0x0, 0x1, '65794');
-- spell clicks
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34567,34568);
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, quest_start, quest_start_active, quest_end, cast_flags, condition_id) VALUES
(34567,65684,0,0,0,1,0),
(34568,65686,0,0,0,1,0);
-- spell target
DELETE FROM spell_script_target WHERE entry IN (66133);
insert into spell_script_target (entry,type,targetEntry,inverseEffectMask) values
(66133,1,34497,0),
(66133,1,34496,0);
-- movement
DELETE FROM creature_movement_template WHERE entry IN (34497);
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, script_id, waittime, orientation) VALUES
(34497,1,571.684,204.902,399.263,3449701,0,0),
(34497,2,572.097,200.955,401.193,0,0,0),
(34497,3,571.792,184.486,401.215,0,0,0),
(34497,4,583.332,178.722,401.208,0,0,0),
(34497,5,584.479,167.847,400.696,3449605,1000,4.59022);
DELETE FROM creature_movement_template WHERE entry IN (34496);
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, script_id, waittime, orientation) VALUES
(34496,1,555.451,205.888,399.263,3449601,0,0),
(34496,2,554.634,202.500,401.184,0,0,0),
(34496,3,555.075,179.826,401.202,0,0,0),
(34496,4,540.257,175.635,400.786,0,0,0),
(34496,5,540.467,170.601,400.772,3449605,1000,4.88692);
-- scripts
DELETE FROM dbscripts_on_creature_movement WHERE id IN (3449701,3449601,3449605);
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,x,y,z,comments) VALUES
-- pause wp
(3449605,0,32,1,0,0,0,0,0,0,0,'Valkyr - pause wp'),
-- light valkyr
(3449701,1,10,34568,0,0,0,0,542.644,117.319,394.784,'Summon Light Essence'),
(3449701,1,10,34568,0,0,0,0,589.743,163.095,394.775,'Summon Light Essence'),
(3449701,1,10,34720,0,0,0,0,526.3368, 99.55556, 395.2900,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,514.7847, 118.7309, 395.2871,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,510.7587, 127.3333, 395.2625,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,509.6389, 133.2604, 395.2467,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,520.2118, 108.4288, 395.2892,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,538.0243, 92.44097, 395.2885,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,588.6754, 93.09375, 395.2885,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,546.0573, 88.76910, 395.2838,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,615.4011, 130.8160, 395.2631,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,599.3073, 98.80035, 395.2898,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,606.6858, 106.7309, 395.2894,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,580.4861, 89.69097, 395.2867,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,570.7795, 86.29861, 395.2533,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,612.1180, 118.8438, 395.2871,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,555.6945, 86.02084, 395.2529,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,507.1806, 142.2847, 395.2546,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,517.7222, 169.0694, 395.2889,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,515.3993, 159.7500, 395.2871,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,524.2570, 178.1337, 395.2896,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,511.1320, 151.1563, 395.2640,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,544.0938, 184.6476, 395.2856,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,563.9965, 187.6441, 395.4890,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,610.9827, 164.6962, 395.2883,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,581.2430, 184.0625, 395.2871,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,592.1511, 183.8004, 395.2789,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,603.5278, 175.4757, 395.2891,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,577.7570, 184.4358, 395.2889,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,557.7430, 187.7292, 395.9153,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,551.3281, 187.6458, 395.5959,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,535.9236, 184.2066, 395.2793,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,571.1580, 187.6910, 395.6292,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,615.1371, 150.8177, 395.2690,'Summon Val\'kyr Twins Bullet Stalker Light'),
(3449701,1,10,34720,0,0,0,0,618.9653, 139.1736, 395.2881,'Summon Val\'kyr Twins Bullet Stalker Light'),
-- dark valkyr
(3449601,1,10,34567,0,0,0,0,536.550,164.550,394.785,'Summon Dark Essence'),
(3449601,1,10,34567,0,0,0,0,588.208,115.666,394.530,'Summon Dark Essence'),
(3449601,1,10,34704,0,0,0,0,515.3524, 115.3490, 395.2883,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,511.4167, 127.1580, 395.2664,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,522.9549, 102.1267, 395.2899,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,578.7222, 87.44444, 395.2724,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,534.7483, 92.64236, 395.2892,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,605.5139, 103.8628, 395.2897,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,549.7639, 86.44444, 395.2658,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,616.4323, 126.4184, 395.2641,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,611.6563, 114.2813, 395.2884,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,592.7361, 93.66666, 395.2889,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,563.4670, 81.93229, 395.2878,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,514.5660, 159.9184, 395.2870,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,509.7431, 149.0052, 395.2527,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,526.8333, 181.7830, 395.2847,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,518.5035, 170.6493, 395.2891,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,506.0382, 139.5174, 395.2882,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,554.8177, 187.5677, 395.2875,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,577.2986, 186.8542, 395.2890,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,608.1163, 171.7309, 395.2892,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,620.4653, 134.6597, 395.2328,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,586.3438, 184.0781, 395.2831,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,547.7604, 184.6337, 395.2885,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,597.3802, 183.6719, 395.2797,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,560.4844, 187.7431, 395.9587,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,573.5781, 187.6649, 395.4919,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,568.0486, 187.6701, 395.5632,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,539.1788, 184.1319, 395.2818,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,615.1371, 156.9965, 395.2795,'Summon Val\'kyr Twins Bullet Stalker Dark'),
(3449601,1,10,34704,0,0,0,0,619.7708, 143.7101, 395.2442,'Summon Val\'kyr Twins Bullet Stalker Dark');
-- q.12755 'A Meeting With Fate'
-- Scarlet Champions will be happy to see heir courier arrived... 

-- spell
DELETE FROM dbscripts_on_spell WHERE id = 53083;
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(53083,1,35,5,12,0,0,6,0,0,0,0,0,0,0,0,'Send event AI');
-- Target for 53083
DELETE FROM spell_script_target WHERE entry = 53083;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES 
(53083,1,29080);
-- ToC25
-- linking
DELETE FROM creature_linking_template WHERE entry IN (34496,34704,34720,34628,34630,34567,34568);
INSERT INTO creature_linking_template (entry,map,master_entry,flag,search_range) VALUES
(34496,649,34497,4099,0),
(34704,649,34497,4112,0),
(34720,649,34497,4112,0),
(34628,649,34497,4112,0),
(34630,649,34497,4112,0),
(34567,649,34497,4112,0),
(34568,649,34497,4112,0);
-- achiev criterias
-- upper back pain
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (11779,11780,11802,11801) AND type IN (11, 18);
INSERT INTO achievement_criteria_requirement VALUES
(11779,18,0,0),
(11780,18,0,0),
(11802,18,0,0),
(11801,18,0,0);
-- three sixty pain spike
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (11838,11861,11839,11862) AND type IN (11, 18);
INSERT INTO achievement_criteria_requirement VALUES
(11838,18,0,0),
(11861,18,0,0),
(11839,18,0,0),
(11862,18,0,0);
-- salt and pepper
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (11778,11818,11860,12258) AND type IN (11, 18);
-- tribute immportality
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (12358,12359) AND type IN (11, 18, 12);
INSERT INTO achievement_criteria_requirement VALUES
(12358,18,0,0),
(12359,18,0,0),
(12358,12,3,0),
(12359,12,3,0);
-- tribute insanity
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (12349,12343) AND type IN (11, 18, 12);
INSERT INTO achievement_criteria_requirement VALUES
(12349,18,0,0),
(12343,18,0,0),
(12349,12,2,0),
(12343,12,3,0);
-- tribute mad skill
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (12347,12348,12341,12342) AND type IN (11, 18, 12);
INSERT INTO achievement_criteria_requirement VALUES
(12347,18,0,0),
(12348,18,0,0),
(12347,12,2,0),
(12348,12,2,0),
(12341,18,0,0),
(12342,18,0,0),
(12341,12,3,0),
(12342,12,3,0);
-- tribute skill
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (12344,12345,12346,12338,12339,12340) AND type IN (11, 18, 12);
INSERT INTO achievement_criteria_requirement VALUES
(12344,18,0,0),
(12345,18,0,0),
(12346,18,0,0),
(12344,12,2,0),
(12345,12,2,0),
(12346,12,2,0),
(12338,18,0,0),
(12339,18,0,0),
(12340,18,0,0),
(12338,12,3,0),
(12339,12,3,0),
(12340,12,3,0);
-- Scarlet Armies Approach...(q.12757)
DELETE FROM dbscripts_on_quest_start WHERE id = 12757;
INSERT INTO dbscripts_on_quest_start (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(12757,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Obraz active'),
(12757,1,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(12757,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.391101,''),
(12757,3,15,53105,0,0,0,0,0,0,0,0,0,0,0,0,''),
(12757,5,0,0,0,0,0,0,2000000008,0,0,0,0,0,0,0,''),
(12757,9,3,0,0,0,0,0,0,0,0,0,0,0,0,5.235988,''),
(12757,9,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(12757,10,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Obraz unactive');
UPDATE quest_template SET StartScript = 12757 WHERE entry = 12757;
UPDATE db_script_string SET emote = 25 WHERE entry = 2000000008;
-- dummy for 53105
DELETE FROM dbscripts_on_spell WHERE id = 53105;
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(53105,0,15,53097,0,0,0,0,0,0,0,0,0,0,0,0,'');
-- dummy for 53099
DELETE FROM dbscripts_on_spell WHERE id = 53099;
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(53099,0,15,53098,0,0,0,0,0,0,0,0,0,0,0,0,'');
-- remove aura after quest completed
UPDATE spell_area SET quest_end = 12756 WHERE spell = 53081;


DELETE FROM spell_template WHERE id IN (68523,68620);
INSERT INTO spell_template VALUES
(68523, 0x00800180, 0x00000000, 0x00000005, 0x00000000, 0x00000000, 101,  37,   6,  22,    7,  28,   4, 0,       0,    0,     'Achievement check - Trial of the Crusader - Not One, But Two Jormungars'),
(68620, 0x00800180, 0x00000000, 0x00000005, 0x00000000, 0x00000000, 101,  37,   6,  22,    7,  28,   4, 0,       0,    0,     'Achievement check - Trial of the Crusader - Resilience Will Fix It');-- Learn to Ride in ....
-- fix for all related quests (Added in patch 3.3.0) 

-- q.14086 'Learn to Ride in Orgrimmar'
DELETE FROM mail_loot_template WHERE entry = 231;
INSERT INTO mail_loot_template VALUES (231, 46880, 100, 0, 1, 1, 0);
-- q.14081 'Learn to Ride in the Eversong Woods'
DELETE FROM mail_loot_template WHERE entry = 232;
INSERT INTO mail_loot_template VALUES (232, 46882, 100, 0, 1, 1, 0);
-- q.14085 'Learn to Ride in Darnassus'
DELETE FROM mail_loot_template WHERE entry = 225;
INSERT INTO mail_loot_template VALUES (225, 46876, 100, 0, 1, 1, 0);
-- q.14079 'Learn to Ride in Elwynn Forest'
DELETE FROM mail_loot_template WHERE entry = 224;
INSERT INTO mail_loot_template VALUES (224, 46875, 100, 0, 1, 1, 0);
-- q.14082 'Learn to Ride at the Exodar'
DELETE FROM mail_loot_template WHERE entry = 227;
INSERT INTO mail_loot_template VALUES (227, 46879, 100, 0, 1, 1, 0);
-- q.14083 'Learn to Ride in Dun Morogh' -- Dwarf ver.
DELETE FROM mail_loot_template WHERE entry = 226;
INSERT INTO mail_loot_template VALUES (226, 46877, 100, 0, 1, 1, 0);
-- q.14084 'Learn to Ride in Dun Morogh' -- Gnome ver.
DELETE FROM mail_loot_template WHERE entry = 228;
INSERT INTO mail_loot_template VALUES (228, 46878, 100, 0, 1, 1, 0);
-- q.14087 'Learn to Ride in Mulgore'
DELETE FROM mail_loot_template WHERE entry = 229;
INSERT INTO mail_loot_template VALUES (229, 46884, 100, 0, 1, 1, 0);
-- q.14089 'Learn to Ride in Tirisfal Glades'
DELETE FROM mail_loot_template WHERE entry = 233;
INSERT INTO mail_loot_template VALUES (233, 46881, 100, 0, 1, 1, 0);
-- q.14088 'Learn to Ride in Durotar'
DELETE FROM mail_loot_template WHERE entry = 230;
INSERT INTO mail_loot_template VALUES (230, 46883, 100, 0, 1, 1, 0);

-- Fix for Ultham Ironhorn <Riding Trainer>
-- This Closes: https://github.com/unified-db/Database/issues/44
UPDATE gossip_menu_option SET condition_id = 0 WHERE menu_id = 4014;
-- The Mechanar -- doors added
-- handled by SD2
DELETE FROM gameobject WHERE guid IN (43097,43098,43099,44726);
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(43097, 184322, 554, 3, 1, 242.874, 52.3148, 1.59633, 3.14159, 0, 0, -1, 0, 43200, 0, 1),
(43098, 184632, 554, 3, 1, 236.46, 52.3636, 1.65354, 3.14159, 0, 0, -1, 0, 43200, 0, 1),
(43099, 184069, 550, 1, 1, 743.057, 4.63443, 137.796, 3.14159, 0, 0, -1, 0, 7200, 255, 1),
(44726, 184449, 554, 3, 1, 267.9281, 52.31481, 27.04254, 3.141593, 0, 0, -1, 0, 7200, 255, 0);
UPDATE gameobject SET spawnMask = 3 WHERE id = 184849;
-- objects update
UPDATE gameobject_template SET flags = 32, faction = 1375 WHERE entry IN (184322,184632,184449);

-- Tempest-Forge Destroyer - wps update
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 83173;
DELETE FROM creature_movement WHERE id = 83173;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(83173,1,200.165,52.1172,-0.00492364,0,0,3.01772,0,0),
(83173,2,229.678,52.6314,0.00518766,0,0,0.0214238,0,0);
-- Outrunner Alarion  - gossip
UPDATE creature_template SET GossipMenuId = 6573 WHERE entry = 15301;
DELETE FROM gossip_menu WHERE entry = 6573; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6573, 7788, 0, 0),
(6573, 7821, 0, 1004);
DELETE FROM conditions WHERE condition_entry IN (1002, 1003, 1004);
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1004, -1, 1003, 1002),
(1003, 8, 8350, 0), 
(1002, 8, 9705, 0);
-- missing text added
DELETE FROM npc_text WHERE ID = 7821;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) values
('7821','','Ah, $N - it is good to see you again.  I trust your affairs go well.','0','1','0','2','0','1','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0');

-- Champion Sunstriker 
UPDATE creature_template SET EquipmentTemplateId = 243 WHERE Entry = 17812;

-- Champion Lightrend 
UPDATE creature_template SET EquipmentTemplateId = 491 WHERE Entry = 17810;

-- Champion Bloodwrath 
UPDATE creature_template SET EquipmentTemplateId = 352 WHERE Entry = 17809;
-- Sergeant Kan'ren - gossip 
DELETE FROM gossip_menu WHERE entry = 7323; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7323, 8698, 0, 0);
UPDATE creature_template SET GossipMenuId = 7323 WHERE Entry = 16924;
-- Elisara Sunstriker - gossip
UPDATE creature_template SET GossipMenuId = 7117 WHERE entry = 16147;
DELETE FROM gossip_menu WHERE entry = 7117; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7117, 8378, 0, 0);

-- Larianna Riverwind - gossip
UPDATE creature_template SET GossipMenuId = 7255 WHERE entry = 15398;
DELETE FROM gossip_menu WHERE entry = 7255; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7255, 8575, 0, 0);

-- Sangrias Stillblade
UPDATE creature_template SET EquipmentTemplateId = 352 WHERE Entry = 17716;

-- Jane & Kitty
UPDATE creature SET position_x = 10509.476563, position_y = -6503.363281, position_z = 3.391211, Spawndist = 10, MovementType = 1 WHERE guid = 71601;
UPDATE creature SET position_x = 10509.476563, position_y = -6503.363281, position_z = 3.391211, Spawndist = 0, MovementType = 0 WHERE guid = 71942;
-- Nova & Manny
UPDATE creature SET position_x = 10516.872070, position_y = -6494.785645, position_z = 3.605470, Spawndist = 10, MovementType = 1 WHERE guid = 71940;
UPDATE creature SET position_x = 10516.872070, position_y = -6494.785645, position_z = 3.605470, Spawndist = 0, MovementType = 0 WHERE guid = 71941;
-- Links
DELETE FROM creature_linking WHERE guid IN (71942,71941);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(71941, 71940, 512),
(71942, 71601, 512);

-- Jessel
UPDATE creature_template_addon SET bytes1 = 0, auras = NULL WHERE entry = 20100;
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 71602;
UPDATE creature_template SET MovementType = 2 WHERE entry = 20100;
DELETE FROM creature_movement_template WHERE entry = 20100;
INSERT INTO creature_movement_template (entry,point,position_x,position_y,position_z,waittime,script_id,orientation,model1,model2) VALUES
(20100,1,10520.5,-6504.38,1.28933,50000,2010001,5.48033,0,0),
(20100,2,10520.5,-6504.38,1.28933,120000,0,5.48033,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2010001;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2010001,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Jessel - active'),
(2010001,2,15,14915,0,0,0,0x04,0,0,0,0,0,0,0,0,''),
(2010001,3,28,3,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_SLEEP'),
(2010001,14,14,14915,0,0,0,0x04,0,0,0,0,0,0,0,0,''),
(2010001,15,28,1,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_SIT'),
(2010001,16,0,0,0,0,0,0,2000000467,0,0,0,0,0,0,0,''),
(2010001,21,0,0,0,0,0,0,2000000468,0,0,0,0,0,0,0,''),
(2010001,26,1,22,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2010001,32,0,0,0,20098,71601,7 | 0x10,2000000469,0,0,0,0,0,0,0,'force 20098 to: say text'),
(2010001,37,0,0,0,0,0,0,2000000470,0,0,0,0,0,0,0,''),
(2010001,40,0,0,0,20098,71601,7 | 0x10,2000000471,0,0,0,0,0,0,0,'force 20098 to: say text'),
(2010001,43,15,14915,0,0,0,0x04,0,0,0,0,0,0,0,0,''),
(2010001,44,28,3,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_SLEEP'),
(2010001,46,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Jessel - unactive');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000467 AND 2000000471;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000467,'%s wakes up, startled.',0,2,0,0,NULL),
(2000000468,'Was... Was it all a dream? Azuremyst, Bloodmyst, Zangarmarsh, Shadowmoon... even Zul\'Aman... Jane! Jane where are you!',0,0,10,6,NULL),
(2000000469,'I\'m right here, daddy. You\'ve been asleep all day long. You sure must be tired!',0,0,10,1,NULL),
(2000000470,'Ah, wonderful. It was all just a dream...',0,0,10,1,NULL),
(2000000471,'%s resumes playing on the beach.',0,2,0,0,NULL);

-- duplicates removed
DELETE FROM creature WHERE guid IN (54956,54960,54961,55052,54870);
DELETE FROM creature WHERE guid IN (54956,54960,54961,55052,54870);
DELETE FROM creature_addon WHERE guid IN (54956,54960,54961,55052,54870);
DELETE FROM creature_movement WHERE id IN (54956,54960,54961,55052,54870);

-- Springpaw Cub
UPDATE creature SET position_x = 10321.482422, position_y = -6495.210449, position_z = 59.407784 WHERE guid = 55148;
-- Springpaw Lynx
UPDATE creature SET position_x = 10247.620117, position_y = -6215.413086, position_z = 20.105494 WHERE guid = 55186;
UPDATE creature SET position_x = 10452.853516, position_y = -5888.995605, position_z = 26.841839, spawndist = 2, MovementType = 1 WHERE guid = 55196;
UPDATE creature SET position_x = 10419.024414, position_y = -5885.842285, position_z = 29.109520, spawndist = 5, MovementType = 1 WHERE guid = 55195;

-- #1 Springpaw Lynx + linked Springpaw Cub
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 55187;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 55154;
DELETE FROM creature_movement WHERE id = 55187;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(55187,1,10458.7,-6461.75,25.3096,0,0,2.69832,0,0),(55187,2,10446.6,-6458.02,29.8633,0,0,2.67475,0,0),(55187,3,10433.4,-6446.12,37.5819,0,0,2.09277,0,0),
(55187,4,10435,-6426.54,43.5366,0,0,3.8018,0,0),(55187,5,10415.8,-6447.5,39.7772,0,0,3.57184,0,0),(55187,6,10355.9,-6454.44,36.835,0,0,3.004,0,0),
(55187,7,10333.3,-6447.81,37.878,0,0,3.31423,0,0),(55187,8,10324.4,-6451.51,39.7407,0,0,3.82553,0,0),(55187,9,10320,-6462.56,44.0913,0,0,4.56615,0,0),
(55187,10,10322.7,-6484.17,53.6997,0,0,4.57637,0,0),(55187,11,10317.7,-6497.01,60.8339,0,0,4.19309,0,0),(55187,12,10307.9,-6505.04,64.257,0,0,3.88129,0,0),
(55187,13,10317.2,-6497.38,61.0545,0,0,1.00123,0,0),(55187,14,10322.5,-6484.38,53.8166,0,0,1.44498,0,0),(55187,15,10319.7,-6462.88,44.2848,0,0,1.42928,0,0),
(55187,16,10323.8,-6452.05,39.9808,0,0,0.715349,0,0),(55187,17,10333.9,-6448.02,37.8058,0,0,6.28304,0,0),(55187,18,10355.8,-6454.63,36.8408,0,0,0.00142204,0,0),
(55187,19,10416.1,-6447.69,39.738,0,0,0.540991,0,0),(55187,20,10435.1,-6426.54,43.5425,0,0,0.139653,0,0),(55187,21,10437.2,-6441.96,38.7448,0,0,5.14029,0,0),
(55187,22,10451.5,-6459.26,27.9791,0,0,5.73012,0,0),(55187,23,10463.8,-6463.2,23.7556,0,0,0.0611101,0,0),(55187,24,10479.7,-6460.01,18.7943,0,0,0.45908,0,0),
(55187,25,10507.6,-6444.18,6.25447,0,0,0.592598,0,0),(55187,26,10493.5,-6454.54,12.5756,0,0,3.84415,0,0),(55187,27,10471.7,-6461.68,22.1123,0,0,3.25353,0,0);
-- Link
DELETE FROM creature_linking WHERE guid = 55154;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(55154, 55187, 1+128+512);
-- #2 Springpaw Lynx + linked Springpaw Cub
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 55184;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 55137;
DELETE FROM creature_movement WHERE id = 55184;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(55184,1,10289.1,-6264.54,26.8377,0,0,1.35261,0,0),(55184,2,10309.8,-6231.29,27.396,0,0,1.13819,0,0),(55184,3,10321.1,-6186.69,28.3158,0,0,0.956767,0,0),
(55184,4,10340.9,-6159.06,28.4496,0,0,0.815797,0,0),(55184,5,10368.7,-6131.48,28.6494,0,0,0.650861,0,0),(55184,6,10419.7,-6096.59,31.1992,0,0,0.586458,0,0),
(55184,7,10368.5,-6132.31,28.7687,0,0,3.9621,0,0),(55184,8,10340.4,-6159.97,28.4244,0,0,4.09719,0,0),(55184,9,10321.3,-6187.22,28.3278,0,0,4.40035,0,0),
(55184,10,10309.3,-6231.83,27.4065,0,0,4.17887,0,0),(55184,11,10289.9,-6265.54,26.8542,0,0,4.82579,0,0),(55184,12,10294.2,-6299.01,25.6592,0,0,5.0347,0,0),
(55184,13,10307.8,-6329.77,25.4842,0,0,5.18,0,0),(55184,14,10295.5,-6304.57,25.5505,0,0,1.86012,0,0),(55184,15,10291.5,-6278.09,26.672,0,0,1.66927,0,0);
-- Link
DELETE FROM creature_linking WHERE guid = 55137;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(55137, 55184, 1+128+512);
-- #3 Springpaw Lynx + linked Springpaw Cub
UPDATE creature SET position_x = 10247.2, position_y = -6192.23, position_z = 20.3158, orientation = 4.05487, spawndist = 0, MovementType = 0 WHERE guid = 55164;
UPDATE creature SET position_x = 10245.107422, position_y = -6194.571289, position_z = 20.600983, orientation = 0.629620, spawndist = 0, MovementType = 2 WHERE guid = 55185;
DELETE FROM creature_movement WHERE id = 55185;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(55185,1,10215.7,-6225.87,17.4421,0,0,3.93693,0,0),(55185,2,10182.3,-6258.76,16.1765,0,0,3.95264,0,0),(55185,3,10159.4,-6289.44,16.6755,0,0,4.11129,0,0),
(55185,4,10140.5,-6319.01,16.2499,0,0,4.21182,0,0),(55185,5,10125.6,-6347.21,14.7452,0,0,4.47964,0,0),(55185,6,10116.9,-6365.3,17.9476,0,0,4.24324,0,0),
(55185,7,10127.4,-6343.74,14.5511,0,0,1.13699,0,0),(55185,8,10141.6,-6316.87,16.2922,0,0,0.980267,0,0),(55185,9,10158.4,-6287.66,16.7587,0,0,0.862458,0,0),
(55185,10,10182.8,-6258.34,16.1407,0,0,0.776064,0,0),(55185,11,10215.7,-6225.67,17.451,0,0,0.619769,0,0),(55185,12,10247.1,-6196.39,20.7601,0,0,0.858531,0,0);
-- Link
DELETE FROM creature_linking WHERE guid = 55164;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(55164, 55185, 1+128+512);

-- Tender
UPDATE creature SET position_x = 10446.435547, position_y = -5853.178711, position_z = 7.889363, spawndist = 5, MovementType = 1 WHERE guid = 54885;
UPDATE creature SET position_x = 10242.1, position_y = -5989.23, position_z = 11.6327, spawndist = 5, MovementType = 1 WHERE guid = 54874;
UPDATE creature SET position_x = 10285.502930, position_y = -6059.198730, position_z = 28.442503, spawndist = 5, MovementType = 1 WHERE guid = 54879;

-- Mana Wyrm
UPDATE creature SET position_x = 10306.923828, position_y = -6314.114258, position_z = 26.080843, spawndist = 5, MovementType = 1 WHERE guid = 54953;
UPDATE creature SET position_x = 10262.048828, position_y = -6332.364258, position_z = 26.720581, spawndist = 5, MovementType = 1 WHERE guid = 54950;
UPDATE creature SET position_x = 10267.684570, position_y = -6327.830078, position_z = 24.120268, spawndist = 5, MovementType = 1 WHERE guid = 54949;
UPDATE creature SET position_x = 10293.138672, position_y = -6354.325195, position_z = 23.613668, spawndist = 5, MovementType = 1 WHERE guid = 54982;
UPDATE creature SET position_x = 10374.888672, position_y = -6273.646484, position_z = 26.567240, spawndist = 5, MovementType = 1 WHERE guid = 54954;
UPDATE creature SET position_x = 10392.943359, position_y = -6305.493164, position_z = 33.194088, spawndist = 5, MovementType = 1 WHERE guid = 54955;
UPDATE creature SET position_x = 10409.724609, position_y = -6242.193848, position_z = 32.549530, spawndist = 5, MovementType = 1 WHERE guid = 54963;
UPDATE creature SET position_x = 10413.458008, position_y = -6198.722168, position_z = 32.189342, spawndist = 5, MovementType = 1 WHERE guid = 54968;
UPDATE creature SET position_x = 10382.275391, position_y = -6219.627930, position_z = 30.870153, spawndist = 5, MovementType = 1 WHERE guid = 54964;
UPDATE creature SET position_x = 10363.845703, position_y = -6202.112305, position_z = 30.186720, spawndist = 5, MovementType = 1 WHERE guid = 54976;
UPDATE creature SET position_x = 10374.808594, position_y = -6158.960938, position_z = 31.692713, spawndist = 5, MovementType = 1 WHERE guid = 54974;
UPDATE creature SET position_x = 10382.983398, position_y = -6141.389160, position_z = 32.129307, spawndist = 5, MovementType = 1 WHERE guid = 54973;
UPDATE creature SET position_x = 10211.796875, position_y = -6343.291504, position_z = 30.841400, spawndist = 2, MovementType = 1 WHERE guid = 54935;
UPDATE creature SET position_x = 10216.808594, position_y = -6331.069336, position_z = 30.841400, spawndist = 2, MovementType = 1 WHERE guid = 54936;
UPDATE creature SET position_x = 10233.763672, position_y = -6329.243164, position_z = 30.841400, spawndist = 2, MovementType = 1 WHERE guid = 54941;
UPDATE creature SET position_x = 10215.406250, position_y = -6378.074219, position_z = 30.599432, spawndist = 2, MovementType = 1 WHERE guid = 54943;
UPDATE creature SET spawndist = 2, MovementType = 1 WHERE guid IN (54938,54944,54945,54965,54972,54975,54978,54980,54981);

-- #1 Mana Wyrm
UPDATE creature SET position_x = 10295.235352, position_y = -6329.585938, position_z = 25.686871, orientation = 0.154598, spawndist = 0, MovementType = 2 WHERE guid = 54948;
DELETE FROM creature_movement WHERE id = 54948;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54948,1,10305.4,-6326.57,25.6189,0,0,0.052492,0,0),(54948,2,10317.7,-6332.25,25.2319,0,0,5.53144,0,0),(54948,3,10324.4,-6340.72,29.7025,0,0,5.48196,0,0),
(54948,4,10329.2,-6356.05,30.9113,0,0,4.53869,0,0),(54948,5,10319.1,-6390.65,34.9596,0,0,4.39994,0,0),(54948,6,10329.4,-6355.33,30.8546,0,0,1.64947,0,0),
(54948,7,10324.8,-6341.94,29.8339,0,0,2.09322,0,0),(54948,8,10317.7,-6332.63,25.255,0,0,2.299,0,0),(54948,9,10313.7,-6326.89,25.7625,0,0,2.99957,0,0),
(54948,10,10293.8,-6331.76,25.6947,0,0,3.5199,0,0),(54948,11,10285,-6334.85,22.229,0,0,3.47671,0,0),(54948,12,10253.9,-6339.01,30.8412,0,0,3.29606,0,0),
(54948,13,10228.6,-6345.13,30.8412,0,0,3.42565,0,0),(54948,14,10253.4,-6339.13,30.8412,0,0,0.123055,0,0),(54948,15,10275.4,-6336.6,23.3411,0,0,0.197668,0,0),
(54948,16,10284.7,-6335.02,22.1083,0,0,0.272281,0,0),(54948,17,10294.6,-6331.33,25.6947,0,0,0.348638,0,0);
-- #2 Mana Wyrm
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 54959;
DELETE FROM creature_movement WHERE id = 54959;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54959,1,10423.2,-6272.63,31.3037,0,0,4.81022,0,0),(54959,2,10422.4,-6288.56,34.3085,0,0,4.10729,0,0),(54959,3,10416.1,-6294.79,34.8691,0,0,3.757,0,0),
(54959,4,10376.8,-6319.17,32.6519,0,0,3.66354,0,0),(54959,5,10416.8,-6294.43,34.8894,0,0,0.795266,0,0),(54959,6,10422.3,-6288.37,34.2492,0,0,1.15734,0,0),
(54959,7,10423.1,-6273.64,31.3398,0,0,1.62857,0,0),(54959,8,10416.5,-6245.5,32.9064,0,0,1.76602,0,0),(54959,9,10414.6,-6226.95,33.6184,0,0,1.34976,0,0),
(54959,10,10423.7,-6208.55,32.8955,0,0,1.82728,0,0),(54959,11,10420.3,-6202.17,32.1893,0,0,2.31976,0,0),(54959,12,10402.2,-6187.79,32.1893,0,0,2.45092,0,0),
(54959,13,10421.2,-6202.91,31.6182,0,0,5.63178,0,0),(54959,14,10423.7,-6208.42,32.8845,0,0,4.62962,0,0),(54959,15,10414.8,-6226.68,33.6231,0,0,4.9477,0,0),
(54959,16,10421.8,-6260.02,31.8738,0,0,4.90511,0,0);
-- #3 Mana Wyrm
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 54966;
DELETE FROM creature_movement WHERE id = 54966;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54966,1,10378.6,-6205.26,29.7745,0,0,0.188777,0,0),(54966,2,10383.8,-6204.39,32.1896,0,0,0.125945,0,0),(54966,3,10398.8,-6205.79,32.1896,0,0,0.232757,0,0),
(54966,4,10423,-6200.94,31.5647,0,0,0.165213,0,0),(54966,5,10429.2,-6199.61,33.5975,0,0,0.466806,0,0),(54966,6,10434.5,-6195.99,35.5299,0,0,1.03308,0,0),
(54966,7,10437.2,-6181.86,35.5585,0,0,1.61035,0,0),(54966,8,10432.8,-6170.56,34.6401,0,0,2.24259,0,0),(54966,9,10420.8,-6164.84,31.401,0,0,2.95966,0,0),
(54966,10,10402.3,-6162.15,32.1901,0,0,3.20235,0,0),(54966,11,10388.7,-6166.75,32.1901,0,0,3.79375,0,0),(54966,12,10382.1,-6174.08,32.1901,0,0,4.17546,0,0),
(54966,13,10379.1,-6183.74,32.1901,0,0,4.69617,0,0),(54966,14,10386,-6193.71,32.1901,0,0,5.82793,0,0),(54966,15,10397.2,-6194.7,32.1901,0,0,0.107866,0,0),
(54966,16,10406.9,-6190.34,32.1884,0,0,0.861849,0,0),(54966,17,10406.6,-6180.77,32.1884,0,0,2.13896,0,0),(54966,18,10399.3,-6174.84,32.1884,0,0,2.66361,0,0),
(54966,19,10388.8,-6169.6,32.1884,0,0,2.87174,0,0),(54966,20,10368.2,-6172.78,32.2263,0,0,3.69798,0,0),(54966,21,10364,-6176.39,32.6576,0,0,4.38363,0,0),
(54966,22,10363.5,-6192.93,31.3945,0,0,4.95617,0,0),(54966,23,10371,-6202.01,29.8769,0,0,5.79497,0,0);
-- #4 Mana Wyrm
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 54950;
DELETE FROM creature_movement WHERE id = 54950;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54950,1,10257.4,-6318.22,25.9457,0,0,2.20253,0,0),(54950,2,10244.6,-6306.64,26.3471,0,0,2.61565,0,0),(54950,3,10229.6,-6302.92,26.1679,0,0,3.19056,0,0),
(54950,4,10208.5,-6308.8,27.1935,0,0,3.59292,0,0),(54950,5,10191.6,-6320.28,27.3374,0,0,3.97306,0,0),(54950,6,10185.8,-6336.88,28.479,0,0,4.5189,0,0),
(54950,7,10189,-6353.63,31.1858,0,0,5.87999,0,0),(54950,8,10208.1,-6359.35,30.8413,0,0,6.00565,0,0),(54950,9,10227.4,-6362.99,30.8413,0,0,0.0374072,0,0),
(54950,10,10238.1,-6360.24,30.8413,0,0,0.635269,0,0),(54950,11,10245.8,-6350.07,30.8413,0,0,1.36176,0,0),(54950,12,10243.6,-6337.71,30.8413,0,0,2.06501,0,0),
(54950,13,10232.7,-6328.7,30.8413,0,0,2.87712,0,0),(54950,14,10219.1,-6330.48,30.8413,0,0,3.6311,0,0),(54950,15,10210.6,-6337.47,30.8413,0,0,3.93348,0,0),
(54950,16,10200.6,-6359.56,30.2298,0,0,4.73929,0,0),(54950,17,10202.9,-6368.7,29.7911,0,0,5.17287,0,0),(54950,18,10216.1,-6377.88,30.4584,0,0,5.87187,0,0),
(54950,19,10227.7,-6378.37,29.7346,0,0,0.113332,0,0),(54950,20,10254.1,-6374.76,29.845,0,0,0.363089,0,0),(54950,21,10265.3,-6365.21,29.0726,0,0,1.28043,0,0),
(54950,22,10268.2,-6347.66,26.4395,0,0,1.59774,0,0),(54950,23,10262.8,-6331.99,26.3949,0,0,1.91582,0,0);
-- #5 Mana Wyrm
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 54983;
DELETE FROM creature_movement WHERE id = 54983;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54983,1,10221.1,-6316.8,28.456,0,0,4.84371,0,0),(54983,2,10220.9,-6321.28,30.8412,0,0,4.40074,0,0),(54983,3,10213.4,-6335.92,30.8412,0,0,4.30571,0,0),
(54983,4,10211.1,-6348.03,30.8412,0,0,4.90418,0,0),(54983,5,10216.8,-6359.34,30.8412,0,0,5.62516,0,0),(54983,6,10227.4,-6362.88,30.8412,0,0,0.0339096,0,0),
(54983,7,10238.6,-6359.23,30.8412,0,0,0.666888,0,0),(54983,8,10252.4,-6335.75,30.8418,0,0,0.489388,0,0),(54983,9,10271,-6331.26,23.6916,0,0,0.18566,0,0),
(54983,10,10281.8,-6329.7,22.1345,0,0,0.111048,0,0),(54983,11,10290.9,-6327.55,25.6552,0,0,0.356092,0,0),(54983,12,10297.6,-6322.93,25.7784,0,0,1.10301,0,0),
(54983,13,10300.3,-6316.07,25.7896,0,0,1.48392,0,0),(54983,14,10305.6,-6283.37,27.0536,0,0,1.17762,0,0),(54983,15,10329.6,-6258.04,27.0299,0,0,0.682817,0,0),
(54983,16,10354,-6236.37,27.35,0,0,0.729941,0,0),(54983,17,10371.8,-6219.8,30.4531,0,0,0.737795,0,0),(54983,18,10383.9,-6208.5,30.1181,0,0,0.75743,0,0),
(54983,19,10387.5,-6206.77,32.1902,0,0,0.380438,0,0),(54983,20,10402.3,-6203.88,32.1886,0,0,0.46212,0,0),(54983,21,10412.1,-6198.7,32.1886,0,0,0.658469,0,0),
(54983,22,10418.5,-6192.22,32.189,0,0,1.15721,0,0),(54983,23,10419.7,-6178.88,32.189,0,0,1.87035,0,0),(54983,24,10413.6,-6168.3,32.189,0,0,2.24106,0,0),
(54983,25,10406.1,-6163.31,32.189,0,0,2.99818,0,0),(54983,26,10392.6,-6165.76,32.189,0,0,3.54875,0,0),(54983,27,10382.8,-6174.28,32.189,0,0,4.18806,0,0),
(54983,28,10378.3,-6183.53,32.189,0,0,4.63005,0,0),(54983,29,10378.4,-6197.58,32.189,0,0,4.20908,0,0),(54983,30,10371.6,-6206.79,29.7725,0,0,3.73403,0,0),
(54983,31,10359.6,-6213.05,29.3217,0,0,3.72382,0,0),(54983,32,10346.6,-6224.09,27.7611,0,0,3.47406,0,0),(54983,33,10342.3,-6224.91,27.3902,0,0,2.9667,0,0),
(54983,34,10335.2,-6221.67,27.1914,0,0,3.17875,0,0),(54983,35,10319.8,-6231.28,27.3,0,0,3.85969,0,0),(54983,36,10295.4,-6263.16,27.3763,0,0,4.02856,0,0),
(54983,37,10274.5,-6285.5,25.6167,0,0,3.62565,0,0),(54983,38,10263.9,-6291.2,21.0367,0,0,3.63193,0,0),(54983,39,10247.7,-6300.62,24.7836,0,0,3.58324,0,0),
(54983,40,10229.4,-6305.87,26.9221,0,0,3.64607,0,0),(54983,41,10223.5,-6313.4,28.1938,0,0,4.17621,0,0);-- Equipment for 'Master Kelerun Bloodmourn <Blood Knight>'
DELETE FROM creature_equip_template WHERE entry = 2513;
INSERT INTO creature_equip_template (entry, equipentry1, equipentry2, equipentry3) VALUES    
(2513,23673,24038,0);
UPDATE creature_template SET equipmentTemplateid = 2513 WHERE entry = 17807;-- Tannaria
UPDATE creature_template SET GossipMenuId = 6650 WHERE entry = 16279;
DELETE FROM gossip_menu WHERE entry = 6650; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6650, 9187, 0, 0);
 
-- Ponaris <Priest Trainer>
UPDATE creature_template SET GossipMenuId = 6649 WHERE entry = 16276;
DELETE FROM gossip_menu WHERE entry = 6649; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6649, 9186, 0, 0);

-- Garridel <Mage Trainer>
UPDATE creature_template SET GossipMenuId = 6648 WHERE entry = 16269;
DELETE FROM gossip_menu WHERE entry = 6648; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6648, 9191, 0, 0);

-- Celoenus <Warlock Trainer>
UPDATE creature_template SET GossipMenuId = 7566 WHERE entry = 16266;
DELETE FROM gossip_menu WHERE entry = 7566; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7566, 9185, 0, 0);-- Duplicates
-- Duplicates removed
DELETE FROM creature WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM creature_addon WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM creature_movement WHERE id IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM game_event_creature WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM game_event_creature_data WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,
56033,56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM creature_battleground WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,5576856020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,
56033,56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM creature_linking WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,5576856020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065) 
OR master_guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,5576856020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,56047,56027,56048,56025,
56024,56066,56036,56038,56065);

-- Silanna -- gossip
UPDATE creature_template SET GossipMenuId = 7316 WHERE entry = 16862;
DELETE FROM gossip_menu WHERE entry = 7316; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7316, 8684, 0, 0);

-- Gatewatcher Aendor  -- gossip
UPDATE creature_template SET GossipMenuId = 7828 WHERE entry = 18790;

-- Harassed Citizen  -- gossip
UPDATE creature_template SET GossipMenuId = 7834 WHERE entry = 18792;

-- Ranger Selron -- missing equipment added
UPDATE creature_template SET equipmentTemplateid = 481 WHERE entry = 15940;

-- Solanin <Bag Vandor>
UPDATE creature SET position_x = 9308.556641, position_y = -6554.437500, position_z = 34.680603, orientation = 2.170510, Spawndist = 0, MovementType = 2 WHERE guid = 68009;
DELETE FROM creature_movement WHERE id = 68009;
UPDATE creature_template SET MovementType = 2 WHERE entry = 18947;
DELETE FROM creature_movement_template WHERE entry = 18947;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18947,1,9308.556641,-6554.437500,34.680603,30000,0,2.170510,0,0),
(18947,2,9308.9,-6549.6,34.6871,0,0,1.39769,0,0),
(18947,3,9310.42,-6547.2,34.6966,0,0,0.598403,0,0),
(18947,4,9312.12,-6546.47,35.6365,10000,1894701,0.175858,0,0),
(18947,5,9309.84,-6546.45,34.6963,0,0,2.7783,0,0),
(18947,6,9306.75,-6544.39,34.6448,0,0,2.46178,0,0),
(18947,7,9304.57,-6542.03,34.7358,10000,1894701,2.2458,0,0),
(18947,8,9300.32,-6553.67,34.6046,15000,0,4.53523,0,0),
(18947,9,9302.13,-6550.81,34.623,0,0,0.597241,0,0),
(18947,10,9305.58,-6548.93,34.6424,0,0,0.118943,0,0),
(18947,11,9311.03,-6549.56,34.7268,14000,1894702,6.04085,0,0),
(18947,12,9308.556641,-6554.437500,34.680603,0,0,2.170510,0,0),
(18947,13,9308.556641,-6554.437500,34.680603,180000,0,2.170510,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1894701,1894702); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1894701,3,1,16,0,0,0,0,0,0,0,0,0,0,0,0,'Kneel'),
(1894702,1,3,0,0,0,0,0,0,0,0,0,0,0,0,3.19456,''),
(1894702,3,0,0,0,0,0,0,2000000472,0,0,0,0,0,0,0,''),
(1894702,8,0,0,0,0,0,0,2000000473,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000472 AND 2000000473;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000472,'Gah! Every time I load something into the wagon, it reappears here within moments!',0,0,0,6,NULL),
(2000000473,'I should have better than to have given Silanna that tome of cantrips.',0,0,0,1,NULL);

-- Silvermoon Guardian #1
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 56871;
-- Silvermoon Guardian #2
UPDATE creature SET position_x = 9310.937500, position_y = -7261.342285, position_z = 13.262838, orientation = 5.123657, spawndist = 0, MovementType = 2 WHERE guid = 56870;
DELETE FROM creature_movement WHERE id = 56870;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(56870,1,9313.76,-7233.52,14.3607,0,0,1.45192,0,0),(56870,2,9321.56,-7210.41,14.9568,0,0,1.24771,0,0),(56870,3,9324.87,-7190.41,15.5912,0,0,1.56187,0,0),
(56870,4,9322.9,-7169.13,15.6939,0,0,1.77393,0,0),(56870,5,9315.66,-7141.71,16.3783,0,0,1.96635,0,0),(56870,6,9308.27,-7128.08,16.3927,0,0,2.14307,0,0),
(56870,7,9288.27,-7098.95,15.0777,0,0,2.13914,0,0),(56870,8,9282.51,-7083.99,12.7755,0,0,1.59093,0,0),(56870,9,9283.83,-7072.6,11.6658,0,0,1.24928,0,0),
(56870,10,9279.03,-7084.2,12.8351,0,0,4.68382,0,0),(56870,11,9285.3,-7100.68,15.1796,0,0,5.29093,0,0),(56870,12,9305.98,-7130.13,16.3521,0,0,5.34748,0,0),
(56870,13,9313.23,-7142.95,16.3343,0,0,4.9375,0,0),(56870,14,9320.03,-7170.39,15.744,0,0,4.97834,0,0),(56870,15,9321.99,-7191.2,15.5395,0,0,4.49454,0,0),
(56870,16,9318.65,-7209.67,15.0213,0,0,4.31233,0,0),(56870,17,9311.12,-7233.62,14.4968,0,0,4.78671,0,0),(56870,18,9310.98,-7261.15,13.2516,180000,0,4.80736,0,0);
-- Link
DELETE FROM creature_linking WHERE guid = 56871;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(56871, 56870, 1+128+512);

-- Silvermoon Guardian #3-4 missing  -- UDB empty guids used
DELETE FROM creature WHERE guid IN (55802,55783);
INSERT INTO creature VALUES 
(55802,16221,530,1,1,0,0,9151.62,-6702.86,24.3109,5.83393,360,0,0,1215,0,0,2),
(55783,16221,530,1,1,0,0,9151.19,-6702.51,24.2865,5.83943,360,0,0,1124,0,0,0);
DELETE FROM creature_movement WHERE id = 55802;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(55802,1,9151.62,-6702.86,24.3109,1000,1622101,5.83393,0,0),(55802,2,9175.54,-6714.2,26.0494,0,0,6.06954,0,0),(55802,3,9200.73,-6718.44,25.8468,0,0,5.97397,0,0),
(55802,4,9209.32,-6722.74,25.632,0,0,5.7894,0,0),(55802,5,9221.76,-6734.95,25.2283,0,0,5.37707,0,0),(55802,6,9237.28,-6759.91,24.9455,0,0,5.20429,0,0),
(55802,7,9244.59,-6788.33,23.7142,0,0,4.91369,0,0),(55802,8,9246.93,-6818.23,19.3459,0,0,4.81944,0,0),(55802,9,9243.49,-6833.1,17.0062,0,0,4.26574,0,0),
(55802,10,9224.17,-6858.76,12.2348,5000,0,4.14008,0,0),(55802,11,9245.08,-6830.3,17.4443,0,0,1.22389,0,0),(55802,12,9245.33,-6792.53,23.2525,0,0,1.72419,0,0),
(55802,13,9240.97,-6767.78,24.67,0,0,1.96609,0,0),(55802,14,9224.66,-6739.66,25.1088,0,0,2.21899,0,0),(55802,15,9214,-6727.22,25.3519,0,0,2.43498,0,0),
(55802,16,9203.12,-6718.08,25.8748,0,0,2.65724,0,0),(55802,17,9177.27,-6714.54,26.1012,0,0,3.00518,0,0),(55802,18,9152.85,-6704.02,24.4276,0,0,2.72557,0,0),
(55802,19,9130.06,-6693.25,23.2046,0,0,2.78841,0,0),(55802,20,9100.87,-6685.34,20.8723,0,0,2.98004,0,0),(55802,21,9083.46,-6682.89,19.3495,0,0,3.06251,0,0),
(55802,22,9065.56,-6682.98,16.7473,5000,0,3.16068,0,0),(55802,23,9093.29,-6683.31,20.3039,0,0,0.206017,0,0),(55802,24,9101.51,-6680.65,20.9162,0,0,0.731448,0,0),
(55802,25,9103.88,-6674.12,21.7294,0,0,1.98259,0,0),(55802,26,9099.35,-6657.52,22.0418,0,0,1.4165,0,0),(55802,27,9102.42,-6647.26,23.2374,0,0,1.07485,0,0),
(55802,28,9121.32,-6626.45,26.7952,0,0,0.662514,0,0),(55802,29,9136.62,-6618.55,29.0918,0,0,0.415898,0,0),(55802,30,9157.46,-6615.65,30.7248,0,0,0.262746,0,0),
(55802,31,9168.71,-6610.88,31.2371,0,0,0.747337,0,0),(55802,32,9179.42,-6600.27,31.8366,0,0,0.888709,0,0),(55802,33,9193.47,-6583.44,32.6952,0,0,0.69393,0,0),
(55802,34,9224.49,-6560.81,31.9586,0,0,0.686076,0,0),(55802,35,9245.92,-6548.87,31.942,0,0,0.344427,0,0),(55802,36,9258.16,-6547.53,33.2162,0,0,6.26633,0,0),
(55802,37,9291.08,-6553.81,34.5914,0,0,0.120587,0,0),(55802,38,9296.64,-6552.64,34.6026,0,0,0.448883,0,0),(55802,39,9301.53,-6550.26,34.6231,0,0,0.8675,0,0),
(55802,40,9305.17,-6546.33,34.6403,5000,0,0.941328,0,0),(55802,41,9296.7,-6552.85,34.602,0,0,3.57241,0,0),(55802,42,9289.65,-6554.36,34.5911,0,0,3.11924,0,0),
(55802,43,9258.17,-6547.61,33.2113,0,0,3.16243,0,0),(55802,44,9245.94,-6549.07,31.9428,0,0,3.48776,0,0),(55802,45,9224.78,-6560.53,31.9582,0,0,3.77443,0,0),
(55802,46,9193.19,-6583.57,32.6867,0,0,4.08623,0,0),(55802,47,9185.34,-6590.89,32.376,0,0,4.12125,0,0),(55802,48,9174.6,-6606.27,31.49,0,0,4.06234,0,0),
(55802,49,9168.63,-6611.54,31.2102,0,0,3.79531,0,0),(55802,50,9155.36,-6616.81,30.5532,0,0,3.32799,0,0),(55802,51,9137.52,-6618.39,29.2279,0,0,3.43245,0,0),
(55802,52,9127.76,-6621.33,27.8341,0,0,3.72541,0,0),(55802,53,9107.5,-6640.04,24.401,0,0,4.03878,0,0),(55802,54,9099.88,-6651.96,22.5778,0,0,4.52023,0,0),
(55802,55,9098.93,-6659.86,21.8473,0,0,4.85172,0,0),(55802,56,9104.61,-6676.34,21.5272,0,0,4.84386,0,0),(55802,57,9103.24,-6680.22,21.0557,0,0,4.10324,0,0),
(55802,58,9098.15,-6683.2,20.6473,0,0,3.38224,0,0),(55802,59,9064.97,-6683.33,16.6582,5000,0,3.21495,0,0),(55802,60,9101.57,-6684.97,20.8846,0,0,6.12485,0,0),
(55802,61,9130.73,-6693.28,23.2326,1000,1622102,5.93243,0,0),(55802,62,9151.19,-6702.86,24.2903,0,0,5.78321,0,0);
-- Link
DELETE FROM creature_linking WHERE guid = 55783;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(55783, 55802, 1+128+512);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1622101,1622102); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1622101,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1622102,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');

-- Feral Dragonhawk Hatchling
UPDATE creature SET position_x = 9313.291992, position_y = -7065.535156, position_z = 13.551550, spawndist = 10, MovementType = 1 WHERE guid = 55751;
UPDATE creature SET position_x = 9335.414063, position_y = -7095.564941, position_z = 15.955358, spawndist = 10, MovementType = 1 WHERE guid = 55750;
UPDATE creature SET position_x = 9241.479492, position_y = -7053.126465, position_z = 11.785850, spawndist = 10, MovementType = 1 WHERE guid = 55781;
UPDATE creature SET position_x = 9251.087891, position_y = -7116.528320, position_z = 20.209023, spawndist = 10, MovementType = 1 WHERE guid = 55782;
UPDATE creature SET position_x = 9280.127930, position_y = -7136.915039, position_z = 18.425961, spawndist = 10, MovementType = 1 WHERE guid = 55806;
UPDATE creature SET position_x = 9286.713867, position_y = -7275.848633, position_z = 17.298273, spawndist = 10, MovementType = 1 WHERE guid = 55747;
UPDATE creature SET position_x = 9193.906250, position_y = -7090.962891, position_z = 19.812313, spawndist = 10, MovementType = 1 WHERE guid = 55804;
UPDATE creature SET position_x = 9143.990234, position_y = -7090.308594, position_z = 24.407694, spawndist = 10, MovementType = 1 WHERE guid = 55818;
UPDATE creature SET position_x = 9144.131836, position_y = -6652.943359, position_z = 31.736256, spawndist = 10, MovementType = 1 WHERE guid = 55763;
UPDATE creature SET position_x = 9195.083008, position_y = -6625.637695, position_z = 34.585335, spawndist = 10, MovementType = 1 WHERE guid = 55799;
UPDATE creature SET position_x = 9273.759766, position_y = -6798.623535, position_z = 22.505522, spawndist = 10, MovementType = 1 WHERE guid = 55778;
UPDATE creature SET spawndist = 10, MovementType = 1 WHERE guid = 55771;

-- Plagueboner Pillager
UPDATE creature SET spawndist = 15, MovementType = 1 WHERE guid IN (56055,56028,56057,56053,56054,56061,56044,56032,56060,56049,56041,56075,56076,56042,56077,56073,56071,56040,56039,56072,56070,56078);
UPDATE creature SET position_x = 9028.840820, position_y = -6913.795410, position_z = 16.769503, orientation = 6.149659, spawndist = 0, MovementType = 2 WHERE guid = 56043; -- this one!!!
DELETE FROM creature_movement WHERE id = 56043;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(56043,1,9044.67,-6916.71,14.3831,0,0,6.12086,0,0),(56043,2,9073,-6918.1,16.9192,0,0,0.010458,0,0),(56043,3,9092.31,-6918.52,17.3978,0,0,5.88917,0,0),
(56043,4,9121.12,-6931.48,13.1917,0,0,5.84204,0,0),(56043,5,9142.13,-6939.05,9.19041,0,0,5.94022,0,0),(56043,6,9176.79,-6939.88,5.15922,2000,1565401,6.22688,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1565401; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1565401,1,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'desp');

-- Rotlimb Cannibal
UPDATE creature_template SET inhabittype = 1 WHERE entry = 15655;
UPDATE creature SET position_x = 9134.863281, position_y = -6999.031250, position_z = 9.883224, spawndist = 10, MovementType = 1 WHERE guid = 56080;

-- Springpaw panther
UPDATE creature SET position_x = 9337.779297, position_y = -6581.497070, position_z = 40.059837, spawndist = 10, MovementType = 1 WHERE guid = 55923;-- Duplicates removed
DELETE FROM creature WHERE guid IN (55922,55950,55946,55987,55990,55989);
DELETE FROM creature_addon WHERE guid IN (55922,55950,55946,55987,55990,55989);
DELETE FROM creature_movement WHERE id IN (55922,55950,55946,55987,55990,55989);
DELETE FROM game_event_creature WHERE guid IN (55922,55950,55946,55987,55990,55989);
DELETE FROM game_event_creature_data WHERE guid IN (55922,55950,55946,55987,55990,55989);
DELETE FROM creature_battleground WHERE guid IN (55922,55950,55946,55987,55990,55989);
DELETE FROM creature_linking WHERE guid IN (55922,55950,55946,55987,55990,55989) 
OR master_guid IN (55922,55950,55946,55987,55990,55989);

-- Rotlimb Cannibal 
UPDATE creature SET position_x = 9141.685547, position_y = -6992.420410, position_z = 9.112395, orientation = 1.428094, Spawndist = 0, MovementType = 0 WHERE guid = 56082;
UPDATE creature SET position_x = 9144.500000, position_y = -6992.453125, position_z = 9.266702, orientation = 1.510327, Spawndist = 0, MovementType = 0 WHERE guid = 56067;
UPDATE creature SET position_x = 9144.772461, position_y = -6994.754395, position_z = 9.276006, orientation = 1.380970, Spawndist = 0, MovementType = 0 WHERE guid = 56068;
DELETE FROM creature WHERE guid = 56065; -- UDB free guid used
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(56065,15655,530,1,1,0,0,9142.6,-6995.12,9.19671,1.44931,300,0,0,137,0,0,2);
DELETE FROM creature_movement WHERE id = 56065;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(56065,1,9142.6,-6995.12,9.19671,2000,1565501,1.44931,0,0),(56065,2,9146.93,-6970.46,8.74395,0,0,0.971624,0,0),(56065,3,9172.51,-6942.44,5.77679,0,0,0.521591,0,0),
(56065,4,9194.01,-6936.1,4.68107,0,0,6.26206,0,0),(56065,5,9230.88,-6955.76,4.60276,0,0,5.99896,0,0),(56065,6,9267.96,-6961.74,4.58334,0,0,6.25421,0,0),
(56065,7,9314.47,-6961.16,9.85552,0,0,6.27384,0,0),(56065,8,9371.66,-6966.16,17.9735,10000,0,6.18352,0,0);
-- Links
DELETE FROM creature_linking WHERE guid IN (56067,56068,56082);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(56067, 56065, 128+512),
(56068, 56065, 128+512),
(56082, 56065, 128+512);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1565501; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1565501,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');
DELETE FROM dbscripts_on_creature_death WHERE id = 15655; 
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(15655,10,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'desp');

-- Eversong Tender
UPDATE creature SET position_x = 9174.863281, position_y = -6789.921875, position_z = 33.791882, Spawndist = 10, MovementType = 1 WHERE guid = 55480;

-- Springpaw Stalker
UPDATE creature SET position_x = 9077.146484, position_y = -6728.952637, position_z = 20.230244, Spawndist = 15, MovementType = 1 WHERE guid = 55984;
UPDATE creature SET position_x = 9080.941406, position_y = -7554.627441, position_z = 102.713112, Spawndist = 15, MovementType = 1 WHERE guid = 55821;
UPDATE creature SET position_x = 9093.875000, position_y = -7520.442383, position_z = 88.082741, Spawndist = 15, MovementType = 1 WHERE guid = 55942;
UPDATE creature SET position_x = 9150.410156, position_y = -7609.599121, position_z = 102.518661, Spawndist = 15, MovementType = 1 WHERE guid = 55945;

-- Elder Springpaw
UPDATE creature SET position_x = 9033.854492, position_y = -7681.673340, position_z = 140.387833, Spawndist = 15, MovementType = 1 WHERE guid = 55998;
UPDATE creature SET position_x = 9076.555664, position_y = -7710.252930, position_z = 135.212921, Spawndist = 15, MovementType = 1 WHERE guid = 55988;
UPDATE creature SET position_x = 9112.898438, position_y = -7817.004883, position_z = 123.236694, Spawndist = 15, MovementType = 1 WHERE guid = 55994;
UPDATE creature SET position_x = 9155.250000, position_y = -7748.492676, position_z = 133.449890, Spawndist = 10, MovementType = 1 WHERE guid = 55997;
-- Silvermoon Guardian
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 56878;
DELETE FROM creature_movement WHERE id = 56878;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(56878,1,9075.53,-7453.2,83.147,2000,1622101,5.81037,0,0),(56878,2,9083.64,-7459.33,82.3095,0,0,5.4139,0,0),(56878,3,9094.12,-7474.37,79.7339,0,0,5.44139,0,0),
(56878,4,9106.17,-7481.73,78.0308,0,0,5.84979,0,0),(56878,5,9120.14,-7485.99,76.3903,0,0,6.10504,0,0),(56878,6,9135.87,-7486.14,74.1661,0,0,0.0692527,0,0),
(56878,7,9143.43,-7483.38,72.1307,0,0,0.824806,0,0),(56878,8,9148.94,-7476.1,69.3798,0,0,1.08163,0,0),(56878,9,9155.35,-7463.24,65.605,0,0,1.08399,0,0),
(56878,10,9163.17,-7454.76,62.2949,0,0,0.785536,0,0),(56878,11,9172.74,-7450.63,58.3818,0,0,0.2711,0,0),(56878,12,9190.92,-7452.68,51.184,0,0,0.0158453,0,0),
(56878,13,9223.02,-7448.49,41.154,0,0,0.235757,0,0),(56878,14,9232.13,-7444.44,38.7136,0,0,0.728171,0,0),(56878,15,9243.84,-7430.97,35.5011,0,0,0.619,0,0),
(56878,16,9254.21,-7429.35,35.4306,0,0,6.15684,0,0),(56878,17,9261.15,-7434.88,35.8412,0,0,5.22694,0,0),(56878,18,9265.25,-7445.57,35.8999,0,0,5.01488,0,0),
(56878,19,9265.07,-7456.89,35.8899,0,0,4.52401,0,0),(56878,20,9260.84,-7472.31,35.5593,0,0,4.57899,0,0),(56878,21,9261.41,-7484.52,35.5209,5000,0,4.92848,0,0),
(56878,22,9257.34,-7478.7,35.5761,0,0,1.69106,0,0),(56878,23,9257.72,-7465.82,35.7736,0,0,1.23632,0,0),(56878,24,9261.38,-7452.16,35.8671,0,0,1.42558,0,0),
(56878,25,9260.48,-7441.99,35.5515,0,0,2.02562,0,0),(56878,26,9253.36,-7434.07,35.4012,0,0,2.62451,0,0),(56878,27,9247.75,-7430.09,35.1504,0,0,2.10693,0,0),
(56878,28,9244.72,-7412.54,33.4977,0,0,1.58386,0,0),(56878,29,9246.67,-7386.82,30.9486,0,0,1.38358,0,0),(56878,30,9254.43,-7362.81,26.6823,0,0,1.2265,0,0),
(56878,31,9267.23,-7344.13,22.6337,0,0,0.928048,0,0),(56878,32,9276.66,-7328.1,19.9771,0,0,1.06157,0,0),(56878,33,9290.48,-7299.74,17.2787,0,0,1.07727,0,0),
(56878,34,9310.89,-7280.94,14.2154,10000,0,0.66494,0,0),(56878,35,9306.56,-7289.38,14.8871,0,0,4.14111,0,0),(56878,36,9293.53,-7302.88,17.3098,0,0,4.17096,0,0),
(56878,37,9280.06,-7331.36,20.0312,0,0,4.30447,0,0),(56878,38,9269.79,-7347.76,22.9399,0,0,4.10813,0,0),(56878,39,9253.347656,-7367.320801,27.553810,0,0,4.398997,0,0),
(56878,40,9251.79,-7383.54,30.2129,0,0,4.51732,0,0),(56878,41,9248.95,-7398.95,31.988,0,0,4.64298,0,0),(56878,42,9248.79,-7424.52,34.7828,0,0,5.08359,0,0),
(56878,43,9251.29,-7427.93,35.0913,0,0,5.70876,0,0),(56878,44,9259.97,-7433.06,35.8896,0,0,5.43231,0,0),(56878,45,9265.39,-7445.18,35.9194,0,0,4.98385,0,0),
(56878,46,9265.19,-7457.56,35.9254,0,0,4.38145,0,0),(56878,47,9260.78,-7472.93,35.5561,0,0,4.73802,0,0),(56878,48,9261.41,-7484.79,35.5186,5000,0,4.96343,0,0),
(56878,49,9257.31,-7478.36,35.5674,0,0,1.63098,0,0),(56878,50,9257.89,-7464.84,35.8457,0,0,1.33253,0,0),(56878,51,9261.67,-7451.45,35.8064,0,0,1.49903,0,0),
(56878,52,9260.27,-7440.94,35.5334,0,0,2.09476,0,0),(56878,53,9252.77,-7433.64,35.3787,0,0,3.18961,0,0),(56878,54,9246.07,-7435.69,35.6636,0,0,3.65613,0,0),
(56878,55,9234.09,-7448.49,38.8601,0,0,3.77159,0,0),(56878,56,9223.23,-7453.13,41.5279,0,0,3.28778,0,0),(56878,57,9191.76,-7456.54,51.4601,0,0,3.13149,0,0),
(56878,58,9173.12,-7455.29,58.8282,0,0,3.25323,0,0),(56878,59,9164.16,-7458.59,62.5594,0,0,3.89333,0,0),(56878,60,9156.07,-7468.57,66.4942,0,0,4.17214,0,0),
(56878,61,9148.42,-7485.63,71.7225,0,0,4.36456,0,0),(56878,62,9143.4,-7489.75,73.4711,0,0,3.44957,0,0),(56878,63,9126.99,-7490.92,75.4171,0,0,2.99718,0,0),
(56878,64,9107.01,-7486.36,77.9078,0,0,2.69795,0,0),(56878,65,9095.5,-7480.4,79.1877,0,0,2.43798,0,0),(56878,66,9086.31,-7470.12,80.753,0,0,2.10104,0,0),
(56878,67,9079.17,-7460.49,82.553,0,0,2.48589,0,0),(56878,68,9071.38,-7455.15,83.1419,0,0,2.68224,0,0),(56878,69,9064.04,-7453.33,83.1557,0,0,3.20846,0,0),
(56878,70,9047.58,-7456.7,83.3916,10000,1622102,3.35768,0,0),(56878,71,9056.46,-7449.9,83.4217,0,0,0.510614,0,0),(56878,72,9066.85,-7449.36,83.2982,0,0,6.07124,0,0),
(56878,73,9075.27,-7452.77,83.1491,0,0,5.71781,0,0);
-- Link
DELETE FROM creature_linking WHERE guid = 56877;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(56877, 56878, 1+128+512);
-- Gossips in 'Forest Song' 

-- Architect Nemos
UPDATE creature_template SET GossipMenuId = 7404 WHERE entry = 17291;
DELETE FROM gossip_menu WHERE entry = 7404; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7404, 8873, 0, 0);

-- Artificer
UPDATE creature_template SET GossipMenuId = 7382 WHERE entry = 17406;
DELETE FROM gossip_menu WHERE entry = 7382; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7382, 8838, 0, 0);

-- Vindicator Vedaar <Hand of Argus>
UPDATE creature_template SET GossipMenuId = 7407 WHERE entry = 17303;
DELETE FROM gossip_menu WHERE entry = 7407; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7407, 8876, 0, 0);

-- Sentinel Luciel Starwhisper <Silverwing Sentinels>
UPDATE creature_template SET GossipMenuId = 7405 WHERE entry = 17287;
DELETE FROM gossip_menu WHERE entry = 7405; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7405, 8874, 0, 0);

-- Gnarl <Ancient of War>
UPDATE creature_template SET GossipMenuId = 8080 WHERE entry = 17310;
DELETE FROM gossip_menu WHERE entry = 8080; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(8080, 9986, 0, 0);
-- Kayneth Stillwind
-- temp. equip or visual spell missing...
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 32331;
DELETE FROM creature_movement WHERE id = 32331;
UPDATE creature_template SET MovementType = 2 WHERE entry = 3848;
DELETE FROM creature_movement_template WHERE entry = 3848;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(3848,1,2954.25,-3215.41,169.205,20000,0,3.49066,0,0),
(3848,2,2966.65,-3213.95,168.914,60000,384801,0.0702074,0,0),
(3848,3,2954.23,-3215.45,169.206,90000,0,3.3457,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 384801; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(384801,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0.965562,''),
-- temp. equip "on"
(384801,6,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(384801,57,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
-- temp. equip "off"
(384801,59,0,0,0,0,0,0,2000000474,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry = 2000000474;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000474,'Putting the bottles away, %s sighs.',0,2,0,0,NULL);
-- Leotheras the Blind
UPDATE creature SET position_x = 375.790283, position_y = -438.609650, position_z = 29.524517, orientation = 2.731379 WHERE guid = 93773;
DELETE FROM creature_template_addon WHERE entry = 21215;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(21215,0,8,0,0,0,0,NULL);
UPDATE creature_template SET equipmentTemplateid = 2089 WHERE entry = 21215;

-- Greyheart Spellbinder
UPDATE creature SET position_x = 369.062805, position_y = -447.304535, position_z = 29.518799, orientation = 0.755744 WHERE guid = 93772;
UPDATE creature SET position_x = 373.928528, position_y = -428.824677, position_z = 29.524717, orientation = 4.879074 WHERE guid = 93770;
UPDATE creature SET position_x = 386.668396, position_y = -443.397949, position_z = 29.527174, orientation = 2.711379 WHERE guid = 93771;
-- Fix for old bugs....
-- movement chenged to 0:idle (was wrongly set to random)

-- Jarven Thunderbrew
UPDATE dbscripts_on_creature_movement SET datalong = 0 WHERE id = 137302 AND delay = 2;
-- Grimand Elmore
UPDATE dbscripts_on_creature_movement SET datalong = 0 WHERE id = 141603 AND delay = 2;
-- Silvermoon City
-- Arcane Guardian
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (64056,64059,64060);
DELETE FROM creature_movement WHERE id IN (64056,64059,64060);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(64056,1,9672.76,-7494.03,15.7596,0,0,4.72967,0,0),(64056,2,9670.61,-7519.96,15.7355,0,0,5.33992,0,0),(64056,3,9683.12,-7517.05,15.7355,0,0,6.00453,0,0),
(64056,4,9695.07,-7521.45,15.7355,0,0,0.293895,0,0),(64056,5,9694.27,-7491.86,15.8131,0,0,0.879802,0,0),(64056,6,9719.45,-7481.92,13.561,0,0,0.0512015,0,0),
(64056,7,9764.07,-7494.9,13.5244,0,0,0.0370635,0,0),(64056,8,9774.78,-7495.4,13.5485,0,0,5.02749,0,0),(64056,9,9777.26,-7508.34,13.5485,0,0,0.136807,0,0),
(64056,10,9800.95,-7507.69,13.5485,0,0,1.42093,0,0),(64056,11,9802.55,-7487.94,13.5485,0,0,1.55445,0,0),(64056,12,9800.7,-7468.54,13.5485,0,0,3.08912,0,0),
(64056,13,9778.3,-7468.61,13.5485,0,0,4.4133,0,0),(64056,14,9774.68,-7480.5,13.5485,0,0,3.25876,0,0),(64056,15,9747.55,-7479.94,13.5705,0,0,2.33356,0,0),
(64056,16,9727.59,-7446.16,13.5727,0,0,3.04043,0,0),(64056,17,9718.75,-7445.93,13.5856,0,0,3.69231,0,0),(64056,18,9690.75,-7459.64,13.5864,0,0,4.19183,0,0),
-- #2
(64059,1,9850.77,-7451.69,13.6249,0,0,4.72528,0,0),(64059,2,9850.73,-7421.69,13.3197,0,0,2.61099,0,0),(64059,3,9805.08,-7419.36,13.3061,0,0,3.16626,0,0),
(64059,4,9850.1,-7420.27,13.3164,0,0,4.89807,0,0),(64059,5,9850.76,-7452.14,13.6299,0,0,4.71351,0,0),(64059,6,9850.92,-7421.78,13.3187,0,0,0.43544,0,0),
(64059,7,9879.56,-7418.61,13.2654,0,0,0.604301,0,0),(64059,8,9885.8,-7412.97,13.2654,0,0,1.13523,0,0),(64059,9,9888.1,-7388.53,13.5648,0,0,1.4596,0,0),
(64059,10,9890.7,-7369.25,20.7165,0,0,1.43491,0,0),(64059,11,9892.62,-7350.45,20.6464,0,0,1.45847,0,0),(64059,12,9893.37,-7338.24,22.3974,0,0,1.76792,0,0),
(64059,13,9888.71,-7326.05,23.7671,0,0,2.34205,0,0),(64059,14,9872.74,-7319.35,26.2829,0,0,3.10781,0,0),(64059,15,9854.49,-7320.4,26.2821,0,0,2.00354,0,0),
(64059,16,9840.42,-7284.02,26.2259,0,0,1.37836,0,0),(64059,17,9842.54,-7274.31,26.133,0,0,1.1506,0,0),(64059,18,9860.73,-7245.4,26.7839,0,0,0.823874,0,0),
(64059,19,9870.92,-7232.72,28.0373,0,0,0.505002,0,0),(64059,20,9875.86,-7232.71,28.0373,0,0,5.75225,0,0),(64059,21,9881.25,-7236.75,31.0445,0,0,5.87713,0,0),
(64059,22,9886.03,-7237.04,31.0209,0,0,0.25446,0,0),(64059,23,9909.42,-7214.81,30.8594,0,0,0.559195,0,0),(64059,24,9927.99,-7207.16,30.8627,0,0,0.256816,0,0),
(64059,25,9965.58,-7196.18,30.8758,0,0,0.284305,0,0),(64059,26,10000.7,-7184.92,30.8758,0,0,0.288232,0,0),(64059,27,9965.65,-7196.19,30.8758,0,0,3.46124,0,0),
(64059,28,9928.25,-7207.11,30.8656,0,0,3.43768,0,0),(64059,29,9910.4,-7214.29,30.8547,0,0,3.87201,0,0),(64059,30,9886.04,-7238.09,31.0198,0,0,3.7385,0,0),
(64059,31,9881.2,-7237.23,31.0481,0,0,2.474,0,0),(64059,32,9875.44,-7232.2,28.0375,0,0,2.77481,0,0),(64059,33,9871.49,-7231.91,28.0375,0,0,3.7275,0,0),
(64059,34,9858.03,-7249.06,26.7771,0,0,4.26393,0,0),(64059,35,9842.69,-7274.95,26.1301,0,0,4.39509,0,0),(64059,36,9840.72,-7285.18,26.2211,0,0,4.87575,0,0),
(64059,37,9854.58,-7320.47,26.2816,0,0,5.59517,0,0),(64059,38,9877.46,-7320.4,25.71,0,0,5.90069,0,0),(64059,39,9891.5,-7329.49,22.8815,0,0,5.35955,0,0),
(64059,40,9894.34,-7343.66,22.3979,0,0,4.72888,0,0),(64059,41,9893.21,-7351.31,20.6479,0,0,4.62285,0,0),(64059,42,9890.91,-7369.46,20.7144,0,0,4.5718,0,0),
(64059,43,9888.19,-7388.55,13.5651,0,0,4.60715,0,0),(64059,44,9885.37,-7412.69,13.2651,0,0,3.98034,0,0),(64059,45,9879.32,-7418.23,13.2651,0,0,3.60727,0,0),
(64059,46,9850.15,-7420.8,13.3167,0,0,4.13742,0,0),
-- #3
(64060,1,9660.13,-7158.27,14.3233,0,0,0.270114,0,0),(64060,2,9667.71,-7153.79,14.3233,0,0,0.867017,0,0),(64060,3,9672.93,-7146.66,14.3237,0,0,1.28956,0,0),
(64060,4,9672.93,-7136.62,14.3238,0,0,0.100468,0,0),(64060,5,9702.89,-7129.69,13.9218,0,0,0.960062,0,0),(64060,6,9702.85,-7123.77,13.9204,0,0,1.84599,0,0),
(64060,7,9694.97,-7101.03,13.9209,0,0,1.7863,0,0),(64060,8,9685.25,-7089.14,14.3246,0,0,2.81807,0,0),(64060,9,9649.26,-7084.89,14.3159,0,0,3.20999,0,0),
(64060,10,9611.6,-7104.24,14.4294,0,0,3.62625,0,0),(64060,11,9597.42,-7108.99,14.4461,0,0,3.25397,0,0),(64060,12,9543.35,-7110.42,14.3429,0,0,3.31287,0,0),
(64060,13,9531.5,-7116.31,14.2175,0,0,3.72914,0,0),(64060,14,9523.96,-7128.79,14.1171,0,0,4.46976,0,0),(64060,15,9526.91,-7165.06,14.139,0,0,5.16091,0,0),
(64060,16,9537.07,-7171.87,14.1139,0,0,6.05312,0,0),(64060,17,9576.68,-7173.84,14.2325,0,0,6.22983,0,0),(64060,18,9621.82,-7177.9,14.3065,0,0,6.14736,0,0),
(64060,19,9672.7,-7185.15,14.322,0,0,0.533337,0,0),(64060,20,9696.98,-7166.98,13.9231,0,0,0.710052,0,0),(64060,21,9704.29,-7137.89,13.9225,0,0,3.09611,0,0),
(64060,22,9674.72,-7136.34,14.3243,0,0,2.16462,0,0),(64060,23,9672.34,-7124.26,14.3244,0,0,1.8756,0,0),(64060,24,9666.38,-7115.44,14.3244,0,0,2.42459,0,0),
(64060,25,9654.07,-7111.3,14.323,0,0,3.03485,0,0),(64060,26,9637.09,-7111.58,14.323,0,0,3.36707,0,0),(64060,27,9628.53,-7117.47,14.3232,0,0,4.0967,0,0),
(64060,28,9623.45,-7129.11,14.3235,0,0,4.47324,0,0),(64060,29,9623.23,-7142.6,14.3236,0,0,4.95861,0,0),(64060,30,9627.91,-7154.79,14.3237,0,0,5.52162,0,0),
(64060,31,9636.41,-7159.43,14.3237,0,0,6.0282,0,0),(64060,32,9648.92,-7160.64,14.3237,0,0,6.27952,0,0);
 -- Duplicate removed
DELETE FROM creature WHERE guid = 64058;
DELETE FROM creature_addon WHERE guid = 64058;-- Silvermoon City

-- Silvermoon City Guardian
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid IN (56891,56892,56902);
DELETE FROM creature_movement WHERE id IN (56891,56892,56902);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(56902,1,9560.49,-7396.32,16.8383,0,0,5.6878,0,0),(56902,2,9564.74,-7403.01,16.8514,0,0,4.68171,0,0),(56902,3,9564.68,-7408.04,19.4736,0,0,4.66993,0,0),
(56902,4,9564.38,-7414.49,19.4725,0,0,4.11388,0,0),(56902,5,9558.59,-7417.48,19.4758,0,0,4.72446,0,0),(56902,6,9559.22,-7420.59,19.4761,0,0,5.10536,0,0),
(56902,7,9562.27,-7428.57,15.4674,0,0,5.10536,0,0),(56902,8,9564.18,-7435.28,15.4907,0,0,4.74408,0,0),(56902,9,9565.33,-7463.57,15.5186,0,0,6.16879,0,0),
(56902,10,9577.41,-7464.07,15.5913,0,0,6.27952,0,0),(56902,11,9582.32,-7464.09,13.5058,0,0,6.27952,0,0),(56902,12,9588.13,-7463.91,13.5186,0,0,0.933318,0,0),
(56902,13,9603.74,-7428.58,13.3051,0,0,1.6064,0,0),(56902,14,9596.36,-7407.73,13.3051,0,0,1.67709,0,0),(56902,15,9595.16,-7386.97,13.5132,0,0,2.60857,0,0),
(56902,16,9579.44,-7384.89,13.4101,0,0,2.85833,0,0),(56902,17,9574.33,-7383.12,14.407,0,0,2.41694,0,0),(56902,18,9572.22,-7377.31,14.7057,0,0,1.5849,0,0),
(56902,19,9573.56,-7372.09,14.7057,0,0,1.05083,0,0),(56902,20,9579.46,-7368.83,13.4065,0,0,0.10678,0,0),(56902,21,9594.91,-7367.79,13.4935,0,0,1.56762,0,0),
(56902,22,9593.18,-7332.37,14.1488,0,0,2.2462,0,0),(56902,23,9583.93,-7326.35,14.1609,0,0,3.14863,0,0),(56902,24,9521.05,-7325.67,14.1198,0,0,4.20577,0,0),
(56902,25,9508.47,-7349.5,14.3415,0,0,4.62753,0,0),(56902,26,9507.56,-7390.61,14.325,0,0,5.69488,0,0),(56902,27,9514.72,-7396,14.3151,0,0,6.09529,0,0),
(56902,28,9528.65,-7396.22,16.8212,0,0,0.00373459,0,0),(56902,29,9535.75,-7396.2,16.8384,0,0,0.00373459,0,0),
-- #2
(56891,1,9673.84,-7435.99,13.2939,0,0,5.97904,0,0),(56891,2,9687.66,-7436.96,13.2939,0,0,0.3548,0,0),(56891,3,9700.6,-7433.75,13.2939,0,0,0.511094,0,0),
(56891,4,9714.79,-7423.78,13.2939,0,0,0.427842,0,0),(56891,5,9727.95,-7419.62,13.2963,0,0,0.0736273,0,0),(56891,6,9765.58,-7418.83,13.3839,0,0,4.92661,0,0),
(56891,7,9767.47,-7441.57,14.4133,0,0,6.26571,0,0),(56891,8,9792.69,-7441.8,14.4079,0,0,1.32948,0,0),(56891,9,9795.92,-7420.71,13.4716,0,0,0.159236,0,0),
(56891,10,9844.77,-7420.46,13.3168,0,0,0.00608253,0,0),(56891,11,9878.71,-7419.53,13.2654,0,0,0.659534,0,0),(56891,12,9883.66,-7413.79,13.2654,0,0,1.11742,0,0),
(56891,13,9885.98,-7388.42,13.5646,0,0,1.57295,0,0),(56891,14,9886.67,-7369.45,20.7161,0,0,2.02691,0,0),(56891,15,9881.59,-7364.04,20.7046,0,0,2.8665,0,0),
(56891,16,9873.68,-7363.73,20.7358,0,0,3.17517,0,0),(56891,17,9865.79,-7365.88,18.6026,0,0,3.51681,0,0),(56891,18,9853.48,-7370.67,18.6021,0,0,3.36658,0,0),
(56891,19,9847.12,-7370.96,18.6028,0,0,2.90241,0,0),(56891,20,9834.14,-7363.61,18.599,0,0,2.85763,0,0),(56891,21,9827.21,-7362.87,20.7376,0,0,3.22677,0,0),
(56891,22,9810.54,-7363.6,20.7032,0,0,3.19143,0,0),(56891,23,9827.15,-7362.82,20.7375,0,0,0.0655412,0,0),(56891,24,9834.22,-7364.16,18.599,0,0,5.80131,0,0),
(56891,25,9844.13,-7371.12,18.6044,0,0,6.022,0,0),(56891,26,9853.34,-7371.22,18.6058,0,0,0.147223,0,0),(56891,27,9866.1,-7365.73,18.602,0,0,0.422112,0,0),
(56891,28,9873.43,-7363.51,20.7371,0,0,0.0623996,0,0),(56891,29,9883.24,-7363.54,20.7022,0,0,5.81899,0,0),(56891,30,9887.78,-7369.19,20.7141,0,0,4.97026,0,0),
(56891,31,9886.29,-7388.51,13.5651,0,0,4.68437,0,0),(56891,32,9884.02,-7413.8,13.2644,0,0,4.25005,0,0),(56891,33,9878.83,-7419.42,13.2644,0,0,3.52277,0,0),
(56891,34,9845.1,-7420.47,13.3175,0,0,3.21379,0,0),(56891,35,9796.65,-7420.79,13.4841,0,0,4.19181,0,0),(56891,36,9792.82,-7441.82,14.4093,0,0,3.59883,0,0),
(56891,37,9767.99,-7441.53,14.403,0,0,2.2172,0,0),(56891,38,9765.12,-7419.18,13.3795,0,0,3.15378,0,0),(56891,39,9728.01,-7419.58,13.2973,0,0,3.30536,0,0),
(56891,40,9714.34,-7424.05,13.2931,0,0,3.80566,0,0),(56891,41,9700.82,-7433.67,13.2931,0,0,3.59125,0,0),(56891,42,9687.3,-7437.1,13.2931,0,0,3.2064,0,0),
(56891,43,9673.06,-7436.09,13.2931,0,0,2.81056,0,0),(56891,44,9654.55,-7426.66,13.2931,0,0,2.89381,0,0),(56891,45,9608.8,-7424.28,13.3049,0,0,2.73043,0,0),
(56891,46,9598.95,-7414.27,13.3049,0,0,2.10211,0,0),(56891,47,9597.57,-7406.57,13.3049,0,0,1.6725,0,0),(56891,48,9597.25,-7386.82,13.5117,0,0,0.713527,0,0),
(56891,49,9616.95,-7384.2,14.411,0,0,0.805563,0,0),(56891,50,9618.38,-7369.19,14.4125,0,0,1.57313,0,0),(56891,51,9617.31,-7383.18,14.3943,0,0,3.70313,0,0),
(56891,52,9597.4,-7386.56,13.5055,0,0,4.54357,0,0),(56891,53,9597.69,-7406.42,13.3037,0,0,4.97082,0,0),(56891,54,9603.99,-7419.48,13.3038,0,0,5.57682,0,0),
(56891,55,9611.77,-7424.61,13.3055,0,0,6.25226,0,0),(56891,56,9655.53,-7426.25,13.2944,0,0,6.0292,0,0),(56891,57,9665.34,-7432.27,13.293,0,0,5.74175,0,0),
-- #3
(56892,1,9767.13,-7417.75,13.3854,0,0,3.17742,0,0),(56892,2,9727.21,-7418.05,13.2973,0,0,3.36984,0,0),(56892,3,9716.3,-7421.25,13.2942,0,0,3.65887,0,0),
(56892,4,9700.68,-7431.93,13.2942,0,0,3.57247,0,0),(56892,5,9686.2,-7435.45,13.2942,0,0,3.2269,0,0),(56892,6,9675.68,-7435.11,13.2942,0,0,2.86483,0,0),
(56892,7,9666.62,-7431.39,13.2942,0,0,2.59779,0,0),(56892,8,9653.54,-7423.55,13.2942,0,0,3.11223,0,0),(56892,9,9606.06,-7423.15,13.3049,0,0,3.64316,0,0),
(56892,10,9596.27,-7431.95,13.5698,0,0,3.66384,0,0),(56892,11,9582.23,-7435.5,13.5049,0,0,3.19025,0,0),(56892,12,9577.46,-7435.31,15.5956,0,0,3.2413,0,0),
(56892,13,9568,-7434.97,15.5026,0,0,2.73236,0,0),(56892,14,9561.1,-7428.51,15.4622,0,0,2.07262,0,0),(56892,15,9564.28,-7413.78,19.4721,0,0,1.6116,0,0),
(56892,16,9564.07,-7408.31,19.4735,0,0,1.65087,0,0),(56892,17,9563.86,-7403.26,16.9085,0,0,1.58018,0,0),(56892,18,9563.77,-7398.01,16.8513,0,0,2.62319,0,0),
(56892,19,9556.59,-7396.31,16.8217,0,0,3.24947,0,0),(56892,20,9528.73,-7397.64,16.8206,0,0,3.26518,0,0),(56892,21,9514.42,-7397.77,14.3157,0,0,3.11595,0,0),
(56892,22,9509.02,-7397.47,14.317,0,0,2.65257,0,0),(56892,23,9508,-7364.15,14.3187,0,0,1.54908,0,0),(56892,24,9508.94,-7325.06,14.1196,0,0,1.56872,0,0),
(56892,25,9509.57,-7285.92,14.0155,0,0,1.36373,0,0),(56892,26,9516.6,-7276.69,14.0155,0,0,0.539061,0,0),(56892,27,9528.47,-7274.38,13.9457,0,0,6.24557,0,0),
(56892,28,9569.25,-7274.65,13.9378,0,0,6.27699,0,0),(56892,29,9610.68,-7275.22,13.9415,0,0,6.27699,0,0),(56892,30,9643.3,-7275.27,13.9415,0,0,0.00558472,0,0),
(56892,31,9672.16,-7275.27,13.9852,0,0,5.88115,0,0),(56892,32,9675.04,-7280.37,14.0518,0,0,4.83757,0,0),(56892,33,9676.73,-7295.55,13.9345,0,0,5.83032,0,0),
(56892,34,9698.08,-7297.43,14.8766,0,0,5.51184,0,0),(56892,35,9698.74,-7309.28,14.953,0,0,3.90076,0,0),(56892,36,9677.92,-7310.69,13.9355,0,0,4.80167,0,0),
(56892,37,9677.19,-7328.18,13.7552,0,0,4.68857,0,0),(56892,38,9676.32,-7336.28,11.6203,0,0,4.62181,0,0),(56892,39,9674.75,-7355.5,11.9346,0,0,3.35575,0,0),
(56892,40,9669.16,-7356.35,11.9346,0,0,4.29321,0,0),(56892,41,9668.26,-7363.48,11.9346,0,0,5.62367,0,0),(56892,42,9677.16,-7371.41,11.9346,0,0,5.77528,0,0),
(56892,43,9689.84,-7376.81,11.9315,0,0,5.24828,0,0),(56892,44,9690.38,-7383.97,11.7758,0,0,3.3649,0,0),(56892,45,9683.22,-7385.04,11.6,0,0,4.78566,0,0),
(56892,46,9683.27,-7411,11.5461,0,0,4.73854,0,0),(56892,47,9682.15,-7424.15,13.6871,0,0,4.62466,0,0),(56892,48,9683.08,-7411.54,11.5687,0,0,1.54197,0,0),
(56892,49,9683.2,-7385.05,11.6003,0,0,0.205217,0,0),(56892,50,9690.31,-7383.6,11.7828,0,0,1.39592,0,0),(56892,51,9689.81,-7377.11,11.9286,0,0,2.43005,0,0),
(56892,52,9676.91,-7371.48,11.9321,0,0,2.54387,0,0),(56892,53,9668.42,-7362.14,11.9322,0,0,1.89121,0,0),(56892,54,9668.67,-7356.58,11.9322,0,0,0.319623,0,0),
(56892,55,9674.35,-7356,11.9322,0,0,0.914083,0,0),(56892,56,9676.32,-7336.26,11.6205,0,0,1.51648,0,0),(56892,57,9676.87,-7328.33,13.7505,0,0,1.49685,0,0),
(56892,58,9676.78,-7311.71,13.935,0,0,0.254348,0,0),(56892,59,9698.28,-7309.79,14.9634,0,0,1.14565,0,0),(56892,60,9698.35,-7297.54,14.9656,0,0,2.74786,0,0),
(56892,61,9678.72,-7296.14,13.8744,0,0,2.52952,0,0),(56892,62,9674.97,-7280.72,14.055,0,0,2.224,0,0),(56892,63,9670.14,-7275.79,13.9722,0,0,2.90415,0,0),
(56892,64,9642.15,-7275.7,13.9425,0,0,3.15234,0,0),(56892,65,9610.76,-7275.69,13.9453,0,0,3.11935,0,0),(56892,66,9568.77,-7275.14,13.9425,0,0,3.15077,0,0),
(56892,67,9527.08,-7274.84,13.9577,0,0,3.2403,0,0),(56892,68,9516.4,-7276.99,14.0154,0,0,3.63457,0,0),(56892,69,9509.36,-7285.78,14.0154,0,0,4.64074,0,0),
(56892,70,9508.43,-7324.26,14.1171,0,0,4.68001,0,0),(56892,71,9507.8,-7348.75,14.3443,0,0,4.69179,0,0),(56892,72,9507.16,-7376.74,14.3204,0,0,4.68393,0,0),
(56892,73,9508.11,-7396.32,14.3189,0,0,5.73479,0,0),(56892,74,9514.72,-7398.18,14.3158,0,0,0.00557729,0,0),(56892,75,9528.59,-7397.59,16.8203,0,0,0.0613386,0,0),
(56892,76,9563.13,-7396.34,16.8458,0,0,4.98264,0,0),(56892,77,9564.18,-7402.8,16.8495,0,0,4.88761,0,0),(56892,78,9564.4,-7408.38,19.4735,0,0,4.72268,0,0),
(56892,79,9564.29,-7415.49,19.4729,0,0,4.51141,0,0),(56892,80,9560.25,-7420.3,19.4757,0,0,4.79023,0,0),(56892,81,9562.37,-7429.16,15.4691,0,0,5.15072,0,0),
(56892,82,9566.71,-7434.65,15.4983,0,0,5.97774,0,0),(56892,83,9577.3,-7435.58,15.5906,0,0,0.0081892,0,0),(56892,84,9582.37,-7435.43,13.5044,0,0,0.0317511,0,0),
(56892,85,9594.53,-7434.76,13.548,0,0,0.348267,0,0),(56892,86,9610.35,-7423.46,13.3061,0,0,6.24189,0,0),(56892,87,9654,-7424.37,13.2933,0,0,5.93674,0,0),
(56892,88,9670.62,-7433.2,13.2933,0,0,5.9658,0,0),(56892,89,9681.75,-7435.49,13.2933,0,0,0.0156261,0,0),(56892,90,9695.52,-7434.36,13.2933,0,0,0.310936,0,0),
(56892,91,9715.86,-7421.42,13.2933,0,0,0.548126,0,0),(56892,92,9727.47,-7418.14,13.2962,0,0,0.090239,0,0),(56892,93,9765.98,-7418.08,13.3854,0,0,1.20943,0,0),
(56892,94,9767.99,-7396.27,14.408,0,0,0.0790633,0,0),(56892,95,9794.52,-7396.24,14.4224,0,0,4.77025,0,0),(56892,96,9794.64,-7417.77,13.4944,0,0,4.79164,0,0),
(56892,97,9794.3,-7395.9,14.4203,0,0,3.08026,0,0),(56892,98,9768.28,-7396.21,14.4007,0,0,4.61243,0,0);
-- Silvermoon City

-- Mirvedon <Apprentice Blacksmith>
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 57661;
DELETE FROM creature_movement WHERE id = 57661;
UPDATE creature_template SET NpcFlags = 0, MovementType = 2 WHERE entry = 16671;
DELETE FROM creature_movement_template WHERE entry = 16671;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16671,1,9859.67,-7361.79,18.5932,30000,0,4.66003,0,0),
(16671,2,9858.73,-7363.12,18.5903,60000,1667101,3.02245,0,0),
(16671,3,9859.67,-7361.79,18.5932,1000,0,1.31107,0,0),
(16671,4,9859.67,-7361.79,18.5932,240000,0,4.66003,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1667101; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1667101,2,1,173,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1667101,58,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Gloresse <Apprentice Engineer>
UPDATE creature_template SET NpcFlags = 0 WHERE entry = 16668;

-- Danwe <Engineering Trainer>
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 57657;
DELETE FROM creature_movement WHERE id = 57657;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16667;
DELETE FROM creature_movement_template WHERE entry = 16667;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16667,1,9822.16,-7333.16,26.3,30000,0,0.8303,0,0),
(16667,2,9822.35,-7331.03,26.2814,0,0,2.14044,0,0),
(16667,3,9820.39,-7329.52,26.2814,0,0,3.48268,0,0),
(16667,4,9819.43,-7330.37,26.2814,30000,1666701,4.24059,0,0),
(16667,5,9820.59,-7329.88,26.2814,0,0,5.83102,0,0),
(16667,6,9821.49,-7331.48,26.2814,0,0,5.17521,0,0),
(16667,7,9821.25,-7331.97,26.2814,30000,1666702,3.97591,0,0),
(16667,8,9822.16,-7333.16,26.3,0,0,5.81059,0,0),
(16667,9,9822.16,-7333.16,26.3,200000,0,0.8303,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1666701,1666702); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1666701,2,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(1666701,28,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(1666702,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1666702,28,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Dolothos <Apprentice Enchanter>
UPDATE creature_template SET GossipMenuId = 8828 WHERE entry = 16634;

-- Razia <Apprentice Alchemist>
UPDATE creature SET position_x = 10013.35, position_y = -7214.863, position_z = 32.07484, orientation = 2.042035, Spawndist = 0, MovementType = 2 WHERE guid = 57637;
DELETE FROM creature_movement WHERE id = 57637;
UPDATE creature_template SET NpcFlags = 0, MovementType = 2 WHERE entry = 16643;
DELETE FROM creature_movement_template WHERE entry = 16643;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16643,1,10013.35,-7214.863,32.07484,30000,0,2.042035,0,0),
(16643,2,10013.5,-7217.56,32.0748,0,0,5.5705,0,0),
(16643,3,10016.2,-7218.02,32.0748,20000,1664301,0.0218375,0,0),
(16643,4,10014.7,-7217.3,32.0764,0,0,2.13927,0,0),
(16643,5,10017.5,-7213.64,32.0764,0,0,1.15909,0,0),
(16643,6,10017.7,-7210.42,32.0756,6000,1664302,1.274931,0,0),
(16643,7,10017.5,-7213.48,32.0764,0,0,3.7964,0,0),
(16643,8,10013.35,-7214.863,32.07484,0,0,3.30946,0,0),
(16643,9,10013.35,-7214.863,32.07484,240000,0,2.042035,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1664301,1664302); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1664301,2,1,25,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1664302,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- [DND]Spirit 1 -- removed spawned by event?
DELETE FROM creature WHERE guid = 84939;
DELETE FROM creature_addon WHERE guid = 84939;
-- Tandrine - the guild master
UPDATE creature_template  SET  GossipMenuId = 7440 WHERE  Entry = 16568;
DELETE FROM gossip_menu WHERE entry = 7440; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7440, 9008, 0, 0);-- Silvermoon City
-- Rarthein
UPDATE creature SET position_x = 9586.497070, position_y = -7202.758789, position_z = 16.205301, orientation = 1.522827, Spawndist = 0, MovementType = 2 WHERE guid = 66970;
DELETE FROM creature_movement WHERE id = 66970;
UPDATE creature_template SET NpcFlags = 0, MovementType = 2 WHERE entry = 18727;
DELETE FROM creature_movement_template WHERE entry = 18727;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18727,1,9586.497070,-7202.758789,16.205301,5000,0,1.522827,0,0),
(18727,2,9587.55,-7204.13,16.2006,0,0,5.29506,0,0),(18727,3,9588.6,-7205.78,16.2006,0,0,4.73979,0,0),(18727,4,9588.04,-7209.86,16.2025,0,0,4.1994,0,0),
(18727,5,9584.88,-7214.49,16.1985,0,0,3.65355,0,0),(18727,6,9579.07,-7217.02,16.1514,8000,1872701,3.20666,0,0),(18727,7,9578.43,-7219.72,16.1383,0,0,3.92059,0,0),
(18727,8,9568.69,-7222.02,16.2126,0,0,3.23729,0,0),(18727,9,9562.48,-7219.13,16.2126,0,0,2.23591,0,0),(18727,10,9562.09,-7203.71,16.2126,0,0,0.610919,0,0),
(18727,11,9567.19,-7202.73,16.2126,0,0,0.631558,0,0),(18727,12,9568.08,-7187.2,16.5271,0,0,1.5866,0,0),(18727,13,9568.24,-7181.51,14.2397,0,0,1.55126,0,0),
(18727,14,9587.24,-7137.61,14.2627,0,0,1.52691,0,0),(18727,15,9583.26,-7097.02,14.5515,0,0,1.64943,0,0),(18727,16,9583.12,-7091.6,16.6671,0,0,1.60624,0,0),
(18727,17,9581.53,-7079.96,16.5304,0,0,1.73975,0,0),(18727,18,9580.68,-7074.95,18.6386,0,0,1.73975,0,0),(18727,19,9580.75,-7066.61,18.6391,0,0,1.37424,0,0),
(18727,20,9585.13,-7061.39,18.6423,0,0,1.39073,0,0),(18727,21,9585,-7056.83,18.6423,0,0,2.21858,0,0),(18727,22,9582.33,-7054.65,18.6439,7000,1872702,2.78957,0,0),
(18727,23,9585.37,-7056.86,18.6439,0,0,5.1222,0,0),(18727,24,9584.67,-7061.35,18.6439,0,0,4.51621,0,0),(18727,25,9580.31,-7066.88,18.6412,0,0,4.484,0,0),
(18727,26,9580.46,-7074.95,18.6395,0,0,4.74904,0,0),(18727,27,9580.67,-7080.07,16.5316,0,0,4.30372,0,0),(18727,28,9569.24,-7086.4,16.582,0,0,3.25128,0,0),
(18727,29,9545.86,-7087.62,16.5404,0,0,3.88196,0,0),(18727,30,9542.71,-7091.86,16.5168,0,0,4.10808,0,0),(18727,31,9539.4,-7096.66,14.4661,0,0,4.10808,0,0),
(18727,32,9534.56,-7103.86,14.341,7000,1872702,3.3164,0,0),(18727,33,9524.06,-7127.59,14.1184,0,0,4.26124,0,0),(18727,34,9523.94,-7126.39,14.1176,10000,0,1.6168,0,0),
(18727,35,9537.51,-7156.96,14.1588,0,0,5.4299,0,0),(18727,36,9562.06,-7172.62,14.2444,0,0,5.66237,0,0),(18727,37,9568.14,-7182.04,14.2361,0,0,4.90918,0,0),
(18727,38,9568.36,-7186.78,16.5291,0,0,4.79451,0,0),(18727,39,9567.72,-7202.33,16.2138,0,0,3.61799,0,0),(18727,40,9562.09,-7203.15,16.2123,0,0,4.0153,0,0),
(18727,41,9562.07,-7210.69,16.2123,0,0,5.55546,0,0),(18727,42,9576.27,-7211.77,16.1386,0,0,0.102439,0,0),(18727,43,9591.85,-7210.33,16.206,0,0,0.988835,0,0),
(18727,44,9592.05,-7204.59,17.9038,0,0,1.88102,0,0),(18727,45,9588.15,-7201.2,20.3475,0,0,3.10231,0,0),(18727,46,9583.17,-7201.31,22.8544,0,0,3.4571,0,0),
(18727,47,9580.18,-7203.92,25.1809,0,0,4.18987,0,0),(18727,48,9578.03,-7207.81,27.1404,0,0,4.29982,0,0),(18727,49,9573.93,-7214.83,27.2006,0,0,4.42156,0,0),
(18727,50,9573.79,-7224.73,27.1387,0,0,4.94777,0,0),(18727,51,9578.31,-7237.95,27.0304,0,0,5.56068,0,0),(18727,52,9581.59,-7238.52,27.0304,0,0,0.759454,0,0),
(18727,53,9581.49,-7236.7,27.0288,10000,1872701,1.49884,0,0),(18727,54,9584.05,-7237.43,27.0298,0,0,6.04659,0,0),(18727,55,9586.68,-7235.59,27.0228,0,0,1.51092,0,0),
(18727,56,9587.38,-7228.13,27.1259,0,0,0.501681,0,0),(18727,57,9591.13,-7226.99,27.1205,0,0,6.21938,0,0),(18727,58,9592.63,-7227.77,27.1057,0,0,5.10883,0,0),
(18727,59,9592.84,-7229.38,27.1038,10000,1872701,4.66298,0,0),(18727,60,9588.56,-7227.1,27.1272,0,0,2.97438,0,0),(18727,61,9575.41,-7226.46,27.135,0,0,2.69399,0,0),
(18727,62,9570.79,-7210.44,27.1844,10000,1872701,1.73737,0,0),(18727,63,9578.34,-7208.22,27.1499,0,0,1.10811,0,0),(18727,64,9579.96,-7203.93,25.205,0,0,0.920398,0,0),
(18727,65,9582.85,-7201.6,23.1841,0,0,0.289723,0,0),(18727,66,9587.58,-7200.91,20.91,0,0,6.15665,0,0),(18727,67,9591.49,-7204.06,18.2092,0,0,5.28878,0,0),
(18727,68,9592.15,-7209.27,16.209,0,0,4.6801,0,0),(18727,69,9589.79,-7210.7,16.2042,0,0,3.04255,0,0),(18727,70,9588.48,-7206.98,16.2007,0,0,1.80554,0,0),
(18727,71,9587.51,-7204.39,16.2007,0,0,1.99011,0,0),(18727,72,9586.58,-7202.75,16.2056,40000,1872701,1.54244,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1872701,1872702); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1872701,2,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1872702,2,1,6,0,0,0,0,0,0,0,0,0,0,0,0,'');-- Silvermoon City
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
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16693,1,9451.738,-7122.863,16.14618,30000,0,6.128479,0,0),
(16693,2,9452.37,-7125.35,16.1465,30000,1669301,5.8332,0,0),
(16693,3,9451.99,-7128.64,16.1465,30000,1669301,4.45247,0,0),
(16693,4,9451.738,-7122.863,16.14618,0,0,1.57634,0,0),
(16693,5,9451.738,-7122.863,16.14618,30000,0,6.128479,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1669301; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1669301,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1669301,28,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Tynna <Plate Armor Merchant>
UPDATE creature SET position_x = 9453.12, position_y = -7138.64, position_z = 16.1464, orientation = 0.186189, Spawndist = 0, MovementType = 2 WHERE guid = 57621;
DELETE FROM creature_movement WHERE id = 57621;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16626;
DELETE FROM creature_movement_template WHERE entry = 16626;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16626,1,9453.12,-7138.64,16.1464,45000,0,0.186189,0,0),
(16626,2,9455.66,-7135.42,16.1352,0,0,2.63973,0,0),
(16626,3,9453.97,-7134.69,16.1431,30000,1662601,2.99316,0,0),
(16626,4,9451.153,-7138.656,16.14635,30000,1662601,3.255405,0,0),
(16626,5,9453.12,-7138.64,16.1464,240000,0,0.186189,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1662601; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1662601,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1662601,28,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Zalle <Reagents>
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 57608;
DELETE FROM creature_movement WHERE id = 57608;
UPDATE creature_template SET SpeedWalk = 1, SpeedRun = 1.142857, MovementType = 2 WHERE entry = 16611;
DELETE FROM creature_movement_template WHERE entry = 16611;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16611,1,9572.41,-7060.69,18.6436,30000,0,0.178202,0,0),
(16611,2,9581.56,-7062.5,18.6436,0,0,0.355444,0,0),
(16611,3,9590.1,-7060.46,18.6436,30000,1661101,0.405962,0,0),
(16611,4,9587.3,-7060.51,18.6436,0,0,4.57644,0,0),
(16611,5,9586.82,-7062.25,18.6436,20000,0,4.22301,0,0),
(16611,6,9581.68,-7062.86,18.6436,0,0,3.11873,0,0),
(16611,7,9571.29,-7061.17,18.6436,0,0,2.85641,0,0),
(16611,8,9572.41,-7060.69,18.6436,180000,0,0.178202,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1661101; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1661101,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1661101,28,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');-- The Steamvault
-- Tidal Surger #1
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 12695;
DELETE FROM creature_movement WHERE id = 12695;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(12695,1,27.0136,-145.039,-22.3968,0,0,4.2748,0,0),(12695,2,21.4739,-159.21,-22.4082,0,0,4.6832,0,0),(12695,3,26.7279,-177.709,-22.3997,0,0,5.36256,0,0),
(12695,4,21.8476,-158.618,-22.4052,0,0,1.39002,0,0),(12695,5,30.8925,-138.629,-22.5491,0,0,0.720856,0,0),(12695,6,57.7822,-114.87,-22.6239,0,0,0.591266,0,0),
(12695,7,38.5541,-130.114,-22.6439,0,0,3.84281,0,0);
-- Steam Surgers
UPDATE creature SET position_x = 38.004841, position_y = -130.148880, position_z = -22.624664, orientation = 3.122529 WHERE guid = 12704;
UPDATE creature SET position_x = 38.839870, position_y = -126.107468, position_z = -22.576244, orientation = 3.196008 WHERE guid = 12688;
UPDATE creature SET position_x = 38.736404, position_y = -133.644135, position_z = -22.719330, orientation = 3.160665 WHERE guid = 12694;
-- Links
DELETE FROM creature_linking WHERE guid IN (12704, 12688, 12694, 12696);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(12704, 12695, 1+4+128+512),
(12688, 12695, 1+4+128+512),
(12694, 12695, 1+4+128+512),
(12696, 12695, 1+4+128+512);

-- Tidal Surger #2
UPDATE creature SET position_x = 1.503358, position_y = -176.132187, position_z = -22.362617, orientation = 6.039896, Spawndist = 0, MovementType = 2 WHERE guid = 12700;
DELETE FROM creature_movement WHERE id = 12700;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(12700,1,13.0123,-180.845,-22.3747,0,0,5.74062,0,0),(12700,2,17.6451,-189.086,-22.4312,0,0,4.86726,0,0),(12700,3,18.475,-205.289,-22.3882,0,0,4.74945,0,0),
(12700,4,17.0985,-188.306,-22.4238,0,0,1.99428,0,0),(12700,5,9.53988,-180.075,-22.4403,0,0,2.69328,0,0),(12700,6,-7.20501,-173.28,-23.2732,0,0,2.88963,0,0),
(12700,7,2.36385,-176.577,-22.3011,0,0,5.97624,0,0);
-- Steam Surgers
UPDATE creature SET position_x = 2.846399, position_y = -176.441040, position_z = -22.290167, orientation = 6.016719 WHERE guid = 12701;
UPDATE creature SET position_x = 0.480689, position_y = -173.216721, position_z = -22.139637, orientation = 6.068146 WHERE guid = 12703;
UPDATE creature SET position_x = -0.120366, position_y = -177.977997, position_z = -22.869598, orientation = 6.175745 WHERE guid = 12702;
UPDATE creature SET position_x = -0.890754, position_y = -175.418060, position_z = -22.789379, orientation = 6.043005 WHERE guid = 12684;
DELETE FROM creature_linking WHERE guid IN (12703, 12703, 12702, 12684);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(12701, 12700, 1+4+128+512),
(12703, 12700, 1+4+128+512),
(12702, 12700, 1+4+128+512),
(12684, 12700, 1+4+128+512);

-- Tidal Surger #3
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 12679;
DELETE FROM creature_movement WHERE id = 12679;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(12679,1,22.672,-223.202,-22.536,0,0,0.814135,0,0),(12679,2,39.0578,-210.222,-22.6133,0,0,0.594223,0,0),(12679,3,22.1297,-224.366,-22.5328,0,0,4.12852,0,0),
(12679,4,8.45932,-247.386,-23.3366,0,0,4.29345,0,0);
DELETE FROM creature_linking WHERE guid IN (12680, 12681, 12682, 12683);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(12680, 12679, 1+4+128+512),
(12681, 12679, 1+4+128+512),
(12682, 12679, 1+4+128+512),
(12683, 12679, 1+4+128+512);-- Archmage Leryda
-- Quest(s) become obtainable with her once one hits 'friendly' with the Violet Eye. 
UPDATE creature_template SET NPCFlags = 2 WHERE entry = 18253;-- Silvermoon City
-- Herald Amorlin -- gossip
UPDATE creature_template SET GossipMenuId = 5782 WHERE Entry = 20724;

-- Welethelon <Blunt Weapon Merchant>
UPDATE creature SET position_x = 9665.084, position_y = -7073.852, position_z = 14.32864, orientation = 4.869938, Spawndist = 0, MovementType = 2 WHERE guid = 57631;
DELETE FROM creature_movement WHERE id = 57631;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16637;
DELETE FROM creature_movement_template WHERE entry = 16637;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16637,1,9665.084,-7073.852,14.32864,30000,0,4.869938,0,0),(16637,2,9663.17,-7075.62,14.3327,0,0,4.51756,0,0),(16637,3,9662.24,-7078.38,14.3211,60000,0,4.83861,0,0),
(16637,4,9668.51,-7079.23,14.3343,0,0,6.24937,0,0),(16637,5,9668.51,-7079.23,14.3343,60000,0,4.62202,0,0),(16637,6,9666.14,-7076.94,14.3352,0,0,1.82958,0,0),
(16637,7,9665.084,-7073.852,14.32864,0,0,1.82958,0,0),(16637,8,9665.084,-7073.852,14.32864,30000,0,4.869938,0,0);

-- Noraelath <Leather Armor Merchant>
UPDATE creature SET position_x = 9651.68, position_y = -7070.56, position_z = 14.3104, orientation = 4.01189, Spawndist = 0, MovementType = 2 WHERE guid = 57680;
DELETE FROM creature_movement WHERE id = 57680;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16691;
DELETE FROM creature_movement_template WHERE entry = 16691;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16691,1,9651.68,-7070.56,14.3104,15000,0,4.01189,0,0),(16691,2,9650.83,-7073.55,14.3112,55000,0,4.28678,0,0),(16691,3,9649.54,-7070.92,14.3095,0,0,3.5163,0,0),
(16691,4,9648.21,-7071.54,14.3092,55000,0,4.22748,0,0),(16691,5,9651.68,-7070.56,14.3104,0,0,0.445533,0,0),(16691,6,9651.68,-7070.56,14.3104,40000,0,4.01189,0,0);

-- Rahein <Blade Vendor>
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 57668;
DELETE FROM creature_movement WHERE id = 57668;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16678;
DELETE FROM creature_movement_template WHERE entry = 16678;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16678,1,9630.69,-7032.97,15.2687,50000,0,4.7088,0,0),(16678,2,9636.05,-7031.66,15.2674,40000,1667801,0.794994,0,0),(16678,3,9630.66,-7032.19,15.2674,30000,0,3.27842,0,0),
(16678,4,9627.83,-7031.5,15.2674,40000,1667801,2.88416,0,0),(16678,5,9630.69,-7032.97,15.2687,0,0,5.94328,0,0),(16678,6,9630.69,-7032.97,15.2687,25000,0,4.7088,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1667801; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1667801,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1667801,37,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Feledis <Axe Vendor>
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 57656;
DELETE FROM creature_movement WHERE id = 57656;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16666;
DELETE FROM creature_movement_template WHERE entry = 16666;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16666,1,9644.87,-7037.51,15.2466,20000,0,4.28557,0,0),(16666,2,9649.12,-7037.71,15.247,0,0,0.629723,0,0),(16666,3,9649.12,-7037.71,15.247,0,0,0.629723,0,0),
(16666,4,9649.84,-7036.01,15.2545,45000,1666601,2.92466,0,0),(16666,5,9650.34,-7034.34,15.2614,0,0,1.71671,0,0),(16666,6,9647.34,-7032.51,15.2673,0,0,3.22389,0,0),
(16666,7,9647.34,-7032.51,15.2673,30000,0,4.63133,0,0),(16666,8,9644.26,-7032.12,15.2673,0,0,3.60854,0,0),(16666,9,9643.18,-7034.19,15.2648,30000,0,4.48346,0,0),
(16666,10,9643.12,-7036.25,15.254,0,0,5.52961,0,0),(16666,11,9644.87,-7037.51,15.2466,0,0,5.52961,0,0),(16666,12,9644.87,-7037.51,15.2466,20000,0,4.28557,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1666601; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1666601,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1666601,43,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');-- Silvermoon City
-- The Sanctum -- Small event between Leper Gnome Laborer and Sirigna'no <Keelen Sheets's Minion>

-- Leper Gnome Laborer
UPDATE creature SET position_x = 9734.615234, position_y = -7101.635254, position_z = 5.007354, orientation = 5.07277, Spawndist = 0, MovementType = 0 WHERE guid = 66966;
DELETE FROM creature_movement WHERE id = 66966;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(66966,1,9734.615234,-7101.635254,5.007354,5000,1872201,5.07277,0,0),(66966,2,9746.69,-7087.45,4.83844,0,0,0.592083,0,0),(66966,3,9762.85,-7084.05,5.6703,0,0,6.03411,0,0),
(66966,4,9763.642,-7085.864,5.669336,5000,1872202,3.630285,0,0),(66966,5,9754,-7086.93,4.78806,0,0,2.90427,0,0),(66966,6,9750.43,-7085.25,4.81097,0,0,3.01801,0,0),
(66966,7,9746.49,-7087.49,4.83771,0,0,4.17334,0,0),(66966,8,9746.58,-7092.51,4.86099,0,0,4.54189,0,0),(66966,9,9740.04,-7094.48,4.86946,0,0,3.56919,0,0),
(66966,10,9735.11,-7096.42,4.76647,0,0,4.0954,0,0),(66966,11,9733.75,-7098.94,4.87383,0,0,4.75592,0,0),(66966,12,9734.615234,-7101.635254,5.007354,10000,1872203,5.07277,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1872201,1872202,1872203); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1872201,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1872202,2,28,3,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_SLEEP'),
(1872202,3,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'wp pause'),
(1872203,1,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(1872203,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1872203,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1872203,3,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
-- Sirigna'no <Keelen Sheets's Minion>
UPDATE creature SET position_x = 9730.512695, position_y = -7087.351074, position_z = 3.590496, orientation = 0.940451, spawndist = 0, MovementType = 2 WHERE guid = 66998;
DELETE FROM creature_movement WHERE id = 66998;
UPDATE creature_template SET MovementType = 2 WHERE entry = 18730;
DELETE FROM creature_movement_template WHERE entry = 18730;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18730,1,9730.512695,-7087.351074,3.590496,50000,1873001,0.940451,0,0),(18730,2,9736.08,-7093.49,3.59087,0,0,5.60416,0,0),(18730,3,9737.95,-7095.48,4.86973,0,0,5.27194,0,0),
(18730,4,9738.96,-7098.11,4.87572,7000,1873002,5.07166,0,0),(18730,5,9731.78,-7098.66,4.8733,0,0,2.61281,0,0),(18730,6,9726.47,-7095.49,4.45682,0,0,3.01729,0,0),
(18730,7,9724.56,-7096.39,4.87236,0,0,3.96425,0,0),(18730,8,9723.14,-7098.31,4.88084,6000,1873003,4.1606,0,0),(18730,9,9722.82,-7094.91,4.87245,0,0,1.76514,0,0),
(18730,10,9721.27,-7090.53,4.87056,0,0,2.17747,0,0),(18730,11,9719.01,-7089.38,4.87391,0,0,3.02963,0,0),(18730,12,9716.85,-7089.77,4.88134,6000,1873003,3.40269,0,0),
(18730,13,9719.01,-7086.04,4.87501,0,0,1.10148,0,0),(18730,14,9720.17,-7080.84,4.87336,0,0,1.03236,0,0),(18730,15,9724.12,-7076.76,4.87341,0,0,0.622382,0,0),
(18730,16,9728.42,-7074.43,4.87384,0,0,1.03393,0,0),(18730,17,9728.44,-7072.12,4.88246,6000,1873003,1.96541,0,0),(18730,18,9731.98,-7073.67,4.8759,0,0,5.99058,0,0),
(18730,19,9738.98,-7074.99,4.87139,0,0,5.90026,0,0),(18730,20,9744.94,-7077.64,4.84019,0,0,5.64894,0,0),(18730,21,9750.48,-7082.53,4.80942,0,0,5.79267,0,0),
(18730,22,9754.55,-7084.26,4.89978,0,0,0.0411916,0,0),(18730,23,9761.59,-7085.42,5.55609,6000,1873004,6.25369,0,0),(18730,24,9750.21,-7084.4,4.81197,0,0,3.25347,0,0),
(18730,25,9742.19,-7085.09,4.86602,0,0,3.44747,0,0),(18730,26,9739.33,-7087.01,3.59085,0,0,3.85038,0,0),(18730,27,9735,-7090.54,3.59085,0,0,3.48752,0,0),
(18730,28,9730.93,-7091.47,3.59085,0,0,2.9291,0,0),(18730,29,9729.47,-7089.21,3.59085,0,0,1.55073,0,0),(18730,30,9730.512695,-7087.351074,3.590496,40000,1873005,0.940451,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 1873001 AND 1873005; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1873001,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1873001,2,1,0,0,18722,66966,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1873001,2,20,2,0,18722,66966,7 | 0x10,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'),
(1873002,3,31,18722,15,0,0,0,0,0,0,0,0,0,0,0,''),
(1873002,4,1,18,0,18722,15,7,0,0,0,0,0,0,0,0,''),
(1873003,2,1,35,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1873004,1,1,35,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1873004,1,28,0,0,18722,66966,7 | 0x10,0,0,0,0,0,0,0,0,'STATE_STAND'),
(1873004,1,25,1,0,18722,66966,7 | 0x10,0,0,0,0,0,0,0,0,'RUN ON'),
(1873004,3,1,35,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1873004,3,32,0,0,18722,66966,7 | 0x10,0,0,0,0,0,0,0,0,'wp unpause'),
(1873005,1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');

-- Sorim Lightsong <Horde Cloth Quartermaster> - gossip
UPDATE creature_template SET GossipMenuId = 8140 WHERE Entry = 20612;-- Silvermoon City
-- Bithrus <Fireworks Vendor>
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 57643;
DELETE FROM creature_movement WHERE id = 57643;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16650;
DELETE FROM creature_movement_template WHERE entry = 16650;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16650,1,9738.16,-7161.36,14.3237,2000,1665001,3.6752,0,0),(16650,2,9737.57,-7154.07,14.3247,0,0,1.54053,0,0),(16650,3,9737.57,-7154.07,14.3247,20000,1665001,4.07893,0,0),
(16650,4,9734.74,-7150.2,14.3247,0,0,1.62692,0,0),(16650,5,9735.83,-7146.59,14.3247,0,0,0.746487,0,0),(16650,6,9737.76,-7145.94,14.3247,0,0,6.05185,0,0),
(16650,7,9738.29,-7146.39,14.3247,15000,1665002,5.57747,0,0),(16650,8,9738.11,-7148.21,14.3247,0,0,5.07481,0,0),(16650,9,9739.89,-7150.05,14.3247,0,0,5.78167,0,0),
(16650,10,9744.71,-7152.63,14.3247,15000,1665003,5.51463,0,0),(16650,11,9741.53,-7156.3,14.3247,0,0,4.3224,0,0),(16650,12,9739.92,-7160.32,14.3247,0,0,3.76908,0,0),
(16650,14,9738.16,-7161.36,14.3237,20000,1665004,3.6752,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 1665001 AND 1665004; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1665001,2,15,11542,0,0,0,0,11541,11540,11544,0,0,0,0,0,''),
(1665002,2,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(1665002,13,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(1665003,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1665003,13,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1665004,3,15,11542,0,0,0,0,11541,11540,11544,0,0,0,0,0,''),
(1665004,6,1,4,0,0,0,0,0,0,0,0,0,0,0,0,'');-- Silvermoon City
-- Conjurer Tyren
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 66689;
DELETE FROM creature_movement WHERE id = 66689;
UPDATE creature_template SET MovementType = 2 WHERE entry = 18527;
DELETE FROM creature_movement_template WHERE entry = 18527;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18527,1,9580.41,-7134.3,14.2584,60000,1852702,0.257804,0,0),(18527,2,9583.42,-7125.76,14.3333,0,0,0.987649,0,0),(18527,3,9593.48,-7117.48,14.4257,0,0,0.598876,0,0),
(18527,4,9621.15,-7108.19,14.3515,0,0,0.520337,0,0),(18527,5,9633.38,-7101.19,14.3394,0,0,0.38996,0,0),(18527,6,9649.11,-7098.48,14.3236,0,0,6.17521,0,0),
(18527,7,9662.67,-7104.99,14.3236,0,0,5.17776,0,0),(18527,8,9664.43,-7114.67,14.3236,0,0,5.01283,0,0),(18527,9,9666.04,-7119.05,14.3238,0,0,5.54454,0,0),
(18527,10,9668.66,-7120.97,14.3238,0,0,0.0318226,0,0),(18527,11,9673.02,-7120.11,14.3238,120000,1852701,0.322415,0,0),(18527,12,9682.49,-7114.24,14.3238,0,0,0.307494,0,0),
(18527,13,9698.77,-7136.72,14.3238,0,0,5.22095,0,0),(18527,14,9703.34,-7159.53,13.9189,0,0,4.75364,0,0),(18527,15,9701.66,-7171.66,13.914,0,0,4.05072,0,0),
(18527,16,9690.17,-7182.02,13.9148,0,0,3.96825,0,0),(18527,17,9679.18,-7196.85,13.9249,0,0,4.50624,0,0),(18527,18,9677.73,-7212.29,14.2828,0,0,4.48503,0,0),
(18527,19,9674.62,-7215.65,14.3048,0,0,3.29437,0,0),(18527,20,9661.6,-7216.8,14.3048,0,0,3.31714,0,0),(18527,21,9657.64,-7218.86,14.955,0,0,3.82294,0,0),
(18527,22,9655.39,-7221.8,15.626,0,0,4.43398,0,0),(18527,23,9655.54,-7228.13,15.2962,0,0,5.20838,0,0),(18527,24,9659.96,-7230.66,14.6318,0,0,6.19562,0,0),
(18527,25,9689.36,-7244.11,14.2467,0,0,5.6241,0,0),(18527,26,9689.94,-7245.97,14.24,0,0,4.17583,0,0),(18527,27,9687.48,-7247.91,14.2777,120000,1852701,3.55458,0,0),
(18527,28,9689.88,-7256.7,14.2531,0,0,4.77274,0,0),(18527,29,9689.91,-7266.39,14.2663,0,0,4.47664,0,0),(18527,30,9683.25,-7276.06,14.0879,0,0,3.73837,0,0),
(18527,31,9672.17,-7282.72,14.0434,0,0,3.46898,0,0),(18527,32,9644.85,-7282.99,14.0105,0,0,3.13833,0,0),(18527,33,9611.25,-7282.73,14.0113,0,0,3.1344,0,0),
(18527,34,9579.56,-7282.32,14.0097,0,0,3.13048,0,0),(18527,35,9533.29,-7282.07,14.0093,0,0,2.84616,0,0),(18527,36,9519.62,-7274.34,14.0156,0,0,2.5375,0,0),
(18527,37,9508.5,-7267.72,14.3477,0,0,2.88072,0,0),(18527,38,9502.93,-7267.23,14.3481,120000,1852701,3.31504,0,0),(18527,39,9524.46,-7264.37,14.3174,0,0,6.20688,0,0),
(18527,40,9547.9,-7264.48,14.24,0,0,0.0163672,0,0),(18527,41,9558.87,-7264.02,14.2302,0,0,0.193867,0,0),(18527,42,9570.43,-7261.72,14.2984,0,0,0.0509247,0,0),
(18527,43,9584.28,-7262.27,14.2869,0,0,6.20923,0,0),(18527,44,9604.75,-7267.28,13.8682,0,0,0.0383605,0,0),(18527,45,9635.37,-7267.64,13.8697,0,0,6.27599,0,0),
(18527,46,9646.78,-7267.28,13.8659,0,0,0.392572,0,0),(18527,47,9659.8,-7260.28,14.3018,0,0,0.352516,0,0),(18527,48,9661.345,-7260.638,14.28749,120000,1852701,0.04176108,0,0),    
(18527,49,9667.56,-7247.18,14.2715,0,0,1.03986,0,0),(18527,50,9674.35,-7237.16,14.0004,0,0,1.38308,0,0),(18527,51,9674.09,-7232.91,14.2099,0,0,2.23445,0,0),
(18527,52,9671.98,-7231.09,14.2965,0,0,2.7748,0,0),(18527,53,9659.94,-7230.77,14.6336,0,0,2.81015,0,0),(18527,54,9655.9,-7228.54,15.3152,0,0,2.31142,0,0),
(18527,55,9654.83,-7224.71,15.6262,0,0,1.63205,0,0),(18527,56,9655.7,-7221.33,15.6262,0,0,1.17887,0,0),(18527,57,9658.26,-7218.67,14.9371,0,0,0.548985,0,0),
(18527,58,9666.17,-7216.67,14.3064,0,0,0.226972,0,0),(18527,59,9674.23,-7215.28,14.305,0,0,0.894561,0,0),(18527,60,9675.75,-7209.25,13.9885,0,0,1.57765,0,0),
(18527,61,9674,-7203.79,13.9597,0,0,2.3065,0,0),(18527,62,9669.14,-7201.18,14.3206,0,0,2.90333,0,0),(18527,63,9663.58,-7200.2,14.3219,0,0,2.12028,0,0),
(18527,64,9664.278,-7198.672,14.31875,120000,1852701,1.8441,0,0),(18527,65,9637.54,-7186.25,14.3225,0,0,2.79494,0,0),(18527,66,9629.4,-7183.8,14.3145,0,0,2.89154,0,0),
(18527,67,9611.11,-7181.33,14.2864,0,0,2.69441,0,0),(18527,68,9589.64,-7155.37,14.2629,0,0,2.09829,0,0),(18527,69,9577.91,-7136.72,14.2473,0,0,1.74408,0,0),
(18527,70,9578.67,-7134.63,14.2487,0,0,0.57776,0,0),(18527,71,9580.41,-7134.3,14.2584,60000,1852702,0.257804,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1852701,1852702); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1852701,10,15,11542,0,0,0,0,11544,11540,0,0,0,0,0,0,''),
(1852701,55,15,11544,0,0,0,0,11540,11542,0,0,0,0,0,0,''),
(1852701,88,15,11540,0,0,0,0,11542,11544,0,0,0,0,0,0,''),
(1852702,6,15,11542,0,0,0,0,11544,11540,0,0,0,0,0,0,''),
(1852702,35,15,11544,0,0,0,0,11540,11542,0,0,0,0,0,0,'');-- Silvermoon City
-- Blood Elf Magister
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 63517;
UPDATE creature_addon SET emote = 0 WHERE guid = 63517;
DELETE FROM creature_movement WHERE id = 63517;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(63517,1,9547.9,-7454.35,15.475,0,0,5.6233,0,0),
(63517,2,9550.803,-7458.872,15.5169,30000,1784501,5.313836,0,0),
(63517,3,9547.9,-7454.35,15.475,0,0,3.01972,0,0),
(63517,4,9542.652,-7453.76,15.4635,30000,1784502,3.03394,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1784501,1784502); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1784501,9,31,18560,20,0,0,0,0,0,0,0,0,0,0,0,'search for 18560'),
(1784501,10,15,32760,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1784501,28,14,32760,0,0,0,0x04,0,0,0,0,0,0,0,0,''),
(1784502,2,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1784502,22,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
-- spell should have target
DELETE FROM spell_script_target WHERE entry = 32760;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES 
(32760,1,18560);
-- Justin's Bunny Target
UPDATE creature_template SET InhabitType = 4 WHERE entry = 18560;
UPDATE creature SET position_x = 9553.435, position_y = -7463.052, position_z = 19.48198, Spawndist = 0, MovementType = 0 WHERE guid = 66726;

-- Talmar <Apprentice Leatherworker>
UPDATE creature_template SET NpcFlags = 0 WHERE entry = 16687;

-- Amin <Apprentice Jewelcrafter>
-- Until patch 2.3, he was a journeyman jewelcrafting trainer.
UPDATE creature_template SET NpcFlags = 1, GossipMenuId = 8379 WHERE entry = 16703;
DELETE FROM npc_trainer WHERE entry = 16703;
UPDATE creature_template SET GossipMenuId = 8379 WHERE Entry = 16703;-- Silvermoon City
-- Champion Vranesh
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 64949;
DELETE FROM creature_movement WHERE id = 64949;
UPDATE creature_template SET MovementType = 2 WHERE entry = 18146;
DELETE FROM creature_movement_template WHERE entry = 18146;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18146,1,9758.3,-7486.95,13.5323,9000,1814601,0.118088,0,0),(18146,2,9712.03,-7485.72,13.5329,0,0,2.8285,0,0),(18146,3,9697.42,-7480.21,13.5337,0,0,2.97037,0,0),
(18146,4,9682.23,-7475.94,13.5289,0,0,3.09446,0,0),(18146,5,9667.43,-7480.08,13.533,0,0,3.6521,0,0),(18146,6,9649.83,-7490.18,13.5203,0,0,3.45968,0,0),
(18146,7,9637.59,-7492.43,13.5093,0,0,3.16986,0,0),(18146,8,9615.31,-7486.32,13.5157,0,0,2.66485,0,0),(18146,9,9602.26,-7471.78,13.5412,0,0,2.08287,0,0),
(18146,10,9594.68,-7450.51,13.535,0,0,2.59888,0,0),(18146,11,9591.9,-7450.27,13.5268,9000,1814602,3.27275,0,0),(18146,12,9595.3,-7450.07,13.5353,0,0,0.412329,0,0),
(18146,13,9601.99,-7440.08,13.5751,0,0,0.904774,0,0),(18146,14,9615.58,-7423.01,13.3049,0,0,0.587473,0,0),(18146,15,9620.4,-7420.15,13.3034,0,0,0.122517,0,0),
(18146,16,9636.99,-7420.27,13.2989,0,0,6.26904,0,0),(18146,17,9656.24,-7422.07,13.2945,0,0,5.77974,0,0),(18146,18,9673.69,-7429.95,13.2931,0,0,6.03787,0,0),
(18146,19,9689.85,-7431.43,13.2931,0,0,0.284035,0,0),(18146,20,9709.92,-7422.14,13.2931,0,0,0.567563,0,0),(18146,21,9722.75,-7415.23,13.2941,0,0,0.220417,0,0),
(18146,22,9748.41,-7414.39,13.2639,0,0,6.23028,0,0),(18146,23,9766.89,-7412.92,13.3848,0,0,0.572275,0,0),(18146,24,9767.48,-7396.72,14.417,0,0,0.474885,0,0),
(18146,25,9779.77,-7394.64,14.7073,0,0,0.0806156,0,0),(18146,26,9792.46,-7396.7,14.4005,0,0,5.60668,0,0),(18146,27,9794.99,-7413.91,13.5158,0,0,5.50379,0,0),
(18146,28,9809.44,-7416.98,13.3059,0,0,6.25384,0,0),(18146,29,9825.87,-7413.78,13.3084,0,0,0.0531218,0,0),(18146,30,9848.38,-7414.77,13.311,8000,1814603,0.0217059,0,0),
(18146,31,9847.95,-7429.26,13.3394,0,0,4.68075,0,0),(18146,32,9846.7,-7447.67,13.5725,0,0,4.88259,0,0),(18146,33,9850.63,-7465.46,14.9579,0,0,4.65954,0,0),
(18146,34,9851.04,-7480.74,14.9465,0,0,3.19163,0,0),(18146,35,9841.84,-7480.39,14.9252,0,0,6.07797,0,0),(18146,36,9843.284,-7480.133,14.92522,180000,0,6.219931,0,0),
(18146,37,9833.81,-7481.23,14.9269,0,0,3.95897,0,0),(18146,38,9831.49,-7484.97,14.9279,0,0,4.3768,0,0),(18146,39,9828.81,-7497.09,14.9368,0,0,4.73493,0,0),
(18146,40,9828.75,-7511.25,19.7384,0,0,5.17554,0,0),(18146,41,9839.4,-7518.51,19.6957,0,0,0.163774,0,0),(18146,42,9850.56,-7510.75,19.706,0,0,5.79508,0,0),
(18146,43,9850.98,-7513.18,19.7161,4000,1814604,4.76071,0,0),(18146,44,9871.53,-7516.45,19.751,0,0,0.55333,0,0),(18146,45,9874.03,-7511.54,19.7621,0,0,1.5932,0,0),
(18146,46,9873.29,-7497.2,14.951,0,0,1.65996,0,0),(18146,47,9872.67,-7490.02,14.9117,0,0,2.58908,0,0),(18146,48,9867.39,-7488.56,14.9231,0,0,3.10373,0,0),
(18146,49,9851.96,-7489.12,14.9395,0,0,2.04423,0,0),(18146,50,9850.82,-7470.58,14.9515,4000,1814605,1.62875,0,0),(18146,51,9850.09,-7457.25,14.9584,0,0,1.65624,0,0),
(18146,52,9849.55,-7452.75,13.6388,0,0,1.70729,0,0),(18146,53,9847.77,-7428.29,13.3303,0,0,2.09999,0,0),(18146,54,9845.37,-7424.81,13.3212,0,0,2.65134,0,0),
(18146,55,9815.67,-7423.7,13.306,0,0,3.18384,0,0),(18146,56,9797.93,-7424.11,13.4078,0,0,3.58439,0,0),(18146,57,9794.7,-7427.7,13.5121,0,0,4.35801,0,0),
(18146,58,9794,-7441.23,14.4228,0,0,3.82629,0,0),(18146,59,9780.94,-7442.98,14.7072,0,0,3.15242,0,0),(18146,60,9767.8,-7440.91,14.4108,0,0,2.55238,0,0),
(18146,61,9766.65,-7427.29,13.3871,0,0,2.11884,0,0),(18146,62,9761.66,-7423.61,13.2427,0,0,2.94979,0,0),(18146,63,9740.69,-7422.85,13.2549,0,0,3.45873,0,0),
(18146,64,9737.51,-7426.98,13.547,0,0,4.34073,0,0),(18146,65,9736.51,-7441.39,13.544,0,0,4.68787,0,0),(18146,66,9740.24,-7465.66,13.5734,0,0,5.02951,0,0),
(18146,67,9747.14,-7483.3,13.5566,0,0,5.54394,0,0);
DELETE FROM db_script_string WHERE entry BETWEEN 2000000475 AND 2000000481;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000475,'Our lives are yours, Blood Knight.',0,0,0,0,NULL),
(2000000476,'Even the Light is no match for the indomitable will of our people.',0,0,0,0,NULL),
(2000000477,'Your power strengthens us all.',0,0,0,0,NULL),
(2000000478,'%s\'s glances from guard to guard.',0,2,0,0,NULL),
(2000000479,'%s\'s surveys the small ranger practice ground with a condescending smirk.',0,2,0,0,NULL),
(2000000480,'%s\'s inclines his head slightly to the pair of guardians in greeting.',0,2,0,0,NULL),
(2000000481,'%s\'s arches a sculpted brow at the guards, a disapproving scowl on his face.',0,2,0,0,NULL);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 1814601 AND 1814605; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1814601,2,0,0,0,0,0,0,2000000481,0,0,0,0,0,0,0,''),
(1814601,3,1,16,0,16222,56911,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1814601,3,1,16,0,16222,56910,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1814601,3,1,16,0,16222,56912,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1814601,5,0,0,0,16222,56912,7 | 0x10,2000000477,2000000475,0,0,0,0,0,0,''),
(1814602,2,0,0,0,0,0,0,2000000478,0,0,0,0,0,0,0,''),
(1814602,3,1,16,0,16222,56900,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1814602,3,1,16,0,16222,56901,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1814602,3,1,16,0,16222,56897,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1814602,5,0,0,0,16222,56901,7 | 0x10,2000000475,2000000477,0,0,0,0,0,0,''),
(1814603,2,24,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1814603,4,0,0,0,0,0,0,2000000479,0,0,0,0,0,0,0,''),
(1814604,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1814605,1,0,0,0,0,0,0,2000000480,0,0,0,0,0,0,0,''),
(1814605,2,24,19085,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814605,3,1,16,0,16222,56914,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1814605,3,1,16,0,16222,56913,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1814605,5,0,0,0,16222,56914,7 | 0x10,2000000476,0,0,0,0,0,0,0,'');-- Quest updates for 10674 and 10859
UPDATE creature_template SET MovementType=0 WHERE entry IN (21926,22333);
UPDATE quest_template SET ReqSpellCast1=0 WHERE entry IN (10859,10674);
-- Note: creature 21926 has wrong model
-- Silvermoon City
-- targets for 'Shoot Bow' corrected
DELETE FROM spell_script_target WHERE entry IN (29120,29121,29122);
INSERT INTO spell_script_target (entry, type, targetEntry, inverseEffectMask) VALUES 
(29120, 1, 16897, 0),
(29121, 1, 16899, 0),
(29122, 1, 16898, 0);

-- Silvermoon Ranger
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid IN (64950,64951,64952,64953);
DELETE FROM creature_movement WHERE id IN (64950,64951,64952,64953);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(64950,1,9838.61,-7405.78,13.702,90000,1814701,1.13446,0,0),
(64951,1,9833.02,-7399.31,13.6929,70000,1814702,1.02974,0,0),
(64952,1,9867.85,-7406.05,13.5941,120000,1814703,1.74533,0,0),
(64953,1,9931.92,-7423.83,12.4414,27000,1814704,0.663225,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 1814701 AND 1814704; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1814701,3,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814701,7,1,274,0,0,0,0,1,71,0,0,0,0,0,0,''),
(1814701,14,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814701,29,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814701,31,0,0,0,0,0,0,2000000482,2000000483,2000000484,2000000485,0,0,0,0,''),
(1814701,53,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814701,79,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814702,1,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814702,16,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814702,35,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814702,58,15,29121,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814702,61,1,1,0,0,0,0,274,71,0,0,0,0,0,0,''),
(1814703,4,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814703,8,1,274,0,0,0,0,1,71,0,0,0,0,0,0,''),
(1814703,16,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814703,36,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814703,40,1,274,0,0,0,0,1,71,0,0,0,0,0,0,''),
(1814703,73,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814703,76,0,0,0,0,0,0,2000000483,2000000484,2000000485,2000000482,0,0,0,0,''),
(1814703,90,15,29120,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814704,2,15,29122,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814704,13,15,29122,0,0,0,0x08,0,0,0,0,0,0,0,0,''),
(1814704,21,15,29122,0,0,0,0x08,0,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000482 AND 2000000485;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000482,'What a beautiful shot!',0,0,0,0,NULL),
(2000000483,'Hah! Bullseye!',0,0,0,0,NULL),
(2000000484,'Agh... a chill ran up my spine.',0,0,0,0,NULL),
(2000000485,'They\'ll see the light, I hope.',0,0,0,0,NULL);

-- Honor Hold Target Dummy Right -- correct spawn point
UPDATE creature_template SET InhabitType = 4 WHERE entry = 16898;
UPDATE creature SET position_x = 9943.406, position_y = -7418.763, position_z = 13.46426, Spawndist = 0, MovementType = 0 WHERE guid = 58460;
-- Quest 11174
-- Zeppelin Power Core -- update
UPDATE creature_template SET MovementType=0, InhabitType=4 WHERE entry=23832;
UPDATE creature SET spawndist=0, MovementType=0 WHERE id=23832;
DELETE FROM creature_addon WHERE guid BETWEEN 18582 and 18588;
DELETE FROM creature_template_addon WHERE entry=23832;
UPDATE creature_template SET FactionAlliance=54, FactionHorde=54 WHERE entry=10076;
-- r3122
UPDATE creature_template SET ScriptName='npc_light_orb_collector' WHERE entry IN (21926,22333);

-- r3125
UPDATE creature_template SET ScriptName='' WHERE entry=28912;

-- r3126
UPDATE creature_template SET ScriptName='npc_scarlet_courier' WHERE entry=29076;-- Scarlet Courier
-- must be mounted on spawn
DELETE FROM creature_template_addon WHERE entry = 29076;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(29076,14583,0,1,0,0,0,NULL);
-- Silvermoon City
-- Silvermoon Farstrider
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 66687;
DELETE FROM creature_movement WHERE id = 66687;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(66687,1,9871.55,-7398.44,13.599,10000,1850701,0.139626,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1850701; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1850701,3,15,36802,0,0,0,0x08,36803,0,0,0,0,0,0,0,''),
(1850701,7,15,36803,0,0,0,0x08,36802,0,0,0,0,0,0,0,'');
DELETE FROM spell_script_target WHERE entry IN (36802,36803);
INSERT INTO spell_script_target (entry, type, targetEntry, inverseEffectMask) VALUES 
(36803, 1, 18507, 0),
(36802, 1, 18507, 0);
-- Kieupid <Pet Trainer> - update - source sniff and YTDB
UPDATE creature_template SET IconName = NULL, MinLevel = 80, MaxLevel = 80, FactionAlliance = 1604, FactionHorde = 1604, NpcFlags = 17, UnitFlags = 512, UnitClass = 2, Expansion = 2, MinLevelHealth = 12600, MaxLevelHealth = 12600, MinLevelMana = 3994, MaxLevelMana = 3994,
MinMeleeDmg = 391, MaxMeleeDmg = 585, MinRangedDmg = 313, MaxRangedDmg = 468, Armor = 9633, MeleeAttackPower = 146,  RangedAttackPower = 117, MeleeBaseAttackTime = 1500,  RangedBaseAttackTime = 2000, TrainerType = 3, TrainerClass = 3 WHERE Entry = 40405;  
-- UDB empty guid used
DELETE FROM creature WHERE guid = 54644;
DELETE FROM creature_addon WHERE guid = 54644;
DELETE FROM creature_movement WHERE id = 54644;
DELETE FROM game_event_creature WHERE guid = 54644;
DELETE FROM game_event_creature_data WHERE guid = 54644;
DELETE FROM creature_battleground WHERE guid = 54644;
DELETE FROM creature_linking WHERE guid = 54644 OR master_guid = 54644;
INSERT INTO creature (guid, id, modelid, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana, MovementType) VALUES
(54644, 40405, 0, 530, 1, 1, 9924.067, -7400.503, 13.71723, 6.073746, 120, 0, 12600, 3994, 0);

-- Pet Trainers -- gossip
UPDATE creature_template SET GossipMenuId = 4783 WHERE Entry IN (543,3545,3698,4320,16271,16675,40405);
-- Silvermoon City

-- Hunter
-- Tana <Hunter Trainer>
UPDATE creature_template SET GossipMenuId = 6652 WHERE Entry = 16672;
-- Oninath <Hunter Trainer>
UPDATE creature_template SET GossipMenuId = 6652 WHERE Entry = 16673;
-- Zandine <Hunter Trainer>
UPDATE creature_template SET GossipMenuId = 6652 WHERE Entry = 16674;
-- only Hunter should see these options
UPDATE gossip_menu_option SET condition_id = 542 WHERE menu_id = 6652 AND id = 1;
UPDATE gossip_menu_option SET condition_id = 646 WHERE menu_id = 6652 AND id = 2;

-- Paladin
-- Osselan <Paladin Trainer>
UPDATE creature_template SET GossipMenuId = 6647 WHERE Entry = 16679;
-- Ithelis <Paladin Trainer>
UPDATE creature_template SET GossipMenuId = 6647 WHERE Entry = 16680;
-- Champion Bachi <Paladin Trainer>
UPDATE creature_template SET GossipMenuId = 6647 WHERE Entry = 16681;
-- missing gossip added
DELETE FROM gossip_menu WHERE entry = 6647 AND text_id = 7904; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6647, 7904, 0, 92);

-- Warlock
-- Talionia <Warlock Trainer>
UPDATE creature_template SET GossipMenuId = 7437 WHERE Entry = 16647;
-- Alamma <Warlock Trainer>
UPDATE creature_template SET GossipMenuId = 7566 WHERE Entry = 16646;
-- Zanien <Warlock Trainer>
UPDATE creature_template SET GossipMenuId = 7566 WHERE Entry = 16648;
-- missing gossip added
DELETE FROM gossip_menu WHERE entry IN (7437,7566); 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7437, 7903, 0, 0),
(7437, 9006, 0, 103),
(7566, 9184, 0, 103),
(7566, 9185, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id IN (7437,7566);            
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(7437,0,3,'I am interested in warlock training.',5,16,0,0,0,0,0,'',103),
(7437,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',543),
(7437,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',642),
(7566,0,3,'It is a greater knowledge of the ways of the warlock that I crave.',5,16,0,0,0,0,0,'',103),
(7566,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',543),
(7566,2,0,'I wish to know about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',642);

-- Rogue
-- Zelanis <Rogue Trainer>
UPDATE creature_template SET GossipMenuId = 6650 WHERE Entry = 16684;
-- Elara <Rogue Trainer>
UPDATE creature_template SET GossipMenuId = 6650 WHERE Entry = 16685;
-- Nerisen <Rogue Trainer>
UPDATE creature_template SET GossipMenuId = 6650 WHERE Entry = 16686;
DELETE FROM gossip_menu WHERE entry = 6650; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6650, 9187, 0, 0),
(6650, 9188, 0, 73);
DELETE FROM gossip_menu_option WHERE menu_id = 6650;            
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(6650,0,3,'I require rogue training.',5,16,0,0,0,0,0,'',73),
(6650,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',530),
(6650,2,0,'I wish to know about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',632);
 
-- Druid
-- Harene Plainwalker <Druid Trainer>
DELETE FROM gossip_menu WHERE entry = 4605; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4605, 5716, 0, 102),
(4605, 5717, 0, 0);
UPDATE gossip_menu_option SET condition_id = 102 WHERE menu_id = 4605 AND id = 0;

-- Mage
-- Zaedana <Mage Trainer>
UPDATE creature_template SET GossipMenuId = 6648 WHERE Entry = 16651;
-- Quithas <Mage Trainer>
UPDATE creature_template SET GossipMenuId = 6648 WHERE Entry = 16652;
-- Inethven <Mage Trainer>
UPDATE creature_template SET GossipMenuId = 6648 WHERE Entry = 16653;
DELETE FROM gossip_menu WHERE entry = 6648; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6648, 9190, 0, 79),
(6648, 9191, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 6648;            
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(6648,0,3,'I am interested in mage training.',5,16,0,0,0,0,0,'',79),
(6648,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',523),
(6648,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',643);

-- Priest
-- Aldrae <Priest Trainer>
UPDATE creature_template SET GossipMenuId = 6649 WHERE Entry = 16658;
-- Lotheolan <Priest Trainer>
UPDATE creature_template SET GossipMenuId = 6649 WHERE Entry = 16659;
-- Belestra <Priest Trainer>
UPDATE creature_template SET GossipMenuId = 6649 WHERE Entry = 16660;
DELETE FROM gossip_menu WHERE entry = 6649; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6649, 9007, 0, 77),
(6649, 9186, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 6649;            
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(6649,0,3,'I require priest training.',5,16,0,0,0,0,0,'',77),
(6649,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(6649,2,0,'I wish to know about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',648);

-- Narinth <Portal Trainer>
UPDATE creature_template SET GossipMenuId = 4824 WHERE Entry = 16654;
DELETE FROM gossip_menu WHERE entry = 4824; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(4824, 5879, 0, 0),
(4824, 5880, 0, 79);

-- Lor'themar Theron <Regent Lord of Quel'Thalas>
UPDATE creature_template SET GossipMenuId = 7632 WHERE Entry = 16802;-- q.9437 'Twilight of the Dawn Runner'

-- Ithania
UPDATE creature_template SET GossipMenuId = 7371, UnitFlags = 514, NpcFlags = 1 WHERE Entry = 17119;
UPDATE creature SET spawntimesecs = 60 WHERE id = 17119; -- quest req.
-- missing gossip added
DELETE FROM gossip_menu WHERE entry = 7371; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7371, 8808, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 7371;            
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(7371,0,0,'Balandar sent me to get you out of here and pick up his cargo. He is waiting for you in the Brackenwall.',1,1,-1,0,7371,0,0,NULL,1005);
DELETE FROM conditions WHERE condition_entry = 1005;
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1005, 9, 9437, 0);
DELETE FROM dbscripts_on_gossip WHERE id = 7371; 
INSERT INTO dbscripts_on_gossip (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(7371,1,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'),
(7371,5,8,17119,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement_template WHERE entry = 17119;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17119,1,-2889.8,-3423.24,39.4438,4000,1711901,5.63741,0,0),
(17119,2,-2889.8,-3423.24,39.4438,1000,1711902,5.63741,0,0),
(17119,3,-2863.14,-3422.18,39.3522,0,0,0.267206,0,0),
(17119,4,-2849.6,-3418.58,34.1865,0,0,0.251498,0,0),
(17119,5,-2825.92,-3407.7,33.0412,0,0,0.905735,0,0),
(17119,6,-2825.92,-3407.7,33.0412,5000,1711903,0.905735,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 1711901 AND 1711903; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1711901,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Ithania active'),
(1711901,2,0,0,0,0,0,0,2000000486,0,0,0,0,0,0,0,''),
(1711901,3,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(1711901,4,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(1711902,1,31,5184,30,0,0,0,0,0,0,0,0,0,0,0,'search for 5184'),
(1711902,2,0,0,0,5184,35,7,2000000487,0,0,0,0,0,0,0,''),
(1711903,1,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1711903,1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Ithania unactive'),
(1711903,2,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry IN (2000000486,2000000487);
INSERT INTO db_script_string (entry,content_default,sound,type,language,emote,comment) VALUES
(2000000486,'I think, I\'ll be able to get to Brackenwall. The cargo they carried to the top of the towers. Be careful!',0,0,0,0,''),
(2000000487,'To arms! the prisoner is escaping!',0,1,0,0,'');
-- she must back to idle after killed also.
DELETE FROM dbscripts_on_creature_death WHERE id = 17119; 
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(17119,1,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle');-- Silvermoon City
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
-- Silvermoon City

-- Class Trainers in Sunstrider Isle
-- Julia Sunstriker <Mage Trainer>
UPDATE creature_template SET GossipMenuId = 6648 WHERE Entry = 15279;
-- Jesthenis Sunstriker <Paladin Trainer>
UPDATE creature_template SET GossipMenuId = 6647 WHERE Entry = 15280;
-- Matron Arena <Priest Trainer>
UPDATE creature_template SET GossipMenuId = 6649 WHERE Entry = 15284;
-- Ranger Sallina <Hunter Trainer>
UPDATE creature_template SET GossipMenuId = 6652 WHERE Entry = 15513;
-- Pathstalker Kariel <Rogue Trainer>
UPDATE creature_template SET GossipMenuId = 6650 WHERE Entry = 15285;
-- Summoner Teli'Larien <Warlock Trainer>
UPDATE creature_template SET GossipMenuId = 6628 WHERE Entry = 15283;
DELETE FROM gossip_menu WHERE entry = 6628; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6628, 7882, 0, 103),
(6628, 7903, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 6628;           
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(6628,0,3,'I am interested in warlock training.',5,16,0,0,0,0,0,'',103),
(6628,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',543),
(6628,2,0,'Learn about Dual Talent Specialization.',1,1,10371,0,0,0,0,'',642);

-- Well Watcher Solanian
UPDATE creature_template SET GossipMenuId = 6569 WHERE Entry = 15295;
DELETE FROM gossip_menu WHERE entry = 6569; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(6569, 7784, 0, 0);

-- Justin's Bunny Channeler
-- Honor Hold Target Dummy Right -- correct spawn point
UPDATE creature_template SET InhabitType = 4 WHERE entry = 18563;
UPDATE creature SET Spawndist = 0, MovementType = 0 WHERE guid IN (66727,66728);
-- Justin's Bunny Target
UPDATE creature_template SET InhabitType = 4 WHERE entry = 18650;
UPDATE creature SET Spawndist = 0, MovementType = 0 WHERE guid = 66725;
-- Silvermoon City
-- Camberon <Alchemy Trainer>
UPDATE creature SET Spawndist = 0, MovementType = 0 WHERE guid = 57636;
DELETE FROM creature_movement WHERE id = 57636;
UPDATE creature_template SET MovementType = 0 WHERE entry = 16642;
DELETE FROM creature_movement_template WHERE entry = 16642;
UPDATE creature_template SET equipmentTemplateid = 285 WHERE entry = 16642;
DELETE FROM creature_template_addon WHERE entry = 16642;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(16642,0,0,0,16,0,0,NULL);-- Demon Trainers
-- (..)Patch notes 3.0.2: "All demon abilities and spells will automatically be learned as pets gain levels. Demon Master trainers will be removed."
-- NPCs are no longer a demon (pet) trainer.
-- Gossip to rename pets name was added in 4.x.x

-- Alliance
-- Dane Winslow
UPDATE creature_template SET NpcFlags = 0, GossipMenuId = 0 WHERE Entry = 6373;
-- Cylina Darkheart
UPDATE creature_template SET NpcFlags = 0, GossipMenuId = 0 WHERE Entry = 6374;
-- Spackle Thornberry
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 5520;
-- Wren Darkspring
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 6376;
-- Dannie Fizzwizzle
UPDATE creature_template SET NpcFlags = 0, GossipMenuId = 0 WHERE Entry = 6328;
-- Jubahl Corpseseeker
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 6382;

-- Horde
-- Kayla Smithe
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 5749;
-- Gina Lang
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 5750;
-- Martha Strain
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 5753;
-- Hraug
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 12776;
-- Kitha
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 6027;
-- Kurgul
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 5815;
-- Yasmine Teli'Larien
UPDATE creature_template SET NpcFlags = 0, GossipMenuId = 0 WHERE Entry = 15494;
-- Daestra
UPDATE creature_template SET NpcFlags = 0, GossipMenuId = 0 WHERE Entry = 16267;
-- Torian
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 16649;
-- Greshka
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 12807;

-- Neutral
-- Matero Zeshuwal
UPDATE creature_template SET NpcFlags = 2, GossipMenuId = 0 WHERE Entry = 23535;
-- Silvermoon City
-- Aurosalia
-- morph should be done by event.
UPDATE creature_template_addon SET auras = NULL WHERE entry = 18744;
UPDATE creature_model_info SET modelid_other_gender = 0 WHERE modelid = 18145;  -- female BE should never have sheep model :) ... its done by event!

-- Keyanomir
UPDATE creature SET position_x = 9714.09, position_y = -7313.28, position_z = 24.7653, orientation = 1.14907, Spawndist = 0, MovementType = 0 WHERE id = 18231;

-- Nimrida <Keyanomir's Minion>
UPDATE creature SET position_x = 9714.944336, position_y = -7311.331543, position_z = 24.759550, orientation = 4.650019, Spawndist = 0, MovementType = 0 WHERE id = 18232;

-- Harene Plainwalker <Druid Trainer>
UPDATE creature SET position_x = 9703.846, position_y = -7267.49, position_z = 16.11439, orientation = 3.001966, Spawndist = 0, MovementType = 2 WHERE id = 16655;
UPDATE creature_template_addon SET emote = 0 WHERE entry = 16655;
DELETE FROM creature_movement WHERE id = 57648;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16655;
DELETE FROM creature_movement_template WHERE entry = 16655;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16655,1,9703.846,-7267.49,16.11439,60000,0,3.001966,0,0),(16655,2,9703.63,-7263.83,15.9914,0,0,1.04791,0,0),(16655,3,9706.74,-7261.86,16.5287,30000,1665501,0.637149,0,0),
(16655,4,9703.75,-7263.42,16.0209,0,0,2.65955,0,0),(16655,5,9701.5,-7261.56,15.9065,0,0,2.43414,0,0),(16655,6,9698.97,-7258.35,15.599,0,0,1.98254,0,0),
(16655,7,9698.97,-7258.35,15.599,30000,1665502,1.30395,0,0),(16655,8,9700.7,-7261.93,15.7977,0,0,5.24429,0,0),(16655,9,9703.63,-7266.76,16.0817,0,0,4.99375,0,0),
(16655,10,9701.12,-7272.78,15.8364,0,0,4.3033,0,0),(16655,11,9700.66,-7278.72,15.5704,30000,1665502,4.80516,0,0),(16655,12,9701.32,-7272.86,15.8672,0,0,1.0376,0,0),
(16655,13,9703.846,-7267.49,16.11439,0,0,1.17111,0,0),(16655,14,9703.846,-7267.49,16.11439,180000,0,3.001966,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1665501,1665502); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1665501,2,1,133,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1665501,27,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1665502,2,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(1665502,27,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND');-- Silvermoon City
-- Magister Astalor Bloodsworn
UPDATE creature_template SET GossipMenuId = 9142 WHERE Entry = 17718;
DELETE FROM gossip_menu WHERE entry = 9142; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(9142, 12370, 0, 0);

-- Lord Solanar Bloodwrath
UPDATE creature_template SET MinLevel = 70, MaxLevel = 70, FactionAlliance = 1604, FactionHorde = 1604, NpcFlags = 2, UnitFlags = 0, UnitClass = 2, Expansion = 1, MinLevelHealth = 5589, MaxLevelHealth = 5589, MinLevelMana = 3155, MaxLevelMana = 3155,
MinMeleeDmg = 242, MaxMeleeDmg = 362, MinRangedDmg = 194, MaxRangedDmg = 290, Armor = 6673, MeleeAttackPower = 91,  RangedAttackPower = 73, MeleeBaseAttackTime = 2000,  RangedBaseAttackTime = 2000, EquipmentTemplateId = 612 WHERE Entry = 25223;

-- Lord Solanar Bloodwrath (25223)
UPDATE `creature_template` SET `HealthMultiplier` = '1.0', `PowerMultiplier` = '1.0', `DamageMultiplier` = '1.0', `DamageVariance` = '1.0', `ArmorMultiplier` = '1.0', `MinLevelHealth` = '5589', `MaxLevelHealth` = '5589', `MinLevelMana` = '3155', `MaxLevelMana` = '3155', `MinMeleeDmg` = '234', `MaxMeleeDmg` = '331', `MinRangedDmg` = '198', `MaxRangedDmg` = '295', `MeleeAttackPower` = '286.0', `RangedAttackPower` = '33.0', `Armor` = '5474.0' WHERE `entry` = '25223';

UPDATE creature SET curhealth = 5589, curmana = 3155 WHERE guid = 96977;
 -- Pink Elekk -- must be only visible when drunk
DELETE FROM creature_template_addon WHERE entry IN (21250,23507,23527,23528,23529,23530,23531,27958);
INSERT INTO creature_template_addon (entry,auras) VALUES
(21250,36440), 
(23507,36440),
(23527,36440),
(23528,36440),
(23529,36440),
(23530,36440),
(23531,36440);

-- Pink Elekk
UPDATE creature SET position_x = -2973.980469, position_y = 3950.814453, position_z = 2.909095, spawndist = 5, MovementType = 1 WHERE guid = 85568;
UPDATE creature SET position_x = -2939.791260, position_y = 3908.769043, position_z = 2.627984, spawndist = 5, MovementType = 1 WHERE guid = 85567;
UPDATE creature SET position_x = -2961.600098, position_y = 4111.750488, position_z = 6.187728, spawndist = 5, MovementType = 1 WHERE guid = 85569;
UPDATE creature SET position_x = -2666.413574, position_y = 4482.823242, position_z = 36.317860, spawndist = 5, MovementType = 1 WHERE guid = 85571;
UPDATE creature SET position_x = -2726.244873, position_y = 4387.434082, position_z = 21.490282, spawndist = 5, MovementType = 1 WHERE guid = 85570;

-- Shadowmoon Valley
-- Wrathwalker
UPDATE creature SET position_z = 166.286621 WHERE guid = 70639;
-- Disable Love is in the Air Items from Vendors and active only when event starts
DELETE FROM conditions WHERE condition_entry = 15;
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(15,12,8,0);
UPDATE npc_vendor SET condition_id = 15 WHERE item IN (21833,21829,21815);
-- Lakeshire
-- Erin
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 6156;
DELETE FROM creature_movement WHERE id = 6156;
UPDATE creature_template SET MovementType = 2 WHERE entry = 850;
DELETE FROM creature_movement_template WHERE entry = 850;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(850,1,-9174.33,-2109.71,88.95,20000,85001,5.89073,0,0),(850,2,-9192.52,-2098.69,87.7837,0,0,2.69796,0,0),(850,3,-9208.23,-2090.51,85.3921,0,0,2.93672,0,0),
(850,4,-9220.96,-2089.61,81.1544,0,0,2.99563,0,0),(850,5,-9234.93,-2085.46,76.4945,0,0,3.5242,0,0),(850,6,-9242.56,-2096.16,73.6174,0,0,4.4274,0,0),
(850,7,-9249.78,-2122.28,65.0417,0,0,4.23341,0,0),(850,8,-9256.07,-2139.82,64.0223,0,0,4.75962,0,0),(850,9,-9254.31,-2147.89,64.0695,0,0,5.67539,0,0),
(850,10,-9238.9,-2148.92,64.3411,0,0,5.73586,0,0),(850,11,-9237.57,-2152.63,64.3492,0,0,4.67165,0,0),(850,12,-9218.89,-2155.42,64.3544,0,0,0.401173,0,0),
(850,13,-9216.46,-2151.99,64.3544,1000,85002,1.36486,0,0),(850,14,-9216.22,-2147.52,64.3544,0,0,1.57299,0,0),(850,15,-9216.22,-2147.52,64.3544,60000,85001,4.75856,0,0),
(850,16,-9218.43,-2154.78,64.3544,0,0,3.38647,0,0),(850,17,-9231.99,-2155.23,64.3576,0,0,3.21212,0,0),(850,18,-9237.01,-2157.84,64.3576,0,0,2.06465,0,0),
(850,19,-9237.87,-2149.49,64.3426,0,0,2.80273,0,0),(850,20,-9248.67,-2148.45,63.9334,0,0,2.40164,0,0),(850,21,-9256.32,-2138.6,63.8953,0,0,1.32093,0,0),
(850,22,-9251.08,-2121.47,65.2993,0,0,1.57654,0,0),(850,23,-9253.26,-2112.42,66.5815,0,0,2.24648,0,0),(850,24,-9261.04,-2106.96,66.8522,15000,85002,2.66117,0,0),
(850,25,-9251.76,-2113.45,66.6836,0,0,5.22157,0,0),(850,26,-9246.46,-2127.76,64.1511,0,0,4.62939,0,0),(850,27,-9248.61,-2135.95,63.9343,0,0,4.37257,0,0),
(850,28,-9254.32,-2148.24,64.056,0,0,4.10161,0,0),(850,29,-9271.21,-2158.97,61.1872,0,0,3.23767,0,0),(850,30,-9277.96,-2157.76,59.2388,0,0,2.87639,0,0),
(850,31,-9310.03,-2148.39,63.4841,60000,85001,2.82141,0,0),(850,32,-9300.57,-2151.61,63.3088,0,0,5.96445,0,0),(850,33,-9278.2,-2158.05,59.202,0,0,0.11559,0,0),
(850,34,-9261.5,-2157.36,64.0706,0,0,0.584478,0,0),(850,35,-9252.47,-2139.73,64.0216,0,0,1.20494,0,0),(850,36,-9244.6,-2120.1,65.1008,0,0,1.41229,0,0),
(850,37,-9242.08,-2095.47,73.8924,0,0,0.926126,0,0),(850,38,-9233.67,-2085.3,76.8089,0,0,6.22599,0,0),(850,39,-9219.75,-2090.06,81.5803,0,0,6.26762,0,0),
(850,40,-9207.11,-2090.25,85.8603,0,0,6.01079,0,0),(850,41,-9198.75,-2092.32,87.6703,0,0,5.73827,0,0),(850,42,-9174.33,-2109.71,88.95,25000,0,5.89073,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (85001,85002); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(85001,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(85002,1,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'RUN OFF');

-- Madison
UPDATE creature_model_info SET modelid_other_gender = 0 WHERE modelid = 257;  -- should't use male model 
UPDATE creature SET position_x = -9327.604, position_y = -2202.139, position_z = 61.898, orientation = 2.485968, spawndist = 0, MovementType = 2 WHERE guid = 6150;
DELETE FROM creature_movement WHERE id = 6150;
UPDATE creature_template SET MovementType = 2 WHERE entry = 848;
DELETE FROM creature_movement_template WHERE entry = 848;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(848,1,-9327.604,-2202.139,61.898,30000,84801,2.485968,0,0),(848,2,-9315.13,-2208.34,61.8977,0,0,6.15947,0,0),(848,3,-9293.39,-2209.66,61.821,0,0,0.401712,0,0),
(848,4,-9287.74,-2206.22,62.7899,0,0,1.06066,0,0),(848,5,-9281.29,-2171.65,59.6998,0,0,1.24138,0,0),(848,6,-9267.21,-2137.46,62.1799,0,0,1.15106,0,0),
(848,7,-9262.62,-2131.42,65.3403,0,0,0.903661,0,0),(848,8,-9248.75,-2116.83,66.1153,0,0,1.05681,0,0),(848,9,-9245.36,-2104.48,70.2651,0,0,1.35526,0,0),
(848,10,-9243.86,-2085.17,75.3524,0,0,1.35526,0,0),(848,11,-9239.41,-2057.41,76.8398,0,0,1.72205,0,0),(848,12,-9248.06,-2044.15,77.0034,0,0,1.84378,0,0),
(848,13,-9248.36,-2023.24,77.0013,60000,84801,1.58853,0,0),(848,14,-9248.64,-2045.46,77.0022,0,0,4.91676,0,0),(848,15,-9239.96,-2068.09,75.8833,0,0,4.69999,0,0),
(848,16,-9240.93,-2088.38,75.2944,0,0,4.6725,0,0),(848,17,-9245.53,-2099.99,71.8304,0,0,4.55862,0,0),(848,18,-9247.71,-2120.82,65.1585,0,0,4.58611,0,0),
(848,19,-9254.52,-2145.7,64.0393,0,0,4.56255,0,0),(848,20,-9255.4,-2185.46,64.0101,0,0,3.76379,0,0),(848,21,-9270.92,-2193.77,64.0897,0,0,4.53035,0,0),
(848,22,-9276.26,-2211.56,64.0588,0,0,4.10466,0,0),(848,23,-9293.97,-2213.25,61.6685,0,0,3.07815,0,0),(848,24,-9316.85,-2209.62,61.8983,0,0,2.81976,0,0),
(848,25,-9327.604,-2202.139,61.898,120000,84801,2.485968,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 84801; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(84801,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');

-- Rachel & Nathan
UPDATE creature SET position_x = -9262.288086, position_y = -2204.600342, position_z = 63.933990, orientation = 3.567484, spawndist = 0, MovementType = 2 WHERE guid = 6154;
UPDATE creature SET position_x = -9262.288086, position_y = -2204.600342, position_z = 63.933990, orientation = 3.567484, spawndist = 0, MovementType = 0 WHERE guid = 6155;
DELETE FROM creature_movement WHERE id IN (6154,6155);
UPDATE creature_template SET MovementType = 2 WHERE entry = 849;
DELETE FROM creature_movement_template WHERE entry = 849;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(849,1,-9262.288086,-2204.600342,63.933990,2000,84901,3.567484,0,0),(849,2,-9282.55,-2212.77,63.4702,0,0,3.37348,0,0),(849,3,-9316.21,-2213.16,61.8981,0,0,3.07503,0,0),
(849,4,-9342.98,-2208.78,61.8981,0,0,2.00139,0,0),(849,5,-9344.81,-2183.14,61.8981,0,0,0.826432,0,0),(849,6,-9333.46,-2184.53,61.8981,0,0,4.18637,0,0),
(849,7,-9342.04,-2206.52,61.8981,0,0,5.47914,0,0),(849,8,-9326.1,-2210.98,61.8981,0,0,6.27006,0,0),(849,9,-9293.37,-2209.15,61.8213,0,0,0.311687,0,0),
(849,10,-9286.83,-2203.5,62.899,0,0,1.07195,0,0),(849,11,-9280.69,-2175.14,60.2934,0,0,1.17013,0,0),(849,12,-9270.13,-2152.55,61.1369,0,0,1.28794,0,0),
(849,13,-9264.35,-2133.3,64.3245,0,0,0.769574,0,0),(849,14,-9249.2,-2126.65,64.3418,0,0,0.193481,0,0),(849,15,-9209.35,-2136.65,63.9347,0,0,6.19989,0,0),
(849,16,-9190.63,-2136.43,63.942,0,0,5.98547,0,0),(849,17,-9184.8,-2144.66,63.9756,0,0,5.00216,0,0),(849,18,-9178.52,-2182.85,64.0438,0,0,4.63302,0,0),
(849,19,-9192.09,-2199.42,63.9338,0,0,1.98231,0,0),(849,20,-9198.02,-2179.83,63.9338,0,0,2.40328,0,0),(849,21,-9207.62,-2174.96,63.9338,0,0,3.09365,0,0),
(849,22,-9239.17,-2175.39,63.9338,0,0,3.65965,0,0),(849,23,-9247.98,-2186.89,64.0099,0,0,3.71473,0,0),(849,24,-9262.78,-2190.39,64.0897,0,0,4.22838,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 84901; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(84901,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');
-- link
DELETE FROM creature_linking WHERE guid = 6155;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(6155, 6154, 512);
-- Cabal Ritualist (groups should be linked)
DELETE FROM creature_linking WHERE guid IN (67068,67069,67070,67072,67074,67076,67079,67080,67081,67082,67083,67084);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
-- 1st
(67079, 67078, 1+2+128),
(67080, 67078, 1+2+128),
-- 2nd
(67074, 67075, 1+2+128),
(67076, 67075, 1+2+128),
-- 3rd
(67070, 67071, 1+2+128),
(67072, 67071, 1+2+128),
-- 4th
(67068, 67067, 1+2+128),
(67069, 67067, 1+2+128),
-- 5th
(67081, 67073, 1+2+128),
(67082, 67073, 1+2+128),
-- 6th
(67083, 67077, 1+2+128),
(67084, 67077, 1+2+128);
-- creature update for quest 12852
UPDATE creature SET MovementType=0, spawnDist=0 WHERE id=29621;
-- ToC25
DELETE FROM spell_script_target WHERE entry IN (66133,66132,65875,65876,66140,66141);
INSERT INTO spell_script_target (entry,type,targetEntry,inverseEffectMask) VALUES
(66133,1,34497,0),
(66132,1,34496,0),
(65875,1,34497,0),
(65876,1,34496,0),
(66140,1,34720,0),
(66141,1,34704,0);
-- script to summon Nightbane
DELETE FROM dbscripts_on_go_template_use WHERE id = 194092;
INSERT INTO dbscripts_on_go_template_use (id,delay,command,datalong,data_flags,comments) VALUES
(194092,0,15,31116,4,'cast Summon Nightbane');
-- missing temp spellfocus
DELETE FROM gameobject WHERE guid = 66164;
INSERT INTO gameobject VALUES
(66164, 300073, 532, 1, 1, -11126.9, -1874.45, 91.4726, 0, 0, 0, 0, 1, 180, 0, 1);
-- PoS and HoR - DB updates
UPDATE creature_template SET MinLevel=80, MaxLevel=80, FactionAlliance=974, FactionHorde=974, MinLevelHealth=5342, MaxLevelHealth=5342 WHERE entry=20061;
UPDATE creature SET curhealth=5342 WHERE id=20061;
-- Jaina
UPDATE creature_template SET MinLevel=80, MaxLevel=80, UnitFlags=33600, MinLevelHealth=5040000, MaxLevelHealth=5040000, MinLevelMana=881400, MaxLevelMana=881400 WHERE entry=37221;
-- LK for encounter
UPDATE creature_template SET MinLevel=83, MaxLevel=83, MinLevelHealth=20917500, MaxLevelHealth=20917500 WHERE entry=36954;
-- LK for intro
UPDATE creature_template SET FactionAlliance=2102, FactionHorde=2102, UnitFlags=768 WHERE entry=37226;
-- Falric & Marwyn
UPDATE creature_template SET UnitFlags=832 WHERE entry IN (38113,38112);
-- Soldiers
UPDATE creature_template SET MinLevel=80, MaxLevel=80, UnitFlags=33555264 WHERE entry=38173;
UPDATE creature_template SET UnitFlags=33555264 WHERE entry IN (38172,38177,38175,38176);
-- Wall
UPDATE creature_template SET MinLevel=60, MaxLevel=60, UnitFlags=33555200, MinLevelHealth=4120, MaxLevelHealth=4120 WHERE entry=37014;
-- Triggers
UPDATE creature_template SET MinLevel=80, MaxLevel=80, UnitFlags=33555200, MinLevelHealth=12600, MaxLevelHealth=12600 WHERE entry=37704;
UPDATE creature SET curhealth=12600 WHERE id=37704;
UPDATE creature SET curhealth=4120 WHERE id=37014;
-- The Barrier Hills
-- Gordunni Head-Splitter
-- #1
UPDATE creature SET position_x = -1359.504639, position_y = 5639.003906, position_z = 181.393311, orientation = 1.209364, spawndist = 0, MovementType = 2 WHERE guid = 91739;
DELETE FROM creature_movement WHERE id = 91739;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(91739,1,-1354.87,5651.11,181.969,0,0,1.19992,0,0),(91739,2,-1343.61,5658.92,185.445,0,0,0.3352,0,0),(91739,3,-1328.94,5658.8,191.292,0,0,0.411385,0,0),
(91739,4,-1322.06,5663.88,192.348,0,0,0.274743,0,0),(91739,5,-1312.35,5664.69,193.89,0,0,0.439831,0,0),(91739,6,-1303.89,5670.08,193.189,0,0,0.954267,0,0),
(91739,7,-1292.06,5687.82,190.006,0,0,0.856093,0,0),(91739,8,-1279.21,5699.54,192.317,0,0,0.0306391,0,0),(91739,9,-1268.02,5689.71,205.593,0,0,5.41141,0,0),
(91739,10,-1261.08,5682.03,208.766,0,0,5.48209,0,0),(91739,11,-1254.01,5673.35,213.628,0,0,0.131173,0,0),(91739,12,-1242.06,5678.88,219.256,10000,0,0.204997,0,0),
(91739,13,-1252.32,5675.64,214.624,0,0,3.19658,0,0),(91739,14,-1260.94,5682.09,208.806,0,0,2.3994,0,0),(91739,15,-1267.29,5688.28,206.674,0,0,2.21326,0,0),
(91739,16,-1276.43,5698.97,194.941,0,0,2.9374,0,0),(91739,17,-1282.77,5699.04,191.403,0,0,3.55158,0,0),(91739,18,-1291.96,5687.64,190.034,0,0,4.05109,0,0),
(91739,19,-1299.03,5677.06,192.878,0,0,4.12178,0,0),(91739,20,-1305.87,5667.05,193.435,0,0,3.67881,0,0),(91739,21,-1319.81,5661.57,192.259,0,0,3.49346,0,0),
(91739,22,-1331.31,5659.29,190.595,0,0,3.09133,0,0),(91739,23,-1344.88,5658.89,185.011,0,0,3.70002,0,0),(91739,24,-1354.81,5650.98,181.997,0,0,4.21681,0,0),
(91739,25,-1354.93,5634.64,182.154,0,0,4.98414,0,0),(91739,26,-1354.17,5620.48,181.845,0,0,4.43122,0,0),(91739,27,-1373.38,5598.87,195.183,0,0,3.91993,0,0),
(91739,28,-1353.86,5620.57,181.861,0,0,1.28178,0,0),(91739,29,-1355.3,5638.02,182.237,0,0,1.56374,0,0);
-- #2
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 91732;
DELETE FROM creature_movement WHERE id = 91732;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(91732,1,-1279.51,5882.71,187.378,0,0,2.60301,0,0),(91732,2,-1310.55,5896.12,190.15,0,0,2.76244,0,0),(91732,3,-1341.92,5905.7,190.723,0,0,2.95486,0,0),
(91732,4,-1364.53,5907.49,191.539,0,0,3.28473,0,0),(91732,5,-1376.18,5903.3,191.004,0,0,3.77404,0,0),(91732,6,-1395.03,5887.96,187.162,0,0,4.02144,0,0),
(91732,7,-1399.69,5866.81,183.818,0,0,4.72515,0,0),(91732,8,-1392.64,5850.37,184.667,0,0,5.40844,0,0),(91732,9,-1378.41,5840.53,185.955,0,0,5.76972,0,0),
(91732,10,-1350.94,5830.78,186.287,0,0,5.80584,0,0),(91732,11,-1335.77,5818.54,184.853,0,0,5.65663,0,0),(91732,12,-1321.25,5813.11,185.734,0,0,0.22653,0,0),
(91732,13,-1298.8,5823.94,185.414,0,0,0.667924,0,0),(91732,14,-1274.05,5847.85,185.968,0,0,0.821077,0,0),(91732,15,-1256.68,5867.76,183.556,0,0,1.67481,0,0),
(91732,16,-1262.47,5878.12,184.899,0,0,2.75002,0,0);
-- #3
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 91723;
DELETE FROM creature_movement WHERE id = 91723;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(91723,1,-1516.81,5917.45,195.449,0,0,2.54687,0,0),(91723,2,-1525.88,5933.57,195.338,0,0,1.74969,0,0),(91723,3,-1526.19,5955.61,193.51,0,0,1.80702,0,0),
(91723,4,-1532.71,5973.49,192.256,0,0,2.00023,0,0),(91723,5,-1539.29,5982.87,193.319,0,0,2.77385,0,0),(91723,6,-1553.98,5985.15,194.251,5000,0,3.16246,0,0),
(91723,7,-1540.94,5984.6,193.291,0,0,6.05429,0,0),(91723,8,-1532.33,5973.62,192.258,0,0,5.27126,0,0),(91723,9,-1525.75,5955.2,193.569,0,0,4.833,0,0),
(91723,10,-1524.27,5935.62,195.015,0,0,4.94061,0,0),(91723,11,-1520.3,5922.19,195.538,0,0,5.19114,0,0),(91723,12,-1513.03,5913.5,194.928,0,0,5.64903,0,0),
(91723,13,-1502.11,5909.78,194.504,0,0,0.214939,0,0),(91723,14,-1492.31,5913.65,194.478,0,0,1.10165,0,0),(91723,15,-1489.66,5924.48,194.477,0,0,1.81049,0,0),
(91723,16,-1491.87,5941.16,194.984,0,0,0.365361,0,0),(91723,17,-1461.09,5937.19,208.795,0,0,1.73431,0,0),(91723,18,-1460.87,5950.35,215.162,0,0,1.80776,0,0),
(91723,19,-1463.92,5963.32,221.615,0,0,1.84938,0,0),(91723,20,-1461.15,5950.46,215.23,0,0,4.85353,0,0),(91723,21,-1461.57,5937.18,208.582,0,0,3.4516,0,0),
(91723,22,-1471.27,5937.14,204.23,0,0,2.83584,0,0),(91723,23,-1491.39,5941.14,195.014,0,0,3.90085,0,0),(91723,24,-1490.3,5924.05,194.477,0,0,4.52662,0,0),
(91723,25,-1492.73,5913.35,194.477,0,0,4.02161,0,0),(91723,26,-1502.59,5911.17,194.487,0,0,2.96761,0,0);
-- #4
-- missing added
DELETE FROM creature WHERE guid = 54870; -- UDB empty guid reused
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(54870,22148,530,1,1,0,580,-1330.64,5792.9,183.28,1.74635,300,0,0,7181,0,0,2);
DELETE FROM creature_movement WHERE id = 54870;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54870,1,-1338.4,5817.68,184.866,0,0,1.83745,0,0),(54870,2,-1336.71,5831.79,185.845,0,0,0.820356,0,0),(54870,3,-1313.84,5849.55,199.389,0,0,2.22916,0,0),
(54870,4,-1316.62,5853.86,201.805,0,0,2.48376,0,0),(54870,5,-1334.76,5866.23,212.388,0,0,2.61713,0,0),(54870,6,-1313.79,5851.52,199.923,0,0,4.74635,0,0),
(54870,7,-1315.65,5846.51,197.901,0,0,3.8345,0,0),(54870,8,-1336.87,5831.49,185.797,0,0,4.31595,0,0),(54870,9,-1337.9,5816.23,184.889,0,0,4.98118,0,0),
(54870,10,-1329.2,5786.87,182.854,0,0,4.74085,0,0),(54870,11,-1328.9,5767.59,182.657,0,0,4.71808,0,0),(54870,12,-1328.76,5747.74,182.025,0,0,4.57278,0,0),
(54870,13,-1334.7,5735.71,180.898,0,0,4.8461,0,0),(54870,14,-1332.69,5723.99,180.092,0,0,4.47853,0,0),(54870,15,-1334.7,5735.71,180.898,0,0,1.58513,0,0),
(54870,16,-1328.95,5748.09,181.99,0,0,1.58513,0,0),(54870,17,-1328.93,5768.83,182.739,0,0,1.59691,0,0),(54870,18,-1330.62,5792.06,183.215,0,0,1.69508,0,0);

-- Gordunni Soulreaper
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 91738;
DELETE FROM creature_movement WHERE id = 91738;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(91738,1,-1330,5772.58,182.907,0,0,4.59756,0,0),
(91738,2,-1330.99,5742.57,181.18,0,0,4.63291,0,0),
(91738,3,-1334.7,5735.71,180.898,0,0,4.8461,0,0),
(91738,4,-1332.69,5723.99,180.092,0,0,4.47853,0,0),
(91738,5,-1334.92,5714.3,180.339,5000,0,4.55044,0,0),
(91738,6,-1332.69,5723.99,180.092,0,0,1.53059,0,0),
(91738,7,-1334.7,5735.71,180.898,0,0,1.53059,0,0),
(91738,8,-1332.17,5745.07,181.152,0,0,1.53059,0,0),
(91738,9,-1329.98,5772.85,182.91,0,0,1.29261,0,0),
(91738,10,-1322.73,5792.35,183.804,0,0,1.20229,0,0),
(91738,11,-1319.87,5808.9,185.731,0,0,1.91465,0,0),
(91738,12,-1337.74,5821.18,184.754,0,0,2.63329,0,0),
(91738,13,-1379.33,5839.73,186.025,5000,0,2.60972,0,0),
(91738,14,-1336.58,5820.7,184.813,0,0,5.61623,0,0),
(91738,15,-1319.5,5808.55,185.771,0,0,4.98085,0,0);
-- missing added
DELETE FROM creature WHERE guid = 54645; -- UDB empty guid reused
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(54645,23022,530,1,1,0,0,-1531.62,5978.53,192.407,2.05811,300,0,0,28720,6462,0,2);
DELETE FROM creature_movement WHERE id = 54645;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54645,1,-1520.91,5954.39,193.9,0,0,5.31595,0,0),(54645,2,-1506.94,5933.15,194.487,0,0,5.63639,0,0),(54645,3,-1490.97,5921.78,194.475,0,0,5.97489,0,0),
(54645,4,-1461.24,5918.18,195.003,0,0,5.95918,0,0),(54645,5,-1433.64,5906.33,192.478,5000,0,5.73535,0,0),(54645,6,-1460.69,5917.39,194.915,0,0,2.99117,0,0),
(54645,7,-1490.75,5924.11,194.476,0,0,2.53721,0,0),(54645,8,-1509.72,5936.4,194.489,0,0,2.17357,0,0),(54645,9,-1521.49,5954.73,193.833,0,0,1.9458,0,0),
(54645,10,-1531.47,5978.25,192.398,5000,0,2.15943,0,0);

-- Gordunni Elementalist
UPDATE creature SET position_x = -1390.232910, position_y = 5880.165527, position_z = 186.635437, orientation = 3.005538, spawndist = 5, MovementType = 1 WHERE guid = 91728;
UPDATE creature SET position_x = -1358.870728, position_y = 5848.315430, position_z = 187.222092, orientation = 4.148302, spawndist = 5, MovementType = 1 WHERE guid = 91729;

-- Gordunni Back-Breaker
UPDATE creature SET position_x = -1471.765503, position_y = 5928.120117, position_z = 195.734787, orientation = 4.601814, spawndist = 5, MovementType = 1 WHERE guid = 91721;

-- Shattrath
-- Captain Dranarus
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 96619;
DELETE FROM creature_movement WHERE id = 96619;
UPDATE creature_template SET MovementType = 2 WHERE entry = 25138;
DELETE FROM creature_movement_template WHERE entry = 25138;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(25138,1,-1835.49,5313.03,-12.4282,0,0,4.08568,0,0),(25138,2,-1841.81,5311.87,-12.4282,0,0,2.81568,0,0),(25138,3,-1842.622,5313.065,-12.42815,0,0,1.99573,0,0),
(25138,4,-1842.622,5313.065,-12.42815,30000,2513801,2.478368,0,0),(25138,5,-1845.9,5310.6,-12.4282,0,0,3.60122,0,0),(25138,6,-1850.46,5310.65,-12.4282,0,0,2.63361,0,0),
(25138,7,-1852.19,5314.11,-12.4282,0,0,1.89612,0,0),(25138,8,-1852.19,5314.11,-12.4282,30000,2513802,0.199661,0,0),(25138,9,-1850.97,5318.61,-12.4282,0,0,0.405435,0,0),
(25138,10,-1843,5320.51,-12.4282,0,0,6.21738,0,0),(25138,11,-1840.255,5319.294,-12.42815,0,0,5.5121,0,0),(25138,12,-1840.255,5319.294,-12.42815,30000,2513801,4.502949,0,0),
(25138,13,-1835.4,5320.18,-12.4282,0,0,5.51838,0,0),(25138,14,-1835.03,5317.27,-12.4282,0,0,4.82174,0,0),(25138,15,-1835.03,5317.27,-12.4282,30000,2513802,3.1567,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2513801,2513802); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2513801,1,1,6,0,0,0,0,25,6,22,21,0,0,0,0,''),
(2513801,10,1,5,0,0,0,0,25,6,18,21,0,0,0,0,''),
(2513801,17,1,6,0,0,0,0,25,6,22,21,0,0,0,0,''),
(2513801,22,1,6,0,0,0,0,25,6,22,21,0,0,0,0,''),
(2513801,28,1,6,0,0,0,0,25,6,22,21,0,0,0,0,''),
(2513802,27,1,18,0,0,0,0,5,6,22,21,0,0,0,0,'');
-- Shattered Sun Trainee 25134/25135/25136/25137
-- Can't use EventAI - script not for all
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid IN (96604,96603,96612,96611,96596,96595,96610,96600);
DELETE FROM creature_movement WHERE id IN (96604,96603,96612,96611,96596,96595,96610,96600);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(96604,1,-1837.87,5315.29,-12.3448,6000,2513601,1.48353,0,0),
(96603,1,-1841.16,5314.73,-12.3448,6000,2513601,1.5708,0,0),
(96612,1,-1844.47,5314.21,-12.3448,6000,2513701,1.67552,0,0),
(96611,1,-1847.71,5313.56,-12.3448,6000,2513701,1.71042,0,0),
(96596,1,-1838.47,5318.06,-12.3448,6000,2513401,4.69494,0,0),
(96595,1,-1841.71,5317.6,-12.3448,6000,2513401,4.76475,0,0),
(96610,1,-1845.03,5317.04,-12.3448,6000,2513701,4.83456,0,0),
(96600,1,-1847.88,5316.36,-12.3448,6000,2513501,4.86947,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2513401,2513501,2513601,2513701); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2513401,1,1,36,0,0,0,0,43,54,60,36,0,0,0,0,''),
(2513401,4,1,43,0,0,0,0,36,54,43,60,0,0,0,0,''),
(2513501,1,1,36,0,0,0,0,43,54,60,36,0,0,0,0,''),
(2513501,4,1,43,0,0,0,0,36,54,43,60,0,0,0,0,''),
(2513601,1,1,36,0,0,0,0,43,54,60,36,0,0,0,0,''),
(2513601,4,1,43,0,0,0,0,36,54,43,60,0,0,0,0,''),
(2513701,1,1,36,0,0,0,0,43,54,60,36,0,0,0,0,''),
(2513701,4,1,43,0,0,0,0,36,54,43,60,0,0,0,0,'');

-- Terokkar Forest
-- Deathskitter
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 66907;
DELETE FROM creature_movement WHERE id = 66907;
UPDATE creature_template SET MovementType = 2, SpeedWalk =  1, SpeedRun = 1.285714 WHERE entry = 18647;
DELETE FROM creature_movement_template WHERE entry = 18647;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18647,1,-3327.78,4217.31,-12.9577,2000,0,1.73323,0,0),(18647,2,-3326.23,4201.74,-9.91916,0,0,5.16149,0,0),(18647,3,-3317.02,4185.02,-7.49581,0,0,5.63115,0,0),
(18647,4,-3305.05,4178.67,-7.55846,0,0,6.10396,0,0),(18647,5,-3287,4177.99,-8.39443,0,0,0.257447,0,0),(18647,6,-3270.33,4184.74,-9.3174,0,0,0.360334,0,0),
(18647,7,-3244.46,4194.5,-9.6127,0,0,0.531551,0,0),(18647,8,-3225,4208.24,-11.6414,0,0,0.755389,0,0),(18647,9,-3212.57,4220.03,-10.4427,0,0,0.566894,0,0),
(18647,10,-3203.5,4225.33,-16.0323,0,0,0.594382,0,0),(18647,11,-3198.25,4228.88,-15.9147,0,0,0.229957,0,0),(18647,12,-3188.78,4228.9,-10.1867,0,0,6.19349,0,0),
(18647,13,-3174.5,4225.05,-10.3182,0,0,5.99478,0,0),(18647,14,-3157.01,4221.4,-9.12844,0,0,6.16599,0,0),(18647,15,-3136.5,4219.6,-8.63327,0,0,5.85734,0,0),
(18647,16,-3123.31,4206.28,-7.73802,0,0,5.77094,0,0),(18647,17,-3107.38,4201.32,-6.7678,0,0,6.21547,0,0),(18647,18,-3091.73,4203.14,-5.42721,2000,0,0.238592,0,0),
(18647,19,-3107.07,4201.19,-6.74563,0,0,3.17205,0,0),(18647,20,-3122.93,4205.97,-7.70735,0,0,2.5508,0,0),(18647,21,-3137.18,4219.95,-8.64952,0,0,2.84219,0,0),
(18647,22,-3160.71,4221.39,-9.38807,0,0,2.92544,0,0),(18647,23,-3175.26,4225.25,-10.2814,0,0,2.8579,0,0),(18647,24,-3188.33,4228.68,-10.0172,0,0,3.16813,0,0),
(18647,25,-3197.78,4229.09,-15.6928,0,0,3.30319,0,0),(18647,26,-3203.9,4224.92,-15.925,0,0,3.88517,0,0),(18647,27,-3212.64,4219.94,-10.45,0,0,3.77914,0,0),
(18647,28,-3224.85,4208.35,-11.6416,0,0,3.88517,0,0),(18647,29,-3244.95,4194.08,-9.55214,0,0,3.59457,0,0),(18647,30,-3270.84,4184.57,-9.31029,0,0,3.48855,0,0),
(18647,31,-3287.67,4177.81,-8.35741,0,0,3.3878,0,0),(18647,32,-3305.46,4178.7,-7.5413,0,0,2.82232,0,0),(18647,33,-3317.9,4185.58,-7.51244,0,0,2.33537,0,0),
(18647,34,-3326.53,4202.08,-9.97886,0,0,1.97016,0,0);

-- Rotting Forest-Rager
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid IN (78439,78435,78436,78438);
DELETE FROM creature_movement WHERE id IN (78439,78435,78436,78438);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(78439,1,-3082.88,4264,-8.33045,0,0,0.641001,0,0),(78439,2,-3041.47,4307.55,-11.0783,4000,0,0.823214,0,0),(78439,3,-3063.64,4284.76,-9.75672,0,0,3.96873,0,0),
(78439,4,-3083.91,4262.66,-8.21446,0,0,3.54776,0,0),(78439,5,-3096.39,4258.22,-8.41367,0,0,3.3412,0,0),(78439,6,-3119.69,4258.84,-10.3825,0,0,3.56158,0,0),
(78439,7,-3136.22,4243.77,-9.69491,4000,0,3.64012,0,0),(78439,8,-3120.7,4259.65,-10.5223,0,0,0.321808,0,0),
-- #2
(78435,1,-2831,4488.55,-5.40144,0,0,1.55841,0,0),(78435,2,-2833.69,4511.24,-6.97536,0,0,1.90398,0,0),(78435,3,-2842.93,4539.57,-8.92945,0,0,1.60867,0,0),
(78435,4,-2832.84,4562.57,-10.6274,0,0,0.939509,0,0),(78435,5,-2812.07,4585.45,-8.46509,0,0,0.914376,0,0),(78435,6,-2787.71,4619.89,-9.44887,4000,0,0.898668,0,0),
(78435,7,-2803.7,4593.78,-8.32121,0,0,3.98214,0,0),(78435,8,-2832.8,4562.59,-10.6239,0,0,4.29237,0,0),(78435,9,-2841.43,4548.17,-9.81332,0,0,4.45966,0,0),
(78435,10,-2842.89,4536.18,-8.57972,0,0,5.06362,0,0),(78435,11,-2832.78,4509.27,-6.88285,0,0,4.89294,0,0),(78435,12,-2831.88,4486.51,-5.39805,0,0,4.38459,0,0),
(78435,13,-2845.88,4456.93,-7.39068,0,0,4.14505,0,0),(78435,14,-2859.88,4439.34,-7.46962,0,0,3.66517,0,0),(78435,15,-2890.42,4435.54,-9.61593,0,0,3.58752,0,0),
(78435,16,-2914.65,4419.62,-10.2268,4000,0,3.67392,0,0),(78435,17,-2888.55,4435.11,-9.39205,0,0,0.183606,0,0),(78435,18,-2859.97,4439.61,-7.46688,0,0,0.72396,0,0),
(78435,19,-2848.79,4453.25,-7.47306,0,0,0.902245,0,0),
-- #3
(78436,1,-2751.24,4888.25,-9.28854,4000,0,3.74443,0,0),(78436,2,-2731.95,4896.86,-6.58817,0,0,0.194423,0,0),(78436,3,-2718.83,4895.61,-4.4686,0,0,5.9192,0,0),
(78436,4,-2709.21,4893.35,-2.85624,0,0,0.441039,0,0),(78436,5,-2703.63,4899.27,-2.11423,4000,0,1.10156,0,0),(78436,6,-2708.72,4891.87,-2.74489,0,0,3.75149,0,0),
(78436,7,-2715.36,4890.9,-3.81047,0,0,2.96452,0,0),(78436,8,-2733.71,4896.45,-6.85721,0,0,3.13062,0,0),
-- #4
(78438,1,-3526.37,4199.18,-4.18007,0,0,6.07106,0,0),(78438,2,-3502.95,4204.91,-3.86274,0,0,0.447608,0,0),(78438,3,-3485.76,4213.2,-5.05477,0,0,6.19044,0,0),
(78438,4,-3478.05,4210.96,-4.81493,0,0,5.74355,0,0),(78438,5,-3466.32,4196,-3.19562,0,0,5.4042,0,0),(78438,6,-3458.17,4190.77,-2.7045,0,0,0.0140024,0,0),
(78438,7,-3442.91,4194.63,-4.69759,0,0,0.544477,0,0),(78438,8,-3419.98,4207.14,-7.63673,0,0,0.198902,0,0),(78438,9,-3392.66,4211.94,-9.26122,0,0,6.2127,0,0),
(78438,10,-3371.72,4209.28,-9.76929,0,0,5.8954,0,0),(78438,11,-3345.31,4200.04,-8.81895,0,0,5.90718,0,0),(78438,12,-3318.96,4181.89,-7.0849,0,0,5.809,0,0),
(78438,13,-3302.02,4175.35,-7.40304,0,0,0.0622353,0,0),(78438,14,-3292.47,4177.36,-8.09926,0,0,1.15787,0,0),(78438,15,-3291.31,4189.23,-9.51124,4000,0,1.70764,0,0),
(78438,16,-3293.06,4177.42,-8.07473,0,0,4.24055,0,0),(78438,17,-3300.57,4172.31,-7.15121,0,0,3.42374,0,0),(78438,18,-3310.15,4173.36,-6.84514,0,0,2.75065,0,0),
(78438,19,-3334.44,4193.86,-7.95459,0,0,2.61469,0,0),(78438,20,-3355.39,4203.79,-9.36296,0,0,2.87388,0,0),(78438,21,-3380.73,4211.96,-9.7678,0,0,3.13934,0,0),
(78438,22,-3393.45,4211.85,-9.21899,0,0,3.3429,0,0),(78438,23,-3421.38,4206.5,-7.50797,0,0,3.6335,0,0),(78438,24,-3444.25,4194.58,-4.59379,0,0,3.50391,0,0),
(78438,25,-3458.62,4190.86,-2.68858,0,0,2.98005,0,0),(78438,26,-3469.01,4198.23,-3.41623,0,0,2.35565,0,0),(78438,27,-3479,4211.13,-4.81482,0,0,2.64232,0,0),
(78438,28,-3488.95,4213.56,-5.12335,0,0,3.46165,0,0),(78438,29,-3504.71,4205.71,-4.04269,0,0,3.55121,0,0),(78438,30,-3522.31,4198.98,-3.97894,0,0,3.0729,0,0),
(78438,31,-3532.67,4201.09,-4.47656,0,0,2.72811,0,0),(78438,32,-3553.74,4222.86,-4.66667,4000,0,2.27873,0,0);
-- Terokkar Forest
-- Levixus <The Soul Caller>
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 70974;
DELETE FROM creature_movement WHERE id = 70974;
UPDATE creature_template SET MovementType = 2 WHERE entry = 19847;
DELETE FROM creature_movement_template WHERE entry = 19847;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(19847,1,-3565.73,4943.27,-8.91791,20000,1984701,6.26573,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1984701; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1984701,1,0,0,0,0,0,0,2000000488,0,0,0,0,0,0,0,''),
(1984701,2,0,0,0,0,0,0,2000000489,2000000490,2000000491,2000000492,0,0,0,0,''),
(1984701,10,0,0,0,0,0,0,2000000488,0,0,0,0,0,0,0,''),
(1984701,11,0,0,0,0,0,0,2000000491,2000000492,2000000489,2000000490,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000488 AND 2000000492;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000488,'%s reads from the book of the dead.',0,2,0,0,NULL),
(2000000489,'Shane Dabiri, Lee, Alex T., Rob F., J. A. B.,  A. Mayberry!',0,0,8,15,NULL),
(2000000490,'Jeffrey Kaplan! Tom Chilton! Rob Pardo!',0,0,8,15,NULL),
(2000000491,'Justin Thavirat! Roman Kenney! Our entire awesome art and animation team!',0,0,8,15,NULL),
(2000000492,'Kevin Jordan and Jonathan LeCraft!',0,0,8,15,NULL);
-- Updated NPC 5709 (Shade of Eranikus) in Sunken Temple: it is now unattackable
-- until Jammal'An is defeated
UPDATE creature_template SET UnitFlags=UnitFlags|256 WHERE Entry=5709;
-- ---------------------------
-- DK Starting Zone - phase 64 part 1
-- ---------------------------

-- Duplicates removed
DELETE FROM creature WHERE guid IN (130721,130793,130733,130722,130658,130815,130602,130574,130828,130795,130695,130689,130797,130683,130826,130690,130660);
DELETE FROM creature_addon WHERE guid IN (130721,130793,130733,130722,130658,130815,130602,130574,130828,130795,130695,130689,130797,130683,130826,130690,130660);
DELETE FROM creature_movement WHERE id IN (130721,130793,130733,130722,130658,130815,130602,130574,130828,130795,130695,130689,130797,130683,130826,130690,130660);
DELETE FROM game_event_creature WHERE guid IN (130721,130793,130733,130722,130658,130815,130602,130574,130828,130795,130695,130689,130797,130683,130826,130690,130660);
DELETE FROM game_event_creature_data WHERE guid IN (130721,130793,130733,130722,130658,130815,130602,130574,130828,130795,130695,130689,130797,130683,130826,130690,130660);
DELETE FROM creature_battleground WHERE guid IN (130721,130793,130733,130722,130658,130815,130602,130574,130828,130795,130695,130689,130797,130683,130826,130690,130660);
DELETE FROM creature_linking WHERE guid IN (130721,130793,130733,130722,130658,130815,130602,130574,130828,130795,130695,130689,130797,130683,130826,130690,130660) 
OR master_guid IN (130721,130793,130733,130722,130658,130815,130602,130574,130828,130795,130695,130689,130797,130683,130826,130690,130660);

-- Frostbrood Vanquisher
UPDATE creature_template SET MinLevel = 62, MaxLevel = 62, FactionAlliance = 2082, FactionHorde = 2082, UnitClass = 2, Expansion = 1, MinLevelHealth = 106850, MaxLevelHealth = 106850, MinLevelMana = 51360, MaxLevelMana = 51360, MechanicImmuneMask = 8388624 WHERE entry = 28670;

-- Baron Rivendare 
UPDATE creature SET position_x = 2277.7, position_y = -5636.66, position_z = 144.788, orientation = 4.56454, Spawndist = 0, MovementType = 2 WHERE guid = 130895;
DELETE FROM creature_movement WHERE id = 130895;
UPDATE creature_template SET MovementType = 2 WHERE entry = 29109;
DELETE FROM creature_movement_template WHERE entry = 29109;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(29109,1,2277.7,-5636.66,144.788,1000,2910901,4.56454,0,0),(29109,2,2276.12,-5647.62,142.619,0,0,4.56454,0,0),(29109,3,2273.55,-5664.07,143.92,0,0,1.52897,0,0),
(29109,4,2276.12,-5647.62,142.619,0,0,1.47793,0,0),(29109,5,2277.7,-5636.66,144.788,0,0,4.56454,0,0),(29109,6,2276.12,-5647.62,142.619,0,0,4.56454,0,0),
(29109,7,2273.55,-5664.07,143.92,0,0,1.52897,0,0),(29109,8,2276.12,-5647.62,142.619,0,0,1.47793,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2910901; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2910901,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');
-- Death Knight Champion
UPDATE creature SET position_x = 2419.523193, position_y = -5774.515137, position_z = 148.158127, orientation = 5.291478, Spawndist = 0, MovementType = 0 WHERE guid = 130891;
UPDATE creature SET position_x = 2413.764893, position_y = -5777.067383, position_z = 149.278229, orientation = 5.578143, Spawndist = 0, MovementType = 0 WHERE guid = 130889;
UPDATE creature SET position_x = 2425.206787, position_y = -5770.046875, position_z = 148.509720, orientation = 4.989102, Spawndist = 0, MovementType = 0 WHERE guid = 130888;
UPDATE creature SET position_x = 2267.978, position_y = -5652.68, position_z = 140.1605, orientation = 2.879793, Spawndist = 0, MovementType = 0 WHERE guid = 130879;
UPDATE creature SET position_x = 2268.687, position_y = -5645.526, position_z = 140.816, orientation = 3.211406, Spawndist = 0, MovementType = 0 WHERE guid = 130880;
UPDATE creature SET position_x = 2268.732, position_y = -5666.745, position_z = 142.9238, orientation = 2.72271, Spawndist = 0, MovementType = 0 WHERE guid = 130881;
UPDATE creature SET position_x = 2273.045, position_y = -5634.715, position_z = 144.3555, orientation = 3.47320, Spawndist = 0, MovementType = 0 WHERE guid = 130882;
UPDATE creature SET position_x = 2270.195, position_y = -5639.455, position_z = 142.3601, orientation = 3.29867, Spawndist = 0, MovementType = 0 WHERE guid = 130883;
UPDATE creature SET position_x = 2268.486, position_y = -5659.049, position_z = 140.9015, orientation = 2.80998, Spawndist = 0, MovementType = 0 WHERE guid = 130884;
UPDATE creature SET position_x = 2429.15, position_y = -5774.347, position_z = 146.8119, orientation = 4.764749, Spawndist = 0, MovementType = 0 WHERE guid = 130885;
UPDATE creature SET position_x = 2415.666, position_y = -5782.209, position_z = 147.3330, orientation = 5.268789, Spawndist = 0, MovementType = 0 WHERE guid = 130886;
UPDATE creature SET position_x = 2419.108, position_y = -5778.839, position_z = 146.9846, orientation = 5.302624, Spawndist = 0, MovementType = 0 WHERE guid = 130890;
UPDATE creature SET position_x = 2423.652, position_y = -5776.316, position_z = 146.6569, orientation = 5.279853, Spawndist = 0, MovementType = 0 WHERE guid = 130887;
UPDATE creature_addon SET emote = 375 WHERE guid IN (130879,130880,130881,130882,130883,130884,130885,130886,130887,130888,130889,130890,130891);
UPDATE creature SET spawntimesecs = 30 WHERE id = 29106;
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 130892;
DELETE FROM creature_movement WHERE id = 130892;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(130892,1,2323.63,-5664.38,153.844,0,0,5.64936,0,0),(130892,2,2349.46,-5696.57,153.922,0,0,5.3619,0,0),(130892,3,2367.64,-5712.81,153.922,0,0,5.60225,0,0),
(130892,4,2382.8,-5728.4,153.922,0,0,5.50957,0,0),(130892,5,2401.2,-5743.18,153.922,0,0,5.52056,0,0),(130892,6,2411.25,-5755.46,153.98,3000,0,5.30144,0,0),
(130892,7,2400.84,-5742.97,153.922,0,0,2.4151,0,0),(130892,8,2382.62,-5728.3,153.922,0,0,2.32871,0,0),(130892,9,2366.33,-5711.26,153.922,0,0,2.34049,0,0),
(130892,10,2344.2,-5688.49,153.923,0,0,2.302,0,0),(130892,11,2308.86,-5647.39,149.308,3000,0,2.49521,0,0);

-- Hearthglen Crusader/Trisfal Crusader
-- northern group
UPDATE creature SET position_x = 2433.580078, position_y = -5882.046875, position_z = 104.645500, orientation = 1.990541, Spawndist = 0, MovementType = 2 WHERE guid = 130792;
UPDATE creature SET position_x = 2418.468994, position_y = -5866.832031, position_z = 104.968590, orientation = 0.950663, Spawndist = 0, MovementType = 2 WHERE guid = 130570;
UPDATE creature SET position_x = 2423.544189, position_y = -5882.778320, position_z = 104.604820, orientation = 1.472961, Spawndist = 0, MovementType = 2 WHERE guid = 130567;
UPDATE creature SET position_x = 2404.129639, position_y = -5842.262695, position_z = 109.902840, orientation = 6.244246, Spawndist = 0, MovementType = 2 WHERE guid = 130743;
UPDATE creature SET position_x = 2408.253418, position_y = -5881.060059, position_z = 104.593834, orientation = 0.957659, Spawndist = 0, MovementType = 2 WHERE guid = 130608;
-- southern group
UPDATE creature SET position_x = 2205.809814, position_y = -5731.661133, position_z = 102.208534, orientation = 1.472664, Spawndist = 0, MovementType = 2 WHERE guid = 130830;
UPDATE creature SET position_x = 2161.003906, position_y = -5725.638672, position_z = 101.332764, orientation = 1.153008, Spawndist = 0, MovementType = 2 WHERE guid = 130682;
UPDATE creature SET position_x = 2150.973389, position_y = -5712.687012, position_z = 101.909523, orientation = 0.783094, Spawndist = 0, MovementType = 2 WHERE guid = 130798;
UPDATE creature SET position_x = 2126.595215, position_y = -5688.541016, position_z = 101.155556, orientation = 0.204981, Spawndist = 0, MovementType = 2 WHERE guid = 130827;
UPDATE creature SET position_x = 2114.592529, position_y = -5697.796387, position_z = 100.391434, orientation = 6.034200, Spawndist = 0, MovementType = 2 WHERE guid = 130794;
UPDATE creature SET position_x = 2144.617188, position_y = -5672.694824, position_z = 110.442459, orientation = 0.335399, Spawndist = 0, MovementType = 2 WHERE guid = 130796;
UPDATE creature SET position_x = 2196.454834, position_y = -5701.930176, position_z = 112.392166, orientation = 1.223682, Spawndist = 0, MovementType = 2 WHERE guid = 130829;
UPDATE creature SET position_x = 2147.332275, position_y = -5708.847168, position_z = 102.006149, orientation = 0.499547, Spawndist = 0, MovementType = 2 WHERE guid = 130661;
-- Movements
DELETE FROM creature_movement WHERE id IN (130743,130570,130792,130608,130567,130830,130682,130798,130827,130794,130796,130829,130661);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(130743,1,2404.129639,-5842.262695,109.902840,2000,2910301,6.244246,0,0),(130743,2,2425.5,-5847.68,108.85,0,0,0.772094,0,0),(130743,3,2430.1,-5838.91,112.438,0,0,1.23234,0,0),
(130743,4,2430.68,-5821.38,119.77,0,0,1.71614,0,0),(130743,5,2428.18,-5809.46,126.166,0,0,1.80646,0,0),(130743,6,2426.04,-5787.39,141.243,0,0,1.66902,0,0),
(130743,7,2409.18,-5760.7,152.965,5000,2910302,2.32483,0,0),(130570,1,2418.468994,-5866.832031,104.968590,2000,2910201,0.950663,0,0),(130570,2,2430.8,-5848.82,109.521,0,0,1.01422,0,0),
(130570,3,2433.39,-5830.24,115.967,0,0,1.52315,0,0),(130570,4,2433.82,-5819,120.777,0,0,1.75249,0,0),(130570,5,2432.49,-5800.23,132.063,0,0,1.57577,0,0),
(130570,6,2426.62,-5784.07,142.837,0,0,2.06665,0,0),(130570,7,2410.1,-5757.59,153.412,5000,2910202,2.16482,0,0),(130792,1,2433.580078,-5882.046875,104.645500,2000,2910301,1.990541,0,0),
(130792,2,2432.74,-5862.93,107.076,0,0,1.56086,0,0),(130792,3,2438.97,-5840.58,113.607,0,0,1.36843,0,0),(130792,4,2436.82,-5817.06,121.897,0,0,1.69437,0,0),
(130792,5,2436.44,-5803.47,130.055,0,0,1.50588,0,0),(130792,6,2435.01,-5791.9,138.069,0,0,2.21117,0,0),(130792,7,2410.08,-5768.17,152.083,5000,2910302,2.47427,0,0),
(130608,1,2408.253418,-5881.060059,104.593834,2000,2910201,0.957659,0,0),(130608,2,2423.95,-5856.89,106.491,0,0,1.16523,0,0),(130608,3,2433.64,-5834,114.61,0,0,1.48489,0,0),
(130608,4,2433.44,-5812.11,124.299,0,0,1.63019,0,0),(130608,5,2425.49,-5779.39,145.143,5000,2910202,2.05038,0,0),(130567,1,2423.544189,-5882.778320,104.604820,2000,2910201,1.472961,0,0),
(130567,2,2433.82,-5857.11,108.447,0,0,1.36237,0,0),(130567,3,2436.81,-5823.62,119.25,0,0,1.61762,0,0),(130567,4,2431.98,-5802.78,130.28,0,0,1.82575,0,0),
(130567,5,2424,-5775.7,146.81,5000,2910202,1.97498,0,0),(130830,1,2205.809814,-5731.661133,102.208534,2000,2910301,1.472664,0,0),(130830,2,2208.49,-5705.15,102.799,0,0,1.7774,0,0),
(130830,3,2206.62,-5688.95,110.31,0,0,1.20799,0,0),(130830,4,2213.77,-5676.03,118.232,0,0,1.02342,0,0),(130830,5,2224.66,-5670,124.341,0,0,0.375463,0,0),
(130830,6,2240.25,-5670.29,134.257,0,0,6.15207,0,0),(130830,7,2248.5,-5671.39,139.033,0,0,0.109213,0,0),(130830,8,2256.87,-5669.47,139.138,0,0,0.524688,0,0),
(130830,9,2276.56,-5651.09,142.69,5000,2910302,0.764235,0,0),(130682,1,2161.003906,-5725.638672,101.332764,2000,2910301,1.153008,0,0),(130682,2,2175.47,-5690.91,108.545,0,0,0.956659,0,0),
(130682,3,2198.8,-5668.79,116.512,0,0,0.721039,0,0),(130682,4,2221.04,-5654.31,126.426,0,0,0.481493,0,0),(130682,5,2243.41,-5649.02,132.889,0,0,0.163406,0,0),
(130682,6,2277.84,-5647.74,143.051,5000,2910302,0.00239992,0,0),(130798,1,2150.973389,-5712.687012,101.909523,2000,2910301,0.783094,0,0),(130798,2,2179.7,-5682.61,110.924,0,0,0.790948,0,0),
(130798,3,2203.85,-5662.88,119.445,0,0,0.661357,0,0),(130798,4,2223,-5649.27,127.826,0,0,0.246667,0,0),(130798,5,2248.94,-5651.66,134.06,0,0,6.15286,0,0),
(130798,6,2277.4,-5655.15,143.306,5000,2910302,6.25889,0,0),(130827,1,2126.595215,-5688.541016,101.155556,2000,2910301,0.204981,0,0),(130827,2,2158.87,-5673.12,109.316,0,0,0.711562,0,0),
(130827,3,2174.26,-5662.13,114.756,0,0,0.511285,0,0),(130827,4,2199.97,-5651.31,121.689,0,0,0.456308,0,0),(130827,5,2226.78,-5642.05,130.179,0,0,0.142148,0,0),
(130827,6,2246.62,-5640.31,135.689,0,0,0.0636083,0,0),(130827,7,2279.48,-5641.56,144.101,5000,2910302,0.0478973,0,0),(130794,1,2114.592529,-5697.796387,100.391434,2000,2910301,6.034200,0,0),
(130794,2,2157.63,-5689.16,106.345,0,0,0.323566,0,0),(130794,3,2167.83,-5690.44,107.717,0,0,0.39582,0,0),(130794,4,2190.97,-5669.45,115.191,0,0,0.753176,0,0),
(130794,5,2216.44,-5653.29,125.529,0,0,0.497921,0,0),(130794,6,2240.74,-5645.78,132.926,0,0,0.250521,0,0),(130794,7,2282.69,-5645.59,144.297,2000,2910302,0.00704718,0,0),
(130796,1, 2144.617188,-5672.694824,110.442459,2000,2910301,0.335399,0,0),(130796,2,2152.14,-5670.07,107.855,0,0,0.335399,0,0),(130796,3,2185.46,-5659.7,117.721,0,0,0.249005,0,0),
(130796,4,2220.1,-5657.21,125.484,0,0,0.0369478,0,0),(130796,5,2248.78,-5655.03,133.863,0,0,0.131196,0,0),(130796,6,2281.57,-5648.59,143.968,2000,2910302,0.256859,0,0),
(130829,1,2196.454834,-5701.930176,112.392166,2000,2910301,1.223682,0,0),(130829,2,2198.34,-5693.86,110.321,0,0,1.28573,0,0),(130829,3,2206.89,-5672.37,117.232,0,0,1.0611,0,0),
(130829,4,2218.14,-5658.96,124.59,0,0,0.812133,0,0),(130829,5,2236.62,-5648.38,131.373,0,0,0.218372,0,0),(130829,6,2284.18,-5642.92,144.844,5000,2910302,6.24866,0,0),
(130661,1,2147.332275,-5708.847168,102.006149,2000,2910301,0.499547,0,0),(130661,2,2172.61,-5683.99,109.826,0,0,0.77912,0,0),(130661,3,2199.89,-5659.37,119.516,0,0,0.684872,0,0),
(130661,4,2223.32,-5646.06,128.413,0,0,0.377782,0,0),(130661,5,2251.14,-5644.13,135.913,0,0,0.0549819,0,0),(130661,6,2282.16,-5654.42,144.602,5000,2910302,5.97689,0,0);

-- Hearthglen Crusader
UPDATE creature SET spawntimesecs = 120 WHERE id = 29102;
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2910201,2910202);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2910201,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2910202,1,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle');
DELETE FROM dbscripts_on_creature_death WHERE id = 29102;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(29102,7,20,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self');
-- Trisfal Crusader
UPDATE creature SET spawntimesecs = 120 WHERE id = 29103;
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2910301,2910302);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2910301,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2910302,1,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle');
DELETE FROM dbscripts_on_creature_death WHERE id = 29103;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(29103,7,20,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self');

-- Volatile Ghoul
UPDATE creature SET spawndist = 15, MovementType = 1 WHERE id = 29136;
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 29136);
DELETE FROM creature_template_addon WHERE entry = 29136;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(29136,0,0,1,0,0,0,NULL);

-- Scarlet Medic -- Phase 1
DELETE FROM creature_addon WHERE guid IN (129253,129254,129256,129257,129258,129261,129262);
DELETE FROM creature_template_addon WHERE entry = 28608;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(28608,0,0,1,0,0,0,NULL);-- Watch Commander Zalaphil - equipment
DELETE FROM creature_equip_template WHERE entry = 2514;
INSERT INTO creature_equip_template (entry, equipentry1, equipentry2, equipentry3) VALUES    
(2514,2147,2053,0);
UPDATE creature_template SET equipmentTemplateid = 2514 WHERE entry = 5809;

-- Icecrown

-- Silver Blade Sailor
UPDATE creature_template SET MinLevel = 79, MaxLevel = 80, UnitClass = 2, Expansion = 2, MinLevelHealth = 12175, MaxLevelHealth = 12600, MinLevelMana = 3893, MaxLevelMana = 3994,
MinMeleeDmg = 417, MaxMeleeDmg = 582, MinRangedDmg = 341, MaxRangedDmg = 506, Armor = 9706, MeleeAttackPower = 608,  RangedAttackPower = 80, MeleeBaseAttackTime = 2000,  RangedBaseAttackTime = 2000 WHERE Entry = 35319;
UPDATE creature SET curhealth = 12175, curmana = 3893 WHERE id = 35319;
-- Crimson Dawn Sailor
UPDATE creature_template SET Expansion = 2, RangedBaseAttackTime = 2000 WHERE Entry = 35318;

-- Waypoints
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid IN (54289,54294,54296,54301);
DELETE FROM creature_movement WHERE id IN (54289,54294,54296,54301);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1 -- Silver Blade Sailor
(54301,1,9065.17,1257.45,4.03726,2000,0,2.37088,0,0),
(54301,2,9074.46,1246.58,4.15154,0,0,5.50854,0,0),
(54301,3,9095.06,1228.42,5.58283,2000,0,5.60279,0,0),
(54301,4,9080.87,1240.43,4.31364,0,0,2.39051,0,0),
-- #2 -- Silver Blade Sailor
(54296,1,9089.49,1256.84,4.18489,0,0,2.29783,0,0),
(54296,2,9079.46,1269.9,4.03743,2000,0,2.36381,0,0),
(54296,3,9089.56,1257.28,4.1788,0,0,5.37109,0,0),
(54296,4,9103.88,1235.61,5.60955,2000,0,5.22973,0,0),
(54296,5,9100.44,1241.23,5.12457,0,0,2.13526,0,0),
-- #3 -- Crimson Dawn Sailor
(54294,1,9040.59,804.034,5.48785,2000,0,0.980707,0,0),
(54294,2,9027.63,787.022,4.16104,0,0,3.84506,0,0),
(54294,3,9013.69,772.19,3.94491,2000,0,3.93381,0,0),
(54294,4,9027.56,787.003,4.15946,0,0,0.916303,0,0),
-- #4 -- Crimson Dawn Sailor
(54289,1,9032.14,812.607,5.49287,2000,0,0.615496,0,0),
(54289,2,9016.28,800.953,4.1919,0,0,3.91731,0,0),
(54289,3,8999.94,785.7,3.94657,2000,0,3.92202,0,0);
-- Grizzly Hills
-- Conquest Hold Legionnaire - waypoints
UPDATE creature SET position_x = 3221.369, position_y = -2258.965, position_z = 113.0980, orientation = 4.91841, spawndist = 0, movementType = 2 WHERE guid = 116284;
UPDATE creature SET position_x = 3219.481, position_y = -2258.706, position_z = 113.5434, orientation = 4.91841, spawndist = 0, movementType = 0 WHERE guid = 116285;
DELETE FROM creature_movement WHERE id = 116284;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(116284,1,3225.36,-2271.29,109.913,0,0,5.36647,0,0),
(116284,2,3231.42,-2278.6,108.521,0,0,5.72303,0,0),
(116284,3,3238.38,-2282.88,108.14,0,0,6.07803,0,0),
(116284,4,3250.019,-2281.82,108.431,0,0,0.211888,0,0),
(116284,5,3273.088,-2276.127,109.74,0,0,6.11784,0,0),
(116284,6,3290.14,-2280.47,110.065,0,0,0.387146,0,0),
(116284,7,3293.6,-2279.65,110.288,0,0,0.970697,0,0),
(116284,8,3296.56,-2275.02,110.679,0,0,1.27465,0,0),
(116284,9,3301.13,-2254.09,112.6,3000,0,1.53383,0,0),
(116284,10,3304.13,-2259.15,111.978,0,0,4.53955,0,0),
(116284,11,3300.25,-2276.79,110.352,0,0,4.22855,0,0),
(116284,12,3295.79,-2282.27,110.123,0,0,3.50206,0,0),
(116284,13,3281.8,-2282.83,107.425,0,0,2.98919,0,0),
(116284,14,3269.46,-2280.32,108.708,0,0,3.01196,0,0),
(116284,15,3239.31,-2285.93,107.965,0,0,3.02217,0,0),
(116284,16,3230.63,-2282.5,108.202,0,0,2.45983,0,0),
(116284,17,3225.11,-2277.41,108.733,0,0,2.16766,0,0),
(116284,18,3221.64,-2270.83,109.775,0,0,1.90848,0,0),
(116284,19,3217.99,-2256.37,114.156,3000,0,1.77889,0,0);
-- link
DELETE FROM creature_linking WHERE guid = 116285;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES 
(116285,116284,1+2+512);
-- --------------------------------------------------------
-- DK Starting Zone - phase 64 part 2 'Crusaders'
-- --------------------------------------------------------

-- Duplicates removed
DELETE FROM creature WHERE guid IN (130751,130657,130620,130670,130808,130674,130569,130599,130719,130565,130609,130566,130717,130741,130856,130799,130821,130668,130667,130800,130708,130664,
130750,130666,130807,130817,130814,130681,130822,130816,130673,130680,130672,130678,130684,130823,130685,130748,130742,130707,130745,130855,130831,130779,130776,130687,130771,130768,130693,
130832,130834,130634,130764,130694,130632,130837,130603,130840,130770,130643,130841,130582,130590,130581,130842,130846,130698,130571,130568,130739,130572,130703,130577,130701,130853,130700,
130558,130573,130852,130702);
DELETE FROM creature_addon WHERE guid IN (130751,130657,130620,130670,130808,130674,130569,130599,130719,130565,130609,130566,130717,130741,130856,130799,130821,130668,130667,130800,130708,
130664,130750,130666,130807,130817,130814,130681,130822,130816,130673,130680,130672,130678,130684,130823,130685,130748,130742,130707,130745,130855,130831,130779,130776,130687,130771,130768,
130693,130832,130834,130634,130764,130694,130632,130837,130603,130840,130770,130643,130841,130582,130590,130581,130842,130846,130698,130571,130568,130739,130572,130703,130577,130701,130853,
130700,130558,130573,130852,130702);
DELETE FROM creature_movement WHERE id IN (130751,130657,130620,130670,130808,130674,130569,130599,130719,130565,130609,130566,130717,130741,130856,130799,130821,130668,130667,130800,130708,
130664,130750,130666,130807,130817,130814,130681,130822,130816,130673,130680,130672,130678,130684,130823,130685,130748,130742,130707,130745,130855,130831,130779,130776,130687,130771,130768,
130693,130832,130834,130634,130764,130694,130632,130837,130603,130840,130770,130643,130841,130582,130590,130581,130842,130846,130698,130571,130568,130739,130572,130703,130577,130701,130853,
130700,130558,130573,130852,130702);
DELETE FROM game_event_creature WHERE guid IN (130751,130657,130620,130670,130808,130674,130569,130599,130719,130565,130609,130566,130717,130741,130856,130799,130821,130668,130667,130800,
130708,130664,130750,130666,130807,130817,130814,130681,130822,130816,130673,130680,130672,130678,130684,130823,130685,130748,130742,130707,130745,130855,130831,130779,130776,130687,130771,
130768,130693,130832,130834,130634,130764,130694,130632,130837,130603,130840,130770,130643,130841,130582,130590,130581,130842,130846,130698,130571,130568,130739,130572,130703,130577,130701,
130853,130700,130558,130573,130852,130702);
DELETE FROM game_event_creature_data WHERE guid IN (130751,130657,130620,130670,130808,130674,130569,130599,130719,130565,130609,130566,130717,130741,130856,130799,130821,130668,130667,
130800,130708,130664,130750,130666,130807,130817,130814,130681,130822,130816,130673,130680,130672,130678,130684,130823,130685,130748,130742,130707,130745,130855,130831,130779,130776,130687,
130771,130768,130693,130832,130834,130634,130764,130694,130632,130837,130603,130840,130770,130643,130841,130582,130590,130581,130842,130846,130698,130571,130568,130739,130572,130703,130577,
130701,130853,130700,130558,130573,130852,130702);
DELETE FROM creature_battleground WHERE guid IN (130751,130657,130620,130670,130808,130674,130569,130599,130719,130565,130609,130566,130717,130741,130856,130799,130821,130668,130667,130800,
130708,130664,130750,130666,130807,130817,130814,130681,130822,130816,130673,130680,130672,130678,130684,130823,130685,130748,130742,130707,130745,130855,130831,130779,130776,130687,130771,
130768,130693,130832,130834,130634,130764,130694,130632,130837,130603,130840,130770,130643,130841,130582,130590,130581,130842,130846,130698,130571,130568,130739,130572,130703,130577,130701,
130853,130700,130558,130573,130852,130702);
DELETE FROM creature_linking WHERE guid IN (130751,130657,130620,130670,130808,130674,130569,130599,130719,130565,130609,130566,130717,130741,130856,130799,130821,130668,130667,130800,130708,
130664,130750,130666,130807,130817,130814,130681,130822,130816,130673,130680,130672,130678,130684,130823,130685,130748,130742,130707,130745,130855,130831,130779,130776,130687,130771,130768,
130693,130832,130834,130634,130764,130694,130632,130837,130603,130840,130770,130643,130841,130582,130590,130581,130842,130846,130698,130571,130568,130739,130572,130703,130577,130701,130853,
130700,130558,130573,130852,130702) 
OR master_guid IN (130751,130657,130620,130670,130808,130674,130569,130599,130719,130565,130609,130566,130717,130741,130856,130799,130821,130668,130667,130800,130708,130664,130750,130666,130807,
130817,130814,130681,130822,130816,130673,130680,130672,130678,130684,130823,130685,130748,130742,130707,130745,130855,130831,130779,130776,130687,130771,130768,130693,130832,130834,130634,130764,
130694,130632,130837,130603,130840,130770,130643,130841,130582,130590,130581,130842,130846,130698,130571,130568,130739,130572,130703,130577,130701,130853,130700,130558,130573,130852,130702);

-- Rampaging Abomination
-- should respawn almost instant after death
UPDATE creature SET spawntimesecs = 5, spawndist = 20, movementType = 1 WHERE id = 29115;

-- Volatile Ghoul
-- should respawn almost instant after death
UPDATE creature SET spawntimesecs = 5 WHERE id = 29136;
UPDATE creature SET position_x = 2198.392090, position_y = -5828.402832, position_z = 101.502411 WHERE guid = 130923;
UPDATE creature SET position_x = 2175.717285, position_y = -5816.032715, position_z = 101.343269 WHERE guid = 130951;
UPDATE creature SET position_x = 2089.767090, position_y = -5782.844727, position_z = 99.592911 WHERE guid = 130932;
UPDATE creature SET position_x = 2156.671875, position_y = -5757.208984, position_z = 100.663902 WHERE guid = 130949;
UPDATE creature SET position_x = 2238.655518, position_y = -5845.669434, position_z = 101.297417 WHERE guid = 130926;
UPDATE creature SET position_x = 2223.981934, position_y = -5862.010742, position_z = 101.434555 WHERE guid = 130937;

-- Hearthglen Crusader and Trisfal Crusader
-- should be random male/female
UPDATE creature_model_info SET modelid_other_gender = 25913 WHERE modelid = 25911;
UPDATE creature_model_info SET modelid_other_gender = 25911 WHERE modelid = 25913;
UPDATE creature_model_info SET modelid_other_gender = 25914 WHERE modelid = 25912;
UPDATE creature_model_info SET modelid_other_gender = 25912 WHERE modelid = 25914;
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2910203,2910303);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2910203,7,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self'),
(2910303,7,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self');
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2910202,2910302) AND delay = 4;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2910202,4,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self'),
(2910302,4,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self');
-- fix for prev commit
DELETE FROM dbscripts_on_creature_death WHERE id IN (29102,29103);
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(29102,7,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self'),
(29103,7,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self');
UPDATE creature SET Spawndist = 0, MovementType = 0 WHERE guid = 130616;
UPDATE creature SET position_x = 2171.041504, position_y = -5746.948242, position_z = 101.453552, orientation = 4.915133, Spawndist = 10, MovementType = 1 WHERE guid = 130665;
UPDATE creature SET position_x = 2021.283081, position_y = -5767.769043, position_z = 102.069725, orientation = 0.455777 WHERE guid = 130663;
UPDATE creature SET position_x = 1938.300537, position_y = -5806.917480, position_z = 100.326469, orientation = 0.036730 WHERE guid = 130669;
UPDATE creature SET position_x = 1822.585205, position_y = -5806.501465, position_z = 103.471199, orientation = 6.123573 WHERE guid = 130676;
UPDATE creature SET position_x = 1886.295898, position_y = -5815.069824, position_z = 102.595604, orientation = 0.085570 WHERE guid = 130803;
UPDATE creature SET position_x = 1919.796875, position_y = -5810.199707, position_z = 100.092346, orientation = 0.194942 WHERE guid = 130671;
UPDATE creature SET position_x = 2062.375000, position_y = -5827.616211, position_z = 101.632080, orientation = 6.049894 WHERE guid = 130789;
UPDATE creature SET position_x = 2062.264404, position_y = -5863.437988, position_z = 103.230919, orientation = 0.077718 WHERE guid = 130662;
UPDATE creature SET position_x = 1847.384644, position_y = -5861.911621, position_z = 102.175438, orientation = 6.141752 WHERE guid = 130679;
UPDATE creature SET position_x = 1872.653320, position_y = -5855.841309, position_z = 102.853523, orientation = 0.010887 WHERE guid = 130811;
UPDATE creature SET position_x = 1887.613525, position_y = -5854.142578, position_z = 102.406212, orientation = 0.058871 WHERE guid = 130809;
UPDATE creature SET position_x = 1897.007813, position_y = -5852.924805, position_z = 101.451141, orientation = 0.009392 WHERE guid = 130805;
UPDATE creature SET position_x = 1919.654297, position_y = -5846.907715, position_z = 100.235977, orientation = 0.124753 WHERE guid = 130804;
UPDATE creature SET position_x = 1935.207397, position_y = -5843.156250, position_z = 100.510971, orientation = 0.203284 WHERE guid = 130810;
UPDATE creature SET position_x = 2105.251221, position_y = -5900.707031, position_z = 104.638618, orientation = 6.202802 WHERE guid = 130754;
UPDATE creature SET position_x = 1982.372559, position_y = -5917.364258, position_z = 104.190681, orientation = 0.246334 WHERE guid = 130801;
UPDATE creature SET position_x = 1928.129761, position_y = -5933.635742, position_z = 103.063942, orientation = 6.162736 WHERE guid = 130677;
UPDATE creature SET position_x = 1888.227783, position_y = -5932.001465, position_z = 104.198326, orientation = 0.181147 WHERE guid = 130802;
UPDATE creature SET position_x = 1887.905151, position_y = -5911.649414, position_z = 102.921516, orientation = 0.015411 WHERE guid = 130813;
UPDATE creature SET position_x = 1846.163696, position_y = -5901.961426, position_z = 104.819687, orientation = 0.024871 WHERE guid = 130675;
UPDATE creature SET position_x = 1860.970825, position_y = -5927.291504, position_z = 104.586868, orientation = 0.181141 WHERE guid = 130825;
-- Waypoints
UPDATE creature SET spawntimesecs = 30, Spawndist = 0, MovementType = 2 WHERE guid IN (130615,130653,130788,130791,130820,130663,130669,130819,130676,130812,
130803,130806,130671,130789,130662,130679,130811,130809,130805,130804,130810,130754,130801,130677,130802,130813,130675,130825);
DELETE FROM creature_movement WHERE id IN (130615,130653,130788,130791,130820,130663,130669,130819,130676,130812,130803,130806,130671,130789,130662,130679,130811,
130809,130805,130804,130810,130754,130801,130677,130802,130813,130675,130825);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(130820,1,2110.63,-5730.45,100.176,1500,2910301,4.8397,0,0),(130820,2,2122.33,-5722.27,100.328,0,0,0.410476,0,0),(130820,3,2139.85,-5717.74,100.963,0,0,0.558131,0,0),
(130820,4,2169.78,-5698.14,106.245,0,0,0.644525,0,0),(130820,5,2201.61,-5670.41,116.544,0,0,0.691649,0,0),(130820,6,2221.2,-5654.19,126.493,0,0,0.49687,0,0),
(130820,7,2247.14,-5647.54,134.152,0,0,0.100244,0,0),(130820,8,2281.82,-5649.43,144.037,10000,2910303,6.15959,0,0),(130615,1,2082.57,-5729.92,100.968,1500,2910201,-3.0862,0,0),
(130615,2,2120.29,-5721.2,100.326,0,0,0.206275,0,0),(130615,3,2144.6,-5714.86,101.333,0,0,0.611541,0,0),(130615,4,2164.79,-5698.69,105.338,0,0,0.701862,0,0),
(130615,5,2185.95,-5676.26,112.802,0,0,0.862868,0,0),(130615,6,2205.62,-5656.75,121.586,0,0,0.752912,0,0),(130615,7,2235.14,-5646.35,131.467,0,0,0.214915,0,0),
(130615,8,2282.81,-5638.38,145.358,10000,2910203,0.210988,0,0),(130788,1,2076.79,-5733.08,100.771,1500,2910301,0.948046,0,0),(130788,2,2105.55,-5727.9,100.32,0,0,0.301308,0,0),
(130788,3,2146.32,-5717.57,101.241,0,0,0.577768,0,0),(130788,4,2176.44,-5699.26,106.766,0,0,0.485091,0,0),(130788,5,2197.89,-5686.52,111.027,0,0,0.593476,0,0),
(130788,6,2213.47,-5677.43,117.313,0,0,0.628819,0,0),(130788,7,2227.61,-5672.47,125.733,0,0,0.150511,0,0),(130788,8,2241.09,-5668.24,133.771,0,0,0.150512,0,0),
(130788,9,2251.19,-5671.61,140.211,0,0,6.05592,0,0),(130788,10,2260.7,-5667.87,139.602,0,0,0.602901,0,0),(130788,11,2279.49,-5654.93,143.935,10000,2910303,0.602901,0,0),
(130791,1,2050.23,-5752.25,98.5459,1500,2910301,0.39066,0,0),(130791,2,2084.27,-5739.38,100.087,0,0,0.382198,0,0),(130791,3,2124.82,-5722.72,100.35,0,0,0.360207,0,0),
(130791,4,2161.06,-5706.96,103.656,0,0,0.712851,0,0),(130791,5,2179.11,-5688.84,109.467,0,0,0.791391,0,0),(130791,6,2204.98,-5664.79,119.164,0,0,0.720705,0,0),
(130791,7,2239.17,-5651.26,131.423,0,0,0.225904,0,0),(130791,8,2280.17,-5649.69,143.613,10000,2910303,6.26169,0,0),(130653,1,2047.67,-5750.46,98.8524,1500,2910201,0.017199,0,0),
(130653,2,2082.62,-5736.98,100.434,0,0,0.682447,0,0),(130653,3,2136.05,-5719.88,100.712,0,0,0.382425,0,0),(130653,4,2169.42,-5696.4,106.528,0,0,0.739781,0,0),
(130653,5,2191.5,-5675.34,113.472,0,0,0.77748,0,0),(130653,6,2207.61,-5659.48,121.455,0,0,0.77748,0,0),(130653,7,2233.29,-5643.46,131.681,0,0,0.520655,0,0),
(130653,8,2280.33,-5637.12,145.183,10000,2910203,0.0706218,0,0),(130663,1,2021.283081,-5767.769043,102.069725,1500,2910201,0.455777,0,0),(130663,2,2057,-5753.29,98.0162,0,0,0.389378,0,0),
(130663,3,2087.16,-5739.97,99.9644,0,0,0.440429,0,0),(130663,4,2123.28,-5722.97,100.322,0,0,0.45221,0,0),(130663,5,2151.2,-5708.97,102.328,0,0,0.602221,0,0),
(130663,6,2178.39,-5680.06,111.376,0,0,0.821347,0,0),(130663,7,2201.81,-5659.44,119.913,0,0,0.711391,0,0),(130663,8,2228.17,-5646.67,129.653,0,0,0.414511,0,0),
(130663,9,2278.72,-5651.94,143.384,10000,2910203,5.70338,0,0),(130669,1,1938.300537,-5806.917480,100.326469,1500,2910201,0.036730,0,0),(130669,2,1983.64,-5790.51,100.901,0,0,0.378378,0,0),
(130669,3,2022.91,-5769.81,102.141,0,0,0.539385,0,0),(130669,4,2045.72,-5758.77,98.3942,0,0,0.386232,0,0),(130669,5,2076.32,-5743.14,99.4291,0,0,0.456918,0,0),
(130669,6,2109.68,-5727.88,100.259,0,0,0.421575,0,0),(130669,7,2143.97,-5714.37,101.331,0,0,0.496973,0,0),(130669,8,2175.38,-5689.75,108.822,0,0,0.680756,0,0),
(130669,9,2199.47,-5669.2,116.494,0,0,0.716099,0,0),(130669,10,2222.41,-5653.69,126.852,0,0,0.567659,0,0),(130669,11,2252.28,-5644.34,136.182,0,0,0.200093,0,0),
(130669,12,2282.95,-5638.85,145.296,10000,2910203,0.273134,0,0),(130819,1,1848.26,-5817.4,100.084,1500,2910301,0.031333,0,0),(130819,2,1885.95,-5813.1,102.329,0,0,0.127844,0,0),
(130819,3,1939.43,-5807.45,100.38,0,0,0.151406,0,0),(130819,4,1987.9,-5788.39,100.894,0,0,0.383098,0,0),(130819,5,2042.2,-5757.65,98.5925,0,0,0.44593,0,0),
(130819,6,2089.15,-5735.17,100.139,0,0,0.438076,0,0),(130819,7,2128.01,-5720.92,100.474,0,0,0.28885,0,0),(130819,8,2170.04,-5695.56,106.79,0,0,0.650134,0,0),
(130819,9,2196.58,-5672.94,114.801,0,0,0.712966,0,0),(130819,10,2235.65,-5650.01,130.788,0,0,0.461638,0,0),(130819,11,2287.21,-5648.74,145.223,10000,2910303,6.18012,0,0),
(130676,1,1822.585205,-5806.501465,103.471199,1500,2910201,6.123573,0,0),(130676,2,1860.7,-5814.45,100.235,0,0,6.13614,0,0),(130676,3,1902.01,-5807.95,100.908,0,0,0.00610447,0,0),
(130676,4,1944.01,-5807.69,100.583,0,0,0.00610447,0,0),(130676,5,1989.78,-5789.95,100.913,0,0,0.482841,0,0),(130676,6,2025.41,-5769.5,102.127,0,0,0.593583,0,0),
(130676,7,2037.01,-5761.67,99.3255,0,0,0.593583,0,0),(130676,8,2081.03,-5738.27,100.278,0,0,0.389379,0,0),(130676,9,2121.93,-5722.76,100.309,0,0,0.354036,0,0),
(130676,10,2158.34,-5704.48,103.737,0,0,0.683903,0,0),(130676,11,2184.91,-5680.44,111.729,0,0,0.759302,0,0),(130676,12,2207.65,-5658.66,121.698,0,0,0.767156,0,0),
(130676,13,2232.85,-5646.12,130.964,0,0,0.399589,0,0),(130676,14,2281.53,-5657.82,144.979,10000,2910203,5.88874,0,0),(130812,1,1871.52,-5814.89,100.977,1500,2910201,0.149239,0,0),
(130812,2,1911.67,-5811.62,100.215,0,0,0.166323,0,0),(130812,3,1978.48,-5793.12,100.877,0,0,0.434929,0,0),(130812,4,2036.66,-5758.3,98.9885,0,0,0.44671,0,0),
(130812,5,2100.58,-5730.91,100.349,0,0,0.399586,0,0),(130812,6,2155.04,-5707.06,102.968,0,0,0.509542,0,0),(130812,7,2201.83,-5665.23,118.262,0,0,0.737308,0,0),
(130812,8,2256.58,-5647.82,136.801,0,0,0.266069,0,0),(130812,9,2287.16,-5648.41,145.2,10000,2910203,6.24295,0,0),(130803,1,1886.295898,-5815.069824,102.595604,1500,2910301,0.085570,0,0),
(130803,2,1940.44,-5807.54,100.42,0,0,0.329044,0,0),(130803,3,1996.59,-5784.59,100.768,0,0,0.441355,0,0),(130803,4,2037.36,-5758.5,98.9918,0,0,0.517539,0,0),
(130803,5,2095.88,-5728.01,100.327,0,0,0.156255,0,0),(130803,6,2142.68,-5713.79,101.296,0,0,0.442926,0,0),(130803,7,2192.1,-5676.26,113.266,0,0,0.717815,0,0),
(130803,8,2229.92,-5650.07,129.412,0,0,0.521466,0,0),(130803,9,2286.4,-5645.88,144.972,10000,2910303,0.0266647,0,0),(130806,1,1901.66,-5809.61,100.974,1500,2910301,0.342551,0,0),
(130806,2,1941.71,-5807.93,100.478,0,0,0.0728286,0,0),(130806,3,1998.5,-5780,100.674,0,0,0.41055,0,0),(130806,4,2043,-5758.39,98.5521,0,0,0.430185,0,0),
(130806,5,2100.37,-5732.46,100.333,0,0,0.426258,0,0),(130806,6,2154.27,-5707.19,102.864,0,0,0.481236,0,0),(130806,7,2193.28,-5674.47,113.916,0,0,0.650096,0,0),
(130806,8,2232.26,-5647.25,130.574,0,0,0.204775,0,0),(130806,9,2297.9,-5651.41,147.427,10000,2910303,6.19931,0,0),(130671,1,1919.796875,-5810.199707,100.092346,1500,2910201,0.194942,0,0),
(130671,2,1984.03,-5789.59,100.889,0,0,0.472187,0,0),(130671,3,2039.46,-5758.65,98.8531,0,0,0.511457,0,0),(130671,4,2097.4,-5732.33,100.316,0,0,0.319035,0,0),
(130671,5,2151.62,-5712.35,101.993,0,0,0.57429,0,0),(130671,6,2176.82,-5720.66,102.775,10000,2910203,5.69509,0,0),(130789,1,2062.375,-5827.616211,101.632080,1500,2910301,6.049894,0,0),
(130789,2,2080.54,-5829.92,102.423,0,0,5.93994,0,0),(130789,3,2115.34,-5840.62,102.029,0,0,5.92109,0,0),(130789,4,2158.14,-5843.73,102.082,0,0,6.26274,0,0),
(130789,5,2229.69,-5844.69,101.44,10000,2910303,0.0463068,0,0),(130662,1,2062.264404,-5863.437988,103.230919,1500,2910201,0.077718,0,0),(130662,2,2086.83,-5858.89,102.861,0,0,0.160184,0,0),
(130662,3,2132.76,-5855.41,101.544,0,0,6.21011,0,0),(130662,4,2168.02,-5845.59,101.368,0,0,0.292129,0,0),(130662,5,2251.48,-5838.18,101.258,10000,2910203,0.190027,0,0),
(130679,1,1847.384644,-5861.911621,102.175438,1500,2910301,6.141752,0,0),(130679,2,1891.38,-5854.81,102.046,0,0,0.11303,0,0),(130679,3,1949.22,-5847.57,100.357,0,0,0.0109272,0,0),
(130679,4,1995.6,-5848.39,100.826,0,0,6.18809,0,0),(130679,5,2053.46,-5857.73,103.066,0,0,0.124811,0,0),(130679,6,2094.38,-5854.87,103.519,0,0,0.128738,0,0),
(130679,7,2155.67,-5844.05,102.032,0,0,0.0384166,0,0),(130679,8,2220.64,-5849.55,101.569,10000,2910203,6.14489,0,0),(130811,1,1872.653320,-5855.841309,102.853523,1500,2910301,0.010887,0,0),
(130811,2,1945.15,-5846.42,100.348,0,0,0.152258,0,0),(130811,3,2009.83,-5844.98,100.555,0,0,0.0108862,0,0),(130811,4,2081.97,-5842.18,103.485,0,0,0.0462298,0,0),
(130811,5,2156.12,-5816.6,101.968,0,0,0.305411,0,0),(130811,6,2206.36,-5808.57,101.34,10000,2910303,0.219017,0,0),(130809,1,1887.613525,-5854.142578,102.406212,1500,2910301,0.058871,0,0),
(130809,2,1946.51,-5847.73,100.335,0,0,0.180608,0,0),(130809,3,2008.43,-5844.67,100.563,0,0,0.0313824,0,0),(130809,4,2073.83,-5841.62,103.163,0,0,0.0235284,0,0),
(130809,5,2143.41,-5819.68,100.946,0,0,0.28271,0,0),(130809,6,2205.36,-5821.85,101.321,10000,2910303,6.10251,0,0),(130805,1,1897.007813,-5852.924805,101.451141,1500,2910301,0.009392,0,0), 
(130805,2,1946.35,-5847.82,100.335,0,0,0.107488,0,0),(130805,3,2034.81,-5850.42,100.401,0,0,6.17862,0,0),(130805,4,2104.6,-5857.17,102.44,0,0,0.00538468,0,0),
(130805,5,2156.86,-5859.74,101.353,0,0,6.03332,0,0),(130805,6,2179.67,-5864.91,101.337,0,0,0.00302753,0,0),(130805,7,2226.17,-5848.94,101.294,10000,2910303,0.372165,0,0),
(130804,1,1919.654297,-5846.907715,100.235977,1500,2910301,0.124753,0,0),(130804,2,1989.29,-5843.83,100.667,0,0,0.0422862,0,0),(130804,3,2053.05,-5844.47,101.489,0,0,6.28227,0,0),
(130804,4,2115.32,-5842.73,102.499,0,0,0.085484,0,0),(130804,5,2173.43,-5843.51,101.35,0,0,6.24301,0,0),(130804,6,2218.12,-5839.82,101.329,10000,2910303,0.101191,0,0),
(130810,1,1935.207397,-5843.156250,100.510971,1500,2910301,0.203284,0,0),(130810,2,1981.56,-5842.15,100.582,0,0,6.24299,0,0),(130810,3,2016.35,-5842.54,100.545,0,0,6.25556,0,0),
(130810,4,2079.2,-5845.73,102.93,0,0,6.22021,0,0),(130810,5,2161.35,-5845.08,101.875,0,0,0.0312731,0,0),(130810,6,2223.11,-5844.07,101.298,10000,2910303,6.23199,0,0),
(130754,1,2105.251221,-5900.707031,104.638618,1500,2910301,6.202802,0,0),(130754,2,2147.59,-5901.54,101.074,0,0,0.0138609,0,0),(130754,3,2207.9,-5900.44,100.831,0,0,0.0138609,0,0),
(130754,4,2248.68,-5894.8,101.004,10000,2910303,0.135598,0,0),(130801,1,1982.372559,-5917.364258,104.190681,1500,2910301,0.246334,0,0),(130801,2,2060.33,-5911.86,106.458,0,0,0.0177885,0,0),
(130801,3,2129.89,-5903.91,102.994,0,0,0.139525,0,0),(130801,4,2190.71,-5899.29,101.074,0,0,6.28134,0,0),(130801,5,2244.32,-5898.24,100.877,10000,2910303,0.0609853,0,0),
(130677,1,1928.129761,-5933.635742,103.063942,1500,2910201,6.162736,0,0),(130677,2,1981.24,-5929.33,103.63,0,0,0.115955,0,0),(130677,3,2046.15,-5921.03,106.025,0,0,0.22591,0,0),
(130677,4,2119.48,-5903.34,104.28,0,0,0.0491957,0,0),(130677,5,2173.87,-5897.81,100.759,0,0,0.025634,0,0),(130677,6,2216.33,-5899.95,100.666,0,0,6.21065,0,0),
(130677,7,2243.88,-5903.52,100.662,10000,2910203,6.15567,0,0),(130802,1,1888.227783,-5932.001465,104.198326,1500,2910301,0.181147,0,0),(130802,2,1957.72,-5914.99,102.575,0,0,0.224344,0,0),
(130802,3,2025.95,-5907.58,104.953,0,0,0.0633372,0,0),(130802,4,2078.47,-5904.05,105.728,0,0,0.0358482,0,0),(130802,5,2141.54,-5898.15,102.3,0,0,0.0162122,0,0),
(130802,6,2192.28,-5899.28,101.138,0,0,6.18552,0,0),(130802,7,2245.25,-5899.67,100.817,10000,2910303,6.26406,0,0),(130813,1,1887.905151,-5911.649414,102.921516,1500,2910301,0.015411,0,0),
(130813,2,1950.41,-5906.33,101.542,0,0,0.125367,0,0),(130813,3,2024.78,-5907.01,104.901,0,0,6.27111,0,0),(130813,4,2070.91,-5897.83,104.986,0,0,6.1965,0,0),
(130813,5,2126.33,-5901.08,103.446,0,0,0.0193386,0,0),(130813,6,2249.12,-5903.34,100.523,10000,2910303,6.22398,0,0),(130675,1,1846.163696,-5901.961426,104.819687,1500,2910201,0.024871,0,0),
(130675,2,1894.25,-5906.52,102.022,0,0,6.17061,0,0),(130675,3,1961.34,-5907.78,102.362,0,0,6.257,0,0),(130675,4,2031.98,-5908.53,105.049,0,0,0.0405757,0,0),
(130675,5,2098.74,-5905.52,105.628,0,0,6.28056,0,0),(130675,6,2160.55,-5915.42,100.01,0,0,6.0528,0,0),(130675,7,2196.82,-5919.73,101.013,0,0,0.0829842,0,0),
(130675,8,2250.08,-5905.68,100.325,10000,2910203,0.42149,0,0),(130825,1,1860.970825,-5927.291504,104.586868,1500,2910301,0.181141,0,0),(130825,2,1919.96,-5923.4,102.163,0,0,0.137944,0,0),
(130825,3,1994.91,-5908.86,103.971,0,0,0.102601,0,0),(130825,4,2050.26,-5906.36,105.613,0,0,0.122236,0,0),(130825,5,2112.05,-5908.49,104.778,0,0,0.00835337,0,0),
(130825,6,2173.17,-5899.52,100.583,0,0,0.0829662,0,0),(130825,7,2251.93,-5902.93,100.478,10000,2910203,6.20122,0,0);
-- Balista defenders
DELETE FROM creature_addon WHERE guid IN (130630,130760,130626,130627,130628,130631,130629,130625,130759,130774,130725,130847,130848,130699,130575,130583,130838,130836,130633,130638,130697,
130835,130691,130766,130692,130639,130611,130767);
INSERT INTO creature_addon (guid, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(130630,0,0,1,0,333,0,NULL),(130760,0,0,1,0,333,0,NULL),(130626,0,0,1,0,333,0,NULL),(130627,0,0,1,0,333,0,NULL),(130628,0,0,1,0,333,0,NULL),(130631,0,0,1,0,333,0,NULL),(130629,0,0,1,0,333,0,NULL),
(130625,0,0,1,0,333,0,NULL),(130759,0,0,1,0,333,0,NULL),(130774,0,0,1,0,333,0,NULL),(130725,0,0,1,0,333,0,NULL),(130847,0,0,1,0,333,0,NULL),(130848,0,0,1,0,333,0,NULL),(130699,0,0,1,0,333,0,NULL),
(130575,0,0,1,0,333,0,NULL),(130583,0,0,1,0,333,0,NULL),(130838,0,0,1,0,333,0,NULL),(130836,0,0,1,0,333,0,NULL),(130633,0,0,1,0,333,0,NULL),(130638,0,0,1,0,333,0,NULL),(130697,0,0,1,0,333,0,NULL),
(130835,0,0,1,0,333,0,NULL),(130691,0,0,1,0,333,0,NULL),(130766,0,0,1,0,333,0,NULL),(130692,0,0,1,0,333,0,NULL),(130639,0,0,1,0,333,0,NULL),(130611,0,0,1,0,333,0,NULL),(130767,0,0,1,0,333,0,NULL);

-- Citizen of Havenshire -- Phase 1
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 28576);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 28577);
DELETE FROM creature_template_addon WHERE entry IN (28576,28577);
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(28576,0,0,1,0,0,0,NULL),
(28577,0,0,1,0,0,0,NULL);-- Grizzly Hills

-- Westfall Brigade Marine
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (105919,105904,105928);
DELETE FROM creature_movement WHERE id IN (105919,105904,105928);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(105919,1,2629.61,-2105.5,6.12047,0,0,3.75285,0,0),(105919,2,2649.26,-2089.76,4.09507,0,0,0.654451,0,0),(105919,3,2667.24,-2072.57,4.09507,0,0,0.740845,0,0),
(105919,4,2679.41,-2057.64,4.064,0,0,0.967039,0,0),(105919,5,2672.62,-2067.16,4.09594,0,0,3.9759,0,0),(105919,6,2656.28,-2083.66,4.09594,0,0,3.83453,0,0),
-- #2
(105904,1,2614.93,-2104.75,7.06012,0,0,5.26394,0,0),(105904,2,2592.36,-2070.82,6.78671,0,0,2.07523,0,0),
-- #3
(105928,1,2641.89,-2018.9,3.77796,0,0,2.50013,0,0),(105928,2,2667.34,-2037.36,4.09692,0,0,5.66921,0,0);

-- Silverbrook Trapper
UPDATE creature SET position_x = 4243.639, position_y = -2493.448, position_z = 231.605 WHERE guid = 100930;
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (100911,100914,100910,100930);
DELETE FROM creature_movement WHERE id IN (100911,100914,100910,100930);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(100911,1,4340.21,-2457.66,239.037,0,0,0.732988,0,0),(100911,2,4327.07,-2469.75,238.508,0,0,4.06936,0,0),(100911,3,4321.44,-2480.44,238.338,0,0,5.68492,0,0),
(100911,4,4345.04,-2484.49,240.191,0,0,5.85771,0,0),(100911,5,4349.13,-2488.01,241.328,0,0,5.21997,0,0),(100911,6,4353.06,-2504.31,244.122,0,0,4.82335,0,0),
(100911,7,4353.6,-2531.03,245.314,0,0,4.57801,0,0),(100911,8,4352.89,-2507.87,244.509,0,0,1.70188,0,0),(100911,9,4348.56,-2488.81,241.372,0,0,2.0828,0,0),
(100911,10,4342.19,-2483.18,239.655,0,0,2.79044,0,0),(100911,11,4325.16,-2480.19,238.539,0,0,2.61765,0,0),(100911,12,4323.18,-2476.11,238.222,0,0,1.44584,0,0),
(100911,13,4327.03,-2469.69,238.507,0,0,0.771969,0,0),
-- #2
(100914,1,4319.67,-2480.72,238.272,0,0,1.61113,0,0),(100914,2,4317.99,-2474.31,237.75,0,0,2.36197,0,0),(100914,3,4311.46,-2469.85,236.953,0,0,2.88426,0,0),
(100914,4,4302.14,-2469.05,235.1,0,0,3.26518,0,0),(100914,5,4274.02,-2472.6,231.294,0,0,2.91253,0,0),(100914,6,4268.09,-2470.76,231.28,0,0,2.51905,0,0),
(100914,7,4263.61,-2462.82,231.397,0,0,1.8169,0,0),(100914,8,4257.59,-2441.55,231.23,5000,0,1.94178,0,0),(100914,9,4263.46,-2462.3,231.396,0,0,5.20039,0,0),
(100914,10,4268.57,-2469.99,231.281,0,0,5.73917,0,0),(100914,11,4277,-2472.32,231.357,0,0,6.28109,0,0),(100914,12,4304.47,-2468.91,235.621,0,0,6.13343,0,0),
(100914,13,4312.87,-2470.26,237.153,0,0,5.77215,0,0),(100914,14,4317.65,-2473.39,237.695,0,0,5.36758,0,0),(100914,15,4319.64,-2480.63,238.266,0,0,4.55234,0,0),
(100914,16,4316.23,-2489.15,238.583,0,0,4.18871,0,0),
-- #3
(100910,1,4329.09,-2595.16,248.397,0,0,5.27964,0,0),(100910,2,4305.72,-2562.07,242.821,0,0,1.73749,0,0),(100910,3,4306.09,-2557.91,242.631,0,0,0.945023,0,0),
(100910,4,4315.21,-2555.68,244.468,0,0,0.107788,0,0),(100910,5,4327.17,-2555.26,245.285,0,0,5.981,0,0),(100910,6,4346.52,-2575.05,245.406,7000,0,2.31555,0,0),
(100910,7,4328.83,-2556.13,245.278,0,0,2.52211,0,0),(100910,8,4322.36,-2555.07,245.13,0,0,3.15828,0,0),(100910,9,4314.43,-2555.28,244.392,0,0,3.34128,0,0),
(100910,10,4306.22,-2558.16,242.666,0,0,3.90991,0,0),(100910,11,4304.46,-2561.71,242.607,0,0,4.8728,0,0),(100910,12,4315.07,-2577.06,245.147,0,0,5.34561,0,0),
-- #4
(100930,1,4243.639,-2493.448,231.605,0,0,0,0,0),(100930,2,4245.705,-2503.654,231.4428,0,0,0,0,0),(100930,3,4239.67,-2514.717,231.6307,0,0,0,0,0),
(100930,4,4239.557,-2514.651,231.5394,0,0,0,0,0),(100930,5,4239.811,-2514.36,231.6327,0,0,0,0,0),(100930,6,4245.605,-2503.552,231.3878,0,0,0,0,0),
(100930,7,4243.532,-2493.164,231.6278,0,0,0,0,0),(100930,8,4237.666,-2485.062,231.6341,0,0,0,0,0);

-- Saronite Horror
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (98081,98083);
DELETE FROM creature_movement WHERE id IN (98081,98083);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(98081,1,3670.1,-3269.6,263.591,0,0,3.10016,0,0),(98081,2,3656.97,-3264.79,252.175,0,0,2.92737,0,0),(98081,3,3643.25,-3264,241.167,0,0,4.49755,0,0),
(98081,4,3639.11,-3276.93,236.151,0,0,4.66326,0,0),(98081,5,3637.71,-3287.21,235.3,0,0,4.64127,0,0),(98081,6,3639.25,-3275.26,236.271,0,0,1.22636,0,0),
(98081,7,3642.83,-3263.94,240.943,0,0,0.678147,0,0),(98081,8,3649.68,-3264.45,245.707,0,0,6.18044,0,0),(98081,9,3658.71,-3265.81,253.347,0,0,5.96916,0,0),
(98081,10,3669.82,-3269.79,263.269,0,0,0.614958,0,0),(98081,11,3684.09,-3256.65,277.547,4000,0,0.658313,0,0),(98081,12,3675.81,-3263.89,270.108,0,0,3.90986,0,0),
-- #2
(98083,1,3622.12,-3320.36,225.774,0,0,6.28037,0,0),(98083,2,3634.31,-3319.97,228.168,0,0,0.535178,0,0),(98083,3,3638.41,-3316.07,230.094,0,0,0.99543,0,0),
(98083,4,3633.68,-3320.11,227.924,0,0,3.47258,0,0),(98083,5,3620.94,-3320.15,225.629,0,0,2.70838,0,0),(98083,6,3609.9,-3312.56,224.313,0,0,2.17981,0,0),
(98083,7,3605.45,-3299.79,224.282,0,0,1.89471,0,0),(98083,8,3608.16,-3311.16,224.463,0,0,5.1439,0,0);
-- Grizzly Hills 

-- Drakkari Plague Spreader
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (99310,99312,99308);
DELETE FROM creature_movement WHERE id IN (99310,99312,99308);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(99310,1,4242.71,-1857.01,202.295,0,0,1.96996,0,0),(99310,2,4228.73,-1838.98,202.007,0,0,1.80738,0,0),(99310,3,4226.61,-1825.37,203.057,0,0,2.53309,0,0),
(99310,4,4190.79,-1803.69,199.399,5000,0,2.56843,0,0),(99310,5,4225.06,-1824.45,202.931,0,0,5.39901,0,0),(99310,6,4229.13,-1840.24,201.837,0,0,5.32597,0,0),
(99310,7,4242.43,-1856.46,202.245,0,0,5.04872,0,0),(99310,8,4242.76,-1869.16,203.054,5000,0,4.70864,0,0),
-- #2
(99312,1,4189.38,-1972.74,208.895,0,0,2.49475,0,0),(99312,2,4164.02,-1959.18,208.236,0,0,3.48985,0,0),(99312,3,4158.79,-1962.62,208.64,0,0,3.77259,0,0),
(99312,4,4133.68,-1983.51,212.557,0,0,3.86684,0,0),(99312,5,4162.92,-1959.88,208.319,0,0,0.455854,0,0),(99312,6,4168.04,-1961.03,208.666,0,0,5.62226,0,0),
(99312,7,4190.31,-1973.59,208.872,0,0,6.18696,0,0),(99312,8,4203.44,-1975.85,208.006,5000,0,0.329454,0,0),
-- #3
(99308,1,4255.73,-1946.93,203.877,0,0,4.56257,0,0),(99308,2,4252.45,-1967.3,204.972,3000,0,4.54451,0,0),(99308,3,4255.99,-1946.57,203.874,0,0,1.53643,0,0),
(99308,4,4258.01,-1915.51,201.908,3000,0,1.49323,0,0);

-- Diseased Drakkari
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid = 104076;
DELETE FROM creature_movement WHERE id = 104076;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(104076,1,4249.73,-1990.12,206.813,0,0,4.5932,0,0),(104076,2,4247.18,-2007.93,223.317,0,0,4.56571,0,0),(104076,3,4245.39,-2021.72,237.33,5000,0,4.56571,0,0),
(104076,4,4247.31,-2007.2,222.579,0,0,1.39663,0,0),(104076,5,4249.86,-1990.3,206.831,0,0,1.44768,0,0),(104076,6,4250.87,-1975.07,205.999,0,0,1.55764,0,0),
(104076,7,4250.92,-1958.58,204.567,3000,0,1.61654,0,0);

-- Redfang Elder
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid = 102291;
DELETE FROM creature_movement WHERE id = 102291;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(102291,1,3625.66,-4589.46,191.299,0,0,2.32417,0,0),(102291,2,3619.46,-4581.98,193.03,0,0,2.41763,0,0),(102291,3,3605.62,-4571.64,191.841,0,0,2.49146,0,0),
(102291,4,3586.89,-4543.17,198.912,0,0,1.86392,0,0),(102291,5,3578.29,-4515.24,199.681,0,0,1.68014,0,0),(102291,6,3576.83,-4499.91,199.018,0,0,1.32907,0,0),
(102291,7,3589.11,-4481.18,198.796,0,0,0.729023,0,0),(102291,8,3597.28,-4474.21,197.224,5000,0,0.713315,0,0),(102291,9,3588.94,-4481.8,198.833,0,0,4.15493,0,0),
(102291,10,3576.81,-4499.59,199.046,0,0,4.52406,0,0),(102291,11,3578.48,-4516.24,199.677,0,0,4.90341,0,0),(102291,12,3587.2,-4543.75,198.839,0,0,5.27176,0,0),
(102291,13,3604.7,-4571.07,192.27,0,0,5.30003,0,0),(102291,14,3621.46,-4583.58,192.977,0,0,5.46182,0,0),(102291,15,3627.14,-4591.22,191.435,0,0,5.51915,0,0),
(102291,16,3636.25,-4596.99,191.707,5000,0,5.84195,0,0);
-- Nagrand - Oshu'gun (Redone)

-- Duplicates removed
DELETE FROM creature WHERE guid IN (66922,66921);
DELETE FROM creature_addon WHERE guid IN (66922,66921);
DELETE FROM creature_movement WHERE id IN (66922,66921);
DELETE FROM game_event_creature WHERE guid IN (66922,66921);
DELETE FROM game_event_creature_data WHERE guid IN (66922,66921);
DELETE FROM creature_battleground WHERE guid IN (66922,66921);
DELETE FROM creature_linking WHERE guid IN (66922,66921) 
OR master_guid IN (66922,66921);

-- Terrorguard
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (66923,66924,66925,66926,66927);
DELETE FROM creature_movement WHERE id IN (66923,66924,66925,66926,66927);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(66927,1,-2606.47,8320.52,-52.5701,4000,0,6.10233,0,0),(66927,2,-2621.8,8320.77,-63.5614,0,0,3.18929,0,0),(66927,3,-2634.19,8320.85,-71.9921,0,0,3.11075,0,0),
(66927,4,-2655.36,8320.99,-72.0223,0,0,3.11467,0,0),(66927,5,-2668.78,8320.65,-77.5559,0,0,3.43669,0,0),(66927,6,-2673.06,8317.81,-77.7356,0,0,4.14433,0,0),
(66927,7,-2674.96,8307.81,-77.7351,0,0,4.37524,0,0),(66927,8,-2673.24,8318.07,-77.735,0,0,0.625744,0,0),(66927,9,-2668.48,8320.77,-77.5563,0,0,0.2731,0,0),
(66927,10,-2656.08,8320.97,-72.0216,0,0,6.19343,0,0),(66927,11,-2633.97,8320.85,-71.9921,0,0,0.0319824,0,0),
-- #2
(66926,1,-2673.1,8323.16,-77.7367,0,0,4.53565,0,0),(66926,2,-2674,8310.93,-77.7355,0,0,4.39664,0,0),(66926,3,-2678.22,8299.24,-77.7355,0,0,4.05342,0,0),
(66926,4,-2684.34,8290.26,-77.7355,0,0,3.87199,0,0),(66926,5,-2693,8282.27,-77.7355,0,0,3.6348,0,0),(66926,6,-2705.06,8276.62,-77.7355,3000,0,3.35442,0,0),
(66926,7,-2692.97,8282.54,-77.7365,0,0,0.691917,0,0),(66926,8,-2683.36,8291.38,-77.7365,0,0,0.955025,0,0),(66926,9,-2677.06,8301.8,-77.7365,0,0,1.15137,0,0),
(66926,10,-2673.36,8314.69,-77.7352,0,0,1.4027,0,0),(66926,11,-2673.71,8328.43,-77.7382,0,0,1.6501,0,0),(66926,12,-2676.61,8341.22,-77.7567,4000,0,4.45869,0,0),
-- #3
(66924,1,-2720.82,8316.9,-83.083,0,0,5.07875,0,0),(66924,2,-2720.32,8309.37,-83.083,0,0,4.65071,0,0),(66924,3,-2720.7,8303.31,-83.0812,0,0,4.64286,0,0),
(66924,4,-2720.67,8291.87,-77.5434,0,0,4.70569,0,0),(66924,5,-2720.51,8284.5,-77.5452,0,0,4.3821,0,0),(66924,6,-2724.71,8278.45,-77.5769,0,0,4.27136,0,0),
(66924,7,-2725.22,8274.37,-77.7375,0,0,5.64031,0,0),(66924,8,-2720.43,8272.51,-77.7408,0,0,0.0247035,0,0),(66924,9,-2716.98,8274.74,-77.7408,0,0,1.29312,0,0),
(66924,10,-2716.83,8279.97,-77.5478,0,0,1.83505,0,0),(66924,11,-2720.73,8291.24,-77.5459,0,0,1.43606,0,0),(66924,12,-2720.62,8302.51,-82.83,0,0,1.56408,0,0),
(66924,13,-2720.21,8315.76,-83.0822,0,0,1.26485,0,0),(66924,14,-2715.95,8320.68,-83.3228,0,0,0.550919,0,0),(66924,15,-2709.59,8326.74,-83.3228,0,0,1.22872,0,0),
(66924,16,-2708.05,8334.05,-83.3228,0,0,1.74944,0,0),(66924,17,-2710.32,8340.11,-83.3228,0,0,2.20261,0,0),(66924,18,-2715.71,8344.05,-83.3228,0,0,2.71862,0,0),
(66924,19,-2723.85,8344.39,-83.3228,0,0,3.31002,0,0),(66924,20,-2729.84,8340.11,-83.3228,0,0,4.10249,0,0),(66924,21,-2732.99,8332.49,-83.3228,0,0,4.77386,0,0),
(66924,22,-2730.26,8324.39,-83.3228,0,0,5.4061,0,0),
-- #4
(66923,1,-2720.15,8344.97,-83.3097,0,0,2.23209,0,0),(66923,2,-2720.34,8351.65,-83.083,0,0,1.49617,0,0),(66923,3,-2720.2,8363.61,-83.1148,0,0,1.56686,0,0),
(66923,4,-2719.72,8375.37,-88.5825,0,0,1.10583,0,0),(66923,5,-2717.1,8379.37,-88.7731,0,0,1.27155,0,0),(66923,6,-2717.81,8383.22,-88.7729,0,0,2.40331,0,0),
(66923,7,-2721.73,8383.71,-88.7728,0,0,3.92462,0,0),(66923,8,-2723.09,8380.19,-88.7728,0,0,4.75243,0,0),(66923,9,-2720.12,8375.72,-88.6462,0,0,4.72809,0,0),
(66923,10,-2720.11,8364.51,-83.1117,0,0,4.71631,0,0),(66923,11,-2720.7,8346.77,-83.3104,0,0,3.99156,0,0),(66923,12,-2726.51,8343.8,-83.323,0,0,3.7473,0,0),
(66923,13,-2731.97,8336.6,-83.323,0,0,4.47458,0,0),(66923,14,-2731.89,8328.23,-83.323,0,0,5.15001,0,0),(66923,15,-2726.42,8321.16,-83.323,0,0,5.6778,0,0),
(66923,16,-2717.32,8319.53,-83.3165,0,0,0.183928,0,0),(66923,17,-2709.97,8324.87,-83.3237,0,0,0.987391,0,0),(66923,18,-2707.45,8332.97,-83.3237,0,0,1.53795,0,0),
(66923,19,-2710.46,8340.3,-83.3237,0,0,2.16313,0,0),
-- #5
(66925,1,-2765.8,8348.99,-88.77,0,0,1.13185,0,0),(66925,2,-2761.96,8357.91,-88.7715,0,0,0.981839,0,0),(66925,3,-2753.43,8368.98,-88.7715,0,0,0.65904,0,0),
(66925,4,-2742.41,8377.02,-88.7715,0,0,0.384936,0,0),(66925,5,-2731.35,8381.08,-88.7715,0,0,0.0659143,0,0),(66925,6,-2721.06,8382.38,-88.7715,0,0,6.23757,0,0),
(66925,7,-2711.59,8381.52,-88.772,0,0,6.12055,0,0),(66925,8,-2700.85,8378.13,-88.7715,0,0,5.84959,0,0),(66925,9,-2712.31,8381.7,-88.7715,0,0,3.04729,0,0),
(66925,10,-2724.56,8382.32,-88.7729,0,0,3.19887,0,0),(66925,11,-2737.57,8379.19,-88.7724,0,0,3.61906,0,0),(66925,12,-2749.49,8372.8,-88.7723,0,0,3.76829,0,0),
(66925,13,-2757.68,8364.98,-88.7723,0,0,4.03375,0,0),(66925,14,-2764.34,8353.49,-88.7723,0,0,4.29843,0,0),(66925,15,-2767.41,8341.63,-88.7711,0,0,4.58509,0,0),
(66925,16,-2767.61,8329.98,-88.771,0,0,4.75002,0,0),(66925,17,-2764.56,8318.13,-88.771,0,0,5.22911,0,0),(66925,18,-2767.08,8327.13,-88.771,0,0,1.60214,0,0),
(66925,19,-2767.47,8334.99,-88.7709,0,0,1.60842,0,0);

-- Orc Ancestor
UPDATE creature_template SET InhabitType = 5 WHERE entry = 18662;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (66928,66929,66930,66931,66932,66933,66934,66935,66936);
-- Nagrand
-- Consortium Overseer
UPDATE creature SET position_x = -2063.320557, position_y = 8546.734375, position_z = 23.936728, spawndist = 0, MovementType = 2 WHERE guid = 65566;
DELETE FROM creature_movement WHERE id = 65566;
UPDATE creature_template SET MovementType = 2 WHERE entry = 18274;
DELETE FROM creature_movement_template WHERE entry = 18274;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18274,1,-2086,8569.04,21.5988,0,0,2.25497,0,0),
(18274,2,-2104.1,8587.69,18.2267,0,0,2.44975,0,0),
(18274,3,-2076.87,8558.08,22.9817,0,0,5.41856,0,0),
(18274,4,-2065.22,8536.39,23.9165,60000,1827401,5.10126,0,0),
(18274,5,-2074.9,8545.01,22.9726,0,0,1.88819,0,0),
(18274,6,-2078.75,8557.38,22.8488,0,0,2.1081,0,0),
(18274,7,-2086.85,8569.92,21.4582,0,0,2.22591,0,0),
(18274,8,-2103.09,8588.28,18.2584,0,0,0.444629,0,0),
(18274,9,-2091.81,8599.37,20.2861,0,0,0.0809899,0,0),
(18274,10,-2068.57,8594.29,21.5667,0,0,5.19236,0,0),
(18274,11,-2064.07,8583.91,21.4222,0,0,4.72034,0,0),
(18274,12,-2063.53,8571.92,23.4418,0,0,4.72539,0,0),
(18274,13,-2063.37,8546.69,23.9351,60000,1827402,4.61544,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1827401,1827402);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1827401,59,0,0,0,0,0,0,2000000493,0,0,0,0,0,0,0,''),
(1827402,0,20,1,10,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 1:random'),
(1827402,59,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint');
DELETE FROM db_script_string WHERE entry = 2000000493;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000493,'Try to keep appraisal errors to a minimum.  I\'d hate to tell Gezhe we\'ve overpaid on another gem shipment this month.',0,0,0,0,NULL);
-- q.10488 'Protecting Our Own'
DELETE FROM dbscripts_on_event WHERE id = 13489; 
INSERT INTO dbscripts_on_event (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(13489,1,8,21142,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(13489,2,16,1018,2,20748,25,7,0,0,0,0,0,0,0,0,'');
-- Nagrand
-- Murkblood Invader - Southern group
UPDATE creature SET position_x = -2108.680176, position_y = 8507.859375, position_z = 23.407869, orientation = 1.805177 WHERE guid = 65507;
UPDATE creature SET position_x = -2108.209473, position_y = 8505.875000, position_z = 23.564827, orientation = 1.805177 WHERE guid = 65508;
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid = 65506;
UPDATE creature SET spawndist = 0, movementType = 0 WHERE guid IN (65507,65508);
DELETE FROM creature_movement WHERE id = 65506;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(65506,1,-2114,8540.97,21.6609,0,0,1.69045,0,0),(65506,2,-2116.74,8563.22,18.8982,0,0,1.81612,0,0),(65506,3,-2121.28,8577.2,18.2144,0,0,1.6237,0,0),
(65506,4,-2123.59,8600.54,17.0157,0,0,1.37656,0,0),(65506,5,-2121.05,8610.07,17.2115,0,0,1.03335,0,0),(65506,6,-2095.63,8641.19,17.3336,0,0,0.893545,0,0),
(65506,7,-2072.63,8674.07,18.2208,0,0,0.712118,0,0),(65506,8,-2053.18,8692.6,18.0131,0,0,0.727826,0,0),(65506,9,-2032.84,8708.34,18.4604,0,0,0.540901,0,0),
(65506,10,-2014.81,8717.41,19.3475,0,0,0.210248,0,0),(65506,11,-1991.24,8719,20.2555,0,0,6.24211,0,0),(65506,12,-1961.48,8717.67,22.1747,0,0,0.193754,0,0),
(65506,13,-1922.69,8726.31,24.1223,5000,0,0.103434,0,0),(65506,14,-1957.51,8719.2,22.4158,0,0,3.17984,0,0),(65506,15,-1986.21,8717.92,20.5196,0,0,3.11465,0,0),
(65506,16,-2010.96,8719.18,19.5189,0,0,3.48065,0,0),(65506,17,-2026.05,8713.06,18.6949,0,0,3.61416,0,0),(65506,18,-2052.3,8693.82,17.933,0,0,3.80266,0,0),
(65506,19,-2067.75,8681.47,18.8638,0,0,3.94796,0,0),(65506,20,-2088.98,8651.36,17.4626,0,0,4.09325,0,0),(65506,21,-2109.52,8625.68,17.0178,0,0,4.05006,0,0),
(65506,22,-2120.54,8608.14,17.1577,0,0,4.6336,0,0),(65506,23,-2123.62,8588.89,17.3189,0,0,4.92498,0,0),(65506,24,-2116.93,8560.67,19.0643,0,0,4.90928,0,0),
(65506,25,-2114.2,8544.9,21.2733,0,0,4.78362,0,0),(65506,26,-2110.35,8517.2,23.1965,0,0,4.9132,0,0),(65506,27,-2107,8490.6,23.6432,0,0,4.76398,0,0),
(65506,28,-2106.07,8465.5,22.0591,0,0,4.99567,0,0),(65506,29,-2097.13,8448.45,21.7315,0,0,5.25878,0,0),(65506,30,-2086.01,8430.91,21.2486,0,0,5.03494,0,0),
(65506,31,-2075.78,8405.72,19.0172,0,0,5.25877,0,0),(65506,32,-2047.59,8359.41,17.0068,0,0,5.23129,0,0),(65506,33,-2041.92,8339.47,15.0923,0,0,4.97996,0,0),
(65506,34,-2036.57,8328.36,13.879,0,0,5.37423,0,0),(65506,35,-2012.22,8299.83,10.9893,0,0,5.44099,0,0),(65506,36,-1991.31,8275.25,9.14579,0,0,5.33104,0,0),
(65506,37,-1984.31,8262.11,6.92359,0,0,5.01688,0,0),(65506,38,-1982.4,8250.58,4.59313,0,0,4.77733,0,0),(65506,39,-1986.4,8205.41,0.977083,0,0,4.3006,0,0),
(65506,40,-1995.71,8191.48,-0.0648872,0,0,4.06499,0,0),(65506,41,-2017.96,8166.87,0.230461,0,0,4.03357,0,0),(65506,42,-2043.02,8136.3,2.41803,0,0,4.00216,0,0),
(65506,43,-2060.48,8116.36,2.61751,0,0,3.97859,0,0),(65506,44,-2073.88,8100.45,2.68867,0,0,4.05713,0,0),(65506,45,-2086.91,8079.41,2.55276,0,0,4.17494,0,0),
(65506,46,-2101.96,8055.87,2.2554,0,0,4.05714,0,0),(65506,47,-2112.85,8040.26,1.89121,0,0,4.12782,0,0),(65506,48,-2122.31,8022.82,1.44427,0,0,4.30453,0,0),
(65506,49,-2127.07,8002.84,1.78789,0,0,4.56371,0,0),(65506,50,-2132.32,7981.63,-1.49405,0,0,4.41056,0,0),(65506,51,-2139.69,7957.81,-4.22691,0,0,4.58335,0,0),
(65506,52,-2142.67,7923.39,-7.45212,0,0,4.64618,0,0),(65506,53,-2146.24,7887.79,-10.5239,0,0,4.59906,0,0), (65506,54,-2150.9,7850.28,-11.8882,5000,0,4.69723,0,0),
(65506,55,-2146.32,7888.51,-10.4643,0,0,1.45353,0,0),(65506,56,-2142.38,7919.59,-7.73704,0,0,1.46924,0,0),(65506,57,-2139.8,7957.17,-4.32855,0,0,1.4928,0,0),
(65506,58,-2134.51,7980.34,-1.89184,0,0,1.30431,0,0),(65506,59,-2125.9,8010.97,0.446152,0,0,1.33965,0,0),(65506,60,-2118.5,8030.54,1.77208,0,0,1.09225,0,0),
(65506,61,-2102.07,8056.03,2.23708,0,0,0.98622,0,0),(65506,62,-2085.48,8082.49,2.62174,0,0,1.02549,0,0),(65506,63,-2066.38,8109.69,2.4755,0,0,0.931242,0,0),
(65506,64,-2048.25,8130.69,2.54083,0,0,0.864484,0,0),(65506,65,-2020.25,8164.08,0.282843,0,0,0.899827,0,0),(65506,66,-1997.74,8189.36,-0.113347,0,0,0.821287,0,0),
(65506,67,-1986.3,8206.65,0.936384,0,0,1.31609,0,0),(65506,68,-1982.24,8239.88,4.10747,0,0,1.50458,0,0),(65506,69,-1983.01,8258.15,6.16102,0,0,1.80303,0,0),
(65506,70,-1989.82,8272.75,8.79162,0,0,2.26642,0,0),(65506,71,-2006.22,8292.39,10.7762,0,0,2.26642,0,0),(65506,72,-2023.96,8313.5,11.8595,0,0,2.27035,0,0),
(65506,73,-2038.11,8331.37,14.2917,0,0,2.07007,0,0),(65506,84,-2046.88,8357.56,16.9689,0,0,1.9719,0,0),(65506,85,-2062.12,8383.65,17.8571,0,0,2.11327,0,0),
(65506,86,-2078.21,8410.31,19.5278,0,0,2.06222,0,0),(65506,87,-2087.42,8433.05,21.2959,0,0,2.07007,0,0),(65506,88,-2103.29,8458.69,21.6851,0,0,1.91692,0,0),
(65506,89,-2106.71,8467.22,22.089,0,0,1.76376,0,0),(65506,90,-2108.85,8510.73,23.4202,0,0,1.7402,0,0);
-- link
DELETE FROM creature_linking WHERE guid IN (65507,65508);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(65507, 65506, 1+2+128+512),
(65508, 65506, 1+2+128+512);

-- Murkblood Invader - Northern group
UPDATE creature SET position_x = -972.505737, position_y = 8193.477539, position_z = 16.208822, orientation = 4.660573 WHERE guid = 65509;
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid = 65509;
UPDATE creature SET spawndist = 0, movementType = 0 WHERE guid IN (65510,65511);
DELETE FROM creature_movement WHERE id = 65509;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(65509,1,-969.258,8173.74,14.519,0,0,5.02496,0,0),(65509,2,-964.978,8165.19,14.0309,0,0,5.17811,0,0),(65509,3,-955.831,8146.86,8.18516,0,0,5.18203,0,0),
(65509,4,-948.537,8132.72,9.17469,0,0,5.18989,0,0),(65509,5,-940.834,8117.29,16.0521,0,0,5.18989,0,0),(65509,6,-927.489,8089.55,20.0447,0,0,5.0014,0,0),
(65509,7,-925.78,8062.36,22.5056,0,0,4.58907,0,0),(65509,8,-940.867,8041.1,24.9053,0,0,4.03144,0,0),(65509,9,-955.193,8021.02,27.2015,0,0,3.98039,0,0),
(65509,10,-982.122,7998.03,24.4603,0,0,3.71021,0,0),(65509,11,-1016.23,7973.55,23.1907,0,0,3.78875,0,0),(65509,12,-1049.58,7948.08,21.2606,0,0,3.75341,0,0),
(65509,13,-1084.05,7924.9,18.7175,0,0,3.77304,0,0),(65509,14,-1105.74,7901.69,16.006,0,0,4.1304,0,0),(65509,15,-1119.9,7877.54,15.7645,0,0,4.19323,0,0),
(65509,16,-1135.73,7850.31,15.0149,0,0,4.1736,0,0),(65509,17,-1153.12,7818.84,13.4431,0,0,4.1736,0,0),(65509,18,-1167.18,7796.36,11.4752,0,0,4.14611,0,0),
(65509,19,-1178.13,7779.59,12.1305,0,0,4.20894,0,0),(65509,20,-1183.29,7766.83,11.9431,0,0,4.3935,0,0),(65509,21,-1190.21,7746.34,11.6888,0,0,4.25606,0,0),
(65509,22,-1200.45,7731.6,11.2401,0,0,4.00867,0,0),(65509,23,-1236.8,7686.81,9.68634,0,0,3.97725,0,0),(65509,24,-1211.65,7718.21,10.4192,0,0,0.914195,0,0),
(65509,25,-1192.15,7741.8,11.6894,0,0,1.03986,0,0),(65509,26,-1185.76,7755.28,11.8804,0,0,1.25192,0,0),(65509,27,-1176.96,7780.66,12.218,0,0,0.984881,0,0),
(65509,28,-1167.24,7795.77,11.4395,0,0,1.03201,0,0),(65509,29,-1153.44,7817.9,13.0679,0,0,1.01237,0,0),(65509,30,-1134.84,7851.6,15.0348,0,0,1.07128,0,0),
(65509,31,-1115.03,7884.6,15.8627,0,0,1.02808,0,0),(65509,32,-1099.92,7908.16,16.5578,0,0,0.977027,0,0),(65509,33,-1085.16,7924,18.5925,0,0,0.7257,0,0),
(65509,34,-1069.2,7936.06,19.9505,0,0,0.596894,0,0),(65509,35,-1046.46,7950.2,21.402,0,0,0.577259,0,0),(65509,36,-1021.17,7968.96,22.9191,0,0,0.655799,0,0),
(65509,37,-978.595,8000.42,24.546,0,0,0.644018,0,0),(65509,38,-960.673,8015.12,26.537,0,0,0.714704,0,0),(65509,39,-953.002,8023.33,27.1627,0,0,0.966032,0,0),
(65509,40,-934.678,8048.94,23.8428,0,0,0.930689,0,0),(65509,41,-927.145,8064.62,22.2443,0,0,1.19772,0,0),(65509,42,-925.531,8084.46,20.462,0,0,1.61791,0,0),
(65509,43,-929.955,8100.56,19.2077,0,0,2.08522,0,0),(65509,44,-941.076,8117.97,16.1933,0,0,2.01847,0,0),(65509,45,-950.445,8136.7,8.46156,0,0,2.04595,0,0),
(65509,46,-961.349,8157.99,11.2468,0,0,2.04203,0,0),(65509,47,-966.493,8168.31,14.7536,0,0,2.01847,0,0),(65509,48,-972.338,8184.73,15.6714,0,0,1.76321,0,0),
(65509,49,-972.804,8223.08,17.8149,0,0,1.61556,0,0),(65509,50,-967.869,8247.88,18.97,0,0,1.32889,0,0),(65509,51,-961.649,8264.25,19.72,0,0,1.16317,0,0),
(65509,52,-943.117,8296.46,21.5,0,0,0.96289,0,0),(65509,53,-927.318,8315.15,23.386,0,0,0.837226,0,0),(65509,54,-910.694,8332.79,24.4268,0,0,0.778321,0,0),
(65509,55,-940.544,8298.11,21.7331,0,0,4.04165,0,0),(65509,56,-952.892,8278.76,19.9521,0,0,4.17516,0,0),(65509,57,-964.942,8256.17,19.3332,0,0,4.34795,0,0),
(65509,58,-972.327,8230.33,18.1723,0,0,4.582,0,0),(65509,59,-972.936,8194.27,16.2379,0,0,4.71944,0,0);
-- link
DELETE FROM creature_linking WHERE guid IN (65510,65511);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(65510, 65509, 1+2+128+512),
(65511, 65509, 1+2+128+512);

-- Consortium - shouldn't be attacked by Murkblood Invaders
UPDATE creature_template SET UnitFlags = 2 WHERE Entry IN (18272,18274,18276);
-- q.9805 'Blessing of Incineratus'
DELETE FROM dbscripts_on_spell WHERE id = 31927; 
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(31927,1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,'q. credit');
-- Part 1: Windyreed Quest Credit (Big Hut)
UPDATE creature_template SET MovementType = 0 WHERE entry = 18110; -- movement will be changed by quest script
DELETE FROM creature_movement_template WHERE entry = 18110;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18110,1,-1809.12,6294.08,59.3563,20000,1811001,5.72468,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1811001; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1811001,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1811001,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1811001,2,21,1,0,18109,20,7,0,0,0,0,0,0,0,0,'active'),
(1811001,2,3,0,700,18109,25,7,0,0,0,0,-1818.2,6290.04,59.2684,5.24503,''),
(1811001,3,3,0,700,18109,25,7,0,0,0,0,-1808.07,6282.27,59.2715,6.06969,''),
(1811001,5,3,0,700,18109,25,7,0,0,0,0,-1796.79,6285.82,59.2715,0.905697,''),
(1811001,6,3,0,700,18109,25,7,0,0,0,0,-1794.28,6296.44,59.2715,1.89216,''),
(1811001,8,3,0,700,18109,25,7,0,0,0,0,-1803.14,6305.21,59.2715,2.77887,''),
(1811001,9,3,0,700,18109,25,7,0,0,0,0,-1811.29,6303.09,59.2715,4.00724,''),
(1811001,10,3,0,700,18109,25,7,0,0,0,0,-1811.29,6303.09,59.2715,4.00724,''),
(1811001,11,3,0,700,18109,25,7,0,0,0,0,-1809.12,6294.08,59.2715,5.33141,''),
(1811001,13,9,22611,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1811001,13,9,22612,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1811001,13,9,22613,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1811001,14,9,22614,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1811001,14,9,22615,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1811001,14,9,22616,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1811001,17,18,1,0,18109,20,7,0,0,0,0,0,0,0,0,'desp'),
(1811001,17,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
-- Part 2: Windyreed Quest Credit (Hut 01)
UPDATE creature_template SET MovementType = 0 WHERE entry = 18142; -- movement will be changed by quest script
DELETE FROM creature_movement_template WHERE entry = 18142;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18142,1,-1840.96,6387.75,52.945,8000,1814201,4.38078,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1814201; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1814201,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1814201,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1814201,2,21,1,0,18109,20,7,0,0,0,0,0,0,0,0,'active'),
(1814201,3,15,24646,0,18109,20,7,0,0,0,0,0,0,0,0,''),
(1814201,5,9,66169,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814201,5,9,66170,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814201,5,9,66171,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814201,6,18,1,0,18109,20,7,0,0,0,0,0,0,0,0,'desp'),
(1814201,7,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
-- Part 3: Windyreed Quest Credit (Hut 02)
UPDATE creature_template SET MovementType = 0 WHERE entry = 18143; -- movement will be changed by quest script
DELETE FROM creature_movement_template WHERE entry = 18143;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18143,1,-1920.43,6362.44,56.116,8000,1814301,2.11185,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1814301; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1814301,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1814301,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1814301,2,21,1,0,18109,20,7,0,0,0,0,0,0,0,0,'active'),
(1814301,3,15,24646,0,18109,20,7,0,0,0,0,0,0,0,0,''),
(1814301,5,9,44729,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814301,5,9,44728,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814301,5,9,44727,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814301,6,18,1,0,18109,20,7,0,0,0,0,0,0,0,0,'desp'),
(1814301,7,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
-- Part 4: Windyreed Quest Credit (Hut 03) 
UPDATE creature_template SET MovementType = 0 WHERE entry = 18144; -- movement will be changed by quest script
DELETE FROM creature_movement_template WHERE entry = 18144;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18144,1,-1974.11,6275.41,56.994,8000,1814401,0.017453,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1814401; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1814401,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1814401,2,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1814401,2,21,1,0,18109,20,7,0,0,0,0,0,0,0,0,'active'),
(1814401,3,15,24646,0,18109,20,7,0,0,0,0,0,0,0,0,''),
(1814401,5,9,44730,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814401,5,9,66165,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814401,5,9,66166,120,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1814401,6,18,1,0,18109,20,7,0,0,0,0,0,0,0,0,'desp'),
(1814401,7,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');

-- objects
-- Hut Fire (Large)
UPDATE gameobject SET spawntimesecs = -120 WHERE guid IN (22611,22612,22613,22614,22615,22616);
-- missing added - UDB free guids reused
DELETE FROM gameobject WHERE guid IN (44727,44728,44729,44730,66165,66166,66169,66170,66171);
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES 
(44727, 182146, 530, 1,1,-1917.804, 6362.598, 70.96107, 0, 0, 0, 0.8746195, 0.4848101, -120, 100, 1),
(44728, 182146, 530, 1,1,-1914.794, 6352.145, 58.35398, 0, 0, 0, -0.3583679, 0.9335805, -120, 100, 1),
(44729, 182146, 530, 1,1,-1920.396, 6362.225, 56.03167, 0, 0, 0, 0.8433914, 0.5372996, -120, 100, 1),
(44730, 182146, 530, 1,1,-1971.461, 6273.495, 63.36858, 0, 0, 0, 0.9986286, 0.05235322, -120, 100, 1),
(66165, 182146, 530, 1,1,-1971.571, 6282.98, 54.21309, 0, 0, 0, -0.06975555, 0.9975641, -120, 100, 1),
(66166, 182146, 530, 1,1,-1974.024, 6275.625, 56.90597, 0, 0, 0, -0.8910065, 0.4539906, -120, 100, 1),
(66169, 182146, 530, 1,1,-1839.88, 6387.97, 52.8597, 0, 0, 0, 0.9986286, 0.05235322, -120, 100, 1),
(66170, 182146, 530, 1,1,-1836.8, 6389.96, 57.0647, 0, 0, 0, 0.9986286, 0.05235322, -120, 100, 1),
(66171, 182146, 530, 1,1,-1845.25, 6383.97, 56.5082, 0, 0, 0, 0.9986286, 0.05235322, -120, 100, 1);

-- Living Fire
UPDATE creature_template SET MovementType = 0 WHERE entry = 18109;
-- Duplicates removed
DELETE FROM creature WHERE guid=86628;
DELETE FROM creature_addon WHERE guid=86628;
DELETE FROM creature_movement WHERE id=86628;
DELETE FROM game_event_creature WHERE guid=86628;
DELETE FROM game_event_creature_data WHERE guid=86628;
DELETE FROM creature_battleground WHERE guid=86628;
DELETE FROM creature_linking WHERE guid=86628 OR master_guid=86628;

-- Windyreed Wretch
UPDATE creature SET position_x = -1929.178101, position_y = 6334.593262, position_z = 48.385132 WHERE guid = 60171;
UPDATE creature SET position_x = -1813.437256, position_y = 6384.998047, position_z = 43.795441 WHERE guid = 60179;
UPDATE creature SET position_x = -1869.904419, position_y = 6393.945313, position_z = 43.191776 WHERE guid = 60174;
UPDATE creature SET position_x = -1900.012451, position_y = 6378.280273, position_z = 50.573761 WHERE guid = 60175;
UPDATE creature SET position_x = -1971.317017, position_y = 6295.283203, position_z = 50.260643 WHERE guid = 60173;
UPDATE creature SET position_x = -2013.241943, position_y = 6220.623535, position_z = 78.896729 WHERE guid = 60168;
UPDATE creature SET position_x = -1973.284058, position_y = 6275.926758, position_z = 56.900406, spawndist = 2, movementType = 1 WHERE guid = 60157;
-- Zixil <Merchant Supreme>
UPDATE creature SET position_x = -36.31, position_y = -916.366, position_z = 55.075, orientation = 1.062, Spawndist = 0, MovementType = 2 WHERE guid = 15424;
UPDATE creature SET position_x = -37.248, position_y = -914.605, position_z = 55.343, orientation = 0.826, Spawndist = 0, MovementType = 0 WHERE guid = 15423;
DELETE FROM creature_movement WHERE id = 15424;
UPDATE creature_template SET MovementType = 2 WHERE entry = 3537;
DELETE FROM creature_movement_template WHERE entry = 3537;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(3537, 1, -36.31, -916.366, 55.075, 180000, 0, 1.062, 0, 0), 
(3537, 2, -28.532600, -902.440735, 55.908634, 0, 0, 0, 0, 0),
(3537, 3, -26.338741, -896.902466, 56.039452, 0, 0, 0, 0, 0),
(3537, 4, -51.500923, -836.734619, 56.524872, 0, 0, 0, 0, 0),
(3537, 5, -17.165236, -802.633240, 58.751846, 0, 0, 0, 0, 0),
(3537, 6, -20.983173, -719.063965, 69.290993, 0, 0, 0, 0, 0),
(3537, 7, -149.228104, -712.801025, 64.445107, 0, 0, 0, 0, 0),
(3537, 8, -226.017303, -722.711487, 60.861263, 0, 0, 0, 0, 0),
(3537, 9, -325.539337, -754.267334, 54.089657, 0, 0, 0, 0, 0),
(3537, 10, -377.870178, -776.472351, 54.472977, 0, 0, 0, 0, 0),
(3537, 11, -403.164459, -680.892700, 54.499004, 0, 0, 0, 0, 0),
(3537, 12, -331.617737, -671.147278, 54.918808, 0, 0, 0, 0, 0),
(3537, 13, -341.247772, -713.172363, 57.733025, 0, 0, 0, 0, 0),
(3537, 14, -340.614716, -711.776184, 57.733025, 120000, 0, 0, 0, 0),
(3537, 15, -325.247681, -677.673950, 54.596302, 0, 0, 0, 0, 0), 
(3537, 16, -339.869904, -673.187561, 55.012871, 0, 0, 0, 0, 0),
(3537, 17, -385.749298, -685.196350, 54.387272, 0, 0, 0, 0, 0),
(3537, 18, -413.708405, -656.887817, 54.488979, 0, 0, 0, 0, 0),
(3537, 19, -440.757660, -585.658386, 53.424225, 0, 0, 0, 0, 0),
(3537, 20, -520.923462, -558.851501, 39.920975, 0, 0, 0, 0, 0),
(3537, 21, -569.159912, -567.547302, 32.809437, 0, 0, 0, 0, 0),
(3537, 22, -594.511536, -575.940979, 31.982075, 0, 0, 0, 0, 0),
(3537, 23, -650.699402, -560.431763, 26.120964, 0, 0, 0, 0, 0),
(3537, 24, -691.624939, -568.642334, 24.540937, 0, 0, 0, 0, 0),
(3537, 25, -707.109802, -562.611023, 22.809536, 0, 0, 0, 0, 0),
(3537, 26, -724.787048, -549.384033, 20.291832, 0, 0, 0, 0, 0),
(3537, 27, -811.109985, -542.174927, 15.771987, 0, 0, 0, 0, 0),
(3537, 28, -817.549683, -533.020020, 15.160646, 180000, 0, 0, 0, 0),
(3537, 29, -811.109985, -542.174927, 15.771987, 0, 0, 0, 0, 0),
(3537, 30, -724.787048, -549.384033, 20.291832, 0, 0, 0, 0, 0),
(3537, 31, -707.109802, -562.611023, 22.809536, 0, 0, 0, 0, 0),
(3537, 32, -691.624939, -568.642334, 24.540937, 0, 0, 0, 0, 0),
(3537, 33, -650.699402, -560.431763, 26.120964, 0, 0, 0, 0, 0),
(3537, 34, -594.511536, -575.940979, 31.982075, 0, 0, 0, 0, 0),
(3537, 35, -569.159912, -567.547302, 32.809437, 0, 0, 0, 0, 0),
(3537, 36, -520.923462, -558.851501, 39.920975, 0, 0, 0, 0, 0),
(3537, 37, -440.757660, -585.658386, 53.424225, 0, 0, 0, 0, 0),
(3537, 38, -413.708405, -656.887817, 54.488979, 0, 0, 0, 0, 0),
(3537, 39, -385.749298, -685.196350, 54.387272, 0, 0, 0, 0, 0),
(3537, 40, -339.869904, -673.187561, 55.012871, 0, 0, 0, 0, 0),
(3537, 41, -325.247681, -677.673950, 54.596302, 0, 0, 0, 0, 0), 
(3537, 42, -340.614716, -711.776184, 57.733025, 120000, 0, 0, 0, 0),
(3537, 43, -341.247772, -713.172363, 57.733025, 0, 0, 0, 0, 0),
(3537, 44, -331.617737, -671.147278, 54.918808, 0, 0, 0, 0, 0),
(3537, 45, -403.164459, -680.892700, 54.499004, 0, 0, 0, 0, 0),
(3537, 46, -377.870178, -776.472351, 54.472977, 0, 0, 0, 0, 0),
(3537, 47, -325.539337, -754.267334, 54.089657, 0, 0, 0, 0, 0),
(3537, 48, -226.017303, -722.711487, 60.861263, 0, 0, 0, 0, 0),
(3537, 49, -149.228104, -712.801025, 64.445107, 0, 0, 0, 0, 0),
(3537, 50, -20.983173, -719.063965, 69.290993, 0, 0, 0, 0, 0),
(3537, 51, -17.165236, -802.633240, 58.751846, 0, 0, 0, 0, 0),
(3537, 52, -51.500923, -836.734619, 56.524872, 0, 0, 0, 0, 0),
(3537, 53, -26.338741, -896.902466, 56.039452, 0, 0, 0, 0, 0),
(3537, 54, -28.532600, -902.440735, 55.908634, 0, 0, 0, 0, 0),
(3537, 55, -38.973717, -917.010193, 55.065174, 0, 0, 1.062, 0, 0);
-- link
DELETE FROM creature_linking WHERE guid = 15423;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(15423, 15424, 128+512);
-- Hothix
-- ids taken from trinity may not be right 
-- fixed one comming from cata (the same not changed texts) and whats most important here: they're comming from 100% source

-- Marshal Dughan - gossip corrected
DELETE FROM gossip_menu WHERE entry = 6159;
UPDATE creature_template SET npcFlags = 3, GossipMenuId = 11611 WHERE Entry = 240;
DELETE FROM gossip_menu WHERE entry = 11611; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(11611, 16211, 0, 0);
-- missing text added
DELETE FROM npc_text WHERE ID IN (6157,16211);
INSERT INTO npc_text (ID, text0_0, text0_1, lang0, prob0, em0_0, em0_1) VALUES 
(16211, 'Ach, it\'s hard enough keeping order around here without all these new troubles popping up!  I hope you have good news, $n...', 'Ach, it\'s hard enough keeping order around here without all these new troubles popping up!  I hope you have good news, $n...', 0, 1, 5, 5),
(6157, 'Hey there, friend. My name\'s Remy. I\'m from Redridge to the east, and came here looking for business, looking for business. You got any...got any??', 'Hey there, friend. My name\'s Remy. I\'m from Redridge to the east, and came here looking for business, looking for business. You got any...got any??', 0, 1, 0, 0);
-- Mountaineer Stormpike
UPDATE creature_template SET npcFlags = 3, GossipMenuId = 694 WHERE entry = 1343;
DELETE FROM gossip_menu WHERE entry = 694;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(694, 1244, 0, 0);
DELETE FROM npc_text WHERE ID = 1244;
INSERT INTO npc_text (ID, text0_0, text0_1, lang0, prob0, em0_0, em0_1) VALUES 
(1244, 'Well, if it isn\'t a young, bristling $c, no doubt drawn here by talk of my exploits in fields of battle!$B$BNo time for stories now, for there are great, important deeds that need doing!  So if you\'re looking for glory, then luck shines on you today...', 'Well, if it isn\'t a young, bristling $c, no doubt drawn here by talk of my exploits in fields of battle!$B$BNo time for stories now, for there are great, important deeds that need doing!  So if you\'re looking for glory, then luck shines on you today...', 0, 1, 0, 0);
-- Gnome Engineer
-- should be found only in Dun Morogh airfield.
DELETE FROM creature WHERE guid IN (86178,86175);
DELETE FROM creature_addon WHERE guid IN (86178,86175);
DELETE FROM creature_movement WHERE id IN (86178,86175);
DELETE FROM game_event_creature WHERE guid IN (86178,86175);
DELETE FROM game_event_creature_data WHERE guid IN (86178,86175);
DELETE FROM creature_battleground WHERE guid IN (86178,86175);
DELETE FROM creature_linking WHERE guid IN (86178,86175) OR master_guid IN (86178,86175);

-- Leper Gnome 
UPDATE creature SET spawndist = 10, MovementType = 1 WHERE guid IN (2414,2420,2426,2422,2427,2425,2412,2416,2421,2428,2438,2441,2455,2458,2467,2468,2461,2469,2460,2451);
-- Remy "Two Times"
UPDATE creature_template SET npcFlags = 3, GossipMenuId = 5032 WHERE entry = 241;
DELETE FROM gossip_menu WHERE entry = 5032;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(5032, 6157, 0, 0);
DELETE FROM npc_text WHERE ID = 6157;
INSERT INTO npc_text (ID, text0_0, text0_1, lang0, prob0, em0_0, em0_1) VALUES 
(6157, 'Hey there, friend. My name\'s Remy. I\'m from Redridge to the east, and came here looking for business, looking for business. You got any...got any??', 'Hey there, friend. My name\'s Remy. I\'m from Redridge to the east, and came here looking for business, looking for business. You got any...got any??', 0, 1, 0, 0);
-- --------------------------------------------------------
-- DK Starting Zone - Phases
-- --------------------------------------------------------

-- Creatures and Gameobjects (not all ofc) can have more than 1 phase.
-- DB had 1 spawn for each phase.

-- Creatures 
-- duplicates removed
DELETE FROM creature WHERE guid IN (130413,128501,129828,130422,128500,130421,129827,128510,130427,129835,128696,128509,130426,129834,128695,129946,129878,130464,129880,130465,
130466,129881,129815,130408,129817,128458,128459,130412,128457,129816,130226,129388,130225,130224,130037,129456,130332,130286,129439,129445,129450,129433,129438,129454,130288,
129455,130274,130293,129444,129449,130294,130275,130291,130329,130292,130337,129457,130276,130272,130357,130359,130358,129831,128507,130434,128522,129849,130437,130435,128525,
129848,129847,130454,129862,128535,128538,129859,130453,128543,129864,130447,129860,128544,129867,128537,128541,129863,130448,129865,128539,130424,128506,128529,130438,130444,130439,
129856,128530,130442,129858,129857,129851,129853,128528,130445,130443,129854,128531,128505,130423,130457,129874,129876,128553,128546,129872,129871,129873,128545,129870,130455,130463,
130462,130461,130456,130460,128549,128548,130543,128753,130544,129963,130415,128479,130416,128476,128477,129826,128478,129823);
DELETE FROM creature_addon WHERE guid IN (130413,128501,129828,130422,128500,130421,129827,128510,130427,129835,128696,128509,130426,129834,128695,129946,129878,130464,129880,130465,
130466,129881,129815,130408,129817,128458,128459,130412,128457,129816,130226,129388,130225,130224,130037,129456,130332,130286,129439,129445,129450,129433,129438,129454,130288,129455,
130274,130293,129444,129449,130294,130275,130291,130329,130292,130337,129457,130276,130272,130357,130359,130358,129831,128507,130434,128522,129849,130437,130435,128525,129848,129847,
130454,129862,128535,128538,129859,130453,128543,129864,130447,129860,128544,129867,128537,128541,129863,130448,129865,128539,130424,128506,128529,130438,130444,130439,129856,128530,
130442,129858,129857,129851,129853,128528,130445,130443,129854,128531,128505,130423,130457,129874,129876,128553,128546,129872,129871,129873,128545,129870,130455,130463,130462,130461,
130456,130460,128549,128548,130543,128753,130544,129963,130415,128479,130416,128476,128477,129826,128478,129823);
DELETE FROM creature_movement WHERE id IN (130413,128501,129828,130422,128500,130421,129827,128510,130427,129835,128696,128509,130426,129834,128695,129946,129878,130464,129880,130465,
130466,129881,129815,130408,129817,128458,128459,130412,128457,129816,130226,129388,130225,130224,130037,129456,130332,130286,129439,129445,129450,129433,129438,129454,130288,129455,
130274,130293,129444,129449,130294,130275,130291,130329,130292,130337,129457,130276,130272,130357,130359,130358,129831,128507,130434,128522,129849,130437,130435,128525,129848,129847,
130454,129862,128535,128538,129859,130453,128543,129864,130447,129860,128544,129867,128537,128541,129863,130448,129865,128539,130424,128506,128529,130438,130444,130439,129856,128530,
130442,129858,129857,129851,129853,128528,130445,130443,129854,128531,128505,130423,130457,129874,129876,128553,128546,129872,129871,129873,128545,129870,130455,130463,130462,130461,
130456,130460,128549,128548,130543,128753,130544,129963,130415,128479,130416,128476,128477,129826,128478,129823);

-- Lich King - Acherus
UPDATE creature SET phaseMask = 5 WHERE guid = 128738;
-- Highlord Darion Mograine
UPDATE creature SET phaseMask = 69 WHERE guid = 128470;
-- Scourge Gryphon
UPDATE creature SET phaseMask = 229 WHERE guid IN (28556,76795,76796,76799);
-- Master Siegesmith Corvus
UPDATE creature SET phaseMask = 197 WHERE guid = 128577;
-- Enslaved Laborer
UPDATE creature SET phaseMask = 197 WHERE guid = 128579;
-- Mindless Laborer
UPDATE creature SET phaseMask = 197 WHERE guid = 128580;
-- Risen Drudge
UPDATE creature SET phaseMask = 197 WHERE guid = 128465;
-- Alchemist Karloff
UPDATE creature SET phaseMask = 197 WHERE guid = 128456;
-- Gangrenus
UPDATE creature SET phaseMask = 197 WHERE guid = 130411;
-- Fester
UPDATE creature SET phaseMask = 197 WHERE guid = 129818;
-- Corpulous
UPDATE creature SET phaseMask = 197 WHERE guid = 130410;
-- Instructor Razuvious
UPDATE creature SET phaseMask = 69 WHERE guid = 129307;
-- Acherus Necromancer
UPDATE creature SET phaseMask = 69 WHERE guid IN (129389,129390,130223,129391);
-- Death Knight Initiate
UPDATE creature SET phaseMask = 69 WHERE guid IN (129441,130335,129453,129459,130276,130333,129443,130285,130284,130290,130273,130296,130289,129442,130334,129432,129447,129440,129434,130336,
130295,129448);
-- Acherus Ghoul
UPDATE creature SET phaseMask = 69 WHERE guid IN (129480,129481,129482);
-- Amal'thazad
UPDATE creature SET phaseMask = 197 WHERE guid = 130425;
-- Coldwraith
UPDATE creature SET phaseMask = 69 WHERE guid IN (129846,128526,128523,130436);
-- Disciple of Frost
UPDATE creature SET phaseMask = 69 WHERE guid IN (129866,128540,130452,130451,130450,129861,128536,130446,130449);
-- Lord Thorval
UPDATE creature SET phaseMask = 197 WHERE guid = 129830;
-- Disciple of Blood
UPDATE creature SET phaseMask = 69 WHERE guid IN (129855,128534,129852,128533,128527,130440,128532,130441);
-- Lady Alistra
UPDATE creature SET phaseMask = 197 WHERE guid = 129829;
-- Disciple of the Unholy
UPDATE creature SET phaseMask = 69 WHERE guid IN (128550,130458,130459,129869,129875,128551,128552,129868,128547);
-- Teleport - Hall -> Heart
UPDATE creature SET phaseMask = 487 WHERE guid = 129960;
-- Teleport - Heart -> Hall
UPDATE creature SET phaseMask = 487 WHERE guid = 128754;
-- Initiate's Training Dummy
UPDATE creature SET phaseMask = 231 WHERE guid IN (130414,129825,129824,130417);


-- Gameobjects
-- duplicates removed
DELETE FROM gameobject WHERE guid IN (66257,66119,65904,66117,66255,66432,66256,66118,65903,66116,66254,66431,66145,66147,66316,66146,65973,66436,66441,66438,66439,66458,66442,66120,65255,
66352,66448,66137,66700,66608,66437,66454,66452,66136,66699,66609,66449,66138,66701,66292,66139,66702,66607,66451,66457,66450,66444,66604,66130,66697,66447,66133,66129,66360,66455,66127,
66691,66605,66453,66124,65375,66601,66435,66140,66703,66141,66704,66445,66446,66456,66602,66463,66464,66462,66466,66603,66465,66468,66467,66461,66470,66469,66479,66478,66516,66347,94160,
66849,94162,66845,94159,94158,66851,94165,94164,66848,66847,94161,66850,66844,93940,94065,94166,93939,66708,66710,94167,66846,66843,66842,66705,66709,66841,66840,66610,66611,66243,66416,
66244,66418,66244,66418,66351,66522,66338,66510,66313,66483,66311,66481,66319,66490,66326,66498,66492,66321,66494,66323,66315,66485,66317,66488,66312,66482,66346,66517,66310,66480,66325,
66497,66335,66507,66245,66420,66246,66422,66033,66515,66513,66029,66031,66514,66512,66340,66038,66348,65917,66471,65866,66387,66305,66473,65867,66236,66329,66501,66304,66472,65865,66234,
66237,66391,65883,66238,66239,66395,65887,66242,66332,66504,65885,66240,66241,66399,66358,66123,66065);

-- Phase: ALL
UPDATE gameobject SET phaseMask = 487 WHERE guid IN (66486,65893,65895,66143,65897,65899,66235,66389,66385,65882,66393,65884,66401,66397,65886);
-- Phase: 1+2
UPDATE gameobject SET phaseMask = 3 WHERE guid IN (65985,66004,65990,66017,65995,65982,65991,66007,66036,65994,66034,65992,65988,65974,65993,65976,65978,65977,65975,66022,66013,66030,
66019,66014,65996,66000,65999,66003,66009,65998,66001);
-- Phase: 1+4
UPDATE gameobject SET phaseMask = 5 WHERE guid = 66069;
-- Phase: 1+2+32
UPDATE gameobject SET phaseMask = 35 WHERE guid IN (66060,66066,66064,66068,66062,66070,66076,65912,66067,65932,65905,65291);
-- Phase: 4+64+128
UPDATE gameobject SET phaseMask = 196 WHERE guid IN (66290,66276,66285,66282,66277,66280,66288,66278,66271,66275,66286,66284,66272,66273,66287,66289,66279,66270,66281,66274,66283,66262,
66263,66267,66264,66265,66268,66375,66376,66259,66261,66260,66354,66295,66296,66294,66298,66355,66297,66300,66299,66293,66302,66301,66307,66306,66345,66518,66357);
-- Phase: 1+4+32+64+128
UPDATE gameobject SET phaseMask = 229 WHERE guid IN (66434,66433,65902,65901);
-- Phase: 1+2+4+32+64+128
UPDATE gameobject SET phaseMask = 231 WHERE guid IN (65895,66040,66024,65970,65968,65981,66005,65984,65987,65972,65979,65969,66037,65967,66002,66020,66343,66341,66342,66027,
66519,66303,65919,66010,65918,66015);
-- Phase: 4+64+128+256
UPDATE gameobject SET phaseMask = 452 WHERE guid IN (66600,66356,66606,66359,66353,66365,66374,66460,66362,66258);

-- DK zone - Phases: more objects corrected

-- Gameobjects
-- duplicates removed
DELETE FROM gameobject WHERE guid IN (66336,66508,66521,66350,66491,66320,66337,66509,66484,66314,66327,66499,66505,66333);

-- Phase: 1+4+64+128
UPDATE gameobject SET phaseMask = 197 WHERE guid IN (66021,66039,65983,66023,65971,66006,66016);
-- --------------------------------------------------------
-- DK Starting Zone - phase 128 - CHAPTER IV
-- --------------------------------------------------------

-- Duplicates Removed
DELETE FROM creature WHERE guid IN (130365,130370,130368130369,130364,130374,130372,130377,130367,130375,130366,130361,130371);
DELETE FROM creature_addon WHERE guid IN (130365,130370,130368130369,130364,130374,130372,130377,130367,130375,130366,130361,130371);
DELETE FROM creature_movement WHERE id IN (130365,130370,130368130369,130364,130374,130372,130377,130367,130375,130366,130361,130371);

-- Phase: 64+128
-- [Chapter IV] Chapter IV Dummy
UPDATE creature SET phaseMask = 192 WHERE guid = 130400;
-- Acherus Necromancer
UPDATE creature SET phaseMask = 192 WHERE id = 29191;
-- Scarlet Deserter
UPDATE creature SET phaseMask = 192 WHERE id = 29193;
-- Noth the Plaguebringer
UPDATE creature SET phaseMask = 192 WHERE id = 29113;
-- Gothik the Harvester
UPDATE creature SET phaseMask = 192 WHERE id = 29112;
-- Howling Geist
UPDATE creature SET phaseMask = 128 WHERE id = 29189;

-- objects
UPDATE gameobject SET phaseMask = 192 WHERE guid IN (66412,66408,66415,66406,66409,66404,66407,66413,66411,66414,66410);

-- Acherus Necromancer
UPDATE creature SET position_x = 2708.023682, position_y = -5376.278809, position_z = 157.697159, orientation = 3.37, spawndist = 0, MovementType = 2 WHERE guid = 130395;
UPDATE creature SET position_x = 2707.768799, position_y = -5373.590332, position_z = 157.925583, orientation = 3.37, spawndist = 0, MovementType = 0 WHERE guid = 130396;
DELETE FROM creature_movement WHERE id = 130395;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(130395,1,2693.15,-5379.09,157.754,0,0,3.83451,0,0),
(130395,2,2674.66,-5399.52,157.025,0,0,3.84629,0,0),
(130395,3,2659.37,-5412.16,157.894,0,0,4.11411,0,0),
(130395,4,2654.12,-5425.34,157.366,0,0,4.74164,0,0),
(130395,5,2662.54,-5443.72,156.927,0,0,5.51355,0,0),
(130395,6,2680.42,-5458.27,157.056,0,0,5.87483,0,0),
(130395,7,2699.87,-5462.77,156.94,0,0,0.0220427,0,0),
(130395,8,2731.09,-5460.05,156.945,0,0,0.171268,0,0),
(130395,9,2747.63,-5453,156.975,0,0,0.222319,0,0),
(130395,10,2756.36,-5450.86,157.583,0,0,0.111578,0,0),
(130395,11,2767.33,-5451.19,158.589,0,0,0.658217,0,0),
(130395,12,2771.75,-5446.39,159.577,0,0,1.21428,0,0),
(130395,13,2771.95,-5405.92,158.977,0,0,1.74913,0,0),
(130395,14,2766.99,-5385.08,157.377,0,0,2.16461,0,0),
(130395,15,2756.35,-5379.53,157.011,0,0,2.89502,0,0),
(130395,16,2731.94,-5376.08,157.732,0,0,3.16991,0,0),
(130395,17,2708.08,-5376.24,157.696,0,0,3.25237,0,0);
-- link
DELETE FROM creature_linking WHERE guid = 130396;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(130396, 130395, 128+512);

-- Noth the Plaguebringer
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 130898;
DELETE FROM creature_movement WHERE id = 130898;
UPDATE creature_template SET MovementType = 2 WHERE entry = 29113;
DELETE FROM creature_movement_template WHERE entry = 29113;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(29113, 1, 2715.28, -5422.11, 161.471, 55000, 2911301, 5.70723, 0, 0); 
DELETE FROM dbscripts_on_creature_movement WHERE id = 2911301;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2911301,5,0,0,0,0,0,0,2000000494,2000000495,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry IN (2000000494,2000000495);
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000494,'We need more flesh!',0,1,0,5,NULL),
(2000000495,'Double your efforts! The final assault draws near!',0,1,0,5,NULL);

-- Scarlet Deserter
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (130402,130403,130404,130405);
UPDATE creature SET position_x = 2817.77, position_y = -5453.906, position_z = 159.4021, orientation = 1.937315 WHERE guid = 130405;

-- Gothik the Harvester
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 130897;
DELETE FROM creature_movement WHERE id = 130897;
UPDATE creature_template SET MovementType = 2 WHERE entry = 29112;
DELETE FROM creature_movement_template WHERE entry = 29112;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(29112,1,2814.52,-5448.2,159.039,65000,2911201,5.32325,0,0),
(29112,2,2814.52,-5448.2,159.039,60000,2911202,5.32325,0,0),
(29112,3,2814.52,-5448.2,159.039,70000,2911203,5.32325,0,0),
(29112,4,2814.52,-5448.2,159.039,65000,2911204,5.32325,0,0),
(29112,5,2814.52,-5448.2,159.039,75000,2911205,5.32325,0,0),
(29112,6,2814.52,-5448.2,159.039,70000,2911206,5.32325,0,0),
(29112,7,2814.52,-5448.2,159.039,55000,2911207,5.32325,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 2911201 AND 2911207;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2911201,3,0,0,0,29193,130405,7,2000000496,0,0,0,0,0,0,0,'force buddy to: say text'),
(2911201,7,0,0,0,0,0,0,2000000503,0,0,0,0,0,0,0,''),
(2911202,3,0,0,0,29193,130405,7,2000000497,0,0,0,0,0,0,0,'force buddy to: say text'),
(2911202,7,0,0,0,0,0,0,2000000504,0,0,0,0,0,0,0,''),
(2911203,3,0,0,0,29193,130405,7,2000000498,0,0,0,0,0,0,0,'force buddy to: say text'),
(2911203,7,0,0,0,0,0,0,2000000506,0,0,0,0,0,0,0,''),
(2911204,3,0,0,0,29193,130405,7,2000000499,0,0,0,0,0,0,0,'force buddy to: say text'),
(2911204,7,0,0,0,0,0,0,2000000505,0,0,0,0,0,0,0,''),
(2911205,3,0,0,0,29193,130405,7,2000000500,0,0,0,0,0,0,0,'force buddy to: say text'),
(2911205,7,0,0,0,0,0,0,2000000507,0,0,0,0,0,0,0,''),
(2911206,3,0,0,0,29193,130405,7,2000000501,0,0,0,0,0,0,0,'force buddy to: say text'),
(2911206,7,0,0,0,0,0,0,2000000508,0,0,0,0,0,0,0,''),
(2911207,3,0,0,0,29193,130405,7,2000000502,0,0,0,0,0,0,0,'force buddy to: say text');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000496 AND 2000000508;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000496,'You\'re a monster!',0,0,0,0,NULL),
(2000000497,'Please! Spare me! I...',0,0,0,0,NULL),
(2000000498,'Wi... Will it hurt?',0,0,0,0,NULL),
(2000000499,'It tingles...',0,0,0,0,NULL),
(2000000500,'Why don\'t you Just Kill me Already',0,0,0,0,NULL),
(2000000501,'Is it too late to change my mind? How about you just kill me instead?',0,0,0,0,NULL),
(2000000502,'The horror! THE HORROR!',0,0,0,0,NULL),
(2000000503,'Flattery will get you nowhere.',0,0,0,1,NULL),
(2000000504,'Don\'t be ridiculous. Where would you even go if I did spare you? We just finished eradicating your civilization, remember?',0,0,0,1,NULL),
(2000000505,'That\'s how you know it\'s working.',0,0,0,1,NULL),
(2000000506,'Oh yes. Immensely. The pain will propably render you unconcious - hence the vat of slime you\'re floating in!',0,0,0,1,NULL),
(2000000507,'You idiot! That\'s What I\'m Doing Right Now!',0,0,0,5,NULL),
(2000000508,'I AM going to kill you. What\'s the rush?',0,0,0,6,NULL);

-- Howling Geist 
UPDATE creature SET position_x = 2597.903076, position_y = -5549.420410, position_z = 159.772934, spawndist = 20, MovementType = 1 WHERE guid = 130387;
UPDATE creature SET position_x = 2622.867432, position_y = -5481.481934, position_z = 156.948212, spawndist = 20, MovementType = 1 WHERE guid = 130386;
UPDATE creature SET position_x = 2659.806885, position_y = -5537.375000, position_z = 163.303589, spawndist = 20, MovementType = 1 WHERE guid = 130385;
UPDATE creature SET position_x = 2697.650391, position_y = -5469.664063, position_z = 156.943970, spawndist = 20, MovementType = 1 WHERE guid = 130383;
UPDATE creature SET position_x = 2735.920410, position_y = -5363.948730, position_z = 157.715302, spawndist = 20, MovementType = 1 WHERE guid = 130381;

-- Volatile Ghoul
UPDATE creature SET spawndist = 0, MovementType = 2, spawntimesecs = 10 WHERE guid IN (130363,130373,130362);
DELETE FROM creature_movement WHERE id IN (130363,130373,130362);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(130363,1,2676.73,-5314.65,154.792,5000,2918501,1.78743,0,0),
(130363,2,2684.4,-5306.35,154.941,0,0,1.90152,0,0),
(130363,3,2670.25,-5284.02,150.153,0,0,2.31232,0,0),
(130363,4,2662.09,-5274.22,142.412,0,0,2.28565,0,0),
(130363,5,2644.94,-5255.23,121.88,0,0,2.30921,0,0),
(130363,6,2620.75,-5225.3,98.1054,0,0,2.21889,0,0),
(130363,7,2592.76,-5198.52,80.7613,0,0,2.43016,0,0),
(130363,8,2574.95,-5181.7,74.3096,0,0,2.37519,0,0),
(130363,9,2522.32,-5148.41,73.6604,0,0,2.64222,0,0),
(130363,10,2475.21,-5122.23,77.9418,6000,2918502,2.99172,0,0),
-- #2
(130373,1,2632.02,-5394.72,168.397,5000,2918501,0.977384,0,0),
(130373,2,2651.32,-5405.91,159.224,0,0,0.145241,0,0),
(130373,3,2684.38,-5384.49,157.184,0,0,1.06808,0,0),
(130373,4,2687.79,-5330.18,156.083,0,0,1.71604,0,0),
(130373,5,2684.96,-5314.39,154.96,0,0,2.00271,0,0),
(130373,6,2679.3,-5303.38,153.638,0,0,2.1323,0,0),
(130373,7,2672.93,-5295.8,151.813,0,0,2.30116,0,0),
(130373,8,2664.86,-5285.81,148.772,0,0,2.26189,0,0),
(130373,9,2655.93,-5274.74,141.215,0,0,2.2187,0,0),
(130373,10,2639.53,-5252.05,116.733,0,0,2.19513,0,0),
(130373,11,2621.55,-5230.63,100.908,0,0,2.3208,0,0),
(130373,12,2606.08,-5211.66,88.0324,0,0,2.23048,0,0),
(130373,13,2582.86,-5185.51,75.8192,0,0,2.32472,0,0),
(130373,14,2564.62,-5169.25,74.5214,0,0,2.49359,0,0),
(130373,15,2536.72,-5149.97,74.2893,0,0,2.72135,0,0),
(130373,16,2516.32,-5145.46,74.148,0,0,3.00017,0,0),
(130373,17,2491.97,-5142.91,76.1721,0,0,3.09441,0,0),
(130373,18,2467.02,-5137.46,77.5501,6000,2918502,2.64674,0,0),
-- #3
(130362,1,2567.76,-5185.66,74.8526,5000,2918501,5.07626,0,0),
(130362,2,2521.28,-5146.41,73.6638,0,0,2.82019,0,0),
(130362,3,2483.25,-5139.37,76.3581,0,0,3.637,0,0),
(130362,4,2464.89,-5154.73,78.0666,6000,2918502,3.82471,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 2918501 AND 2918502;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2918501,1,15,26047,0,0,0,0x04,0,0,0,0,0,0,0,0,''),
(2918501,4,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2918502,1,1,374,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2918502,3,1,373,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2918502,4,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'');

-- Rampaging Abomination
UPDATE creature SET position_x = 2770.925049, position_y = -5536.027344, position_z = 161.735718, orientation = 2.301208, spawndist = 10, MovementType = 1 WHERE guid = 130378;
UPDATE creature SET spawndist = 0, MovementType = 2, spawntimesecs = 10 WHERE guid IN (130376,130379);
DELETE FROM creature_movement WHERE id IN (130376,130379);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(130376,1,2723.56,-5356.07,159.613,2000,2918601,0.84173,0,0),
(130376,2,2704.62,-5360.77,159.398,0,0,2.91129,0,0),
(130376,3,2691.18,-5349.93,158.621,0,0,2.30653,0,0),
(130376,4,2683.39,-5323.99,155.334,0,0,1.80938,0,0),
(130376,5,2675.71,-5304.56,153.114,0,0,2.045,0,0),
(130376,6,2663.78,-5284.98,148.258,0,0,2.09997,0,0),
(130376,7,2658.59,-5275.23,142.105,0,0,2.04892,0,0),
(130376,8,2644.61,-5255.16,121.631,0,0,2.2145,0,0),
(130376,9,2631.96,-5238.4,107.608,0,0,2.23806,0,0),
(130376,10,2613.31,-5216.83,93.161,0,0,2.3598,0,0),
(130376,11,2598.7,-5201.75,82.8146,0,0,2.34016,0,0),
(130376,12,2582.36,-5187.09,75.8517,0,0,2.47761,0,0),
(130376,13,2569.27,-5176.85,73.7495,0,0,2.48154,0,0),
(130376,14,2558.21,-5168.27,74.6465,0,0,2.48154,0,0),
(130376,15,2538.28,-5155.75,74.2881,0,0,2.64647,0,0),
(130376,16,2521.03,-5147.47,73.6583,0,0,2.6504,0,0),
(130376,17,2502.8,-5138.25,75.7383,0,0,2.71716,0,0),
(130376,18,2483.53,-5131.73,75.9083,2000,2918602,2.88209,0,0),
-- #2
(130379,1,2726.07,-5498.8,162.02,2000,2918601,2.04204,0,0),
(130379,2,2727.57,-5481.48,161.561,0,0,1.14635,0,0),
(130379,3,2732.97,-5468.64,157.569,0,0,0.984563,0,0),
(130379,4,2750.98,-5458.35,156.968,0,0,0.430071,0,0),
(130379,5,2772.88,-5441.7,159.903,0,0,1.37333,0,0),
(130379,6,2774.75,-5416.45,160.25,0,0,1.62074,0,0),
(130379,7,2771.21,-5396.04,158.102,0,0,1.91919,0,0),
(130379,8,2750.66,-5381.1,156.956,0,0,2.6983,0,0),
(130379,9,2727.84,-5372.87,157.819,0,0,2.83182,0,0),
(130379,10,2707.88,-5366.33,158.707,0,0,2.82004,0,0),
(130379,11,2693.81,-5354.31,158.877,0,0,2.19879,0,0),
(130379,12,2687.94,-5338.24,156.999,0,0,1.83122,0,0),
(130379,13,2681.92,-5317.73,154.846,0,0,2.05428,0,0),
(130379,14,2675.34,-5305.38,153.191,0,0,2.06998,0,0),
(130379,15,2659.58,-5278.96,144.64,0,0,2.16031,0,0),
(130379,16,2651.18,-5266.35,132.35,0,0,2.17209,0,0),
(130379,17,2636.53,-5246.73,112.628,0,0,2.23099,0,0),
(130379,18,2619.36,-5225.24,97.7497,0,0,2.30875,0,0),
(130379,19,2605.23,-5209.7,86.9899,0,0,2.30875,0,0),
(130379,20,2591.1,-5194.16,79.6859,0,0,2.30875,0,0),
(130379,21,2573.87,-5176.1,73.9424,0,0,2.35116,0,0),
(130379,22,2558.81,-5161.48,74.598,0,0,2.39043,0,0),
(130379,23,2540.44,-5148.6,74.2861,0,0,2.57892,0,0),
(130379,24,2525.34,-5139.75,73.6435,0,0,2.61034,0,0),
(130379,25,2505.64,-5127.77,74.8511,0,0,2.61819,0,0),
(130379,26,2480.14,-5116.4,79.0267,2000,2918602,2.77527,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 2918601 AND 2918602;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2918601,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2918602,1,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'');

-- Highlord Darion Mograine
UPDATE creature_template SET Expansion = 2, UnitClass = 2, PowerMultiplier = 1000, MinLevelMana = 4258000, MaxLevelMana = 4258000 WHERE entry = 29173;
UPDATE creature SET curmana = 4258000 WHERE id = 29173;

-- Defender of the Light <The Argent Dawn>
UPDATE creature_template SET MinLevel = 55, MaxLevel = 58, UnitFlags = 32768, UnitClass = 2, MinLevelHealth = 62730, MaxLevelHealth = 68910, MinLevelMana = 63510, MaxLevelMana = 68670,
Expansion = 0, DamageMultiplier = 7.5, Armor = 3394, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000, MeleeAttackPower = 228, RangedAttackPower = 23, MinMeleeDmg = 87.5,
MaxMeleeDmg = 123 WHERE entry = 29174;

-- Scourge Commander Thalanor
UPDATE creature SET spawndist = 10, MovementType = 1 WHERE guid = 130467;

-- Chapter III
-- Frostbrood Vanquisher - until fly/ground anim. will be supported by core
DELETE FROM creature_template_addon WHERE entry = 28670;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES
(28670,0,0x3000000,1,0,0,0,53112);

-- Chapter I
-- Mine Car
DELETE FROM creature_linking WHERE guid IN (128860,128864,128868,128869,128870,128873,128874,128876,128879,128880);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(128860, 128885, 1+16+128+512+8192),(128864, 128889, 1+16+128+512+8192),(128868, 128893, 1+16+128+512+8192),(128869, 128894, 1+16+128+512+8192),(128870, 128895, 1+16+128+512+8192),
(128873, 128898, 1+16+128+512+8192),(128874, 128899, 1+16+128+512+8192),(128876, 128901, 1+16+128+512+8192),(128879, 128904, 1+16+128+512+8192),(128880, 128905, 1+16+128+512+8192);
-- Eye of Acherus
UPDATE creature_template SET FactionAlliance = 2084, FactionHorde = 2084 WHERE entry = 28511;
-- Lanti'gah - Barrens
UPDATE creature SET position_x = -292.942444, position_y = -1909.355591, position_z = 91.666786, orientation = 2.13, spawndist = 10, MovementType = 1 WHERE guid = 13100;
-- q.10629 'Shizz Work'

-- source: YTDB
-- missing object added: TEMP Felhound Poo Trap
DELETE FROM gameobject_template WHERE entry = 184981;
INSERT INTO gameobject_template (entry, type, displayId, name, IconName, castBarCaption, unk1, faction, flags, size, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, mingold, maxgold, ScriptName) VALUES
(184981,6,1287,'TEMP Felhound Poo Trap','','','',0,0,1,0,0,0,0,0,0,0,0,0,37695,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
-- --------------------------------------------------------
-- DK Starting Zone - FINAL CHAPTER 
-- --------------------------------------------------------

-- Missing object added
-- aura
DELETE FROM gameobject WHERE guid = 65255; -- UDB free guid reused
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(65255,191206,0,1,449,2460.06,-5593.7,367.394,0.556369,0,0,0.27461,0.961556,180,255,1);

-- Phases fix:
-- Creatures
-- phase 256 should be only on map = 0 not on 609
-- Teleport - Hall -> Heart
UPDATE creature SET phaseMask = 231 WHERE guid = 129960;
-- Teleport - Heart -> Hall
UPDATE creature SET phaseMask = 231 WHERE guid = 128754;
-- Phase: 64+128+256
UPDATE creature SET phaseMask = 448 WHERE guid IN (130470,130468,130469,130503,130474,130501,130475,130502,130471,130472,130504,130480,130473,130479,130481,130542);

-- Gameobjects
-- Phase: ALL
UPDATE gameobject SET phaseMask = 231 WHERE guid IN (66486,65893,65895,66143,65897,65899,66235,66389,66385,65882,66393,65884,66401,66397,65886);
-- Phase: 4+64+128
UPDATE gameobject SET phaseMask = 196 WHERE guid IN (66600,66356,66606,66359,66353,66365,66374,66460,66362,66258);
-- Phase: 1+64+128+256
UPDATE gameobject SET phaseMask = 449 WHERE guid IN (63186,63187,63178,66476,63172,63179,63191,63177,66392,63181,66396,63185,63183,63184);

-- Duplicates Removed
DELETE FROM creature WHERE guid IN (130509,130514,130520,130510,130540.130523,130524,130529,130492,130489,130533,130534,130541,130518,130538,130523);
DELETE FROM creature_addon WHERE guid IN (130509,130514,130520,130510,130540.130523,130524,130529,130492,130489,130533,130534,130541,130518,130538,130523);
DELETE FROM creature_movement WHERE id IN (130509,130514,130520,130510,130540.130523,130524,130529,130492,130489,130533,130534,130541,130518,130538,130523);
DELETE FROM gameobject WHERE guid IN (66417,66419,66388,63190,66477,66390,66474,66386,63180,66394,63182,66402,66398,66400);

-- Terrifying Abomination
UPDATE creature SET position_x = 2404.614258, position_y = -5576.001953, position_z = 420.648224, orientation = 2.847471 WHERE guid = 130527;
UPDATE creature SET position_x = 2417.488770, position_y = -5587.981445, position_z = 420.643829, orientation = 4.783482 WHERE guid = 130526;
UPDATE creature SET position_x = 2524.172363, position_y = -5605.970215, position_z = 420.650696, orientation = 2.712384 WHERE guid = 130513;
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE guid IN (130532,130535,130522,130511,130508,130531,130537);
UPDATE creature SET spawndist = 10, MovementType = 1 WHERE guid IN (130526,130527,130530,130521,130517,130515,130512,130505,130506,130528,130513,130516,130519,130525,130539,130507,130538,130536);
-- Val'kyr Battle-maiden
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (130490,130491,130494,130493);
DELETE FROM creature_movement WHERE id IN (130490,130491,130494,130493);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(130490,1,2502.84,-5616.48,432.943,0,0,1.55658,0,0),
(130490,2,2504.11,-5590.47,432.905,0,0,2.10636,0,0),
(130490,3,2494.05,-5577.2,433.731,0,0,2.92238,0,0),
(130490,4,2471.94,-5577.82,433.117,0,0,4.00231,0,0),
(130490,5,2454.16,-5602.11,434.512,0,0,5.63201,0,0),
(130490,6,2477.43,-5633.17,434.415,0,0,5.85016,0,0),
-- #2
(130491,1,2472.95,-5595.96,427.061,0,0,0.428365,0,0),
(130491,2,2497.12,-5583.22,427.061,0,0,2.42328,0,0),
(130491,3,2494.59,-5562.15,426.705,0,0,2.53281,0,0),
(130491,4,2471.2,-5554.49,426.149,0,0,3.41916,0,0),
(130491,5,2451.5,-5563.65,427.061,0,0,4.36164,0,0),
(130491,6,2447.21,-5581.95,427.061,0,0,5.82562,0,0),
-- #3
(130494,1,2465.76,-5620,434.171,0,0,2.25277,0,0),
(130494,2,2454.56,-5606.66,433.226,0,0,3.58481,0,0),
(130494,3,2431.77,-5618.29,432.56,0,0,5.5703,0,0),
(130494,4,2444.1,-5629.27,432.948,0,0,5.93804,0,0),
(130494,5,2461.61,-5633.12,432.837,0,0,1.14319,0,0),
-- #4
(130493,1,2424.46,-5574.49,430.977,0,0,4.77273,0,0),
(130493,2,2427.46,-5595.36,430.977,0,0,5.84961,0,0),
(130493,3,2444.23,-5598.51,430.977,0,0,0.722527,0,0),
(130493,4,2454.89,-5586.1,430.977,0,0,1.62731,0,0),
(130493,5,2453.33,-5568.18,430.977,0,0,2.91536,0,0),
(130493,6,2434.54,-5563.2,430.977,0,0,3.94266,0,0);
-- Knight of the Ebon Blade
UPDATE creature_template SET UnitFlags = 32784 WHERE entry = 31094;
UPDATE creature SET spawntimesecs = 120 WHERE id = 31094;
-- Patchwerk
UPDATE creature_template SET Expansion = 1, UnitClass = 1, DamageMultiplier = 10.5, MechanicImmuneMask = 8388656 WHERE entry = 31099;
UPDATE creature SET spawntimesecs = 120 WHERE id = 31099;
DELETE FROM dbscripts_on_creature_death WHERE id = 31099;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(31099,1,0,0,0,0,0,0,2000000509,0,0,0,0,0,0,0,''),
(31099,15,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn self');
DELETE FROM db_script_string WHERE entry = 2000000509;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000509,'What... happen to-',0,1,0,0,NULL);
-- Lord Thorval
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE id = 28472;
DELETE FROM creature_movement WHERE id = 129830;
UPDATE creature_template SET MovementType = 2 WHERE entry = 28472;
DELETE FROM creature_movement_template WHERE entry = 28472;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(28472, 1, 2527.73,-5549.21,377.036,30000,0,3.735,0,0),
(28472, 2, 2524.61,-5545.03,377.027,0,0,2.21325,0,0),
(28472, 3, 2524.61,-5545.03,377.027,15000,2847201,4.06051,0,0),
(28472, 4, 2530.44,-5554.25,377.056,0,0,5.26204,0,0),
(28472, 5, 2530.44,-5554.25,377.056,15000,2847202,3.50275,0,0),
(28472, 6, 2524.61,-5545.03,377.027,0,0,2.21325,0,0),
(28472, 7, 2524.61,-5545.03,377.027,15000,2847203,4.06051,0,0),
(28472, 8, 2530.44,-5554.25,377.056,1000,2847204,5.26204,0,0),
(28472, 9, 2524.61,-5545.03,377.027,1000,2847205,2.21325,0,0),
(28472,10, 2530.44,-5554.25,377.056,1000,2847206,5.26204,0,0),
(28472,11, 2524.61,-5545.03,377.027,0,0,2.21325,0,0),
(28472,12, 2524.61,-5545.03,377.027,15000,2847207,4.06051,0,0),
(28472,13, 2527.73,-5549.21,377.036,0,0,2.18866,0,0),
(28472,14, 2527.73,-5549.21,377.036,330000,0,3.735,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 2847201 AND 2847207;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2847201,1,0,0,0,0,0,0,2000000510,0,0,0,0,0,0,0,''),
(2847202,1,0,0,0,0,0,0,2000000511,0,0,0,0,0,0,0,''),
(2847202,10,0,0,0,0,0,0,2000000512,0,0,0,0,0,0,0,''),
(2847203,1,0,0,0,0,0,0,2000000513,0,0,0,0,0,0,0,''),
(2847203,10,0,0,0,0,0,0,2000000514,0,0,0,0,0,0,0,''),
(2847204,1,0,0,0,0,0,0,2000000515,0,0,0,0,0,0,0,''),
(2847205,1,0,0,0,0,0,0,2000000516,0,0,0,0,0,0,0,''),
(2847206,1,0,0,0,0,0,0,2000000517,0,0,0,0,0,0,0,''),
(2847207,1,0,0,0,0,0,0,2000000518,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000510 AND 2000000518;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000510,'As disciples of blood, you strive to master the very lifeforce of your enemies.',0,0,0,0,NULL),
(2000000511,'Be it by blade or incantation, blood feeds our attacks and weakens our foes.',0,0,0,0,NULL),
(2000000512,'True masters learn to make blood serve just their strength in battle.',0,0,0,0,NULL),
(2000000513,'Stripping energy from our foes, both fighting and fallen, allows us to persevere where lesser beings fall exhausted.',0,0,0,0,NULL),
(2000000514,'And every foe that falls, energy sapped and stolen, only furthers our assault.',0,0,0,0,NULL),
(2000000515,'As masters of blood, we know battle without end...',0,0,0,0,NULL),
(2000000516,'We know hunger never to be quenched...',0,0,0,0,NULL),
(2000000517,'We know power never to be overcome...',0,0,0,0,NULL),
(2000000518,'As masters of blood, we are masters of life and death itself. Against us, even hope falls drained and lifeless.',0,0,0,0,NULL);
-- Booty Bay Bruiser 
UPDATE creature SET position_x = -14423.6, position_y = 424.668, position_z = 21.8532, orientation = 3.719140, spawndist = 0, MovementType = 2 WHERE guid = 178;
UPDATE creature SET position_x = -14449.2, position_y = 451.524, position_z = 20.5557, orientation = 5.001510, spawndist = 0, MovementType = 2 WHERE guid = 591;
UPDATE creature SET position_x = -14256.7, position_y = 338.710, position_z = 27.2934, orientation = 2.565270, spawndist = 0, MovementType = 2 WHERE guid = 593;
UPDATE creature SET position_x = -14298.5, position_y = 435.710, position_z = 31.5745, orientation = 0.612118, spawndist = 0, MovementType = 2 WHERE guid = 594;
UPDATE creature SET position_x = -14400.6, position_y = 413.038, position_z = 7.93467, orientation = 0.712614, spawndist = 0, MovementType = 2 WHERE guid = 598;
UPDATE creature SET position_x = -14316.7, position_y = 446.802, position_z = 23.4093, orientation = 1.798240, spawndist = 0, MovementType = 2 WHERE guid = 599;
UPDATE creature SET position_x = -14451.0, position_y = 462.469, position_z = 15.4349, orientation = 3.682770, spawndist = 0, MovementType = 2 WHERE guid = 651;
UPDATE creature SET position_x = -14434.8, position_y = 416.849, position_z = 8.81870, orientation = 0.661698, spawndist = 0, MovementType = 2 WHERE guid = 654;
UPDATE creature SET position_x = -14431.6, position_y = 511.808, position_z = 5.77141, orientation = 2.603190, spawndist = 0, MovementType = 2 WHERE guid = 656;
UPDATE creature SET position_x = -14299.9, position_y = 503.528, position_z = 9.25196, orientation = 4.147560, spawndist = 0, MovementType = 2 WHERE guid = 657;
UPDATE creature SET position_x = -14302.3, position_y = 511.123, position_z = 8.82953, orientation = 3.860820, spawndist = 0, MovementType = 2 WHERE guid = 686;
UPDATE creature SET position_x = -14473.9, position_y = 487.356, position_z = 26.8084, orientation = 5.547340, spawndist = 0, MovementType = 2 WHERE guid = 695;
UPDATE creature SET position_x = -14437.2, position_y = 399.063, position_z = 31.7274, orientation = 2.060510, spawndist = 0, MovementType = 2 WHERE guid = 715;
-- Waypoins
DELETE FROM creature_movement WHERE id IN (178, 591, 593, 594, 598, 599, 651, 654, 656, 657, 686, 695, 715);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(178, 1, -14442.4, 414.102, 25.0155, 0, 0, 0, 0, 0),
(178, 2, -14445.7, 412.951, 25.0162, 0, 0, 0, 0, 0),
(178, 3, -14455, 423.15, 25.0954, 0, 0, 0, 0, 0),
(178, 4, -14461.4, 430.758, 25.2104, 0, 0, 0, 0, 0),
(178, 5, -14468.4, 441.477, 30.2791, 0, 0, 0, 0, 0),
(178, 6, -14471.2, 446.957, 30.544, 0, 0, 0, 0, 0),
(178, 7, -14472.9, 454.424, 30.4841, 0, 0, 0, 0, 0),
(178, 8, -14472.3, 461.029, 30.6343, 0, 0, 0, 0, 0),
(178, 9, -14479.2, 463.782, 30.7789, 0, 0, 0, 0, 0),
(178, 10, -14482.8, 467.095, 31.5195, 0, 0, 0, 0, 0),
(178, 11, -14479.2, 472.917, 31.5351, 0, 0, 0, 0, 0),
(178, 12, -14482.5, 467.054, 31.6192, 0, 0, 0, 0, 0),
(178, 13, -14479, 463.804, 30.8692, 0, 0, 0, 0, 0),
(178, 14, -14472, 461.054, 30.8692, 0, 0, 0, 0, 0),
(178, 15, -14472.5, 454.304, 30.6192, 0, 0, 0, 0, 0),
(178, 16, -14471, 447.304, 30.6192, 0, 0, 0, 0, 0),
(178, 17, -14468.3, 441.804, 30.3692, 0, 0, 0, 0, 0),
(178, 18, -14461.3, 431.054, 25.6192, 0, 0, 0, 0, 0),
(178, 19, -14454.8, 423.304, 25.6192, 0, 0, 0, 0, 0),
(178, 20, -14445.8, 413.304, 25.3692, 0, 0, 0, 0, 0),
(178, 21, -14442.3, 414.304, 25.3692, 0, 0, 0, 0, 0),
(178, 22, -14424.3, 424.192, 21.7033, 0, 0, 0, 0, 0),
(591, 1, -14444.9, 445.531, 20.4134, 0, 0, 0, 0, 0),
(591, 2, -14441.3, 438.778, 20.4903, 0, 0, 0, 0, 0),
(591, 3, -14440.8, 432.276, 20.3793, 0, 0, 0, 0, 0),
(591, 4, -14435.4, 430.078, 20.2879, 0, 0, 0, 0, 0),
(591, 5, -14433.8, 427.503, 20.2863, 0, 0, 0, 0, 0),
(591, 6, -14440.7, 422.971, 15.5599, 0, 0, 0, 0, 0),
(591, 7, -14442.9, 426.732, 15.5587, 0, 0, 0, 0, 0),
(591, 8, -14438.8, 432.066, 15.5848, 0, 0, 0, 0, 0),
(591, 9, -14434.1, 432.398, 15.5545, 0, 0, 0, 0, 0),
(591, 10, -14431.3, 428.801, 15.5621, 0, 0, 0, 0, 0),
(591, 11, -14439.6, 423.793, 9.06026, 0, 0, 0, 0, 0),
(591, 12, -14441.4, 425.5, 9.06026, 0, 0, 0, 0, 0),
(591, 13, -14443.9, 430.25, 4.18761, 0, 0, 0, 0, 0),
(591, 14, -14438.3, 434.884, 4.19606, 0, 0, 0, 0, 0),
(591, 15, -14439.3, 437.73, 4.19911, 0, 0, 0, 0, 0),
(591, 16, -14444.7, 430.757, 4.18845, 0, 0, 0, 0, 0),
(591, 17, -14441.4, 425.5, 9.06026, 0, 0, 0, 0, 0),
(591, 18, -14431.3, 428.801, 15.5621, 0, 0, 0, 0, 0),
(591, 19, -14434.1, 432.398, 15.5545, 0, 0, 0, 0, 0),
(591, 20, -14438.8, 432.066, 15.5848, 0, 0, 0, 0, 0),
(591, 21, -14442.9, 426.732, 15.5587, 0, 0, 0, 0, 0),
(591, 22, -14440.7, 422.971, 15.5599, 0, 0, 0, 0, 0),
(591, 23, -14433.8, 427.503, 20.2863, 0, 0, 0, 0, 0),
(591, 24, -14435.4, 430.078, 20.2879, 0, 0, 0, 0, 0),
(591, 25, -14440.6, 432.196, 20.3668, 0, 0, 0, 0, 0),
(591, 26, -14441.3, 438.778, 20.4903, 0, 0, 0, 0, 0),
(591, 27, -14444.9, 445.531, 20.4134, 0, 0, 0, 0, 0),
(591, 28, -14449.4, 451.391, 20.4759, 0, 0, 0, 0, 0),
(593, 1, -14265.8, 348.704, 31.1595, 0, 0, 0, 0, 0),
(593, 2, -14271, 353.64, 32.7479, 0, 0, 0, 0, 0),
(593, 3, -14276.1, 364.71, 33.6137, 0, 0, 0, 0, 0),
(593, 4, -14277.9, 380.406, 35.3847, 0, 0, 0, 0, 0),
(593, 5, -14274.2, 395.879, 37.1044, 0, 0, 0, 0, 0),
(593, 6, -14271.1, 404.903, 36.8936, 0, 0, 0, 0, 0),
(593, 7, -14269.9, 416.31, 36.7034, 0, 0, 0, 0, 0),
(593, 8, -14274.9, 426.285, 35.3947, 0, 0, 0, 0, 0),
(593, 9, -14287, 434.52, 33.2376, 0, 0, 0, 0, 0),
(593, 10, -14274.9, 426.285, 35.3947, 0, 0, 0, 0, 0),
(593, 11, -14269.9, 416.31, 36.7034, 0, 0, 0, 0, 0),
(593, 12, -14271, 405.088, 36.9146, 0, 0, 0, 0, 0),
(593, 13, -14274.2, 395.879, 37.1044, 0, 0, 0, 0, 0),
(593, 14, -14277.9, 380.406, 35.3847, 0, 0, 0, 0, 0),
(593, 15, -14276.1, 364.71, 33.6137, 0, 0, 0, 0, 0),
(593, 16, -14271, 353.64, 32.7479, 0, 0, 0, 0, 0),
(593, 17, -14265.8, 348.704, 31.1595, 0, 0, 0, 0, 0),
(593, 18, -14257, 339.076, 27.2743, 0, 0, 0, 0, 0),
(594, 1, -14287, 428.87, 33.7043, 0, 0, 0, 0, 0),
(594, 2, -14280.9, 424.514, 35.3712, 0, 0, 0, 0, 0),
(594, 3, -14277.2, 419.943, 36.423, 0, 0, 0, 0, 0),
(594, 4, -14275.8, 411.91, 37.235, 0, 0, 0, 0, 0),
(594, 5, -14276.6, 402.768, 37.0483, 0, 0, 0, 0, 0),
(594, 6, -14279, 390.305, 36.3309, 0, 0, 0, 0, 0),
(594, 7, -14281.4, 379.503, 35.133, 0, 0, 0, 0, 0),
(594, 8, -14279.8, 368.264, 33.6549, 0, 0, 0, 0, 0),
(594, 9, -14277.5, 359.923, 33.2561, 0, 0, 0, 0, 0),
(594, 10, -14273.1, 350.615, 32.7842, 0, 0, 0, 0, 0),
(594, 11, -14268.5, 346.023, 31.3686, 0, 0, 0, 0, 0),
(594, 12, -14273.1, 350.615, 32.7842, 0, 0, 0, 0, 0),
(594, 13, -14277.5, 359.923, 33.2561, 0, 0, 0, 0, 0),
(594, 14, -14279.8, 368.264, 33.6549, 0, 0, 0, 0, 0),
(594, 15, -14281.4, 379.503, 35.133, 0, 0, 0, 0, 0),
(594, 16, -14279, 390.305, 36.3309, 0, 0, 0, 0, 0),
(594, 17, -14276.6, 402.703, 37.0651, 0, 0, 0, 0, 0),
(594, 18, -14275.8, 411.91, 37.235, 0, 0, 0, 0, 0),
(594, 19, -14277.2, 419.943, 36.423, 0, 0, 0, 0, 0),
(594, 20, -14280.9, 424.514, 35.3712, 0, 0, 0, 0, 0),
(594, 21, -14287, 428.87, 33.7043, 0, 0, 0, 0, 0),
(594, 22, -14298, 435.509, 31.579, 0, 0, 0, 0, 0),
(598, 1, -14392.1, 420.434, 7.54837, 0, 0, 0, 0, 0),
(598, 2, -14385.4, 425.173, 7.36117, 0, 0, 0, 0, 0),
(598, 3, -14373.1, 430.034, 7.31295, 0, 0, 0, 0, 0),
(598, 4, -14360.3, 433.72, 7.36588, 0, 0, 0, 0, 0),
(598, 5, -14344.8, 443.056, 7.4693, 0, 0, 0, 0, 0),
(598, 6, -14337.3, 451.978, 7.67435, 0, 0, 0, 0, 0),
(598, 7, -14327.3, 466.137, 8.1809, 0, 0, 0, 0, 0),
(598, 8, -14317.2, 485.579, 8.59669, 0, 0, 0, 0, 0),
(598, 9, -14308.3, 506.756, 8.64147, 0, 0, 0, 0, 0),
(598, 10, -14294.1, 534.231, 8.6887, 0, 0, 0, 0, 0),
(598, 11, -14286.1, 552.673, 8.70584, 0, 0, 0, 0, 0),
(598, 12, -14294.1, 534.231, 8.6887, 0, 0, 0, 0, 0),
(598, 13, -14308.3, 506.756, 8.64147, 0, 0, 0, 0, 0),
(598, 14, -14317.2, 485.579, 8.59669, 0, 0, 0, 0, 0),
(598, 15, -14327.3, 466.137, 8.1809, 0, 0, 0, 0, 0),
(598, 16, -14337.3, 451.978, 7.67435, 0, 0, 0, 0, 0),
(598, 17, -14344.8, 443.056, 7.4693, 0, 0, 0, 0, 0),
(598, 18, -14360.3, 433.72, 7.36588, 0, 0, 0, 0, 0),
(598, 19, -14373.1, 430.034, 7.31295, 0, 0, 0, 0, 0),
(598, 20, -14385.4, 425.173, 7.36117, 0, 0, 0, 0, 0),
(598, 21, -14392.1, 420.434, 7.54837, 0, 0, 0, 0, 0),
(598, 22, -14400, 412.727, 7.77239, 0, 0, 0, 0, 0),
(599, 1, -14318.6, 455.081, 23.4482, 0, 0, 0, 0, 0),
(599, 2, -14314.7, 468.257, 18.4367, 0, 0, 0, 0, 0),
(599, 3, -14314.7, 474.267, 18.3547, 0, 0, 0, 0, 0),
(599, 4, -14307.9, 487.469, 13.2721, 0, 0, 0, 0, 0),
(599, 5, -14301.7, 497.471, 10.601, 0, 0, 0, 0, 0),
(599, 6, -14298.1, 505.389, 8.96902, 0, 0, 0, 0, 0),
(599, 7, -14301.7, 509.774, 8.6758, 0, 0, 0, 0, 0),
(599, 8, -14307.6, 504.115, 8.64554, 0, 0, 0, 0, 0),
(599, 9, -14309.8, 498.715, 8.6345, 0, 0, 0, 0, 0),
(599, 10, -14313.3, 490.275, 8.6164, 0, 0, 0, 0, 0),
(599, 11, -14317.3, 482.241, 8.59652, 0, 0, 0, 0, 0),
(599, 12, -14323, 471.202, 8.39456, 0, 0, 0, 0, 0),
(599, 13, -14330, 457.738, 7.90804, 0, 0, 0, 0, 0),
(599, 14, -14341.2, 443.758, 7.48909, 0, 0, 0, 0, 0),
(599, 15, -14353.5, 435.965, 7.38517, 0, 0, 0, 0, 0),
(599, 16, -14369, 429.004, 7.37672, 0, 0, 0, 0, 0),
(599, 17, -14382.4, 424.817, 7.3554, 0, 0, 0, 0, 0),
(599, 18, -14394.1, 421.125, 7.63872, 0, 0, 0, 0, 0),
(599, 19, -14405.2, 422.36, 8.48729, 0, 0, 0, 0, 0),
(599, 20, -14412.8, 428.759, 8.93994, 0, 0, 0, 0, 0),
(599, 21, -14420.9, 435.219, 9.53649, 0, 0, 0, 0, 0),
(599, 22, -14425.8, 441.807, 12.1688, 0, 0, 0, 0, 0),
(599, 23, -14429.8, 447.25, 15.4427, 0, 0, 0, 0, 0),
(599, 24, -14431.9, 447.814, 15.4255, 0, 0, 0, 0, 0),
(599, 25, -14432.5, 445.842, 15.4692, 0, 0, 0, 0, 0),
(599, 26, -14426.6, 438.212, 18.0541, 0, 0, 0, 0, 0),
(599, 27, -14422.9, 432.659, 21.3357, 0, 0, 0, 0, 0),
(599, 28, -14419.3, 428.27, 22.0601, 0, 0, 0, 0, 0),
(599, 29, -14415.8, 424.096, 22.1281, 0, 0, 0, 0, 0),
(599, 30, -14394.2, 414.212, 22.6782, 0, 0, 0, 0, 0),
(599, 31, -14392.2, 409.483, 22.7452, 0, 0, 0, 0, 0),
(599, 32, -14392.5, 402.863, 22.712, 0, 0, 0, 0, 0),
(599, 33, -14387.6, 390.908, 22.9852, 0, 0, 0, 0, 0),
(599, 34, -14382, 384.972, 23.2067, 0, 0, 0, 0, 0),
(599, 35, -14375, 380.035, 23.1574, 0, 0, 0, 0, 0),
(599, 36, -14365.2, 378.422, 23.3867, 0, 0, 0, 0, 0),
(599, 37, -14355.3, 380.67, 23.3598, 0, 0, 0, 0, 0),
(599, 38, -14342.3, 385.995, 23.4673, 0, 0, 0, 0, 0),
(599, 39, -14326.5, 392.474, 23.8077, 0, 0, 0, 0, 0),
(599, 40, -14320, 399.283, 24.0117, 0, 0, 0, 0, 0),
(599, 41, -14315, 416.881, 23.6653, 0, 0, 0, 0, 0),
(599, 42, -14313.4, 427.522, 23.1797, 0, 0, 0, 0, 0),
(599, 43, -14314.8, 435.38, 22.9005, 0, 0, 0, 0, 0),
(599, 44, -14316.6, 447.09, 23.2387, 0, 0, 0, 0, 0),
(651, 1, -14466.6, 453.068, 15.3329, 0, 0, 0, 0, 0),
(651, 2, -14467, 449.978, 15.4687, 0, 0, 0, 0, 0),
(651, 3, -14463.1, 446.736, 15.4737, 0, 0, 0, 0, 0),
(651, 4, -14454.3, 434.906, 15.1878, 0, 0, 0, 0, 0),
(651, 5, -14442.7, 415.397, 15.0957, 0, 0, 0, 0, 0),
(651, 6, -14453.6, 434.036, 15.1696, 0, 0, 0, 0, 0),
(651, 7, -14437.8, 449.306, 15.3789, 0, 0, 0, 0, 0),
(651, 8, -14449.8, 463.889, 15.3359, 0, 0, 0, 0, 0),
(654, 1, -14425.3, 424.265, 8.99519, 0, 0, 0, 0, 0),
(654, 2, -14423.7, 428.519, 8.96744, 0, 0, 0, 0, 0),
(654, 3, -14428.8, 437.855, 6.48981, 0, 0, 0, 0, 0),
(654, 4, -14436.4, 449.562, 3.69352, 0, 0, 0, 0, 0),
(654, 5, -14445.5, 463.716, 3.84649, 0, 0, 0, 0, 0),
(654, 6, -14436.9, 448.047, 3.69427, 0, 0, 0, 0, 0),
(654, 7, -14448.3, 439.089, 3.86408, 0, 0, 0, 0, 0),
(654, 8, -14436.9, 448.047, 3.69427, 0, 0, 0, 0, 0),
(654, 9, -14445.5, 463.716, 3.84649, 0, 0, 0, 0, 0),
(654, 10, -14436.4, 449.562, 3.69352, 0, 0, 0, 0, 0),
(654, 11, -14428.8, 437.855, 6.48981, 0, 0, 0, 0, 0),
(654, 12, -14423.7, 428.519, 8.96744, 0, 0, 0, 0, 0),
(654, 13, -14425.3, 424.265, 8.99519, 0, 0, 0, 0, 0),
(654, 14, -14434.6, 416.965, 8.75356, 0, 0, 0, 0, 0),
(656, 1, -14439.1, 495.388, 13.4074, 0, 0, 0, 0, 0),
(656, 2, -14447.8, 482.138, 15.1096, 0, 0, 0, 0, 0),
(656, 3, -14442.6, 462.937, 15.3824, 0, 0, 0, 0, 0),
(656, 4, -14435.3, 448.752, 15.3969, 0, 0, 0, 0, 0),
(656, 5, -14424.8, 444.452, 12.9438, 0, 0, 0, 0, 0),
(656, 6, -14417.7, 434.207, 8.95462, 0, 0, 0, 0, 0),
(656, 7, -14409.2, 423.573, 8.68512, 0, 0, 0, 0, 0),
(656, 8, -14396.8, 416.179, 7.87222, 0, 0, 0, 0, 0),
(656, 9, -14393.1, 406.336, 6.71033, 0, 0, 0, 0, 0),
(656, 10, -14396.8, 416.179, 7.87222, 0, 0, 0, 0, 0),
(656, 11, -14409.2, 423.573, 8.68512, 0, 0, 0, 0, 0),
(656, 12, -14417.7, 434.166, 8.93865, 0, 0, 0, 0, 0),
(656, 13, -14424.8, 444.452, 12.9438, 0, 0, 0, 0, 0),
(656, 14, -14435.3, 448.752, 15.3969, 0, 0, 0, 0, 0),
(656, 15, -14442.6, 462.937, 15.3824, 0, 0, 0, 0, 0),
(656, 16, -14447.8, 482.138, 15.1096, 0, 0, 0, 0, 0),
(656, 17, -14439.1, 495.388, 13.4074, 0, 0, 0, 0, 0),
(656, 18, -14431.2, 512.273, 5.49217, 0, 0, 0, 0, 0),
(657, 1, -14312.8, 483.192, 14.819, 0, 0, 0, 0, 0),
(657, 2, -14317.7, 466.225, 19.1429, 0, 0, 0, 0, 0),
(657, 3, -14323.2, 444.298, 22.747, 0, 0, 0, 0, 0),
(657, 4, -14316.2, 432.447, 22.7259, 0, 0, 0, 0, 0),
(657, 5, -14319, 417.219, 23.4741, 0, 0, 0, 0, 0),
(657, 6, -14322.2, 399.648, 24.0779, 0, 0, 0, 0, 0),
(657, 7, -14334.9, 395.419, 23.3598, 0, 0, 0, 0, 0),
(657, 8, -14343.8, 390.811, 23.2622, 0, 0, 0, 0, 0),
(657, 9, -14363.4, 383.449, 23.4848, 0, 0, 0, 0, 0),
(657, 10, -14375.8, 383.213, 22.6782, 0, 0, 0, 0, 0),
(657, 11, -14390.6, 399.044, 22.8109, 0, 0, 0, 0, 0),
(657, 12, -14375.8, 383.213, 22.6782, 0, 0, 0, 0, 0),
(657, 13, -14363.4, 383.449, 23.4848, 0, 0, 0, 0, 0),
(657, 14, -14343.8, 390.811, 23.2622, 0, 0, 0, 0, 0),
(657, 15, -14334.9, 395.419, 23.3598, 0, 0, 0, 0, 0),
(657, 16, -14322.2, 399.648, 24.0779, 0, 0, 0, 0, 0),
(657, 17, -14319, 417.219, 23.4741, 0, 0, 0, 0, 0),
(657, 18, -14316.2, 432.447, 22.7259, 0, 0, 0, 0, 0),
(657, 19, -14323.2, 444.298, 22.747, 0, 0, 0, 0, 0),
(657, 20, -14317.7, 466.225, 19.1429, 0, 0, 0, 0, 0),
(657, 21, -14312.8, 483.192, 14.819, 0, 0, 0, 0, 0),
(657, 22, -14299.8, 503.744, 9.08229, 0, 0, 0, 0, 0),
(686, 1, -14313, 501.729, 8.61711, 0, 0, 0, 0, 0),
(686, 2, -14318.6, 485.781, 8.58937, 0, 0, 0, 0, 0),
(686, 3, -14326.1, 472.565, 8.3757, 0, 0, 0, 0, 0),
(686, 4, -14333.1, 460.482, 7.92616, 0, 0, 0, 0, 0),
(686, 5, -14341.3, 449.143, 7.56401, 0, 0, 0, 0, 0),
(686, 6, -14352.6, 440.766, 7.4209, 0, 0, 0, 0, 0),
(686, 7, -14361.9, 436.575, 7.37137, 0, 0, 0, 0, 0),
(686, 8, -14376.2, 431.316, 7.31533, 0, 0, 0, 0, 0),
(686, 9, -14361.9, 436.575, 7.37137, 0, 0, 0, 0, 0),
(686, 10, -14352.6, 440.766, 7.4209, 0, 0, 0, 0, 0),
(686, 11, -14341.3, 449.143, 7.56401, 0, 0, 0, 0, 0),
(686, 12, -14333.1, 460.482, 7.92616, 0, 0, 0, 0, 0),
(686, 13, -14326.1, 472.565, 8.3757, 0, 0, 0, 0, 0),
(686, 14, -14318.6, 485.781, 8.58937, 0, 0, 0, 0, 0),
(686, 15, -14313, 501.729, 8.61711, 0, 0, 0, 0, 0),
(686, 16, -14301.7, 513.679, 8.67555, 0, 0, 0, 0, 0),
(695, 1, -14465.5, 479.746, 26.8295, 0, 0, 0, 0, 0),
(695, 2, -14466.8, 471.284, 30.7113, 0, 0, 0, 0, 0),
(695, 3, -14469.5, 462.674, 30.6577, 0, 0, 0, 0, 0),
(695, 4, -14472.3, 454.081, 30.4917, 0, 0, 0, 0, 0),
(695, 5, -14470.2, 446.919, 30.5566, 0, 0, 0, 0, 0),
(695, 6, -14474.8, 441.263, 30.705, 0, 0, 0, 0, 0),
(695, 7, -14474.5, 434.851, 33.2027, 0, 0, 0, 0, 0),
(695, 8, -14473.8, 431.647, 34.314, 0, 0, 0, 0, 0),
(695, 9, -14478.6, 428.314, 34.249, 0, 0, 0, 0, 0),
(695, 10, -14473.8, 431.647, 34.314, 0, 0, 0, 0, 0),
(695, 11, -14474.5, 434.851, 33.2027, 0, 0, 0, 0, 0),
(695, 12, -14474.8, 441.263, 30.705, 0, 0, 0, 0, 0),
(695, 13, -14470.2, 446.919, 30.5566, 0, 0, 0, 0, 0),
(695, 14, -14472.3, 454.081, 30.4917, 0, 0, 0, 0, 0),
(695, 15, -14469.5, 462.674, 30.6577, 0, 0, 0, 0, 0),
(695, 16, -14467, 470.439, 30.7043, 0, 0, 0, 0, 0),
(695, 17, -14465.5, 479.746, 26.8295, 0, 0, 0, 0, 0),
(695, 18, -14474, 487.33, 26.7089, 0, 0, 0, 0, 0),
(715, 1, -14443.3, 410.566, 25.0075, 0, 0, 0, 0, 0),
(715, 2, -14457.4, 426.895, 25.1528, 0, 0, 0, 0, 0),
(715, 3, -14466.7, 441.322, 29.8059, 0, 0, 0, 0, 0),
(715, 4, -14455.6, 425.828, 25.131, 0, 0, 0, 0, 0),
(715, 5, -14443.5, 432.869, 20.2956, 0, 0, 0, 0, 0),
(715, 6, -14455.6, 425.828, 25.131, 0, 0, 0, 0, 0),
(715, 7, -14466.7, 441.322, 29.8059, 0, 0, 0, 0, 0),
(715, 8, -14457.4, 426.895, 25.1528, 0, 0, 0, 0, 0),
(715, 9, -14443.3, 410.566, 25.0075, 0, 0, 0, 0, 0),
(715, 10, -14437.1, 398.968, 31.7248, 0, 0, 0, 0, 0);
-- q.4265 'Freed from the Hive'
DELETE FROM dbscripts_on_quest_start WHERE id = 4265;
INSERT INTO dbscripts_on_quest_start (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(4265,2,10,9546,18000,0,0,0,0,0,0,0,-5323.15,431.758,12.1273,3.34124,''),
(4265,3,0,0,0,9546,20,7,2000000519,0,0,0,0,0,0,0,''),
(4265,7,0,0,0,9546,20,7,2000000520,0,0,0,0,0,0,0,''),
(4265,13,1,2,0,9546,20,7,0,0,0,0,0,0,0,0,''),
(4265,14,7,4265,0,0,0,0,0,0,0,0,0,0,0,0,'');
UPDATE quest_template SET StartScript = 4265 WHERE entry = 4265;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000519 AND 2000000520;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000519,'Oh man, I thought I was dead for sure. Ugh... Still dizzy...',0,0,0,462,NULL),
(2000000520,'I can get back to Stronghold on my own, I think. Now that you bought me some time, I should be able to stealth out of here. Who ever you are... thank you. May Elune bless you always!',0,0,0,1,NULL);
-- q.4129 'The Knife Revealed'
DELETE FROM dbscripts_on_quest_end WHERE id = 4129;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(4129,0,29,131,2,0,0,0,0,0,0,0,0,0,0,0,'npcFlags removed'),
(4129,2,0,0,0,0,0,0,2000000521,0,0,0,0,0,0,0,''),
(4129,3,15,15050,0,0,0,0,0,0,0,0,0,0,0,0,''),
(4129,10,0,0,0,0,0,0,2000000522,0,0,0,0,0,0,0,''),
(4129,12,29,131,1,0,0,0,0,0,0,0,0,0,0,0,'npcFlags added');
UPDATE quest_template SET CompleteScript = 4129 WHERE entry = 4129;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000521 AND 2000000522;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000521,'I will need to focus my energies onto this knife. By doing so, I should catch some of the stronger psychic impressions associated with it.',0,0,0,0,NULL),
(2000000522,'I... I\'ve seen enough I think... so very draining...',0,0,0,462,NULL);

-- Quintis Jonespyre
-- temp. solution (we need to find gossipID)
DELETE FROM npc_gossip WHERE npc_guid = 51258;
INSERT INTO npc_gossip (npc_guid, textid) VALUES
(51258, 2575);

-- NPC Quintis Jonespyre (7879)
-- Repeatable quest 'Morrowgrain to Feathermoon Stronghold' (3792) must be available after 'The Mystery of Morrowgrain'(3791)
UPDATE quest_template SET PrevQuestId = 3791 WHERE entry = 3792;
-- q.2943 'Return to Troyas'
DELETE FROM dbscripts_on_quest_end WHERE id = 2943;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2943,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npcFlags removed'),
(2943,1,0,0,0,0,0,0,2000000523,0,0,0,0,0,0,0,''),
(2943,2,3,0,0,0,0,0,0,0,0,0,-4476.23,3230.55,13.7301,4.20931,''),
(2943,4,3,0,0,0,0,0,0,0,0,0,0,0,0,4.99471,''),
(2943,5,0,0,0,0,0,0x02,2000000524,0,0,0,0,0,0,0,''),
(2943,10,0,0,0,0,0,0,2000000525,0,0,0,0,0,0,0,''),
(2943,12,3,0,0,0,0,0,0,0,0,0,-4474.9,3232.88,13.7295,0.951991,''),
(2943,14,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'npcFlags added');
UPDATE quest_template SET CompleteScript = 2943 WHERE entry = 2943;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000523 AND 2000000525;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000523,'A History... Hmmmm... Let me examine this for a moment.',0,0,0,0,NULL),
(2000000524,'%s skims the pages of the book.',0,2,0,0,NULL),
(2000000525,'Amazing! I think I have found it, $N.',0,0,0,0,NULL);
-- q.3463 'Set Them Ablaze!'
DELETE FROM dbscripts_on_quest_end WHERE id = 3463;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3463,1,31,8479,100,0,0,0,0,0,0,0,0,0,0,0,'search for Kalaran Windblade'),
(3463,2,18,0,0,8479,5921,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(3463,3,10,8480,54000,0,0,0,0,0,0,0,-6679.93,-1194.36,240.297,2.96706,'summon Kalaran the Deceiver');
UPDATE quest_template SET CompleteScript = 3463 WHERE entry = 3463;

-- Kalaran Windblade
UPDATE creature SET spawntimesecs = 120 WHERE id = 8479;

-- Kalaran the Deceiver
UPDATE creature_template SET MovementType = 2 WHERE entry = 8480;
DELETE FROM creature_movement_template WHERE entry = 8480;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(8480, 1, -6679.93,-1194.36,240.297,45000,848001,2.96706,0,0),
(8480, 2, -6879.3,-1187.34,253.384,0,0,3.10877,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 848001;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(848001,1,21,1,0,0,0,0x04,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - active'),
(848001,1,0,0,0,0,0,0,2000000526,0,0,0,0,0,0,0,''),
(848001,3,0,0,0,0,0,0,2000000527,0,0,0,0,0,0,0,''),
(848001,7,0,0,0,0,0,0,2000000528,0,0,0,0,0,0,0,''),
(848001,13,0,0,0,8509,20,7,2000000529,0,0,0,0,0,0,0,''),
(848001,15,3,0,0,0,0,0,0,0,0,0,0,0,0,4.65994,''),
(848001,18,0,0,0,0,0,0,2000000530,0,0,0,0,0,0,0,''),
(848001,22,0,0,0,0,0,0,2000000531,0,0,0,0,0,0,0,''),
(848001,27,0,0,0,0,0,0,2000000532,0,0,0,0,0,0,0,''),
(848001,32,0,0,0,8509,20,7,2000000533,0,0,0,0,0,0,0,''),
(848001,35,0,0,0,0,0,0,2000000534,0,0,0,0,0,0,0,''),
(848001,38,0,0,0,0,0,0,2000000535,0,0,0,0,0,0,0,''),
(848001,41,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(848001,44,0,0,0,0,0,0,2000000536,0,0,0,0,0,0,0,''),
(848001,48,21,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'Kalaran the Deceiver - unactive');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000526 AND 2000000536;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000526,'Glorious, indeed, Maltrake. It looks as if my plan worked perfectly. Wouldn\'t you say so, mortal?',0,0,0,0,NULL),
(2000000527,'%s lets loose a reptilian laugh... at least you think it\'s a laugh.',0,2,0,0,NULL),
(2000000528,'You would not have helped the legion of Blackrock had we just asked for your assistance, now would you?',0,0,0,0,NULL),
(2000000529,'What will we do with them, master? They are of no use to us anymore.',0,0,0,1,NULL),
(2000000530,'SILENCE FOOL!',0,0,0,0,NULL),
(2000000531,'They will live of only to see the fruits of their labor: the destruction and chaos that will surely ensue as the legion of Blackrock invade the gorge.',0,0,0,0,NULL),
(2000000532,'I leave you now, mortals. Alive and with these trinkets. Maltrake! Present them with the trinkets!',0,0,0,0,NULL),
(2000000533,'Right away, master!',0,0,0,0,NULL),
(2000000534,'%s begins to flap his massive wings faster. He is preparing for flight.',0,2,0,0,NULL),
(2000000535,'Oh yes, the molt - do not lose it. There are those of my kin in the Burning Steppes that would craft items that only the molt of the black dragonflight could fortify.',0,0,0,0,NULL),
(2000000536,'The legion of Blackrock comes, dwarflings! We shall scorch the earth and set fire to the heavens. None shall survive...',0,1,0,0,NULL);
-- q.1059 'Reclaiming the Charred Vale 2'
DELETE FROM dbscripts_on_quest_end WHERE id = 1059;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1059,0,29,2,2,0,0,0,0,0,0,0,0,0,0,0,'npcFlags removed'),
(1059,1,0,0,0,0,0,0,2000000537,0,0,0,0,0,0,0,''),
(1059,2,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:iwaypoints');
UPDATE quest_template SET CompleteScript = 1059 WHERE entry = 1059;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000537 AND 2000000539;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000537, 'We must hurry.', 0, 0, 0, 1, NULL),
(2000000538, 'Spirits of the forest come forth and heed nature\'s call!', 0, 0, 0, 1, NULL),
(2000000539, 'Spirits of the forest, you are needed! Make haste to the Charred Vale!', 0, 0, 0, 25, NULL);

-- Falfindel Waywarder
UPDATE creature SET Spawndist = 0, MovementType = 0 WHERE id = 4048; -- movement will be set by q.
DELETE FROM creature_movement WHERE id = 51337;
UPDATE creature_template SET MovementType = 0 WHERE entry = 4048;
DELETE FROM creature_movement_template WHERE entry = 4048;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(4048, 1, -4524.24, -782.628, -41.5763, 0,0,0,0,0),
(4048, 2, -4520.69, -775.438, -41.0733, 0,0,0,0,0),
(4048, 3, -4514.55, -770.937, -40.0658, 0,0,0,0,0),
(4048, 4, -4503.63, -774.032, -40.224, 0,0,0,0,0),
(4048, 5, -4488.25, -767.98, -36.61, 27000,404801,0,0,0),
(4048, 6, -4499.17, -773.174, -39.449, 0,0,0,0,0),
(4048, 7, -4514.09, -771.136, -40.0971, 0,0,0,0,0),
(4048, 8, -4520.48, -775.049, -41.0191, 0,0,0,0,0),
(4048, 9, -4524.16, -782.978, -41.2406, 0,0,0,0,0),
(4048, 10, -4524.12, -788.099, -41.6929, 0,0,0,0,0),
(4048, 11, -4524.12, -788.099, -41.6929, 3000,404802,5.0091,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 404801 AND 404802;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(404801 ,1, 21,1,0,0,0,0x04,0,0,0,0,0,0,0,0,'Falfindel Waywarder - active'),
(404801, 2, 0, 0, 0, 0, 0, 0, 2000000538, 0, 0, 0, 0, 0, 0, 0, ''),
(404801, 4, 15, 6537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(404801, 6, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4479.45, -768.01, -37.36, 0, ''),
(404801, 7, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4486.55, -769.80, -37.23, 0, ''),
(404801, 8, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4484.95, -767.87, -36.61, 0, ''),
(404801, 9, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4484.90, -770.79, -37.62, 0, ''),
(404801, 10, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4484.07, -765.04, -35.74, 0, ''),
(404801, 11, 10, 4059, 50000, 0, 0, 0, 0, 0, 0, 0, -4485.88, -764.05, -35.19, 0, ''),
(404801, 14, 0, 0, 0, 0, 0, 0, 2000000539, 0, 0, 0, 0, 0, 0, 0, ''),
(404801, 13, 14, 6537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(404802, 1, 20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(404802, 1, 29,2,1,0,0,0,0,0,0,0,0,0,0,0,'npcFlags added'),
(404802 ,2, 21,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'Falfindel Waywarder - unactive');

-- Forest Spirit
UPDATE creature_template SET MovementType = 0 WHERE entry = 4059;
DELETE FROM creature_movement_template WHERE entry = 4059;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(4059, 1, -4484.5, -759, -33.57, 0, 405901, 0, 0, 0),
(4059, 2, -4484.5, -759, -33.57, 0, 0, 0, 0, 0),
(4059, 3, -4483, -755.56, -31.94, 0, 0, 0, 0, 0),
(4059, 4, -4481, -686.51, -14.39, 0, 0, 0, 0, 0),
(4059, 5, -4472, -571.90, 5.91, 40000, 0, 0, 0, 0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 405901;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(405901, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'RUN ON');
-- Torwa Pathfinder
-- new gossip after q. 4289
-- additional menu should be available after q.4290
UPDATE gossip_menu SET condition_id = 1006 WHERE entry = 2188 AND text_id = 2821;
UPDATE gossip_menu_option SET condition_id = 1007 WHERE menu_id = 2188;
DELETE FROM conditions WHERE condition_entry IN (1006, 1007); 
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1006, 8, 4289, 0),
(1007, 8, 4290, 0);
-- q.4321 'Making Sense of It'

-- first: fix start_script
DELETE FROM dbscripts_on_quest_start WHERE id = 4321;
INSERT INTO dbscripts_on_quest_start (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(4321,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npcFlags removed'),
(4321,2,0,0,0,0,0,0,2000000030,0,0,0,0,0,0,0,''),
(4321,5,1,22,0,0,0,0,0,0,0,0,0,0,0,0,''),
(4321,5,7,4321,0,0,0,0,0,0,0,0,0,0,0,0,''),
(4321,6,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'npcFlags added');
UPDATE quest_template SET StartScript = 4321 WHERE entry = 4321;
-- second: missing end_script added 
DELETE FROM dbscripts_on_quest_end WHERE id = 4321;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(4321,1,21,1,0,0,0,0x04,0,0,0,0,0,0,0,0,'J.D. Collie - active'),
(4321,2,9,63180,30,0,0,0,0,0,0,0,-6034.46,-1014.57,-216.735,6.07572,''),
(4321,3,0,0,0,0,0,0,2000000540,0,0,0,0,0,0,0,''),
(4321,3,3,0,0,0,0,0,0,0,0,0,0,0,0,2.36912,''),
(4321,8,0,0,0,0,0,0,2000000541,0,0,0,0,0,0,0,''),
(4321,12,3,0,0,0,0,0,0,0,0,0,0,0,0,0.872665,''),
(4321,12,0,0,0,0,0,0,2000000542,0,0,0,0,0,0,0,''),
(4321,13,21,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'J.D. Collie - unactive');
UPDATE quest_template SET CompleteScript = 4321 WHERE entry = 4321;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000540 AND 2000000542;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000540, 'Now, let\'s see... If I am correct, then... Hmmm...', 0, 0, 0, 4, NULL),
(2000000541, 'Blue plus red... I predict...', 0, 0, 0, 0, NULL),
(2000000542, '$N, that\'s it! I have finally figured it out!', 0, 0, 0, 0, NULL);

-- missing object added - UDB free guid reused
DELETE FROM gameobject WHERE guid = 63180;
INSERT INTO gameobject VALUES ( 63180, 174683, 1, 1,1,-6034.46, -1014.57, -216.735, 6.07572, 0, 0, 0.103548, -0.994624, -30, 255, 1);

-- missing equip added
UPDATE creature_template SET EquipmentTemplateId = 7 WHERE entry = 9117;
-- J.D. Collie <Marshal Expeditions>
-- new gossip after q. 4321
-- additional menus should be available after q.4321

UPDATE gossip_menu SET condition_id = 124 WHERE entry = 2184 AND text_id = 2833;
UPDATE gossip_menu_option SET condition_id = 124 WHERE menu_id = 2184 AND id IN (0,1,2);
UPDATE gossip_menu_option SET action_menu_id = 2202 WHERE menu_id = 2184 AND id = 0; -- eastern
UPDATE gossip_menu_option SET action_menu_id = 2203 WHERE menu_id = 2184 AND id = 1; -- northern
UPDATE gossip_menu_option SET action_menu_id = 2204 WHERE menu_id = 2184 AND id = 2; -- western
-- missing gossips added
DELETE FROM gossip_menu WHERE entry IN (2202,2203,2204,2205); 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(2202, 2834, 0, 0),
(2203, 2836, 0, 0),
(2204, 2837, 0, 0),
(2205, 2838, 0, 0);

DELETE FROM gossip_menu_option WHERE menu_id = 2184 AND ID = 3;            
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(2184,3,0,'I lost my Crystal Pylon User\'s Manual and need another one.',1,1,2205,0,2184,0,0,'',1009);  -- book only if we missing object and only after quest

DELETE FROM conditions WHERE condition_entry IN (1008,1009); 
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1008, 16, 11482, 1),
(1009, -1, 1008, 124);

DELETE FROM dbscripts_on_gossip WHERE id = 2184;
INSERT INTO dbscripts_on_gossip (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2184,1,17,11482,1,0,0,0,0,0,0,0,0,0,0,0,'');
-- Arathandris Silversky
-- still menu_id and text_id for this option
UPDATE gossip_menu_option SET condition_id = 113 WHERE menu_id = 2208 AND id = 1;
-- q.4901 'Guardians of the Altar'

-- Added missing GO 177414 (Gem of Elune), 177415 (Light of Elune), 177416 (Aura of Elune) in Winterspring
DELETE FROM gameobject WHERE guid IN (63182, 63190, 65375, 65883, 65885, 65887, 65903, 65904);
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(63182, 177414, 1, 5514.49, -4917.57, 850.538, 2.3911, 0, 0, 0.930417, 0.366502, -900, 100, 1),
(63190, 177415, 1, 5510.28, -4929.31, 845.214, 1.62064, 0, 0, 0.724507, 0.689267, -600, 255, 1),
(65375, 177415, 1, 5520.35, -4925.22, 843.644, 2.13507, 0, 0, 0.876015, 0.482283, -600, 255, 1),
(65883, 177415, 1, 5526.7, -4916.41, 843.452, 3.01865, 0, 0, 0.998111, 0.0614331, -600, 255, 1),
(65885, 177415, 1, 5501.69, -4920.04, 848.791, 0.155868, 0, 0, 0.0778553, 0.996965, -600, 255, 1),
(65887, 177415, 1, 5505.09, -4909.36, 848.961, 5.63402, 0, 0, 0.318914, -0.947784, -600, 255, 1),
(65903, 177415, 1, 5515.71, -4905.82, 846.322, 4.62478, 0, 0, 0.737392, -0.675466, -600, 255, 1),
(65904, 177416, 1, 5514.49, -4917.57, 845.538, 2.3911, 0, 0, 0.930417, 0.366502, -900, 100, 1);

UPDATE gameobject_template SET size = 8 WHERE entry = 177414;
UPDATE gameobject_template SET size = 0.5 WHERE entry = 177415;
UPDATE gameobject_template SET size = 5 WHERE entry = 177416;
-- Some of objects (q. related) should respawn almost instant after ... despawn. 

-- New Avalon Registry
UPDATE gameobject SET spawntimesecs = 2 WHERE guid = 66384;
-- The Book of Ur
UPDATE gameobject SET spawntimesecs = 2 WHERE guid = 40667;
-- Empty Cauldron
UPDATE gameobject SET spawntimesecs = 2 WHERE guid = 66377;
-- Iron Chain
UPDATE gameobject SET spawntimesecs = 2 WHERE guid = 66378;
-- New Avalon Patrol Schedule
UPDATE gameobject SET spawntimesecs = 2 WHERE guid = 66308;
 -- q.12270 'Shred the Alliance' -- Horde ver.
 -- q.12244 'Shredder Repair' -- Alliance ver.
  
-- player must be able to ride veh only during q.
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27354,27496);
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, quest_start, quest_start_active, quest_end, cast_flags, condition_id) VALUES
(27354, 62309, 12270, 1, 12270, 1, 0),
(27354, 62309, 12244, 1, 12244, 1, 0),
-- available with q. reward key.
(27496, 60944, 0, 0, 0, 1, 1010);

DELETE FROM conditions WHERE condition_entry = 1010;
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1010, 2, 37500, 1);

-- spell must have a target
DELETE FROM spell_script_target WHERE entry = 48610;
INSERT INTO spell_script_target (entry, type, targetEntry, inverseEffectMask) VALUES
(48610, 1, 27354, 0);
-- player must be unboarded from veh. - let's veh to despawn after that.
DELETE FROM dbscripts_on_spell WHERE id = 48610;
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(48610,1,14,62309,0,0,0,0,0,0,0,0,0,0,0,0,''),
(48610,1,18,5,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn');

-- missing object added -- UDB free guids Reused
-- Basecamp
DELETE FROM gameobject WHERE id = 300202;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(65865, 300202, 571, 1, 1, 4379.63, -2917.05, 309.944, 0.910624, 0, 0, 0.439743, 0.898124, 300, 0, 1),
(65866, 300202, 571, 1, 1, 3993.29, -3189.94, 282.416, 3.81135, 0, 0, 0.94445, -0.328654, 300, 0, 1);

-- Updates in Ble Sky Logging Grounds
-- Conquest Hold Skirmisher
DELETE FROM creature WHERE guid IN (102015,102016,101982,102014,102020,102013,102006,101983,102457,102463,102458);
DELETE FROM creature_addon WHERE guid IN (102015,102016,101982,102014,102020,102013,102006,101983,102457,102463,102458);
DELETE FROM creature_movement WHERE id IN (102015,102016,101982,102014,102020,102013,102006,101983,102457,102463,102458);
UPDATE creature SET spawndist = 10, MovementType = 1 WHERE guid IN (102021,101980,102019,101990,102018,102017,101989,101971);
-- Broken-down Shredder
UPDATE creature SET spawntimesecs = 30 WHERE id = 27354;
UPDATE creature_template_spells SET spell1 = 48548, spell2 = 48558, spell3 = 48604, spell4 = 0, spell5 = 48610 WHERE entry = 27354;
UPDATE creature SET position_x = 4156.482, position_y = -2963.999, position_z = 283.8623, orientation = 6.091199 WHERE guid = 116888;
DELETE FROM creature WHERE guid IN (54956,54960);
DELETE FROM creature_addon WHERE guid IN (54956,54960);
DELETE FROM creature_movement WHERE id IN (54956,54960);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(54956,27354,571,1,1,0,0,4183.59,-3014.55,280.193,4.79031,25,0,0,4920,0,0,0),
(54960,27354,571,1,1,0,0,4114.21,-2891.88,279.423,2.76634,25,0,0,4920,0,0,0);
UPDATE creature_template_spells SET spell1 = 0, spell2 = 48984, spell3 = 49063, spell4 = 0, spell5 = 0, spell6 = 49025 WHERE entry = 27496;
-- only 2 available in same time
DELETE FROM pool_template WHERE entry = 25481;
INSERT INTO pool_template (entry, max_limit, description) VALUES 
(25481,2,'Grizzly Hills - Broken-down Shredder');

DELETE FROM pool_creature WHERE pool_entry = 25481;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES 
(54956,25481,0,'Grizzly Hills - Broken-down Shredder - Pool 1'),
(54960,25481,0,'Grizzly Hills - Broken-down Shredder - Pool 2'),
(116887,25481,0,'Grizzly Hills - Broken-down Shredder - Pool 3'),
(116888,25481,0,'Grizzly Hills - Broken-down Shredder - Pool 4');
-- Darrok
UPDATE creature_template SET GossipMenuId = 9528 WHERE entry = 27425;
DELETE FROM gossip_menu WHERE entry = 9528;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(9528, 12838, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 9528;           
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(9528,0,0,'Yes, I am ready to travel to Venture Bay!',1,1,-1,0,9528,0,0,'',0);
DELETE FROM dbscripts_on_gossip WHERE id = 9528;
INSERT INTO dbscripts_on_gossip (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(9528,0,15,48961,0,0,0,0x02,0,0,0,0,0,0,0,0,''),
(9528,1,15,48960,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM spell_target_position WHERE id = 48960;
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES
(48960, 571, 4313.37, -2958.17, 318.463, 1.98);

-- Gordun
UPDATE creature_template SET GossipMenuId = 9531 WHERE entry = 27414;
DELETE FROM gossip_menu WHERE entry = 9531;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(9531, 12845, 0, 0);
DELETE FROM gossip_menu_option WHERE menu_id = 9531;           
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(9531,0,0,'Yes, I am ready to travel to Venture Bay!',1,1,-1,0,9531,0,0,'',0);
DELETE FROM dbscripts_on_gossip WHERE id = 9531;
INSERT INTO dbscripts_on_gossip (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(9531,0,15,48621,0,0,0,0x02,0,0,0,0,0,0,0,0,''),
(9531,1,15,48622,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM spell_target_position WHERE id = 48622;
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES
(48622, 571, 4274.53, -3055.55, 319.463, 2.535);
-- r3130
UPDATE creature_template SET ScriptName='npc_grand_admiral_westwind' WHERE entry=29621;

-- r3131
UPDATE creature_template SET ScriptName='npc_concentrated_bullet' WHERE entry IN (34628,34630);
UPDATE creature_template SET ScriptName='npc_valkyr_stalker' WHERE entry IN (34704,34720);

-- r3135
UPDATE instance_template SET ScriptName='instance_halls_of_reflection' WHERE map=668;

-- r3140
UPDATE creature_template SET ScriptName='npc_bone_spike' WHERE entry IN (36619,38711,38712);
UPDATE creature_template SET ScriptName='npc_coldflame' WHERE entry=36672;-- Classic [1034]
-- Winterspring - Rak'shiri 
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, UnitFlags = 64, SpeedWalk = 1, SpeedRun = (10 / 7), MovementType = 2, MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 10200;
UPDATE creature SET modelid = 0,position_x = 8021.76, position_y = -3946.803, position_z = 687.1479, orientation = 6.225225, MovementType = 2 WHERE id = 10200;
DELETE FROM creature_movement_template WHERE entry = 10200;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(10200,1, 8028.811, -3947.212, 687.1479, 0, 0, 0, 0, 0),
(10200,2, 8037.275, -3942.646, 687.1479, 0, 0, 0, 0, 0),
(10200,3, 8046.581, -3938.139, 687.1479, 0, 0, 0, 0, 0),
(10200,4, 8052.147, -3930.226, 687.1479, 0, 0, 0, 0, 0),
(10200,5, 8053.363, -3919.330, 687.1479, 0, 0, 0, 0, 0),
(10200,6, 8042.460, -3905.253, 687.1479, 0, 0, 0, 0, 0),
(10200,7, 8036.599, -3897.281, 687.1479, 0, 0, 0, 0, 0),
(10200,8, 8026.449, -3889.370, 687.1479, 0, 0, 0, 0, 0),
(10200,9, 8018.806, -3883.733, 687.1479, 0, 0, 0, 0, 0),
(10200,10, 8010.596, -3876.309, 687.1479, 0, 0, 0, 0, 0),
(10200,11, 8000.862, -3872.118, 687.1479, 0, 0, 0, 0, 0),
(10200,12, 7992.011, -3874.467, 687.1479, 0, 0, 0, 0, 0),
(10200,13, 7985.668, -3879.896, 687.1479, 0, 0, 0, 0, 0),
(10200,14, 7980.295, -3887.226, 687.1479, 0, 0, 0, 0, 0),
(10200,15, 7982.961, -3899.094, 687.1479, 0, 0, 0, 0, 0),
(10200,16, 7988.211, -3905.684, 687.1479, 0, 0, 0, 0, 0),
(10200,17, 8000.712, -3905.205, 687.1479, 0, 0, 0, 0, 0),
(10200,18, 8007.098, -3908.700, 687.1479, 0, 0, 0, 0, 0),
(10200,19, 8012.041, -3917.679, 687.1479, 0, 0, 0, 0, 0),
(10200,20, 8013.973, -3929.078, 687.1479, 0, 0, 0, 0, 0),
(10200,21, 8014.293, -3941.990, 687.1479, 0, 0, 0, 0, 0),
(10200,22, 8018.936, -3946.639, 687.1479, 0, 0, 0, 0, 0);

-- Classic [1028]
-- Fixed respawn time of minerals in DM East 
UPDATE gameobject SET spawntimesecs = 40 * 60 WHERE map = 429 AND id = 175404;

-- Classic [1027]
-- Winterspring updates 
-- Added missing WP to creature 10807 (Brumeran) in Winterspring
UPDATE creature_template SET MovementType = 2 WHERE Entry = 10807;
UPDATE creature SET MovementType = 2 WHERE id = 10807;
DELETE FROM creature_movement_template WHERE entry = 10807;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(10807, 1, 5794.21, -4756.73, 776.631, 0, 0, 0, 0, 0),
(10807, 2, 5767.78, -4750.23, 776.266, 0, 0, 0, 0, 0),
(10807, 3, 5741.93, -4739.3, 776.337, 0, 0, 0, 0, 0),
(10807, 4, 5729.39, -4728.64, 776.861, 0, 0, 0, 0, 0),
(10807, 5, 5716.83, -4712.63, 780.549, 0, 0, 0, 0, 0),
(10807, 6, 5701.37, -4690.78, 780.221, 0, 0, 0, 0, 0),
(10807, 7, 5685.64, -4666.45, 775.247, 0, 0, 0, 0, 0),
(10807, 8, 5663.94, -4633.49, 770.941, 0, 0, 0, 0, 0),
(10807, 9, 5652.06, -4612.04, 769.91, 0, 0, 0, 0, 0),
(10807, 10, 5605.16, -4523.35, 761.301, 0, 0, 0, 0, 0),
(10807, 11, 5596.44, -4510.74, 761.037, 0, 0, 0, 0, 0),
(10807, 12, 5578.46, -4501.28, 758.607, 0, 0, 0, 0, 0),
(10807, 13, 5546.2, -4498.32, 757.152, 0, 0, 0, 0, 0),
(10807, 14, 5536.28, -4498.46, 756.273, 0, 0, 0, 0, 0),
(10807, 15, 5548.03, -4498.12, 757.283, 0, 0, 0, 0, 0),
(10807, 16, 5580.57, -4501.62, 758.791, 0, 0, 0, 0, 0),
(10807, 17, 5596.8, -4510.74, 761.013, 0, 0, 0, 0, 0),
(10807, 18, 5607.1, -4525.25, 761.14, 0, 0, 0, 0, 0),
(10807, 19, 5652.85, -4611.9, 769.809, 0, 0, 0, 0, 0),
(10807, 20, 5663.82, -4632.54, 770.918, 0, 0, 0, 0, 0),
(10807, 21, 5688.06, -4666.14, 775.173, 0, 0, 0, 0, 0),
(10807, 22, 5701.32, -4688.96, 779.968, 0, 0, 0, 0, 0),
(10807, 23, 5716.02, -4709.93, 780.711, 0, 0, 0, 0, 0),
(10807, 24, 5732.58, -4729.74, 776.94, 0, 0, 0, 0, 0),
(10807, 25, 5743.5, -4739.83, 776.143, 0, 0, 0, 0, 0),
(10807, 26, 5768.83, -4750.62, 776.265, 0, 0, 0, 0, 0),
(10807, 27, 5791.36, -4756.39, 776.534, 0, 0, 0, 0, 0),
(10807, 28, 5800.65, -4754.66, 775.339, 0, 0, 0, 0, 0),
(10807, 29, 5810.53, -4747.72, 770.679, 0, 0, 0, 0, 0),
(10807, 30, 5825.56, -4722.8, 761.2, 0, 0, 0, 0, 0),
(10807, 31, 5847.45, -4695.13, 756.06, 0, 0, 0, 0, 0),
(10807, 32, 5846.56, -4653.15, 751.855, 0, 0, 0, 0, 0),
(10807, 33, 5852.02, -4626.78, 748.715, 0, 0, 0, 0, 0),
(10807, 34, 5857.67, -4617.24, 746.566, 0, 0, 0, 0, 0),
(10807, 35, 5873.96, -4604.09, 740.28, 0, 0, 0, 0, 0),
(10807, 36, 5906.14, -4580.95, 726.465, 0, 0, 0, 0, 0),
(10807, 37, 5933.6, -4552.5, 719.467, 0, 0, 0, 0, 0),
(10807, 38, 5948.97, -4526.39, 714.178, 0, 0, 0, 0, 0),
(10807, 39, 5966, -4490.83, 706.834, 0, 0, 0, 0, 0),
(10807, 40, 5983.18, -4454.48, 707.231, 0, 0, 0, 0, 0),
(10807, 41, 6004.34, -4417.37, 710.368, 0, 0, 0, 0, 0),
(10807, 42, 6043.83, -4367.21, 715.066, 0, 0, 0, 0, 0),
(10807, 43, 6083.28, -4327.06, 725.178, 0, 0, 0, 0, 0),
(10807, 44, 6120.37, -4306.62, 731.31, 0, 0, 0, 0, 0),
(10807, 45, 6166.59, -4284.45, 744.508, 0, 0, 0, 0, 0),
(10807, 46, 6191.89, -4270.68, 738.337, 0, 0, 0, 0, 0),
(10807, 47, 6245.56, -4242.19, 736.044, 0, 0, 0, 0, 0),
(10807, 48, 6307.77, -4218.71, 722.994, 0, 0, 0, 0, 0),
(10807, 49, 6355.26, -4200.94, 713.745, 0, 0, 0, 0, 0),
(10807, 50, 6392.92, -4182.05, 703.888, 0, 0, 0, 0, 0),
(10807, 51, 6357.57, -4201.57, 713.224, 0, 0, 0, 0, 0),
(10807, 52, 6311.36, -4220.95, 723.374, 0, 0, 0, 0, 0),
(10807, 53, 6246.39, -4244.92, 735.806, 0, 0, 0, 0, 0),
(10807, 54, 6192.39, -4270.93, 738.002, 0, 0, 0, 0, 0),
(10807, 55, 6168.06, -4284.54, 744.458, 0, 0, 0, 0, 0),
(10807, 56, 6124.04, -4304.35, 731.797, 0, 0, 0, 0, 0),
(10807, 57, 6081.23, -4327.11, 724.821, 0, 0, 0, 0, 0),
(10807, 58, 6044.83, -4366.46, 715.08, 0, 0, 0, 0, 0),
(10807, 59, 6007.47, -4413.15, 710.907, 0, 0, 0, 0, 0),
(10807, 60, 5983.53, -4455.11, 707.048, 0, 0, 0, 0, 0),
(10807, 61, 5965.38, -4490.02, 706.943, 0, 0, 0, 0, 0),
(10807, 62, 5948.68, -4526.07, 714.223, 0, 0, 0, 0, 0),
(10807, 63, 5934.61, -4551.4, 719.322, 0, 0, 0, 0, 0),
(10807, 64, 5907.66, -4580.78, 725.546, 0, 0, 0, 0, 0),
(10807, 65, 5873.21, -4606.02, 740.637, 0, 0, 0, 0, 0),
(10807, 66, 5862.26, -4614.75, 744.791, 0, 0, 0, 0, 0),
(10807, 67, 5853.82, -4625.17, 748.087, 0, 0, 0, 0, 0),
(10807, 68, 5845.46, -4654.04, 752.156, 0, 0, 0, 0, 0),
(10807, 69, 5844.74, -4689.32, 755.539, 0, 0, 0, 0, 0),
(10807, 70, 5824.63, -4722.99, 761.315, 0, 0, 0, 0, 0),
(10807, 71, 5809.48, -4746.69, 770.559, 0, 0, 0, 0, 0),
(10807, 72, 5799.53, -4755.23, 775.666, 0, 0, 0, 0, 0);
-- Moved waypoints for Ursius to creature_movement_template table
-- because this NPC is unique 
UPDATE creature_template SET MovementType = 2 WHERE Entry = 10806;
UPDATE creature SET MovementType = 2 WHERE id = 10806;
DELETE FROM creature_movement WHERE id = 41757;
DELETE FROM creature_movement_template WHERE entry = 10806;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(10806, 1, 7392.47, -4863.76, 717.538, 0, 0, 0, 0, 0),
(10806, 2, 7386.98, -4854.89, 717.025, 0, 0, 0, 0, 0),
(10806, 3, 7382.2, -4849.15, 714.358, 0, 0, 0, 0, 0),
(10806, 4, 7377.91, -4843.06, 709.955, 0, 0, 0, 0, 0),
(10806, 5, 7374.17, -4833.31, 707.622, 0, 0, 0, 0, 0),
(10806, 6, 7367.56, -4826.19, 706.673, 0, 0, 0, 0, 0),
(10806, 7, 7356.6, -4819.11, 705.119, 0, 0, 0, 0, 0),
(10806, 8, 7346.57, -4817.34, 704.422, 0, 0, 0, 0, 0),
(10806, 9, 7338.89, -4814.45, 701.118, 0, 0, 0, 0, 0),
(10806, 10, 7332.93, -4808.81, 695.472, 0, 0, 0, 0, 0),
(10806, 11, 7324.25, -4803.01, 694.299, 0, 0, 0, 0, 0),
(10806, 12, 7313.4, -4808.02, 696.404, 0, 0, 0, 0, 0),
(10806, 13, 7304.99, -4811.13, 695.083, 0, 0, 0, 0, 0),
(10806, 14, 7294.66, -4812.62, 688.862, 0, 0, 0, 0, 0),
(10806, 15, 7280.04, -4809.81, 685.032, 0, 0, 0, 0, 0),
(10806, 16, 7267.66, -4804.58, 683.578, 0, 0, 0, 0, 0),
(10806, 17, 7256.03, -4799.48, 684.846, 0, 0, 0, 0, 0),
(10806, 18, 7246.93, -4792.95, 688.579, 0, 0, 0, 0, 0),
(10806, 19, 7233.74, -4783.62, 692.866, 0, 0, 0, 0, 0),
(10806, 20, 7227.48, -4781.13, 699.379, 0, 0, 0, 0, 0),
(10806, 21, 7222.56, -4779.32, 702.658, 0, 0, 0, 0, 0),
(10806, 22, 7214.65, -4774.53, 706.959, 0, 0, 0, 0, 0),
(10806, 23, 7206.99, -4768.56, 715.328, 0, 0, 0, 0, 0),
(10806, 24, 7197.63, -4766.04, 718.111, 0, 0, 0, 0, 0),
(10806, 25, 7187.17, -4766.88, 722.862, 0, 0, 0, 0, 0),
(10806, 26, 7176.04, -4767.88, 726.34, 0, 0, 0, 0, 0),
(10806, 27, 7158.39, -4772.67, 728.308, 0, 0, 0, 0, 0),
(10806, 28, 7146.15, -4775.98, 730.806, 0, 0, 0, 0, 0),
(10806, 29, 7130.09, -4779.49, 732.639, 0, 0, 0, 0, 0),
(10806, 30, 7119.01, -4778.06, 733.071, 0, 0, 0, 0, 0),
(10806, 31, 7107.81, -4778.12, 736.737, 0, 0, 0, 0, 0),
(10806, 32, 7093.41, -4773.02, 740.822, 0, 0, 0, 0, 0),
(10806, 33, 7080.23, -4769.07, 743.451, 0, 0, 0, 0, 0),
(10806, 34, 7063.14, -4761.69, 744.717, 0, 0, 0, 0, 0),
(10806, 35, 7048.81, -4751.61, 741.236, 0, 0, 0, 0, 0),
(10806, 36, 7040.23, -4731.74, 734.484, 0, 0, 0, 0, 0),
(10806, 37, 7033.46, -4721.02, 734.604, 0, 0, 0, 0, 0),
(10806, 38, 7022.16, -4709.08, 735.978, 0, 0, 0, 0, 0),
(10806, 39, 7013.91, -4698.55, 739.685, 0, 0, 0, 0, 0),
(10806, 40, 7009.08, -4688.44, 743.001, 0, 0, 0, 0, 0),
(10806, 41, 7010.87, -4675.89, 746.968, 0, 0, 0, 0, 0),
(10806, 42, 7017.92, -4665.31, 752.719, 0, 0, 0, 0, 0),
(10806, 43, 7020.02, -4651.64, 756.594, 0, 0, 0, 0, 0),
(10806, 44, 7012.05, -4647.55, 755.447, 0, 0, 0, 0, 0),
(10806, 45, 7002.2, -4644.09, 751.775, 0, 0, 0, 0, 0),
(10806, 46, 6993.5, -4640.75, 749.158, 0, 0, 0, 0, 0),
(10806, 47, 6980.03, -4632, 750.785, 0, 0, 0, 0, 0),
(10806, 48, 6976.06, -4642.05, 748.789, 0, 0, 0, 0, 0),
(10806, 49, 6994.9, -4644.68, 749.273, 0, 0, 0, 0, 0),
(10806, 50, 7004.91, -4647.66, 753.137, 0, 0, 0, 0, 0),
(10806, 51, 7013.32, -4650.74, 755.831, 0, 0, 0, 0, 0),
(10806, 52, 7025.52, -4660.47, 755.501, 0, 0, 0, 0, 0),
(10806, 53, 7025.86, -4674.66, 750.418, 0, 0, 0, 0, 0),
(10806, 54, 7024.98, -4684.34, 748.902, 0, 0, 0, 0, 0),
(10806, 55, 7017.76, -4686.15, 747.49, 0, 0, 0, 0, 0),
(10806, 56, 7010.29, -4689.55, 742.97, 0, 0, 0, 0, 0),
(10806, 57, 7012.05, -4702.11, 737.811, 0, 0, 0, 0, 0),
(10806, 58, 7016.5, -4714.78, 735.262, 0, 0, 0, 0, 0),
(10806, 59, 7020.46, -4724.02, 736.569, 0, 0, 0, 0, 0),
(10806, 60, 7027.68, -4739.57, 739.237, 0, 0, 0, 0, 0),
(10806, 61, 7034.47, -4752.03, 742.704, 0, 0, 0, 0, 0),
(10806, 62, 7045.98, -4764.76, 746.637, 0, 0, 0, 0, 0),
(10806, 63, 7058.23, -4774.53, 750.034, 0, 0, 0, 0, 0),
(10806, 64, 7068.01, -4778.17, 749.764, 0, 0, 0, 0, 0),
(10806, 65, 7078.76, -4779.57, 747.332, 0, 0, 0, 0, 0),
(10806, 66, 7092.94, -4779.63, 744.443, 0, 0, 0, 0, 0),
(10806, 67, 7105.6, -4776.52, 737.177, 0, 0, 0, 0, 0),
(10806, 68, 7115.29, -4775.7, 733.084, 0, 0, 0, 0, 0),
(10806, 69, 7130.93, -4776.73, 731.908, 0, 0, 0, 0, 0),
(10806, 70, 7153.58, -4774.45, 729.665, 0, 0, 0, 0, 0),
(10806, 71, 7164.17, -4770.8, 727.533, 0, 0, 0, 0, 0),
(10806, 72, 7174.96, -4761.62, 727.535, 0, 0, 0, 0, 0),
(10806, 73, 7184.6, -4760.66, 724.858, 0, 0, 0, 0, 0),
(10806, 74, 7198.73, -4761.51, 719.09, 0, 0, 0, 0, 0),
(10806, 75, 7212.3, -4758.14, 717.17, 0, 0, 0, 0, 0),
(10806, 76, 7224.75, -4755.78, 710.305, 0, 0, 0, 0, 0),
(10806, 77, 7228.49, -4758.9, 707.014, 0, 0, 0, 0, 0),
(10806, 78, 7223.53, -4769.22, 702.701, 0, 0, 0, 0, 0),
(10806, 79, 7220.49, -4775.61, 703.898, 0, 0, 0, 0, 0),
(10806, 80, 7216.82, -4782.13, 703.347, 0, 0, 0, 0, 0),
(10806, 81, 7213.77, -4789.75, 700.667, 0, 0, 0, 0, 0),
(10806, 82, 7217.39, -4793.82, 697.248, 0, 0, 0, 0, 0),
(10806, 83, 7220, -4797.1, 694.03, 0, 0, 0, 0, 0),
(10806, 84, 7229.3, -4799.91, 690.164, 0, 0, 0, 0, 0),
(10806, 85, 7247.28, -4804.95, 686.025, 0, 0, 0, 0, 0),
(10806, 86, 7270.05, -4806.01, 683.494, 0, 0, 0, 0, 0),
(10806, 87, 7286.59, -4803.12, 683.779, 0, 0, 0, 0, 0),
(10806, 88, 7291.67, -4814.98, 688.04, 0, 0, 0, 0, 0),
(10806, 89, 7297.18, -4814.11, 690.571, 0, 0, 0, 0, 0),
(10806, 90, 7305.28, -4812.83, 695.358, 0, 0, 0, 0, 0),
(10806, 91, 7313.95, -4810.56, 696.792, 0, 0, 0, 0, 0),
(10806, 92, 7316.1, -4815.38, 699.242, 0, 0, 0, 0, 0),
(10806, 93, 7312.7, -4823.64, 702.979, 0, 0, 0, 0, 0),
(10806, 94, 7314.2, -4831.71, 706.757, 0, 0, 0, 0, 0),
(10806, 95, 7318.58, -4832.64, 709.229, 0, 0, 0, 0, 0),
(10806, 96, 7325.25, -4833.66, 715.018, 0, 0, 0, 0, 0),
(10806, 97, 7332.31, -4830.25, 714.763, 0, 0, 0, 0, 0),
(10806, 98, 7342.48, -4825.56, 709.241, 0, 0, 0, 0, 0),
(10806, 99, 7347.32, -4823.64, 707.8, 0, 0, 0, 0, 0),
(10806, 100, 7356.01, -4821.47, 705.914, 0, 0, 0, 0, 0),
(10806, 101, 7367.44, -4826.87, 707.032, 0, 0, 0, 0, 0),
(10806, 102, 7372.68, -4835.88, 709.016, 0, 0, 0, 0, 0),
(10806, 103, 7378.35, -4843.68, 710.309, 0, 0, 0, 0, 0),
(10806, 104, 7382.27, -4850.01, 715.1, 0, 0, 0, 0, 0),
(10806, 105, 7386.34, -4856.25, 717.67, 0, 0, 0, 0, 0);
-- Added missing equipment to NPC 10196 (General Cobaltann) and changed its rank to rare elite
-- Added missing spawns position and added them to a pool
UPDATE creature_template SET Rank = 2, EquipmentTemplateId = 1223 WHERE Entry = 10196;
DELETE FROM creature WHERE guid IN (54961,55052);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(54961, 10196, 1, 1, 1, 0, 0, 6153.17, -4164.74, 797.163, 1.70246, 43200, 5, 0, 8097, 7860, 0, 1),
(55052, 10196, 1, 1, 1, 0, 0, 6189.21, -4553.49, 714.408, 1.57288, 43200, 5, 0, 8097, 7860, 0, 1);
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE id = 10196;
DELETE FROM pool_creature_template WHERE id = 10196;
INSERT INTO pool_creature_template VALUES
(10196, 25482, 0, 'Winterspring - General Cobaltann');
DELETE FROM pool_template WHERE entry = 25482;
INSERT INTO pool_template (entry, max_limit, description) VALUES 
(25482, 1, 'Winterspring - General Cobaltann');

-- Classic [1026]
-- DM:N 
-- Wandering Eye of Kilrogg - new model
-- Wandering Eye of Kilrogg - update move / runspeed
-- Guard Mol'dar, Slip'kik, Fengus - update move / runspeed
UPDATE creature_template SET SpeedWalk = 2 WHERE Entry = 14321;
UPDATE creature_template SET SpeedWalk = 2 WHERE Entry = 14323;
UPDATE creature_template SET SpeedWalk = 2 WHERE Entry = 14326;
UPDATE creature_template SET ModelId1 = 14430, SpeedWalk = (10 / 2.5), SpeedRun = (10 / 7) WHERE Entry = 14386;  

-- Classic [1025]
-- Gravis Slipknot - an alternative model caused this guy to be invisible
UPDATE creature_model_info SET modelid_other_gender = 0 WHERE modelid = 2582;

-- Classic [1024]
-- Added missing equipment to NPC 11141 (Spirit of Trey Lightforge) in Felwood  
UPDATE creature_template SET EquipmentTemplateId = 250 WHERE Entry = 11141;

-- Classic [1022]
-- Crushridge Plunderer are tiny, tiny creatures
UPDATE creature_template SET Scale = 0 WHERE Entry = 2416; 

-- Classic [1021]
-- STV - Stranglethorn Fever
-- Description was given twice, a proper objective should be given instead.
UPDATE quest_template SET Objectives ='Seek out Witch Doctor Unbagwa and have him summon Mokk the Savage. Bring the Heart of Mokk to Fin Fizracket.' WHERE entry = 348;

-- Classic [1020]
-- LBRS - Chamber of Battle
DELETE FROM creature WHERE guid IN (45813, 45814, 45815, 45816, 45817, 45758, 45759, 45812, 45822, 45821, 45820, 45811, 45819, 45760, 45809, 45761, 45810, 45818);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(45813, 9692, 229, 1, 1, 0, 0, -37.5607, -521.641, 87.7160, 3.45575, 7200, 0, 0, 8613, 0, 0, 0),
(45814, 9696, 229, 1, 1, 0, 0, -36.2227, -523.632, 87.4320, 3.56047, 7200, 0, 0, 2784, 0, 0, 0),
(45815, 9583, 229, 1, 1, 0, 0, -53.6383, -442.827, 78.2854, 4.70957, 7200, 0, 0, 8883, 0, 0, 2),
(45816, 9693, 229, 1, 1, 0, 0, -72.4302, -520.961, 82.3316, 3.40339, 7200, 0, 0, 7107, 2369, 0, 0),
(45817, 9268, 229, 1, 1, 0, 0, -77.5619, -516.932, 81.4632, 4.52040, 7200, 0, 0, 8613, 0, 0, 0),
(45758, 9696, 229, 1, 1, 0, 0, -47.1127, -480.153, 77.9991, 2.82743, 7200, 0, 0, 2784, 0, 0, 0),
(45759, 9692, 229, 1, 1, 0, 0, -49.4956, -482.156, 77.9991, 2.37365, 7200, 0, 0, 8613, 0, 0, 0),
(45812, 9696, 229, 1, 1, 0, 0, -51.8879, -483.818, 77.9991, 1.88496, 7200, 0, 0, 2784, 0, 0, 0),
(45822, 9693, 229, 1, 1, 0, 0, -57.4802, -487.082, 77.9991, 3.22886, 7200, 0, 0, 7107, 2369, 0, 0),
(45821, 9583, 229, 1, 1, 0, 0, -58.8099, -481.005, 77.9991, 4.41568, 7200, 0, 0, 8883, 0, 0, 0),
(45820, 9268, 229, 1, 1, 0, 0, -63.3201, -485.629, 77.9991, 0.85521, 7200, 0, 0, 8613, 0, 0, 0),
(45811, 9583, 229, 1, 1, 0, 0, -56.9907, -427.546, 77.8323, 1.44862, 7200, 0, 0, 8883, 0, 0, 0),
(45819, 9583, 229, 1, 1, 0, 0, -43.5588, -515.171, 88.5866, 3.70166, 7200, 0, 0, 8883, 0, 0, 0),
(45760, 9268, 229, 1, 1, 0, 0, -49.6838, -514.303, 88.3960, 5.44524, 7200, 0, 0, 8613, 0, 0, 0),
(45809, 9693, 229, 1, 1, 0, 0, -47.7750, -520.564, 87.5643, 1.30227, 7200, 0, 0, 7107, 2369, 0, 0),
(45761, 9696, 229, 1, 1, 0, 0, -38.1504, -519.232, 88.0403, 3.36848, 7200, 0, 0, 2784, 0, 0, 0),
(45810, 9216, 229, 1, 1, 0, 0, -79.4547, -523.615, 82.6267, 0.80285, 7200, 0, 0, 14355, 0, 0, 0),
(45818, 9216, 229, 1, 1, 0, 0, -49.0348, -427.765, 77.8322, 1.64061, 7200, 0, 0, 14355, 0, 0, 0);
DELETE FROM creature_movement WHERE id = 45815; 
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(45815, 1, -53.7135, -469.510, 77.8413, 0, 0, 0, 0, 0),
(45815, 2, -57.2509, -477.311, 77.9158, 0, 0, 0, 0, 0),
(45815, 3, -61.6685, -480.695, 77.9158, 0, 0, 0, 0, 0),
(45815, 4, -68.0847, -485.191, 77.9158, 0, 0, 0, 0, 0),
(45815, 5, -76.1309, -488.445, 77.9158, 0, 0, 0, 0, 0),
(45815, 6, -78.7550, -497.510, 77.9866, 0, 0, 0, 0, 0),
(45815, 7, -77.5000, -506.460, 79.4722, 0, 0, 0, 0, 0),
(45815, 8, -73.2358, -515.496, 81.0900, 0, 0, 0, 0, 0),
(45815, 9, -65.7134, -519.569, 82.9049, 0, 0, 0, 0, 0),
(45815, 10, -57.8619, -517.623, 86.6360, 0, 0, 0, 0, 0),
(45815, 11, -50.2694, -512.905, 88.2413, 0, 0, 0, 0, 0),
(45815, 12, -47.6077, -508.537, 88.6223, 0, 0, 0, 0, 0),
(45815, 13, -43.8517, -499.036, 90.1431, 0, 0, 0, 0, 0),
(45815, 14, -33.9322, -488.698, 90.6663, 0, 0, 0, 0, 0),
(45815, 15, -43.8517, -499.036, 90.1431, 0, 0, 0, 0, 0),
(45815, 16, -47.6077, -508.537, 88.6223, 0, 0, 0, 0, 0),
(45815, 17, -50.2694, -512.905, 88.2413, 0, 0, 0, 0, 0),
(45815, 18, -57.8619, -517.623, 86.6360, 0, 0, 0, 0, 0),
(45815, 19, -65.7134, -519.569, 82.9049, 0, 0, 0, 0, 0),
(45815, 20, -73.2358, -515.496, 81.0900, 0, 0, 0, 0, 0),
(45815, 21, -77.5000, -506.460, 79.4722, 0, 0, 0, 0, 0),
(45815, 22, -78.7550, -497.510, 77.9866, 0, 0, 0, 0, 0),
(45815, 23, -76.1309, -488.445, 77.9158, 0, 0, 0, 0, 0),
(45815, 24, -68.0847, -485.191, 77.9158, 0, 0, 0, 0, 0),
(45815, 25, -61.6685, -480.695, 77.9158, 0, 0, 0, 0, 0),
(45815, 26, -57.2509, -477.311, 77.9158, 0, 0, 0, 0, 0),
(45815, 27, -53.7135, -469.510, 77.8413, 0, 0, 0, 0, 0),
(45815, 28, -53.3688, -431.997, 78.2854, 0, 0, 0, 0, 0);

-- Classic [1019]
-- Fixed respawn time of herbs in Dire Maul. Set respawn time to 40 min instead of 3
UPDATE gameobject SET spawntimesecs = 40 * 60 WHERE map = 429 AND id IN (176584, 142145, 142144);

-- Classic [1013]
-- BWL - Swingtimers
UPDATE creature_template SET MeleeBaseAttackTime = 4000, RangedBaseAttackTime = 4000 WHERE Entry = 12435;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14456;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12557;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12422;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12420;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12416;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 13996;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 13020;
UPDATE creature_template SET MeleeBaseAttackTime = 2400, RangedBaseAttackTime = 2400 WHERE Entry = 12467;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12463;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12465;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12464;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12468;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14022;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14024;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14025;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14023;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12017;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12459;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12458;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12457;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 16604;
UPDATE creature_template SET FactionAlliance = 103, FactionHorde = 103, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12461;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 12460;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14401;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11983;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14601;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11981;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14020;
UPDATE creature_template SET FactionAlliance = 14, FactionHorde = 14, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 11583;
UPDATE creature_template SET FactionAlliance = 103, FactionHorde = 103, MeleeBaseAttackTime = 1000, RangedBaseAttackTime = 1000 WHERE Entry = 14605;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14668;
UPDATE creature_template SET FactionAlliance = 103, FactionHorde = 103 WHERE Entry = 14261;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14262;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14263;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 14264;
UPDATE creature_template SET FactionAlliance = 103, FactionHorde = 103 WHERE Entry = 14302;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 13976;

-- Classic [1012]
-- Razorgore's brood
UPDATE gameobject SET animprogress = 100 WHERE id = 177807;
UPDATE gameobject_template SET faction = 14, flags = 0 WHERE entry = 177807; 

-- Classic [1011]
-- UBRS door
UPDATE gameobject_template SET faction = 114 WHERE entry = 175533;
UPDATE gameobject_template SET faction = 114 WHERE entry = 175532;
UPDATE gameobject_template SET faction = 114 WHERE entry = 175531;
UPDATE gameobject_template SET faction = 114 WHERE entry = 175530;
UPDATE gameobject_template SET faction = 114 WHERE entry = 175529;
UPDATE gameobject_template SET faction = 114 WHERE entry = 175528;
UPDATE gameobject_template SET faction = 114 WHERE entry = 164725;

-- Classic [1010]
-- Mr. Vaelastrasz' doors
UPDATE gameobject SET animprogress = 100 WHERE id = 179364;  
UPDATE gameobject SET animprogress = 100 WHERE id = 176965;  
UPDATE gameobject SET animprogress = 100 WHERE id = 176964;
UPDATE gameobject_template SET faction = 114, flags = 32 WHERE entry = 179364;  
UPDATE gameobject_template SET faction = 114, flags = 32 WHERE entry = 176965;  
UPDATE gameobject_template SET faction = 114, flags = 32 WHERE entry = 176964;  

-- Classic [1008]
-- Broodlord Lashlayer's door 
UPDATE gameobject SET animprogress = 100 WHERE id = 179365;  
UPDATE gameobject_template SET faction = 114, flags = 32 WHERE entry = 179365; 

-- Classic [1007]
-- Lord Victor Whatever's doors
UPDATE gameobject SET animprogress = 100 WHERE id = 179117;  
UPDATE gameobject SET animprogress = 100 WHERE id = 176966; 
UPDATE gameobject_template SET faction = 114, flags = 32 WHERE entry = 179117;  
UPDATE gameobject_template SET faction = 114, flags = 32 WHERE entry = 176966; 

-- Classic [1006] 
-- Chromaggus' door 
UPDATE gameobject SET orientation = 5.340709 WHERE id = 179148;
UPDATE gameobject SET animprogress = 100 WHERE id = 179116;
UPDATE gameobject_template SET flags = 32, size = 5 WHERE entry = 179148;
UPDATE gameobject_template SET faction = 114, flags = 32 WHERE entry = 179116;

-- Classic [1005] 
-- Faction templates and swing timers of AQ40's inhabitants! 
UPDATE creature_template SET MinLevel = 61 WHERE Entry = 11338;
UPDATE creature_template SET MinLevel = 60 WHERE Entry = 11831;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15264;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15262;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15263;
UPDATE creature_template SET MinLevel = 60, MaxLevel = 60, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15502;
UPDATE creature_template SET MinLevel = 60, MaxLevel = 60, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15504;
UPDATE creature_template SET MinLevel = 60, MaxLevel = 60, RangedBaseAttackTime = 2000 WHERE Entry = 15503;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15247;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15233;
UPDATE creature_template SET MinLevel = 61, FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15230;
UPDATE creature_template SET MinLevel = 60, FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15622;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2500, RangedBaseAttackTime = 2500 WHERE Entry = 15544;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 15621;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15543;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2500, RangedBaseAttackTime = 2500 WHERE Entry = 15511;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 1200, RangedBaseAttackTime = 1200 WHERE Entry = 15516;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 1600, RangedBaseAttackTime = 1600 WHERE Entry = 15984;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15300;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15229;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15510;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, Scale = 0, MeleeBaseAttackTime = 2000 WHERE Entry = 15630;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15962;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15240;
UPDATE creature_template SET MeleeBaseAttackTime = 1300, RangedBaseAttackTime = 1300 WHERE Entry = 15299;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15235;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15236;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 1600, RangedBaseAttackTime = 1600 WHERE Entry = 15249;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15509;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15277;
UPDATE creature_template SET MinLevel = 60, RangedBaseAttackTime = 2000 WHERE Entry = 15316;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15275;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15276;
UPDATE creature_template SET MinLevel = 63, MaxLevel = 63, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15963;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15250;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, Scale = 0 WHERE Entry = 15246;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15252;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15312;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15311;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2700, RangedBaseAttackTime = 2700 WHERE Entry = 15517;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 1000, RangedBaseAttackTime = 1000 WHERE Entry = 15718;
UPDATE creature_template SET MinLevel = 60, MaxLevel = 60 WHERE Entry = 15957;
UPDATE creature_template SET FactionAlliance = 35, FactionHorde = 35, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15380;
UPDATE creature_template SET FactionAlliance = 35, FactionHorde = 35, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15379;
UPDATE creature_template SET FactionAlliance = 35, FactionHorde = 35, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15378;
UPDATE creature_template SET FactionAlliance = 370, FactionHorde = 370, Scale = 0, MeleeBaseAttackTime = 2500, RangedBaseAttackTime = 2500 WHERE Entry = 15589;
UPDATE creature_template SET Scale = 0, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15727;
UPDATE creature_template SET FactionAlliance = 370, FactionHorde = 370 WHERE Entry = 15896;
UPDATE creature_template SET Scale = 0 WHERE Entry = 15809;
UPDATE creature_template SET MinLevel = 60, ModelId1 = 15948, FactionAlliance = 370, FactionHorde = 370, Scale = 0, MeleeBaseAttackTime = 2000 WHERE Entry = 15334;
UPDATE creature_template SET MinLevel = 60, FactionAlliance = 16, FactionHorde = 16, Scale = 0, MeleeBaseAttackTime = 1000, RangedBaseAttackTime = 1000 WHERE Entry = 15725;
UPDATE creature_template SET MinLevel = 60, FactionAlliance = 16, FactionHorde = 16, Scale = 0, MeleeBaseAttackTime = 1000, RangedBaseAttackTime = 1000 WHERE Entry = 15726;
UPDATE creature_template SET FactionAlliance = 370, FactionHorde = 370, Scale = 0, MeleeBaseAttackTime = 2500, RangedBaseAttackTime = 2500 WHERE Entry = 15728;
UPDATE creature_template SET MinLevel = 60, FactionAlliance = 16, FactionHorde = 16, Scale = 0, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15802;
UPDATE creature_template SET MinLevel = 63, MaxLevel = 63, Scale = 0 WHERE Entry = 15904;
UPDATE creature_template SET MinLevel = 63, MaxLevel = 63, Scale = 0 WHERE Entry = 15910;

-- Classic [1004] 
-- Faction templates and swing timers of AQ20's inhabitants! 
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15324;
UPDATE creature_template SET FactionAlliance = 15, FactionHorde = 15, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15168;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, RangedBaseAttackTime = 1500 WHERE Entry = 15343;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15327;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15325;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, Scale = 0, MeleeBaseAttackTime = 2000 WHERE Entry = 15348;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 1300, RangedBaseAttackTime = 1300 WHERE Entry = 15344;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, Scale = 0, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15387;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15391;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15392;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15390;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15389;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15386;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15385;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15388;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15341;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 800, RangedBaseAttackTime = 800 WHERE Entry = 15323;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15320;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, Scale = 0, MeleeBaseAttackTime = 2500, RangedBaseAttackTime = 2500 WHERE Entry = 15370;
UPDATE creature_template SET MinLevel = 60, MaxLevel = 60, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15964;
UPDATE creature_template SET FactionAlliance = 148, FactionHorde = 148, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15335;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, Scale = 0, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15521;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15333;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 15336, RangedBaseAttackTime = 15336 WHERE Entry = 15336;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15319;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15318;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 1200, RangedBaseAttackTime = 1200 WHERE Entry = 15369;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310 WHERE Entry = 15934;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15555;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 1800, RangedBaseAttackTime = 1800 WHERE Entry = 15339;
UPDATE creature_template SET MinLevel = 60, MaxLevel = 60 WHERE Entry = 15590;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15355;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15537;
UPDATE creature_template SET MeleeBaseAttackTime = 1300, RangedBaseAttackTime = 1300 WHERE Entry = 15538;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15461;
UPDATE creature_template SET FactionAlliance = 310, FactionHorde = 310, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15462;
UPDATE creature_template SET MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15338;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, MeleeBaseAttackTime = 2000, RangedBaseAttackTime = 2000 WHERE Entry = 15340;
UPDATE creature_template SET FactionAlliance = 1878, FactionHorde = 1878, MeleeBaseAttackTime = 1200, RangedBaseAttackTime = 1200 WHERE Entry = 15505;
UPDATE creature_template SET Scale = 0 WHERE Entry = 15514;
UPDATE creature_template SET Scale = 0 WHERE Entry = 15507;

-- Classic [1003]
-- Moam was slightly moved.
UPDATE creature SET position_x = -8845.518, position_y = 2260.144, position_z = 21.46967, orientation = 4.642576 WHERE id = 15340;

-- Classic [1002]
-- AQ40
UPDATE creature_template SET Scale = 0 WHERE Entry = 15543;
UPDATE creature_template SET Scale = 0 WHERE Entry = 15511;
UPDATE creature_template SET Scale = 0 WHERE Entry = 15544;
-- AQ20
UPDATE creature_template SET Scale = 0 WHERE Entry = 15168;
UPDATE creature_template SET Scale = 0 WHERE Entry = 15343;
UPDATE creature_template SET Scale = 0 WHERE Entry = 15461;
UPDATE creature_template SET Scale = 0 WHERE Entry = 15462;

-- Classic [0997]
-- Fixed gossip menu of NPC 3430 (Mangletooth) in the Barrens
UPDATE creature_template SET GossipMenuId = 2944 WHERE entry = 3430;
DELETE FROM gossip_menu WHERE entry = 2944;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(2944, 3656, 0, 0),
(2944, 3670, 0, 1012);
DELETE FROM conditions WHERE condition_entry = 1012; 
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1012, 8, 5052, 0);

-- Classic [0996]
-- Fixed several graveyards for Horde and Alliance accross the world
-- Darkshore : Horde should not respawn in Ashenvale
DELETE FROM game_graveyard_zone WHERE id = 512 AND ghost_zone = 148 AND faction = 67;
UPDATE game_graveyard_zone SET faction = 0 WHERE id = 469 AND ghost_zone = 148;
-- Undercity : graveyard missing
DELETE FROM game_graveyard_zone WHERE ghost_zone = 1497;
INSERT INTO game_graveyard_zone VALUES
(96, 1497, 67),
(853, 1497, 469);
-- Hinterlands : Alliance should be able to respawn at Overlook Cliffs
UPDATE game_graveyard_zone SET faction = 0 WHERE id = 789;
UPDATE game_graveyard_zone SET faction = 0 WHERE id = 349;
-- Ironforge
-- Alliance should respawn at entrance
DELETE FROM game_graveyard_zone WHERE id = 852; -- Dun Morogh, Gates of Ironforge
INSERT INTO game_graveyard_zone VALUES
(852, 1, 469), -- alliance dies around Ironforge
(852, 1537, 469); -- alliance dies inside Ironforge
-- Horde should respawn at far-east graveyard
DELETE FROM game_graveyard_zone WHERE id = 1472; -- Dun Morogh, Dun Morogh, East Road
INSERT INTO game_graveyard_zone VALUES
(1472, 1, 0),
(1472, 1537, 67);

-- Classic [0995]
-- Fixed quest 7838 (Arean Grand Master) in Stranglethorn Vale
UPDATE quest_template SET Method = 2 WHERE entry = 7838;

-- Classic [0992]
-- Added missing object 181073 (Fragrant Cauldron) for Love in the Air event
-- Linked quest 9029 (A bubbling cauldron) to it
DELETE FROM gameobject_involvedrelation WHERE quest = 9029;
INSERT INTO gameobject_involvedrelation (id, quest) VALUES
(181073, 9029);
DELETE FROM gameobject_questrelation WHERE quest = 9029;
INSERT INTO gameobject_questrelation  (id, quest) VALUES
(181073, 9029);
DELETE FROM gameobject_template WHERE entry = 181073;
INSERT INTO gameobject_template (entry, type, displayId, name, IconName, castBarCaption, unk1, faction, flags, size, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, mingold, maxgold, ScriptName) VALUES
(181073,2,216,'Fragrant Cauldron','','','',0,0,1,0,0,0,0,0,0,93,7244,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM gameobject WHERE guid = 65917;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(65917, 181073, 0, 1, 1, 87.6351, -1724.96, 220.192, 1.88655, 0, 0, 0.809484, 0.587141, 25, 100, 1);
DELETE FROM game_event_gameobject WHERE guid = 65917;
INSERT INTO game_event_gameobject (guid, event) VALUES
(65917, 8);
UPDATE quest_template SET MinLevel = 1, QuestLevel = -1 WHERE entry = 9029;

-- Classic [0991]
-- Fixed quest 5525 (Free Knot!) and its repeatable follow up 7429 (Free Knot!) in Dire Maul North
DELETE FROM dbscripts_on_quest_end WHERE id = 5525;
INSERT INTO dbscripts_on_quest_end  (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(5525, 0, 0, 0, 0, 0, 0, 0, 2000000543, 0, 0, 0, 0, 0, 0, 0, ''),
(5525, 0, 29, 3, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'remove flag'),
(5525, 1, 9, 65867, 43200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spawn cache'),
(5525, 2, 13, 0, 0, 179511, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'remove ball and chains'),
(5525, 4, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'run on'),
(5525, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500.42, 540.966, -25.3846, 2.72271, 'WP movement'),
(5525, 15, 18, 0, 0, 0, 0, 0x04, 0, 0, 0, 0, 0, 0, 0, 0, 'despawn');
UPDATE quest_template SET OfferRewardText = 'Oh, thank you for freeing me! You - ranked number one. Everyone else - ranked number two or lower.$B$BI knew my life was destined for more than just being an appetizer to some ogre!', CompleteScript = 5525 WHERE entry = 5525;
UPDATE quest_template SET RewRepFaction1 = 169, RewRepValue1 = 350, CompleteScript = 5525 WHERE entry = 7429;
DELETE FROM db_script_string WHERE entry = 2000000543;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000543, "$N, I'll make sure all my friends in the Cartel know that you've saved my life today. Here - I'm going to need to be able to travel light, so please help yourself to my cache of tailoring and leatherworking supplies! Thanks again - see ya!", 0, 0, 0, 4, NULL);
-- gossip updates
DELETE FROM gossip_menu WHERE entry = 5668;
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(5668, 6875, 0, 0);
DELETE FROM gossip_menu_option WHERE (menu_id = 5668) OR (menu_id = 5667 AND id = 0);
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(5667, 0, 0, 'So, I found this shackle key...', 1, 1, 5668, 0, 0, 0, 0, '', 1011),
(5668, 0, 0, 'I guess so!', 1, 1, -1, 0, 0, 0, 0, '', 0);
UPDATE gossip_menu_option SET action_menu_id = 5716 WHERE menu_id = 5667 AND id = 1;
DELETE FROM conditions WHERE condition_entry = 1011;
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(1011, 2, 18250, 1); -- Has gordok shackles key
-- missing object added
DELETE FROM gameobject WHERE guid = 65867;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(65867,179501,429, 1, 1, 583.60, 523.44, -25.40, 3.1848, 0, 0, 0.861341, -0.508028, -43200, 100, 1);
UPDATE gameobject SET spawntimesecs = 43200 WHERE id = 179511;
-- quest updates
UPDATE quest_template SET RequiredRaces = 0, CompletedText = 'Return to Knot Thimblejack' WHERE entry = 5518; -- q. must be available for all races
UPDATE quest_template SET PrevQuestId = 5518, CompletedText = 'Return to Knot Thimblejack' WHERE entry = 5519; -- this one available only after main finished 
UPDATE quest_template SET CompletedText = 'Return to Knot Thimblejack' WHERE entry = 5525;
-- Classic [1072]
-- LBRS - Roughshod Pike
-- Omokk's head should always drop
-- Roughshod Pike duplicate removed
DELETE FROM gameobject WHERE guid = 82573;
UPDATE gameobject SET position_x = -34.73237, position_y = -589.6146, position_z = 30.93392, orientation = 0, rotation2 = 0.7253742, rotation3 = 0.6883547 WHERE guid = 82567;
UPDATE gameobject SET position_x = -36.29766, position_y = -589.6169, position_z = 31.01031, orientation = 0, rotation2 = 0.5224981, rotation3 = 0.8526405 WHERE guid = 82568;
UPDATE gameobject SET position_x = -37.10931, position_y = -589.6414, position_z = 30.95476, orientation = 0, rotation2 = 0.6018143, rotation3 = 0.7986361 WHERE guid = 82569;
UPDATE gameobject SET position_x = -35.6387, position_y = -589.6323, position_z = 30.98253, orientation = 0, rotation2 = -0.8338852, rotation3 = 0.5519379 WHERE guid = 82570;
UPDATE gameobject SET position_x = -37.78564, position_y = -589.6395, position_z = 30.99642, orientation = 0, rotation2 = -0.9996567, rotation3 = 0.02620165 WHERE guid = 82571;
UPDATE gameobject SET position_y = -589.6351, position_z = 30.99642, orientation = 0, rotation2 = -0.2923717, rotation3 = 0.9563047 WHERE guid = 82572;
UPDATE creature_loot_template SET ChanceOrQuestChance = 100 WHERE entry = 9196 and item = 12534;

-- Classic [1071]
-- LBRS - Inconspicuous Documents
-- Added more spawnpoints for Inconspicuous Documents in LBRS. These are not always next to Voone.
DELETE FROM gameobject WHERE guid IN (35860, 65973, 66029, 66031);
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(35860, 175785, 229, -10.52417, -391.3383, 48.82137, 0, 0, 0, -0.8746195, 0.4848101, 0, 0, 1),
(65973, 175785, 229, -12.27355, -446.6286, -18.64427, 0, 0, 0, 0.9170599, 0.3987495, 0, 0, 1),
(66029, 175785, 229, -18.37604, -299.2709, 31.61826, 0, 0, 0, 0.9996567, 0.02620165, 0, 0, 1),
(66031, 175785, 229, -16.12174, -492.5576, 90.65852, 0, 0, 0, 0.3665009, 0.93041770, 0, 0, 1);
DELETE FROM pool_template WHERE entry = 25484;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25484, 1, 'LBRS - Inconspicuous Documents');
DELETE FROM pool_gameobject_template WHERE id = 175785 OR pool_entry = 25484;
INSERT INTO pool_gameobject_template (id, pool_entry, chance, description) VALUES
(175785, 25484, 0, 'LBRS - Inconspicuous Documents');

-- Classic [1070]
-- LBRS - Warosh
DELETE FROM creature WHERE guid = 56025; -- Free UDB guids reused
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(56025,10799,229,1,1,0,0,44.49939,-372.6492,48.79031,4.893657,7200,0,0,4120,0,0,2);
UPDATE creature_template SET movementType = 2 WHERE entry = 10799;
DELETE FROM creature_movement_template WHERE entry = 10799;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(10799,1, 49.90298, -402.1319, 48.80593, 0, 0, 0, 0, 0),
(10799,2, 58.41603, -418.7091, 45.02646, 0, 0, 0, 0, 0),
(10799,3, 71.58976, -436.8153, 41.41042, 0, 0, 0, 0, 0),
(10799,4, 78.66329, -463.2451, 35.48121, 0, 0, 0, 0, 0),
(10799,5, 81.10400, -479.9030, 30.86245, 0, 0, 0, 0, 0),
(10799,6, 73.26363, -487.8571, 27.89152, 0, 0, 0, 0, 0),
(10799,7, 54.61135, -489.3818, 28.67157, 0, 0, 0, 0, 0),
(10799,8, 44.71681, -491.0370, 29.58880, 0, 0, 0, 0, 0),
(10799,9, 52.60767, -511.5597, 29.21095, 0, 0, 0, 0, 0),
(10799,10, 50.58394, -533.1805, 26.77670, 0, 0, 0, 0, 0),
(10799,11, 50.20008, -560.1547, 30.55615, 0, 0, 0, 0, 0),
(10799,12, 50.46281, -576.0350, 30.58301, 0, 0, 0, 0, 0),
(10799,13, 39.67855, -579.5101, 31.06995, 0, 0, 0, 0, 0),
(10799,14, 17.70854, -578.2368, 26.56120, 0, 0, 0, 0, 0),
(10799,15, -5.465746, -576.0652, 29.19087, 0, 0, 0, 0, 0),
(10799,16, -27.13421, -574.5060, 29.19087, 0, 0, 0, 0, 0),
(10799,17, -47.66818, -572.6104, 29.19087, 0, 0, 0, 0, 0),
(10799,18, -60.44478, -573.6581, 29.19087, 0, 0, 0, 0, 0),
(10799,19, -43.34514, -571.0668, 29.19087, 0, 0, 0, 0, 0),
(10799,20, -36.48037, -563.5282, 29.19087, 0, 0, 0, 0, 0),
(10799,21, -48.50640, -537.1736, 29.19087, 0, 0, 0, 0, 0),
(10799,22, -36.48037, -563.5282, 29.19087, 0, 0, 0, 0, 0),
(10799,23, -43.34514, -571.0668, 29.19087, 0, 0, 0, 0, 0),
(10799,24, -60.44478, -573.6581, 29.19087, 0, 0, 0, 0, 0),
(10799,25, -47.66818, -572.6104, 29.19087, 0, 0, 0, 0, 0),
(10799,26, -27.13421, -574.5060, 29.19087, 0, 0, 0, 0, 0),
(10799,27, -5.465746, -576.0652, 29.19087, 0, 0, 0, 0, 0),
(10799,28, 17.42213, -578.2202, 26.65305, 0, 0, 0, 0, 0),
(10799,29, 39.67855, -579.5101, 31.06995, 0, 0, 0, 0, 0),
(10799,30, 50.46281, -576.0350, 30.58301, 0, 0, 0, 0, 0),
(10799,31, 50.20008, -560.1547, 30.55615, 0, 0, 0, 0, 0),
(10799,32, 50.54165, -533.7271, 26.73937, 0, 0, 0, 0, 0),
(10799,33, 52.60767, -511.5597, 29.21095, 0, 0, 0, 0, 0),
(10799,34, 44.71681, -491.0370, 29.58880, 0, 0, 0, 0, 0),
(10799,35, 54.37603, -489.4010, 28.65347, 0, 0, 0, 0, 0),
(10799,36, 73.26363, -487.8571, 27.89152, 0, 0, 0, 0, 0),
(10799,37, 81.10400, -479.9030, 30.86245, 0, 0, 0, 0, 0),
(10799,38, 78.66329, -463.2451, 35.48121, 0, 0, 0, 0, 0),
(10799,39, 71.58976, -436.8153, 41.41042, 0, 0, 0, 0, 0),
(10799,40, 58.41603, -418.7091, 45.02646, 0, 0, 0, 0, 0),
(10799,41, 49.90298, -402.1319, 48.80593, 0, 0, 0, 0, 0),
(10799,42, 46.01845, -387.0023, 48.69103, 0, 0, 0, 0, 0);

-- Classic [1069]
-- LBRS - Skitterweb Tunnels
DELETE FROM creature WHERE id IN (10374, 10375, 10376, 10596);
DELETE FROM creature WHERE guid IN (55466, 55472, 55749, 55752, 55757, 55768, 55803, 55805, 55807, 55922, 55946, 55950, 55986, 55987, 55989, 55990, 56020, 56021, 56022, 56023, 56024); -- Free UDB guids reused
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(55466, 10374, 229, 1, 1, 0, 0, -127.297, -520.325, 11.7612, 1.586780, 7200, 0, 0, 8613, 0, 0, 2),
(55472, 10376, 229, 1, 1, 0, 0, -138.318, -468.999, 13.8768, 0.206570, 7200, 2, 0, 9156, 0, 0, 1),
(55749, 10374, 229, 1, 1, 0, 0, -138.318, -468.999, 13.8768, 0.206570, 7200, 2, 0, 8613, 0, 0, 1),
(55752, 10374, 229, 1, 1, 0, 0, -143.059, -478.358, 12.8284, 0.798163, 7200, 2, 0, 8613, 0, 0, 1),
(55757, 10374, 229, 1, 1, 0, 0, -115.997, -546.753, 2.13922, 5.827920, 7200, 2, 0, 8613, 0, 0, 1),
(55768, 10374, 229, 1, 1, 0, 0, -109.584, -558.254, 5.97215, 5.016080, 7200, 2, 0, 8613, 0, 0, 1),
(55803, 10374, 229, 1, 1, 0, 0, -139.079, -543.960, 7.28465, 1.544500, 7200, 2, 0, 8613, 0, 0, 1),
(55805, 10374, 229, 1, 1, 0, 0, -146.663, -538.030, 7.51950, 2.933440, 7200, 2, 0, 8613, 0, 0, 1),
(55807, 10375, 229, 1, 1, 0, 0, -136.728, -474.423, 12.8312, 2.082020, 7200, 3, 0, 2699, 0, 0, 1),
(55922, 10375, 229, 1, 1, 0, 0, -142.430, -473.287, 14.7701, 0.926899, 7200, 3, 0, 2699, 0, 0, 1),
(55946, 10375, 229, 1, 1, 0, 0, -138.021, -483.627, 11.5026, 4.643740, 7200, 3, 0, 2699, 0, 0, 1),
(55950, 10375, 229, 1, 1, 0, 0, -144.252, -486.798, 12.2607, 3.249650, 7200, 3, 0, 2699, 0, 0, 1),
(55986, 10375, 229, 1, 1, 0, 0, -104.987, -548.240, 2.40518, 4.187700, 7200, 3, 0, 2699, 0, 0, 1),
(55987, 10375, 229, 1, 1, 0, 0, -103.748, -553.987, 4.86079, 4.825850, 7200, 3, 0, 2699, 0, 0, 1),
(55989, 10375, 229, 1, 1, 0, 0, -110.213, -551.456, 3.32568, 4.707060, 7200, 3, 0, 2699, 0, 0, 1),
(55990, 10375, 229, 1, 1, 0, 0, -116.352, -553.506, 4.88814, 5.401010, 7200, 3, 0, 2699, 0, 0, 1),
(56020, 10375, 229, 1, 1, 0, 0, -135.254, -538.651, 7.12265, 7.144860, 7200, 3, 0, 2699, 0, 0, 1),
(56021, 10375, 229, 1, 1, 0, 0, -141.288, -537.482, 6.93766, 5.602510, 7200, 3, 0, 2699, 0, 0, 1),
(56022, 10375, 229, 1, 1, 0, 0, -147.480, -544.562, 7.88285, 1.102460, 7200, 3, 0, 2699, 0, 0, 1),
(56023, 10375, 229, 1, 1, 0, 0, -139.028, -532.190, 6.68119, 2.221220, 7200, 3, 0, 2699, 0, 0, 1),
(56024, 10596, 229, 1, 1, 0, 0, -135.51, -565.850, 10.1700, 0.670000, 1000000, 2, 0, 23688, 0, 0, 1);
DELETE FROM creature_movement WHERE id = 55466;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(55466, 1, -127.151, -511.369, 11.3636, 0, 0, 0, 0, 0),
(55466, 2, -127.429, -493.976, 11.3567, 0, 0, 0, 0, 0),
(55466, 3, -127.005, -504.143, 11.3607, 0, 0, 0, 0, 0),
(55466, 4, -126.588, -516.658, 11.7612, 0, 0, 0, 0, 0),
(55466, 5, -126.609, -520.664, 11.7612, 0, 0, 0, 0, 0),
(55466, 6, -122.625, -521.096, 11.7612, 0, 0, 0, 0, 0),
(55466, 7, -116.240, -521.575, 11.0583, 0, 0, 0, 0, 0),
(55466, 8, -104.837, -520.382, 10.8036, 0, 0, 0, 0, 0),
(55466, 9, -116.714, -521.250, 11.0689, 0, 0, 0, 0, 0),
(55466, 10, -125.462, -520.888, 11.7612, 0, 0, 0, 0, 0),
(55466, 11, -127.024, -530.692, 11.3652, 0, 0, 0, 0, 0),
(55466, 12, -126.508, -540.155, 11.3652, 0, 0, 0, 0, 0),
(55466, 13, -126.758, -552.192, 11.3652, 0, 0, 0, 0, 0),
(55466, 14, -127.207, -540.946, 11.3652, 0, 0, 0, 0, 0),
(55466, 15, -126.976, -530.475, 11.3652, 0, 0, 0, 0, 0),
(55466, 16, -127.018, -521.193, 11.7612, 0, 0, 0, 0, 0),
(55466, 17, -130.026, -520.442, 11.7612, 0, 0, 0, 0, 0),
(55466, 18, -136.242, -520.639, 11.3496, 0, 0, 0, 0, 0),
(55466, 19, -141.835, -520.482, 11.3498, 0, 0, 0, 0, 0),
(55466, 20, -133.624, -520.864, 11.3495, 0, 0, 0, 0, 0),
(55466, 21, -127.177, -520.906, 11.7612, 0, 0, 0, 0, 0);
DELETE FROM pool_creature WHERE guid IN (55472, 55749) OR pool_entry = 25483;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(55472, 25483, 10, 'LBRS - Crystal Fang / Spire Spider'),
(55749, 25483, 90, 'LBRS - Crystal Fang / Spire Spider');
DELETE FROM pool_template WHERE entry = 25483;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25483, 1, 'LBRS - Crystal Fang / Spire Spider');
UPDATE creature_template SET MinLevel = 57, Family = 3, UnitFlags = 32832, CreatureTypeFlags = 72, SpeedWalk = 1, HealthMultiplier = 3, PowerMultiplier = 1, DamageMultiplier = 3.7, ArmorMultiplier = 1, MinMeleeDmg = 73.4, MaxMeleeDmg = 99.3, MinRangedDmg = 0, MaxRangedDmg = 0, Armor = 3435, MeleeAttackPower = 242, RangedAttackPower = 25, MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 10374;
UPDATE creature_template SET FactionAlliance = 16, FactionHorde = 16, Family = 3, UnitFlags = 32832, CreatureTypeFlags = 72, SpeedWalk = 1, PowerMultiplier = 1, DamageMultiplier = 3.7, MinMeleeDmg = 77.9, MaxMeleeDmg = 103.4, MinRangedDmg = 0, MaxRangedDmg = 0, MeleeAttackPower = 252, RangedAttackPower = 26, MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 10376;
UPDATE creature_template SET Family = 3, UnitFlags = 32832, CreatureTypeFlags = 72, SpeedWalk = 1, PowerMultiplier = 1, DamageMultiplier = 5.7, MinMeleeDmg = 76.4, MaxMeleeDmg = 101.3, MinRangedDmg = 0, MaxRangedDmg = 0, MeleeAttackPower = 248, RangedAttackPower = 25, MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 10596;
UPDATE creature_template SET UnitFlags = 32768, CreatureTypeFlags = 73, SpeedWalk = 1, DamageMultiplier = 1.5, MinMeleeDmg = 70.5, MaxMeleeDmg = 95.4, MinRangedDmg = 0, MaxRangedDmg = 0, Armor = 3327, MeleeAttackPower = 234, RangedAttackPower = 23, MeleeBaseAttackTime = 1500, RangedBaseAttackTime = 1500 WHERE Entry = 10375;

-- Classic [1067]
-- Dustwallow Marsh - Brackenwall 
UPDATE creature SET modelid = 0, position_x = -3175.54, position_y = -2868.45, position_z = 34.8193, orientation = 1.963480, spawndist = 0, MovementType = 2 WHERE guid = 8479;
UPDATE creature SET modelid = 0, position_x = -3138.59, position_y = -2928.90, position_z = 34.5513, orientation = 1.649140, spawndist = 0 WHERE guid = 24050;
UPDATE creature SET modelid = 0, position_x = -3095.63, position_y = -2871.48, position_z = 34.1132, orientation = 0.204674, spawndist = 0, MovementType = 2 WHERE guid = 30450;
DELETE FROM creature_movement WHERE id IN (8479, 24050, 30450);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(8479, 1, -3180.15, -2857.3, 35.9913, 0, 0, 0, 0, 0),
(8479, 2, -3176.94, -2844.8, 35.2267, 0, 0, 0, 0, 0),
(8479, 3, -3170.16, -2833.04, 34.6933, 0, 0, 0, 0, 0),
(8479, 4, -3160.74, -2825.33, 34.3194, 0, 0, 0, 0, 0),
(8479, 5, -3170.16, -2833.04, 34.6933, 0, 0, 0, 0, 0),
(8479, 6, -3176.94, -2844.8, 35.2267, 0, 0, 0, 0, 0),
(8479, 7, -3180.15, -2857.3, 35.9913, 0, 0, 0, 0, 0),
(8479, 8, -3177.65, -2866.58, 35.3351, 0, 0, 0, 0, 0),
(24050, 1, -3140.23, -2907.91, 34.3162, 0, 0, 0, 0, 0),
(24050, 2, -3141.59, -2888.42, 33.9922, 0, 0, 0, 0, 0),
(24050, 3, -3139.52, -2875.64, 34.761, 0, 0, 0, 0, 0),
(24050, 4, -3137.37, -2864.11, 34.7546, 0, 0, 0, 0, 0),
(24050, 5, -3131.76, -2857.62, 34.9704, 0, 0, 0, 0, 0),
(24050, 6, -3122.09, -2848.02, 34.8454, 0, 0, 0, 0, 0),
(24050, 7, -3111.08, -2839.94, 34.3261, 0, 0, 0, 0, 0),
(24050, 8, -3098.52, -2827.34, 34.363, 0, 0, 0, 0, 0),
(24050, 9, -3104.83, -2842.1, 34.3349, 0, 0, 0, 0, 0),
(24050, 10, -3110.89, -2851.87, 34.8088, 0, 0, 0, 0, 0),
(24050, 11, -3118.15, -2869.64, 34.953, 0, 0, 0, 0, 0),
(24050, 12, -3118.79, -2878.74, 35.078, 0, 0, 0, 0, 0),
(24050, 13, -3123.36, -2885.75, 34.828, 0, 0, 0, 0, 0),
(24050, 14, -3128.95, -2889.75, 34.578, 0, 0, 0, 0, 0),
(24050, 15, -3129.52, -2902.29, 34.116, 0, 0, 0, 0, 0),
(24050, 16, -3128.31, -2913.81, 34.3355, 0, 0, 0, 0, 0),
(30450, 1, -3081.79, -2868.61, 34.6922, 0, 0, 0, 0, 0),
(30450, 2, -3074.66, -2870.62, 35.5564, 0, 0, 0, 0, 0),
(30450, 3, -3068.83, -2878.9, 39.7268, 0, 0, 0, 0, 0),
(30450, 4, -3075.73, -2879.89, 35.0886, 0, 0, 0, 0, 0),
(30450, 5, -3082.28, -2878.8, 34.1155, 0, 0, 0, 0, 0),
(30450, 6, -3090.32, -2882.07, 34.8022, 0, 0, 0, 0, 0),
(30450, 7, -3094.6, -2885.3, 35.1155, 0, 0, 0, 0, 0),
(30450, 8, -3099.95, -2890.04, 34.6797, 0, 0, 0, 0, 0),
(30450, 9, -3101.65, -2898.47, 34.4566, 0, 0, 0, 0, 0),
(30450, 10, -3100.24, -2912.59, 36.0703, 0, 0, 0, 0, 0),
(30450, 11, -3096.2, -2918.31, 40.525, 0, 0, 0, 0, 0),
(30450, 12, -3092.2, -2921.99, 42.586, 0, 0, 0, 0, 0),
(30450, 13, -3095.92, -2918.65, 40.525, 0, 0, 0, 0, 0),
(30450, 14, -3100.24, -2912.59, 36.0703, 0, 0, 0, 0, 0),
(30450, 15, -3101.64, -2898.68, 34.453, 0, 0, 0, 0, 0),
(30450, 16, -3099.95, -2890.04, 34.6797, 0, 0, 0, 0, 0),
(30450, 17, -3094.6, -2885.3, 35.1155, 0, 0, 0, 0, 0),
(30450, 18, -3090.32, -2882.07, 34.8022, 0, 0, 0, 0, 0),
(30450, 19, -3082.28, -2878.8, 34.1155, 0, 0, 0, 0, 0),
(30450, 20, -3075.73, -2879.89, 35.0886, 0, 0, 0, 0, 0),
(30450, 21, -3068.83, -2878.9, 39.7268, 0, 0, 0, 0, 0),
(30450, 22, -3074.66, -2870.62, 35.5564, 0, 0, 0, 0, 0),
(30450, 23, -3081.79, -2868.61, 34.6922, 0, 0, 0, 0, 0),
(30450, 24, -3089.66, -2871.72, 33.9905, 0, 0, 0, 0, 0);

-- Classic [1066]
-- Added support for Dark Coffer event in Blackrock Depths
-- Added missing GO (portraits and nameplates) and put them into pools
-- Fixed texts on nameplates GOs
-- Added script to spawn Dark Keepers NPCs (one per instance)
-- Added waypoints for one of the Dark Keeper
-- Prevent exploit of the Dark Coffer
-- Various fixes: flags, factions, respawn time...
-- Added missing GO spawns (Dark Keeper Nameplate and Dark Keeper Portrait)
-- Fixed spawn time
DELETE FROM gameobject WHERE guid IN (66033, 66038, 66065, 66116, 66117, 66118, 66119, 66120, 66123, 66124);
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(66033, 164820, 230, 831.54, -339.529, -46.682, 0.802851, 0, 0, 0.390731, 0.920505, 3 * 60 * 60 * 1000, 100, 1),
(66038, 164821, 230, 831.54, -339.529, -46.682, 0.802851, 0, 0, 0.390731, 0.920505, 3 * 60 * 60 * 1000, 100, 1),
(66065, 164822, 230, 831.54, -339.529, -46.682, 0.802851, 0, 0, 0.390731, 0.920505, 3 * 60 * 60 * 1000, 100, 1),
(66116, 164823, 230, 831.54, -339.529, -46.682, 0.802851, 0, 0, 0.390731, 0.920505, 3 * 60 * 60 * 1000, 100, 1),
(66117, 164824, 230, 831.54, -339.529, -46.682, 0.802851, 0, 0, 0.390731, 0.920505, 3 * 60 * 60 * 1000, 100, 1),
(66118, 164818, 230, 831.471, -339.58, -46.7698, 0.820305, 0, 0, 0.398749, 0.91706, 3 * 60 * 60 * 1000, 100, 1),
(66119, 161456, 230, 831.471, -339.58, -46.7698, 0.820305, 0, 0, 0.398749, 0.91706, 3 * 60 * 60 * 1000, 100, 1),
(66120, 161457, 230, 831.471, -339.58, -46.7698, 0.820305, 0, 0, 0.398749, 0.91706, 3 * 60 * 60 * 1000, 100, 1),
(66123, 161458, 230, 831.471, -339.58, -46.7698, 0.820305, 0, 0, 0.398749, 0.91706, 3 * 60 * 60 * 1000, 100, 1),
(66124, 161459, 230, 831.471, -339.58, -46.7698, 0.820305, 0, 0, 0.398749, 0.91706, 3 * 60 * 60 * 1000, 100, 1);
UPDATE gameobject SET spawntimesecs = 3 * 60 * 60 * 1000 WHERE id IN (164825, 164819);
-- Fixed wrong flags for some of the Dark Keeper Nameplate
UPDATE gameobject_template SET flags = 0 WHERE entry IN (164820, 164821, 164822, 164823, 164824, 164825);
-- Group all the GOs into pools and pools of pools to have only one Dark Keeper per instance
DELETE FROM pool_gameobject WHERE guid IN (66033, 66038, 66065, 66116, 66117, 66118, 66119, 66120, 66123, 66124, 43130, 43131);
INSERT INTO pool_gameobject VALUES
(43130, 25485, 100 ,'Dark Keeper Nameplate'),
(43131, 25485, 100 ,'Dark Keeper Nameplate'),
(66033, 25486, 100, 'Dark Keeper Nameplate'),
(66119, 25486, 100, 'Dark Keeper Nameplate'),
(66038, 25487, 100, 'Dark Keeper Nameplate'),
(66120, 25487, 100, 'Dark Keeper Nameplate'),
(66065, 25488, 100, 'Dark Keeper Nameplate'),
(66123, 25488, 100, 'Dark Keeper Nameplate'),
(66116, 25489, 100, 'Dark Keeper Nameplate'),
(66124, 25489, 100, 'Dark Keeper Nameplate'),
(66117, 25490, 100, 'Dark Keeper Nameplate'),
(66118, 25490, 100, 'Dark Keeper Nameplate');
DELETE FROM pool_pool WHERE pool_id BETWEEN 25485 AND 25490;
INSERT INTO pool_pool VALUES
(25485, 25491, 0, 'Dark Keeper Nameplate'),
(25486, 25491, 0, 'Dark Keeper Nameplate'),
(25487, 25491, 0, 'Dark Keeper Nameplate'),
(25488, 25491, 0, 'Dark Keeper Nameplate'),
(25489, 25491, 0, 'Dark Keeper Nameplate'),
(25490, 25491, 0, 'Dark Keeper Nameplate');
DELETE FROM pool_template WHERE entry BETWEEN 25485 AND 25491;
INSERT INTO pool_template VALUES
(25485, 2, 'Dark Keeper Nameplate'),
(25486, 2, 'Dark Keeper Nameplate'),
(25487, 2, 'Dark Keeper Nameplate'),
(25488, 2, 'Dark Keeper Nameplate'),
(25489, 2, 'Dark Keeper Nameplate'),
(25490, 2, 'Dark Keeper Nameplate'),
(25491, 1, 'MASTER - Dark Keeper Nameplate');
-- Fixed the name plate texts which were using wrong text or bad line breaks
UPDATE page_text SET text = 'Vorfalk Irongourd$B$BVorfalk works the store room of the Grim Guzzler, and his sacrifice to the Dark Keepers runs deep.$B$BMay his spirit hold strong.' WHERE entry = 1431;
UPDATE page_text SET text = 'Bethek Stormbrow$B$BBethek\'s wanderings take him deep within Blackrock. The secrets of the mountain beckon him.$B$BMay his spirit never falter.' WHERE entry = 1432;
UPDATE page_text SET text = 'Uggel Hammerhand$B$BUggel is a skilled and solemn chiseler, and when not burdened with the dark key, his hands shape great works in the Hall of Crafting.' WHERE entry = 1433;
UPDATE page_text SET text = 'Zimrel Darktooth$B$BWhen the madness of the dark key takes hold of Zimrel, only the screams of the dying can soothe him.$B$BFor his sacrifice, he will always have a bench above the arena.  May our blood sports temper the rage in his heart.' WHERE entry = 1434;
UPDATE page_text SET text = 'Ofgut Stonefist$B$BThose fallen before Dark Keeper Ofgut\'s hammer cannot be counted.$B$BThe soldiers of the West Garrison bow in awe as he passes.  For who among them can look into the eyes of Ofgut and see the secrets the dark key whispers?.' WHERE entry = 1435;
UPDATE page_text SET text = 'Pelver Deepstomp$B$BDark Keeper Pelver is our most honored disciple.  He has borne the key for longer than any, and it has cost him dearly.  When he is called for his burden, he is guarded in the Domicile.$B$BHis sacrifice is cherished, and he will remain in our hearts for many years... after the darkness takes him.' WHERE entry = 1436;
-- Added script for each Dark Keeper portrait in order to spawn the respective Dark Keeper NPC and his guards
DELETE FROM dbscripts_on_go_template_use WHERE id IN (161456, 161457, 161458, 161459, 164818, 164819);
INSERT INTO dbscripts_on_go_template_use VALUES
(161456, 1, 10, 9437, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 815.276, -168.652, -49.6699, 6.23083, 'Spawn Dark Keeper Vorfalk and his guards'),
(161456, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 816.276, -167.652, -49.6699, 5.58505, 'Spawn Dark Keeper Vorfalk and his guards'),
(161456, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 817.276, -166.652, -49.6699, 4.88692, 'Spawn Dark Keeper Vorfalk and his guards'),
(161458, 1, 10, 9439, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 901.537, -359.291, -49.908, 3.31613, 'Spawn Dark Keeper Uggel and his guards'),
(161458, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 903.295, -356.783, -49.8522, 3.68264, 'Spawn Dark Keeper Uggel and his guards'),
(161458, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 902.896, -361.966, -50.0812, 2.74017, 'Spawn Dark Keeper Uggel and his guards'),
(161459, 1, 10, 9441, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 549.701, -214.474, -36.8893, 0.331613, 'Spawn Dark Keeper Zimrel and his guards'),
(161459, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 549.796, -217.958, -36.8654, 0.890118, 'Spawn Dark Keeper Zimrel and his guards'),
(161459, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 548.083, -212.932, -36.8628, 6.26573, 'Spawn Dark Keeper Zimrel and his guards'),
(164818, 1, 10, 9442, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 679.491, -7.79026, -59.9754, 1.8326, 'Spawn Dark Keeper Ofgut and his guards'),
(164818, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 680.491, -6.79026, -59.9754, 2.18166, 'Spawn Dark Keeper Ofgut and his guards'),
(164818, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 681.491, -5.79026, -59.9754, 2.58309, 'Spawn Dark Keeper Ofgut and his guards'),
(164819, 1, 10, 9443, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 802.755, -245.25, -43.2198, 2.93215, 'Spawn Dark Keeper Pelver and his guards'),
(164819, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 805.289, -243.172, -43.2198, 3.42085, 'Spawn Dark Keeper Pelver and his guards'),
(164819, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 801.935, -248.841, -43.2198, 1.95477, 'Spawn Dark Keeper Pelver and his guards'),
(161457, 1, 10, 9438, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 862.461, -309.724, -49.8757, 3.85883, 'Spawn Dark Keeper Bethek and his guards'),
(161457, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 863.219, -305.041, -49.8751, 3.68264, 'Spawn Dark Keeper Bethek and his guards'),
(161457, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 860.947, -302.54, -49.8787, 4.04916, 'Spawn Dark Keeper Bethek and his guards'),
(161457, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 864.232, -303.735, -49.8527, 3.735, 'Spawn Dark Keeper Bethek and his guards'),
(161457, 1, 10, 9445, 3 * 60 * 60 * 1000, 0, 0, 0, 0, 0, 0, 0, 862.676, -301.922, -49.8527, 3.9619, 'Spawn Dark Keeper Bethek and his guards');
-- Made Dark Coffer (GO 160845) usable by players only once they have open the Dark Coffer Door (GO 174565) 
DELETE FROM dbscripts_on_go_template_use WHERE id = 174565;
INSERT INTO dbscripts_on_go_template_use (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(174565, 0, 27, 0x08, 0, 160845, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
-- Fixed spawn time of GO 160836 (Relic Coffer): they were respawning in 10 min, making them easily exploitable
UPDATE gameobject SET spawntimesecs = 3 * 60 * 60 * 1000 WHERE id = 160836;
-- Fixed faction and movement of the Dark Keepers: they are Dark Iron Dwarves and not wolves.
-- Only NPC 9438 (Dark Keeper Bethek) should move (WP movement)
UPDATE creature_template SET FactionAlliance = 54, FactionHorde = 54, MovementType = 0 WHERE Entry IN (9437, 9445, 9439, 9441, 9442, 9443);
UPDATE creature_template SET FactionAlliance = 54, FactionHorde = 54, MovementType = 2 WHERE Entry = 9438;
UPDATE creature_template SET EquipmentTemplateId = 156 WHERE Entry = 9445;
-- Waypoints for NPC 9438 (Dark Keeper Bethek)
-- He will now spawn in the back of the player using the Nameplate and kick his/her ass
DELETE FROM creature_movement_template WHERE entry = 9438;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(9438, 1, 855.505, -309.724, -50.1398, 0, 0, 0, 0, 0),
(9438, 2, 847.214, -316.912, -50.2843, 0, 0, 0, 0, 0),
(9438, 3, 842.652, -321.334, -50.2848, 0, 0, 0, 0, 0),
(9438, 4, 839.316, -324.232, -50.6638, 0, 0, 0, 0, 0),
(9438, 5, 833.983, -329.089, -50.6638, 0, 0, 0, 0, 0),
(9438, 6, 822.84, -339.999, -50.1851, 0, 0, 0, 0, 0),
(9438, 7, 810.483, -350.225, -50.5781, 0, 0, 0, 0, 0),
(9438, 8, 806.646, -353.272, -50.1957, 0, 0, 0, 0, 0),
(9438, 9, 806.646, -353.272, -50.1957, 0, 0, 0.715585, 0, 0);
-- Linked Dark Guards with Dark Keeper Bethek: aggro and follow
DELETE FROM creature_linking_template WHERE entry = 9445;
INSERT INTO creature_linking_template VALUES
(9445, 230, 9438, 515, 20);

-- Classic [1064]
-- Added missing lore in quest 3701 
-- Added missing lore text to GOs 153556 (Thaurissan Relic) in Burning Steppes
-- Grz3s: 8887 must be around to send whisper
DELETE FROM dbscripts_on_go_use WHERE id IN (4511, 4512, 4538, 4539, 4540, 4594, 4611, 6782, 6786, 6797, 6811, 6845, 6848, 4542, 4513, 4514, 4515, 4541, 4612, 6770, 6784, 6793, 6802, 6841, 6847, 6853);
INSERT INTO dbscripts_on_go_use (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(4511, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7716.94, -2033.14, 133.439, 0, ''),
(4511, 2, 0, 0, 0, 8887, 10, 3, 2000000544, 2000000545, 2000000546, 2000000547, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4512, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7766.91, -2013.52, 135.337, 0, ''),
(4512, 2, 0, 0, 0, 8887, 10, 3, 2000000545, 2000000546, 2000000547, 2000000548, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4538, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7793.7, -1961.65, 134.118, 0, ''),
(4538, 2, 0, 0, 0, 8887, 10, 3, 2000000546, 2000000547, 2000000548, 2000000549, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4539, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7891.04, -2188.15, 133.436, 0, ''),
(4539, 2, 0, 0, 0, 8887, 10, 3, 2000000547, 2000000548, 2000000549, 2000000550, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4540, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7779.31, -1855.2, 134.131, 0, ''),
(4540, 2, 0, 0, 0, 8887, 10, 3, 2000000548, 2000000549, 2000000550, 2000000551, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4594, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7835.78, -2067.96, 136.252, 0, ''),
(4594, 2, 0, 0, 0, 8887, 10, 3, 2000000549, 2000000550, 2000000551, 2000000544, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4611, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7800.4, -1900.31, 135.089, 0, ''),
(4611, 2, 0, 0, 0, 8887, 10, 3, 2000000550, 2000000551, 2000000544, 2000000545, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6782, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7844.55, -1945.58, 137.301, 0, ''),
(6782, 2, 0, 0, 0, 8887, 10, 3, 2000000551, 2000000544, 2000000545, 2000000546, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6786, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7725.99, -2125.54, 133.439, 0, ''),
(6786, 2, 0, 0, 0, 8887, 10, 3, 2000000544, 2000000545, 2000000546, 2000000547, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6797, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7741.42, -1948.2, 136.462, 0, ''),
(6797, 2, 0, 0, 0, 8887, 10, 3, 2000000545, 2000000546, 2000000547, 2000000548, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6811, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7774.49, -2235, 134.134, 0, ''),
(6811, 2, 0, 0, 0, 8887, 10, 3, 2000000546, 2000000547, 2000000548, 2000000549, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6845, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7804.24, -2103.44, 133.439, 0, ''),
(6845, 2, 0, 0, 0, 8887, 10, 3, 2000000547, 2000000548, 2000000549, 2000000550, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6848, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7892.84, -2144.82, 120.545, 0, ''),
(6848, 2, 0, 0, 0, 8887, 10, 3, 2000000548, 2000000549, 2000000550, 2000000551, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4542, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7888.89, -2004.36, 135.828, 0, ''),
(4542, 2, 0, 0, 0, 8887, 10, 3, 2000000549, 2000000550, 2000000551, 2000000544, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4513, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7820.68, -2203.07, 133.439, 0, ''),
(4513, 2, 0, 0, 0, 8887, 10, 3, 2000000550, 2000000551, 2000000544, 2000000545, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4514, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7715.64, -1846.73, 135.942, 0, ''),
(4514, 2, 0, 0, 0, 8887, 10, 3, 2000000551, 2000000544, 2000000545, 2000000546, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4515, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7884.96, -2246.48, 136.311, 0, ''),
(4515, 2, 0, 0, 0, 8887, 10, 3, 2000000544, 2000000545, 2000000546, 2000000547, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4541, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7741.91, -2292.93, 136.29, 0, ''),
(4541, 2, 0, 0, 0, 8887, 10, 3, 2000000545, 2000000546, 2000000547, 2000000548, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(4612, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7748.03, -2078.4, 133.439, 0, ''),
(4612, 2, 0, 0, 0, 8887, 10, 3, 2000000546, 2000000547, 2000000548, 2000000549, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6770, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7843.89, -1992.06, 139.809, 0, ''),
(6770, 2, 0, 0, 0, 8887, 10, 3, 2000000547, 2000000548, 2000000549, 2000000550, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6784, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7775.43, -2313.51, 137.082, 0, ''),
(6784, 2, 0, 0, 0, 8887, 10, 3, 2000000548, 2000000549, 2000000550, 2000000551, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6793, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7793.45, -1804.18, 132.184, 0, ''),
(6793, 2, 0, 0, 0, 8887, 10, 3, 2000000549, 2000000550, 2000000551, 2000000544, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6802, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7710.73, -2178.15, 131.896, 0, ''),
(6802, 2, 0, 0, 0, 8887, 10, 3, 2000000550, 2000000551, 2000000544, 2000000545, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6841, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7828.93, -2265.71, 137.186, 0, ''),
(6841, 2, 0, 0, 0, 8887, 10, 3, 2000000551, 2000000544, 2000000545, 2000000546, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6847, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7693.64, -2387.06, 147.656, 0, ''),
(6847, 2, 0, 0, 0, 8887, 10, 3, 2000000544, 2000000545, 2000000546, 2000000547, 0, 0, 0, 0, 'Thaurissan relic - random whisper'),
(6853, 1, 10, 8887, 5000, 0, 0, 0, 0, 0, 0, 0, -7757.94, -2159.73, 133.439, 0, ''),
(6853, 2, 0, 0, 0, 8887, 10, 3, 2000000545, 2000000546, 2000000547, 2000000548, 0, 0, 0, 0, 'Thaurissan relic - random whisper');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000544 AND 2000000551;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000544, 'You will perish here. <Your mind fills with visions of chaos and destruction.>', 0, 4, 0, 0, NULL),
(2000000545, 'Leave this place. <The relic emits a white hot arc of flame. A memory has been gained: A lone Dark Iron dwarf is surrounded by seven corpses, kneeling before a monolith of flame.>', 0, 4, 0, 0, NULL),
(2000000546, 'Defiler... you will be punished for this incursion. <A symbol of flame radiates from the relic before it crumbles to the earth.>', 0, 4, 0, 0, NULL),
(2000000547, 'Help us, outsider. <The relic crumbles to dust. A vision of eight Dark Iron dwarves performing some sort of ritual fills your head.>', 0, 4, 0, 0, NULL),
(2000000548, 'Your existence is acknowledged. <The relic turns to dust. Your head throbs with newfound wisdom. Something evil lurks in the heart of the mountain.>', 0, 4, 0, 0, NULL),
(2000000549, 'Leave this place. <The relic emits a white hot arc of flame. A memory has been gained: A lone Dark Iron dwarf is surrounded by seven corpses, kneeling before a monolith of flame.>', 0, 4, 0, 0, NULL),
(2000000550, 'He cannot be defeated. <The relic burns to nothing. The memories it held are now your own. This city was destroyed by a being not of this world.>', 0, 4, 0, 0, NULL),
(2000000551, 'Do not taint these ruins, mortal. <You are engulfed in a blinding flash of light. A creature composed entirely of flame is the only thing you can remember seeing.>', 0, 4, 0, 0, NULL);

-- Classic [1062]
-- DM:N - Stomper Kreeg and Guard Mol'dar
DELETE FROM creature_movement WHERE id IN (138185, 138184);
UPDATE creature SET position_x = 491.2311, position_y = 97.38786, position_z = -2.500396, orientation = 4.031711, currentwaypoint = 0, MovementType = 0 WHERE guid = 138185;
UPDATE creature SET position_x = 410.7114, position_y = -3.150411, position_z = -24.55797, orientation = 5.288348, spawndist = 3, currentwaypoint = 0, MovementType = 1 WHERE guid = 138184;

-- Classic [1061]
-- Mauraudon - Deeprot Tangler 
UPDATE creature SET modelid = 0, position_x = 753.899, position_y = -478.24, position_z = -52.9061, orientation = 5.36458, spawndist = 0, MovementType = 2 WHERE guid = 55090;
UPDATE creature SET modelid = 0, position_x = 807.818, position_y = -373.907, position_z = -59.0394, orientation = 4.50135, spawndist = 0, MovementType = 2 WHERE guid = 54362;
UPDATE creature SET modelid = 0, position_x = 712.483, position_y = -340.126, position_z = 51.8134, orientation = 4.2224, spawndist = 0, MovementType = 2 WHERE guid = 54682;
DELETE FROM creature_movement WHERE id IN (55090, 54362, 54682);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(55090, 1, 763.721, -491.101, -52.9628, 0, 0, 0, 0, 0),
(55090, 2, 771.351, -514.9, -52.809, 0, 0, 0, 0, 0),
(55090, 3, 778.083, -526.269, -50.1292, 0, 0, 0, 0, 0),
(55090, 4, 795.591, -531.922, -46.8029, 0, 0, 0, 0, 0),
(55090, 5, 806.335, -516.47, -41.7183, 0, 0, 0, 0, 0),
(55090, 6, 803.93, -498.025, -40.1386, 0, 0, 0, 0, 0),
(55090, 7, 790.813, -490.499, -39.9062, 0, 0, 0, 0, 0),
(55090, 8, 775.956, -484.787, -40.554, 0, 0, 0, 0, 0),
(55090, 9, 771, -468.174, -41.1924, 0, 0, 0, 0, 0),
(55090, 10, 748.947, -467.97, -38.6926, 0, 0, 0, 0, 0),
(55090, 11, 733.283, -472.854, -40.6056, 0, 0, 0, 0, 0),
(55090, 12, 732.63, -485.955, -41.1771, 0, 0, 0, 0, 0),
(55090, 13, 737.17, -503.406, -41.0881, 0, 0, 0, 0, 0),
(55090, 14, 731.663, -522.193, -41.3618, 0, 0, 0, 0, 0),
(55090, 15, 743.795, -546.76, -33.0687, 0, 0, 0, 0, 0),
(55090, 16, 761.255, -559.478, -32.9473, 0, 0, 0, 0, 0),
(55090, 17, 770.305, -540.82, -36.2739, 0, 0, 0, 0, 0),
(55090, 18, 761.255, -559.478, -32.9473, 0, 0, 0, 0, 0),
(55090, 19, 743.795, -546.76, -33.0687, 0, 0, 0, 0, 0),
(55090, 20, 731.642, -522.264, -41.3582, 0, 0, 0, 0, 0),
(55090, 21, 737.17, -503.406, -41.0881, 0, 0, 0, 0, 0),
(55090, 22, 732.63, -485.955, -41.1771, 0, 0, 0, 0, 0),
(55090, 23, 733.283, -472.854, -40.6056, 0, 0, 0, 0, 0),
(55090, 24, 748.947, -467.97, -38.6926, 0, 0, 0, 0, 0),
(55090, 25, 771, -468.174, -41.1924, 0, 0, 0, 0, 0),
(55090, 26, 775.956, -484.787, -40.554, 0, 0, 0, 0, 0),
(55090, 27, 790.813, -490.499, -39.9062, 0, 0, 0, 0, 0),
(55090, 28, 803.93, -498.025, -40.1386, 0, 0, 0, 0, 0),
(55090, 29, 806.335, -516.47, -41.7183, 0, 0, 0, 0, 0),
(55090, 30, 795.591, -531.922, -46.8029, 0, 0, 0, 0, 0),
(55090, 31, 778.083, -526.269, -50.1292, 0, 0, 0, 0, 0),
(55090, 32, 771.351, -514.9, -52.809, 0, 0, 0, 0, 0),
(55090, 33, 763.721, -491.101, -52.9628, 0, 0, 0, 0, 0),
(55090, 34, 745.018, -470.13, -52.932, 0, 0, 0, 0, 0),
(54362, 1, 802.307, -399.631, -58.6786, 0, 0, 0, 0, 0),
(54362, 2, 794.326, -424.056, -53.7634, 0, 0, 0, 0, 0),
(54362, 3, 804.861, -435.457, -54.3872, 0, 0, 0, 0, 0),
(54362, 4, 828.242, -447.366, -56.3251, 0, 0, 0, 0, 0),
(54362, 5, 863.367, -424.879, -52.4803, 0, 0, 0, 0, 0),
(54362, 6, 880.127, -407.996, -51.9375, 0, 0, 0, 0, 0),
(54362, 7, 881.719, -383.418, -52.0587, 0, 0, 0, 0, 0),
(54362, 8, 870.876, -356.302, -51.9569, 0, 0, 0, 0, 0),
(54362, 9, 847.458, -345.491, -52.0496, 0, 0, 0, 0, 0),
(54362, 10, 826.787, -344.677, -51.8641, 0, 0, 0, 0, 0),
(54362, 11, 808.003, -347.446, -51.7879, 0, 0, 0, 0, 0),
(54362, 12, 775.91, -328.178, -50.0448, 0, 0, 0, 0, 0),
(54362, 13, 756.83, -326.607, -51.5775, 0, 0, 0, 0, 0),
(54362, 14, 775.91, -328.178, -50.0448, 0, 0, 0, 0, 0),
(54362, 15, 808.003, -347.446, -51.7879, 0, 0, 0, 0, 0),
(54362, 16, 826.787, -344.677, -51.8641, 0, 0, 0, 0, 0),
(54362, 17, 847.458, -345.491, -52.0496, 0, 0, 0, 0, 0),
(54362, 18, 870.876, -356.302, -51.9569, 0, 0, 0, 0, 0),
(54362, 19, 881.719, -383.418, -52.0587, 0, 0, 0, 0, 0),
(54362, 20, 880.127, -407.996, -51.9375, 0, 0, 0, 0, 0),
(54362, 21, 863.367, -424.879, -52.4803, 0, 0, 0, 0, 0),
(54362, 22, 828.242, -447.366, -56.3251, 0, 0, 0, 0, 0),
(54362, 23, 804.861, -435.457, -54.3872, 0, 0, 0, 0, 0),
(54362, 24, 794.326, -424.056, -53.7634, 0, 0, 0, 0, 0),
(54362, 25, 802.307, -399.631, -58.6786, 0, 0, 0, 0, 0),
(54362, 26, 806.3, -374.526, -59.1968, 0, 0, 0, 0, 0),
(54682, 1, 704.78, -354.567, -52.0194, 0, 0, 0, 0, 0),
(54682, 2, 688.518, -374.707, -52.0337, 0, 0, 0, 0, 0),
(54682, 3, 664.968, -367.766, -52.0194, 0, 0, 0, 0, 0),
(54682, 4, 653.587, -356.119, -52.0194, 0, 0, 0, 0, 0),
(54682, 5, 632.64, -350.617, -52.0194, 0, 0, 0, 0, 0),
(54682, 6, 619.242, -351.718, -52.0194, 0, 0, 0, 0, 0),
(54682, 7, 605.31, -377.231, -52.0194, 0, 0, 0, 0, 0),
(54682, 8, 618.102, -353.072, -52.0194, 0, 0, 0, 0, 0),
(54682, 9, 646.418, -346.681, -52.0194, 0, 0, 0, 0, 0),
(54682, 10, 656.121, -333.659, -52.0194, 0, 0, 0, 0, 0),
(54682, 11, 642.682, -309.279, -52.0213, 0, 0, 0, 0, 0),
(54682, 12, 636.873, -290.451, -52.4324, 0, 0, 0, 0, 0),
(54682, 13, 633.122, -257.915, -53.0354, 0, 0, 0, 0, 0),
(54682, 14, 631.546, -229.03, -59.214, 0, 0, 0, 0, 0),
(54682, 15, 632.252, -273.576, -53.5685, 0, 0, 0, 0, 0),
(54682, 16, 639.393, -299.352, -52.0207, 0, 0, 0, 0, 0),
(54682, 17, 649.654, -322.972, -52.0194, 0, 0, 0, 0, 0),
(54682, 18, 662.256, -329.124, -52.0194, 0, 0, 0, 0, 0),
(54682, 19, 675.187, -326.388, -52.0826, 0, 0, 0, 0, 0),
(54682, 20, 692.328, -322.362, -52.0194, 0, 0, 0, 0, 0),
(54682, 21, 709.139, -325.213, -51.851, 0, 0, 0, 0, 0),
(54682, 22, 692.328, -322.362, -52.0194, 0, 0, 0, 0, 0),
(54682, 23, 675.211, -326.383, -52.0797, 0, 0, 0, 0, 0),
(54682, 24, 662.4, -329.094, -52.0194, 0, 0, 0, 0, 0),
(54682, 25, 649.654, -322.972, -52.0194, 0, 0, 0, 0, 0),
(54682, 26, 639.393, -299.352, -52.0207, 0, 0, 0, 0, 0),
(54682, 27, 632.252, -273.576, -53.5685, 0, 0, 0, 0, 0),
(54682, 28, 631.546, -229.03, -59.214, 0, 0, 0, 0, 0),
(54682, 29, 633.122, -257.915, -53.0354, 0, 0, 0, 0, 0),
(54682, 30, 636.835, -290.33, -52.5084, 0, 0, 0, 0, 0),
(54682, 31, 642.682, -309.279, -52.0213, 0, 0, 0, 0, 0),
(54682, 32, 656.121, -333.659, -52.0194, 0, 0, 0, 0, 0),
(54682, 33, 646.418, -346.681, -52.0194, 0, 0, 0, 0, 0),
(54682, 34, 618.102, -353.072, -52.0194, 0, 0, 0, 0, 0),
(54682, 35, 605.31, -377.231, -52.0194, 0, 0, 0, 0, 0),
(54682, 36, 619.242, -351.718, -52.0194, 0, 0, 0, 0, 0),
(54682, 37, 632.64, -350.617, -52.0194, 0, 0, 0, 0, 0),
(54682, 38, 653.587, -356.119, -52.0194, 0, 0, 0, 0, 0),
(54682, 39, 664.968, -367.766, -52.0194, 0, 0, 0, 0, 0),
(54682, 40, 688.518, -374.707, -52.0337, 0, 0, 0, 0, 0),
(54682, 41, 704.78, -354.567, -52.0194, 0, 0, 0, 0, 0),
(54682, 42, 714.44, -332.152, -51.7661, 0, 0, 0, 0, 0);

-- Classic [1060]
-- Maraudon - Putridus Shadowstalker ...
UPDATE creature SET modelid = 0, position_x = 837.646, position_y = -346.113, position_z = -52.0496, orientation = 0.163293, spawndist = 0, MovementType = 2 WHERE guid = 54767;
UPDATE creature SET modelid = 0, position_x = 788.881, position_y = -336.129, position_z = -50.4012, orientation = 2.12786, spawndist = 0, MovementType = 2 WHERE guid = 54721;
UPDATE creature SET modelid = 0, position_x = 617.64, position_y = -223.231, position_z = -61.1964, orientation = 5.81495, spawndist = 0 WHERE guid = 54733;
DELETE FROM creature_movement WHERE id IN (54721, 54767, 54733);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(54721, 1, 784.514, -329.119, -50.0284, 0, 0, 0, 0, 0),
(54721, 2, 764.984, -324.438, -51.5668, 0, 0, 0, 0, 0),
(54721, 3, 749.575, -337.565, -50.711, 0, 0, 0, 0, 0),
(54721, 4, 726.619, -332.595, -50.9028, 0, 0, 0, 0, 0),
(54721, 5, 710.256, -333.295, -51.8757, 0, 0, 0, 0, 0),
(54721, 6, 689.742, -330.869, -52.1619, 0, 0, 0, 0, 0),
(54721, 7, 674.977, -327.453, -52.1277, 0, 0, 0, 0, 0),
(54721, 8, 664.431, -341.292, -52.4921, 0, 0, 0, 0, 0),
(54721, 9, 674.977, -327.453, -52.1277, 0, 0, 0, 0, 0),
(54721, 10, 689.742, -330.869, -52.1619, 0, 0, 0, 0, 0),
(54721, 11, 710.256, -333.295, -51.8757, 0, 0, 0, 0, 0),
(54721, 12, 726.619, -332.595, -50.9028, 0, 0, 0, 0, 0),
(54721, 13, 749.332, -337.513, -50.7263, 0, 0, 0, 0, 0),
(54721, 14, 764.902, -324.507, -51.5706, 0, 0, 0, 0, 0),
(54721, 15, 784.514, -329.119, -50.0284, 0, 0, 0, 0, 0),
(54721, 16, 792.5, -339.12, -51.1177, 0, 0, 0, 0, 0),
(54767, 1, 869.798, -340.816, -50.5748, 0, 0, 0, 0, 0),
(54767, 2, 882.282, -377.741, -52.0554, 0, 0, 0, 0, 0),
(54767, 3, 886.861, -419.037, -52.3727, 0, 0, 0, 0, 0),
(54767, 4, 886.861, -419.037, -52.3727, 0, 0, 0, 0, 0),
(54767, 5, 882.282, -377.741, -52.0554, 0, 0, 0, 0, 0),
(54767, 6, 869.798, -340.816, -50.5748, 0, 0, 0, 0, 0),
(54767, 7, 829.586, -349.214, -52.0311, 0, 0, 0, 0, 0),
(54733, 1, 629.567, -229.285, -59.0616, 0, 0, 0, 0, 0),
(54733, 2, 630.475, -251.076, -52.8189, 0, 0, 0, 0, 0),
(54733, 3, 635.491, -278.567, -53.5015, 0, 0, 0, 0, 0),
(54733, 4, 642.036, -307.16, -52.0211, 0, 0, 0, 0, 0),
(54733, 5, 644.665, -314.411, -52.0764, 0, 0, 0, 0, 0),
(54733, 6, 652.222, -324.701, -52.0194, 0, 0, 0, 0, 0),
(54733, 7, 650.916, -339.38, -52.0194, 0, 0, 0, 0, 0),
(54733, 8, 631.083, -348.107, -52.0194, 0, 0, 0, 0, 0),
(54733, 9, 618.584, -352.651, -52.0194, 0, 0, 0, 0, 0),
(54733, 10, 615.864, -362.478, -52.0194, 0, 0, 0, 0, 0),
(54733, 11, 601.241, -383.172, -52.0194, 0, 0, 0, 0, 0),
(54733, 12, 615.727, -362.671, -52.0194, 0, 0, 0, 0, 0),
(54733, 13, 618.584, -352.651, -52.0194, 0, 0, 0, 0, 0),
(54733, 14, 631.083, -348.107, -52.0194, 0, 0, 0, 0, 0);

-- Classic [1059]
-- correct map for 165554 (Heart of the Mountain) in Blackrock Depths.
UPDATE gameobject SET map = 230 WHERE guid = 93892;

-- Classic [1057]
-- Wandering Eye of Kilrogg
UPDATE creature_template SET MinLevel = 60, MaxLevel = 60, HealthMultiplier = 0.1, ArmorMultiplier = 1, MinLevelHealth = 305, MaxLevelHealth = 305, MinMeleeDmg = 103.9, MaxMeleeDmg = 137.9, MinRangedDmg = 0, MaxRangedDmg = 0, Armor = 3791, MeleeAttackPower = 252, RangedAttackPower = 26, MinLootGold = 0, MaxLootGold = 0, MovementType = 1 WHERE Entry = 14386; 

-- Classic [1056]
-- Quest: A Terrible Purpose
-- The item "Nature's Whisper" will be mailed to players who complete this quest. 
DELETE FROM dbscripts_on_quest_end WHERE id = 8287;
INSERT INTO dbscripts_on_quest_end (id, command, datalong, datalong2, dataint, comments) VALUES
(8287, 38, 110, 0, 86400, 'Send Mail on QuestReward');
UPDATE quest_template SET RewMailTemplateId = 0, RewMailDelaySecs = 0, CompleteScript = 8287 WHERE entry = 8287;

-- Classic [1053]
-- BRD - Redundant NPCs 
-- Should be summoned by AT-Script 1786.
DELETE FROM creature WHERE guid IN (91106, 91107);
DELETE FROM creature_addon WHERE guid IN (91106, 91107);

-- Classic [1052]
-- BRD - Fineous Darkvire - 47631
UPDATE creature SET modelid = 0, position_x = 960.0227, position_y = -340.8864, position_z = -71.45806, orientation = 5.654867, MovementType = 2 WHERE guid = 47631;
UPDATE creature_template SET movementType = 2 WHERE entry = 9056;
DELETE FROM creature_movement WHERE id = 47631;
DELETE FROM creature_movement_template WHERE entry = 9056;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(9056, 1, 975.1074, -354.1521, -69.12189, 0, 0, 0, 0, 0),
(9056, 2, 984.4438, -363.9444, -65.90663, 0, 0, 0, 0, 0),
(9056, 3, 984.3798, -372.8271, -66.40864, 0, 0, 0, 0, 0),
(9056, 4, 976.4786, -381.1849, -63.92666, 0, 0, 0, 0, 0),
(9056, 5, 962.8773, -395.4465, -60.83775, 0, 0, 0, 0, 0),
(9056, 6, 950.4175, -408.5885, -57.13513, 0, 0, 0, 0, 0),
(9056, 7, 941.7361, -417.3307, -55.03955, 0, 0, 0, 0, 0),
(9056, 8, 931.4461, -413.3182, -55.3833, 0, 0, 0, 0, 0),
(9056, 9, 923.4091, -403.9856, -51.10405, 0, 0, 0, 0, 0),
(9056, 10, 914.4991, -394.1788, -49.44118, 3000, 0, 0, 0, 0),
(9056, 11, 905.6043, -403.5466, -48.72953, 0, 0, 0, 0, 0),
(9056, 12, 905.6043, -403.5466, -48.72953, 15000, 905601, 4.39823, 0, 0),
(9056, 13, 912.6644, -392.947, -49.27441, 0, 0, 0, 0, 0),
(9056, 14, 918.4413, -398.0002, -49.63673, 0, 0, 0, 0, 0),
(9056, 15, 926.4142, -407.2958, -52.62156, 0, 0, 0, 0, 0),
(9056, 16, 930.0383, -418.3499, -55.38773, 0, 0, 0, 0, 0),
(9056, 17, 930.1507, -424.8481, -55.86452, 0, 0, 0, 0, 0),
(9056, 18, 927.5943, -433.7152, -56.52362, 0, 0, 0, 0, 0),
(9056, 19, 927.5943, -433.7152, -56.52362, 15000, 905602, 4.049164, 0, 0),
(9056, 20, 936.1234, -427.9398, -56.10722, 0, 0, 0, 0, 0),
(9056, 21, 939.6413, -426.6046, -55.76141, 0, 0, 0, 0, 0),
(9056, 22, 944.4061, -426.6593, -54.99844, 0, 0, 0, 0, 0),
(9056, 23, 946.326, -428.0528, -54.6023, 0, 0, 0, 0, 0),
(9056, 24, 946.326, -428.0528, -54.6023, 3000, 905603, 0.1570796, 0, 0),
(9056, 25, 943.7764, -418.105, -54.94675, 0, 0, 0, 0, 0),
(9056, 26, 947.0441, -410.4389, -55.96638, 0, 0, 0, 0, 0),
(9056, 27, 955.1072, -403.4389, -59.51071, 0, 0, 0, 0, 0),
(9056, 28, 961.6575, -396.6303, -60.83775, 0, 0, 0, 0, 0),
(9056, 29, 968.2845, -389.0584, -60.83775, 0, 0, 0, 0, 0),
(9056, 30, 978.0145, -379.6125, -64.63842, 0, 0, 0, 0, 0),
(9056, 31, 986.5466, -370.8159, -66.56243, 90000, 905604, 0, 0, 0),
(9056, 32, 974.0306, -355.6249, -69.1521, 0, 0, 0, 0, 0),
(9056, 33, 967.597, -349.4773, -71.39046, 0, 0, 0, 0, 0),
(9056, 34, 963.2667, -343.7354, -71.73941, 210000, 0, 0, 0, 0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (905601, 905602, 905603, 905604);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(905601, 3, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fineous Darkvire - state_usestanding_nosheathe'),
(905601, 13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fineous Darkvire - oneshot_none'),
(905602, 3, 1, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fineous Darkvire - state_work'),
(905602, 13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fineous Darkvire - oneshot_none'),
(905603, 1, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fineous Darkvire - oneshot_kneel'),
(905604, 0, 20, 1, 3, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Fineous Darkvire - movementtype_random'),
(905604, 90, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fineous Darkvire - movementtype_waypoint'); 

-- Classic [1051]
-- BRD - Weapon Technician - 47294
UPDATE creature SET modelid = 0, position_x = 753.3763, position_y = 41.77242, position_z = -53.55002, orientation = 3.071779, spawndist = 0, MovementType = 2 WHERE guid = 47294;
DELETE FROM creature_movement WHERE id = 47294;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(47294, 1, 764.5972, 45.60373, -53.73522, 0, 0, 0, 0, 0),
(47294, 2, 774.8519, 60.06964, -53.67472, 0, 0, 0, 0, 0),
(47294, 3, 774.8519, 60.06964, -53.67472, 7000, 892001, 2.251475, 0, 0),
(47294, 4, 784.5489, 54.02416, -53.73522, 0, 0, 0, 0, 0),
(47294, 5, 785.1476, 35.85176, -53.69954, 0, 0, 0, 0, 0),
(47294, 6, 776.2892, 27.4625, -53.6479, 20000, 0, 0, 0, 0),
(47294, 7, 783.7801, 14.00154, -53.69062, 0, 0, 0, 0, 0),
(47294, 8, 786.7015, -12.90366, -53.69477, 0, 0, 0, 0, 0),
(47294, 9, 784.7334, -32.3172, -53.71082, 0, 0, 0, 0, 0),
(47294, 10, 784.6624, -39.48956, -53.74002, 0, 0, 0, 0, 0),
(47294, 11, 781.2883, -46.3105, -53.74668, 60000, 0, 0, 0, 0),
(47294, 12, 778.1983, -33.92217, -53.73601, 0, 0, 0, 0, 0),
(47294, 13, 783.9739, -27.30031, -53.69369, 0, 0, 0, 0, 0),
(47294, 14, 762.94, 8.657146, -53.70293, 0, 0, 0, 0, 0),
(47294, 15, 761.0406, 41.19921, -53.69276, 0, 0, 0, 0, 0),
(47294, 16, 753.7232, 41.79961, -53.63493, 25000, 0, 0, 0, 0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 892001;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(892001, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Weapon Technician - state_usestanding'),
(892001, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Weapon Technician - oneshot_none');

-- Classic [1050]
-- BRD - Weapon Technician - 90591
UPDATE creature SET modelid = 0, position_x = 771.2347, position_y = 54.82289, position_z = -53.72943, orientation = 3.631114, spawndist = 0, MovementType = 2 WHERE guid = 90591;
DELETE FROM creature_movement WHERE id = 90591;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(90591, 1, 762.993, 50.43193, -53.71109, 0, 0, 0, 0, 0),
(90591, 2, 761.4188, 29.33115, -53.62895, 0, 0, 0, 0, 0),
(90591, 3, 762.9675, 9.711073, -53.70116, 0, 0, 0, 0, 0),
(90591, 4, 769.3185, -3.635589, -53.72075, 0, 0, 0, 0, 0),
(90591, 5, 777.6145, -18.19811, -53.69268, 0, 0, 0, 0, 0),
(90591, 6, 792.4933, -18.67612, -53.638, 0, 0, 0, 0, 0),
(90591, 7, 802.6974, -9.927484, -53.67644, 0, 0, 0, 0, 0),
(90591, 8, 803.8586, 12.95672, -53.67821, 0, 0, 0, 0, 0),
(90591, 9, 803.3323, 36.05414, -53.6515, 0, 0, 0, 0, 0),
(90591, 10, 788.0638, 46.94962, -53.71598, 0, 0, 0, 0, 0),
(90591, 11, 773.9392, 57.17932, -53.70298, 0, 0, 0, 0, 0);

-- Classic [1049]
-- BRD - Weapon Technician - 90810
UPDATE creature SET modelid = 0, position_x =  808.8599, position_y = -36.32873, position_z = -53.71901, orientation = 2.305541, spawndist = 0, MovementType = 2 WHERE guid = 90810;
DELETE FROM creature_movement WHERE id = 90810;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(90810, 1, 795.791, -21.86399, -53.65269, 0, 0, 0, 0, 0),
(90810, 2, 802.4556, -8.263514, -53.68124, 0, 0, 0, 0, 0),
(90810, 3, 798.2274, 7.701714, -53.70551, 0, 0, 0, 0, 0),
(90810, 4, 781.1216, 8.112905, -53.70006, 0, 0, 0, 0, 0),
(90810, 5, 777.2592, 21.72934, -53.67865, 0, 0, 0, 0, 0),
(90810, 6, 761.2012, 22.35078, -53.64519, 0, 0, 0, 0, 0),
(90810, 7, 762.3487, 41.59404, -53.70325, 0, 0, 0, 0, 0),
(90810, 8, 799.3561, 43.34861, -53.67487, 0, 0, 0, 0, 0),
(90810, 9, 803.8307, 32.75117, -53.63648, 0, 0, 0, 0, 0),
(90810, 10, 799.3561, 43.34861, -53.67487, 0, 0, 0, 0, 0),
(90810, 11, 762.3487, 41.59404, -53.70325, 0, 0, 0, 0, 0),
(90810, 12, 761.2012, 22.35078, -53.64519, 0, 0, 0, 0, 0),
(90810, 13, 777.2592, 21.72934, -53.67865, 0, 0, 0, 0, 0),
(90810, 14, 781.1216, 8.112905, -53.70006, 0, 0, 0, 0, 0),
(90810, 15, 798.2274, 7.701714, -53.70551, 0, 0, 0, 0, 0),
(90810, 16, 802.4556, -8.263514, -53.68124, 0, 0, 0, 0, 0),
(90810, 17, 795.791, -21.86399, -53.65269, 0, 0, 0, 0, 0),
(90810, 18, 813.2817, -40.84308, -53.73804, 0, 0, 0, 0, 0);

-- Classic [1048]
-- BRD - Warbringer Construct - 47716
UPDATE creature SET position_x = 953.696, position_y = -333.891, position_z = -71.658, orientation = 5.45262, spawndist = 0 WHERE guid = 47716;
DELETE FROM creature_movement WHERE id = 47716;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(47716, 1, 966.938, -348.388, -71.7394, 0, 0, 0, 0, 0),
(47716, 2, 983.848, -364.54, -65.9521, 0, 0, 0, 0, 0),
(47716, 3, 971.354, -385.583, -61.7422, 0, 0, 0, 0, 0),
(47716, 4, 959.036, -399.658, -60.8377, 0, 0, 0, 0, 0),
(47716, 5, 941.767, -415.445, -55.1021, 0, 0, 0, 0, 0),
(47716, 6, 918.571, -399.838, -49.4846, 0, 0, 0, 0, 0),
(47716, 7, 899.659, -377.061, -49.9357, 0, 0, 0, 0, 0),
(47716, 8, 918.571, -399.838, -49.4846, 0, 0, 0, 0, 0),
(47716, 9, 941.767, -415.445, -55.1021, 0, 0, 0, 0, 0),
(47716, 10, 959.036, -399.658, -60.8377, 0, 0, 0, 0, 0),
(47716, 11, 971.295, -385.683, -61.6674, 0, 0, 0, 0, 0),
(47716, 12, 983.899, -364.589, -65.9473, 0, 0, 0, 0, 0),
(47716, 13, 967.006, -348.462, -71.711, 0, 0, 0, 0, 0),
(47716, 14, 951.51, -331.141, -71.7394, 0, 0, 0, 0, 0); 

-- Classic [1047]
-- BRD - Blazing Fireguard - 47795
UPDATE creature SET modelid = 0, position_x = 543.279, position_y = 31.168, position_z = -70.6287, spawndist = 0 WHERE guid = 47795;
DELETE FROM creature_movement WHERE id = 47795;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(47795, 1, 559.336, 25.6248, -70.9375, 0, 0, 0, 0, 0),
(47795, 2, 585.917, 30.7769, -71.5727, 0, 0, 0, 0, 0),
(47795, 3, 593.018, 17.1292, -72.0339, 0, 0, 0, 0, 0),
(47795, 4, 574.099, 8.61546, -70.391, 0, 0, 0, 0, 0),
(47795, 5, 558.878, 15.2068, -70.477, 0, 0, 0, 0, 0),
(47795, 6, 543.641, 12.3111, -70.38, 0, 0, 0, 0, 0),
(47795, 7, 532.831, 13.9816, -70.7128, 0, 0, 0, 0, 0),
(47795, 8, 527.879, 24.4454, -70.8921, 0, 0, 0, 0, 0),
(47795, 9, 541.627, 30.8387, -70.7471, 0, 0, 0, 0, 0); 

-- Classic [1046]
-- BRD - Blazing Fireguard - 47793
UPDATE creature SET modelid = 0, position_x = 698.705, position_y = -112.313, position_z = -71.5597, orientation = 2.35222, spawndist = 0, MovementType = 2 WHERE guid = 47793;
DELETE FROM creature_movement WHERE id = 47793;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(47793, 1, 676.798, -90.2307, -71.3314, 0, 0, 0, 0, 0),
(47793, 2, 648.377, -55.4042, -73.2871, 0, 0, 0, 0, 0),
(47793, 3, 633.829, -22.9795, -73.2442, 0, 0, 0, 0, 0),
(47793, 4, 615.686, 24.084, -73.6782, 0, 0, 0, 0, 0),
(47793, 5, 637.238, 62.4306, -73.2463, 0, 0, 0, 0, 0),
(47793, 6, 658.546, 104.195, -73.2762, 0, 0, 0, 0, 0),
(47793, 7, 656.38, 138.719, -73.314, 0, 0, 0, 0, 0),
(47793, 8, 666.779, 156.764, -73.2472, 0, 0, 0, 0, 0),
(47793, 9, 670.164, 186.106, -72.2097, 0, 0, 0, 0, 0),
(47793, 10, 666.779, 156.764, -73.2472, 0, 0, 0, 0, 0),
(47793, 11, 656.38, 138.719, -73.314, 0, 0, 0, 0, 0),
(47793, 12, 658.546, 104.195, -73.2762, 0, 0, 0, 0, 0),
(47793, 13, 637.238, 62.4306, -73.2463, 0, 0, 0, 0, 0),
(47793, 14, 615.686, 24.084, -73.6782, 0, 0, 0, 0, 0),
(47793, 15, 633.829, -22.9795, -73.2442, 0, 0, 0, 0, 0),
(47793, 16, 648.268, -55.2706, -73.3191, 0, 0, 0, 0, 0),
(47793, 17, 676.798, -90.2307, -71.3314, 0, 0, 0, 0, 0),
(47793, 18, 697.865, -114.558, -71.6739, 0, 0, 0, 0, 0);

-- Classic [1045]
-- BRD - Blazing Fireguard - 45868 
UPDATE creature SET modelid = 0, position_x = 722.875, position_y = 171.915, position_z = -71.9736, orientation = 4.0795, spawndist = 0 WHERE guid = 45868;
DELETE FROM creature_movement WHERE id = 45868;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(45868, 1, 709.072, 153.098, -72.1472, 0, 0, 0, 0, 0),
(45868, 2, 684.26, 141.267, -73.0777, 0, 0, 0, 0, 0),
(45868, 3, 672.939, 126.329, -73.3347, 0, 0, 0, 0, 0),
(45868, 4, 646.748, 121.308, -73.2764, 0, 0, 0, 0, 0),
(45868, 5, 626.573, 87.8224, -73.245, 0, 0, 0, 0, 0),
(45868, 6, 615.804, 54.5907, -73.2435, 0, 0, 0, 0, 0),
(45868, 7, 626.423, 31.1992, -73.9867, 0, 0, 0, 0, 0),
(45868, 8, 641.05, -2.70842, -73.2486, 0, 0, 0, 0, 0),
(45868, 9, 654.979, -23.1092, -73.2679, 0, 0, 0, 0, 0),
(45868, 10, 661.686, -38.4629, -73.3256, 0, 0, 0, 0, 0),
(45868, 11, 688.575, -56.3307, -72.5608, 0, 0, 0, 0, 0),
(45868, 12, 723.935, -91.0813, -71.6334, 0, 0, 0, 0, 0),
(45868, 13, 688.575, -56.3307, -72.5608, 0, 0, 0, 0, 0),
(45868, 14, 661.686, -38.4629, -73.3256, 0, 0, 0, 0, 0),
(45868, 15, 654.979, -23.1092, -73.2679, 0, 0, 0, 0, 0),
(45868, 16, 641.05, -2.70842, -73.2486, 0, 0, 0, 0, 0),
(45868, 17, 626.423, 31.1992, -73.9867, 0, 0, 0, 0, 0),
(45868, 18, 615.804, 54.5907, -73.2435, 0, 0, 0, 0, 0),
(45868, 19, 626.573, 87.8224, -73.245, 0, 0, 0, 0, 0),
(45868, 20, 646.748, 121.308, -73.2764, 0, 0, 0, 0, 0),
(45868, 21, 672.939, 126.329, -73.3347, 0, 0, 0, 0, 0),
(45868, 22, 684.26, 141.267, -73.0777, 0, 0, 0, 0, 0),
(45868, 23, 709.072, 153.098, -72.1472, 0, 0, 0, 0, 0),
(45868, 24, 723.607, 172.848, -72.049, 0, 0, 0, 0, 0);

-- Classic [1044]
-- BRD - Fireguard - 47836
UPDATE creature SET modelid = 0, position_x = 614.934, position_y = -57.1995, position_z = -59.9881, orientation = 2.23727, spawndist = 0 WHERE guid = 47836;
DELETE FROM creature_movement WHERE id = 47836;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(47836, 1, 608.582, -49.123, -60.0567, 0, 0, 0, 0, 0),
(47836, 2, 583.026, -48.0046, -60.0359, 0, 0, 0, 0, 0),
(47836, 3, 569.448, -59.0047, -60.0201, 0, 0, 0, 0, 0),
(47836, 4, 575.228, -61.9547, -60.0105, 0, 0, 0, 0, 0),
(47836, 5, 595.55, -62.0733, -52.0719, 0, 0, 0, 0, 0),
(47836, 6, 595.334, -81.3019, -45.4656, 0, 0, 0, 0, 0),
(47836, 7, 594.804, -104.408, -45.4327, 0, 0, 0, 0, 0),
(47836, 8, 595.334, -81.3019, -45.4656, 0, 0, 0, 0, 0),
(47836, 9, 595.55, -62.0733, -52.0719, 0, 0, 0, 0, 0),
(47836, 10, 575.228, -61.9547, -60.0105, 0, 0, 0, 0, 0),
(47836, 11, 569.448, -59.0047, -60.0201, 0, 0, 0, 0, 0),
(47836, 12, 583.026, -48.0046, -60.0359, 0, 0, 0, 0, 0),
(47836, 13, 608.582, -49.123, -60.0567, 0, 0, 0, 0, 0),
(47836, 14, 619.276, -60.7888, -60.0573, 0, 0, 0, 0, 0);

-- Classic [1043]
-- BRD - Fireguard - 45943
UPDATE creature SET modelid = 0, position_x = 699.724, position_y = -128.184, position_z = -45.6961, orientation = 3.9079, spawndist = 0 WHERE guid = 45943;
DELETE FROM creature_movement WHERE id = 45943;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(45943, 1, 682.134, -145.115, -46.2337, 0, 0, 0, 0, 0),
(45943, 2, 652.99, -131.139, -46.2337, 0, 0, 0, 0, 0),
(45943, 3, 626.382, -119.613, -46.2041, 0, 0, 0, 0, 0),
(45943, 4, 625.212, -88.7561, -45.9408, 0, 0, 0, 0, 0),
(45943, 5, 587.486, -89.0767, -45.4716, 0, 0, 0, 0, 0),
(45943, 6, 582.532, -72.8387, -45.4674, 0, 0, 0, 0, 0),
(45943, 7, 587.486, -89.0767, -45.4716, 0, 0, 0, 0, 0),
(45943, 8, 625.212, -88.7561, -45.9408, 0, 0, 0, 0, 0),
(45943, 9, 626.382, -119.613, -46.2041, 0, 0, 0, 0, 0),
(45943, 10, 652.99, -131.139, -46.2337, 0, 0, 0, 0, 0),
(45943, 11, 682.134, -145.115, -46.2337, 0, 0, 0, 0, 0),
(45943, 12, 700.327, -127.72, -45.7609, 0, 0, 0, 0, 0);

-- Classic [1042]
-- BRD - Fireguard Destroyer - 90728
UPDATE creature SET modelid = 0, position_x = 754.091, position_y = -73.9451, position_z = -46.2159, orientation = 0.84735, spawndist = 0 WHERE guid = 90728;
DELETE FROM creature_movement WHERE id = 90728;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(90728, 1, 761.283, -65.8021, -46.2337, 0, 0, 0, 0, 0),
(90728, 2, 762.053, -59.3832, -46.2337, 0, 0, 0, 0, 0),
(90728, 3, 740.873, -15.4984, -46.2337, 0, 0, 0, 0, 0),
(90728, 4, 733.056, -6.43943, -46.1815, 0, 0, 0, 0, 0),
(90728, 5, 710.789, -8.89487, -45.9405, 0, 0, 0, 0, 0),
(90728, 6, 706.555, 13.0863, -45.5852, 0, 0, 0, 0, 0),
(90728, 7, 710.562, 22.7446, -45.4594, 0, 0, 0, 0, 0),
(90728, 8, 696.138, 34.8861, -45.467, 0, 0, 0, 0, 0),
(90728, 9, 691.576, 46.4976, -45.467, 0, 0, 0, 0, 0),
(90728, 10, 696.138, 34.8861, -45.467, 0, 0, 0, 0, 0),
(90728, 11, 710.562, 22.7446, -45.4594, 0, 0, 0, 0, 0),
(90728, 12, 706.555, 13.0863, -45.5852, 0, 0, 0, 0, 0),
(90728, 13, 710.789, -8.89487, -45.9405, 0, 0, 0, 0, 0),
(90728, 14, 733.056, -6.43943, -46.1815, 0, 0, 0, 0, 0),
(90728, 15, 740.873, -15.4984, -46.2337, 0, 0, 0, 0, 0),
(90728, 16, 762.053, -59.3832, -46.2337, 0, 0, 0, 0, 0),
(90728, 17, 761.283, -65.8021, -46.2337, 0, 0, 0, 0, 0),
(90728, 18, 747.48, -80.9312, -46.2337, 0, 0, 0, 0, 0);

-- Classic [1041]
-- BRD - Fireguard Destroyer - 47738
UPDATE creature SET modelid = 0, position_x = 562.103, position_y = -282.939, position_z = -43.1013, orientation = 0.00912, spawndist = 0, MovementType = 2 WHERE guid = 47738;
DELETE FROM creature_movement WHERE id = 47738;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(47738, 1, 595.023, -282.501, -43.1034, 0, 0, 0, 0, 0),
(47738, 2, 633.051, -282.096, -43.2186, 0, 0, 0, 0, 0),
(47738, 3, 653.19, -284.079, -43.1904, 0, 0, 0, 0, 0),
(47738, 4, 688.829, -280.882, -43.1993, 0, 0, 0, 0, 0),
(47738, 5, 724.116, -276.83, -42.8501, 0, 0, 0, 0, 0),
(47738, 6, 688.829, -280.882, -43.1993, 0, 0, 0, 0, 0),
(47738, 7, 653.19, -284.079, -43.1904, 0, 0, 0, 0, 0),
(47738, 8, 633.051, -282.096, -43.2186, 0, 0, 0, 0, 0),
(47738, 9, 595.023, -282.501, -43.1034, 0, 0, 0, 0, 0),
(47738, 10, 560.518, -281.275, -43.1014, 0, 0, 0, 0, 0);

-- Classic [1040]
-- BRD - Blazing Fireguard - 90828 
UPDATE creature SET modelid = 0, position_x = 861.324, position_y = -258.804, position_z = -49.8696, orientation = 4.42832, spawndist = 0, MovementType = 2 WHERE guid = 90828;
DELETE FROM creature_movement WHERE id = 90828;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(90828, 1, 854.438, -282.389, -49.934, 0, 0, 0, 0, 0),
(90828, 2, 861.951, -299.681, -49.936, 0, 0, 0, 0, 0),
(90828, 3, 871.463, -303.62, -49.936, 0, 0, 0, 0, 0),
(90828, 4, 883.993, -313.336, -49.936, 0, 0, 0, 0, 0),
(90828, 5, 898.929, -313.426, -49.936, 0, 0, 0, 0, 0),
(90828, 6, 896.321, -334.966, -49.7995, 0, 0, 0, 0, 0),
(90828, 7, 894.078, -359.278, -49.9362, 0, 0, 0, 0, 0),
(90828, 8, 896.321, -334.966, -49.7995, 0, 0, 0, 0, 0),
(90828, 9, 898.929, -313.426, -49.936, 0, 0, 0, 0, 0),
(90828, 10, 883.993, -313.336, -49.936, 0, 0, 0, 0, 0),
(90828, 11, 871.463, -303.62, -49.936, 0, 0, 0, 0, 0),
(90828, 12, 861.951, -299.681, -49.936, 0, 0, 0, 0, 0),
(90828, 13, 854.474, -282.47, -49.936, 0, 0, 0, 0, 0),
(90828, 14, 860.654, -258.971, -49.971, 0, 0, 0, 0, 0);

-- Classic [1039]
-- Maraudon - Spirit of Maraudos
UPDATE creature SET modelid = 0, position_x = 736.248, position_y = -456.79, position_z = -52.8932, orientation = 5.40292, spawndist = 0, currentwaypoint = 0, MovementType = 2 WHERE id = 12242;
UPDATE creature_template SET movementType = 2 WHERE entry = 12242;
DELETE FROM creature_movement WHERE id = 12242;
DELETE FROM creature_movement_template WHERE entry = 12242;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(12242,1, 755.9363, -480.6198, -52.90856, 0, 0, 0, 0, 0),
(12242,2, 769.3544, -505.1759, -52.85908, 0, 0, 0, 0, 0),
(12242,3, 784.3037, -508.379, -53.0263, 0, 0, 0, 0, 0),
(12242,4, 801.0869, -492.0177, -53.81177, 0, 0, 0, 0, 0),
(12242,5, 814.9312, -484.2513, -55.0167, 0, 0, 0, 0, 0),
(12242,6, 822.5286, -461.7411, -56.28494, 0, 0, 0, 0, 0),
(12242,7, 828.3035, -448.5358, -56.35105, 0, 0, 0, 0, 0),
(12242,8, 793.596, -424.0394, -53.79723, 0, 0, 0, 0, 0),
(12242,9, 829.3204, -448.1856, -56.35316, 0, 0, 0, 0, 0),
(12242,10, 862.0096, -424.002, -52.43996, 0, 0, 0, 0, 0),
(12242,11, 886.9448, -405.5167, -52.09523, 0, 0, 0, 0, 0),
(12242,12, 880.3082, -369.967, -52.04964, 0, 0, 0, 0, 0),
(12242,13, 856.7214, -349.8064, -52.04964, 0, 0, 0, 0, 0),
(12242,14, 826.5951, -346.6646, -51.92785, 0, 0, 0, 0, 0),
(12242,15, 807.8654, -346.475, -51.7706, 0, 0, 0, 0, 0),
(12242,16, 775.6643, -328.4655, -50.0463, 0, 0, 0, 0, 0),
(12242,17, 756.8548, -327.6703, -51.55397, 0, 0, 0, 0, 0),
(12242,18, 745.7422, -340.5418, -50.73648, 0, 0, 0, 0, 0),
(12242,19, 718.0483, -329.1714, -51.41955, 0, 0, 0, 0, 0),
(12242,20, 704.3214, -351.085, -52.00996, 0, 0, 0, 0, 0),
(12242,21, 690.3201, -374.0625, -52.06044, 0, 0, 0, 0, 0),
(12242,22, 655.8417, -358.8916, -52.05203, 0, 0, 0, 0, 0),
(12242,23, 642.3574, -347.1523, -52.01936, 0, 0, 0, 0, 0),
(12242,24, 620.6495, -351.6401, -52.01936, 0, 0, 0, 0, 0),
(12242,25, 608.4368, -379.101, -52.01936, 0, 0, 0, 0, 0),
(12242,26, 620.1765, -351.2938, -52.01936, 0, 0, 0, 0, 0),
(12242,27, 650.0255, -343.3729, -52.01936, 0, 0, 0, 0, 0),
(12242,28, 646.0782, -315.0015, -52.0653, 0, 0, 0, 0, 0),
(12242,29, 634.4776, -286.2214, -52.94971, 0, 0, 0, 0, 0),
(12242,30, 633.8284, -260.07, -53.10785, 0, 0, 0, 0, 0),
(12242,31, 629.4022, -228.5276, -59.41068, 0, 0, 0, 0, 0),
(12242,32, 633.8284, -260.07, -53.10785, 0, 0, 0, 0, 0),
(12242,33, 634.4776, -286.2214, -52.94971, 0, 0, 0, 0, 0),
(12242,34, 646.0782, -315.0015, -52.0653, 0, 0, 0, 0, 0),
(12242,35, 650.0255, -343.3729, -52.01936, 0, 0, 0, 0, 0),
(12242,36, 620.1765, -351.2938, -52.01936, 0, 0, 0, 0, 0),
(12242,37, 608.4368, -379.101, -52.01936, 0, 0, 0, 0, 0),
(12242,38, 620.6495, -351.6401, -52.01936, 0, 0, 0, 0, 0),
(12242,39, 642.3574, -347.1523, -52.01936, 0, 0, 0, 0, 0),
(12242,40, 655.8417, -358.8916, -52.05203, 0, 0, 0, 0, 0),
(12242,41, 690.3201, -374.0625, -52.06044, 0, 0, 0, 0, 0),
(12242,42, 704.3214, -351.085, -52.00996, 0, 0, 0, 0, 0),
(12242,43, 718.0483, -329.1714, -51.41955, 0, 0, 0, 0, 0),
(12242,44, 745.7422, -340.5418, -50.73648, 0, 0, 0, 0, 0),
(12242,45, 756.8548, -327.6703, -51.55397, 0, 0, 0, 0, 0),
(12242,46, 775.6643, -328.4655, -50.0463, 0, 0, 0, 0, 0),
(12242,47, 807.8654, -346.475, -51.7706, 0, 0, 0, 0, 0),
(12242,48, 826.327, -346.6367, -51.91992, 0, 0, 0, 0, 0),
(12242,49, 856.7214, -349.8064, -52.04964, 0, 0, 0, 0, 0),
(12242,50, 880.3082, -369.967, -52.04964, 0, 0, 0, 0, 0),
(12242,51, 886.9448, -405.5167, -52.09523, 0, 0, 0, 0, 0),
(12242,52, 862.0096, -424.002, -52.43996, 0, 0, 0, 0, 0),
(12242,53, 829.3204, -448.1856, -56.35316, 0, 0, 0, 0, 0),
(12242,54, 793.596, -424.0394, -53.79723, 0, 0, 0, 0, 0),
(12242,55, 828.3035, -448.5358, -56.35105, 0, 0, 0, 0, 0),
(12242,56, 822.5286, -461.7411, -56.28494, 0, 0, 0, 0, 0),
(12242,57, 814.9387, -484.2289, -55.03092, 0, 0, 0, 0, 0),
(12242,58, 801.0869, -492.0177, -53.81177, 0, 0, 0, 0, 0),
(12242,59, 784.3037, -508.379, -53.0263, 0, 0, 0, 0, 0),
(12242,60, 769.3544, -505.1759, -52.85908, 0, 0, 0, 0, 0),
(12242,61, 755.9363, -480.6198, -52.90856, 0, 0, 0, 0, 0),
(12242,62, 736.6956, -455.5942, -52.88465, 0, 0, 0, 0, 0);
-- Warbringer Construct 8905
-- UnitFlags corrected
-- Not-selectable 0x2000000 & not_attackable 0x100 - are added only for 4 of them in Black Vault by aura 
UPDATE creature_template SET UnitFlags = 64 WHERE Entry = 8905;
-- Blue Sky Logging Grounds

-- q.12288 'Overwhelmed!' -- horde
DELETE FROM dbscripts_on_spell WHERE id = 48812;
-- q.12296 'Life or Death' -- Alliance
DELETE FROM dbscripts_on_spell WHERE id = 48845;
  
-- Wounded Skirmisher & Wounded Westfall Infantry - they're wounded - not aggressive
UPDATE creature_template SET UnitFlags = 512 WHERE Entry IN (27463,27482);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 27463);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 27482);
DELETE FROM creature_template_addon WHERE entry IN (27463,27482);
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(27463,0,8,1,1,0,0,NULL),
(27482,0,8,1,1,0,0,NULL);
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 104181;
UPDATE creature SET spawntimesecs = 120 WHERE id = 27463;
UPDATE creature SET spawntimesecs = 120 WHERE id = 27482;

-- missing spawns
-- Wounded Skirmisher 
DELETE FROM creature  WHERE guid BETWEEN 44340 AND 44347;
DELETE FROM creature_addon WHERE guid BETWEEN 44340 AND 44347;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(44340,27463,571,1,1,0,0,4142.41,-3019.99,285.239,3.23352,120,0,0,9940,0,0,0),
(44341,27463,571,1,1,0,0,4017.43,-2833.86,279.32,1.8778,120,0,0,9940,0,0,0),
-- Wounded Westfall Infantry
(44342,27482,571,1,1,0,0,4207.22,-3003.51,282.771,3.17932,120,0,0,9940,3387,0,0),
(44343,27482,571,1,1,0,0,4126.14,-2944.9,282.311,2.51947,120,0,0,9940,3387,0,0),
(44344,27482,571,1,1,0,0,4091.4,-2861.47,283.9,2.32936,120,0,0,10282,3466,0,0),
(44345,27482,571,1,1,0,0,4169.54,-2904.81,281.763,4.55053,120,0,0,10282,3466,0,0),
(44346,27482,571,1,1,0,0,4231.25,-2966.08,282.449,4.43822,120,0,0,9940,3387,0,0),
-- Broken-down Shredder
(44347,27354,571,1,1,0,0,4098.64,-2829.87,285.394,3.65989,25,0,0,4920,0,0,0);
-- missing pool added
DELETE FROM pool_creature WHERE guid = 44347 AND pool_entry = 25481;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(44347,25481,0,'Grizzly Hills - Broken-down Shredder - Pool 5');


-- correct MovementType will be set by quest script
-- Wounded Skirmisher -- #14
DELETE FROM creature_movement WHERE id IN (44340,44341,102453,102469,102464,102466,102454,102462,102459,102461,102455,102460,102467,102456,44346,44342,104181,104190,44345,44343,104185,104187,44344,104188,104189,104184,104182); 
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(44340, 1, 4142.41,-3019.99,285.239, 2000, 2746301, 3.23352, 0, 0),
(44340, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(44341, 1, 4017.43,-2833.86,279.32, 2000, 2746301, 1.8778, 0, 0),
(44341, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102453, 1, 4230.5,-2982.41,283.434, 2000, 2746301, 0.38631, 0, 0),
(102453, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102469, 1, 4183.3,-2934.44,283.114, 2000, 2746301, 5.63741, 0, 0),
(102469, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102464, 1, 4167.19,-2968.62,283.27, 2000, 2746301, -1.79852, 0, 0),
(102464, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102466, 1, 4142.65,-2919.83,281.385, 2000, 2746301, -1.21211, 0, 0),
(102466, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102454, 1, 4110.93,-2883.57,280.429, 2000, 2746301, 5.37592, 0, 0),
(102454, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102462, 1, 4074.38,-2940.38,276.122, 2000, 2746301, -0.252544, 0, 0),
(102462, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102459, 1, 4073.33,-2906.89,278.332, 2000, 2746301, 6.10865, 0, 0),
(102459, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102461, 1, 4071.18,-2886.01,281.6, 2000, 2746301, 5.8294, 0, 0),
(102461, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102455, 1, 4123.8,-2835.11,284.196, 2000, 2746301, 0.610865, 0, 0),
(102455, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102460, 1, 4085.95,-2846.31,286.589, 2000, 2746301, 2.94961, 0, 0),
(102460, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102467, 1, 4057.32,-2822.2,288.962, 2000, 2746301, 3.4383, 0, 0),
(102467, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
(102456, 1, 4000.98,-2847.93,273.325, 2000, 2746301, 6.03884, 0, 0),
(102456, 2, 4184.81,-2908.39,280.222, 2000, 2746302, 0, 0, 0),
-- Wounded Westfall Infantry -- #
(44346, 1, 4231.25,-2966.08,282.449, 2000, 2748201, 4.43822, 0, 0),
(44346, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(44342, 1, 4207.22,-3003.51,282.771, 2000, 2748201, 3.17932, 0, 0),
(44342, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(104190, 1, 4184.69,-2980.58,284.83, 2000, 2748201, 3.54302, 0, 0),
(104190, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(104181, 1, 4173.72,-2932.61,283.362, 2000, 2748201, 2.76104, 0, 0),
(104181, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(44345, 1, 4169.54,-2904.81,281.763, 2000, 2748201, 4.55053, 0, 0),
(44345, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(44343, 1, 4126.14,-2944.9,282.311, 2000, 2748201, 2.51947, 0, 0),
(44343, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(104185, 1, 4096.38,-2901.66,280.065, 2000, 2748201, 0.942478, 0, 0),
(104185, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(104187, 1, 4065.72,-2897.43,280.652, 2000, 2748201, 4.41568, 0, 0),
(104187, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(44344, 1, 4091.4,-2861.47,283.9, 2000, 2748201, 2.32936, 0, 0),
(44344, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(104189, 1, 4118.52,-2838.18,285.096, 2000, 2748201, 0.872665, 0, 0),
(104189, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(104188, 1, 4086.66,-2822.89,287.166, 2000, 2748201, 1.62316, 0, 0),
(104188, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(104184, 1, 4061.91,-2848.54,285.016, 2000, 2748201, 3.76991, 0, 0),
(104184, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0),
(104182, 1, 3995.66,-2843.98,272.487, 2000, 2748201, 0.122173, 0, 0),
(104182, 2, 4044.81,-2938.7,275.457, 2000, 2748202, 0, 0, 0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2746301,2746302);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2746301,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2746301,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(2746302,1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive'),
(2746302,2,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn');
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2748201,2748202);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2748201,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2748201,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(2748202,1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive'),
(2748202,2,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'despawn');-- Spawn of Dimensius
-- must be able to cast channeling spell on his master.

UPDATE creature_template SET MovementType = 0 WHERE entry = 21780;

ALTER TABLE db_version CHANGE COLUMN required_12759_01_mangos_spell_chain required_20141028_mangos_spell_template bit;
