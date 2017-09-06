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
    SET @cOldContent = '047';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '048';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q_9531_Trees_Company_Rework';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q_9531_Trees_Company_Rework';

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
-- q.9531 'Tree's Company'
DELETE FROM db_scripts WHERE id = 10675;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(8,10675,0,10,17318,103000,0,0,0,0,0,0,0,-5114.89,-11259.6,2.77615,0.38,'Summon Geezle'),
(8,10675,0,10,17243,100000,0,0,0,0,0,0,0,-5047.26,-11258.7,6.20032,2.9,'Summon Engineer \"Spark\" Overgrind'),
(8,10675,1,29,1,2,17243,200,0,0,0,0,0,0,0,0,0,'remove npc_flag'),
(8,10675,20,0,2,0,17243,50,0,2000000297,0,0,0,0,0,0,0,'ext_emote Spark'),
(8,10675,21,0,0,0,17318,50,0,2000000298,0,0,0,0,0,0,0,'Geezle say 1'),
(8,10675,23,1,1,0,17243,50,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(8,10675,26,1,5,0,17243,50,0,0,0,0,0,0,0,0,0,'emote OneShotExclamation'),
(8,10675,26,0,0,0,17243,50,0,2000000299,0,0,0,0,0,0,0,'Spark say 1'),
(8,10675,28,1,1,0,17243,50,0,0,0,0,0,0,0,0,0,'mote OneShotTalk'),
(8,10675,33,0,0,0,17243,50,0,2000000300,0,0,0,0,0,0,0,'Spark say 2'),
(8,10675,44,0,0,0,17318,50,0,2000000301,0,0,0,0,0,0,0,'Geezle say 2'),
(8,10675,44,1,1,0,17318,50,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(8,10675,50,1,1,0,17243,50,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(8,10675,50,0,0,0,17243,50,0,2000000302,0,0,0,0,0,0,0,'Spark say 3'),
(8,10675,53,1,5,0,17243,50,0,0,0,0,0,0,0,0,0,'emote OneShotExclamation'),
(8,10675,57,0,0,0,17243,50,0,2000000303,0,0,0,0,0,0,0,'Spark say 4'),
(8,10675,57,1,1,0,17243,50,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(8,10675,60,1,25,0,17243,50,0,0,0,0,0,0,0,0,0,'emote OneShotPoint'),
(8,10675,65,1,1,0,17318,50,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(8,10675,65,0,0,0,17318,50,0,2000000304,0,0,0,0,0,0,0,'Geezle say 2'),
(8,10675,65,8,17243,1,0,0,0,0,0,0,0,0,0,0,0,'Kill Credit for quest 9531');
UPDATE db_script_string SET emote = 1 WHERE entry = 2000000298;
-- Waypoints
-- Engineer "Spark" Overgrind <Envoy of Mekkatorque>
DELETE FROM creature_movement_template WHERE entry = 17243;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17243,1,-5063.43,-11256.4,0.9326,0,0,0,0,0),
(17243,2,-5078.62,-11254.6,0.5082,0,0,0,0,0),
(17243,3,-5081.81,-11253.7,0.5838,60000,0,3.02,0,0),
(17243,4,-5067.27,-11258.7,0.425389,0,0,0,0,0),
(17243,5,-5050.55,-11268.8,1.18535,0,0,0,0,0),
(17243,6,-5044.35,-11278.7,1.16579,0,0,0,0,0),
(17243,7,-5041.94,-11281.5,1.53572,0,0,0,0,0),
(17243,8,-5037.33,-11286.1,4.64659,0,0,0,0,0),
(17243,9,-5032.17,-11291,7.69082,0,0,0,0,0),
(17243,10,-5027.42,-11295.7,8.34487,0,0,0,0,0);
-- Geezle
DELETE FROM creature_movement_template WHERE entry = 17318;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17318,1,-5093.29,-11254.7,0.24,0,0,0,0,0),
(17318,2,-5091.67,-11253.8,0.51914,65000,0,0,0,0),
(17318,3,-5113.8,-11249.5,0.339795,0,0,0,0,0),
(17318,4,-5120.88,-11249.4,0.553696,0,0,0,0,0),
(17318,5,-5128.1,-11246.4,1.73112,0,0,0,0,0),
(17318,6,-5135.22,-11248.1,5.23099,0,0,0,0,0),
(17318,7,-5142.75,-11247.3,3.98971,0,0,0,0,0),
(17318,8,-5148.59,-11247.3,5.40811,1000,1,0,0,0);  
    

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

