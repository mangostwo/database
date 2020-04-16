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
    SET @cOldContent = '042';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '043';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Griegen spawn';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Griegen spawn';

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

SET @GUID := (SELECT MAX(`guid`) FROM `creature`);
SET @Entry := (SELECT MAX(`entry`) FROM `pool_template`);

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(@GUID+1,32471,571,1,65535,0,0,5115.49,-1652.65,234.728,2.96739,28800,0,0,15952,0,0,2),
(@GUID+2,32471,571,1,65535,0,0,5326.75,-1479.26,238.009,3.02158,28800,0,0,15952,0,0,2),
(@GUID+3,32471,571,1,65535,0,0,5596.75,-1742.88,239.19,0.406713,28800,0,0,15952,0,0,2),
(@GUID+4,32471,571,1,65535,0,0,5314.94,-1939.21,238.942,0.458038,28800,0,0,15952,0,0,2),
(@GUID+5,32471,571,1,65535,0,0,5791.11,-1302.72,234.538,4.79067,28800,10,0,15952,0,0,1),
(@GUID+6,32471,571,1,65535,0,0,5327.54,-1702.84,238.882,4.63875,28800,10,0,15952,0,0,1),
(@GUID+7,32471,571,1,65535,0,0,5133.37,-1853.51,245.385,4.72044,28800,10,0,15952,0,0,1);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID+1,1,5115.49,-1652.65,234.728,0,0,0,0,0,0,0,0,0,0,2.96739,0,0),
(@GUID+1,2,5029.32,-1639.57,238.034,0,0,0,0,0,0,0,0,0,0,2.99095,0,0),
(@GUID+1,3,4989.28,-1650.4,241.732,0,0,0,0,0,0,0,0,0,0,3.44077,0,0),
(@GUID+1,4,5030.04,-1639.55,238.061,0,0,0,0,0,0,0,0,0,0,0.214356,0,0),
(@GUID+2,1,5326.75,-1479.26,238.009,0,0,0,0,0,0,0,0,0,0,3.02158,0,0),
(@GUID+2,2,5282.97,-1484.2,240.346,0,0,0,0,0,0,0,0,0,0,0.150948,0,0),
(@GUID+3,1,5596.75,-1742.88,239.19,0,0,0,0,0,0,0,0,0,0,0.406713,0,0),
(@GUID+3,2,5615.37,-1719.32,238.544,0,0,0,0,0,0,0,0,0,0,0.87324,0,0),
(@GUID+4,1,5314.94,-1939.21,238.942,0,0,0,0,0,0,0,0,0,0,0.564067,0,0),
(@GUID+4,2,5311.97,-1914.15,241.658,0,0,0,0,0,0,0,0,0,0,4.98586,0,0);

INSERT INTO `pool_template` VALUES
(@Entry+1,1,'RARE Griegen (32471)');
DELETE FROM `pool_creature_template` WHERE `id` = 32471;
INSERT INTO `pool_creature_template` VALUES
(32471,@Entry+1,0,'RARE Griegen - 32471');

-- Update Dirkee pool entry to description.
UPDATE `pool_creature_template` SET `description` = 'RARE Dirkee - 32500' WHERE `id` = 32500;
UPDATE `pool_template` SET `description` = 'RARE Dirkee (32500)' WHERE `description` LIKE 'Dirkee';    

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


