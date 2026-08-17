-- -------------------------------------------------------------------------
-- Create the dormant exact typed Warden catalogue for the later server port.
-- This transition intentionally publishes no checks, addresses, modules,
-- request bytes, expected bytes, or other seed data.
-- -------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SHOW ERRORS;
        SELECT '* UPDATE FAILED *' AS `===== Status =====`,
               @cCurResult AS `===== DB is on Version: =====`;
        RESIGNAL;
    END;

    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);

    SET @cOldVersion = '22';
    SET @cOldStructure = '07';
    SET @cOldContent = '001';

    SET @cNewVersion = '22';
    SET @cNewStructure = '07';
    SET @cNewContent = '002';
    SET @cNewDescription = 'Warden_Checks';
    SET @cNewComment = 'Create empty typed Warden catalogue for future core';

    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version` = @cOldVersion AND `structure` = @cOldStructure AND `content` = @cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version` = @cNewVersion AND `structure` = @cNewStructure AND `content` = @cNewContent);

    IF (@cCurResult = @cOldResult) THEN
        START TRANSACTION;

        -- At 22/07/001 this name is unowned. Removing it makes a failed
        -- non-transactional DDL attempt safely re-runnable.
        DROP TABLE IF EXISTS `warden_checks`;
        CREATE TABLE `warden_checks` (
          `build` SMALLINT UNSIGNED NOT NULL,
          `platform` VARBINARY(4) NOT NULL,
          `locale` BINARY(4) NOT NULL,
          `check_id` INT UNSIGNED NOT NULL,
          `type` TINYINT UNSIGNED NOT NULL,
          `enabled` TINYINT UNSIGNED NOT NULL,
          `sort_order` SMALLINT UNSIGNED NOT NULL,
          `evidence_class` TINYINT UNSIGNED NOT NULL,
          `module` VARBINARY(255) NOT NULL DEFAULT '',
          `address` INT UNSIGNED NOT NULL DEFAULT 0,
          `length` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
          `request` VARBINARY(255) NOT NULL DEFAULT '',
          `expected` VARBINARY(255) NOT NULL DEFAULT '',
          `comment` VARCHAR(255) NOT NULL DEFAULT '',
          PRIMARY KEY (`build`,`platform`,`locale`,`check_id`),
          UNIQUE KEY `uq_warden_checks_profile_order`
            (`build`,`platform`,`locale`,`sort_order`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC
          COMMENT='Exact typed Warden check catalogue';

        IF (SELECT COUNT(*) FROM `warden_checks`) <> 0 THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Dormant Warden catalogue must be empty';
        END IF;

        INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure,
            @cNewContent, @cNewDescription, @cNewComment);
        SET @cNewResult := (SELECT `description` FROM `db_version`
            WHERE `version` = @cNewVersion AND `structure` = @cNewStructure
              AND `content` = @cNewContent);
        COMMIT;
        SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,
               @cNewResult AS `===== DB is now on Version =====`;
    ELSE
        IF (@cCurResult = @cNewResult) THEN
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,
                   @cCurResult AS `===== DB is already on Version =====`;
        ELSE
            IF (@cCurResult IS NULL) THEN
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,
                       'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure,
                    '_', @cCurContent, ' - ', @cCurResult);
                SET @cOldOutput = CONCAT(@cOldVersion, '_', @cOldStructure,
                    '_', @cOldContent, ' - ',
                    COALESCE(@cOldResult, 'IS NOT APPLIED'));
                SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,
                       @cOldOutput AS `=== Expected ===`,
                       @cCurOutput AS `===== Found Version =====`;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

CALL update_mangos();

DROP PROCEDURE IF EXISTS `update_mangos`;
