--
-- Copyright (C) 2005-2020 MaNGOS <http://getmangos.eu/>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
--

UPDATE gameobject SET state = 0 WHERE id IN (SELECT entry FROM gameobject_template WHERE type = 0 AND data0 = 1);
UPDATE creature_template SET unit_flags=unit_flags&~2048 WHERE unit_flags&2048=2048;
UPDATE creature_template SET unit_flags=unit_flags&~524288 WHERE unit_flags&524288=524288;
UPDATE creature_template SET unit_flags=unit_flags&~67108864 WHERE unit_flags&67108864=67108864;
UPDATE creature_template SET unit_flags=unit_flags&~8388608 WHERE unit_flags&8388608=8388608;
UPDATE creature, creature_template SET creature.curhealth=creature_template.minhealth,creature.curmana=creature_template.minmana WHERE creature.id=creature_template.entry and creature_template.RegenHealth = '1';
UPDATE creature_template SET dynamicflags = dynamicflags &~ 223;
UPDATE creature_template SET npcflag = npcflag&~16777216; -- UNIT_NPC_FLAG_SPELLCLICK
UPDATE creature_template SET modelid_2 = 0 WHERE modelid_1 = modelid_2;
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
DELETE FROM dbscripts_on_go_use WHERE id NOT IN (SELECT guid FROM gameobject);
DELETE FROM dbscripts_on_go_use WHERE command IN (11, 12) AND datalong!=0 AND datalong NOT IN (SELECT guid FROM gameobject);
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