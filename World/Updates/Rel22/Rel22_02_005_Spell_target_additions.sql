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
    SET @cOldContent = '004';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '02';
    SET @cNewContent = '005';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Spell target additions';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Spell target additions';

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

	DELETE FROM `spell_script_target` WHERE `entry` IN (10805,10834,10835,10836,16074,22966,23018,23024,29705,30662,32760,32929,32929,34332,70225,70227,
	36089,36090,36196,36197,36198,36220,36795,36811,37913,37954,37964,37970,72851,72852,72852,72401,
	39552,39985,40222,40382,40503,40523,40675,40761,40821,41457,41962,42079,72745,72850,72850,72851,
	42168,42868,42868,43066,43078,43078,43525,43546,43768,44411,44608,44608,44608,44608,44608,44608,
	44608,44608,44608,44608,44608,44608,44611,45581,45581,45595,45602,45608,45774,45877,45979,45993,
	46174,46219,46319,46477,48610,48773,49129,50592,55853,56263,56264,56265,56711,59464,61071,61072,
	61073,61074,61075,61210,61245,63947,70079,70194,70224);

	INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES
	(10805,1,7668,0),(10834,1,7669,0),(10835,1,7670,0),(10836,1,7671,0),
	(16074,1,10263,0),(22966,2,29542,0),(23018,1,14449,0),(23024,1,14449,0),
	(29705,1,17066,0),(30662,1,18778,0),(32760,1,18560,0),(32929,0,36727,0),
	(32929,0,179944,0),(34332,1,19617,0),(36089,1,19622,0),(36090,1,19622,0),
	(36196,1,19622,0),(36197,1,19622,0),(36198,1,19622,0),(36220,1,18731,0),
	(36795,1,21394,0),(36811,1,21413,0),(37913,1,21930,0),(37954,1,21942,0),
	(37964,1,21939,0),(37970,1,21944,0),(39552,1,22820,0),(39985,1,23055,0),
	(40222,1,23116,0),(40382,1,23113,0),(40503,1,23055,0),(40523,1,23220,0),
	(40675,1,23278,0),(40761,1,22917,0),(40821,1,23310,0),(41457,1,23445,0),
	(41962,1,23113,0),(42079,1,23537,0),(42168,1,23575,6),(42868,0,186560,1),
	(42868,1,15218,2),(43066,1,23883,0),(43078,1,23957,0),(43078,1,23972,0),
	(43525,1,23746,0),(43546,1,24336,0),(43768,1,24418,5),(44411,1,24781,0),
	(44608,0,186953,5),(44608,0,186960,5),(44608,0,186961,5),(44608,0,186962,5),
	(44608,0,186963,5),(44608,0,186964,5),(44608,1,24826,3),(44608,1,24827,3),
	(44608,1,24828,3),(44608,1,24829,3),(44608,1,24831,3),(44608,1,24832,3),
	(44611,1,24825,5),(45581,1,25425,0),(45581,1,25458,0),(45595,1,25424,0),
	(45602,1,25460,2),(45608,1,23837,0),(45774,1,25596,0),(45877,1,25596,0),
	(45979,1,25771,0),(45993,1,25765,0),(46174,1,25848,0),(46219,1,25592,0),
	(46319,1,25953,0),(46477,1,26093,0),(48610,1,27354,0),(48773,1,27446,0),
	(49129,1,27622,0),(50592,1,28061,0),(55853,1,30090,0),(56263,1,30090,0),
	(56264,1,30090,0),(56265,1,30090,0),(56711,1,30413,0),(59464,1,31653,0),
	(61071,1,30090,0),(61072,1,30090,0),(61073,1,30090,0),(61074,1,30090,0),
	(61075,1,30090,0),(61210,1,30234,0),(61245,1,32535,0),(63947,1,33228,0),
	(70079,1,36678,0),(70194,1,36954,0),(70224,1,37014,0),(70225,1,37014,0),
	(70227,1,36934,0),(72401,1,37672,0),(72745,1,36678,0),(72850,1,38308,5),
	(72850,1,38309,6),(72851,1,38308,5),(72851,1,38309,6),(72852,1,38308,5),
	(72852,1,38309,6);


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


