-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '12'; 
    SET @cOldContent = '001';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '12';
    SET @cNewContent = '002';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'The_big_Command_help_syncup';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'The_big_Command_help_syncup';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
		
-- M2
delete from `command` where `id` in (16,34,41,42,43,44,45,46,48,49,50,51,52,53,54,55,67,78,90,91,92,93,94,99,104,105,106,108,110,114,115);
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('16','additem','3','Syntax: .additem #itemid/[#itemname]/#shift-click-item-link #itemcount\r\n\r\nAdds the specified number of items of id #itemid (or exact (!) name $itemname in brackets, or link created by shift-click at item in inventory or recipe) to your or selected character inventory. If #itemcount is omitted, only one item will be added.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('34','appear','1','Syntax: .appear [$charactername]\r\n\r\nTeleport to the given character. Either specify the character name or click on the character\'s portrait, e.g. when you are in a group. Character can be offline.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('41','ban account','3','Syntax: .ban account $Name $bantime $reason\r\n\r\nBan account kick player.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('42','ban character','3','Syntax: .ban character $Name $bantime $reason\r\n\r\nBan account and kick player.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('43','ban ip','3','Syntax: .ban ip $Ip $bantime $reason\r\n\r\nBan IP.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('44','baninfo account','3','Syntax: .baninfo account $accountid\r\n\r\nWatch full information about a specific ban.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('45','baninfo character','3','Syntax: .baninfo character $charactername\r\n\r\nWatch full information about a specific ban.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('46','baninfo ip','3','Syntax: .baninfo ip $ip\r\n\r\nWatch full information about a specific ban.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('48','banlist account','3','Syntax: .banlist account [$Name]\r\n\r\nSearches the banlist for a account name pattern or show full list account bans.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('49','banlist character','3','Syntax: .banlist character $Name\r\n\r\nSearches the banlist for a character name pattern. Pattern required.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('50','banlist ip','3','Syntax: .banlist ip [$Ip]\r\n\r\nSearches the banlist for a IP pattern or show full list of IP bans.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('51','cast','3','Syntax: .cast #spellid [triggered]\r\n\r\nCast #spellid to selected target. If no target selected cast to self. If \'trigered\' or part provided then spell casted with triggered flag.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('52','cast back','3','Syntax: .cast back #spellid [triggered]\r\n\r\nSelected target will cast #spellid to your character. If \'trigered\' or part provided then spell casted with triggered flag.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('53','cast dist','3','Syntax: .cast dist #spellid [#dist [triggered]]\r\n\r\nYou will cast spell to pint at distance #dist. If \'trigered\' or part provided then spell casted with triggered flag. Not all spells can be casted as area spells.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('54','cast self','3','Syntax: .cast self #spellid [triggered]\r\n\r\nCast #spellid by target at target itself. If \'trigered\' or part provided then spell casted with triggered flag.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('55','cast target','3','Syntax: .cast target #spellid [triggered]\r\n\r\nSelected target will cast #spellid to his victim. If \'trigered\' or part provided then spell casted with triggered flag.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('67','combatstop','2','Syntax: .combatstop [$playername]\r\n\r\nStop combat for selected character. If selected non-player then command applied to self. If $playername provided then attempt applied to online player $playername.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('78','debug play cinematic','1','Syntax: .debug play cinematic #cinematicid\r\n\r\nPlay cinematic #cinematicid for you. You stay at place while your mind fly.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('90','event','2','Syntax: .event #event_id\r\n\r\nShow details about event with #event_id.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('91','event list','2','Syntax: .event list\r\n\r\nShow list of currently active events.\r\nShow list of all events');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('92','event start','2','Syntax: .event start #event_id\r\n\r\nStart event #event_id. Set start time for event to current moment (change not saved in DB).');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('93','event stop','2','Syntax: .event stop #event_id\r\n\r\nStop event #event_id. Set start time for event to time in past that make current moment is event stop time (change not saved in DB).');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('94','explorecheat','3','Syntax: .explorecheat #flag\r\n\r\nReveal or hide all maps for the selected player. If no player is selected, hide or reveal maps to you.\r\n\r\nUse a #flag of value 1 to reveal, use a #flag value of 0 to hide all maps.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('99','gm fly','3','Syntax: .gm fly [on/off]\r\n\r\nEnable/disable gm fly mode.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('104','go','1','Syntax: .go  [$playername|pointlink|#x #y #z [#mapid]]\r\n\r\nTeleport your character to point with coordinates of player $playername, or coordinates of one from shift-link types: player, tele, taxinode, creature/creature_entry, gameobject/gameobject_entry, or explicit #x #y #z #mapid coordinates.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('105','go creature','1','Syntax: .go creature (#creature_guid|$creature_name|id #creature_id)\r\n\r\nTeleport your character to creature with guid #creature_guid, or teleport your character to creature with name including as part $creature_name substring, or teleport your character to a creature that was spawned from the template with this entry #creature_id.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('106','go graveyard','1','Syntax: .go graveyard #graveyardId\r\n\r\nTeleport to graveyard with the graveyardId specified.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('108','go object','1','Syntax: .go object (#gameobject_guid|$gameobject_name|id #gameobject_id)\r\n\r\nTeleport your character to gameobject with guid #gameobject_guid, or teleport your character to gameobject with name including as part $gameobject_name substring, or teleport your character to a gameobject that was spawned from the template with this entry #gameobject_id.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('110','go trigger','1','Syntax: .go trigger (#trigger_id|$trigger_shift-link|$trigger_target_shift-link) [target]\r\n\r\nTeleport your character to areatrigger with id #trigger_id or trigger id associated with shift-link. If additional arg \"target\" provided then character will teleported to areatrigger target point.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('114','gobject add','2','Syntax: .gobject add #id <spawntimeSecs>\r\n\r\nAdd a game object from game object templates to the world at your current location using the #id.\r\nspawntimesecs sets the spawntime, it is optional.\r\nNote: this is a copy of .gameobject.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('115','gobject delete','2','Syntax: .gobject delete #go_guid\r\n\r\nDelete gameobject with guid #go_guid.');

delete from `command` where `id` in (120,134,135,136,137,141,150,164,165,180,182,183,184,192,194,197,200,202,204,209,219,223,229);
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('120','gobject turn','2','Syntax: .gobject turn #goguid\r\n\r\nRotates gameobject #goguid around z-azis to match player\'s current orientation.\r\nOptional parameters are (#angle, #x,#y, #z)  - floats that represent a rotation af angle #angle around direction (#x, #y, #z)\r\ni.e. a rotation quaternion.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('134','instance listbinds','3','Syntax: .instance listbinds\r\n\r\nLists the binds of the selected player.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('135','instance savedata','3','Syntax: .instance savedata\r\n\r\nSave the InstanceData for the current player\'s map to the DB.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('136','instance stats','3','Syntax: .instance stats\r\n\r\nShows statistics about instances.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('137','instance unbind','3','Syntax: .instance unbind all\r\n\r\nAll of the selected player\'s binds will be cleared.\r\n.instance unbind #mapid\r\nOnly the specified #mapid instance will be cleared.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('141','learn all','3','Syntax: .learn all\r\n\r\nLearn all big set different spells, maybe useful for Administrators.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('150','learn all_recipes','2','Syntax: .learn all_recipes [$profession]\r\n\r\nLearns all recipes of specified profession and sets skill level to max.\r\nExample: .learn all_recipes enchanting');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('164','lookup event','2','Syntax: .lookup event $name\r\n\r\nAttempts to find the ID of the event with the provided $name.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('165','lookup faction','3','Syntax: .lookup faction $name\r\n\r\nAttempts to find the ID of the faction with the provided $name.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('180','maxskill','3','Syntax: .maxskill\r\n\r\nSets all skills of the targeted player to their maximum values for its current level.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('182','modify aspeed','1','Syntax: .modify aspeed #rate\r\n\r\nModify all speeds -run,swim,run back,swim back- of the selected player to \"normalbase speed for this move type\"*rate. If no player is selected, modify your speed.\r\n\r\n#rate may range from 0.1 to GM.MaxSpeedFactor defined in mangosd.conf.\"');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('183','modify bwalk','1','Syntax: .modify bwalk #rate\r\n\r\nModify the speed of the selected player while running backwards to \"normal walk back speed\"*rate. If no player is selected, modify your speed.\r\n\r\n#rate may range from 0.1 to GM.MaxSpeedFactor defined in mangosd.conf.\"');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('184','modify drunk','1','Syntax: .modify drunk #value\r\n\r\nSet drunk level to #value (0..100). Value 0 remove drunk state, 100 is max drunked state.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('192','modify money','1','Syntax: .modify money #money\r\n\r\nAdd or remove money to the selected player. If no player is selected, modify your money.\r\n\r\n #gold can be negative to remove money.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('194','modify mount','1','Syntax: .modify mount #id #speed\r\n\r\nDisplay selected player as mounted at #id creature and set speed to #speed value.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('197','modify rep','2','Syntax: .modify rep #repId (#repvalue | $rankname [#delta])\r\n\r\nSets the selected players reputation with faction #repId to #repvalue or to $reprank.\r\nIf the reputation rank name is provided, the resulting reputation will be the lowest reputation for that rank plus the delta amount, if specified.\r\nYou can use \'.pinfo rep\' to list all known reputation ids, or use \'.lookup faction $name\' to locate a specific faction id.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('200','modify speed','1','Syntax: .modify speed #rate\r\n\r\nModify the running speed of the selected player to \"normal base run speed\"*rate. If no player is selected, modify your speed.\r\n\r\n#rate may range from 0.1 to GM.MaxSpeedFactor defined in mangosd.conf.\"');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('202','modify swim','1','Syntax: .modify swim #rate\r\n\r\nModify the swim speed of the selected player to \"normal swim speed\"*rate. If no player is selected, modify your speed.\r\n\r\n#rate may range from 0.1 to GM.MaxSpeedFactor defined in mangosd.conf.\"');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('204','movegens','3','Syntax: .movegens\r\n\r\nShow movement generators stack for selected creature or player.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('209','npc additem','2','Syntax: .npc additem #itemId <#maxcount><#incrtime><#extendedcost>\r\n\r\nAdd item #itemid to item list of selected vendor. Also optionally set max count item in vendor item list and time to item count restoring and items ExtendedCost.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('219','npc info','3','Syntax: .npc info\r\n\r\nDisplay a list of details for the selected creature.\r\n\r\nThe list includes:-\r\nGUID, Faction, NPC flags, Entry ID, Model ID,\r\n- Level,\r\n- Health (current/maximum),\r\n- Field flags, dynamic flags, faction template,\r\n- Position information,\r\n- and the creature type, e.g. if the creature is a vendor.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('223','npc say','1','Syntax: .npc say #text\r\n\r\nMake the selected npc says #text.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('229','npc spawntime','2','Syntax: .npc spawntime #time\r\n\r\nAdjust spawntime of selected creature to time.');

delete from `command` where `id` in (234,235,236,237,243,257,261,262,263,265,266,267,299,300,309,312,315,316,317,318,319,322,325,326);
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('234','npc whisper','1','Syntax: .npc whisper #playerguid #text\r\n\r\nMake the selected npc whisper #text to  #playerguid.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('235','npc yell','1','Syntax: .npc yell #text\r\n\r\nMake the selected npc yells #text.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('236','pdump load','3','Syntax: .pdump load $filename $account [$newname] [$newguid]\r\n\r\nLoad character dump from dump file into character list of $account with saved or $newname, with saved (or first free) or $newguid guid.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('237','pdump write','3','Syntax: .pdump write $filename $playerNameOrGUID\r\n\r\nWrite character dump with name/guid $playerNameOrGUID to file $filename.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('243','quest complete','3','Syntax: .quest complete #questid\r\n\r\nMark all quest objectives as completed for target character active quest. After this target character can go and get quest reward.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('257','reload all_spell','3','Syntax: .reload all_spell\r\n\r\nReload all `spell_*` tables with reload support added and that can be _safe_ reloaded.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('261','reset all','3','Syntax: .reset all\r\n\r\nRequest reset spells,talents etc. at next login each existing character.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('262','reset honor','3','Syntax: .reset honor [Playername]\r\n\r\nReset all honor data for targeted character.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('263','reset level','3','Syntax: .reset level [Playername]\r\n\r\nReset level to 1 including reset stats and talents.  Equipped items with greater level requirement can be lost.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('265','reset spells','3','Syntax: .reset spells [Playername]\r\n\r\nRemoves all non-original spells from spellbook.\r\nPlayername can be name of offline character.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('266','reset stats','3','Syntax: .reset stats [Playername]\r\n\r\nResets(recalculate) all stats of the targeted player to their original values at current level.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('267','reset talents','3','Syntax: .reset talents [Playername]\r\n\r\nRemoves all talents (current spec) of the targeted player or pet or named player. With player talents also will be reset talents for all character\'s pets if any.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('299','summon','1','Syntax: .summon [$charactername]\r\n\r\nTeleport the given character to you. Character can be offline.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('300','taxicheat','1','Syntax: .taxicheat on/off\r\n\r\nTemporary grant access or remove to all taxi routes for the selected character. If no character is selected, hide or reveal all routes to you.\r\n\r\nVisited taxi nodes still accessible after removing access.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('309','titles remove','2','Syntax: .titles remove #title\r\n\r\nRemove title #title (id or shift-link) from known titles list for selected player.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('312','trigger active','2','Syntax: .trigger active\r\n\r\nShow list of areatriggers with activation zone including current character position.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('315','unban account','3','Syntax: .unban account $Name\r\n\r\nUnban accounts for account name pattern.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('316','unban character','3','Syntax: .unban character $Name\r\n\r\nUnban accounts for character name pattern.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('317','unban ip','3','Syntax: .unban ip $Ip\r\n\r\nUnban accounts for IP pattern.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('318','unlearn','3','Syntax: .unlearn #spell [all]\r\n\r\nUnlearn for selected player a spell #spell.  If \'all\' provided then all ranks unlearned.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('319','unmute','1','Syntax: .unmute [$playerName]\r\n\r\nRestore chat messaging for any character from account of character $playerName (or selected). Character can be offline.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('322','whispers','1','Syntax: .whispers on|off\r\n\r\nEnable/disable accepting whispers by GM from players. By default use mangosd.conf setting.');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('325','wp modify','2','Syntax: .wp modify command [dbGuid, id] [value]\r\n\r\nwhere command must be one of: waittime  | scriptid | orientation | del | move\r\nIf no waypoint was selected, one can be chosen with dbGuid and id.\r\nThe commands have the following meaning:\r\n waittime (Set the time the npc will wait at a point (in ms))\r\n scriptid (Set the DB-Script that will be executed when the wp is reached)\r\n orientation (Set the orientation of this point) \r\n del (Remove the waypoint from the path)\r\n move (Move the wayoint to the current position of the player)');
insert into `command` (`id`, `command_text`, `security`, `help_text`) values('326','wp show','2','Syntax: .wp show command [dbGuid] [pathId [wpOrigin]\r\n\r\nwhere command can have one of the following values\r\non (to show all related wp)\r\nfirst (to see only first one)\r\nlast (to see only last one)\r\noff (to hide all related wp)\r\ninfo (to get more info about theses wp)\r\n\r\nFor using info you have to do first show on and than select a Visual-Waypoint and do the show info!\r\nwith pathId and wpOrigin you can specify which path to show (optional)');

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
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
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


