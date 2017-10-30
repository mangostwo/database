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
    SET @cOldContent = '076';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '077';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'HallowsEnd_updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'HallowsEnd_updates';

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

    	SET @GUID := (SELECT MAX(guid) FROM `gameobject`);
	SET @ENTRY := (SELECT MAX(entry) FROM `gameobject_template`);


	-- Quest Update
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12396; 
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12401; 
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12400; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12375; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12381; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12383; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12362; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12378; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12379; 
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12398; 
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12399; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12377; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12374; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12361; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12386; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12366; 
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12367;  
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12345;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12341;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12334;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12349;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12350;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12331;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12333;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12338;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12348;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12337;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12347;
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12402;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12380;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12365;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12373;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12387;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12369;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12382;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12363;
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12397;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12385;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12364;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12376;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12370;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12371;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12384;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12368;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12332;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12286;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12351;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12339;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12336;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12343;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12344;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12346;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12335;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12342;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12340;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12394;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12389;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12388;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12391;
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12406;
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12408;
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12403;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12393;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12392;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12395;
	UPDATE quest_template SET RequiredRaces = 690 WHERE entry = 12390;
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12407;
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12404;
	UPDATE quest_template SET RequiredRaces = 0 WHERE entry = 12409;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12358;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12352;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12357;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12356;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12354;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12359;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12353;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12360;
	UPDATE quest_template SET RequiredRaces = 1101 WHERE entry = 12355;

	-- Add Missing Object_template
	INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES
	(@ENTRY+1,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+2,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+3,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+4,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+5,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+6,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+7,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+8,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+9,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+10,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+11,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+12,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+13,2,6404,'Candy Bucket','','','',1744,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+14,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+15,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+16,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+17,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+18,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+19,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+20,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+21,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+22,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+23,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+24,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+25,2,6404,'Candy Bucket','','','',1744,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+26,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+27,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+28,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+29,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+30,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+31,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+32,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+33,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+34,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(@ENTRY+35,2,6404,'Candy Bucket','','','',1735,4,1,0,0,0,0,0,0,0,8938,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);


	-- Add missing spawns
	INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
	(@GUID+1,@ENTRY+1,530,1,1,-566.872,4150.64,68.0928,-1.15192,0,0,-0.54464,0.83867,180,100,1),
	(@GUID+2,@ENTRY+2,1,1,1,-2378.77,-1994.53,96.7048,2.07694,0,0,0.861629,0.507539,180,100,1),
	(@GUID+3,@ENTRY+3,1,1,1,-1595.17,3150.9,46.4944,0.017453,0,0,0.00872639,0.999962,180,100,1),
	(@GUID+4,@ENTRY+4,1,1,1,-2363.67,-345.607,-8.95699,0.558505,0,0,0.275637,0.961262,180,100,1),
	(@GUID+5,@ENTRY+5,1,1,1,895.011,929.801,106.258,0.331613,0,0,0.165048,0.986286,180,100,1),
	(@GUID+6,@ENTRY+6,1,1,1,-408.149,-2642.81,96.223,-0.663225,0,0,-0.325568,0.945519,180,100,1),
	(@GUID+7,@ENTRY+7,1,1,1,342.447,-4687.63,16.4578,-1.11701,0,0,-0.529919,0.848048,180,100,1),
	(@GUID+8,@ENTRY+8,1,1,1,1631.84,-4444.22,15.4065,2.93215,0,0,0.994522,0.10453,180,100,1),
	(@GUID+9,@ENTRY+9,1,1,1,-1301.73,40.5221,129.209,1.65806,0,0,0.737276,0.675591,180,100,1),
	(@GUID+10,@ENTRY+10,0,1,1,-913.192,-3526.9,72.6024,-2.26893,0,0,-0.906308,0.422617,180,100,1),
	(@GUID+11,@ENTRY+11,530,1,1,9688.54,-7362.99,11.9295,-0.349066,0,0,-0.173648,0.984808,180,100,1),
	(@GUID+12,@ENTRY+12,0,1,1,2266.64,244.856,34.2569,0.645772,0,0,0.317305,0.948324,180,100,1),
	(@GUID+13,@ENTRY+13,0,1,1,-14456.4,494.096,15.1261,-1.36136,0,0,-0.629322,0.777145,180,100,1),
	(@GUID+14,@ENTRY+14,0,1,1,-6652.56,-2148.98,245.351,0.15708,0,0,0.0784593,0.996917,180,100,1),
	(@GUID+15,@ENTRY+15,530,1,1,9469.68,-6861.26,17.4359,2.67035,0,0,0.972369,0.233447,180,100,1),
	(@GUID+16,@ENTRY+16,0,1,1,-4.40115,-945.557,57.165,-2.86234,0,0,-0.990268,0.139173,180,100,1),
	(@GUID+17,@ENTRY+17,530,1,1,9565.64,-7219.54,16.2122,-1.18682,0,0,-0.559191,0.829039,180,100,1),
	(@GUID+18,@ENTRY+18,0,1,1,-10487.7,-3256.98,21.0293,1.27409,0,0,0.594823,0.803857,600,100,1),
	(@GUID+19,@ENTRY+19,0,1,1,1638.49,223.114,-43.1032,-1.22173,0,0,-0.573576,0.819152,180,100,1),
	(@GUID+20,@ENTRY+20,530,1,1,191.673,2605.61,87.2835,-2.28638,0,0,-0.909961,0.414694,180,100,1),
	(@GUID+21,@ENTRY+21,530,1,1,-2626.18,4451.71,36.0935,0.314159,0,0,0.156434,0.987688,180,100,1),
	(@GUID+22,@ENTRY+22,530,1,1,-1228.37,7164.28,57.2651,-2.51327,0,0,-0.951056,0.309019,180,100,1),
	(@GUID+23,@ENTRY+23,530,1,1,-2963.83,2559.04,78.1715,-1.69297,0,0,-0.748956,0.66262,180,100,1),
	(@GUID+24,@ENTRY+24,530,1,1,230.295,7935.66,25.0778,0.680678,0,0,0.333807,0.942642,180,100,1),
	(@GUID+25,@ENTRY+25,530,1,1,-2187.64,5399.79,51.8825,2.63545,0,0,0.968148,0.250379,180,100,1),
	(@GUID+26,@ENTRY+26,1,1,1,2343.53,-2565.08,102.773,-1.8675,0,0,-0.803856,0.594824,180,100,1),
	(@GUID+27,@ENTRY+27,0,1,1,-12432.1,210.888,2.36627,4.42687,0,0,0.200517,-0.899311,25,255,1),
	(@GUID+28,@ENTRY+28,0,1,1,-5599.09,-531.191,399.652,3.91001,0,0,0.727096,0.374824,25,255,1),
	(@GUID+29,@ENTRY+29,530,1,1,2398.942,5947.74,152.1097,5.35174,0,0,0.349069,-0.893497,25,255,1),
	(@GUID+30,@ENTRY+30,530,1,1,8709.93,-6639.72,72.7451,4.7681,0,0,0.158605,-0.988638,25,255,1),
	(@GUID+31,@ENTRY+31,530,1,1,7564.91,-6889.68,96.027,1.86499,0,0,0.791934,-0.271772,25,255,1),
	(@GUID+32,@ENTRY+32,0,1,1,-622.46,-4586.83,11.6871,2.38776,0,0,0.929804,0.768055,25,255,1),
	(@GUID+33,@ENTRY+33,1,1,1,-4458.1,241.78,39.1077,0.612938,0,0,0.978005,0.438761,25,255,1),
	(@GUID+34,@ENTRY+34,1,1,1,-3169.65,-2906.28,35.4082,0.615869,0,0,0.303091,0.952962,25,255,1),
	(@GUID+35,@ENTRY+35,0,1,1,505.475,1635.27,125.942,0.706237,0,0,0.345826,0.938299,25,255,1),
	(@GUID+36,180523,0,1,1,-12440.2,208.918,2.36633,0.700148,0,0,0.342968,0.939347,25,255,1),
	(@GUID+37,180523,0,1,1,514.024,1639.72,125.944,3.78108,0,0,0.949317,-0.314321,25,255,1),
	(@GUID+38,180523,530,1,1,2408.46,5950.91,152.25,4.41475,0,0,0.804135,-0.594447,25,255,1),
	(@GUID+39,180523,530,1,1,8695.13,-6641.77,72.7443,0.583283,0,0,0.287525,0.957773,25,255,1),
	(@GUID+40,180523,530,1,1,7556.42,-6883.36,96.0268,4.81186,0,0,0.671079,-0.741386,25,255,1),
	(@GUID+41,180523,0,1,1,-628.346,-4577.41,11.6873,5.42411,0,0,0.41645,-0.909159,25,255,1),
	(@GUID+42,180523,1,1,1,-4465.85,244.14,39.1075,5.99318,0,0,0.144497,-0.989505,25,255,1),
	(@GUID+43,180412,0,1,1,-12432.1,210.888,2.36627,4.42687,0,0,0.200517,-0.899311,25,255,1),
	(@GUID+44,180412,0,1,1,-5599.09,-531.191,399.652,3.91001,0,0,0.727096,0.374824,25,255,1),
	(@GUID+45,180412,530,1,1,2398.942,5947.74,152.1097,5.35174,0,0,0.349069,-0.893497,25,255,1),
	(@GUID+46,180412,530,1,1,8709.93,-6639.72,72.7451,4.7681,0,0,0.158605,-0.988638,25,255,1),
	(@GUID+47,180412,530,1,1,7564.91,-6889.68,96.027,1.86499,0,0,0.791934,-0.271772,25,255,1),
	(@GUID+48,180412,0,1,1,-622.46,-4586.83,11.6871,2.38776,0,0,0.929804,0.768055,25,255,1),
	(@GUID+49,180412,1,1,1,-4458.1,241.78,39.1077,0.612938,0,0,0.978005,0.438761,25,255,1),
	(@GUID+50,180412,1,1,1,-3169.65,-2906.28,35.4082,0.615869,0,0,0.303091,0.952962,25,255,1),
	(@GUID+51,180412,0,1,1,505.475,1635.27,125.942,0.706237,0,0,0.345826,0.938299,25,255,1),
	(@GUID+52,180407,530,1,1,8727.89,-6661.73,70.3469,0.575423,0,0,0.623759,0.958896,25,255,1),
	(@GUID+53,180405,530,1,1,8722.88,-6665.86,70.2634,0.686099,0,0,0.52746,0.948272,25,255,1),
	(@GUID+54,180405,530,1,1,8753.78,-6699.27,70.3864,4.1271,0,0,0.621933,-0.571024,25,255,1),
	(@GUID+55,180407,530,1,1,8752.88,-6701.59,70.3053,0.179072,0,0,0.124589,0.296105,25,255,1),
	(@GUID+56,180406,530,1,1,8749.92,-6699.65,69.2833,5.15506,0,0,0.534626,-0.845089,25,255,1),
	(@GUID+57,180405,530,1,1,8683.52,-6621.74,70.3663,4.11047,0,0,0.884936,-0.465713,25,255,1),
	(@GUID+58,180406,530,1,1,8688.63,-6617.45,70.3668,4.52534,0,0,0.981649,-0.490699,25,255,1),
	(@GUID+59,180406,530,1,1,8703.48,-6639.11,82.7022,2.19091,0,0,0.689137,0.887642,25,255,1),
	(@GUID+60,180406,530,1,1,8703.48,-6639.11,82.7022,2.17091,0,0,0.636137,0.527642,25,255,1),
	(@GUID+61,180407,530,1,1,8698.54,-6633.67,82.7017,2.57668,0,0,-0.967677,0.894127,25,255,1),
	(@GUID+62,180407,530,1,1,7571.46,-6855.12,93.3528,0.11361,0,0,0.892349,0.020189,25,255,1),
	(@GUID+63,180405,530,1,1,7577.18,-6858.22,93.3799,0.1362,0,0,0.979943,0.100191,25,255,1),
	(@GUID+64,180406,530,1,1,7512.12,-6857.62,84.8309,3.8615,0,0,0.735913,-0.35223,25,255,1),
	(@GUID+65,180407,530,1,1,7576.77,-6780.8,87.4625,3.70303,0,0,0.976054,0.60653,25,255,1),
	(@GUID+66,180405,530,1,1,7565.44,-6799.02,87.4457,2.73444,0,0,0.97935,0.962172,25,255,1),
	(@GUID+67,180407,530,1,1,7572.41,-6819.11,86.698,3.36783,0,0,0.145605,0.098114,25,255,1),
	(@GUID+68,180405,530,1,1,7553.09,-6817.69,87.039,1.68749,0,0,-0.467139,0.664668,25,255,1),
	(@GUID+69,180406,530,1,1,7553.35,-6800.27,87.1486,4.317,0,0,0.422216,-0.604451,25,255,1),
	(@GUID+70,180407,0,1,1,-601.424,-4597.68,12.3865,3.94734,0,0,0.700887,0.99746,25,255,1),
	(@GUID+71,180406,0,1,1,-606.354,-4602.54,12.3823,0.815379,0,0,0.596489,0.928039,25,255,1),
	(@guid+72,180405,0,1,1,-636,-4569.86,12.2899,5.4139,0,0,0.421088,0.60702,25,255,1),
	(@guid+73,180407,0,1,1,-5587.53,-531.28,399.652,4.23202,0,0,0.855017,-0.6186,25,255,1),
	(@guid+74,180407,0,1,1,-5591.58,-507.733,405.01,6.21121,0,0,0.814582,-0.999352,25,255,1),
	(@guid+75,180405,0,1,1,-5585.18,-461.574,414.448,0.39048,0,0,0.190809,0.981627,25,255,1);

	-- Quest relations
	INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
	(190100,12394),
	(190081,12379),
	(190116,12409),
	(194081,13474),
	(@ENTRY+1,12389),
	(@ENTRY+2,12375),
	(@ENTRY+3,12381),
	(@ENTRY+4,12362),
	(@ENTRY+5,12378),
	(@ENTRY+6,12374),
	(@ENTRY+7,12361),
	(@ENTRY+8,12366),
	(@ENTRY+9,12367),
	(@ENTRY+10,12380),
	(@ENTRY+11,12369),
	(@ENTRY+12,12363),
	(@ENTRY+13,12397),
	(@ENTRY+14,12385),
	(@ENTRY+15,12364),
	(@ENTRY+16,12376),
	(@ENTRY+17,12370),
	(@ENTRY+18,12384),
	(@ENTRY+19,12368),
	(@ENTRY+20,12388),
	(@ENTRY+21,12391),
	(@ENTRY+22,12392),
	(@ENTRY+23,12395),
	(@ENTRY+24,12390),
	(@ENTRY+25,12404),
	(@Entry+26,12377),
	(@ENTRY+27,12382),
	(@ENTRY+28,12332),
	(@ENTRY+29,12393),
	(@ENTRY+30,12365),
	(@ENTRY+31,12373),
	(@ENTRY+32,12387),
	(@ENTRY+33,12386),
	(@ENTRY+34,12383),
	(@ENTRY+35,12371);

	INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
	(190100,12394),
	(190081,12379),
	(190116,12409),
	(194081,13474),
	(@ENTRY+1,12389),
	(@ENTRY+2,12375),
	(@ENTRY+3,12381),
	(@ENTRY+4,12362),
	(@ENTRY+5,12378),
	(@ENTRY+6,12374),
	(@ENTRY+7,12361),
	(@ENTRY+8,12366),
	(@ENTRY+9,12367),
	(@ENTRY+10,12380),
	(@ENTRY+11,12369),
	(@ENTRY+12,12363),
	(@ENTRY+13,12397),
	(@ENTRY+14,12385),
	(@ENTRY+15,12364),
	(@ENTRY+16,12376),
	(@ENTRY+17,12370),
	(@ENTRY+18,12384),
	(@ENTRY+19,12368),
	(@ENTRY+20,12388),
	(@ENTRY+21,12391),
	(@ENTRY+22,12392),
	(@ENTRY+23,12395),
	(@ENTRY+24,12390),
	(@ENTRY+25,12404),
	(@Entry+26,12377),
	(@ENTRY+27,12382),
	(@ENTRY+28,12332),
	(@ENTRY+29,12393),
	(@ENTRY+30,12365),
	(@ENTRY+31,12373),
	(@ENTRY+32,12387),
	(@ENTRY+33,12386),
	(@ENTRY+34,12383),
	(@ENTRY+35,12371);


	-- Add new objects to event`
	INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
	(@guid+1,12),
	(@guid+2,12),
	(@guid+3,12),
	(@guid+4,12),
	(@guid+5,12),
	(@guid+6,12),
	(@guid+7,12),
	(@guid+8,12),
	(@guid+9,12),
	(@guid+10,12),
	(@guid+11,12),
	(@guid+12,12),
	(@guid+13,12),
	(@guid+14,12),
	(@guid+15,12),
	(@guid+16,12),
	(@guid+17,12),
	(@guid+18,12),
	(@guid+19,12),
	(@guid+20,12),
	(@guid+21,12),
	(@guid+22,12),
	(@guid+23,12),
	(@guid+24,12),
	(@guid+25,12),
	(@guid+26,12),
	(@guid+27,12),
	(@guid+28,12),
	(@guid+29,12),
	(@guid+30,12),
	(@guid+31,12),
	(@guid+32,12),
	(@guid+33,12),
	(@guid+34,12),
	(@guid+35,12),
	(@guid+36,12),
	(@guid+37,12),
	(@guid+38,12),
	(@guid+39,12),
	(@guid+40,12),
	(@guid+41,12),
	(@guid+42,12),
	(@guid+43,12),
	(@GUID+44,12),
	(@GUID+45,12),
	(@GUID+46,12),
	(@GUID+47,12),
	(@GUID+48,12),
	(@GUID+49,12),
	(@GUID+50,12),
	(@GUID+51,12),
	(@GUID+52,12),
	(@GUID+53,12),
	(@GUID+54,12),
	(@GUID+55,12),
	(@GUID+56,12),
	(@GUID+57,12),
	(@GUID+58,12),
	(@GUID+59,12),
	(@GUID+60,12),
	(@GUID+61,12),
	(@GUID+62,12),
	(@GUID+63,12),
	(@GUID+64,12),
	(@GUID+65,12),
	(@GUID+66,12),
	(@GUID+67,12),
	(@GUID+68,12),
	(@GUID+69,12),
	(@GUID+70,12),
	(@GUID+71,12),
	(@GUID+72,12),
	(@GUID+73,21),
	(@GUID+74,21),
	(@GUID+75,21);


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

