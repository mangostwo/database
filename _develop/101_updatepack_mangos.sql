--
-- Copyright (C) 2005-2013 MaNGOS <http://getmangos.com/>
-- Copyright (C) 2009-2013 MaNGOSTwo <https://github.com/mangostwo>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

-- Fix Server Startup Errors
DELETE FROM `creature_addon` WHERE auras IN (46598, 43671, 50628, 52349);
DELETE FROM `creature_template_addon` WHERE auras IN (46598, 43671, 50628);

-- Add datas for vehicle_accessory table. Thanks YTDB
DELETE FROM `vehicle_accessory` WHERE vehicle_entry IN (27241,27626,27661,28018,28054,28312,28614,29555,29625,29698,29931,30330,32189,32627,32633,32633,32640,32640,32930,32930,33060,33109,33109,33109,33113,33113,33113,33114,33114,33214,33669,33687,33687,33687,33778,34658,34776,34776,34776,35069,35069,35069,35633,35634,35635,35636,35637,35638,35640,35641,35768,36476,36661,36678,36678,36891,28782,32823,32823,32823,32823,32823,32823,32823,32830,32830,32830,32830,32830,32840,32840,32840,32840,32840,27213,24083);
INSERT INTO `vehicle_accessory` (`vehicle_entry`, `seat`, `accessory_entry`, `comment`) VALUES
('27241','0','27268','Risen Gryphon'),
('27626','0','27627','Tatjana\'s Horse'),
('27661','0','27662','Wintergarde Gryphon'),
('28018','0','28006','Thiassi the Light Bringer'),
('28054','0','28053','Lucky Wilhelm - Apple'),
('28312','7','28319','Wintergrasp Siege Engine'),
('28614','0','28616','Scarlet Gryphon Rider'),
('29555','0','29556','Goblin Sapper'),
('29625','0','29694','Hyldsmeet Proto-Drake'),
('29698','0','29699','Drakuru Raptor'),
('29931','0','29982','Drakkari Rider on Drakkari Rhino'),
('30330','0','30332','Jotunheim Proto-Drake'),
('32189','0','32190','Skybreaker Recon Fighter'),
('32627','7','32629','Wintergrasp Siege Engine'),
('32633','1','32638','Traveler Mammoth (A) - Vendor'),
('32633','2','32639','Traveler Mammoth (A) - Vendor & Repairer'),
('32640','1','32642','Traveler Mammoth (H) - Vendor'),
('32640','2','32641','Traveler Mammoth (H) - Vendor & Repairer'),
('32930','0','32933','Kologarn'),
('32930','1','32934','Kologarn'),
('33060','7','33067','Salvaged Siege Engine'),
('33109','1','33167','Salvaged Demolisher'),
('33109','2','33620','Salvaged Demolisher'),
('33109','3','33167','Salvaged Demolisher'),
('33113','2','33114','Flame Leviathan'),
('33113','3','33114','Flame Leviathan'),
('33113','7','33139','Flame Leviathan'),
('33114','1','33142','Overload Control Device'),
('33114','2','33143','Leviathan Defense Turret'),
('33214','1','33218','Mechanolift 304-A'),
('33669','0','33666','Demolisher Engineer Blastwrench'),
('33687','0','33695','Chillmaw'),
('33687','1','33695','Chillmaw'),
('33687','2','33695','Chillmaw'),
('33778','0','33780','Tournament Hippogryph'),
('34658','0','34657','Jaelyne Evensong\'s Mount'),
('34776','7','34777','Isle of Conquest Siege Engine  - main turret (ally)'),
('34776','1','36356','Isle of Conquest Siege Engine  - flame turret 1 (ally)'),
('34776','2','36356','Isle of Conquest Siege Engine  - flame turret 2 (ally)'),
('35069','7','36355','Isle of Conquest Siege Engine - main turret (horde)'),
('35069','1','34778','Isle of Conquest Siege Engine - flame turret 1 (horde)'),
('35069','2','34778','Isle of Conquest Siege Engine - flame turret 2 (horde)'),
('35633','0','34702','Ambrose Boltspark\'s Mount'),
('35634','0','35617','Deathstalker Visceri\'s Mount'),
('35635','0','35569','Eressea Dawnsinger\'s Mount'),
('35636','0','34703','Lana Stouthammer\'s Mount'),
('35637','0','34705','Marshal Jacob Alerius\' Mount'),
('35638','0','35572','Mokra the Skullcrusher\'s Mount'),
('35640','0','35571','Runok Wildmane\'s Mount'),
('35641','0','35570','Zul\'tore\'s Mount'),
('35768','0','34701','Colosos\' Mount'),
('36476','0','36477','Krick and Ick'),
('36661','0','36658','Scourgelord Tyrannus and Rimefang'),
('36678','0','38309','Professor Putricide - trigger'),
('36678','1','38308','Professor Putricide - trigger'),
('36891','0','31260','Ymirjar Skycaller'),
('28782','0','28768','Acherus Deathcharger - Dark Rider of Acherus'),
('32823','0','34812','Bountiful Table - The Turkey Chair'),
('32823','1','34823','Bountiful Table - The Cranberry Chair'),
('32823','2','34819','Bountiful Table - The Stuffing Chair'),
('32823','3','34824','Bountiful Table - The Sweet Potato Chair'),
('32823','4','34822','Bountiful Table - The Pie Chair'),
('32823','5','32830','Bountiful Table - Food Holder'),
('32823','6','32840','Bountiful Table - Plate Holder'),
('32830','0','32824','Food Holder - [PH] Pilgrim\'s Bounty Table - Turkey'),
('32830','1','32827','Food Holder - [PH] Pilgrim\'s Bounty Table - Cranberry Sauce'),
('32830','2','32831','Food Holder - [PH] Pilgrim\'s Bounty Table - Stuffing'),
('32830','3','32825','Food Holder - [PH] Pilgrim\'s Bounty Table - Yams'),
('32830','4','32829','Food Holder - [PH] Pilgrim\'s Bounty Table - Pie'),
('32840','0','32839','Plate Holder - Sturdy Plate'),
('32840','1','32839','Plate Holder - Sturdy Plate'),
('32840','2','32839','Plate Holder - Sturdy Plate'),
('32840','3','32839','Plate Holder - Sturdy Plate'),
('32840','4','32839','Plate Holder - Sturdy Plate'),
('27213','0','27206','Onslaught Warhorse - Onslaught Knight'),
('24083','0','24849','Proto Drake Rider mounted to Enslaved Proto Drake');

-- Add some new npc_spellclick_spells datas
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (24418,24418,25743,26191,27587,27714,27850,27881,28094,28312,28319,28606,28607,28670,28782,28833,29563,29708,30123,30236,30272,30500,32627,32629,32633,32640,32788,33842,33842,33842,33843,33843,33843,24083,26523,34125,32370,40176,39715,39716,39717,33842,33799,33799,33799,33796,33796,33796,33792,33792,33792,33798,33798,33798,33791,33791,33791,33843,33794,33794,33794,33800,33800,33800,33793,33793,33793,33795,33795,33795,33790,33790,33790,37945,38430,4125,34125,34125,34125,34125,34125,34125,34125,34125,34125,34125,34125,34125,27626,28710);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`) VALUES
('24418','43768','11390','1','11390','1'),
('24418','43768','11391','1','11391','1'),
('25743','46260','11879','1','11879','1'),
('26191','46978','11956','1','11956','1'),
('27587','49078','12326','1','12326','1'),
('27714','49584','12457','1','12457','1'),
('27850','60968','0','0','0','3'),
('27881','60968','0','0','0','1'),
('28094','60968','0','0','0','1'),
('28312','60968','0','0','0','1'),
('28319','60968','0','0','0','1'),
('28605','52263','12680','1','12680','1'),
('28606','52263','12680','1','12680','1'),
('28607','52263','12680','1','12680','1'),
('28670','52196','0','0','0','0'),
('28782','52349','0','0','0','2'),
('28833','52447','12701','1','12701','1'),
('28887','52447','12701','1','12701','1'),
('29563','56795','12983','1','12983','1'),
('29708','55028','12856','1','12856','1'),
('30123','55957','12967','1','12967','1'),
('30236','57573','0','0','0','1'),
('30272','61286','13071','1','13071','2'),
('30500','56679','13045','1','13045','1'),
('32627','60968','0','0','0','1'),
('32629','60968','0','0','0','1'),
('32633','61424','0','0','0','0'),
('32640','61424','0','0','0','0'),
('32788','57539','0','0','0','1'),
('33842','63791','13839','1','0','3'),
('33842','63791','13838','1','0','3'),
('33842','63791','13829','1','0','3'),
('33843','63792','13837','1','0','3'),
('33843','63792','13835','1','0','3'),
('33843','63792','13828','1','0','3'),
('24083','55074','0','0','0','1'),
('26523','48296','12218','1','12218','1'),
('34125','63215','13847','1','13847','1'),
('32370','59724','13305','1','13305','1'),
('40176','74904','25444','1','25444','1'),
('39715','74204','25285','1','25285','1'),
('39716','74203','25289','1','25289','1'),
('39717','74205','25295','1','25295','1'),
('33842','63791','13668','1','13680','1'),
('33799','62783','13726','0','0','1'),
('33799','62783','13691','0','0','1'),
('33799','62783','13707','0','0','1'),
('33796','62784','13727','0','0','1'),
('33796','62784','13693','0','0','1'),
('33796','62784','13708','0','0','1'),
('33792','62785','13728','0','0','1'),
('33792','62785','13694','0','0','1'),
('33792','62785','13709','0','0','1'),
('33798','62787','13729','0','0','1'),
('33798','62787','13695','0','0','1'),
('33798','62787','13710','0','0','1'),
('33791','62786','13731','0','0','1'),
('33791','62786','13696','0','0','1'),
('33791','62786','13711','0','0','1'),
('33843','63792','13667','1','13679','1'),
('33794','62782','13725','0','0','1'),
('33794','62782','13689','0','0','1'),
('33794','62782','13706','0','0','1'),
('33800','62774','13699','0','0','1'),
('33800','62774','13593','0','0','1'),
('33800','62774','13684','0','0','1'),
('33793','62780','13723','0','0','1'),
('33793','62780','13688','0','0','1'),
('33793','62780','13704','0','0','1'),
('33795','62779','13713','0','0','1'),
('33795','62779','13685','0','0','1'),
('33795','62779','13703','0','0','1'),
('33790','62781','13724','0','0','1'),
('33790','62781','13690','0','0','1'),
('33790','62781','13705','0','0','1'),
('37945','70766','0','0','0','3'),
('38430','70766','0','0','0','3'),
('34125','63215','13851','1','13851','1'),
('34125','63215','13852','1','13852','1'),
('34125','63215','13854','1','13854','1'),
('34125','63215','13855','1','13855','1'),
('34125','63215','13856','1','13856','1'),
('34125','63215','13857','1','13857','1'),
('34125','63215','13858','1','13858','1'),
('34125','63215','13859','1','13859','1'),
('34125','63215','13860','1','13860','1'),
('34125','63215','13861','1','13861','1'),
('34125','63215','13862','1','13862','1'),
('34125','63215','13863','1','13863','1'),
('34125','63215','13864','1','13864','1'),
('27626','49138','0','0','0','1'),
('28710','46598','0','0','0','1');

-- Cleanup
UPDATE gameobject SET state = 0 WHERE id IN (SELECT entry FROM gameobject_template WHERE type = 0 AND data0 = 1);
UPDATE creature_template SET unit_flags=unit_flags&~2048 WHERE unit_flags&2048=2048;
UPDATE creature_template SET unit_flags=unit_flags&~524288 WHERE unit_flags&524288=524288;
UPDATE creature_template SET unit_flags=unit_flags&~67108864 WHERE unit_flags&67108864=67108864;
UPDATE creature_template SET unit_flags=unit_flags&~8388608 WHERE unit_flags&8388608=8388608;
UPDATE creature, creature_template SET creature.curhealth=creature_template.minhealth,creature.curmana=creature_template.minmana WHERE creature.id=creature_template.entry and creature_template.RegenHealth = '1';
UPDATE creature_template SET dynamicflags = dynamicflags &~ 223;
UPDATE creature_template SET npcflag = npcflag&~16777216; -- UNIT_NPC_FLAG_SPELLCLICK
UPDATE creature_template c1, creature_template c2 SET c2.unit_class=c1.unit_class, c2.npcflag=c1.npcflag, c2.faction_A=c1.faction_A, c2.faction_H=c1.faction_H, c2.speed_walk=c1.speed_walk, c2.speed_run=c1.speed_run, c2.scale=c1.scale, c2.InhabitType=c1.InhabitType, c2.MovementType=c1.MovementType, c2.unit_flags=c1.unit_flags WHERE c2.entry=c1.difficulty_entry_1;
UPDATE creature_template c1, creature_template c2 SET c2.unit_class=c1.unit_class, c2.npcflag=c1.npcflag, c2.faction_A=c1.faction_A, c2.faction_H=c1.faction_H, c2.speed_walk=c1.speed_walk, c2.speed_run=c1.speed_run, c2.scale=c1.scale, c2.InhabitType=c1.InhabitType, c2.MovementType=c1.MovementType, c2.unit_flags=c1.unit_flags WHERE c2.entry=c1.difficulty_entry_2;
UPDATE creature_template c1, creature_template c2 SET c2.unit_class=c1.unit_class, c2.npcflag=c1.npcflag, c2.faction_A=c1.faction_A, c2.faction_H=c1.faction_H, c2.speed_walk=c1.speed_walk, c2.speed_run=c1.speed_run, c2.scale=c1.scale, c2.InhabitType=c1.InhabitType, c2.MovementType=c1.MovementType, c2.unit_flags=c1.unit_flags WHERE c2.entry=c1.difficulty_entry_3;
-- UPDATE gameobject_template SET flags=flags&~4 WHERE type IN (2,19,17);
UPDATE creature SET MovementType = 0 WHERE spawndist = 0 AND MovementType=1;
UPDATE creature SET spawndist=0 WHERE MovementType=0;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE QuestFlags=QuestFlags|4096;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE QuestFlags=QuestFlags|32768;
DELETE FROM go,gt USING gameobject go LEFT JOIN gameobject_template gt ON go.id=gt.entry WHERE gt.entry IS NULL;
DELETE FROM gi,gt USING gameobject_involvedrelation gi LEFT JOIN gameobject_template gt ON gi.id=gt.entry WHERE gt.entry IS NULL;
DELETE FROM gqr,gt USING gameobject_questrelation gqr LEFT JOIN gameobject_template gt ON gqr.id=gt.entry WHERE gt.entry IS NULL;
DELETE FROM ge,go USING game_event_gameobject ge LEFT JOIN gameobject go ON ge.guid=go.guid WHERE go.guid IS NULL;
DELETE FROM gameobject_scripts WHERE id NOT IN (SELECT guid FROM gameobject);
DELETE FROM gameobject_scripts WHERE command IN (11, 12) AND datalong!=0 AND datalong NOT IN (SELECT guid FROM gameobject);
DELETE FROM gameobject_battleground WHERE guid NOT IN (SELECT guid FROM gameobject);
DELETE FROM creature_battleground WHERE guid NOT IN (SELECT guid FROM creature);
DELETE FROM creature_addon WHERE guid NOT IN (SELECT guid FROM creature);
UPDATE creature_addon SET moveflags=moveflags &~ 0x00000100; -- SPLINEFLAG_DONE
UPDATE creature_addon SET moveflags=moveflags &~ 0x00000200; -- SPLINEFLAG_FALLING
UPDATE creature_addon SET moveflags=moveflags &~ 0x00000800; -- SPLINEFLAG_TRAJECTORY (can crash client)
UPDATE creature_addon SET moveflags=moveflags &~ 0x00200000; -- SPLINEFLAG_UNKNOWN3 (can crash client)
UPDATE creature_addon SET moveflags=moveflags &~ 0x08000000;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000100;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000200;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000800;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00200000;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x08000000;
DELETE FROM npc_gossip WHERE npc_guid NOT IN (SELECT guid FROM creature);
DELETE FROM creature_movement WHERE id NOT IN (SELECT guid FROM creature);
DELETE FROM game_event_creature WHERE guid NOT IN (SELECT guid FROM creature);
DELETE FROM creature_questrelation WHERE id NOT IN (SELECT entry FROM creature_template);
DELETE FROM creature_onkill_reputation WHERE creature_id NOT IN (SELECT entry FROM creature_template);
UPDATE creature_template SET npcflag=npcflag|2 WHERE entry IN (SELECT id FROM creature_questrelation UNION SELECT id FROM creature_involvedrelation);

--UPDATE Database Version
UPDATE db_version set version = 'TwoDatabase 1.0.1 for MaNGOSTwo XXXXX+ and ScriptDev2 CXXXX+';
