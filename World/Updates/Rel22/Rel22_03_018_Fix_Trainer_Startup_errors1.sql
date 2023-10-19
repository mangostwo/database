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
    SET @cOldStructure = '03'; 
    SET @cOldContent = '017';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '03';
    SET @cNewContent = '018';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix_Trainer_Startup_errors1';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix_Trainer_Startup_errors1: Table `npc_trainer` (Entry: xxx) has redundant reqlevel y (=spell level) for spell';

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

UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=514 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=812 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=908 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1103 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1215 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1218 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1241 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1317 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1346 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1355 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1382 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1386 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1430 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1458 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1470 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1473 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=1699 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2114 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2132 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2390 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2391 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2399 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2627 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2836 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2837 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2856 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=2998 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3004 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3009 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3011 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3013 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3026 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3067 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3087 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3136 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3174 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3184 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3185 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3345 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3347 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3355 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3363 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3399 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3404 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3478 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3484 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3523 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3557 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3603 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3604 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3606 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3704 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3964 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=3965 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4159 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4160 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4193 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4204 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4210 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4213 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4258 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4552 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4576 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4596 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4611 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4614 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4616 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4898 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=4900 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5032 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5038 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5041 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5137 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5153 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5157 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5159 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5177 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5482 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5499 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5502 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5511 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5566 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=5695 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=6286 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=6299 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=7948 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=7949 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=8146 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=8306 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=11052 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=11072 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=11073 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=11074 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=11557 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=12025 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=15400 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16000 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16160 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16161 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16190 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16253 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16265 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16277 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16366 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16367 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16583 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16588 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16633 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16640 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16642 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16644 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16669 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16676 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16719 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16723 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16724 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16725 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16729 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16736 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=16823 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=17215 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=17245 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=17246 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=17434 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=17487 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=17983 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18748 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18749 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18753 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18772 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18773 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18776 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18802 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18987 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18988 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=18993 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=19052 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=19185 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=19251 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=19252 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=19341 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=19369 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=19540 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26564 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26904 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26905 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26910 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26914 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26952 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26953 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26958 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26964 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26969 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26972 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26974 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26981 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26988 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26989 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=26994 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=27001 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=27023 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=27029 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=27034 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=28694 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=28699 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=28704 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=28705 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=29631 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=29924 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33580 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33587 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33591 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33608 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33609 AND `spell`=2021;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33610 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33613 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33616 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33619 AND `spell`=3412;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33630 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33633 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33636 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33639 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33674 AND `spell`=2280;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33676 AND `spell`=7415;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33678 AND `spell`=2373;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33684 AND `spell`=3912;
UPDATE `npc_trainer` SET reqlevel=0 WHERE `entry`=33996 AND `spell`=2373;

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


