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
    SET @cOldStructure = '07'; 
    SET @cOldContent = '001';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '002';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Dragonblight_Update_Pt1';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Dragonblight_Update_Pt1';

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

	SET @GUID := (SELECT MAX(guid) FROM `creature`); 
	SET @CONDITION := (SELECT MAX(condition_entry) FROM `conditions`);

	-- ----------------------------------------
	-- Rabbid Grizzly And Blighted Elk
	-- ----------------------------------------
	
	-- Update spawn location, spawndist and movetype.
	-- Rabbid Grizzly
	UPDATE `creature` SET `position_x`=3674.972,`position_y`=-1545.719,`position_z`=125.1534,`spawndist`=40,`MovementType`=1 WHERE `guid`=97924;
	UPDATE `creature` SET `position_x`=3581.679,`position_y`=-1548.734,`position_z`=106.8039,`spawndist`=40,`MovementType`=1 WHERE `guid`=97925;
	UPDATE `creature` SET `position_x`=3725.355,`position_y`=-1507.923,`position_z`=137.015,`spawndist`=40,`MovementType`=1 WHERE `guid`=97926;
	UPDATE `creature` SET `position_x`=3354.405,`position_y`=-1390.666,`position_z`=101.1684,`spawndist`=40,`MovementType`=1 WHERE `guid`=97933;
	UPDATE `creature` SET `position_x`=3315.41,`position_y`=-1447.463,`position_z`=99.17495,`spawndist`=40,`MovementType`=1 WHERE `guid`=97934;
	UPDATE `creature` SET `position_x`=3458.048,`position_y`=-1343.006,`position_z`=104.8615,`spawndist`=40,`MovementType`=1 WHERE `guid`=97935;
	UPDATE `creature` SET `position_x`=3386.716,`position_y`=-1336.782,`position_z`=112.3357,`spawndist`=40,`MovementType`=1 WHERE `guid`=97936;
	UPDATE `creature` SET `position_x`=3359.434,`position_y`=-1477.367,`position_z`=97.83865,`spawndist`=40,`MovementType`=1 WHERE `guid`=97937;
	UPDATE `creature` SET `position_x`=3447.366,`position_y`=-1519.236,`position_z`=105.5042,`spawndist`=40,`MovementType`=1 WHERE `guid`=97938;
	UPDATE `creature` SET `position_x`=3825.158,`position_y`=1896.699,`position_z`=102.3989,`spawndist`=40,`MovementType`=1 WHERE `guid`=97939;
	UPDATE `creature` SET `position_x`=4526.301,`position_y`=-1149.871,`position_z`=164.2126,`spawndist`=40,`MovementType`=1 WHERE `guid`=97941;
	UPDATE `creature` SET `position_x`=4591.06,`position_y`=-1206.053,`position_z`=160.5859,`spawndist`=40,`MovementType`=1 WHERE `guid`=97943;
	UPDATE `creature` SET `position_x`=4771.562,`position_y`=-1119.283,`position_z`=171.3407,`spawndist`=40,`MovementType`=1 WHERE `guid`=97944;
	UPDATE `creature` SET `position_x`=3777.84,`position_y`=1941.948,`position_z`=94.28677,`spawndist`=40,`MovementType`=1 WHERE `guid`=97947;
	UPDATE `creature` SET `position_x`=4859.399,`position_y`=-1125.539,`position_z`=172.8725,`spawndist`=40,`MovementType`=1 WHERE `guid`=97948;
	UPDATE `creature` SET `position_x`=4757.966,`position_y`=-1021.893,`position_z`=176.8922,`spawndist`=40,`MovementType`=1 WHERE `guid`=97949;
	UPDATE `creature` SET `position_x`=3768.44,`position_y`=1887.52,`position_z`=97.87565,`spawndist`=40,`MovementType`=1 WHERE `guid`=97950;
	UPDATE `creature` SET `position_x`=3812.445,`position_y`=1861.433,`position_z`=108.1736,`spawndist`=40,`MovementType`=1 WHERE `guid`=97951;
	UPDATE `creature` SET `position_x`=4743.82,`position_y`=-1147.219,`position_z`=168.8231,`spawndist`=40,`MovementType`=1 WHERE `guid`=97952;
	UPDATE `creature` SET `position_x`=3721.028,`position_y`=1945.43,`position_z`=88.48814,`spawndist`=40,`MovementType`=1 WHERE `guid`=97953;
	UPDATE `creature` SET `position_x`=3761.285,`position_y`=2241.759,`position_z`=96.82263,`spawndist`=40,`MovementType`=1 WHERE `guid`=97954;
	UPDATE `creature` SET `position_x`=3694.484,`position_y`=2272.453,`position_z`=90.73898,`spawndist`=40,`MovementType`=1 WHERE `guid`=97955;
	UPDATE `creature` SET `position_x`=3659.208,`position_y`=2092.007,`position_z`=75.23358,`spawndist`=40,`MovementType`=1 WHERE `guid`=97956;
	UPDATE `creature` SET `position_x`=3726.339,`position_y`=2078.011,`position_z`=89.947,`spawndist`=40,`MovementType`=1 WHERE `guid`=97957;
	UPDATE `creature` SET `position_x`=3647.617,`position_y`=2036.457,`position_z`=80.73811,`spawndist`=40,`MovementType`=1 WHERE `guid`=97958;
	UPDATE `creature` SET `position_x`=3650.088,`position_y`=2218.333,`position_z`=79.86362,`spawndist`=40,`MovementType`=1 WHERE `guid`=97959;
	UPDATE `creature` SET `position_x`=3696.122,`position_y`=1999.927,`position_z`=86.19173,`spawndist`=40,`MovementType`=1 WHERE `guid`=97960;
	UPDATE `creature` SET `position_x`=3701.578,`position_y`=2257.144,`position_z`=91.54858,`spawndist`=40,`MovementType`=1 WHERE `guid`=97961;
	UPDATE `creature` SET `position_x`=3876.65,`position_y`=1873.132,`position_z`=115.3001,`spawndist`=40,`MovementType`=1 WHERE `guid`=97962;
	UPDATE `creature` SET `position_x`=4576.166,`position_y`=-1241.52,`position_z`=157.2078,`spawndist`=40,`MovementType`=1 WHERE `guid`=97963;
	-- Blighted Elk
	UPDATE `creature` SET `position_x`=3769.541,`position_y`=2530.065,`position_z`=117.7691,`spawndist`=20,`MovementType`=1 WHERE `guid`=119383;
	UPDATE `creature` SET `position_x`=3462.592,`position_y`=-1279.985,`position_z`=116.5794,`spawndist`=20,`MovementType`=1 WHERE `guid`=119384;
	UPDATE `creature` SET `position_x`=3710.28,`position_y`=-1477.736,`position_z`=136.7427,`spawndist`=20,`MovementType`=1 WHERE `guid`=119399;
	UPDATE `creature` SET `position_x`=3611.447,`position_y`=-1540.51,`position_z`=114.1355,`spawndist`=20,`MovementType`=1 WHERE `guid`=119400;
	UPDATE `creature` SET `position_x`=3724.334,`position_y`=-1528.853,`position_z`=133.9351,`spawndist`=20,`MovementType`=1 WHERE `guid`=119401;
	UPDATE `creature` SET `position_x`=3567.675,`position_y`=-1506.327,`position_z`=110.5271,`spawndist`=20,`MovementType`=1 WHERE `guid`=119402;
	UPDATE `creature` SET `position_x`=3653.411,`position_y`=2684.082,`position_z`=95.13617,`spawndist`=20,`MovementType`=1 WHERE `guid`=119403;
	UPDATE `creature` SET `position_x`=3629.182,`position_y`=2699.441,`position_z`=88.77927,`spawndist`=20,`MovementType`=1 WHERE `guid`=119404;
	UPDATE `creature` SET `position_x`=3325.41,`position_y`=-1392.791,`position_z`=99.94428,`spawndist`=20,`MovementType`=1 WHERE `guid`=119407;
	UPDATE `creature` SET `position_x`=3362.972,`position_y`=-1454.299,`position_z`=99.46684,`spawndist`=20,`MovementType`=1 WHERE `guid`=119408;
	UPDATE `creature` SET `position_x`=3438.784,`position_y`=-1489.247,`position_z`=105.4027,`spawndist`=20,`MovementType`=1 WHERE `guid`=119409;
	UPDATE `creature` SET `position_x`=3424.896,`position_y`=-1398.52,`position_z`=104.6269,`spawndist`=20,`MovementType`=1 WHERE `guid`=119410;
	UPDATE `creature` SET `position_x`=3317.239,`position_y`=-1512.616,`position_z`=93.65372,`spawndist`=20,`MovementType`=1 WHERE `guid`=119411;
	UPDATE `creature` SET `position_x`=3411.317,`position_y`=-1331.348,`position_z`=114.5986,`spawndist`=20,`MovementType`=1 WHERE `guid`=119412;
	UPDATE `creature` SET `position_x`=3835.641,`position_y`=2754.043,`position_z`=126.078,`spawndist`=20,`MovementType`=1 WHERE `guid`=119413;
	UPDATE `creature` SET `position_x`=3864.524,`position_y`=2720.816,`position_z`=138.9441,`spawndist`=20,`MovementType`=1 WHERE `guid`=119414;
	UPDATE `creature` SET `position_x`=3796.153,`position_y`=1986.839,`position_z`=93.06065,`spawndist`=20,`MovementType`=1 WHERE `guid`=119429;
	UPDATE `creature` SET `position_x`=3787.26,`position_y`=2604.018,`position_z`=133.102,`spawndist`=20,`MovementType`=1 WHERE `guid`=119430;
	UPDATE `creature` SET `position_x`=3656.297,`position_y`=2460.875,`position_z`=100.6227,`spawndist`=20,`MovementType`=1 WHERE `guid`=119432;
	UPDATE `creature` SET `position_x`=3788.465,`position_y`=2442.043,`position_z`=120.0203,`spawndist`=20,`MovementType`=1 WHERE `guid`=119433;
	UPDATE `creature` SET `position_x`=4558.611,`position_y`=-1148.118,`position_z`=165.347,`spawndist`=20,`MovementType`=1 WHERE `guid`=119434;
	UPDATE `creature` SET `position_x`=4533.039,`position_y`=-1242.603,`position_z`=156.4713,`spawndist`=20,`MovementType`=1 WHERE `guid`=119436;
	UPDATE `creature` SET `position_x`=4545.936,`position_y`=-1235.534,`position_z`=157.0046,`spawndist`=20,`MovementType`=1 WHERE `guid`=119437;
	UPDATE `creature` SET `position_x`=3752.236,`position_y`=1920.594,`position_z`=94.03116,`spawndist`=20,`MovementType`=1 WHERE `guid`=119438;
	UPDATE `creature` SET `position_x`=3837.325,`position_y`=1836.088,`position_z`=115.0738,`spawndist`=20,`MovementType`=1 WHERE `guid`=119439;
	UPDATE `creature` SET `position_x`=4828.848,`position_y`=-1071.84,`position_z`=178.9242,`spawndist`=20,`MovementType`=1 WHERE `guid`=119440;
	UPDATE `creature` SET `position_x`=4772.131,`position_y`=-1175.265,`position_z`=167.793,`spawndist`=20,`MovementType`=1 WHERE `guid`=119441;
	UPDATE `creature` SET `position_x`=3766.535,`position_y`=1891.877,`position_z`=97.08678,`spawndist`=20,`MovementType`=1 WHERE `guid`=119442;
	UPDATE `creature` SET `position_x`=4723.257,`position_y`=-1087.453,`position_z`=168.1605,`spawndist`=20,`MovementType`=1 WHERE `guid`=119443;
	UPDATE `creature` SET `position_x`=4828.682,`position_y`=-1188.057,`position_z`=168.7404,`spawndist`=20,`MovementType`=1 WHERE `guid`=119444;
	UPDATE `creature` SET `position_x`=3692.743,`position_y`=2005.026,`position_z`=85.53523,`spawndist`=20,`MovementType`=1 WHERE `guid`=119447;
	UPDATE `creature` SET `position_x`=3677.217,`position_y`=1943.266,`position_z`=82.29243,`spawndist`=20,`MovementType`=1 WHERE `guid`=119451;
	UPDATE `creature` SET `position_x`=3701.05,`position_y`=2753.01,`position_z`=101.3091,`spawndist`=20,`MovementType`=1 WHERE `guid`=119452;
	UPDATE `creature` SET `position_x`=3721.346,`position_y`=2628.731,`position_z`=123.0992,`spawndist`=20,`MovementType`=1 WHERE `guid`=119455;
	UPDATE `creature` SET `position_x`=3712.48,`position_y`=2697.751,`position_z`=110.9469,`spawndist`=20,`MovementType`=1 WHERE `guid`=119456;
	UPDATE `creature` SET `position_x`=3847.19,`position_y`=2658.58,`position_z`=134.5141,`spawndist`=20,`MovementType`=1 WHERE `guid`=119460;
	UPDATE `creature` SET `position_x`=3678.947,`position_y`=2529.354,`position_z`=104.3822,`spawndist`=20,`MovementType`=1 WHERE `guid`=119461;
	UPDATE `creature` SET `position_x`=3756.658,`position_y`=2243.094,`position_z`=96.22563,`spawndist`=20,`MovementType`=1 WHERE `guid`=119462;
	UPDATE `creature` SET `position_x`=3693.35,`position_y`=2275.083,`position_z`=91.12367,`spawndist`=20,`MovementType`=1 WHERE `guid`=119465;
	UPDATE `creature` SET `position_x`=3683.214,`position_y`=2298.295,`position_z`=89.95014,`spawndist`=20,`MovementType`=1 WHERE `guid`=119466;
	UPDATE `creature` SET `position_x`=3769.345,`position_y`=2108.244,`position_z`=91.09624,`spawndist`=20,`MovementType`=1 WHERE `guid`=119468;
	UPDATE `creature` SET `position_x`=3723.727,`position_y`=2055.313,`position_z`=89.48338,`spawndist`=20,`MovementType`=1 WHERE `guid`=119469;
	UPDATE `creature` SET `position_x`=3669.428,`position_y`=2079.908,`position_z`=74.83839,`spawndist`=20,`MovementType`=1 WHERE `guid`=119474;
	UPDATE `creature` SET `position_x`=3626.92,`position_y`=2125.816,`position_z`=79.36228,`spawndist`=20,`MovementType`=1 WHERE `guid`=119475;
	UPDATE `creature` SET `position_x`=3670.877,`position_y`=2227.201,`position_z`=86.91707,`spawndist`=20,`MovementType`=1 WHERE `guid`=119476;
	UPDATE `creature` SET `position_x`=3629.536,`position_y`=2141.802,`position_z`=76.86629,`spawndist`=20,`MovementType`=1 WHERE `guid`=119485;
	UPDATE `creature` SET `position_x`=3738.834,`position_y`=2365.373,`position_z`=128.0211,`spawndist`=20,`MovementType`=1 WHERE `guid`=119486;
	-- Remove duplicates 
	DELETE FROM `creature` WHERE guid IN (97954,97955,97956,97957,97958,97959,97960,97961,97962,97963,97964,97965,97966,97967,97969,97970,97971,97972,97973,97974,97975,97976,97977,97979,97980,97981,119488,119489,119490,119491,119492,119493,119494,119495,119496,119497,119498,119499,119500,119501,119503,138624,138628);
	
	-- ----------------------------------------
	-- Arctic Grizzly and Arctic Grizzly Cub
	-- ----------------------------------------
	
	-- NPC 26482 Updates
	UPDATE`creature` SET`position_x`=4482.067,`position_y`=1063.2,`position_z`=142.5148,`spawndist`=0,`MovementType`=2,`currentwaypoint`=1 WHERE`guid`=106548;
	UPDATE`creature` SET`position_x`=2872.004,`position_y`=-617.599,`position_z`=90.25565,`spawndist`=0,`MovementType`=2,`currentwaypoint`=3 WHERE guid=106521;
	UPDATE`creature` SET`position_x`=2801.59,`position_y`=-638.054,`position_z`=83.4044,`spawndist`=0,`MovementType`=2,`currentwaypoint`=1 WHERE guid=106587;
	UPDATE`creature` SET`position_x`=2849.762,`position_y`=-576.8463,`position_z`=90.46647,`spawndist`=0,`MovementType`=2,`currentwaypoint`=2 WHERE`guid`=106528;
	UPDATE`creature` SET`position_x`=2975.161,`position_y`=-568.6041,`position_z`=99.0344,`spawndist`=0,`MovementType`=2,`currentwaypoint`=13 WHERE`guid`=106552;
	UPDATE`creature` SET`position_x`=3066.887,`position_y`=-655.2159,`position_z`=92.61248, spawndist=0,`MovementType`=2,`currentwaypoint`=4 WHERE`guid`=106531;
	UPDATE`creature` SET`position_x`=3123.29,`position_y`=-723.4763,`position_z`=85.07823,`spawndist`=0,`MovementType`=2,`currentwaypoint`=1 WHERE`guid`=106527;
	UPDATE`creature` SET`position_x`=4382.762,`position_y`=-1433.094,`position_z`=162.7112,`spawndist`=0,`MovementType`=2,`currentwaypoint`=4 WHERE`guid`=106519;
	UPDATE`creature` SET`position_x`=4360.607,`position_y`=-1271.646,`position_z`=173.4728,`spawndist`=0,`MovementType`=2,`currentwaypoint`=1 WHERE`guid`=106517;
	UPDATE`creature` SET`position_x`=4311.422,`position_y`=-1158.499,`position_z`=191.0089,`spawndist`=0,`MovementType`=2,`currentwaypoint`=2 WHERE`guid`=106589;
	UPDATE`creature` SET`position_x`=4280.963,`position_y`=-715.996,`position_z`=131.1693,`spawndist`=0,`MovementType`=2,`currentwaypoint`=1 WHERE`guid`=106518;
	UPDATE`creature` SET`position_x`=4295.652,`position_y`=-952.1318,`position_z`=167.3483,`spawndist`=0,`MovementType`=2,`currentwaypoint`=4 WHERE`guid`=106525;
	UPDATE`creature` SET`position_x`=4449.4,`position_y`=-732.4562,`position_z`=139.6707,`spawndist`=0,`MovementType`=2,`currentwaypoint`=7 WHERE`guid`=106511;
	UPDATE`creature` SET`position_x`=4485.71,`position_y`=-932.94,`position_z`=170.51,`spawndist`=0,`MovementType`=2,`currentwaypoint`=4 WHERE`guid`=106524;
	UPDATE`creature` SET`position_x`=4563.939,`position_y`=-910.2556,`position_z`=173.97,`spawndist`=0,`MovementType`=2,`currentwaypoint`=3 WHERE`guid`=106533;
	UPDATE`creature` SET`position_x`=4455.203,`position_y`=-830.0409,`position_z`=157.9734,`spawndist`=0,`MovementType`=2,`currentwaypoint`=2 WHERE`guid`=106526;
	UPDATE`creature` SET`position_x`=4402.398,`position_y`=1078.109,`position_z`=146.6259,`spawndist`=0,`MovementType`=2,`currentwaypoint`=16 WHERE`guid`=106549;
	UPDATE`creature` SET`position_x`=4220.038,`position_y`=1128.75,`position_z`=141.2693,`spawndist`=0,`MovementType`=2,`currentwaypoint`=7 WHERE`guid`=106562;
	UPDATE`creature` SET`position_x`=4284.573,`position_y`=1233.334,`position_z`=146.2676,`spawndist`=0,`MovementType`=2,`currentwaypoint`=10 WHERE`guid`=106547;
	UPDATE`creature` SET`position_x`=4084.671,`position_y`=1319.518,`position_z`=136.1324,`spawndist`=0,`MovementType`=2,`currentwaypoint`=11 WHERE`guid`=106520;
	UPDATE`creature` SET`position_x`=3744.527,`position_y`=1435.537,`position_z`=94.7305,`spawndist`=0,`MovementType`=2,`currentwaypoint`=1 WHERE`guid`=106530;
	UPDATE`creature` SET`position_x`=3676.962,`position_y`=1368.484,`position_z`=104.0316,`spawndist`=0,`MovementType`=2,`currentwaypoint`=6 WHERE`guid`=106532;
	UPDATE`creature` SET`position_x`=3616.666,`position_y`=1600.117,`position_z`=89.95834,`spawndist`=0,`MovementType`=2,`currentwaypoint`=2 WHERE`guid`=106535;
	UPDATE`creature` SET`position_x`=3700.137,`position_y`=1516.877,`position_z`=96.70535,`spawndist`=0,`MovementType`=2,`currentwaypoint`=51 WHERE`guid`=106536;
	UPDATE`creature` SET`position_x`=3718.517,`position_y`=1774.18,`position_z`=97.61757,`spawndist`=0,`MovementType`=2,`currentwaypoint`=11 WHERE`guid`=106538;
	UPDATE`creature` SET`position_x`=3641.123,`position_y`=1737.306,`position_z`=110.5092,`spawndist`=0,`MovementType`=2,`currentwaypoint`=1 WHERE`guid`=106539;
	UPDATE`creature` SET`position_x`=3666.168,`position_y`=1666.95,`position_z`=99.71538,`spawndist`=0,`MovementType`=2,`currentwaypoint`=9 WHERE`guid`=106540;
	UPDATE`creature` SET`position_x`=3869.289,`position_y`=1772.367,`position_z`=123.3392,`spawndist`=0,`MovementType`=2,`currentwaypoint`=7 WHERE`guid`=106543;
	UPDATE`creature` SET`position_x`=3517.465,`position_y`=1444.161,`position_z`=81.0499,`spawndist`=0,`MovementType`=2,`currentwaypoint`=1 WHERE`guid`=106550;
	UPDATE`creature` SET`position_x`=3445.126,`position_y`=1416.806,`position_z`=84.16434,`spawndist`=0,`MovementType`=2,`currentwaypoint`=6 WHERE`guid`=106551;
	UPDATE`creature` SET`position_x`=3528.61,`position_y`=1507.05,`position_z`=80.5932,`spawndist`=0,`MovementType`=2,`currentwaypoint`=7 WHERE`guid`=106553;
	UPDATE`creature` SET`position_x`=3441.373,`position_y`=1588.857,`position_z`=74.62312,`spawndist`=0,`MovementType`=2,`currentwaypoint`=26 WHERE`guid`=106555;
	UPDATE`creature` SET`position_x`=3441.523,`position_y`=1492.797,`position_z`=78.56043,`spawndist`=0,`MovementType`=2,`currentwaypoint`=16 WHERE`guid`=106556;
	UPDATE`creature` SET`position_x`=3486.903,`position_y`=1674.753,`position_z`=76.05113,`spawndist`=0,`MovementType`=2,`currentwaypoint`=5 WHERE`guid`=106557;
	UPDATE`creature` SET`position_x`=3466.59,`position_y`=1716.02,`position_z`=77.4738,`spawndist`=0,`MovementType`=2,`currentwaypoint`= 14 WHERE`guid`=106558;
	UPDATE`creature` SET`position_x`=3485.11,`position_y`=1806.321,`position_z`=72.63698,`spawndist`=0,`MovementType`=2,`currentwaypoint`= 16 WHERE `guid`=106559;
	UPDATE`creature` SET`position_x`=3445.07,`position_y`=1885.22,`position_z`=67.7761,`spawndist` = 0,`MovementType`=2,`currentwaypoint`=1 WHERE `guid`=106560;
	UPDATE`creature` SET`position_x`=3322.138,`position_y`=-346.8293,`position_z`=167.3677,`spawndist` = 0,`MovementType`=2,`currentwaypoint`=16 WHERE `guid`=106522;
	UPDATE`creature` SET`position_x`=3366.76,`position_y`=-472.5531,`position_z`=185.1005,`spawndist`=0,`MovementType`=2,`currentwaypoint`=3 WHERE `guid`=106588;
	UPDATE `creature`SET`position_x`=3083.393,`position_y`=-361.7011,`position_z`=127.2821,`spawndist`=0,`MovementType`=2,`currentwaypoint`=5 WHERE `guid`=106529;
	UPDATE `creature` SET`position_x`=3161.309,`position_y`=-438.2545,`position_z`=126.5145,`spawndist`=0,`MovementType`=2,`currentwaypoint`=8 WHERE `guid`=106586;
	-- NPC 26613 Updates
	UPDATE`creature` SET`position_x`=4482.067,`position_y`=1063.2,`position_z`=142.5148,`spawndist`=0,`MovementType`=0 WHERE`guid`=118916;
	UPDATE`creature` SET`position_x`=2872.004,`position_y`=-617.599,`position_z`=90.25565,`spawndist`=0,`MovementType`=0 WHERE guid=118893;
	UPDATE`creature` SET`position_x`=2801.59,`position_y`=-638.054,`position_z`=83.4044,`spawndist`=0,`MovementType`=0 WHERE guid=119026;
	UPDATE`creature` SET`position_x`=2849.762,`position_y`=-576.8463,`position_z`=90.46647,`spawndist`=0,`MovementType`=0 WHERE`guid`=118900;
	UPDATE`creature` SET`position_x`=2975.161,`position_y`=-568.6041,`position_z`=99.0344,`spawndist`=0,`MovementType`=0 WHERE`guid`=118920;
	UPDATE`creature` SET`position_x`=3066.887,`position_y`=-655.2159,`position_z`=92.61248, spawndist=0,`MovementType`=0 WHERE`guid`=118903;
	UPDATE`creature` SET`position_x`=3123.29,`position_y`=-723.4763,`position_z`=85.07823,`spawndist`=0,`MovementType`=0 WHERE`guid`=118899;
	UPDATE`creature` SET`position_x`=4382.762,`position_y`=-1433.094,`position_z`=162.7112,`spawndist`=0,`MovementType`=0 WHERE`guid`=118890;
	UPDATE`creature` SET`position_x`=4360.607,`position_y`=-1271.646,`position_z`=173.4728,`spawndist`=0,`MovementType`=0 WHERE`guid`=118888;
	UPDATE`creature` SET`position_x`=4311.422,`position_y`=-1158.499,`position_z`=191.0089,`spawndist`=0,`MovementType`=0 WHERE`guid`=118905;
	UPDATE`creature` SET`position_x`=4280.963,`position_y`=-715.996,`position_z`=131.1693,`spawndist`=0,`MovementType`=0 WHERE`guid`=118889;
	UPDATE`creature` SET`position_x`=4295.652,`position_y`=-952.1318,`position_z`=167.3483,`spawndist`=0,`MovementType`=0 WHERE`guid`=118897;
	UPDATE`creature` SET`position_x`=4449.4,`position_y`=-732.4562,`position_z`=139.6707,`spawndist`=0,`MovementType`=0 WHERE`guid`=118887;
	UPDATE`creature` SET`position_x`=4485.71,`position_y`=-932.94,`position_z`=170.51,`spawndist`=0,`MovementType`=0 WHERE`guid`=118896;
	UPDATE`creature` SET`position_x`=4563.939,`position_y`=-910.2556,`position_z`=173.97,`spawndist`=0,`MovementType`=0 WHERE`guid`=118927;
	UPDATE`creature` SET`position_x`=4455.203,`position_y`=-830.0409,`position_z`=157.9734,`spawndist`=0,`MovementType`=0 WHERE`guid`=118898;
	UPDATE`creature` SET`position_x`=4402.398,`position_y`=1078.109,`position_z`=146.6259,`spawndist`=0,`MovementType`=0 WHERE`guid`=118917;
	UPDATE`creature` SET`position_x`=4220.038,`position_y`=1128.75,`position_z`=141.2693,`spawndist`=0,`MovementType`=0 WHERE`guid`=118928;
	UPDATE`creature` SET`position_x`=4284.573,`position_y`=1233.334,`position_z`=146.2676,`spawndist`=0,`MovementType`=0 WHERE`guid`=118915;
	UPDATE`creature` SET`position_x`=4084.671,`position_y`=1319.518,`position_z`=136.1324,`spawndist`=0,`MovementType`=0 WHERE`guid`=118892;
	UPDATE`creature` SET`position_x`=3744.527,`position_y`=1435.537,`position_z`=94.7305,`spawndist`=0,`MovementType`=0 WHERE`guid`=118902;
	UPDATE`creature` SET`position_x`=3676.962,`position_y`=1368.484,`position_z`=104.0316,`spawndist`=0,`MovementType`=0 WHERE`guid`=118904;
	UPDATE`creature` SET`position_x`=3616.666,`position_y`=1600.117,`position_z`=89.95834,`spawndist`=0,`MovementType`=0 WHERE`guid`=118906;
	UPDATE`creature` SET`position_x`=3700.137,`position_y`=1516.877,`position_z`=96.70535,`spawndist`=0,`MovementType`=0 WHERE`guid`=118907;
	UPDATE`creature` SET`position_x`=3718.517,`position_y`=1774.18,`position_z`=97.61757,`spawndist`=0,`MovementType`=0 WHERE`guid`=118908;
	UPDATE`creature` SET`position_x`=3641.123,`position_y`=1737.306,`position_z`=110.5092,`spawndist`=0,`MovementType`=0 WHERE`guid`=118909;
	UPDATE`creature` SET`position_x`=3666.168,`position_y`=1666.95,`position_z`=99.71538,`spawndist`=0,`MovementType`=0 WHERE`guid`=118910;
	UPDATE`creature` SET`position_x`=3869.289,`position_y`=1772.367,`position_z`=123.3392,`spawndist`=0,`MovementType`=0 WHERE`guid`=118913;
	UPDATE`creature` SET`position_x`=3517.465,`position_y`=1444.161,`position_z`=81.0499,`spawndist`=0,`MovementType`=0 WHERE`guid`=118918;
	UPDATE`creature` SET`position_x`=3445.126,`position_y`=1416.806,`position_z`=84.16434,`spawndist`=0,`MovementType`=0 WHERE`guid`=118919;
	UPDATE`creature` SET`position_x`=3528.61,`position_y`=1507.05,`position_z`=80.5932,`spawndist`=0,`MovementType`=0 WHERE`guid`=118921;
	UPDATE`creature` SET`position_x`=3441.373,`position_y`=1588.857,`position_z`=74.62312,`spawndist`=0,`MovementType`=0 WHERE`guid`=118922;
	UPDATE`creature` SET`position_x`=3441.523,`position_y`=1492.797,`position_z`=78.56043,`spawndist`=0,`MovementType`=0 WHERE`guid`=118923;
	UPDATE`creature` SET`position_x`=3486.903,`position_y`=1674.753,`position_z`=76.05113,`spawndist`=0,`MovementType`=0 WHERE`guid`=118924;
	UPDATE`creature` SET`position_x`=3466.59,`position_y`=1716.02,`position_z`=77.4738,`spawndist`=0,`MovementType`=0 WHERE`guid`=118891;
	UPDATE`creature` SET`position_x`=3485.11,`position_y`=1806.321,`position_z`=72.63698,`spawndist`=0,`MovementType`=0 WHERE `guid`=118925;
	UPDATE`creature` SET`position_x`=3445.07,`position_y`=1885.22,`position_z`=67.7761,`spawndist` = 0,`MovementType`=0 WHERE `guid`=118926;
	UPDATE`creature` SET`position_x`=3322.138,`position_y`=-346.8293,`position_z`=167.3677,`spawndist` = 0,`MovementType`=0 WHERE `guid`=118894;
	UPDATE`creature` SET`position_x`=3366.76,`position_y`=-472.5531,`position_z`=185.1005,`spawndist`=0,`MovementType`=2 WHERE `guid`=118901;
	UPDATE `creature`SET`position_x`=3083.393,`position_y`=-361.7011,`position_z`=127.2821,`spawndist`=0,`MovementType`=0 WHERE `guid`=118911;
	UPDATE `creature` SET`position_x`=3161.309,`position_y`=-438.2545,`position_z`=126.5145,`spawndist`=0,`MovementType`=0 WHERE `guid`=118929;
	-- NPC 26613 and 26482 Linking
	DELETE FROM`creature_linking` WHERE`guid` IN (118916,118893,119026,118900,118920,118903,118899,118890,118888,118905,118889,118897,118887,118896,118898,118917,118928,118915,118892,118902,118904,118906,118907,118908,118909,118910,118913,118918,118919,118921,118922,118923,118924,118891,118925,118926,118927,118894,118901,118911,118929);
	DELETE FROM`creature_linking` WHERE`master_guid` IN (106548,106521,106587,106528,106552,106531,106527,106519,106517,106589,106518,106525,106511,106524,106533,106526,106549,106562,106547,106520,106530,106532,106535,106536,106538,106539,106540,106543,106550,106551,106553,106555,106556,106557,106558,106559,106560,106522,106588,106529,106586);
	INSERT INTO`creature_linking` (`guid`,`master_guid`,`flag`) VALUES
	(118916,106548,659),
	(118893,106521,659),
	(119026,106587,659),
	(118900,106528,659),
	(118920,106552,659),
	(118903,106531,659),
	(118899,106527,659),
	(118890,106519,659),
	(118888,106517,659),
	(118905,106589,659),
	(118889,106518,659),
	(118897,106525,659),
	(118887,106511,659),
	(118896,106524,659),
	(118927,106533,659),
	(118898,106526,659),
	(118917,106549,659),
	(118928,106562,659),
	(118915,106547,659),
	(118892,106520,659),
	(118902,106530,659),
	(118904,106532,659),
	(118906,106535,659),
	(118907,106536,659),
	(118908,106538,659),
	(118909,106539,659),
	(118910,106540,659),
	(118913,106543,659),
	(118918,106550,659),
	(118919,106551,659),
	(118921,106553,659),
	(118922,106555,659),
	(118923,106556,659),
	(118924,106557,659),
	(118891,106558,659),
	(118925,106559,659),
	(118926,106560,659),
	(118894,106522,659),
	(118901,106588,659),
	(118911,106529,659),
	(118929,106586,659);
	
	-- Waypoints for NPC 26482
	DELETE FROM`creature_movement` WHERE`id` IN (106548,106521,106587,106528,106552,106531,106527,106519,106517,106589,106518,106525,106511,106524,106533,106526,106549,106562,106547,106520,106530,106532,106535,106536,106538,106539,106540,106543,106550,106551,106553,106555,106556,106557,106558,106559,106560,106522,106588,106529,106586);
	INSERT INTO`creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`wpguid`,`orientation`,`model1`,`model2`) VALUES
	(106548,1,4482.07,1063.2,142.515,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,2,4477.57,1059.45,144.515,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,3,4473.85,1056.55,146.286,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,4,4471.1,1063.05,144.036,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,5,4467.1,1072.3,142.286,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,6,4458.6,1092.3,140.286,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,7,4454.83,1101.58,140.085,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,8,4467.58,1108.83,138.835,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,9,4477.97,1114.89,137.954,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,10,4482.72,1106.14,137.454,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,11,4491.97,1087.64,136.954,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,12,4497.96,1076.23,136.75,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,13,4493.21,1072.48,138.25,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,14,4489.46,1069.23,139.5,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106548,15,4484.96,1065.73,141.25,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,1,2880.811,-638.6967,92.80192,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,2,2877.271,-630.0573,92.51675,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,3,2872.021,-617.5573,90.26675,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,4,2870.833,-614.9346,89.38117,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,5,2867.333,-619.6846,90.13117,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,6,2859.583,-630.4346,91.38117,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,7,2845.333,-650.4346,88.88117,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,8,2843.083,-653.6846,88.38117,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,9,2842.393,-654.8442,88.20912,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,10,2847.393,-659.8442,88.70912,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,11,2855.143,-667.5942,89.20912,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,12,2873.897,-686.3411,89.59998,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,13,2881.147,-672.3411,90.09998,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,14,2882.897,-668.8411,90.59998,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,15,2888.857,-657.7354,92.22592,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106521,16,2885.857,-650.2354,92.97592,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,1,2801.59,-638.054,83.4044,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,2,2788.84,-634.804,82.9044,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,3,2767.84,-629.804,83.4044,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,4,2753.58,-626.345,85.8009,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,5,2740.83,-636.845,88.0509,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,6,2730.73,-645.517,88.1048,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,7,2734.23,-655.517,87.6048,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,8,2738.04,-667.054,85.7003,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,9,2768.04,-674.054,84.2003,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106587,10,2803.6,-662.036,84.3684,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,1,2850.67,-580.855,89.8937,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,2,2849.94,-576.885,90.7023,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,3,2847.94,-574.635,90.9523,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,4,2845.94,-573.135,91.4523,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,5,2843.69,-571.885,91.4523,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,6,2841.69,-571.885,91.4523,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,7,2837.69,-568.635,92.2023,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,8,2836.19,-566.635,92.9523,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,9,2826.48,-565.148,93.3984,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,10,2829.23,-553.898,97.8984,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,11,2830.9,-548.508,100.162,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,12,2836.65,-547.508,101.162,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,13,2849.4,-545.758,101.662,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,14,2861,-543.867,102.884,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,15,2876.5,-554.117,98.1339,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,16,2887.34,-561.598,96.9106,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,17,2877.59,-566.598,96.1606,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,18,2869.59,-570.598,94.6606,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106528,19,2867.09,-572.098,94.1606,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,1,2925.65,-556.235,98.1212,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,2,2925.65,-548.235,100.371,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,3,2926.05,-537.495,104.473,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,4,2943.8,-531.995,107.973,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,5,2953.3,-528.995,109.973,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,6,2986.54,-563.378,102.995,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,7,2984.79,-565.128,100.995,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,8,2985.04,-566.128,100.495,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,9,2984.29,-566.378,100.745,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,10,2983.79,-566.878,100.745,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,11,2981.79,-566.878,100.245,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,12,2979.54,-567.378,99.7448,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,13,2975.06,-568.506,98.7971,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,14,2973.06,-568.756,99.0471,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,15,2968.06,-567.256,99.2971,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106552,16,2949.06,-562.506,98.7971,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,1,3080.21,-623.337,102.148,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,2,3071.96,-643.337,96.1478,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,3,3067.46,-653.714,92.9808,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,4,3066.46,-655.964,92.4808,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,5,3053.72,-662.814,89.0166,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,6,3056.47,-667.064,88.7666,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,7,3065.37,-681.783,88.3089,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,8,3069.12,-680.033,88.8089,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,9,3081.32,-674.522,91.1894,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,10,3086.82,-666.272,93.9394,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,11,3092.57,-657.272,96.4394,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,12,3096.31,-651.529,98.3034,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,13,3087.81,-637.029,99.8034,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106531,14,3085.81,-632.529,100.553,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,1,3123.73,-725.091,84.2868,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,2,3117.48,-728.341,81.7868,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,3,3107.88,-733.69,79.2581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,4,3105.63,-734.94,78.7581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,5,3105.13,-733.94,79.0081,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,6,3098.13,-733.94,78.5081,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,7,3096.13,-734.44,78.2581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,8,3094.63,-737.44,78.0081,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,9,3094.63,-741.44,77.7581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,10,3095.13,-743.44,77.7581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,11,3096.13,-744.94,77.7581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,12,3099.01,-747.135,76.9377,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,13,3094.51,-737.135,78.1877,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,14,3094.01,-733.135,78.4377,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,15,3092.26,-719.385,79.1877,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,16,3092.26,-711.635,80.4377,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,17,3092.72,-702.541,84.1146,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,18,3101.97,-696.791,88.3646,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,19,3103.22,-695.541,89.1146,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,20,3112.42,-689.471,93.1811,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,21,3113.67,-693.221,92.4311,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,22,3119.92,-712.971,88.1811,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106527,23,3098.47,-698.791,87.1146,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,1,4375.252,-1431.15,162.8628,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,2,4379.252,-1432.4,162.8628,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,3,4381.252,-1432.4,162.6128,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,4,4382.752,-1433.15,162.6128,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,5,4386.726,-1436.37,162.657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,6,4388.476,-1433.12,162.157,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,7,4388.476,-1431.12,162.157,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,8,4389.476,-1429.37,161.907,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,9,4390.226,-1427.87,161.907,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,10,4391.726,-1427.37,161.907,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,11,4392.726,-1425.12,161.657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,12,4391.726,-1421.87,161.657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,13,4390.726,-1420.87,161.657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,14,4389.476,-1416.62,161.407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,15,4385.563,-1416.101,161.621,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,16,4376.313,-1403.351,162.121,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,17,4364.929,-1388.995,161.9805,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,18,4340.402,-1401.602,161.6375,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,19,4347.902,-1411.102,162.1375,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,20,4355.402,-1421.102,162.6375,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,21,4359.244,-1425.821,162.7112,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106519,22,4366.994,-1429.071,162.9612,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,1,4360.61,-1271.65,173.473,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,2,4326.93,-1271.06,182.658,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,3,4345.68,-1287.56,174.408,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,4,4363.24,-1303.37,169.618,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,5,4399.89,-1313.48,165.583,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,6,4397.89,-1307.98,166.083,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,7,4398.89,-1299.73,166.583,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,8,4398.89,-1295.48,166.833,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,9,4397.89,-1291.73,167.083,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,10,4393.69,-1276.49,169.24,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106517,11,4367.23,-1271.79,172.659,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,1,4314.84,-1159.25,189.868,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,2,4308.67,-1158,191.259,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,4,4307.17,-1166,192.259,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,6,4302.98,-1182.76,192.85,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,7,4303.73,-1208.51,193.35,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,11,4304.56,-1224.06,193.339,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,20,4324.06,-1209.06,185.839,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,25,4340.34,-1196.9,182.629,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,27,4343.33,-1175.01,182.943,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,28,4345.04,-1163.49,182.798,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,31,4339.17,-1162.36,184.324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106589,33,4333.17,-1161.86,185.574,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,1,4280.96,-715.997,131.169,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,2,4275.13,-736.792,133.105,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,3,4300.63,-739.792,136.355,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,4,4314.58,-741.932,138.628,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,5,4317.58,-742.682,139.128,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,6,4334.33,-747.682,141.128,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,7,4340.28,-749.57,141.704,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,8,4337.03,-743.32,140.954,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,9,4334.28,-739.32,140.704,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,10,4335.53,-733.07,140.454,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,11,4333.28,-731.32,140.454,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,12,4331.53,-725.57,139.704,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,13,4327.17,-714.87,138.242,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,14,4320.42,-712.87,136.992,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,15,4310.92,-710.37,134.992,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106518,16,4304.61,-708.689,133.784,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,1,4314.38,-919.791,163.318,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,2,4309.4,-920.382,163.848,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,3,4293.75,-956.807,168.126,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,4,4335.89,-955.89,167.644,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,5,4357.66,-930.524,168.283,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,6,4356.4,-909.188,163.988,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,7,4333.4,-920.688,163.738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,8,4318.9,-919.938,163.488,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106525,9,4316.9,-919.438,163.738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,1,4505.41,-744.226,142.852,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,2,4500.92,-764.046,148.909,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,3,4485.92,-766.046,147.659,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,4,4480.17,-767.046,147.409,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,5,4470.42,-768.38,146.452,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,6,4459.67,-749.63,142.702,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,7,4448.89,-731.339,138.895,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,8,4462.39,-710.589,131.645,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,9,4466.36,-705.322,130.017,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106511,10,4489.02,-705.015,129.7,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,1,4534.89,-910.298,170.605,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,2,4529.83,-932.429,172.115,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,3,4494.96,-936.94,171.26,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,4,4485.71,-932.94,170.51,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,5,4476.71,-928.69,170.01,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,6,4465.96,-924.19,169.76,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,7,4455.98,-919.154,168.605,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,8,4465.34,-892.019,168.085,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,9,4506.25,-894.337,166.192,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106524,10,4534.99,-910.21,170.578,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,1,4540.77,-908.321,171.257,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,2,4541.27,-911.071,171.757,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,3,4564.02,-910.321,174.007,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,4,4573.78,-910.263,174.243,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,5,4580.41,-909.692,174.192,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,6,4596.91,-895.515,173.632,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,7,4588.66,-875.515,172.632,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,8,4567.37,-842.372,165.247,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,9,4539.37,-859.122,164.997,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,10,4532.73,-863.066,164.924,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,11,4537.73,-890.566,167.924,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106533,12,4538.73,-898.316,169.174,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106526,1,4454.678,-846.15,162.7856,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106526,2,4456.225,-813.2595,154.7679,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106526,3,4503,-813.7822,155.3166,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106526,4,4522.143,-849.4379,163.119,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106526,5,4493.226,-861.0837,166.7243,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,1,4427.05,1087.79,142.818,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,2,4419.8,1084.79,144.068,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,3,4408.8,1080.79,145.068,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,4,4401.18,1077.84,146.536,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,5,4399.93,1080.34,146.536,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,6,4398.93,1081.59,146.536,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,7,4399.43,1083.59,146.036,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,8,4399.43,1087.84,145.286,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,9,4397.93,1089.34,145.036,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,10,4395.93,1090.59,145.036,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,11,4394.68,1091.59,144.786,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,12,4393.93,1092.59,144.536,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,13,4391.93,1092.59,144.536,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,14,4387.68,1100.09,144.536,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,15,4383.84,1101.32,144.248,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,16,4402.38,1118.61,144.656,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,17,4405.38,1114.86,143.906,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,18,4411.13,1107.86,142.656,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,19,4414.63,1103.11,142.156,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106549,20,4425.38,1090.36,142.656,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,1,4209.63,1099.76,144.685,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,2,4211.97,1100.37,144.151,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,3,4215.72,1101.12,143.651,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,4,4223.47,1102.37,142.651,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,5,4234.22,1104.12,141.901,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,6,4237.11,1104.81,141.678,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,7,4239.91,1135.69,141.14,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,8,4214.66,1127.19,141.64,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,9,4208.8,1124.74,141.813,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,10,4209.3,1114.74,143.063,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,11,4209.55,1109.99,143.563,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106562,12,4209.8,1102.99,144.313,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,1,4293.26,1245.36,147.238,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,2,4291.53,1246.29,147.144,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,3,4289.59,1245.77,146.673,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,5,4286.34,1241.77,146.423,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,6,4285.84,1239.52,146.423,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,7,4284.09,1237.52,146.173,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,10,4284.59,1233.27,146.423,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,11,4278.38,1219.25,146.235,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,12,4284.88,1215,146.485,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,13,4292.78,1209.32,147.141,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,14,4295.03,1213.82,147.641,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,15,4298.28,1221.07,148.141,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,16,4305.53,1236.07,148.641,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,17,4306.64,1238.4,148.855,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,18,4301.39,1241.4,148.105,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106547,19,4297.14,1243.4,147.855,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,1,4062.14,1316.77,135.9,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,2,4062.31,1316.8,136.135,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,3,4066.81,1306.05,136.635,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,4,4069.52,1300.09,136.685,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,5,4076.27,1299.09,137.435,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,6,4079.27,1298.84,137.935,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,7,4082.02,1298.34,138.435,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,8,4084.02,1298.09,139.185,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,9,4095.57,1296.13,139.727,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,10,4095.32,1302.13,138.977,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,11,4095.32,1311.88,137.977,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,12,4095.1,1320.62,136.879,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,13,4089.1,1319.87,136.379,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106520,14,4079.1,1318.87,135.879,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,1,3744.45,1435.35,94.6637,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,2,3755.89,1437.44,94.6436,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,3,3760.39,1430.94,95.3936,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,4,3763.39,1426.69,95.8936,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,5,3765.89,1422.69,96.8936,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,6,3768.64,1418.69,98.1436,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,7,3774.39,1410.44,98.6436,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,8,3777,1406.19,99.3591,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,9,3775.25,1398.44,100.609,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,10,3774,1393.44,101.859,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,11,3771.5,1382.94,103.609,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,12,3770,1376.19,105.109,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,13,3766.88,1365.89,108.275,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,14,3762.38,1356.14,111.525,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,15,3758.38,1347.14,114.275,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,16,3755.94,1342.25,115.336,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,17,3750.44,1345,113.836,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,18,3744.44,1348,112.336,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,19,3733.94,1353.25,110.336,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,20,3730.2,1355.56,109.731,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,21,3727.7,1361.06,108.231,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,22,3724.45,1368.31,106.981,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,23,3720.7,1377.31,103.981,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,24,3718.23,1382.89,102.372,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,25,3712.23,1391.14,101.372,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,26,3708.23,1396.39,100.122,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,27,3704.98,1400.14,98.6223,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,28,3700.75,1405.77,97.7927,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,29,3701.16,1421.11,97.3276,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,30,3705.66,1424.86,96.5776,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,31,3718.28,1430.79,95.4805,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106530,32,3729.03,1432.54,95.2305,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,1,3676.93,1414.02,98.8531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,2,3694.59,1400.74,99.1485,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,3,3689.84,1391.99,100.398,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,4,3683.09,1379.99,101.648,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,5,3677.59,1369.49,103.898,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,6,3676.59,1367.74,104.398,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,7,3672.39,1361.98,106.555,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,8,3667.39,1356.98,107.555,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,9,3660.64,1350.23,108.805,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,10,3653.08,1342.55,110.704,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,11,3642.08,1338.3,112.204,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,12,3624.21,1331.97,112.382,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,13,3622.21,1336.47,110.882,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,14,3619.13,1342.7,108.486,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,15,3615.76,1350.24,106.021,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,16,3621.01,1358.74,104.771,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,17,3626.01,1366.99,103.521,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,18,3636.76,1380.58,101.559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,19,3645.76,1390.83,100.309,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,20,3648.63,1394.16,99.8245,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106532,21,3667.13,1407.41,99.3245,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,1,3614.11,1589.4,87.2332,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,2,3616.36,1598.65,89.2332,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,3,3617.6,1603.01,90.7552,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,4,3625.6,1602.51,91.7552,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,5,3639.35,1602.01,93.2552,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,6,3650.77,1601.21,94.383,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,7,3665.16,1599.14,93.4263,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,8,3676.16,1597.64,92.9263,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,9,3680.06,1597.01,92.7646,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,10,3679.06,1580.01,93.5146,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,11,3678.56,1569.26,95.0146,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,12,3678.08,1562.54,95.6364,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,13,3659.33,1562.79,95.1364,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,14,3648.24,1562.71,93.7304,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,15,3636.49,1564.46,90.9804,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,16,3631.09,1565.33,89.2028,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,17,3622.59,1566.33,86.9528,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,18,3618.99,1567.16,85.717,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,19,3616.74,1570.16,85.467,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106535,20,3610.98,1577.19,84.6244,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,1,3680.25,1571.38,94.9864,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,2,3681,1581.13,93.2364,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,3,3682.51,1593.35,92.2493,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,4,3675.51,1601.35,93.2493,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,5,3672.29,1605.21,93.8914,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,6,3667.04,1608.21,94.3914,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,7,3654.29,1615.46,95.6414,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,8,3651.28,1616.96,95.5964,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,9,3641.03,1612.46,94.8464,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,10,3634.03,1609.71,93.5964,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,11,3625.46,1605.78,92.002,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,12,3625.21,1601.78,91.252,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,13,3625.21,1598.78,90.752,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,14,3624.71,1594.03,90.252,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,15,3624.12,1585.51,89.025,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,16,3629.12,1585.01,90.025,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,17,3639.87,1583.76,91.525,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,18,3655.4,1581.94,92.7252,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,19,3657.15,1571.94,93.4752,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,20,3659.4,1561.44,95.4752,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,21,3662.14,1541.05,97.1975,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,22,3661.2,1535.85,97.853,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,23,3660.17,1525.5,98.895,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,24,3661.42,1520.75,99.395,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,25,3662.17,1516,99.895,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,26,3663.42,1509.25,101.395,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,27,3664.24,1507.39,101.411,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,28,3676.19,1497.55,100.964,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,29,3681.69,1501.8,100.214,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,30,3685.44,1505.05,99.7142,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,31,3693.94,1511.8,97.9642,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,32,3701.51,1517.94,96.2924,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,33,3702.76,1525.94,95.7924,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,34,3704.76,1537.44,94.0424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,35,3705.7,1544.03,93.1954,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,36,3692.7,1548.78,94.1954,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106536,37,3678.06,1554.78,95.3341,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,1,3726.33,1814.47,100.776,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,2,3717.8,1823.86,97.3759,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,3,3684.34,1819.42,97.9659,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,4,3672.25,1821.39,98.0851,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,5,3660.79,1815.25,100.886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,6,3663.79,1811.5,101.136,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,7,3673,1799.88,102.849,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,8,3685,1791.63,103.349,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,9,3694.25,1785.38,104.599,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,10,3706.38,1778.18,106.696,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,11,3713.88,1774.18,107.696,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,12,3730.12,1765.18,109.207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,13,3733.87,1760.68,109.957,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,14,3745.14,1747.69,109.656,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,15,3749.2,1754.91,110.981,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,16,3757.72,1770.36,112.042,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,17,3752.72,1779.11,110.542,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,18,3747.47,1788.36,108.792,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,19,3743.27,1795.99,106.618,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106538,20,3735.02,1804.74,103.618,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,1,3641.12,1737.31,110.509,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,3,3649.79,1749.19,110.563,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,4,3657.38,1759.65,109.577,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,5,3654.63,1770.4,108.827,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,7,3651.13,1785.65,107.827,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,10,3649.27,1793.05,107.003,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,12,3639.77,1787.05,108.253,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,16,3627.004,1778.982,109.9129,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,17,3621.25,1770.73,110.413,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,21,3612.62,1758.54,111.791,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,22,3609.62,1743.04,112.291,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,24,3608.03,1736.72,112.235,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,25,3616.33,1737.01,111.872,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106539,26,3629.08,1737.01,111.372,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,1,3620.11,1710.81,110.911,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,2,3626.24,1710.48,109.772,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,3,3638.99,1709.48,107.022,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,4,3647.99,1708.98,105.772,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,5,3658.49,1708.23,104.181,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,6,3662.99,1698.23,102.681,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,7,3668.9,1686.5,101.275,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,8,3666.9,1675,100.275,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,9,3666.15,1667,99.7754,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,10,3665.17,1661.63,99.3141,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,11,3654.24,1646.39,99.1386,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,12,3628.74,1654.39,99.8886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,13,3624.04,1656.05,100.757,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,14,3619.29,1662.55,103.007,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,15,3614.29,1669.55,106.257,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,16,3610.04,1675.05,109.257,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,17,3606.91,1679.65,110.934,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,18,3610.66,1683.65,110.684,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,19,3611.66,1687.65,110.434,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,20,3612.16,1691.9,111.184,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,21,3614.41,1693.65,110.934,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,22,3615.66,1695.9,110.934,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,23,3615.66,1699.9,111.684,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106540,24,3616.66,1701.15,111.434,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,1,3820.52,1755.98,122.116,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,2,3813.27,1758.48,121.366,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,3,3804.64,1762.17,120.501,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,4,3839.89,1771.67,121.001,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,5,3847.64,1773.92,121.501,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,6,3858.44,1773.29,122.667,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,7,3869.04,1772.43,123.302,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,8,3869.91,1769.78,123.408,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,9,3872.2,1762.77,123.812,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,10,3892.79,1758.58,123.324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,11,3894.29,1751.83,122.074,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,12,3896.79,1742.33,120.324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,13,3899.04,1733.37,118.531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,14,3899.79,1729.62,117.781,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,15,3890.54,1722.37,118.531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,16,3881.27,1714.79,119.331,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,17,3875.27,1714.29,120.581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,18,3861.62,1713.27,122.583,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,19,3844.59,1745.61,123.085,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106543,20,3830.34,1751.61,122.585,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,1,3517.47,1444.16,81.0499,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,2,3509.78,1428.34,83.1095,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,3,3506.46,1422,84.2427,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,4,3499.96,1406.5,84.9927,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,5,3496.08,1396.93,85.782,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,6,3521.06,1387.53,89.4177,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,7,3540.12,1398.41,89.5851,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,8,3550.87,1405.41,90.0851,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,9,3560.33,1411.5,91.1172,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,10,3561.58,1419.5,90.3672,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,11,3563.83,1438,89.1172,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,12,3565.11,1449.77,87.7674,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,13,3559.86,1452.27,86.5174,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,14,3553.36,1455.27,84.5174,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,15,3551.61,1455.77,84.0174,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,16,3544.36,1459.02,82.0174,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106550,17,3534.81,1463.16,80.9505,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,1,3454.833,1392.918,86.86732,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,2,3448.83,1407.42,84.6173,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,3,3445.08,1416.67,84.1173,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,4,3442.16,1420.31,83.1723,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,5,3437.08,1426.23,81.9559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,6,3432.9,1430.76,81.66,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,7,3429.15,1429.76,81.91,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,8,3427.15,1429.76,82.16,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,9,3424.9,1430.26,82.16,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,10,3420.4,1429.51,82.91,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,11,3414.37,1429.67,83.4185,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,12,3416.87,1417.92,83.9185,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,13,3418.37,1412.42,85.1685,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,14,3418.62,1409.42,85.9185,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,15,3420.03,1404.11,87.2024,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,16,3421.78,1400.61,88.2024,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,17,3425.03,1393.36,89.2024,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,18,3432.03,1378.11,89.9524,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,19,3432.23,1377.84,89.9956,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,20,3437.73,1369.34,90.7456,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,21,3443.73,1361.59,91.4956,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,22,3451.36,1351.98,91.5255,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,23,3457.86,1356.48,91.0255,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,24,3466.04,1361.58,90.2916,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,25,3463.54,1368.33,89.7916,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,26,3460.79,1375.83,89.2916,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106551,27,3457.54,1385.83,88.2916,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,1,3527.5,1521.87,78.9153,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,2,3529.92,1513.25,79.8559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,3,3528.61,1507.05,80.5932,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,4,3539.84,1496.31,82.207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,5,3552.96,1483.21,81.4831,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,6,3532.96,1485.46,82.4831,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,7,3515.45,1487.47,82.8271,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,8,3513.45,1494.22,82.3271,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,9,3509.7,1508.47,80.5771,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,10,3505.65,1523.09,80.0316,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,11,3510.9,1529.34,79.2816,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,12,3514.9,1534.59,79.0316,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106553,13,3521.39,1542.01,78.4573,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,1,3448.69,1584.9,73.8607,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,2,3467.3,1581.2,74.7365,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,3,3475.43,1579.42,75.3698,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,4,3477.68,1572.67,76.1198,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,5,3482.68,1555.67,75.3698,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,6,3484.97,1549.34,74.9119,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,7,3495.72,1548.84,75.6619,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,8,3506.45,1548.34,77.1983,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,9,3507.2,1556.34,75.6983,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,10,3509.2,1570.09,75.4483,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,11,3510.96,1581.13,75.2026,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,12,3510.71,1593.88,75.7026,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,13,3510.64,1601.95,75.6535,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,14,3505.39,1611.45,75.1535,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,15,3499.79,1622.45,73.2367,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,16,3491.04,1630.7,71.9867,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,17,3480.79,1640.72,73.7511,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,18,3464.29,1637.72,74.2511,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,19,3457.29,1636.97,74.5011,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,20,3452.54,1635.97,75.2511,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,21,3430.92,1616.92,80.1919,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,22,3429.42,1607.92,79.4419,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,23,3427.12,1595.61,79.6231,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,24,3430.87,1593.86,77.6231,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,25,3436.12,1591.36,75.8731,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106555,26,3441.37,1588.86,74.6231,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,1,3396.19,1462.07,81.4488,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,2,3400.19,1460.32,81.4488,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,3,3406.19,1452.82,81.6988,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,4,3408.44,1450.32,82.1988,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,5,3416.24,1447.98,81.7167,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,6,3420.99,1449.73,81.2167,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,7,3442,1456.98,81.0894,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,8,3460.25,1464.48,81.5894,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,9,3467.5,1467.73,82.5894,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,10,3474.07,1470.65,83.0767,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,11,3481.62,1483,82.5116,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,12,3479.37,1486.25,82.0116,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,13,3474.6,1493.99,82.1607,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,14,3464.6,1493.74,81.6607,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,15,3456.85,1493.49,80.1607,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,16,3441.52,1492.8,78.5604,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106556,17,3432.16,1472.92,79.8686,0,0,0,0,0,0,0,0,0,0,100,0,0),
	(106557,1,3474.75,1651.36,74.7951,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,2,3489.25,1658.18,74.5564,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,4,3488,1668.18,75.5564,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,5,3487,1674.93,76.0564,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,6,3485.46,1686.05,76.4818,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,7,3468.21,1695.55,76.9818,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,8,3459.35,1700.54,78.732,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,9,3451.35,1698.03,79.8831,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,10,3445.54,1696.06,81.6243,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,11,3442.79,1685.31,82.6243,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,12,3439.79,1675.06,83.3743,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,13,3438.38,1670.29,83.9327,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,14,3434.63,1660.54,84.6827,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,15,3435.63,1650.29,83.4327,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,16,3441.38,1648.79,81.6827,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,17,3449.67,1646.44,77.9259,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106557,18,3467.17,1649.69,74.9259,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,1,3436.63,1747.93,82.2373,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,2,3436.88,1756.93,81.7373,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,3,3437.13,1764.68,80.7373,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,4,3437.68,1772.91,79.4806,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,5,3444.93,1780.91,77.2306,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,6,3451.75,1787.97,75.8581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,7,3457.75,1787.47,75.3581,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,8,3468.32,1786.63,74.727,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,9,3476.07,1772.88,74.227,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,10,3484.33,1759.04,74.1289,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,11,3481.58,1736.29,74.6289,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,12,3480.45,1727.06,75.3578,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,13,3472.34,1720.77,76.4738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,14,3466.59,1716.02,77.4738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,15,3462.61,1713.06,78.3262,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,16,3449.86,1714.31,79.8262,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,17,3438.79,1715.54,82.1513,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,18,3439.54,1721.04,82.1513,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,19,3441.2,1729.3,81.3553,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,20,3437.79,1732.79,82.9013,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106558,21,3436.44,1741.37,82.9118,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,1,3478.72,1792.33,73.887,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,2,3482.97,1800.33,73.137,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,3,3485.97,1806.33,72.637,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,4,3491.08,1815.83,72.109,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,5,3493.08,1835.58,71.609,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,6,3493.29,1836.88,71.3383,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,7,3476.4,1835.18,71.7611,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,8,3456.65,1833.68,72.2611,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,9,3449.36,1832.9,73.6085,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,10,3441.61,1834.65,75.1085,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,11,3434.86,1835.9,77.6085,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,12,3431.02,1836.81,79.2784,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,13,3437.71,1822.24,77.6394,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,14,3439.21,1813.74,78.1394,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,15,3441.09,1805.82,78.1002,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,16,3448.09,1794.01,76.5071,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,17,3458.71,1791.36,75.1965,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,18,3460.83,1790.87,74.9422,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106559,19,3469.88,1791.53,74.5423,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,1,3445.07,1885.22,67.7761,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,2,3449.92,1879.71,67.0959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,3,3453.92,1879.96,63.846,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,4,3467.67,1880.96,64.5959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,5,3476.68,1881.56,65.7374,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,6,3490.86,1894.92,66.4595,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,7,3480.22,1912.11,65.9116,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,8,3472.22,1912.36,64.9116,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,9,3460.19,1913.15,62.453,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,10,3458.19,1913.4,62.203,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,11,3445.44,1922.4,62.953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,12,3438.87,1926.89,64.1258,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,13,3433.12,1925.39,66.3758,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,14,3426.37,1923.64,68.6258,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,15,3419.69,1921.94,72.0182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,16,3421.19,1919.44,71.2682,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,17,3427.44,1910.19,70.7682,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,18,3431.44,1904.69,71.0182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,19,3432.69,1902.19,70.0182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106560,20,3436.69,1896.44,69.0182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,1,3307.82,-357.378,164.209,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,2,3304.11,-361.909,162.995,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,3,3303.11,-363.659,162.745,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,4,3303.36,-372.659,162.245,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,5,3303.65,-386.255,161.903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,6,3310.15,-390.755,163.403,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,7,3317.15,-396.005,165.153,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,8,3322.34,-399.705,167.254,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,9,3327.59,-395.205,168.504,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,10,3338.09,-386.455,170.504,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,11,3345.47,-380.032,171.627,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,12,3344.72,-374.032,170.877,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,13,3343.72,-366.032,170.377,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,14,3341.4,-350.283,169.722,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,15,3330.65,-348.533,168.472,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106522,16,3320.15,-346.283,167.472,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,1,3376.07,-462.419,186.068,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,2,3371.82,-466.919,186.568,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,3,3366.82,-472.669,185.068,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,4,3364.89,-474.778,185.225,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,5,3361.39,-478.278,184.725,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,6,3353.89,-485.778,183.475,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,7,3349.67,-489.605,181.946,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,8,3343.67,-490.105,179.446,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,9,3335.92,-490.605,177.446,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,10,3331.92,-491.105,175.446,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,11,3328.87,-491.396,173.927,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,12,3329.27,-488.511,174.105,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,13,3331.27,-483.011,174.105,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,14,3332.27,-476.761,174.105,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,15,3332.27,-474.761,174.105,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,16,3331.27,-466.761,172.855,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,17,3327.77,-463.011,172.355,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,18,3325.27,-460.511,171.355,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,19,3323.16,-458,170.059,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,20,3325.16,-454,170.559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,21,3329.16,-454,172.559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,22,3333.16,-454,174.809,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,23,3336.41,-452.75,176.309,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,24,3343.91,-449.25,179.309,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,25,3346.16,-449.25,180.059,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,26,3349.91,-448.75,181.059,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,27,3354.16,-447.75,181.559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,28,3358.41,-447.75,182.059,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,29,3366.66,-445.75,182.309,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,30,3374.09,-434.262,182.543,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,31,3374.34,-437.012,183.043,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106588,32,3374.84,-447.012,183.793,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,1,3079.77,-319.97,130.868,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,2,3080.27,-325.97,130.368,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,3,3081.02,-335.97,129.118,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,4,3082.02,-347.72,128.118,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,5,3083.55,-361.714,127.276,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,6,3064.81,-342.388,127.621,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,7,3051.31,-343.888,127.121,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,8,3036.51,-344.966,126.724,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,9,3034.51,-341.466,127.224,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,10,3034.01,-333.216,128.724,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,11,3037.26,-330.716,129.474,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,12,3043.17,-326.225,130.389,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,13,3049.58,-321.748,131.677,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,14,3052.58,-323.748,131.427,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,15,3053.83,-324.248,130.927,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,16,3058.58,-326.748,130.427,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,17,3061.08,-324.748,130.927,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,18,3070.83,-322.748,130.927,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106529,19,3075.08,-322.748,130.927,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,1,3131.952,-414.6286,126.1687,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,2,3132.897,-413.7365,126.1621,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,3,3139.892,-417.9521,126.0824,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,4,3146.392,-422.2021,126.5824,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,5,3149.642,-424.2021,127.0824,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,6,3154.049,-427.0565,127.6052,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,7,3160.549,-435.8065,126.8552,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,8,3161.442,-437.4294,126.6874,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,9,3159.442,-445.1794,126.4374,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,10,3154.509,-463.2258,126.0802,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,11,3136.208,-470.4774,126.2637,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(106586,12,3114.467,-431.0786,126.0368,0,0,0,0,0,0,0,0,0,0,0,0,0);
	
	-- Remove duplicate NPC 26613 and 26482 
	DELETE FROM `creature` WHERE `guid` IN (118930,118931,118932,118933,119025,119027,106541,106561,106563,106564,106565,106566,106567);
	
		-- ----------------------------------------
	-- Arctic Hare
	-- ----------------------------------------
	-- --Tundra
	UPDATE `creature` SET`position_x`=3054.435,`position_y`=4358.947,`position_z`=30.081,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109232;
	UPDATE `creature` SET`position_x`=4261.532,`position_y`=4270.768,`position_z`=94.27298,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109229;
	UPDATE `creature` SET`position_x`=4083.511,`position_y`=4208.061,`position_z`=52.3609,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109230;
	UPDATE `creature` SET`position_x`=3114.628,`position_y`=3903.315,`position_z`=24.04702,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109191;
	UPDATE `creature` SET`position_x`=4023.015,`position_y`=4158.842,`position_z`=59.0939,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109192;
	UPDATE `creature` SET`position_x`=3113.474,`position_y`=4217.486,`position_z`=28.21307,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109155;
	UPDATE `creature` SET`position_x`=3265.533,`position_y`=3794.874,`position_z`=27.24682,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109178;
	UPDATE `creature` SET`position_x`=4050.294,`position_y`=4022.39,`position_z`=74.51515,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109183;
	UPDATE `creature` SET`position_x`=3107.162,`position_y`=3670.232,`position_z`=3.832322,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109188;
	UPDATE `creature` SET`position_x`=3250.382,`position_y`=3885.583,`position_z`=29.23222,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109189;
	UPDATE `creature` SET`position_x`=3955.126,`position_y`=4084.097,`position_z`=49.09118,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109196;
	UPDATE `creature` SET`position_x`=4145.517,`position_y`=4280.647,`position_z`=42.33829,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109204;
	UPDATE `creature` SET`position_x`=4246.944,`position_y`=4422.191,`position_z`=37.38242,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109206;
	UPDATE `creature` SET`position_x`=3332.846,`position_y`=3855.778,`position_z`=27.50402,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109208;
	UPDATE `creature` SET`position_x`=3480.607,`position_y`=3530.229,`position_z`=40.38999,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109209;
	UPDATE `creature` SET`position_x`=3409.324,`position_y`=3491.066,`position_z`=19.59872,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109213;
	UPDATE `creature` SET`position_x`=3475.12,`position_y`=3826.299,`position_z`=31.20928,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109218;
	UPDATE `creature` SET`position_x`=4274.324,`position_y`=4362.607,`position_z`=69.16003,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109222;
	UPDATE `creature` SET`position_x`=3298.875,`position_y`=3497.322,`position_z`=20.14426,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109227;
	UPDATE `creature` SET`position_x`=3114.355,`position_y`=4049.062,`position_z`=28.16595,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109246;
	UPDATE `creature` SET`position_x`=3574.377,`position_y`=3375.636,`position_z`=34.2544,`spawntimesecs`=300,`spawndist`=5,`MovementType`=11 WHERE `guid`=109247;
	UPDATE `creature` SET`position_x`=3615.511,`position_y`=3820.7,`position_z`=38.24741,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109242;
	UPDATE `creature` SET`position_x`=3615.511,`position_y`=3820.7,`position_z`=38.24741,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE `guid`=109243;
	-- Zul'Drak
	UPDATE `creature` SET`position_x`=5651.997,`position_y`=-3306.623,`position_z`=372.1118 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109249;
	UPDATE `creature` SET`position_x`=6197.372,`position_y`=-3389.75,`position_z`=365.5004 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109215;
	UPDATE `creature` SET`position_x`=7148.53,`position_y`=-4344.746,`position_z`=452.9677 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109166;
	UPDATE `creature` SET`position_x`=7048.938,`position_y`=-4364.052,`position_z`=449.8604 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109167;
	UPDATE `creature` SET`position_x`=6201.201,`position_y`=-4509.646,`position_z`=452.2714 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109302;
	UPDATE `creature` SET`position_x`=6780.65,`position_y`=-4249.487,`position_z`=450.7958 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109321;
	UPDATE `creature` SET`position_x`=6023.992,`position_y`=-3588.256,`position_z`=365.761 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109328;
	UPDATE `creature` SET`position_x`=6608.913,`position_y`=-4438.893,`position_z`=450.6429 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109330;
	UPDATE `creature` SET`position_x`=6814.651,`position_y`=-4852.645,`position_z`=450.9606 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109331;
	UPDATE `creature` SET`position_x`=6427.723,`position_y`=-3963.757,`position_z`=470.7636 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109336;
	UPDATE `creature` SET`position_x`=5674.07,`position_y`=-3507.404,`position_z`=368.1378 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109345;
	UPDATE `creature` SET`position_x`=5913.843,`position_y`=-3789.742,`position_z`=363.1837 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109346;
	UPDATE `creature` SET`position_x`=5903.851,`position_y`=-3708.927,`position_z`=364.289 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109349;
	UPDATE `creature` SET`position_x`=5910.957,`position_y`=-3240.287,`position_z`=360.5994 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109352;
	UPDATE `creature` SET`position_x`=6375.268,`position_y`=-3241.614,`position_z`=389.089 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109353;
	UPDATE `creature` SET`position_x`=6511.743,`position_y`=-3971.996,`position_z`=482.3188 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109354;
	UPDATE `creature` SET`position_x`=6917.166,`position_y`=-4346.646,`position_z`=451.0284 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109355;
	UPDATE `creature` SET`position_x`=6345.884,`position_y`=-4385.98,`position_z`=450.6475 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109356;
	UPDATE `creature` SET`position_x`=6250.171,`position_y`=-4451.077,`position_z`=450.6428 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109357;
	UPDATE `creature` SET`position_x`=6357.542,`position_y`=-3358.277,`position_z`=388.839 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109358;
	UPDATE `creature` SET`position_x`=5910.004,`position_y`=-3315.955,`position_z`=361.402 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109359;
	UPDATE `creature` SET`position_x`=5977.783,`position_y`=-3444.682,`position_z`=362.2559 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109360;
	UPDATE `creature` SET`position_x`=5913.586,`position_y`=-3380.241,`position_z`=361.7765 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109361;
	UPDATE `creature` SET`position_x`=6159.359,`position_y`=-3433.279,`position_z`=366.435 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109362;
	UPDATE `creature` SET`position_x`=5935.404,`position_y`=-3734.689,`position_z`=362.0851 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109363;
	UPDATE `creature` SET`position_x`=6411.343,`position_y`=-4628.025,`position_z`=453.4083 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109364;
	UPDATE `creature` SET`position_x`=6660.446,`position_y`=-4843.688,`position_z`=454.1966 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109366;
	UPDATE `creature` SET`position_x`=5875.702,`position_y`=-3492.118,`position_z`=370.7459 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109367;
	UPDATE `creature` SET`position_x`=6312.36,`position_y`=-4536.516,`position_z`=453.8166 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109368;
	UPDATE `creature` SET`position_x`=5471.539,`position_y`=-4181.943,`position_z`=363.1029 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109369;
	UPDATE `creature` SET`position_x`=5610.197,`position_y`=-3734.703,`position_z`=364.3491 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109370;
	UPDATE `creature` SET`position_x`=5403.127,`position_y`=-3489.083,`position_z`=370.0649 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109275;
	UPDATE `creature` SET`position_x`=5575.087,`position_y`=-3670.556,`position_z`=363.959 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109281;
	UPDATE `creature` SET`position_x`=6927.51,`position_y`=-4183.301,`position_z`=451.1254 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109254;
	UPDATE `creature` SET`position_x`=6755.625,`position_y`=-4946.379,`position_z`=451.1594 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109250;
	UPDATE `creature` SET`position_x`=6213.772,`position_y`=-4448.972,`position_z`=450.8095 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109256;
	UPDATE `creature` SET`position_x`=6581.064,`position_y`=-4651.773,`position_z`=450.6446 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109259;
	UPDATE `creature` SET`position_x`=6583.38,`position_y`=-4579.924,`position_z`=450.6438 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109365;
	UPDATE `creature` SET`position_x`=6447.836,`position_y`=-4653.916,`position_z`=455.0706 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109418;
	UPDATE `creature` SET`position_x`=6507.284,`position_y`=-4339.578,`position_z`=450.6429 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109472;
	UPDATE `creature` SET`position_x`=6854.059,`position_y`=-4183.029,`position_z`=451.9279 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109473;
	UPDATE `creature` SET`position_x`=6727.616,`position_y`=-4235.008,`position_z`=456.3934 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109475;
	UPDATE `creature` SET`position_x`=6722.394,`position_y`=-4177.778,`position_z`=457.5261 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109270;
	UPDATE `creature` SET`position_x`=6670.733,`position_y`=-4175.295,`position_z`=454.8703 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109273;
	UPDATE `creature` SET`position_x`=5243.896,`position_y`=-4147.37,`position_z`=360.1944 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109335;
	UPDATE `creature` SET`position_x`=5501.327,`position_y`=-3592.177,`position_z`=363.8152 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109306;
	UPDATE `creature` SET`position_x`=6808.324,`position_y`=-4098.423,`position_z`=469.683 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109339;
	UPDATE `creature` SET`position_x`=6394.767,`position_y`=-3408.127,`position_z`=390.075 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109350;
	UPDATE `creature` SET`position_x`=6383.011,`position_y`=-3343.21,`position_z`=388.8273 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109271;
	UPDATE `creature` SET`position_x`=6256.193,`position_y`=-3276.367,`position_z`=372.0493 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109272;
	UPDATE `creature` SET`position_x`=5595.929,`position_y`=-3271.023,`position_z`=372.6018 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109274;
	UPDATE `creature` SET`position_x`=5811.58,`position_y`=-3986.335,`position_z`=366.807 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109280;
	UPDATE `creature` SET`position_x`=5795.506,`position_y`=-3254.231,`position_z`=362.0512 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109282;
	UPDATE `creature` SET`position_x`=6314.771,`position_y`=-3882.808,`position_z`=456.8956 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109283;
	UPDATE `creature` SET`position_x`=6359.207,`position_y`=-3308.222,`position_z`=388.839 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109284;
	UPDATE `creature` SET`position_x`=6908.333,`position_y`=-4308.334,`position_z`=450.9777 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109285;
	UPDATE `creature` SET`position_x`=6454.822,`position_y`=-3504.125,`position_z`=388.8163 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109286;
	UPDATE `creature` SET`position_x`=6294.398,`position_y`=-4082.212,`position_z`=459.0051 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109287;
	UPDATE `creature` SET`position_x`=6469.129,`position_y`=-3795.564,`position_z`=470.8206 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109288;
	UPDATE `creature` SET`position_x`=5990.625,`position_y`=-3659.936,`position_z`=372.1118 ,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109289;
	-- DragonBlight
	UPDATE `creature` SET`position_x`=3620.254,`position_y`=1650.182,`position_z`=100.0643,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109156;
	UPDATE `creature` SET`position_x`=3768.207,`position_y`=-886.942,`position_z`=162.9382,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109157;
	UPDATE `creature` SET`position_x`=3613.154,`position_y`=2733.536,`position_z`=78.88829,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109158;
	UPDATE `creature` SET`position_x`=3203.678,`position_y`=1938.531,`position_z`=130.0271,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109179;
	UPDATE `creature` SET`position_x`=3692.975,`position_y`=1204.903,`position_z`=145.5113,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109180;
	UPDATE `creature` SET`position_x`=3783.571,`position_y`=2700.019,`position_z`=126.7527,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109181;
	UPDATE `creature` SET`position_x`=4750.24,`position_y`=-1248.16,`position_z`=165.927,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109182;
	UPDATE `creature` SET`position_x`=3052.915,`position_y`=-398.3321,`position_z`=126.6303,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109184;
	UPDATE `creature` SET`position_x`=3542.592,`position_y`=1185.424,`position_z`=140.1802,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109185;
	UPDATE `creature` SET`position_x`=4221.524,`position_y`=1187.345,`position_z`=140.0841,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109186;
	UPDATE `creature` SET`position_x`=4021.892,`position_y`=1351.954,`position_z`=130.1643,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109187;
	UPDATE `creature` SET`position_x`=4369.723,`position_y`=1124.923,`position_z`=145.9261,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109190;
	UPDATE `creature` SET`position_x`=3746.615,`position_y`=1922.069,`position_z`=93.01498,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109193;
	UPDATE `creature` SET`position_x`=3569.02,`position_y`=2214.506,`position_z`=64.39397,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109194;
	UPDATE `creature` SET`position_x`=3646.509,`position_y`=1685.975,`position_z`=102.1629,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109195;
	UPDATE `creature` SET`position_x`=3523.481,`position_y`=2410.484,`position_z`=66.17959,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109197;
	UPDATE `creature` SET`position_x`=3688.756,`position_y`=2424.57,`position_z`=112.5445,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109198;
	UPDATE `creature` SET`position_x`=3584.884,`position_y`=1939.926,`position_z`=75.91331,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109199;
	UPDATE `creature` SET`position_x`=3485.362,`position_y`=2146.166,`position_z`=61.47018,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109200;
	UPDATE `creature` SET`position_x`=3469.875,`position_y`=1687.246,`position_z`=76.2061,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109201;
	UPDATE `creature` SET`position_x`=3436.097,`position_y`=2827.708,`position_z`=29.47079,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109202;
	UPDATE `creature` SET`position_x`=3406.586,`position_y`=1924.589,`position_z`=77.60923,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109203;
	UPDATE `creature` SET`position_x`=3672.214,`position_y`=2248.683,`position_z`=86.77159,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109205;
	UPDATE `creature` SET`position_x`=3364.858,`position_y`=2721.044,`position_z`=40.87398,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109207;
	UPDATE `creature` SET`position_x`=3327.575,`position_y`=1326.159,`position_z`=133.2062,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109210;
	UPDATE `creature` SET`position_x`=3757.848,`position_y`=1692.701,`position_z`=120.4788,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109211;
	UPDATE `creature` SET`position_x`=3981.441,`position_y`=1490.405,`position_z`=120.7491,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109212;
	UPDATE `creature` SET`position_x`=3421.57,`position_y`=1906.341,`position_z`=73.50089,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109216;
	UPDATE `creature` SET`position_x`=4316.777,`position_y`=-735.7052,`position_z`=138.2696,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109217;
	UPDATE `creature` SET`position_x`=3691.063,`position_y`=-723.549,`position_z`=212.6798,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109219;
	UPDATE `creature` SET`position_x`=3208.047,`position_y`=-992.0858,`position_z`=72.48033,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109220;
	UPDATE `creature` SET`position_x`=3137.406,`position_y`=-1470.828,`position_z`=55.35337,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109221;
	UPDATE `creature` SET`position_x`=2924.008,`position_y`=-1461.609,`position_z`=63.79272,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109224;
	UPDATE `creature` SET`position_x`=3286.186,`position_y`=-446.4649,`position_z`=152.7464,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109225;
	UPDATE `creature` SET`position_x`=2758.182,`position_y`=-621.6596,`position_z`=84.60215,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109226;
	UPDATE `creature` SET`position_x`=3627.907,`position_y`=1280.237,`position_z`=128.516,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109228;
	UPDATE `creature` SET`position_x`=2791.93,`position_y`=-1429.43,`position_z`=45.35851,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109231;
	UPDATE `creature` SET`position_x`=4854.099,`position_y`=791.9739,`position_z`=161.0901,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109233;
	UPDATE `creature` SET`position_x`=3592.781,`position_y`=-860.0109,`position_z`=167.2778,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109234;
	UPDATE `creature` SET`position_x`=3333.414,`position_y`=-1209.81,`position_z`=104.8348,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109235;
	UPDATE `creature` SET`position_x`=4885.661,`position_y`=701.9277,`position_z`=160.8855,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109236;
	UPDATE `creature` SET`position_x`=3145.343,`position_y`=-1355.965,`position_z`=60.92131,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109237;
	UPDATE `creature` SET`position_x`=4971.454,`position_y`=876.998,`position_z`=205.8031,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109241;
	UPDATE `creature` SET`position_x`=4531.873,`position_y`=-1282.663,`position_z`=158.8159,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109244;
	UPDATE `creature` SET`position_x`=4652.467,`position_y`=-1013.966,`position_z`=169.5063,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109245;
	UPDATE `creature` SET`position_x`=3054.037,`position_y`=-1454.444,`position_z`=48.40919,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109248;
	UPDATE `creature` SET`position_x`=3406.486,`position_y`=-1479.628,`position_z`=105.1854,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109252;
	UPDATE `creature` SET`position_x`=3376.03,`position_y`=-412.9149,`position_z`=179.7603,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109253;
	UPDATE `creature` SET`position_x`=3171.561,`position_y`=-711.5107,`position_z`=115.0422,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109255;
	UPDATE `creature` SET`position_x`=3135.217,`position_y`=-1376.759,`position_z`=60.99298,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109257;
	UPDATE `creature` SET`position_x`=2871.505,`position_y`=-620.4344,`position_z`=90.22025,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109258;
	UPDATE `creature` SET`position_x`=3341.25,`position_y`=-1090.909,`position_z`=120.7446,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109260;
	UPDATE `creature` SET`position_x`=4488.867,`position_y`=-876.8516,`position_z`=166.9429,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109261;
	UPDATE `creature` SET`position_x`=4377.428,`position_y`=-1214.074,`position_z`=172.9608,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109262;
	UPDATE `creature` SET`position_x`=4385.769,`position_y`=-1249.927,`position_z`=170.6178,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109263;
	UPDATE `creature` SET`position_x`=4549.1,`position_y`=-1173.713,`position_z`=161.2497,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109264;
	UPDATE `creature` SET`position_x`=4733.276,`position_y`=-1123.919,`position_z`=168.9866,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109265;
	UPDATE `creature` SET`position_x`=4529.679,`position_y`=-1037.757,`position_z`=172.0851,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109266;
	UPDATE `creature` SET`position_x`=4472.832,`position_y`=-752.5022,`position_z`=143.8334,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109267;
	UPDATE `creature` SET`position_x`=4841.38,`position_y`=-1142.975,`position_z`=172.8267,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109268;
	UPDATE `creature` SET`position_x`=4310.728,`position_y`=-974.2538,`position_z`=166.6221,`spawntimesecs`=300,`spawndist`=5,`MovementType`=1 WHERE`guid`=109269;
	-- Remove Extras
	DELETE FROM `creature` WHERE `guid` IN (109290,109291,109292,109293,109294,109295,109296,109297,109299,109300,109301,109474,109476,109478,109479,109480,109482,109486,109495,109496,131189,131190,131191,133442,133443,133444,133445,138622,138623);
	
	-- ----------------------------------------
	-- Moonrest Gardens
	-- ----------------------------------------

	-- Magister Keldonus kneel emote and weapon sheath
	INSERT INTO `creature_template_addon` (`entry`, `emote`, `bytes1`) VALUES (26828,68,8);
	-- Wind Trader Mu'fah location update
	UPDATE `creature` SET `position_x` = 3372.765, `position_y` = 2593.63, `position_z` = 40.56118, `orientation` = 4.886922 WHERE `guid` = 1790;
	-- Dragonblight Mage Hunter updates
	UPDATE `creature` SET `position_x` = 3373.643, `position_y` = 2584.315, `position_z` = 42.15882, `orientation` = 1.623156, `spawndist` = 0, `MovementType` = 0 WHERE `guid` = 111799;
	-- Surge Needle Sorcerer GUID - 109557
	DELETE FROM `db_scripts` WHERE `id` = 2625701;
	INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
	(3,2625701,0,15,46583,0,0,0,0,0,0,0,0,0,0,0,0,'Cast Cosmetic - Drink'); 
	UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 109557;
	DELETE FROM `creature_movement` WHERE `id` = 109557;
	INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
	(109557,1,3322.13,2609.24,37.5503,8000,2625701,0,0,0,0,0,0,0,0,1.65806,0,0);
	-- Dead Mage Hunters Scripted and loot update
	DELETE FROM `creature_ai_scripts` WHERE creature_id = 26477;
	INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
	(19228122,26477,11,0,100,0,0,0,0,0,3,26476,0,0,0,0,0,0,0,0,0,0,'ytdb-Dead Mage Hunter Transform');
	UPDATE `creature_template` SET `IconName` = '', `AIName` = 'EventAI' WHERE `entry` IN (26477);
	UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '10' WHERE entry =35792 AND item = 35783;
	-- Dead Mage hunter Location Update
	UPDATE `creature` set `position_x` = 3273.807, `position_y` = 2236.796, `position_z` = 37.554, `orientation` = 4.066617 WHERE guid = 105887;
	UPDATE `creature` set `position_x` = 3381.446, `position_y` = 2178.125, `position_z` = 43.3944, `orientation` = 3.682645 WHERE guid = 105888;
	UPDATE `creature` set `position_x` = 3404.514, `position_y` = 2148.529, `position_z` = 44.6889, `orientation` = 5.550147 WHERE guid = 105889;
	UPDATE `creature` set `position_x` = 3388.768, `position_y` = 2204.164, `position_z` = 37.32382, `orientation` = 1.762783 WHERE guid = 105890;
	UPDATE `creature` set `position_x` = 3470.086, `position_y` = 2199.609, `position_z` = 51.86384, `orientation` = 5.637414 WHERE guid = 105891;
	UPDATE `creature` set `position_x` = 3410.111, `position_y` = 2259.098, `position_z` = 34.04323, `orientation` = 3.333579 WHERE guid = 105892;
	UPDATE `creature` set `position_x` = 3519.218, `position_y` = 2240.689, `position_z` = 49.55909, `orientation` = 6.003932 WHERE guid = 105893;
	UPDATE `creature` set `position_x` = 3463.746, `position_y` = 2277.352, `position_z` = 30.06723, `orientation` = 3.612832 WHERE guid = 105894;
	UPDATE `creature` set `position_x` = 3542.876, `position_y` = 2281.21, `position_z` = 52.30217, `orientation` = 0.4712389 WHERE guid = 105895;
	UPDATE `creature` set `position_x` = 3515.611, `position_y` = 2322.73, `position_z` = 47.06169, `orientation` = 5.51524 WHERE guid = 105896;
	UPDATE `creature` set `position_x` = 3547.597, `position_y` = 2348.697, `position_z` = 58.76512, `orientation` = 1.064651 WHERE guid = 105897;
	UPDATE `creature` set `position_x` = 3460.781, `position_y` = 2277.317, `position_z` = 30.06723, `orientation` = 5.707227 WHERE guid = 105900;
	UPDATE `creature` set `position_x` = 3532.734, `position_y` = 2391.923, `position_z` = 64.95825, `orientation` = 0.7853982 WHERE guid = 105901;
	UPDATE `creature` set `position_x` = 3492.288, `position_y` = 2394.066, `position_z` = 57.97712, `orientation` = 1.082104 WHERE guid = 105902;
	UPDATE `creature` set `position_x` = 3495.47, `position_y` = 2439.793, `position_z` = 62.79995, `orientation` = 2.164208 WHERE guid = 105913;
	UPDATE `creature` set `position_x` = 3423.953, `position_y` = 2362.271, `position_z` = 38.24512, `orientation` = 2.75762 WHERE guid = 105979;
	-- Add missing Dead Mage Hunter
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
	(@GUID+2,26477,571,1,1,0,0,3439.516,2338.008,34.9111,4.118977,300,0,0,9291,3231,0,0),
	(@GUID+3,26477,571,1,1,0,0,3391.215,2317.478,30.11896,2.373648,300,0,0,9291,3231,0,0);
	-- Moonrest Highborn Additions and Position Updates
	UPDATE `creature` SET `position_x`=3322.37,`position_y`=2148.047,`position_z`=64.54546,`spawndist` = 5,`MovementType`=1 WHERE `guid`=103770;
	UPDATE `creature` SET `position_x`=3448.534,`position_y`=2280.183,`position_z`=30.10889,`spawndist`=5,`MovementType`=1 WHERE `guid`=103771;
	UPDATE `creature` SET `position_x`=3377.188,`position_y`=2278.725,`position_z`=30.22437,`spawndist`=5,`MovementType`=1 WHERE `guid`=103772;
	UPDATE `creature` SET `position_x`=3322.855,`position_y`=2409.651,`position_z`=34.89613,`spawndist`=5,`MovementType`=1 WHERE `guid`=103773;
	UPDATE `creature` SET `position_x`=3348.007,`position_y`=2380.467,`position_z`=30.45255,`spawndist`=5,`MovementType`=1 WHERE `guid`=103774;
	UPDATE `creature` SET `position_x`=3414.265,`position_y`=2176.355,`position_z`=45.39147,`spawndist`=5,`MovementType`=1 WHERE `guid`=103775;
	UPDATE `creature` SET `position_x`=3477.698,`position_y`=2322.536,`position_z`=34.42124,`spawndist`=5,`MovementType`=1 WHERE `guid`=103776;
	UPDATE `creature` SET `position_x`=3353.785,`position_y`=2248.87,`position_z`=30.10889,`spawndist`=5,`MovementType`=1 WHERE `guid`=103777;
	UPDATE `creature` SET `position_x`=3349.158,`position_y`=2308.348,`position_z`=31.92139,`spawndist`=5,`MovementType`=1 WHERE `guid`=103778;
	UPDATE `creature` SET `position_x`=3286.321,`position_y`=2249.025,`position_z`=32.45472,`spawndist`=5,`MovementType`=1 WHERE `guid`=103779;
	UPDATE `creature` SET `position_x`=3441.618,`position_y`=2208.71,`position_z`=47.46336,`spawndist`=5,`MovementType`=1 WHERE `guid`=103780;
	UPDATE `creature` SET `position_x`=3523.612,`position_y`=2277.257,`position_z`=47.75031,`spawndist`=5,`MovementType`=1 WHERE `guid`=103781;
	UPDATE `creature` SET `position_x`=3386.084,`position_y`=2405.43,`position_z`=39.07066,`spawndist`=5,`MovementType`=1 WHERE `guid`=103782;
	UPDATE `creature` SET `position_x`=3384.568,`position_y`=2217.758,`position_z`=32.49195,`spawndist`=5,`MovementType`=1 WHERE `guid`=103783;
	UPDATE `creature` SET `position_x`=3336.942,`position_y`=2115.922,`position_z`=69.43834,`spawndist`=5,`MovementType`=1 WHERE `guid`=103789;
	UPDATE `creature` SET `position_x`=3351.321,`position_y`=2184.566,`position_z`=41.40746,`spawndist`=5,`MovementType`=1 WHERE `guid`=103790;
	UPDATE `creature` SET `position_x`=3553.457,`position_y`=2385.971,`position_z`=70.16534,`spawndist`=5,`MovementType`=1 WHERE `guid`=103794;
	UPDATE `creature` SET `position_x`=3436.844,`position_y`=2469.221,`position_z`=43.87006,`spawndist`=5,`MovementType`=1 WHERE `guid`=103795;
	UPDATE `creature` SET `position_x`=3478.829,`position_y`=2245.717,`position_z`=37.372,`spawndist`=5,`MovementType`=1 WHERE `guid`=103798;
	UPDATE `creature` SET `position_x`=3392.623,`position_y`=2349.479,`position_z`=36.00871,`spawndist`=5,`MovementType`=1 WHERE `guid`=103801;
	UPDATE `creature` SET `position_x`=3289.424,`position_y`=2322.478,`position_z`=30.5647,`spawndist`=5,`MovementType`=1 WHERE `guid`=103803;
	UPDATE `creature` SET `position_x`=3487.648,`position_y`=2383.854,`position_z`=55.95811,`spawndist`=5,`MovementType`=1 WHERE `guid`=103805;
	UPDATE `creature` SET `position_x`=3314.874,`position_y`=2206.235,`position_z`=39.41614,`spawndist`=5,`MovementType`=1 WHERE `guid`=103806;
	UPDATE `creature` SET `position_x`=3486.36,`position_y`=2179.949,`position_z`=54.34189,`spawndist`=5,`MovementType`=1 WHERE `guid`=103821;
	UPDATE `creature` SET `position_x`=3395.727,`position_y`=2151.058,`position_z`=45.46373,`spawndist`=5,`MovementType`=1 WHERE `guid`=103822;
	UPDATE `creature` SET `position_x`=3520.689,`position_y`=2413.777,`position_z`=65.65343,`spawndist`=5,`MovementType`=1 WHERE `guid`=103823;
	UPDATE `creature` SET `position_x`=3453.122,`position_y`=2420.476,`position_z`=40.42348,`spawndist`=5,`MovementType`=1 WHERE `guid`=103852;
	UPDATE `creature` SET `position_x`=3541.155,`position_y`=2252.433,`position_z`=53.29763,`spawndist`=5,`MovementType`=1 WHERE `guid`=103853;
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
	(@GUID+4,26455,571,1,1,0,0,3553.884,2323.048,53.78716,2.38105,300,5,0,9291,3231,0,1),
	(@GUID+5,26455,571,1,1,0,0,3314.791,2345.536,32.40715,1.3615,300,5,0,9291,3231,0,1),
	(@GUID+6,26455,571,1,1,0,0,3425.807,2308.407,30.10889,2.38105,300,5,0,9291,3231,0,1),
	(@GUID+7,26455,571,1,1,0,0,3526.131,2344.255,52.27321,2.31048,300,5,0,9291,3231,0,1),
	(@GUID+8,26455,571,1,1,0,0,3515.979,2226.131,50.45835,0.48175,300,5,0,9291,3231,0,1),
	(@GUID+9,26455,571,1,1,0,0,3415.285,2252.186,33.08635,2.32167,300,5,0,9291,3231,0,1);
	-- Moonrest Stalker Spawn Updates
	UPDATE `creature` SET `position_x`=3421.786,`position_y`=2656.199,`position_z`=39.71873,`spawndist`=5,`MovementType`=1 WHERE `guid`=111859;
	UPDATE `creature` SET `position_x`=3553.497,`position_y`=2552.363,`position_z`=82.4193,`spawndist`=5,`MovementType`=1 WHERE `guid`=111860;
	UPDATE `creature` SET `position_x`=3175.341,`position_y`=2241.354,`position_z`=15.27573,`spawndist`=5,`MovementType`=1 WHERE `guid`=111861;
	UPDATE `creature` SET `position_x`=3224.88,`position_y`=2135.178,`position_z`=20.25968,`spawndist`=5,`MovementType`=1 WHERE `guid`=111862;
	UPDATE `creature` SET `position_x`=3208.317,`position_y`=2164.26,`position_z`=17.68021,`spawndist`=5,`MovementType`=1 WHERE `guid`=111863;
	UPDATE `creature` SET `position_x`=3211.281,`position_y`=2290.795,`position_z`=12.60885,`spawndist`=5,`MovementType`=1 WHERE `guid`=111864;
	UPDATE `creature` SET `position_x`=3142.354,`position_y`=2092.341,`position_z`=23.12593,`spawndist`=5,`MovementType`=1 WHERE `guid`=111865;
	UPDATE `creature` SET `position_x`=3505.291,`position_y`=2445.311,`position_z`=65.3538,`spawndist`=5,`MovementType`=1 WHERE `guid`=111866;
	UPDATE `creature` SET `position_x`=3540.747,`position_y`=2414.725,`position_z`=70.64732,`spawndist`=5,`MovementType`=1 WHERE `guid`=111867;
	UPDATE `creature` SET `position_x`=3220.549,`position_y`=2491.883,`position_z`=38.25057,`spawndist`=5,`MovementType`=1 WHERE `guid`=111868;
	UPDATE `creature` SET `position_x`=3258.325,`position_y`=2522.252,`position_z`=47.14868,`spawndist`=5,`MovementType`=1 WHERE `guid`=111869;
	UPDATE `creature` SET `position_x`=3318.826,`position_y`=2571.43,`position_z`=43.89212,`spawndist`=5,`MovementType`=1 WHERE `guid`=111870;
	UPDATE `creature` SET `position_x`=3279.316,`position_y`=2479.948,`position_z`=44.26476,`spawndist`=5,`MovementType`=1 WHERE `guid`=111871;
	UPDATE `creature` SET `position_x`=3438.631,`position_y`=2403.193,`position_z`=41.11062,`spawndist`=5,`MovementType`=1 WHERE `guid`=111872;
	UPDATE `creature` SET `position_x`=3246.384,`position_y`=2437.74,`position_z`=38.56835,`spawndist`=5,`MovementType`=1 WHERE `guid`=111873;
	UPDATE `creature` SET `position_x`=3441.74,`position_y`=2504.554,`position_z`=48.19352,`spawndist`=5,`MovementType`=1 WHERE `guid`=111874;
	UPDATE `creature` SET `position_x`=3314.027,`position_y`=2414.003,`position_z`=36.1757,`spawndist`=5,`MovementType`=1 WHERE `guid`=111875;
	UPDATE `creature` SET `position_x`=3364.924,`position_y`=2409.544,`position_z`=38.26502,`spawndist`=5,`MovementType`=1 WHERE `guid`=111881;
	UPDATE `creature` SET `position_x`=3237.5,`position_y`=2383.233,`position_z`=32.16562,`spawndist`=5,`MovementType`=1 WHERE `guid`=111882;
	UPDATE `creature` SET `position_x`=3327.001,`position_y`=2681.323,`position_z`=39.73542,`spawndist`=5,`MovementType`=1 WHERE `guid`=111887;
	UPDATE `creature` SET `position_x`=3018.991,`position_y`=2086.146,`position_z`=3.475917,`spawndist`=5,`MovementType`=1 WHERE `guid`=111888;
	UPDATE `creature` SET `position_x`=3208.223,`position_y`=2224.675,`position_z`=13.00014,`spawndist`=5,`MovementType`=1 WHERE `guid`=111889;
	UPDATE `creature` SET `position_x`=3440.727,`position_y`=2743.807,`position_z`=49.31521,`spawndist`=5,`MovementType`=1 WHERE `guid`=111890;
	UPDATE `creature` SET `position_x`=3059.525,`position_y`=2101.125,`position_z`=13.68275,`spawndist`=5,`MovementType`=1 WHERE `guid`=111891;
	UPDATE `creature` SET `position_x`=3535.033,`position_y`=2588.096,`position_z`=84.48141,`spawndist`=5,`MovementType`=1 WHERE `guid`=111892;
	UPDATE `creature` SET `position_x`=3585.513,`position_y`=2618.145,`position_z`=90.50779,`spawndist`=5,`MovementType`=1 WHERE `guid`=111893;
	UPDATE `creature` SET `position_x`=3023.602,`position_y`=2143.987,`position_z`=2.461102,`spawndist`=5,`MovementType`=1 WHERE `guid`=111894;
	UPDATE `creature` SET `position_x`=3505.88,`position_y`=2502.375,`position_z`=64.51835,`spawndist`=5,`MovementType`=1 WHERE `guid`=111895;
	UPDATE `creature` SET `position_x`=3025.771,`position_y`=2228.166,`position_z`=1.062076,`spawndist`=5,`MovementType`=1 WHERE `guid`=111896;
	UPDATE `creature` SET `position_x`=3431.663,`position_y`=2551.896,`position_z`=45.54511,`spawndist`=5,`MovementType`=1 WHERE `guid`=111897;
	UPDATE `creature` SET `position_x`=3173.75,`position_y`=2076.93,`position_z`=22.36362,`spawndist`=5,`MovementType`=1 WHERE `guid`=111898;
	UPDATE `creature` SET `position_x`=3117.869,`position_y`=2366.742,`position_z`=0.7530035,`spawndist`=5,`MovementType`=1 WHERE `guid`=111900;
	UPDATE `creature` SET `position_x`=3519.536,`position_y`=2668.965,`position_z`=80.88109,`spawndist`=5,`MovementType`=1 WHERE `guid`=111901;
	UPDATE `creature` SET `position_x`=3076.999,`position_y`=2162.639,`position_z`=9.60784,`spawndist`=5,`MovementType`=1 WHERE `guid`=111902;
	UPDATE `creature` SET `position_x`=3363.969,`position_y`=2746.011,`position_z`=46.9691,`spawndist`=5,`MovementType`=1 WHERE `guid`=111903;
	UPDATE `creature` SET `position_x`=3245.454,`position_y`=2591.336,`position_z`=24.83227,`spawndist`=5,`MovementType`=1 WHERE `guid`=111904;
	UPDATE `creature` SET `position_x`=3565.523,`position_y`=2475.695,`position_z`=78.62074,`spawndist`=5,`MovementType`=1 WHERE `guid`=111907;
	UPDATE `creature` SET `position_x`=3041.291,`position_y`=2273.798,`position_z`=2.667574,`spawndist`=5,`MovementType`=1 WHERE `guid`=111908;
	UPDATE `creature` SET `position_x`=3294.095,`position_y`=2629.571,`position_z`=36.83441,`spawndist`=5,`MovementType`=1 WHERE `guid`=111909;
	-- Remove Duplicate Moonrest Stalkers
	DELETE FROM `creature` WHERE `guid` IN (111910,111915,111916,111924,111930,111936,111938);
	
	-- Linking for Dragonblight Mage Hunter Master / Slave pathing
	DELETE FROM `creature_linking` where `guid` OR `master_guid` IN (101689,111848,111771,101641,111799,101647,101644,111795,111808,101653,111816,101655,111807,101651,101688,111845);

	INSERT INTO`creature_linking` (`guid`,`master_guid`,`flag`) VALUES
	(101689,111848,527),
	(101641,111771,527),
	(101647,111799,527),
	(101644,111795,527),
	(101653,111808,527),
	(101655,111816,527),
	(101651,111807,527),
	(101688,111845,527);

	-- Dragonblight Mage Hunter Position Updates
	UPDATE `creature` SET `position_x`=3369.878,`position_y`=2692.394,`position_z`=40.87848,`spawndist`=0,`MovementType`=2 WHERE `guid`=111848;
	UPDATE `creature` SET `position_x`=3369.878,`position_y`=2692.394,`position_z`=40.87848,`spawndist`=0,`MovementType`=0 WHERE `guid`=101689;
	UPDATE `creature` SET `position_x`=3336.02,`position_y`=2750.484,`position_z`=47.83788,`spawndist`=0,`MovementType`=2 WHERE `guid`=111771;
	UPDATE `creature` SET `position_x`=3336.02,`position_y`=2750.484,`position_z`=47.83788,`spawndist`=0,`MovementType`=0 WHERE `guid`=101641;
	UPDATE `creature` SET `position_x`=3288.295,`position_y`=2664.482,`position_z`=37.20802,`spawndist`=0,`MovementType`=2 WHERE `guid`=111799;
	UPDATE `creature` SET `position_x`=3288.295,`position_y`=2664.482,`position_z`=37.20802,`spawndist`=0,`MovementType`=0 WHERE `guid`=101647;
	UPDATE `creature` SET `position_x`=3442.35,`position_y`=2524.089,`position_z`=47.82127,`spawndist`=0,`MovementType`=2 WHERE `guid`=111795;
	UPDATE `creature` SET `position_x`=3442.35,`position_y`=2524.089,`position_z`=47.82127,`spawndist`=0,`MovementType`=0 WHERE `guid`=101644;
	UPDATE `creature` SET `position_x`=3344.911,`position_y`=2403.99,`position_z`=34.93776,`spawndist`=0,`MovementType`=2 WHERE `guid`=111816;
	UPDATE `creature` SET `position_x`=3344.911,`position_y`=2403.99,`position_z`=34.93776,`spawndist`=0,`MovementType`=0 WHERE `guid`=101655;
	UPDATE `creature` SET `position_x`=3525.945,`position_y`=2571.778,`position_z`=85.15385,`spawndist`=0,`MovementType`=2 WHERE `guid`=111807;
	UPDATE `creature` SET `position_x`=3525.945,`position_y`=2571.778,`position_z`=85.15385,`spawndist`=0,`MovementType`=0 WHERE `guid`=101651;
	UPDATE `creature` SET `position_x`=3514.362,`position_y`=2412.798,`position_z`=64.33236,`spawndist`=0,`MovementType`=2 WHERE `guid`=111845;
	UPDATE `creature` SET `position_x`=3514.362,`position_y`=2412.798,`position_z`=64.33236,`spawndist`=0,`MovementType`=0 WHERE `guid`=101688;

	-- Pathing for Dragonblight Mage Hunters
	DELETE FROM `creature_movement` WHERE `id`IN(101689,111848,111771,101641,111799,101647,101644,111795,111808,101653,111816,101655,111807,101651,101688,111845);
	INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`wpguid`,`orientation`,`model1`,`model2`) VALUES
	(111848,1,3367.146,2670.335,39.48182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,2,3367.146,2673.085,39.98182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,3,3366.896,2675.585,39.73182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,4,3366.896,2676.085,39.73182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,5,3366.896,2683.335,40.48182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,6,3366.646,2689.585,40.98182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,7,3366.646,2692.085,39.73182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,8,3366.646,2692.835,39.48182,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,9,3364.883,2693.904,39.04121,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,10,3364.633,2691.654,39.29121,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,11,3371.383,2693.154,41.54121,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,12,3373.383,2671.654,39.04121,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,13,3371.883,2671.654,39.04121,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,14,3370.883,2671.654,39.04121,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,15,3367.444,2670.019,39.40629,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,16,3368.944,2666.769,39.40629,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,17,3369.444,2662.519,38.90629,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,18,3369.444,2661.269,39.40629,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,19,3369.194,2657.269,38.90629,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,20,3368.944,2654.769,39.15629,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,21,3368.194,2645.519,39.15629,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,22,3367.529,2640.246,39.34507,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,23,3367.529,2630.996,39.59507,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,24,3367.529,2627.496,39.09507,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,25,3367.779,2626.996,38.84507,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,26,3369.529,2625.746,39.34507,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,27,3369.029,2623.496,39.09507,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,28,3368.779,2621.496,39.34507,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,29,3367.756,2615.235,39.41242,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,30,3368.006,2609.735,39.41242,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,31,3368.006,2608.485,39.66242,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,32,3368.256,2599.735,39.66242,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,33,3368.386,2594.917,40.2747,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,34,3368.386,2591.667,40.5247,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,35,3368.636,2589.917,40.7747,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,36,3369.136,2586.667,42.2747,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,37,3369.386,2586.167,42.0247,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,38,3369.886,2582.917,42.2747,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,39,3370.386,2579.167,42.5247,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,40,3370.636,2576.917,42.5247,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,41,3372.173,2569.61,42.46545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,42,3373.423,2569.36,42.46545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,43,3375.923,2568.86,42.71545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,44,3377.923,2568.61,42.96545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,45,3381.923,2567.86,42.96545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,46,3386.673,2565.86,42.96545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,47,3388.423,2565.11,43.71545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,48,3389.923,2564.61,44.71545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,49,3392.923,2563.11,46.71545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,50,3394.423,2562.61,47.46545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,51,3399.937,2559.952,51.25468,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,52,3401.187,2559.202,51.50468,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,53,3402.937,2557.952,52.75468,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,54,3404.437,2556.952,53.25468,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,55,3405.937,2554.952,54.00468,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,56,3406.437,2554.702,54.75468,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,57,3408.437,2551.952,56.50468,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,58,3410.817,2548.773,58.39983,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,59,3411.317,2547.023,59.14983,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,60,3411.817,2544.773,59.14983,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,61,3412.817,2540.273,59.39983,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,62,3414.808,2531.996,59.69427,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,63,3414.308,2528.746,59.69427,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,64,3412.878,2517.576,60.12773,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,65,3406.529,2507.478,60.53685,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,66,3399.279,2500.478,60.78685,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,67,3399.351,2500.534,60.80935,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,68,3405.851,2506.784,60.55935,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,69,3406.097,2506.94,60.46983,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,70,3406.847,2507.69,60.46983,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,71,3412.996,2517.83,60.04422,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,72,3414.246,2528.83,59.79422,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,73,3414.445,2528.98,59.8531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,74,3414.695,2532.23,59.6031,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,75,3412.945,2539.98,59.3531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,76,3412.195,2544.23,59.1031,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,77,3411.695,2545.98,59.1031,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,78,3411.445,2546.98,59.1031,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,79,3411.11,2548.318,58.83959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,80,3408.36,2551.818,56.58959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,81,3406.36,2554.068,54.83959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,82,3405.61,2554.818,54.33959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,83,3403.61,2557.318,53.08959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,84,3402.86,2557.818,52.58959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,85,3401.61,2558.818,52.08959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,86,3401.11,2559.068,51.58959,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,87,3400.721,2559.348,51.38424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,88,3399.721,2560.098,50.88424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,89,3394.971,2562.598,47.63424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,90,3392.971,2563.348,46.88424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,91,3389.971,2564.348,44.63424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,92,3388.221,2564.848,43.63424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,93,3386.971,2565.348,43.13424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,94,3380.471,2567.098,42.88424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,95,3378.971,2567.598,42.88424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,96,3376.221,2568.348,42.63424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,97,3375.721,2568.598,42.63424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,98,3373.471,2569.348,42.63424,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,99,3373.24,2569.388,42.27171,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,100,3372.74,2569.638,42.27171,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,101,3371.49,2577.888,42.52171,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,102,3371.24,2579.138,42.52171,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,103,3371.74,2581.638,42.27171,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,104,3370.24,2586.388,42.27171,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,105,3370.24,2586.888,42.27171,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,106,3368.49,2590.138,40.52171,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,107,3368.216,2590.456,40.29269,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,108,3368.716,2591.456,40.54269,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,109,3367.966,2596.206,40.04269,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,110,3368.216,2597.706,39.79269,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,111,3367.966,2608.456,39.54269,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,112,3367.966,2609.706,39.54269,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,113,3367.48,2615.505,39.34164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,114,3368.73,2621.505,39.34164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,115,3368.98,2623.505,39.09164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,116,3369.48,2625.755,39.34164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,117,3369.23,2627.255,39.09164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,118,3369.73,2628.005,39.34164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,119,3369.23,2628.755,39.34164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,120,3368.98,2630.255,39.34164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,121,3368.98,2631.255,39.59164,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,122,3367.57,2640.53,39.27953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,123,3367.57,2645.03,39.27953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,124,3367.57,2646.03,39.27953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,125,3367.57,2655.03,39.27953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,126,3367.57,2657.53,39.02953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,127,3367.57,2660.28,39.52953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,128,3367.32,2662.03,39.02953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,129,3368.82,2666.78,39.27953,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111848,130,3368.867,2667.016,39.42545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,1,3336.02,2750.484,47.83788,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,2,3339.77,2748.734,47.08788,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,3,3343.77,2746.734,46.58788,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,4,3350.02,2743.734,46.08788,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,5,3355.084,2740.994,45.63803,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,6,3365.334,2737.244,44.88803,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,7,3384.372,2730.136,44.62014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,8,3389.372,2730.386,45.37014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,9,3394.372,2730.886,46.12014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,10,3399.122,2731.136,46.37014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,11,3404.122,2731.386,47.12014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,12,3410.122,2731.386,47.62014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,13,3415.393,2731.836,48.25165,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,14,3420.643,2734.836,48.50165,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,15,3429.893,2739.836,49.25165,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,16,3440.1,2745.392,49.79897,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,17,3453.6,2750.892,50.04897,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,18,3462.1,2754.142,50.79897,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,19,3456.776,2752.154,50.32982,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,20,3446.026,2747.904,49.82982,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,21,3439.874,2745.217,49.68067,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,22,3427.874,2738.717,48.93067,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,23,3419.874,2734.467,48.68067,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,24,3415.101,2731.585,48.15738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,25,3408.101,2731.335,47.40738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,26,3403.101,2731.335,46.90738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,27,3397.351,2730.835,46.15738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,28,3392.351,2730.585,45.90738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,29,3388.351,2730.335,45.15738,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,30,3384.225,2730.118,44.73188,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,31,3366.725,2736.618,44.98188,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,32,3354.739,2741.241,45.73477,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,33,3346.739,2745.491,46.48477,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,34,3341.739,2747.741,46.73477,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,35,3338.989,2749.241,47.48477,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111771,36,3335.489,2750.991,47.98477,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,1,3317.398,2696.229,37.88054,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,2,3305.148,2684.979,37.38054,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,3,3301.025,2681.386,37.25816,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,4,3288.311,2664.503,37.20806,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,5,3281.186,2644.233,37.19172,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,6,3280.985,2644.141,36.95589,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,7,3283.937,2626.014,36.76145,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,8,3286.725,2607.331,36.8770,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,9,3283.937,2626.014,36.76145,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,10,3281.186,2644.233,37.19172,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,11,3288.524,2664.597,37.22066,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,12,3301.267,2681.65,37.31233,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111799,13,3309.767,2689.4,37.81233,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,1,3400.394,2676.384,39.34876,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,2,3402.144,2686.134,39.84876,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,3,3403.144,2691.884,40.59876,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,4,3402.772,2690.127,40.33588,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,5,3401.772,2684.377,39.83588,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,6,3399.949,2676.195,39.26486,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,7,3397.518,2651.798,39.34531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,8,3397.268,2644.798,40.09531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,9,3396.812,2620.534,39.8302,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,10,3399.562,2600.034,40.3302,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,11,3400.312,2596.034,40.8302,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,12,3400.638,2594.296,41.09357,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,13,3407.888,2585.796,41.84357,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,14,3410.888,2582.296,42.09357,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,15,3413.638,2579.296,42.84357,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,16,3416.138,2576.296,43.34357,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,17,3416.709,2575.563,43.9666,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,18,3422.709,2571.813,44.2166,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,19,3428.209,2568.063,44.7166,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,20,3438.209,2561.563,45.4666,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,21,3440.255,2560.06,45.73048,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,22,3440.755,2542.31,46.23048,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,23,3441.005,2533.31,46.73048,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,24,3441.005,2526.31,47.23048,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,25,3441.313,2524.232,47.6994,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,26,3446.063,2522.732,48.4494,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,27,3450.063,2521.982,49.1994,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,28,3452.563,2520.982,49.6994,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,29,3455.563,2520.232,50.4494,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,30,3458.313,2519.232,51.1994,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,31,3461.313,2518.482,51.6994,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,32,3461.1,2518.589,51.82127,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,33,3459.35,2519.089,51.07127,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,34,3455.35,2520.339,50.32127,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,35,3452.6,2520.839,49.82127,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,36,3450.1,2521.589,49.07127,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,37,3447.1,2522.589,48.57127,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,38,3442.35,2524.089,47.82127,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,39,3441.461,2524.516,47.3701,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,40,3441.211,2530.516,46.8701,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,41,3440.961,2538.516,46.6201,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,42,3440.711,2551.266,45.8701,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,43,3440.167,2560.167,45.49123,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,44,3430.917,2565.917,44.99123,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,45,3425.417,2569.917,44.49123,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,46,3418.667,2574.417,43.99123,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,47,3416.535,2575.931,43.6088,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,48,3414.035,2578.931,42.8588,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,49,3411.285,2581.931,42.1088,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,50,3408.285,2585.431,41.8588,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,51,3401.035,2593.931,41.1088,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,52,3400.498,2594.529,40.89014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,53,3399.998,2598.529,40.39014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,54,3399.248,2602.279,40.14014,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,55,3396.819,2620.696,39.644,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,56,3397.319,2634.446,40.394,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111795,57,3397.319,2646.446,39.644,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,1,3228.535,2431.671,37.36169,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,2,3226.285,2430.421,37.11169,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,3,3225.785,2423.421,36.11169,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,4,3225.535,2421.671,35.86169,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,5,3225.285,2418.671,35.11169,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,6,3224.701,2414.715,34.48481,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,7,3225.521,2421.736,35.65176,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,8,3225.521,2423.736,36.15176,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,9,3226.021,2428.736,36.90176,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,10,3226.141,2428.824,37.00854,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,11,3226.391,2430.824,37.25854,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,12,3231.641,2433.324,37.75854,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,13,3238.641,2436.824,38.25854,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,14,3247.641,2441.074,39.00854,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,15,3251.21,2443.078,39.54433,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,16,3254.96,2447.578,40.04433,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,17,3258.21,2451.078,40.29433,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,18,3260.96,2454.078,41.04433,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,19,3261.913,2455.199,41.65372,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,20,3262.163,2459.199,41.90372,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,21,3262.413,2462.199,42.65372,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,22,3262.913,2465.949,43.15372,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,23,3263.38,2471.124,42.66562,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,24,3257.83,2488.209,42.58521,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,25,3253.58,2493.959,42.33521,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,26,3246.186,2504.875,42.6394,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,27,3243.936,2512.625,43.1394,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,28,3240.686,2524.875,43.6394,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,29,3241.341,2530.454,44.68313,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,30,3242.091,2534.454,45.18313,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,31,3242.341,2536.204,46.43313,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,32,3243.091,2541.954,46.68313,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,33,3243.591,2543.954,45.93313,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,34,3244.479,2548.469,46.08762,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,35,3249.979,2550.469,46.83762,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,36,3264.479,2556.719,46.08762,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,37,3256.573,2553.215,46.64252,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,38,3253.323,2551.965,47.39252,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,39,3248.573,2550.215,46.64252,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,40,3244.241,2548.021,45.99663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,41,3243.241,2541.271,46.99663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,42,3242.241,2535.521,45.99663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,43,3241.991,2534.521,45.24663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,44,3241.491,2531.521,44.74663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,45,3240.741,2526.771,44.24663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,46,3240.486,2525.139,43.6628,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,47,3242.736,2517.639,43.1628,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,48,3245.486,2507.139,42.9128,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,49,3246.281,2504.684,42.47575,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,50,3251.781,2496.684,42.22575,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,51,3256.531,2490.184,42.47575,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,52,3256.754,2489.975,42.48543,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,53,3258.004,2487.975,42.73543,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,54,3263.328,2470.905,42.94905,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,55,3263.078,2466.905,43.44905,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,56,3262.578,2463.405,42.69905,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,57,3262.328,2459.405,41.94905,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,58,3261.875,2455.082,41.46172,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,59,3259.875,2452.832,40.71172,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,60,3257.125,2450.082,40.46172,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,61,3254.125,2446.332,39.71172,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,62,3250.938,2442.942,39.28967,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,63,3243.938,2439.192,38.53967,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,64,3234.188,2434.692,38.03967,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111808,65,3228.938,2431.942,37.53967,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,1,3350.519,2403.582,35.50837,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,2,3360.769,2400.332,36.00837,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,3,3367.78,2398.017,36.17303,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,4,3378.294,2384.818,36.24769,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,5,3398.044,2385.818,36.74769,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,6,3401.27,2386.006,37.55545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,7,3405.27,2386.756,38.05545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,8,3408.27,2387.256,38.55545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,9,3412.02,2387.756,39.30545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,10,3416.77,2388.756,39.80545,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,11,3417.136,2388.992,40.17663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,12,3419.886,2389.492,40.17663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,13,3426.386,2396.992,40.67663,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,14,3420.818,2390.56,40.29766,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,15,3419.636,2389.344,40.04559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,16,3412.886,2388.344,39.29559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,17,3409.136,2387.594,38.79559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,18,3406.136,2386.844,38.29559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,19,3403.386,2386.344,37.79559,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,20,3402.97,2386.054,37.52493,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,21,3401.22,2385.804,37.27493,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,22,3398.22,2385.554,36.77493,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,23,3395.22,2385.554,36.27493,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,24,3378.034,2384.823,35.97652,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,25,3367.357,2398.223,36.25323,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,26,3359.107,2400.723,35.75323,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,27,3350.251,2403.653,35.25343,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,28,3343.501,2404.153,34.75343,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,29,3332.751,2404.653,34.25343,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,30,3325.873,2405.162,34.01531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,31,3319.123,2400.912,33.26531,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,32,3310.615,2395.909,32.79585,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,33,3308.365,2391.409,32.54585,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,34,3304.115,2381.659,32.79585,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,35,3304.935,2383.488,32.74368,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,36,3305.935,2385.988,32.24368,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,37,3308.935,2392.488,32.74368,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,38,3310.965,2396.051,33.0463,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,39,3323.465,2403.551,33.5463,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,40,3323.661,2403.74,33.93776,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,41,3326.161,2404.99,34.18776,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,42,3335.161,2404.49,34.18776,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111816,43,3344.911,2403.99,34.93776,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,1,3602.379,2611.976,94.57047,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,2,3602.629,2610.726,94.57047,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,3,3598.879,2604.976,93.82047,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,4,3596.629,2601.726,92.82047,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,5,3593.629,2596.726,92.32047,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,6,3589.038,2589.572,91.75186,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,7,3580.788,2585.822,90.50186,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,8,3574.788,2583.322,89.75186,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,9,3566.538,2579.572,88.75186,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,10,3562.038,2577.572,88.00186,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,11,3556.92,2575.36,86.80484,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,12,3551.17,2573.36,85.80484,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,13,3548.67,2572.61,85.05484,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,14,3543.92,2571.11,84.30484,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,15,3538.463,2569.111,84.14582,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,16,3531.463,2570.861,84.64582,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,17,3525.963,2571.861,85.14582,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,18,3518.486,2573.744,85.14971,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,19,3514.236,2582.494,84.39971,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,20,3512.236,2586.994,83.89971,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,21,3510.947,2589.942,83.05109,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,22,3510.947,2593.942,82.30109,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,23,3511.447,2598.942,81.55109,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,24,3511.947,2606.692,81.05109,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,25,3511.947,2614.692,80.55109,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,26,3512.447,2620.692,79.80109,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,27,3512.958,2624.723,79.28492,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,28,3518.708,2639.223,79.78492,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,29,3520.208,2642.973,80.28492,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,30,3520.805,2644.872,80.4549,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,31,3513.019,2667.924,80.13268,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,32,3494.308,2674.993,79.82369,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,33,3491.058,2678.743,79.32369,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,34,3474.058,2697.743,78.82369,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,35,3465.737,2707.413,79.15102,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,36,3471.237,2714.163,78.40102,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,37,3472.277,2714.983,78.18565,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,38,3484.401,2714.339,78.0153,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,39,3488.151,2712.589,78.5153,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,40,3503.466,2705.25,78.67264,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,41,3505.966,2703.75,78.17264,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,42,3515.966,2697.75,78.67264,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,43,3521.966,2694,79.17264,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,44,3531.882,2682.056,79.82687,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,45,3537.382,2675.056,80.32687,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,46,3540.068,2671.723,81.25832,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,47,3540.568,2670.973,81.50832,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,48,3539.568,2666.223,81.75832,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,49,3538.318,2659.223,82.25832,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,50,3536.318,2647.723,82.75832,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,51,3535.87,2645.631,83.15933,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,52,3539.12,2641.881,83.90933,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,53,3542.37,2638.381,84.40933,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,54,3545.87,2633.631,84.90933,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,55,3549.269,2630.175,85.49417,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,56,3554.269,2630.675,86.24417,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,57,3558.269,2630.925,86.74417,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,58,3564.019,2631.425,87.99417,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,59,3570.111,2631.859,88.94177,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,60,3579.611,2634.359,89.19177,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,61,3584.361,2635.609,89.94177,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,62,3586.951,2636.362,90.40414,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,63,3590.951,2633.362,90.90414,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,64,3593.201,2631.862,91.40414,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,65,3596.701,2629.612,92.15414,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,66,3599.14,2622.29,93.01809,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,67,3601.14,2616.04,93.76809,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111807,68,3602.39,2612.04,94.51809,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,1,3588.104,2484.837,82.14239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,2,3588.104,2484.587,82.14239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,3,3587.854,2483.337,82.14239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,4,3583.604,2479.087,81.64239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,5,3583.604,2473.087,82.39239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,6,3583.604,2470.587,82.64239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,7,3584.104,2469.087,83.14239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,8,3584.604,2466.837,83.14239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,9,3584.604,2464.837,83.14239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,10,3584.604,2462.837,83.39239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,11,3587.104,2461.087,84.14239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,12,3587.854,2460.587,84.14239,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,13,3588.687,2458.941,84.85657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,14,3585.187,2454.191,84.10657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,15,3580.687,2448.441,83.60657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,16,3576.687,2443.191,82.85657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,17,3573.687,2439.191,82.60657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,18,3571.937,2436.941,81.85657,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,19,3569.815,2434.175,81.2886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,20,3567.065,2432.675,80.2886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,21,3565.565,2431.675,79.5386,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,22,3562.815,2429.925,78.7886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,23,3561.065,2428.925,78.0386,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,24,3558.565,2427.425,77.0386,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,25,3556.815,2426.425,76.2886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,26,3555.315,2425.675,75.7886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,27,3552.815,2423.925,75.0386,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,28,3551.065,2422.925,74.2886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,29,3548.565,2421.425,73.5386,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,30,3546.815,2420.425,73.0386,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,31,3544.315,2418.675,72.2886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,32,3542.565,2417.675,71.7886,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,33,3540.065,2416.175,71.0386,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,34,3538.229,2415.17,70.14407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,35,3535.229,2415.67,69.39407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,36,3532.229,2416.42,68.64407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,37,3528.479,2417.17,68.14407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,38,3525.479,2417.92,67.39407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,39,3522.479,2418.42,66.89407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,40,3518.729,2419.17,66.14407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,41,3513.979,2420.17,65.64407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,42,3509.979,2420.92,64.89407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,43,3506.229,2421.92,64.14407,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,44,3505.779,2422.211,63.90722,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,45,3503.529,2422.711,63.65722,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,46,3498.779,2431.461,63.15722,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,47,3495.029,2439.211,62.90722,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,48,3489.139,2450.096,62.32509,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,49,3477.889,2459.596,61.57509,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,50,3475.639,2461.596,60.57509,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,51,3473.389,2463.596,60.07509,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,52,3471.889,2464.846,59.32509,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,53,3470.535,2465.967,59.06942,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,54,3469.535,2468.717,58.06942,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,55,3468.285,2471.467,57.06942,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,56,3467.785,2473.217,56.56942,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,57,3466.785,2475.967,55.81942,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,58,3464.785,2480.467,55.31942,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,59,3464.231,2482.254,54.82701,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,60,3470.981,2500.754,55.57701,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,61,3473.231,2506.254,55.82701,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,62,3474.059,2508.659,56.30923,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,63,3476.559,2510.409,56.80923,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,64,3479.809,2512.409,57.80923,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,65,3482.059,2514.159,58.30923,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,66,3483.559,2515.409,59.05923,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,67,3486.059,2517.159,59.80923,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,68,3488.666,2517.55,60.81207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,69,3492.666,2517.55,62.06207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,70,3495.666,2517.55,63.06207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,71,3498.666,2517.55,63.81207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,72,3502.416,2517.55,64.81207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,73,3506.416,2517.8,66.06207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,74,3509.416,2517.8,66.81207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,75,3513.416,2517.8,67.56207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,76,3516.416,2517.8,68.31207,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,77,3519.028,2518.032,69.17903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,78,3522.278,2520.282,69.92903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,79,3524.778,2522.032,70.67903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,80,3528.028,2524.282,71.92903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,81,3529.778,2525.282,72.67903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,82,3532.778,2527.532,73.17903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,83,3536.278,2529.532,73.67903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,84,3538.778,2531.282,74.67903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,85,3542.028,2533.532,75.42903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,86,3544.528,2535.282,76.17903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,87,3546.028,2536.282,76.92903,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,88,3547.975,2537.255,77.78324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,89,3550.975,2537.505,78.53324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,90,3553.975,2537.505,79.78324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,91,3556.725,2537.755,80.28324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,92,3559.475,2537.755,81.28324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,93,3561.475,2538.005,82.03324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,94,3563.475,2538.005,82.78324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,95,3566.475,2538.005,83.53324,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,96,3566.84,2538.09,83.58455,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,97,3568.34,2538.09,84.33455,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,98,3570.84,2532.84,83.58455,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,99,3577.84,2516.59,82.58455,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,100,3579.478,2513.737,82.35915,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,101,3580.228,2510.737,82.10915,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,102,3581.978,2504.987,81.35915,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(111845,103,3587.978,2485.237,82.10915,0,0,0,0,0,0,0,0,0,0,0,0,0);
	
	-- ----------------------------------------
	-- Obsidian_Dragonshrine Area Update
	-- ----------------------------------------
	-- NPC 27360 Updates
	-- Auraa Added
	INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
	('27360','0','0','0','0','0','0','48454 51437');
	-- Remove EventAI, replaced with persistent aura 
	DELETE FROM `creature_ai_scripts` WHERE `creature_id`  = 27360;
	UPDATE `creature_template` SET `AIName` = '' WHERE `Entry` = '27360';
	
	-- ----------------------------------------
	-- Wyrmrest Revamp
	-- ----------------------------------------

	-- Golluck Rockfist movetype and waypoints. (Complete)
	UPDATE `creature` SET `position_x`=3480.384,`position_y`=343.5157,`position_z`=54.02011, `MovementType` = 2  WHERE `id`= 27804;
	DELETE FROM `creature_movement_template` WHERE `entry` = 27804;
	INSERT INTO `creature_movement_template` (`entry`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`wpguid`,`orientation`,`model1`,`model2`) VALUES
	(27804,1,3499.44,370.475,52.228,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,2,3493.32,370.484,54.8273,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,3,3484.57,357.984,54.3273,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,4,3479.82,351.734,54.5773,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,5,3479.56,351.563,54.7952,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,6,3478.31,349.813,54.5452,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,7,3480.31,343.563,54.0452,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,8,3457.23,329.409,52.0819,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,9,3459.51,333.222,55.0127,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,10,3467.51,340.222,54.2627,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,11,3478.73,350.104,54.5357,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,12,3479.98,351.604,54.7857,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,13,3484.98,358.104,54.2857,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,14,3493.98,369.354,54.5357,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(27804,15,3495.23,371.104,52.5357,0,0,0,0,0,0,0,0,0,0,0,0,0);

	-- Add Missing Wyrmrest Protector, Remove Duplicates and other updates. (Complete)
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
	(@GUID+1,27953,571,1,1,0,703,3452.12,250.673,52.2677,3.14525,25,0,0,63000,0,0,0);
	INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
	(@GUID+1,0,0,1,1,0,0,NULL);

	DELETE FROM `creature` WHERE `guid` IN (131029,131028,131030) AND 27953; -- Summoned during pvp actions
	DELETE FROM `creature_addon` WHERE `guid` IN (131029,131028,131030);

	-- Wyrmrest Defender Updates.
	UPDATE `creature_addon` SET `bytes1` = 33554432, `moveflags` = 0 WHERE `guid` IN (131095, 131098, 131102, 131104);
	DELETE FROM `creature_addon` WHERE `guid` IN (118229,118228,118227,118226,118223,118222);
	INSERT INTO `creature_addon` (`guid`,`bytes1`,`b2_0_sheath`,`moveflags`)VALUES
	(118229, 33554432, 1, 0),
	(118228, 33554432, 1, 0),
	(118227, 33554432, 1, 0),
	(118226, 33554432, 1, 0),
	(118223, 33554432, 1, 0),
	(118222, 33554432, 1, 0);

	-- Wyrmrest Guardian Updates.
	UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE `guid` IN (131034,131031,131032,131033) AND id = 26933;
	
	-- Wyrmrest Temple Drake Updates.
	UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE `guid` IN (100085,100086,100087,130996,130995,130989,130997,130991,130987,130990,130998,130988);

	-- Quest:12372 Condition updates	
	INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (@CONDITION+1, 9, 12372);
	UPDATE `gossip_menu` SET `condition_id` = @CONDITION+1 WHERE `entry` = 9568 AND `text_id` = 12899;
	UPDATE `gossip_menu_option` set `condition_id` = @CONDITION+1 WHERE `menu_id` = 9568 and `id` = 0;
	
	-- ----------------------------------------
	-- Misc. Updates
	-- ----------------------------------------
	
	-- Arctic Cloud Move Type
	UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE id = 24879;   
    

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

