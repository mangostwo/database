-- Apply this fix to the Rel18 database to get it back into sync.
ALTER TABLE db_version CHANGE COLUMN required_12615_01_mangos_creature_template_classlevelstats required_02_mangos_creature_classlevels bit;

-- Madrigosa script target fix
DELETE FROM spell_script_target WHERE entry IN (46609);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(46609,1,19871,0);
-- Delete M'uru (summoned)
DELETE FROM creature WHERE guid=53705;
-- M'uru encounter linking (for cleanup)
DELETE FROM creature_linking_template WHERE entry IN (25744,25879,25855,25798,25799,25824,25772);
INSERT INTO creature_linking_template (entry, map, master_entry, flag, search_range) VALUES
(25744, 580, 25840, 4112, 0),
(25879, 580, 25840, 4112, 0),
(25855, 580, 25840, 4112, 0),
(25798, 580, 25741, 4112, 0),
(25799, 580, 25741, 4112, 0),
(25824, 580, 25741, 4112, 0),
(25772, 580, 25741, 4112, 0);
-- Sentinel Summoner - update
UPDATE creature_template SET MinLevel=70, MaxLevel=70, FactionAlliance=114, FactionHorde=114, MinLevelHealth=3827, MaxLevelHealth=3827, UnitFlags=UnitFlags|33554688 WHERE entry=25782;

-- Q12953 Valkyrion Must Burn
-- npc spell click
DELETE FROM npc_spellclick_spells WHERE npc_entry=30066;
INSERT INTO npc_spellclick_spells (npc_entry,spell_id,quest_start,quest_start_active,quest_end,cast_flags,condition_id) VALUES 
(30066, 62503, 12953, 1, 12953, 1, 0);
-- vehicle spells
DELETE FROM creature_template_spells WHERE entry=30066;
INSERT INTO creature_template_spells (entry,spell1) VALUES 
(30066, 55812);
-- script target
DELETE FROM spell_script_target WHERE entry=55896;
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES 
(55896, 1, 30096, 0); 
-- script
DELETE FROM dbscripts_on_spell WHERE id=55896;
INSERT INTO dbscripts_on_spell (id,delay,command,datalong,data_flags,comments) VALUES
(55896,0,8,0,2,'Dry Haystack - Kill Credit'),
(55896,0,18,0,2,'Dry Haystack - Despawn');

-- script target for spell 34186 cast by npc 17058
DELETE FROM spell_script_target WHERE entry=34186;
INSERT INTO spell_script_target (entry, TYPE, targetEntry,inverseEffectMask) VALUES 
(34186, 1, 16938, 0);
-- script target for spell 33924 cast by npc 19424
DELETE FROM spell_script_target WHERE entry=33924;
INSERT INTO spell_script_target (entry, TYPE, targetEntry,inverseEffectMask) VALUES 
(33924, 1, 19640, 0);
-- Chess event script targets
-- Footman
DELETE FROM spell_script_target WHERE entry IN (32227);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(32227,1,17469,0),
(32227,1,21748,0),
(32227,1,21750,0),
(32227,1,21747,0),
(32227,1,21726,0),
(32227,1,21752,0);
-- Grunt
DELETE FROM spell_script_target WHERE entry IN (32228);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(32228,1,17211,0),
(32228,1,21664,0),
(32228,1,21683,0),
(32228,1,21682,0),
(32228,1,21160,0),
(32228,1,21684,0);
-- Water Elem
DELETE FROM spell_script_target WHERE entry IN (37142);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37142,1,17469,0),
(37142,1,21748,0),
(37142,1,21750,0),
(37142,1,21747,0),
(37142,1,21726,0),
(37142,1,21752,0);
-- Daemon
DELETE FROM spell_script_target WHERE entry IN (37220);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37220,1,17211,0),
(37220,1,21664,0),
(37220,1,21683,0),
(37220,1,21682,0),
(37220,1,21160,0),
(37220,1,21684,0);
-- Charger
DELETE FROM spell_script_target WHERE entry IN (37143);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37143,1,17469,0),
(37143,1,21748,0),
(37143,1,21750,0),
(37143,1,21747,0),
(37143,1,21726,0),
(37143,1,21752,0);
-- Wolf
DELETE FROM spell_script_target WHERE entry IN (37339);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37339,1,17211,0),
(37339,1,21664,0),
(37339,1,21683,0),
(37339,1,21682,0),
(37339,1,21160,0),
(37339,1,21684,0);
-- Cleric
DELETE FROM spell_script_target WHERE entry IN (37147);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37147,1,17469,0),
(37147,1,21748,0),
(37147,1,21750,0),
(37147,1,21747,0),
(37147,1,21726,0),
(37147,1,21752,0);
-- Necrolyte
DELETE FROM spell_script_target WHERE entry IN (37337);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37337,1,17211,0),
(37337,1,21664,0),
(37337,1,21683,0),
(37337,1,21682,0),
(37337,1,21160,0),
(37337,1,21684,0);
-- Conjurer
DELETE FROM spell_script_target WHERE entry IN (37149);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37149,1,17469,0),
(37149,1,21748,0),
(37149,1,21750,0),
(37149,1,21747,0),
(37149,1,21726,0),
(37149,1,21752,0);
-- Conjurer
DELETE FROM spell_script_target WHERE entry IN (37345);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37345,1,17211,0),
(37345,1,21664,0),
(37345,1,21683,0),
(37345,1,21682,0),
(37345,1,21160,0),
(37345,1,21684,0);
-- Llane
DELETE FROM spell_script_target WHERE entry IN (37150);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37150,1,17469,0),
(37150,1,21748,0),
(37150,1,21750,0),
(37150,1,21747,0),
(37150,1,21726,0),
(37150,1,21752,0);
-- Blackhand
DELETE FROM spell_script_target WHERE entry IN (37348);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(37348,1,17211,0),
(37348,1,21664,0),
(37348,1,21683,0),
(37348,1,21682,0),
(37348,1,21160,0),
(37348,1,21684,0);
-- Utgarde Pinnacle
DELETE FROM spell_script_target WHERE entry=48642;
INSERT INTO spell_script_target (entry, TYPE, targetEntry,inverseEffectMask) VALUES 
(48642, 1, 26893, 0);
DELETE FROM spell_script_target WHERE entry=47563;
INSERT INTO spell_script_target (entry, TYPE, targetEntry,inverseEffectMask) VALUES 
(47563, 1, 28351, 0);
DELETE FROM spell_script_target WHERE entry=47593;
INSERT INTO spell_script_target (entry, TYPE, targetEntry,inverseEffectMask) VALUES 
(47593, 1, 28351, 0);
DELETE FROM spell_script_target WHERE entry=47574;
INSERT INTO spell_script_target (entry, TYPE, targetEntry,inverseEffectMask) VALUES 
(47574, 1, 28351, 0);
DELETE FROM spell_script_target WHERE entry=47594;
INSERT INTO spell_script_target (entry, TYPE, targetEntry,inverseEffectMask) VALUES 
(47594, 1, 28351, 0);
-- Guards in Falcon Watch - Hellfire Peninsula
-- 1st pair
UPDATE creature SET position_x = -673.343933, position_y = 4119.516113, position_z = 72.484268, orientation = 1.822174, spawndist = 0, MovementType = 0 WHERE guid = 62072;
UPDATE creature SET position_x = -675.377991, position_y = 4118.660156, position_z = 72.560066, orientation = 1.717594, spawndist = 0, MovementType = 2 WHERE guid = 62071;
DELETE FROM creature_movement WHERE id = 62071;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(62071,1,-670.398,4115.13,73.5682,0,0,0,0,0,0,0,0,0,0,5.17779,0,0),
(62071,2,-666.054,4107.92,74.8717,0,0,0,0,0,0,0,0,0,0,5.46446,0,0),
(62071,3,-661.391,4103.52,75.996,0,0,0,0,0,0,0,0,0,0,5.74877,0,0),
(62071,4,-655.411,4101.82,77.5939,0,0,0,0,0,0,0,0,0,0,0.0169263,0,0),
(62071,5,-648.99,4102.68,79.0709,0,0,0,0,0,0,0,0,0,0,0.15594,0,0),
(62071,6,-645.083,4104.23,80.0976,0,0,0,0,0,0,0,0,0,0,0.410409,0,0),
(62071,7,-639.382,4108.4,81.9022,0,0,0,0,0,0,0,0,0,0,0.668805,0,0),
(62071,8,-630.143,4117.24,85.0093,0,0,0,0,0,0,0,0,0,0,0.499159,0,0),
(62071,9,-624.318,4120.4,86.5588,0,0,0,0,0,0,0,0,0,0,0.337138,0,0),
(62071,10,-620.052,4121.33,87.6003,0,0,0,0,0,0,0,0,0,0,6.22762,0,0),
(62071,11,-615.922,4120.47,88.4096,0,0,0,0,0,0,0,0,0,0,5.78073,0,0),
(62071,12,-612.447,4117.71,88.8557,0,0,0,0,0,0,0,0,0,0,5.18148,0,0),
(62071,13,-602.748,4097.79,90.8412,5000,0,0,0,0,0,0,0,0,0,5.16813,0,0),
(62071,14,-614.507,4114.82,88.5941,0,0,0,0,0,0,0,0,0,0,2.02246,0,0),
(62071,15,-617.362,4117.91,88.046,0,0,0,0,0,0,0,0,0,0,2.57459,0,0),
(62071,16,-620.27,4118.2,87.2764,0,0,0,0,0,0,0,0,0,0,3.08353,0,0),
(62071,17,-623.8,4117.07,86.2394,0,0,0,0,0,0,0,0,0,0,3.59483,0,0),
(62071,18,-629.685,4112.73,84.306,0,0,0,0,0,0,0,0,0,0,3.76535,0,0),
(62071,19,-639.118,4103.89,81.2014,0,0,0,0,0,0,0,0,0,0,3.64823,0,0),
(62071,20,-649.222,4099.03,78.5886,0,0,0,0,0,0,0,0,0,0,3.36313,0,0),
(62071,21,-654.833,4098.31,77.3976,0,0,0,0,0,0,0,0,0,0,3.10317,0,0),
(62071,22,-660.503,4098.99,76.2923,0,0,0,0,0,0,0,0,0,0,2.76937,0,0),
(62071,23,-665.169,4101.41,75.6001,0,0,0,0,0,0,0,0,0,0,2.40338,0,0),
(62071,24,-670.765,4107.85,74.5016,0,0,0,0,0,0,0,0,0,0,2.05152,0,0),
(62071,25,-675.431,4118.68,72.5593,5000,0,0,0,0,0,0,0,0,0,1.99968,0,0);
DELETE FROM creature_linking WHERE guid = 62072;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(62072, 62071, 512);
-- 2nd pair
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 62079;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 62078;
DELETE FROM creature_movement WHERE id = 62079;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(62079,1,-624.19,4158.6,63.4654,0,0,0,0,0,0,0,0,0,0,0.408872,0,0),
(62079,2,-622.686,4162.96,63.1608,0,0,0,0,0,0,0,0,0,0,1.32543,0,0),
(62079,3,-622.357,4169.84,62.4888,0,0,0,0,0,0,0,0,0,0,1.48094,0,0),
(62079,4,-623.462,4174.73,61.6499,0,0,0,0,0,0,0,0,0,0,1.86265,0,0),
(62079,5,-626.393,4182.12,60.0974,5000,0,0,0,0,0,0,0,0,0,1.98124,0,0),
(62079,6,-622.172,4178.62,60.9533,0,0,0,0,0,0,0,0,0,0,5.22886,0,0),
(62079,7,-620.102,4173.03,62.0333,0,0,0,0,0,0,0,0,0,0,4.97989,0,0),
(62079,8,-619.011,4165.05,62.9172,0,0,0,0,0,0,0,0,0,0,4.58405,0,0),
(62079,9,-619.732,4160.32,63.3172,0,0,0,0,0,0,0,0,0,0,4.20864,0,0),
(62079,10,-622.894,4155.56,63.691,0,0,0,0,0,0,0,0,0,0,3.76804,0,0),
(62079,11,-628.754,4152.18,64.2084,0,0,0,0,0,0,0,0,0,0,3.38019,0,0),
(62079,12,-639.111,4149.3,64.242,0,0,0,0,0,0,0,0,0,0,3.16028,0,0),
(62079,13,-656.313,4146.89,64.1236,0,0,0,0,0,0,0,0,0,0,3.03775,0,0),
(62079,14,-669.156,4146.29,64.1596,0,0,0,0,0,0,0,0,0,0,3.17363,0,0),
(62079,15,-676.072,4145.15,64.4498,0,0,0,0,0,0,0,0,0,0,3.15949,0,0),
(62079,16,-679.769,4144.66,64.7205,0,0,0,0,0,0,0,0,0,0,2.95529,0,0),
(62079,17,-683.884,4147.79,64.1076,0,0,0,0,0,0,0,0,0,0,2.14868,0,0),
(62079,18,-687.195,4156.14,61.3508,5000,0,0,0,0,0,0,0,0,0,1.87772,0,0),
(62079,19,-681.805,4152.04,62.9783,0,0,0,0,0,0,0,0,0,0,5.30992,0,0),
(62079,20,-679.857,4149.01,63.8403,0,0,0,0,0,0,0,0,0,0,5.48584,0,0),
(62079,21,-675.72,4148.63,64.0716,0,0,0,0,0,0,0,0,0,0,0.0281043,0,0),
(62079,22,-667.948,4149.35,64.1709,0,0,0,0,0,0,0,0,0,0,6.24139,0,0),
(62079,23,-656.199,4149.49,64.152,0,0,0,0,0,0,0,0,0,0,0.0595209,0,0),
(62079,24,-646.359,4151.18,64.2248,0,0,0,0,0,0,0,0,0,0,0.20482,0,0),
(62079,25,-636.105,4153.01,64.0977,0,0,0,0,0,0,0,0,0,0,0.102718,0,0),
(62079,26,-627.604,4156.75,63.782,0,0,0,0,0,0,0,0,0,0,0.401169,0,0);
DELETE FROM creature_linking WHERE guid = 62078;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(62078, 62079, 512);
-- Taleris Dawngazer
UPDATE creature SET position_x = -650.434021, position_y = 4136.919922, position_z = 64.620346, orientation = 1.88, MovementType = 2, spawndist = 0 WHERE guid = 59416;
DELETE FROM creature_movement WHERE id = 59416;
UPDATE creature_template SET MovementType = 2 WHERE entry = 17015; -- now move him to template (unique npc)
DELETE FROM creature_movement_template WHERE entry = 17015;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,textid1,textid2,textid3,textid4,textid5,emote,spell,wpguid,orientation,model1,model2) VALUES
(17015,1,-650.434021,4136.919922,64.620346,30000,0,0,0,0,0,0,0,0,0,1.88,0,0),
(17015,2,-649.897,4149.45,64.13,0,0,0,0,0,0,0,0,0,0,1.61692,0,0),
(17015,3,-650.945,4153.25,64.3724,0,0,0,0,0,0,0,0,0,0,1.86039,0,0),
(17015,4,-653.408,4159.69,65.9067,0,0,0,0,0,0,0,0,0,0,1.62163,0,0),
(17015,5,-649.211,4169.54,67.9885,0,0,0,0,0,0,0,0,0,0,1.06714,0,0),
(17015,6,-647.255,4172.52,68.3677,0,0,0,0,0,0,0,0,0,0,1.36559,0,0),
(17015,7,-646.951,4176.908,68.51362,30000,1701501,0,0,0,0,0,0,0,0,1.95,0,0),
(17015,8,-653.285,4163.94,67.01,0,0,0,0,0,0,0,0,0,0,4.41295,0,0),
(17015,9,-651.272,4154.21,64.553,0,0,0,0,0,0,0,0,0,0,5.07268,0,0),
(17015,10,-649.733,4147.03,64.231,0,0,0,0,0,0,0,0,0,0,4.70747,0,0),
(17015,11,-650.434021,4136.919922,64.620346,120000,0,0,0,0,0,0,0,0,0,1.88,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1701501; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1701501,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1701501,4,1,1,0,0,0,0,11,6,0,0,0,0,0,0,'random emote'),
(1701501,7,31,17046,20,0,0,0,0,0,0,0,0,0,0,0,''),
(1701501,8,1,1,0,17046,20,7,11,6,0,0,0,0,0,0,'force buddy to: random emote'),
(1701501,12,1,1,0,0,0,0,11,6,0,0,0,0,0,0,'random emote'),
(1701501,15,31,17046,20,0,0,0,0,0,0,0,0,0,0,0,''),
(1701501,16,1,1,0,17046,20,7,11,6,0,0,0,0,0,0,'force buddy to: random emote');-- The Ebdon Hold - DK start Area 
-- Unworthy Initiate - aura should come from another creature
UPDATE creature_template_addon SET auras = NULL WHERE entry IN (29519,29520,29565,29566,29567);
-- Enslaved Laborer - emote is part of his movement
UPDATE creature_template_addon SET emote = 0 WHERE entry = 28505;
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 128579;
DELETE FROM creature_movement WHERE id = 128579; -- 1st phase
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128579,1,2434.574,-5648.207,420.6473,25000,2850502,0,0,0,0,0,0,0,0,3.01641,0,0),
(128579,2,2461.164,-5656.579,420.6482,25000,2850501,0,0,0,0,0,0,0,0,5.85012,0,0),
(128579,3,2434.574,-5641.89,420.645,25000,2850501,0,0,0,0,0,0,0,0,2.60172,0,0),
(128579,4,2466.634,-5649.536,420.6456,25000,2850502,0,0,0,0,0,0,0,0,6.074382,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2850501,2850502); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2850501,2,1,233,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2850501,23,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2850502,3,1,233,0,0,0,0,18,0,0,0,0,0,0,0,'random emote'),
(2850502,15,1,233,0,0,0,0,18,0,0,0,0,0,0,0,'random emote'),
(2850502,23,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
-- Mindless Laborer
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 128580;
DELETE FROM creature_movement WHERE id = 128580; -- 1st phase
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128580,1,2435.539,-5640.577,420.6444,22000,2850601,0,0,0,0,0,0,0,0,2.60172,0,0),
(128580,2,2461.646,-5656.121,420.648,22000,2850601,0,0,0,0,0,0,0,0,5.85012,0,0),
(128580,3,2433.65,-5649.92,420.648,22000,2850601,0,0,0,0,0,0,0,0,3.02234,0,0),
(128580,4,2466.89,-5648.816,420.6453,22000,2850601,0,0,0,0,0,0,0,0,6.074382,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2850601; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2850601,2,1,438,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2850601,19,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
-- Riden Drudge 128465 29212
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 128465;
DELETE FROM creature_movement WHERE id = 128465; -- 1st phase
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128465,1,2404.152,-5562.793,420.6501,30000,0,0,0,0,0,0,0,0,0,1.42023,0,0), -- current
(128465,2,2402.91,-5570.57,420.649,0,0,0,0,0,0,0,0,0,0,5.01442,0,0),
(128465,3,2400.59,-5581.73,420.647,0,0,0,0,0,0,0,0,0,0,5.0904,0,0),
(128465,4,2404.56,-5587.23,420.647,0,0,0,0,0,0,0,0,0,0,5.63153,0,0),
(128465,5,2410.21,-5592.32,420.644,0,0,0,0,0,0,0,0,0,0,5.31423,0,0),
(128465,6,2411.94,-5596.91,420.644,0,0,0,0,0,0,0,0,0,0,4.61837,0,0),
(128465,7,2411.62,-5599.78,420.644,0,0,0,0,0,0,0,0,0,0,4.27908,0,0),
(128465,8,2409.17,-5603.85,420.644,30000,0,0,0,0,0,0,0,0,0,4.57145,0,0), -- last
(128465,9,2411.62,-5599.78,420.644,0,0,0,0,0,0,0,0,0,0,1.85377,0,0),
(128465,10,2411.94,-5596.91,420.644,0,0,0,0,0,0,0,0,0,0,1.90717,0,0),
(128465,11,2410.21,-5592.32,420.644,0,0,0,0,0,0,0,0,0,0,2.42554,0,0),
(128465,12,2404.56,-5587.23,420.647,0,0,0,0,0,0,0,0,0,0,2.42554,0,0),
(128465,13,2400.59,-5581.73,420.647,0,0,0,0,0,0,0,0,0,0,1.73753,0,0),
(128465,14,2402.91,-5570.57,420.649,0,0,0,0,0,0,0,0,0,0,1.42023,0,0);  -- The Ebdon Hold - DK start Area 
-- Master Siegesmith Corvus
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 128577;
DELETE FROM creature_movement WHERE id = 128577; -- 1st phase
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128577,1,2435.519,-5638.239,420.6436,23000,2850001,0,0,0,0,0,0,0,0,3.12208,0,0),
(128577,2,2437.19,-5641.65,420.645,0,0,0,0,0,0,0,0,0,0,4.50114,0,0),
(128577,3,2435.41,-5644.32,420.646,0,0,0,0,0,0,0,0,0,0,3.48091,0,0),
(128577,4,2431.86,-5645.49,420.647,23000,2850001,0,0,0,0,0,0,0,0,4.00431,0,0), 
(128577,5,2451.484,-5657.579,420.6479,23000,2850001,0,0,0,0,0,0,0,0,5.63849,0,0),
(128577,6,2453.48,-5653.42,420.648,0,0,0,0,0,0,0,0,0,0,0.461798,0,0),
(128577,7,2462.6,-5651.98,420.647,0,0,0,0,0,0,0,0,0,0,6.03656,0,0),
(128577,8,2467.57,-5654.19,420.648,0,0,0,0,0,0,0,0,0,0,4.74065,0,0),
(128577,9,2466.95,-5656.07,420.648,23000,2850001,0,0,0,0,0,0,0,0,4.1609,0,0),
(128577,10,2465.18,-5651.85,420.647,0,0,0,0,0,0,0,0,0,0,1.73178,0,0),
(128577,11,2465.12,-5648.38,420.647,0,0,0,0,0,0,0,0,0,0,1.26761,0,0),
(128577,12,2468.46,-5644.62,420.645,0,0,0,0,0,0,0,0,0,0,0.634575,0,0),
(128577,13,2471.44,-5643.97,420.644,0,0,0,0,0,0,0,0,0,0,6.0067,0,0),
(128577,14,2472.51,-5644.89,420.646,0,0,0,0,0,0,0,0,0,0,4.9362,0,0),
(128577,15,2472.472,-5647.062,420.6463,23000,2850001,0,0,0,0,0,0,0,0,4.39756,0,0),
(128577,16,2469.48,-5644.12,420.645,0,0,0,0,0,0,0,0,0,0,3.29789,0,0),
(128577,17,2448.771,-5653.16,420.6467,0,0,0,0,0,0,0,0,0,0,2.09792,0,0),
(128577,18,2449.722,-5646.9,420.6445,15000,2850002,0,0,0,0,0,0,0,0,1.25586,0,0),
(128577,19,2447.31,-5640.27,420.645,0,0,0,0,0,0,0,0,0,0,2.30235,0,0),
(128577,20,2444.59,-5638.61,420.645,0,0,0,0,0,0,0,0,0,0,3.07754,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2850001,2850002);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2850001,2,1,233,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2850001,19,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2850002,3,1,153,0,0,0,0,0,0,0,0,0,0,0,0,'');-- Lil Timmy c.8666 - Stormwind
-- correct spawn point, spawntime, waypoints, despawn after path completed.
UPDATE creature SET position_x = -8634.505859, position_y = 918.960571, position_z = 99.354980, orientation = 3.832987, MovementType = 2, spawntimesecs = 5400 WHERE guid = 45501;
UPDATE creature_template SET MovementType = 2 WHERE entry = 8666;
DELETE FROM creature_movement_template WHERE entry = 8666;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(8666,1,-8641.4,912.342,99.1397,0,0,0,0,0,0,0,0,0,0,3.91152,0,0),(8666,2,-8661.71,894.74,97.6239,0,0,0,0,0,0,0,0,0,0,3.80549,0,0),(8666,3,-8679.15,880.967,97.0168,0,0,0,0,0,0,0,0,0,0,4.15342,0,0),
(8666,4,-8681.12,877.654,97.0168,0,0,0,0,0,0,0,0,0,0,4.75829,0,0),(8666,5,-8679.29,873.082,97.0168,0,0,0,0,0,0,0,0,0,0,5.44708,0,0),(8666,6,-8659.98,849.329,97.0168,0,0,0,0,0,0,0,0,0,0,5.40624,0,0),
(8666,7,-8639.96,825.073,96.6251,0,0,0,0,0,0,0,0,0,0,5.19026,0,0),(8666,8,-8636.74,813.025,96.6486,0,0,0,0,0,0,0,0,0,0,4.75515,0,0),(8666,9,-8634,793.001,96.6508,0,0,0,0,0,0,0,0,0,0,4.48104,0,0),
(8666,10,-8635.94,785.58,96.6515,0,0,0,0,0,0,0,0,0,0,4.15982,0,0),(8666,11,-8651.43,775.162,96.6714,0,0,0,0,0,0,0,0,0,0,3.96116,0,0),(8666,12,-8661.39,764.974,96.6998,0,0,0,0,0,0,0,0,0,0,4.49418,0,0),
(8666,13,-8662.58,758.134,96.6947,0,0,0,0,0,0,0,0,0,0,5.23402,0,0),(8666,14,-8647.73,738.576,96.6965,0,0,0,0,0,0,0,0,0,0,5.65527,0,0),(8666,15,-8630.74,726.606,96.7377,0,0,0,0,0,0,0,0,0,0,5.49741,0,0),
(8666,16,-8618.88,711.997,96.7248,0,0,0,0,0,0,0,0,0,0,5.71339,0,0),(8666,17,-8614.67,709.545,96.7549,0,0,0,0,0,0,0,0,0,0,6.24353,0,0),(8666,18,-8606.13,711.345,96.7382,0,0,0,0,0,0,0,0,0,0,0.438651,0,0),
(8666,19,-8598.07,712.945,96.6746,0,0,0,0,0,0,0,0,0,0,6.21386,0,0),(8666,20,-8588.25,706.887,97.0168,0,0,0,0,0,0,0,0,0,0,5.36092,0,0),(8666,21,-8566.09,678.512,97.0168,0,0,0,0,0,0,0,0,0,0,5.39783,0,0),
(8666,22,-8561.86,674.735,97.0168,0,0,0,0,0,0,0,0,0,0,0.0948142,0,0),(8666,23,-8556.46,676.784,97.0168,0,0,0,0,0,0,0,0,0,0,0.591183,0,0),(8666,24,-8542.79,686.774,97.6239,0,0,0,0,0,0,0,0,0,0,0.416825,0,0),
(8666,25,-8536.45,686.854,97.6775,0,0,0,0,0,0,0,0,0,0,6.02221,0,0),(8666,26,-8531.64,683.194,98.4422,0,0,0,0,0,0,0,0,0,0,5.39861,0,0),(8666,27,-8524.58,673.178,102.5,0,0,0,0,0,0,0,0,0,0,5.31143,0,0),
(8666,28,-8519.8,666.4,102.615,0,0,0,0,0,0,0,0,0,0,5.35855,0,0),(8666,29,-8512.94,656.648,100.901,0,0,0,0,0,0,0,0,0,0,5.05539,0,0),(8666,30,-8513.15,648.714,100.292,0,0,0,0,0,0,0,0,0,0,4.31398,0,0),
(8666,31,-8518.18,642.361,100.092,0,0,0,0,0,0,0,0,0,0,3.7587,0,0),(8666,32,-8538.04,630.723,100.404,0,0,0,0,0,0,0,0,0,0,3.67624,0,0),(8666,33,-8554.03,617.81,102.053,0,0,0,0,0,0,0,0,0,0,3.67702,0,0),
(8666,34,-8564.5,613.48,102.435,0,0,0,0,0,0,0,0,0,0,3.71158,0,0),(8666,35,-8576.12,601.799,103.26,0,0,0,0,0,0,0,0,0,0,4.10978,0,0),(8666,36,-8582.44,589.572,103.691,0,0,0,0,0,0,0,0,0,0,4.47655,0,0),
(8666,37,-8586.68,575.605,102.985,0,0,0,0,0,0,0,0,0,0,4.63756,0,0),(8666,38,-8585.96,565.941,102.26,0,0,0,0,0,0,0,0,0,0,4.95957,0,0),(8666,39,-8578.9,545.988,101.779,0,0,0,0,0,0,0,0,0,0,4.39958,0,0),
(8666,40,-8581.73,541.012,102.09,0,0,0,0,0,0,0,0,0,0,3.93698,0,0),(8666,41,-8590.09,533.912,104.76,0,0,0,0,0,0,0,0,0,0,3.8286,0,0),(8666,42,-8598.32,527.164,106.399,0,0,0,0,0,0,0,0,0,0,3.8286,0,0),
(8666,43,-8605.67,520.882,105.748,0,0,0,0,0,0,0,0,0,0,4.02573,0,0),(8666,44,-8610.26,515.735,103.79,0,0,0,0,0,0,0,0,0,0,3.59062,0,0),(8666,45,-8613.43,514.684,103.401,0,0,0,0,0,0,0,0,0,0,2.67406,0,0),
(8666,46,-8618.8,518.794,103.068,0,0,0,0,0,0,0,0,0,0,2.25388,0,0),(8666,47,-8635.17,535.152,99.9833,0,0,0,0,0,0,0,0,0,0,2.34105,0,0),(8666,48,-8647.39,546.721,97.8568,0,0,0,0,0,0,0,0,0,0,2.39603,0,0),
(8666,49,-8655.78,552.938,96.9435,0,0,0,0,0,0,0,0,0,0,2.89869,0,0),(8666,50,-8671.86,552.874,97.2037,0,0,0,0,0,0,0,0,0,0,3.45946,0,0),(8666,51,-8679.66,549.654,97.5031,0,0,0,0,0,0,0,0,0,0,3.70294,0,0),
(8666,52,-8689.63,540.268,97.828,0,0,0,0,0,0,0,0,0,0,3.98961,0,0),(8666,53,-8698.98,530.295,97.7173,0,0,0,0,0,0,0,0,0,0,3.86394,0,0),(8666,54,-8712.64,520.242,97.2398,0,0,0,0,0,0,0,0,0,0,3.1995,0,0),
(8666,55,-8715.24,521.571,97.4039,0,0,0,0,0,0,0,0,0,0,2.46279,0,0),(8666,56,-8720.77,528.729,99.1496,0,0,0,0,0,0,0,0,0,0,2.24995,0,0),(8666,57,-8729.84,539.87,101.105,0,0,0,0,0,0,0,0,0,0,2.2578,0,0),
(8666,58,-8735.95,547.101,100.845,0,0,0,0,0,0,0,0,0,0,2.31278,0,0),(8666,59,-8745.79,557.737,97.7107,0,0,0,0,0,0,0,0,0,0,2.76831,0,0),(8666,60,-8746.01,564.915,97.4001,0,0,0,0,0,0,0,0,0,0,1.0217,0,0),
(8666,61,-8729.92,581.294,97.6775,0,0,0,0,0,0,0,0,0,0,0.77273,0,0),(8666,62,-8719.58,591.033,98.4713,0,0,0,0,0,0,0,0,0,0,0.505695,0,0),(8666,63,-8712.04,594.001,98.6079,0,0,0,0,0,0,0,0,0,0,0.512763,0,0),
(8666,64,-8707.26,600.676,98.9982,0,0,0,0,0,0,0,0,0,0,1.19999,0,0),(8666,65,-8704.46,616.407,100.215,0,0,0,0,0,0,0,0,0,0,1.62803,0,0),(8666,66,-8705.6,629.078,100.477,0,0,0,0,0,0,0,0,0,0,1.78904,0,0),
(8666,67,-8708.67,645.787,99.9994,0,0,0,0,0,0,0,0,0,0,1.97518,0,0),(8666,68,-8716.46,666.585,98.8681,0,0,0,0,0,0,0,0,0,0,2.08042,0,0),(8666,69,-8724.09,676.482,98.6317,0,0,0,0,0,0,0,0,0,0,2.17781,0,0),
(8666,70,-8728.54,684.167,98.7324,0,0,0,0,0,0,0,0,0,0,2.09141,0,0),(8666,71,-8733.47,695.151,98.723,0,0,0,0,0,0,0,0,0,0,2.11105,0,0),(8666,72,-8743.6,709.876,98.2678,0,0,0,0,0,0,0,0,0,0,1.36492,0,0),
(8666,73,-8741.08,714.561,98.9815,0,0,0,0,0,0,0,0,0,0,0.788438,0,0),(8666,74,-8734.46,720.119,101.647,0,0,0,0,0,0,0,0,0,0,0.685551,0,0),(8666,75,-8726.79,726.231,100.924,0,0,0,0,0,0,0,0,0,0,0.740529,0,0),
(8666,76,-8718.09,733.687,97.9511,0,0,0,0,0,0,0,0,0,0,0.965938,0,0),(8666,77,-8716.42,737.269,97.7782,0,0,0,0,0,0,0,0,0,0,1.56912,0,0),(8666,78,-8721.01,746.752,97.9693,0,0,0,0,0,0,0,0,0,0,2.11262,0,0),
(8666,79,-8730.96,759.107,98.1572,0,0,0,0,0,0,0,0,0,0,1.95711,0,0),(8666,80,-8731.99,769.385,98.0161,0,0,0,0,0,0,0,0,0,0,1.37435,0,0),(8666,81,-8724.64,778.108,98.0604,0,0,0,0,0,0,0,0,0,0,0.868549,0,0),
(8666,82,-8717.55,792.762,97.1197,0,0,0,0,0,0,0,0,0,0,1.65081,0,0),(8666,83,-8717.68,798.804,97.1792,0,0,0,0,0,0,0,0,0,0,1.9202,0,0),(8666,84,-8728.3,817.744,96.9777,0,0,0,0,0,0,0,0,0,0,1.68929,0,0),
(8666,85,-8726.79,830.504,96.3102,0,0,0,0,0,0,0,0,0,0,1.37607,0,0),(8666,86,-8723.42,841.35,96.0764,0,0,0,0,0,0,0,0,0,0,0.900908,0,0),(8666,87,-8709.57,857.779,96.978,0,0,0,0,0,0,0,0,0,0,0.686494,0,0),
(8666,88,-8692.38,870.557,97.0284,0,0,0,0,0,0,0,0,0,0,0.645652,0,0),(8666,89,-8679.35,880.974,97.0167,0,0,0,0,0,0,0,0,0,0,0.657433,0,0),(8666,90,-8661.22,896.239,97.5968,0,0,0,0,0,0,0,0,0,0,0.7399,0,0),
(8666,91,-8643.7,912.233,98.9288,0,0,0,0,0,0,0,0,0,0,0.7399,0,0),(8666,92,-8634.58,918.926,99.3551,2000,1,0,0,0,0,0,0,0,0,0.618163,0,0); -- desp. self
DELETE FROM creature_linking WHERE guid = 53705;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(53705, 45501, 8832);
-- White Kitten - missing added
DELETE FROM creature WHERE guid = 53705;
INSERT INTO creature VALUES (53705,7386,0,1,1,0,0,-8634.01,919.46,99.36,3.88,180,0,0,42,0,0,0);







-- Creature template update
UPDATE creature_template SET MinLevel=70, MaxLevel=70, FactionAlliance=114, FactionHorde=114, EXPANSION=1, MinLevelHealth=6602, MaxLevelHealth=6602, MinMeleeDmg=252, MaxMeleeDmg=357, MinRangedDmg=215, MaxRangedDmg=320, UnitFlags=UnitFlags|33554688, Armor=6792, MeleeAttackPower=304, RangedAttackPower=44 WHERE entry=25782;
-- ###########
-- Quest 10439
-- ###########

-- db text
SET @DB_STRING_ENTRY:=2000005780;
DELETE FROM db_script_string WHERE entry BETWEEN @DB_STRING_ENTRY AND @DB_STRING_ENTRY+4;
INSERT INTO db_script_string (entry,content_default,sound,TYPE,LANGUAGE,emote,COMMENT) VALUES
(@DB_STRING_ENTRY+0,'You heard the fleshling! MOVE OUT!',0,0,0,1,'Captain Saeed - say quest start'),
(@DB_STRING_ENTRY+1,'Tell me when you are ready, $N. We will attack on your command.',0,0,0,0,'Captain Saeed - say attack prepare'),
(@DB_STRING_ENTRY+2,'It\'s now or never, soldiers! Let\'s do this! For K\'aresh! For the Protectorate!',0,0,0,0,'Captain Saeed - say attack start'),
(@DB_STRING_ENTRY+3,'The time for your destruction has finally come, Dimensius!',0,0,0,0,'Captain Saeed - say taunt dimensius'),
(@DB_STRING_ENTRY+4,'We won. Dimensius no more. Report this proffesor Dabiri.',0,0,0,0,'Captain Saeed - say quest complete');

-- conditions
SET @CONDITION_ENTRY:=969;
DELETE FROM conditions WHERE condition_entry BETWEEN @CONDITION_ENTRY AND @CONDITION_ENTRY+3;
INSERT INTO conditions (condition_entry,TYPE,value1,value2) VALUES
(@CONDITION_ENTRY+0,9,10439,0),
(@CONDITION_ENTRY+1,-1,@CONDITION_ENTRY+0,719),
(@CONDITION_ENTRY+2,33,36,0),
(@CONDITION_ENTRY+3,-1,@CONDITION_ENTRY+0,@CONDITION_ENTRY+2);

-- gossip
UPDATE creature_template SET GossipMenuId=8228 WHERE entry=20985;
DELETE FROM gossip_menu WHERE entry=8228;
INSERT INTO gossip_menu (entry,text_id,script_id,condition_id) VALUES
(8228,10229,0,0),
(8228,10232,0,@CONDITION_ENTRY+3);
-- gossip options
DELETE FROM gossip_menu_option WHERE menu_id=8228;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,condition_id) VALUES
(8228,0,0,'I am that fleshling, Saeed. Let\'s go!',1,1,-1,0,822801,0,0,'',@CONDITION_ENTRY+1),
(8228,1,0,'I am ready! Let\'s finish Dimensius!',1,1,-1,0,822802,0,0,'',@CONDITION_ENTRY+3); -- ToDo: text needs to be checked

-- gossip script on event start
DELETE FROM dbscripts_on_gossip WHERE id=822801;
INSERT INTO dbscripts_on_gossip (id,delay,command,datalong,datalong2,dataint,comments) VALUES 
(822801,0,0,0,0,@DB_STRING_ENTRY,'Captain Saeed - say quest start'),
(822801,0,8,0,0,0,'Captain Saeed - kill credit'),
(822801,0,22,495,1,0,'Captain Saeed - set temp faction'),
(822801,3,1,15,0,0,'Captain Saeed - handle emote'),
(822801,3,35,5,25,0,'Captain Saeed - send event custom A'),
(822801,0,29,1,2,0,'Captain Saeed - remove Gossip Flag'),
(822801,9,25,1,0,0,'Captain Saeed - set Run = true'),
(822801,10,32,0,0,0,'Captain Saeed - resume WP movement');
-- gossip script on attack start
DELETE FROM dbscripts_on_gossip WHERE id=822802;
INSERT INTO dbscripts_on_gossip (id,delay,command,datalong,datalong2,dataint,comments) VALUES 
(822802,0,0,1,0,@DB_STRING_ENTRY+2,'Captain Saeed - say attack start'),
(822802,0,29,1,2,0,'Captain Saeed - remove Gossip Flag'),
(822802,3,32,0,0,0,'Captain Saeed - resume WP movement');

-- creature linking
DELETE FROM creature_linking_template WHERE entry IN (20984,21783,21805,21780);
INSERT INTO creature_linking_template (entry,map,master_entry,flag,search_range) VALUES
(20984,530,20985,8705,60),
(21783,530,20985,8705,60),
(21805,530,20985,8705,60),
(21780,530,19554,4112,60);

-- creature movement
DELETE FROM creature_movement_template WHERE entry=20985;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(20985, 1, 4264.29, 2102.70, 140.839, 1000, 2098501, 6.108), 
(20985, 2, 4257.76, 2099.95, 143.481, 0, 0, 0),
(20985, 3, 4249.97, 2105.68, 144.083, 0, 0, 0),
(20985, 4, 4246.45, 2111.34, 144.552, 0, 0, 0),
(20985, 5, 4244.12, 2117.80, 145.031, 0, 0, 0),
(20985, 6, 4233.49, 2118.49, 149.540, 0, 0, 0),
(20985, 7, 4221.95, 2117.72, 153.124, 0, 0, 0),
(20985, 8, 4209.70, 2114.40, 155.606, 0, 0, 0),
(20985, 9, 4204.60, 2110.80, 160.063, 0, 0, 0),
(20985, 10, 4180.80, 2081.76, 161.666, 0, 0, 0),
(20985, 11, 4174.75, 2070.90, 164.385, 0, 0, 0),
(20985, 12, 4174.37, 2058.48, 169.121, 0, 0, 0),
(20985, 13, 4178.27, 2051.20, 172.750, 0, 0, 0),
(20985, 14, 4182.15, 2044.52, 176.056, 0, 0, 0),
(20985, 15, 4185.74, 2035.18, 179.999, 0, 0, 0),
(20985, 16, 4186.65, 2023.36, 184.971, 0, 0, 0),
(20985, 17, 4185.54, 2014.54, 189.862, 0, 0, 0),
(20985, 18, 4182.17, 2006.35, 195.371, 0, 0, 0),
(20985, 19, 4177.94, 1999.77, 200.164, 0, 0, 0),
(20985, 20, 4173.38, 1994.37, 203.833, 0, 0, 0),
(20985, 21, 4168.69, 1989.66, 206.921, 0, 0, 0),
(20985, 22, 4162.75, 1984.90, 209.942, 0, 0, 0),
(20985, 23, 4157.40, 1981.32, 212.398, 0, 0, 0),
(20985, 24, 4150.51, 1977.62, 215.067, 0, 0, 0),
(20985, 25, 4144.56, 1974.64, 217.155, 0, 0, 0),
(20985, 26, 4134.58, 1969.06, 220.354, 0, 0, 0),
(20985, 27, 4117.35, 1985.00, 223.929, 0, 0, 0),
(20985, 28, 4110.04, 1994.40, 226.897, 0, 0, 0),
(20985, 29, 4104.33, 2005.52, 229.987, 0, 0, 0),
(20985, 30, 4097.22, 2020.26, 234.464, 0, 0, 0),
(20985, 31, 4083.09, 2037.36, 240.329, 0, 0, 0),
(20985, 32, 4070.09, 2051.12, 246.065, 0, 0, 0),
(20985, 33, 4057.96, 2062.31, 250.666, 0, 0, 0),
(20985, 34, 4034.90, 2077.34, 254.478, 0, 0, 0),
(20985, 35, 4002.98, 2097.80, 254.212, 0, 0, 0),
(20985, 36, 3992.89, 2088.86, 254.330, 1000, 2098536, 4.073),
(20985, 37, 3989.38, 2083.54, 256.337, 0, 0, 0),
(20985, 38, 3984.63, 2077.76, 256.405, 0, 0, 0),
(20985, 39, 3978.75, 2066.79, 256.405, 0, 0, 0),
(20985, 40, 3959.94, 2039.18, 257.630, 0, 0, 0),
(20985, 41, 3955.86, 2030.96, 257.812, 1000, 2098541, 4.133);

-- Movement scripts
-- Workaround required because of evade mechanics
UPDATE creature SET MovementType=2 WHERE guid=73766;
DELETE FROM dbscripts_on_creature_movement WHERE id=2098501;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,dataint,comments) VALUES
(2098501,0,32,1,0,0,'Captain Saeed - pause WP Movement');
-- Attack prepare script
DELETE FROM dbscripts_on_creature_movement WHERE id=2098536;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,dataint,comments) VALUES
(2098536,0,32,1,0,0,'Captain Saeed - pause WP Movement'),
(2098536,0,29,1,1,0,'Captain Saeed - add Gossip Flag'),
(2098536,0,0,0,0,@DB_STRING_ENTRY+1,'Captain Saeed - say attack prepare');
-- Attack start script
DELETE FROM dbscripts_on_creature_movement WHERE id=2098541;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2098541,0,0,0,0,0,0,0,@DB_STRING_ENTRY+3,'Captain Saeed - say taunt dimensius'),
(2098541,0,32,1,0,0,0,0,0,'Captain Saeed - pause WP Movement'),
(2098541,3,23,0,0,19554,40,0,0,'Dimensius the All-Devouring - demorph to original form'),
(2098541,6,35,6,40,0,0,0,0,'Captain Saeed - send event custom B'),
(2098541,7,26,0,0,19554,40,1,0,'Captain Saeed - attack Dimensius the All-Devouring');

-- Dimensius death script
DELETE FROM dbscripts_on_creature_death WHERE id=19554;
INSERT INTO dbscripts_on_creature_death (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(19554,0,0,0,0,20985,50,0,@DB_STRING_ENTRY+4,'Captain Saeed - say quest complete'),
(19554,10,18,0,0,20985,50,7,0,'Captain Saeed - despawn self');
-- Apothecary Azethen - c.16794 -- Falcon Watch
-- Emote comes only with quest
UPDATE creature_template_addon SET emote = 0 WHERE entry = 16794;
-- Twinkle c.17230
-- movement, script
UPDATE creature SET MovementType = 2 WHERE guid = 61963;
UPDATE creature_template SET MovementType = 2 WHERE entry = 17230;
DELETE FROM creature_movement_template WHERE entry = 17230;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(17230,1,-603.059,4166.03,64.3336,0,0,0,0,0,0,0,0,0,0,4.63706,0,0),
(17230,2,-600.881,4161.52,64.9931,0,0,0,0,0,0,0,0,0,0,5.42795,0,0),
(17230,3,-595.116,4157.8,65.2767,0,0,0,0,0,0,0,0,0,0,5.75546,0,0),
(17230,4,-590.633,4155.53,67.8345,0,0,0,0,0,0,0,0,0,0,5.82222,0,0),
(17230,5,-576.829,4149.44,68.1243,5000,1723001,0,0,0,0,0,0,0,0,5.86542,0,0),
(17230,6,-591.253,4155.71,67.667,0,0,0,0,0,0,0,0,0,0,2.71597,0,0),
(17230,7,-594.879,4158.15,65.2685,0,0,0,0,0,0,0,0,0,0,2.23766,0,0),
(17230,8,-599.785,4161.72,65.0972,0,0,0,0,0,0,0,0,0,0,1.9667,0,0),
(17230,9,-601.114,4164.75,64.754,0,0,0,0,0,0,0,0,0,0,1.20172,0,0),
(17230,10,-597.099,4176,64.9199,240000,0,0,0,0,0,0,0,0,0,0.944113,0,0),
(17230,11,-597.099,4176,64.9199,1000,1723002,0,0,0,0,0,0,0,0,0.944113,0,0),
(17230,12,-602.987,4163.88,64.5397,0,0,0,0,0,0,0,0,0,0,3.80201,0,0),
(17230,13,-605.388,4162.12,64.4036,0,0,0,0,0,0,0,0,0,0,3.27186,0,0),
(17230,14,-618.198,4162.71,63.1639,0,0,0,0,0,0,0,0,0,0,2.73779,0,0),
(17230,15,-620.134,4163.85,63.0323,0,0,0,0,0,0,0,0,0,0,2.11968,0,0),
(17230,16,-621.806,4167.84,62.6762,0,0,0,0,0,0,0,0,0,0,1.72384,0,0),
(17230,17,-623.2,4175.55,61.4847,0,0,0,0,0,0,0,0,0,0,1.74602,0,0),
(17230,18,-628.983,4190.44,58.1583,0,0,0,0,0,0,0,0,0,0,1.95808,0,0),
(17230,19,-623.776,4177.94,60.921,0,0,0,0,0,0,0,0,0,0,5.28581,0,0),
(17230,20,-613.522,4175.35,62.6926,1000,1723003,0,0,0,0,0,0,0,0,0.0464096,0,0),
(17230,21,-597.789,4176.94,64.7764,240000,0,0,0,0,0,0,0,0,0,0.186996,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1723001,1723002,1723003); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1723001,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(1723002,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(1723002,0,31,16793,20,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(1723002,1,0,0,0,16793,20,7,2000000011,2000000012,0,0,0,0,0,0,'force buddy to: say random text'),
(1723003,0,31,17282,20,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(1723003,1,0,0,0,17282,62075,7 | 0x10,2000000013,0,0,0,0,0,0,0,'force buddy to: say random text');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000011 AND 2000000014;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000011,'Did you find something fun to chase around, Twinkle?  I bet you did!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000012,'It\'s just you and me, Twinkle.  Daddy\'s not going to be coming home.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000013,'I wonder how far this would launch that white cat...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);
-- Messenger to Thrall(q.9438) 
UPDATE creature SET position_x = 1920.01, position_y = -4123.95, position_z = 43.63 WHERE guid = 4770;
UPDATE creature_template_addon SET bytes1 = 5, emote = 0 WHERE entry = 4949;
DELETE FROM dbscripts_on_quest_end WHERE id = 9438;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(9438,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Thrall active'),
(9438,1,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'4949 - NpcFlag removed'),
(9438,2,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(9438,6,0,0,0,0,0,0,2000000014,0,0,0,0,0,0,0,''),
(9438,10,3,0,0,0,0,0,0,0,0,0,1923.52,-4136.32,40.574,4.80241,''),
(9438,18,0,0,0,0,0,0,2000000015,0,0,0,0,0,0,0,''),
(9438,22,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(9438,23,25,1,0,3144,50,7,0,0,0,0,0,0,0,0,'RUN ON'),
(9438,25,0,0,0,0,0,0,2000000016,0,0,0,0,0,0,0,''),
(9438,26,3,0,0,3144,50,7,0,0,0,0,1923.41,-4138.83,40.608,0.540048,''),
(9438,31,3,0,0,3144,50,7,0,0,0,0,0,0,0,1.61604,''),
(9438,33,0,0,0,3144,20,7,2000000164,0,0,0,0,0,0,0,'force buddy to: say text'),
(9438,38,0,0,0,0,0,0,2000000165,0,0,0,0,0,0,0,''),
(9438,43,28,8,0,3144,20,7,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(9438,45,0,0,0,3144,20,7,2000000166,0,0,0,0,0,0,0,'force buddy to: say text'),
(9438,48,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(9438,49,3,0,0,0,0,0,0,0,0,0,1920.33,-4126.62,43.1443,1.62468,''),
(9438,54,3,0,0,0,0,0,0,0,0,0,0,0,0,4.86366,''),
(9438,57,0,0,0,0,0,0,2000000250,0,0,0,0,0,0,0,''),
(9438,60,1,25,0,0,0,0,0,0,0,0,0,0,0,0,''),
(9438,61,25,0,0,3144,50,7,0,0,0,0,0,0,0,0,'RUN OFF'),
(9438,62,28,0,0,3144,50,7,0,0,0,0,0,0,0,0,'STATE_STAND'),
(9438,63,3,0,0,3144,50,7,0,0,0,0,1925.12,-4137.15,40.6369,2.32692,''),
(9438,64,3,0,0,3144,50,7,0,0,0,0,1923.25,-4136.01,40.5651,2.4243,''),
(9438,67,0,0,0,3144,50,7,2000000251,0,0,0,0,0,0,0,'force buddy to: say text'),
(9438,69,0,0,0,0,0,0,2000000252,0,0,0,0,0,0,0,''),
(9438,69,3,0,0,3144,50,7,0,0,0,0,1905.75,-4161.37,41.0035,0.488692,''),
(9438,70,3,0,0,0,0,0,0,0,0,0,1920.01,-4124.28,43.6129,1.62468,''),
(9438,72,3,0,0,0,0,0,0,0,0,0,0,0,0,4.79965,''),
(9438,73,28,5,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_SIT'),
(9438,73,3,0,0,0,0,0x08,0,0,0,0,1920.01,-4123.75,43.6129,4.79965,''),
(9438,74,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'4949 - NpcFlag added'),
(9438,82,3,0,0,3144,50,7,0,0,0,0,0,0,0,0.488692,''),
(9438,83,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Thrall unactive');
UPDATE quest_template SET CompleteScript = 9438 WHERE entry = 9438;
DELETE FROM db_script_string WHERE entry IN (2000000014,2000000015,2000000016,2000000164,2000000165,2000000166,2000000250,2000000251,2000000252);
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000014,'My people have survived in Outland...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000015,'Unnoticed for years...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000016,'...uncorrupted!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000164,'Thrall! My lord... are you all right?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000165,'I\'ll be fine, Eitrigg.  We must begin preparations... I need to go to Outland at once!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000166,'With all due respect, Warchief.  Our enemies would take advantage of your sudden absence if we don\'t prepare properly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000250,'You are right, Eitrigg.  The timing is unfavorable.  Make sure our best ambassadors are sent as envoys to Hellscream.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000251,'At once, sir! For the Horde!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,66,NULL),
(2000000252,'If he\'s anything like his father, allying with the Mag\'har will mark the dawn of a new age for the Horde.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);-- For The Horde!(q.4974) - update
DELETE FROM dbscripts_on_quest_end WHERE id = 4974;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(4974,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Thrall active'),
(4974,1,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(4974,2,13,0,0,175787,20,1,0,0,0,0,0,0,0,0,'use gobject'),
(4974,3,0,0,0,0,0,0,2000005090,0,0,0,0,0,0,0,''),
(4974,8,15,16609,0,0,0,0,0,0,0,0,0,0,0,0,''),
(4974,11,0,0,0,0,0,0,2000005091,0,0,0,0,0,0,0,''),
(4974,15,28,5,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_SIT'),
(4974,16,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Thrall unactive');
UPDATE db_script_string SET emote = 5, TYPE = 6 WHERE entry = 2000005090;
UPDATE db_script_string SET emote = 1, TYPE = 6 WHERE entry = 2000005091;-- Eitrigg's Wisdom(q.4941)
SET @GOSSIP = 2901;
-- Add gossip options for each menu id
DELETE FROM gossip_menu_option WHERE menu_id BETWEEN @GOSSIP AND @GOSSIP+7;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES 
(@GOSSIP, 0, 0, 'Hello, Eitrigg. I bring news from Blackrock Spire.', 1, 1, @GOSSIP+1, 0, 0, 0, 0, '',973),
(@GOSSIP+1, 0, 0, 'There is only one Warchief, Eitrigg!', 1, 1, @GOSSIP+2, 0, 0, 0, 0, '',0),
(@GOSSIP+2, 0, 0, 'What do you mean?', 1, 1, @GOSSIP+3, 0, 0, 0, 0, '',0),
(@GOSSIP+3, 0, 0, 'Hearthglen? But...', 1, 1, @GOSSIP+4, 0, 0, 0, 0, '',0),
(@GOSSIP+4, 0, 0, 'I will take you up on that offer, Eitrigg.', 1, 1, @GOSSIP+5, 0, 0, 0, 0, '',0),
(@GOSSIP+5, 0, 0, 'Ah, so that is how they pushed the Dark Iron to the lower parts of the Spire.', 1, 1, @GOSSIP+6, 0, 0, 0, 0, '',0),
(@GOSSIP+6, 0, 0, 'Perhaps there exists a way?', 1, 1, @GOSSIP+7, 0, 0, 0, 0, '',0),
(@GOSSIP+7, 0, 0, 'As you wish, Eitrigg.', 1, 1, -1, 0, @GOSSIP+7, 0, 0, '',0);
-- Add gossip menus (text values already in db)
DELETE FROM gossip_menu WHERE entry BETWEEN @GOSSIP+1 AND @GOSSIP+7;
INSERT INTO gossip_menu (entry, text_id) VALUES 
(@GOSSIP+1, 3574),
(@GOSSIP+2, 3575),
(@GOSSIP+3, 3576),
(@GOSSIP+4, 3577),
(@GOSSIP+5, 3578),
(@GOSSIP+6, 3579),
(@GOSSIP+7, 3580);
DELETE FROM conditions WHERE condition_entry = 973;
INSERT INTO conditions (condition_entry, TYPE, value1, value2) VALUES
(973, 9, 4941, 0);
DELETE FROM dbscripts_on_gossip WHERE id = @GOSSIP+7;
INSERT INTO dbscripts_on_gossip (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(@GOSSIP+7,0,7,4941,20,0,0,0,0,0,0,0,0,0,0,0,'');-- Mistress of Deception(q.6568)
UPDATE quest_template SET OfferRewardText ='Hmph. That one.$B$BHow is Rokaro? As suspicious as ever, sending me a note like this.$B$BYou must be on an important mission if Rokaro has sent you to me.$B$BWell, I owe the Warchief a fovor or two.' WHERE entry = 6568; 
-- Rokaro 
-- should never use Rexxar's model (trash from prev. versions?:)
UPDATE creature_model_info SET modelid_other_gender = 0 WHERE modelid = 20925;
-- 'Trial of the Sea Lion' -H -A update
-- Strange Lockbox -- corrected
UPDATE gameobject SET position_x = 848.998, position_y = 2208.29, position_z = -137.5, orientation = 1.50034, rotation2 = 0.681762, rotation3 = 0.731574 WHERE guid = 27813; -- silverpine forrest
UPDATE gameobject SET position_x = -10174.2, position_y = 2388.69, position_z = -139.4, orientation = 4.78638, rotation2 = 0.68047, rotation3 = -0.732776 WHERE guid = 27812; -- Westfall
-- missing  Bubbly Fissure added
DELETE FROM gameobject WHERE guid = 24681; -- Silverpine Forest 
INSERT INTO gameobject VALUES (24681, 180057, 0, 1,1,841.286, 2207.92, -136.506, 0.217779, 0, 0, 0.108674, 0.994077, 25, 255, 1);
DELETE FROM gameobject WHERE guid = 24682; -- Westfall 
INSERT INTO gameobject VALUES (24682, 180057, 0, 1,1,-10170.1, 2388.58, -139.25, 3.84594, 0, 0, 0.98777, -0.15592, 25, 255, 1);
-- Mathrengyl Bearwalker <Druid Trainer>
-- sells Packets of Tharlendris Seeds and Evergreen Pouches once the character has finished the quest 'Morrowgrain Research'. 
DELETE FROM conditions WHERE condition_entry = 965;
INSERT INTO conditions (condition_entry, TYPE, value1, value2) VALUES
(965, 8, 3785, 0);
UPDATE gossip_menu_option SET condition_id = 965 WHERE menu_id = 1403 AND id = 1;
-- q. 3785 leads to 3803 with the same objective... and q.3803 is repeatable. 
UPDATE quest_template SET SpecialFlags = 0 WHERE entry = 3785; -- q. should not be repeatable
-- Bashana Runetotem
-- sells Packets of Tharlendris Seeds and Evergreen Pouches once the character has finished the quest 'Morrowgrain Research'.
DELETE FROM gossip_menu_option WHERE menu_id = 1701;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_script_id, condition_id) VALUES
(1701, 0, 1, 'I\'d like to purchase more Tharlendris seeds.', 3, 128, 0, 0);
DELETE FROM conditions WHERE condition_entry = 974;
INSERT INTO conditions (condition_entry, TYPE, value1, value2) VALUES
(974, 8, 3786, 0);
-- Mangy Wolf - Elvynn Forest
-- duplicates removed
DELETE FROM creature WHERE guid = 81089;
DELETE FROM creature_addon WHERE guid = 81089;
DELETE FROM creature_movement WHERE id = 81089;
DELETE FROM game_event_creature WHERE guid = 81089;
DELETE FROM game_event_creature_data WHERE guid = 81089;
DELETE FROM creature_battleground WHERE guid = 81089;
DELETE FROM creature_linking WHERE guid = 81089 OR master_guid = 81089;
DELETE FROM creature WHERE guid = 81088;
DELETE FROM creature_addon WHERE guid = 81088;
DELETE FROM creature_movement WHERE id = 81088;
DELETE FROM game_event_creature WHERE guid = 81088;
DELETE FROM game_event_creature_data WHERE guid = 81088;
DELETE FROM creature_battleground WHERE guid = 81088;
DELETE FROM creature_linking WHERE guid = 81088 OR master_guid = 81088;
-- ==========================================================
-- WOTLK CLASS LEVEL STATS EXP0, EXP1 AND EXP2 IMPLEMENTATION - SOME UNKNOWN HIGH LEVEL VALUES WERE INTEROPLATED AND EDUCATED GUESSES WERE MADE (THEORETIC VALUES SINCE NO NPC ARE THOSE LEVELS)
-- ==========================================================
DELETE FROM creature_template_classlevelstats;
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('1','1','42','42','42','0','0.1321','0.1321','0.1321','9','0','7');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('2','1','55','55','55','0','0.2888','0.2888','0.2888','11','0','8');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('3','1','71','71','71','0','0.5547','0.5547','0.5547','13','0','33');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('4','1','86','86','86','0','0.9435','0.9435','0.9435','15','0','68');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('5','1','102','102','102','0','1.3708','1.3708','1.3708','18','0','111');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('6','1','120','120','120','0','2.0661','2.0661','2.0661','20','0','165');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('7','1','137','137','137','0','2.7669','2.7669','2.7669','24','0','230');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('8','1','156','156','156','0','3.1993','3.1993','3.1993','28','0','306');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('9','1','176','176','176','0','3.7038','3.7038','3.7038','31','0','387');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('10','1','198','198','198','0','4.1084','4.1084','4.1084','34','0','463');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('11','1','222','222','222','0','4.6996','4.6996','4.6996','38','0','528');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('12','1','247','247','247','0','5.4601','5.4601','5.4601','42','0','562');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('13','1','273','273','273','0','5.9359','5.9359','5.9359','46','1','596');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('14','1','300','300','300','0','6.5895','6.5895','6.5895','50','1','630');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('15','1','328','328','328','0','7.1981','7.1981','7.1981','54','2','665');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('16','1','356','356','356','0','7.6697','7.6697','7.6697','56','2','700');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('17','1','386','386','386','0','8.2225','8.2225','8.2225','60','2','734');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('18','1','417','417','417','0','8.5452','8.5452','8.5452','64','3','768');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('19','1','449','449','449','0','8.9384','8.9384','8.9384','68','3','802');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('20','1','484','484','484','0','9.6823','9.6823','9.6823','70','4','836');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('21','1','521','521','521','0','9.9677','9.9677','9.9677','74','4','872');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('22','1','562','562','562','0','10.4218','10.4218','10.4218','78','4','906');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('23','1','605','605','605','0','10.8099','10.8099','10.8099','80','5','940');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('24','1','651','651','651','0','11.2419','11.2419','11.2419','84','6','975');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('25','1','699','699','699','0','11.7485','11.7485','11.7485','86','6','1008');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('26','1','750','750','750','0','12.0453','12.0453','12.0453','90','7','1043');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('27','1','800','800','800','0','12.6213','12.6213','12.6213','92','7','1078');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('28','1','853','853','853','0','12.795','12.795','12.795','96','8','1111');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('29','1','905','905','905','0','13.3432','13.3432','13.3432','100','8','1145');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('30','1','955','955','955','0','13.9264','13.9264','13.9264','102','9','1179');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('31','1','1006','1006','1006','0','14.1954','14.1954','14.1954','106','9','1213');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('32','1','1057','1057','1057','0','14.696','14.696','14.696','108','10','1249');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('33','1','1110','1110','1110','0','14.9914','14.9914','14.9914','112','10','1281');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('34','1','1163','1163','1163','0','15.4944','15.4944','15.4944','114','11','1317');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('35','1','1220','1220','1220','0','15.8617','15.8617','15.8617','118','11','1349');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('36','1','1277','1277','1277','0','16.2984','16.2984','16.2984','120','12','1456');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('37','1','1336','1336','1336','0','16.7962','16.7962','16.7962','124','12','1568');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('38','1','1395','1395','1395','0','17.1865','17.1865','17.1865','128','13','1684');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('39','1','1459','1459','1459','0','17.7286','17.7286','17.7286','132','13','1808');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('40','1','1524','1524','1524','0','18.2971','18.2971','18.2971','136','14','1938');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('41','1','1585','1585','1585','0','19.1997','19.1997','19.1997','142','15','2074');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('42','1','1651','1651','1651','0','20.3431','20.3431','20.3431','152','15','2218');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('43','1','1716','1716','1716','0','21.7088','21.7088','21.7088','162','16','2369');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('44','1','1782','1782','1782','0','23.5881','23.5881','23.5881','174','16','2528');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('45','1','1848','1848','1848','0','24.6797','24.6797','24.6797','184','17','2695');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('46','1','1919','1919','1919','0','25.1735','25.1735','25.1735','188','17','2750');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('47','1','1990','1990','1990','0','25.7137','25.7137','25.7137','192','18','2804');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('48','1','2062','2062','2062','0','26.209','26.209','26.209','196','19','2857');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('49','1','2138','2138','2138','0','26.9952','26.9952','26.9952','200','19','2912');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('50','1','2215','2215','2215','0','27.5899','27.5899','27.5899','206','20','2966');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('51','1','2292','2292','2292','0','28.128','28.128','28.128','210','20','3018');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('52','1','2371','2371','2371','0','28.8795','28.8795','28.8795','214','21','3074');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('53','1','2453','2453','2453','0','29.4381','29.4381','29.4381','218','22','3128');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('54','1','2533','2533','2533','0','30.0501','30.0501','30.0501','224','22','3180');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('55','1','2614','2614','2614','0','30.7177','30.7177','30.7177','228','23','3234');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('56','1','2699','2699','2699','0','31.2387','31.2387','31.2387','234','23','3289');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('57','1','2784','2784','2784','0','31.945','31.945','31.945','238','24','3342');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('58','1','2871','3989','3989','0','32.5967','40.2143','40.2143','242','25','3396');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('59','1','2961','4142','4142','0','33.2007','43.2857','43.2857','248','25','3449');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('60','1','3052','4979','4979','0','33.9625','53.4755','53.4755','252','26','3750');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('61','1','3144','5158','5158','0','34.5714','61.2729','61.2729','258','28','4047');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('62','1','3237','5341','5341','0','35.2381','67.4442','67.4442','262','30','4344');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('63','1','3331','5527','5527','0','35.9047','71.4361','71.4361','268','32','4641');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('64','1','3427','5715','5715','0','36.5714','75.9334','75.9334','272','33','4937');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('65','1','3524','5914','5914','0','37.2381','80.3794','80.3794','278','35','5234');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('66','1','3624','6116','6116','0','37.9047','84.8941','84.8941','282','37','5531');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('67','1','3728','6326','6326','0','38.5714','89.6211','94.901','288','39','5829');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('68','1','3834','6542','6986','0','39.2381','94.4934','104.527','292','41','6126');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('69','1','3942','6761','7984','0','39.9047','99.5328','114.153','298','43','6423');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('70','1','4050','6986','8982','0','40.5714','104.527','123.779','304','44','6719');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('71','1','4163','7181','9291','0','41.2381','106.357','127.382','308','48','7018');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('72','1','4278','7380','9610','0','41.9047','108.071','131.091','314','53','7318');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('73','1','4399','7588','9940','0','42.5714','118.643','134.908','320','58','7618');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('74','1','4524','7804','10282','0','43.2381','120.434','138.836','354','63','7918');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('75','1','4652','8025','10635','0','43.9047','122.226','142.878','392','68','8219');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('76','1','4781','8247','11001','0','44.5713','124.018','147.038','432','74','8520');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('77','1','4916','8480','11379','0','45.2379','125.81','151.319','478','81','8822');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('78','1','5052','8715','11770','0','45.9045','127.602','155.724','528','88','9124');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('79','1','5194','8960','12175','0','46.5711','129.394','160.258','582','95','9426');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('80','1','5342','9215','12600','0','47.2377','131.186','164.924','642','103','9729');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('81','1','5492','9474','13033','0','47.9043','132.978','168.974','708','112','10033');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('82','1','5647','9741','13481','0','48.5709','134.77','173.024','782','121','10356');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('83','1','5808','10019','13945','0','49.2375','136.562','177.074','805','135','10673');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('84','1','5971','10300','14426','0','49.9041','138.354','181.124','828','149','10990');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('85','1','6141','10595','15498','0','50.5707','140.146','185.174','851','163','11307');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('1','2','41','41','41','60','0.2381','0.2381','0.2381','9','0','23');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('2','2','54','54','54','69','0.3119','0.3119','0.3119','11','0','26');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('3','2','69','69','69','79','0.5952','0.5952','0.5952','11','0','33');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('4','2','83','83','83','104','0.946','0.946','0.946','13','0','69');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('5','2','98','98','98','115','1.4567','1.4567','1.4567','14','0','112');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('6','2','115','115','115','126','2.0933','2.0933','2.0933','16','0','165');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('7','2','131','131','131','138','2.7273','2.7273','2.7273','20','0','230');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('8','2','148','148','148','165','3.1076','3.1076','3.1076','24','0','307');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('9','2','166','166','166','178','3.595','3.595','3.595','27','0','396');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('10','2','186','186','186','191','3.9604','3.9604','3.9604','30','0','502');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('11','2','208','208','208','205','4.4552','4.4552','4.4552','34','0','528');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('12','2','230','230','230','249','5.1436','5.1436','5.1436','38','0','562');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('13','2','253','253','253','264','5.5674','5.5674','5.5674','42','1','562');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('14','2','276','276','276','295','6.1568','6.1568','6.1568','46','1','630');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('15','2','301','301','301','326','6.8211','6.8211','6.8211','48','2','665');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('16','2','325','325','325','357','7.1374','7.1374','7.1374','52','2','700');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('17','2','350','350','350','390','7.6355','7.6355','7.6355','56','2','734');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('18','2','377','377','377','408','8.0339','8.0339','8.0339','58','3','768');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('19','2','404','404','404','456','8.611','8.611','8.611','60','3','802');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('20','2','433','433','433','490','9.0674','9.0674','9.0674','64','4','836');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('21','2','464','464','464','510','9.3169','9.3169','9.3169','68','4','872');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('22','2','498','498','498','545','9.7945','9.7945','9.7945','71','5','906');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('23','2','533','533','533','581','10.076','10.076','10.076','74','5','940');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('24','2','571','571','571','618','10.4619','10.4619','10.4619','78','6','975');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('25','2','610','610','610','655','10.7857','10.7857','10.7857','80','6','1008');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('26','2','651','651','651','693','11.1849','11.1849','11.1849','84','6','1042');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('27','2','690','690','690','732','11.7126','11.7126','11.7126','86','7','1078');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('28','2','732','732','732','756','11.9663','11.9663','11.9663','90','7','1110');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('29','2','773','773','773','811','12.352','12.352','12.352','94','8','1145');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('30','2','811','811','811','852','13.0007','13.0007','13.0007','94','8','1178');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('31','2','850','850','850','878','13.2348','13.2348','13.2348','98','9','1213');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('32','2','888','888','888','935','13.6924','13.6924','13.6924','100','9','1248');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('33','2','928','928','928','963','13.9511','13.9511','13.9511','104','10','1281');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('34','2','967','967','967','1007','14.4142','14.4142','14.4142','106','10','1316');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('35','2','1009','1009','1009','1067','14.7365','14.7365','14.7365','110','11','1349');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('36','2','1050','1050','1050','1097','15.1346','15.1346','15.1346','112','11','1455');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('37','2','1093','1093','1093','1142','15.5816','15.5816','15.5816','116','11','1567');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('38','2','1135','1135','1135','1189','15.9286','15.9286','15.9286','120','12','1683');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('39','2','1180','1180','1180','1236','16.4168','16.4168','16.4168','124','12','1807');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('40','2','1226','1226','1226','1283','16.9294','16.9294','16.9294','128','13','1937');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('41','2','1268','1268','1268','1332','17.8592','17.8592','17.8592','132','13','2072');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('42','2','1321','1321','1321','1381','18.8824','18.8824','18.8824','142','13','2216');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('43','2','1373','1373','1373','1432','20.1127','20.1127','20.1127','152','14','2367');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('44','2','1426','1426','1426','1483','21.6981','21.6981','21.6981','166','15','2527');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('45','2','1478','1478','1478','1534','22.9018','22.9018','22.9018','172','15','2692');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('46','2','1535','1535','1535','1587','23.3451','23.3451','23.3451','176','16','2749');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('47','2','1592','1592','1592','1640','23.9542','23.9542','23.9542','180','16','2802');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('48','2','1650','1650','1650','1695','24.401','24.401','24.401','184','17','2855');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('49','2','1710','1710','1710','1750','24.9975','24.9975','24.9975','188','17','2910');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('50','2','1772','1772','1772','1807','25.5204','25.5204','25.5204','194','18','2964');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('51','2','1834','1834','1834','1864','26.0047','26.0047','26.0047','198','19','3017');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('52','2','1897','1897','1897','1923','26.6877','26.6877','26.6877','202','19','3072');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('53','2','1962','1962','1962','1982','27.1912','27.1912','27.1912','206','20','3126');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('54','2','2026','2026','2026','2041','27.8506','27.8506','27.8506','210','20','3178');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('55','2','2091','2091','2091','2117','28.4555','28.4555','28.4555','214','21','3232');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('56','2','2159','2159','2159','2163','28.9161','28.9161','28.9161','220','21','3287');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('57','2','2227','2227','2227','2241','29.5701','29.5701','29.5701','224','22','3340');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('58','2','2297','3191','3191','2289','30.1469','34.7143','34.7143','228','23','3394');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('59','2','2369','3314','3314','2369','30.6847','49.6442','49.6442','234','23','3447');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('60','2','2442','3984','3984','2434','31.3842','55','55','238','24','3748');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('61','2','2515','4126','4126','2486','32.0714','58.3279','58.3279','244','25','4044');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('62','2','2590','4274','4274','2568','32.4286','62.4676','62.4676','246','26','4340');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('63','2','2665','4422','4422','2620','33','66.121','66.121','252','27','4637');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('64','2','2740','4572','4572','2705','33.7143','70.2568','70.2568','256','28','4932');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('65','2','2819','4731','4731','2790','34.3333','74.3252','74.3252','262','29','5228');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('66','2','2899','4892','6116','2846','35.0158','78.472','84.8941','266','29','5523');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('67','2','2982','5060','6326','2933','35.656','82.7944','94.901','272','31','5821');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('68','2','3067','5233','6986','2991','36.3244','87.2677','104.527','276','31','6116');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('69','2','3153','5409','7984','3080','36.974','91.8916','114.153','282','32','6412');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('70','2','3240','5589','8982','3155','37.6361','96.7364','123.779','286','33','6708');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('71','2','3330','5744','9291','3231','38.2899','98.3977','127.383','290','37','7007');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('72','2','3422','5903','9610','3309','38.9492','99.8571','131.092','296','40','7305');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('73','2','3519','6070','9940','3387','39.6048','101.451','134.908','302','44','7604');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('74','2','3619','6243','10282','3466','40.2629','102.955','138.836','334','48','7903');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('75','2','3722','6420','10635','3561','40.9193','104.52','142.878','370','53','8204');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('76','2','3825','6602','11001','3643','41.5757','106.085','147.038','408','57','8503');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('77','2','3933','6784','11379','3725','42.2321','107.65','151.319','452','62','8803');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('78','2','4042','6972','11770','3809','42.8885','109.215','155.724','500','68','9104');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('79','2','4155','7167','12175','3893','43.5449','110.78','160.258','550','74','9405');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('80','2','4274','7373','12600','3994','44.2013','112.345','164.924','608','80','9706');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('81','2','4394','7581','13033','4081','44.8577','113.91','169.095','670','86','10007');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('82','2','4518','7794','13481','4169','45.5141','115.475','173.266','726','91','10253');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('83','2','4646','8012','13945','4258','46.1705','117.04','177.438','783','98','10573');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('84','2','4778','8235','14423','4363','46.8269','118.605','181.61','840','105','10893');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('85','2','4913','8463','15498','4454','47.4833','120.17','185.782','897','112','11213');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('1','4','42','42','42','0','0.1321','0.1321','0.1321','9','0','23');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('2','4','55','55','55','0','0.2888','0.2888','0.2888','11','0','26');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('3','4','71','71','71','0','0.5547','0.5547','0.5547','13','0','33');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('4','4','86','86','86','0','0.9435','0.9435','0.9435','15','0','69');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('5','4','102','102','102','0','1.3708','1.3708','1.3708','18','0','112');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('6','4','120','120','120','0','2.0661','2.0661','2.0661','20','0','165');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('7','4','137','137','137','0','2.7669','2.7669','2.7669','24','0','230');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('8','4','156','156','156','0','3.1993','3.1993','3.1993','28','0','307');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('9','4','176','176','176','0','3.7038','3.7038','3.7038','31','0','396');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('10','4','198','198','198','0','4.1084','4.1084','4.1084','34','0','502');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('11','4','222','222','222','0','4.6996','4.6996','4.6996','38','0','528');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('12','4','247','247','247','0','5.4601','5.4601','5.4601','42','0','562');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('13','4','273','273','273','0','5.9359','5.9359','5.9359','46','1','562');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('14','4','300','300','300','0','6.5895','6.5895','6.5895','50','1','630');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('15','4','328','328','328','0','7.1981','7.1981','7.1981','54','2','665');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('16','4','356','356','356','0','7.6697','7.6697','7.6697','56','2','700');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('17','4','386','386','386','0','8.2225','8.2225','8.2225','60','2','734');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('18','4','417','417','417','0','8.5452','8.5452','8.5452','64','3','768');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('19','4','449','449','449','0','8.9384','8.9384','8.9384','68','3','802');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('20','4','484','484','484','0','9.6823','9.6823','9.6823','70','4','836');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('21','4','521','521','521','0','9.9677','9.9677','9.9677','74','4','872');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('22','4','562','562','562','0','10.4218','10.4218','10.4218','78','4','906');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('23','4','605','605','605','0','10.8099','10.8099','10.8099','80','5','940');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('24','4','651','651','651','0','11.2419','11.2419','11.2419','84','6','975');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('25','4','699','699','699','0','11.7485','11.7485','11.7485','86','6','1008');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('26','4','750','750','750','0','12.0453','12.0453','12.0453','90','7','1042');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('27','4','800','800','800','0','12.6213','12.6213','12.6213','92','7','1078');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('28','4','853','853','853','0','12.795','12.795','12.795','96','8','1110');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('29','4','905','905','905','0','13.3432','13.3432','13.3432','100','8','1145');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('30','4','955','955','955','0','13.9264','13.9264','13.9264','102','9','1178');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('31','4','1006','1006','1006','0','14.1954','14.1954','14.1954','106','9','1213');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('32','4','1057','1057','1057','0','14.696','14.696','14.696','108','10','1248');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('33','4','1110','1110','1110','0','14.9914','14.9914','14.9914','112','10','1281');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('34','4','1163','1163','1163','0','15.4944','15.4944','15.4944','114','11','1316');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('35','4','1220','1220','1220','0','15.8617','15.8617','15.8617','118','11','1349');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('36','4','1277','1277','1277','0','16.2984','16.2984','16.2984','120','12','1455');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('37','4','1336','1336','1336','0','16.7962','16.7962','16.7962','124','12','1567');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('38','4','1395','1395','1395','0','17.1865','17.1865','17.1865','128','13','1683');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('39','4','1459','1459','1459','0','17.7286','17.7286','17.7286','132','13','1807');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('40','4','1524','1524','1524','0','18.2971','18.2971','18.2971','136','14','1937');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('41','4','1585','1585','1585','0','19.1997','19.1997','19.1997','142','15','2072');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('42','4','1651','1651','1651','0','20.3431','20.3431','20.3431','152','15','2216');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('43','4','1716','1716','1716','0','21.7088','21.7088','21.7088','162','16','2367');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('44','4','1782','1782','1782','0','23.5881','23.5881','23.5881','174','16','2527');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('45','4','1848','1848','1848','0','24.6797','24.6797','24.6797','184','17','2692');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('46','4','1919','1919','1919','0','25.1735','25.1735','25.1735','188','17','2749');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('47','4','1990','1990','1990','0','25.7137','25.7137','25.7137','192','18','2802');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('48','4','2062','2062','2062','0','26.209','26.209','26.209','196','19','2855');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('49','4','2138','2138','2138','0','26.9952','26.9952','26.9952','200','19','2910');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('50','4','2215','2215','2215','0','27.5899','27.5899','27.5899','206','20','2964');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('51','4','2292','2292','2292','0','28.128','28.128','28.128','210','20','3017');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('52','4','2371','2371','2371','0','28.8795','28.8795','28.8795','214','21','3072');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('53','4','2453','2453','2453','0','29.4381','29.4381','29.4381','218','22','3126');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('54','4','2533','2533','2533','0','30.0501','30.0501','30.0501','224','22','3178');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('55','4','2614','2614','2614','0','30.7177','30.7177','30.7177','228','23','3232');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('56','4','2699','2699','2699','0','31.2387','31.2387','31.2387','234','23','3287');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('57','4','2784','2784','2784','0','31.945','31.945','31.945','238','24','3340');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('58','4','2871','3989','3989','0','32.5967','40.2143','40.2143','242','25','3394');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('59','4','2961','4142','4142','0','33.2007','43.2857','43.2857','248','25','3447');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('60','4','3052','4979','4979','0','33.9625','53.4755','53.4755','252','26','3748');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('61','4','3144','5158','5158','0','34.5714','61.2729','61.2729','258','28','4044');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('62','4','3237','5341','5341','0','35.2381','67.4442','67.4442','262','30','4340');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('63','4','3331','5527','5527','0','35.9047','71.4361','71.4361','268','32','4637');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('64','4','3427','5715','5715','0','36.5714','75.9334','75.9334','272','33','4932');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('65','4','3524','5914','5914','0','37.2381','80.3794','80.3794','278','35','5228');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('66','4','3624','6116','6116','0','37.9047','84.8941','84.8941','282','37','5523');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('67','4','3728','6326','6326','0','38.5714','89.6211','94.901','288','39','5821');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('68','4','3834','6542','6986','0','39.2381','94.4934','104.527','292','41','6116');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('69','4','3942','6761','7984','0','39.9047','99.5328','114.153','298','43','6412');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('70','4','4050','6986','8982','0','40.5714','104.527','123.779','304','44','6708');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('71','4','4163','7181','9291','0','41.2381','106.357','127.382','308','48','7007');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('72','4','4278','7380','9610','0','41.9047','108.071','131.091','314','53','7305');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('73','4','4399','7588','9940','0','42.5714','118.643','134.908','320','58','7604');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('74','4','4524','7804','10282','0','43.2381','120.434','138.836','354','63','7903');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('75','4','4652','8025','10635','0','43.9047','122.226','142.878','392','68','8204');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('76','4','4781','8247','11001','0','44.5713','124.018','147.038','432','74','8503');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('77','4','4916','8480','11379','0','45.2379','125.81','151.319','478','81','8803');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('78','4','5052','8715','11770','0','45.9045','127.602','155.724','528','88','9104');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('79','4','5194','8960','12175','0','46.5711','129.394','160.258','582','95','9405');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('80','4','5342','9215','12600','0','47.2377','131.186','164.924','642','103','9706');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('81','4','5492','9474','13033','0','47.9043','132.978','168.974','708','112','10007');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('82','4','5647','9741','13481','0','48.5709','134.77','173.024','782','121','10253');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('83','4','5808','10019','13945','0','49.2375','136.562','177.074','805','135','10573');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('84','4','5971','10300','14426','0','49.9041','138.354','181.124','828','149','10893');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('85','4','6141','10595','15498','0','50.5707','140.146','185.174','851','163','11213');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('1','8','40','40','40','120','0.1781','0.1781','0.1781','8','0','5');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('2','8','52','52','52','147','0.3233','0.3233','0.3233','10','0','16');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('3','8','67','67','67','174','0.4793','0.4793','0.4793','12','10','28');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('4','8','81','81','81','202','0.5714','0.5714','0.5714','13','11','57');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('5','8','95','95','95','230','0.768','0.768','0.768','14','11','93');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('6','8','111','111','111','259','1.1985','1.1985','1.1985','15','11','139');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('7','8','126','126','126','289','2.159','2.159','2.159','15','11','194');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('8','8','143','143','143','319','2.5217','2.5217','2.5217','16','11','265');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('9','8','160','160','160','350','3.03','2.99','2.99','17','11','339');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('10','8','178','178','178','382','3.4451','3.4451','3.4451','17','12','423');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('11','8','199','199','199','459','3.975','3.975','3.975','18','12','447');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('12','8','219','219','219','537','4.6771','4.6771','4.6771','19','12','475');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('13','8','241','241','241','601','5.1513','5.1513','5.1513','20','12','509');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('14','8','263','263','263','710','5.7241','5.7241','5.7241','21','12','523');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('15','8','285','285','285','790','6.3298','6.3298','6.3298','22','13','559');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('16','8','307','307','307','856','6.6051','6.6051','6.6051','24','13','589');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('17','8','330','330','330','938','7.0485','7.0485','7.0485','26','13','617');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('18','8','354','354','354','1020','7.4083','7.4083','7.4083','27','13','643');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('19','8','379','379','379','1118','7.9333','7.9333','7.9333','28','13','674');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('20','8','405','405','405','1202','8.3382','8.3382','8.3382','30','14','701');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('21','8','432','432','432','1272','8.5517','8.5517','8.5517','32','14','729');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('22','8','463','463','463','1357','8.9102','8.9102','8.9102','34','14','759');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('23','8','494','494','494','1443','9.228','9.228','9.228','35','14','786');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('24','8','528','528','528','1545','9.6818','9.6818','9.6818','36','15','815');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('25','8','562','562','562','1633','10.1014','10.1014','10.1014','37','15','843');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('26','8','598','598','598','1707','10.3246','10.3246','10.3246','39','15','871');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('27','8','633','633','633','1812','10.804','10.804','10.804','40','15','900');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('28','8','669','669','669','1977','11.0213','11.0213','11.0213','42','15','928');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('29','8','704','704','704','2068','11.3608','11.3608','11.3608','44','16','957');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('30','8','737','737','737','2175','11.9607','11.9607','11.9607','44','16','984');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('31','8','770','770','770','2253','12.16','12.16','12.16','46','16','1012');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('32','8','802','802','802','2362','12.5746','12.5746','12.5746','47','16','1042');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('33','8','835','835','835','2457','12.7966','12.7966','12.7966','49','17','1065');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('34','8','867','867','867','2553','13.2162','13.2162','13.2162','50','17','1098');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('35','8','902','902','902','2680','13.497','13.497','13.497','52','17','1124');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('36','8','935','935','935','2763','13.8566','13.8566','13.8566','53','18','1241');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('37','8','970','970','970','2861','14.367','14.367','14.367','54','18','1300');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('38','8','1004','1004','1004','2975','14.6707','14.6707','14.6707','56','18','1391');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('39','8','1040','1040','1040','3075','15.1049','15.1049','15.1049','58','18','1489');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('40','8','1077','1077','1077','3191','15.5617','15.5617','15.5617','60','19','1590');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('41','8','1110','1110','1110','3293','16.4044','16.4044','16.4044','62','19','1697');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('42','8','1156','1156','1156','3471','17.3076','17.3076','17.3076','67','19','1811');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('43','8','1201','1201','1201','3575','18.5165','18.5165','18.5165','71','19','1926');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('44','8','1247','1247','1247','3680','19.9224','19.9224','19.9224','78','20','2078');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('45','8','1294','1294','1294','3801','21.0097','21.0097','21.0097','81','20','2177');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('46','8','1343','1343','1343','3923','21.4023','21.4023','21.4023','83','20','2220');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('47','8','1393','1393','1393','4031','21.9484','21.9484','21.9484','85','21','2265');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('48','8','1443','1443','1443','4140','22.3444','22.3444','22.3444','87','21','2307');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('49','8','1497','1497','1497','4281','22.8788','22.8788','22.8788','89','21','2349');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('50','8','1551','1551','1551','4393','23.4508','23.4508','23.4508','91','22','2393');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('51','8','1604','1604','1604','4506','23.8815','23.8815','23.8815','93','22','2437');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('52','8','1660','1660','1660','4650','24.4958','24.4958','24.4958','95','22','2481');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('53','8','1717','1717','1717','4765','24.9442','24.9442','24.9442','97','23','2524');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('54','8','1773','1773','1773','4896','25.5368','25.5368','25.5368','99','23','2567');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('55','8','1830','1830','1830','5013','26.079','26.079','26.079','101','23','2609');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('56','8','1889','1889','1889','5206','26.4791','26.4791','26.4791','104','24','2654');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('57','8','1949','1949','1949','5340','27.0667','27.0667','27.0667','106','24','2698');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('58','8','2010','2793','2793','5461','27.6972','37.4048','37.4048','107','24','2740');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('59','8','2073','2899','2899','5598','28.1686','46.5537','46.5537','110','25','2784');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('60','8','2136','3484','3484','5751','28.7983','50.396','50.396','112','25','3025');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('61','8','2201','3611','3611','5875','29.3225','53.4807','53.4807','115','25','3263');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('62','8','2266','3739','3739','6015','29.917','57.2713','57.2713','116','25','3500');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('63','8','2332','3870','3870','6156','30.4646','60.577','60.577','119','26','3736');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('64','8','2399','4002','4002','6299','31.0435','64.089','64.089','121','26','3977');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('65','8','2467','4140','4731','6443','31.6015','68.0244','69.9742','124','26','4214');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('66','8','2552','4281','4892','6588','32.1734','72.0499','78.8784','125','27','4460');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('67','8','2610','4429','5060','6749','32.736','75.9676','87.7826','128','27','4710');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('68','8','2684','4580','5588','6882','33.3048','80.1061','96.6868','130','27','4928');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('69','8','2759','4733','6387','7031','33.8695','84.2722','105.591','133','28','5167');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('70','8','2835','4890','7185','7196','34.4369','88.3402','114.496','135','28','5404');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('71','8','2914','5027','7432','7332','35.0025','92.4034','117.829','137','31','5645');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('72','8','2995','5166','7688','7500','35.5693','96.5068','121.259','140','34','5886');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('73','8','3098','5311','7952','7654','36.1353','100.617','124.79','143','37','6126');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('74','8','3186','5461','8225','7809','36.7018','104.723','128.423','158','41','6368');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('75','8','3256','5617','8508','7981','37.268','108.832','132.162','175','45','6610');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('76','8','3367','5778','8800','8139','37.8342','112.941','136.01','193','49','6851');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('77','8','3462','5945','9103','8313','38.4004','117.05','139.97','214','54','7094');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('78','8','3558','6117','9416','8459','38.9666','121.159','144.045','236','58','7335');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('79','8','3658','6295','9740','8636','39.5328','125.268','148.239','260','64','7579');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('80','8','3739','6478','10080','8814','40.099','129.377','152.555','287','69','7822');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('81','8','3870','6667','10486','8979','40.6652','133.486','156.871','317','74','8102');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('82','8','3977','6861','10784','9160','41.2314','137.595','161.187','350','79','8340');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('83','8','4090','7061','11156','9328','41.7976','141.704','165.503','386','84','8505');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('84','8','4195','7266','11602','9512','42.3638','145.813','169.819','425','89','8670');
INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseHealthExp2`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseDamageExp2`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES ('85','8','4299','7477','12122','9697','42.93','149.922','174.135','467','94','8835');
-- Added completion script for quests 112 (Collecting Kelp) and 114 (The Escape)
DELETE FROM dbscripts_on_quest_start WHERE id = 114;
DELETE FROM dbscripts_on_quest_end WHERE id IN (112, 114);
INSERT INTO dbscripts_on_quest_end  (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES 
(112, 0, 0, 0, 0, 0, 0, 0, 2000000080, 0, 0, 0, 0, 0, 0, 0, 'William Pestle - Initial Say'),
(112, 0, 29, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'NpcFlag removed'),
(112, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.45219, 'William Pestle - Turn To Face Bookshelf'),
(112, 2, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'William Pestle - Emote Working on Bookshelf'),
(112, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'William Pestle - Stop Emote'),
(112, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.98451, 'William Pestle - Turn to Face Original Direction'),
(112, 6, 0, 0, 0, 0, 0, 0, 2000000081, 0, 0, 0, 0, 0, 0, 0, 'William Pestle - Final Say'),
(112, 7, 29, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'NpcFlag added'),
(114, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.39307, 'Maybell Maclure - Turn To Face Wall'),
(114, 2, 0, 0, 0, 0, 0, 0, 2000000167, 0, 0, 0, 0, 0, 0, 0, 'Maybell Maclure - First Say'),
(114, 4, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Maybell Maclure - Emote Drinking Vial'),
(114, 8, 18, 0, 0, 0, 0, 0x04, 0, 0, 0, 0, 0, 0, 0, 0, 'Maybell Maclure - Despawn');
DELETE FROM db_script_string WHERE entry = 2000000167;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000167, 'Here goes nothing...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL);
UPDATE creature SET spawntimesecs = 20 WHERE id = 251;
UPDATE quest_template SET CompleteScript = 112 WHERE Entry = 112;
UPDATE quest_template SET StartScript = 0, CompleteScript = 114 WHERE Entry = 114;-- q.2520 'Sathrah's Sacrifice' - UPDATE
DELETE FROM dbscripts_on_event WHERE id = 2313;
INSERT INTO dbscripts_on_event  (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2313,1,10,7411,300000,0,0,0,0,0,0,0,9639.5,2528.97,1331.72,5.28395,'quest 2520');
-- Spirit of Sathrah
UPDATE creature_template SET MovementType = 2 WHERE entry = 7411; -- now move him to template (unique npc)
DELETE FROM creature_movement_template WHERE entry = 7411;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,textid1,textid2,textid3,textid4,textid5,emote,spell,wpguid,orientation,model1,model2) VALUES
(7411,1,9642.47,2523.25,1331.54,0,0,0,0,0,0,0,0,0,0,4.70163,0,0),
(7411,2,9640.32,2517.43,1331.57,0,0,0,0,0,0,0,0,0,0,4.00734,0,0),
(7411,3,9635.62,2514.35,1331.4,0,0,0,0,0,0,0,0,0,0,3.21959,0,0),
(7411,4,9630.91,2515.59,1331.72,0,0,0,0,0,0,0,0,0,0,2.56535,0,0),
(7411,5,9626.52,2520.1,1331.73,0,0,0,0,0,0,0,0,0,0,1.9496,0,0),
(7411,6,9625.02,2526.36,1331.61,0,0,0,0,0,0,0,0,0,0,1.20975,0,0),
(7411,7,9630.56,2532.58,1331.39,0,0,0,0,0,0,0,0,0,0,0.604212,0,0),
(7411,8,9636.59,2532.65,1331.73,0,0,0,0,0,0,0,0,0,0,5.88602,0,0),
(7411,9,9640.05,2529.06,1331.77,3000,741101,0,0,0,0,0,0,0,0,5.3818,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 741101; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(741101,3,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn');

-- Fixed completion text of quest 6121 (Lessons Anew)
UPDATE quest_template SET OfferRewardText = 'Greetings young $C, I\'m glad to see you ready and eager to learn about the curing of poisons.$B$BWhile most druids in the past were put through pre-planned trials, your work will involve no such thing. There has been a rash of animal poisonings in Auberdine, and the village there has been unable to cure it. To that end, a representative there has asked Moonglade for aid and we are sending you there to aid them. This is no exercise - the work you\'ll do is quite real. Bear this in mind.' WHERE entry = 6121;
-- #######
-- AQ40 related updates
-- #######

-- Viscidus target (credit to YTDB)
DELETE FROM spell_script_target WHERE entry IN (25896);
INSERT INTO spell_script_target VALUES
(25896, 1, 15299, 0);
-- Fankriss spell targets (credit to YTDB)
DELETE FROM spell_target_position WHERE id IN (518,25831,25832);
INSERT INTO spell_target_position (id,target_map,target_position_x,target_position_y,target_position_z,target_orientation) VALUES
(518, 531, -8028.5, 1050.9, -54, 0),
(25831, 531, -8158.03, 1139.3, -83.95, 0),
(25832, 531, -8029.25, 1237.78, -85.2285, 0);
-- other missing script target (credit to YTDB)
DELETE FROM spell_script_target WHERE entry=5628;
INSERT INTO spell_script_target VALUES
(5628, 1, 2011, 0),
(5628, 1, 2010, 0);
-- despawn globes on evade
DELETE FROM dbscripts_on_spell WHERE id IN (26608);
INSERT INTO dbscripts_on_spell (id,delay,command,datalong,data_flags,comments) VALUES
(26608,0,18,0,0,'Glob of Viscidus - Despawn');
-- Viscidus globes (guesswork - needs proper confirmation)
DELETE FROM spell_target_position WHERE id BETWEEN 25865 AND 25884;
INSERT INTO spell_target_position (id,target_map,target_position_x,target_position_y,target_position_z,target_orientation) VALUES
(25865, 531, -8023.594, 964.772, -41.229, 5.376),
(25878, 531, -8032.750, 948.274, -41.919, 5.595),
(25872, 531, -8037.889, 929.679, -43.416, 6.024),
(25866, 531, -8042.127, 911.263, -42.841, 6.200),
(25879, 531, -8037.076, 887.268, -43.581, 0.675),
(25873, 531, -8015.408, 867.734, -45.607, 1.103),
(25867, 531, -7999.364, 860.525, -47.206, 1.417),
(25880, 531, -7992.213, 857.500, -47.762, 1.664),
(25874, 531, -7982.804, 857.172, -48.212, 1.500),
(25868, 531, -7971.303, 862.581, -48.099, 2.148),
(25881, 531, -7960.709, 872.483, -48.759, 2.360),
(25875, 531, -7952.122, 883.183, -48.194, 2.430),
(25869, 531, -7943.205, 903.804, -48.473, 3.078),
(25882, 531, -7942.983, 918.616, -46.401, 3.306),
(25876, 531, -7947.219, 939.122, -44.014, 3.718),
(25870, 531, -7954.376, 958.562, -41.609, 3.962),
(25883, 531, -7964.316, 967.879, -42.112, 4.087),
(25877, 531, -7975.772, 974.820, -41.584, 4.417),
(25871, 531, -7997.188, 979.192, -41.653, 4.896),
(25884, 531, -8015.242, 976.553, -41.647, 4.947);
-- linking
DELETE FROM creature_linking_template WHERE entry IN (15922);
INSERT INTO creature_linking_template (entry, map, master_entry, flag, search_range) VALUES
(15922, 531, 15299, 4112, 0);
-- Bashana Runetotem - update for [018] commit (mistake)
-- sells Packets of Tharlendris Seeds and Evergreen Pouches once the character has finished the quest 'Morrowgrain Research'.
UPDATE gossip_menu_option SET condition_id = 974 WHERE menu_id = 1701 AND id = 0;



-- Tamed Ravager
-- spawned only as pet of 'Mag'har Hunter'. Any wild ones are duplicates.
DELETE FROM creature WHERE id = 19461;-- Hellfire Peninsula
-- Dread Tactician
-- waypoints for both  
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (59170,59171);
DELETE FROM creature_movement WHERE id IN (59170,59171);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(59170,1,-323.527,1504.12,33.9252,0,0,0,0,0,0,0,0,0,0,1.99358,0,0),(59170,2,-330.577,1518.24,37.4233,0,0,0,0,0,0,0,0,0,0,1.44851,0,0),(59170,3,-328.461,1534.86,41.7774,0,0,0,0,0,0,0,0,0,0,1.05581,0,0),
(59170,4,-318.088,1547.75,41.9369,0,0,0,0,0,0,0,0,0,0,0.4809,0,0),(59170,5,-297.698,1553.57,38.8787,0,0,0,0,0,0,0,0,0,0,0.41257,0,0),(59170,6,-285.704,1560.12,37.6612,0,0,0,0,0,0,0,0,0,0,1.14299,0,0),
(59170,7,-284.294,1569.71,39.2983,0,0,0,0,0,0,0,0,0,0,2.02813,0,0),(59170,8,-296.783,1577.63,43.7813,0,0,0,0,0,0,0,0,0,0,2.82688,0,0),(59170,9,-313.325,1574,47.7174,0,0,0,0,0,0,0,0,0,0,3.7273,0,0),
(59170,10,-325.579,1560.42,46.902,0,0,0,0,0,0,0,0,0,0,4.23388,0,0),(59170,11,-332.434,1540.82,43.8767,0,0,0,0,0,0,0,0,0,0,4.58652,0,0),(59170,12,-334.572,1520.35,38.2739,0,0,0,0,0,0,0,0,0,0,4.80721,0,0),
(59170,13,-325.434,1502.2,33.6747,0,0,0,0,0,0,0,0,0,0,5.59652,0,0),(59170,14,-311.298,1489.55,30.5442,0,0,0,0,0,0,0,0,0,0,5.89104,0,0),(59170,15,-291.215,1486.19,28.0306,0,0,0,0,0,0,0,0,0,0,0.0594546,0,0),
(59170,16,-279.277,1488.25,27.0881,0,0,0,0,0,0,0,0,0,0,0.380683,0,0),(59170,17,-272.568,1492.31,26.443,0,0,0,0,0,0,0,0,0,0,1.09463,0,0),(59170,18,-272.052,1500.23,27.7578,0,0,0,0,0,0,0,0,0,0,1.81249,0,0),
(59170,19,-276.87,1505.09,29.066,0,0,0,0,0,0,0,0,0,0,2.74319,0,0),(59170,20,-285.793,1504.62,29.8596,0,0,0,0,0,0,0,0,0,0,3.3558,0,0),(59170,21,-293.821,1496.54,29.8149,0,0,0,0,0,0,0,0,0,0,3.06598,0,0),
(59170,22,-305.978,1499.34,31.68,0,0,0,0,0,0,0,0,0,0,2.82251,0,0),(59171,1,-181.884,1532.15,29.6203,0,0,0,0,0,0,0,0,0,0,1.81292,0,0),(59171,2,-171.958,1503.01,26.9809,0,0,0,0,0,0,0,0,0,0,5.18621,0,0),
(59171,3,-158.915,1487.57,26.6283,0,0,0,0,0,0,0,0,0,0,5.50507,0,0),(59171,4,-137.304,1475.64,26.2033,0,0,0,0,0,0,0,0,0,0,5.92603,0,0),(59171,5,-122.424,1476.88,26.5783,0,0,0,0,0,0,0,0,0,0,0.370122,0,0),
(59171,6,-116.089,1481.98,29.0019,0,0,0,0,0,0,0,0,0,0,0.996085,0,0),(59171,7,-106.426,1504.22,32.3395,0,0,0,0,0,0,0,0,0,0,1.01101,0,0),(59171,8,-101.499,1529.12,34.7616,0,0,0,0,0,0,0,0,0,0,1.47832,0,0),
(59171,9,-98.9696,1538.63,38.0054,0,0,0,0,0,0,0,0,0,0,1.41549,0,0),(59171,10,-92.0829,1554.42,41.4467,0,0,0,0,0,0,0,0,0,0,1.38207,0,0),(59171,11,-94.3617,1569.15,44.765,0,0,0,0,0,0,0,0,0,0,1.99076,0,0),
(59171,12,-101.038,1576.31,45.8974,0,0,0,0,0,0,0,0,0,0,2.50127,0,0),(59171,13,-122.664,1575,42.6959,0,0,0,0,0,0,0,0,0,0,3.13744,0,0),(59171,14,-153.603,1577.63,38.4126,0,0,0,0,0,0,0,0,0,0,2.58923,0,0),
(59171,15,-132.849,1584.64,43.1805,0,0,0,0,0,0,0,0,0,0,0.00998227,0,0),(59171,16,-113.376,1583.4,46.1522,0,0,0,0,0,0,0,0,0,0,5.93032,0,0),(59171,17,-100.754,1576.82,46.0942,0,0,0,0,0,0,0,0,0,0,5.59338,0,0),
(59171,18,-93.3234,1568.3,44.6706,0,0,0,0,0,0,0,0,0,0,5.04204,0,0),(59171,19,-91.5001,1554.54,41.5127,0,0,0,0,0,0,0,0,0,0,4.5284,0,0),(59171,20,-93.1,1536.02,37.0006,0,0,0,0,0,0,0,0,0,0,4.44593,0,0),
(59171,21,-96.5151,1526.82,33.6709,0,0,0,0,0,0,0,0,0,0,4.31634,0,0),(59171,22,-99.2641,1520.25,34.4914,0,0,0,0,0,0,0,0,0,0,4.31634,0,0),(59171,23,-115.688,1488.39,30.4987,0,0,0,0,0,0,0,0,0,0,3.93857,0,0),
(59171,24,-127.385,1477.06,26.5594,0,0,0,0,0,0,0,0,0,0,3.4367,0,0),(59171,25,-138.635,1474.09,25.9177,0,0,0,0,0,0,0,0,0,0,3.06992,0,0),(59171,26,-153.117,1480.54,26.1379,0,0,0,0,0,0,0,0,0,0,2.31201,0,0),
(59171,27,-172.138,1504.48,27.064,0,0,0,0,0,0,0,0,0,0,2.2429,0,0);-- Hellfire Peninsula
-- Deathwhisperer
-- correct spawn
UPDATE creature SET position_x = -145.891022, position_y = 1465.911621, position_z = 24.569803, orientation = 1.265086 WHERE guid = 68877;
-- missing one added
DELETE FROM creature WHERE guid = 69711;
INSERT INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType) VALUES
(69711,19299,530,1,1,0,0,-128.362,1577.63,42.5033,4.67764,300,5,0,33805,0,0,1);
-- Wrathguard
-- missing added
DELETE FROM creature WHERE guid IN (69712,69713);
INSERT INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType) VALUES
(69712,18975,530,1,1,0,303,133.264,1700.15,36.9642,3.87463,300,0,0,3313,2369,0,0),
(69713,18975,530,1,1,0,303,166.372,1700.21,31.1226,5.51524,300,0,0,3191,2289,0,0);
-- Shattered Hand Berserker
DELETE FROM creature WHERE guid = 58273; -- replace for duplicate
INSERT INTO creature VALUES (58273,16878,530,1,1,0,247,77.434,3204.98,32.1802,1.50966,300,0,0,5158,0,0,0);
UPDATE creature SET position_x = 22.259817, position_y = 3235.015625, position_z = 18.917589, orientation = 5.560086, spawndist = 0, MovementType = 0 WHERE guid = 58274;
-- Shattered Hand Acolyte
DELETE FROM creature WHERE guid = 69714;
INSERT INTO creature VALUES (69714,19415,530,1,1,0,12,90.887,3207.16,33.2575,3.30453,300,0,0,4126,2426,0,0);
-- Shattered Hand Mage
DELETE FROM creature WHERE guid = 78965;
INSERT INTO creature VALUES (78965,19413,530,1,1,0,121,69.8437,3221.34,32.3471,5.51542,300,0,0,3972,5875,0,0);
-- Shattered Hand Guard
DELETE FROM creature WHERE guid = 79452;
INSERT INTO creature VALUES (79452,19414,530,1,1,0,121,105.814,3176.63,25.4563,0.520286,300,5,0,5158,0,0,1);
UPDATE creature SET position_x = -27.368002, position_y = 3217.763916, position_z = 10.151849, orientation = 2.634470 WHERE guid = 69340;
UPDATE creature SET position_x = 54.362099, position_y = 3245.204590, position_z = 26.976578, orientation = 5.925287 WHERE guid = 69341;-- Shadowmoon Valley
-- Dark Conclave Talonite 
UPDATE creature SET position_x = -4221.094727, position_y = 1811.848755, position_z = 127.112663, orientation = 2.971138 WHERE guid = 70941;
DELETE FROM creature WHERE guid = 69722;
INSERT INTO creature VALUES (69722,19825,530,1,1,0,1562,-3979.7,1762.08,99.1302,5.3589,300,5,0,5060,2933,0,1);
DELETE FROM creature WHERE guid = 69723;
INSERT INTO creature VALUES (69723,19825,530,1,1,0,1562,-4041.47,1691.66,97.8698,1.01172,300,5,0,5060,2933,0,1);
DELETE FROM creature WHERE guid = 69724;
INSERT INTO creature VALUES (69724,19825,530,1,1,0,1562,-4084.61,1708.84,98.2342,1.31017,300,5,0,5060,2933,0,1);
DELETE FROM creature WHERE guid = 79453;
INSERT INTO creature VALUES (79453,19825,530,1,1,0,1562,-4110.28,1719.75,101.749,1.24734,300,5,0,5060,2933,0,1);
DELETE FROM creature WHERE guid = 79454;
INSERT INTO creature VALUES (79454,19825,530,1,1,0,1562,-4123.91,1747.85,105.174,2.10734,300,0,0,5060,2933,0,2);
DELETE FROM creature WHERE guid = 79455;
INSERT INTO creature VALUES (79455,19825,530,1,1,0,1562,-4025.23,1707.71,97.8538,5.76192,300,0,0,5060,2933,0,2);
-- wps
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (70940,70944,79454,79455);
DELETE FROM creature_movement WHERE id IN (70940,70944,79454,79455);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(70944,1,-4149.59,1894.07,73.7036,0,0,0,0,0,0,0,0,0,0,4.14337,0,0),(70944,2,-4154.06,1886.32,81.5854,0,0,0,0,0,0,0,0,0,0,4.17322,0,0),(70944,3,-4161.2,1877.82,92.6445,0,0,0,0,0,0,0,0,0,0,3.77659,0,0),
(70944,4,-4182.94,1868.67,104.512,0,0,0,0,0,0,0,0,0,0,3.52919,0,0),(70944,5,-4197.31,1860.45,111.225,0,0,0,0,0,0,0,0,0,0,3.78052,0,0),(70944,6,-4216.1,1846.58,121.363,0,0,0,0,0,0,0,0,0,0,3.74125,0,0),
(70944,7,-4196.96,1860.69,110.992,0,0,0,0,0,0,0,0,0,0,0.666417,0,0),(70944,8,-4182.67,1868.9,104.363,0,0,0,0,0,0,0,0,0,0,0.540754,0,0),(70944,9,-4160.76,1877.51,92.7854,0,0,0,0,0,0,0,0,0,0,0.683696,0,0),
(70944,10,-4155.26,1883.4,85.1251,0,0,0,0,0,0,0,0,0,0,0.862767,0,0),(70944,11,-4150.88,1890.82,76.1613,0,0,0,0,0,0,0,0,0,0,1.04734,0,0),(70944,12,-4144.91,1906.15,67.2697,0,0,0,0,0,0,0,0,0,0,1.19263,0,0),
(70944,13,-4136.69,1925.79,66.2683,0,0,0,0,0,0,0,0,0,0,1.11331,0,0),(70944,14,-4117.12,1950.28,70.0465,0,0,0,0,0,0,0,0,0,0,0.854913,0,0),(70944,15,-4130.74,1935.95,66.7021,0,0,0,0,0,0,0,0,0,0,4.09704,0,0),
(70944,16,-4139.68,1921.25,66.1188,0,0,0,0,0,0,0,0,0,0,4.21641,0,0),(70944,17,-4146.51,1905.07,68.0866,0,0,0,0,0,0,0,0,0,0,4.46774,0,0),(70940,1,-4147.9,1798.44,114.258,0,0,0,0,0,0,0,0,0,0,5.34696,0,0),
(70940,2,-4136.19,1787.47,112.865,0,0,0,0,0,0,0,0,0,0,5.36031,0,0),(70940,3,-4132.17,1780.85,110.156,0,0,0,0,0,0,0,0,0,0,5.2213,0,0),(70940,4,-4128.39,1774.08,106.055,0,0,0,0,0,0,0,0,0,0,5.2213,0,0),
(70940,5,-4124.29,1768.57,105.306,0,0,0,0,0,0,0,0,0,0,5.37445,0,0),(70940,6,-4128.37,1775.78,106.69,0,0,0,0,0,0,0,0,0,0,2.05221,0,0),(70940,7,-4131.95,1782.54,110.823,0,0,0,0,0,0,0,0,0,0,2.16746,0,0),
(70940,8,-4137.33,1788.7,113.201,0,0,0,0,0,0,0,0,0,0,2.28527,0,0),(70940,9,-4147.75,1798.58,114.211,0,0,0,0,0,0,0,0,0,0,2.82169,0,0),(70940,10,-4164.11,1804.29,115.691,0,0,0,0,0,0,0,0,0,0,2.69673,0,0),
(70940,11,-4174.01,1808.65,113.061,0,0,0,0,0,0,0,0,0,0,2.73992,0,0),(70940,12,-4184.12,1812.61,113.146,0,0,0,0,0,0,0,0,0,0,1.93646,0,0),(70940,13,-4188,1825.85,113.204,0,0,0,0,0,0,0,0,0,0,1.57125,0,0),
(70940,14,-4187.94,1843.33,111.744,0,0,0,0,0,0,0,0,0,0,1.72048,0,0),(70940,15,-4188.09,1824.14,113.524,0,0,0,0,0,0,0,0,0,0,4.86002,0,0),(70940,16,-4184.69,1814.38,112.809,0,0,0,0,0,0,0,0,0,0,5.29434,0,0),
(70940,17,-4178.78,1809.43,113.403,0,0,0,0,0,0,0,0,0,0,5.91009,0,0),(70940,18,-4164.53,1804.48,115.65,0,0,0,0,0,0,0,0,0,0,5.91637,0,0),(79454,1,-4135.71,1764.47,103.776,0,0,0,0,0,0,0,0,0,0,2.32748,0,0),
(79454,2,-4123.19,1748.01,105.316,0,0,0,0,0,0,0,0,0,0,5.66191,0,0),(79454,3,-4106.88,1744.16,103.317,0,0,0,0,0,0,0,0,0,0,6.09388,0,0),(79454,4,-4076.84,1739.89,102.495,0,0,0,0,0,0,0,0,0,0,6.09388,0,0),
(79454,5,-4072.2,1733.48,101.287,0,0,0,0,0,0,0,0,0,0,5.24565,0,0),(79454,6,-4069.85,1715.45,97.2137,0,0,0,0,0,0,0,0,0,0,4.65268,0,0),(79454,7,-4072.55,1734.05,101.439,0,0,0,0,0,0,0,0,0,0,1.99725,0,0),
(79454,8,-4078.09,1740.28,102.628,0,0,0,0,0,0,0,0,0,0,2.93737,0,0),(79454,9,-4089.85,1744.23,102.04,0,0,0,0,0,0,0,0,0,0,3.32718,0,0),(79454,10,-4107.19,1744.03,103.358,0,0,0,0,0,0,0,0,0,0,2.92113,0,0),
(79454,11,-4123.63,1747.82,105.214,0,0,0,0,0,0,0,0,0,0,2.71849,0,0),(79455,1,-4014.3,1700.96,98.5863,0,0,0,0,0,0,0,0,0,0,6.0423,0,0),(79455,2,-4026.22,1708.97,97.6598,0,0,0,0,0,0,0,0,0,0,2.20406,0,0),
(79455,3,-4046.6,1705.95,97.6929,0,0,0,0,0,0,0,0,0,0,3.0146,0,0),(79455,4,-4062.04,1711.81,96.375,0,0,0,0,0,0,0,0,0,0,2.59833,0,0),(79455,5,-4078.86,1722.94,99.4752,0,0,0,0,0,0,0,0,0,0,2.51194,0,0),
(79455,6,-4061.6,1711.57,96.3783,0,0,0,0,0,0,0,0,0,0,5.87344,0,0),(79455,7,-4046.48,1707.68,97.5633,0,0,0,0,0,0,0,0,0,0,6.19421,0,0),(79455,8,-4024.8,1707.13,97.9507,0,0,0,0,0,0,0,0,0,0,5.9099,0,0);
-- Dark Conclave Scorncrow
DELETE FROM creature WHERE guid = 69715;
INSERT INTO creature VALUES (69715,21385,530,1,1,0,534,-4083.26,1761.35,99.3954,4.70844,300,5,0,5233,2991,0,1);
DELETE FROM creature WHERE guid = 69716;
INSERT INTO creature VALUES (69716,21385,530,1,1,0,534,-4009.87,1763.89,96.942,5.66271,300,5,0,5233,2991,0,1);
DELETE FROM creature WHERE guid = 69717;
INSERT INTO creature VALUES (69717,21385,530,1,1,0,534,-4123.21,1786.57,109.1,3.09524,300,1,0,5060,2933,0,1);
UPDATE creature SET spawndist = 1, MovementType = 1 WHERE guid = 74846;
-- Dark Conclave Harbinger
DELETE FROM creature WHERE guid = 69718;
INSERT INTO creature VALUES (69718,21384,530,1,1,0,1571,-4000.23,1733.87,96.6562,3.04418,300,0,0,5233,2991,0,2);
DELETE FROM creature_movement WHERE id = 69718;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(69718,1,-4022.7,1734.59,95.0915,0,0,0,0,0,0,0,0,0,0,3.34342,0,0),(69718,2,-4041.05,1729.84,94.6274,0,0,0,0,0,0,0,0,0,0,3.04418,0,0),(69718,3,-4055.16,1732.13,95.3026,0,0,0,0,0,0,0,0,0,0,2.63578,0,0),
(69718,4,-4061.19,1736.95,96.6475,0,0,0,0,0,0,0,0,0,0,2.33261,0,0),(69718,5,-4068.8,1748.78,98.5375,0,0,0,0,0,0,0,0,0,0,1.87394,0,0),(69718,6,-4070.1,1757.51,98.7897,0,0,0,0,0,0,0,0,0,0,1.6556,0,0),
(69718,7,-4071.61,1775.28,98.9516,0,0,0,0,0,0,0,0,0,0,1.98939,0,0),(69718,8,-4076.04,1781.2,99.1083,0,0,0,0,0,0,0,0,0,0,2.50226,0,0),(69718,9,-4087.18,1785.62,100.23,0,0,0,0,0,0,0,0,0,0,2.9358,0,0),
(69718,10,-4114.94,1790.69,106.056,0,0,0,0,0,0,0,0,0,0,2.6452,0,0),(69718,11,-4139.38,1810.75,110.329,0,0,0,0,0,0,0,0,0,0,2.34153,0,0),(69718,12,-4147.85,1817.54,110.724,0,0,0,0,0,0,0,0,0,0,2.80491,0,0),
(69718,13,-4159.25,1821.31,110.262,0,0,0,0,0,0,0,0,0,0,2.84811,0,0),(69718,14,-4147.58,1817.36,110.717,0,0,0,0,0,0,0,0,0,0,5.75015,0,0),(69718,15,-4138.98,1810.45,110.294,0,0,0,0,0,0,0,0,0,0,5.43555,0,0),
(69718,16,-4114.99,1790.67,106.064,0,0,0,0,0,0,0,0,0,0,5.85574,0,0),(69718,17,-4105.13,1786.53,103.67,0,0,0,0,0,0,0,0,0,0,6.10707,0,0),(69718,18,-4080.7,1783.58,99.4478,0,0,0,0,0,0,0,0,0,0,5.81647,0,0),
(69718,19,-4072.58,1778.1,98.9482,0,0,0,0,0,0,0,0,0,0,5.2392,0,0),(69718,20,-4069.83,1768.67,98.9397,0,0,0,0,0,0,0,0,0,0,4.83865,0,0),(69718,21,-4069.4,1749.9,98.7111,0,0,0,0,0,0,0,0,0,0,5.05463,0,0),
(69718,22,-4062.5,1738.55,96.9955,0,0,0,0,0,0,0,0,0,0,5.39628,0,0),(69718,23,-4054.99,1732.06,95.2769,0,0,0,0,0,0,0,0,0,0,5.84788,0,0),(69718,24,-4041.05,1729.14,94.6369,0,0,0,0,0,0,0,0,0,0,0.169444,0,0),
(69718,25,-4021.52,1734.97,95.2051,0,0,0,0,0,0,0,0,0,0,0.165517,0,0),(69718,26,-4000.26,1733.77,96.6574,0,0,0,0,0,0,0,0,0,0,6.18167,0,0);
-- Skethyl Owl
DELETE FROM creature WHERE guid = 69719;
INSERT INTO creature VALUES (69719,21450,530,1,1,0,479,-3978.01,1748.98,99.7573,5.70198,300,5,0,6542,0,0,1);
DELETE FROM creature WHERE guid = 69720;
INSERT INTO creature VALUES (69720,21450,530,1,1,0,479,-4095.74,1745.74,102.027,3.47915,300,5,0,6542,0,0,1);
DELETE FROM creature WHERE guid = 69721;
INSERT INTO creature VALUES (69721,21450,530,1,1,0,479,-4035.07,1706.72,98.0766,3.82345,300,5,0,6761,0,0,1);
-- Update for [027]
UPDATE creature SET curmana = 2486 WHERE guid = 69714;-- Disrupt Their Reinforcements(q.10208)- H (q.10144)-A
DELETE FROM dbscripts_on_go_template_use WHERE id IN (184289,184290,184414,184415);
INSERT INTO dbscripts_on_go_template_use (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(184289,0,9,0,60,183816,30,7,0,0,0,0,0,0,0,0,'respawn gobject'),
(184290,0,9,0,60,183816,30,7,0,0,0,0,0,0,0,0,'respawn gobject'),
(184414,0,9,0,60,183816,30,7,0,0,0,0,0,0,0,0,'respawn gobject'),
(184415,0,9,0,60,183816,30,7,0,0,0,0,0,0,0,0,'respawn gobject');
 -- Hellfire Fire - req. for (q.) -- sniff
DELETE FROM gameobject WHERE guid BETWEEN 39908 AND 39911;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(39908, 183816, 530, 1,1, -84.5415, 1881.739, 73.82645, 3.35296, 0, 0, 0.984807, 0.1736523, -60, 255, 1), -- Xilus
(39909, 183816, 530, 1,1, 147.0184, 1717.341, 37.46404, -0.9424766, 0, 0, -0.45399, 0.8910068, -60, 255, 1), -- Kruul
(39910, 183816, 530, 1,1, -545.2587, 1781.167, 56.22634, 2.146753, 0, 0, 0.8788166, 0.4771597, -60, 255, 1), -- Kaalez
(39911, 183816, 530, 1,1, -418.627, 1847.49, 80.7808, 1.48097, 0, 0, 0.674647, 0.738141, -60, 255, 1); -- Grimh
-- Gateways in Hellfire Peninsula (sniffs)
-- Gateway Murketh
UPDATE gameobject SET position_x = -144.4861, position_y = 1511.453, position_z = 29.58671, orientation = 3.028119, rotation0 = -0.04258156, rotation1 = -0.05868149, rotation2 = 0.9958963, rotation3 = 0.05416433 WHERE id = 183350; 
-- Gateway Shaadraz 
UPDATE gameobject SET position_x = -303.5573, position_y = 1526.004, position_z = 33.8859, orientation = -2.993238, rotation0 = -0.06276989, rotation1 = 0.0825901, rotation2 = -0.9922237, rotation3 = 0.06878129 WHERE id = 183351; 
-- 'Portal Grimh'
UPDATE gameobject SET position_x = -418.401, position_y = 1848.877, position_z = 78.58884, orientation = 1.53589, rotation0 = 0.07789183, rotation1 = -0.1241655, rotation2 = 0.6839972, rotation3 = 0.7146074 WHERE id = 184414; 
-- 'Portal Kaalez'
UPDATE gameobject SET position_x = -548.9393, position_y = 1783.983, position_z = 56.2879, orientation = 2.652893, rotation0 = 0.1065927, rotation1 = -0.07565403, rotation2 = 0.9605389, rotation3 = 0.245519 WHERE id = 184415;
-- 'Portal Xilus'
UPDATE gameobject SET position_x = -84.78993, position_y = 1881.726, position_z = 72.19016, orientation = 2.54818, rotation0 = 0.101759, rotation1 = 0.005214691, rotation2 = 0.9523001, rotation3 = 0.28765 WHERE id = 184290;
-- 'Portal Kruul'
UPDATE gameobject SET position_x = 147.0052, position_y = 1718.116, position_z = 35.80159, orientation = 3.14126, rotation0 = 0.06085968, rotation1 = -0.07831287, rotation2 = 0.9950571, rotation3 = 0.004954683 WHERE id = 184289;

-- ###########
-- Quest 10286
-- ###########
-- Magister Alegis
DELETE FROM creature_movement WHERE id = 86873;
UPDATE creature_template SET MovementType = 2 WHERE entry = 20159; -- now move him to template (unique npc)
DELETE FROM creature_movement_template WHERE entry = 20159;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(20159,1,-689.583,4167.8,58.5228,1000,0,0,0,0,0,0,0,0,0,5.0053,0,0),(20159,2,-693.036,4187.63,57.0026,0,0,0,0,0,0,0,0,0,0,1.48198,0,0),(20159,3,-686.684,4207.12,56.9095,0,0,0,0,0,0,0,0,0,0,0.657309,0,0),
(20159,4,-673.93,4220,56.0948,0,0,0,0,0,0,0,0,0,0,0,0,0),(20159,5,-624.874,4218.4,50.713,0,0,0,0,0,0,0,0,0,0,0.10753,0,0),(20159,6,-596.977,4224.52,48.6696,0,0,0,0,0,0,0,0,0,0,6.15902,0,0),
(20159,7,-576.122,4218.94,48.58,0,0,0,0,0,0,0,0,0,0,5.54249,0,0),(20159,8,-553.78,4199.66,46.1163,0,0,0,0,0,0,0,0,0,0,4.98093,0,0),(20159,9,-519.57,4119.03,47.3006,0,0,0,0,0,0,0,0,0,0,5.29901,0,0),
(20159,10,-485.123,4058.18,53.734,0,0,0,0,0,0,0,0,0,0,5.08696,0,0),(20159,11,-478.09,3999.92,57.6679,0,0,0,0,0,0,0,0,0,0,4.50577,0,0),(20159,12,-496.692,3932.76,57.9235,0,0,0,0,0,0,0,0,0,0,4.62357,0,0),
(20159,13,-493.247,3891.55,58.318,0,0,0,0,0,0,0,0,0,0,4.98093,0,0),(20159,14,-474.63,3861.86,58.288,0,0,0,0,0,0,0,0,0,0,6.17474,0,0),(20159,15,-450.394,3863.51,59.0796,0,0,0,0,0,0,0,0,0,0,0.484525,0,0),
(20159,16,-349.7,3907.2,69.8351,0,0,0,0,0,0,0,0,0,0,0.614116,0,0),(20159,17,-279.334,3999.36,95.9918,0,0,0,0,0,0,0,0,0,0,0.614116,0,0),(20159,18,-232.732,4117.03,97.6089,0,0,0,0,0,0,0,0,0,0,1.55267,0,0),
(20159,19,-202.878,4449.16,42.317,0,0,0,0,0,0,0,0,0,0,1.55267,0,0),(20159,20,-242.425,4671.69,13.1567,0,0,0,0,0,0,0,0,0,0,1.55267,0,0),(20159,21,-238.807,4959.8,48.0196,0,0,0,0,0,0,0,0,0,0,1.55267,0,0),
(20159,22,-253.257,5040.5,65.242,0,0,0,0,0,0,0,0,0,0,1.29192,0,0),(20159,23,-249.016,5098.27,79.0187,0,0,0,0,0,0,0,0,0,0,1.1639,0,0),(20159,24,-236.775,5118.65,80.6934,0,0,0,0,0,0,0,0,0,0,1.1639,0,0),
(20159,25,-240.258,5160.67,82.8653,0,0,0,0,0,0,0,0,0,0,1.76865,0,0),(20159,26,-264.781,5218.37,71.2915,0,0,0,0,0,0,0,0,0,0,1.76865,0,0),(20159,27,-240.832,5165.19,82.9734,0,0,0,0,0,0,0,0,0,0,4.69425,0,0),
(20159,28,-235.967,5118.04,80.8555,0,0,0,0,0,0,0,0,0,0,4.25443,0,0),(20159,29,-250.706,5090.25,76.6508,0,0,0,0,0,0,0,0,0,0,4.39188,0,0),(20159,30,-237.145,4591.76,21.3237,0,0,0,0,0,0,0,0,0,0,4.49398,0,0),
(20159,31,-205.064,4496.58,32.8833,0,0,0,0,0,0,0,0,0,0,4.81599,0,0),(20159,32,-222.911,4135.43,96.5037,0,0,0,0,0,0,0,0,0,0,4.23479,0,0),(20159,33,-271.347,4011.59,98.3579,0,0,0,0,0,0,0,0,0,0,4.12876,0,0),
(20159,34,-335.207,3913.54,73.2693,0,0,0,0,0,0,0,0,0,0,3.64574,0,0),(20159,35,-463.987,3857.78,57.9562,0,0,0,0,0,0,0,0,0,0,2.99386,0,0),(20159,36,-484.733,3870.49,59.5534,0,0,0,0,0,0,0,0,0,0,2.11029,0,0),
(20159,37,-496.964,3917.13,57.8782,0,0,0,0,0,0,0,0,0,0,1.56837,0,0),(20159,38,-478.162,4003.4,57.2783,0,0,0,0,0,0,0,0,0,0,1.56837,0,0),(20159,39,-481.994,4050.11,54.1059,0,0,0,0,0,0,0,0,0,0,1.91,0,0),
(20159,40,-559.431,4206.77,47.1758,0,0,0,0,0,0,0,0,0,0,2.45586,0,0),(20159,41,-587.111,4223.03,48.9446,0,0,0,0,0,0,0,0,0,0,2.95459,0,0),(20159,42,-625.306,4216.87,50.828,0,0,0,0,0,0,0,0,0,0,2.95459,0,0),
(20159,43,-674.66,4220.79,56.2164,0,0,0,0,0,0,0,0,0,0,3.53186,0,0),(20159,44,-691.373,4198.99,56.9174,0,0,0,0,0,0,0,0,0,0,4.39972,0,0),(20159,45,-689.993,4167.72,58.5173,0,0,0,0,0,0,0,0,0,0,4.76493,0,0);
DELETE FROM dbscripts_on_gossip WHERE id = 8081;
INSERT INTO dbscripts_on_gossip (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(8081,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(8081,3,0,0,0,0,0,0,2000000253,0,0,0,0,0,0,0,''),
(8081,6,22,17,0x02,0,0,0,0,0,0,0,0,0,0,0,'Faction change'),
(8081,8,26,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
UPDATE gossip_menu_option SET action_script_id = 8081 WHERE menu_id = 8081;
DELETE FROM db_script_string WHERE entry = 2000000253;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000253,'If you think I\'ll betray my friend that easily, think again! Face me, you scoundrel!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);
-- Expedition Warden - update
UPDATE creature SET position_z = 130.776 WHERE id = 63550;
-- Expedition Outrider #1 - Wyrmskull Bridge
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 78755;
UPDATE creature_template SET SpeedWalk = 1, SpeedRun = 1.385714 WHERE Entry = 22410;
DELETE FROM creature_movement WHERE id = 78755;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(78755,1,2992.1,5882.41,131.079,1000,2241001,0,0,0,0,0,0,0,0,1.09818,0,0),
(78755,2,3022.49,5951.91,130.761,0,2241002,0,0,0,0,0,0,0,0,1.26805,0,0),
(78755,3,3042.8,6004.7,130.709,0,0,0,0,0,0,0,0,0,0,1.2212,0,0),
(78755,4,3062.56,6051.26,130.475,0,0,0,0,0,0,0,0,0,0,1.16622,0,0),
(78755,5,3074.67,6061.86,130.39,0,0,0,0,0,0,0,0,0,0,6.21947,0,0),
(78755,6,3076.65,6031.49,130.623,0,0,0,0,0,0,0,0,0,0,4.41307,0,0),
(78755,7,3060.06,5987.28,130.928,0,0,0,0,0,0,0,0,0,0,4.34631,0,0),
(78755,8,3041.28,5941.21,130.789,0,0,0,0,0,0,0,0,0,0,4.31882,0,0),
(78755,9,3020.72,5891.7,130.652,0,0,0,0,0,0,0,0,0,0,4.31882,0,0),
(78755,10,2998.73,5842.73,130.338,0,0,0,0,0,0,0,0,0,0,4.19316,0,0),
(78755,11,2982.02,5832.58,130.215,0,0,0,0,0,0,0,0,0,0,3.07946,0,0),
(78755,12,2979.26,5851.3,130.312,0,0,0,0,0,0,0,0,0,0,1.2055,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2241001,2241002);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2241001,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2241002,0,31,17855,30,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive 
(2241002,1,1,3,0,17855,30,7,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_linking WHERE guid = 78754;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(78754, 78755, 515);
-- Expedition Outrider #2 - Wyrmskull Bridge (req. for link)
UPDATE creature SET position_x = 2990.759, position_y = 5880.856, position_z = 131.29181, orientation = 1.16584 WHERE guid = 78754;
-- part of [030]
UPDATE creature SET spawntimesecs = 60 WHERE guid = 86873; -- quest req.-- Expedition Warden #1 
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 63550;
DELETE FROM creature_movement WHERE id = 63550;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(63550,1,3032.1,5959.56,130.687,0,0,0,0,0,0,0,0,0,0,5.95676,0,0),
(63550,2,3032.1,5959.56,130.687,30000,0,0,0,0,0,0,0,0,0,4.37182,0,0),
(63550,3,3022.65,5963.61,130.69,120000,1785503,0,0,0,0,0,0,0,0,2.73633,0,0);
-- Expedition Warden (2-3) (4-5) (6-7) -- chat
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (63548,63545,63551);
DELETE FROM creature_movement WHERE id IN (63548,63545,63551);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(63548,1,3018.66,5962.21,131.69,60000,1785504,0,0,0,0,0,0,0,0,0.907571,0,0),
(63545,1,2948.06,5792.65,133.571,60000,1785504,0,0,0,0,0,0,0,0,6.12611,0,0),
(63551,1,3096.95,6122.23,134.852,60000,1785504,0,0,0,0,0,0,0,0,5.02655,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1785503,1785504);  -- 01,02 already in use
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1785503,5,1,1,0,0,0,0,396,274,0,0,0,0,0,0,'Random emote'),
(1785503,30,1,274,0,0,0,0,396,1,0,0,0,0,0,0,'Random emote'),
(1785503,55,1,1,0,0,0,0,396,274,0,0,0,0,0,0,'Random emote'),
(1785503,89,1,396,0,0,0,0,1,274,0,0,0,0,0,0,'Random emote'),
(1785504,6,1,1,0,0,0,0,396,274,273,0,0,0,0,0,'Random emote'),
(1785504,8,31,17855,15,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(1785504,9,1,396,0,17855,15,7,273,274,1,0,0,0,0,0,''),
(1785504,17,1,274,0,0,0,0,396,273,1,0,0,0,0,0,'Random emote'),
(1785504,19,31,17855,15,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(1785504,20,1,1,0,17855,15,7,273,274,396,0,0,0,0,0,''),
(1785504,29,1,273,0,0,0,0,396,274,1,0,0,0,0,0,'Random emote'),
(1785504,31,31,17855,15,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(1785504,32,1,396,0,17855,15,7,1,274,273,0,0,0,0,0,''),
(1785504,41,1,396,0,0,0,0,273,274,1,0,0,0,0,0,'Random emote'),
(1785504,42,31,17855,15,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(1785504,43,1,273,0,17855,15,7,274,1,396,0,0,0,0,0,''),
(1785504,55,1,396,0,0,0,0,1,274,273,0,0,0,0,0,'Random emote'),
(1785504,57,31,17855,15,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(1785504,58,1,396,0,17855,15,7,1,274,273,0,0,0,0,0,'');


-- Added waypoint movement for Ironforge Guard
-- Backported from ClassicDB [0763]
UPDATE creature SET MovementType = 2, position_x = -4761.37, position_y = -1157.62, position_z = 502.213, orientation = 0.698499 WHERE guid = 1894;
DELETE FROM creature_movement WHERE id = 1894;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(1894, 1, -4761.37, -1157.62, 502.213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.698499, 0, 0),
(1894, 2, -4796.16, -1114.85, 498.806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.28893, 0, 0),
(1894, 3, -4804.42, -1111.48, 498.806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.21825, 0, 0),
(1894, 4, -4815.41, -1081.27, 502.213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.35744, 0, 0),
(1894, 5, -4808.1, -1030.53, 502.208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.20647, 0, 0),
(1894, 6, -4769.45, -1035.99, 502.211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.33076, 0, 0),
(1894, 7, -4749.13, -1054.56, 502.212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.29225, 0, 0),
(1894, 8, -4734.71, -1078.26, 502.211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.40537, 0, 0),
(1894, 9, -4731.6, -1098.64, 502.214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.69142, 0, 0),
(1894, 10, -4737.32, -1137.14, 502.209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.74189, 0, 0);
-- Nether Technician
-- equip (not for all)
UPDATE creature SET equipment_id = 2 WHERE guid IN (71807,71809,71816,71818);-- Instructor Razuvious -- The Ebdon Hold
SET @DB_STRING_ENTRY = 2000000349;
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 129307;
DELETE FROM creature_movement WHERE id = 129307;
UPDATE creature_template SET MovementType = 2, SpeedWalk = 1.8, SpeedRun = 1.714286 WHERE entry = 28357; -- now move him to template (unique npc)
DELETE FROM creature_movement_template WHERE entry = 28357;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,textid1,textid2,textid3,textid4,textid5,emote,spell,wpguid,orientation,model1,model2) VALUES
(28357,1,2481.1,-5560.54,420.493,0,0,0,0,0,0,0,0,0,0,5.58015,0,0),(28357,2,2491.86,-5571.77,420.459,0,0,0,0,0,0,0,0,0,0,5.3508,0,0),(28357,3,2497.91,-5588.32,420.462,0,0,0,0,0,0,0,0,0,0,4.9212,0,0),
(28357,4,2494.03,-5612.09,420.491,0,0,0,0,0,0,0,0,0,0,1.24868,0,0),(28357,5,2498.68,-5591.69,420.494,0,0,0,0,0,0,0,0,0,0,1.78118,0,0),(28357,6,2492.94,-5573.05,420.475,0,0,0,0,0,0,0,0,0,0,2.14717,0,0),
(28357,7,2475.93,-5558.57,420.485,0,0,0,0,0,0,0,0,0,0,2.79199,0,0),(28357,8,2455.66,-5554.78,420.508,0,0,0,0,0,0,0,0,0,0,0.040735,0,0),(28357,9,2472.56,-5558.04,420.453,0,0,0,0,0,0,0,0,0,0,6.06788,0,0),
(28357,10,2481.1,-5560.54,420.493,0,0,0,0,0,0,0,0,0,0,5.58015,0,0),(28357,11,2491.86,-5571.77,420.459,0,0,0,0,0,0,0,0,0,0,5.3508,0,0),(28357,12,2497.91,-5588.32,420.462,0,0,0,0,0,0,0,0,0,0,4.9212,0,0),
(28357,13,2494.03,-5612.09,420.491,0,0,0,0,0,0,0,0,0,0,1.24868,0,0),(28357,14,2498.68,-5591.69,420.494,0,0,0,0,0,0,0,0,0,0,1.78118,0,0),(28357,15,2492.94,-5573.05,420.475,0,0,0,0,0,0,0,0,0,0,2.14717,0,0),
(28357,16,2475.93,-5558.57,420.485,0,0,0,0,0,0,0,0,0,0,2.79199,0,0),(28357,17,2455.66,-5554.78,420.508,0,0,0,0,0,0,0,0,0,0,0.040735,0,0),(28357,18,2472.56,-5558.04,420.453,0,0,0,0,0,0,0,0,0,0,6.06788,0,0),
(28357,19,2481.1,-5560.54,420.493,0,0,0,0,0,0,0,0,0,0,5.58,0,0),(28357,20,2482.32,-5552.39,420.641,70000,2835701,0,0,0,0,0,0,0,0,1.51,0,0),(28357,21,2491.86,-5571.77,420.459,0,0,0,0,0,0,0,0,0,0,5.351,0,0),
(28357,22,2497.91,-5588.32,420.462,0,0,0,0,0,0,0,0,0,0,4.9212,0,0),(28357,23,2494.03,-5612.09,420.491,0,0,0,0,0,0,0,0,0,0,1.24868,0,0),(28357,24,2498.68,-5591.69,420.494,0,0,0,0,0,0,0,0,0,0,1.78118,0,0),
(28357,25,2492.94,-5573.05,420.475,0,0,0,0,0,0,0,0,0,0,2.14717,0,0),(28357,26,2475.93,-5558.57,420.485,0,0,0,0,0,0,0,0,0,0,2.79199,0,0),(28357,27,2455.66,-5554.78,420.508,0,0,0,0,0,0,0,0,0,0,0.040735,0,0),
(28357,28,2472.56,-5558.04,420.453,0,0,0,0,0,0,0,0,0,0,6.06788,0,0),(28357,29,2481.1,-5560.54,420.493,0,0,0,0,0,0,0,0,0,0,5.58015,0,0),(28357,30,2491.86,-5571.77,420.459,0,0,0,0,0,0,0,0,0,0,5.3508,0,0),
(28357,31,2497.91,-5588.32,420.462,0,0,0,0,0,0,0,0,0,0,4.9212,0,0),(28357,32,2494.03,-5612.09,420.491,0,0,0,0,0,0,0,0,0,0,1.24868,0,0),(28357,33,2498.68,-5591.69,420.494,0,0,0,0,0,0,0,0,0,0,1.78118,0,0),
(28357,34,2492.94,-5573.05,420.475,0,0,0,0,0,0,0,0,0,0,2.14717,0,0),(28357,35,2475.93,-5558.57,420.485,0,0,0,0,0,0,0,0,0,0,2.79199,0,0),(28357,36,2455.66,-5554.78,420.508,0,0,0,0,0,0,0,0,0,0,0.040735,0,0),
(28357,37,2472.56,-5558.04,420.453,0,0,0,0,0,0,0,0,0,0,6.06788,0,0),(28357,38,2481.1,-5560.54,420.493,0,0,0,0,0,0,0,0,0,0,5.58015,0,0),(28357,39,2491.86,-5571.77,420.459,0,0,0,0,0,0,0,0,0,0,5.3508,0,0),
(28357,40,2497.91,-5588.32,420.462,0,0,0,0,0,0,0,0,0,0,4.9212,0,0),(28357,41,2494.03,-5612.09,420.491,0,0,0,0,0,0,0,0,0,0,1.24868,0,0),(28357,42,2498.68,-5591.69,420.494,0,0,0,0,0,0,0,0,0,0,1.78118,0,0),
(28357,43,2510.38,-5592.75,420.643,75000,2835702,0,0,0,0,0,0,0,0,6.19,0,0),(28357,44,2492.94,-5573.05,420.475,0,0,0,0,0,0,0,0,0,0,2.147,0,0),(28357,45,2475.93,-5558.57,420.485,0,0,0,0,0,0,0,0,0,0,2.79,0,0),
(28357,46,2455.66,-5554.78,420.508,0,0,0,0,0,0,0,0,0,0,0.040735,0,0),(28357,47,2472.56,-5558.04,420.453,0,0,0,0,0,0,0,0,0,0,6.06788,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2835701,2835702); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2835701,1,0,0,0,0,0,0,@DB_STRING_ENTRY,0,0,0,0,0,0,0,''),
(2835701,2,20,2,0,28383,129391,7 | 0x10,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'),
(2835702,1,0,0,0,0,0,0,@DB_STRING_ENTRY,0,0,0,0,0,0,0,''),
(2835702,2,20,2,0,28383,129390,7 | 0x10,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint');
DELETE FROM db_script_string WHERE entry BETWEEN @DB_STRING_ENTRY AND @DB_STRING_ENTRY+19;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES 
(@DB_STRING_ENTRY,'This one...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,25,NULL),
(@DB_STRING_ENTRY+1,'I hurt... suffering unbearable... end my pain... I beg of you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(@DB_STRING_ENTRY+2,'Who... who are you? Who.. what am I?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(@DB_STRING_ENTRY+3,'I return from the grave to do my master\'s bidding.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(@DB_STRING_ENTRY+4,'Another failure...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(@DB_STRING_ENTRY+5,'This one has awoken too soon. It retains emotion and memory...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(@DB_STRING_ENTRY+6,'The Lich King will be pleased with this initiate.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(@DB_STRING_ENTRY+7,'Useless...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(@DB_STRING_ENTRY+8,'You have been measured and found wanting...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,25,NULL),
(@DB_STRING_ENTRY+9,'Place upon it the trappings befitting a herald of Arthas.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(@DB_STRING_ENTRY+10,'Dispose of it...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(@DB_STRING_ENTRY+11,'Yes, instructor.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(@DB_STRING_ENTRY+12,'Right away, instructor.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(@DB_STRING_ENTRY+13,'Rise, minions. Rise and feast upon the weak!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,22,NULL),
(@DB_STRING_ENTRY+14,'Stand and be measured! Rise, for your master awaits your arrival. Go now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(@DB_STRING_ENTRY+15,'Listen, death knight... Listen for the voice of your master. He calls to you now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(@DB_STRING_ENTRY+16,'Victory to the Scourge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,66,NULL),
(@DB_STRING_ENTRY+17,'Death to all that oppose us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,66,NULL),
(@DB_STRING_ENTRY+18,'I have awoken to a nightmare?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(@DB_STRING_ENTRY+19,'Pathetic...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL);
-- Acherus Necromancer #1 -- First EVENT
UPDATE creature SET MovementType = 0, spawndist = 0 WHERE guid = 129391;
DELETE FROM creature_movement WHERE id = 129391;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129391,1,2477.37,-5551,420.647,300000,2838301,0,0,0,0,0,0,0,0,0.746414,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2838301; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2838301,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Acherus Necromancer - active'),
(2838301,3,15,51516,0,28391,10,1,0,0,0,0,0,0,0,0,''),
(2838301,7,15,51517,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838301,8,14,29266,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838301,10,22,1770,0x01 | 0x80,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(2838301,11,3,0,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,4.16204,''),
(2838301,11,28,8,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(2838301,15,0,0,0,28391,129440,7 | 0x10,@DB_STRING_ENTRY+3,0,0,0,0,0,0,0,''),
(2838301,20,0,0,0,28357,10,7,@DB_STRING_ENTRY+6,0,0,0,0,0,0,0,''),
(2838301,25,3,0,0,28357,10,7,0,0,0,0,0,0,0,2.78367,''),
(2838301,28,0,0,0,28357,10,7,@DB_STRING_ENTRY+9,0,0,0,0,0,0,0,''),
(2838301,31,3,0,0,28357,10,7,0,0,0,0,0,0,0,1.50472,''),
(2838301,31,0,0,0,0,0,0,@DB_STRING_ENTRY+11,@DB_STRING_ENTRY+12,0,0,0,0,0,0,''),
(2838301,35,3,0,0,0,0,0,0,0,0,0,2482.23,-5546.44,420.644,0.761266,''),
(2838301,39,1,133,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2838301,44,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2838301,44,15,51537,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838301,46,15,51519,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838301,48,28,0,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,'STATE_STAND'),
(2838301,50,3,0,0,0,0,0,0,0,0,0,2477.37,-5551,420.647,0.77,''),
(2838301,54,3,0,0,0,0,0,0,0,0,0,0,0,0,0.746414,''),
(2838301,55,0,0,0,28357,10,7,@DB_STRING_ENTRY+14,@DB_STRING_ENTRY+15,0,0,0,0,0,0,''),
(2838301,60,0,0,0,28391,129440,7 | 0x10,@DB_STRING_ENTRY+16,@DB_STRING_ENTRY+17,0,0,0,0,0,0,''),
(2838301,61,21,1,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,'Death Knight Initiate - active'),
(2838301,61,25,1,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,'RUN ON'),
(2838301,62,20,2,0,28391,129440,7 | 0x10,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'),
(2838301,63,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(2838301,65,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Acherus Necromancer - unactive');
-- Death Knight Initiate #1 -- part of EVENT 1
UPDATE creature SET modelid = 25361, MovementType = 0, spawndist = 0 WHERE guid = 129440; -- movementType will be set by SCRIPT
DELETE FROM creature_movement WHERE id = 129440;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129440,1,2453.87,-5545.37,420.643,0,0,0,0,0,0,0,0,0,0,3.84632,0,0),
(129440,2,2423.38,-5574.52,420.631,0,0,0,0,0,0,0,0,0,0,4.3346,0,0),
(129440,3,2423.38,-5610.59,420.6,0,0,0,0,0,0,0,0,0,0,4.31103,0,0),
(129440,4,2410.19,-5626.02,420.654,0,0,0,0,0,0,0,0,0,0,3.70549,0,0),
(129440,5,2381.18,-5637.17,420.858,0,0,0,0,0,0,0,0,0,0,3.73062,0,0),
(129440,6,2372.68,-5645.34,426.017,0,0,0,0,0,0,0,0,0,0,3.99137,0,0),
(129440,7,2348.248,-5666.514,426.029,11000,2839101,0,0,0,0,0,0,0,0,4.10762,0,0),
(129440,8,2373.07,-5652.69,426.126,0,0,0,0,0,0,0,0,0,0,0.618087,0,0), -- jump missing
(129440,9,2382.63,-5645.56,421.512,3000,2839102,0,0,0,0,0,0,0,0,0.402889,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2839101,2839102); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2839101,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2839101,9,1,2,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2839102,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(2839102,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(2839102,1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Death Knight Initiate- unactive'),
(2839102,2,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn');
-- Acherus Necromancer #2  -- 2nd EVENT
UPDATE creature SET MovementType = 0, spawndist = 0 WHERE guid = 129390;
DELETE FROM creature_movement WHERE id = 129390;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129390,1,2511.04,-5590.1,420.646,300000,2838302,0,0,0,0,0,0,0,0,6.03884,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2838302; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2838302,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Acherus Necromancer - active'),
(2838302,3,15,51516,0,28394,129459,1,0,0,0,0,0,0,0,0,''),
(2838302,7,15,51517,0,28394,129459,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,8,14,29266,0,28394,129459,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,10,22,1770,0x01 | 0x80,28394,129459,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(2838302,11,3,0,0,28394,129459,7 | 0x10,0,0,0,0,0,0,0,3.07005,''),
(2838302,11,28,8,0,28394,129459,7 | 0x10,0,0,0,0,0,0,0,0,'STATE_KNEEL'),
(2838302,15,0,0,0,28394,129459,7 | 0x10,@DB_STRING_ENTRY+2,@DB_STRING_ENTRY+1,@DB_STRING_ENTRY+18,0,0,0,0,0,''),
(2838302,20,0,0,0,28357,20,7,@DB_STRING_ENTRY+4,@DB_STRING_ENTRY+7,@DB_STRING_ENTRY+5,@DB_STRING_ENTRY+19,0,0,0,0,''),
(2838302,26,0,0,0,28357,20,7,@DB_STRING_ENTRY+8,0,0,0,0,0,0,0,''),
(2838302,31,3,0,0,28357,20,7,0,0,0,0,0,0,0,1.26755,''),
(2838302,35,0,0,0,28357,20,7,@DB_STRING_ENTRY+10,0,0,0,0,0,0,0,''),
(2838302,41,3,0,0,28357,20,7,0,0,0,0,0,0,0,6.19669,''),
(2838302,41,0,0,0,0,0,0,@DB_STRING_ENTRY+11,@DB_STRING_ENTRY+12,0,0,0,0,0,0,''),
(2838302,46,0,0,0,0,0,0,@DB_STRING_ENTRY+13,0,0,0,0,0,0,0,''),
(2838302,50,15,26047,0,28405,129480,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,50,15,26047,0,28405,129481,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,50,15,26047,0,28405,129482,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,52,1,0,0,28405,129480,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,52,1,0,0,28405,129481,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,52,1,0,0,28405,129482,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,53,22,2093,0x01 | 0x80,28405,129480,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(2838302,53,22,2093,0x01 | 0x80,28405,129481,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(2838302,53,22,2093,0x01 | 0x80,28405,129482,7 | 0x10,0,0,0,0,0,0,0,0,'temp faction'),
(2838302,53,20,2,0,28394,129459,7 | 0x10,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'),
(2838302,67,1,374,0,28405,129480,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,67,1,374,0,28405,129481,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,67,1,374,0,28405,129482,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,69,18,0,0,28405,129480,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,69,18,0,0,28405,129481,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,69,18,0,0,28405,129482,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2838302,72,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(2838302,73,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Acherus Necromancer - unactive');
-- Death Knight Initiate -- update
UPDATE creature SET deathState = 0 WHERE id  = 28394;
UPDATE creature SET spawntimesecs = 20 WHERE id IN (28390,28391,28392,28393,28394);
UPDATE creature_template SET UnitFlags = 0x2000000 + 0x8000 WHERE entry = 28394;
UPDATE creature_template SET UnitFlags = 33587200 WHERE entry = 28391;
DELETE FROM creature_addon WHERE guid = 129459;
DELETE FROM creature_template_addon WHERE entry = 28394;
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES
(28394,0,0,1,1,0,0,29266);
DELETE FROM creature_movement WHERE id = 129459;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129459,1,2516.23,-5593.2,420.647,100000,2839401,0,0,0,0,0,0,0,0,3.07005,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2839401; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2839401,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(2839401,1,26,0,0,28405,129480,0 | 0x10,0,0,0,0,0,0,0,0,''),
(2839401,1,26,0,0,28405,129481,0 | 0x10,0,0,0,0,0,0,0,0,''),
(2839401,1,26,0,0,28405,129482,0 | 0x10,0,0,0,0,0,0,0,0,'');
-- Acherus Ghoul  -- update
UPDATE creature SET spawntimesecs = 20 WHERE id = 28405;
UPDATE creature_template SET UnitFlags = 33587200 WHERE entry = 28405; -- correct
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (129480,129481,129482);
DELETE FROM creature_movement WHERE id IN (129480,129481,129482);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129480,1,2520.44,-5593.01,420.727,10000,2840501,0,0,0,0,0,0,0,0,3.4383,0,0),
(129481,1,2516.65,-5596.68,420.727,10000,2840501,0,0,0,0,0,0,0,0,1.39626,0,0),
(129482,1,2515.93,-5589.89,420.727,10000,2840501,0,0,0,0,0,0,0,0,4.92183,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2840501; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2840501,0,1,373,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2840501,1,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'wp pause');
-- spell should have target
DELETE FROM spell_script_target WHERE entry = 51516;
INSERT INTO spell_script_target (entry,TYPE,targetEntry) VALUES
(51516,1,28390),
(51516,1,28391),
(51516,1,28392),
(51516,1,28393),
(51516,1,28394);
-- Duplicates removed
DELETE FROM creature WHERE guid IN (129452,129446,129458,129435);
DELETE FROM creature_addon WHERE guid IN (129452,129446,129458,129435);
DELETE FROM creature_movement WHERE id IN (129452,129446,129458,129435);
DELETE FROM game_event_creature WHERE guid IN (129452,129446,129458,129435);
DELETE FROM game_event_creature_data WHERE guid IN (129452,129446,129458,129435);
DELETE FROM creature_battleground WHERE guid IN (129452,129446,129458,129435);
DELETE FROM creature_linking WHERE guid IN (129452,129446,129458,129435) OR master_guid IN (129452,129446,129458,129435);-- Backported from ClasicDB

-- waypoints
-- Susan Tillinghas
UPDATE `creature` SET `position_x`='1390.215', `position_y`='35.21756', `position_z`='-62.19329', `orientation`='2.079669', `MovementType`='2' WHERE `id`= 2802;
DELETE FROM `creature_movement` WHERE `id`= 38101;
DELETE FROM `creature_movement_template` WHERE `entry`= 2802;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(2802, '01', '1378.640', '55.96495', '-62.27666', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '02', '1383.241', '83.34830', '-62.27637', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '03', '1399.806', '97.16917', '-62.28856', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '04', '1417.964', '141.0208', '-62.29459', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '05', '1433.981', '149.9107', '-62.28405', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '06', '1447.694', '137.1492', '-62.29281', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '07', '1461.869', '120.9715', '-60.18844', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '08', '1464.949', '111.2182', '-60.18949', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '09', '1479.520', '98.09299', '-60.19012', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '10', '1484.867', '94.61426', '-62.24970', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '11', '1500.437', '81.32889', '-62.29831', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '12', '1481.725', '47.70671', '-62.29490', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '13', '1442.540', '36.23264', '-62.27830', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '14', '1416.399', '21.24002', '-62.27507', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '15', '1405.658', '23.78299', '-62.27616', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(2802, '16', '1387.197', '36.69661', '-62.27608', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
-- Hepzibah Sedgewick
UPDATE `creature` SET `position_x`='1533.843', `position_y`='202.2378', `position_z`='-62.18006', `orientation`='5.400798', `MovementType`='2' WHERE `id`= 5747;
DELETE FROM `creature_movement` WHERE `id`= 38100;
DELETE FROM `creature_movement_template` WHERE `entry`= 5747;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(5747, '01', '1542.791', '191.3619', '-62.18080', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '02', '1559.787', '178.5941', '-62.18031', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '03', '1577.523', '172.1603', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '04', '1587.420', '169.3764', '-62.17775', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '05', '1594.174', '161.3339', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '06', '1594.491', '131.5768', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '07', '1592.605', '113.0221', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '08', '1582.281', '104.4307', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '09', '1563.744', '107.6496', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '10', '1547.055', '113.0844', '-62.14216', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '11', '1537.052', '122.4526', '-61.50877', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '12', '1532.863', '139.5267', '-62.17167', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '13', '1521.765', '154.1877', '-62.16089', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '14', '1509.385', '165.7573', '-62.14750', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '15', '1501.144', '174.2727', '-62.16182', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '16', '1488.744', '180.8999', '-62.17804', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '17', '1474.736', '188.0014', '-62.18966', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '18', '1465.005', '201.3092', '-62.17617', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '19', '1462.536', '211.2530', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '20', '1461.918', '229.9350', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '21', '1474.278', '240.6842', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '22', '1514.806', '238.4358', '-62.17767', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '23', '1525.648', '233.3281', '-62.17818', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '24', '1526.560', '219.5792', '-62.17558', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
(5747, '25', '1531.405', '205.2021', '-62.17986', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
-- Waypoints
-- Gava'xi
UPDATE creature SET MovementType = 2, spawndist = 0, position_x = -2589.136230, position_y = 8002.366211, position_z = -51.544746, orientation = 6.202310 WHERE guid = 86608;
DELETE FROM creature_movement WHERE id = 86608;
UPDATE creature_template SET MovementType = 2 WHERE entry = 18298;
DELETE FROM creature_movement_template WHERE entry = 18298;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(18298,1,-2589.136230,8002.366211,-51.544746,2000,0,0,0,0,0,0,0,0,0,6.20,0,0),
(18298,2,-2610.8,7967.75,-50.8763,0,0,0,0,0,0,0,0,0,0,4.44459,0,0),
(18298,3,-2627.87,7928.58,-52.769,0,0,0,0,0,0,0,0,0,0,4.44537,0,0),
(18298,4,-2634.57,7904.54,-52.3424,0,0,0,0,0,0,0,0,0,0,4.30337,0,0),
(18298,5,-2654.97,7886.68,-49.4946,0,0,0,0,0,0,0,0,0,0,3.82428,0,0),
(18298,6,-2680.16,7873.41,-45.0046,0,0,0,0,0,0,0,0,0,0,3.45122,0,0),
(18298,7,-2699.47,7873.76,-44.3478,0,0,0,0,0,0,0,0,0,0,2.99961,0,0),
(18298,8,-2707.71,7877.92,-43.6352,0,0,0,0,0,0,0,0,0,0,2.44591,0,0),
(18298,9,-2710.89,7887.83,-41.7327,0,0,0,0,0,0,0,0,0,0,1.43667,0,0),
(18298,10,-2705.75,7898.3,-39.8618,0,0,0,0,0,0,0,0,0,0,0.973284,0,0),
(18298,11,-2686.2,7913.81,-33.1254,0,0,0,0,0,0,0,0,0,0,0.686614,0,0),
(18298,12,-2673.78,7928.45,-27.9666,0,0,0,0,0,0,0,0,0,0,1.04397,0,0),
(18298,13,-2667.95,7940.04,-23.1435,0,0,0,0,0,0,0,0,0,0,1.17356,0,0),
(18298,14,-2665.32,7953.93,-18.9239,30000,1829801,0,0,0,0,0,0,0,0,1.39347,0,0),
(18298,15,-2669.96,7936,-25.2282,0,0,0,0,0,0,0,0,0,0,4.2641,0,0),
(18298,16,-2683.54,7916.2,-32.0025,0,0,0,0,0,0,0,0,0,0,3.96173,0,0),
(18298,17,-2713.41,7891.17,-41.4143,0,0,0,0,0,0,0,0,0,0,3.38367,0,0),
(18298,18,-2726.82,7891.56,-41.4211,0,0,0,0,0,0,0,0,0,0,2.78677,0,0),
(18298,19,-2736.02,7907.62,-41.745,0,0,0,0,0,0,0,0,0,0,1.63459,0,0),
(18298,20,-2733.7,7930.83,-40.224,0,0,0,0,0,0,0,0,0,0,1.20419,0,0),
(18298,21,-2720.23,7957.16,-42.3013,0,0,0,0,0,0,0,0,0,0,0.909668,0,0),
(18298,22,-2695.55,7974.55,-45.8718,0,0,0,0,0,0,0,0,0,0,0.423506,0,0),
(18298,23,-2664.2,7984.73,-47.5107,0,0,0,0,0,0,0,0,0,0,0.231627,0,0),
(18298,24,-2628.98,7998.33,-49.0176,0,0,0,0,0,0,0,0,0,0,0.34551,0,0),
(18298,25,-2588.29,8002.47,-51.696,15000,1829802,0,0,0,0,0,0,0,0,6.26349,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1829801, 1829802); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1829801,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(1829802,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(1829802,1,20,1,5,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 1:random'),
(1829802,15,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint');
-- Vir'aani Arcanist -- spawn update
UPDATE creature SET position_x = -2585.202637, position_y = 8010.064941, position_z = -51.298, orientation = 6.08, spawndist = 5 WHERE guid = 60282;
-- Vir'aani Raider -- spawn update
UPDATE creature SET position_x = -2580.087158, position_y = 7975.53369, position_z = -53.674, orientation = 5.991354, spawndist = 5 WHERE guid = 60256;-- Source of the Corruption (q.9387)
DELETE FROM dbscripts_on_quest_end WHERE id = 9387;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(9387,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Apothecary Azethen - active'),
(9387,1,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(9387,5,0,0,0,0,0,0,2000000254,0,0,0,0,0,0,0,''),
(9387,9,0,0,0,0,0,0,2000000255,0,0,0,0,0,0,0,''),
(9387,12,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(9387,13,1,11,0,0,0,0,0,0,0,0,0,0,0,0,''),
(9387,17,0,0,0,0,0,0,2000000256,0,0,0,0,0,0,0,''),
(9387,21,0,0,0,16795,20,7,2000000257,0,0,0,0,0,0,0,''),
(9387,23,1,7,0,16795,20,7,0,0,0,0,0,0,0,0,''),
(9387,26,15,5,0,16795,20,7,0,0,0,0,0,0,0,0,''),
(9387,30,0,0,0,0,0,0,2000000258,0,0,0,0,0,0,0,''),
(9387,31,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Apothecary Azethen - unactive');
UPDATE quest_template SET CompleteScript = 9387 WHERE entry = 9387;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000254 AND 2000000258;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000254,'...a potent concoction!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000255,'But where could I ever find a suitable test subject?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,6,NULL),
(2000000256,'Drink this, you blue brute! Disobey me and I promise you a slow, painful death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,25,NULL),
(2000000257,'I pity you Forsaken, Your soul is devoid of light.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,35,0,NULL),
(2000000258,'Hmmm... looks like I\'m going to need a new test subject.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL);
-- Draenei Prisoner -- q. req.
UPDATE creature SET spawntimesecs = 15 WHERE guid = 57798;-- Test of Lore (q.6628) -- missing text added
DELETE FROM dbscripts_on_gossip WHERE id = 476402 AND delay = 1;
INSERT INTO dbscripts_on_gossip (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(476402,1,0,0,0,0,0,0,2000000259,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry = 2000000259;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000259,'You have done well, $N. Continue your search for knowledge, and remember the history you have learned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL);

-- quest 10351 'Natural Remedies'
DELETE FROM dbscripts_on_event WHERE id = 13256;
INSERT INTO dbscripts_on_event (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES 
(13256,0,21,1,0,20781,73426,0x10,0,0,0,0,0,0,0,0,'20781 - active'),
(13256,2,20,2,0,20617,72890,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72894,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72885,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72888,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72892,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72889,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72887,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72895,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72896,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,2,20,2,0,20617,72886,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 2:waypoint'),
(13256,8,10,21504,44000,0,0,0,0,0,0,0,129.1348,4834.785,76.19424,0.06981317,'spawn - Pathaleon the Calculator\'s Image'),
(13256,100,18,0,0,20617,72891,7 | 0x10,0,0,0,0,0,0,0,0,''),
(13256,101,18,0,0,20617,72893,7 | 0x10,0,0,0,0,0,0,0,0,''),
(13256,102,20,0,0,20617,72890,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72894,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72885,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72888,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72892,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72889,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72887,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72895,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72896,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,102,20,0,0,20617,72886,7 | 0x10,0,0,0,0,0,0,0,0,'movement changed to 0:idle'),
(13256,105,21,0,0,20781,73426,0x10,0,0,0,0,0,0,0,0,'20781 - unactive');
-- Red Crystal Trigger
UPDATE creature_template SET InhabitType = 4 WHERE entry = 20617;
UPDATE creature SET spawntimesecs = 5 WHERE id = 20617; -- q. req.
-- waypoints -- they will be activated during event
DELETE FROM creature_movement WHERE id IN (72885,72886,72887,72888,72889,72890,72892,72894,72895,72896);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(72885,1,68.9566,4780.13,80.87505,3000,2061701,0,0,0,0,0,0,0,0,2.46091,0,0),
(72886,1,74.08681,4829.924,81.73363,3000,2061701,0,0,0,0,0,0,0,0,5.65487,0,0),
(72887,1,55.99306,4800.013,81.18014,3000,2061701,0,0,0,0,0,0,0,0,6.21337,0,0),
(72888,1,91.92361,4828.726,82.48882,3000,2061701,0,0,0,0,0,0,0,0,5.044,0,0),
(72889,1,105.2986,4823.434,83.29948,3000,2061701,0,0,0,0,0,0,0,0,1.98968,0,0),
(72890,1,113.6053,4812.225,83.72208,3000,2061701,0,0,0,0,0,0,0,0,5.88176,0,0),
(72892,1,113.9206,4793.067,83.29414,3000,2061701,0,0,0,0,0,0,0,0,3.63029,0,0),
(72894,1,100.5938,4776.241,81.56815,3000,2061701,0,0,0,0,0,0,0,0,1.55334,0,0),
(72895,1,68.9566,4780.13,80.87505,3000,2061701,0,0,0,0,0,0,0,0,4.4855,0,0),
(72896,1,84.66146,4771.719,81.1701,3000,2061701,0,0,0,0,0,0,0,0,6.0912,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2061701; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2061701,1,15,35487,0,0,0,0,0,0,0,0,0,0,0,0,'');
-- Pathaleon the Calculator's Image
UPDATE creature_template SET MovementType = 2 WHERE entry = 21504;
DELETE FROM creature_movement_template WHERE entry = 21504;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(21504,1,129.1348,4834.785,76.19424,50000,2150401,0,0,0,0,0,0,0,0,0.06981317,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2150401;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2150401,0,15,34427,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2150401,1,15,35468,0,20617,72893,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2150401,3,15,33900,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2150401,4,0,0,0,0,0,0,2000000369,0,0,0,0,0,0,0,''),
(2150401,10,15,35471,0,20617,72891,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2150401,13,0,0,0,0,0,0,2000000370,0,0,0,0,0,0,0,''),
(2150401,22,0,0,0,0,0,0,2000000371,0,0,0,0,0,0,0,''),
(2150401,23,15,23017,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2150401,27,14,23017,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2150401,39,0,0,0,0,0,0,2000000372,0,0,0,0,0,0,0,''),
(2150401,41,10,19305,600000,0,0,0,0,0,0,0,108.7072,4839.411,78.57397,6.064728,'spawn - Goliathon <King of the Colossi>'),
(2150401,42,15,34427,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000369 AND 2000000372;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES 
(2000000369,'And just what do you think you are doing?  You dare to interfere with my master\'s experiment?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,25,NULL),
(2000000370,'Do you like what we\'ve done here?  Perhaps we will drop these crystals from the sky all over Outland.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,6,NULL),
(2000000371,'I grow bored with your attempt to heal the land and quell the energies summoning and driving the colossi mad.  Goliathon, King of the Colossi, Prince Kael\'thas and I demand that you defend the crystal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000372,'We will meet again soon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL);
-- Goliathon <King of the Colossi>
UPDATE creature_template SET MovementType = 2 WHERE entry = 19305;
DELETE FROM creature_movement_template WHERE entry = 19305;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(19305,1,108.7072,4839.411,78.57397,2000,1930501,0,0,0,0,0,0,0,0,6.064728,0,0),
(19305,2,134.45,4835.4,76.7612,600000,0,0,0,0,0,0,0,0,0,3.52038,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1930501; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1930501,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON');-- Honor the Fallen (q.10258)
DELETE FROM dbscripts_on_quest_end WHERE id = 10258;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(10258,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Commander Hogarth - active'),
(10258,1,10,20117,15000,0,0,0,0,0,0,0,-1186.952,2608.809,27.702,5.385233,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1192.142,2602.695,29.26251,0.08202434,''),
(10258,1,10,20117,15000,0,0,0,0,0,0,0,-1181.955,2611.131,27.30041,4.615656,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1183.653,2603.656,29.49267,6.092192,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1176.263,2604.513,29.68511,3.302124,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1184.48,2609.259,27.71925,5.011032,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1175.393,2607.397,28.85298,3.634733,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1178.365,2609.962,27.88143,4.123753,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1182.51,2608.35,28.12008,4.673831,''), 
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1189.117,2601.882,29.69882,0.2426594,''), 
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1179.461,2606.029,29.02162,3.810308,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1180.596,2598.148,35.23167,1.946922,''),
(10258,1,10,20117,15000,0,0,0,0,0,0,0,-1190.869,2607.063,27.9991,5.868977,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1179.811,2603.427,29.80272,3.126373,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1184.467,2606.898,28.44422,5.188805,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1186.627,2605.579,28.7169,5.790787,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1189.033,2604.599,28.8694,6.106967,''),
(10258,1,10,19863,15000,0,0,0,0,0,0,0,-1185.68,2603.391,29.44758,5.188805,''),
(10258,1,10,19863,20000,0,0,0,0,0,0,0,-1181.975,2605.763,28.94763,4.406826,''),
(10258,17,28,0,0,19863,20,7,0,0,0,0,0,0,0,0,''),
(10258,18,1,3,0,19863,20,7,0,0,0,0,0,0,0,0,''),
(10258,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Commander Hogarth - unactive');
UPDATE quest_template SET CompleteScript = 10258 WHERE entry = 10258;
-- Commander Hogarth
UPDATE creature SET modelid = 16502 WHERE guid = 71031;
-- Vengeful Unyielding Knight
UPDATE creature_template SET EquipmentTemplateId = 326, movementType = 0 WHERE entry = 20117;
DELETE FROM creature_template_addon WHERE entry = 20117;
INSERT INTO creature_template_addon VALUES (20117,0,0,1,0,0,0,33900);
-- Vengeful Unyielding 
UPDATE creature_template SET EquipmentTemplateId = 249, movementType = 0 WHERE entry = 19863;
DELETE FROM creature_template_addon WHERE entry = 19863;
INSERT INTO creature_template_addon VALUES (19863,0,8,1,0,0,0,33900);-- Trek to Ashenvale (q.990)
-- 'Sentinel Selarin' should appear after compl. q.994 or q.995
DELETE FROM dbscripts_on_quest_end WHERE id IN (994,995);
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(994,0,31,3694,15,0,0,0x08,0,0,0,0,0,0,0,0,''), -- check if creature is alive (prevent double spawn)
(994,1,10,3694,650000,0,0,0,0,0,0,0,6339.14,341.764,24.3387,0.498114,'spawn Sentinel Selarin'),
(995,0,31,3694,15,0,0,0x08,0,0,0,0,0,0,0,0,''), -- check if creature is alive (prevent double spawn)
(995,1,10,3694,650000,0,0,0,0,0,0,0,6339.14,341.764,24.3387,0.498114,'spawn Sentinel Selarin');
UPDATE quest_template SET CompleteScript = 994 WHERE entry = 994;
UPDATE quest_template SET CompleteScript = 995 WHERE entry = 995;
-- Sentinel Selarin
UPDATE creature_template SET FactionAlliance = 80, FactionHorde = 80, SpeedWalk = 1, MovementType = 2 WHERE entry = 3694;
DELETE FROM creature_template_addon WHERE entry = 3694;
INSERT INTO creature_template_addon VALUES (3694,0,0,1,1,0,0,NULL);
DELETE FROM creature_movement_template WHERE entry = 3694;
INSERT INTO creature_movement_template VALUES
(3694,1,6339.14,341.764,24.3387,1000,369401,0,0,0,0,0,0,0,0,0.498114,0,0),
(3694,2,6353.39,354.557,22.3779,0,0,0,0,0,0,0,0,0,0,0.768994,0,0),
(3694,3,6368.99,357.894,21.5712,0,0,0,0,0,0,0,0,0,0,0.171388,0,0),
(3694,4,6387.81,359.455,18.9899,0,0,0,0,0,0,0,0,0,0,0.328468,0,0),
(3694,5,6398.12,363.588,17.366,0,0,0,0,0,0,0,0,0,0,0.505183,0,0),
(3694,6,6403.68,370.92,15.6815,0,0,0,0,0,0,0,0,0,0,0.983488,0,0),
(3694,7,6416.57,392.998,12.0215,0,0,0,0,0,0,0,0,0,0,0.944219,0,0),
(3694,8,6424.95,399.193,10.9586,0,0,0,0,0,0,0,0,0,0,0.0292295,0,0),
(3694,9,6428.93,396.971,11.1736,0,0,0,0,0,0,0,0,0,0,5.0974,0,0),
(3694,10,6432,388.708,13.7662,0,0,0,0,0,0,0,0,0,0,5.02044,0,0),
(3694,11,6436.71,375.264,13.9403,0,0,0,0,0,0,0,0,0,0,4.74006,0,0),
(3694,12,6434.92,367.203,13.9403,600000,369402,0,0,0,0,0,0,0,0,4.6089,0,0), 
(3694,13,6436.9,374.833,13.9403,0,0,0,0,0,0,0,0,0,0,1.85765,0,0),
(3694,14,6431.63,389.723,13.5875,0,0,0,0,0,0,0,0,0,0,1.96918,0,0),
(3694,15,6428.84,397.45,11.0941,0,0,0,0,0,0,0,0,0,0,2.58414,0,0),
(3694,16,6424,400.084,10.9784,0,0,0,0,0,0,0,0,0,0,3.33734,0,0),
(3694,17,6413.76,392.804,12.2825,0,0,0,0,0,0,0,0,0,0,4.12981,0,0),
(3694,18,6401.4,368.195,16.4249,0,0,0,0,0,0,0,0,0,0,3.85806,0,0),
(3694,19,6393.69,360.887,18.1549,0,0,0,0,0,0,0,0,0,0,3.44736,0,0),
(3694,20,6377.21,357.731,20.6589,0,0,0,0,0,0,0,0,0,0,3.04995,0,0),
(3694,21,6358.35,357.353,22.2106,0,0,0,0,0,0,0,0,0,0,3.50941,0,0),
(3694,22,6348.45,352.662,22.6056,0,0,0,0,0,0,0,0,0,0,4.03249,0,0),
(3694,23,6322.42,326.649,25.3338,2000,369403,0,0,0,0,0,0,0,0,3.91389,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 369401 AND 369403; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(369401,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Sentinel Selarin active'),
(369401,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(369402,3,0,0,0,0,0,0,2000000260,0,0,0,0,0,0,0,''),
(369402,7,31,3693,30,0,0,0,0,0,0,0,0,0,0,0,''),
(369402,8,0,0,0,3693,30,7,2000000395,0,0,0,0,0,0,0,''),
(369402,13,0,0,0,0,0,0,2000000396,0,0,0,0,0,0,0,''),
(369402,18,0,0,0,0,0,0,2000000397,0,0,0,0,0,0,0,''),
(369403,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Sentinel Selarin unactive'),
(369403,2,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'desp');
DELETE FROM db_script_string WHERE entry IN (2000000260,2000000395,2000000396,2000000397);
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000260,'Terenthis, Raene sent me to find you. The Sentinels are in need of help in Ashenvale.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000395,'Hello, Selarin. I\'m afraid I cannot help you at the moment, but perhaps some of the adventurers here in Auberdine can...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000396,'Thank you, Terenthis. I shall remain here for as long as I can.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000397,'Hopefully I can send a worthy few to help Ashenvale and the Sentinels.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL);
-- quest must be available for both options 
UPDATE quest_template SET PrevQuestid = 0 WHERE entry = 990;
UPDATE quest_template SET NextQuestid = 990 WHERE entry IN (994,995);
-- Raene Wolfrunner - gossip
UPDATE creature_template SET GossipMenuId = 5502 WHERE entry = 3691;
DELETE FROM gossip_menu WHERE entry = 5502; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(5502,6553,0,0),
(5502,6555,0,975);
DELETE FROM conditions WHERE condition_entry = 975;
INSERT INTO conditions (condition_entry, TYPE, value1, value2) VALUES
(975,8,1029,0);








-- quest 12027
DELETE FROM spell_script_target WHERE entry IN (47184);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(47184,1,26590,0);
DELETE FROM creature_linking_template WHERE entry IN (26589);
INSERT INTO creature_linking_template (entry, map, master_entry, flag, search_range) VALUES
(26589, 571, 26588, 512, 100);
UPDATE creature_template SET FactionAlliance=14, FactionHorde=14, UnitFlags=UnitFlags|768 WHERE entry IN (26586,26590);
-- ------------------------------
-- Quest: 12022/12191 "Chug and Chuck!"
-- ------------------------------
-- DB Scripts for Spell 42436 (Sniff Data)
DELETE FROM dbscripts_on_spell WHERE id IN (42436);
INSERT INTO dbscripts_on_spell (id,delay,command,datalong,data_flags,comments) VALUES
(42436,0,15,42523,8,'Cast Weak Alcohol'),
(42436,0,15,42536,10,'Cast Brewfest Request Chick Chuck Mug'),
(42436,1,15,47173,10,'Cast Brewfest - Dark Iron Attack - Intro -  Assign Kill Credit'),
(42436,1,15,43126,10,'Cast Mug Target Practice'),
(42436,1,15,43073,10,'Cast Mug Target Practice');
-- Drink! Must Target S.T.O.U.T.
DELETE FROM spell_script_target WHERE entry IN (42436);
INSERT INTO spell_script_target (entry,TYPE,targetEntry,inverseEffectMask) VALUES
(42436,1,24108,0);
-- Waking Legends(q.8447)
DELETE FROM dbscripts_on_quest_start WHERE id = 8447;
INSERT INTO dbscripts_on_quest_start (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(8447,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Remulos active'),
(8447,1,29,3,0x02,0,0,0,0,0,0,0,0,0,0,0,'22832 - npc_flag removed'),
(8447,3,0,0,0,0,0,0,2000000375,0,0,0,0,0,0,0,''),
(8447,6,3,0,0,0,0,0,0,0,0,0,7841.78,-2226.41,468.062,4.27031,''),
(8447,7,3,0,0,0,0,0,0,0,0,0,7828.99,-2246.58,463.559,4.44419,''),
(8447,11,3,0,0,0,0,0,0,0,0,0,7824.59,-2280.33,459.171,4.52666,''),
(8447,16,3,0,0,0,0,0,0,0,0,0,7817.51,-2302.91,456.077,3.83315,''),
(8447,19,3,0,0,0,0,0,0,0,0,0,7808.83,-2304.32,455.411,3.81116,''),
(8447,21,3,0,0,0,0,0,0,0,0,0,7788.35,-2321.57,454.651,3.49596,''),
(8447,24,3,0,0,0,0,0,0,0,0,0,7775.52,-2324.3,454.189,3.10954,''),
(8447,26,3,0,0,0,0,0,0,0,0,0,7755.16,-2315.33,455.235,2.95796,''),
(8447,31,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'wp pause'),
(8447,35,0,0,0,0,0,0,2000000376,0,0,0,0,0,0,0,''),
(8447,40,15,25004,0,0,0,0,0,0,0,0,0,0,0,0,''),
(8447,50,10,17949,180000,0,0,0,0,0,0,0,7738.52,-2314.8,454.679,0.046443,'summon'),
(8447,54,0,0,0,0,0,0,2000000377,0,0,0,0,0,0,0,''),
(8447,57,0,0,0,17949,20,7,2000000378,0,0,0,0,0,0,0,''),
(8447,61,1,0,0,17949,20,7,0,0,0,0,0,0,0,0,''),
(8447,62,0,0,0,0,0,0,2000000379,0,0,0,0,0,0,0,''),
(8447,70,0,0,0,17949,20,7,2000000380,0,0,0,0,0,0,0,''),
(8447,80,1,0,0,17949,20,7,0,0,0,0,0,0,0,0,''),
(8447,81,0,0,0,0,0,0,2000000381,0,0,0,0,0,0,0,''),
(8447,84,0,0,0,17949,20,7,2000000382,0,0,0,0,0,0,0,''),
(8447,89,0,0,0,0,0,0,2000000383,0,0,0,0,0,0,0,''),
(8447,99,0,0,0,17949,20,7,2000000384,0,0,0,0,0,0,0,''),
(8447,116,1,0,0,17949,20,7,0,0,0,0,0,0,0,0,''),
(8447,117,0,0,0,17949,20,7,2000000385,0,0,0,0,0,0,0,''),
(8447,121,1,0,0,17949,20,7,0,0,0,0,0,0,0,0,''),
(8447,122,0,0,0,0,0,0,2000000386,0,0,0,0,0,0,0,''),
(8447,125,18,0,0,17949,20,7,0,0,0,0,0,0,0,0,'malfurion desp'),
(8447,125,7,8447,0,0,0,0,0,0,0,0,0,0,0,0,''),
(8447,126,0,0,0,0,0,0,2000000387,0,0,0,0,0,0,0,''),
(8447,128,3,0,0,0,0,0,0,0,0,0,7848.3,-2216.35,470.888,0.572632,''),
(8447,148,3,0,0,0,0,0,0,0,0,0,0,0,0,3.90954,''),
(8447,149,29,3,0x01,0,0,0,0,0,0,0,0,0,0,0,'22832 - npc_flag added'),
(8447,149,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Remulos unactive');
UPDATE quest_template SET StartScript = 8447 WHERE entry = 8447;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000375 AND 2000000387;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000375,'Come, $N. The lake is around the bend.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000376,'Stand near me, $N. I will protect you should anything go wrong.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000377,'Malfurion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000378,'Remulos, old friend. It is good to see you once more. I knew the message would find its way to you - one way or another.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,378,NULL),
(2000000379,'It was shrouded in nightmares, Malfurion. What is happening in the Dream? What could cause such atrocities?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000380,'I fear for the worst, old friend. Within the Dream we fight a new foe, born of an ancient evil. Ysera\'s noble brood has fallen victim to the old whisperings. It seems as if the Nightmare has broken through the realm to find a new host on Azeroth.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,378,NULL),
(2000000381,'I sensed as much, Malfurion. Dark days loom ahead.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000382,'Aye Remulos, prepare the mortal races.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000383,'You have been gone too long, Malfurion. Peace between the Children of Azeroth has become tenuous at best. What of my father? Of your brother? Have you any news?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000384,'Cenarius fights at my side. Illidan sits atop his throne in Outland - brooding. I\'m afraid that the loss to Arthas proved to be his breaking point. Madness has embraced him, Remulos. He replays the events in his mind a thousand times per day, but in his mind, he is the victor and Arthas is utterly defeated. He is too far gone, old friend. I fear that the time may soon come that our bond is tested and it will not be as it was at the Well in Zin-Azshari. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,378,NULL),
(2000000385,'Remulos, I am being drawn back... Tyrande... send her my love... Tell her I am safe... Tell her... Tell her I will return... Farewell...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,378,NULL),
(2000000386,'Farewell, old friend... Farewell...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,NULL),
(2000000387,'Let us return to the grove, mortal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);
DELETE FROM spell_target_position WHERE id = 25004;
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z,  target_orientation) VALUES
(25004,1,7738.52,-2314.8,452.679,0);
-- Malfurion Stormrage -- update
UPDATE creature_template SET FactionAlliance = 994, FactionHorde = 994,  InhabitType = 4, MovementType = 0 WHERE entry = 17949;
DELETE FROM creature_template_addon WHERE entry = 17949;
INSERT INTO creature_template_addon VALUES (17949,0,0,1,0,0,0,24999);
-- q.9472 'Arelion's Mistress'
-- TEMP Discreet Location - xyz update
UPDATE gameobject SET position_x = -722.991, position_y = 4168.96, position_z = 50.4291 WHERE guid = 99910;
-- To finish q. we need to add script for prev. quest. 
-- q.9483 'Life's Finer Pleasures'
DELETE FROM dbscripts_on_quest_end WHERE id = 9483;
INSERT INTO dbscripts_on_quest_end  (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(9483,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
(9483,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Viera Sunwhisper - active'),
(9483,3,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
(9483,6,0,0,0,0,0,0,2000000388,0,0,0,0,0,0,0,''),
(9483,6,32,1,0,17230,61963,7 | 0x10,0,0,0,0,0,0,0,0,'wp pause'),
(9483,7,25,1,0,17230,61963,7 | 0x10,0,0,0,0,0,0,0,0,'RUN ON'),
(9483,8,3,0,0,0,0,0,0,0,0,0,-656.13,4146.6,64.128,2.16845,''),
(9483,8,3,0,0,17230,61963,7 | 0x10,0,0,0,0,-656.13,4146.6,64.128,2.16845,''),
(9483,11,3,0,0,0,0,0,0,0,0,0,-682.265,4148.52,63.9026,1.87414,''),
(9483,18,3,0,0,17230,61963,7 | 0x10,0,0,0,0,-682.265,4148.52,63.9026,1.87414,''),
(9483,19,3,0,0,0,0,0,0,0,0,0,-699.983,4184.54,57.9007,2.85353,''),
(9483,20,25,0,0,17230,61963,7 | 0x10,0,0,0,0,0,0,0,0,'RUN OFF'),
(9483,21,3,0,0,17230,61963,7 | 0x10,0,0,0,0,-699.983,4184.54,57.9007,2.85353,''),
(9483,30,3,0,0,0,0,0,0,0,0,0,-718.249,4174.95,51.9827,4.24132,''),
(9483,31,3,0,0,17230,61963,7 | 0x10,0,0,0,0,-718.249,4174.95,51.9827,4.24132,''),
(9483,37,3,0,0,0,0,0,0,0,0,0,-719.781,4168.6,51.2242,4.51228,''),
(9483,38,3,0,0,17230,61963,7 | 0x10,0,0,0,0,-718.649,4170.65,51.8661,4.50951,''),
(9483,36,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'wp pause'),
(9483,93,31,17230,220,0,0,0,0,0,0,0,0,0,0,0,''), -- check and desp if its nessesary
(9483,94,18,0,0,17230,61963,7 | 0x10,0,0,0,0,0,0,0,0,''),
(9483,94,18,0,0,17226,61961,7 | 0x10,0,0,0,0,0,0,0,0,'');
UPDATE quest_template SET CompleteScript = 9483 WHERE entry = 9483;
-- Twinkle
UPDATE creature SET spawntimesecs = 60 WHERE guid = 61963; -- quest req. 
-- Viera Sunwhisper c.17226
UPDATE creature SET spawntimesecs = 60 WHERE guid = 61961; -- quest req.
UPDATE creature_template SET MovementType = 2 WHERE entry = 17226;
DELETE FROM creature_movement_template WHERE entry = 17226;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,textid1,textid2,textid3,textid4,textid5,emote,spell,wpguid,orientation,model1,model2) VALUES
(17226,1,-719.781,4168.6,51.2242,7000,1722601,0,0,0,0,0,0,0,0,4.51228,0,0),
(17226,2,-723.602,4123.29,49.3491,1000,1722602,0,0,0,0,0,0,0,0,4.60652,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1722601,1722602); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1722601,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(1722601,1,25,1,0,17230,61963,7 | 0x10,0,0,0,0,0,0,0,0,'RUN ON'),
(1722601,1,0,0,0,0,0,0,2000000389,0,0,0,0,0,0,0,''),
(1722601,5,0,0,0,0,0,0,2000000390,0,0,0,0,0,0,0,''),
(1722601,7,0,0,0,0,0,0,2000000391,0,0,0,0,0,0,0,''),
(1722601,11,3,0,0,17230,61963,7 | 0x10,0,0,0,0,-723.602,4123.29,49.3491,4.60652,''),
(1722601,9,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Viera Sunwhisper - unactive'),
(1722601,17,18,0,0,17230,61963,7 | 0x10,0,0,0,0,0,0,0,0,''),
(1722602,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000388 AND 2000000391;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000388,'Ok, let\'s go.  I know just the perfect spot!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000389,'What... is happening... to me?  Get this cat away from me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000390,'Twinkle looks at Viera Sunwhisper with very hungry eyes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,NULL),
(2000000391,'%s scurries away, attempting to flee from Twinkle.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,NULL);-- Helena Atwood
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 41844;
DELETE FROM creature_movement WHERE id = 41844;
UPDATE creature_template SET MovementType = 2 WHERE entry = 5669;
DELETE FROM creature_movement_template WHERE entry = 5669;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,textid1,textid2,textid3,textid4,textid5,emote,spell,wpguid,orientation,model1,model2) VALUES
(5669,1,1717.102,290.1813,-62.10684,7000,566901,0,0,0,0,0,0,0,0,5.026548,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 566901; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(566901,1,15,9008,0,0,0,0,0,0,0,0,0,0,0,0,'');-- q.5541 'Ammo for Rumbleshot'
DELETE FROM dbscripts_on_quest_end WHERE id = 5541;
INSERT INTO dbscripts_on_quest_end  (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(5541,0,20,0,0,10610,269,7 | 0x10,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(5541,1,20,2,0,10610,269,7 | 0x10,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint'); -- this will force him to start 'Mortar Combat' Event
UPDATE quest_template SET CompleteScript = 5541 WHERE entry = 5541;
-- Event: Mortar Combat - update
-- Angus (q.5541req.)
UPDATE creature_movement_template SET waittime = 1000 WHERE entry = 10610 AND POINT = 1;
UPDATE creature_movement_template SET waittime = 420000 WHERE entry = 10610 AND POINT = 7;
DELETE FROM dbscripts_on_creature_movement WHERE id = 1061001 AND delay IN (0,1); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES 
(1061001,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Angus - active'),
(1061001,0,21,1,0,10805,272,0x10,0,0,0,0,0,0,0,0,'Klemmy - active'),
(1061001,0,21,1,0,10611,267,0x10,0,0,0,0,0,0,0,0,'Shorty - active'),
(1061001,1,29,3,2,1243,265,7 | 0x10,0,0,0,0,0,0,0,0,'1243 - NPCFlags removed'),
(1061001,1,21,1,0,10803,266,0x10,0,0,0,0,0,0,0,0,'Wheeler - active'),
(1061001,1,21,1,0,10804,268,0x10,0,0,0,0,0,0,0,0,'Middlecamp - active');
DELETE FROM dbscripts_on_creature_movement WHERE id = 1061003 AND delay = 229; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES 
(1061003,229,29,3,1,1243,265,7 | 0x10,0,0,0,0,0,0,0,0,'1243 - NPCFlags added');-- NPCFLags - fix
-- 29 SCRIPT_COMMAND_MODIFY_NPC_FLAGS -- some were broken in 407_UPDATEPACK.

-- Theramore Guard
UPDATE dbscripts_on_gossip SET datalong2 = 1 WHERE id = 8851 AND delay = 120;
-- quest 10988 'The Raven Stones' - Druid
UPDATE dbscripts_on_quest_end SET datalong2 = 2 WHERE id = 10988 AND delay = 0;
UPDATE dbscripts_on_quest_end SET datalong2 = 1 WHERE id = 10988 AND delay = 49;
-- quest 10964 'Waking the Sleeper' - Druid
UPDATE dbscripts_on_quest_end SET datalong2 = 2 WHERE id = 10964 AND delay = 0;
UPDATE dbscripts_on_quest_end SET datalong2 = 1 WHERE id = 10964 AND delay = 24;
-- quest 10961 'The Ward of Wakening' - Druid
UPDATE dbscripts_on_quest_end SET datalong2 = 2 WHERE id = 10961 AND delay = 0;
UPDATE dbscripts_on_quest_end SET datalong2 = 1 WHERE id = 10961 AND delay = 15;
-- All Clear!(q.10436)
UPDATE dbscripts_on_quest_end SET datalong2 = 1 WHERE id = 10436 AND delay = 23;-- ###########################
-- Culling of Stratholme intro
-- ###########################

-- #####
-- Texts
-- #####
SET @DB_STRING_ENTRY:=2000005785;
DELETE FROM db_script_string WHERE entry BETWEEN @DB_STRING_ENTRY AND @DB_STRING_ENTRY+35;
INSERT INTO db_script_string (entry,content_default,sound,TYPE,LANGUAGE,emote,COMMENT) VALUES
-- bridge
(@DB_STRING_ENTRY+0,'The Lightbringer...',0,0,0,396,'Soldier - salute 1'),
(@DB_STRING_ENTRY+1,'Lord Uther...',0,0,0,396,'Soldier - salute 2'),
(@DB_STRING_ENTRY+2,'Glad you could make it, Uther.',12828,0,0,396,'Arthas - intro 1'), -- music 14947
(@DB_STRING_ENTRY+3,'Watch your tone with me, boy. You may be the prince, but I\'m still your superior as a paladin!',12839,0,0,397,'Uther - intro 2'),
(@DB_STRING_ENTRY+4,'As if I could forget. Listen, Uther, there\'s something about the plague you should know...',12829,0,0,0,'Arthas - intro 3'),
(@DB_STRING_ENTRY+5,'Oh, no. We\'re too late. These people have all been infected! They may look fine now, but it\'s just a matter of time before they turn into the undead!',12830,0,0,5,'Arthas - intro 4'),
(@DB_STRING_ENTRY+6,'What?',12840,0,0,5,'Uther - intro 5'),
(@DB_STRING_ENTRY+7,'This entire city must be purged.',12831,0,0,396,'Arthas - intro 6'),
(@DB_STRING_ENTRY+8,'How can you even consider that? There\'s got to be some other way.',12841,0,0,6,'Uther - intro 7'),
(@DB_STRING_ENTRY+9,'Damn it, Uther! As your future king, I order you to purge this city!',12832,0,0,5,'Arthas - intro 8'),
(@DB_STRING_ENTRY+10,'You are not my king yet, boy! Nor would I obey that command even if you were!',12842,0,0,396,'Uther - intro 9'),
(@DB_STRING_ENTRY+11,'Then I must consider this an act of treason.',12833,0,0,396,'Arthas - intro 10'),
(@DB_STRING_ENTRY+12,'Treason? Have you lost your mind, Arthas?',12843,0,0,5,'Arthas - intro 11'), -- music 14948
(@DB_STRING_ENTRY+13,'Have I? Lord Uther, by my right of succession and the sovereignty of my crown, I hereby relieve you of your command and suspend your paladins from service.',12834,0,0,378,'Arthas - intro 12'),
(@DB_STRING_ENTRY+14,'Arthas! You can\'t just--',12837,0,0,396,'Jaina - intro 13'),
(@DB_STRING_ENTRY+15,'It\'s done! Those of you who have the will to save this land, follow me! The rest of you... get out of my sight!',12835,0,0,1,'Arthas - intro 14'),
(@DB_STRING_ENTRY+16,'You\'ve just crossed a terrible threshold, Arthas.',12844,0,0,397,'Uther - intro 15'),
(@DB_STRING_ENTRY+17,'Jaina?',12836,0,0,0,'Arthas - intro 16'),
(@DB_STRING_ENTRY+18,'I\'m sorry, Arthas. I can\'t watch you do this.',12838,0,0,396,'Jaina - intro 17'), -- music 14949
(@DB_STRING_ENTRY+19,'Take position here, and I will lead a small force inside Stratholme to begin the culling. We must contain and purge the infected for the sake of all of Lordaeron!',14327,1,0,0,'Arthas - intro 18'),
(@DB_STRING_ENTRY+20,'All officers should check in with me when their squads are ready. We\'ll enter Stratholme on my order.',0,0,0,0,'Arthas - city entrance'),
-- city entrance
(@DB_STRING_ENTRY+21,'Everyone looks ready. Remember, these people are all infected with the plague and will die soon. We must purge Stratholme to protect the remainder of Lordaeron from the Scourge. Let\'s go.',14293,0,0,396,'Arthas - city 1'),
(@DB_STRING_ENTRY+22,'Everyone I know seems to be coming down with something really bad.',0,0,0,1,'Citizen - gossip 1'),
(@DB_STRING_ENTRY+23,'Have you talked to anyone who hasn\'t started getting sick?',0,0,0,1,'Citizen - gossip 2'),
(@DB_STRING_ENTRY+24,'It must be something in the water, I tell you.',0,0,0,1,'Citizen - gossip 3'),
(@DB_STRING_ENTRY+25,'My bed is looking pretty good right now.',0,0,0,1,'Citizen - gossip 4'),
(@DB_STRING_ENTRY+26,'Prince Arthas, may the light be praised! Many people in the town have begun to fall seriously ill, can you help us?',0,0,0,1,'Citizen - query'),
(@DB_STRING_ENTRY+27,'I can only help you with a clean death.',14294,0,0,0,'Arthas - city 2'),
(@DB_STRING_ENTRY+28,'What? This can\'t be!',0,0,0,274,'Citizen - attack'),
(@DB_STRING_ENTRY+29,'Oh, no...',0,0,0,431,'Citizen - attack 2'),
(@DB_STRING_ENTRY+30,'Did you see that?',0,0,0,5,'Citizen - attack 3'),
(@DB_STRING_ENTRY+31,'That was just the beginning.',14295,0,0,1,'Arthas - city 3'),
(@DB_STRING_ENTRY+32,'Yes, this is the beginning. I\'ve been waiting for you, young prince. I am Mal\'Ganis.',14410,1,0,0,'Malganis - city 4'),
(@DB_STRING_ENTRY+33,'As you can see, your people are now mine. I will now turn this city household by household, until the flame of life has been snuffed out... forever.',14411,1,0,378,'Malganis - city 5'),
(@DB_STRING_ENTRY+34,'I won\'t allow it, Mal\'Ganis! Better that these people die by my hand than serve as your slaves in death!',14296,1,0,397,'Arthas - city 6'),
(@DB_STRING_ENTRY+35,'Mal\'Ganis will send out some of his Scourge minions to interfere with us. Those of you with the strongest steel and magic shall go forth and destroy them. I will lead the rest of my forces in purging Stratholme of the infected.',14885,1,0,1,'Arthas - city 7');


-- ############
-- Arthas intro
-- ############
-- Movement
SET @DB_STRING_ENTRY:=2000005785;
DELETE FROM creature_movement_template WHERE entry=26499;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES 
(26499, 1, 1939.171, 1288.315, 145.4922, 0, 0, 0),
(26499, 2, 1924.883, 1289.172, 143.8736, 0, 0, 0),
(26499, 3, 1912.860, 1290.030, 142.2913, 0, 0, 0),
(26499, 4, 1903.254, 1291.568, 143.3867, 1000, 2649904, 3.80),
(26499, 5, 1903.257, 1298.676, 143.5107, 0, 0, 0),
(26499, 6, 1907.603, 1311.531, 149.7067, 1000, 2649906, 0.20),
(26499, 7, 1907.603, 1311.531, 149.7067, 1000, 2649907, 4.40),
(26499, 8, 1903.257, 1298.676, 143.5107, 0, 0, 0),
(26499, 9, 1903.254, 1291.568, 143.3867, 0, 0, 0),
(26499, 10, 1908.119, 1287.726, 142.679, 0, 0, 0),
(26499, 11, 1916.920, 1287.297, 142.008, 12000, 2649911, 3.04),
(26499, 12, 1924.738, 1287.323, 143.839, 0, 0, 0),
(26499, 13, 1940.938, 1287.586, 145.672, 0, 0, 0),
(26499, 14, 1987.673, 1287.515, 145.474, 0, 0, 0),
(26499, 15, 1993.607, 1293.707, 145.457, 0, 0, 0),
(26499, 16, 1996.356, 1301.102, 145.371, 0, 0, 0),
(26499, 17, 1996.892, 1314.195, 143.166, 0, 0, 0),
(26499, 18, 2004.018, 1323.278, 142.977, 0, 0, 0),
(26499, 19, 2013.225, 1324.761, 142.971, 0, 0, 0),
(26499, 20, 2020.775, 1317.646, 142.936, 0, 0, 0),
(26499, 21, 2023.479, 1307.916, 143.463, 0, 0, 0),
(26499, 22, 2029.591, 1289.071, 143.576, 0, 0, 0),
(26499, 23, 2047.948, 1287.598, 142.865, 1000, 2649923, 3.22),
(26499, 24, 2047.948, 1287.598, 142.865, 12000, 2649924, 3.22),
(26499, 25, 2072.355, 1287.635, 141.675, 0, 0, 0),
(26499, 26, 2083.011, 1287.590, 141.237, 10000, 2649926, 5.36),
(26499, 27, 2087.105, 1281.529, 140.683, 3000, 2649927, 5.32),
(26499, 28, 2091.994, 1277.257, 140.470, 3000, 2649928, 5.58),
(26499, 29, 2091.994, 1277.257, 140.470, 3000, 2649929, 2.47),
(26499, 30, 2091.994, 1277.257, 140.470, 57000, 2649930, 0.43),
(26499, 31, 2091.994, 1277.257, 140.470, 1000, 2649931, 0.43);
-- Movement scripts
-- Front bridge dialogue
DELETE FROM dbscripts_on_creature_movement WHERE id=2649904;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649904,0,32,1,0,0,0,0,0,'Arthas - pause WP Movement'),
(2649904,0,35,5,70,0,0,0,0,'Arthas - Send AI event'),
(2649904,8,0,0,0,0,0,0,@DB_STRING_ENTRY+2,'Arthas - say intro 1'),
(2649904,8,16,14947,0,0,0,8,0,'Arthas - change music'),
(2649904,13,0,0,0,26528,30,0,@DB_STRING_ENTRY+3,'Uther - say intro 2'),
(2649904,19,25,0,0,26528,30,0,0,'Uther - set run off'),
(2649904,19,25,0,0,26497,30,0,0,'Jaina - set run off'),
(2649904,19,25,0,0,0,0,0,0,'Arthas - set run off'),
(2649904,20,0,0,0,0,0,0,@DB_STRING_ENTRY+4,'Arthas - say intro 3'),
(2649904,20,32,0,0,26528,30,0,0,'Uther - unpause WP movement'),
(2649904,20,32,0,0,26497,30,0,0,'Jaina - unpause WP movement'),
(2649904,20,32,0,0,0,0,0,0,'Arthas - unpause WP movement');
-- Look over the city
DELETE FROM dbscripts_on_creature_movement WHERE id=2649906;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649906,0,32,1,0,0,0,0,0,'Arthas - pause WP Movement'),
(2649906,0,0,0,0,0,0,0,@DB_STRING_ENTRY+5,'Arthas - say intro 4'),
(2649906,10,0,0,0,26528,30,0,@DB_STRING_ENTRY+6,'Uther - say intro 5'),
(2649906,13,32,0,0,0,0,0,0,'Arthas - unpause WP movement');
-- Argue with Uther
DELETE FROM dbscripts_on_creature_movement WHERE id=2649907;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649907,0, 32,1,0,0,0,0,0,'Arthas - pause WP Movement'),
(2649907,0, 0,0,0,0,0,0,@DB_STRING_ENTRY+7,'Arthas - say intro 6'),
(2649907,4, 0,0,0,26528,30,0,@DB_STRING_ENTRY+8,'Uther - say intro 7'),
(2649907,10,0,0,0,0,0,0,@DB_STRING_ENTRY+9,'Arthas - say intro 8'),
(2649907,15,0,0,0,26528,30,0,@DB_STRING_ENTRY+10,'Uther - say intro 9'),
(2649907,22,0,0,0,0,0,0,@DB_STRING_ENTRY+11,'Arthas - say intro 10'),
(2649907,25,0,0,0,26528,30,0,@DB_STRING_ENTRY+12,'Uther - say intro 11'),
(2649907,25,16,14948,0,0,0,8,0,'Arthas - change music'),
(2649907,30,0,0,0,0,0,0,@DB_STRING_ENTRY+13,'Arthas - say intro 12'),
(2649907,42,0,0,0,26497,30,0,@DB_STRING_ENTRY+14,'Jaina - say intro 13'),
(2649907,42,1,0,0,0,0,0,0,'Arthas - cancel emote state'),
(2649907,44,0,0,0,0,0,0,@DB_STRING_ENTRY+15,'Arthas - say intro 14'),
(2649907,50,1,5,0,0,0,0,0,'Arthas - handle emote'),
(2649907,57,0,0,0,26528,30,0,@DB_STRING_ENTRY+16,'Uther - say intro 15'),
(2649907,59,32,0,0,26528,30,0,0,'Uther - unpause WP movement'),
(2649907,59,32,0,0,26497,30,0,0,'Jaina - unpause WP movement'),
(2649907,61,0,0,0,0,0,0,@DB_STRING_ENTRY+17,'Arthas - say intro 16');
-- Prepare to enter the city
DELETE FROM dbscripts_on_creature_movement WHERE id=2649911;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649911,0,0,0,0,0,0,0,@DB_STRING_ENTRY+19,'Arthas - say intro 18'),
(2649911,0,25,1,0,0,0,0,0,'Arthas - set run on');
-- Stop at the gate
DELETE FROM dbscripts_on_creature_movement WHERE id=2649923;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649923,0,32,1,0,0,0,0,0,'Arthas - pause WP Movement'),
(2649923,1,0,0,0,0,0,0,@DB_STRING_ENTRY+20,'Arthas - say city entrance'),
(2649923,1,29,1,1,0,0,0,0,'Arthas - add gossip flag'),
(2649923,1,25,0,0,0,0,0,0,'Arthas - set run off'),
(2649923,0,35,5,30,0,0,0,0,'Arthas - Send AI event');
-- Enter the city
DELETE FROM dbscripts_on_creature_movement WHERE id=2649924;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649924,3,0,0,0,0,0,0,@DB_STRING_ENTRY+21,'Arthas - say city 1'),
(2649924,12,0,0,0,28167,132328,16,@DB_STRING_ENTRY+22,'Stratholme Citizen - say gossip 1'),
(2649924,12,32,0,0,27747,132436,16,0,'High Elf Mage-Priest - start WP movement'), -- left
(2649924,12,32,0,0,27747,132435,16,0,'High Elf Mage-Priest - start WP movement'), -- right
(2649924,12,32,0,0,27745,132418,16,0,'Lordaeron Footman - start WP movement'), -- left middle
(2649924,12,32,0,0,27745,132417,16,0,'Lordaeron Footman - start WP movement'), -- right middle
(2649924,12,32,0,0,27745,132419,16,0,'Lordaeron Footman - start WP movement'), -- left front
(2649924,12,32,0,0,27745,132416,16,0,'Lordaeron Footman - start WP movement'), -- right front
(2649924,24,0,0,0,28167,132330,16,@DB_STRING_ENTRY+23,'Stratholme Citizen - say gossip 2');
-- Purge the citizen
DELETE FROM dbscripts_on_creature_movement WHERE id=2649926;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649926,1,0,0,0,28167,132326,16,@DB_STRING_ENTRY+26,'Stratholme Citizen - say city query prince'),
(2649926,1,20,2,0,28167,132326,16,0,'Stratholme Citizen - start WP movement'),
(2649926,4,0,0,0,28167,132327,16,@DB_STRING_ENTRY+24,'Stratholme Resident - say gossip 3'),
(2649926,8,0,0,0,0,0,0,@DB_STRING_ENTRY+27,'Arthas - say city 2'),
(2649926,8,0,0,0,28167,132328,16,@DB_STRING_ENTRY+25,'Stratholme Resident - say gossip 4'),
(2649926,12,0,0,0,28167,132326,16,@DB_STRING_ENTRY+28,'Stratholme Citizen - say city attack');
DELETE FROM dbscripts_on_creature_movement WHERE id=2649927;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649927,0,15,50773,0,28167,132326,18,0,'Arthas - cast Crusader Strike on Stratholme Citizen'),
(2649927,2,0,0,0,28169,132359,16,@DB_STRING_ENTRY+29,'Stratholme Resident - say city attack 2'),
(2649927,3,0,0,0,28167,132327,16,@DB_STRING_ENTRY+30,'Stratholme Resident - say city attack 3');
DELETE FROM dbscripts_on_creature_movement WHERE id=2649928;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649928,0,15,50773,0,28169,132359,18,0,'Arthas - cast Crusader Strike on Stratholme Resident');
-- Mal'ganis appears
DELETE FROM dbscripts_on_creature_movement WHERE id=2649929;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,X,Y,z,o,comments) VALUES
(2649929,0,0,0,0,0,0,0,@DB_STRING_ENTRY+31,0,0,0,0,'Arthas - say city 2'),
(2649929,2,10,26533,30000,0,0,0,0,2113.454,1287.986,136.3829,3.07,'Spawn Malganis'),
(2649929,3,0,0,0,26533,30,0,@DB_STRING_ENTRY+32,0,0,0,0,'Malganis - say city 4');
DELETE FROM dbscripts_on_creature_movement WHERE id=2649930;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649930,10,35,5,100,26533,30,0,0,'Malganis - Send AI event'),
(2649930,12,0,0,0,26533,30,0,@DB_STRING_ENTRY+33,'Malganis - say city 5'),
(2649930,27,15,51908,0,26533,30,0,0,'Malganis - Cast Cosmetic - Shadowstep'),
(2649930,27,18,1000,0,26533,30,2,0,'Malganis - Despawn'),
(2649930,27,0,0,0,0,0,0,@DB_STRING_ENTRY+34,'Arthas - say city 6'),
(2649930,37,0,0,0,0,0,0,@DB_STRING_ENTRY+35,'Arthas - say city 7');
-- Last WP - set to pause and execute further events from SD2
DELETE FROM dbscripts_on_creature_movement WHERE id=2649931;
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649931,0,32,1,0,0,0,0,0,'Arthas - pause WP Movement'),
(2649931,0,32,0,0,27747,132436,16,0,'High Elf Mage-Priest - resume WP movement'), -- left
(2649931,0,32,0,0,27747,132435,16,0,'High Elf Mage-Priest - resume WP movement'), -- right
(2649931,0,32,0,0,27745,132418,16,0,'Lordaeron Footman - resume WP movement'), -- left middle
(2649931,0,32,0,0,27745,132417,16,0,'Lordaeron Footman - resume WP movement'), -- right middle
(2649931,0,32,0,0,27745,132419,16,0,'Lordaeron Footman - resume WP movement'), -- left front
(2649931,0,32,0,0,27745,132416,16,0,'Lordaeron Footman - resume WP movement'); -- right front


-- ############
-- Other actors
-- ############
-- Jaina
-- Movement
DELETE FROM creature_movement_template WHERE entry=26497;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(26497, 1, 1885.484, 1297.844, 145.2992, 0, 0, 0), 
(26497, 2, 1891.239, 1294.988, 144.1697, 0, 0, 0), 
(26497, 3, 1896.754, 1292.831, 143.7381, 1000, 2649703, 5.76),
(26497, 4, 1898.829, 1299.562, 144.0106, 1000, 2649703, 1.24),
(26497, 5, 1895.119, 1293.928, 143.7991, 4000, 2649705, 3.46),
(26497, 6, 1868.875, 1283.657, 144.1956, 0, 0, 0),
(26497, 7, 1836.849, 1280.569, 143.7523, 0, 0, 0),
(26497, 8, 1785.225, 1267.401, 139.7626, 0, 2649708, 0);
-- Janina movement scripts
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2649703,2649705,2649708);
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2649703,0,32,1,0,0,0,0,0,'Jaina - pause WP Movement'),
(2649705,0,0,0,0,0,0,0,@DB_STRING_ENTRY+18,'Jaina - say intro 17'),
(2649705,0,16,14949,0,0,0,8,0,'Jaina - change music'),
(2649705,10,32,0,0,26499,50,0,0,'Arthas - unpause WP movement'),
(2649708,0,18,0,0,0,0,0,0,'Jaina - despawn');

-- Uther
-- Movement
DELETE FROM creature_movement_template WHERE entry=26528;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(26528, 1, 1807.619, 1276.471, 141.7253, 0, 0, 0),
(26528, 2, 1862.016, 1282.776, 144.1979, 0, 2652802, 0), 
(26528, 3, 1879.415, 1283.921, 143.8993, 0, 2652803, 0),
(26528, 4, 1889.687, 1285.941, 143.7088, 0, 2652804, 0), 
(26528, 5, 1899.588, 1288.324, 143.3571, 1000, 2652805, 0.76),
(26528, 6, 1903.257, 1298.676, 143.5107, 1000, 2652805, 1.37),
(26528, 7, 1896.119, 1294.928, 143.7991, 0, 0, 0),
(26528, 8, 1868.875, 1283.657, 144.1956, 0, 2652808, 0),
(26528, 9, 1836.849, 1280.569, 143.7523, 0, 0, 0),
(26528, 10, 1785.225, 1267.401, 139.7626, 0, 2652810, 0);
-- Uther movement scripts
-- 1. Soldiers salute
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2652802,2652803);
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(2652802,0,0,0,0,27745,30,0,@DB_STRING_ENTRY+0,'Soldier - say salute 1'),
(2652803,0,0,0,0,27745,30,0,@DB_STRING_ENTRY+1,'Soldier - say salute 2');
-- 2. Various Uther events
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2652804,2652805,2652808,2652810);
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,dataint,comments) VALUES
(2652804,0,35,5,30,0,'Uther - Send AI event'),
(2652805,0,32,1,0,0,'Uther - pause WP Movement'),
(2652808,0,35,6,30,0,'Uther - Send AI event'),
(2652810,0,18,0,0,0,'Uther - despawn');

-- Soldiers and Citizen
-- priest-mages movement
UPDATE creature SET MovementType=2 WHERE guid IN (132436,132435,132418,132417,132419,132416);
DELETE FROM creature_movement WHERE id=132436;
INSERT INTO creature_movement (id,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(132436, 1, 2037.91, 1293.03, 143.399, 1000, 2774701, 4.729),
(132436, 2, 2064.724, 1292.197, 141.9911, 0, 0, 0), 
(132436, 3, 2074.805, 1292.172, 141.6728, 1000, 2774701, 6.27),
(132436, 4, 2091.476, 1294.284, 139.8228, 1000, 2774701, 6.27);
DELETE FROM creature_movement WHERE id=132435;
INSERT INTO creature_movement (id,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(132435, 1, 2037.59, 1281.81, 143.566, 1000, 2774701, 1.483),
(132435, 2, 2060.791, 1282.987, 142.1430, 0, 0, 0), 
(132435, 3, 2074.624, 1282.958, 141.6344, 1000, 2774701, 6.27),
(132435, 4, 2091.26, 1281.715, 139.9222, 1000, 2774701, 6.27);
-- footmen movement
DELETE FROM creature_movement WHERE id=132418;
INSERT INTO creature_movement (id,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(132418, 1,2042.13, 1293.14, 143.236, 1000, 2774701, 4.642),
(132418, 2, 2064.724, 1292.197, 141.9911, 0, 0, 0), 
(132418, 3, 2077.737, 1290.441, 141.5698, 1000, 2774701, 6.27),
(132418, 4, 2096.125, 1290.533, 138.8193, 1000, 2774701, 6.27);
DELETE FROM creature_movement WHERE id=132417;
INSERT INTO creature_movement (id,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(132417, 1,2041.97, 1281.66, 143.454, 1000, 2774701, 1.623),
(132417, 2, 2060.791, 1282.987, 142.1430, 0, 0, 0), 
(132417, 3, 2077.590, 1284.609, 141.5710, 1000, 2774701, 6.27),
(132417, 4, 2096.411, 1284.227, 138.799, 1000, 2774701, 6.27);
DELETE FROM creature_movement WHERE id=132419;
INSERT INTO creature_movement (id,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(132419, 1, 2046.86, 1293.33, 143.032, 1000, 2774701, 4.782),
(132419, 2, 2064.724, 1292.197, 141.9911, 0, 0, 0), 
(132419, 3, 2078.055, 1293.624, 141.5544, 1000, 2774701, 6.27),
(132419, 4, 2096.939, 1297.57, 138.9689, 1000, 2774701, 6.27);
DELETE FROM creature_movement WHERE id=132416;
INSERT INTO creature_movement (id,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(132416, 1, 2046.71, 1281.91, 143.221, 1000, 2774701, 1.518),
(132416, 2, 2060.791, 1282.987, 142.1430, 0, 0, 0), 
(132416, 3, 2078.365, 1281.254, 141.5182, 1000, 2774701, 6.27),
(132416, 4, 2096.328, 1278.988, 139.4345, 1000, 2774701, 6.27);
-- citizen movement
DELETE FROM creature_movement WHERE id=132326;
INSERT INTO creature_movement (id,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(132326, 1, 2088.094, 1279.229, 140.827, 1000, 2774701, 2.19);
-- soldiers script
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2774701);
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,dataint,comments) VALUES
(2774701,0,32,1,0,0,'Soldier - pause WP Movement'); 
 
-- Misc
-- addon for knights
DELETE FROM creature_template_addon WHERE entry=28612;
INSERT INTO creature_template_addon (entry,mount) VALUES
(28612, 14584);
DELETE FROM dbscripts_on_spell WHERE id=53435;
INSERT INTO dbscripts_on_spell (id,delay,command,datalong,datalong2,data_flags,comments) VALUES
(53435,0,15,53436,0,6,'Cast Teleport to CoT Stratholme Phase 4'); 
-- missing cat figurine (YTDB)
DELETE FROM gameobject_template WHERE entry=12653;
INSERT INTO gameobject_template (entry,TYPE,displayId,NAME,IconName,castBarCaption,faction,flags,size,data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,mingold,maxgold,ScriptName) VALUES
('12653','6','1287','Cat Figurine Trap','','','14','0','1','0','0','0','5968','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','');
-- Ulduar achievs (Vezax)
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (10173,10306);
INSERT INTO achievement_criteria_requirement VALUES
(10173, 12, 0, 0),
(10173, 18, 0, 0),
(10306, 12, 1, 0),
(10306, 18, 0, 0);
-- SWP updates
DELETE FROM creature_linking_template WHERE entry IN (25598,25603);
INSERT INTO creature_linking_template (entry, map, master_entry, flag, search_range) VALUES
(25598, 580, 25588, 4096, 0),
(25603, 580, 25588, 4112, 0);
UPDATE creature_template SET FactionAlliance=16, FactionHorde=16, MinLevel=72, MaxLevel=72, EXPANSION=0, UnitFlags=UnitFlags|33555200, MinLevelHealth=52, MaxLevelHealth=52 WHERE entry=25603;
-- fix wrong used spell. thanks to @cala
UPDATE creature_template_spells SET spell1=8377 WHERE entry=6066;
-- q.12701 'Massacre At Light's Point'
-- Mine Car -- update
UPDATE creature_template SET MinLevel = 56, MaxLevel = 56, FactionAlliance = 35, FactionHorde = 35, UnitFlags = 520 WHERE entry = 28817; -- faction should be = 1610
-- Scarlet Miner
UPDATE creature_template SET MovementType = 2 WHERE entry = 28841;
DELETE FROM creature_movement_template WHERE entry = 28841;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(28841,1,2386.89,-5901.15,108.503,6000,2884101,0,0,0,0,0,0,0,0,0.0305656,0,0),
(28841,2,2366.93,-5906.73,106.928,0,0,0,0,0,0,0,0,0,0,3.1584,0,0),
(28841,3,2332.73,-5902.29,100.307,0,0,0,0,0,0,0,0,0,0,3.08379,0,0),
(28841,4,2317.88,-5902.86,94.9301,0,0,0,0,0,0,0,0,0,0,3.29977,0,0),
(28841,5,2301.5,-5908.89,87.569,0,0,0,0,0,0,0,0,0,0,3.78279,0,0),
(28841,6,2295.23,-5916.3,83.1045,0,0,0,0,0,0,0,0,0,0,4.46216,0,0),
(28841,7,2290.66,-5928.75,74.3088,0,0,0,0,0,0,0,0,0,0,4.65739,0,0),
(28841,8,2283.12,-5959.27,55.8999,0,0,0,0,0,0,0,0,0,0,4.06161,0,0),
(28841,9,2271.77,-5970.92,48.815,0,0,0,0,0,0,0,0,0,0,3.61394,0,0),
(28841,10,2250.55,-5980.45,36.277,0,0,0,0,0,0,0,0,0,0,3.67677,0,0),
(28841,11,2241.79,-5987.29,31.6077,0,0,0,0,0,0,0,0,0,0,3.9438,0,0),
(28841,12,2233.43,-5998.21,24.4464,0,0,0,0,0,0,0,0,0,0,4.18335,0,0),
(28841,13,2222.22,-6016.38,10.5408,0,0,0,0,0,0,0,0,0,0,4.15979,0,0),
(28841,14,2206.35,-6051.64,6.24328,0,0,0,0,0,0,0,0,0,0,4.28152,0,0),
(28841,15,2189.89,-6078.5,3.60618,0,0,0,0,0,0,0,0,0,0,4.45195,0,0),
(28841,16,2183.44,-6099.19,0.853,0,0,0,0,0,0,0,0,0,0,4.44252,0,0),
(28841,17,2176.59,-6128.98,1.09618,0,0,0,0,0,0,0,0,0,0,4.45822,0,0),
(28841,18,2168.7,-6155.02,1.37583,0,0,0,0,0,0,0,0,0,0,3.69246,0,0),
(28841,19,2134.1,-6167.12,0.389482,0,0,0,0,0,0,0,0,0,0,4.2934,0,0),
(28841,20,2122.55,-6185.47,14.1255,0,0,0,0,0,0,0,0,0,0,4.2398,0,0),
(28841,21,2115.67,-6196.45,13.3122,0,0,0,0,0,0,0,0,0,0,1.28671,0,0),
(28841,22,2118.73,-6192.05,13.2693,10000,2884102,0,0,0,0,0,0,0,0,1.86369,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2884101,2884102); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2884101,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Scarlet Miner active'),
(2884101,2,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2884101,2,0,0,0,0,0,0,2000000373,0,0,0,0,0,0,0,''),
(2884101,5,15,52595,0,28817,15,1,0,0,0,0,0,0,0,0,'cast 52595 on buddy'),
(2884102,1,3,0,0,0,0,0,0,0,0,0,0,0,0,4.20496,''),
(2884102,3,0,0,0,0,0,0,2000000374,0,0,0,0,0,0,0,''),
(2884102,5,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Scarlet Miner unactive'),
(2884102,6,14,46598,0,0,0,2,0,0,0,0,0,0,0,0,'Ride Vehicle Hardcoded - removed'),
(2884102,7,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'desp');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000373 AND 2000000374;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000373,'Where\'d this come from? I better get this down to the ships before the foreman sees it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000374,'I\'ll just leave it here and nobody will be the wiser!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);
DELETE FROM creature_linking_template WHERE entry = 28817;
INSERT INTO creature_linking_template (entry, map, master_entry, flag, search_range) VALUES    
(28817,609,28841,512+8192,15); -- let them despawn together!!!
-- spell update
DELETE FROM spell_target_position WHERE id = 52464;
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES 
(52464,609,2390.14,-5903.44,109.249,0); -- req for linking
-- 52589 Skeletal Gryphon Escape -- should be casted after .. objective completed/leave vehicle
-- Scourge Gryphon
UPDATE creature_template SET MovementType = 2, InhabitType = 5 WHERE entry = 28864;
DELETE FROM creature_movement_template WHERE entry = 28864;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(28864,6,2360.925,-5710.754,155.4011,5000,2886401,0,0,0,0,0,0,0,0,0,0,0),
(28864,5,2347.977,-5736.882,167.929,0,0,0,0,0,0,0,0,0,0,0,0,0),
(28864,4,2306.983,-5872.798,177.6512,0,0,0,0,0,0,0,0,0,0,0,0,0),
(28864,3,2281.503,-5955.75,131.79,0,0,0,0,0,0,0,0,0,0,0,0,0),
(28864,2,2220.663,-6030.991,70.01215,0,0,0,0,0,0,0,0,0,0,0,0,0),
(28864,1,2191.454,-6131.876,48.42883,0,0,0,0,0,0,0,0,0,0,0,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 2886401; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2886401,3,14,46598,0,0,0,2,0,0,0,0,0,0,0,0,'Ride Vehicle Hardcoded - removed'),
(2886401,4,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'desp');

-- Duplicate removed
DELETE FROM creature WHERE guid = 129164;
DELETE FROM creature_addon WHERE guid = 129164;
DELETE FROM creature_movement WHERE id = 129164;
DELETE FROM game_event_creature WHERE guid = 129164;
DELETE FROM game_event_creature_data WHERE guid = 129164;
DELETE FROM creature_battleground WHERE guid = 129164;
DELETE FROM creature_linking WHERE guid = 129164 OR master_guid = 129164;-- despawn guardian of life with infinite corruptor
DELETE FROM creature_linking_template WHERE entry IN (32281,28409);
INSERT INTO creature_linking_template (entry, map, master_entry, flag, search_range) VALUES
(32281, 595, 32273, 8192, 50),
(28409, 595, 32273, 8208, 50);

-- epilog event on corruptor death
DELETE FROM db_script_string WHERE entry=2000005821;
INSERT INTO db_script_string (entry,content_default,sound,TYPE,LANGUAGE,emote,COMMENT) VALUES
(2000005821,'You have my thanks for saving my existence in this timeline. Now I must report back to my superiors. They must know immediately of what I just experienced.',0,0,0,0,'guardian of life - say thank you');
DELETE FROM dbscripts_on_creature_death WHERE id=32273;
INSERT INTO dbscripts_on_creature_death (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(32273,0,14,60451,0,32281,50,0,0,'Guardian of Life - remove aura Corruption of Time'),
(32273,2,0,0,0,32281,50,0,2000005821,'Guardian of Life - say thank you'),
(32273,2,18,10000,0,32281,50,2,0,'Guardian of Life - Despawn');

-- Add game tele for easy access
DELETE FROM game_tele WHERE id=1425;
INSERT INTO game_tele VALUES
(1425, -8755.839, -4454.571, -200.169, 4.37, 1, 'CullingOfStratholme');
-- Headless Horseman 
UPDATE creature_template SET EquipmentTemplateId = 2494 WHERE entry = 23682;-- Seeker Nahr (Along with the other Seekers) used to patrol undercity, but they were removed in 3.3 and substituted by the Dark Rangers, due Putress' betrayal at the Wrath Gate.
-- Seeker Nahr replaced by Dark Ranger Clea
-- Seeker Thompson replaced Dark Ranger Cyndia
-- Seeker Cromwell replaced by Dark Ranger Anya

-- Seeker Nahr/Thompson/Cromwell
DELETE FROM creature WHERE guid IN (32072,32073,32074);
DELETE FROM creature_addon WHERE guid IN (32072,32073,32074);
DELETE FROM creature_movement WHERE id IN (32072,32073,32074);
DELETE FROM game_event_creature WHERE guid IN (32072,32073,32074);
DELETE FROM game_event_creature_data WHERE guid IN (32072,32073,32074);
DELETE FROM creature_battleground WHERE guid IN (32072,32073,32074);
DELETE FROM creature_linking WHERE guid IN (32072,32073,32074) OR master_guid IN (32072,32073,32074);

-- New Npcs with Waypoints
SET @CLEA := 36224; -- Dark Ranger Clea
-- ----------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @CLEA);
SET @POINT := 0;
UPDATE creature SET position_x = 1609.246, position_y = 223.4584, position_z = -61.90340, orientation = 0, MovementType = 2 WHERE id = @CLEA;
UPDATE creature_template_addon SET b2_0_sheath = 0 WHERE entry = @CLEA;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @CLEA;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@CLEA, (@POINT := @POINT + 1), 1609.246, 223.4584, -61.90340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1625.298, 210.0929, -60.70000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1639.942, 197.8281, -60.76619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1647.450, 200.8475, -62.18166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1667.022, 234.6901, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1675.597, 239.0004, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1723.016, 239.1160, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1727.486, 241.2093, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1729.365, 267.5403, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1723.585, 290.4409, -62.18439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1720.117, 305.2959, -61.47770, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1718.494, 309.0411, -61.47762, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1706.621, 324.0278, -55.39243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1707.659, 325.9294, -55.39243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1720.192, 335.4403, -49.14030, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1734.865, 346.2286, -55.39350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1737.210, 345.4460, -55.39387, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1744.150, 336.7069, -60.48446, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1745.905, 336.5825, -60.48446, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1773.952, 346.5651, -62.29193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1786.241, 357.1428, -61.96062, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1792.518, 369.8833, -60.15905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1792.492, 374.1188, -60.15905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1787.537, 394.8491, -57.21455, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1789.015, 398.8071, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1788.912, 404.6029, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1783.725, 410.2480, -57.19440, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1776.076, 418.3867, -58.03100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1761.857, 432.2151, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1758.747, 431.9061, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1754.990, 427.7975, -57.20795, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1752.367, 415.7229, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1755.393, 404.2359, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1761.858, 397.9333, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1775.760, 395.2629, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1783.611, 394.9522, -57.21456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1785.320, 393.8276, -57.21371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1794.375, 372.6804, -60.15905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1779.703, 349.0509, -62.32327, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1757.668, 332.6843, -62.24566, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1755.163, 332.6872, -62.30822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1744.679, 335.3011, -60.48443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1736.581, 344.3666, -55.39356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1734.488, 344.8608, -55.39321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1720.657, 334.8886, -49.13746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1708.503, 323.9943, -55.39243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1714.446, 313.4740, -60.48489, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1714.439, 311.7840, -60.48473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1704.675, 296.5861, -62.17630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1703.603, 293.7160, -62.16811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1703.467, 283.3416, -62.15668, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1702.132, 279.9407, -62.15506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1698.638, 280.8020, -62.14895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1697.217, 284.9091, -62.14731, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1701.107, 293.6302, -62.16217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1700.357, 296.7271, -62.16661, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1690.123, 309.3857, -62.16819, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1668.720, 328.7574, -62.16398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1640.502, 340.7791, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1636.327, 344.5663, -62.17696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1637.511, 347.0346, -62.17834, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1642.676, 346.8737, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1649.723, 344.3992, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1653.708, 346.0358, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1658.568, 355.8368, -60.74331, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1656.858, 359.7296, -60.74574, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1638.040, 370.0992, -62.16920, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1611.813, 375.1517, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1572.169, 374.0063, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1551.991, 369.2471, -62.18160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1544.057, 358.6568, -62.19004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1538.388, 348.9066, -62.17683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1539.908, 346.4219, -62.17252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1552.080, 348.6122, -62.15915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1557.466, 348.2967, -62.15563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1557.966, 345.0330, -62.14893, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1551.411, 341.4445, -62.14052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1533.871, 335.0199, -62.16702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1510.630, 312.5807, -62.14772, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1498.700, 297.3567, -62.17569, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1493.616, 284.4332, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1490.810, 281.0601, -62.17270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1488.552, 281.7254, -62.16355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1490.047, 297.7319, -62.18245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1486.550, 310.1917, -61.49476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1488.010, 319.7120, -60.78606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1500.952, 335.1210, -60.09231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1513.509, 345.5368, -60.09122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1534.205, 356.9025, -61.49840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1554.556, 368.3122, -62.18196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1571.416, 375.1871, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1585.837, 377.7647, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1592.033, 370.8737, -62.19471, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1597.092, 347.0850, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1596.720, 319.1431, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1599.777, 311.6949, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1630.804, 295.7702, -62.17669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1636.080, 284.0114, -60.76847, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1633.370, 278.8240, -60.77655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1611.436, 256.5937, -61.91060, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1608.648, 256.3188, -62.09599, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1598.780, 259.9653, -57.16174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1596.853, 259.1426, -57.16173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1595.788, 257.0236, -56.97906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1595.788, 257.0236, -56.97906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1595.769, 249.5131, -52.15284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1597.261, 248.5666, -52.15006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1603.438, 249.1752, -52.14738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1605.078, 247.3450, -52.15388, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1606.015, 242.4335, -52.15417, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1607.030, 240.7188, -52.15702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1630.534, 240.4442, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1632.885, 243.0049, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1632.595, 249.7670, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1631.348, 254.0865, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1612.677, 274.2907, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1606.971, 276.3227, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1586.306, 276.4096, -43.10275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1580.767, 274.9485, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1563.419, 257.5845, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1560.005, 251.9638, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1558.889, 241.3186, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1559.384, 231.3293, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1561.175, 225.6089, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1578.664, 206.9777, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1585.731, 204.5607, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1605.467, 204.0483, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1611.460, 206.0352, -43.10267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1629.382, 223.7811, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1633.148, 233.4342, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1630.568, 236.9336, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1607.126, 238.8718, -52.15732, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1605.703, 237.4906, -52.14565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1603.532, 232.5689, -52.14555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1596.857, 231.5195, -52.15187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1596.119, 220.6832, -57.16177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1598.207, 220.2113, -57.16177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLEA, (@POINT := @POINT + 1), 1606.565, 223.6164, -62.11158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

SET @CYNDIA := 36226; -- Dark Ranger Cyndia
-- ----------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @CYNDIA);
SET @POINT := 0;
UPDATE creature SET position_x = 1617.092, position_y = 218.6870, position_z = -59.24665, orientation = 0, MovementType = 2 WHERE id = @CYNDIA;
UPDATE creature_template_addon SET b2_0_sheath = 0 WHERE entry = @CYNDIA;
DELETE FROM creature_movement WHERE id=@GUID;
DELETE FROM creature_movement_template WHERE entry=@CYNDIA;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@CYNDIA, (@POINT := @POINT + 1), 1617.092, 218.6870, -59.24665, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1631.553, 204.2361, -60.77610, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1640.147, 200.0196, -60.76785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1655.092, 207.0599, -62.18034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1668.467, 234.7804, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1680.321, 239.2071, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1723.507, 240.4131, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1730.388, 230.8118, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1728.824, 211.1376, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1724.623, 196.0272, -62.16262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1718.686, 184.9052, -60.75858, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1709.365, 179.0808, -60.73051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1701.335, 182.7318, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1702.611, 194.2011, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1698.507, 195.9570, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1692.651, 187.9991, -62.17167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1679.004, 162.3927, -62.16040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1649.448, 142.4823, -62.14766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1637.988, 136.5618, -62.14884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1639.086, 132.6971, -62.15970, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1650.699, 134.7776, -62.16821, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1667.648, 127.9414, -61.48686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1682.416, 130.8727, -60.42862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1690.934, 138.4989, -55.21449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1693.519, 138.6567, -55.21449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1704.904, 128.4098, -49.00900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1716.952, 114.9741, -55.21538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1717.120, 112.6673, -55.21583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1709.333, 104.5370, -60.18544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1696.452, 91.29698, -62.25266, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1695.932, 86.82401, -62.26040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1702.338, 70.93913, -62.29219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1709.622, 68.14681, -62.28824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1738.570, 59.20063, -59.57227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1749.862, 49.09429, -52.81699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1753.905, 47.71148, -52.81699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1766.786, 58.51758, -46.32100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1778.527, 70.24653, -46.31701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1786.401, 78.94379, -52.81701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1786.197, 83.47396, -52.81700, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1772.827, 97.08453, -60.60150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1770.960, 104.3613, -62.27382, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1756.442, 136.9941, -62.24012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1750.686, 140.2855, -62.19185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1742.041, 136.3015, -62.15237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1729.465, 125.0361, -60.20997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1720.631, 116.7737, -55.21572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1718.348, 117.2919, -55.21521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1705.410, 129.5553, -49.04820, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1694.899, 140.4262, -55.21449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1695.190, 142.7930, -55.21449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1702.094, 150.2608, -60.46858, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1702.372, 152.2507, -60.45893, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1700.790, 156.0513, -60.44802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1712.581, 176.1745, -60.75194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1724.331, 198.7045, -62.16481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1730.761, 214.7860, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1732.083, 228.0609, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1720.836, 236.7267, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1675.712, 241.5041, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1666.813, 247.8042, -62.17799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1665.397, 249.8512, -62.17779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1658.122, 270.6968, -62.17942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1655.739, 273.1317, -62.17991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1640.921, 281.1269, -60.76676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1637.546, 279.3629, -60.77007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1620.187, 263.8601, -58.94020, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1610.994, 255.7129, -61.90981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1607.457, 253.6334, -62.09164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1596.368, 252.8378, -62.09750, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1584.992, 252.5535, -62.11018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1583.530, 251.0041, -62.10363, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1584.345, 225.8762, -62.08577, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1585.527, 222.9704, -62.14028, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1593.445, 221.0577, -57.16179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1594.703, 230.4956, -52.15519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1589.602, 231.8067, -52.14540, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1586.992, 233.7449, -52.14578, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1586.876, 246.4900, -52.15490, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1587.663, 247.9331, -52.15309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1590.811, 248.5337, -52.15467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1602.723, 248.4079, -52.14769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1605.242, 245.4582, -52.15356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1606.502, 241.8904, -52.15553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1607.699, 240.1945, -52.15888, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1630.692, 241.3403, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1632.833, 242.5227, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1632.958, 245.9545, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1631.514, 254.8911, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1613.102, 273.4337, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1605.617, 276.5178, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1586.844, 276.6540, -43.10275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1578.671, 274.2467, -43.10270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1562.308, 257.0070, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1558.667, 246.7306, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1559.340, 229.6207, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1562.744, 222.9461, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1578.147, 207.4494, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1586.199, 204.7502, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1604.896, 204.7057, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1611.628, 206.9705, -43.10268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1628.336, 223.2480, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1631.788, 229.7821, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1632.781, 236.3841, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1630.619, 237.2160, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1607.801, 239.1756, -52.15918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1606.174, 237.9438, -52.15471, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1604.563, 233.8241, -52.14586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1602.063, 231.8929, -52.15122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1596.986, 231.8843, -52.15088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1596.206, 221.5799, -57.16178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1606.623, 223.4710, -62.11187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CYNDIA, (@POINT := @POINT + 1), 1609.261, 223.3245, -61.90321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

SET @ANYA := 36225; -- Dark Ranger Anya
-- ----------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @ANYA);
SET @POINT := 0;
UPDATE creature SET MovementType = 2 WHERE id = @ANYA;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @ANYA;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@ANYA, (@POINT := @POINT + 1), 1403.924, 122.0021, -62.29600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1403.861, 125.2423, -62.27325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1405.325, 127.1650, -62.26875, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1426.191, 154.1230, -62.28469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1427.121, 155.6431, -62.28401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1431.452, 165.7858, -62.27488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1434.476, 167.2110, -62.26622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1442.106, 155.5110, -57.15324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1443.467, 154.7457, -57.15303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1458.042, 161.8466, -50.94152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1473.620, 171.0510, -57.15204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1473.786, 174.2765, -57.15204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1469.005, 183.0757, -62.18350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1469.258, 185.4509, -62.18411, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1472.276, 187.6451, -62.18668, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1477.591, 188.1393, -62.19527, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1480.276, 187.1101, -62.19846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1481.359, 185.9169, -62.19843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1486.357, 184.4406, -62.18407, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1489.255, 187.5985, -62.17602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1490.054, 195.6768, -62.16550, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1490.643, 198.2233, -62.16230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1491.724, 199.4280, -62.15359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1506.335, 175.3599, -62.15884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1518.162, 159.0233, -62.16648, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1541.176, 141.8635, -62.16800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1542.285, 139.7458, -62.16848, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1541.043, 137.0827, -62.16963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1535.092, 126.9977, -61.52202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1536.230, 123.4622, -61.50837, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1544.681, 113.2477, -62.14553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1547.049, 111.8176, -62.14442, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1581.209, 104.5857, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1583.091, 105.6061, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1593.626, 126.2137, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1594.315, 130.5811, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1594.488, 165.4759, -62.17780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1591.848, 169.0581, -62.17778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1559.896, 187.3829, -62.18196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1557.058, 191.5276, -62.18295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1555.870, 199.8094, -60.77612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1556.872, 201.8134, -60.77697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1565.772, 211.0227, -60.69686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1579.981, 224.1431, -61.90995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1582.291, 224.2461, -61.91358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1584.610, 223.5555, -62.09014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1592.897, 220.5184, -57.16179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1594.658, 221.1280, -57.16177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1595.533, 230.7600, -52.15380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1593.387, 232.0359, -52.15043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1588.193, 232.2730, -52.14523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1586.658, 233.8912, -52.14595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1586.203, 245.9066, -52.15466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1589.372, 248.5877, -52.15392, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1601.850, 248.9071, -52.14719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1604.069, 246.4827, -52.15307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1606.339, 242.3287, -52.15508, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1607.957, 240.8379, -52.15958, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1629.973, 239.2152, -43.10269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1632.032, 236.4269, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1629.101, 223.9509, -43.10271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1612.131, 206.9309, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1609.539, 205.5861, -43.10269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1597.743, 203.6275, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1594.194, 203.8103, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1582.785, 205.5456, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1578.919, 207.3404, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1562.383, 223.9282, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1560.665, 227.6953, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1559.218, 236.0390, -43.10272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1561.987, 239.8349, -43.17978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1567.898, 240.1943, -44.16556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1583.315, 240.6951, -52.15242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1584.639, 242.7373, -52.15159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1585.509, 247.5295, -52.15097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1587.016, 248.8708, -52.14977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1594.048, 249.3781, -52.15096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1595.588, 250.3003, -52.15757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1596.237, 258.3997, -57.16174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1595.332, 259.6997, -57.16173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1583.506, 256.2311, -62.11309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1581.180, 256.7343, -61.90614, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1565.844, 270.0585, -60.69878, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1554.069, 279.5327, -60.77398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1550.043, 280.6547, -60.79443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1545.798, 278.7816, -62.18080, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1521.743, 246.2183, -62.17794, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1463.974, 233.8326, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1462.324, 230.5938, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1461.742, 216.1824, -62.17767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1464.133, 199.7708, -62.17709, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1467.824, 183.4344, -62.18254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1472.803, 173.5824, -57.15204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1472.375, 170.3603, -57.01591, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1460.744, 164.0948, -51.05494, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1445.551, 153.7872, -57.15263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1444.820, 150.5520, -57.15324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1449.093, 141.9922, -62.27794, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1447.065, 138.7384, -62.30164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1425.409, 134.6217, -62.29261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1423.454, 133.4190, -62.29228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1422.167, 131.2488, -62.29167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1412.971, 94.48728, -62.28593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1412.178, 68.96647, -62.27882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1410.143, 66.97049, -62.27882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1405.900, 66.30279, -62.27882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1391.262, 67.51823, -62.27888, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1387.450, 65.16596, -62.27829, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1379.324, 50.87375, -62.27672, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1379.427, 48.54769, -62.27669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1408.113, 26.90218, -62.27708, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1409.994, 26.57997, -62.27705, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1412.155, 26.69325, -62.27715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1434.355, 33.64345, -62.27644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1438.174, 36.53374, -62.27723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1439.616, 38.71452, -62.27779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1446.229, 64.73573, -62.28231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1445.816, 67.92562, -62.28153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1444.844, 70.15820, -62.28072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1418.580, 101.1985, -62.28775, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@ANYA, (@POINT := @POINT + 1), 1404.943, 119.9008, -62.29526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- signboards in "The Library" Irongorge -- rotation update 
-- Roc Talon 
UPDATE gameobject SET rotation0 = 0.607692, rotation1 = -0.361538, rotation2 = 0.607693, rotation3 = 0.361539 WHERE guid = 5398;
-- The Skull of Tyrannistrasz
UPDATE gameobject SET orientation = 1.5708, rotation0 = 0.147016, rotation1 = -0.691655, rotation2 = 0.147016, rotation3 = 0.691655 WHERE guid = 5425;
-- Fossilized Egg
UPDATE gameobject SET orientation = 2.21004, rotation0 = 0.607692, rotation1 = -0.361538, rotation2 = 0.607693, rotation3 = 0.361539 WHERE guid = 5405;
-- Toothgnasher's Skeleton
UPDATE gameobject SET orientation = 4.71239, rotation0 = 0.61994, rotation1 = -0.340111, rotation2 = 0.619939, rotation3 = 0.34011 WHERE guid = 5382;
-- Horde Catapult
UPDATE gameobject SET orientation = -0.521631, rotation0 = 0.309975, rotation1 = -0.635543, rotation2 = 0.309974, rotation3 = 0.635543 WHERE guid = 5205;
-- Uldaman Reliefs
UPDATE gameobject SET orientation = 2.30151, rotation0 = 0.681389, rotation1 = -0.188966, rotation2 = 0.68139, rotation3 = 0.188967 WHERE guid = 5141;
-- Mog'gok 
SET @MOGGOK := 18475;
-- ----------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @MOGGOK);
SET @POINT := 0;
UPDATE creature SET MovementType = 2 WHERE id = @MOGGOK;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @MOGGOK;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, spell, orientation, model1, model2) VALUES
(@MOGGOK, (@POINT := @POINT + 1), -3536.68,5787.4,-6.59531, 0, 0, 0,3.33926, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3562.41,5785.56,-2.00246, 0, 0, 0,2.9819, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3580.61,5788.38,-3.69901, 13000, 1847501, 0,2.98583, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3589.24,5790.31,-4.90877, 0, 0, 0,2.62454, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3609.38,5803.49,-4.02221, 0, 0, 0,2.05906, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3615.74,5820.5,-4.67745, 0, 0, 0,2.00801, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3622.37,5834.25,0.294291, 0, 0, 0,2.16116, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3637.95,5850.92,-0.542909, 0, 0, 0,2.03157, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3646.58,5872.23,-6.128, 0, 0, 0,1.32864, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3636.95,5912.25,-23.4443, 0, 0, 0,1.70563, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3640.31,5927.94,-30.2711, 0, 0, 0,1.70563, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3640.04,5947.71,-31.4042, 0, 0, 0,1.45666, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3638.97,5958.55,-27.3119, 0, 0, 0,0.577796, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3627.43,5980.86,-20.8827, 0, 0, 0,0.994843, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3622.81,5987.12,-20.286, 0, 0, 0,6.27665, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3611.57,5987.58,-25.0752, 0, 0, 0,5.66011, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3604.92,5981.8,-29.6902, 0, 0, 0,0.040585, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3599.89,5982.2,-30.8126, 0, 0, 0,0.040585, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3556.21,5996.2,-34.9259, 0, 0, 0,0.727808, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3546.77,6008.55,-32.8145, 0, 0, 0,0.727808, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3526.8,6046.15,-21.48, 0, 0, 0,0.771006, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3507.05,6060.53,-15.6156, 0, 0, 0,0.0178065, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3501.47,6061.66,-15.4096, 0, 0, 0,6.08108, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3485.31,6060.18,-18.0959, 0, 0, 0,6.19244, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3455.85,6050.59,-12.3859, 0, 0, 0,4.95545, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3452.47,6033.86,-14.0961, 0, 0, 0,4.76774, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3449.56,6010.21,-18.4125, 0, 0, 0,5.0709, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3440.77,5986.13,-24.7572, 0, 0, 0,5.05363, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3434.65,5972.64,-24.643, 0, 0, 0,4.61302, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3435.52,5950.69,-25.7819, 0, 0, 0,4.09466, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3448.67,5923.3,-33.8689, 0, 0, 0,4.30043, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3454.38,5908.85,-32.9945, 0, 0, 0,4.00119, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3467.35,5894.72,-29.4213, 0, 0, 0,4.13935, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3486.01,5866.78,-23.0018, 0, 0, 0,4.19698, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3496.11,5848.12,-15.6849, 0, 0, 0,4.25986, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3503.11,5830.48,-14.2908, 0, 0, 0,4.30306, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3508.39,5818.03,-12.4956, 0, 0, 0,4.01325, 0, 0),
(@MOGGOK, (@POINT := @POINT + 1), -3516.37,5805.25,-9.1044, 0, 0, 0,4.15854, 0, 0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1847501; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1847501,3,0,0,0,0,0,0,2000000392,0,0,0,0,0,0,0,''),
(1847501,7,0,0,0,0,0,0,2000000393,0,0,0,0,0,0,0,''),
(1847501,11,0,0,0,0,0,0,2000000394,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000392 AND 2000000394;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES 
(2000000392,'Come out, little birdies! Mug\'gok want to play!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,15,NULL),
(2000000393,'No hurt Mug\'gok\'s feelings, bird-men!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,11,NULL),
(2000000394,'Fine! Birdies be dat way! Mug\'gok find new friends!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,14,NULL);
-- Veil Lithic Preemptive Strike(q.10861)
-- Malevolent Hatchling & Redeemet Hatchling are spawned only from 'Cursed Egg'
DELETE FROM creature WHERE id IN (22337,22339); 
-- 38854,38865 - scripts for non-existed in DB spells 
DELETE FROM dbscripts_on_go_template_use WHERE id IN (185208,185212);
INSERT INTO dbscripts_on_go_template_use (id, command, datalong, datalong2, comments) VALUES 
(185208, 10, 22339,4000, 'summon Redeemet Hatchling '),
(185212, 10, 22337,0, 'summon Malevolent Hatchling ');
-- missing 'Lithic Talonguard' - added (reused empty guid)
DELETE FROM creature WHERE guid = 32072;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(32072,22388,530,1,1,0,0,-3673.55,5844.84,-0.737886,4.87915,25,5,0,5600,0,0,1);
-- missing 'Cursed Eggs' and [PH]Arakkoa Egg - added  (reused empty guids)
DELETE FROM gameobject WHERE guid IN (35829,39912,39913,39914,39915,39916,39917,39918,39919,39920,65109,65144,65155,65161,65185,65190,65203,65208,65211,65213,65223,65225,65226,65227,65233,65234,65243);
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES 
( 35829, 185210, 530, 1,1,-3639.31, 5831.26, 0.073366, 2.80403, 0, 0, 0.98579, 0.167983, 181, 100, 1),
( 39912, 185210, 530, 1,1,-3560.05, 5771.58, -3.12615, 2.80403, 0, 0, 0.98579, 0.167983, 181, 100, 1),
( 39913, 185208, 530, 1,1,-3678.81, 5733.75, -1.00285, 1.38717, 0, 0, 0.639297, 0.76896, 180, 255, 1),
( 39914, 185210, 530, 1,1,-3568.52, 5772.15, -2.89509, 0.0183539, 0, 0, 0.00917684, 0.999958, 181, 100, 1),
( 39915, 185212, 530, 1,1,-3550.83, 5709.17, 0.0639097, 4.87525, 0, 0, 0.647248, -0.762279, 181, 100, 1), 
( 39916, 185211, 530, 1,1,-3550.83, 5709.17, 0.0639097, 4.87525, 0, 0, 0.647248, -0.762279, 180, 255, 1),
( 39917, 185210, 530, 1,1,-3550.83, 5709.17, 0.0639097, 4.87525, 0, 0, 0.647248, -0.762279, 181, 100, 1),
( 39918, 185211, 530, 1,1,-3579.21, 5817.7, -3.22469, 0.0686128, 0, 0, 0.0342997, 0.999412, 180, 255, 1),
( 39919, 185208, 530, 1,1,-3579.21, 5817.7, -3.22469, 0.0686128, 0, 0, 0.0342997, 0.999412, 180, 255, 1),
( 39920, 185212, 530, 1,1,-3579.21, 5817.7, -3.22469, 0.0686128, 0, 0, 0.0342997, 0.999412, 181, 100, 1), 
( 65109, 185210, 530, 1,1,-3660.14, 5811.17, 0.0294594, 1.3763, 0, 0, 0.635109, 0.772423, 181, 100, 1),
( 65144, 185211, 530, 1,1,-3663.97, 5836.82, 0.0927558, 5.25617, 0, 0, 0.491236, -0.871026, 180, 255, 1),
( 65155, 185212, 530, 1,1,-3663.97, 5836.82, 0.0927558, 5.25617, 0, 0, 0.491236, -0.871026, 181, 100, 1), 
( 65161, 185208, 530, 1,1,-3663.97, 5836.82, 0.0927558, 5.25617, 0, 0, 0.491236, -0.871026, 180, 255, 1),
( 65185, 185208, 530, 1,1,-3680.77, 5833.66, 0.544681, 0.131452, 0, 0, 0.0656785, 0.997841, 180, 255, 1),
( 65190, 185211, 530, 1,1,-3680.77, 5833.66, 0.544681, 0.131452, 0, 0, 0.0656785, 0.997841, 180, 255, 1),
( 65203, 185212, 530, 1,1,-3680.77, 5833.66, 0.544681, 0.131452, 0, 0, 0.0656785, 0.997841, 181, 100, 1), 
( 65208, 185212, 530, 1,1,-3692.66, 5728.5, -0.873235, 5.58603, 0, 0, 0.341562, -0.939859, 181, 100, 1), 
( 65211, 185211, 530, 1,1,-3692.66, 5728.5, -0.873235, 5.58603, 0, 0, 0.341562, -0.939859, 25, 255, 1),
( 65213, 185210, 530, 1,1,-3692.66, 5728.5, -0.873235, 5.58603, 0, 0, 0.341562, -0.939859, 181, 100, 1),
( 65223, 185210, 530, 1,1,-3669.96, 5715.69, -0.991985, 4.10948, 0, 0, 0.885168, -0.465272, 181, 100, 1),
( 65225, 185211, 530, 1,1,-3669.96, 5715.69, -0.991985, 4.10948, 0, 0, 0.885168, -0.465272, 180, 255, 1),
( 65226, 185212, 530, 1,1,-3669.96, 5715.69, -0.991985, 4.10948, 0, 0, 0.885168, -0.465272, 181, 100, 1), 
( 65227, 185212, 530, 1,1,-3620.63, 5759.64, 1.70168, 2.01246, 0, 0, 0.844822, 0.535048, 181, 100, 1), 
( 65233, 185211, 530, 1,1,-3620.63, 5759.64, 1.70168, 2.01246, 0, 0, 0.844822, 0.535048, 180, 255, 1),
( 65234, 185210, 530, 1,1,-3620.63, 5759.64, 1.70168, 2.01246, 0, 0, 0.844822, 0.535048, 181, 100, 1),
( 65243, 185208, 530, 1,1,-3620.63, 5759.64, 1.70168, 2.01246, 0, 0, 0.844822, 0.535048, 180, 255, 1);
-- Cursed Eggs - pools
DELETE FROM pool_template WHERE entry BETWEEN 25456 AND 25467;
INSERT INTO pool_template (entry, max_limit, description) VALUES 
(25456,1,'Veil Lithic - Cursed Eggs - Pool 1'),
(25457,1,'Veil Lithic - Cursed Eggs - Pool 2'),
(25458,1,'Veil Lithic - Cursed Eggs - Pool 3'),
(25459,1,'Veil Lithic - Cursed Eggs - Pool 4'),
(25460,1,'Veil Lithic - Cursed Eggs - Pool 5'),
(25461,1,'Veil Lithic - Cursed Eggs - Pool 6'),
(25462,1,'Veil Lithic - Cursed Eggs - Pool 7'),
(25463,1,'Veil Lithic - Cursed Eggs - Pool 8'),
(25464,1,'Veil Lithic - Cursed Eggs - Pool 9'),
(25465,1,'Veil Lithic - Cursed Eggs - Pool 10'),
(25466,1,'Veil Lithic - Cursed Eggs - Pool 11'),
(25467,1,'Veil Lithic - Cursed Eggs - Pool 12');
-- only one can be spawned
DELETE FROM pool_gameobject WHERE guid IN (35829,39912,31661,39914,31666,39916,39917,39918,26095,26093,65109,65144,26094,31662,31667,65190,26097,26096,65211,65213,65223,65225,65233,65234);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES 
(65190,25456,0,'185211 - Cursed Egg #1'),
(31661,25456,0,'185210 - Cursed Egg #2'),
(65144,25457,0,'185211 - Cursed Egg #3'),
(31666,25457,0,'185210 - Cursed Egg #4'),
(26095,25458,0,'185211 - Cursed Egg #5'),
(35829,25458,0,'185210 - Cursed Egg #6'),
(26093,25459,0,'185211 - Cursed Egg #7'),
(65109,25459,0,'185210 - Cursed Egg #8'),
(26094,25460,0,'185211 - Cursed Egg #9'),
(31662,25460,0,'185210 - Cursed Egg #10'),
(65211,25461,0,'185211 - Cursed Egg #11'),
(65213,25461,0,'185210 - Cursed Egg #12'),
(65225,25462,0,'185211 - Cursed Egg #13'),
(65223,25462,0,'185210 - Cursed Egg #14'),
(65233,25463,0,'185211 - Cursed Egg #15'),
(65234,25463,0,'185210 - Cursed Egg #16'),
(39918,25464,0,'185211 - Cursed Egg #17'),
(31667,25464,0,'185210 - Cursed Egg #18'),
(26097,25465,0,'185211 - Cursed Egg #19'),
(39912,25465,0,'185210 - Cursed Egg #20'),
(26096,25466,0,'185211 - Cursed Egg #21'),
(39914,25466,0,'185210 - Cursed Egg #22'),
(39916,25467,0,'185211 - Cursed Egg #23'),
(39917,25467,0,'185210 - Cursed Egg #24');
-- link to Arthas the spawned scourge for burning city escort
DELETE FROM creature_linking_template WHERE entry IN (27729,27731,27732,27734,27736,28199,28200,28201,28249,27737);
INSERT INTO creature_linking_template (entry, map, master_entry, flag, search_range) VALUES
(27729, 595, 26499, 8208, 0),
(27731, 595, 26499, 8208, 0),
(27732, 595, 26499, 8208, 0),
(27734, 595, 26499, 8208, 0),
(27736, 595, 26499, 8208, 0),
(28199, 595, 26499, 8208, 0),
(28200, 595, 26499, 8208, 0),
(28201, 595, 26499, 8208, 0),
(28249, 595, 26499, 8208, 0),
(27737, 595, 26499, 8208, 0);
-- achiev crit
DELETE FROM achievement_criteria_requirement WHERE criteria_id=7494 AND TYPE=11;
-- Roetten Stonehammer <Reclaimers Inc.>
SET @STONEHAMMER := 5637;
-- ----------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @STONEHAMMER);
SET @POINT := 0;
UPDATE creature SET position_x = -4681.394, position_y = -1266.606, position_z = 503.4648, orientation = 1.963985, MovementType = 2 WHERE id = @STONEHAMMER;
DELETE FROM creature_movement WHERE id=@GUID;
DELETE FROM creature_movement_template WHERE entry=@STONEHAMMER;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@STONEHAMMER, (@POINT := @POINT + 1), -4686.149, -1255.140, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4675.921, -1244.380, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4667.503, -1245.781, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4661.595, -1250.517, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4661.595, -1250.517, 503.3816, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.356194, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4670.109, -1243.077, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4681.147, -1244.796, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4686.531, -1252.014, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4685.416, -1262.677, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4681.394, -1266.606, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@STONEHAMMER, (@POINT := @POINT + 1), -4681.394, -1266.606, 503.3816, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.605703, 0, 0);
-- Curator Thorius
SET @THORIUS := 8256;
DELETE FROM db_script_string WHERE entry = 2000005000;
-- -------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @THORIUS);
SET @NAME := (SELECT NAME FROM creature_template WHERE entry = @THORIUS);
SET @POINT := 0;
UPDATE creature SET position_x = -4652.276, position_y = -1278.877, position_z = 503.4648, orientation = 0.7819276, MovementType = 2 WHERE id = @THORIUS;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @THORIUS;
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 825601 AND 825603;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000395 AND 2000000397;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@THORIUS, (@POINT := @POINT + 1), -4646.738, -1273.377, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4643.056, -1269.847, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4638.852, -1265.486, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4633.741, -1261.104, 503.3824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4629.312, -1256.385, 503.3824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4623.375, -1256.475, 503.3830, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4622.471, -1258.746, 503.3833, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4622.471, -1258.746, 503.3833, 4500, 825601, 0, 0, 0, 0, 0, 0, 0, 0, 4.066617, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4615.686, -1255.442, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4608.177, -1249.271, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4603.862, -1251.563, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4603.862, -1251.563, 503.3816, 4500, 825602, 0, 0, 0, 0, 0, 0, 0, 0, 0.3316126, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4598.436, -1240.892, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4592.448, -1232.214, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4588.735, -1222.179, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4588.735, -1222.179, 503.3816, 4500, 825603, 0, 0, 0, 0, 0, 0, 0, 0, 5.742133, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4593.644, -1214.160, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4598.711, -1219.354, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4604.790, -1227.240, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4610.729, -1236.657, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4613.158, -1252.017, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4618.215, -1264.094, 503.3841, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4633.393, -1276.797, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4652.419, -1285.877, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4667.360, -1293.999, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4678.205, -1296.404, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4689.225, -1301.691, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4699.487, -1307.610, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4709.615, -1317.365, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4711.283, -1322.386, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4711.283, -1322.386, 503.3816, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.577925, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4702.810, -1325.272, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4696.292, -1325.815, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4689.635, -1325.204, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4686.068, -1319.191, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4683.053, -1314.015, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4675.000, -1312.604, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4664.885, -1306.134, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4662.038, -1298.117, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4659.426, -1288.833, 503.3816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THORIUS, (@POINT := @POINT + 1), -4654.313, -1281.536, 503.3816, 75000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.959392, 0, 0);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(825601, 2, 0, 0, 0, 0, 0, 0, 2000000395, 0, 0, 0, 0, 0, 0, 0, (CONCAT(@NAME,'  - Say 1'))),
(825602, 2, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (CONCAT(@NAME,'  - Emote 1'))),
(825602, 2, 0, 0, 0, 0, 0, 0, 2000000396, 0, 0, 0, 0, 0, 0, 0, (CONCAT(@NAME,'  - Say 2'))),
(825602, 4.5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (CONCAT(@NAME,'  - Emote 1 (Stop)'))),
(825603, 2, 0, 0, 0, 0, 0, 0, 2000000397, 0, 0, 0, 0, 0, 0, 0, (CONCAT(@NAME,'  - Say 3')));
INSERT INTO db_script_string (entry, content_default, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000395,'%s dusts the base of the artifact.', 0, 2, 0, 16, (CONCAT(@NAME,'  - Say 1'))),
(2000000396,'%s meticulously examines the large vase.', 0, 2, 0, 0, (CONCAT(@NAME,'  - Say 2'))),
(2000000397,'Poor Dorius. If I ever get my hands on those Dark Irons, so help me...', 2929, 0, 0, 36, (CONCAT(@NAME,'  - Say 3')));
-- Bimble Longberry 
SET @LONGBERRY := 7978;
-- ----------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @LONGBERRY);
SET @POINT := 0;
UPDATE creature SET position_x = -4715.607, position_y = -925.8232, position_z = 501.7426, orientation = 1.179421, MovementType = 2 WHERE id = @LONGBERRY;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @LONGBERRY;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@LONGBERRY, (@POINT := @POINT + 1), -4707.845, -907.0120, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4688.098, -902.9882, 501.6476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4671.588, -914.5618, 501.6541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4655.948, -931.1495, 501.6580, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4636.642, -954.9941, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4621.530, -981.5043, 501.6564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4617.623, -1000.404, 501.6645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4626.838, -1012.120, 501.6519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4641.676, -1014.932, 501.6477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4657.655, -997.7007, 501.6358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4667.463, -983.3502, 501.6441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4681.746, -969.3637, 501.6945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4689.473, -949.4840, 501.6629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4699.370, -937.9786, 501.6703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@LONGBERRY, (@POINT := @POINT + 1), -4711.072, -923.4749, 501.6572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- John Turner
SET @TURNER := 6175;
-- -------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @TURNER);
SET @NAME := (SELECT NAME FROM creature_template WHERE entry = @TURNER);
SET @POINT := 0;
UPDATE creature SET position_x = -4895.609, position_y = -898.0984, position_z = 501.7426, orientation = 2.286381, MovementType = 2 WHERE id = @TURNER;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @TURNER;
DELETE FROM dbscripts_on_creature_movement WHERE id = 617501;
DELETE FROM db_script_string WHERE entry BETWEEN 2000000398 AND 2000000401;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@TURNER, (@POINT := @POINT + 1), -4895.609, -898.0984, 501.6593, 4000, 617501, 0, 0, 0, 0, 0, 0, 0, 0, 2.286381, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4859.858, -887.9218, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4842.476, -885.5647, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4842.476, -885.5647, 501.6594, 0000, 617501, 0, 0, 0, 0, 0, 0, 0, 0, 1.884956, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4875.518, -889.0638, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4895.693, -897.8222, 501.6593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4895.693, -897.8222, 501.6593, 4000, 617501, 0, 0, 0, 0, 0, 0, 0, 0, 2.251475, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4927.132, -915.4280, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4951.839, -934.9794, 501.6593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4981.382, -966.5792, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4983.741, -969.7697, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4983.741, -969.7697, 501.6595, 4000, 617501, 0, 0, 0, 0, 0, 0, 0, 0, 2.443461, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -5002.574, -1008.675, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -5007.885, -1022.321, 501.6549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -5012.979, -1052.933, 501.7099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -5012.979, -1052.933, 501.7099, 4000, 617501, 0, 0, 0, 0, 0, 0, 0, 0, 2.967060, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -5006.932, -1021.700, 501.6555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4992.735, -985.8944, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4981.066, -962.5291, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4944.819, -930.4164, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4906.594, -901.6618, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@TURNER, (@POINT := @POINT + 1), -4895.609, -898.0984, 501.6593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(617501, 0, 0, 0, 0, 0, 0, 0, 2000000398, 2000000399, 2000000400, 2000000401, 0, 0, 0, 0, (CONCAT(@NAME,'  - Say 1, 2, 3 or 4')));
INSERT INTO db_script_string (entry, content_default, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000398,'Give to the charities who seek to help the victims of these hard times! Please.', 0, 0, 0, 0, (CONCAT(@NAME,'  - Say 1'))),
(2000000399,'Don\'t forget the orphans of Stormwind!', 0, 0, 0, 0, (CONCAT(@NAME,'  - Say 2'))),
(2000000400,'Give of your hearts and your purses! Give to the children of Stormwind who have lost their parents.', 0, 0, 0, 0, (CONCAT(@NAME,'  - Say 3'))),
(2000000401,'Help the children of Stormwind... victims of the war and plague!', 0, 0, 0, 0, (CONCAT(@NAME,'  - Say 4')));
-- Golorn Frostbeard
SET @FROSTBEARD := 1692;
-- -------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @FROSTBEARD);
SET @NAME := (SELECT NAME FROM creature_template WHERE entry = @FROSTBEARD);
SET @POINT := 0;
UPDATE creature SET position_x = -5633.440, position_y = -496.4770, position_z = 396.8753, orientation = 2.539195, MovementType = 2 WHERE id = @FROSTBEARD;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @FROSTBEARD;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@FROSTBEARD, (@POINT := @POINT + 1), -5636.061, -495.8329, 396.7780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FROSTBEARD, (@POINT := @POINT + 1), -5641.399, -498.8961, 396.7780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FROSTBEARD, (@POINT := @POINT + 1), -5640.832, -501.3918, 396.7937, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.936115, 0, 0),
(@FROSTBEARD, (@POINT := @POINT + 1), -5641.399, -498.8961, 396.7780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FROSTBEARD, (@POINT := @POINT + 1), -5640.068, -496.7379, 396.7780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FROSTBEARD, (@POINT := @POINT + 1), -5636.061, -495.8329, 396.7780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FROSTBEARD, (@POINT := @POINT + 1), -5633.440, -496.4770, 396.7780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FROSTBEARD, (@POINT := @POINT + 1), -5633.440, -496.4770, 396.7780, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.199115, 0, 0);
 -- Ironforge Guard -- UPDATE 
SET @GUID := 57;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -4992.175, position_y = -1155.4130, position_z = 501.7427, orientation = 3.96066, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -5007.487, -1171.793, 501.6597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5008.707, -1185.934, 501.6618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4998.198, -1206.620, 501.6775, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4984.833, -1224.770, 501.6792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4963.304, -1244.974, 501.6728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4941.089, -1251.620, 501.6482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4927.949, -1242.192, 501.6396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4928.527, -1229.495, 501.6493, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4943.524, -1216.123, 501.6482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4952.011, -1195.801, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4965.607, -1189.141, 501.6592, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4981.276, -1171.385, 501.6539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4992.600, -1155.349, 501.6561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Sognar Cliffbeard  -- UPDATE 
SET @CLIFFBEARD := 5124;
-- -------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @CLIFFBEARD);
SET @NAME := (SELECT NAME FROM creature_template WHERE entry = @CLIFFBEARD);
SET @POINT := 0;
UPDATE creature SET position_x = -5002.887, position_y = -1160.7340, position_z = 501.7427, orientation = 3.433445, MovementType = 2 WHERE id = @CLIFFBEARD;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @CLIFFBEARD;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@CLIFFBEARD, (@POINT := @POINT + 1), -5014.963, -1164.3620, 501.6634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -5017.406, -1177.7400, 501.6543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -5006.694, -1195.8610, 501.6673, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4991.032, -1215.0220, 501.6773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4976.490, -1233.4380, 501.6785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4963.135, -1249.5380, 501.6708, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4950.890, -1261.2130, 501.6667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4932.905, -1258.3310, 501.6477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4925.248, -1245.3570, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4926.883, -1234.4750, 501.6547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4941.878, -1220.3930, 501.6520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4947.642, -1205.3560, 501.6685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4957.721, -1193.1830, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4974.970, -1183.9740, 501.6564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -4983.421, -1169.0440, 501.6555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@CLIFFBEARD, (@POINT := @POINT + 1), -5002.725, -1160.7740, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
 -- Ironforge Guard  -- UPDATE 
SET @GUID := 97;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -4883.044, position_y = -1115.5980, position_z = 502.2956, orientation = 3.167327, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4894.075, -1115.8820, 501.7928, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4906.619, -1118.9820, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4917.980, -1125.1810, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4921.549, -1132.5180, 501.6068, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4923.342, -1144.4310, 501.4421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4928.308, -1159.0010, 501.4994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4932.610, -1173.3460, 501.6097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4938.115, -1183.5250, 501.7061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4948.813, -1191.5090, 501.6595, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.78266300, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4938.763, -1183.0540, 501.7118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4932.521, -1170.7710, 501.5935, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4928.323, -1153.0580, 501.4631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4925.346, -1140.7550, 501.3722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4922.706, -1131.4410, 501.6305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4913.503, -1121.0990, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4900.859, -1117.3100, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4883.246, -1115.6400, 502.1969, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.09456634, 0, 0);
 -- Ironforge Guard  -- UPDATE
SET @GUID := 1889;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -4721.123, position_y = -1265.5990, position_z = 501.7427, orientation = 0.7560951, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4708.459, -1253.6560, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4698.779, -1235.5510, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4685.847, -1223.8760, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4669.440, -1218.9460, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4655.979, -1205.6970, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4667.163, -1192.6480, 501.6588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4679.893, -1193.8490, 501.6585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4695.925, -1199.8700, 501.6584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4712.359, -1205.4420, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4720.557, -1213.5260, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4733.086, -1230.5010, 501.6559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4738.724, -1248.3250, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4732.381, -1261.1520, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4721.185, -1265.5250, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
 -- Ironforge Guard
SET @GUID := 121;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -4986.547, position_y = -963.8156, position_z = 501.7427, orientation = 5.707227, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4986.600, -963.4806, 501.6595, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.637167, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4997.777, -956.2134, 501.6609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5011.686, -939.2016, 501.6596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5011.280, -923.0540, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4982.625, -898.7230, 501.6041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4979.974, -889.4788, 501.6265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4979.974, -889.4788, 501.6265, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.303835, 0, 0), 
(@GUID, (@POINT := @POINT + 1), -4981.966, -898.9245, 501.6014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5007.113, -919.8450, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5013.242, -937.7985, 501.6597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5000.367, -953.1014, 501.6611, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
 -- Ironforge Guard
SET @GUID := 134;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -4902.161, position_y = -895.6193, position_z = 501.7426, orientation = 5.235988, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4902.170, -895.5770, 501.6594, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.122505, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4908.303, -879.5649, 501.6605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4921.320, -862.3778, 501.6606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4932.795, -858.5505, 501.6626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4963.470, -883.8062, 501.6003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4973.356, -884.4930, 501.6224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4973.356, -884.4930, 501.6224, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.199115, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4964.546, -881.7691, 501.6193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4940.618, -860.9469, 501.6613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4923.315, -864.1235, 501.6606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4908.667, -880.6354, 501.6605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
 -- Ironforge Guard
SET @GUID := 1748;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -4958.850, position_y = -997.5289, position_z = 501.5721, orientation = 0.9778681, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4942.368, -973.0673, 501.5523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4922.720, -954.7523, 501.5698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4896.282, -936.7808, 501.4918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4872.001, -926.0280, 501.5149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4872.001, -926.0280, 501.5149, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.5953780, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4905.076, -941.8298, 501.5605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4929.299, -961.5024, 501.5698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4958.948, -997.8889, 501.4812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4958.948, -997.8889, 501.4812, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.9773844, 0, 0);
-- Ironforge Guard
SET @GUID := 1759;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -4771.914, position_y = -1021.364, position_z = 502.2956, orientation = 1.193777, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4767.071, -1009.134, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4759.091, -994.4371, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4746.498, -986.7278, 501.5323, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4727.245, -986.3358, 501.4722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4709.644, -986.9350, 501.6451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4696.713, -982.7900, 501.6962, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4686.291, -974.5480, 501.6554, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.6690948, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4701.526, -986.7450, 501.6711, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4718.943, -986.9548, 501.5041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4743.440, -985.0746, 501.4334, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4759.754, -995.0007, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4765.604, -1007.700, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4771.829, -1021.206, 502.2123, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.2805010, 0, 0);
-- Ironforge Guard
SET @GUID := 1760;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -4635.689, position_y = -997.4887, position_z = 501.7427, orientation = 0.9016399, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4621.842, -979.9805, 501.6565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4632.920, -958.1653, 501.6589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4645.341, -941.0410, 501.6577, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4660.012, -925.5549, 501.6573, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4687.626, -903.8880, 501.6717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4703.024, -913.8218, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4707.872, -930.5532, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4697.937, -943.9158, 501.6703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4687.489, -966.4830, 501.6829, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4672.090, -983.1004, 501.6840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4654.317, -995.6335, 501.6393, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4635.397, -998.0302, 501.6534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Ironforge Guard
SET @GUID := 105;
-- -------------------------------------
SET @POINT := 0;
UPDATE creature SET position_x = -5003.920, position_y = -1117.3320, position_z = 501.7582, orientation = 0.7226949, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4997.035, -1111.260, 501.6703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4994.561, -1083.678, 498.8325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4991.824, -1055.735, 497.9429, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4986.590, -1034.179, 501.6517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4972.985, -994.6423, 501.6516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4954.183, -966.5741, 501.6577, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4931.063, -943.3762, 501.6425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4896.667, -918.9849, 501.6267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4859.071, -906.0353, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4827.863, -903.4857, 501.6598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4805.999, -905.0009, 497.9457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4778.714, -906.3766, 500.0083, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4766.738, -906.0627, 501.6277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4753.256, -910.0827, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4747.038, -905.0212, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4748.268, -895.6587, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4773.682, -886.5223, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4799.893, -879.7461, 501.6700, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4830.926, -880.5823, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4859.374, -884.3204, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4900.400, -897.6807, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4928.519, -913.5782, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4964.312, -943.6036, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4982.343, -966.8148, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4995.402, -992.4957, 501.6619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5006.113, -1016.344, 501.6579, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5010.339, -1035.028, 501.6559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5016.313, -1067.132, 501.7428, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5017.297, -1096.132, 501.6779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5014.159, -1111.454, 501.6730, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5004.407, -1115.416, 501.6730, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Protector Dorana
SET @DORANA := 869;
-- -------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @DORANA);
SET @NAME := (SELECT NAME FROM creature_template WHERE entry = @DORANA);
SET @POINT := 0;
UPDATE creature SET position_x = -10657.14, position_y = 1010.878, position_z = 32.55214, orientation = 0.3832296, MovementType = 2 WHERE id = @DORANA;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @DORANA;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@DORANA, (@POINT := @POINT + 1), -10642.80, 1016.665, 31.565100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10620.20, 1000.852, 32.994370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10593.99, 987.9368, 36.877070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10564.63, 975.7330, 40.634450, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10532.88, 961.9837, 40.885220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10500.21, 952.6395, 39.459800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10466.91, 953.8127, 35.898200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10433.16, 981.9645, 34.757520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10410.51, 994.7161, 32.164260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10400.42, 992.5428, 31.579060, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10386.81, 984.0738, 31.597850, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10367.39, 980.6182, 31.472850, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10333.47, 978.7831, 31.254930, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10300.25, 965.6370, 31.253040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10285.64, 964.0901, 31.185620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10273.86, 970.6926, 31.185620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10267.59, 983.3521, 31.310620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10260.89, 989.9033, 31.377510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10233.98, 996.2642, 31.491770, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10215.86, 994.5016, 32.503140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10200.06, 989.3520, 32.933310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10190.04, 984.9003, 33.780400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10166.77, 986.7172, 34.054080, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10133.55, 990.6491, 36.048570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10116.65, 990.1268, 38.219650, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10100.18, 999.1907, 37.460870, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10116.65, 990.1268, 38.219650, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10133.55, 990.6491, 36.048570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10166.77, 986.7172, 34.054080, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10190.04, 984.9003, 33.780400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10200.06, 989.3520, 32.933310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10215.86, 994.5016, 32.503140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10233.98, 996.2642, 31.491770, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10260.89, 989.9033, 31.377510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10267.59, 983.3521, 31.310620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10273.86, 970.6926, 31.185620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10285.64, 964.0901, 31.185620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10300.25, 965.6370, 31.253040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10333.47, 978.7831, 31.254930, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10367.39, 980.6182, 31.472850, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10386.81, 984.0738, 31.597850, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10400.42, 992.5428, 31.579060, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10410.51, 994.7161, 32.164260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10433.16, 981.9645, 34.757520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10466.91, 953.8127, 35.898200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10500.21, 952.6395, 39.459800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10532.88, 961.9837, 40.885220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10564.63, 975.7330, 40.634450, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10593.99, 987.9368, 36.877070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10620.20, 1000.8520, 32.99437, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10642.80, 1016.6650, 31.56510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@DORANA, (@POINT := @POINT + 1), -10647.46, 1012.3680, 31.77653, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Protector Korelor
SET @KORELOR := 874;
-- -------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @KORELOR);
SET @NAME := (SELECT NAME FROM creature_template WHERE entry = @KORELOR);
SET @POINT := 0;
UPDATE creature SET position_x = -10632.98, position_y = 1087.872, position_z = 33.87227, orientation = 4.635367, MovementType = 2 WHERE id = @KORELOR;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @KORELOR;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@KORELOR, (@POINT := @POINT + 1), -10634.18, 1072.219, 33.90115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10640.83, 1056.614, 33.69242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10655.06, 1038.739, 33.58622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10663.54, 1029.080, 32.69010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10699.92, 1033.696, 34.47182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10719.79, 1032.385, 34.58892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10732.51, 1027.076, 34.58892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10746.82, 1018.542, 34.10905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10768.83, 1017.259, 32.24479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10793.78, 1018.650, 32.28947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10833.29, 1009.724, 32.82467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10864.48, 1006.455, 31.67381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10898.81, 999.4549, 35.70985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10919.73, 993.3299, 35.46926, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10942.45, 967.6190, 32.45774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10949.25, 940.7150, 31.55006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10946.80, 934.3032, 31.55006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10914.47, 901.5839, 32.28352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10916.35, 868.8564, 32.45573, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10926.30, 852.3051, 32.84294, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10929.21, 832.7261, 32.29058, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10919.83, 800.1399, 30.84746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10900.73, 777.5663, 30.75943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10880.35, 749.3021, 31.09746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10877.12, 732.9159, 31.10690, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10871.73, 699.8195, 30.98836, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10866.87, 665.3965, 31.03180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10871.73, 699.8195, 30.98836, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10877.12, 732.9159, 31.10690, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10880.35, 749.3021, 31.09746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10900.73, 777.5663, 30.75943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10919.83, 800.1399, 30.84746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10929.21, 832.7261, 32.29058, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10926.30, 852.3051, 32.84294, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10916.35, 868.8564, 32.45573, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10914.47, 901.5839, 32.28352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10946.80, 934.3032, 31.55006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10949.25, 940.7150, 31.55006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10942.45, 967.6190, 32.45774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10919.73, 993.3299, 35.46926, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10898.81, 999.4549, 35.70985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10864.48, 1006.455, 31.67381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10833.29, 1009.724, 32.82467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10794.01, 1018.667, 32.32072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10768.83, 1017.259, 32.24479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10746.87, 1018.548, 34.16447, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10732.51, 1027.076, 34.58892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10719.79, 1032.385, 34.58892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10699.92, 1033.696, 34.47182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10663.54, 1029.080, 32.69010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10655.06, 1038.739, 33.58622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10640.83, 1056.614, 33.69242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10634.18, 1072.219, 33.90115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@KORELOR, (@POINT := @POINT + 1), -10634.00, 1085.885, 33.74294, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Bubbly Fissure - Lushwater Oasis -- correct spawn point and rotation
UPDATE gameobject SET position_x = -1040.198, position_y = -2078.984, position_z = 50.57693, orientation = 3.13287, rotation0 = -0.1300697, rotation1 = 0.05677509, rotation2 = 0.9898081, rotation3 = 0.01176444 WHERE guid = 13380;
-- Kyle the Frenzied - Bloodhoof Village - waypoints update
UPDATE creature_movement_template SET position_x = -2324.3, position_y = -357.078, position_z = -8.96122, orientation = 4.05182 WHERE entry = 23616 AND POINT = 11;
UPDATE creature_movement_template SET position_x = -2334.89, position_y = -373.074, position_z = -8.33575, orientation = 4.17356 WHERE entry = 23616 AND POINT = 12;
-- Jenal <Ditch Digger> - gossip update
UPDATE gossip_menu_option SET action_menu_id = 1661 WHERE menu_id = 1662;
DELETE FROM gossip_menu WHERE entry = 1661; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(1661, 2314, 0, 0);
-- #####
-- ToC5 fixes
-- #####
-- delete herald (summoned based on faction)
DELETE FROM creature WHERE guid=101589;
-- delete mounts (summoned based on faction)
DELETE FROM creature WHERE guid IN (103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,
103412,103414,103423,103424,103462,103466,103467,103468,103470,103471);

-- template update
UPDATE creature_template SET UnitFlags=UnitFlags|512, NpcFlags=NpcFlags|1 WHERE entry=35004;
UPDATE creature_template SET UnitFlags=UnitFlags|256 WHERE entry=35644;

-- vehicle spells
DELETE FROM creature_template_spells WHERE entry IN (36558,36557);
INSERT INTO creature_template_spells (entry, spell1, spell2, spell3, spell4) VALUES
(36557, 68505, 62575, 68282, 62552),
(36558, 68505, 62575, 68282, 62552); -- 36558 is guesswork based on 36557
-- vehicle boarding
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (36557,36558);
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, quest_start, cast_flags) VALUES
(36557, 67830, 0, 1),
(36558, 67830, 0, 1); -- 36558 is guesswork based on 36557

-- creature addons
DELETE FROM creature_template_addon WHERE entry IN (34657,34701,34702,34703,34705,35569,35570,35571,35572,35617,35328,35331,35330,35332,
35329,35314,35326,35323,35325,35327,35644,36558);
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, auras) VALUES
(35644, 0, 0x0, 0x1, '67870'), -- argent warhorse H
(36558, 0, 0x0, 0x1, '67865'), -- battleworg H
(34657, 0, 0x0, 0x1, '63406'), -- night elf
(34701, 0, 0x0, 0x1, '63423'), -- draenei
(34702, 0, 0x0, 0x1, '63396'), -- gnome
(34703, 0, 0x0, 0x1, '63427'), -- dwarf
(34705, 0, 0x0, 0x1, '62594'), -- human
(35569, 0, 0x0, 0x1, '63403'), -- blood elf
(35570, 0, 0x0, 0x1, '63399'), -- troll
(35571, 0, 0x0, 0x1, '63436'), -- tauren
(35572, 0, 0x0, 0x1, '63433'), -- orc
(35617, 0, 0x0, 0x1, '63430'), -- undead
(35328, 28912, 0x0, 0x1, '64100'), -- human champ
(35331, 28571, 0x0, 0x1, '64100'), -- gnome champ
(35330, 29255, 0x0, 0x1, '64100'), -- draenei champ
(35332, 29256, 0x0, 0x1, '64100'), -- night elf champ
(35329, 29258, 0x0, 0x1, '64100'), -- dwarf champ
(35314, 29260, 0x0, 0x1, '64100'), -- orc champ
(35326, 29262, 0x0, 0x1, '64100'), -- blood elf champ
(35323, 29261, 0x0, 0x1, '64100'), -- trool champ
(35325, 29259, 0x0, 0x1, '64100'), -- tauren champ
(35327, 29257, 0x0, 0x1, '64100'); -- undead champ
-- The Might Of The Scourge(q.12657) -DK
DELETE FROM dbscripts_on_quest_end WHERE id = 12657;
INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(12657,1,0,0,0,0,0,0,2000000402,0,0,0,0,0,0,0,''),
(12657,2,10,28487,50000,0,0,0,0,0,0,0,2465.472,-5567.304,372.1589,1.64061,''),
(12657,2,10,28487,50000,0,0,0,0,0,0,0,2486.715,-5598.662,372.1589,6.021386,''),
(12657,2,10,28487,50000,0,0,0,0,0,0,0,2455.585,-5618.318,372.1586,4.590216,''),
(12657,2,10,28487,50000,0,0,0,0,0,0,0,2434.517,-5588.561,372.1588,3.263766,''),
(12657,11,0,0,0,0,0,0,2000000403,0,0,0,0,0,0,0,'');
UPDATE quest_template SET CompleteScript = 12657 WHERE entry = 12657;
DELETE FROM db_script_string WHERE entry IN (2000000402,2000000403);
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000402,'%s calls upon the mighty armies of the Scourge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,NULL),
(2000000403,'Armies of the Scourge, hear my call! The scarlet apocalypse has begun! Tear this land asunder and leave only death in your wake!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,6,0,22,NULL);
-- Caretaker Dilandrus
UPDATE creature SET position_x = -807.327, position_y = 2739.82, position_z = 115.447, orientation = 4.184815, MovementType = 2, spawndist = 0  WHERE guid = 58021;
DELETE FROM creature_movement WHERE id = 58021;
UPDATE creature_template SET GossipMenuId = 7309, MovementType = 2 WHERE entry = 16856; -- now move him to template (unique npc)
DELETE FROM creature_movement_template WHERE entry = 16856;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,textid1,textid2,textid3,textid4,textid5,emote,spell,wpguid,orientation,model1,model2) VALUES
(16856,1,-807.327,2739.82,115.447,60000,0,0,0,0,0,0,0,0,0,4.184815,0,0),(16856,2,-798.86,2719.21,111.628,0,0,0,0,0,0,0,0,0,0,5.48986,0,0),
(16856,3,-785.502,2706.21,107.293,0,0,0,0,0,0,0,0,0,0,5.46463,0,0),(16856,4,-785.546,2702.16,106.208,0,0,0,0,0,0,0,0,0,0,4.17889,0,0),
(16856,5,-787.652,2700.58,105.792,12000,1685601,0,0,0,0,0,0,0,0,3.3349,0,0),(16856,6,-791.771,2694.26,104.589,0,0,0,0,0,0,0,0,0,0,3.84755,0,0),
(16856,7,-793.482,2693.76,104.592,10000,1685602,0,0,0,0,0,0,0,0,3.13126,0,0),(16856,8,-794.696,2691.44,104.35,0,0,0,0,0,0,0,0,0,0,3.7887,0,0),
(16856,9,-797.951,2691.02,104.535,0,0,0,0,0,0,0,0,0,0,2.95382,0,0),(16856,10,-798.984,2693.63,104.891,0,0,0,0,0,0,0,0,0,0,1.64928,0,0),
(16856,11,-797.778,2697.53,105.43,12000,1685603,0,0,0,0,0,0,0,0,3.13126,0,0),(16856,12,-792.678,2705.64,106.948,0,0,0,0,0,0,0,0,0,0,1.6532,0,0),
(16856,13,-792.409,2708.46,107.754,0,0,0,0,0,0,0,0,0,0,2.0399,0,0),(16856,14,-794.25,2710.38,108.384,0,0,0,0,0,0,0,0,0,0,3.14966,0,0),
(16856,15,-799.924,2706.66,107.387,10000,1685602,0,0,0,0,0,0,0,0,4.01203,0,0),(16856,16,-807.92,2692.9,104.856,12000,1685604,0,0,0,0,0,0,0,0,3.58948,0,0),
(16856,17,-811.612,2690.9,104.36,0,0,0,0,0,0,0,0,0,0,3.33756,0,0),(16856,18,-814.837,2692.26,104.736,0,0,0,0,0,0,0,0,0,0,2.3079,0,0),
(16856,19,-814.33,2696.03,105.773,0,0,0,0,0,0,0,0,0,0,1.17929,0,0),(16856,20,-809.779,2704.45,107.63,10000,1685602,0,0,0,0,0,0,0,0,1.13373,0,0),
(16856,21,-801.425,2715.06,109.679,12000,1685605,0,0,0,0,0,0,0,0,0.966449,0,0),(16856,22,-801.359,2718.11,110.676,0,0,0,0,0,0,0,0,0,0,1.97582,0,0),
(16856,23,-804.433,2720.69,111.13,0,0,0,0,0,0,0,0,0,0,3.4021,0,0),(16856,24,-810.324,2717.67,110.329,10000,1685602,0,0,0,0,0,0,0,0,4.00607,0,0),
(16856,25,-814.433,2712.14,109.487,0,0,0,0,0,0,0,0,0,0,4.15529,0,0),(16856,26,-820.17,2701.35,107.506,12000,1685606,0,0,0,0,0,0,0,0,4.41448,0,0),
(16856,27,-823.067,2699.77,107.458,0,0,0,0,0,0,0,0,0,0,3.02746,0,0),(16856,28,-824.921,2701.38,107.939,0,0,0,0,0,0,0,0,0,0,2.213,0,0),
(16856,29,-824.739,2706.05,108.591,0,0,0,0,0,0,0,0,0,0,1.32158,0,0),(16856,30,-820.185,2714.8,110.056,12000,1685607,0,0,0,0,0,0,0,0,1.05768,0,0),
(16856,31,-814.476,2725.61,111.567,0,0,0,0,0,0,0,0,0,0,1.07653,0,0),(16856,32,-807.327,2739.82,115.447,0,0,0,0,0,0,0,0,0,0,1.07653,0,0),
(16856,33,-807.327,2739.82,115.447,300000,0,0,0,0,0,0,0,0,0,4.184815,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 1685601 AND 1685607; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1685601,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
(1685601,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685601,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685601,7,9,21211,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1685602,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.76949,''),
(1685602,3,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685602,7,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685602,8,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685603,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
(1685603,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685603,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685603,7,9,21212,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1685604,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
(1685604,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685604,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685604,7,9,21213,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1685605,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
(1685605,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685605,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685605,7,9,21214,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1685606,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
(1685606,3,1,18,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685606,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685606,7,9,21215,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
(1685607,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
(1685607,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685607,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1685607,7,9,21210,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject');
DELETE FROM gossip_menu WHERE entry = 7309;
INSERT INTO gossip_menu (entry, text_id) VALUES 
(7309,8676);
-- missing text added
DELETE FROM npc_text WHERE ID = 8676;
INSERT INTO npc_text (ID, text0_0, text0_1, lang0, prob0, em0_0, em0_1, em0_2, em0_3, em0_4, em0_5, text1_0, text1_1, lang1, prob1, em1_0, em1_1, em1_2, em1_3, em1_4, em1_5, text2_0, text2_1, lang2, prob2, em2_0, em2_1, em2_2, em2_3, em2_4, em2_5, text3_0, text3_1, lang3, prob3, em3_0, em3_1, em3_2, em3_3, em3_4, em3_5, text4_0, text4_1, lang4, prob4, em4_0, em4_1, em4_2, em4_3, em4_4, em4_5, text5_0, text5_1, lang5, prob5, em5_0, em5_1, em5_2, em5_3, em5_4, em5_5, text6_0, text6_1, lang6, prob6, em6_0, em6_1, em6_2, em6_3, em6_4, em6_5, text7_0, text7_1, lang7, prob7, em7_0, em7_1, em7_2, em7_3, em7_4, em7_5) VALUES
(8676, 'I was born here, $r. This is my world - all that I know... As a boy, my mother and father would regale me with tales of your world and the splendor it held. How I longed to leave this place.$B$BAlas, fate is a cruel mistress. My mother and father have long since passed, buried in this very graveyard. I remain to uphold their honor and the honor of my family - the Sons of Lothar.', '', 0, 1, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
-- Flowers for Tony - gobjects update 
UPDATE gameobject SET position_x = -789.0406, position_y = 2701.458, position_z = 105.9629, orientation = 6.161013, rotation2 = -0.06104851, rotation3 = 0.9981348, spawntimesecs = -180 WHERE guid = 21211;
UPDATE gameobject SET position_x = -798.7844, position_y = 2697.909, position_z = 105.5583, orientation = 0.9424766, rotation2 = 0.45399, rotation3 = 0.8910068, spawntimesecs = -180 WHERE guid = 21212;
UPDATE gameobject SET position_x = -802.7329, position_y = 2715.935, position_z = 109.8865, orientation = 1.431168, rotation2 = 0.6560583, rotation3 = 0.7547102, spawntimesecs = -180 WHERE guid = 21214;
UPDATE gameobject SET spawntimesecs = -180 WHERE guid IN (21210,21213,21215);
-- Spirit of Veng
SET @VENG := 12243;
-- -------------------------------------
SET @GUID := (SELECT guid FROM creature WHERE id = @VENG);
SET @NAME := (SELECT NAME FROM creature_template WHERE entry = @VENG);
SET @POINT := 0;
UPDATE creature SET position_x = 1055.392, position_y = -424.1431, position_z = -31.71157, orientation = 1.750369, MovementType = 2 WHERE id = @VENG;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @VENG;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@VENG, (@POINT := @POINT + 1), 1049.818, -393.4347, -36.40392, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1045.682, -370.0918, -36.26097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1037.269, -344.1738, -38.49696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1010.231, -354.8006, -40.64174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1001.227, -344.3694, -41.84286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 999.8060, -321.7702, -44.88178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 975.9816, -300.2042, -45.56088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 973.3655, -281.7761, -45.60944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 990.8004, -256.7235, -45.71144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 989.8036, -243.7692, -46.39622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 976.5450, -231.1565, -48.83212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 961.1855, -219.4528, -46.59094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 948.0901, -222.7645, -46.55467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 918.1025, -245.1806, -46.55928, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 890.2081, -266.6740, -45.42295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 893.1019, -286.1003, -45.94720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 897.5882, -303.8908, -46.28094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 901.6393, -319.0111, -49.26011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 924.2225, -338.5798, -49.55234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 945.5290, -352.3690, -50.18389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 949.2391, -372.7560, -50.12433, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 988.6956, -380.2867, -50.14082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 988.1112, -348.7142, -55.44043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 996.1870, -322.5443, -66.97682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1033.109, -300.2142, -71.97886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1053.559, -317.8576, -72.60872, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1072.046, -311.1849, -72.56207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1070.727, -284.2663, -72.68817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1063.746, -252.9242, -72.76898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1043.079, -229.5041, -72.24142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1020.745, -209.5346, -68.81355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 995.1354, -196.4536, -67.63020, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 976.9100, -181.5676, -67.80058, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 948.1158, -177.7663, -63.59454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 937.1934, -168.8369, -61.91036, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 938.5875, -151.5429, -60.67347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 948.4577, -143.1483, -60.54069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 958.8175, -117.1759, -63.10133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 963.1480, -94.42476, -63.19287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 959.0657, -69.91625, -61.98630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 938.5645, -63.86766, -61.55652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 919.0784, -60.11865, -59.44709, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 897.0678, -67.87030, -59.41375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 903.8420, -88.71603, -59.77781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 917.5721, -110.9749, -61.77675, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 903.7606, -142.9984, -60.55473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 905.8484, -166.0484, -60.56079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 915.4623, -183.6756, -57.63430, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 902.2466, -202.7771, -52.54680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 893.0361, -219.8669, -52.47010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 877.2800, -241.5437, -51.13675, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 864.7952, -249.2394, -52.05878, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 827.9483, -258.0505, -59.70293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 864.7952, -249.2394, -52.05878, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 877.2734, -241.5478, -51.36961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 893.0361, -219.8669, -52.47010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 902.2466, -202.7771, -52.54680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 915.4623, -183.6756, -57.63430, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 905.8484, -166.0484, -60.56079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 903.7606, -142.9984, -60.55473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 917.4988, -111.1451, -61.78257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 903.8420, -88.71603, -59.77781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 897.0678, -67.87030, -59.41375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 919.0784, -60.11865, -59.44709, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 938.5645, -63.86766, -61.55652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 959.0657, -69.91625, -61.98630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 963.1480, -94.42476, -63.19287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 958.8175, -117.1759, -63.10133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 948.4577, -143.1483, -60.54069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 938.5875, -151.5429, -60.67347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 937.1934, -168.8369, -61.91036, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 948.1158, -177.7663, -63.59454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 976.9100, -181.5676, -67.80058, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 995.1354, -196.4536, -67.63020, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1020.745, -209.5346, -68.81355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1043.079, -229.5041, -72.24142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1063.746, -252.9242, -72.76898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1070.727, -284.2663, -72.68817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1072.046, -311.1849, -72.56207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1053.559, -317.8576, -72.60872, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1033.109, -300.2142, -71.97886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 996.1870, -322.5443, -66.97682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 988.1112, -348.7142, -55.44043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 988.6956, -380.2867, -50.14082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 949.2391, -372.7560, -50.12433, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 945.5290, -352.3690, -50.18389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 924.2225, -338.5798, -49.55234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 901.6393, -319.0111, -49.26011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 897.5882, -303.8908, -46.28094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 893.1019, -286.1003, -45.94720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 890.0764, -266.7756, -45.43538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 918.1025, -245.1806, -46.55928, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 948.0901, -222.7645, -46.55467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 961.1744, -219.4443, -46.55466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 976.5450, -231.1565, -48.83212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 989.7991, -243.7112, -46.40620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 990.8004, -256.7235, -45.71144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 973.3655, -281.7761, -45.60944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 975.9816, -300.2042, -45.56088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 999.8060, -321.7702, -44.88178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1001.227, -344.3694, -41.84286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1010.110, -354.6602, -40.65324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1037.269, -344.1738, -38.49696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1045.682, -370.0918, -36.26097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1049.818, -393.4347, -36.40392, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@VENG, (@POINT := @POINT + 1), 1056.210, -424.1578, -31.78930, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Sand Shark
SET @GUID := 3514;
SET @SHARK := 5435;
DELETE FROM creature WHERE guid BETWEEN 151032 AND 151043;
INSERT INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(151032, @SHARK, 0, 0, 0, 3221.8960, 1710.4690, -49.23661, 0.715585, 300, 0, 0, 903, 0, 0, 2),
(151033, @SHARK, 0, 0, 0, 3234.7780, 1040.1620, -49.03365, 2.083385, 300, 0, 0, 903, 0, 0, 2),
(151034, @SHARK, 0, 0, 0, 3221.2930, 530.99500, -49.03215, 6.165682, 300, 0, 0, 903, 0, 0, 2),
(151035, @SHARK, 1, 0, 0, 1550.5950, -5378.973, -32.53504, 3.280727, 300, 0, 0, 903, 0, 0, 2),
(151036, @SHARK, 1, 0, 0, 1283.9980, -5408.571, -50.30394, 3.492435, 300, 0, 0, 903, 0, 0, 2),
(151037, @SHARK, 1, 0, 0, 912.37060, -5415.917, -55.11948, 0.000000, 300, 0, 0, 903, 0, 0, 2),
(151038, @SHARK, 1, 0, 0, 493.32640, -5371.269, -49.88814, 0.000000, 300, 0, 0, 903, 0, 0, 2),
(151039, @SHARK, 1, 0, 0, -326.5838, -5558.277, -32.57368, 3.883571, 300, 0, 0, 903, 0, 0, 2),
(151040, @SHARK, 1, 0, 0, -576.1233, -5817.376, -32.54733, 3.157282, 300, 0, 0, 903, 0, 0, 2),
(151041, @SHARK, 1, 0, 0, -1385.017, -5779.737, -18.00786, 3.348139, 300, 0, 0, 903, 0, 0, 2),
(151042, @SHARK, 1, 0, 0, -1753.698, -5591.549, -33.64932, 3.028575, 300, 0, 0, 903, 0, 0, 2),
(151043, @SHARK, 1, 0, 0, -1115.526, -4306.334, -7.687678, 3.674317, 300, 0, 0, 903, 0, 0, 2);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151032;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151032, (@POINT := @POINT + 1), 3195.662, 1723.264, -48.04173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3172.181, 1728.667, -46.73510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3159.840, 1742.105, -47.11641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3150.543, 1759.820, -48.98943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3145.209, 1779.996, -48.55008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3150.675, 1795.498, -43.96499, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3159.018, 1808.918, -46.86113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3147.042, 1829.820, -48.91264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3124.375, 1836.323, -49.30346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3110.177, 1853.608, -49.30346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3098.962, 1879.044, -49.19866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3099.791, 1899.643, -45.14495, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3093.299, 1918.567, -48.78092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3074.238, 1939.806, -49.20982, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3047.839, 1955.769, -49.31664, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3028.469, 1970.392, -49.24512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3019.160, 1982.827, -48.99512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2988.323, 1998.347, -49.14025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2980.851, 2004.864, -48.03909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2954.493, 2018.016, -47.80416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2925.328, 2045.097, -49.28268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2893.023, 2053.511, -49.19867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2865.849, 2054.294, -48.97533, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2843.767, 2055.249, -49.08995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2822.482, 2054.119, -48.85473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2788.695, 2062.917, -48.87340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2765.504, 2066.172, -48.06932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2788.695, 2062.917, -48.87340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2822.482, 2054.119, -48.85473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2843.767, 2055.249, -49.08995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2865.849, 2054.294, -48.97533, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2893.023, 2053.511, -49.19867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2925.328, 2045.097, -49.28268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2954.493, 2018.016, -47.80416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2980.851, 2004.864, -48.03909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 2988.323, 1998.347, -49.14025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3019.160, 1982.827, -48.99512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3028.469, 1970.392, -49.24512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3047.839, 1955.769, -49.31664, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3074.238, 1939.806, -49.20982, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3093.299, 1918.567, -48.78092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3099.791, 1899.643, -45.14495, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3098.962, 1879.044, -49.19866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3110.177, 1853.608, -49.30346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3124.375, 1836.323, -49.30346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3147.042, 1829.820, -48.91264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3159.018, 1808.918, -46.86113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3150.675, 1795.498, -43.96499, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3145.209, 1779.996, -48.55008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3150.505, 1759.881, -48.99666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3159.840, 1742.105, -47.11641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3172.181, 1728.667, -46.73510, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3195.662, 1723.264, -48.04173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151032, (@POINT := @POINT + 1), 3222.932, 1722.388, -49.26390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151033;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151033, (@POINT := @POINT + 1), 3219.865, 1066.655, -48.89483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3207.929, 1090.381, -47.27658, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3194.551, 1111.675, -46.84540, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3181.076, 1131.854, -44.69330, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3178.316, 1156.420, -45.47855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3176.881, 1185.595, -45.43680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3180.236, 1206.306, -43.94244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3190.403, 1227.345, -48.06219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3193.387, 1253.546, -49.51052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3191.814, 1284.168, -48.92054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3213.592, 1302.704, -49.30187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3226.420, 1327.890, -49.30187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3227.663, 1352.519, -49.28304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3220.748, 1378.083, -49.21460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3223.328, 1416.279, -49.18565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3237.026, 1444.512, -49.23547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3225.315, 1473.262, -49.20024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3215.697, 1516.206, -49.28796, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3199.542, 1542.934, -49.26866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3186.097, 1575.288, -49.23889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3189.738, 1608.755, -49.30112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3207.190, 1630.425, -49.30617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3223.051, 1654.719, -49.30940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3245.558, 1679.743, -49.38989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3242.984, 1723.863, -49.34183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3245.558, 1679.743, -49.38989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3223.051, 1654.719, -49.30940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3207.190, 1630.425, -49.30617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3189.738, 1608.755, -49.30112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3186.097, 1575.288, -49.23889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3199.542, 1542.934, -49.26866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3215.697, 1516.206, -49.28796, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3225.315, 1473.262, -49.20024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3237.026, 1444.512, -49.23547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3223.328, 1416.279, -49.18565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3220.748, 1378.083, -49.21460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3227.663, 1352.519, -49.28304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3226.420, 1327.890, -49.30187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3213.592, 1302.704, -49.30187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3191.814, 1284.168, -48.92054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3193.387, 1253.546, -49.51052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3190.403, 1227.345, -48.06219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3180.236, 1206.306, -43.94244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3176.881, 1185.595, -45.43680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3178.316, 1156.420, -45.47855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3181.076, 1131.854, -44.69330, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3194.551, 1111.675, -46.84540, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3207.856, 1090.509, -47.15768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3219.865, 1066.655, -48.89483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151033, (@POINT := @POINT + 1), 3229.621, 1042.286, -48.93804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151034;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151034, (@POINT := @POINT + 1), 3237.635, 529.06600, -49.16099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3245.977, 509.61450, -49.20725, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3244.237, 480.18940, -48.52467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3236.807, 451.48190, -47.32991, 0, 0, 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3229.509, 421.77820, -46.67115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3232.343, 398.54900, -48.87648, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3232.087, 378.38370, -47.22718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3236.055, 354.16190, -47.16812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3225.398, 330.03550, -46.41989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3209.576, 308.72660, -45.18295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3194.012, 282.98680, -44.12692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3184.899, 250.45230, -42.89439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3180.684, 215.66450, -43.48129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3190.049, 191.40670, -47.26377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3202.457, 172.92600, -49.13857, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3198.712, 154.54250, -47.61382, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3191.650, 129.38040, -46.38750, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3199.235, 111.01500, -47.97380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3215.442, 80.826820, -49.30187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3225.974, 70.905170, -49.30187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3215.456, 39.465930, -49.28304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3218.057, 14.812720, -47.47643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3232.953, 2.2024740, -47.67784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3241.448, -16.72179, -48.20384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3240.345, -45.92708, -45.04333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3236.313, -72.91493, -46.02376, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3225.415, -94.10894, -46.09856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3215.184, -125.0271, -47.42868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3198.149, -144.3789, -48.90287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3195.199, -160.0213, -48.66862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3190.234, -188.3837, -46.62103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3194.873, -215.7166, -49.69736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3213.641, -245.5773, -49.15242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3233.052, -275.7148, -49.20945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3234.987, -304.3427, -49.21683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3220.768, -329.8578, -49.39344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3197.923, -345.2815, -48.11151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3181.139, -362.3763, -44.06171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3170.618, -379.9243, -32.26678, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3167.317, -395.3262, -21.20147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3162.110, -435.2891, -17.72998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3167.317, -395.3262, -21.20147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3170.618, -379.9243, -32.26678, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3181.139, -362.3763, -44.06171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3197.923, -345.2815, -48.11151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3220.768, -329.8578, -49.39344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3234.987, -304.3427, -49.21683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3233.052, -275.7148, -49.20945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3213.641, -245.5773, -49.15242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3194.873, -215.7166, -49.69736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3190.234, -188.3837, -46.62103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3195.199, -160.0213, -48.66862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3198.149, -144.3789, -48.90287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3215.184, -125.0271, -47.42868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3225.415, -94.10894, -46.09856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3236.313, -72.91493, -46.02376, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3240.345, -45.92708, -45.04333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3241.448, -16.72179, -48.20384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3232.953, 2.2024740, -47.67784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3218.057, 14.812720, -47.47643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3215.456, 39.465930, -49.28304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3225.974, 70.905170, -49.30187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3215.442, 80.826820, -49.30187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3199.235, 111.01500, -47.97380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3191.650, 129.38040, -46.38750, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3198.712, 154.54250, -47.61382, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3202.457, 172.92600, -49.13857, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3190.049, 191.40670, -47.26377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3180.684, 215.66450, -43.48129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3184.899, 250.45230, -42.89439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3194.012, 282.98680, -44.12692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3209.576, 308.72660, -45.18295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3225.398, 330.03550, -46.41989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3236.055, 354.16190, -47.16812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3232.087, 378.38370, -47.22718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3232.343, 398.54900, -48.87648, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3229.509, 421.77820, -46.67115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3236.807, 451.48190, -47.32991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3244.237, 480.18940, -48.52467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3245.977, 509.61450, -49.20725, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3237.635, 529.06600, -49.16099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151034, (@POINT := @POINT + 1), 3222.140, 543.13870, -49.32173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151035;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151035, (@POINT := @POINT + 1), 1516.821, -5383.695, -28.89055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1474.842, -5385.459, -29.28639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1447.965, -5383.485, -25.54378, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1412.757, -5384.636, -29.42945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1382.154, -5391.196, -28.43884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1354.784, -5391.483, -28.67631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1334.220, -5378.395, -28.84184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1335.495, -5355.212, -28.79936, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1344.525, -5325.676, -28.07126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1328.266, -5309.035, -31.77486, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1304.008, -5312.752, -31.23555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1284.624, -5347.431, -37.39617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1286.436, -5381.057, -48.04226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1284.715, -5401.730, -48.88867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1287.051, -5438.851, -54.86390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1305.017, -5456.569, -56.55155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1317.339, -5496.389, -55.88370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1305.017, -5456.569, -56.55155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1287.051, -5438.851, -54.86390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1284.738, -5401.922, -48.86840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1286.436, -5381.057, -48.04226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1284.624, -5347.431, -37.39617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1304.008, -5312.752, -31.23555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1328.266, -5309.035, -31.77486, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1344.525, -5325.676, -28.07126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1335.495, -5355.212, -28.79936, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1334.220, -5378.395, -28.84184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1354.784, -5391.483, -28.67631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1382.154, -5391.196, -28.43884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1412.757, -5384.636, -29.42945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1447.965, -5383.485, -25.54378, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1474.842, -5385.459, -29.28639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1516.821, -5383.695, -28.89055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151035, (@POINT := @POINT + 1), 1546.040, -5379.322, -32.59856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151036;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151036, (@POINT := @POINT + 1), 1254.183, -5419.487, -52.47182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1229.275, -5435.859, -56.99025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1208.765, -5447.439, -59.66518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1187.963, -5453.081, -61.99784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1153.766, -5448.208, -64.51538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1124.296, -5439.626, -63.20396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1100.615, -5425.709, -61.84917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1080.524, -5423.092, -60.78251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1055.613, -5418.479, -58.51124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1026.962, -5411.602, -55.96208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1002.202, -5421.312, -52.50908, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 978.4183, -5425.099, -52.55588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 959.8919, -5425.464, -49.94030, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 939.5423, -5439.234, -53.97221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 924.9915, -5446.012, -55.85010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 902.2852, -5443.909, -58.57483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 880.6873, -5439.053, -59.71062, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 850.2018, -5453.352, -60.19572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 880.6873, -5439.053, -59.71062, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 902.2852, -5443.909, -58.57483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 924.9915, -5446.012, -55.85010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 939.5423, -5439.234, -53.97221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 959.8919, -5425.464, -49.94030, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 978.4183, -5425.099, -52.55588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1002.202, -5421.312, -52.50908, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1026.962, -5411.602, -55.96208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1055.613, -5418.479, -58.51124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1080.524, -5423.092, -60.78251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1100.615, -5425.709, -61.84917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1124.296, -5439.626, -63.20396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1153.766, -5448.208, -64.51538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1187.963, -5453.081, -61.99784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1208.765, -5447.439, -59.66518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1229.275, -5435.859, -56.99025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1254.183, -5419.487, -52.47182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151036, (@POINT := @POINT + 1), 1284.577, -5416.164, -50.28735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151037;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151037, (@POINT := @POINT + 1), 884.7640, -5424.270, -58.09518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 860.0378, -5429.363, -58.32449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 840.0536, -5447.569, -59.14537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 808.6261, -5450.202, -55.68275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 785.2258, -5449.354, -55.08957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 752.3654, -5448.882, -57.33829, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 710.3349, -5452.754, -57.69526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 683.3268, -5449.814, -59.34686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 655.4700, -5444.357, -59.52345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 651.5726, -5424.516, -58.07015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 618.4048, -5414.902, -62.80570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 588.8499, -5403.264, -64.40174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 542.9274, -5406.277, -62.64283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 511.8536, -5405.745, -58.56149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 482.2355, -5413.691, -57.85778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 445.7431, -5419.081, -58.46385, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 482.2355, -5413.691, -57.85778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 511.8536, -5405.745, -58.56149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 542.9274, -5406.277, -62.64283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 588.8499, -5403.264, -64.40174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 618.4048, -5414.902, -62.80570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 651.5726, -5424.516, -58.07015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 655.4700, -5444.357, -59.52345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 683.3268, -5449.814, -59.34686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 710.3349, -5452.754, -57.69526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 752.3654, -5448.882, -57.33829, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 785.2258, -5449.354, -55.08957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 808.6261, -5450.202, -55.68275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 840.0536, -5447.569, -59.14537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 860.0378, -5429.363, -58.32449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 884.7640, -5424.270, -58.09518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151037, (@POINT := @POINT + 1), 910.8514, -5418.024, -54.31270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151038;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151038, (@POINT := @POINT + 1), 478.1627, -5354.213, -43.77430, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 449.2878, -5339.316, -39.46656, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 417.3964, -5331.676, -27.15956, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 401.8826, -5346.240, -24.60424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 384.3302, -5356.516, -22.07583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 365.9248, -5363.742, -21.16536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 359.1452, -5389.113, -23.30958, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 351.7778, -5414.204, -22.67201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 336.7711, -5442.292, -26.53557, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 336.7526, -5463.582, -28.15532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 326.5220, -5489.887, -32.60765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 297.9786, -5504.623, -32.26982, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 266.1298, -5515.100, -32.10590, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 239.6120, -5514.212, -31.99897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 209.3774, -5516.511, -31.55025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 181.9160, -5520.001, -31.04438, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 152.5164, -5519.960, -29.29182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 112.3420, -5522.801, -32.62555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 71.75141, -5513.651, -32.56606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 42.74143, -5516.012, -32.60234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 71.75141, -5513.651, -32.56606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 112.3420, -5522.801, -32.62555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 152.5164, -5519.960, -29.29182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 181.9160, -5520.001, -31.04438, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 209.3774, -5516.511, -31.55025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 239.6120, -5514.212, -31.99897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 266.1298, -5515.100, -32.10590, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 297.9786, -5504.623, -32.26982, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 326.5220, -5489.887, -32.60765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 336.7526, -5463.582, -28.15532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 336.7711, -5442.292, -26.53557, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 351.7778, -5414.204, -22.67201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 359.1452, -5389.113, -23.30958, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 365.9248, -5363.742, -21.16536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 384.3302, -5356.516, -22.07583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 401.8826, -5346.240, -24.60424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 417.1816, -5331.885, -27.10952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 449.2878, -5339.316, -39.46656, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 478.1627, -5354.213, -43.77430, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151038, (@POINT := @POINT + 1), 483.2733, -5373.548, -49.24841, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151039;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151039, (@POINT := @POINT + 1), -348.0666, -5577.971, -32.64998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -357.5493, -5604.614, -32.54316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -380.1994, -5623.577, -31.47375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -412.2324, -5631.504, -31.97309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -438.9145, -5638.841, -33.19761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -459.0912, -5648.773, -34.10117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -471.5914, -5669.522, -33.25838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -490.0464, -5686.989, -32.26326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -512.8648, -5686.814, -36.96063, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -530.8138, -5673.190, -35.95770, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -545.8073, -5669.218, -31.60473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -554.3489, -5676.345, -26.09570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -548.3919, -5686.530, -26.03271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -545.6289, -5697.585, -25.74463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -558.8811, -5718.676, -23.57467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -555.4393, -5742.337, -26.51720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -543.6359, -5759.576, -33.29772, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -545.6593, -5779.448, -32.52080, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -565.7188, -5811.162, -34.10390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -584.5605, -5824.542, -32.46045, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -614.8983, -5821.754, -32.86377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -584.5605, -5824.542, -32.46045, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -565.7188, -5811.162, -34.10390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -545.6593, -5779.448, -32.52080, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -543.6359, -5759.576, -33.29772, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -555.4393, -5742.337, -26.51720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -558.8811, -5718.676, -23.57467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -545.6289, -5697.585, -25.74463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -548.3919, -5686.530, -26.03271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -554.3489, -5676.345, -26.09570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -545.8073, -5669.218, -31.60473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -530.8138, -5673.190, -35.95770, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -512.8648, -5686.814, -36.96063, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -490.0464, -5686.989, -32.26326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -471.5914, -5669.522, -33.25838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -459.0912, -5648.773, -34.10117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -438.9145, -5638.841, -33.19761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -412.4659, -5631.576, -32.09028, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -380.1994, -5623.577, -31.47375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -357.5493, -5604.614, -32.54316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -348.0666, -5577.971, -32.64998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151039, (@POINT := @POINT + 1), -318.7133, -5564.043, -32.55148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151040;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151040, (@POINT := @POINT + 1), -608.1886, -5817.862, -33.70899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -636.5050, -5820.905, -28.45358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -659.1743, -5823.260, -19.37738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -691.7118, -5820.370, -20.50407, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -713.3483, -5823.955, -20.36920, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -751.2515, -5827.444, -21.73389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -783.6209, -5825.679, -22.79669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -808.2864, -5822.929, -29.95310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -845.2535, -5820.434, -16.36810, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -875.6730, -5822.888, -12.82245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -909.9373, -5825.713, -12.14808, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -942.4223, -5823.407, -20.27853, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -980.9655, -5821.277, -22.57777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1015.380, -5815.631, -30.79053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1034.805, -5795.985, -28.10279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1056.589, -5790.917, -26.02222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1070.566, -5793.046, -25.00549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1094.363, -5787.655, -27.30798, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1114.446, -5780.142, -27.81094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1128.797, -5771.169, -18.63370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1147.591, -5766.960, -13.69177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1179.733, -5766.318, -14.88489, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1207.664, -5765.576, -13.84899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1232.476, -5768.130, -17.94231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1249.485, -5772.077, -21.22132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1232.476, -5768.130, -17.94231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1207.664, -5765.576, -13.84899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1179.733, -5766.318, -14.88489, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1147.591, -5766.960, -13.69177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1128.797, -5771.169, -18.63370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1114.446, -5780.142, -27.81094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1094.363, -5787.655, -27.30798, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1070.566, -5793.046, -25.00549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1056.589, -5790.917, -26.02222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1034.805, -5795.985, -28.10279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -1015.380, -5815.631, -30.79053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -980.9655, -5821.277, -22.57777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -942.4223, -5823.407, -20.27853, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -909.9373, -5825.713, -12.14808, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -875.6730, -5822.888, -12.82245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -845.2535, -5820.434, -16.36810, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -808.2864, -5822.929, -29.95310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -783.6209, -5825.679, -22.79669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -751.2515, -5827.444, -21.73389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -713.3483, -5823.955, -20.36920, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -691.7118, -5820.370, -20.50407, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -659.1743, -5823.260, -19.37738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -636.5050, -5820.905, -28.45358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -608.1886, -5817.862, -33.70899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151040, (@POINT := @POINT + 1), -581.4075, -5813.840, -31.54468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151041;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151041, (@POINT := @POINT + 1), -1414.717, -5785.945, -18.28851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1429.123, -5803.252, -21.42676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1440.071, -5818.405, -23.65052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1473.324, -5817.655, -28.52335, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1493.109, -5817.798, -30.55362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1515.078, -5820.915, -30.82909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1546.918, -5824.502, -30.41975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1576.580, -5830.682, -26.95949, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1609.989, -5827.751, -22.25511, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1649.508, -5819.800, -18.23368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1656.176, -5794.950, -11.23240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1638.662, -5767.847, -23.09690, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1641.793, -5751.137, -26.11779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1618.052, -5731.528, -29.60553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1600.349, -5710.068, -28.90900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1617.423, -5693.512, -23.34335, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1640.375, -5682.300, -22.65612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1660.634, -5671.528, -26.17687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1686.911, -5662.636, -27.36601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1698.239, -5629.519, -27.07917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1712.572, -5613.549, -27.77460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1728.000, -5592.728, -26.94653, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1744.330, -5587.043, -30.40704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1728.000, -5592.728, -26.94653, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1712.572, -5613.549, -27.77460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1698.239, -5629.519, -27.07917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1686.911, -5662.636, -27.36601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1660.634, -5671.528, -26.17687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1640.375, -5682.300, -22.65612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1617.423, -5693.512, -23.34335, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1600.349, -5710.068, -28.90900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1618.052, -5731.528, -29.60553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1641.793, -5751.137, -26.11779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1638.662, -5767.847, -23.09690, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1656.176, -5794.950, -11.23240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1649.508, -5819.800, -18.23368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1609.989, -5827.751, -22.25511, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1576.580, -5830.682, -26.95949, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1546.918, -5824.502, -30.41975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1515.078, -5820.915, -30.82909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1493.109, -5817.798, -30.55362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1473.324, -5817.655, -28.52335, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1440.071, -5818.405, -23.65052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1429.123, -5803.252, -21.42676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1414.717, -5785.945, -18.28851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151041, (@POINT := @POINT + 1), -1368.822, -5777.984, -19.77502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151042;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151042, (@POINT := @POINT + 1), -1776.081, -5589.009, -34.18173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1803.558, -5594.414, -34.12356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1823.099, -5600.482, -33.48129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1856.045, -5605.799, -33.92609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1873.247, -5594.561, -36.22752, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1884.442, -5579.096, -39.40404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1896.791, -5559.878, -39.60547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1889.671, -5539.566, -37.13672, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1871.801, -5526.505, -38.08211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1846.049, -5521.628, -40.42604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1827.922, -5477.870, -35.56777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1820.318, -5455.870, -30.86184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1804.972, -5430.848, -35.17406, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1779.959, -5415.255, -34.33684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1766.378, -5396.977, -33.19410, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1779.959, -5415.255, -34.33684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1804.972, -5430.848, -35.17406, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1820.318, -5455.870, -30.86184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1827.922, -5477.870, -35.56777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1846.049, -5521.628, -40.42604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1871.801, -5526.505, -38.08211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1889.671, -5539.566, -37.13672, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1896.791, -5559.878, -39.60547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1884.442, -5579.096, -39.40404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1873.247, -5594.561, -36.22752, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1856.045, -5605.799, -33.92609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1823.099, -5600.482, -33.48129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1803.558, -5594.414, -34.12356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1776.081, -5589.009, -34.18173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151042, (@POINT := @POINT + 1), -1755.496, -5592.202, -32.99152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
SET @POINT := 0;
DELETE FROM creature_movement WHERE id = 151043;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(151043, (@POINT := @POINT + 1), -1142.711, -4322.336, -7.514394, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1145.222, -4345.001, -9.041511, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1160.349, -4357.775, -12.11841, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1176.233, -4369.198, -13.35694, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1169.887, -4381.364, -14.98853, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1166.834, -4391.783, -13.77357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1184.732, -4412.307, -13.05519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1183.193, -4430.994, -10.80470, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1202.447, -4460.210, -6.748327, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1215.991, -4472.520, -8.580442, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1208.834, -4488.687, -6.471312, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1188.059, -4498.218, -4.539361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1169.258, -4479.332, -4.284722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1162.066, -4452.037, -4.664849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1155.305, -4427.696, -7.986797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1165.516, -4412.070, -11.33738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1159.323, -4392.171, -11.84208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1144.141, -4381.103, -9.759070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1133.105, -4355.526, -8.964375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1120.305, -4335.307, -8.061429, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151043, (@POINT := @POINT + 1), -1119.314, -4321.887, -7.848064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Fixed quest / gameobjects relation in Darkshore for the washed ashore quest line (Alliance only)
UPDATE gameobject_questrelation SET quest = 4728 WHERE id = 175226;
UPDATE gameobject_questrelation SET quest = 4730 WHERE id = 175227;
UPDATE gameobject_questrelation SET quest = 4722 WHERE id = 176190;
UPDATE gameobject_questrelation SET quest = 4732 WHERE id = 176191;
UPDATE gameobject_questrelation SET quest = 4727 WHERE id = 176196;
UPDATE gameobject_questrelation SET quest = 4725 WHERE id = 176197;
UPDATE gameobject_questrelation SET quest = 4731 WHERE id = 176198;
UPDATE gameobject_questrelation SET quest = 4733 WHERE id = 175230;
UPDATE gameobject_questrelation SET quest = 4723 WHERE id = 175233;
-- Fixed quest text for quest 4727 (Beached Sea Turtle) which was using text from a similar quest instead
UPDATE quest_template SET OfferRewardText = 'You\'ve found even more beached creatures, $N?  Sea turtles were commonly found frolicking along the base of Nordrassil before it was destroyed.  With the birth of Teldrassil, however, these creatures have been seen in ever decreasing numbers.  Some, as we have discovered, end their lives here for some unknown reason.$B$BYour aid will perhaps unlock the mystery before us.  Please accept this in exchange for the remains you have provided for our study.' WHERE entry = 4727;

-- Improved start script for quest 1064 (Forsaken Aid)
-- Added missing spell visual
DELETE FROM dbscripts_on_quest_start WHERE id = 1064 AND delay = 3;
INSERT INTO dbscripts_on_quest_start (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1064, 3, 15, 6657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
-- Thief Catcher Shadowdelve
SET @SHADOWDELVE := 14363; 
SET @GUID := (SELECT guid FROM creature WHERE id = @SHADOWDELVE);
SET @POINT := 0;
UPDATE creature SET position_x = -4896.550, position_y = -996.0091, position_z = 504.0237, orientation = 0.6960631, MovementType = 2 WHERE id = @SHADOWDELVE;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @SHADOWDELVE;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@SHADOWDELVE, (@POINT := @POINT + 1), -4885.096, -986.4387, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4888.364, -983.6744, 503.9405, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4895.207, -985.1433, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4904.652, -975.4191, 501.4508, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4908.016, -960.3723, 501.5012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4880.324, -920.6398, 501.5753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4833.688, -904.1839, 501.6598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4797.364, -906.4210, 497.9217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4780.092, -905.9431, 499.2118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4763.683, -907.0504, 501.6255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4721.881, -922.5632, 501.6541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4691.694, -946.5085, 501.6670, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4679.948, -969.9567, 501.6992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4650.121, -982.7744, 501.6564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4635.554, -960.3665, 501.6609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4651.672, -935.2123, 501.6579, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4687.276, -922.1450, 501.6603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4721.487, -905.8834, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4757.437, -890.9809, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4785.496, -884.3284, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4815.042, -883.2499, 501.6677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4846.717, -886.1057, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4886.973, -891.7634, 501.6593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4906.807, -884.8439, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4929.052, -856.4695, 501.6614, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4952.721, -869.0760, 501.6613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4988.777, -898.9862, 501.6362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -5017.839, -932.5099, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4985.217, -957.6404, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4958.795, -941.6141, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4947.842, -930.1240, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4950.354, -921.7192, 504.2645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4961.114, -913.8481, 503.8348, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4956.323, -904.1819, 503.8368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4950.286, -908.2200, 503.8357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4950.209, -918.2828, 504.2613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4942.204, -927.9940, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4935.647, -936.2831, 503.0424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4931.629, -949.3468, 501.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4915.165, -957.8141, 501.5400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4906.877, -973.0106, 501.4532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4898.353, -983.7513, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SHADOWDELVE, (@POINT := @POINT + 1), -4891.350, -992.1207, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
 -- Thief Catcher Farmountain
SET @FARMOUNTAIN := 14365;
SET @GUID := (SELECT guid FROM creature WHERE id = @FARMOUNTAIN);
SET @POINT := 0;
UPDATE creature SET position_x = -4956.434, position_y = -906.7910, position_z = 503.9225, orientation = 3.836208, MovementType = 2 WHERE id = @FARMOUNTAIN;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @FARMOUNTAIN;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4963.365, -912.5651, 503.8351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4955.276, -916.4485, 504.2614, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4944.974, -929.2750, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4973.284, -956.8936, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4992.383, -979.8217, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4994.909, -996.2097, 501.6608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -5007.273, -1025.464, 501.6562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -5014.620, -1054.751, 501.7294, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -5016.097, -1099.324, 501.6745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -5011.856, -1112.884, 501.6742, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -5007.002, -1116.343, 501.6876, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -5003.024, -1142.076, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4998.460, -1179.694, 501.6604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4982.609, -1226.394, 501.6788, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4944.211, -1255.974, 501.6630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4925.567, -1250.108, 501.6418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4923.098, -1236.333, 501.6560, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4945.754, -1214.150, 501.6548, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4969.667, -1187.341, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4991.060, -1151.823, 501.6537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4997.530, -1115.960, 501.6314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4994.735, -1091.497, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4992.421, -1058.819, 497.9618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4992.421, -1058.819, 497.9618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4989.006, -1039.414, 501.6601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4983.643, -1019.235, 501.6526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4962.486, -981.2289, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4929.968, -957.3575, 501.5874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4915.203, -960.3139, 501.4894, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4904.061, -976.8671, 501.4414, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4896.077, -987.4464, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4896.048, -992.9202, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4889.553, -993.4305, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4884.642, -985.4946, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4888.783, -984.3502, 503.9405, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4894.861, -986.5887, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4899.702, -980.8641, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4904.338, -974.5950, 501.4507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4914.213, -959.8905, 501.5282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4935.674, -935.8187, 503.0679, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4949.081, -919.8021, 504.2644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@FARMOUNTAIN, (@POINT := @POINT + 1), -4959.338, -908.1340, 503.8360, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Thief Catcher Thunderbrew
SET @THUNDERBREW := 14367;
SET @GUID := (SELECT guid FROM creature WHERE id = @THUNDERBREW);
SET @POINT := 0;
UPDATE creature SET position_x = -4824.520, position_y = -1168.4150, position_z = 502.2844, orientation = 0.05302288, MovementType = 2 WHERE id = @THUNDERBREW;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @THUNDERBREW;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@THUNDERBREW, (@POINT := @POINT + 1), -4789.093, -1166.5350, 502.2258, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4758.693, -1159.6350, 502.2123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4730.106, -1194.2480, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4719.517, -1218.3540, 501.6595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4740.718, -1244.5340, 501.6592, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4724.864, -1277.6100, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4694.163, -1265.8870, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4682.361, -1259.1080, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4664.030, -1243.1180, 501.9927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4643.821, -1214.2370, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4647.422, -1189.8260, 501.6544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4683.809, -1195.8010, 501.6590, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4708.729, -1200.7670, 501.6594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4732.161, -1176.4560, 501.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4747.495, -1152.9930, 502.2064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4734.040, -1106.0400, 502.2181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4738.371, -1074.0730, 502.2418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4762.797, -1042.3680, 502.2115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4788.038, -1030.8930, 502.2079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4816.683, -1027.2800, 502.1957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4826.917, -1014.3390, 502.2123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4838.749, -977.66580, 501.8416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4850.542, -941.90900, 501.5055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4866.628, -946.19140, 501.4519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4883.959, -942.70810, 501.4178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4908.408, -967.71200, 501.4664, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4901.270, -979.61580, 503.0475, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4894.480, -986.55600, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4886.826, -988.18080, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4894.627, -994.62760, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4895.386, -986.91030, 503.9404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4905.212, -975.29350, 501.4462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4915.479, -959.21370, 501.5359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4936.558, -935.24610, 503.1360, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4951.304, -916.99350, 504.2646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4951.812, -906.41910, 503.8361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4960.936, -907.57750, 503.8362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4962.912, -915.03820, 503.8346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4952.596, -917.66530, 504.2635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4938.362, -936.40620, 503.1531, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4927.755, -951.20630, 501.6015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4937.900, -980.27130, 501.4769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4943.053, -998.15500, 501.4404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4943.612, -1014.5180, 501.4404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4948.514, -1023.7060, 501.4620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4924.298, -1036.7850, 501.7220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4885.191, -1057.8440, 502.1472, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4873.420, -1069.6380, 502.2016, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4872.613, -1106.7500, 502.1995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4858.562, -1134.9510, 502.1884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4842.917, -1155.2710, 502.1171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@THUNDERBREW, (@POINT := @POINT + 1), -4820.896, -1169.2980, 502.2008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Sraaz
SET @SRAAZ := 9099;
SET @GUID := (SELECT guid FROM creature WHERE id = @SRAAZ);
SET @POINT := 0;
UPDATE creature SET position_x = -4756.994, position_y = -1154.7340, position_z = 502.2956, orientation = 3.701010, MovementType = 2 WHERE id = @SRAAZ;
DELETE FROM creature_movement WHERE id = @GUID;
DELETE FROM creature_movement_template WHERE entry = @SRAAZ;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@SRAAZ, (@POINT := @POINT + 1), -4774.401, -1165.6340, 502.2124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4790.139, -1168.6600, 502.2254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4815.048, -1167.4000, 502.2048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4836.729, -1156.8980, 502.1668, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4854.076, -1143.5300, 502.2069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4867.312, -1122.6440, 502.1823, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4873.944, -1090.7310, 502.2140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4868.064, -1085.2770, 502.2046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4829.619, -1085.2750, 502.2084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4812.885, -1065.8780, 502.1967, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4810.180, -1032.0500, 502.1985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4797.529, -1025.6460, 502.2035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4764.070, -1041.1130, 502.2115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4737.233, -1073.9190, 502.2396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4732.991, -1106.3140, 502.2190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4741.397, -1139.0810, 502.2007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@SRAAZ, (@POINT := @POINT + 1), -4756.994, -1154.7340, 502.2123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
 -- Ironforge Guard #144
SET @GUID := 144;
SET @POINT := 0;
UPDATE creature SET position_x = -5050.712, position_y = -810.2087, position_z = 495.2109, orientation = 1.361725, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id=@GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -5045.773, -786.9305, 495.2132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5061.846, -752.7072, 481.8096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5097.768, -740.2383, 468.6567, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5133.368, -741.2177, 459.3947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5166.305, -739.1543, 450.9035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5187.297, -733.2242, 447.4483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5203.363, -699.6258, 438.4007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5218.088, -666.4339, 430.1400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5228.595, -633.1194, 421.7410, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5237.807, -599.4499, 413.6968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5241.627, -566.6175, 403.4313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5243.015, -532.7789, 391.0985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5256.577, -498.8654, 386.2344, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.951077, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5243.385, -533.1536, 391.2333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5242.362, -566.6934, 403.3719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5238.352, -599.8167, 413.7559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5229.088, -633.2765, 421.6609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5218.850, -666.7302, 430.0223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5204.014, -699.4961, 438.3316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5188.978, -733.1346, 447.0623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5166.568, -740.9424, 450.8019, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5133.428, -742.4106, 459.3805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5100.030, -742.1588, 467.9603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5066.893, -749.7949, 479.0317, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5054.690, -766.5782, 488.9085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5050.706, -799.8795, 495.2132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5050.173, -811.2641, 495.2521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5045.451, -815.5643, 495.2521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5050.712, -810.2087, 495.2521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -5050.712, -810.2087, 495.2521, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.729842, 0, 0);
 -- Ironforge Guard #1894
SET @GUID := 1894;
SET @POINT := 0;
UPDATE creature SET position_x = -4800.571, position_y = -1027.3610, position_z = 502.2889, orientation = 6.120802, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4783.109, -1030.2210, 502.2087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4764.898, -1039.7820, 502.2114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4746.893, -1056.7650, 502.2387, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4734.417, -1080.3780, 502.2124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4732.405, -1105.0680, 502.2192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4738.651, -1131.4270, 502.2089, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4747.607, -1146.2290, 502.2102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4760.845, -1144.4210, 502.2124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4770.223, -1134.0510, 499.9824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4785.496, -1120.5330, 498.8060, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4792.576, -1112.7070, 498.8072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4792.646, -1105.1830, 498.8072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4803.730, -1091.7740, 499.4382, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4813.405, -1078.9990, 502.2188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4812.579, -1064.7830, 502.1976, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4810.207, -1046.0230, 502.1970, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4809.493, -1036.1500, 502.2053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4800.306, -1026.9120, 502.2059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Ironforge Guard #1895
SET @GUID := 1895; 
SET @POINT := 0;
UPDATE creature SET position_x = -4874.089, position_y = -1090.3040, position_z = 502.2973, orientation = 4.767289, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -4873.168, -1107.0780, 502.1995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4866.706, -1125.3990, 502.1795, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4855.071, -1143.8020, 502.1944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4836.417, -1159.5780, 502.1925, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4814.893, -1167.7510, 502.2046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4790.182, -1167.7950, 502.2260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4765.064, -1160.0570, 502.1873, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4763.539, -1152.7280, 502.2124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4778.483, -1131.8860, 498.8080, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4795.002, -1115.8850, 498.8072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4804.095, -1112.7490, 498.8071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4807.448, -1107.6990, 498.8071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4808.890, -1101.9740, 498.8071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4822.939, -1086.6750, 502.2159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4833.822, -1085.0890, 502.2042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4856.700, -1084.2080, 502.1920, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4866.897, -1084.1640, 502.2027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -4874.189, -1090.3630, 502.2141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Theramore Sentry #33988
SET @GUID := 33988;
SET @POINT := 0;
UPDATE creature SET position_x = -2890.87, position_y = -3421.01, position_z = 74.4463, orientation = 1.93648, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -2890.87, -3421.01, 74.4463, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.93648, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2889.81,-3424,74.4304,0,0,0,0,0,0,0,0,0,0,5.06237,0,0),
(@GUID, (@POINT := @POINT + 1), -2886.89,-3431.63,68.8635,0,0,0,0,0,0,0,0,0,0,5.51004,0,0),
(@GUID, (@POINT := @POINT + 1), -2883.69,-3432.35,68.8632,0,0,0,0,0,0,0,0,0,0,0.593447,0,0),
(@GUID, (@POINT := @POINT + 1), -2881.05,-3427.56,66.8511,0,0,0,0,0,0,0,0,0,0,1.532,0,0),
(@GUID, (@POINT := @POINT + 1), -2882.24,-3422.5,64.44,0,0,0,0,0,0,0,0,0,0,2.46348,0,0),
(@GUID, (@POINT := @POINT + 1), -2884.42,-3421.01,63.4094,0,0,0,0,0,0,0,0,0,0,2.96142,0,0),
(@GUID, (@POINT := @POINT + 1), -2891.6,-3420.3,63.1928,0,0,0,0,0,0,0,0,0,0,3.49314,0,0),
(@GUID, (@POINT := @POINT + 1), -2894.5,-3422.34,61.3742,0,0,0,0,0,0,0,0,0,0,4.12853,0,0),
(@GUID, (@POINT := @POINT + 1), -2896.25,-3427.01,58.6742,0,0,0,0,0,0,0,0,0,0,4.9744,0,0),
(@GUID, (@POINT := @POINT + 1), -2894.06,-3434.03,58.6045,0,0,0,0,0,0,0,0,0,0,5.51553,0,0),
(@GUID, (@POINT := @POINT + 1), -2889.64,-3436.63,55.9873,0,0,0,0,0,0,0,0,0,0,6.27344,0,0),
(@GUID, (@POINT := @POINT + 1), -2883.76,-3435.69,53.067,0,0,0,0,0,0,0,0,0,0,0.746636,0,0),
(@GUID, (@POINT := @POINT + 1), -2879.35,-3430.94,52.9223,0,0,0,0,0,0,0,0,0,0,1.20295,0,0),
(@GUID, (@POINT := @POINT + 1), -2878.35,-3427.05,50.965,0,0,0,0,0,0,0,0,0,0,1.77472,0,0),
(@GUID, (@POINT := @POINT + 1), -2879.3,-3423.19,49.2916,0,0,0,0,0,0,0,0,0,0,2.28209,0,0),
(@GUID, (@POINT := @POINT + 1), -2881.97,-3420.16,47.2928,0,0,0,0,0,0,0,0,0,0,2.66693,0,0),
(@GUID, (@POINT := @POINT + 1), -2889.17,-3417.8,46.7486,0,0,0,0,0,0,0,0,0,0,3.27562,0,0),
(@GUID, (@POINT := @POINT + 1), -2894.42,-3420.39,44.1282,0,0,0,0,0,0,0,0,0,0,3.96598,0,0),
(@GUID, (@POINT := @POINT + 1), -2896.7,-3424.19,44.1198,0,0,0,0,0,0,0,0,0,0,4.41523,0,0),
(@GUID, (@POINT := @POINT + 1), -2897.57,-3428.99,42.1217,0,0,0,0,0,0,0,0,0,0,4.88097,0,0),
(@GUID, (@POINT := @POINT + 1), -2894.54,-3434.74,39.3619,0,0,0,0,0,0,0,0,0,0,5.56819,0,0),
(@GUID, (@POINT := @POINT + 1), -2888.88,-3434.01,39.3582,0,0,0,0,0,0,0,0,0,0,0.614677,0,0),
(@GUID, (@POINT := @POINT + 1), -2880.31,-3425.55,39.3549,0,0,0,0,0,0,0,0,0,0,0.128399,0,0),
(@GUID, (@POINT := @POINT + 1), -2872.39,-3424.52,39.3517,10000,0,0,0,0,0,0,0,0,0,0.195158,0,0),
(@GUID, (@POINT := @POINT + 1), -2880.4,-3426.19,39.3532,0,0,0,0,0,0,0,0,0,0,3.76165,0,0),
(@GUID, (@POINT := @POINT + 1), -2887.3,-3433.28,39.3555,0,0,0,0,0,0,0,0,0,0,3.54488,0,0),
(@GUID, (@POINT := @POINT + 1), -2892.93,-3432.99,39.4073,0,0,0,0,0,0,0,0,0,0,2.48077,0,0),
(@GUID, (@POINT := @POINT + 1), -2897.05,-3431.31,41.1585,0,0,0,0,0,0,0,0,0,0,1.85549,0,0),
(@GUID, (@POINT := @POINT + 1), -2897.92,-3426.75,42.9612,0,0,0,0,0,0,0,0,0,0,1.28372,0,0),
(@GUID, (@POINT := @POINT + 1), -2896.77,-3423.87,44.1282,0,0,0,0,0,0,0,0,0,0,0.945212,0,0),
(@GUID, (@POINT := @POINT + 1), -2894.23,-3420.42,44.1284,0,0,0,0,0,0,0,0,0,0,0.92165,0,0),
(@GUID, (@POINT := @POINT + 1), -2892.68,-3418.86,45.4239,0,0,0,0,0,0,0,0,0,0,0.420566,0,0),
(@GUID, (@POINT := @POINT + 1), -2888.74,-3417.84,46.788,0,0,0,0,0,0,0,0,0,0,0.0420037,0,0),
(@GUID, (@POINT := @POINT + 1), -2882.41,-3419.79,47.2422,0,0,0,0,0,0,0,0,0,0,5.75185,0,0),
(@GUID, (@POINT := @POINT + 1), -2879.51,-3422.97,49.158,0,0,0,0,0,0,0,0,0,0,5.21778,0,0),
(@GUID, (@POINT := @POINT + 1), -2878.85,-3428.03,51.3309,0,0,0,0,0,0,0,0,0,0,4.55491,0,0),
(@GUID, (@POINT := @POINT + 1), -2880.01,-3431.39,53.0185,0,0,0,0,0,0,0,0,0,0,3.9745,0,0),
(@GUID, (@POINT := @POINT + 1), -2883.93,-3435.23,53.0676,0,0,0,0,0,0,0,0,0,0,3.95707,0,0),
(@GUID, (@POINT := @POINT + 1), -2887.65,-3437.12,54.9482,0,0,0,0,0,0,0,0,0,0,3.20545,0,0),
(@GUID, (@POINT := @POINT + 1), -2891.7,-3436.23,57.023,0,0,0,0,0,0,0,0,0,0,2.50723,0,0),
(@GUID, (@POINT := @POINT + 1), -2893.96,-3433.69,58.6146,0,0,0,0,0,0,0,0,0,0,2.04227,0,0),
(@GUID, (@POINT := @POINT + 1), -2896.18,-3426.95,58.6731,0,0,0,0,0,0,0,0,0,0,1.77131,0,0),
(@GUID, (@POINT := @POINT + 1), -2895.73,-3423.92,60.3482,0,0,0,0,0,0,0,0,0,0,1.08173,0,0),
(@GUID, (@POINT := @POINT + 1), -2891.62,-3420.81,63.1991,0,0,0,0,0,0,0,0,0,0,0.457775,0,0),
(@GUID, (@POINT := @POINT + 1), -2889.61,-3420.21,63.3588,0,0,0,0,0,0,0,0,0,0,6.14956,0,0),
(@GUID, (@POINT := @POINT + 1), -2884.92,-3421.07,63.3588,0,0,0,0,0,0,0,0,0,0,6.1739,0,0),
(@GUID, (@POINT := @POINT + 1), -2881.79,-3423.6,65.1294,0,0,0,0,0,0,0,0,0,0,5.47726,0,0),
(@GUID, (@POINT := @POINT + 1), -2880.99,-3427.01,66.6605,0,0,0,0,0,0,0,0,0,0,4.75413,0,0),
(@GUID, (@POINT := @POINT + 1), -2881.9,-3430.48,68.0874,0,0,0,0,0,0,0,0,0,0,4.14467,0,0),
(@GUID, (@POINT := @POINT + 1), -2883.9,-3432.35,68.8631,0,0,0,0,0,0,0,0,0,0,3.62945,0,0),
(@GUID, (@POINT := @POINT + 1), -2885.51,-3433.05,68.8631,0,0,0,0,0,0,0,0,0,0,2.70503,0,0),
(@GUID, (@POINT := @POINT + 1), -2887.05,-3431.72,68.8636,0,0,0,0,0,0,0,0,0,0,1.91728,0,0),
(@GUID, (@POINT := @POINT + 1), -2889.99,-3423.89,74.4466,0,0,0,0,0,0,0,0,0,0,1.99189,0,0),
(@GUID, (@POINT := @POINT + 1), -2890.92,-3421.04,74.4466,0,0,0,0,0,0,0,0,0,0,1.8623,0,0);
-- Theramore Sentry #33893
SET @GUID := 33893;
SET @POINT := 0;
UPDATE creature SET position_x = -2905.880, position_y = -3424.5640, position_z = 40.13115, orientation = 4.763484, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -2905.330, -3435.3180, 39.96030, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2899.780, -3442.4150, 40.08151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2893.385, -3445.4210, 39.98938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2885.393, -3445.8940, 40.05820, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2876.094, -3441.7920, 39.98660, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2870.970, -3435.4440, 40.03884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2869.718, -3429.2910, 40.04797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2871.232, -3419.8690, 40.04797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2877.857, -3412.2110, 40.04207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2888.735, -3410.0370, 40.04112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2897.262, -3412.5130, 40.06449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2903.723, -3418.1760, 40.01704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2906.327, -3425.3110, 40.01620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Theramore Sentry #33991
SET @GUID := 33991; 
SET @POINT := 0;
UPDATE creature SET position_x = -2868.661, position_y = -3423.4900, position_z = 40.13130, orientation = 4.780951, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -2867.939, -3434.0100, 40.06625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2873.997, -3444.1060, 39.92670, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2885.609, -3450.1910, 40.07593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2895.702, -3447.9080, 39.93052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2905.374, -3441.5860, 40.14555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2908.768, -3434.2870, 39.91129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2909.646, -3426.4960, 39.97071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2906.835, -3414.6380, 40.02058, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2900.900, -3409.2640, 40.07021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2894.011, -3406.2900, 40.12309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2885.169, -3406.1270, 40.03277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2876.822, -3409.8230, 39.99891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2870.925, -3415.9580, 40.04797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2866.849, -3424.3550, 40.04797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Theramore Sentry #31344
SET @GUID := 31344;
SET @POINT := 0;
UPDATE creature SET position_x = -2889.708, position_y = -3318.7480, position_z = 31.27396, orientation = 2.398329, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -2905.646, -3304.0990, 31.77243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2915.960, -3292.1950, 31.91731, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2930.354, -3268.0230, 31.54231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2941.833, -3258.1780, 31.27243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2948.270, -3251.2840, 31.43088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2976.800, -3242.8420, 32.78296, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2997.709, -3237.1340, 33.83252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2998.629, -3244.9980, 34.12817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3000.839, -3235.7740, 33.92015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3016.902, -3227.3430, 34.02878, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3045.638, -3214.4090, 33.98430, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3059.448, -3209.5890, 33.35930, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3078.848, -3208.8070, 33.15851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3094.927, -3210.4960, 33.43317, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3078.848, -3208.8070, 33.15851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3059.448, -3209.5890, 33.35930, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3045.638, -3214.4090, 33.98430, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3016.902, -3227.3430, 34.02878, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3000.839, -3235.7740, 33.92015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2998.629, -3244.9980, 34.12817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2997.709, -3237.1340, 33.83252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2976.800, -3242.8420, 32.78296, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2948.270, -3251.2840, 31.43088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2941.833, -3258.1780, 31.27243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2930.354, -3268.0230, 31.54231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2915.960, -3292.1950, 31.91731, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2905.646, -3304.0990, 31.77243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -2886.695, -3315.8650, 31.41194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Sentry Point Guard #30814
SET @GUID := 30814;
SET @POINT := 0;
UPDATE creature SET position_x = -3463.651, position_y = -4129.8440, position_z = 17.05344, orientation = 5.086615, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -3458.164, -4143.8150, 11.80710, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3450.980, -4148.4200, 10.86265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3443.454, -4156.0670, 9.985451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3431.455, -4163.4940, 10.08993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3429.472, -4166.1450, 10.20297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3421.273, -4160.1170, 10.65048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3436.642, -4150.4520, 10.49375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3442.773, -4137.0180, 11.23545, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3457.494, -4124.1710, 16.96460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3442.709, -4136.4590, 11.23545, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3436.642, -4150.4520, 10.49375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3421.273, -4160.1170, 10.65048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3429.472, -4166.1450, 10.20297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3431.455, -4163.4940, 10.08993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3443.454, -4156.0670, 9.985451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3450.980, -4148.4200, 10.86265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3458.164, -4143.8150, 11.80710, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3463.676, -4130.4720, 16.96460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Sentry Point Guard #30810
SET @GUID := 30810;
SET @POINT := 0;
UPDATE creature SET position_x = -3459.885, position_y = -4116.3370, position_z = 17.05344, orientation = 1.173562, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -3456.429, -4108.098, 16.94242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3458.704, -4098.343, 16.96465, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3465.677, -4090.356, 16.97877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3478.250, -4088.281, 16.97186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3490.270, -4094.468, 16.85423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3495.154, -4109.317, 16.87564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3489.858, -4121.281, 17.02257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3477.155, -4127.292, 16.93963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3462.605, -4124.125, 16.96460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3455.443, -4131.077, 15.03870, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3462.605, -4124.125, 16.96460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3477.155, -4127.292, 16.93963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3489.858, -4121.281, 17.02257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3495.154, -4109.317, 16.87564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3490.270, -4094.468, 16.85423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3478.250, -4088.281, 16.97186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3465.677, -4090.356, 16.97877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3458.704, -4098.343, 16.96465, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3456.429, -4108.098, 16.94242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3459.407, -4117.533, 16.96460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Sentry Point Guard #30816
SET @GUID := 30816;
SET @POINT := 0;
UPDATE creature SET position_x = -3472.252, position_y = -4116.7920, position_z = 17.05920, orientation = 2.712768, MovementType = 2 WHERE guid = @GUID;
DELETE FROM creature_movement WHERE id = @GUID;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(@GUID, (@POINT := @POINT + 1), -3480.223, -4113.1470, 16.96792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3484.659, -4105.1750, 16.97011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3479.773, -4099.1900, 20.09231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3472.436, -4098.7010, 21.74103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3466.221, -4103.6350, 24.50929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3465.935, -4110.2000, 25.09506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3470.240, -4114.9580, 28.28775, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3477.901, -4115.3430, 30.68018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3482.958, -4109.7890, 33.41206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3482.230, -4104.0480, 36.22615, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3476.560, -4099.8650, 37.12769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3471.047, -4100.6940, 40.52042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3468.138, -4109.3990, 41.48971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3473.422, -4114.3300, 45.02025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3479.796, -4112.7050, 46.47600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3471.020, -4102.6250, 52.05910, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3479.796, -4112.7050, 46.47600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3473.430, -4114.3370, 45.05516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3468.162, -4109.4210, 41.49479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3471.047, -4100.6940, 40.52042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3476.560, -4099.8650, 37.12769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3482.230, -4104.0480, 36.22615, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3482.958, -4109.7890, 33.41206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3477.901, -4115.3430, 30.68018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3470.240, -4114.9580, 28.28519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3466.510, -4110.8350, 25.31569, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3466.221, -4103.6350, 24.50929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3472.436, -4098.7010, 21.74103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3479.773, -4099.1900, 20.09231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3484.659, -4105.1750, 16.97011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3480.223, -4113.1470, 16.96792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(@GUID, (@POINT := @POINT + 1), -3472.327, -4115.8670, 16.96620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);-- Altar of Sha'tar -- Shadowmoon Valley
-- Altar of Sha'tar Vindicator -- waypoints
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 76801;
DELETE FROM creature_movement WHERE id = 76801;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(76801,1,-3048.58,811.772,-10.4179,0,0,0,0,0,0,0,0,0,0,1.2004,0,0),
(76801,2,-3048.34,818.511,-10.4845,0,0,0,0,0,0,0,0,0,0,1.15013,0,0),
(76801,3,-3045.79,823.876,-10.5028,0,0,0,0,0,0,0,0,0,0,0.711097,0,0),
(76801,4,-3037.01,827.66,-10.4129,0,0,0,0,0,0,0,0,0,0,0.727591,0,0),
(76801,5,-3012.69,855.806,-10.4971,0,0,0,0,0,0,0,0,0,0,0.518675,0,0),
(76801,6,-3007.02,859.512,-9.04558,0,0,0,0,0,0,0,0,0,0,0.32154,0,0),
(76801,7,-2993.32,863.408,-8.71289,0,0,0,0,0,0,0,0,0,0,0.00188247,0,0),
(76801,8,-2987.23,863.706,-8.63931,4000,0,0,0,0,0,0,0,0,0,6.24737,0,0),
(76801,9,-2996.22,863.37,-8.7418,0,0,0,0,0,0,0,0,0,0,3.33747,0,0),
(76801,10,-3006.27,859.969,-8.90674,0,0,0,0,0,0,0,0,0,0,3.68619,0,0),
(76801,11,-3013.39,856.758,-10.493,0,0,0,0,0,0,0,0,0,0,3.82206,0,0),
(76801,12,-3038.15,827.185,-10.4295,0,0,0,0,0,0,0,0,0,0,3.69247,0,0),
(76801,13,-3044.78,824.265,-10.5029,0,0,0,0,0,0,0,0,0,0,3.8645,0,0),
(76801,14,-3048.3,818.94,-10.4888,0,0,0,0,0,0,0,0,0,0,4.46995,0,0),
(76801,15,-3048.79,811.524,-10.4148,0,0,0,0,0,0,0,0,0,0,4.38905,0,0),
(76801,16,-3061.71,790.621,-10.1069,0,0,0,0,0,0,0,0,0,0,3.82907,0,0),
(76801,17,-3067.3,787.768,-10.1496,0,0,0,0,0,0,0,0,0,0,3.28793,0,0),
(76801,18,-3074.11,788.496,-8.57641,0,0,0,0,0,0,0,0,0,0,3.0154,0,0),
(76801,19,-3067.02,787.852,-10.1493,0,0,0,0,0,0,0,0,0,0,0.259434,0,0),
(76801,20,-3063,789.95,-10.116,0,0,0,0,0,0,0,0,0,0,0.829602,0,0),
(76801,21,-3058.71,794.269,-10.1038,0,0,0,0,0,0,0,0,0,0,0.88458,0,0);
-- Aldor Gryphon Guard
UPDATE creature_template SET InhabitType = 5 WHERE entry = 22077;
UPDATE creature SET position_x = -3048.706299, position_y = 799.290039, position_z = 44.591446, orientation = 0.852570 WHERE guid = 86779;
UPDATE creature SET position_x = -2993.764160, position_y = 874.644897, position_z = 60.877647, orientation = 4.146492 WHERE guid = 86780;

-- duplicates removed -- Altar of Sha'tar Vindicator
DELETE FROM creature WHERE guid IN (76795,76796,76799);
DELETE FROM creature_addon WHERE guid IN (76795,76796,76799);
DELETE FROM creature_movement WHERE id IN (76795,76796,76799);
DELETE FROM game_event_creature WHERE guid IN (76795,76796,76799);
DELETE FROM game_event_creature_data WHERE guid IN (76795,76796,76799);
DELETE FROM creature_battleground WHERE guid IN (76795,76796,76799);
DELETE FROM creature_linking WHERE guid IN (76795,76796,76799) OR master_guid IN (76795,76796,76799);
-- ToC5 updates

-- cleanup vehicle accessory - vehicles handled by script
DELETE FROM vehicle_accessory WHERE vehicle_entry IN (35638,35635,35640,35641,35634,35637,35633,35768,34658,35636);

-- champion, mounts and trash updates
UPDATE creature_template SET vehicleTemplateId=489, MinLevel=80, MaxLevel=80, MinLevelHealth=12600, MaxLevelHealth=12600, UnitFlags=UnitFlags|33587456 WHERE entry=35768;
UPDATE creature_template SET vehicleTemplateId=430, MinLevel=80, MaxLevel=80, MinLevelHealth=12600, MaxLevelHealth=12600, UnitFlags=UnitFlags|33587456 WHERE entry=34658;
UPDATE creature_template SET MinLevel=80, MaxLevel=80, MinLevelHealth=12600, MaxLevelHealth=12600, UnitFlags=UnitFlags|33587456 WHERE entry IN (35636,35633,35637,35638,35634);
UPDATE creature_template SET UnitFlags=UnitFlags|33024 WHERE entry IN (34705,34702,34701,34657,34703,35572,35617);
UPDATE creature_template SET UnitFlags=UnitFlags|768 WHERE entry IN (35327,35314,35329,35332,35330,35331,35328);
UPDATE creature_template SET FactionAlliance=80, FactionHorde=80 WHERE entry=34657;
UPDATE creature_template SET FactionAlliance=1638, FactionHorde=1638 WHERE entry=34701;
UPDATE creature_template SET FactionAlliance=875, FactionHorde=875 WHERE entry=34702;
UPDATE creature_template SET FactionAlliance=55, FactionHorde=55 WHERE entry=34703;
UPDATE creature_template SET FactionAlliance=1078, FactionHorde=1078 WHERE entry=34705;
-- Shadowmoon Valley
-- Scorchshell Pincer -- spawn points corrected
UPDATE creature SET position_x = -2987.780273, position_y = 643.577454, position_z = 19.287279, orientation = 5.067141, MovementType = 1, spawndist = 2 WHERE guid = 76519;
UPDATE creature SET position_x = -3055.746338, position_y = 572.366089, position_z = 4.913166, orientation = 3.622008, MovementType = 1, spawndist = 2 WHERE guid = 76517;
UPDATE creature SET position_x = -3004.114502, position_y = 483.591797, position_z = -15.909133, orientation = 4.808893, MovementType = 1, spawndist = 2 WHERE guid = 76516;
-- q.12711 'Abandoned Mail'
-- only template.. core still needed to send this mail to player after q. completed. 
DELETE FROM mail_loot_template WHERE entry = 236;
INSERT INTO mail_loot_template VALUES (236, 39317, 100, 0, 1, 1, 0);
-- Req. cmangos 12805

-- Minshina's Skull(q.808)
-- both npc's will 'face' player after q. completed
 DELETE FROM dbscripts_on_quest_end WHERE id = 808;
 INSERT INTO dbscripts_on_quest_end VALUES 
 (808,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
 (808,2,10,3289,14000,0,0,0,0,0,0,0,-822.91,-4923.33,19.6365,3.41642,'summon'),
 (808,5,36,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
 (808,5,36,0,0,3289,20,0,0,0,0,0,0,0,0,0,''),
 (808,7,1,2,0,3289,20,7,0,0,0,0,0,0,0,0,''),
 (808,7,0,0,0,0,0,0,2000005776,0,0,0,0,0,0,0,''),
 (808,11,36,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
 (808,12,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
 DELETE FROM db_script_string WHERE entry = 2000005776;
 INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
 (2000005776,'I thank you, $N. And my brother thanks you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,2,NULL);
 UPDATE quest_template SET CompleteScript = 808 WHERE entry = 808;
 
-- The Prodigal Lich Returns(q.411)
-- summoned npc will 'face' player after q. completed
DELETE FROM dbscripts_on_quest_end WHERE id = 411;
INSERT INTO dbscripts_on_quest_end VALUES
(411,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(411,2,15,7673,0,0,0,4,0,0,0,0,0,0,0,0,'Bethor - Cast 7673'),
(411,7,10,5666,23000,0,0,0,0,0,0,0,1768.58,55.4891,-46.3198,2.28248,'Summon Visage'),
(411,21,36,0,0,5666,20,0,0,0,0,0,0,0,0,0,''),
(411,23,0,0,0,5666,10,0,2000000210,0,0,0,0,0,0,0,'Visage Say 3'),
(411,23,1,2,0,5666,10,0,0,0,0,0,0,0,0,0,''),
(411,30,0,0,0,0,0,0,2000000211,0,0,0,0,0,0,0,'Bethor Say'),
(411,31,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
-- q.12687 'Into the Realm of Shadows'
DELETE FROM dbscripts_on_quest_start WHERE id = 12687;
INSERT INTO dbscripts_on_quest_start (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(12687,1,15,52693,0,0,0,6,0,0,0,0,0,0,0,0,'');
UPDATE quest_template SET StartScript = 12687 WHERE entry = 12687;
-- ---------------------------
-- DK Starting Zone - phase 1 - part1.
-- ---------------------------

-- duplicates removed. (will reuse them in next phases)
DELETE FROM creature WHERE guid IN (129549,129561,129552,129551,129524,129513,129559,129523,129527,129515,129537,129536,129560,129514,129542,129508,129539,129510,129538,129534,129528,129535,129525,129512,
129509,129505,129506,129504,129500,129501,129543,129540,129526,129541,129511,129554,128554,128556,128555,129502,129503,129507,129557,128517,128518,128519,128520,129461,129462,129463,129280,128498,128499,
128703,128638,128634,128635,128633,128637,128628,128627,128636,128716,128727,128632,128631,128630,128724,128717,128721,128669,128719,128718,128720,128686,128629,128639,129255,129259,129263,129293,129295,
129305,129294,129298,129310,129214,129236,129215,129251,129235,129246,129249,129248,129247,129245,129152,129151,128908,128883,128906,128881,128907,128882,128903,128878,128892,128867,128886,128861,128862,
128887,128871,128884,128896,128909,128890,128865,128877,128902,128888,128863,128872,128897,128891,128866,128900,128875,128640,128704,128642,128723,128726,128729,128732,128725,128728,128731,128673,128672,
128665,128671,128670,128666,128664,128663,128667,128650,128649,128647,128646,128733,128648,128645,128644,128734,128643,128685,128714,128715,128651,128662,128668,128674,128675,128682,128676,128713,128681,
128736,128708,128711,128705,128706,128712,128707,128710,128709,128677,128678,128683,128679,128680,128684,128641,128697,129165,129168,128701,128702,128698,128699,129171,129170,128700,129169,128722,128521,
128730,129270,129271,129283,129272,128786,128794,128776,128763,128784);
DELETE FROM creature_addon WHERE guid IN (129549,129561,129552,129551,129524,129513,129559,129523,129527,129515,129537,129536,129560,129514,129542,129508,129539,129510,129538,129534,129528,129535,129525,
129512,129509,129505,129506,129504,129500,129501,129543,129540,129526,129541,129511,129554,128554,128556,128555,129502,129503,129507,129557,128517,128518,128519,128520,129461,129462,129463,129280,128498,
128499,128703,128638,128634,128635,128633,128637,128628,128627,128636,128716,128727,128632,128631,128630,128724,128717,128721,128669,128719,128718,128720,128686,128629,128639,129255,129259,129263,129293,
129295,129305,129294,129298,129310,129214,129236,129215,129251,129235,129246,129249,129248,129247,129245,129152,129151,128908,128883,128906,128881,128907,128882,128903,128878,128892,128867,128886,128861,
128862,128887,128871,128884,128896,128909,128890,128865,128877,128902,128888,128863,128872,128897,128891,128866,128900,128875,128640,128704,128642,128723,128726,128729,128732,128725,128728,128731,128673,
128672,128665,128671,128670,128666,128664,128663,128667,128650,128649,128647,128646,128733,128648,128645,128644,128734,128643,128685,128714,128715,128651,128662,128668,128674,128675,128682,128676,128713,
128681,128736,128708,128711,128705,128706,128712,128707,128710,128709,128677,128678,128683,128679,128680,128684,128641,128697,129165,129168,128701,128702,128698,128699,129171,129170,128700,129169,128722,
128521,128730,129270,129271,129283,129272,128786,128794,128776,128763,128784);
DELETE FROM creature_movement WHERE id IN (129549,129561,129552,129551,129524,129513,129559,129523,129527,129515,129537,129536,129560,129514,129542,129508,129539,129510,129538,129534,129528,129535,129525,
129512,129509,129505,129506,129504,129500,129501,129543,129540,129526,129541,129511,129554,128554,128556,128555,129502,129503,129507,129557,128517,128518,128519,128520,129461,129462,129463,129280,128498,
128499,128703,128638,128634,128635,128633,128637,128628,128627,128636,128716,128727,128632,128631,128630,128724,128717,128721,128669,128719,128718,128720,128686,128629,128639,129255,129259,129263,129293,
129295,129305,129294,129298,129310,129214,129236,129215,129251,129235,129246,129249,129248,129247,129245,129152,129151,128908,128883,128906,128881,128907,128882,128903,128878,128892,128867,128886,128861,
128862,128887,128871,128884,128896,128909,128890,128865,128877,128902,128888,128863,128872,128897,128891,128866,128900,128875,128640,128704,128642,128723,128726,128729,128732,128725,128728,128731,128673,
128672,128665,128671,128670,128666,128664,128663,128667,128650,128649,128647,128646,128733,128648,128645,128644,128734,128643,128685,128714,128715,128651,128662,128668,128674,128675,128682,128676,128713,
128681,128736,128708,128711,128705,128706,128712,128707,128710,128709,128677,128678,128683,128679,128680,128684,128641,128697,129165,129168,128701,128702,128698,128699,129171,129170,128700,129169,128722,
128521,128730,129270,129271,129283,129272,128786,128794,128776,128763,128784);
DELETE FROM game_event_creature WHERE guid IN (129549,129561,129552,129551,129524,129513,129559,129523,129527,129515,129537,129536,129560,129514,129542,129508,129539,129510,129538,129534,129528,129535,
129525,129512,129509,129505,129506,129504,129500,129501,129543,129540,129526,129541,129511,129554,128554,128556,128555,129502,129503,129507,129557,128517,128518,128519,128520,129461,129462,129463,129280,
128498,128499,128703,128638,128634,128635,128633,128637,128628,128627,128636,128716,128727,128632,128631,128630,128724,128717,128721,128669,128719,128718,128720,128686,128629,128639,129255,129259,129263,
129293,129295,129305,129294,129298,129310,129214,129236,129215,129251,129235,129246,129249,129248,129247,129245,129152,129151,128908,128883,128906,128881,128907,128882,128903,128878,128892,128867,128886,
128861,128862,128887,128871,128884,128896,128909,128890,128865,128877,128902,128888,128863,128872,128897,128891,128866,128900,128875,128640,128704,128642,128723,128726,128729,128732,128725,128728,128731,
128673,128672,128665,128671,128670,128666,128664,128663,128667,128650,128649,128647,128646,128733,128648,128645,128644,128734,128643,128685,128714,128715,128651,128662,128668,128674,128675,128682,128676,
128713,128681,128736,128708,128711,128705,128706,128712,128707,128710,128709,128677,128678,128683,128679,128680,128684,128641,128697,129165,129168,128701,128702,128698,128699,129171,129170,128700,129169,
128722,128521,128730,129270,129271,129283,129272,128786,128794,128776,128763,128784);
DELETE FROM game_event_creature_data WHERE guid IN (129549,129561,129552,129551,129524,129513,129559,129523,129527,129515,129537,129536,129560,129514,129542,129508,129539,129510,129538,129534,129528,129535,
129525,129512,129509,129505,129506,129504,129500,129501,129543,129540,129526,129541,129511,129554,128554,128556,128555,129502,129503,129507,129557,128517,128518,128519,128520,129461,129462,129463,129280,
128498,128499,128703,128638,128634,128635,128633,128637,128628,128627,128636,128716,128727,128632,128631,128630,128724,128717,128721,128669,128719,128718,128720,128686,128629,128639,129255,129259,129263,
129293,129295,129305,129294,129298,129310,129214,129236,129215,129251,129235,129246,129249,129248,129247,129245,129152,129151,128908,128883,128906,128881,128907,128882,128903,128878,128892,128867,128886,
128861,128862,128887,128871,128884,128896,128909,128890,128865,128877,128902,128888,128863,128872,128897,128891,128866,128900,128875,128640,128704,128642,128723,128726,128729,128732,128725,128728,128731,
128673,128672,128665,128671,128670,128666,128664,128663,128667,128650,128649,128647,128646,128733,128648,128645,128644,128734,128643,128685,128714,128715,128651,128662,128668,128674,128675,128682,128676,
128713,128681,128736,128708,128711,128705,128706,128712,128707,128710,128709,128677,128678,128683,128679,128680,128684,128641,128697,129165,129168,128701,128702,128698,128699,129171,129170,128700,129169,
128722,128521,128730,129270,129271,129283,129272,128786,128794,128776,128763,128784);
DELETE FROM creature_battleground WHERE guid IN (129549,129561,129552,129551,129524,129513,129559,129523,129527,129515,129537,129536,129560,129514,129542,129508,129539,129510,129538,129534,129528,129535,
129525,129512,129509,129505,129506,129504,129500,129501,129543,129540,129526,129541,129511,129554,128554,128556,128555,129502,129503,129507,129557,128517,128518,128519,128520,129461,129462,129463,129280,
128498,128499,128703,128638,128634,128635,128633,128637,128628,128627,128636,128716,128727,128632,128631,128630,128724,128717,128721,128669,128719,128718,128720,128686,128629,128639,129255,129259,129263,
129293,129295,129305,129294,129298,129310,129214,129236,129215,129251,129235,129246,129249,129248,129247,129245,129152,129151,128908,128883,128906,128881,128907,128882,128903,128878,128892,128867,128886,
128861,128862,128887,128871,128884,128896,128909,128890,128865,128877,128902,128888,128863,128872,128897,128891,128866,128900,128875,128640,128704,128642,128723,128726,128729,128732,128725,128728,128731,
128673,128672,128665,128671,128670,128666,128664,128663,128667,128650,128649,128647,128646,128733,128648,128645,128644,128734,128643,128685,128714,128715,128651,128662,128668,128674,128675,128682,128676,
128713,128681,128736,128708,128711,128705,128706,128712,128707,128710,128709,128677,128678,128683,128679,128680,128684,128641,128697,129165,129168,128701,128702,128698,128699,129171,129170,128700,129169,
128722,128521,128730,129270,129271,129283,129272,128786,128794,128776,128763,128784);
DELETE FROM creature_linking WHERE guid IN (129549,129561,129552,129551,129524,129513,129559,129523,129527,129515,129537,129536,129560,129514,129542,129508,129539,129510,129538,129534,129528,129535,129525,
129512,129509,129505,129506,129504,129500,129501,129543,129540,129526,129541,129511,129554,128554,128556,128555,129502,129503,129507,129557,128517,128518,128519,128520,129461,129462,129463,129280,128498,128499,
128703,128638,128634,128635,128633,128637,128628,128627,128636,128716,128727,128632,128631,128630,128724,128717,128721,128669,128719,128718,128720,128686,128629,128639,129255,129259,129263,129293,129295,129305,
129294,129298,129310,129214,129236,129215,129251,129235,129246,129249,129248,129247,129245,129152,129151,128908,128883,128906,128881,128907,128882,128903,128878,128892,128867,128886,128861,128862,128887,128871,
128884,128896,128909,128890,128865,128877,128902,128888,128863,128872,128897,128891,128866,128900,128875,128640,128704,128642,128723,128726,128729,128732,128725,128728,128731,128673,128672,128665,128671,128670,
128666,128664,128663,128667,128650,128649,128647,128646,128733,128648,128645,128644,128734,128643,128685,128714,128715,128651,128662,128668,128674,128675,128682,128676,128713,128681,128736,128708,128711,128705,
128706,128712,128707,128710,128709,128677,128678,128683,128679,128680,128684,128641,128697,129165,129168,128701,128702,128698,128699,129171,129170,128700,129169,128722,128521,128730,129270,129271,129283,129272,
128786,128794,128776,128763,128784) OR master_guid IN (129549,129561,129552,129551,129524,129513,129559,129523,129527,129515,129537,129536,129560,129514,129542,129508,129539,129510,129538,129534,129528,129535,
129525,129512,129509,129505,129506,129504,129500,129501,129543,129540,129526,129541,129511,129554,128554,128556,128555,129502,129503,129507,129557,128517,128518,128519,128520,129461,129462,129463,129280,128498,
128499,128703,128638,128634,128635,128633,128637,128628,128627,128636,128716,128727,128632,128631,128630,128724,128717,128721,128669,128719,128718,128720,128686,128629,128639,129255,129259,129263,129293,129295,
129305,129294,129298,129310,129214,129236,129215,129251,129235,129246,129249,129248,129247,129245,129152,129151,128908,128883,128906,128881,128907,128882,128903,128878,128892,128867,128886,128861,128862,128887,
128871,128884,128896,128909,128890,128865,128877,128902,128888,128863,128872,128897,128891,128866,128900,128875,128640,128704,128642,128723,128726,128729,128732,128725,128728,128731,128673,128672,128665,128671,
128670,128666,128664,128663,128667,128650,128649,128647,128646,128733,128648,128645,128644,128734,128643,128685,128714,128715,128651,128662,128668,128674,128675,128682,128676,128713,128681,128736,128708,128711,
128705,128706,128712,128707,128710,128709,128677,128678,128683,128679,128680,128684,128641,128697,129165,129168,128701,128702,128698,128699,129171,129170,128700,129169,128722,128521,128730,129272);

-- CREATURES UPDATES --
-- Scourge Gryphon -- correct inhabitType
UPDATE creature_template SET InhabitType = 5 WHERE entry IN (29488,29501);
-- Sky Darkener Target -- correct inhabitType
UPDATE creature_template SET InhabitType = 5 WHERE entry = 28655;
-- Scarlet Gryphon -- correct speed
UPDATE creature_template SET SpeedRun = 3.142857 WHERE entry = 28614;
-- Squire Edwards
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 128514;
-- Acherus Geist
UPDATE creature_template SET SpeedWalk = 1.6, SpeedRun = 1.42857 WHERE entry = 28709;
UPDATE creature SET position_x = 2374.8103, position_y = -5768.86914, position_z = 151.36789, orientation = 1.0397, spawndist = 10, MovementType = 1 WHERE guid = 128493;
UPDATE creature SET position_x = 2308.156738, position_y = -5692.175293, position_z = 154.035553, orientation = 5.493559, spawndist = 10, MovementType = 1 WHERE guid = 128492;
UPDATE creature SET position_x = 2294.674805, position_y = -5664.577148, position_z = 149.566483, orientation = 5.033237, spawndist = 10, MovementType = 1 WHERE guid = 128491;
UPDATE creature SET position_x = 2353.526855, position_y = -5650.782715, position_z = 155.107605, orientation = 5.975759, spawndist = 10, MovementType = 1 WHERE guid = 128490;
UPDATE creature SET position_x = 2388.947510, position_y = -5671.491211, position_z = 153.925858, orientation = 5.407634, spawndist = 15, MovementType = 1 WHERE guid = 128485;
UPDATE creature SET position_x = 2407.680664, position_y = -5656.884766, position_z = 156.329193, orientation = 6.108020, spawndist = 10, MovementType = 1 WHERE guid = 128489;
UPDATE creature SET position_x = 2396.615234, position_y = -5642.852051, position_z = 156.710114, orientation = 1.415266, spawndist = 10, MovementType = 1 WHERE guid = 128488;
UPDATE creature SET position_x = 2274.42, position_y = -5646.18, position_z = 142.258, orientation = 3.61903, spawndist = 0, MovementType = 2 WHERE guid = 128494;
UPDATE creature SET position_x = 2259.67, position_y = -5641.18, position_z = 138.909, orientation = 3.15041, spawndist = 0, MovementType = 2 WHERE guid = 128495;
UPDATE creature SET position_x = 2317.49, position_y = -5661.7, position_z = 153.201, orientation = 2.40253, spawndist = 0, MovementType = 2 WHERE guid = 128486;
UPDATE creature SET position_x = 2420.91, position_y = -5783.06, position_z = 144.912, orientation = 5.05147, spawndist = 0, MovementType = 2 WHERE guid = 128497;
UPDATE creature SET position_x = 2428.08, position_y = -5781.23, position_z = 143.936, orientation = 4.95301, spawndist = 0, MovementType = 2 WHERE guid = 128496;
UPDATE creature SET position_x = 2345.153809, position_y = -5720.771484, position_z = 153.922424, orientation = 0.743744, spawndist = 0, MovementType = 0 WHERE guid = 128578;
-- Orithos the Sky Darkener
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 129437;
DELETE FROM creature_movement WHERE id = 129437;
UPDATE creature_template SET MovementType = 2 WHERE entry = 28647;
DELETE FROM creature_movement_template WHERE entry = 28647;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,textid1,textid2,textid3,textid4,textid5,emote,spell,wpguid,orientation,model1,model2) VALUES
(28647,1,2283.3,-5699.41,153.962,0,0,0,0,0,0,0,0,0,0,5.48523,0,0),
(28647,2,2322.22,-5748.33,153.962,0,0,0,0,0,0,0,0,0,0,2.32793,0,0);
-- Stable Master Kitrik
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid = 128455;
DELETE FROM creature_movement WHERE id = 128455;
UPDATE creature_template SET MovementType = 2 WHERE entry = 28683;
DELETE FROM creature_movement_template WHERE entry = 28683;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,textid1,textid2,textid3,textid4,textid5,emote,spell,wpguid,orientation,model1,model2) VALUES
(28683,1,2182.12,-5810.93,101.349,0,0,0,0,0,0,0,0,0,0,3.84069,0,0),(28683,2,2176.7,-5817.58,101.346,0,0,0,0,0,0,0,0,0,0,4.69756,0,0),(28683,3,2177.05,-5823.81,101.348,0,0,0,0,0,0,0,0,0,0,5.31645,0,0),
(28683,4,2189.37,-5833.94,101.44,0,0,0,0,0,0,0,0,0,0,5.24341,0,0),(28683,5,2190.73,-5840.08,101.358,0,0,0,0,0,0,0,0,0,0,4.68022,0,0),(28683,6,2186.88,-5854.52,101.346,0,0,0,0,0,0,0,0,0,0,4.68101,0,0),
(28683,7,2189.61,-5860.73,101.322,0,0,0,0,0,0,0,0,0,0,5.66275,0,0),(28683,8,2197.14,-5864.42,101.299,0,0,0,0,0,0,0,0,0,0,6.11828,0,0),(28683,9,2206.99,-5866.2,101.335,0,0,0,0,0,0,0,0,0,0,0.0408708,0,0),
(28683,10,2223.99,-5864.09,101.328,0,0,0,0,0,0,0,0,0,0,0.46734,0,0),(28683,11,2236.62,-5857.59,101.255,0,0,0,0,0,0,0,0,0,0,0.651909,0,0),(28683,12,2245.63,-5845.25,101.234,0,0,0,0,0,0,0,0,0,0,1.18205,0,0),
(28683,13,2248.07,-5836.98,101.301,0,0,0,0,0,0,0,0,0,0,1.57082,0,0),(28683,14,2246.83,-5830.88,101.26,0,0,0,0,0,0,0,0,0,0,2.32481,0,0),(28683,15,2244.14,-5827.74,101.249,0,0,0,0,0,0,0,0,0,0,2.46757,0,0),
(28683,16,2239.05,-5825.29,101.284,0,0,0,0,0,0,0,0,0,0,3.06762,0,0),(28683,17,2227.86,-5823.52,101.561,0,0,0,0,0,0,0,0,0,0,2.79273,0,0),(28683,18,2219.38,-5817.44,101.621,0,0,0,0,0,0,0,0,0,0,2.29793,0,0),
(28683,19,2209.04,-5804.73,101.352,0,0,0,0,0,0,0,0,0,0,2.70398,0,0),(28683,20,2204.03,-5803.17,101.348,0,0,0,0,0,0,0,0,0,0,3.16029,0,0);
-- Scarlet Farm Hound
UPDATE creature SET position_x = 1993.386230, position_y = -5786.060547, position_z = 100.834045, orientation = 4.610285, spawndist = 10, MovementType = 1 WHERE guid = 128584;
UPDATE creature SET position_x = 2032.527954, position_y = -5819.889648, position_z = 100.997482, orientation = 3.675666, spawndist = 10, MovementType = 1 WHERE guid = 128586;
UPDATE creature SET position_x = 1992.902222, position_y = -5866.563477, position_z = 100.788521, orientation = 4.040874, spawndist = 10, MovementType = 1 WHERE guid = 128583;
UPDATE creature SET position_x = 1951.767578, position_y = -5825.396484, position_z = 100.842171, orientation = 3.227984, spawndist = 10, MovementType = 1 WHERE guid = 128587;
UPDATE creature SET spawndist = 10, MovementType = 1 WHERE guid = 128589;
-- Scarlet Medic
UPDATE creature SET position_x = 2237.312012, position_y = -5886.088867, position_z = 100.644066, orientation = 0.836474 WHERE guid = 129254;
UPDATE creature SET position_x = 2154.661133, position_y = -5818.730469, position_z = 101.946465, orientation = 5.117906 WHERE guid = 129253;
UPDATE creature SET position_x = 2172.88, position_y = -5729.58, position_z = 101.757, orientation = 1.30883 WHERE guid = 129257;
-- Scarlet Peasant
UPDATE creature SET orientation = 5.90615 WHERE guid = 128758;
-- Scarlet Captain
UPDATE creature SET position_x = 2148.104004, position_y = -5759.353027, position_z = 99.886795, orientation = 1.740773 WHERE guid = 129299;
-- Havenshire Stallion - spawntime req. for his event
UPDATE creature SET spawntimesecs = 20 WHERE guid = 129217;
-- Scarlet Fleet Defender - q. req.
UPDATE creature SET spawntimesecs = 30 WHERE id = 28834;
-- Scarlet Infantryman - all should have same aura addon (we can use template and remove from creature_addon)
DELETE FROM creature_addon WHERE guid IN (129264,129265,129266,129267,129268,129269,129270,129271,129272,129273,129274,129275,129276,129277,129278,129279,129281,129282,129283,129284,129285,129286,129287,
129288,129289,129290,129291);
DELETE FROM creature_template_addon WHERE entry = 28609;
INSERT INTO creature_template_addon VALUES (28609,0,0,1,0,333,0,48356);
DELETE FROM creature_addon WHERE guid IN (129282,129284);
INSERT INTO creature_addon VALUES (129282,0,0,1,0,0,0,'48356 52103'),(129284,0,0,1,0,0,0,'48356 52103'); -- these 2 has special aura
UPDATE creature SET position_x = 2417.918945, position_y = -5859.758789, position_z = 105.522697, orientation = 0.9 WHERE guid = 129286;
UPDATE creature SET position_x = 2435.682373, position_y = -5867.880859, position_z = 106.577202, orientation = 1.6 WHERE guid = 129287;
UPDATE creature SET position_x = 2144.156006, position_y = -5674.584961, position_z = 110.115265, orientation = 0.2 WHERE guid = 129291;
UPDATE creature SET position_x = 2208.773682, position_y = -5719.310059, position_z = 101.472847, orientation = 6.15 WHERE guid = 129282;
-- Scarlet Peasant
UPDATE creature SET position_x = 2134.455811, position_y = -5743.186035, position_z = 99.443970, orientation = 2.490976 WHERE guid = 128792;
UPDATE creature SET position_x = 2085.78, position_y = -5754.1, position_z = 99.3376, orientation = 6.07106 WHERE guid = 128766;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (128755,128761);
DELETE FROM creature_addon WHERE guid IN (128766,128782,128772,128774,128791,128792,128795);
INSERT INTO creature_addon VALUES (128766,0,0,1,0,234,0,48356),(128782,0,0,1,0,234,0,48356),(128772,0,0,1,0,234,0,48356),(128774,0,0,1,0,234,0,48356),(128791,0,0,1,0,234,0,48356),(128792,0,0,1,0,234,0,48356),(128795,0,0,1,0,234,0,48356);

-- WAYPOINTS --  for phase 1
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (128582,129460,128486,128484,128494,128495,128497,128496,129261,129254,129253,129256,129262,129292,129301,129300,129302,129296,129297,129299,129303,
129308,129309,128739,129212,129217,129024,129051,129146,129020,129153,129282,129284);
DELETE FROM creature_movement WHERE id IN (128582,129460,128486,128484,128494,128495,128497,128496,129261,129254,129253,129256,129262,129292,129301,129300,129302,129296,129297,129299,129303,129308,129309,128739,
129212,129217,129024,129051,129146,129020,129153,129282,129284);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128582,1,2355.03,-5650.57,382.306,0,0,0,0,0,0,0,0,0,0,5.60655,0,0),(128582,2,2364.95,-5662.84,382.266,0,0,0,0,0,0,0,0,0,0,5.32226,0,0),(128582,3,2368.88,-5671.55,382.243,0,0,0,0,0,0,0,0,0,0,4.84552,0,0),
(128582,4,2368.09,-5677.81,382.229,0,0,0,0,0,0,0,0,0,0,4.45439,0,0),(128582,5,2366.49,-5680.22,382.23,0,0,0,0,0,0,0,0,0,0,3.97294,0,0),(128582,6,2358.36,-5684.71,382.239,0,0,0,0,0,0,0,0,0,0,3.50013,0,0),
(128582,7,2354.14,-5684.11,382.239,0,0,0,0,0,0,0,0,0,0,2.88909,0,0),(128582,8,2351.7,-5680.64,382.239,0,0,0,0,0,0,0,0,0,0,1.80132,0,0),(128582,9,2352.91,-5677.18,382.239,0,0,0,0,0,0,0,0,0,0,1.48106,0,0),
(128582,10,2353.32,-5675.03,382.24,0,0,0,0,0,0,0,0,0,0,1.64914,0,0),(128582,11,2352.16,-5670.21,382.242,0,0,0,0,0,0,0,0,0,0,1.96854,0,0),(128582,12,2350.49,-5666.54,382.242,0,0,0,0,0,0,0,0,0,0,2.31944,0,0),
(128582,13,2346.84,-5663.05,382.243,0,0,0,0,0,0,0,0,0,0,2.8221,0,0),(128582,14,2338.82,-5660.43,382.24,0,0,0,0,0,0,0,0,0,0,2.49223,0,0),(128582,15,2338.06,-5655.55,382.24,0,0,0,0,0,0,0,0,0,0,1.02196,0,0),
(128582,16,2343.97,-5651.11,382.282,0,0,0,0,0,0,0,0,0,0,0.612259,0,0),(129460,1,2381.17,-5731.63,153.922,0,0,0,0,0,0,0,0,0,0,2.28931,0,0),(129460,2,2335.24,-5682.83,153.922,0,0,0,0,0,0,0,0,0,0,5.39556,0,0),
(128486,1,2317.49,-5661.7,153.201,2000,2870901,0,0,0,0,0,0,0,0,2.40253,0,0),(128486,2,2339.6,-5683.8,153.922,0,0,0,0,0,0,0,0,0,0,5.5874,0,0),(128486,3,2355.11,-5702.48,153.92,0,0,0,0,0,0,0,0,0,0,5.47194,0,0),
(128486,4,2385.46,-5730.73,153.922,0,0,0,0,0,0,0,0,0,0,5.43574,0,0),(128486,5,2407.29,-5754.73,153.907,2000,0,0,0,0,0,0,0,0,0,5.50643,0,0),(128486,6,2363.77,-5709.2,153.923,0,0,0,0,0,0,0,0,0,0,2.27844,0,0),
(128486,7,2317.49,-5661.7,153.201,2000,0,0,0,0,0,0,0,0,0,2.4,0,0),(128484,1,2322.74,-5624.89,152.099,1000,2870901,0,0,0,0,0,0,0,0,0.2,0,0),(128484,2,2312.95,-5645.39,149.817,0,0,0,0,0,0,0,0,0,0,0.21,0,0),
(128494,1,2274.42,-5646.18,142.258,1000,2870901,0,0,0,0,0,0,0,0,3.62,0,0),(128494,2,2263.38,-5651.55,138.595,0,0,0,0,0,0,0,0,0,0,3.37974,0,0),(128494,3,2220.51,-5658.85,125.151,0,0,0,0,0,0,0,0,0,0,3.72,0,0),
(128494,4,2206.73,-5668.97,118.319,0,0,0,0,0,0,0,0,0,0,3.72453,0,0),(128494,5,2184.66,-5685.67,110.593,0,0,0,0,0,0,0,0,0,0,1.62937,0,0),(128494,6,2183.91,-5677.17,112.45,0,0,0,0,0,0,0,0,0,0,1.07671,0,0),
(128494,7,2202.52,-5652.79,121.832,0,0,0,0,0,0,0,0,0,0,0.505729,0,0),(128494,8,2234.02,-5638.04,133.237,0,0,0,0,0,0,0,0,0,0,0.255441,0,0),(128494,9,2262.76,-5630.8,142.946,0,0,0,0,0,0,0,0,0,0,5.64327,0,0),
(128494,10,2279.18,-5643.24,143.819,0,0,0,0,0,0,0,0,0,0,3.68213,0,0),(128495,1,2259.67,-5641.18,138.909,1000,2870901,0,0,0,0,0,0,0,0,3.15,0,0),(128495,2,2220.92,-5644.93,127.963,0,0,0,0,0,0,0,0,0,0,3.7,0,0),
(128495,3,2180.75,-5671.91,113.432,0,0,0,0,0,0,0,0,0,0,5.07701,0,0),(128495,4,2186.25,-5687.66,110.304,0,0,0,0,0,0,0,0,0,0,0.591784,0,0),(128495,5,2198.87,-5677.85,113.546,0,0,0,0,0,0,0,0,0,0,0.827452,0,0),
(128495,6,2211.37,-5665.1,120.953,0,0,0,0,0,0,0,0,0,0,0.4346,0,0),(128495,7,2215.85,-5662.83,122.909,0,0,0,0,0,0,0,0,0,0,0.113371,0,0),(128495,8,2230.85,-5660.58,127.762,0,0,0,0,0,0,0,0,0,0,0.217311,0,0),
(128495,9,2268.12,-5652.45,140.123,0,0,0,0,0,0,0,0,0,0,2.3,0,0),(128497,1,2420.91,-5783.06,144.912,1000,2870901,0,0,0,0,0,0,0,0,5.05147,0,0),(128497,2,2424.91,-5795.56,136.284,0,0,0,0,0,0,0,0,0,0,5.0,0,0),
(128497,3,2430.05,-5813.4,123.698,0,0,0,0,0,0,0,0,0,0,4.76715,0,0),(128497,4,2431.55,-5839.9,112.193,0,0,0,0,0,0,0,0,0,0,5.14022,0,0),(128497,5,2435.88,-5848.18,110.821,0,0,0,0,0,0,0,0,0,0,1.28234,0,0),
(128497,6,2439.07,-5830.71,117.19,0,0,0,0,0,0,0,0,0,0,1.7575,0,0),(128497,7,2437.07,-5817.21,121.852,0,0,0,0,0,0,0,0,0,0,1.7575,0,0),(128497,8,2433.13,-5798.02,133.529,0,0,0,0,0,0,0,0,0,0,1.72991,0,0),
(128497,9,2428.88,-5780.52,144.159,0,0,0,0,0,0,0,0,0,0,3.64,0,0),(128496,1,2428.08,-5781.23,143.936,1000,2870901,0,0,0,0,0,0,0,0,4.95,0,0),(128496,2,2431.83,-5801.73,131.007,0,0,0,0,0,0,0,0,0,0,4.9,0,0),
(128496,3,2434.52,-5815.74,122.281,0,0,0,0,0,0,0,0,0,0,4.70491,0,0),(128496,4,2435.68,-5850.09,110.343,0,0,0,0,0,0,0,0,0,0,2.27017,0,0),(128496,5,2426.39,-5839.45,112.787,0,0,0,0,0,0,0,0,0,0,1.48386,0,0),
(128496,6,2426.89,-5832.45,115.05,0,0,0,0,0,0,0,0,0,0,1.48386,0,0),(128496,7,2428.61,-5806.57,127.862,0,0,0,0,0,0,0,0,0,0,1.87184,0,0),(128496,8,2424.36,-5792.57,138.63,0,0,0,0,0,0,0,0,0,0,1.87184,0,0),
(128496,9,2420.36,-5779.07,146.508,0,0,0,0,0,0,0,0,0,0,6.21274,0,0),(128496,10,2426.77,-5779.23,145.036,0,0,0,0,0,0,0,0,0,0,5.28497,0,0),(129261,1,2234.92,-5793.99,101.102,0,0,0,0,0,0,0,0,0,0,5.56788,0,0),
(129261,2,2261.4,-5818.23,100.942,0,0,0,0,0,0,0,0,0,0,5.5616,0,0),(129261,3,2234.54,-5793.41,101.12,0,0,0,0,0,0,0,0,0,0,2.9101,0,0),(129261,4,2214.49,-5784.49,101.671,0,0,0,0,0,0,0,0,0,0,2.69097,0,0),
(129254,1,2256.55,-5872.22,101.04,0,0,0,0,0,0,0,0,0,0,1.22227,0,0),(129254,2,2264.65,-5849.63,100.963,0,0,0,0,0,0,0,0,0,0,1.21834,0,0),(129254,3,2256.31,-5872.61,101.024,0,0,0,0,0,0,0,0,0,0,3.78423,0,0),
(129254,4,2237.18,-5886.35,100.642,0,0,0,0,0,0,0,0,0,0,3.75135,0,0),(129253,1,2166.3,-5854.62,102.069,0,0,0,0,0,0,0,0,0,0,4.94512,0,0),(129253,2,2154.54,-5818.22,101.968,0,0,0,0,0,0,0,0,0,0,1.61267,0,0),
(129253,3,2156.74,-5803.89,101.03,0,0,0,0,0,0,0,0,0,0,0.73931,0,0),(129253,4,2180.79,-5786.99,101.244,0,0,0,0,0,0,0,0,0,0,0.623071,0,0),(129253,5,2156.5,-5804.16,101.029,0,0,0,0,0,0,0,0,0,0,3.88247,0,0),
(129253,6,2154.54,-5818.87,101.94,0,0,0,0,0,0,0,0,0,0,4.83359,0,0),(129256,1,2178.25,-5768.01,101.347,0,0,0,0,0,0,0,0,0,0,4.77781,0,0),(129256,2,2177.1,-5777.93,101.486,0,0,0,0,0,0,0,0,0,0,3.92173,0,0),
(129256,3,2144.9,-5798.32,100.248,0,0,0,0,0,0,0,0,0,0,2.88579,0,0),(129256,4,2135.81,-5792.78,99.4591,0,0,0,0,0,0,0,0,0,0,2.07133,0,0),(129256,5,2133.99,-5784.35,99.0072,0,0,0,0,0,0,0,0,0,0,1.32677,0,0),
(129256,6,2142.39,-5776.05,99.476,0,0,0,0,0,0,0,0,0,0,0.450266,0,0),(129256,7,2171.29,-5760.64,101.007,0,0,0,0,0,0,0,0,0,0,0.465974,0,0),(129262,1,2380.18,-5895.07,106.803,0,0,0,0,0,0,0,0,0,0,5.15648,0,0),
(129262,2,2386.34,-5904.35,108.859,0,0,0,0,0,0,0,0,0,0,5.41409,0,0),(129262,3,2394.96,-5911.07,110.217,0,0,0,0,0,0,0,0,0,0,5.29863,0,0),(129262,4,2388.04,-5925.44,110.273,0,0,0,0,0,0,0,0,0,0,3.50479,0,0),
(129262,5,2377.38,-5916.79,109.682,0,0,0,0,0,0,0,0,0,0,1.98976,0,0),(129262,6,2364.79,-5873.76,104.568,0,0,0,0,0,0,0,0,0,0,1.62455,0,0),(129262,7,2369.69,-5862.65,104.526,0,0,0,0,0,0,0,0,0,0,0.807665,0,0),
(129262,8,2404.63,-5858.52,105.559,0,0,0,0,0,0,0,0,0,0,6.04313,0,0),(129262,9,2408.87,-5866.88,104.606,0,0,0,0,0,0,0,0,0,0,4.1566,0,0),(129262,10,2385.9,-5867.91,104.71,0,0,0,0,0,0,0,0,0,0,3.39389,0,0),
(129262,11,2378.67,-5870.52,104.682,0,0,0,0,0,0,0,0,0,0,3.76067,0,0),(129262,12,2373.55,-5878.07,104.849,0,0,0,0,0,0,0,0,0,0,4.75498,0,0),(129301,1,2303.02,-5853.49,100.935,0,0,0,0,0,0,0,0,0,0,1.16618,0,0),
(129301,2,2306.9,-5831.2,101.009,0,0,0,0,0,0,0,0,0,0,2.04662,0,0),(129301,3,2302.2,-5823.47,101.038,0,0,0,0,0,0,0,0,0,0,2.40868,0,0),(129301,4,2287.62,-5813.63,101.017,0,0,0,0,0,0,0,0,0,0,2.92705,0,0),
(129301,5,2271.13,-5813.72,100.935,0,0,0,0,0,0,0,0,0,0,3.49568,0,0),(129301,6,2259.04,-5824.1,100.974,0,0,0,0,0,0,0,0,0,0,4.35569,0,0),(129301,7,2258.25,-5833,101.097,0,0,0,0,0,0,0,0,0,0,4.62821,0,0),
(129301,8,2262.88,-5846.46,100.951,0,0,0,0,0,0,0,0,0,0,5.76075,0,0),(129301,9,2275.32,-5851.56,100.981,0,0,0,0,0,0,0,0,0,0,5.97164,0,0),(129301,10,2286.22,-5860.48,100.931,0,0,0,0,0,0,0,0,0,0,6.12322,0,0),
(129301,11,2298.18,-5858.98,100.933,0,0,0,0,0,0,0,0,0,0,0.646633,0,0),(129300,1,2113.16,-5749.31,99.2333,0,0,0,0,0,0,0,0,0,0,4.73853,0,0),(129300,2,2111.5,-5770.31,98.2899,0,0,0,0,0,0,0,0,0,0,3.95313,0,0),
(129300,3,2088.44,-5771.71,99.1721,0,0,0,0,0,0,0,0,0,0,2.8308,0,0),(129300,4,2071.38,-5756.36,99.4094,0,0,0,0,0,0,0,0,0,0,2.24489,0,0),(129300,5,2068.61,-5742.29,99.0467,0,0,0,0,0,0,0,0,0,0,1.26236,0,0),
(129300,6,2079.67,-5726.65,101.454,0,0,0,0,0,0,0,0,0,0,0.133316,0,0),(129300,7,2102.98,-5729.67,100.349,0,0,0,0,0,0,0,0,0,0,6.03087,0,0),(129292,1,2160.27,-5913.36,100.123,0,0,0,0,0,0,0,0,0,0,5.22575,0,0),
(129292,2,2167.27,-5920.19,100.529,0,0,0,0,0,0,0,0,0,0,5.7229,0,0),(129292,3,2177.36,-5924.51,101.121,0,0,0,0,0,0,0,0,0,0,0.277724,0,0),(129292,4,2184.75,-5920.58,101.076,0,0,0,0,0,0,0,0,0,0,0.669638,0,0),
(129292,5,2191.01,-5913.55,100.921,0,0,0,0,0,0,0,0,0,0,1.44247,0,0),(129292,6,2188.31,-5899.29,100.865,0,0,0,0,0,0,0,0,0,0,2.7423,0,0),(129292,7,2173.39,-5894.44,101.258,0,0,0,0,0,0,0,0,0,0,3.25046,0,0),
(129292,8,2139.54,-5899.23,102.465,0,0,0,0,0,0,0,0,0,0,2.61631,0,0),(129292,9,2129.08,-5863.27,101.756,0,0,0,0,0,0,0,0,0,0,0.951732,0,0),(129292,10,2132.16,-5858.39,101.598,0,0,0,0,0,0,0,0,0,0,0.818211,0,0),
(129292,11,2141.93,-5854.46,101.351,0,0,0,0,0,0,0,0,0,0,6.03326,0,0),(129292,12,2153.17,-5859.31,101.35,0,0,0,0,0,0,0,0,0,0,5.56437,0,0),(129292,13,2162.02,-5870.12,101.311,0,0,0,0,0,0,0,0,0,0,4.9502,0,0),
(129292,14,2162.05,-5877.97,101.333,0,0,0,0,0,0,0,0,0,0,4.51823,0,0),(129292,15,2158.04,-5887.76,101.27,0,0,0,0,0,0,0,0,0,0,4.42058,0,0),(129302,1,2142.69,-5854.15,101.352,0,0,0,0,0,0,0,0,0,0,5.64134,0,0),
(129302,2,2160.03,-5863.74,101.343,0,0,0,0,0,0,0,0,0,0,5.96987,0,0),(129302,3,2163.18,-5866.82,101.325,15000,2861101,0,0,0,0,0,0,0,0,5.95,0,0),(129302,4,2181.06,-5870.53,101.288,0,0,0,0,0,0,0,0,0,0,6.1,0,0),
(129302,5,2162.67,-5866.22,101.328,0,0,0,0,0,0,0,0,0,0,2.74714,0,0),(129302,6,2142.94,-5853.58,101.349,0,0,0,0,0,0,0,0,0,0,2.0285,0,0),(129302,7,2142.59,-5841.03,101.318,0,0,0,0,0,0,0,0,0,0,1.42374,0,0),
(129302,8,2142.77,-5819.21,100.895,0,0,0,0,0,0,0,0,0,0,1.86334,0,0),(129302,9,2128.82,-5790.25,98.8795,0,0,0,0,0,0,0,0,0,0,1.38032,0,0),(129302,10,2128.17,-5794.43,99.0854,0,0,0,0,0,0,0,0,0,0,4.67271,0,0),
(129302,11,2130.96,-5801.12,99.619,0,0,0,0,0,0,0,0,0,0,5.31045,0,0),(129302,12,2143.34,-5819.31,100.926,0,0,0,0,0,0,0,0,0,0,5.01514,0,0),(129297,1,2319.66,-5848.97,100.935,0,0,0,0,0,0,0,0,0,0,2.78011,0,0),
(129297,2,2358.53,-5857.29,103.499,0,0,0,0,0,0,0,0,0,0,0.0374998,0,0),(129297,3,2372.83,-5857.43,104.873,0,0,0,0,0,0,0,0,0,0,0.252697,0,0),(129297,4,2392.42,-5849.89,107.346,0,0,0,0,0,0,0,0,0,0,0.384643,0,0),
(129297,5,2366.13,-5858.16,104.3,0,0,0,0,0,0,0,0,0,0,2.90813,0,0),(129297,6,2337.91,-5851.9,100.935,0,0,0,0,0,0,0,0,0,0,2.90577,0,0),(129303,1,2390.07,-5931.47,110.55,0,0,0,0,0,0,0,0,0,0,0.386819,0,0),
(129303,2,2398.67,-5927.69,110.708,0,0,0,0,0,0,0,0,0,0,0.979795,0,0),(129303,3,2398.53,-5919.04,110.312,0,0,0,0,0,0,0,0,0,0,1.93405,0,0),(129303,4,2394.77,-5912.12,110.234,0,0,0,0,0,0,0,0,0,0,2.50033,0,0),
(129303,5,2388.95,-5907.49,109.52,0,0,0,0,0,0,0,0,0,0,2.89381,0,0),(129303,6,2373.15,-5905.92,107.84,0,0,0,0,0,0,0,0,0,0,2.45792,0,0),(129303,7,2358.65,-5881.45,104.836,0,0,0,0,0,0,0,0,0,0,2.31497,0,0),
(129303,8,2351.68,-5878.2,104.568,0,0,0,0,0,0,0,0,0,0,3.10901,0,0),(129303,9,2337.91,-5878.7,102.648,0,0,0,0,0,0,0,0,0,0,3.33206,0,0),(129303,10,2317.48,-5881.55,100.626,0,0,0,0,0,0,0,0,0,0,3.10665,0,0),
(129303,11,2286.17,-5880.3,100.304,0,0,0,0,0,0,0,0,0,0,3.24174,0,0),(129303,12,2272.73,-5882.74,100.89,0,0,0,0,0,0,0,0,0,0,4.07976,0,0),(129303,13,2253.52,-5911.46,99.5266,0,0,0,0,0,0,0,0,0,0,4.53765,0,0),
(129303,14,2274.04,-5882.75,100.739,0,0,0,0,0,0,0,0,0,0,0.261942,0,0),(129303,15,2287.78,-5880.13,100.248,0,0,0,0,0,0,0,0,0,0,6.26126,0,0),(129303,16,2318.09,-5881.68,100.652,0,0,0,0,0,0,0,0,0,0,0.0990315,0,0),
(129303,17,2343.77,-5878.09,103.791,0,0,0,0,0,0,0,0,0,0,0.0652592,0,0),(129303,18,2353.55,-5878.97,104.659,0,0,0,0,0,0,0,0,0,0,5.83632,0,0),(129303,19,2359.3,-5881.44,104.844,0,0,0,0,0,0,0,0,0,0,5.49153,0,0),
(129303,20,2370.81,-5898.05,106.909,0,0,0,0,0,0,0,0,0,0,5.16795,0,0),(129303,21,2379.07,-5918.67,110.059,0,0,0,0,0,0,0,0,0,0,5.3156,0,0),(129299,1,2144.25,-5736.86,100.243,0,0,0,0,0,0,0,0,0,0,2.01409,0,0),
(129299,2,2137.89,-5727.64,100.314,0,0,0,0,0,0,0,0,0,0,2.35,0,0),(129299,3,2128.15,-5716.13,100.621,0,0,0,0,0,0,0,0,0,0,2.2,0,0),(129299,4,2138.36,-5728.58,100.285,15000,2861102,0,0,0,0,0,0,0,0,5.34968,0,0),
(129299,5,2144.69,-5738.47,100.186,0,0,0,0,0,0,0,0,0,0,4.96091,0,0),(129299,6,2147.98,-5759.81,99.8653,0,0,0,0,0,0,0,0,0,0,4.61769,0,0),(129299,7,2145.06,-5766.31,99.5844,0,0,0,0,0,0,0,0,0,0,4.25013,0,0),
(129299,8,2148.29,-5759.08,99.9146,0,0,0,0,0,0,0,0,0,0,1.63554,0,0),(129296,1,2184.73,-5752.8,101.735,0,0,0,0,0,0,0,0,0,0,0.64593,0,0),(129296,2,2203.79,-5747.64,102.482,0,0,0,0,0,0,0,0,0,0,6.05261,0,0),
(129296,3,2227.56,-5757.37,101.943,0,0,0,0,0,0,0,0,0,0,5.257,0,0),(129296,4,2222.95,-5772.72,101.685,0,0,0,0,0,0,0,0,0,0,4.19201,0,0),(129296,5,2198.06,-5777.75,101.381,0,0,0,0,0,0,0,0,0,0,2.43979,0,0),
(129296,6,2183.36,-5766.52,101.407,0,0,0,0,0,0,0,0,0,0,2.36359,0,0),(129308,1,2290.84,-5885.52,135.39,1000,2861401,0,0,0,0,0,0,0,0,1.31535,0,0),(129308,2,2294.92,-5853.35,136.543,0,0,0,0,0,0,0,0,0,0,1.66509,0,0),
(129308,3,2293.64,-5844,137.115,0,0,0,0,0,0,0,0,0,0,1.85359,0,0),(129308,4,2287.25,-5825.72,138.646,0,0,0,0,0,0,0,0,0,0,2.01067,0,0),(129308,5,2273.05,-5800.65,141.145,0,0,0,0,0,0,0,0,0,0,2.12848,0,0),
(129308,6,2246.05,-5756.18,146.144,0,0,0,0,0,0,0,0,0,0,2.15988,0,0),(129308,7,2229.17,-5732.17,144.006,0,0,0,0,0,0,0,0,0,0,2.46618,0,0),(129308,8,2202.98,-5712.59,143.603,0,0,0,0,0,0,0,0,0,0,2.85574,0,0),
(129308,9,2168.06,-5704.96,144.854,0,0,0,0,0,0,0,0,0,0,3.27592,0,0),(129308,10,2109.08,-5721.04,143.582,0,0,0,0,0,0,0,0,0,0,4.08881,0,0),(129308,11,2082.58,-5789.19,143.082,0,0,0,0,0,0,0,0,0,0,4.57182,0,0),
(129308,12,2080.64,-5826.85,145.298,0,0,0,0,0,0,0,0,0,0,4.88597,0,0),(129308,13,2084.41,-5845.73,144.543,0,0,0,0,0,0,0,0,0,0,5.32186,0,0),(129308,14,2107.78,-5873.44,143.243,0,0,0,0,0,0,0,0,0,0,5.46323,0,0),
(129308,15,2123.06,-5888.45,142.906,0,0,0,0,0,0,0,0,0,0,5.61638,0,0),(129308,16,2151.65,-5912.94,142.206,0,0,0,0,0,0,0,0,0,0,5.83236,0,0),(129308,17,2205.41,-5939.5,139.168,0,0,0,0,0,0,0,0,0,0,6.15829,0,0),
(129308,18,2248.21,-5944.19,135.833,0,0,0,0,0,0,0,0,0,0,0.346343,0,0),(129308,19,2269.4,-5933.04,136.137,0,0,0,0,0,0,0,0,0,0,1.01393,0,0),(129308,20,2282.93,-5912.56,135.776,0,0,0,0,0,0,0,0,0,0,1.18279,0,0),
(129308,21,2290.86,-5885.27,137.08,0,0,0,0,0,0,0,0,0,0,1.28097,0,0),(129309,1,2183.99,-5699.37,138.447,1000,2861401,0,0,0,0,0,0,0,0,5.92124,0,0),(129309,2,2210.61,-5712.16,142.897,0,0,0,0,0,0,0,0,0,0,5.71713,0,0),
(129309,3,2226.23,-5722.17,145.544,0,0,0,0,0,0,0,0,0,0,5.5522,0,0),(129309,4,2254.1,-5748.04,150.613,0,0,0,0,0,0,0,0,0,0,5.41476,0,0),(129309,5,2281.32,-5778.16,155.278,0,0,0,0,0,0,0,0,0,0,5.27731,0,0),
(129309,6,2290.24,-5799.08,155.755,0,0,0,0,0,0,0,0,0,0,4.55475,0,0),(129309,7,2276.33,-5844.93,155.665,0,0,0,0,0,0,0,0,0,0,4.40945,0,0),(129309,8,2263.16,-5886.47,156.938,0,0,0,0,0,0,0,0,0,0,4.11101,0,0),
(129309,9,2242.2,-5912.74,155.951,0,0,0,0,0,0,0,0,0,0,3.40415,0,0),(129309,10,2200.92,-5923.29,155.951,0,0,0,0,0,0,0,0,0,0,2.94469,0,0),(129309,11,2158.67,-5917.14,155.318,0,0,0,0,0,0,0,0,0,0,2.53628,0,0),
(129309,12,2136.31,-5900.67,156.788,0,0,0,0,0,0,0,0,0,0,1.91189,0,0),(129309,13,2123.42,-5863.52,148.169,0,0,0,0,0,0,0,0,0,0,1.63307,0,0),(129309,14,2121.53,-5820.75,138.371,0,0,0,0,0,0,0,0,0,0,1.75078,0,0),
(129309,15,2111.89,-5771.5,134.135,0,0,0,0,0,0,0,0,0,0,1.37923,0,0),(129309,16,2125.88,-5723.01,133.709,0,0,0,0,0,0,0,0,0,0,1.06586,0,0),(129309,17,2138.47,-5699.54,135.795,0,0,0,0,0,0,0,0,0,0,0.386486,0,0),
(129309,18,2155.43,-5694.27,135.652,0,0,0,0,0,0,0,0,0,0,6.14738,0,0),(129309,19,2183.66,-5699.13,139.435,0,0,0,0,0,0,0,0,0,0,5.85286,0,0),(128739,1,2369.01,-5785.95,154,0,0,0,0,0,0,0,0,0,0,2.21732,0,0),
(128739,2,2360.79,-5775.14,154,0,0,0,0,0,0,0,0,0,0,1.04668,0,0),(128739,3,2366.14,-5770.66,154,0,0,0,0,0,0,0,0,0,0,6.23032,0,0),(128739,4,2374.79,-5779.1,154,0,0,0,0,0,0,0,0,0,0,4.80736,0,0),
(128739,5,2375.1,-5786.28,154,0,0,0,0,0,0,0,0,0,0,3.52402,0,0),(129212,1,2207.34,-5805.32,101.348,0,0,0,0,0,0,0,0,0,0,3.0546,0,0),(129212,2,2195.45,-5805.9,101.341,0,0,0,0,0,0,0,0,0,0,4.03792,0,0),
(129212,3,2191.86,-5815.46,101.666,0,0,0,0,0,0,0,0,0,0,4.83902,0,0),(129212,4,2193.64,-5842.82,101.541,0,0,0,0,0,0,0,0,0,0,5.33775,0,0),(129212,5,2203.16,-5851.82,101.431,0,0,0,0,0,0,0,0,0,0,5.75322,0,0),
(129212,6,2213.02,-5855.27,101.487,0,0,0,0,0,0,0,0,0,0,6.20875,0,0),(129212,7,2227.77,-5851.65,101.476,0,0,0,0,0,0,0,0,0,0,0.377164,0,0),(129212,8,2249.47,-5838.4,101.283,0,0,0,0,0,0,0,0,0,0,1.16256,0,0),
(129212,9,2237.92,-5828.06,101.318,0,0,0,0,0,0,0,0,0,0,2.5952,0,0),(129212,10,2215.99,-5816.71,101.572,0,0,0,0,0,0,0,0,0,0,2.36008,0,0),(129217,1,2217.34,-5873.99,101.251,1000,2860501,0,0,0,0,0,0,0,0,0.593412,0,0),
(129217,2,2214.53,-5869.6,101.534,0,0,0,0,0,0,0,0,0,0,2.83545,0,0),(129217,3,2181.07,-5865.87,101.331,0,0,0,0,0,0,0,0,0,0,3.36324,0,0),(129217,4,2139.21,-5878.27,101.469,0,0,0,0,0,0,0,0,0,0,3.93265,0,0),
(129217,5,2118.11,-5903.57,104.343,0,0,0,0,0,0,0,0,0,0,3.3436,0,0),(129217,6,2072.44,-5914.58,106.378,0,0,0,0,0,0,0,0,0,0,3.39073,0,0),(129217,7,2028.89,-5920.68,105.233,0,0,0,0,0,0,0,0,0,0,3.28863,0,0),
(129217,8,2003.16,-5924.91,105.324,0,0,0,0,0,0,0,0,0,0,3.41822,0,0),(129217,9,1968.43,-5935.75,102.545,0,0,0,0,0,0,0,0,0,0,3.21401,0,0),(129217,10,1924.76,-5931.14,103.405,0,0,0,0,0,0,0,0,0,0,2.93127,0,0),
(129217,11,1894.96,-5921.15,103.129,0,0,0,0,0,0,0,0,0,0,2.94698,0,0),(129217,12,1849.19,-5916.93,105.57,0,0,0,0,0,0,0,0,0,0,3.19438,0,0),(129217,13,1818.86,-5920.18,112.552,0,0,0,0,0,0,0,0,0,0,3.19438,0,0),
(129217,14,1780.82,-5925.05,116.113,0,0,0,0,0,0,0,0,0,0,2.85273,0,0),(129217,15,1741.46,-5907.59,116.121,1000,2860502,0,0,0,0,0,0,0,0,2.73099,0,0),(129024,1,2179.57,-6107.15,1.51502,0,0,0,0,0,0,0,0,0,0,1.37137,0,0),
(129024,2,2179.03,-6096.94,2.3859,0,0,0,0,0,0,0,0,0,0,2.58716,0,0),(129024,3,2168.04,-6094.05,5.94641,0,0,0,0,0,0,0,0,0,0,3.0584,0,0),(129024,4,2143.18,-6093.86,6.09899,0,0,0,0,0,0,0,0,0,0,3.07411,0,0),
(129024,5,2114.83,-6090.37,5.1301,0,0,0,0,0,0,0,0,0,0,3.09375,0,0),(129024,6,2145,-6093.78,6.10321,0,0,0,0,0,0,0,0,0,0,6.2157,0,0),(129024,7,2168.88,-6094.96,5.76342,0,0,0,0,0,0,0,0,0,0,6.16465,0,0),
(129024,8,2175.73,-6096.3,3.57095,0,0,0,0,0,0,0,0,0,0,5.5599,0,0),(129024,9,2179.58,-6107.32,1.51689,0,0,0,0,0,0,0,0,0,0,4.38495,0,0),(129024,10,2165.01,-6131.09,0.904949,0,0,0,0,0,0,0,0,0,0,4.13738,0,0),
(129051,1,2103.7,-6107.22,5.77286,0,0,0,0,0,0,0,0,0,0,1.01697,0,0),(129051,2,2085.54,-6127.37,5.72649,0,0,0,0,0,0,0,0,0,0,4.46251,0,0),(129051,3,2090.42,-6139.78,4.43297,0,0,0,0,0,0,0,0,0,0,5.94376,0,0),
(129051,4,2104.3,-6141.27,4.49426,0,0,0,0,0,0,0,0,0,0,6.26969,0,0),(129051,5,2125,-6139.38,3.86834,0,0,0,0,0,0,0,0,0,0,6.25791,0,0),(129051,6,2103.94,-6141.22,4.49392,0,0,0,0,0,0,0,0,0,0,3.07548,0,0),
(129051,7,2090.16,-6139.68,4.43287,0,0,0,0,0,0,0,0,0,0,2.29165,0,0),(129051,8,2087.82,-6126.71,5.71026,0,0,0,0,0,0,0,0,0,0,1.21958,0,0),(129051,9,2095.76,-6115.24,5.76367,0,0,0,0,0,0,0,0,0,0,0.895089,0,0),
(129146,1,2245.68,-6131.37,5.29431,0,0,0,0,0,0,0,0,0,0,0.575207,0,0),(129146,2,2252.35,-6126.42,5.75842,0,0,0,0,0,0,0,0,0,0,0.363148,0,0),(129146,3,2270.7,-6120.51,2.75591,0,0,0,0,0,0,0,0,0,0,0.312097,0,0),
(129146,4,2287.86,-6115.51,4.8859,0,0,0,0,0,0,0,0,0,0,0.280681,0,0),(129146,5,2297.05,-6115.79,6.26882,0,0,0,0,0,0,0,0,0,0,5.94655,0,0),(129146,6,2306.74,-6121.55,6.43682,0,0,0,0,0,0,0,0,0,0,5.36536,0,0),
(129146,7,2308.62,-6128.9,6.86548,0,0,0,0,0,0,0,0,0,0,4.38283,0,0),(129146,8,2301.72,-6135.21,6.1862,0,0,0,0,0,0,0,0,0,0,3.40658,0,0),(129146,9,2270.36,-6142.35,1.33784,0,0,0,0,0,0,0,0,0,0,3.34375,0,0),
(129146,10,2248.5,-6146.83,1.93632,0,0,0,0,0,0,0,0,0,0,2.72171,0,0),(129146,11,2242.61,-6139.31,3.46995,0,0,0,0,0,0,0,0,0,0,1.54603,0,0),(129020,1,2218.21,-6052.15,6.28245,0,0,0,0,0,0,0,0,0,0,0.598786,0,0),
(129020,2,2198.15,-6068.16,4.91828,0,0,0,0,0,0,0,0,0,0,4.19355,0,0),(129020,3,2188.98,-6087.36,2.66273,0,0,0,0,0,0,0,0,0,0,4.59567,0,0),(129020,4,2184.96,-6111.21,1.21427,0,0,0,0,0,0,0,0,0,0,4.67499,0,0),
(129020,5,2186.51,-6131.86,3.4451,0,0,0,0,0,0,0,0,0,0,4.78887,0,0),(129020,6,2188.47,-6151.98,3.71727,0,0,0,0,0,0,0,0,0,0,4.87134,0,0),(129020,7,2188.08,-6136.73,4.10259,0,0,0,0,0,0,0,0,0,0,1.60408,0,0),
(129020,8,2185.62,-6110.87,1.17962,0,0,0,0,0,0,0,0,0,0,1.46664,0,0),(129020,9,2189.14,-6086.95,2.69276,0,0,0,0,0,0,0,0,0,0,1.14855,0,0),(129020,10,2199.44,-6066.72,5.2338,0,0,0,0,0,0,0,0,0,0,0.870521,0,0),
(129020,11,2208.87,-6057.5,6.1144,0,0,0,0,0,0,0,0,0,0,0.763707,0,0),(129153,1,2239.26,-6128.36,6.35309,0,0,0,0,0,0,0,0,0,0,2.93789,0,0),(129153,2,2228.98,-6125.41,6.05118,0,0,0,0,0,0,0,0,0,0,3.49709,0,0),
(129153,3,2218.05,-6132.01,5.17829,0,0,0,0,0,0,0,0,0,0,4.10342,0,0),(129153,4,2214.68,-6141.26,4.21172,0,0,0,0,0,0,0,0,0,0,3.82381,0,0),(129153,5,2208.37,-6144.86,4.73456,0,0,0,0,0,0,0,0,0,0,3.24026,0,0),
(129153,6,2189.38,-6141.99,4.52894,0,0,0,0,0,0,0,0,0,0,1.79434,0,0),(129153,7,2187.27,-6130.15,3.02815,0,0,0,0,0,0,0,0,0,0,1.62863,0,0),(129153,8,2187.16,-6116.05,1.32184,0,0,0,0,0,0,0,0,0,0,0.8393,0,0),
(129153,9,2200.42,-6111,1.86493,0,0,0,0,0,0,0,0,0,0,0.262818,0,0),(129153,10,2223.18,-6106.04,4.94713,0,0,0,0,0,0,0,0,0,0,6.0724,0,0),(129153,11,2227.17,-6111.04,5.31839,0,0,0,0,0,0,0,0,0,0,4.95086,0,0),
(129153,12,2227.65,-6122.54,5.86751,0,0,0,0,0,0,0,0,0,0,5.29301,0,0),(129153,13,2240.05,-6128.76,6.27566,0,0,0,0,0,0,0,0,0,0,6.25982,0,0),(129153,14,2251.74,-6121.79,6.50212,0,0,0,0,0,0,0,0,0,0,0.30729,0,0),
(129153,15,2255.06,-6123.27,5.66065,0,0,0,0,0,0,0,0,0,0,5.10529,0,0),(129282,1,2222.74,-5727.17,101.697,0,0,0,0,0,0,0,0,0,0,5.47818,0,0),(129282,2,2250.67,-5748.94,101.871,0,0,0,0,0,0,0,0,0,0,5.50567,0,0),
(129282,3,2269.82,-5768.2,101.087,0,0,0,0,0,0,0,0,0,0,5.48603,0,0),(129282,4,2287.93,-5784.64,101.515,0,0,0,0,0,0,0,0,0,0,5.27398,0,0),(129282,5,2255.71,-5754.28,101.265,0,0,0,0,0,0,0,0,0,0,2.39157,0,0),
(129282,6,2209.13,-5719.56,101.457,0,0,0,0,0,0,0,0,0,0,2.72929,0,0),(129284,1,2393.09,-5842.98,109.556,0,0,0,0,0,0,0,0,0,0,0.279604,0,0),(129284,2,2379.74,-5844.31,107.759,0,0,0,0,0,0,0,0,0,0,3.0285,0,0),
(129284,3,2351.15,-5844.13,101.091,0,0,0,0,0,0,0,0,0,0,2.7811,0,0),(129284,4,2334.78,-5830.87,101.224,0,0,0,0,0,0,0,0,0,0,2.36876,0,0),(129284,5,2351.21,-5844.41,101.088,0,0,0,0,0,0,0,0,0,0,6.03265,0,0),
(129284,6,2384.59,-5843.93,108.505,0,0,0,0,0,0,0,0,0,0,0.0363362,0,0);

-- MOVEMENT SCRIPTS -- for phase 1
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2861401,2870901,2861101,2861102,2860501,2860502);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
-- Acherus Geist
(2870901,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
-- Scarlet Captain
(2861101,1,3,0,700,0,0,0,0,0,0,0,2165.24,-5877.88,101.342,4.76026,''),
(2861101,3,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2861101,4,31,28557,5,0,0,0,-9000,0,0,0,0,0,0,0,''),
(2861101,5,21,1,0,28557,128758,0x10,0,0,0,0,0,0,0,0,'Scarlet Peasant - active'),
(2861101,6,1,0,0,28557,128758,7 | 0x10,0,0,0,0,0,0,0,0,'state emote - off'),
(2861101,8,3,0,0,28557,128758,0x10,0,0,0,0,0,0,0,1.61081,''),
(2861101,9,0,0,0,28557,128758,7 | 0x10,2000000407,2000000408,0,0,0,0,0,0,''),
(2861101,12,3,0,0,28557,128758,0x10,0,0,0,0,0,0,0,5.90615,''),
(2861101,13,1,234,0,28557,128758,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2861101,14,21,0,0,28557,128758,0x10,0,0,0,0,0,0,0,0,'Scarlet Peasant - unactive'),
(2861102,1,3,0,700,0,0,0,0,0,0,0,2144.43,-5724.82,100.802,0.60027,''),
(2861102,3,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2861102,4,31,28557,5,0,0,0,-9000,0,0,0,0,0,0,0,''),
(2861102,5,21,1,0,28557,128790,0x10,0,0,0,0,0,0,0,0,'Scarlet Peasant - active'),
(2861102,6,1,0,0,28557,128790,7 | 0x10,0,0,0,0,0,0,0,0,'state emote - off'),
(2861102,8,3,0,0,28557,128790,0x10,0,0,0,0,0,0,0,3.7183,''),
(2861102,9,0,0,0,28557,128790,7 | 0x10,2000000407,2000000408,0,0,0,0,0,0,''),
(2861102,12,3,0,0,28557,128790,0x10,0,0,0,0,0,0,0,5.7737,''),
(2861102,13,1,234,0,28557,128790,7 | 0x10,0,0,0,0,0,0,0,0,''),
(2861102,14,21,0,0,28557,128790,0x10,0,0,0,0,0,0,0,0,'Scarlet Peasant - unactive'),
-- Scarlet Gryphon
(2861401,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'), 
-- Havenshire Stallion
(2860501,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2860501,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Havenshire Stallion - active'),
(2860502,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Havenshire Stallion - unactive'),
(2860502,1,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn'); 
-- Scourge Sky Darkeener
DELETE FROM dbscripts_on_spell WHERE id = 52124;
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(52124,1,15,52125,0,28655,500,1 | 0x08,0,0,0,0,0,0,0,0,''); 
-- Scarlet Captain
DELETE FROM dbscripts_on_creature_death WHERE id = 28611;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(28611,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,'unmount');

-- LINKS -- for phase 1
-- Havenshire Stallion #1
DELETE FROM creature_linking WHERE guid IN (129208,129216,129230,129234,129237,129243,129252);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(129208, 129212, 512),
(129230, 129212, 512),
(129234, 129212, 512),
(129243, 129212, 512),
-- Havenshire Stallion #2
(129237, 129217, 128+512+8192),
(129216, 129217, 128+512+8192),
(129252, 129217, 128+512+8192);

-- TEXTS -- for phase 1
DELETE FROM db_script_string WHERE entry BETWEEN 2000000407 AND 2000000408;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES 
(2000000407,'I\'m workin\' as fast as I can, cap\'n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
(2000000408,'I can\'t keep this pace up, sir! If the Scourge don\'t get me, exhaustion will!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);
-- ---------------------------
-- DK Starting Zone - phase 1 - part2. - Citizen of Havenshire
-- ---------------------------

-- Duplicates removed -- summoned by spell
DELETE FROM creature WHERE guid IN (128989,151046,129260,128975,128971,129421,129426,129420,129422,129419,129429,129418,129430,129427,129431,129425,129428,129424,129423,128961,128951,128952,128950,129000,128992,
128983,128955,128969,128933,128941,128931,128954,128972,128960,128926,128981,128912,128977,128978,128929,128979,128914,128987,128918,128944,128994,128995,128942,128993,128945,128964,128917,128956,128943,128996,
128916,128940,128965,128930,128963,128928,128970,128982,129001,128953,128920,128922,128973,128966,128913,128968,128937,128938,128967,128915,128976,128932,128980,128947,128921,128958,128959,128911,128984,128962);
DELETE FROM creature_addon WHERE guid IN (128989,151046,129260,128975,128971,129421,129426,129420,129422,129419,129429,129418,129430,129427,129431,129425,129428,129424,129423,128961,128951,128952,128950,129000,
128992,128983,128955,128969,128933,128941,128931,128954,128972,128960,128926,128981,128912,128977,128978,128929,128979,128914,128987,128918,128944,128994,128995,128942,128993,128945,128964,128917,128956,128943,
128996,128916,128940,128965,128930,128963,128928,128970,128982,129001,128953,128920,128922,128973,128966,128913,128968,128937,128938,128967,128915,128976,128932,128980,128947,128921,128958,128959,128911,128984,
128962);
DELETE FROM creature_movement WHERE id IN (128989,151046,129260,128975,128971,129421,129426,129420,129422,129419,129429,129418,129430,129427,129431,129425,129428,129424,129423,128961,128951,128952,128950,129000,
128992,128983,128955,128969,128933,128941,128931,128954,128972,128960,128926,128981,128912,128977,128978,128929,128979,128914,128987,128918,128944,128994,128995,128942,128993,128945,128964,128917,128956,128943,
128996,128916,128940,128965,128930,128963,128928,128970,128982,129001,128953,128920,128922,128973,128966,128913,128968,128937,128938,128967,128915,128976,128932,128980,128947,128921,128958,128959,128911,128984,
128962);
DELETE FROM game_event_creature WHERE guid IN (128989,151046,129260,128975,128971,129421,129426,129420,129422,129419,129429,129418,129430,129427,129431,129425,129428,129424,129423,128961,128951,128952,128950,
129000,128992,128983,128955,128969,128933,128941,128931,128954,128972,128960,128926,128981,128912,128977,128978,128929,128979,128914,128987,128918,128944,128994,128995,128942,128993,128945,128964,128917,128956,
128943,128996,128916,128940,128965,128930,128963,128928,128970,128982,129001,128953,128920,128922,128973,128966,128913,128968,128937,128938,128967,128915,128976,128932,128980,128947,128921,128958,128959,128911,
128984,128962); 
DELETE FROM game_event_creature_data WHERE guid IN (128989,151046,129260,128975,128971,129421,129426,129420,129422,129419,129429,129418,129430,129427,129431,129425,129428,129424,129423,128961,128951,128952,128950,
129000,128992,128983,128955,128969,128933,128941,128931,128954,128972,128960,128926,128981,128912,128977,128978,128929,128979,128914,128987,128918,128944,128994,128995,128942,128993,128945,128964,128917,128956,
128943,128996,128916,128940,128965,128930,128963,128928,128970,128982,129001,128953,128920,128922,128973,128966,128913,128968,128937,128938,128967,128915,128976,128932,128980,128947,128921,128958,128959,128911,
128984,128962); 
DELETE FROM creature_battleground WHERE guid IN (128989,151046,129260,128975,128971,129421,129426,129420,129422,129419,129429,129418,129430,129427,129431,129425,129428,129424,129423,128961,128951,128952,128950,
129000,128992,128983,128955,128969,128933,128941,128931,128954,128972,128960,128926,128981,128912,128977,128978,128929,128979,128914,128987,128918,128944,128994,128995,128942,128993,128945,128964,128917,128956,
128943,128996,128916,128940,128965,128930,128963,128928,128970,128982,129001,128953,128920,128922,128973,128966,128913,128968,128937,128938,128967,128915,128976,128932,128980,128947,128921,128958,128959,128911,
128984,128962); 
DELETE FROM creature_linking WHERE guid IN (128989,151046,129260,128975,128971,129421,129426,129420,129422,129419,129429,129418,129430,129427,129431,129425,129428,129424,129423,128961,128951,128952,128950,129000,
128992,128983,128955,128969,128933,128941,128931,128954,128972,128960,128926,128981,128912,128977,128978,128929,128979,128914,128987,128918,128944,128994,128995,128942,128993,128945,128964,128917,128956,128943,
128996,128916,128940,128965,128930,128963,128928,128970,128982,129001,128953,128920,128922,128973,128966,128913,128968,128937,128938,128967,128915,128976,128932,128980,128947,128921,128958,128959,128911,128984,
128962) OR master_guid IN (128989,151046,129260,128975,128971,129421,129426,129420,129422,129419,129429,129418,129430,129427,129431,129425,129428,129424,129423,128961,128951,128952,128950,129000,128992,128983,
128955,128969,128933,128941,128931,128954,128972,128960,128926,128981,128912,128977,128978,128929,128979,128914,128987,128918,128944,128994,128995,128942,128993,128945,128964,128917,128956,128943,128996,128916,
128940,128965,128930,128963,128928,128970,128982,129001,128953,128920,128922,128973,128966,128913,128968,128937,128938,128967,128915,128976,128932,128980,128947,128921,128958,128959,128911,128984,128962);
-- Saronite Arrow
DELETE FROM gameobject WHERE guid IN (66225,66165,66209,66151,66227,66210,66220,66170,66140,66177,66222,66124,66119,66118,66120,66116,66204,66194,66117,66195,66213,66129,66138,66188,66231,66163,66211,66139,
66224,66161,66166,66180,66201,66164,66229,66232,66221,66212,66143,66155,66150,66145,66154,66171,66174,66127,66133,66182,66153,66123,66137,66178,66186,66141,66149,66146,66219,66176,66203,66147,66158,66130,66136,
66157,66208,66197,66183,66223,66169);
DELETE FROM game_event_gameobject WHERE guid IN (66225,66165,66209,66151,66227,66210,66220,66170,66140,66177,66222,66124,66119,66118,66120,66116,66204,66194,66117,66195,66213,66129,66138,66188,66231,66163,
66211,66139,66224,66161,66166,66180,66201,66164,66229,66232,66221,66212,66143,66155,66150,66145,66154,66171,66174,66127,66133,66182,66153,66123,66137,66178,66186,66141,66149,66146,66219,66176,66203,66147,66158,
66130,66136,66157,66208,66197,66183,66223,66169);
DELETE FROM gameobject_battleground WHERE guid IN (66225,66165,66209,66151,66227,66210,66220,66170,66140,66177,66222,66124,66119,66118,66120,66116,66204,66194,66117,66195,66213,66129,66138,66188,66231,66163,
66211,66139,66224,66161,66166,66180,66201,66164,66229,66232,66221,66212,66143,66155,66150,66145,66154,66171,66174,66127,66133,66182,66153,66123,66137,66178,66186,66141,66149,66146,66219,66176,66203,66147,66158,
66130,66136,66157,66208,66197,66183,66223,66169);

-- Rain of Darkness Dummy - update
UPDATE creature_template SET InhabitType = 4 WHERE entry = 28643;
UPDATE creature_template_addon SET auras = NULL WHERE entry = 28643;
-- Citizen of Havenshire 
UPDATE creature SET spawntimesecs = 30 WHERE id IN (28576,28577);
-- #1
UPDATE creature SET position_x = 2056.845215, position_y = -5887.278809, position_z = 105.142105, orientation = 5.18, MovementType = 2, spawndist = 0 WHERE guid = 128934;
DELETE FROM creature_movement WHERE id = 128934;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128934,1,2056.845215,-5887.278809,105.142105,1000,2857601,0,0,0,0,0,0,0,0,5.18,0,0),(128934,2,2057.01,-5896.95,105.123,0,0,0,0,0,0,0,0,0,0,4.1,0,0),(128934,3,2035.39,-5906.56,105.121,0,0,0,0,0,0,0,0,0,0,3.38,0,0),
(128934,4,2017.4,-5907.31,104.623,0,0,0,0,0,0,0,0,0,0,3.15737,0,0),(128934,5,1975.06,-5904.35,102.864,0,0,0,0,0,0,0,0,0,0,3.06705,0,0),(128934,6,1945.99,-5904.95,101.207,0,0,0,0,0,0,0,0,0,0,3.33408,0,0),
(128934,7,1917.03,-5911.18,101.617,0,0,0,0,0,0,0,0,0,0,3.11103,0,0),(128934,8,1903.82,-5909.42,101.736,0,0,0,0,0,0,0,0,0,0,3.0317,0,0),(128934,9,1877.38,-5911.21,103.984,0,0,0,0,0,0,0,0,0,0,3.50208,0,0),
(128934,10,1827.52,-5927.2,111.352,0,0,0,0,0,0,0,0,0,0,3.47459,0,0),(128934,11,1813.52,-5931.47,114.615,0,0,0,0,0,0,0,0,0,0,3.43532,0,0),(128934,12,1807.51,-5941.81,115.805,0,0,0,0,0,0,0,0,0,0,4.79484,0,0),
(128934,13,1807.12,-5972.92,116.182,0,0,0,0,0,0,0,0,0,0,4.69274,0,0),(128934,14,1807.86,-5991.78,117.616,0,0,0,0,0,0,0,0,0,0,4.77,0,0),(128934,15,1810.83,-6000.76,117.639,1000,2857602,0,0,0,0,0,0,0,0,5.1,0,0);
-- #2
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 128999;
DELETE FROM creature_movement WHERE id = 128999;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128999,1,2240.29,-5923.61,98.8092,1000,2857601,0,0,0,0,0,0,0,0,2.89634,0,0),
(128999,2,2225.95,-5917.15,100.564,0,0,0,0,0,0,0,0,0,0,2.8715,0,0),(128999,3,2183.44,-5892.94,100.71,0,0,0,0,0,0,0,0,0,0,2.32958,0,0),(128999,4,2165.87,-5868.91,101.326,0,0,0,0,0,0,0,0,0,0,1.99892,0,0),
(128999,5,2144.29,-5833.26,101.282,0,0,0,0,0,0,0,0,0,0,1.85991,0,0),(128999,6,2134.01,-5800.38,99.6541,0,0,0,0,0,0,0,0,0,0,2.71334,0,0),(128999,7,2124.79,-5797.24,99.4295,0,0,0,0,0,0,0,0,0,0,3.42098,0,0),
(128999,8,2116.25,-5802.6,100.794,1000,2857602,0,0,0,0,0,0,0,0,3.82153,0,0);
-- #3
UPDATE creature SET position_x = 2279.38, position_y = -5792.860840, position_z = 100.936661, orientation = 2.211558, spawndist = 0, MovementType = 2 WHERE guid = 128957;
DELETE FROM creature_movement WHERE id = 128957;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128957,1,2279.38,-5792.860840,100.936661,1000,2857601,0,0,0,0,0,0,0,0,2.22,0,0),(128957,2,2237.48,-5762.68,101.423,0,0,0,0,0,0,0,0,0,0,2.77,0,0),(128957,3,2195.92,-5750.89,102.247,0,0,0,0,0,0,0,0,0,0,2.8,0,0),
(128957,4,2159.98,-5731.86,101.111,0,0,0,0,0,0,0,0,0,0,2.8438,0,0),(128957,5,2137.79,-5726.6,100.368,0,0,0,0,0,0,0,0,0,0,2.82417,0,0),(128957,6,2122.49,-5721.89,100.341,0,0,0,0,0,0,0,0,0,0,3.21687,0,0),
(128957,7,2079.47,-5736.64,100.508,0,0,0,0,0,0,0,0,0,0,3.63706,0,0),(128957,8,2043.49,-5745.04,98.6616,0,0,0,0,0,0,0,0,0,0,3.37787,0,0),(128957,9,2016.05,-5748.1,99.526,0,0,0,0,0,0,0,0,0,0,3.27577,0,0),
(128957,10,1980.49,-5754.46,99.5022,0,0,0,0,0,0,0,0,0,0,3.42893,0,0),(128957,11,1945.86,-5764.75,102.862,0,0,0,0,0,0,0,0,0,0,3.49961,0,0),(128957,12,1917.47,-5769.25,102.565,0,0,0,0,0,0,0,0,0,0,3.22865,0,0),
(128957,13,1898.75,-5770.96,103.716,0,0,0,0,0,0,0,0,0,0,3.56166,0,0),(128957,14,1862.43,-5790.36,102.18,0,0,0,0,0,0,0,0,0,0,3.59386,0,0),(128957,15,1825.73,-5806.88,102.914,0,0,0,0,0,0,0,0,0,0,3.64491,0,0),
(128957,16,1797.47,-5813.53,109.974,0,0,0,0,0,0,0,0,0,0,3.21687,0,0),(128957,17,1769.65,-5813.99,115.937,0,0,0,0,0,0,0,0,0,0,3.24436,0,0),(128957,18,1752.63,-5817.66,116.12,0,0,0,0,0,0,0,0,0,0,2.62468,0,0),
(128957,19,1747.26,-5809.18,116.12,0,0,0,0,0,0,0,0,0,0,1.47328,0,0),(128957,20,1748.11,-5802.21,117.124,1000,2857602,0,0,0,0,0,0,0,0,1.47328,0,0);
-- #4
UPDATE creature SET position_x = 2260.174805, position_y = -5801.781250, position_z = 102.004921, orientation = 3.76, spawndist = 0, MovementType = 2 WHERE guid = 128948;
DELETE FROM creature_movement WHERE id = 128948;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128948,1,2260.174805,-5801.781250,102.004921,1000,2857601,0,0,0,0,0,0,0,0,3.76,0,0),(128948,2,2250.01,-5803.18,100.983,0,0,0,0,0,0,0,0,0,0,3.1,0,0),(128948,3,2165.42,-5814.7,101.322,0,0,0,0,0,0,0,0,0,0,3.33,0,0),
(128948,4,2101.6,-5840.02,102.298,0,0,0,0,0,0,0,0,0,0,3.40143,0,0),(128948,5,2038.31,-5843.82,100.355,0,0,0,0,0,0,0,0,0,0,3.25613,0,0),(128948,6,1945.59,-5846.08,100.354,0,0,0,0,0,0,0,0,0,0,3.15796,0,0),
(128948,7,1902.9,-5844.42,100.833,0,0,0,0,0,0,0,0,0,0,2.96161,0,0),(128948,8,1849.54,-5819.23,99.928,0,0,0,0,0,0,0,0,0,0,2.9082,0,0),(128948,9,1767.95,-5819.02,116.026,0,0,0,0,0,0,0,0,0,0,3.17135,0,0),
(128948,10,1745.79,-5834.48,116.85,0,0,0,0,0,0,0,0,0,0,4.08241,0,0),(128948,11,1723.42,-5867.11,116.126,0,0,0,0,0,0,0,0,0,0,4.68166,0,0),(128948,12,1729.19,-5872.37,116.125,0,0,0,0,0,0,0,0,0,0,6.26031,0,0),
(128948,13,1739.22,-5872.44,116.653,1000,2857602,0,0,0,0,0,0,0,0,5.36967,0,0);
-- #5
UPDATE creature SET position_x = 2286.046631, position_y = -5829.061035, position_z = 100.934441, orientation = 2.1, spawndist = 0, MovementType = 2 WHERE guid = 128949;
DELETE FROM creature_movement WHERE id = 128949;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128949,1,2286.046631,-5829.061035,100.934441,7000,2857601,0,0,0,0,0,0,0,0,2.1,0,0),(128949,2,2273.3,-5836.75,100.934,0,0,0,0,0,0,0,0,0,0,3.4,0,0),(128949,3,2249.23,-5837.22,101.289,0,0,0,0,0,0,0,0,0,0,3.1,0,0),
(128949,4,2186.37,-5864.02,101.326,0,0,0,0,0,0,0,0,0,0,3.69647,0,0),(128949,5,2165.92,-5868.08,101.326,0,0,0,0,0,0,0,0,0,0,2.7375,0,0),(128949,6,2140.53,-5857.96,101.363,0,0,0,0,0,0,0,0,0,0,3.20874,0,0),
(128949,7,2107.88,-5872.78,103.037,0,0,0,0,0,0,0,0,0,0,3.58966,0,0),(128949,8,2104.77,-5877.18,103.393,0,0,0,0,0,0,0,0,0,0,5.17459,0,0),(128949,9,2107.28,-5882.22,103.865,1000,2857602,0,0,0,0,0,0,0,0,5.1471,0,0);
-- #6
UPDATE creature SET position_x = 2270.406494, position_y = -5825.929199, position_z = 100.935585, orientation = 2.91, spawndist = 0, MovementType = 2 WHERE guid = 128946;
DELETE FROM creature_movement WHERE id = 128946;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128946,1,2270.406494,-5825.929199,100.935585,1000,2857601,0,0,0,0,0,0,0,0,2.91,0,0),(128946,2,2235.89,-5826.65,101.323,0,0,0,0,0,0,0,0,0,0,2.97,0,0),(128946,3,2211.43,-5824.89,101.391,0,0,0,0,0,0,0,0,0,0,2.94,0,0),
(128946,4,2161.91,-5813.19,101.513,0,0,0,0,0,0,0,0,0,0,2.6362,0,0),(128946,5,2112.32,-5785.67,98.9869,0,0,0,0,0,0,0,0,0,0,2.99368,0,0),(128946,6,2085.38,-5800.41,102.163,0,0,0,0,0,0,0,0,0,0,3.80657,0,0),
(128946,7,2069.57,-5809.84,103.118,0,0,0,0,0,0,0,0,0,0,3.08793,0,0),(128946,8,2021.36,-5802.96,100.41,0,0,0,0,0,0,0,0,0,0,3.11016,0,0),(128946,9,1981.07,-5806.64,100.999,0,0,0,0,0,0,0,0,0,0,3.25194,0,0),
(128946,10,1941.97,-5799.79,100.25,1000,2857602,0,0,0,0,0,0,0,0,2.44691,0,0);
-- #7
UPDATE creature SET position_x = 2269.964844, position_y = -5826.081055, position_z = 100.936157, orientation = 3.1, spawndist = 0, MovementType = 2 WHERE guid = 128997;
DELETE FROM creature_movement WHERE id = 128997;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128997,1,2269.964844,-5826.081055,100.936157,8000,2857601,0,0,0,0,0,0,0,0,3.1,0,0),(128997,2,2236.19,-5803.16,101.208,0,0,0,0,0,0,0,0,0,0,3.05,0,0),(128997,3,2167.06,-5816.79,101.337,0,0,0,0,0,0,0,0,0,0,3.33,0,0),
(128997,4,2105.5,-5839.54,102.188,0,0,0,0,0,0,0,0,0,0,3.49542,0,0),(128997,5,2049.9,-5864.14,102.806,0,0,0,0,0,0,0,0,0,0,3.68391,0,0),(128997,6,1987.16,-5898.45,102.5,0,0,0,0,0,0,0,0,0,0,3.65642,0,0),
(128997,7,1937.49,-5907.82,101.143,0,0,0,0,0,0,0,0,0,0,3.36583,0,0),(128997,8,1886.73,-5910.87,103.037,0,0,0,0,0,0,0,0,0,0,3.46086,0,0),(128997,9,1853.53,-5921.4,105.208,0,0,0,0,0,0,0,0,0,0,3.40588,0,0),
(128997,10,1812.25,-5927.43,114.55,0,0,0,0,0,0,0,0,0,0,3.21346,0,0),(128997,11,1768.08,-5923.11,116.121,0,0,0,0,0,0,0,0,0,0,3.62501,0,0),(128997,12,1761.5,-5930.56,116.119,0,0,0,0,0,0,0,0,0,0,4.19495,0,0),
(128997,13,1742.4,-5967.17,117.122,1000,2857602,0,0,0,0,0,0,0,0,4.13998,0,0);
-- #8
UPDATE creature SET position_x = 2258.272461, position_y = -5805.730957, position_z = 100.938576, orientation = 4.38, spawndist = 0, MovementType = 2 WHERE guid = 128998;
DELETE FROM creature_movement WHERE id = 128998;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128998,1,2258.272461,-5805.730957,100.938576,5000,2857601,0,0,0,0,0,0,0,0,4.38,0,0),(128998,2,2253.32,-5824.7,101.052,0,0,0,0,0,0,0,0,0,0,3.97,0,0),(128998,3,2232.21,-5831.54,101.341,0,0,0,0,0,0,0,0,0,0,3.4,0,0),
(128998,4,2196.33,-5826.97,101.406,0,0,0,0,0,0,0,0,0,0,2.78909,0,0),(128998,5,2140.07,-5816.52,100.652,0,0,0,0,0,0,0,0,0,0,2.88019,0,0),(128998,6,2126.99,-5799.26,99.5154,0,0,0,0,0,0,0,0,0,0,2.59718,0,0),
(128998,7,2117.59,-5801.23,99.9204,1000,2857602,0,0,0,0,0,0,0,0,3.81219,0,0);
-- #9
UPDATE creature SET position_x = 2277.270020, position_y = -5867.498047, position_z = 100.942833, orientation = 1.66, spawndist = 0, MovementType = 2 WHERE guid = 128990;
DELETE FROM creature_movement WHERE id = 128990;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128990,1,2277.270020,-5867.498047,100.942833,7000,2857601,0,0,0,0,0,0,0,0,1.66,0,0),(128990,2,2272.55,-5847.26,100.935,0,0,0,0,0,0,0,0,0,0,2.1,0,0),(128990,3,2248.3,-5807.73,100.995,0,0,0,0,0,0,0,0,0,0,2.12,0,0),
(128990,4,2229.75,-5773.74,101.512,0,0,0,0,0,0,0,0,0,0,2.08609,0,0),(128990,5,2207.39,-5751.6,102.463,0,0,0,0,0,0,0,0,0,0,2.61624,0,0),(128990,6,2162.07,-5722.95,101.576,0,0,0,0,0,0,0,0,0,0,2.56911,0,0),
(128990,7,2144.9,-5704.05,102.252,0,0,0,0,0,0,0,0,0,0,2.71284,0,0),(128990,8,2132.24,-5701.09,101.273,0,0,0,0,0,0,0,0,0,0,3.02936,0,0),(128990,9,2098.18,-5703.38,100.27,0,0,0,0,0,0,0,0,0,0,3.19822,0,0),
(128990,10,2083.12,-5711.63,100.363,0,0,0,0,0,0,0,0,0,0,3.86031,0,0),(128990,11,2071.02,-5730.28,100.251,0,0,0,0,0,0,0,0,0,0,3.80297,0,0),(128990,12,2039.03,-5757.86,98.8153,0,0,0,0,0,0,0,0,0,0,3.91685,0,0),
(128990,13,2014.79,-5784.96,100.442,0,0,0,0,0,0,0,0,0,0,4.45915,0,0),(128990,14,2015.79,-5833.84,100.677,0,0,0,0,0,0,0,0,0,0,4.24709,0,0),(128990,15,2014.32,-5862.64,100.469,0,0,0,0,0,0,0,0,0,0,4.51648,0,0),
(128990,16,2005.57,-5893.96,102.374,0,0,0,0,0,0,0,0,0,0,4.04856,0,0),(128990,17,1985.4,-5923.43,104.304,0,0,0,0,0,0,0,0,0,0,3.81687,0,0),(128990,18,1971.35,-5933.44,102.888,0,0,0,0,0,0,0,0,0,0,3.32207,0,0),
(128990,19,1913.35,-5938.29,102.508,0,0,0,0,0,0,0,0,0,0,3.00398,0,0),(128990,20,1866.07,-5922.39,104.328,0,0,0,0,0,0,0,0,0,0,2.90974,0,0),(128990,21,1840.94,-5922.4,107.583,0,0,0,0,0,0,0,0,0,0,3.30636,0,0),
(128990,22,1813.25,-5930.15,114.563,0,0,0,0,0,0,0,0,0,0,3.31814,0,0),(128990,23,1789.73,-5930.3,116.116,0,0,0,0,0,0,0,0,0,0,2.9066,0,0),(128990,24,1713.48,-5892.5,116.135,0,0,0,0,0,0,0,0,0,0,2.62621,0,0),
(128990,25,1691.18,-5872.74,116.15,0,0,0,0,0,0,0,0,0,0,2.65,0,0),(128990,26,1682.69,-5868.98,116.231,0,0,0,0,0,0,0,0,0,0,3.13,0,0),(128990,27,1658.57,-5878.73,117.142,1000,2857602,0,0,0,0,0,0,0,0,3.52,0,0);
-- #10
UPDATE creature SET position_x = 2244.684570, position_y = -5863.497070, position_z = 101.023544, orientation = 3.25, spawndist = 0, MovementType = 2 WHERE guid = 128988;
DELETE FROM creature_movement WHERE id = 128988;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128988,1,2244.684570,-5863.497070,101.023544,10000,2857601,0,0,0,0,0,0,0,0,3.25,0,0),(128988,2,2236.78,-5865.79,101.105,0,0,0,0,0,0,0,0,0,0,3.21,0,0),(128988,3,2176.49,-5844.66,101.348,0,0,0,0,0,0,0,0,0,0,2.95,0,0),
(128988,4,2143.43,-5844.3,101.328,0,0,0,0,0,0,0,0,0,0,3.12626,0,0),(128988,5,2088.85,-5847.07,103.921,0,0,0,0,0,0,0,0,0,0,3.13018,0,0),(128988,6,2068.05,-5859.08,103.275,0,0,0,0,0,0,0,0,0,0,3.4844,0,0),
(128988,7,2026.17,-5873.86,101.836,0,0,0,0,0,0,0,0,0,0,3.07599,0,0),(128988,8,1970.37,-5871.27,100.618,0,0,0,0,0,0,0,0,0,0,2.89142,0,0),(128988,9,1950.31,-5859.67,100.117,0,0,0,0,0,0,0,0,0,0,2.68722,0,0),
(128988,10,1922.59,-5845.54,100.158,0,0,0,0,0,0,0,0,0,0,2.84037,0,0),(128988,11,1870.15,-5833.8,101.252,0,0,0,0,0,0,0,0,0,0,2.95426,0,0),(128988,12,1831.83,-5825.1,101.15,0,0,0,0,0,0,0,0,0,0,2.92677,0,0),
(128988,13,1762.85,-5824.3,116.116,0,0,0,0,0,0,0,0,0,0,3.07207,0,0),(128988,14,1714.55,-5821.33,116.122,0,0,0,0,0,0,0,0,0,0,2.94247,0,0),(128988,15,1701.84,-5811.57,116.011,0,0,0,0,0,0,0,0,0,0,2.69822,0,0),
(128988,16,1667.87,-5798.99,116.119,0,0,0,0,0,0,0,0,0,0,3.41686,0,0),(128988,17,1648.39,-5804.74,117.124,1000,2857602,0,0,0,0,0,0,0,0,3.48452,0,0);
-- #11
UPDATE creature SET position_x = 2170.995605, position_y = -5910.861816, position_z = 100.466431, orientation = 2.95, spawndist = 0, MovementType = 2 WHERE guid = 128991;
DELETE FROM creature_movement WHERE id = 128991;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128991,1,2170.995605,-5910.861816,100.466431,1000,2857601,0,0,0,0,0,0,0,0,2.95,0,0),(128991,2,2123.96,-5908.37,103.537,0,0,0,0,0,0,0,0,0,0,3.1,0,0),(128991,3,2063.83,-5917.86,106.994,0,0,0,0,0,0,0,0,0,0,3.3,0,0),
(128991,4,2018.57,-5925.72,104.636,0,0,0,0,0,0,0,0,0,0,3.3117,0,0),(128991,5,1978.91,-5931.81,103.27,0,0,0,0,0,0,0,0,0,0,3.02503,0,0),(128991,6,1930.42,-5925.82,103.547,0,0,0,0,0,0,0,0,0,0,3.03289,0,0),
(128991,7,1882.12,-5918.43,104.002,0,0,0,0,0,0,0,0,0,0,3.05252,0,0),(128991,8,1847.43,-5919.06,106.024,0,0,0,0,0,0,0,0,0,0,3.49235,0,0),(128991,9,1803.47,-5923.31,115.736,0,0,0,0,0,0,0,0,0,0,2.98969,0,0),
(128991,10,1746.99,-5912.37,116.119,0,0,0,0,0,0,0,0,0,0,2.6127,0,0),(128991,11,1706.68,-5886.96,116.131,0,0,0,0,0,0,0,0,0,0,1.37962,0,0),(128991,12,1658.84,-5845.24,116.138,0,0,0,0,0,0,0,0,0,0,2.92529,0,0),
(128991,13,1644.38,-5842.67,117.293,1000,2857602,0,0,0,0,0,0,0,0,3.09572,0,0);
-- #12
UPDATE creature SET position_x = 2170.457764, position_y = -5907.129883, position_z = 100.424911, orientation = 3.02, spawndist = 0, MovementType = 2 WHERE guid = 128935;
DELETE FROM creature_movement WHERE id = 128935;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128935,1,2170.457764,-5907.129883,100.424911,4000,2857601,0,0,0,0,0,0,0,0,3.02,0,0),(128935,2,2142.37,-5894.82,101.973,0,0,0,0,0,0,0,0,0,0,2.54,0,0),(128935,3,2107.72,-5872.92,103.053,0,0,0,0,0,0,0,0,0,0,2.97,0,0),
(128935,4,2067.51,-5867.54,103.87,0,0,0,0,0,0,0,0,0,0,3.02089,0,0),(128935,5,2024.79,-5869.48,101.221,0,0,0,0,0,0,0,0,0,0,3.18189,0,0),(128935,6,1951.56,-5846.48,100.403,0,0,0,0,0,0,0,0,0,0,3.09943,0,0),
(128935,7,1869.61,-5831.08,100.987,0,0,0,0,0,0,0,0,0,0,2.87559,0,0),(128935,8,1830.11,-5820.79,101.52,0,0,0,0,0,0,0,0,0,0,2.93253,0,0),(128935,9,1768.9,-5799.65,116.145,0,0,0,0,0,0,0,0,0,0,2.48092,0,0),
(128935,10,1756.63,-5788.3,116.123,0,0,0,0,0,0,0,0,0,0,2.73618,0,0),(128935,11,1744.66,-5783.13,116.123,0,0,0,0,0,0,0,0,0,0,2.13,0,0),(128935,12,1742.19,-5775.26,116.12,0,0,0,0,0,0,0,0,0,0,0.98,0,0),
(128935,13,1748.05,-5772.54,117.089,1000,2857602,0,0,0,0,0,0,0,0,0.309298,0,0);
-- #13
UPDATE creature SET position_x = 2217.407471, position_y = -5875.900391, position_z = 101.085777, orientation = 2.83, spawndist = 0, MovementType = 2 WHERE guid = 128985;
DELETE FROM creature_movement WHERE id = 128985;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128985,1,2217.407471,-5875.900391,101.085777,6000,2857601,0,0,0,0,0,0,0,0,2.83,0,0),(128985,2,2196.64,-5866.59,101.304,0,0,0,0,0,0,0,0,0,0,3.21,0,0),(128985,3,2170.04,-5867.43,101.34,0,0,0,0,0,0,0,0,0,0,2.93,0,0),
(128985,4,2137.81,-5856.76,101.391,0,0,0,0,0,0,0,0,0,0,2.81314,0,0),(128985,5,2082.67,-5847.29,103.244,0,0,0,0,0,0,0,0,0,0,3.24119,0,0),(128985,6,2029.99,-5848.05,100.431,0,0,0,0,0,0,0,0,0,0,3.19014,0,0),
(128985,7,1969.77,-5874.91,100.636,0,0,0,0,0,0,0,0,0,0,3.92841,0,0),(128985,8,1918.99,-5906.72,101.467,0,0,0,0,0,0,0,0,0,0,3.35429,0,0),(128985,9,1858.61,-5915.66,104.49,0,0,0,0,0,0,0,0,0,0,3.32287,0,0),
(128985,10,1803.63,-5926.08,115.628,0,0,0,0,0,0,0,0,0,0,2.99693,0,0),(128985,11,1768.5,-5923.63,116.119,0,0,0,0,0,0,0,0,0,0,3.92763,0,0),(128985,12,1754.77,-5942.33,116.14,0,0,0,0,0,0,0,0,0,0,4.11636,0,0),
(128985,13,1742.09,-5966.46,117.122,1000,2857602,0,0,0,0,0,0,0,0,4.13992,0,0);
-- #14
UPDATE creature SET position_x = 1941.105225, position_y = -5799.148926, position_z = 100.515633, orientation = 5.55, spawndist = 0, MovementType = 2 WHERE guid = 128936;
DELETE FROM creature_movement WHERE id = 128936;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128936,1,1941.105225,-5799.148926,100.515633,1000,2857601,0,0,0,0,0,0,0,0,5.55,0,0),(128936,2,1945.67,-5802.12,100.476,0,0,0,0,0,0,0,0,0,0,0.6,0,0),(128936,3,1951.73,-5799.14,100.577,0,0,0,0,0,0,0,0,0,0,1.3,0,0),
(128936,4,1942.04,-5772.9,102.126,0,0,0,0,0,0,0,0,0,0,2.26314,0,0),(128936,5,1927.43,-5772.54,101.941,0,0,0,0,0,0,0,0,0,0,3.99101,0,0),(128936,6,1895.65,-5808.82,101.188,0,0,0,0,0,0,0,0,0,0,3.77503,0,0),
(128936,7,1866.02,-5820.96,100.295,0,0,0,0,0,0,0,0,0,0,3.21268,0,0),(128936,8,1826.25,-5818.95,102.312,0,0,0,0,0,0,0,0,0,0,3.06841,0,0),(128936,9,1772.64,-5818.85,115.73,0,0,0,0,0,0,0,0,0,0,3.23334,0,0),
(128936,10,1717.71,-5814.72,116.151,0,0,0,0,0,0,0,0,0,0,2.80137,0,0),(128936,11,1664.44,-5790.83,116.12,0,0,0,0,0,0,0,0,0,0,2.57753,0,0),(128936,12,1608.48,-5763.8,116.663,0,0,0,0,0,0,0,0,0,0,2.10237,0,0),
(128936,13,1595.3,-5741.35,119.236,0,0,0,0,0,0,0,0,0,0,2.09756,0,0),(128936,14,1585.9,-5721.38,121.68,0,0,0,0,0,0,0,0,0,0,3.44059,0,0),(128936,15,1575.5,-5724.96,120.779,1000,2857602,0,0,0,0,0,0,0,0,3.59139,0,0);
-- #15
UPDATE creature SET position_x = 1941.454590, position_y = -5800.637695, position_z = 100.260811, orientation = 5.36, spawndist = 0, MovementType = 2 WHERE guid = 128927;
DELETE FROM creature_movement WHERE id = 128927;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128927,1,1941.454590,-5800.637695,100.260811,5000,2857601,0,0,0,0,0,0,0,0,5.36,0,0),(128927,2,1886.91,-5834.98,101.234,0,0,0,0,0,0,0,0,0,0,3,0,0),(128927,3,1852.12,-5830.11,100.757,0,0,0,0,0,0,0,0,0,0,3,0,0),
(128927,4,1831.31,-5827.4,101.217,0,0,0,0,0,0,0,0,0,0,3.08701,0,0),(128927,5,1779.23,-5826.67,115.221,0,0,0,0,0,0,0,0,0,0,3.37761,0,0),(128927,6,1733.84,-5854.41,116.616,0,0,0,0,0,0,0,0,0,0,3.71533,0,0),
(128927,7,1683.82,-5870.42,116.177,0,0,0,0,0,0,0,0,0,0,3.41688,0,0),(128927,8,1659.01,-5878.35,117.142,1000,2857602,0,0,0,0,0,0,0,0,3.5072,0,0);
-- #16
UPDATE creature SET position_x = 1939.179810, position_y = -5802.433105, position_z = 100.259399, orientation = 4.3, spawndist = 0, MovementType = 2 WHERE guid = 128924;
DELETE FROM creature_movement WHERE id = 128924;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128924,1,1939.179810,-5802.433105,100.259399,3000,2857601,0,0,0,0,0,0,0,0,4.3,0,0),(128924,2,1905.17,-5812.59,100.617,0,0,0,0,0,0,0,0,0,0,3.4,0,0),(128924,3,1839.49,-5820.87,100.435,0,0,0,0,0,0,0,0,0,0,3.2,0,0),
(128924,4,1770.56,-5825.94,115.982,0,0,0,0,0,0,0,0,0,0,3.22811,0,0),(128924,5,1750.1,-5823.17,116.122,0,0,0,0,0,0,0,0,0,0,2.46235,0,0),(128924,6,1747.84,-5801.86,117.123,1000,2857602,0,0,0,0,0,0,0,0,1.4374,0,0);
-- #17
UPDATE creature SET position_x = 1938.616211, position_y = -5867.627930, position_z = 99.059547, orientation = 0.5, spawndist = 0, MovementType = 2 WHERE guid = 128986;
DELETE FROM creature_movement WHERE id = 128986;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128986,1,1938.616211,-5867.627930,99.059547,1000,2857601,0,0,0,0,0,0,0,0,0.5,0,0),(128986,2,1953.07,-5871.43,100.064,0,0,0,0,0,0,0,0,0,0,5.5,0,0),(128986,3,1957.82,-5886.43,101.62,0,0,0,0,0,0,0,0,0,0,4.26,0,0),
(128986,4,1927.15,-5905.47,101.052,0,0,0,0,0,0,0,0,0,0,3.63259,0,0),(128986,5,1865.38,-5906.94,103.945,0,0,0,0,0,0,0,0,0,0,3.59253,0,0),(128986,6,1813.74,-5924.07,114.088,0,0,0,0,0,0,0,0,0,0,3.44723,0,0),
(128986,7,1744.47,-5905.5,116.142,0,0,0,0,0,0,0,0,0,0,2.79928,0,0),(128986,8,1666.27,-5874.95,116.156,0,0,0,0,0,0,0,0,0,0,3.66322,0,0),(128986,9,1659.64,-5878.93,117.141,1000,2857602,0,0,0,0,0,0,0,0,3.60431,0,0);
-- #18
UPDATE creature SET position_x = 2067.154541, position_y = -5900.735840, position_z = 105.315590, orientation = 3.37, spawndist = 0, MovementType = 2 WHERE guid = 128925;
DELETE FROM creature_movement WHERE id = 128925;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128925,1,2067.154541,-5900.735840,105.315590,10000,2857601,0,0,0,0,0,0,0,0,3.37,0,0),(128925,2,2023.75,-5909.85,104.968,0,0,0,0,0,0,0,0,0,0,3.2,0,0),(128925,3,1950.4,-5910.79,101.778,0,0,0,0,0,0,0,0,0,0,3.2,0,0),
(128925,4,1898.09,-5912,101.896,0,0,0,0,0,0,0,0,0,0,3.25,0,0),(128925,5,1854.49,-5919.36,104.994,0,0,0,0,0,0,0,0,0,0,3.27444,0,0),(128925,6,1805.89,-5925.83,115.401,0,0,0,0,0,0,0,0,0,0,3.16055,0,0),
(128925,7,1739.83,-5908.36,116.121,0,0,0,0,0,0,0,0,0,0,2.8621,0,0),(128925,8,1695.83,-5881.5,116.135,0,0,0,0,0,0,0,0,0,0,2.83461,0,0),(128925,9,1652.39,-5843.25,116.135,0,0,0,0,0,0,0,0,0,0,2.90765,0,0),
(128925,10,1645.09,-5842.39,117.293,1000,2857602,0,0,0,0,0,0,0,0,3.10793,0,0);
-- #19
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid = 128919;
DELETE FROM creature_movement WHERE id = 128919;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128919,1,2159.18,-5892.81,101.401,1000,2857601,0,0,0,0,0,0,0,0,2.0744,0,0),(128919,2,2132.78,-5865.54,101.596,0,0,0,0,0,0,0,0,0,0,2.70658,0,0),(128919,3,2084.84,-5829.55,102.578,0,0,0,0,0,0,0,0,0,0,2.58877,0,0),
(128919,4,2054.93,-5803.12,102.494,0,0,0,0,0,0,0,0,0,0,3.04037,0,0),(128919,5,1997.51,-5805.87,100.678,0,0,0,0,0,0,0,0,0,0,3.21316,0,0),(128919,6,1977.29,-5813.95,101.035,0,0,0,0,0,0,0,0,0,0,3.73545,0,0),
(128919,7,1959.61,-5811.83,101.148,0,0,0,0,0,0,0,0,0,0,2.84402,0,0),(128919,8,1941.14,-5799.42,100.516,1000,2857602,0,0,0,0,0,0,0,0,2.40027,0,0);
-- #20
UPDATE creature SET position_x = 2067.149414, position_y = -5885.223633, position_z = 104.120804, orientation = 3.6, spawndist = 0, MovementType = 2 WHERE guid = 128974;
DELETE FROM creature_movement WHERE id = 128974;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128974,1,2067.149414,-5885.223633,104.120804,6000,2857601,0,0,0,0,0,0,0,0,3.6,0,0),(128974,2,2034.37,-5906.14,105.076,0,0,0,0,0,0,0,0,0,0,3.39,0,0),(128974,3,1948.81,-5904.8,101.364,0,0,0,0,0,0,0,0,0,0,3,0,0),
(128974,4,1899,-5901.04,102.011,0,0,0,0,0,0,0,0,0,0,3.35844,0,0),(128974,5,1857.14,-5919.97,104.759,0,0,0,0,0,0,0,0,0,0,3.48803,0,0),(128974,6,1806.77,-5925.39,115.368,0,0,0,0,0,0,0,0,0,0,2.81651,0,0),
(128974,7,1743.95,-5906.21,116.13,0,0,0,0,0,0,0,0,0,0,2.86364,0,0),(128974,8,1696.17,-5874.24,116.141,0,0,0,0,0,0,0,0,0,0,3.02857,0,0),(128974,9,1666.11,-5875.97,116.156,0,0,0,0,0,0,0,0,0,0,3.36629,0,0),
(128974,10,1660.01,-5877.95,117.142,1000,2857602,0,0,0,0,0,0,0,0,3.5273,0,0);
-- #21
UPDATE creature SET position_x = 2140.980225, position_y = -5779.114258, position_z = 99.407547, orientation = 3.5, spawndist = 0, MovementType = 2 WHERE guid = 128939;
DELETE FROM creature_movement WHERE id = 128939;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128939,1,2140.980225,-5779.114258,99.407547,6000,2857601,0,0,0,0,0,0,0,0,3.5,0,0),(128939,2,2086.14,-5775.21,99.1742,0,0,0,0,0,0,0,0,0,0,2.7,0,0),(128939,3,2043.6,-5761.94,98.8911,0,0,0,0,0,0,0,0,0,0,3.3,0,0),
(128939,4,2008.65,-5779.73,100.501,0,0,0,0,0,0,0,0,0,0,3.63878,0,0),(128939,5,1977.81,-5796.46,100.932,0,0,0,0,0,0,0,0,0,0,3.37567,0,0),(128939,6,1942.26,-5800.28,100.278,1000,2857602,0,0,0,0,0,0,0,0,2.85853,0,0);
-- #22
UPDATE creature SET position_x = 2116.1, position_y = -5802.52, position_z = 100.8, orientation = 0.9, spawndist = 0, MovementType = 2 WHERE guid = 128923;
DELETE FROM creature_movement WHERE id = 128923;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128923,1,2116.1,-5802.52,100.8,1000,2857601,0,0,0,0,0,0,0,0,0.9,0,0),(128923,2,2119.35,-5797.03,99.6076,0,0,0,0,0,0,0,0,0,0,1.66045,0,0),(128923,3,2117.58,-5787.27,98.7951,0,0,0,0,0,0,0,0,0,0,2.56354,0,0),
(128923,4,2076.21,-5768.19,99.1701,0,0,0,0,0,0,0,0,0,0,2.82429,0,0),(128923,5,2034.56,-5763.16,99.7534,0,0,0,0,0,0,0,0,0,0,3.77463,0,0),(128923,6,2000.9,-5792.28,100.695,0,0,0,0,0,0,0,0,0,0,3.86102,0,0),
(128923,7,1956.93,-5830.99,100.828,0,0,0,0,0,0,0,0,0,0,3.85709,0,0),(128923,8,1906.43,-5844.33,100.691,0,0,0,0,0,0,0,0,0,0,3.03242,0,0),(128923,9,1870.69,-5831.22,101.043,0,0,0,0,0,0,0,0,0,0,2.66329,0,0),
(128923,10,1837.45,-5821.06,100.593,0,0,0,0,0,0,0,0,0,0,2.97745,0,0),(128923,11,1774.77,-5819.43,115.49,0,0,0,0,0,0,0,0,0,0,3.10311,0,0),(128923,12,1752.66,-5819.17,116.12,0,0,0,0,0,0,0,0,0,0,2.26273,0,0),
(128923,13,1747.47,-5809.54,116.123,0,0,0,0,0,0,0,0,0,0,1.44199,0,0),(128923,14,1748.39,-5803.1,117.124,1000,2857602,0,0,0,0,0,0,0,0,1.37523,0,0);
-- #23
UPDATE creature SET position_x = 1908.830811, position_y = -5884.311035, position_z = 100.260605, orientation = 4.1, spawndist = 0, MovementType = 2 WHERE guid = 128910;
DELETE FROM creature_movement WHERE id = 128910;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128910,1,1908.830811,-5884.311035,100.260605,1000,2857601,0,0,0,0,0,0,0,0,4.1,0,0),(128910,2,1870.1,-5910.93,104.046,0,0,0,0,0,0,0,0,0,0,3.73,0,0),(128910,3,1823.62,-5927.41,112.225,0,0,0,0,0,0,0,0,0,0,3.5,0,0),
(128910,4,1793.2,-5931.67,116.089,0,0,0,0,0,0,0,0,0,0,3.16377,0,0),(128910,5,1751.19,-5914.43,116.115,0,0,0,0,0,0,0,0,0,0,2.77899,0,0),(128910,6,1696.15,-5881.5,116.137,0,0,0,0,0,0,0,0,0,0,2.35094,0,0),
(128910,7,1652.94,-5833.58,116.204,0,0,0,0,0,0,0,0,0,0,2.25277,0,0),(128910,8,1615.36,-5781.67,116.115,0,0,0,0,0,0,0,0,0,0,2.04464,0,0),(128910,9,1586.79,-5723.86,121.68,1000,2857602,0,0,0,0,0,0,0,0,2.48996,0,0);
-- Citizen of Havenshire
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2857601,2857602);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2857601,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2857602,1,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn'); 
-- Update for 52149
DELETE FROM dbscripts_on_spell WHERE id = 52149;
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(52149,0,31,28576,50,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(52149,1,15,52152,0,0,0,0,0,0,0,0,0,0,0,0,''),
(52149,10,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn');
-- ---------------------------
-- DK Starting Zone - phase 1 - part3. - Scarlet Miners
-- ---------------------------

-- Scarlet Miner - q. req. (should respawn almost instant after despawn)
UPDATE creature SET spawntimesecs = 10 WHERE id = 28822;
-- Scarlet Miner #1 
UPDATE creature SET position_x = 2216.001709, position_y = -6019.908203, position_z = 8.945984, orientation = 4.067243, MovementType = 2, spawndist = 0 WHERE guid = 128904;
DELETE FROM creature_movement WHERE id = 128904;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128904,1,2216.001709,-6019.908203,8.945984,2000,2882201,0,0,0,0,0,0,0,0,4.35549,0,0),(128904,2,2206.69,-6050.58,6.27707,0,0,0,0,0,0,0,0,0,0,4.35549,0,0),(128904,3,2191.11,-6087.17,2.79132,0,0,0,0,0,0,0,0,0,0,4.38298,0,0),
(128904,4,2179.79,-6133.88,1.93313,0,0,0,0,0,0,0,0,0,0,4.33271,0,0),(128904,5,2169.92,-6152.61,1.19506,0,0,0,0,0,0,0,0,0,0,3.57002,0,0),(128904,6,2134.24,-6167,0.419345,0,0,0,0,0,0,0,0,0,0,4.10802,0,0),
(128904,7,2122.31,-6186.06,14.0377,0,0,0,0,0,0,0,0,0,0,4.17085,0,0),(128904,8,2118.87,-6192.96,13.3049,2000,2882202,0,0,0,0,0,0,0,0,4.06482,0,0);
-- Scarlet Miner #2
UPDATE creature SET position_x = 2300.483643, position_y = -5910.774902, position_z = 86.692505, orientation = 4.1, MovementType = 2, spawndist = 0 WHERE guid = 128905;
DELETE FROM creature_movement WHERE id = 128905;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128905,1,2300.483643,-5910.774902,86.692505,2000,2882201,0,0,0,0,0,0,0,0,4.1,0,0),(128905,2,2293.55,-5917.05,82.6056,0,0,0,0,0,0,0,0,0,0,4.5,0,0),(128905,3,2291.99,-5937.86,68.6884,0,0,0,0,0,0,0,0,0,0,4.4,0,0),
(128905,4,2285.03,-5954.97,58.3396,0,0,0,0,0,0,0,0,0,0,4.11897,0,0),(128905,5,2271.14,-5968.92,48.9592,0,0,0,0,0,0,0,0,0,0,3.69171,0,0),(128905,6,2250.53,-5976.27,38.1416,0,0,0,0,0,0,0,0,0,0,3.80481,0,0),
(128905,7,2235.15,-5990.82,28.9556,0,0,0,0,0,0,0,0,0,0,4.26348,0,0),(128905,8,2230.64,-5998.63,23.2568,0,0,0,0,0,0,0,0,0,0,4.21792,0,0),(128905,9,2222.41,-6016.41,10.5581,0,0,0,0,0,0,0,0,0,0,4.24148,0,0),
(128905,10,2210.8,-6041.32,6.66781,0,0,0,0,0,0,0,0,0,0,4.29646,0,0),(128905,11,2197.73,-6067.8,5.00293,0,0,0,0,0,0,0,0,0,0,4.1708,0,0),(128905,12,2181.79,-6096.56,1.5113,0,0,0,0,0,0,0,0,0,0,4.23363,0,0),
(128905,13,2176.28,-6119.68,1.27137,0,0,0,0,0,0,0,0,0,0,4.6224,0,0),(128905,14,2178.41,-6143.14,1.49253,0,0,0,0,0,0,0,0,0,0,5.04965,0,0),(128905,15,2186.09,-6157.27,2.71064,0,0,0,0,0,0,0,0,0,0,5.61592,0,0),
(128905,16,2202.49,-6165.09,1.20293,0,0,0,0,0,0,0,0,0,0,6.13977,0,0),(128905,17,2232.58,-6165.21,0.876994,0,0,0,0,0,0,0,0,0,0,0.0332994,0,0),(128905,18,2258.76,-6162.07,1.12015,0,0,0,0,0,0,0,0,0,0,5.8476,0,0),
(128905,19,2268.92,-6167.7,1.24728,0,0,0,0,0,0,0,0,0,0,4.96325,0,0),(128905,20,2271.04,-6187.32,13.9861,0,0,0,0,0,0,0,0,0,0,4.81639,0,0),(128905,21,2271.88,-6195.34,13.2237,2000,2882202,0,0,0,0,0,0,0,0,4.81639,0,0);
-- Scarlet Miner & Mine car #3  
UPDATE creature SET position_x = 2416.258057, position_y = -5891.284668, position_z = 104.595085, orientation = 0.440682 WHERE guid = 128869;
UPDATE creature SET position_x = 2416.258057, position_y = -5891.284668, position_z = 104.595085, orientation = 0.440682, MovementType = 2, spawndist = 0 WHERE guid = 128894;
DELETE FROM creature_movement WHERE id = 128894;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128894,1,2416.258057,-5891.284668,104.595085,2000,2882201,0,0,0,0,0,0,0,0,0.44,0,0),(128894,2,2430.03,-5884.64,104.602,0,0,0,0,0,0,0,0,0,0,5.75,0,0),(128894,3,2434.08,-5888.33,104.883,0,0,0,0,0,0,0,0,0,0,4.99,0,0),
(128894,4,2437.97,-5899.35,103.585,0,0,0,0,0,0,0,0,0,0,4.9803,0,0),(128894,5,2442.79,-5912.86,102.113,0,0,0,0,0,0,0,0,0,0,4.87427,0,0),(128894,6,2440.3,-5926.62,97.3613,0,0,0,0,0,0,0,0,0,0,4.28602,0,0),
(128894,7,2427.87,-5938.68,95.1745,0,0,0,0,0,0,0,0,0,0,3.7276,0,0),(128894,8,2422.66,-5942.83,96.5461,0,0,0,0,0,0,0,0,0,0,4.17449,0,0),(128894,9,2419.94,-5957.54,97.6666,0,0,0,0,0,0,0,0,0,0,5.02036,0,0),
(128894,10,2428.03,-5967.78,95.4582,0,0,0,0,0,0,0,0,0,0,5.59683,0,0),(128894,11,2437.99,-5971.81,95.8846,0,0,0,0,0,0,0,0,0,0,6.05236,0,0),(128894,12,2447.36,-5970.5,94.5749,0,0,0,0,0,0,0,0,0,0,0.566349,0,0),
(128894,13,2453.66,-5955.88,95.6707,2000,2882202,0,0,0,0,0,0,0,0,1.38709,0,0);
-- Scarlet Miner & Mine car #4 
UPDATE creature SET position_x = 2410.756348, position_y = -5939.629395, position_z = 97.339973, orientation = 5.943231 WHERE guid = 128860;
UPDATE creature SET position_x = 2410.756348, position_y = -5939.629395, position_z = 97.339973, orientation = 5.943231, MovementType = 2, spawndist = 0 WHERE guid = 128885;
DELETE FROM creature_movement WHERE id = 128885;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128885,1,2410.756348,-5939.629395,97.339973,2000,2882201,0,0,0,0,0,0,0,0,5.94,0,0),(128885,2,2418.29,-5945.4,96.7502,0,0,0,0,0,0,0,0,0,0,5.04,0,0),(128885,3,2418.23,-5953.19,97.8662,0,0,0,0,0,0,0,0,0,0,5.15,0,0),
(128885,4,2423.57,-5963.65,96.3384,0,0,0,0,0,0,0,0,0,0,5.53484,0,0),(128885,5,2437.87,-5970.48,96.0122,0,0,0,0,0,0,0,0,0,0,6.24955,0,0),(128885,6,2474.32,-5975.1,96.276,0,0,0,0,0,0,0,0,0,0,5.99508,0,0),
(128885,7,2494.78,-5978.27,95.4998,0,0,0,0,0,0,0,0,0,0,5.71626,0,0),(128885,8,2502.53,-5986.94,95.9192,0,0,0,0,0,0,0,0,0,0,5.42567,0,0),(128885,9,2515.76,-5995.49,102.375,0,0,0,0,0,0,0,0,0,0,6.18436,0,0),
(128885,10,2523.18,-5991.62,103.452,0,0,0,0,0,0,0,0,0,0,0.858627,0,0),(128885,11,2528.24,-5981.97,103.248,0,0,0,0,0,0,0,0,0,0,1.94326,0,0),(128885,12,2521.05,-5969.02,105.047,0,0,0,0,0,0,0,0,0,0,1.68433,0,0),
(128885,13,2522.14,-5957.16,107.549,0,0,0,0,0,0,0,0,0,0,1.33718,0,0),(128885,14,2522.25,-5950.23,109.716,0,0,0,0,0,0,0,0,0,0,2.07624,0,0),(128885,15,2514.35,-5940.16,111.123,0,0,0,0,0,0,0,0,0,0,2.31107,0,0),
(128885,16,2504.78,-5932.21,115.134,0,0,0,0,0,0,0,0,0,0,3.00222,0,0),(128885,17,2487.73,-5936.38,116.357,0,0,0,0,0,0,0,0,0,0,3.65803,0,0),(128885,18,2473.76,-5938.02,115.203,0,0,0,0,0,0,0,0,0,0,2.57418,0,0),
(128885,19,2469.85,-5932.18,115.978,0,0,0,0,0,0,0,0,0,0,1.88931,0,0),(128885,20,2465.38,-5916.21,113.31,0,0,0,0,0,0,0,0,0,0,2.5514,0,0),(128885,21,2453.98,-5909.97,112.809,0,0,0,0,0,0,0,0,0,0,3.11693,0,0),
(128885,22,2437,-5915.94,112.788,0,0,0,0,0,0,0,0,0,0,3.14599,0,0),(128885,23,2428.36,-5912.56,112.956,0,0,0,0,0,0,0,0,0,0,3.47665,0,0),(128885,24,2419.72,-5916.33,111.72,0,0,0,0,0,0,0,0,0,0,3.57089,0,0),
(128885,25,2407.87,-5920.25,110.704,0,0,0,0,0,0,0,0,0,0,3.09023,0,0),(128885,26,2382.72,-5912.66,109.618,0,0,0,0,0,0,0,0,0,0,2.8012,0,0),(128885,27,2360.63,-5906.09,105.863,0,0,0,0,0,0,0,0,0,0,2.87974,0,0),
(128885,28,2339.74,-5900.61,102.166,0,0,0,0,0,0,0,0,0,0,3.0164,0,0),(128885,29,2320.65,-5901.12,96.3481,0,0,0,0,0,0,0,0,0,0,3.36748,0,0),(128885,30,2302.29,-5906.91,88.4851,0,0,0,0,0,0,0,0,0,0,3.71462,0,0),
(128885,31,2298.87,-5912.52,85.7672,0,0,0,0,0,0,0,0,0,0,4.15602,0,0),(128885,32,2294.47,-5920.02,80.6317,0,0,0,0,0,0,0,0,0,0,4.48588,0,0),(128885,33,2295.5,-5927.8,75.0694,0,0,0,0,0,0,0,0,0,0,4.50787,0,0),
(128885,34,2289.38,-5936.56,68.8048,0,0,0,0,0,0,0,0,0,0,4.35394,0,0),(128885,35,2281.71,-5954.08,57.7201,0,0,0,0,0,0,0,0,0,0,4.07015,0,0),(128885,36,2273.67,-5964.09,51.0012,0,0,0,0,0,0,0,0,0,0,3.82197,0,0),
(128885,37,2263.62,-5972.28,44.9642,0,0,0,0,0,0,0,0,0,0,3.50074,0,0),(128885,38,2250.32,-5978.05,37.1378,0,0,0,0,0,0,0,0,0,0,3.68923,0,0),(128885,39,2242.16,-5986.44,32.0029,0,0,0,0,0,0,0,0,0,0,3.9759,0,0),
(128885,40,2236.48,-5994.7,27.2984,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),(128885,41,2232.02,-6001.88,21.9415,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),(128885,42,2222.59,-6018.69,9.85442,0,0,0,0,0,0,0,0,0,0,4.25079,0,0),
(128885,43,2210.65,-6043.1,6.58405,0,0,0,0,0,0,0,0,0,0,4.27435,0,0),(128885,44,2195.04,-6068.81,4.8415,0,0,0,0,0,0,0,0,0,0,4.29006,0,0),(128885,45,2184.79,-6100.61,0.801771,0,0,0,0,0,0,0,0,0,0,4.45499,0,0),
(128885,46,2180.3,-6117.91,1.28701,0,0,0,0,0,0,0,0,0,0,4.35368,0,0),(128885,47,2176.49,-6139.76,1.21043,0,0,0,0,0,0,0,0,0,0,4.53432,0,0),(128885,48,2168.43,-6148.86,1.24682,0,0,0,0,0,0,0,0,0,0,3.76777,0,0),
(128885,49,2151.16,-6153.96,1.24645,0,0,0,0,0,0,0,0,0,0,3.43005,0,0),(128885,50,2134,-6167.23,0.364198,0,0,0,0,0,0,0,0,0,0,4.12905,0,0),(128885,51,2122.69,-6185.79,14.1288,0,0,0,0,0,0,0,0,0,0,4.1801,0,0),
(128885,52,2119.26,-6191.63,13.2701,2000,2882202,0,0,0,0,0,0,0,0,4.1801,0,0);
-- Scarlet Miner & Mine car #5 
UPDATE creature SET position_x = 2477.604004, position_y = -5931.103027, position_z = 115.977074, orientation = 3.842377, MovementType = 2, spawndist = 0 WHERE guid = 128893;
DELETE FROM creature_movement WHERE id = 128893;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128893,1,2477.604004,-5931.103027,115.977074,2000,2882201,0,0,0,0,0,0,0,0,3.84,0,0),(128893,2,2469.85,-5932.18,115.978,0,0,0,0,0,0,0,0,0,0,1.9,0,0),(128893,3,2465.38,-5916.21,113.31,0,0,0,0,0,0,0,0,0,0,2.6,0,0),
(128893,4,2453.98,-5909.97,112.809,0,0,0,0,0,0,0,0,0,0,3.11693,0,0),(128893,5,2437,-5915.94,112.788,0,0,0,0,0,0,0,0,0,0,3.14599,0,0),(128893,6,2428.36,-5912.56,112.956,0,0,0,0,0,0,0,0,0,0,3.47665,0,0),
(128893,7,2419.72,-5916.33,111.72,0,0,0,0,0,0,0,0,0,0,3.57089,0,0),(128893,8,2407.87,-5920.25,110.704,0,0,0,0,0,0,0,0,0,0,3.09023,0,0),(128893,9,2382.72,-5912.66,109.618,0,0,0,0,0,0,0,0,0,0,2.8012,0,0),
(128893,10,2360.63,-5906.09,105.863,0,0,0,0,0,0,0,0,0,0,2.87974,0,0),(128893,11,2339.74,-5900.61,102.166,0,0,0,0,0,0,0,0,0,0,3.0164,0,0),(128893,12,2320.65,-5901.12,96.3481,0,0,0,0,0,0,0,0,0,0,3.36748,0,0),
(128893,13,2302.29,-5906.91,88.4851,0,0,0,0,0,0,0,0,0,0,3.71462,0,0),(128893,14,2298.87,-5912.52,85.7672,0,0,0,0,0,0,0,0,0,0,4.15602,0,0),(128893,15,2294.47,-5920.02,80.6317,0,0,0,0,0,0,0,0,0,0,4.48588,0,0),
(128893,16,2295.5,-5927.8,75.0694,0,0,0,0,0,0,0,0,0,0,4.50787,0,0),(128893,17,2289.38,-5936.56,68.8048,0,0,0,0,0,0,0,0,0,0,4.35394,0,0),(128893,18,2281.71,-5954.08,57.7201,0,0,0,0,0,0,0,0,0,0,4.07015,0,0),
(128893,19,2273.67,-5964.09,51.0012,0,0,0,0,0,0,0,0,0,0,3.82197,0,0),(128893,20,2263.62,-5972.28,44.9642,0,0,0,0,0,0,0,0,0,0,3.50074,0,0),(128893,21,2250.32,-5978.05,37.1378,0,0,0,0,0,0,0,0,0,0,3.68923,0,0),
(128893,22,2242.16,-5986.44,32.0029,0,0,0,0,0,0,0,0,0,0,3.9759,0,0),(128893,23,2236.48,-5994.7,27.2984,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),(128893,24,2232.02,-6001.88,21.9415,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),
(128893,25,2222.59,-6018.69,9.85442,0,0,0,0,0,0,0,0,0,0,4.25079,0,0),(128893,26,2210.65,-6043.1,6.58405,0,0,0,0,0,0,0,0,0,0,4.27435,0,0),(128893,27,2195.04,-6068.81,4.8415,0,0,0,0,0,0,0,0,0,0,4.29006,0,0),
(128893,28,2184.79,-6100.61,0.801771,0,0,0,0,0,0,0,0,0,0,4.45499,0,0),(128893,29,2180.3,-6117.91,1.28701,0,0,0,0,0,0,0,0,0,0,4.35368,0,0),(128893,30,2176.49,-6139.76,1.21043,0,0,0,0,0,0,0,0,0,0,4.53432,0,0),
(128893,31,2168.43,-6148.86,1.24682,0,0,0,0,0,0,0,0,0,0,3.76777,0,0),(128893,32,2151.16,-6153.96,1.24645,0,0,0,0,0,0,0,0,0,0,3.43005,0,0),(128893,33,2134,-6167.23,0.364198,0,0,0,0,0,0,0,0,0,0,4.12905,0,0),
(128893,34,2122.69,-6185.79,14.1288,0,0,0,0,0,0,0,0,0,0,4.1801,0,0),(128893,35,2119.26,-6191.63,13.2701,2000,2882202,0,0,0,0,0,0,0,0,4.1801,0,0);
-- Scarlet Miner & Mine car #6 
UPDATE creature SET position_x = 2406.754639, position_y = -5931.366211, position_z = 112.795784, orientation = 1.730102 WHERE guid = 128873;
UPDATE creature SET position_x = 2406.754639, position_y = -5931.366211, position_z = 112.795784, orientation = 1.730102, MovementType = 2, spawndist = 0 WHERE guid = 128898;
DELETE FROM creature_movement WHERE id = 128898;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128898,1,2406.754639,-5931.366211,112.795784,2000,2882201,0,0,0,0,0,0,0,0,1.73,0,0),(128898,2,2408.93,-5923.46,111.244,0,0,0,0,0,0,0,0,0,0,0.75,0,0),(128898,3,2420.15,-5915.89,111.804,0,0,0,0,0,0,0,0,0,0,0.6,0,0),
(128898,4,2424.12,-5913.94,112.944,0,0,0,0,0,0,0,0,0,0,0.322753,0,0),(128898,5,2429.91,-5913.57,112.917,0,0,0,0,0,0,0,0,0,0,6.02989,0,0),(128898,6,2436.71,-5915.68,112.756,0,0,0,0,0,0,0,0,0,0,0.164542,0,0),
(128898,7,2454.24,-5910.7,112.815,0,0,0,0,0,0,0,0,0,0,6.00319,0,0),(128898,8,2461.68,-5912.38,112.696,0,0,0,0,0,0,0,0,0,0,5.52956,0,0),(128898,9,2466.62,-5920.92,113.937,0,0,0,0,0,0,0,0,0,0,5.10781,0,0),
(128898,10,2470.2,-5931.9,115.936,0,0,0,0,0,0,0,0,0,0,4.94288,0,0),(128898,11,2471.25,-5946.04,114.238,0,0,0,0,0,0,0,0,0,0,3.91009,0,0),(128898,12,2461.91,-5945.94,115.98,0,0,0,0,0,0,0,0,0,0,2.90478,0,0),
(128898,13,2442.28,-5941.64,118.664,2000,2882202,0,0,0,0,0,0,0,0,3.00295,0,0);
-- Scarlet Miner & Mine car #7
UPDATE creature SET position_x = 2419.589111, position_y = -5899.963867, position_z = 113.110573, orientation = 5.496583 WHERE guid = 128874;
UPDATE creature SET position_x = 2419.589111, position_y = -5899.963867, position_z = 113.110573, orientation = 5.496583, MovementType = 2, spawndist = 0 WHERE guid = 128899;
DELETE FROM creature_movement WHERE id = 128899;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128899,1,2419.589111,-5899.963867,113.110573,2000,2882201,0,0,0,0,0,0,0,0,5.49658,0,0),(128899,2,2424.73,-5905.68,113.469,0,0,0,0,0,0,0,0,0,0,4.6017,0,0),(128899,3,2423.05,-5913.57,112.85,0,0,0,0,0,0,0,0,0,0,3.9,0,0),
(128899,4,2419.72,-5916.33,111.72,0,0,0,0,0,0,0,0,0,0,3.57089,0,0),(128899,5,2407.87,-5920.25,110.704,0,0,0,0,0,0,0,0,0,0,3.09023,0,0),(128899,6,2382.72,-5912.66,109.618,0,0,0,0,0,0,0,0,0,0,2.8012,0,0),
(128899,7,2360.63,-5906.09,105.863,0,0,0,0,0,0,0,0,0,0,2.87974,0,0),(128899,8,2339.74,-5900.61,102.166,0,0,0,0,0,0,0,0,0,0,3.0164,0,0),(128899,9,2320.65,-5901.12,96.3481,0,0,0,0,0,0,0,0,0,0,3.36748,0,0),
(128899,10,2302.29,-5906.91,88.4851,0,0,0,0,0,0,0,0,0,0,3.71462,0,0),(128899,11,2298.87,-5912.52,85.7672,0,0,0,0,0,0,0,0,0,0,4.15602,0,0),(128899,12,2294.47,-5920.02,80.6317,0,0,0,0,0,0,0,0,0,0,4.48588,0,0),
(128899,13,2295.5,-5927.8,75.0694,0,0,0,0,0,0,0,0,0,0,4.50787,0,0),(128899,14,2289.38,-5936.56,68.8048,0,0,0,0,0,0,0,0,0,0,4.35394,0,0),(128899,15,2281.71,-5954.08,57.7201,0,0,0,0,0,0,0,0,0,0,4.07015,0,0),
(128899,16,2273.67,-5964.09,51.0012,0,0,0,0,0,0,0,0,0,0,3.82197,0,0),(128899,17,2263.62,-5972.28,44.9642,0,0,0,0,0,0,0,0,0,0,3.50074,0,0),(128899,18,2250.32,-5978.05,37.1378,0,0,0,0,0,0,0,0,0,0,3.68923,0,0),
(128899,19,2242.16,-5986.44,32.0029,0,0,0,0,0,0,0,0,0,0,3.9759,0,0),(128899,20,2236.48,-5994.7,27.2984,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),(128899,21,2232.02,-6001.88,21.9415,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),
(128899,22,2222.59,-6018.69,9.85442,0,0,0,0,0,0,0,0,0,0,4.25079,0,0),(128899,23,2210.65,-6043.1,6.58405,0,0,0,0,0,0,0,0,0,0,4.27435,0,0),(128899,24,2195.04,-6068.81,4.8415,0,0,0,0,0,0,0,0,0,0,4.29006,0,0),
(128899,25,2184.79,-6100.61,0.801771,0,0,0,0,0,0,0,0,0,0,4.45499,0,0),(128899,26,2180.3,-6117.91,1.28701,0,0,0,0,0,0,0,0,0,0,4.35368,0,0),(128899,27,2176.49,-6139.76,1.21043,0,0,0,0,0,0,0,0,0,0,4.53432,0,0),
(128899,28,2168.43,-6148.86,1.24682,0,0,0,0,0,0,0,0,0,0,3.76777,0,0),(128899,29,2151.16,-6153.96,1.24645,0,0,0,0,0,0,0,0,0,0,3.43005,0,0),(128899,30,2134,-6167.23,0.364198,0,0,0,0,0,0,0,0,0,0,4.12905,0,0),
(128899,31,2122.69,-6185.79,14.1288,0,0,0,0,0,0,0,0,0,0,4.1801,0,0),(128899,32,2119.26,-6191.63,13.2701,2000,2882202,0,0,0,0,0,0,0,0,4.1801,0,0);
-- Scarlet Miner & Mine car #8
UPDATE creature SET position_x = 2535.325195, position_y = -5944.641602, position_z = 109.437996, orientation = 3.43 WHERE guid = 128864;
UPDATE creature SET position_x = 2535.325195, position_y = -5944.641602, position_z = 109.437996, orientation = 3.43, MovementType = 2, spawndist = 0 WHERE guid = 128889;
DELETE FROM creature_movement WHERE id = 128889;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128889,1,2535.325195,-5944.641602,109.438,2000,2882201,0,0,0,0,0,0,0,0,3.43,0,0),(128889,2,2524.54,-5946.4,109.71,0,0,0,0,0,0,0,0,0,0,2.77,0,0),(128889,3,2514.45,-5939.26,111.185,0,0,0,0,0,0,0,0,0,0,2.47,0,0),
(128889,4,2505.28,-5932.11,115.146,0,0,0,0,0,0,0,0,0,0,3.02253,0,0),(128889,5,2487.64,-5937.46,116.247,0,0,0,0,0,0,0,0,0,0,3.55975,0,0),(128889,6,2476.57,-5939.55,114.837,0,0,0,0,0,0,0,0,0,0,2.58585,0,0),
(128889,7,2470.52,-5935.27,115.852,0,0,0,0,0,0,0,0,0,0,1.92881,0,0),(128889,8,2469.85,-5932.18,115.978,0,0,0,0,0,0,0,0,0,0,1.88931,0,0),(128889,9,2465.38,-5916.21,113.31,0,0,0,0,0,0,0,0,0,0,2.5514,0,0),
(128889,10,2453.98,-5909.97,112.809,0,0,0,0,0,0,0,0,0,0,3.11693,0,0),(128889,11,2437,-5915.94,112.788,0,0,0,0,0,0,0,0,0,0,3.14599,0,0),(128889,12,2428.36,-5912.56,112.956,0,0,0,0,0,0,0,0,0,0,3.47665,0,0),
(128889,13,2419.72,-5916.33,111.72,0,0,0,0,0,0,0,0,0,0,3.57089,0,0),(128889,14,2407.87,-5920.25,110.704,0,0,0,0,0,0,0,0,0,0,3.09023,0,0),(128889,15,2382.72,-5912.66,109.618,0,0,0,0,0,0,0,0,0,0,2.8012,0,0),
(128889,16,2360.63,-5906.09,105.863,0,0,0,0,0,0,0,0,0,0,2.87974,0,0),(128889,17,2339.74,-5900.61,102.166,0,0,0,0,0,0,0,0,0,0,3.0164,0,0),(128889,18,2320.65,-5901.12,96.3481,0,0,0,0,0,0,0,0,0,0,3.36748,0,0),
(128889,19,2302.29,-5906.91,88.4851,0,0,0,0,0,0,0,0,0,0,3.71462,0,0),(128889,20,2298.87,-5912.52,85.7672,0,0,0,0,0,0,0,0,0,0,4.15602,0,0),(128889,21,2294.47,-5920.02,80.6317,0,0,0,0,0,0,0,0,0,0,4.48588,0,0),
(128889,22,2295.5,-5927.8,75.0694,0,0,0,0,0,0,0,0,0,0,4.50787,0,0),(128889,23,2289.38,-5936.56,68.8048,0,0,0,0,0,0,0,0,0,0,4.35394,0,0),(128889,24,2281.71,-5954.08,57.7201,0,0,0,0,0,0,0,0,0,0,4.07015,0,0),
(128889,25,2273.67,-5964.09,51.0012,0,0,0,0,0,0,0,0,0,0,3.82197,0,0),(128889,26,2263.62,-5972.28,44.9642,0,0,0,0,0,0,0,0,0,0,3.50074,0,0),(128889,27,2250.32,-5978.05,37.1378,0,0,0,0,0,0,0,0,0,0,3.68923,0,0),
(128889,28,2242.16,-5986.44,32.0029,0,0,0,0,0,0,0,0,0,0,3.9759,0,0),(128889,29,2236.48,-5994.7,27.2984,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),(128889,30,2232.02,-6001.88,21.9415,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),
(128889,31,2222.59,-6018.69,9.85442,0,0,0,0,0,0,0,0,0,0,4.25079,0,0),(128889,32,2210.65,-6043.1,6.58405,0,0,0,0,0,0,0,0,0,0,4.27435,0,0),(128889,33,2195.04,-6068.81,4.8415,0,0,0,0,0,0,0,0,0,0,4.29006,0,0),
(128889,34,2184.79,-6100.61,0.801771,0,0,0,0,0,0,0,0,0,0,4.45499,0,0),(128889,35,2180.3,-6117.91,1.28701,0,0,0,0,0,0,0,0,0,0,4.35368,0,0),(128889,36,2176.49,-6139.76,1.21043,0,0,0,0,0,0,0,0,0,0,4.53432,0,0),
(128889,37,2168.43,-6148.86,1.24682,0,0,0,0,0,0,0,0,0,0,3.76777,0,0),(128889,38,2151.16,-6153.96,1.24645,0,0,0,0,0,0,0,0,0,0,3.43005,0,0),(128889,39,2134,-6167.23,0.364198,0,0,0,0,0,0,0,0,0,0,4.12905,0,0),
(128889,40,2122.69,-6185.79,14.1288,0,0,0,0,0,0,0,0,0,0,4.1801,0,0),(128889,41,2119.26,-6191.63,13.2701,2000,2882202,0,0,0,0,0,0,0,0,4.1801,0,0);
-- Scarlet Miner & Mine car #9
UPDATE creature SET position_x = 2453.786133, position_y = -5953.487793, position_z = 95.258797, orientation = 4.55 WHERE guid = 128870;
UPDATE creature SET position_x = 2453.786133, position_y = -5953.487793, position_z = 95.258797, orientation = 4.55, MovementType = 2, spawndist = 0 WHERE guid = 128895;
DELETE FROM creature_movement WHERE id = 128895;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128895,1,2453.786133,-5953.487793,95.258797,2000,2882201,0,0,0,0,0,0,0,0,4.55,0,0),(128895,2,2452.72,-5967.06,94.948,0,0,0,0,0,0,0,0,0,0,3.58,0,0),(128895,3,2437.21,-5970.83,95.8699,0,0,0,0,0,0,0,0,0,0,2.94,0,0),
(128895,4,2423.33,-5964.13,96.3004,0,0,0,0,0,0,0,0,0,0,2.34035,0,0),(128895,5,2418.46,-5954.75,98.1128,0,0,0,0,0,0,0,0,0,0,1.57615,0,0),(128895,6,2421.02,-5945.06,96.5866,0,0,0,0,0,0,0,0,0,0,0.982392,0,0),
(128895,7,2424.15,-5940.43,95.9135,0,0,0,0,0,0,0,0,0,0,0.759339,0,0),(128895,8,2438.46,-5930.17,96.4525,0,0,0,0,0,0,0,0,0,0,0.831971,0,0),(128895,9,2443.21,-5922.16,99.5292,0,0,0,0,0,0,0,0,0,0,1.45604,0,0),
(128895,10,2442.92,-5913.71,102.054,0,0,0,0,0,0,0,0,0,0,1.88668,0,0),(128895,11,2440.51,-5904.33,103.104,0,0,0,0,0,0,0,0,0,0,1.76965,0,0),(128895,12,2435.25,-5889.95,104.966,0,0,0,0,0,0,0,0,0,0,2.12387,0,0),
(128895,13,2431.46,-5885.3,104.595,0,0,0,0,0,0,0,0,0,0,2.69687,0,0),(128895,14,2424.06,-5886.49,104.586,0,0,0,0,0,0,0,0,0,0,3.56276,0,0),(128895,15,2416.01,-5891.31,104.585,2000,2882202,0,0,0,0,0,0,0,0,3.657,0,0);
-- Scarlet Miner & Mine car #10
UPDATE creature SET position_x = 2538.022949, position_y = -5995.528809, position_z = 103.005615, orientation = 2.9 WHERE guid = 128876;
UPDATE creature SET position_x = 2538.022949, position_y = -5995.528809, position_z = 103.005615, orientation = 2.9, MovementType = 2, spawndist = 0 WHERE guid = 128901;
DELETE FROM creature_movement WHERE id = 128901;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(128901,1,2538.022949,-5995.528809,103.005615,2000,2882201,0,0,0,0,0,0,0,0,2.9,0,0),(128901,2,2531.93,-5989.03,102.994,0,0,0,0,0,0,0,0,0,0,2.24,0,0),(128901,3,2523.14,-5974.86,104.929,0,0,0,0,0,0,0,0,0,0,1.94,0,0),
(128901,4,2520.59,-5965.89,105.946,0,0,0,0,0,0,0,0,0,0,1.59666,0,0),(128901,5,2521.93,-5958.41,107.339,0,0,0,0,0,0,0,0,0,0,1.40423,0,0),(128901,6,2522.63,-5951.68,109.591,0,0,0,0,0,0,0,0,0,0,1.71447,0,0),
(128901,7,2518.94,-5943.86,110.237,0,0,0,0,0,0,0,0,0,0,2.42133,0,0),(128901,8,2509.7,-5935.12,113.338,0,0,0,0,0,0,0,0,0,0,2.58704,0,0),(128901,9,2504.82,-5932.35,115.145,0,0,0,0,0,0,0,0,0,0,2.85644,0,0),
(128901,10,2494.22,-5933.43,115.605,0,0,0,0,0,0,0,0,0,0,3.53504,0,0),(128901,11,2488.27,-5937.53,116.217,0,0,0,0,0,0,0,0,0,0,3.72668,0,0),(128901,12,2481.15,-5940.7,115.362,0,0,0,0,0,0,0,0,0,0,2.90044,0,0),
(128901,13,2473.54,-5938.41,115.133,0,0,0,0,0,0,0,0,0,0,2.57702,0,0),(128901,14,2469.97,-5932.41,115.97,0,0,0,0,0,0,0,0,0,0,1.90066,0,0),(128901,15,2469.85,-5932.18,115.978,0,0,0,0,0,0,0,0,0,0,1.88931,0,0),
(128901,16,2465.38,-5916.21,113.31,0,0,0,0,0,0,0,0,0,0,2.5514,0,0),(128901,17,2453.98,-5909.97,112.809,0,0,0,0,0,0,0,0,0,0,3.11693,0,0),(128901,18,2437,-5915.94,112.788,0,0,0,0,0,0,0,0,0,0,3.14599,0,0),
(128901,19,2428.36,-5912.56,112.956,0,0,0,0,0,0,0,0,0,0,3.47665,0,0),(128901,20,2419.72,-5916.33,111.72,0,0,0,0,0,0,0,0,0,0,3.57089,0,0),(128901,21,2407.87,-5920.25,110.704,0,0,0,0,0,0,0,0,0,0,3.09023,0,0),
(128901,22,2382.72,-5912.66,109.618,0,0,0,0,0,0,0,0,0,0,2.8012,0,0),(128901,23,2360.63,-5906.09,105.863,0,0,0,0,0,0,0,0,0,0,2.87974,0,0),(128901,24,2339.74,-5900.61,102.166,0,0,0,0,0,0,0,0,0,0,3.0164,0,0),
(128901,25,2320.65,-5901.12,96.3481,0,0,0,0,0,0,0,0,0,0,3.36748,0,0),(128901,26,2302.29,-5906.91,88.4851,0,0,0,0,0,0,0,0,0,0,3.71462,0,0),(128901,27,2298.87,-5912.52,85.7672,0,0,0,0,0,0,0,0,0,0,4.15602,0,0),
(128901,28,2294.47,-5920.02,80.6317,0,0,0,0,0,0,0,0,0,0,4.48588,0,0),(128901,29,2295.5,-5927.8,75.0694,0,0,0,0,0,0,0,0,0,0,4.50787,0,0),(128901,30,2289.38,-5936.56,68.8048,0,0,0,0,0,0,0,0,0,0,4.35394,0,0),
(128901,31,2281.71,-5954.08,57.7201,0,0,0,0,0,0,0,0,0,0,4.07015,0,0),(128901,32,2273.67,-5964.09,51.0012,0,0,0,0,0,0,0,0,0,0,3.82197,0,0),(128901,33,2263.62,-5972.28,44.9642,0,0,0,0,0,0,0,0,0,0,3.50074,0,0),
(128901,34,2250.32,-5978.05,37.1378,0,0,0,0,0,0,0,0,0,0,3.68923,0,0),(128901,35,2242.16,-5986.44,32.0029,0,0,0,0,0,0,0,0,0,0,3.9759,0,0),(128901,36,2236.48,-5994.7,27.2984,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),
(128901,37,2232.02,-6001.88,21.9415,0,0,0,0,0,0,0,0,0,0,4.15654,0,0),(128901,38,2222.59,-6018.69,9.85442,0,0,0,0,0,0,0,0,0,0,4.25079,0,0),(128901,39,2210.65,-6043.1,6.58405,0,0,0,0,0,0,0,0,0,0,4.27435,0,0),
(128901,40,2195.04,-6068.81,4.8415,0,0,0,0,0,0,0,0,0,0,4.29006,0,0),(128901,41,2184.79,-6100.61,0.801771,0,0,0,0,0,0,0,0,0,0,4.45499,0,0),(128901,42,2180.3,-6117.91,1.28701,0,0,0,0,0,0,0,0,0,0,4.35368,0,0),
(128901,43,2176.49,-6139.76,1.21043,0,0,0,0,0,0,0,0,0,0,4.53432,0,0),(128901,44,2168.43,-6148.86,1.24682,0,0,0,0,0,0,0,0,0,0,3.76777,0,0),(128901,45,2151.16,-6153.96,1.24645,0,0,0,0,0,0,0,0,0,0,3.43005,0,0),
(128901,46,2134,-6167.23,0.364198,0,0,0,0,0,0,0,0,0,0,4.12905,0,0),(128901,47,2122.69,-6185.79,14.1288,0,0,0,0,0,0,0,0,0,0,4.1801,0,0),(128901,48,2119.26,-6191.63,13.2701,2000,2882202,0,0,0,0,0,0,0,0,4.1801,0,0);
-- movement scripts
DELETE FROM dbscripts_on_creature_movement WHERE id IN (2882201,2882202);
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2882201,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(2882202,1,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive'),
(2882202,2,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn'); 
-- Mine Car
DELETE FROM creature_linking WHERE guid IN (128860,128864,128868,128869,128870,128873,128874,128876,128879,128880);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(128860, 128885, 16+128+512+8192),(128864, 128889, 16+128+512+8192),(128868, 128893, 16+128+512+8192),(128869, 128894, 16+128+512+8192),(128870, 128895, 16+128+512+8192),
(128873, 128898, 16+128+512+8192),(128874, 128899, 16+128+512+8192),(128876, 128901, 16+128+512+8192),(128879, 128904, 16+128+512+8192),(128880, 128905, 16+128+512+8192);
-- ---------------------------
-- DK Starting Zone - phase 1 - part4. - Initiates
-- ---------------------------

-- Duplicates removed
DELETE FROM creature WHERE guid IN (129516,129533,129553,129555,129522,129548,129532,129520,129530,129556,129545,129521,129531,129519);
DELETE FROM creature_addon WHERE guid IN (129516,129533,129553,129555,129522,129548,129532,129520,129530,129556,129545,129521,129531,129519);
DELETE FROM creature_movement WHERE id IN (129516,129533,129553,129555,129522,129548,129532,129520,129530,129556,129545,129521,129531,129519);
DELETE FROM game_event_creature WHERE guid IN (129516,129533,129553,129555,129522,129548,129532,129520,129530,129556,129545,129521,129531,129519);
DELETE FROM game_event_creature_data WHERE guid IN (129516,129533,129553,129555,129522,129548,129532,129520,129530,129556,129545,129521,129531,129519);
DELETE FROM creature_battleground WHERE guid IN (129516,129533,129553,129555,129522,129548,129532,129520,129530,129556,129545,129521,129531,129519);
DELETE FROM creature_linking WHERE guid IN (129516,129533,129553,129555,129522,129548,129532,129520,129530,129556,129545,129521,129531,129519) 
OR master_guid IN (129516,129533,129553,129555,129522,129548,129532,129520,129530,129556,129545,129521,129531,129519);

-- Death Knight Initiate 
UPDATE creature SET spawntimesecs = 30 WHERE id = 28406;
UPDATE creature_addon SET auras = NULL WHERE guid IN (129492,129493,129494,129495,129496,129497,129498,129499);
UPDATE creature_addon SET mount = 0 WHERE guid IN (129519,129521,129522,129533,129547,129548,129550,129553); -- mount is part of wps.
-- # chating pairs
UPDATE creature SET MovementType = 2, spawndist = 0  WHERE guid IN (129492,129493,129494,129495,129496,129497,129498,129499);
DELETE FROM creature_movement WHERE id IN (129492,129493,129494,129495,129496,129497,129498,129499);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129492,1,2435.57,-5752.25,153.682,12000,2840604,0,0,0,0,0,0,0,0,6.03884,0,0),
(129493,1,2439.02,-5753.13,153.679,17000,2840604,0,0,0,0,0,0,0,0,2.79253,0,0),
(129494,1,2381.65,-5662.37,154.17,17000,2840604,0,0,0,0,0,0,0,0,1.44862,0,0),
(129495,1,2382,-5659.11,154.332,12000,2840604,0,0,0,0,0,0,0,0,4.59022,0,0),
(129496,1,2334.03,-5696.31,154.005,17000,2840604,0,0,0,0,0,0,0,0,5.32325,0,0),
(129497,1,2336.52,-5699.58,154.005,12000,2840604,0,0,0,0,0,0,0,0,2.26893,0,0),
(129498,1,2349.02,-5682.49,154.004,17000,2840604,0,0,0,0,0,0,0,0,2.18166,0,0),
(129499,1,2347.2,-5680.35,154.003,12000,2840604,0,0,0,0,0,0,0,0,5.37561,0,0);
-- #1
UPDATE creature SET position_x = 2409.489, position_y = -5729.18, position_z = 153.92, orientation = 3.8, spawndist = 0, MovementType = 2 WHERE guid = 129547;
DELETE FROM creature_movement WHERE id = 129547;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129547,1,2409.489,-5729.18,153.92,2000,2840601,0,0,0,0,0,0,0,0,3.8,0,0),
(129547,2,2398.24,-5738.1,153.923,0,0,0,0,0,0,0,0,0,0,3.51732,0,0),
(129547,3,2386.8,-5734.52,153.922,0,0,0,0,0,0,0,0,0,0,2.57013,0,0),
(129547,4,2372.86,-5722.17,153.922,0,0,0,0,0,0,0,0,0,0,2.26872,0,0),
(129547,5,2366.02,-5712.39,153.922,0,0,0,0,0,0,0,0,0,0,1.78963,0,0),
(129547,6,2365.51,-5706.24,153.922,0,0,0,0,0,0,0,0,0,0,0.855789,0,0),
(129547,7,2368.78,-5703.15,153.922,10000,2840608,0,0,0,0,0,0,0,0,0.690856,0,0),
(129547,8,2358.21,-5706.16,153.922,0,0,0,0,0,0,0,0,0,0,2.85855,0,0),
(129547,9,2341.04,-5689.82,153.922,0,0,0,0,0,0,0,0,0,0,2.3292,0,0),
(129547,10,2313.73,-5661.47,152.761,0,0,0,0,0,0,0,0,0,0,2.56639,0,0),
(129547,11,2296.29,-5652.93,147.341,0,0,0,0,0,0,0,0,0,0,2.88369,0,0),
(129547,12,2278.16,-5647.89,143.137,0,0,0,0,0,0,0,0,0,0,2.9638,0,0),
(129547,13,2255.96,-5645.48,136.996,0,0,0,0,0,0,0,0,0,0,3.24733,0,0),
(129547,14,2234.36,-5647.77,130.968,0,0,0,0,0,0,0,0,0,0,3.42954,0,0),
(129547,15,2209.59,-5657.5,122.594,0,0,0,0,0,0,0,0,0,0,3.76412,0,0),
(129547,16,2188.9,-5675.6,113.179,0,0,0,0,0,0,0,0,0,0,3.89371,0,0),
(129547,17,2163.24,-5699.88,104.99,1000,2840606,0,0,0,0,0,0,0,0,3.94476,0,0),
(129547,18,2149.23,-5715.65,101.528,1000,2840605,0,0,0,0,0,0,0,0,3.99581,0,0);
-- #2
UPDATE creature SET position_x = 2455.27, position_y = -5523.46, position_z = 376.892, orientation = 5.96, spawndist = 0, MovementType = 2 WHERE guid = 129544;
DELETE FROM creature_movement WHERE id = 129544;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129544,1,2455.27,-5523.46,376.892,1000,2840601,0,0,0,0,0,0,0,0,5.96,0,0),
(129544,2,2451.31,-5528.92,376.891,0,0,0,0,0,0,0,0,0,0,3.66393,0,0),
(129544,3,2424.47,-5542.18,376.905,0,0,0,0,0,0,0,0,0,0,3.84064,0,0),
(129544,4,2403.66,-5563.52,377.005,0,0,0,0,0,0,0,0,0,0,4.24905,0,0),
(129544,5,2398.1,-5601.44,376.89,0,0,0,0,0,0,0,0,0,0,4.6064,0,0),
(129544,6,2397.91,-5614.95,377.018,0,0,0,0,0,0,0,0,0,0,4.26946,0,0),
(129544,7,2386.16,-5630.91,377.169,0,0,0,0,0,0,0,0,0,0,4.1116,0,0),
(129544,8,2379.33,-5642.43,382.439,0,0,0,0,0,0,0,0,0,0,4.2137,0,0),
(129544,9,2349.92,-5690.11,382.241,6000,2840602,0,0,0,0,0,0,0,0,4.12338,0,0),
(129544,10,2317.382,-5691.645,397.657,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129544,11,2326.912,-5757.448,349.2681,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129544,12,2393.624,-5793.929,280.0182,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129544,13,2412.465,-5744.004,213.0183,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129544,14,2370.03,-5724.759,190.7128,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129544,15,2376.46,-5775.706,188.7405,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129544,16,2394.322,-5787.392,177.6294,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129544,17,2410.993,-5733.013,154.435,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129544,18,2410.993,-5733.013,154.435,5000,2840603,0,0,0,0,0,0,0,0,0,0,0),
(129544,19,2402.19,-5740.02,153.922,0,0,0,0,0,0,0,0,0,0,3.63958,0,0),
(129544,20,2390.62,-5740.36,153.922,0,0,0,0,0,0,0,0,0,0,2.32332,0,0),
(129544,21,2363.53,-5711.92,153.922,0,0,0,0,0,0,0,0,0,0,1.18687,0,0),
(129544,22,2369.16,-5703.01,153.922,8000,2840608,0,0,0,0,0,0,0,0,0.73003,0,0),
(129544,23,2364.91,-5710.41,153.922,0,0,0,0,0,0,0,0,0,0,5.01359,0,0),
(129544,24,2390.29,-5740.17,153.922,0,0,0,0,0,0,0,0,0,0,5.48168,0,0),
(129544,25,2413.33,-5765.72,151.84,0,0,0,0,0,0,0,0,0,0,5.38744,0,0),
(129544,26,2427.09,-5783.53,143.045,0,0,0,0,0,0,0,0,0,0,5.14161,0,0),
(129544,27,2432.63,-5793.86,136.441,0,0,0,0,0,0,0,0,0,0,4.95861,0,0),
(129544,28,2436.14,-5814.65,123.068,0,0,0,0,0,0,0,0,0,0,4.85651,0,0),
(129544,29,2436.72,-5839.05,113.55,0,0,0,0,0,0,0,0,0,0,4.51643,0,0),
(129544,30,2427.56,-5854.77,107.495,1000,2840606,0,0,0,0,0,0,0,0,3.93917,0,0),
(129544,31,2360.64,-5893.59,105.393,1000,2840605,0,0,0,0,0,0,0,0,3.76639,0,0);
-- #3
UPDATE creature SET position_x = 2416.227, position_y = -5557.54, position_z = 376.89, orientation = 1.72, MovementType = 2, spawndist = 0 WHERE guid = 129518;
DELETE FROM creature_movement WHERE id = 129518;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129518,1,2416.227,-5557.54,376.89,1000,2840601,0,0,0,0,0,0,0,0,1.72,0,0),
(129518,2,2411.56,-5553.34,376.887,0,0,0,0,0,0,0,0,0,0,4.06137,0,0),
(129518,3,2396.85,-5576.58,376.906,0,0,0,0,0,0,0,0,0,0,4.57353,0,0),
(129518,4,2397.55,-5612.24,377.017,0,0,0,0,0,0,0,0,0,0,4.15728,0,0),
(129518,5,2377.61,-5641.62,382.439,0,0,0,0,0,0,0,0,0,0,3.72139,0,0),
(129518,6,2350.25,-5690.08,382.24,3000,2840602,0,0,0,0,0,0,0,0,3.64364,0,0),
(129518,7,2317.382,-5691.645,397.657,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129518,8,2326.912,-5757.448,349.2681,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129518,9,2393.624,-5793.929,280.0182,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129518,10,2412.465,-5744.004,213.0183,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129518,11,2370.03,-5724.759,190.7128,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129518,12,2376.46,-5775.706,188.7405,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129518,13,2394.322,-5787.392,177.6294,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129518,14,2410.993,-5733.013,154.435,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129518,15,2410.993,-5733.013,154.435,3000,2840603,0,0,0,0,0,0,0,0,0,0,0),
(129518,16,2351.89,-5758.46,153.923,5000,2840607,0,0,0,0,0,0,0,0,3.00429,0,0),
(129518,17,2369.3,-5754.95,153.958,0,0,0,0,0,0,0,0,0,0,6.25179,0,0),
(129518,18,2399.45,-5760.04,153.803,0,0,0,0,0,0,0,0,0,0,5.99261,0,0),
(129518,19,2415.18,-5767.65,151.114,0,0,0,0,0,0,0,0,0,0,5.47347,0,0),
(129518,20,2427.29,-5779.51,144.843,0,0,0,0,0,0,0,0,0,0,5.18994,0,0),
(129518,21,2433.29,-5797.08,134.236,0,0,0,0,0,0,0,0,0,0,5.00694,0,0),
(129518,22,2438.33,-5826.66,118.493,0,0,0,0,0,0,0,0,0,0,4.87735,0,0),
(129518,23,2436.51,-5841.68,112.666,0,0,0,0,0,0,0,0,0,0,4.17364,0,0),
(129518,24,2421.56,-5855.26,106.534,1000,2840606,0,0,0,0,0,0,0,0,3.76916,0,0), 
(129518,25,2379.9,-5856.38,105.407,1000,2840605,0,0,0,0,0,0,0,0,3.09764,0,0);
-- #4
UPDATE creature SET position_x = 2523.21, position_y = -5628.21, position_z = 377.004, orientation = 1.93, MovementType = 2, spawndist = 0 WHERE guid = 129529;
DELETE FROM creature_movement WHERE id = 129529;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129529,1,2523.21,-5628.21,377.004,1000,2840601,0,0,0,0,0,0,0,0,1.93,0,0),
(129529,2,2517.63,-5625.44,377.01,0,0,0,0,0,0,0,0,0,0,3.57347,0,0),
(129529,3,2480.55,-5653.1,376.997,0,0,0,0,0,0,0,0,0,0,3.48315,0,0),
(129529,4,2454.17,-5656.89,376.903,0,0,0,0,0,0,0,0,0,0,3.08653,0,0),
(129529,5,2426.21,-5647.1,377.148,0,0,0,0,0,0,0,0,0,0,2.74566,0,0),
(129529,6,2397.13,-5648.46,377.169,0,0,0,0,0,0,0,0,0,0,3.41325,0,0),
(129529,7,2385.79,-5652.5,382.439,0,0,0,0,0,0,0,0,0,0,3.6638,0,0),
(129529,8,2370,-5666.09,382.256,0,0,0,0,0,0,0,0,0,0,3.98424,0,0),
(129529,9,2354.86,-5693.19,382.239,5000,2840602,0,0,0,0,0,0,0,0,4.18451,0,0),
(129529,10,2317.382,-5691.645,397.657,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129529,11,2326.912,-5757.448,349.2681,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129529,12,2393.624,-5793.929,280.0182,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129529,13,2412.465,-5744.004,213.0183,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129529,14,2370.03,-5724.759,190.7128,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129529,15,2376.46,-5775.706,188.7405,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129529,16,2394.322,-5787.392,177.6294,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129529,17,2410.993,-5733.013,154.435,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129529,18,2410.993,-5733.013,154.435,5000,2840603,0,0,0,0,0,0,0,0,0,0,0),
(129529,19,2393.83,-5740.92,153.922,0,0,0,0,0,0,0,0,0,0,2.86783,0,0),
(129529,20,2380.11,-5732.51,153.922,0,0,0,0,0,0,0,0,0,0,2.22624,0,0),
(129529,21,2361.82,-5712.56,153.922,0,0,0,0,0,0,0,0,0,0,1.4432,0,0),
(129529,22,2363.47,-5704.23,153.922,0,0,0,0,0,0,0,0,0,0,0.664594,0,0),
(129529,23,2368.24,-5701.66,153.922,10000,2840608,0,0,0,0,0,0,0,0,0.389705,0,0),
(129529,24,2351.06,-5698.6,153.922,0,0,0,0,0,0,0,0,0,0,2.73804,0,0),
(129529,25,2310.19,-5658.97,151.566,0,0,0,0,0,0,0,0,0,0,2.52991,0,0),
(129529,26,2276.49,-5646.12,142.798,0,0,0,0,0,0,0,0,0,0,3.15711,0,0),
(129529,27,2237.28,-5644.73,132.36,0,0,0,0,0,0,0,0,0,0,3.44299,0,0),
(129529,28,2207.46,-5656.88,122.1,0,0,0,0,0,0,0,0,0,0,3.71395,0,0),
(129529,29,2184.74,-5675.28,112.96,0,0,0,0,0,0,0,0,0,0,3.84747,0,0),
(129529,30,2155.17,-5710.15,102.564,1000,2840606,0,0,0,0,0,0,0,0,4.03597,0,0),
(129529,31,2124.03,-5722.98,100.333,1000,2840605,0,0,0,0,0,0,0,0,3.30162,0,0);
-- #5
UPDATE creature SET position_x = 2477.05, position_y = -5647.81, position_z = 377.006, orientation = 5.92, MovementType = 2, spawndist = 0 WHERE guid = 129517;
DELETE FROM creature_movement WHERE id = 129517;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129517,1,2477.05,-5647.81,377.006,1000,2840601,0,0,0,0,0,0,0,0,5.92,0,0),
(129517,2,2478.18,-5653.36,377.01,0,0,0,0,0,0,0,0,0,0,3.68083,0,0),
(129517,3,2465.83,-5657.38,376.892,0,0,0,0,0,0,0,0,0,0,3.28028,0,0),
(129517,4,2420.22,-5645.76,376.89,0,0,0,0,0,0,0,0,0,0,3.26536,0,0),
(129517,5,2397.62,-5648.51,377.168,0,0,0,0,0,0,0,0,0,0,3.48684,0,0),
(129517,6,2386.39,-5653.11,382.439,0,0,0,0,0,0,0,0,0,0,3.7311,0,0),
(129517,7,2369.21,-5667.63,382.253,0,0,0,0,0,0,0,0,0,0,4.09474,0,0),
(129517,8,2353.39,-5690.9,382.239,3000,2840602,0,0,0,0,0,0,0,0,3.8222,0,0),
(129517,9,2317.382,-5691.645,397.657,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129517,10,2326.912,-5757.448,349.2681,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129517,11,2393.624,-5793.929,280.0182,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129517,12,2412.465,-5744.004,213.0183,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129517,13,2370.03,-5724.759,190.7128,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129517,14,2376.46,-5775.706,188.7405,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129517,15,2394.322,-5787.392,177.6294,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129517,16,2410.993,-5733.013,154.435,0,0,0,0,0,0,0,0,0,0,0,0,0),
(129517,17,2410.993,-5733.013,154.435,3000,2840603,0,0,0,0,0,0,0,0,0,0,0),
(129517,18,2377.25,-5753.65,153.969,0,0,0,0,0,0,0,0,0,0,3.31797,0,0),
(129517,19,2357.61,-5753.15,153.923,0,0,0,0,0,0,0,0,0,0,3.68172,0,0),
(129517,20,2351.36,-5756.78,153.923,5000,2840607,0,0,0,0,0,0,0,0,3.6346,0,0),
(129517,21,2324.66,-5729.4,153.92,0,0,0,0,0,0,0,0,0,0,2.36617,0,0),
(129517,22,2308.68,-5710.34,153.92,0,0,0,0,0,0,0,0,0,0,2.1007,0,0),
(129517,23,2299.49,-5683.95,153.793,0,0,0,0,0,0,0,0,0,0,1.86901,0,0),
(129517,24,2291.7,-5665.8,149.238,0,0,0,0,0,0,0,0,0,0,2.22637,0,0),
(129517,25,2274.66,-5653.11,142.253,0,0,0,0,0,0,0,0,0,0,2.75808,0,0),
(129517,26,2249.38,-5649.94,134.367,0,0,0,0,0,0,0,0,0,0,3.15863,0,0),
(129517,27,2231.71,-5653.3,129.165,0,0,0,0,0,0,0,0,0,0,3.43352,0,0),
(129517,28,2210.59,-5663.28,121.25,0,0,0,0,0,0,0,0,0,0,3.65736,0,0),
(129517,29,2191.05,-5678.36,112.588,0,0,0,0,0,0,0,0,0,0,3.7304,0,0),
(129517,30,2165.07,-5699.03,105.325,1000,2840606,0,0,0,0,0,0,0,0,3.90476,0,0),
(129517,31,2135.4,-5728.12,100.266,1000,2840605,0,0,0,0,0,0,0,0,3.91262,0,0);
-- #6
UPDATE creature SET position_x = 2413.64, position_y = -5737.27, position_z = 153.923, orientation = 3.86902, MovementType = 2, spawndist = 0 WHERE guid = 129546;
DELETE FROM creature_movement WHERE id = 129546;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129546,1,2413.64,-5737.27,153.923,1000,2840601,0,0,0,0,0,0,0,0,3.86902,0,0),
(129546,2,2373.33,-5754.69,153.961,0,0,0,0,0,0,0,0,0,0,3.34356,0,0),
(129546,3,2349.31,-5761.49,153.922,5000,2840607,0,0,0,0,0,0,0,0,1.76884,0,0),
(129546,4,2367,-5771.87,151.392,0,0,0,0,0,0,0,0,0,0,6.06104,0,0),
(129546,5,2380.8,-5774.62,154.028,0,0,0,0,0,0,0,0,0,0,6.11209,0,0),
(129546,6,2416.41,-5776.45,148.509,0,0,0,0,0,0,0,0,0,0,6.01155,0,0),
(129546,7,2430.24,-5787.44,140.563,0,0,0,0,0,0,0,0,0,0,5.40444,0,0),
(129546,8,2437.59,-5808,127.202,0,0,0,0,0,0,0,0,0,0,4.96462,0,0),
(129546,9,2441.6,-5832.16,117.571,0,0,0,0,0,0,0,0,0,0,4.86645,0,0),
(129546,10,2430.39,-5856.4,107.743,1000,2840606,0,0,0,0,0,0,0,0,4.06142,0,0),
(129546,11,2442.87,-5912.91,102.116,1000,2840605,0,0,0,0,0,0,0,0,4.90965,0,0);
-- #7
UPDATE creature SET position_x = 2352.14, position_y = -5757.91, position_z = 153.923, MovementType = 2, spawndist = 0 WHERE guid = 129550;
DELETE FROM creature_movement WHERE id = 129550;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129550,1,2352.14,-5757.91,153.923,1000,2840601,0,0,0,0,0,0,0,0,3.23752,0,0),
(129550,8,2352.14,-5757.91,153.923,4000,2840607,0,0,0,0,0,0,0,0,3.23752,0,0),
(129550,9,2341.61,-5727.9,153.922,0,0,0,0,0,0,0,0,0,0,1.55677,0,0),
(129550,10,2342.13,-5697.18,153.922,0,0,0,0,0,0,0,0,0,0,1.84658,0,0),
(129550,11,2317.47,-5651.82,151.422,0,0,0,0,0,0,0,0,0,0,2.33588,0,0),
(129550,12,2297.54,-5644.36,147.052,0,0,0,0,0,0,0,0,0,0,2.94867,0,0),
(129550,13,2245.47,-5638.62,135.882,0,0,0,0,0,0,0,0,0,0,3.22356,0,0),
(129550,14,2205.02,-5658.24,121.031,0,0,0,0,0,0,0,0,0,0,3.8778,0,0),
(129550,15,2161.18,-5703.33,104.27,1000,2840606,0,0,0,0,0,0,0,0,4.13698,0,0),
(129550,16,2178.08,-5770.89,101.346,1000,2840605,0,0,0,0,0,0,0,0,5.00484,0,0);
-- #8
UPDATE creature SET position_x = 2368.652588, position_y = -5703.335449, position_z = 153.922272, orientation = 0.69, MovementType = 2, spawndist = 0 WHERE guid = 129558;
DELETE FROM creature_movement WHERE id = 129558;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(129558,1,2368.652588,-5703.335449,153.922272,1000,2840601,0,0,0,0,0,0,0,0,0.69,0,0),
(129558,2,2373.52,-5722.48,153.922,0,0,0,0,0,0,0,0,0,0,5.28585,0,0),
(129558,3,2411.22,-5764.47,152.347,0,0,0,0,0,0,0,0,0,0,5.47748,0,0),
(129558,4,2429.98,-5784.48,142.151,0,0,0,0,0,0,0,0,0,0,5.22694,0,0),
(129558,5,2435.23,-5800.88,131.736,0,0,0,0,0,0,0,0,0,0,4.99918,0,0),
(129558,6,2431.43,-5850.32,109.292,1000,2840606,0,0,0,0,0,0,0,0,4.36615,0,0),
(129558,7,2417.03,-5895.6,104.705,1000,2840605,0,0,0,0,0,0,0,0,4.31903,0,0);

-- Death Knight Initiate 
DELETE FROM dbscripts_on_creature_movement WHERE id  BETWEEN 2840601 AND 2840608;
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2840601,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2840601,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(2840602,1,24,26308,0,0,0,0x08,0,0,0,0,0,0,0,0,'mount'),
(2840603,3,24,0,0,0,0,0x08,0,0,0,0,0,0,0,0,'unmount'),
(2840604,4,1,1,0,0,0,0,273,6,274,0,0,0,0,0,'random emote'),
(2840605,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive'),
(2840605,1,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn'),
(2840606,0,31,28609,25,0,0,0,-1000,0,0,0,0,0,0,0,''),
(2840606,1,26,0,0,28609,25,1,0,0,0,0,0,0,0,0,''),
(2840607,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2840608,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2840608,5,31,28377,70,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(2840608,6,0,0,0,28377,15,7,2000000409,0,0,0,0,0,0,0,'force buddy to: say text');

-- texts
DELETE FROM db_script_string WHERE entry = 2000000409;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000409,'Suffer well, death knight...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,25,NULL);



-- q.12680 'Grand Theft Palomino'
-- core req. - faction should be set by vehicle boarding (players faction) 
-- core req. - horse should despawn if unboard
DELETE FROM dbscripts_on_spell WHERE id = 52264; 
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(52264,0,22,2084,0x01,28653,20,5,0,0,0,0,0,0,0,0,'temp faction'), -- temp. faction should be set with vehicle boarding
(52264,1,15,52266,0,0,0,0,0,0,0,0,0,0,0,0,''),
(52264,1,14,52263,0,0,0,0,0,0,0,0,0,0,0,0,''),
(52264,3,37,0,0,28654,20,0,0,0,0,0,0,0,0,0,''),
(52264,5,15,52267,0,28654,20,3,0,0,0,0,0,0,0,0,''),
(52264,7,0,0,0,28654,20,3,2000000410,0,0,0,0,0,0,0,'');
DELETE FROM dbscripts_on_spell WHERE id = 52267;
INSERT INTO dbscripts_on_spell (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(52267,3,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry = 2000000410;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES
(2000000410,'The realm of shadows awaits...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);
-- ---------------------------
-- DK Starting Zone - phase 2
-- ---------------------------

-- All targets for eye of acherus -- aura update 
UPDATE creature_template_addon SET auras = 51939 WHERE entry IN (28542,28543,28544,28525);
-- Spawns that req. phaseMask
UPDATE creature SET phaseMask = 2 WHERE guid IN (129477,129479,128801,129489,128799,129483,128800,129484,128797,128802,129490,129478,129491,129486,129488,129475,129474,129476,129487,129485,128798);  -- Citizen of Havenshire and Citizen of New Avalon
UPDATE creature SET phaseMask = 2 WHERE guid = 128752; -- High General Abbendis
UPDATE creature SET phaseMask = 2 WHERE guid = 128796; -- High Abbot Landgren
-- spawns with wrong phase
DELETE FROM creature WHERE guid IN (128696,128695,128694,128693,128735,128691,128690,128689,128692,128688,128687,128737,128656,128661,128655,128660,128654,128659,128653,128658,128652,128657);
DELETE FROM creature_addon WHERE guid IN (128696,128695,128694,128693,128735,128691,128690,128689,128692,128688,128687,128737,128656,128661,128655,128660,128654,128659,128653,128658,128652,128657);
DELETE FROM creature_movement WHERE id IN (128696,128695,128694,128693,128735,128691,128690,128689,128692,128688,128687,128737,128656,128661,128655,128660,128654,128659,128653,128658,128652,128657);
DELETE FROM game_event_creature WHERE guid IN (128696,128695,128694,128693,128735,128691,128690,128689,128692,128688,128687,128737,128656,128661,128655,128660,128654,128659,128653,128658,128652,128657);
DELETE FROM game_event_creature_data WHERE guid IN (128696,128695,128694,128693,128735,128691,128690,128689,128692,128688,128687,128737,128656,128661,128655,128660,128654,128659,128653,128658,128652,128657);
DELETE FROM creature_battleground WHERE guid IN (128696,128695,128694,128693,128735,128691,128690,128689,128692,128688,128687,128737,128656,128661,128655,128660,128654,128659,128653,128658,128652,128657);
DELETE FROM creature_linking WHERE guid IN (128696,128695,128694,128693,128735,128691,128690,128689,128692,128688,128687,128737,128656,128661,128655,128660,128654,128659,128653,128658,128652,128657) 
OR master_guid IN (128696,128695,128694,128693,128735,128691,128690,128689,128692,128688,128687,128737,128656,128661,128655,128660,128654,128659,128653,128658,128652,128657);
-- reuse empty guids -- UDB ONLY
DELETE FROM creature WHERE guid IN (32073,32074,79456,79457,79458,79477,79478,79479,79480,79481,79484,79486,79506,79533,79535,79542,79549,79553,79561,79570,81088,81089,82999,83011,83012,83013,83014,83015,83037,
83044,83045,83047,83059,83060,83066,83067,83068,83089,83124,83126,83132,83133,83136,83138,83140,83142,83144,83145,83147,83158,83159,85532,85533,85534,85535,85536,85537,85538,85539,85540,85541,85542,85543,85544,
85574,85575,85576,85577,85578,86031,86053,86054,86055,86056,86057,86058,86059,86060,86063,86064,86085,87006,101332,101333,101334,101335,101336,101337,101338,101339,101340,101341,101342,101343,117312,117313,117314,
117315,117316,117317,117318,117319,117320,117321,117322,117323,120795,120906,125330,125692,129164,129435,129446,129452,129458,133918,133919,133920,134658,134670,136255,136472,136473,136558);
DELETE FROM creature_addon WHERE guid IN (32073,32074,79456,79457,79458,79477,79478,79479,79480,79481,79484,79486,79506,79533,79535,79542,79549,79553,79561,79570,81088,81089,82999,83011,83012,83013,83014,83015,83037,
83044,83045,83047,83059,83060,83066,83067,83068,83089,83124,83126,83132,83133,83136,83138,83140,83142,83144,83145,83147,83158,83159,85532,85533,85534,85535,85536,85537,85538,85539,85540,85541,85542,85543,85544,
85574,85575,85576,85577,85578,86031,86053,86054,86055,86056,86057,86058,86059,86060,86063,86064,86085,87006,101332,101333,101334,101335,101336,101337,101338,101339,101340,101341,101342,101343,117312,117313,117314,
117315,117316,117317,117318,117319,117320,117321,117322,117323,120795,120906,125330,125692,129164,129435,129446,129452,129458,133918,133919,133920,134658,134670,136255,136472,136473,136558);
DELETE FROM creature_movement WHERE id IN (32073,32074,79456,79457,79458,79477,79478,79479,79480,79481,79484,79486,79506,79533,79535,79542,79549,79553,79561,79570,81088,81089,82999,83011,83012,83013,83014,83015,83037,
83044,83045,83047,83059,83060,83066,83067,83068,83089,83124,83126,83132,83133,83136,83138,83140,83142,83144,83145,83147,83158,83159,85532,85533,85534,85535,85536,85537,85538,85539,85540,85541,85542,85543,85544,
85574,85575,85576,85577,85578,86031,86053,86054,86055,86056,86057,86058,86059,86060,86063,86064,86085,87006,101332,101333,101334,101335,101336,101337,101338,101339,101340,101341,101342,101343,117312,117313,117314,
117315,117316,117317,117318,117319,117320,117321,117322,117323,120795,120906,125330,125692,129164,129435,129446,129452,129458,133918,133919,133920,134658,134670,136255,136472,136473,136558);
DELETE FROM game_event_creature WHERE guid IN (32073,32074,79456,79457,79458,79477,79478,79479,79480,79481,79484,79486,79506,79533,79535,79542,79549,79553,79561,79570,81088,81089,82999,83011,83012,83013,83014,83015,83037,
83044,83045,83047,83059,83060,83066,83067,83068,83089,83124,83126,83132,83133,83136,83138,83140,83142,83144,83145,83147,83158,83159,85532,85533,85534,85535,85536,85537,85538,85539,85540,85541,85542,85543,85544,
85574,85575,85576,85577,85578,86031,86053,86054,86055,86056,86057,86058,86059,86060,86063,86064,86085,87006,101332,101333,101334,101335,101336,101337,101338,101339,101340,101341,101342,101343,117312,117313,117314,
117315,117316,117317,117318,117319,117320,117321,117322,117323,120795,120906,125330,125692,129164,129435,129446,129452,129458,133918,133919,133920,134658,134670,136255,136472,136473,136558);
DELETE FROM game_event_creature_data WHERE guid IN (32073,32074,79456,79457,79458,79477,79478,79479,79480,79481,79484,79486,79506,79533,79535,79542,79549,79553,79561,79570,81088,81089,82999,83011,83012,83013,83014,83015,83037,
83044,83045,83047,83059,83060,83066,83067,83068,83089,83124,83126,83132,83133,83136,83138,83140,83142,83144,83145,83147,83158,83159,85532,85533,85534,85535,85536,85537,85538,85539,85540,85541,85542,85543,85544,
85574,85575,85576,85577,85578,86031,86053,86054,86055,86056,86057,86058,86059,86060,86063,86064,86085,87006,101332,101333,101334,101335,101336,101337,101338,101339,101340,101341,101342,101343,117312,117313,117314,
117315,117316,117317,117318,117319,117320,117321,117322,117323,120795,120906,125330,125692,129164,129435,129446,129452,129458,133918,133919,133920,134658,134670,136255,136472,136473,136558);
DELETE FROM creature_battleground WHERE guid IN (32073,32074,79456,79457,79458,79477,79478,79479,79480,79481,79484,79486,79506,79533,79535,79542,79549,79553,79561,79570,81088,81089,82999,83011,83012,83013,83014,83015,83037,
83044,83045,83047,83059,83060,83066,83067,83068,83089,83124,83126,83132,83133,83136,83138,83140,83142,83144,83145,83147,83158,83159,85532,85533,85534,85535,85536,85537,85538,85539,85540,85541,85542,85543,85544,
85574,85575,85576,85577,85578,86031,86053,86054,86055,86056,86057,86058,86059,86060,86063,86064,86085,87006,101332,101333,101334,101335,101336,101337,101338,101339,101340,101341,101342,101343,117312,117313,117314,
117315,117316,117317,117318,117319,117320,117321,117322,117323,120795,120906,125330,125692,129164,129435,129446,129452,129458,133918,133919,133920,134658,134670,136255,136472,136473,136558);
DELETE FROM creature_linking WHERE guid IN (32073,32074,79456,79457,79458,79477,79478,79479,79480,79481,79484,79486,79506,79533,79535,79542,79549,79553,79561,79570,81088,81089,82999,83011,83012,83013,83014,83015,83037,
83044,83045,83047,83059,83060,83066,83067,83068,83089,83124,83126,83132,83133,83136,83138,83140,83142,83144,83145,83147,83158,83159,85532,85533,85534,85535,85536,85537,85538,85539,85540,85541,85542,85543,85544,
85574,85575,85576,85577,85578,86031,86053,86054,86055,86056,86057,86058,86059,86060,86063,86064,86085,87006,101332,101333,101334,101335,101336,101337,101338,101339,101340,101341,101342,101343,117312,117313,117314,
117315,117316,117317,117318,117319,117320,117321,117322,117323,120795,120906,125330,125692,129164,129435,129446,129452,129458,133918,133919,133920,134658,134670,136255,136472,136473,136558)
OR master_guid IN (32073,32074,79456,79457,79458,79477,79478,79479,79480,79481,79484,79486,79506,79533,79535,79542,79549,79553,79561,79570,81088,81089,82999,83011,83012,83013,83014,83015,83037,
83044,83045,83047,83059,83060,83066,83067,83068,83089,83124,83126,83132,83133,83136,83138,83140,83142,83144,83145,83147,83158,83159,85532,85533,85534,85535,85536,85537,85538,85539,85540,85541,85542,85543,85544,
85574,85575,85576,85577,85578,86031,86053,86054,86055,86056,86057,86058,86059,86060,86063,86064,86085,87006,101332,101333,101334,101335,101336,101337,101338,101339,101340,101341,101342,101343,117312,117313,117314,
117315,117316,117317,117318,117319,117320,117321,117322,117323,120795,120906,125330,125692,129164,129435,129446,129452,129458,133918,133919,133920,134658,134670,136255,136472,136473,136558);
INSERT INTO creature (guid, id, modelid, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana, MovementType) VALUES
 -- Scourge Gryphon
(128696, 29501, 0, 609, 1, 2, 2409.095, -5722.372, 154.005, 4.677482, 120, 0, 4906, 0, 0),
(128695, 29501, 0, 609, 1, 2, 2402.865, -5727.03, 154.007, 5.445427, 120, 0, 4906, 0, 0),
-- Scarlet Crusader
(128694, 28529, 0, 609, 1, 2, 1849.022, -5957.297, 149.6885, 0.301217, 120, 0, 2453, 0, 0), 
(128693, 28529, 0, 609, 1, 2, 1821.247, -5895.27, 149.6701, 5.399051, 120, 0, 2453, 0, 0), 
(128735, 28529, 0, 609, 1, 2, 1821.229, -5867.864, 114.4244, 0.6283185, 120, 0, 2453, 0, 0),
(128691, 28529, 0, 609, 1, 2, 1817.483, -5972.377, 116.2088, 2.111848, 120, 0, 2453, 0, 0),
(128690, 28529, 0, 609, 1, 2, 1817.96, -5915.878, 112.7786, 0.1919862, 120, 0, 2453, 0, 0),
(128689, 28529, 0, 609, 1, 2, 1825.083, -5907.236, 115.9916, 0, 120, 0, 2453, 0, 0),
(128692, 28529, 0, 609, 1, 2, 1855.638, -5928.353, 105.1497, 0.3665192, 120, 0, 2453, 0, 0),
(128688, 28529, 0, 609, 1, 2, 1846.022, -5941.425, 117.6101, 0.6457718, 120, 0, 2453, 0, 0),
(128687, 28529, 0, 609, 1, 2, 1832.604, -5937.245, 112.8523, 0.3839724, 120, 0, 2453, 0, 0),
(128737, 28529, 0, 609, 1, 2, 1837.32, -5890.742, 116.5956, 5.742133, 120, 0, 2453, 0, 0),
(128656, 28529, 0, 609, 1, 2, 1843.469, -5900.237, 105.1286, 5.951573, 120, 0, 2453, 0, 0),
(128661, 28529, 0, 609, 1, 2, 1864.83, -5949.614, 117.1199, 1.291544, 120, 0, 2453, 0, 0),
(128655, 28529, 0, 609, 1, 2, 1831.995, -5899.981, 115.6006, 6.056293, 120, 0, 2453, 0, 0),
(128660, 28529, 0, 609, 1, 2, 1836.074, -5910.663, 107.6003, 0.122173, 120, 0, 2453, 0, 0),
(128654, 28529, 0, 609, 1, 2, 1854.217, -5946.555, 116.2794, 1.134464, 120, 0, 2453, 0, 0),
(128659, 28529, 0, 609, 1, 2, 1800.298, -5942.397, 116.2113, 0.6806784, 120, 0, 2453, 0, 0),
(128653, 28529, 0, 609, 1, 2, 1802.826, -5970.984, 116.1361, 0.08726646, 120, 0, 2453, 0, 0),
(128658, 28529, 0, 609, 1, 2, 1812.121, -5938.086, 115.3824, 2.617994, 120, 0, 2453, 0, 0),
(128652, 28529, 0, 609, 1, 2, 1769.587, -5927.734, 116.2277, 0.7853982, 120, 0, 2453, 0, 0),
(128657, 28529, 0, 609, 1, 2, 1804.024, -5927.949, 115.7439, 4.485496, 120, 0, 2453, 0, 0),
(32073, 28529, 0, 609, 1, 2, 1801.723, -5985.942, 115.8919, 1.413717, 120, 0, 2453, 0, 0), 
(32074, 28529, 0, 609, 1, 2, 1733.341, -5893.212, 116.326, 3.874631, 120, 0, 2453, 0, 0),
(79456, 28529, 0, 609, 1, 2, 1873.823, -5937.143, 103.766, 1.623156, 120, 0, 2453, 0, 0),
(79457, 28529, 0, 609, 1, 2, 1803.846, -5788.624, 149.6869, 6.263151, 120, 0, 2453, 0, 0), 
(79458, 28529, 0, 609, 1, 2, 1804.153, -5849.433, 149.67, 3.733546, 120, 0, 2453, 0, 0),
(79477, 28529, 0, 609, 1, 2, 1801.421, -5740.647, 141.0913, 4.769802, 120, 0, 2453, 0, 0),
(79478, 28529, 0, 609, 1, 2, 1769.032, -5797.97, 116.2356, 4.799655, 120, 0, 2453, 0, 0),
(79479, 28529, 0, 609, 1, 2, 1764.665, -5798.557, 116.2854, 4.834562, 120, 0, 2453, 0, 0),
(79480, 28529, 0, 609, 1, 2, 1778.208, -5797.711, 115.9628, 4.782202, 120, 0, 2453, 0, 0),
(79481, 28529, 0, 609, 1, 2, 1774.032, -5797.677, 116.0895, 4.873692, 120, 0, 2453, 0, 0),
(79484, 28529, 0, 609, 1, 2, 1782.601, -5797.508, 115.8885, 4.782202, 120, 0, 2453, 0, 0),
(79486, 28529, 0, 609, 1, 2, 1765.205, -5803.292, 116.3939, 4.834562, 120, 0, 2453, 0, 0),
(79506, 28529, 0, 609, 1, 2, 1778.276, -5801.901, 115.6569, 4.799655, 120, 0, 2453, 0, 0),
(79533, 28529, 0, 609, 1, 2, 1774.276, -5802.383, 116.0229, 4.864975, 120, 0, 2453, 0, 0),
(79535, 28529, 0, 609, 1, 2, 1769.404, -5802.749, 116.2538, 4.799655, 120, 0, 2453, 0, 0),
(79542, 28529, 0, 609, 1, 2, 1782.644, -5801.294, 115.2809, 4.817109, 120, 0, 2453, 0, 0),
(79549, 28529, 0, 609, 1, 2, 1815.021, -5796.956, 115.7996, 5.846853, 120, 0, 2453, 0, 0),
(79553, 28529, 0, 609, 1, 2, 1757.576, -5839.036, 116.8953, 1.64061, 120, 0, 2453, 0, 0),
(79561, 28529, 0, 609, 1, 2, 1761.23, -5838.272, 116.5603, 1.692969, 120, 0, 2453, 0, 0),
(79570, 28529, 0, 609, 1, 2, 1761.317, -5841.41, 116.7594, 1.658063, 120, 0, 2453, 0, 0),
(81088, 28529, 0, 609, 1, 2, 1765.055, -5837.601, 116.4999, 1.72583, 120, 0, 2453, 0, 0),
(81089, 28529, 0, 609, 1, 2, 1765.097, -5841.085, 116.6488, 1.658063, 120, 0, 2453, 0, 0),
(82999, 28529, 0, 609, 1, 2, 1836.332, -5800.062, 102.0841, 5.462881, 120, 0, 2453, 0, 0),
(83011, 28529, 0, 609, 1, 2, 1824.743, -5802.465, 103.7019, 5.899213, 120, 0, 2453, 0, 0),
(83012, 28529, 0, 609, 1, 2, 1803.142, -5801.152, 114.9626, 6.056293, 120, 0, 2453, 0, 0),
(83013, 28529, 0, 609, 1, 2, 1774.37, -5836.22, 116.9071, 1.780236, 120, 0, 2453, 0, 0),
(83014, 28529, 0, 609, 1, 2, 1774.906, -5839.776, 117.0873, 1.692969, 120, 0, 2453, 0, 0),
(83015, 28529, 0, 609, 1, 2, 1769.941, -5840.487, 116.815, 1.692969, 120, 0, 2453, 0, 0),
(83037, 28529, 0, 609, 1, 2, 1804.492, -5837.145, 117.5094, 0.3316126, 120, 0, 2453, 0, 0),
(83044, 28529, 0, 609, 1, 2, 1811.354, -5831.025, 106.4223, 0.1745329, 120, 0, 2453, 0, 0),
(83045, 28529, 0, 609, 1, 2, 1825.835, -5831.765, 102.5963, 0.4712389, 120, 0, 2453, 0, 0),
(83047, 28529, 0, 609, 1, 2, 1757.339, -5841.901, 117.1916, 1.605703, 120, 0, 2453, 0, 0),
(83059, 28529, 0, 609, 1, 2, 1769.622, -5837.14, 116.6763, 1.710423, 120, 0, 2453, 0, 0),
(83060, 28529, 0, 609, 1, 2, 1819.801, -5842.832, 116.3475, 6.248279, 120, 0, 2453, 0, 0),
(83066, 28529, 0, 609, 1, 2, 1834.855, -5850.994, 101.5225, 0.3316126, 120, 0, 2453, 0, 0),
(83067, 28529, 0, 609, 1, 2, 1845.36, -6008.437, 149.8176, 4.57146, 120, 0, 2453, 0, 0), 
(83068, 28529, 0, 609, 1, 2, 1728.292, -5868.477, 116.2078, 3.176499, 120, 0, 2453, 0, 0),
(83089, 28529, 0, 609, 1, 2, 1728.172, -5875.481, 116.2309, 3.054326, 120, 0, 2453, 0, 0),
(83124, 28529, 0, 609, 1, 2, 1811.685, -6003.792, 117.6583, 4.825852, 120, 0, 2453, 0, 0),
(83126, 28529, 0, 609, 1, 2, 1664.133, -5870.508, 116.2591, 0.418879, 120, 0, 2453, 0, 0),
(83132, 28529, 0, 609, 1, 2, 1660.333, -5928.868, 122.5983, 3.333579, 120, 0, 2453, 0, 0),
(83133, 28529, 0, 609, 1, 2, 1646.828, -5919.673, 118.1512, 0.8726646, 120, 0, 2453, 0, 0),
(83136, 28529, 0, 609, 1, 2, 1645.689, -5907.14, 116.2535, 5.654867, 120, 0, 2453, 0, 0),
(83138, 28529, 0, 609, 1, 2, 1659.158, -5966.054, 131.1367, 1.570796, 120, 0, 2453, 0, 0),
(83140, 28529, 0, 609, 1, 2, 1658.88, -5977.833, 132.8795, 1.466077, 120, 0, 2453, 0, 0),
(83142, 28529, 0, 609, 1, 2, 1658.787, -5937.808, 124.3198, 3.141593, 120, 0, 2453, 0, 0),
(83144, 28529, 0, 609, 1, 2, 1647.253, -5946.368, 124.967, 6.230825, 120, 0, 2453, 0, 0),
(83145, 28529, 0, 609, 1, 2, 1646.972, -5965.068, 130.8264, 1.37881, 120, 0, 2453, 0, 0),
(83147, 28529, 0, 609, 1, 2, 1655.165, -5998.201, 133.583, 1.58825, 120, 0, 2453, 0, 0),
(83158, 28529, 0, 609, 1, 2, 1657.516, -5953.328, 127.2481, 3.228859, 120, 0, 2453, 0, 0),
(83159, 28529, 0, 609, 1, 2, 1658.34, -5945.339, 125.518, 3.333579, 120, 0, 2453, 0, 0), 
(85532, 28529, 0, 609, 1, 2, 1646.554, -5997.492, 133.5836, 1.448623, 120, 0, 2453, 0, 0),
(85533, 28529, 0, 609, 1, 2, 1646.978, -5953.929, 127.1546, 6.038839, 120, 0, 2453, 0, 0),
(85534, 28529, 0, 609, 1, 2, 1647.901, -5940.088, 123.5596, 0.1047198, 120, 0, 2453, 0, 0),
(85535, 28529, 0, 609, 1, 2, 1646.488, -5976.733, 132.8795, 1.308997, 120, 0, 2453, 0, 0),
(85536, 28529, 0, 609, 1, 2, 1648.731, -5929.063, 121.1707, 0.08726646, 120, 0, 2453, 0, 0),
(85537, 28529, 0, 609, 1, 2, 1705.063, -5879.186, 116.2465, 2.897247, 120, 0, 2453, 0, 0),
(85538, 28529, 0, 609, 1, 2, 1609.024, -5754.198, 119.357, 5.113815, 120, 0, 2453, 0, 0),
(85539, 28529, 0, 609, 1, 2, 1618.91, -5760.717, 116.243, 5.009095, 120, 0, 2453, 0, 0),
(85540, 28529, 0, 609, 1, 2, 1656.072, -5805.004, 116.2052, 0.296706, 120, 0, 2453, 0, 0),
(85541, 28529, 0, 609, 1, 2, 1651.839, -5846.804, 116.1708, 6.213372, 120, 0, 2453, 0, 0),
(85542, 28529, 0, 609, 1, 2, 1652.588, -5838.151, 116.202, 5.969026, 120, 0, 2453, 0, 0),
(85543, 28529, 0, 609, 1, 2, 1706.375, -5863.752, 116.2515, 3.351032, 120, 0, 2453, 0, 0),
(85544, 28529, 0, 609, 1, 2, 1620.508, -5757.24, 116.4747, 5.201081, 120, 0, 2453, 0, 0),
(85574, 28529, 0, 609, 1, 2, 1688.925, -5842.227, 116.2815, 0.7679449, 120, 0, 2453, 0, 0),
(85575, 28529, 0, 609, 1, 2, 1598.758, -5770.884, 116.1257, 5.288348, 120, 0, 2453, 0, 0),
(85576, 28529, 0, 609, 1, 2, 1596.118, -5771.492, 116.1279, 5.410521, 120, 0, 2453, 0, 0),
(85577, 28529, 0, 609, 1, 2, 1535.319, -6020.205, 149.9427, 2.489439, 120, 0, 2453, 0, 0),
(85578, 28529, 0, 609, 1, 2, 1511.599, -5961.896, 152.1384, 5.3605, 120, 0, 2453, 0, 0), 
(86031, 28529, 0, 609, 1, 2, 1531.513, -5897.081, 129.787, 5.943948, 120, 0, 2453, 0, 0), 
(86053, 28529, 0, 609, 1, 2, 1530.185, -5895.962, 129.912, 5.843255, 120, 0, 2453, 0, 0), 
(86054, 28529, 0, 609, 1, 2, 1529.32, -5894.456, 129.912, 5.753412, 120, 0, 2453, 0, 0),  
(86055, 28529, 0, 609, 1, 2, 1529.022, -5892.746, 129.912, 5.682151, 120, 0, 2453, 0, 0),
(86056, 28529, 0, 609, 1, 2, 1529.327, -5891.036, 129.787, 5.642222, 120, 0, 2453, 0, 0), 
(86057, 28529, 0, 609, 1, 2, 1530.198, -5889.534, 130.037, 5.655405, 120, 0, 2453, 0, 0),
(86058, 28529, 0, 609, 1, 2, 1531.531, -5888.42, 129.787, 5.75581, 120, 0, 2453, 0, 0),
(86059, 28529, 0, 609, 1, 2, 1533.164, -5887.83, 129.537, 5.971915, 120, 0, 2453, 0, 0),
(86060, 28529, 0, 609, 1, 2, 1534.9, -5887.833, 129.1977, 6.251281, 120, 0, 2453, 0, 0),
(86063, 28529, 0, 609, 1, 2, 1598.573, -5759.04, 119.3193, 5.218534, 120, 0, 2453, 0, 0),
(86064, 28529, 0, 609, 1, 2, 1592.801, -5745.275, 119.3197, 5.340707, 120, 0, 2453, 0, 0), 
(86085, 28529, 0, 609, 1, 2, 1590.189, -5744.708, 119.7557, 5.235988, 120, 0, 2453, 0, 0),
(87006, 28529, 0, 609, 1, 2, 1601.184, -5738.64, 119.8708, 5.131268, 120, 0, 2453, 0, 0),
(101332, 28529, 0, 609, 1, 2, 1600.429, -5741.555, 119.3444, 5.131268, 120, 0, 2453, 0, 0), 
(101333, 28529, 0, 609, 1, 2, 1412.832, -5748.321, 131.591, 5.305801, 120, 0, 2453, 0, 0), 
(101334, 28529, 0, 609, 1, 2, 1428.99, -5739.668, 131.2932, 4.660029, 120, 0, 2453, 0, 0),
(101335, 28529, 0, 609, 1, 2, 1387.051, -5708.231, 136.3472, 5.689773, 120, 0, 2453, 0, 0),
(101336, 28529, 0, 609, 1, 2, 1392.485, -5701.703, 135.8899, 5.445427, 120, 0, 2453, 0, 0), 
(101337, 28529, 0, 609, 1, 2, 1381.503, -5725.912, 144.2075, 0.7853982, 120, 0, 2453, 0, 0),
-- Scarlet Commander
(101338, 28530, 0, 609, 1, 2, 1532.751, -5892.1797, 129.371, 6.078036, 120, 0, 2699, 0, 2),
(101339, 28530, 0, 609, 1, 2, 1756.149, -5834.704, 116.5814, 3.286978, 120, 0, 2699, 0, 2),
(101340, 28530, 0, 609, 1, 2, 1783.689, -5806.347, 114.3748, 0.1292475, 120, 0, 2699, 0, 2),
-- Scarlet Preacher
(101341, 28594, 0, 609, 1, 2, 1390.558, -5703.662, 136.3209, 2.282122, 120, 0, 2453, 1982, 0),
(101342, 28594, 0, 609, 1, 2, 1390.572, -5703.678, 136.3188, 5.372028, 120, 0, 2453, 1982, 2),
(101343, 28594, 0, 609, 1, 2, 1360.449, -5683.808, 138.7448, 5.587841, 120, 0, 2453, 1982, 0),
(117312, 28594, 0, 609, 1, 2, 1488.34, -5813.331, 131.335, 1.720976, 120, 0, 2453, 1982, 2),
(117313, 28594, 0, 609, 1, 2, 1484.236, -5850.959, 131.3351, 3.80808, 120, 0, 2453, 1982, 2),
-- Acherus Dummy
(117314, 28367, 0, 609, 1, 2, 1676.557, -5945.135, 126.8824, 1.186824, 120, 0, 8982, 0, 2),
-- Havenshire Stallion
(117315, 28605, 0, 609, 1, 2, 2177.534, -5806.438, 101.4173, 3.543018, 120, 0, 2453, 0, 0),
(117316, 28605, 0, 609, 1, 2, 2221.63, -5881.24, 101.211, 4.74729, 120, 0, 2453, 0, 0),
(117317, 28605, 0, 609, 1, 2, 2206.62, -5840.55, 101.48, 1.43117, 120, 0, 2453, 0, 0),
(117318, 28605, 0, 609, 1, 2, 2209.9, -5840.27, 101.428, 2.35619, 120, 0, 2453, 0, 0),
(117319, 28605, 0, 609, 1, 2, 2204.79, -5840.43, 101.576, 1.13446, 120, 0, 2453, 0, 0),
(117320, 28605, 0, 609, 1, 2, 2199.98, -5871.52, 101.408, 4.34587, 120, 0, 2453, 0, 0),
(117321, 28605, 0, 609, 1, 2, 2228.12, -5818.03, 101.445, 1.43117, 120, 0, 2453, 0, 0),
(117322, 28605, 0, 609, 1, 2, 2232.95, -5814.65, 101.368, 2.35619, 120, 0, 2453, 0, 0),
-- Havenshire Mare
(117323, 28606, 0, 609, 1, 2, 2172.505, -5810.831, 101.4043, 1.082104, 120, 0, 2453, 0, 0),
(120795, 28606, 0, 609, 1, 2, 2237.33, -5860.84, 101.292, 5.42797, 120, 0, 2453, 0, 0),
(120906, 28606, 0, 609, 1, 2, 2235.99, -5863.17, 101.269, 0.017453, 120, 0, 2453, 0, 0),
(125330, 28606, 0, 609, 1, 2, 2221.94, -5888.14, 101.022, 1.69297, 120, 0, 2453, 0, 0),
(125692, 28606, 0, 609, 1, 2, 2218.83, -5888.31, 100.995, 1.58825, 120, 0, 2453, 0, 0),
(129164, 28606, 0, 609, 1, 2, 2203.25, -5833.98, 101.44, 5.70723, 120, 0, 2453, 0, 0),
(129435, 28606, 0, 609, 1, 2, 2206.26, -5833.58, 101.435, 5.044, 120, 0, 2453, 0, 0),
(129446, 28606, 0, 609, 1, 2, 2185.22, -5867.83, 101.395, 4.85202, 120, 0, 2453, 0, 0),
(129452, 28606, 0, 609, 1, 2, 2197.14, -5870.83, 101.403, 4.57276, 120, 0, 2453, 0, 0),
(129458, 28606, 0, 609, 1, 2, 2225.69, -5815.68, 101.445, 0.488692, 120, 0, 2453, 0, 0),
 -- Havenshire Colt
(133918, 28607, 0, 609, 1, 2, 2212.25, -5881.55, 101.11, 4.59022, 120, 0, 2062, 0, 0),
(133919, 28607, 0, 609, 1, 2, 2176, -5810.381, 101.4176, 2.094395, 120, 0, 2062, 0, 0),
(133920, 28607, 0, 609, 1, 2, 2208.6, -5833.48, 101.428, 4.7822, 120, 0, 2062, 0, 0),
(134658, 28607, 0, 609, 1, 2, 2202.68, -5838.43, 101.498, 0.069813, 120, 0, 2062, 0, 0),
(134670, 28607, 0, 609, 1, 2, 2186.6, -5868.27, 101.39, 4.90438, 120, 0, 2062, 0, 0),
(136255, 28607, 0, 609, 1, 2, 2189.17, -5870.81, 101.378, 2.00713, 120, 0, 2062, 0, 0),
(136472, 28607, 0, 609, 1, 2, 2187.83, -5868.67, 101.387, 4.03171, 120, 0, 2062, 0, 0),
(136473, 28607, 0, 609, 1, 2, 2224.77, -5811.89, 101.434, 0.820305, 120, 0, 2062, 0, 0),
(136558, 28607, 0, 609, 1, 2, 2232.4, -5818.69, 101.392, 2.26893, 120, 0, 2062, 0, 0);

-- waypoints
DELETE FROM creature_movement WHERE id IN (101339,101340,101342,117312,117313,117314,101338);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(117314,1,1676.557,-5945.135,126.8824,5000,0,0,0,0,0,0,0,0,0,1.186824,0,0),
(117314,2,1676.557,-5945.135,126.8824,10000,2836701,0,0,0,0,0,0,0,0,1.186824,0,0),
(117314,3,1676.557,-5945.135,126.8824,15000,0,0,0,0,0,0,0,0,0,1.186824,0,0),
-- Scarlet Commander
(101339,1,1775.91,-5832.22,116.268,0,0,0,0,0,0,0,0,0,0,3.27545,0,0),
(101339,2,1755.28,-5834.67,116.466,0,0,0,0,0,0,0,0,0,0,0.155067,0,0),
(101340,1,1762.27,-5808.16,116.622,0,0,0,0,0,0,0,0,0,0,0.0435456,0,0),
(101340,2,1784.43,-5806.17,114.238,0,0,0,0,0,0,0,0,0,0,3.29274,0,0),
-- Scarlet Preacher
(101342,1,1402.94,-5716.94,133.387,0,0,0,0,0,0,0,0,0,0,5.27582,0,0),(101342,2,1423.3,-5747.93,131.208,0,0,0,0,0,0,0,0,0,0,5.27415,0,0),(101342,3,1402.68,-5716.63,133.475,0,0,0,0,0,0,0,0,0,0,2.18361,0,0),
(101342,4,1397.68,-5710.01,135.097,0,0,0,0,0,0,0,0,0,0,2.44907,0,0),(101342,5,1389.76,-5704.78,136.089,0,0,0,0,0,0,0,0,0,0,2.54489,0,0),(101342,6,1386.06,-5702.27,138.002,0,0,0,0,0,0,0,0,0,0,2.54489,0,0),
(101342,7,1366.41,-5688.04,137.968,3000,0,0,0,0,0,0,0,0,0,2.54489,0,0),(101342,8,1386.36,-5702.1,138.001,0,0,0,0,0,0,0,0,0,0,5.66684,0,0),(101342,9,1390.1,-5704.74,136.054,0,0,0,0,0,0,0,0,0,0,5.66684,0,0),
(117312,1,1484.85,-5802.34,131.228,0,0,0,0,0,0,0,0,0,0,2.09093,0,0),(117312,2,1474.38,-5788.07,131.232,0,0,0,0,0,0,0,0,0,0,2.24565,0,0),(117312,3,1451.5,-5759.41,131.232,0,0,0,0,0,0,0,0,0,0,2.40901,0,0),
(117312,4,1438.17,-5750.76,131.21,0,0,0,0,0,0,0,0,0,0,2.77606,0,0),(117312,5,1425.59,-5747.92,131.21,0,0,0,0,0,0,0,0,0,0,3.33919,0,0),(117312,6,1416.48,-5752.81,131.263,0,0,0,0,0,0,0,0,0,0,3.84342,0,0),
(117312,7,1410.85,-5760.42,131.447,0,0,0,0,0,0,0,0,0,0,4.38253,0,0),(117312,8,1397.58,-5797.64,131.217,0,0,0,0,0,0,0,0,0,0,4.52391,0,0),(117312,9,1398.15,-5805.79,131.242,0,0,0,0,0,0,0,0,0,0,5.00299,0,0),
(117312,10,1402.93,-5815.12,131.215,0,0,0,0,0,0,0,0,0,0,5.33678,0,0),(117312,11,1431.32,-5846.87,131.209,0,0,0,0,0,0,0,0,0,0,5.47815,0,0),(117312,12,1439.07,-5853.76,131.21,0,0,0,0,0,0,0,0,0,0,5.82529,0,0),
(117312,13,1449.41,-5855.99,131.22,0,0,0,0,0,0,0,0,0,0,0.0101976,0,0),(117312,14,1478.43,-5856.03,131.237,0,0,0,0,0,0,0,0,0,0,0.0438187,0,0),(117312,15,1487.95,-5854.48,131.214,0,0,0,0,0,0,0,0,0,0,0.642292,0,0),
(117312,16,1491.59,-5851.32,131.214,0,0,0,0,0,0,0,0,0,0,1.09625,0,0),(117312,17,1493.68,-5843.79,131.213,0,0,0,0,0,0,0,0,0,0,1.60511,0,0),(117312,18,1488.45,-5813.26,131.21,0,0,0,0,0,0,0,0,0,0,1.81953,0,0),
(117313,1,1451.43,-5852.32,131.316,0,0,0,0,0,0,0,0,0,0,2.97292,0,0),(117313,2,1441.34,-5848.45,131.214,0,0,0,0,0,0,0,0,0,0,2.31868,0,0),(117313,3,1415.71,-5822.71,131.208,0,0,0,0,0,0,0,0,0,0,2.34224,0,0),
(117313,4,1402.84,-5805.23,131.217,0,0,0,0,0,0,0,0,0,0,1.9087,0,0),(117313,5,1403.41,-5795.93,131.212,0,0,0,0,0,0,0,0,0,0,1.30316,0,0),(117313,6,1414.64,-5764.5,131.301,0,0,0,0,0,0,0,0,0,0,1.2741,0,0),
(117313,7,1421.97,-5754.72,131.213,0,0,0,0,0,0,0,0,0,0,0.747881,0,0),(117313,8,1431.54,-5753.59,131.21,0,0,0,0,0,0,0,0,0,0,6.13021,0,0),(117313,9,1440.86,-5758.25,131.21,0,0,0,0,0,0,0,0,0,0,5.51839,0,0),
(117313,10,1465.74,-5787.2,131.213,0,0,0,0,0,0,0,0,0,0,5.4532,0,0),(117313,11,1479.13,-5805.14,131.211,0,0,0,0,0,0,0,0,0,0,5.30005,0,0),(117313,12,1485.4,-5822.49,131.219,0,0,0,0,0,0,0,0,0,0,4.99375,0,0),
(117313,13,1487.73,-5844.53,131.216,0,0,0,0,0,0,0,0,0,0,4.72279,0,0),(117313,14,1486.62,-5849.06,131.214,0,0,0,0,0,0,0,0,0,0,4.1039,0,0),(117313,15,1482.41,-5851.55,131.217,0,0,0,0,0,0,0,0,0,0,3.45988,0,0),
(101338,2,1601.17,-5910.01,116.303,0,0,0,0,0,0,0,0,0,0,6.00342,0,0),(101338,3,1643.02,-5910.12,116.266,0,0,0,0,0,0,0,0,0,0,0.520555,0,0),(101338,4,1656.36,-5899.57,116.124,0,0,0,0,0,0,0,0,0,0,0.587314,0,0),
(101338,5,1692.02,-5884.95,116.142,0,0,0,0,0,0,0,0,0,0,6.01834,0,0),(101338,6,1702.86,-5887.94,116.138,0,0,0,0,0,0,0,0,0,0,5.62172,0,0),(101338,7,1736.57,-5907.02,116.123,0,0,0,0,0,0,0,0,0,0,5.80629,0,0),
(101338,8,1798.79,-5933.78,115.968,0,0,0,0,0,0,0,0,0,0,6.01049,0,0),(101338,9,1809.37,-5933.87,115.297,0,0,0,0,0,0,0,0,0,0,0.343049,0,0),(101338,10,1864.98,-5914.6,104.226,0,0,0,0,0,0,0,0,0,0,0.331268,0,0),
(101338,11,1885.84,-5907.43,102.989,0,0,0,0,0,0,0,0,0,0,0.778945,0,0),(101338,12,1894.42,-5891.76,102.687,0,0,0,0,0,0,0,0,0,0,1.25411,0,0),(101338,13,1895.85,-5875.9,101.466,0,0,0,0,0,0,0,0,0,0,1.51329,0,0),
(101338,14,1881.66,-5850.79,102.244,0,0,0,0,0,0,0,0,0,0,2.27513,0,0),(101338,15,1852.78,-5819.59,99.8482,0,0,0,0,0,0,0,0,0,0,3.03697,0,0),(101338,16,1815.8,-5818.1,105.145,0,0,0,0,0,0,0,0,0,0,3.12336,0,0),
(101338,17,1749.11,-5822.59,116.12,0,0,0,0,0,0,0,0,0,0,3.13514,0,0),(101338,18,1731.1,-5820.91,116.122,0,0,0,0,0,0,0,0,0,0,2.228,0,0),(101338,19,1707.71,-5788.65,114.503,0,0,0,0,0,0,0,0,0,0,2.55002,0,0),
(101338,20,1688.41,-5781.75,114.617,0,0,0,0,0,0,0,0,0,0,2.96235,0,0),(101338,21,1652.1,-5780.44,116.135,0,0,0,0,0,0,0,0,0,0,3.13514,0,0),(101338,22,1604.93,-5783.24,116.183,0,0,0,0,0,0,0,0,0,0,3.20583,0,0),
(101338,23,1554.09,-5787.14,119.562,0,0,0,0,0,0,0,0,0,0,3.1587,0,0),(101338,24,1525.3,-5788.32,127.109,0,0,0,0,0,0,0,0,0,0,3.34719,0,0),(101338,25,1501.55,-5795.64,131.149,0,0,0,0,0,0,0,0,0,0,3.56318,0,0),
(101338,26,1488.25,-5802.89,131.248,0,0,0,0,0,0,0,0,0,0,4.43889,0,0),(101338,27,1486.45,-5811.1,131.213,0,0,0,0,0,0,0,0,0,0,4.81274,0,0),(101338,28,1491.52,-5862.06,131.213,0,0,0,0,0,0,0,0,0,0,5.16067,0,0),
(101338,29,1504.88,-5884.58,131.182,0,0,0,0,0,0,0,0,0,0,5.78506,0,0),(101338,30,1535.07,-5893.31,129.066,0,0,0,0,0,0,0,0,0,0,6.08743,0,0);
-- creature links
DELETE FROM creature_linking WHERE guid IN (86031,86053,86054,86055,86056,86057,86058,86059,86060,101341);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(101341, 101342, 512),(86031, 101338, 512),(86053, 101338, 512),(86054, 101338, 512),(86055, 101338, 512),(86056, 101338, 512),(86057, 101338, 512),(86058, 101338, 512),(86059, 101338, 512),(86060, 101338, 512);
-- event
DELETE FROM dbscripts_on_creature_movement WHERE id = 2836701;
INSERT INTO dbscripts_on_creature_movement VALUES
(2836701,1,31,28662,100,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(2836701,2,0,0,0,28662,100,7,2000000411,2000000412,0,0,0,0,0,0,''),
(2836701,5,31,28548,100,0,0,0,0,0,0,0,0,0,0,0,''), -- check if creature is alive
(2836701,6,0,0,0,28548,100,7,2000000413,0,0,0,0,0,0,0,''),
(2836701,13,1,1,0,28548,100,7,5,274,0,0,0,0,0,0,'random emote');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000411 AND 2000000413;
INSERT INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT) VALUES 
(2000000411,'What are we to do? We\'ve lost everything!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000412,'Havenshire is lost.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,NULL),
(2000000413,'We fight! We push them back, just as we have always done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,15,NULL);
-- missing objects
-- empty guids reused -- UDB ONLY
DELETE FROM gameobject WHERE guid IN
(65255,65291,65375,66691,66696,66697,66698,66699,66700,66701,66702,66703,66704,66705,66708,66709,66710,66840,66841,66842,66843,66844,66845,66846,66847,66848,66849,66850,66851,93939,93940,
94065,94158,94159,94160,94161,94162,94163,94164,94165,94166,94167);
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
-- house
(65255,191166,609,1,2,2266.77,-5799.27,97.839,-0.968655,0,0,-0.465613,0.884988,180,0,1),
-- mail box
(65291,190914,609,1,2,2113.54,-5796.06,99.7134,0.67195,-0.001297,0.00416565,0.329686,0.94408,180,0,1),
-- house
(65375,191167,609,1,2,2109.78,-5805.76,96.7227,2.25147,0,0,0.902585,0.430512,180,0,1),
(66691,191173,609,1,2,2108.63,-5888.85,99.7184,-2.67908,0,0,-0.973379,0.229201,180,0,1),
(66696,191169,609,1,2,2054.5,-5880.65,101.061,0.532327,0,0,0.263032,0.964787,180,0,1),
(66697,191171,609,1,2,1936.04,-5792.89,96.8256,0.872664,0,0,0.422618,0.906308,180,0,1),
(66698,191169,609,1,2,2054.5,-5880.65,101.061,0.532327,0,0,0.263032,0.964787,180,0,1),
-- lumber mill
(66699,191191,609,1,2,2091.49,-5680.32,100.272,2.14675,0,0,0.878817,0.47716,180,0,1),
-- stables
(66700,191178,609,1,2,2217.03,-5880.88,100.885,1.5708,0,0,0.707107,0.707107,180,0,1),
-- silos
(66701,190800,609,1,2,2051.61,-5782.35,100.826,1.12139,0,0,0.531775,0.846885,180,0,1),
-- barn
(66702,191172,609,1,2,1929.23,-5880.05,97.7314,2.36492,0,0,0.92554,0.37865,180,0,1),
-- tower
(66703,190568,609,1,2,2377.07,-6045.53,61.521,2.44346,0,0,0.939692,0.34202,180,255,1),
(66704,190789,609,1,2,2366.51,-6037.01,75.3612,2.46091,0,0,0.942641,0.333808,180,0,1),
-- baricade
(66705,190879,609,1,2,2157.1,-5694.98,105.176,-2.60926,0.100891,0.0733604,-0.95587,0.265993,180,0,1),
(66708,190890,609,1,2,2158.05,-5699.04,106.456,-0.881391,0.330425,-0.255406,-0.350611,0.838248,180,0,1),
(66709,190882,609,1,2,2158.24,-5694.42,106.658,0.95993,0,0,0.461748,0.887011,180,0,1),
(66710,190886,609,1,2,2159.14,-5697.77,104.713,-3.09895,-0.061204,-0.0995245,-0.992772,0.0274319,180,0,1),
(66840,190878,609,1,2,2158.66,-5693.46,105.624,3.14156,0.0421166,0.0615225,-0.997213,0.00258374,180,0,1),
(66841,190875,609,1,2,2160.43,-5691.89,106.021,2.35619,-0.0140967,-0.0684423,0.921273,0.382587,180,0,1),
(66842,190876,609,1,2,2159.34,-5694.84,105.415,3.14159,0,0,-1,0,180,0,1),
(66843,190877,609,1,2,2159.55,-5695.07,105.455,2.79252,0.016243,-0.0696001,0.981966,0.175028,180,0,1),
(66844,190870,609,1,2,2171.32,-5700.66,105.886,2.80077,-0.0181217,-0.116454,0.978609,0.168625,180,0,1),
(66845,190885,609,1,2,2160.32,-5697.78,105.062,2.94275,-0.0372086,-0.0788364,0.991509,0.0964853,180,0,1),
(66846,190873,609,1,2,2160.28,-5694.75,105.532,2.47836,-0.0131168,-0.0416002,0.944602,0.325307,180,0,1),
(66847,190869,609,1,2,2167.19,-5700.54,107.617,0.821324,0.146786,-0.305458,0.379759,0.860774,180,0,1),
(66848,190892,609,1,2,2166.22,-5700.03,105.816,1.08086,0.134146,-0.29005,0.477654,0.818366,180,0,1),
(66849,190880,609,1,2,2164.09,-5691.64,106.916,2.82979,-0.0622897,-0.0891228,0.982732,0.149717,180,0,1),
(66850,190859,609,1,2,2169.18,-5698.67,106.002,2.58897,-0.0407338,-0.0906858,0.957691,0.270082,180,0,1),
(66851,190881,609,1,2,2163.73,-5694.48,106.263,2.93795,-0.0458646,-0.122612,0.986681,0.0965575,180,0,1),
(93939,190883,609,1,2,2162.91,-5697.05,106.007,1.07415,0.063015,-0.264695,0.473343,0.837802,180,0,1),
(93940,190861,609,1,2,2175.06,-5703.45,105.77,-3.14088,0.0284739,0.0860357,-0.995881,0.00281557,180,0,1),
(94065,190863,609,1,2,2175.07,-5702.19,106.044,2.38237,-0.0104766,-0.0470209,0.927595,0.370468,180,0,1),
(94158,190868,609,1,2,2175.71,-5705.19,105.456,2.63544,0,0,0.968147,0.250381,180,0,1),
(94159,190864,609,1,2,2177.18,-5703.08,106.062,2.00713,-0.0519929,-0.00577831,0.842955,0.535435,180,0,1),
(94160,190865,609,1,2,2178.62,-5701.81,106.359,2.37365,-0.00524759,-0.0166445,0.927033,0.374572,180,0,1),
(94161,190866,609,1,2,2178.36,-5704.54,105.888,3.02813,-0.0151815,-0.0217628,0.998057,0.0563685,180,0,1),
(94162,190867,609,1,2,2175.85,-5704.97,111.051,1.02974,0,0,0.492424,0.870355,180,0,1),
(94163,190891,609,1,2,2162.82,-5701.18,104.716,-2.22071,0.0748539,0.0447206,-0.892179,0.443185,180,0,1),
(94164,190892,609,1,2,2166.22,-5700.03,105.816,1.08086,0.134146,-0.29005,0.477654,0.818366,180,0,1),
(94165,190893,609,1,2,2166.32,-5705.36,104.243,-0.562665,0.0793948,-0.0132055,-0.277456,0.957361,180,0,1),
(94166,190887,609,1,2,2151.4,-5697.19,103.789,2.22597,-0.0430837,-0.0871992,0.892773,0.439883,180,0,1),
(94167,190884,609,1,2,2155.83,-5697.56,105.026,0.925538,-0.160909,0.156031,0.449443,0.864733,180,0,1);
-- ---------------------------
-- DK Starting Zone - phase 32 -- Realm of Shadows
-- ---------------------------

-- Duplicates
DELETE FROM creature WHERE guid IN (128616,128620);
DELETE FROM creature_addon WHERE guid IN (128616,128620);
DELETE FROM creature_movement WHERE id IN (128616,128620);
DELETE FROM game_event_creature WHERE guid IN (128616,128620);
DELETE FROM game_event_creature_data WHERE guid IN (128616,128620);
DELETE FROM creature_battleground WHERE guid IN (128616,128620);
DELETE FROM creature_linking WHERE guid IN (128616,128620) OR master_guid IN (128616,128620);

-- missing creatures 
-- empty guids reused -- UDB ONLY
DELETE FROM creature WHERE guid IN (28556,76795,76796,76799,87007,101589,103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,103412,103414,103423,103424,103462,103466,
103467,103468,103470,103471,128498);
DELETE FROM creature_addon WHERE guid IN (28556,76795,76796,76799,87007,101589,103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,103412,103414,103423,103424,103462,
103466,103467,103468,103470,103471,128498);
DELETE FROM creature_movement WHERE id IN (28556,76795,76796,76799,87007,101589,103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,103412,103414,103423,103424,103462,
103466,103467,103468,103470,103471,128498);
DELETE FROM game_event_creature WHERE guid IN (28556,76795,76796,76799,87007,101589,103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,103412,103414,103423,103424,
103462,103466,103467,103468,103470,103471,128498);
DELETE FROM game_event_creature_data WHERE guid IN (28556,76795,76796,76799,87007,101589,103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,103412,103414,103423,
103424,103462,103466,103467,103468,103470,103471,128498);
DELETE FROM creature_battleground WHERE guid IN (28556,76795,76796,76799,87007,101589,103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,103412,103414,103423,103424,
103462,103466,103467,103468,103470,103471,128498);
DELETE FROM creature_linking WHERE guid IN (28556,76795,76796,76799,87007,101589,103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,103412,103414,103423,103424,103462,
103466,103467,103468,103470,103471,128498)
OR master_guid IN (28556,76795,76796,76799,87007,101589,103239,103245,103246,103292,103293,103294,103299,103300,103321,103322,103323,103363,103393,103404,103412,103414,103423,103424,103462,103466,103467,103468,
103470,103471,128498);
INSERT INTO creature (guid, id, modelid, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana, MovementType) VALUES
-- Scourge Gryphon
(76795, 29501, 0, 609, 1, 32, 2409.095, -5722.372, 154.005, 4.677482, 360, 0, 4906, 0, 0),
(76796, 29501, 0, 609, 1, 32, 2402.865, -5727.03, 154.007, 5.445427, 360, 0, 4906, 0, 0),
-- Scourge Gryphon
(28556, 29488, 0, 609, 1, 32, 2348.74, -5694.94, 384.088, 3.66519, 360, 0, 4906, 0, 0),
(76799, 29488, 0, 609, 1, 32, 2325.4, -5659.33, 383.838, 3.90954, 360, 0, 4906, 0, 0),
-- Shadowy Tormentor
(103393,28769,0,609,1,32,1902.95,-5955.07,101.263,2.27154,180,10,2533,2041,1),
(103404,28769,0,609,1,32,1960.02,-5924.01,103.603,6.03438,180,10,2533,2041,1),
(103412,28769,0,609,1,32,1819.11,-5951.05,115.852,0.701524,180,5,2614,2117,1),
(103414,28769,0,609,1,32,1866.44,-5860.22,103.126,0.556227,180,10,2614,2117,1),
(103423,28769,0,609,1,32,1885.3,-5816.69,102.541,0.261702,180,10,2533,2041,1),
(103424,28769,0,609,1,32,1790.1,-5818.49,112.12,3.12841,180,5,2533,2041,1),
(103462,28769,0,609,1,32,1916.17,-5840.27,100.331,6.12072,180,5,2533,2041,1),
(103466,28769,0,609,1,32,1986.19,-5870.75,100.755,6.12072,180,5,2533,2041,1),
(103467,28769,0,609,1,32,1956.4,-5826.27,100.899,1.71463,180,5,2614,2117,1),
(103468,28769,0,609,1,32,2178.73,-5713.52,104.315,1.03918,180,5,2614,2117,1),
(128498,28769,0,609,1,32,2407.38,-5870.48,104.583,0.586521,180,5,2533,2041,1),

-- Acherus Deathcharger
(87007,28782,0,609,1,32,2333.14,-6003.69,56.9262,5.44503,180,10,26140,0,1),
(101589,28782,0,609,1,32,2321.17,-6131.9,6.67798,0.320285,180,10,26140,0,1),
(103239,28782,0,609,1,32,2244.18,-6149.44,2.44773,0.0768139,180,10,26140,0,1),
(103245,28782,0,609,1,32,2241.39,-6087.69,5.96331,2.16205,180,10,26140,0,1),
(103246,28782,0,609,1,32,2182.85,-6086,3.07005,1.01537,180,10,26140,0,1),
(103292,28782,0,609,1,32,2128.02,-6112.92,5.72541,3.61112,180,10,26140,0,1),
(103293,28782,0,609,1,32,2164.21,-6157.62,1.88909,1.3963,180,10,26140,0,1),
(103294,28782,0,609,1,32,1897.38,-5977.18,101.464,2.40166,180,0,26140,0,2),
(103299,28782,0,609,1,32,1964.41,-5981.98,81.3935,6.10481,180,0,26140,0,2),
(103300,28782,0,609,1,32,1776.86,-5834.88,116.695,0.381869,180,5,26140,0,1),
(103321,28782,0,609,1,32,1696.68,-5873.42,116.141,3.16371,180,5,26140,0,1),
(103322,28782,0,609,1,32,1701.76,-5932.44,121.546,0.159556,180,5,26140,0,1),
(103323,28782,0,609,1,32,1982.02,-5838.93,100.586,5.944,180,5,26140,0,1),
(103363,28782,0,609,1,32,2005.3,-5803.76,100.497,5.81834,180,5,26140,0,1),
(103470,28782,0,609,1,32,1916.27,-5804.42,100.63,6.15663,180,0,26140,0,2),
(103471,28782,0,609,1,32,2367.25,-5862.79,104.402,2.97649,180,0,26140,0,2);

-- updates
UPDATE creature_template SET SpeedWalk = 1, SpeedRun = 2 WHERE entry = 28782; -- Acherus Deathcharger - source sniff  
UPDATE creature SET position_x = 2075.854248, position_y = -5813.127441, position_z = 103.679993 WHERE guid = 128612;
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE guid IN (128608,128624);
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (128617,128623,128621,128626,128618,103471);

-- Acherus Deathcharger - waypoints
DELETE FROM creature_movement WHERE id IN (103294,103299,103470,128617,128623,128621,128626,128618,103471);
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(103294,1,1882.36,-5955.49,101.544,0,0,0,0,0,0,0,0,0,0,1.80632,0,0),(103294,2,1874.9,-5932.71,103.817,0,0,0,0,0,0,0,0,0,0,2.00659,0,0),(103294,3,1865.36,-5906.65,103.934,0,0,0,0,0,0,0,0,0,0,1.25575,0,0),
(103294,4,1867.91,-5901.32,103.717,0,0,0,0,0,0,0,0,0,0,0.770302,0,0),(103294,5,1879.87,-5895.75,103.284,0,0,0,0,0,0,0,0,0,0,0.160833,0,0),(103294,6,1907.99,-5897.99,101.861,0,0,0,0,0,0,0,0,0,0,6.15342,0,0),
(103294,7,1931.99,-5918.86,102.116,0,0,0,0,0,0,0,0,0,0,5.51333,0,0),(103294,8,1936.27,-5929.07,102.609,0,0,0,0,0,0,0,0,0,0,4.88894,0,0),(103294,9,1935.36,-5946.3,101.772,0,0,0,0,0,0,0,0,0,0,4.39022,0,0),
(103294,10,1917.75,-5980.09,100.934,0,0,0,0,0,0,0,0,0,0,3.66451,0,0),(103294,11,1909.71,-5983.55,100.937,0,0,0,0,0,0,0,0,0,0,2.77817,0,0),(103294,12,1896.84,-5976.78,101.433,0,0,0,0,0,0,0,0,0,0,2.45428,0,0),
(103299,1,2005.65,-5985.93,47.0695,0,0,0,0,0,0,0,0,0,0,6.14172,0,0),(103299,2,2025.76,-5986.97,34.9653,0,0,0,0,0,0,0,0,0,0,5.92966,0,0),(103299,3,2040.82,-5991.42,27.1636,0,0,0,0,0,0,0,0,0,0,5.74901,0,0),
(103299,4,2070.46,-6009.69,14.1364,0,0,0,0,0,0,0,0,0,0,5.60057,0,0),(103299,5,2089.86,-6031.21,10.0122,0,0,0,0,0,0,0,0,0,0,5.30605,0,0),(103299,6,2072.09,-6010.45,13.7143,0,0,0,0,0,0,0,0,0,0,2.50846,0,0),
(103299,7,2040.48,-5991.45,27.3068,0,0,0,0,0,0,0,0,0,0,2.87446,0,0),(103299,8,2022.21,-5986.12,36.6479,0,0,0,0,0,0,0,0,0,0,3.07238,0,0),(103299,9,2005.33,-5984.7,47.3562,0,0,0,0,0,0,0,0,0,0,3.06453,0,0),
(103299,10,1985.14,-5984.29,64.3585,0,0,0,0,0,0,0,0,0,0,3.15092,0,0),(103299,11,1951.75,-5980.51,93.0818,0,0,0,0,0,0,0,0,0,0,3.01348,0,0),(103299,12,1965.68,-5982.22,80.2084,0,0,0,0,0,0,0,0,0,0,6.159,0,0),
(103470,1,1933.95,-5806.67,100.245,0,0,0,0,0,0,0,0,0,0,5.99641,0,0),(103470,2,1945.86,-5813.73,100.779,0,0,0,0,0,0,0,0,0,0,5.4694,0,0),(103470,3,1961.44,-5840.48,100.637,0,0,0,0,0,0,0,0,0,0,5.18745,0,0),
(103470,4,1966.66,-5861.56,100.6,4.34237,0,0,0,0,0,0,0,0,0,0,0,0),(103470,5,1964.91,-5867.95,100.508,3.9913,0,0,0,0,0,0,0,0,0,0,0,0),(103470,6,1956.87,-5870.35,100.217,3.1093,0,0,0,0,0,0,0,0,0,0,0,0),
(103470,7,1931.44,-5850.91,100.611,2.93572,0,0,0,0,0,0,0,0,0,0,0,0),(103470,8,1896.73,-5840.75,101.032,2.79043,0,0,0,0,0,0,0,0,0,0,0,0),(103470,9,1870.92,-5827.95,100.827,2.29641,0,0,0,0,0,0,0,0,0,0,0,0),
(103470,10,1866.13,-5817.68,100.414,1.58562,0,0,0,0,0,0,0,0,0,0,0,0),(103470,11,1867.51,-5810.04,100.784,0.943974,0,0,0,0,0,0,0,0,0,0,0,0),(103470,12,1880.79,-5807.33,101.536,0.103598,0,0,0,0,0,0,0,0,0,0,0,0),
(103470,13,1917.54,-5804.33,100.47,0.0564738,0,0,0,0,0,0,0,0,0,0,0,0),(128617,1,2012.65,-5766.82,101.908,0,0,0,0,0,0,0,0,0,0,5.08146,0,0),(128617,2,2012.14,-5778.92,100.659,0,0,0,0,0,0,0,0,0,0,4.34947,0,0),
(128617,3,2005.69,-5788.39,100.538,0,0,0,0,0,0,0,0,0,0,3.81619,0,0),(128617,4,1992.83,-5796.53,100.904,0,0,0,0,0,0,0,0,0,0,3.42427,0,0),(128617,5,1977.37,-5798.82,100.965,0,0,0,0,0,0,0,0,0,0,3.22007,0,0),
(128617,6,1956.35,-5798.48,100.68,0,0,0,0,0,0,0,0,0,0,2.68207,0,0),(128617,7,1950.08,-5792.8,100.576,0,0,0,0,0,0,0,0,0,0,1.73567,0,0),(128617,8,1948,-5778.37,101.592,0,0,0,0,0,0,0,0,0,0,1.39559,0,0),
(128617,9,1955.68,-5760.57,103.729,0,0,0,0,0,0,0,0,0,0,0.997391,0,0),(128617,10,1970.85,-5748.14,100.11,0,0,0,0,0,0,0,0,0,0,0.445256,0,0),(128617,11,1983.79,-5745.21,100.716,0,0,0,0,0,0,0,0,0,0,6.25563,0,0),
(128617,12,2001.9,-5751.86,100.288,0,0,0,0,0,0,0,0,0,0,5.70193,0,0),(128623,1,2143.1,-5763.74,99.1894,0,0,0,0,0,0,0,0,0,0,0.042808,0,0),(128623,2,2158.52,-5758,100.807,0,0,0,0,0,0,0,0,0,0,0.74574,0,0),
(128623,3,2167.47,-5748.11,101.298,0,0,0,0,0,0,0,0,0,0,1.26724,0,0),(128623,4,2168.65,-5736.46,101.5,0,0,0,0,0,0,0,0,0,0,1.85001,0,0),(128623,5,2163.36,-5724.34,101.512,0,0,0,0,0,0,0,0,0,0,2.5765,0,0),
(128623,6,2146.22,-5716.27,101.323,0,0,0,0,0,0,0,0,0,0,2.97313,0,0),(128623,7,2131.05,-5717.9,100.65,0,0,0,0,0,0,0,0,0,0,3.32263,0,0),(128623,8,2118.41,-5722.32,100.284,0,0,0,0,0,0,0,0,0,0,3.66585,0,0),
(128623,9,2109.52,-5728.53,100.256,0,0,0,0,0,0,0,0,0,0,4.27375,0,0),(128623,10,2110.18,-5751.87,99.217,0,0,0,0,0,0,0,0,0,0,5.34581,0,0),(128623,11,2120.91,-5759.71,98.2946,0,0,0,0,0,0,0,0,0,0,5.88381,0,0),
(128621,1,2060.01,-5736.85,99.4104,0,0,0,0,0,0,0,0,0,0,4.19071,0,0),(128621,2,2040.93,-5742.01,98.898,0,0,0,0,0,0,0,0,0,0,4.58348,0,0),(128621,3,2040.36,-5751.12,98.3689,0,0,0,0,0,0,0,0,0,0,5.23772,0,0),
(128621,4,2048.32,-5756.86,98.2594,0,0,0,0,0,0,0,0,0,0,5.91356,0,0),(128621,5,2078.87,-5771.83,99.3538,0,0,0,0,0,0,0,0,0,0,5.89628,0,0),(128621,6,2104.07,-5773.74,98.5503,0,0,0,0,0,0,0,0,0,0,0.466729,0,0),
(128621,7,2113.36,-5765.92,98.3596,0,0,0,0,0,0,0,0,0,0,1.20721,0,0),(128621,8,2113.29,-5753.52,98.9282,0,0,0,0,0,0,0,0,0,0,1.74548,0,0),(128621,9,2100.27,-5733.9,100.305,0,0,0,0,0,0,0,0,0,0,2.53245,0,0),
(128621,10,2079.04,-5731.29,101.095,0,0,0,0,0,0,0,0,0,0,3.28643,0,0),(128626,1,2228.35,-5760.27,101.822,0,0,0,0,0,0,0,0,0,0,1.00292,0,0),(128626,2,2233.22,-5750.22,102.033,0,0,0,0,0,0,0,0,0,0,1.5692,0,0),
(128626,3,2229.94,-5742.19,102.264,0,0,0,0,0,0,0,0,0,0,2.49204,0,0),(128626,4,2222.34,-5740.54,102.381,0,0,0,0,0,0,0,0,0,0,3.51777,0,0),(128626,5,2207.17,-5751.14,102.475,0,0,0,0,0,0,0,0,0,0,3.26795,0,0),
(128626,6,2192.29,-5752.01,102.102,0,0,0,0,0,0,0,0,0,0,3.66594,0,0),(128626,7,2180.72,-5763.48,101.405,0,0,0,0,0,0,0,0,0,0,4.31232,0,0),(128626,8,2177.95,-5775.62,101.446,0,0,0,0,0,0,0,0,0,0,4.8079,0,0),
(128626,9,2183.4,-5789.55,101.215,0,0,0,0,0,0,0,0,0,0,5.437,0,0),(128626,10,2192.32,-5800.57,101.343,0,0,0,0,0,0,0,0,0,0,5.88075,0,0),(128626,11,2197.79,-5802.79,101.343,0,0,0,0,0,0,0,0,0,0,0.104141,0,0),
(128626,12,2202.69,-5798.95,101.353,0,0,0,0,0,0,0,0,0,0,1.02777,0,0),(128626,13,2205.39,-5788.79,101.428,0,0,0,0,0,0,0,0,0,0,1.17857,0,0),(128626,14,2209.36,-5781.51,101.583,0,0,0,0,0,0,0,0,0,0,0.970436,0,0),
(128618,1,2062.58,-5842.36,101.834,0,0,0,0,0,0,0,0,0,0,4.57897,0,0),(128618,2,2060.66,-5853.1,102.729,0,0,0,0,0,0,0,0,0,0,4.9638,0,0),(128618,3,2069.14,-5867.93,104.056,0,0,0,0,0,0,0,0,0,0,5.59447,0,0),
(128618,4,2081.6,-5874.41,103.633,0,0,0,0,0,0,0,0,0,0,6.16466,0,0),(128618,5,2093.99,-5876.63,103.667,0,0,0,0,0,0,0,0,0,0,0.0236323,0,0),(128618,6,2107.09,-5873.46,103.113,0,0,0,0,0,0,0,0,0,0,0.40455,0,0),
(128618,7,2138.44,-5856.49,101.382,0,0,0,0,0,0,0,0,0,0,0.834949,0,0),(128618,8,2142.65,-5850.75,101.348,0,0,0,0,0,0,0,0,0,0,1.23,0,0),(128618,9,2143.37,-5822.25,101.037,0,0,0,0,0,0,0,0,0,0,1.77193,0,0),
(128618,10,2136.56,-5806.08,99.9357,0,0,0,0,0,0,0,0,0,0,2.03504,0,0),(128618,11,2125.4,-5788.11,98.7693,0,0,0,0,0,0,0,0,0,0,1.86304,0,0),(128618,12,2119.43,-5779.51,98.2978,0,0,0,0,0,0,0,0,0,0,2.40947,0,0),
(128618,13,2112.23,-5773.94,98.2264,0,0,0,0,0,0,0,0,0,0,2.854,0,0),(128618,14,2100.67,-5772.24,98.7518,0,0,0,0,0,0,0,0,0,0,3.45797,0,0),(128618,15,2091.23,-5777.37,99.1191,0,0,0,0,0,0,0,0,0,0,4.10671,0,0),
(128618,16,2084.55,-5802,102.372,0,0,0,0,0,0,0,0,0,0,4.37453,0,0),(128618,17,2076.55,-5818.84,103.546,0,0,0,0,0,0,0,0,0,0,4.20567,0,0),(103471,1,2337.09,-5858.43,100.959,0,0,0,0,0,0,0,0,0,0,2.98435,0,0),
(103471,2,2307.45,-5851.65,100.935,0,0,0,0,0,0,0,0,0,0,2.87832,0,0),(103471,3,2278.95,-5843.84,100.935,0,0,0,0,0,0,0,0,0,0,2.76051,0,0),(103471,4,2264.71,-5835.39,100.974,0,0,0,0,0,0,0,0,0,0,2.5406,0,0),
(103471,5,2262.84,-5826.59,100.958,0,0,0,0,0,0,0,0,0,0,1.57456,0,0),(103471,6,2270.84,-5818.56,100.935,0,0,0,0,0,0,0,0,0,0,0.608518,0,0),(103471,7,2284.09,-5819.16,100.935,0,0,0,0,0,0,0,0,0,0,6.0474,0,0),
(103471,8,2298.8,-5824.22,100.987,0,0,0,0,0,0,0,0,0,0,5.79293,0,0),(103471,9,2312.55,-5839.9,100.953,0,0,0,0,0,0,0,0,0,0,5.33348,0,0),(103471,10,2325.54,-5851.61,100.935,0,0,0,0,0,0,0,0,0,0,5.76702,0,0),
(103471,11,2351.08,-5858.36,102.555,0,0,0,0,0,0,0,0,0,0,6.0851,0,0),(103471,12,2381.22,-5863.9,104.839,0,0,0,0,0,0,0,0,0,0,6.12044,0,0),(103471,13,2401.84,-5870.31,104.584,0,0,0,0,0,0,0,0,0,0,5.93587,0,0),
(103471,14,2408.96,-5872.56,104.584,0,0,0,0,0,0,0,0,0,0,0.166336,0,0),(103471,15,2414.42,-5870.57,104.674,0,0,0,0,0,0,0,0,0,0,0.800151,0,0),(103471,16,2416.9,-5865.46,104.942,0,0,0,0,0,0,0,0,0,0,1.49601,0,0),
(103471,17,2414.3,-5857.98,105.677,0,0,0,0,0,0,0,0,0,0,2.49818,0,0),(103471,18,2400.99,-5855.6,106.171,0,0,0,0,0,0,0,0,0,0,3.2396,0,0),(103471,19,2367.56,-5862.54,104.418,0,0,0,0,0,0,0,0,0,0,3.0998,0,0);
-- missing objects
-- reuse empty guids -- UDB ONLY
DELETE FROM gameobject WHERE guid IN (66116,66117,66118,66119,66120,66123,66124,66127,66129,66130,66133,66136,66137,66138,66139,66140,66141,66143,66145,66146);
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
-- Skeletal Gryphon Roost
(66116,191554,609,1,32,2348.58,-5695.34,382.24,-0.383971,0,0,-0.190808,0.981627,180,0,1),
(66117,191554,609,1,32,2325.03,-5659.6,382.24,1.71042,0,0,0.754709,0.656059,180,0,1),
-- Courge Gryphon Roost
(66118,191555,609,1,32,2348.58,-5695.34,382.24,-0.383971,0,0,-0.190808,0.981627,180,0,1),
(66119,191555,609,1,32,2325.03,-5659.6,382.24,1.71042,0,0,0.754709,0.65606,180,0,1),
-- house
(66120,191166,609,1,32,2266.77,-5799.27,97.839,-0.968655,0,0,-0.465613,0.884988,180,0,1),
-- mail box
(66123,190914,609,1,32,2113.54,-5796.06,99.7134,0.67195,-0.001297,0.00416565,0.329686,0.94408,180,0,1),
-- house
(66124,191167,609,1,32,2109.78,-5805.76,96.7227,2.25147,0,0,0.902585,0.430512,180,0,1),
(66127,191173,609,1,32,2108.63,-5888.85,99.7184,-2.67908,0,0,-0.973379,0.229201,180,0,1),
(66129,191169,609,1,32,2054.5,-5880.65,101.061,0.532327,0,0,0.263032,0.964787,180,0,1),
(66130,191171,609,1,32,1936.04,-5792.89,96.8256,0.872664,0,0,0.422618,0.906308,180,0,1),
(66133,191169,609,1,32,2054.5,-5880.65,101.061,0.532327,0,0,0.263032,0.964787,180,0,1),
-- lumber mill
(66136,191191,609,1,32,2091.49,-5680.32,100.272,2.14675,0,0,0.878817,0.47716,180,0,1),
-- stables
(66137,191178,609,1,32,2217.03,-5880.88,100.885,1.5708,0,0,0.707107,0.707107,180,0,1),
-- silos
(66138,190800,609,1,32,2051.61,-5782.35,100.826,1.12139,0,0,0.531775,0.846885,180,0,1),
-- barn
(66139,191172,609,1,32,1929.23,-5880.05,97.7314,2.36492,0,0,0.92554,0.37865,180,0,1),
-- tower
(66140,190568,609,1,32,2377.07,-6045.53,61.521,2.44346,0,0,0.939692,0.34202,180,255,1),
(66141,190789,609,1,32,2366.51,-6037.01,75.3612,2.46091,0,0,0.942641,0.333808,180,0,1),
-- aura
(66143,191206,609,1,1,2460.06,-5593.7,367.394,0.556369,0,0,0.27461,0.961556,180,255,1), -- req for phase 1 also
(66145,191206,609,1,32,2460.06,-5593.7,367.394,0.556369,0,0,0.27461,0.961556,180,255,1),
-- 66486 skopiowac
(66146,191364,609,1,32,2430.61,-5730.01,157.302,2.55552,0,0,0.957371,0.288862,180,0,0);
-- ######################
-- DM: Tribute run script
-- ######################

-- texts
SET @DB_STRING_ENTRY:=2000005822;
DELETE FROM db_script_string WHERE entry BETWEEN @DB_STRING_ENTRY AND @DB_STRING_ENTRY+1;
INSERT INTO db_script_string (entry,content_default,sound,TYPE,LANGUAGE,emote,COMMENT) VALUES
(@DB_STRING_ENTRY+0,'OH NOES! Da king is dead! Uh... hail to da new king! Yeah!',0,1,0,0,'mizzle the crafty - new king 1'),
(@DB_STRING_ENTRY+1,'Yar, he\'s dead all right. That makes you da new king... well, all of you! Gordok is yours now, boss! You should talk to me so you can learn everything there is about being da king! I was... is his assistant! Yeah, that\'s why I\'m called da crafty one!',0,0,0,0,'mizzle the crafty - new king 2');

-- movement
DELETE FROM creature_movement_template WHERE entry=14353;
INSERT INTO creature_movement_template (entry,POINT,position_x,position_y,position_z,waittime,script_id,orientation) VALUES
(14353, 1, 683.2966, 484.3845, 29.54451, 0, 1435301, 0.017),
(14353, 2, 728.9432, 483.2973, 28.18182, 0, 0, 0),
(14353, 3, 757.3987, 482.5078, 28.17787, 0, 0, 0),
(14353, 4, 768.0496, 482.5014, 29.54162, 0, 0, 0),
(14353, 5, 778.0708, 482.7376, 34.93199, 0, 0, 0),
(14353, 6, 784.5805, 481.7013, 37.19804, 0, 0, 0),
(14353, 7, 816.5302, 482.3017, 37.31819, 1000, 1435307, 3.159),
(14353, 8, 816.5302, 482.3017, 37.31819, 1000, 1435308, 3.159);

-- movement script
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1435301,1435307,1435308);
INSERT INTO dbscripts_on_creature_movement (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(1435301,1,0,0,0,0,0,0,@DB_STRING_ENTRY+0,'Mizzle - say new king 1'),
(1435307,0,32,1,0,0,0,0,0,'Mizzle - pause WP Movement'),
(1435307,0,0,0,0,0,0,0,@DB_STRING_ENTRY+1,'Mizzle - say new king 2'),
(1435308,0,32,1,0,0,0,0,0,'Mizzle - pause WP Movement'),
(1435308,0,9,35834,3600,0,0,0,0,'Mizzle - spawn tribute chest');

-- gossip conditions
SET @DB_CONDITION:=976;
DELETE FROM conditions WHERE condition_entry BETWEEN @DB_CONDITION+0 AND @DB_CONDITION+3;
INSERT INTO conditions VALUES
(@DB_CONDITION+0,1,22799,0), -- has King of Gortok aura
(@DB_CONDITION+1,-3,@DB_CONDITION+0,0), -- has not King of Gortok aura
(@DB_CONDITION+2,33,7,0), -- has WP == 7
(@DB_CONDITION+3,-1,@DB_CONDITION+0,@DB_CONDITION+2); -- has WP == 7 and has King of Gortok aura

-- gossip
UPDATE gossip_menu SET condition_id=@DB_CONDITION+1 WHERE entry=5708 AND text_id=6876;
UPDATE gossip_menu SET condition_id=@DB_CONDITION+3 WHERE entry=5708 AND text_id=6895;
UPDATE gossip_menu_option SET condition_id=@DB_CONDITION+1, action_script_id=570801 WHERE menu_id=5708 AND id=0;
UPDATE gossip_menu_option SET condition_id=@DB_CONDITION+3 WHERE menu_id=5708 AND id=1;
UPDATE gossip_menu_option SET action_script_id=574001 WHERE menu_id=5740;

-- gossip scripts
DELETE FROM dbscripts_on_gossip WHERE id IN (570801,574001);
INSERT INTO dbscripts_on_gossip (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(570801,0,15,22799,0,0,0,0,0,'Mizzle - cast King of the Gordok'),
(574001,0,32,0,0,0,0,0,0,'Mizzle - resume WP Movement');



-- Misc updates

-- link last 2 bosses
DELETE FROM creature_linking_template WHERE entry=14324;
INSERT INTO creature_linking_template VALUES
(14324,429,11501,3,0);

-- Delete Mizzle duplicate (summoned)
DELETE FROM creature WHERE guid=125640;
-- Tribute chest is despawned
UPDATE gameobject SET spawntimesecs=-7200 WHERE guid=35834;
-- Doors flags (thanks to Schmoozerd)
UPDATE gameobject_template SET flags=34 WHERE entry IN (177217,177219);
-- Creatures factions fix
UPDATE creature_template SET FactionAlliance=45, FactionHorde=45 WHERE entry IN (14326,14321,14323);



-- Broken Trap quest (partially complete - requires more research and investigation)
-- spell script target
DELETE FROM spell_script_target WHERE entry=5249;
INSERT INTO spell_script_target VALUES
(5249,1,14323,0);
-- ToDo: script spell 5249 to freeze npc 14323 and despawn the traps

-- Fixed trap GO spawn
DELETE FROM gameobject WHERE guid=121926;
INSERT INTO gameobject (guid,id,map,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state) VALUES
(121926, 179512, 429, 1, 1, 558.652, 550.057, -25.4008, 0, 0, 0, -0.771625, 0.636078, -7200, 255, 1);
-- ToDo: fix GO data (faction and radius)

-- Broken trap script
UPDATE quest_template SET CompleteScript=1193 WHERE entry=1193;
DELETE FROM dbscripts_on_quest_end WHERE id IN (1193);
INSERT INTO dbscripts_on_quest_end (id,delay,command,datalong,datalong2,buddy_entry,search_radius,data_flags,dataint,comments) VALUES
(1193,0,9,121926,3600,0,0,0,0,'spawn Fixed trap');
-- ToDo: this part might require updates (such as despawn the Quest provider GO)
-- Linking for Ambassador Flamelash
DELETE FROM creature_linking_template WHERE entry=9178;
INSERT INTO creature_linking_template VALUES
(9178,230,9156,4112,0);
-- quest 6041
-- script targets (eff0 for creature, eff2 for go)
DELETE FROM spell_script_target WHERE entry=19250;
INSERT INTO spell_script_target VALUES
(19250,0,177668,1),
(19250,1,12247,4);
-- quest kill credit script (only starts for eff0)
DELETE FROM dbscripts_on_spell WHERE id IN (19250);
INSERT INTO dbscripts_on_spell (id,delay,command,datalong,data_flags,comments) VALUES
(19250,0,8,0,0,'kill credit'),
(19250,0,18,0,0,'despawn target');
-- Eye of Acherus - missing aura 
DELETE FROM creature_template_addon WHERE entry = 28511;
INSERT INTO creature_template_addon VALUES (28511,0,0,1,1,0,0,'51890 51892');
-- Shadowmoon Valley - zone entrance event
-- Bonechewer Messenger - (Shadowmoon Valley)
UPDATE creature SET position_x = -2977.49, position_y = 3384.37, position_z = -2.32643, orientation = 6.0012 WHERE guid = 140651;
-- Bonechewer Marauder 
UPDATE creature SET position_x = -2973.17, position_y = 3382.29, position_z = -2.8634, orientation = 5.85669 WHERE guid = 140647;
UPDATE creature SET position_x = -2977.81, position_y = 3381.37, position_z = -2.6299, orientation = 5.84049 WHERE guid = 140648;
UPDATE creature SET position_x = -2975.02, position_y = 3386.34, position_z = -2.31233, orientation = 5.80829 WHERE guid = 140649;
UPDATE creature SET position_x = -2978.72, position_y = 3385, position_z = -2.12195, orientation = 5.86094 WHERE guid = 140650;
DELETE FROM creature_movement WHERE id = 140651;
INSERT INTO creature_movement (id, POINT, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(140651,1,-2937.67,3368.64,-2.94686,1000,2124401,5.82874,0,0),
(140651,2,-2908.6,3352.87,-8.9373,0,0,5.94419,0,0),
(140651,3,-2870.56,3334.28,-14.6119,0,0,6.1264,0,0),
(140651,4,-2838.55,3328.12,-17.8089,0,0,6.09498,0,0),
(140651,5,-2799.63,3325.48,-13.6239,0,0,6.27169,0,0),
(140651,6,-2774.5,3325.19,-6.52773,0,0,6.06121,0,0),
(140651,7,-2759.81,3318.71,-1.21886,0,0,5.58369,0,0),
(140651,8,-2753.67,3300.73,0.404458,0,0,4.51555,0,0),
(140651,9,-2762.81,3287.77,1.64481,2000,2124402,3.84012,0,0),
(140651,10,-2799.17,3251.58,5.24811,0,0,3.98149,0,0),
(140651,11,-2817.62,3230.52,10.9412,0,0,3.9972,0,0),
(140651,12,-2836.91,3208.31,5.78583,0,0,3.9972,0,0),
(140651,13,-2858.83,3186.2,9.36214,0,0,3.89509,0,0),
(140651,14,-2893.35,3135.73,23.5054,0,0,3.88095,0,0),
(140651,15,-2912.03,3112.6,30.9569,0,0,4.43668,0,0),
(140651,16,-2916.88,3088.77,37.5773,0,0,4.8333,0,0),
(140651,17,-2909.69,3051.5,46.2469,0,0,4.72335,0,0),
(140651,18,-2912.2,3036.69,49.4472,0,0,4.27174,0,0),
(140651,19,-2920.07,3026.1,53.028,0,0,3.77145,0,0),
(140651,20,-2947.36,3005.48,63.1732,0,0,3.73658,0,0),
(140651,21,-2979.29,2986.76,74.036,5000,2124403,3.77507,0,0),
(140651,22,-3000.95,2972.91,80.7834,0,0,3.89288,0,0),
(140651,23,-3014.11,2962.72,84.2728,0,0,3.93293,0,0),
(140651,24,-3034.623291,2937.464600,86.423225,10000,2124404,4.975207,0,0),
(140651,25,-2998.161377,2973.201904,80.465218,0,0,3.880181,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id BETWEEN 2124401 AND 2124404; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(2124401,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(2124402,1,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2124403,1,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(2124404,3,0,0,0,0,0,0,2000005765,0,0,0,0,0,0,0,''),
(2124404,5,10,21249,20000,0,0,0,0,0,0,0,-3040.230713,2923.361572,86.667702,0.959264,'summon - Wrathstalker'),
(2124404,5,10,21249,20000,0,0,0,0,0,0,0,-3049.942139,2944.359863,91.529282,6.221430,'summon - Wrathstalker'),
(2124404,5,10,21249,20000,0,0,0,0,0,0,0,-3018.137207,2925.356201,90.870773,1.300909,'summon - Wrathstalker'),
(2124404,5,10,21249,20000,0,0,0,0,0,0,0,-3047.662842,2927.633301,86.636345,0.723925,'summon - Wrathstalker');
DELETE FROM dbscripts_on_creature_death WHERE id = 21244;
INSERT INTO dbscripts_on_creature_death (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(21244,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');
-- Bonechewer Marauder linked to Bonechewer Messenger
DELETE FROM creature_linking WHERE guid IN (140647, 140648, 140649, 140650);
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(140647, 140651, 643),
(140648, 140651, 643),
(140649, 140651, 643),
(140650, 140651, 643);
-- duplicates Removed
DELETE FROM creature WHERE guid IN (74476,74477,74478,74479);
DELETE FROM creature_addon WHERE guid IN (74476,74477,74478,74479);
DELETE FROM creature_movement WHERE id IN (74476,74477,74478,74479);
DELETE FROM game_event_creature WHERE guid IN (74476,74477,74478,74479);
DELETE FROM game_event_creature_data WHERE guid IN (74476,74477,74478,74479);
DELETE FROM creature_battleground WHERE guid IN (74476,74477,74478,74479);
DELETE FROM creature_linking WHERE guid IN (74476,74477,74478,74479) OR master_guid IN (74476,74477,74478,74479);
-- Ulduar - despawn Sanity Well on wipe / complete
DELETE FROM creature_linking_template WHERE entry=33991;
INSERT INTO creature_linking_template VALUES
(33991,603,33280,8192,0);
-- Ulduar - despawn immortal guardiand on complete
UPDATE creature_linking_template SET flag=flag|16 WHERE entry=33988 AND master_entry=33288;
-- Kirtonos the Herald
UPDATE creature_template SET MovementType = 2 WHERE entry = 10506;
DELETE FROM creature_movement_template WHERE entry = 10506;
INSERT INTO creature_movement_template (entry, POINT, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(10506,1,309.156,93.3245,101.662,0,0,3.17265,0,0),
(10506,2,299.559,93.255,105.634,10000,1050601,3.17972,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1050601; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, X, Y, z, o, comments) VALUES
(1050601,1,20,0,0,0,0,0,0,0,0,0,0,0,0,0,'movement chenged to 0:idle'),
(1050601,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0.1,''),
(1050601,3,22,233,0x01 | 0x10 | 0x20,0,0,0,0,0,0,0,0,0,0,0,'temp faction');
-- Fix movement for spawned creatures
UPDATE creature_template SET MovementType=0 WHERE entry IN (7349,7351,7355);
