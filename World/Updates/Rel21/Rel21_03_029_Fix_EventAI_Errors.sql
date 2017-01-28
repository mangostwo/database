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
    SET @cOldStructure = '03'; 
    SET @cOldContent = '028';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '029';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix_EventAI_Errors';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix_EventAI_Errors';

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

    -- TARGET_T_SELF
UPDATE `creature_ai_scripts` SET `action1_param2`=0 WHERE `action1_type` = 11 AND `action1_param1` IN
(
   45,   122,   865,  2676,  3237,  3264,  3391,  4320,  4938,  5113,  5403,  5568,  6266,  6268,  6306,  6524,
 6598,  6982,  7891,  8078,  8147,  8260,  8269,  8281, 11831, 11968, 11969, 11975, 12169, 12470, 12737, 12741,
12745, 12748, 12946, 13586, 13704, 13730, 13736, 13880, 14100, 14907, 15038, 15063, 15244, 15502, 15531, 15548,
15588, 15728, 15971, 16244, 16567, 16838, 17207, 17321, 17475, 17478, 19129, 20603, 20712, 20786, 20817, 21007,
21048, 21071, 21790, 21833, 22884, 22938, 23600, 24018, 24997, 25056, 26025, 26038, 26661, 27382, 28405, 29325,
29363, 29488, 29489, 29685, 29788, 29905, 29915, 29982, 30043, 30155, 30790, 31015, 31270, 31298, 31475, 31730,
32023, 32062, 32429, 32722, 32859, 32914, 33325, 33447, 33500, 33623, 33860, 34013, 34019, 34355, 34880, 35198,
35204, 35235, 35236, 35922, 36205, 36275, 36406, 36513, 36519, 36631, 36725, 37106, 37317, 37367, 37985, 38356,
38361, 38384, 38533, 38540, 38575, 38618, 40542, 40578, 40722, 40773, 40938, 41097, 41266, 41380, 42359, 42495,
42496, 43128, 43506, 44538, 44599, 46046, 46551, 47379, 47784, 48193, 48655, 49398, 49701, 49749, 49807, 50416,
50642, 50655, 51074, 51612, 52058, 52535, 53496, 54313, 54317, 54360, 54678, 54709, 54714, 54781, 54919, 54959,
54978, 55040, 55512, 55847, 55975, 56837, 57322, 57468, 59014, 59015, 59033, 59358, 59466, 60290, 61964, 62317,
63420, 65099, 67546, 70363, 70633, 71251
);

UPDATE `creature_ai_scripts` SET `action2_param2`=0 WHERE `action2_type` = 11 AND `action2_param1` IN (17476, 17479);
UPDATE `creature_ai_scripts` SET `action3_param2`=0 WHERE `action3_type` = 11 AND `action3_param1` IN (17477, 17480);


-- TARGET_T_HOSTILE
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `action1_type` = 11 AND `action1_param1` IN
(
20477, 20690, 21063, 22951, 24340, 25471, 26134, 29546,
29768, 31249, 31347, 31715, 31916, 34261, 34437, 34439,
34441, 34852, 35280, 36622, 36866, 37122, 37135, 37965,
38626, 39429, 40419, 41276, 43593, 43650, 46239, 46453,
46480, 46543, 46560, 46561, 46562, 47698, 50843, 51503,
51842, 52383, 52527, 52696, 52721, 52722, 52772, 54087,
54226, 54361, 54396, 55209, 55320, 55582, 55881, 58693,
58810, 58823, 58845, 58849, 58850, 59040, 59085, 59369,
59374, 59485, 59742, 59743, 60236, 60588, 61112, 64213,
64215, 64374, 64666, 64759, 64903, 64970, 65541, 66283,
66682, 69131, 69483, 70408, 71103, 71237, 71298, 71350,
71490, 72336, 72426, 72865
);
UPDATE `creature_ai_scripts` SET `action2_param2`=0 WHERE `action2_type` = 11 AND `action2_param1` = 52708;


-- TARGET_T_INVOKER_OWNER
UPDATE `creature_ai_scripts` SET `action1_param2`=7 WHERE `action1_type` = 11 AND `action1_param2` = 6 AND `action1_param1` IN
(10251, 41071, 43572, 45101, 48047, 61314, 66717);

UPDATE `creature_ai_scripts` SET `action2_param2`=7 WHERE `action2_type` = 11 AND `action2_param2` = 6 AND `action2_param1` IN
(47173, 49323);
    

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

