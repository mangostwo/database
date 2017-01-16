-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos` ()

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
    SET @cOldContent = '0'; 

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '2';
    SET @cNewContent = '1';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'fix_some_startup_errors';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'server - fix some SD3 related startup errors.';

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

-- missing record added back
DELETE FROM script_binding WHERE TYPE=0 AND bind=8856;
INSERT INTO script_binding VALUES (0,'npc_tyrion_spybot',8856,0);

DELETE FROM script_binding WHERE TYPE=0 AND bind=7766;
INSERT INTO script_binding VALUES (0,'npc_tyrion',7766,0);

DELETE FROM script_binding WHERE TYPE=0 AND bind=12129;
INSERT INTO script_binding VALUES (0,'npc_onyxian_warder',12129,0);

DELETE FROM script_binding WHERE TYPE=0 AND bind=20159;
INSERT INTO script_binding VALUES (0,'npc_magister_aledis',20159,0);

DELETE FROM script_binding WHERE TYPE=0 AND bind IN (22208,22212,22213);
INSERT INTO script_binding VALUES (0,'npc_prof_tailor',22208,0);
INSERT INTO script_binding VALUES (0,'npc_prof_tailor',22212,0);
INSERT INTO script_binding VALUES (0,'npc_prof_tailor',22213,0);

DELETE FROM script_binding WHERE TYPE=0 AND bind=19554;
INSERT INTO script_binding (type, ScriptName, bind, data) VALUES (0, 'npc_dimensius', 19554, 0);

DELETE FROM db_script_string WHERE entry = 2000000011;
INSERT INTO db_script_string VALUES(2000000011,'This beast leads the Riverpaw gnoll gang and may be the key to ending gnoll aggression in Elwynn.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,25,'General Marcus Jonathan - First Say to Hogger');
 
DELETE FROM db_script_string WHERE entry = 2000000012;
INSERT INTO db_script_string VALUES(2000000012,'We\'re taking him into custody in the name of King Varian Wrynn.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'General Marcus Jonathan - Second Say to Hogger');

DELETE FROM db_script_string WHERE entry = 2000000013;
INSERT INTO db_script_string VALUES(2000000013,'Nooooo...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Hogger - Second Say to General Marcus');
 
 
DELETE FROM `db_script_string` WHERE entry = 2000000404;
DELETE FROM `db_script_string` WHERE entry = 2000000405;
DELETE FROM `db_script_string` WHERE entry = 2000000406;


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