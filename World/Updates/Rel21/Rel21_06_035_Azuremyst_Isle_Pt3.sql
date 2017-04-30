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
    SET @cOldContent = '034';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '035';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Azuremyst_Isle_Pt3';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Azuremyst_Isle_Pt3';

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
-- Azuremyst Isle Pt.3

-- Updates
-- Timberstrider Fledgling
UPDATE creature SET position_x = -4077.875732, position_y = -12741.500977, position_z = 8.161140 WHERE guid = 62759;
-- Root Trapper
UPDATE creature SET position_x = -4241.368164, position_y = -12640.386719, position_z = 32.144650 WHERE guid = 61069;
UPDATE creature SET position_x = -4538.382813, position_y = -12559.049805, position_z = 12.969186 WHERE guid = 61052;
UPDATE creature SET position_x = -4419.704590, position_y = -12784.604492, position_z = 19.276653 WHERE guid = 61121;
UPDATE creature SET position_x = -4136.870605, position_y = -12755.530273, position_z = 14.125586 WHERE guid = 61071;
-- Moongraze Stag
UPDATE creature SET position_x = -4402.962891, position_y = -12831.113281, position_z = 17.457964 WHERE guid = 61420;
UPDATE creature SET position_x = -4317.983398, position_y = -12837.599609, position_z = 11.840481 WHERE guid = 61419;
UPDATE creature SET position_x = -4368.180664, position_y = -12622.033203, position_z = 21.209003 WHERE guid = 61416;
UPDATE creature SET position_x = -4282.758789, position_y = -12623.883789, position_z = 28.421310 WHERE guid = 61375;
UPDATE creature SET position_x = -4445.425781, position_y = -12552.083008, position_z = 7.223314 WHERE guid = 61113;
UPDATE creature SET position_x = -4210.263672, position_y = -12916.996094, position_z = 5.888594 WHERE guid = 61345;
UPDATE creature SET position_x = -3914.684326, position_y = -12523.426758, position_z = 31.505592 WHERE guid = 61365;
UPDATE creature SET position_x = -4617.901855, position_y = -12230.699219, position_z = 27.451368 WHERE guid = 61398;
UPDATE creature SET position_x = -4724.282715, position_y = -12038.339844, position_z = 45.884518 WHERE guid = 61330;
-- Moongraze Buck
UPDATE creature SET position_x = -3906.510498, position_y = -12629.440430, position_z = 70.488480 WHERE guid = 61486;
UPDATE creature SET position_x = -3720.003174, position_y = -12422.115234, position_z = -0.605300 WHERE guid = 61474;
UPDATE creature SET position_x = -3853.669922, position_y = -12860.559570, position_z = 9.266397 WHERE guid = 61453;
-- Infected Nightstalker Runt
UPDATE creature SET position_x = -3916.081055, position_y = -12583.702148, position_z = 54.193768 WHERE guid = 61615;
UPDATE creature SET position_x = -3888.236572, position_y = -12539.319336, position_z = 38.619572 WHERE guid = 61612;
UPDATE creature SET position_x = -4349.403809, position_y = -11918.643555, position_z = 1.966087 WHERE guid = 61619;
UPDATE creature SET position_x = -4741.779785, position_y = -11824.409180, position_z = 13.942326 WHERE guid = 61564;
-- Venture Co. Saboteur
UPDATE creature SET position_x = -4646.691895, position_y = -12846.700195, position_z = 2.479708 WHERE guid = 62056;
UPDATE creature SET position_x = -4657.286621, position_y = -12910.658203, position_z = 2.976534 WHERE guid = 62057;
-- Venture Co. Gemologist
UPDATE creature SET position_x = -4627.353516, position_y = -12929.610352, position_z = 7.500469, orientation = 4.794868,  spawndist = 0, MovementType = 0 WHERE guid = 62061;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (62062,62063);

-- Duplicates
DELETE FROM creature WHERE guid IN (61059,61411,61053,61371,61418,61374,61359,61406,61407,61109,61340,61339,61410,61409,61370,61068,61073,62756,62758,61367,61358,61510,61487,62969,86512,62799,62791,61507,3543,61366,61489,61598,61597,61483,61484,61616,61357,62790,61596,61363,61505,61592,61495,3541,61613,61454,61529,61481,61532,62788,61567,61527,61565,61526,62976,61424,61125,61065,61346,61088,61085,61081,61377,61105,61400,62748,61396,61336,61047,61098,61326,61042,61094,61329,61320,61387,61090,62745,61543,61039,61383,61380,61432,61322,61390,61519,61431,61517,61437,62965,61521,61439,61440,61524,61446,62801,61523,61630,61554,61627,61629,61545,61541,61399,61352,61586,61500,61473,61351,61467,61499,61466,4820,8161,61574,61604,61715,61350,61498,61155,61221,61659,62835,61150,61654,61217,61655,61711,61705,61707,61215,61214,62833,61648,8156,61652,61678,61178,61177,61176,61645,62806,61644,61175,61173,61172,61641,61690,62826,61538,61537,62781,61599,61463,61465,61577,61587,61607,61472,61154,61701,62831,61681,62827,61194,62971,61166,61188,62813,61668,61699,61664,61222,61609,61588,61585,61158,61693,62816,3539,3540,61982,28627,61981,2351,2350);
DELETE FROM creature_addon WHERE guid IN (61059,61411,61053,61371,61418,61374,61359,61406,61407,61109,61340,61339,61410,61409,61370,61068,61073,62756,62758,61367,61358,61510,61487,62969,86512,62799,62791,61507,3543,61366,61489,61598,61597,61483,61484,61616,61357,62790,61596,61363,61505,61592,61495,3541,61613,61454,61529,61481,61532,62788,61567,61527,61565,61526,62976,61424,61125,61065,61346,61088,61085,61081,61377,61105,61400,62748,61396,61336,61047,61098,61326,61042,61094,61329,61320,61387,61090,62745,61543,61039,61383,61380,61432,61322,61390,61519,61431,61517,61437,62965,61521,61439,61440,61524,61446,62801,61523,61630,61554,61627,61629,61545,61541,61399,61352,61586,61500,61473,61351,61467,61499,61466,4820,8161,61574,61604,61715,61350,61498,61155,61221,61659,62835,61150,61654,61217,61655,61711,61705,61707,61215,61214,62833,61648,8156,61652,61678,61178,61177,61176,61645,62806,61644,61175,61173,61172,61641,61690,62826,61538,61537,62781,61599,61463,61465,61577,61587,61607,61472,61154,61701,62831,61681,62827,61194,62971,61166,61188,62813,61668,61699,61664,61222,61609,61588,61585,61158,61693,62816,3539,3540,61982,28627,61981,2351,2350);
DELETE FROM creature_movement WHERE id IN (61059,61411,61053,61371,61418,61374,61359,61406,61407,61109,61340,61339,61410,61409,61370,61068,61073,62756,62758,61367,61358,61510,61487,62969,86512,62799,62791,61507,3543,61366,61489,61598,61597,61483,61484,61616,61357,62790,61596,61363,61505,61592,61495,3541,61613,61454,61529,61481,61532,62788,61567,61527,61565,61526,62976,61424,61125,61065,61346,61088,61085,61081,61377,61105,61400,62748,61396,61336,61047,61098,61326,61042,61094,61329,61320,61387,61090,62745,61543,61039,61383,61380,61432,61322,61390,61519,61431,61517,61437,62965,61521,61439,61440,61524,61446,62801,61523,61630,61554,61627,61629,61545,61541,61399,61352,61586,61500,61473,61351,61467,61499,61466,4820,8161,61574,61604,61715,61350,61498,61155,61221,61659,62835,61150,61654,61217,61655,61711,61705,61707,61215,61214,62833,61648,8156,61652,61678,61178,61177,61176,61645,62806,61644,61175,61173,61172,61641,61690,62826,61538,61537,62781,61599,61463,61465,61577,61587,61607,61472,61154,61701,62831,61681,62827,61194,62971,61166,61188,62813,61668,61699,61664,61222,61609,61588,61585,61158,61693,62816,3539,3540,61982,28627,61981,2351,2350);

-- New Spawns
-- Ammen Vale Guardian - missing added
SET @GUID := (SELECT MAX(guid) FROM `creature`);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
-- Root Trapper
(@GUID+1,17196,530,1,1,0,0,-4360.94,-12808.6,15.0649,1.96759,300,10,0,120,0,0,1),
(@GUID+2,17196,530,1,1,0,0,-4324.13,-12714.7,20.3363,1.69559,300,10,0,102,0,0,1),
(@GUID+3,17196,530,1,1,0,0,-4313.96,-12577.6,27.0259,2.89568,300,10,0,102,0,0,1),
(@GUID+4,17196,530,1,1,0,0,-4376.36,-12499.8,12.2845,1.84481,300,5,0,102,0,0,1),
(@GUID+5,17196,530,1,1,0,0,-4398.72,-12576,10.7244,2.95615,300,10,0,102,0,0,1),
(@GUID+6,17196,530,1,1,0,0,-4641.61,-12082.9,46.3232,0.554879,300,10,0,102,0,0,1),
(@GUID+7,17196,530,1,1,0,0,-4602.15,-12156.8,39.3948,1.85079,300,10,0,102,0,0,1),
(@GUID+8,17196,530,1,1,0,0,-4569.9,-12000.1,38.568,3.18596,300,10,0,102,0,0,1),
(@GUID+9,17196,530,1,1,0,0,-4681.82,-11969.4,42.0871,5.94664,300,10,0,120,0,0,1),
(@GUID+10,17196,530,1,1,0,0,-4612.08,-11916.6,33.2494,0.0357301,300,10,0,102,0,0,1),
(@GUID+11,17196,530,1,1,0,0,-4279.97,-12377.5,15.4853,3.06732,300,10,0,120,0,0,1),
-- Moongraze Stag
(@GUID+12,17200,530,1,1,0,0,-4350.83,-12560.6,17.8548,4.13817,300,15,0,102,0,0,1),
(@GUID+13,17200,530,1,1,0,0,-4418.33,-12494.9,5.42334,4.53872,300,15,0,120,0,0,1),
(@GUID+14,17200,530,1,1,0,0,-4626.34,-12029.9,42.1236,1.54841,300,10,0,102,0,0,1),
(@GUID+15,17200,530,1,1,0,0,-4650.45,-11957.3,39.5876,1.85393,300,10,0,120,0,0,1),
(@GUID+16,17200,530,1,1,0,0,-4577.85,-12086.1,41.0203,3.95093,300,10,0,102,0,0,1),
(@GUID+17,17200,530,1,1,0,0,-4652.3,-11829.8,27.323,3.40507,300,10,0,120,0,0,1),
(@GUID+18,17200,530,1,1,0,0,-4611.75,-11838.1,28.6873,6.04401,300,10,0,120,0,0,1),
(@GUID+19,17200,530,1,1,0,0,-4562.2,-11863.6,25.5322,5.36072,300,10,0,102,0,0,1),
(@GUID+20,17200,530,1,1,0,0,-4606.75,-11782.7,30.05,2.00313,300,10,0,102,0,0,1),
(@GUID+22,17200,530,1,1,0,0,-4400.14,-12237.8,8.23238,3.87237,300,10,0,102,0,0,1),
(@GUID+23,17200,530,1,1,0,0,-4462.95,-12247.8,10.952,3.9352,300,10,0,120,0,0,1),
(@GUID+24,17200,530,1,1,0,0,-4385.29,-12318,8.44866,0.483373,300,10,0,102,0,0,1),
-- Moongraze Buck
(@GUID+25,17201,530,1,1,0,0,-4140.62,-11624.2,7.52733,5.52565,300,15,0,156,0,0,1),
(@GUID+26,17201,530,1,1,0,0,-4094.51,-11633,11.0934,4.66171,300,15,0,137,0,0,1),
(@GUID+27,17201,530,1,1,0,0,-4147,-11830.6,6.12684,1.85784,300,15,0,156,0,0,1),
-- Infected Nightstalker Runt
(@GUID+28,17202,530,1,1,0,0,-4553.6,-11823.4,22.5768,3.46397,300,5,0,137,0,0,1),
(@GUID+29,17202,530,1,1,0,0,-4632.69,-11741.1,28.8859,0.0435624,300,10,0,156,0,0,1),
(@GUID+30,17372,530,1,1,0,0,-4668.63,-11740.2,25.9863,1.95993,300,10,0,120,0,0,1),
(@GUID+31,17202,530,1,1,0,0,-4693.8,-11759.5,26.2821,3.49146,300,10,0,137,0,0,1),
(@GUID+32,17202,530,1,1,0,0,-4143.44,-11745,5.06816,2.65031,300,10,0,156,0,0,1),
(@GUID+33,17202,530,1,1,0,0,-4177.06,-11687.1,4.66743,0.62869,300,10,0,156,0,0,1),
(@GUID+34,17202,530,1,1,0,0,-4194.83,-11735.3,8.6577,3.37759,300,10,0,137,0,0,1),
(@GUID+35,17202,530,1,1,0,0,-4081.7,-12206.6,1.88983,5.5688,300,10,0,137,0,0,1),
-- Venture Co. Saboteur
(@GUID+36,17278,530,1,1,0,7,-4652.27,-12882.2,1.64197,6.26514,300,5,0,137,0,0,1),
(@GUID+37,17278,530,1,1,0,7,-4614.51,-12945.7,2.22867,1.78597,300,5,0,137,0,0,1),
(@GUID+38,17278,530,1,1,0,7,-4580.9,-12953.8,5.66783,3.00726,300,5,0,120,0,0,1),
(@GUID+39,17278,530,1,1,0,7,-4579.6,-12928.6,9.08915,3.27823,300,5,0,137,0,0,1),
(@GUID+40,17278,530,1,1,0,7,-4563.96,-12886.2,10.8278,2.04122,300,5,0,137,0,0,1),
-- Venture Co. Gemologist
(@GUID+41,17279,530,1,1,0,2,-4587.22,-12868.8,5.69214,0.596075,300,0,0,131,138,0,0),
(@GUID+42,17279,530,1,1,0,2,-4641.58,-12940.4,8.74258,0.557641,300,0,0,131,138,0,0),
-- Timberstrider Fledgling
(@GUID+43,17372,530,1,1,0,0,-4368.39,-12585.2,16.2519,6.18412,300,20,0,120,0,0,1),
(@GUID+44,17372,530,1,1,0,0,-4469.25,-12826,14.5993,0.249878,300,20,0,120,0,0,1),
(@GUID+45,17372,530,1,1,0,0,-4384.11,-12759.3,17.6633,3.02233,300,20,0,102,0,0,1),
(@GUID+46,17372,530,1,1,0,0,-4718.95,-11800.9,18.0945,2.83565,300,20,0,102,0,0,1),
(@GUID+47,17372,530,1,1,0,0,-4538.29,-11871.8,23.2758,1.59473,300,10,0,102,0,0,1),
(@GUID+48,17372,530,1,1,0,0,-4331.37,-12384.4,18.4657,4.65541,300,10,0,120,0,0,1),
(@GUID+49,17372,530,1,1,0,0,-4253.25,-12276.2,5.20832,6.27569,300,10,0,102,0,0,1),
(@GUID+50,17372,530,1,1,0,0,-4367.79,-12527.2,13.7603,4.84893,300,0,0,120,0,0,2);

-- addon for "Venture Co. Gemologist" - must be diff from others.
INSERT INTO creature_addon (guid, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES 
(@GUID+42,0,0,1,16,0,0,NULL);

-- waypoints
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(@GUID+50,1,-4361.75,-12564.7,17.8645, 0, 0,4.95103, 0, 0),
(@GUID+50,2,-4357.19,-12581.2,16.6095, 0, 0,5.02171, 0, 0),
(@GUID+50,3,-4347.23,-12608.2,16.2666, 0, 0,4.9039, 0, 0),
(@GUID+50,4,-4337.29,-12652,19.158, 0, 0,4.97459, 0, 0),
(@GUID+50,5,-4328.59,-12681.4,22.1035, 0, 0,5.00208, 0, 0),
(@GUID+50,6,-4321.33,-12707.3,21.2292, 0, 0,4.845, 0, 0),
(@GUID+50,7,-4320.25,-12742.9,17.0958, 0, 0,4.73897, 0, 0),
(@GUID+50,8,-4320.57,-12776,17.501, 0, 0,4.6997, 0, 0),
(@GUID+50,9,-4325.61,-12810.2,11.2345, 0, 0,4.57404, 0, 0),
(@GUID+50,10,-4334.29,-12835.4,11.4076, 0, 0,4.27559, 0, 0),
(@GUID+50,11,-4358.05,-12866.5,8.23399, 0, 0,4.4366, 0, 0),
(@GUID+50,12,-4359.32,-12884.7,11.0633, 0, 0,4.62902, 0, 0),
(@GUID+50,13,-4357.22,-12866.7,8.19686, 0, 0,1.32092, 0, 0),
(@GUID+50,14,-4350.96,-12852.4,8.92105, 0, 0,1.0264, 0, 0),
(@GUID+50,15,-4335.67,-12832.5,11.37, 0, 0,1.04211, 0, 0),
(@GUID+50,16,-4326.58,-12805.5,12.2833, 0, 0,1.36019, 0, 0),
(@GUID+50,17,-4320.64,-12780.5,17.1552, 0, 0,1.48193, 0, 0),
(@GUID+50,18,-4320.04,-12752.5,16.1337, 0, 0,1.5644, 0, 0),
(@GUID+50,19,-4319.88,-12728,19.8538, 0, 0,1.5644, 0, 0),
(@GUID+50,20,-4321.54,-12704.9,21.322, 0, 0,1.80237, 0, 0),
(@GUID+50,21,-4328.02,-12682.4,22.0566, 0, 0,1.86599, 0, 0),
(@GUID+50,22,-4332.09,-12669,22.4548, 0, 0,1.86599, 0, 0),
(@GUID+50,23,-4337.18,-12652.3,19.242, 0, 0,1.86599, 0, 0),
(@GUID+50,24,-4342.47,-12629.3,17.0402, 0, 0,1.74347, 0, 0),
(@GUID+50,25,-4348.19,-12606.7,16.3894, 0, 0,1.98851, 0, 0),
(@GUID+50,26,-4353.1,-12592.6,17.1929, 0, 0,1.8707, 0, 0),
(@GUID+50,27,-4359.31,-12572.5,17.4963, 0, 0,1.8707, 0, 0),
(@GUID+50,28,-4369.39,-12522.9,13.4409, 0, 0,1.80316, 0, 0);
    
    

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

