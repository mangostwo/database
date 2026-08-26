-- -------------------------------------------------------------------------
-- Add the exact Asian Wrath 3.3.5a.12340 Warden check profiles.
-- Existing profiles and operator-added rows remain untouched.
-- Stop mangosd and deploy this update with the matching server revision;
-- strict module/profile coverage rejects either half deployed on its own.
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
    SET @cOldStructure = '09';
    SET @cOldContent = '001';

    SET @cNewVersion = '22';
    SET @cNewStructure = '09';
    SET @cNewContent = '002';
    SET @cNewDescription = 'Warden_Asian_Profiles';
    SET @cNewComment = 'Add exact Wrath 3.3.5a.12340 Asian Warden check profiles';

    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version` = @cOldVersion AND `structure` = @cOldStructure AND `content` = @cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version` = @cNewVersion AND `structure` = @cNewStructure AND `content` = @cNewContent);

    IF (@cCurResult = @cOldResult) THEN
        START TRANSACTION;

        IF EXISTS (
            SELECT 1 FROM `warden_checks`
            WHERE `build` = 12340 AND `platform` = 0x57696E
              AND `locale` IN (0x6B6F4B52,0x7A68434E,0x7A685457)
        ) THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Existing 12340/Win Asian Warden rows conflict; back up and reconcile them, then re-run';
        END IF;

        INSERT INTO `warden_checks`
        (`build`,`platform`,`locale`,`check_id`,`type`,`enabled`,`sort_order`,
         `evidence_class`,`module`,`address`,`length`,`request`,`expected`,`comment`)
        VALUES
        (12340,0x57696E,0x6B6F4B52,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x6B6F4B52,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x39BCDE7E67F7DA4A366D15007DBAF3D438338E00,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x6B6F4B52,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0xED9995EC9DB8,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x6B6F4B52,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant'),

        (12340,0x57696E,0x7A68434E,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x7A68434E,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x53538853E7026786EB30FCB247D7E8179A3CAAF8,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x7A68434E,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0xE7A1AEE5AE9A,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x7A68434E,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant'),

        (12340,0x57696E,0x7A685457,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x7A685457,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0xED14F2C71688B1DE9660F9CE04A62D63A9EB297A,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x7A685457,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0xE7A2BAE5AE9A,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x7A685457,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant');

        IF (SELECT COUNT(*) FROM `warden_checks`
            WHERE `build` = 12340 AND `platform` = 0x57696E
              AND `locale` IN (0x6B6F4B52,0x7A68434E,0x7A685457)) <> 12
           OR (SELECT COUNT(*) FROM `warden_checks`
               WHERE `build` = 12340 AND `platform` = 0x57696E
                 AND `locale` IN (0x6B6F4B52,0x7A68434E,0x7A685457)
                 AND `enabled` = 1) <> 12
           OR (SELECT COUNT(DISTINCT `build`,`platform`,`locale`)
               FROM `warden_checks`
               WHERE `build` = 12340 AND `platform` = 0x57696E
                 AND `locale` IN (0x6B6F4B52,0x7A68434E,0x7A685457)) <> 3
           OR EXISTS (
               SELECT 1 FROM `warden_checks`
               WHERE `build` = 12340 AND `platform` = 0x57696E
                 AND `locale` IN (0x6B6F4B52,0x7A68434E,0x7A685457)
               GROUP BY `build`,`platform`,`locale`
               HAVING COUNT(*) <> 4 OR SUM(`enabled` = 1) <> 4
           ) THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Warden Asian profile validation failed';
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
