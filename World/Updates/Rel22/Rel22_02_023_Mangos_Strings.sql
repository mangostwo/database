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
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '02'; 
    SET @cOldContent = '022';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '02';
    SET @cNewContent = '023';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Mangos_Strings';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Mangos_Strings';

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

INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `source_file`, `source_enum_wrapper`, `source_enum_tag`) VALUES 
(1510,'Ticket %u from %s has been closed by <GM>%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKETCLOSED_NAME'),
(1511,'Ticket system is globally on, accepting all tickets',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKETS_SYSTEM_ON'),
(1512,'Ticket system is globally off, not accepting tickets at all',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKETS_SYSTEM_OFF'),
(1513,'You cant close a ticket for offline players',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKET_CANT_CLOSE'),
(1514,'ID %u from %s (%s),
\n\n\n\n changed %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKET_BRIEF_INFO'),
(1515,'= Shown %u tickets out of total %u from online players.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKET_COUNT_ONLINE'),
(1516,'ID %u from GUID %u (%s),
\n\n\n\n changed %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKET_OFFLINE_INFO'),
(1517,'= Shown %u tickets of total %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKET_COUNT_ALL'),
(1518,'Informing you about arriving tickets is %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKET_ACCEPT_STATE'),
(1519,'Response to your ticket',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKET_RESPOND_MAIL_SUBJECT'),
(1520,'$B$BBest regards, $B$B<GM>%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKET_RESPOND_MAIL_SIGNATURE'),
(1521,'Your ticket has been closed.@@It has been serviced by <GM>%s, please check your ingame mailbox to see the answer.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_TICKETCLOSED_PLAYER_NOTIF'),
(1522,'> %d Equiped items deleted for %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_ITEMS_EQUIPED'),
(1523,'> %d items in equiped bags deleted for %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_ITEMS_BAGS'),
(1524,'> %d items in bank deleted for %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_ITEMS_BANK'),
(1525,'> %d keys in keyring deleted for %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_ITEMS_KEYRING'),
(1526,'> %d items in vendors buyback deleted for %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_ITEMS_BUYBACK'),
(1527,'> All items were reset for %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_ITEMS_ALL'),
(1528,'> All items were reset (even bags : %d equiped & %d in bank) for %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_ITEMS_ALLBAGS'),
(1529,'> %d COD mails deleted for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_MAIL_COD'),
(1530,'> %d GM mails deleted for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_MAIL_GM'),
(1531,'> %d mails from %s deleted for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_MAIL_FROM'),
(1532,'GM %s has deleted %d mails from your mailbox.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_MAIL_PLAYER_NOTIF'),
(1533,'> Total : %d mails deleted for %s (including normal mails).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Language.h','MangosStrings','LANG_COMMAND_RESET_MAIL_RECAP');

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


