-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
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
    SET @cOldStructure = '2'; 
    SET @cOldContent = '12'; 

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '2';
    SET @cNewContent = '3';
 
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

/*
remove unnecessary action food bar icon
*/

DELETE FROM `playercreateinfo_action` WHERE `race` = '10' AND `class` = '9' AND `button` = '11' AND `action` = '20857' AND `type` = '128'; 
DELETE FROM `playercreateinfo_action` WHERE `race` = '10' AND `class` = '8' AND `button` = '11' AND `action` = '20857' AND `type` = '128'; 
DELETE FROM `playercreateinfo_action` WHERE `race` = '10' AND `class` = '5' AND `button` = '11' AND `action` = '20857' AND `type` = '128';
DELETE FROM `playercreateinfo_action` WHERE `race` = '10' AND `class` = '4' AND `button` = '11' AND `action` = '20857' AND `type` = '128'; 
DELETE FROM `playercreateinfo_action` WHERE `race` = '10' AND `class` = '2' AND `button` = '11' AND `action` = '20857' AND `type` = '128'; 
DELETE FROM `playercreateinfo_action` WHERE `race` = '10' AND `class` = '3' AND `button` = '11' AND `action` = '20857' AND `type` = '128'; 
DELETE FROM `playercreateinfo_action` WHERE `race` = '8' AND `class` = '3' AND `button` = '11' AND `action` = '4604' AND `type` = '128'; 
DELETE FROM `playercreateinfo_action` WHERE `race` = '7' AND `class` = '6' AND `button` = '83' AND `action` = '41751' AND `type` = '128'; 
DELETE FROM `playercreateinfo_action` WHERE `race` = '6' AND `class` = '7' AND `button` = '11' AND `action` = '4604' AND `type` = '128';
DELETE FROM `playercreateinfo_action` WHERE `race` = '5' AND `class` = '4' AND `button` = '11' AND `action` = '4604' AND `type` = '128';
DELETE FROM `playercreateinfo_action` WHERE `race` = '5' AND `class` = '1' AND `button` = '83' AND `action` = '4604' AND `type` = '128'; 
DELETE FROM `playercreateinfo_action` WHERE `race` = '1' AND `class` = '9' AND `button` = '11' AND `action` = '4604' AND `type` = '128'; 


/*
Add food icon to deathknight action bar
*/

Update `playercreateinfo_action` set `button` = '10' where `race` = '1' and `class` = '6' and `button` = '11'
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES('1','6','11','41751','128');
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES('2','6','11','41751','128');
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES('3','6','11','41751','128');
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES('4','6','11','41751','128');
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES('5','6','11','41751','128');
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES('6','6','11','41751','128');
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES('8','6','11','41751','128');
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES('10','6','11','41751','128');


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
                SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurResult AS `===== Found Version =====`;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;