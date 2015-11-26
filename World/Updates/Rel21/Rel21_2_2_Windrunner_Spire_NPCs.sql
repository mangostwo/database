-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos` ()

BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '2'; 
    SET @cOldContent = '1'; 

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '2';
    SET @cNewContent = '2';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Windrunner Spire NPC corrections';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Location and movement corrections made to the NPCs in Windrunner Spire';

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
Windrunner Spire within the ghostlands has many misplaced NPCs and missing waypoints. This is a growing list of corrections to the Deathholm Acolytes. ID 16315
by necrovoice
*/

/*
Added Deathhold Acolyte movement and spawndist, current DB has spawndist 0 and is causing movement to default to 0. This update also fixes spawn times.
*/
UPDATE creature SET
spawntimesecs = 472, 
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82522;
UPDATE creature SET
spawntimesecs = 472,  
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82527;
UPDATE creature SET
spawntimesecs = 472,  
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82538;
UPDATE creature SET
spawntimesecs = 472, 
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82539;
UPDATE creature SET
spawntimesecs = 472,  
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82547;
UPDATE creature SET
spawntimesecs = 472,
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82531;
UPDATE creature SET
spawntimesecs = 472,  
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82528;
UPDATE creature SET
spawntimesecs = 472,  
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82540;
UPDATE creature SET
spawntimesecs = 472,  
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82529;
UPDATE creature SET
spawntimesecs = 472,  
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82536;
UPDATE creature SET
spawntimesecs = 472 WHERE creature.guid = 82514;
UPDATE creature SET
spawntimesecs = 472 WHERE creature.guid = 82545;
UPDATE creature SET
spawntimesecs = 472 WHERE creature.guid = 82544;
UPDATE creature SET
spawntimesecs = 472 WHERE creature.guid = 82537;
UPDATE creature SET
spawntimesecs = 472 WHERE creature.guid = 151032;

/*
----------------------
Deathholm Acolyte Spawns
----------------------
*/

UPDATE creature SET position_x = 7020.74,
position_y = -5738.52,
position_z = 104.97,
orientation = 4.588909, 
MovementType = 2 WHERE creature.guid =82514;
UPDATE creature SET position_x = 7017.30,
position_y = -5712.72,
position_z = 106.61,
orientation = 5.412960 WHERE creature.guid =82529;
UPDATE creature SET position_x = 7005.89,
position_y = -5686.68,
position_z = 102.34,
orientation = 5.116094,
MovementType = 2 WHERE creature.guid =82537;
UPDATE creature SET position_x = 6967.14,
position_y = -5704.935,
position_z = 90.62,
orientation = 5.116094 WHERE creature.guid =82536;
UPDATE creature SET position_x = 6998.541,
position_y = -5687.62,
position_z = 102.573,
orientation = 3.161677,
MovementType = 2 WHERE creature.guid =82544;
UPDATE creature SET position_x = 7019.71,
position_y = -5656.67,
position_z = 80.79,
orientation = 5.860168,
MovementType = 2 WHERE creature.guid =82545;


/*
Add Deathhold Acolyte to hillside (Right of ramp) ID: 16315
*/

delete from creature where guid = 151032;
insert into creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) values(151032,16315,530,1,1,0,0,7051.7,-5811.42,46.5964,2.50734,472,5,0,270,295,0,1);


/*
----------------------
Deathholm Acolyte Waypoints
----------------------
*/


/*
guid 82514
*/

delete from creature_movement where id = 82514;
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,1,7020,-5738.52,104.97,0,0,0,0,0,0,0,0,0,151384,0,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,2,7024.42,-5765.33,92.5564,0,0,0,0,0,0,0,0,0,151385,4.89857,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,3,7022.39,-5790.88,80.1896,0,0,0,0,0,0,0,0,0,151386,4.19171,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,4,6995.64,-5825.79,58.0424,0,0,0,0,0,0,0,0,0,151387,3.90897,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,5,6983.29,-5847.61,45.9809,0,0,0,0,0,0,0,0,0,151388,4.41633,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,6,6979.86,-5871.33,34.9409,0,0,0,0,0,0,0,0,0,151389,5.02815,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,7,6980.42,-5901.73,27.6123,0,0,0,0,0,0,0,0,0,151390,1.43132,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, 
model2) values(82514,8,6979.86,-5871.33,34.9409,0,0,0,0,0,0,0,0,0,151389,5.02815,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,9,6983.29,-5847.61,45.9809,0,0,0,0,0,0,0,0,0,151388,4.41633,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,10,6995.64,-5825.79,58.0424,0,0,0,0,0,0,0,0,0,151387,3.90897,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,11,7022.39,-5790.88,80.1896,0,0,0,0,0,0,0,0,0,151386,4.19171,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,12,7024.42,-5765.33,92.5564,0,0,0,0,0,0,0,0,0,151385,4.89857,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82514,13,7020,-5738.52,104.97,0,0,0,0,0,0,0,0,0,151384,0,0,0);

/*
guid 82537
*/

delete from creature_movement where id = 82537;
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,1,7005.89,-5686.69,102.34,0,0,0,0,0,0,0,0,0,0,5.11609,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,2,7006.7,-5690.31,102.353,0,0,0,0,0,0,0,0,0,0,5.16795,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,3,7009.82,-5693.1,102.373,0,0,0,0,0,0,0,0,0,0,5.65882,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,4,7013.29,-5693.91,102.376,0,0,0,0,0,0,0,0,0,0,0.019655,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,5,7017.55,-5693.24,102.402,0,0,0,0,0,0,0,0,0,0,0.620484,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,6,7020.84,-5688.23,102.35,0,0,0,0,0,0,0,0,0,0,1.24488,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,7,7021.27,-5681.68,102.379,0,0,0,0,0,0,0,0,0,0,2.09703,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,8,7016.93,-5678.82,102.356,0,0,0,0,0,0,0,0,0,0,2.88243,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,9,7011.11,-5677.67,102.372,0,0,0,0,0,0,0,0,0,0,3.49504,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,10,7007.05,-5680.02,102.373,0,0,0,0,0,0,0,0,0,0,4.28436,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82537,11,7005.33,-5684.1,102.36,0,0,0,0,0,0,0,0,0,0,5.05012,0,0);

/*
guid 82544
*/

delete from creature_movement where id = 82544;
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,1,6997.96,-5687.55,102.591,0,0,0,0,0,0,0,0,0,151690,3.3109,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,2,6990.37,-5688.19,101.639,0,0,0,0,0,0,0,0,0,151691,3.39337,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,3,6974.61,-5694.98,95.0943,0,0,0,0,0,0,0,0,0,151692,3.91566,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,4,6969.03,-5703.16,91.2525,0,0,0,0,0,0,0,0,0,151693,4.35941,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,5,6967.87,-5713.96,87.827,0,0,0,0,0,0,0,0,0,151694,4.99165,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,6,6971.45,-5723.49,84.4282,0,0,0,0,0,0,0,0,0,151695,5.12124,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,7,6977.46,-5725.97,84.2495,0,0,0,0,0,0,0,0,0,151696,1.18638,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,8,6981.27,-5721.87,84.2775,0,0,0,0,0,0,0,0,0,151697,1.66155,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,9,6979.41,-5694.78,83.5454,0,0,0,0,0,0,0,0,0,151698,1.16515,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,10,6981.52,-5677.59,82.1153,0,0,0,0,0,0,0,0,0,151699,0.968796,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,11,6988.15,-5667.18,81.4534,0,0,0,0,0,0,0,0,0,151700,0.713543,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,12,6997.3,-5659.34,80.7806,0,0,0,0,0,0,0,0,0,151701,3.86299,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,13,6988.15,-5667.18,81.4534,0,0,0,0,0,0,0,0,0,151700,0.713543,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,14,6981.52,-5677.59,82.1153,0,0,0,0,0,0,0,0,0,151699,0.968796,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,15,6979.41,-5694.78,83.5454,0,0,0,0,0,0,0,0,0,151698,1.16515,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,16,6981.27,-5721.87,84.2775,0,0,0,0,0,0,0,0,0,151697,1.66155,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,17,6977.46,-5725.97,84.2495,0,0,0,0,0,0,0,0,0,151696,1.18638,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,18,6971.45,-5723.49,84.4282,0,0,0,0,0,0,0,0,0,151695,5.12124,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,19,6967.87,-5713.96,87.827,0,0,0,0,0,0,0,0,0,151694,4.99165,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,20,6969.03,-5703.16,91.2525,0,0,0,0,0,0,0,0,0,151693,4.35941,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,21,6974.61,-5694.98,95.0943,0,0,0,0,0,0,0,0,0,151692,3.91566,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82544,22,6990.37,-5688.19,101.639,0,0,0,0,0,0,0,0,0,151691,3.39337,0,0);

/*
guid 82545
*/

delete from creature_movement where id = 82545;
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,1,7019.65,-5656.66,80.7793,0,0,0,0,0,0,0,0,0,151329,5.89315,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,2,7025.81,-5657.63,81.0654,0,0,0,0,0,0,0,0,0,151330,6.1641,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,3,7035.15,-5662.51,81.6012,0,0,0,0,0,0,0,0,0,151331,5.6811,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,4,7041.19,-5668.92,82.1264,0,0,0,0,0,0,0,0,0,151332,5.36302,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,5,7048.84,-5683.94,83.5315,0,0,0,0,0,0,0,0,0,151333,4.91535,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,6,7053.76,-5696.11,84.263,0,0,0,0,0,0,0,0,0,151334,4.92321,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,7,7055.17,-5710.39,84.2813,0,0,0,0,0,0,0,0,0,151335,5.51854,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,8,7057.7,-5714.1,84.2452,0,0,0,0,0,0,0,0,0,151336,1.91356,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,9,7062.93,-5713.47,84.2625,0,0,0,0,0,0,0,0,0,151337,1.40698,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,10,7064.73,-5704.24,86.1519,0,0,0,0,0,0,0,0,0,151338,1.53107,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,11,7063.38,-5692.98,90.0957,0,0,0,0,0,0,0,0,0,151339,2.16724,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,12,7057.37,-5685.04,93.0919,0,0,0,0,0,0,0,0,0,151340,1.99445,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,13,7045.41,-5680.99,98.4911,0,0,0,0,0,0,0,0,0,151341,3.07437,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,14,7035.74,-5680.88,101.692,0,0,0,0,0,0,0,0,0,151342,3.31391,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,15,7029.11,-5683.13,102.609,0,0,0,0,0,0,0,0,0,151343,3.32569,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,16,7035.74,-5680.88,101.692,0,0,0,0,0,0,0,0,0,151342,3.31391,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,17,7045.41,-5680.99,98.4911,0,0,0,0,0,0,0,0,0,151341,3.07437,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,18,7057.37,-5685.04,93.0919,0,0,0,0,0,0,0,0,0,151340,1.99445,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,19,7063.38,-5692.98,90.0957,0,0,0,0,0,0,0,0,0,151339,2.16724,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,20,7064.73,-5704.24,86.1519,0,0,0,0,0,0,0,0,0,151338,1.53107,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,21,7062.93,-5713.47,84.2625,0,0,0,0,0,0,0,0,0,151337,1.40698,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,22,7057.7,-5714.1,84.2452,0,0,0,0,0,0,0,0,0,151336,1.91356,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,23,7055.17,-5710.39,84.2813,0,0,0,0,0,0,0,0,0,151335,5.51854,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,24,7053.76,-5696.11,84.263,0,0,0,0,0,0,0,0,0,151334,4.92321,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,25,7048.84,-5683.94,83.5315,0,0,0,0,0,0,0,0,0,151333,4.91535,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,26,7041.19,-5668.92,82.1264,0,0,0,0,0,0,0,0,0,151332,5.36302,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,27,7035.15,-5662.51,81.6012,0,0,0,0,0,0,0,0,0,151331,5.6811,0,0);
insert into creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) values(82545,28,7025.81,-5657.63,81.0654,0,0,0,0,0,0,0,0,0,151330,6.1641,0,0);

/*
Added 2 spawn locations for the NPC Fallen Ranger ID: 16314
*/


delete from creature where guid = 151209;
insert into creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) values(151209,16314,530,1,1,0,0,7010.16,-5644.02,80.7292,4.66889,25,5,0,328,0,0,1);

/*
Moved a Fallen Ranger from the upper platform to the lower platform.
*/

UPDATE creature SET position_x = 7018.33,
position_y = -5655.7290,
position_z = 80.78,
orientation = 5.699337 WHERE creature.guid =82534;

/*
Moved a Fallen Ranger from the upper platform room to the lower platform.
*/

UPDATE creature SET position_x = 7000.81,
position_y = -5658.66,
position_z = 80.7793,
orientation = 4.76707,
spawndist = 5,
MovementType = 1 WHERE creature.guid =82530;

/*
Added Fallen Ranger movement and spawndist, current DB has spawndist 0 and is causing movement to default to 0.
*/
UPDATE creature SET
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82523;
UPDATE creature SET
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82525;
UPDATE creature SET
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82526;
UPDATE creature SET
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82532;
UPDATE creature SET
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82533;
UPDATE creature SET
spawndist = 5 WHERE creature.guid = 82534;
UPDATE creature SET
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82535;
UPDATE creature SET
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82543;
UPDATE creature SET
spawndist = 5,
MovementType = 1 WHERE creature.guid = 82546;
        
        

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
                SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurResult AS `===== Found Version =====`;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;