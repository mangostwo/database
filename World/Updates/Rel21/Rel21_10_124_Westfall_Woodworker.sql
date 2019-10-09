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
    SET @cOldStructure = '10'; 
    SET @cOldContent = '123';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '124';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Westfall Woodworker';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Westfall Woodworker';

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

-- Sentinell Hill - Westfall
-- Westfall Woodworker
DELETE FROM `creature_addon` WHERE `guid` IN (44303,45472,45521,89860);
INSERT INTO `creature_addon` (`guid`,`mount`,`bytes1`,`b2_0_sheath`,`b2_1_pvp_state`,`emote`,`moveflags`,`auras`) VALUES 
(44303,0,0,1,16,0,0,NULL),
(45472,0,0,1,16,0,0,NULL),
(45521,0,0,1,16,0,0,NULL),
(89860,0,0,1,16,0,0,NULL);
UPDATE `creature` SET `spawndist` = 0,`MovementType` = 2 WHERE `guid` IN (44303,45472,45521,89860);
DELETE FROM `creature_movement` WHERE `id` IN (44303,45472,45521,89860);
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`orientation`,`model1`,`model2`) VALUES
-- 44303
(44303,1,-10662.1,1130.83,34.1967,15000,0,2.513274,0,0),
(44303,2,-10662.1,1130.83,34.1967,90000,667001,2.513274,0,0),
(44303,3,-10661.3,1113.16,34.1967,90000,667001,4.153883,0,0),
-- 45472
(45472,1,-10650.8,1128.61,34.1978,90000,667001,4.433136,0,0),
(45472,2,-10650.8,1128.61,34.1978,10000,0,4.433136,0,0),
(45472,3,-10658.8,1134.62,34.1967,90000,667001,2.494732,0,0),
-- 45521
(45521,1,-10650.1,1115.028,35.6110,6000,667002,2.786707,0,0),
(45521,2,-10646.4,1113.332,35.6268,90000,667001,0.8901179,0,0),
-- 89860
(89860,1,-10656.2,1126.87,34.1967,90000,667001,5.56733,0,0),
(89860,2,-10667.4,1121.39,34.1967,90000,667001,3.57242,0,0);
DELETE FROM `db_scripts` WHERE `id` BETWEEN 667001 AND 667002;
INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(3,667001,3,1,69,0,0,0,0,0,0,0,0,0,0,0,0,'Westfall Woodworker emote ON'),
(3,667001,87,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'Westfall Woodworker emote OFF'),
(3,667002,3,1,16,0,0,0,0,0,0,0,0,0,0,0,0,'Westfall Woodworker emote ON');

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok,commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;
        ELSE
            COMMIT;
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion,@cNewStructure,@cNewContent,@cNewDescription,@cNewComment);
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
                    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC,STRUCTURE DESC,CONTENT DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC,STRUCTURE DESC,CONTENT DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC,STRUCTURE DESC,CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion,'_',@cCurStructure,'_',@cCurContent,' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion,'_',@cOldStructure,'_',@cOldContent,' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC,STRUCTURE DESC,CONTENT DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC,STRUCTURE DESC,CONTENT DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC,STRUCTURE DESC,CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion,'_',@cCurStructure,'_',@cCurContent,' - ',@cCurResult);
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


