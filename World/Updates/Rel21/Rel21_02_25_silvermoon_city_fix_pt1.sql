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
    SET @cOldContent = '24';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '02';
    SET @cNewContent = '25';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'silvermoon_city_fix_pt1';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'silvermoon_city_fix_pt1';

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
Movetype and spawn location updates
*/
UPDATE `creature` SET `MovementType` = '2' WHERE `guid` = '56902'; -- Silvermoon City Guardian
UPDATE `creature` SET `MovementType` = '2' WHERE `guid` = '56891'; -- Silvermoon City Guardian
UPDATE `creature` SET `position_x` = '9811.86' , `position_y` = '-7364.81' , `position_z` = '20.7075' , `orientation` = '6.2163' , `MovementType` = '2' WHERE `guid` = '56892'; -- Silvermoon City Guardian

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
Silvermoon City Guardian waypoints
*/
DELETE FROM `creature_movement` WHERE `id` IN (56891,56902,56892);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(56891,1,9696.27,-7434.55,13.2929,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,2,9728.06,-7418.81,13.2971,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,3,9765.02,-7418.46,13.386,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,4,9768.24,-7396.07,14.3985,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,5,9794.73,-7398.39,14.0292,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,6,9796.7,-7419.15,13.5349,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,7,9795,-7398.36,14.0276,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,8,9768.38,-7396.2,14.3972,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,9,9765.17,-7418.69,13.3858,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,10,9728.2,-7419.04,13.2972,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,11,9696.49,-7434.78,13.2941,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,12,9669.69,-7434.71,13.2941,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,13,9648.21,-7424,13.2944,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,14,9609.32,-7423.97,13.3055,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,15,9594.59,-7438.4,13.5403,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,16,9563.6,-7433,15.485,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,17,9559.92,-7419.48,19.4766,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,18,9564.52,-7415.13,19.4733,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,19,9564.63,-7395.79,16.8493,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,20,9509.55,-7396.44,14.3164,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,21,9510.09,-7278.2,14.0159,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,22,9676.11,-7275,14.0205,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,23,9677,-7295.35,14.9536,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,24,9700.08,-7297.85,14.0159,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,25,9699.44,-7310.33,14.9663,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,26,9676.62,-7310.86,13.9353,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,27,9675.42,-7355.96,11.9354,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,28,9668.44,-7357.02,11.9337,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,29,9669.41,-7365.14,11.9337,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,30,9689.78,-7378.97,11.9303,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,31,9689.29,-7384.69,11.7304,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,32,9683,-7385.15,11.6003,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,33,9682.13,-7424.26,13.6828,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,34,9683.45,-7384.79,11.5995,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,35,9690.55,-7383.63,11.7885,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,36,9689.41,-7377.6,11.9295,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,37,9668.92,-7364.53,11.9322,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,38,9668.64,-7356.96,11.9345,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,39,9675.28,-7355.91,11.9348,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,40,9676.73,-7310.94,13.9343,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,41,9699.87,-7309.69,14.946,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,42,9700.23,-7298.12,14.9411,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,43,9677.13,-7295.64,13.9238,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,44,9676.25,-7275.09,14.0246,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,45,9510.4,-7278.49,14.0152,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,46,9509.91,-7396.66,14.3166,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,47,9564.48,-7396.95,16.8497,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,48,9564.78,-7415.39,19.4727,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,49,9559.53,-7418.46,19.4753,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,50,9564.08,-7433.34,15.4854,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,51,9595.48,-7437,13.5467,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,52,9609.84,-7423.26,13.3061,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,53,9648.52,-7424.24,13.2951,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56891,54,9670.38,-7434.2,13.2936,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,1,9835.01,-7362.92,18.5951,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,2,9851.14,-7371.95,18.6057,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,3,9866.03,-7362.48,18.5954,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,4,9889.31,-7365.17,20.7072,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,5,9885.44,-7410.55,13.2643,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,6,9864.11,-7421.49,13.2937,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,7,9797.43,-7420.25,13.5147,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,8,9794.04,-7441.96,14.4214,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,9,9789.97,-7442.41,14.7075,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,10,9775.37,-7443,14.7075,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,11,9766.83,-7442.93,14.4027,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,12,9764.85,-7419.58,13.3663,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,13,9715.94,-7422.08,13.2938,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,14,9695.17,-7436.09,13.2938,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,15,9671.41,-7435.67,13.2938,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,16,9649.67,-7425.78,13.2939,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,17,9605.77,-7424.2,13.3049,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,18,9594.92,-7406.99,13.3054,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,19,9594.94,-7387.56,13.5157,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,20,9617.99,-7385.81,14.4207,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,21,9617.69,-7378.61,14.7054,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,22,9618.92,-7368.56,14.4156,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,23,9618.99,-7373.63,14.7056,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,24,9617.62,-7384.32,14.4106,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,25,9594.87,-7387.81,13.5189,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,26,9595.5,-7407.22,13.3036,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,27,9606.09,-7424.55,13.304,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,28,9651.91,-7425.97,13.2934,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,29,9672.82,-7434.86,13.2934,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,30,9695.54,-7436.38,13.2934,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,31,9716.56,-7421.35,13.2934,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,32,9765.31,-7419.91,13.3584,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,33,9766.79,-7442.28,14.4147,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,34,9793.86,-7441.83,14.4202,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,35,9796.95,-7420.11,13.5095,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,36,9864.38,-7421.89,13.2942,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,37,9885.44,-7410.63,13.2652,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,38,9889.43,-7365.41,20.7076,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,39,9866.31,-7362.74,18.5957,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,40,9850.99,-7372.13,18.6073,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,41,9835.36,-7363.14,18.5956,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56892,42,9811.34,-7365.04,20.7077,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,1,9564.77,-7395.83,16.8496,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,3,9563.76,-7417.21,19.4742,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,4,9558.66,-7418.02,19.4752,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,5,9563.42,-7434.6,15.4871,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,6,9564.52,-7463.65,15.5187,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,7,9588.64,-7464.53,13.5203,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,8,9603.93,-7429.66,13.3051,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,9,9596.34,-7402.67,13.3051,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,10,9594.07,-7387.14,13.4816,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,11,9572.96,-7384.6,14.4149,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,12,9572.86,-7368.98,14.4133,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,13,9595.81,-7366.64,13.5024,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,14,9594.57,-7335.22,14.1468,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,15,9576.29,-7325.19,14.1517,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,16,9519.39,-7327.24,14.1195,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,17,9507.53,-7351.93,14.3353,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,18,9505.98,-7394.55,14.3236,0,0,0,0,0,0,0,0,0,0,100,0,0),
(56902,19,9533.29,-7396.24,16.8377,0,0,0,0,0,0,0,0,0,0,100,0,0);

    

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

