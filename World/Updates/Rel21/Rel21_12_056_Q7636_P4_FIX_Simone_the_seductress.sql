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
    SET @cOldContent = '055';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '12';
    SET @cNewContent = '056';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Simone_the_seductress';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Q7636_P4_FIX_Simone_the_seductress';

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

		-- Assign the scripts to the NPCs
		
		DELETE FROM`script_binding` WHERE `bind` IN (14527, 14533, 14528 /* Friendly pet , not requiring script, so delete if exists */, 14538) AND `type` = 0;
		INSERT INTO `script_binding` (`type`, `ScriptName`, `bind`, `data`) VALUES (0, 'npc_simone_the_inconspicuous', 14527, 0);
		INSERT INTO `script_binding` (`type`, `ScriptName`, `bind`, `data`) VALUES (0, 'npc_simone_the_seductress', 14533, 0);
		INSERT INTO `script_binding` (`type`, `ScriptName`, `bind`, `data`) VALUES (0, 'npc_precious_the_devourer', 14538, 0);

		
		-- Gossip Menus for npc_simone_the_inconspicuous
		DELETE FROM `gossip_menu` WHERE  `entry` = 5868;
		INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (5868, 7041, 0, 0);
		
		UPDATE `creature_template` SET `GossipMenuId` = 5868, `MovementType` = 2 WHERE `Entry` = 14527;
		UPDATE `creature` SET `orientation` = 4.8044, `spawntimesecs`= 10800,  `MovementType` = 2 WHERE id = 14527;

		
		-- Waypoint DB scripts
		
		DELETE FROm `db_scripts` WHERE `id` IN (1011, 1069,1006); -- Ids grabbed from CMangos Classic DB
		
		SET @script_guid := (SELECT MAX(`script_guid`) FROM `db_scripts`);
		
		INSERT INTO `db_scripts` (`script_guid`, `id`, `script_type`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) 
		VALUES 
		(@script_guid +1, 1006, 3 /* Creature Movement  */,  0, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'GENERIC EMOTE - ONESHOT_QUESTION'),
		(@script_guid +2, 1011, 3 /* Creature Movement  */,  0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'GENERIC EMOTE - ONESHOT_LAUGH'),
		(@script_guid +3, 1069, 3 /* Creature Movement  */,  0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'GENERIC EMOTE - STATE_USESTANDING');
			
		-- unused "Precious"
		DELETE FROM `creature` WHERE (`guid` = 24440 and `id` = 14528 );
		
		-- Waypoints
		DELETE FROM `creature_movement_template` WHERE entry=14527;
		INSERT INTO creature_movement_template (entry,  point, position_x, position_y, position_z, orientation, waittime, script_id) VALUES		
		(14527,1,-6979.98,-743.922,-265.829,4.26,0,0),
		(14527,2,-6986.33,-765.548,-268.629,100,0,0),
		(14527,3,-7007.75,-786.31,-273.191,100,0,0),
		(14527,4,-7039.73,-799.7,-270.899,100,0,0),
		(14527,5,-7065.82,-819.616,-270.97,100,0,0),
		(14527,6,-7082.96,-845.941,-272.221,100,0,0),
		(14527,7,-7110.47,-848.818,-272.221,100,0,0),
		(14527,8,-7122.33,-848.446,-272.222,100,0,0),
		(14527,9,-7157.42,-844.413,-270.273,100,0,0),
		(14527,10,-7189.71,-825.359,-266.686,100,0,0),
		(14527,11,-7190.87,-822.46,-266.511,100,0,0),
		(14527,12,-7214,-834.257,-269.773,100,0,0),
		(14527,13,-7229.78,-846.956,-270.665,100,0,0),
		(14527,14,-7233.79,-880.804,-271.939,100,0,0),
		(14527,15,-7278.58,-915.386,-270.422,100,0,0),
		(14527,16,-7321.04,-902.681,-271.296,100,0,0),
		(14527,17,-7352.49,-886.729,-270.25,100,0,0),
		(14527,18,-7386.06,-878.481,-269.358,100,0,0),
		(14527,19,-7447.88,-874.992,-264.068,100,0,0),
		(14527,20,-7495.22,-882.61,-271.447,100,0,0),
		(14527,21,-7557.14,-892.074,-272.703,100,0,0),
		(14527,22,-7574.26,-900.852,-271.85,100,0,0),
		(14527,23,-7578.46,-899.827,-272.033,100,5000,1011),
		(14527,24,-7607.88,-928.535,-268.21,100,0,0),
		(14527,25,-7658.18,-916.766,-269.852,100,0,0),
		(14527,26,-7684.99,-934.012,-271.072,100,0,0),
		(14527,27,-7719.79,-958.694,-272.064,100,0,0),
		(14527,28,-7771.85,-978.788,-271.637,100,0,0),
		(14527,29,-7786.36,-1007.86,-267.052,100,7000,1006),
		(14527,30,-7795.43,-1009.01,-266.123,100,0,0),
		(14527,31,-7818.7,-1027.62,-266.675,100,0,0),
		(14527,32,-7862.13,-1037.34,-269.089,100,0,0),
		(14527,33,-7887.01,-1021.86,-271.34,100,0,0),
		(14527,34,-7900.55,-1002.84,-272.512,100,0,0),
		(14527,35,-7903.28,-978.558,-274.716,100,0,0),
		(14527,36,-7910.02,-968.588,-276.354,100,0,0),
		(14527,37,-7925.37,-964.484,-276.319,100,0,0),
		(14527,38,-7934.6,-969.985,-275.442,100,8000,1006),
		(14527,39,-7939.15,-954.032,-275.842,100,0,0),
		(14527,40,-7950.27,-947.564,-275.907,100,0,0),
		(14527,41,-7958.42,-935.452,-276.212,100,0,0),
		(14527,42,-7983.1,-932.55,-273.851,100,0,0),
		(14527,43,-7997.47,-928.34,-273.793,100,0,0),
		(14527,44,-8019.04,-938.782,-272.221,100,0,0),
		(14527,45,-8028.85,-971.488,-271.261,100,0,0),
		(14527,46,-8030.84,-1000.45,-271.374,100,0,0),
		(14527,47,-8036,-1038.62,-271.474,100,0,0),
		(14527,48,-8042.39,-1068.95,-272.222,100,0,0),
		(14527,49,-8054.66,-1100.93,-271.825,100,0,0),
		(14527,50,-8053.4,-1102.23,-271.742,100,12000,1006),
		(14527,51,-8062.54,-1119.16,-271.041,100,0,0),
		(14527,52,-8045.9,-1162.09,-270.919,100,0,0),
		(14527,53,-8025.98,-1203.3,-272.089,100,0,0),
		(14527,54,-8020.59,-1243.58,-272.022,100,0,0),
		(14527,55,-8010.59,-1257.98,-272.215,100,0,0),
		(14527,56,-8010.37,-1289.65,-272.194,100,0,0),
		(14527,57,-8004.81,-1296.62,-271.812,100,8000,1006),
		(14527,58,-8004.67,-1330.88,-274.854,100,0,0),
		(14527,59,-8001.3,-1353.77,-271.815,100,0,0),
		(14527,60,-8006.69,-1384.51,-271.731,100,0,0),
		(14527,61,-8010.4,-1415.69,-272.138,100,0,0),
		(14527,62,-8001.1,-1444.21,-272.197,100,0,0),
		(14527,63,-7982.11,-1450.95,-275.396,100,0,0),
		(14527,64,-7968.19,-1465.38,-274.291,100,0,0),
		(14527,65,-7952.96,-1481.01,-271.309,100,8000,1069),
		(14527,66,-7939.55,-1462.1,-272.295,100,0,0),
		(14527,67,-7900.54,-1457.18,-271.355,100,0,0),
		(14527,68,-7879.01,-1441.78,-267.834,100,0,0),
		(14527,69,-7856.08,-1437.3,-266.742,100,15000,1011),
		(14527,70,-7822.61,-1423.62,-268.806,100,0,0),
		(14527,71,-7771.97,-1428.48,-271.985,100,0,0),
		(14527,72,-7738.38,-1425.5,-271.847,100,5000,1006),
		(14527,73,-7737.92,-1419.43,-271.609,100,0,0),
		(14527,74,-7704.95,-1406.04,-270.244,100,6000,0),
		(14527,75,-7707.36,-1398.38,-269.911,100,6000,0),
		(14527,76,-7705.71,-1389.98,-269.97,100,4000,1011),
		(14527,77,-7696.06,-1366.52,-269.499,100,0,0),
		(14527,78,-7675.64,-1361.28,-271.427,100,0,0),
		(14527,79,-7653.26,-1351.91,-272.222,100,0,0),
		(14527,80,-7640.88,-1341.16,-272.222,100,0,0),
		(14527,81,-7640.4,-1333.62,-272.222,100,0,0),
		(14527,82,-7663.03,-1293.4,-270.412,100,0,0),
		(14527,83,-7660.47,-1270.11,-269.424,100,0,0),
		(14527,84,-7651.97,-1239.61,-269.038,100,0,0),
		(14527,85,-7636.57,-1206.09,-267.996,100,0,0),
		(14527,86,-7603.82,-1173.9,-271.104,100,0,0),
		(14527,87,-7594.2,-1151.33,-271.111,100,7000,1006),
		(14527,88,-7584.89,-1142.8,-264.716,100,0,0),
		(14527,89,-7578.08,-1134.77,-264.79,100,0,0),
		(14527,90,-7563.87,-1131.51,-270.459,100,0,0),
		(14527,91,-7537.21,-1119.75,-270.122,100,0,0),
		(14527,92,-7526.06,-1089.67,-271.461,100,0,0),
		(14527,93,-7520.48,-1071.18,-272.03,100,0,0),
		(14527,94,-7515.26,-1040.03,-272.135,100,0,0),
		(14527,95,-7508.13,-1017.25,-271.755,100,0,0),
		(14527,96,-7509.51,-996.527,-271.088,100,0,0),
		(14527,97,-7517.28,-985.543,-271.281,100,5000,1011),
		(14527,98,-7500.99,-970.028,-270.763,100,0,0),
		(14527,99,-7481.16,-959.979,-272.249,100,0,0),
		(14527,100,-7454.07,-939.171,-272.191,100,0,0),
		(14527,101,-7412.9,-931.682,-270.811,100,0,0),
		(14527,102,-7379.93,-936.533,-272.222,100,0,0),
		(14527,103,-7345.7,-956.728,-270.933,100,0,0),
		(14527,104,-7333.99,-948.52,-268.371,100,0,0),
		(14527,105,-7310.43,-939.388,-271.833,100,0,0),
		(14527,106,-7267.4,-938.557,-271.836,100,0,0),
		(14527,107,-7231,-930.002,-271.768,100,0,0),
		(14527,108,-7184.62,-927.292,-270.622,100,0,0),
		(14527,109,-7150.14,-913.485,-272.026,100,0,0),
		(14527,110,-7128.62,-907.253,-271.708,100,0,0),
		(14527,111,-7113.75,-895.768,-271.054,100,0,0),
		(14527,112,-7072.44,-882.383,-272.209,100,0,0),
		(14527,113,-7046.12,-866.439,-270.495,100,0,0),
		(14527,114,-7009.87,-869.691,-267.973,100,0,0),
		(14527,115,-7002.11,-873.768,-266.38,100,4000,1006),
		(14527,116,-6990.21,-869.015,-265.479,100,0,0),
		(14527,117,-6970.35,-839.906,-271.317,100,0,0),
		(14527,118,-6946.48,-800.995,-271.897,100,0,0),
		(14527,119,-6914.38,-775.288,-271.879,100,0,0),
		(14527,120,-6896.42,-732.742,-270.995,100,0,0),
		(14527,121,-6893.06,-697.02,-271.743,100,5000,1006),
		(14527,122,-6904.2,-683.851,-271.607,100,0,0),
		(14527,123,-6927.61,-675.444,-269.826,100,0,0),
		(14527,124,-6963.37,-669.245,-269.595,100,0,0),
		(14527,125,-7011.83,-644.824,-272.222,100,0,0),
		(14527,126,-7039,-622.924,-271.75,100,0,0),
		(14527,127,-7074.14,-634.741,-268.952,100,14000,1011),
		(14527,128,-7075.28,-660.686,-269.652,100,0,0),
		(14527,129,-7051.23,-692.587,-269.161,100,0,0),
		(14527,130,-7052.55,-696.954,-268.68,100,3000,0),
		(14527,131,-7034.4,-695.438,-268.825,100,0,0),
		(14527,132,-7021.16,-705.646,-267.155,100,0,0),
		(14527,133,-7015.6,-706.177,-267.265,100,0,0),
		(14527,134,-6989.83,-719.188,-267.184,100,0,0);	
		
		-- Re create deleted waypoints for NPC 14536 Nelson the nice (error in previous script)

		DELETE FROM `creature_movement_template` WHERE entry=14536;
		INSERT INTO creature_movement_template (entry,  point, position_x, position_y, position_z, orientation, waittime, script_id) VALUES
		(14536, 1, -7723.94, 1672.61, 6.99932, 4.782, 0, 0),
		(14536, 2, -7723.53, 1666.73, 7.2381, 4.782, 0, 0),
		(14536, 3, -7723.16, 1661.32, 7.4734, 4.782, 0, 0),
		(14536, 4, -7722.62, 1653.71, 7.75759, 4.782, 0, 0),
		(14536, 5, -7722.81, 1647.13, 7.91095, 4.684, 0, 0),
		(14536, 6, -7723.02, 1639.51, 7.89681, 4.684, 0, 0),
		(14536, 7, -7723.35, 1627.47, 7.38225, 4.684, 0, 0),
		(14536, 8, -7723.53, 1620.89, 6.83515, 4.684, 0, 0),
		(14536, 9, -7723.83, 1609.98, 5.41355, 4.684, 0, 0),
		(14536, 10, -7723.35, 1602.29, 3.85762, 4.775, 0, 0),
		(14536, 11, -7722.86, 1594.68, 1.79496, 4.775, 0, 0),
		(14536, 12, -7723.88, 1582.68, 0.34014, 4.628, 0, 0),
		(14536, 13, -7724.21, 1572.82, -0.056111, 4.678, 0, 0),
		(14536, 14, -7723.73, 1565.2, 0.44632, 4.775, 0, 0),
		(14536, 15, -7722.96, 1553.19, -0.093045, 4.775, 0, 0),
		(14536, 16, -7726.78, 1546.58, -0.909012, 4.188, 0, 0),
		(14536, 17, -7733.28, 1546.13, 0.007443, 3.211, 0, 0),
		(14536, 18, -7740.79, 1544.56, 1.08576, 3.264, 0, 0),
		(14536, 19, -7749.48, 1543.48, 1.58189, 3.264, 0, 0),
		(14536, 20, -7760.25, 1542.15, 0.900917, 3.362, 0, 0),
		(14536, 21, -7767.76, 1540.47, 0.76182, 3.362, 0, 0),
		(14536, 22, -7773.09, 1539.27, 0.90416, 3.362, 0, 0),
		(14536, 23, -7785.86, 1536.41, 1.30292, 3.362, 0, 0),
		(14536, 24, -7795.42, 1534.26, 1.48728, 3.362, 0, 0),
		(14536, 25, -7803.96, 1532.35, 1.31336, 3.362, 0, 0),
		(14536, 26, -7813.59, 1530.19, 0.882178, 3.362, 0, 0),
		(14536, 27, -7821.23, 1529.25, 0.492903, 3.264, 0, 0),
		(14536, 28, -7831.03, 1528.03, 0.171037, 3.264, 0, 0),
		(14536, 29, -7838.6, 1527.1, 0.147077, 3.264, 0, 0),
		(14536, 30, -7849.44, 1525.76, 0.011675, 3.264, 0, 0),
		(14536, 31, -7854.86, 1525.09, -0.299024, 3.264, 0, 0),
		(14536, 32, -7854.86, 1525.09, -0.299024, 2.331, 0, 0),
		(14536, 33, -7864.65, 1535.38, -2.00175, 2.331, 0, 0),
		(14536, 34, -7870.69, 1541.71, -2.63201, 2.331, 0, 0),
		(14536, 35, -7877.49, 1548.86, -1.72241, 2.331, 0, 0),
		(14536, 36, -7889.51, 1561.49, -1.73218, 2.331, 0, 0),
		(14536, 37, -7896.32, 1568.63, 0.39502, 2.331, 0, 0),
		(14536, 38, -7896.32, 1568.63, 0.39502, 2.331, 0, 0),
		(14536, 39, -7902.35, 1574.97, 1.27937, 2.331, 0, 0),
		(14536, 40, -7912.87, 1586.02, 0.354109, 2.331, 0, 0),
		(14536, 41, -7918.91, 1592.36, -2.88522, 2.331, 0, 0),
		(14536, 42, -7924.94, 1598.7, -4.35761, 2.331, 0, 0),
		(14536, 43, -7929.48, 1603.46, -3.07459, 2.331, 0, 0),
		(14536, 44, -7937.54, 1609.16, -2.27474, 2.526, 0, 0),
		(14536, 45, -7944.16, 1614.88, -2.34859, 2.429, 0, 0),
		(14536, 46, -7951.63, 1621.33, -2.20943, 2.429, 0, 0),
		(14536, 47, -7959.1, 1627.78, -0.426467, 2.429, 0, 0),
		(14536, 48, -7962.35, 1630.59, -0.42542, 2.429, 0, 0),
		(14536, 49, -7976.38, 1642.72, 3.58954, 2.429, 0, 0),
		(14536, 50, -7983.99, 1643.29, 6.34064, 3.066, 0, 0),
		(14536, 51, -7989.44, 1643.7, 8.30937, 3.066, 0, 0),
		(14536, 52, -7997.12, 1644.27, 11.0857, 3.066, 0, 0),
		(14536, 53, -8010.24, 1645.26, 16.577, 3.066, 0, 0),
		(14536, 54, -8009.91, 1649.65, 16.4068, 1.495, 0, 0),
		(14536, 55, -8009.18, 1659.43, 15.3411, 1.495, 0, 0),
		(14536, 56, -8008.04, 1674.64, 10.7737, 1.495, 0, 0),
		(14536, 57, -8007.83, 1688.84, 7.07297, 1.593, 0, 0),
		(14536, 58, -8007.98, 1695.42, 5.53078, 1.593, 0, 0),
		(14536, 59, -8002.69, 1703.75, 3.03121, 1.005, 0, 0),
		(14536, 60, -7994.75, 1718.06, 1.28656, 1.103, 0, 0),
		(14536, 61, -7990.34, 1726.81, 0.271978, 1.103, 0, 0),
		(14536, 62, -7984.91, 1737.55, -1.67144, 1.103, 0, 0),
		(14536, 63, -7979.99, 1747.3, -3.34872, 1.103, 0, 0),
		(14536, 64, -7976.55, 1754.11, -3.64768, 1.103, 0, 0),
		(14536, 65, -7971.6, 1763.92, -1.33611, 1.103, 0, 0),
		(14536, 66, -7968.63, 1769.8, -0.638402, 1.103, 0, 0),
		(14536, 67, -7959.18, 1772.39, 0.043781, 0.267, 0, 0),
		(14536, 68, -7949.66, 1775, 0.854808, 0.267, 0, 0),
		(14536, 69, -7942.3, 1777.02, 1.30295, 0.267, 0, 0),
		(14536, 70, -7934.12, 1780.12, 1.34465, 0.361, 0, 0),
		(14536, 71, -7923.91, 1783.98, 1.97957, 0.361, 0, 0),
		(14536, 72, -7916.77, 1786.68, 2.64666, 0.361, 0, 0),
		(14536, 73, -7916.77, 1786.68, 2.64666, 0.361, 0, 0),
		(14536, 74, -7908.65, 1789.76, 2.82543, 0.361, 0, 0),
		(14536, 75, -7888.53, 1792.4, 1.20374, 6.205, 0, 0),
		(14536, 76, -7880.85, 1791.8, 0.239228, 6.205, 0, 0),
		(14536, 77, -7871.01, 1791.04, 1.0017, 6.205, 0, 0),
		(14536, 78, -7861.17, 1790.27, 1.85499, 6.205, 0, 0),
		(14536, 79, -7855.73, 1789.84, 2.02605, 6.205, 0, 0),
		(14536, 80, -7850.52, 1781.54, 0.762147, 5.272, 0, 0),
		(14536, 81, -7850.52, 1781.54, 0.762147, 5.272, 0, 0),
		(14536, 82, -7843.54, 1770.39, -0.002306, 5.272, 0, 0),
		(14536, 83, -7830.85, 1757.25, 0.513463, 5.664, 0, 0),
		(14536, 84, -7830.85, 1757.25, 0.513463, 5.664, 0, 0),
		(14536, 85, -7821.04, 1750.27, 1.60067, 5.664, 0, 0),
		(14536, 86, -7808.36, 1740.08, 3.85629, 5.517, 0, 0),
		(14536, 87, -7808.36, 1740.08, 3.85629, 5.517, 0, 0),
		(14536, 88, -7799.73, 1731.78, 4.13775, 5.517, 0, 0),
		(14536, 89, -7781.99, 1717.37, 2.64011, 5.712, 0, 0),
		(14536, 90, -7774.6, 1710.94, 1.70334, 5.567, 0, 0),
		(14536, 91, -7767.15, 1704.46, 1.0991, 5.567, 0, 0),
		(14536, 92, -7761.39, 1699.46, 1.62084, 5.567, 0, 0),
		(14536, 93, -7755.59, 1694.41, 2.40594, 5.567, 0, 0),
		(14536, 94, -7748.09, 1687.89, 4.62263, 5.567, 0, 0),
		(14536, 95, -7743.12, 1683.57, 5.96238, 5.567, 0, 0),
		(14536, 96, -7737.06, 1681.2, 7.02291, 5.909, 0, 0),
		(14536, 97, -7727.87, 1677.6, 7.20446, 5.909, 0, 0);
		
	
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


