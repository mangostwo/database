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
    SET @cOldStructure = '10'; 
    SET @cOldContent = '011';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '012';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'npc_text_definition_update';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'npc_text_definition_update';

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


ALTER TABLE npc_text CHANGE COLUMN em0_0 em0_0_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em0_1 em0_0 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em0_2 em0_1_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em0_3 em0_1 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em0_4 em0_2_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em0_5 em0_2 SMALLINT(5);

ALTER TABLE npc_text CHANGE COLUMN em1_0 em1_0_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em1_1 em1_0 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em1_2 em1_1_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em1_3 em1_1 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em1_4 em1_2_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em1_5 em1_2 SMALLINT(5);

ALTER TABLE npc_text CHANGE COLUMN em2_0 em2_0_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em2_1 em2_0 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em2_2 em2_1_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em2_3 em2_1 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em2_4 em2_2_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em2_5 em2_2 SMALLINT(5);

ALTER TABLE npc_text CHANGE COLUMN em3_0 em3_0_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em3_1 em3_0 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em3_2 em3_1_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em3_3 em3_1 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em3_4 em3_2_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em3_5 em3_2 SMALLINT(5);

ALTER TABLE npc_text CHANGE COLUMN em4_0 em4_0_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em4_1 em4_0 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em4_2 em4_1_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em4_3 em4_1 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em4_4 em4_2_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em4_5 em4_2 SMALLINT(5);

ALTER TABLE npc_text CHANGE COLUMN em5_0 em5_0_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em5_1 em5_0 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em5_2 em5_1_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em5_3 em5_1 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em5_4 em5_2_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em5_5 em5_2 SMALLINT(5);

ALTER TABLE npc_text CHANGE COLUMN em6_0 em6_0_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em6_1 em6_0 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em6_2 em6_1_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em6_3 em6_1 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em6_4 em6_2_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em6_5 em6_2 SMALLINT(5);

ALTER TABLE npc_text CHANGE COLUMN em7_0 em7_0_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em7_1 em7_0 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em7_2 em7_1_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em7_3 em7_1 SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em7_4 em7_2_delay SMALLINT(5);
ALTER TABLE npc_text CHANGE COLUMN em7_5 em7_2 SMALLINT(5);



    

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

