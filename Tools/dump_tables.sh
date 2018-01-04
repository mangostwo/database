#!/bin/bash

# if this does not run in Linux, then run the removeCR.sh file - edit its script with the name of this file

USERNAME=
PASSWORD=
DDUMPDIR=./mangos


###################################################################################

i=1


do_dump_two() {

mkdir -p ${DUMPDIR}

for TABLE in \
achievement_criteria_requirement \
achievement_reward \
areatrigger_involvedrelation \
areatrigger_tavern \
areatrigger_teleport \
battleground_events \
battleground_template \
battlemaster_entry \
command \
conditions \
creature \
creature_addon \
creature_ai_scripts \
creature_ai_summons \
creature_ai_texts \
creature_battleground \
creature_equip_template \
creature_involvedrelation \
creature_linking \
creature_linking_template \
creature_loot_template \
creature_model_info \
creature_model_race \
creature_movement \
creature_movement_template \
creature_onkill_reputation \
creature_questrelation \
creature_template \
creature_template_addon \
creature_template_classlevelstats \
creature_template_spells \
custom_texts \
db_script_string \
db_scripts \
db_version \
disenchant_loot_template \
dungeonfinder_item_rewards \
dungeonfinder_rewards \
exploration_basexp \
dungeonfinder_requirements \
fishing_loot_template \
game_event \
game_event_creature \
game_event_creature_data \
game_event_gameobject \
game_event_mail \
game_event_quest \
game_graveyard_zone \
game_tele \
game_weather \
gameobject \
gameobject_battleground \
gameobject_involvedrelation \
gameobject_loot_template \
gameobject_questrelation \
gameobject_template \
gossip_menu \
gossip_menu_option \
gossip_texts \
instance_encounters \
instance_template \
item_convert \
item_enchantment_template \
item_expire_convert \
item_loot_template \
item_required_target \
item_template \
locales_achievement_reward \
locales_creature \
locales_gameobject \
locales_gossip_menu_option \
locales_item \
locales_npc_text \
locales_page_text \
locales_points_of_interest \
locales_quest \
mail_level_reward \
mail_loot_template \
mangos_string \
milling_loot_template \
npc_gossip \
npc_spellclick_spells \
npc_text \
npc_trainer \
npc_trainer_template \
npc_vendor \
npc_vendor_template \
page_text \
pet_levelstats \
pet_name_generation \
pickpocketing_loot_template \
player_classlevelstats \
player_levelstats \
player_xp_for_level \
playercreateinfo \
playercreateinfo_action \
playercreateinfo_item \
playercreateinfo_spell \
points_of_interest \
pool_creature \
pool_creature_template \
pool_gameobject \
pool_gameobject_template \
pool_pool \
pool_template \
prospecting_loot_template \
quest_poi \
quest_poi_points \
quest_template \
reference_loot_template \
reputation_reward_rate \
reputation_spillover_template \
reserved_name \
script_binding \
script_texts \
script_waypoint \
skill_discovery_template \
skill_extra_item_template \
skill_fishing_base_level \
skinning_loot_template \
spell_area \
spell_bonus_data \
spell_chain \
spell_elixir \
spell_learn_spell \
spell_loot_template \
spell_pet_auras \
spell_proc_event \
spell_proc_item_enchant \
spell_script_target \
spell_target_position \
spell_template \
spell_threat \
transports \
vehicle_accessory \
warden_build_specific \
warden_checks \
; do

echo "Dumping ${i}/139 ${TABLE}..."

echo "--
-- Copyright (C) 2005-2017 MaNGOS <http://getmangos.eu/>
-- Copyright (C) 2009-2017 MaNGOSTwo <https://github.com/mangostwo>
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
" > ${DUMPDIR}/${TABLE}.sql

mysqldump -Q -c -e -q -u${USERNAME} -p${PASSWORD} $DB ${TABLE} \
  | sed "s/VALUES /VALUES\n/g" \
  | sed "s/),(/),\n(/g" \
  | grep -v "Dump completed" \
  | sed -e "1d;2d;3d;4d;5d;6d" \
>> ${DUMPDIR}/${TABLE}.sql

let i=i+1

done

}

if [ -z $1 ] ; then
  echo "Usage: $0 [Database] {Dumpdir} "
  exit 1
fi

if [ -z $2 ] ; then
  DUMPDIR=$DDUMPDIR
else
  DUMPDIR=$2
fi

if [ -z $USERNAME ] ; then
  echo -n "User: "
  read USERNAME
fi

if [ -z $PASSWORD ] ; then

echo -n "Password: "

stty -echo
read PASSWORD
stty echo
echo ""
fi


DB=$1

do_dump_two
