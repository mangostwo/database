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
    SET @cOldStructure = '06'; 
    SET @cOldContent = '063';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '064';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Update_Missing_GO_Desc';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Update_Missing_GameObject_and_Item_Desc';

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


-- Update M2 from M0
UPDATE creature_template SET subname='The Den Mother' WHERE entry=534;
UPDATE creature_template SET subname='Grik\'nir\'s Servant' WHERE entry=946;
UPDATE creature_template SET subname='Gunsmith' WHERE entry=1073;
UPDATE creature_template SET subname='Innkeeper' WHERE entry=1156;
UPDATE creature_template SET subname='PH MODEL WIP' WHERE entry=2694;
UPDATE creature_template SET subname='Innkeeper' WHERE entry=3628;
UPDATE creature_template SET subname='Engineering Trainer' WHERE entry=4941;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=5520;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=5749;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=5750;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=5753;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=5815;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=6027;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=6328;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=6373;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=6374;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=6376;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=6382;
UPDATE creature_template SET subname='Engineering Supplies' WHERE entry=7876;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=9117;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=9270;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=9271;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=9272;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=9618;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=9997;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=9998;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=10302;
UPDATE creature_template SET subname='Marshal Expeditions' WHERE entry=10977;
UPDATE creature_template SET subname='The Head of The Black Flight' WHERE entry=11583;
UPDATE creature_template SET subname='Argent Crusade' WHERE entry=11616;
UPDATE creature_template SET subname='Chieftain' WHERE entry=11858;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=12776;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=12807;
UPDATE creature_template SET subname='King of the Foulweald' WHERE entry=12918;
UPDATE creature_template SET subname='DO NOT DELETE' WHERE entry=12999;
UPDATE creature_template SET subname='Stable Master' WHERE entry=16156;

-- M2 update from M1
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=2935;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=15494;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=16267;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=16649;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=16720;
UPDATE creature_template SET subname='Demon Trainer' WHERE entry=23535;

-- M2 update from M3
UPDATE creature_template SET subname='Don Carlos\' Pet' WHERE entry=28168;
UPDATE creature_template SET subname='Warrior Trainer' WHERE entry=36857;
UPDATE creature_template SET subname='Blacksmithing Trainer' WHERE entry=37072;
		

-- update M2 from M1
UPDATE gameobject_template SET name='War Catapult' WHERE entry=183164;
UPDATE gameobject_template SET name='Cooking Fire' WHERE entry=183503;
UPDATE gameobject_template SET name='Cooking Fire' WHERE entry=183504;
UPDATE gameobject_template SET name='Cooking Fire' WHERE entry=184294;
UPDATE gameobject_template SET name='Cooking Fire' WHERE entry=184331;
UPDATE gameobject_template SET name='Books on Fire' WHERE entry=184510;
UPDATE gameobject_template SET name='Books on Fire' WHERE entry=184516;

-- Update M2 from M3
UPDATE gameobject_template SET name='Mailbox' WHERE entry=190914;
UPDATE gameobject_template SET name='Mailbox' WHERE entry=190915;

-- Update M2 from ytdb
UPDATE gameobject_template SET name='Cooking Fire' WHERE entry=192235;
		

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

