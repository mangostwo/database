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
    SET @cOldStructure = '02'; 
    SET @cOldContent = '27';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '28';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'silvermoon_city_fix_pt2';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'silvermoon_city_fix_pt2';

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

/*
Added Silvermoon Guardian custom emotes
*/
DELETE FROM `db_script_string` WHERE `entry` IN (2000005829,2000005828,2000005827,2000005826);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(2000005829,'Even the Light is no match for the indomitable will of our people.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,16,'Silvermoon Guardian say_4'),
(2000005828,'Our lives are yours, Blood Knight.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,16,'Silvermoon Guardian say_3'),
(2000005827,'Glory to the Sun K-- ah.... Silvermoon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,16,'Silvermoon Guardian say_2'),
(2000005826,'Your power strengthens us all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,16,'Silvermoon Guardian say_1');		

/*
Silvermoon Guardian support scripts
*/
DELETE FROM `dbscripts_on_creature_movement` WHERE `id` IN (56901,56900,56912,56910,56911,56913,56914,56897);
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(56901,0,0,0,0,16222,56901,16,2000005826,2000005827,2000005828,2000005829,0,0,0,0,'Force Kneel / say random  - 56901'),
(56900,0,1,16,0,16222,56900,16,0,0,0,0,0,0,0,0,'Force Kneel - 56900'),
(56912,0,1,16,0,16222,56912,16,0,0,0,0,0,0,0,0,'Force Kneel - 56912'),
(56910,0,0,0,0,16222,56910,16,2000005826,2000005827,2000005828,2000005829,0,0,0,0,'Force Kneel / say random  - 56910'),
(56911,0,1,16,0,16222,56911,16,0,0,0,0,0,0,0,0,'Force Kneel - 56911'),
(56913,0,0,0,0,16222,56913,16,2000005826,2000005827,2000005828,2000005829,0,0,0,0,'Force Kneel / say random - 56913'),
(56914,0,1,16,0,16222,56914,16,0,0,0,0,0,0,0,0,'Force Kneel - 56914'),
(56897,0,1,16,0,16222,56897,16,0,0,0,0,0,0,0,0,'Force Kneel - 56897');

/*
Removed Champion Vranesh spawn mount to reflect NPC revamp.
Refer to dbscripts_on_creature_movement for update on
this NPC's mount and dismount
*/
DELETE FROM `creature_template_addon` WHERE `entry` = '18146';

/*
Champion Vranesh spawn and movetype changed
*/
UPDATE `creature` SET `position_x` = '9842.71' , `position_y` = '-7479.93' , `position_z` = '14.9253' , `orientation` = '5.71158' , `currentwaypoint` = '1' , `MovementType` = '2' WHERE `guid` = '64949';

/*
Added Champion Vranesh custom emotes
*/
DELETE FROM `db_script_string` WHERE `entry` IN (2000005822,2000005823,2000005824,2000005825);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(2000005822,'Champion Vranesh arches a sculpted brow at the guards, a disapproving scowl on his face.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'Champion Vranesh emote_1'),
(2000005823,'Champion Vranesh glances from guard to guard.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'Champion Vranesh emote_2'),
(2000005824,'Champion Vranesh surveys the small ranger practice ground with a condescending smirk.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'Champion Vranesh emote_3'),
(2000005825,'Champion Vranesh inclines his head slightly to the pair of guardians in greeting.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'Champion Vranesh emote_4');

/*
Updated dbscripts_on_creature_movement to support
Champion Vranesh's mount, dismount and emotes
*/
DELETE FROM `dbscripts_on_creature_movement` WHERE `id` IN (1814601,1814602,1814603,1814604,1814605,1814606);
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `X`, `Y`, `z`, `o`, `comments`) VALUES
(1814601,0,24,20030,0,0,0,0,0,0,0,0,0,0,0,0,'Champion Vranesh mount'),
(1814602,0,24,0,0,0,0,4,0,0,0,0,0,0,0,0,'Champion Vranesh dismount'),
(1814603,0,0,0,0,0,0,0,2000005822,0,0,0,0,0,0,0,'Champion Vranesh EMOTE_1'),
(1814604,0,0,0,0,0,0,0,2000005823,0,0,0,0,0,0,0,'Champion Vranesh EMOTE_2'),
(1814605,0,0,0,0,0,0,0,2000005824,0,0,0,0,0,0,0,'Champion Vranesh EMOTE_3'),
(1814606,0,0,0,0,0,0,0,2000005825,0,0,0,0,0,0,0,'Champion Vranesh EMOTE_4');

/*
Champion Vranesh waypoint additions
*/
DELETE FROM `creature_movement` WHERE `id` = '64949';
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(64949,1,9843.01,-7480.21,14.9253,282000,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,2,9833.33,-7480.83,14.9266,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,3,9829.19,-7494.96,14.9375,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,4,9826.69,-7515.77,19.7389,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,5,9841.69,7518.62,19.7067,0,0,0,0,0,0,0,0,0,0,10,0,0),
(64949,6,9844.71,-7513.05,19.681,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,7,9850.91,-7512.99,19.7152,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,8,9850.85,-7514.6,19.7183,2000,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,9,9850.85,-7514.6,19.7183,2700,0,0,0,0,0,0,2,0,0,100,0,0),
(64949,10,9873.39,-7516.39,19.7583,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,11,9872.08,-7490.41,14.9142,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,12,9851.66,-7490.21,14.9382,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,13,9850.52,-7469.93,14.9521,800,1814601,0,0,0,0,0,0,0,0,100,0,0),
(64949,14,9850.52,-7469.93,14.9521,0,56914,0,0,0,0,0,0,0,0,100,0,0),
(64949,15,9850.52,-7469.93,14.9521,0,56913,0,0,0,0,0,0,0,0,100,0,0),
(64949,16,9850.52,-7469.93,14.9521,0,1814606,0,0,0,0,0,0,0,0,100,0,0),
(64949,17,9849.24,-7423.33,13.3203,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,18,9794.95,-7425.04,13.5165,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,19,9793.89,-7442.89,14.4148,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,20,9790.91,-7443.75,14.7071,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,21,9768.19,-7441.91,14.3912,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,22,9766.2,7422,13.2925,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,23,9739.67,-7422.86,13.2583,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,24,9736.73,-7442.12,13.5414,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,25,9741.23,-7465.42,13.5735,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,26,9747.52,-7483.47,13.5544,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,27,9749.77,-7485.89,13.5465,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,28,9757.67,-7487.56,13.5338,0,56911,0,0,0,0,0,0,0,0,100,0,0),
(64949,29,9757.67,-7487.56,13.5338,0,56910,0,0,0,0,0,0,0,0,100,0,0),
(64949,30,9757.67,-7487.56,13.5338,0,56912,0,0,0,0,0,0,0,0,100,0,0),
(64949,31,9757.67,-7487.56,13.5338,2000,1814603,0,0,0,0,0,0,0,0,100,0,0),
(64949,32,9718.04,-7485.51,13.5432,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,33,9700.41,-7481.03,13.5347,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,34,9681.89,-7475.79,13.5292,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,35,9665.73,-7480.98,13.5333,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,36,9649.17,-7490.18,13.5199,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,37,9637.35,-7492.76,13.5073,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,38,9619.88,-7488.21,13.5144,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,39,9605.25,-7474.52,13.5421,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,40,9598.92,-7449.74,13.5436,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,41,9596.65,-7449.88,13.5391,0,56897,0,0,0,0,0,0,0,0,100,0,0),
(64949,42,9596.65,-7449.88,13.5391,0,56900,0,0,0,0,0,0,0,0,100,0,0),
(64949,43,9596.65,-7449.88,13.5391,0,56901,0,0,0,0,0,0,0,0,100,0,0),
(64949,44,9596.65,-7449.88,13.5391,2000,1814604,0,0,0,0,0,0,0,0,100,0,0),
(64949,45,9615.94,-7421.13,13.3048,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,46,9655.73,-7421.51,13.2937,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,47,9673.08,-7430.09,13.2937,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,48,9688.63,-7431.27,13.2937,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,49,9722.93,-7414.36,13.2949,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,50,9748.02,-7414.36,13.2647,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,51,9767.34,-7413.39,13.3857,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,52,9766.71,-7395.11,14.4151,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,53,9793.8,7395.47,14.4088,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,54,9794.86,-7415.79,13.4991,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,55,9848.66,-7415.07,13.312,800,1814602,0,0,0,0,0,0,0,0,100,0,0),
(64949,56,9848.66,-7415.07,13.312,650,1814605,0,0,0,0,0,0,0,0,100,0,0),
(64949,57,9847.17,-7447.27,13.5698,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,58,9850.46,-7466.93,14.9569,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,59,9849.94,-7480.28,14.9475,0,0,0,0,0,0,0,0,0,0,100,0,0),
(64949,60,9841.74,-7480.46,14.9263,0,0,0,0,0,0,0,0,0,0,100,0,0);

/*
Razia spawn and MoveType update
*/
UPDATE `creature` SET `position_x` = '10013.5' , `position_y` = '-7214.74' , `position_z` = '32.0777' , `orientation` = '2.4167' , `MovementType` = '2' WHERE `guid` = '57637';

/*
Razia Waypoints added
*/
DELETE FROM `creature_movement` WHERE `id` = '57637';
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(57637,1,10013.5,-7214.74,32.0777,114000,0,0,0,0,0,0,0,0,0,2.4167,0,0),
(57637,2,10015.1,-7217.73,32.0777,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57637,3,10016.4,-7217.9,32.0776,6000,0,0,0,0,0,0,25,0,0,100,0,0),
(57637,4,10016.4,-7217.9,32.0776,3000,0,0,0,0,0,0,273,0,0,100,0,0),
(57637,5,10014.6,-7217.32,32.0771,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57637,6,10014.2,-7215.86,32.0771,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57637,7,10016.5,-7212.36,32.0771,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57637,8,10017.9,-7210.5,32.0771,2500,0,0,0,0,0,0,1,0,0,100,0,0),
(57637,9,10018.1,-7213.69,32.0771,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57637,10,10015.6,-7214.69,32.0766,0,0,0,0,0,0,0,0,0,0,100,0,0);

/*
Mirvedon Movetype updated
*/
UPDATE `creature` SET `MovementType` = '2' WHERE `guid` = '64060';

/*
Mirvedon waypoints added
*/
DELETE FROM `creature_movement` WHERE `id` = '57661';
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(57661,1,9859.67,-7361.79,18.5932,108000,0,0,0,0,0,0,0,0,0,4.66003,0,0),
(57661,2,9859.46,-7363.02,18.5905,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57661,3,9858.52,-7362.84,18.59,132000,0,0,0,0,0,0,233,0,0,100,0,0),
(57661,4,9859.23,-7360.79,18.5871,0,0,0,0,0,0,0,0,0,0,100,0,0);

/*
Danwe Movetype and spawn updated
*/
UPDATE `creature` SET `position_x` = '9821.62' , `position_y` = '-7333.81' , `position_z` = '26.2818' , `orientation` = '0.8303' , `MovementType` = '2' WHERE `guid` = '57657';

/*
Danwe Waypoints
*/
DELETE FROM `creature_movement` WHERE `id` = '57657';
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(57657,1,9821.62,-7333.81,26.2818,108000,0,0,0,0,0,0,0,0,0,0.8303,0,0),
(57657,3,9823.25,-7330.62,26.2818,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57657,4,9822.26,-7329.51,26.2818,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57657,5,9820.44,-7329.45,26.2818,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57657,6,9819.87,-7330.31,26.2818,10000,1666702,0,0,0,0,0,0,0,0,100,0,0),
(57657,7,9819.87,-7330.31,26.2818,0,1666701,0,0,0,0,0,0,0,0,100,0,0),
(57657,8,9821.19,-7331.77,26.2818,36000,0,0,0,0,0,0,133,0,0,100,0,0),
(57657,9,9821.19,-7331.77,26.2818,2000,0,0,0,0,0,0,0,0,0,0,0,0),
(57657,10,9822.74,-7332.99,26.2818,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57657,11,9821.43,-7333.68,26.2818,0,0,0,0,0,0,0,0,0,0,100,0,0);

/*
Rarthein spawn update
*/
UPDATE `creature` SET `position_x` = '9586.49' , `position_y` = '-7202.7' , `position_z` = '16.2057' WHERE `guid` = '66970';

/*
Rarthein waypoints added
*/
DELETE FROM `creature_movement` WHERE `id` = 66970;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(66970,1,9586.49,-7202.7,16.2057,29000,0,0,0,0,0,0,16,0,0,100,0,0),
(66970,2,9585.39,-7203.48,16.2029,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,3,9587.5,-7204.23,16.2007,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,4,9589,-7206.88,16.202,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,5,9588.66,-7211.19,16.2019,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,6,9581.05,-7216.77,16.1563,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,7,9578.76,-7216.85,16.1477,3000,0,0,0,0,0,0,16,0,0,100,0,0),
(66970,8,9578.17,-7218.72,16.1132,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,9,9575.13,-7220.93,16.1389,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,10,9571.51,-7222.07,16.186,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,11,9561.87,-7222.38,16.2114,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,12,9561.7,-7223.39,16.2126,3000,0,0,0,0,0,0,16,0,0,100,0,0),
(66970,13,9561.19,-7203.19,16.2117,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,14,9568.63,-7200.99,16.2133,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,15,9568.2,-7181.72,14.2376,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,16,9586.54,-7138.83,14.262,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,17,9580.44,-7098.79,14.5448,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,18,9579.91,-7085.34,16.5988,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,19,9580.36,-7064.56,18.6409,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,20,9585.11,-7060.25,18.6423,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,21,9584.31,-7056.03,18.6423,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,22,9582.53,-7054.81,18.6439,2600,0,0,0,0,0,0,1,0,0,100,0,0),
(66970,23,9583.63,-7055.77,18.6438,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,24,9584.81,-7057.79,18.644,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,25,9570.33,-7086.63,16.5893,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,26,9542.91,-7088.85,16.5228,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,27,9533.43,-7100.9,14.3624,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,28,9531.9,-7100.86,14.3492,9000,0,0,0,0,0,0,1,0,0,100,0,0),
(66970,29,9524.26,-7127.68,14.1187,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,30,9524.36,-7125.82,14.1187,11000,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,31,9530.38,-7140.88,14.1358,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,32,9536.27,-7151.96,14.1551,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,33,9559.33,-7177.12,14.2534,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,34,9562.2,-7179.06,14.2524,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,35,9567.77,-7195.16,16.2192,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,36,9567.99,-7201.63,16.214,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,37,9561.64,-7204.13,16.2126,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,38,9562.02,-7210.33,16.2126,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,39,9576.15,-7211.96,16.1394,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,40,9591.59,-7210.29,16.2065,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,41,9586.2,-7200.5,21.4594,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,42,9580.4,-7203.36,24.7793,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,43,9575.88,-7215.68,27.2112,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,44,9578.39,-7238.14,27.0304,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,45,9581.17,-7238.14,27.0298,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,46,9581.42,-7236.55,27.0281,4000,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,47,9581.42,-7236.55,27.0281,3000,0,0,0,0,0,0,16,0,0,100,0,0),
(66970,48,9586.8,-7235.11,27.0336,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,49,9587.17,-7229.69,27.1181,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,50,9592.51,-7228.58,27.1024,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,51,9592.52,-7229.42,27.103,3000,0,0,0,0,0,0,16,0,0,100,0,0),
(66970,52,9575.73,-7223.22,27.1635,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,53,9571.3,-7210.36,27.1974,3000,0,0,0,0,0,0,16,0,0,100,0,0),
(66970,54,9577.64,-7208.82,27.1339,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,55,9580.6,-7202.95,24.4572,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,56,9584.06,-7200.94,22.307,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,57,9590.88,-7203.09,18.6085,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,58,9591.86,-7207.11,16.811,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,59,9591.51,-7210.06,16.2071,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,60,9588.22,-7208.05,16.2036,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,61,9588.61,-7205.23,16.2025,0,0,0,0,0,0,0,0,0,0,100,0,0),
(66970,62,9586.46,-7203.44,16.2026,0,0,0,0,0,0,0,0,0,0,100,0,0);

/*
dbscript kneel/stand, Danwe
*/
DELETE FROM `dbscripts_on_creature_movement` WHERE `id` IN (1666701,1666702,1665001,1665002);
INSERT INTO `dbscripts_on_creature_movement` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1666701,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'stand - Danwe'),
(1666702,0,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'Kneel  -Danwe');

/*
Zalle Movetype
*/
UPDATE `creature` SET `MovementType` = '2' WHERE `guid` = '57608';

/* 
Waypoints added to Zalle
*/

DELETE FROM `creature_movement` WHERE `id` IN (57608);
INSERT INTO `creature_movement` (id, POINT, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(57608,1,9572.41,-7060.68,18.64,80000,0,0,0,0,0,0,0,0,0,0.178202,0,0),
(57608,2,9581.38,-7063.28,18.6425,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57608,3,9588.93,-7060.14,18.6426,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57608,4,9590.26,-7060.36,18.6426,25000,0,0,0,0,0,0,133,0,0,100,0,0),
(57608,5,9590.26,-7060.36,18.6426,3000,0,0,0,0,0,0,0,0,0,100,0,0),
(57608,6,9587.54,-7060.3,18.6426,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57608,7,9586.19,-7062.01,18.6426,40000,0,0,0,0,0,0,0,0,0,100,0,0),
(57608,8,9578.1,-7064.94,18.6426,0,0,0,0,0,0,0,0,0,0,100,0,0),
(57608,9,9570.65,-7060.55,18.6426,0,0,0,0,0,0,0,0,0,0,100,0,0);

/*
Emote added to verious NPCs
*/
UPDATE `creature_template_addon` SET `emote` = '133' WHERE `entry` = '16626'; -- Tynna

/*
Miscellaneous spawn location tweaks
*/
UPDATE `creature` SET `position_z` = '8.3' WHERE `guid` = '66965'; -- Caged Leper Gnome

/*
Remove verious NPCs
*/
DELETE FROM `creature` WHERE `guid` = '64058'; -- Arcane Guardian
DELETE FROM `creature` WHERE `guid` = '84939'; -- [DND]Spirit 1

update `creature_movement_template` set `script_id` = '1723000' where `entry` = '17230' and `point` = '10'

    

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

