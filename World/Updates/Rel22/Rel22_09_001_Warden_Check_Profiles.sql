-- -------------------------------------------------------------------------
-- Seed the exact Wrath 3.3.5a.12340 Warden check profiles.
-- The typed schema was created by Rel22_08_001; this update changes data only.
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
    SET @cOldStructure = '08';
    SET @cOldContent = '001';

    SET @cNewVersion = '22';
    SET @cNewStructure = '09';
    SET @cNewContent = '001';
    SET @cNewDescription = 'Warden_Check_Profiles';
    SET @cNewComment = 'Seed exact Wrath 3.3.5a.12340 Warden check profiles';

    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version` = @cOldVersion AND `structure` = @cOldStructure AND `content` = @cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version` = @cNewVersion AND `structure` = @cNewStructure AND `content` = @cNewContent);

    IF (@cCurResult = @cOldResult) THEN
        START TRANSACTION;

        -- Replace only this exact build/platform seed. Unrelated operator or
        -- future-profile rows remain untouched and outside the validation
        -- scope below.
        DELETE FROM `warden_checks`
        WHERE `build` = 12340 AND `platform` = 0x57696E;

        INSERT INTO `warden_checks`
        (`build`,`platform`,`locale`,`check_id`,`type`,`enabled`,`sort_order`,
         `evidence_class`,`module`,`address`,`length`,`request`,`expected`,`comment`)
        VALUES
        (12340,0x57696E,0x656E5553,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x656E5553,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x8C7CED99F8DDDD48296551EFE05A2CF27B26F818,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x656E5553,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x4F6B6179,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x656E5553,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant'),

        (12340,0x57696E,0x656E4742,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x656E4742,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x8C7CED99F8DDDD48296551EFE05A2CF27B26F818,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x656E4742,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x4F6B6179,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x656E4742,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant'),

        (12340,0x57696E,0x64654445,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x64654445,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x0B4D01BDEB4F47DE030B57D81506093EB887EE0B,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x64654445,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x4F4B,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x64654445,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant'),

        (12340,0x57696E,0x65734553,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x65734553,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x20EC8371EC168B4723AF6DE3AFE81D46843726F4,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x65734553,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x41636570746172,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x65734553,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant'),

        (12340,0x57696E,0x65734D58,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x65734D58,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x0E39F4AF09E3CF08925D41E61FBAC8EE16478FC9,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x65734D58,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x41636570746172,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x65734D58,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant'),

        (12340,0x57696E,0x66724652,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x66724652,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0xE6F5A0C5C63056F63097420AE29B47ACA2E4D496,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x66724652,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x4F4B,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x66724652,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant'),

        (12340,0x57696E,0x72755255,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (12340,0x57696E,0x72755255,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x329BF203079002D36E05EBF54BD5746AA37E47C8,
         'Effective AreaTable baseline; corroboration only'),
        (12340,0x57696E,0x72755255,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0xD09ED09A,'Localized OKAY callback; corroboration only'),
        (12340,0x57696E,0x72755255,3,243,1,40,1,X'',
         0x007DA8C0,40,X'',
         0xB9601AD300E8769DF9FFE851FBFFFF688C29AF0068D816AF00B8B3120000E82DFDFFFFA3441AD300,
         'Exact 12340 Warden bootstrap invariant');

        IF (SELECT COUNT(*) FROM `warden_checks`
            WHERE `build` = 12340 AND `platform` = 0x57696E) <> 28
           OR (SELECT COUNT(*) FROM `warden_checks`
               WHERE `build` = 12340 AND `platform` = 0x57696E
                 AND `enabled` = 1) <> 28
           OR (SELECT COUNT(DISTINCT `build`,`platform`,`locale`)
               FROM `warden_checks`
               WHERE `build` = 12340 AND `platform` = 0x57696E) <> 7
           OR EXISTS (
               SELECT 1 FROM `warden_checks`
               WHERE `build` = 12340 AND `platform` = 0x57696E
               GROUP BY `build`,`platform`,`locale`
               HAVING COUNT(*) <> 4 OR SUM(`enabled` = 1) <> 4
           ) THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Warden check profile validation failed';
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
