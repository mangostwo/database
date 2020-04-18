-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
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
    SET @cOldStructure = '11'; 
    SET @cOldContent = '045';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '046';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Scarlet Highlord Daion';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Scarlet Highlord Daion';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

    
SET @guid := (SELECT MAX(`guid`) FROM `creature`);

DELETE FROM `creature` WHERE `id` = 32417;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@guid+1,32417,571,1,65535,0,0,4105.49,-1132.07,134.27,0.953492,28800,0,0,14910,0,0,2),
(@guid+2,32417,571,1,65535,0,0,4577.47,-602.83,155.108,3.43925,28800,0,0,14910,0,0,2),
(@guid+3,32417,571,1,65535,0,0,4739.51,-373.885,187.437,2.81958,28800,0,0,14910,0,0,2),
(@guid+4,32417,571,1,65535,0,0,4616.39,-411.872,155.531,2.32242,28800,0,0,14910,0,0,2);


INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`wpguid`,`orientation`,`model1`,`model2`) VALUES
(@guid+1,1,3997.09,-1283.14,136.982,0,0,0,0,0,0,0,0,0,0,0.953464,0,0),
(@guid+1,2,4020.28,-1250.47,131.442,0,0,0,0,0,0,0,0,0,0,0.949537,0,0),
(@guid+1,3,4021.01,-1231.56,136.003,0,0,0,0,0,0,0,0,0,0,1.5111,0,0),
(@guid+1,4,4020.04,-1250.57,131.459,0,0,0,0,0,0,0,0,0,0,0.951892,0,0),
(@guid+2,1,4577.47,-602.83,155.108,0,0,0,0,0,0,0,0,0,0,3.43925,0,0),
(@guid+2,2,4568.08,-604.967,152.349,0,0,0,0,0,0,0,0,0,0,3.32929,0,0),
(@guid+3,1,4739.51,-373.885,187.437,0,0,0,0,0,0,0,0,0,0,2.81958,0,0),
(@guid+3,2,4729.8,-370.771,184.867,0,0,0,0,0,0,0,0,0,0,2.83136,0,0),
(@guid+4,1,4613.16,-432.467,156.013,0,0,0,0,0,0,0,0,0,0,4.5616,0,0),
(@guid+4,2,4627.74,-449.956,163.899,0,0,0,0,0,0,0,0,0,0,5.57319,0,0),
(@guid+4,3,4640.85,-461.507,170.042,0,0,0,0,0,0,0,0,0,0,0.0298476,0,0),
(@guid+4,4,4655.49,-461.247,170.172,0,0,0,0,0,0,0,0,0,0,6.09783,0,0),
(@guid+4,5,4672.78,-464.883,175.859,0,0,0,0,0,0,0,0,0,0,6.17559,0,0),
(@guid+4,6,4681.1,-448.077,177.311,0,0,0,0,0,0,0,0,0,0,0.913421,0,0),
(@guid+4,7,4671.54,-434.709,172.881,0,0,0,0,0,0,0,0,0,0,2.2753,0,0),
(@guid+4,8,4662.46,-424.498,173.696,0,0,0,0,0,0,0,0,0,0,2.19284,0,0),
(@guid+4,9,4632.43,-407.759,162.884,0,0,0,0,0,0,0,0,0,0,2.57297,0,0),
(@guid+4,10,4616.39,-411.872,155.531,0,0,0,0,0,0,0,0,0,0,2.32242,0,0);

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
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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


