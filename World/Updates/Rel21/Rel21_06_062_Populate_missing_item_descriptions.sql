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
    SET @cOldContent = '061';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '062';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Populate_missing_item_desc';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Populate_missing_item_descriptions';

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

-- Mangos2 - Item Description Updates from updated Mangos0
UPDATE item_template SET description='The initials are faded and unreadable.' WHERE entry=3985;
UPDATE item_template SET description='The words have washed away...' WHERE entry=4098;
UPDATE item_template SET description='In remarkably good condition all things considered.' WHERE entry=5424;
UPDATE item_template SET description='The maple-like leaves glisten with the promise of new life and the potential for deadly misuse.' WHERE entry=5437;
UPDATE item_template SET description='A strange code is written upon the inside of the ring in the language of the night elves.' WHERE entry=5445;
UPDATE item_template SET description='There is something otherworldly about the wood.' WHERE entry=5461;
UPDATE item_template SET description='Minor imperfections on the bottom of the gem reinforce the idea that it used to be fitted to something else.' WHERE entry=5463;
UPDATE item_template SET description='Intricate, yet dormant, runes adorn this section of the rod.' WHERE entry=5464;
UPDATE item_template SET description='Vile like their former owner.' WHERE entry=5481;
UPDATE item_template SET description='Something doesn\'t seem quite right about the soot-covered stone.' WHERE entry=5493;
UPDATE item_template SET description='A brilliant sheen glistens upon the stolen moonstone with a hint of something powerful within.' WHERE entry=5508;
UPDATE item_template SET description='The final piece of Dartol\'s Rod.' WHERE entry=5519;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8628;
UPDATE item_template SET description='It doesn\'t appear to work anymore.  Might as well sell it for scrap.' WHERE entry=9173;
UPDATE item_template SET description='An ancient, brittle horn.' WHERE entry=10000;
UPDATE item_template SET description='Use to wake up Ringo.' WHERE entry=11804;
UPDATE item_template SET description='Looks great. Less filling.' WHERE entry=12947;
UPDATE item_template SET description='Not to be confused with gloom weed, womb weed, or broom weed.  Or doom seed.' WHERE entry=13702;
UPDATE item_template SET description='The aura permeating the charm\'s wood makes your skin crawl.' WHERE entry=16602;
UPDATE item_template SET description='Only ONE May Rise... (and consequently, only ONE may loot this head)' WHERE entry=20383;
UPDATE item_template SET description='Someone has been holding onto this for a VERY long time.' WHERE entry=22520;

-- Mangos2 - Item Description Updates from updated Mangos1
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5663;
UPDATE item_template SET description='Open for a prize!' WHERE entry=5858;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5874;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5875;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8583;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8589;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8590;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8630;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8633;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=14062;
UPDATE item_template SET description='Return to the iCoke redemption vendor to receive a virtual prize' WHERE entry=19642;
UPDATE item_template SET description='They look heavily worn, yet still remain razor sharp.' WHERE entry=23687;
UPDATE item_template SET description='Bears the mark of the Shattered Hand.' WHERE entry=23881;
UPDATE item_template SET description='It smells of death and fear.' WHERE entry=23886;
UPDATE item_template SET description='His eyes are full of hatred.' WHERE entry=23901;
UPDATE item_template SET description='Softer than any material found on Azeroth.' WHERE entry=28490;
UPDATE item_template SET description='Also serves as a mining pick.' WHERE entry=30855;
UPDATE item_template SET description='Required by jewelcrafters to transmute mercurial adamantite.' WHERE entry=31080;
UPDATE item_template SET description='Wearing this would be a bad idea, as it would severely hinder your vision.' WHERE entry=31529;
UPDATE item_template SET description='Cut cleanly off at the shoulders.' WHERE entry=31706;


-- Mangos2 - Item Description Updates from updated Mangos3
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5663;
UPDATE item_template SET description='Open for a prize!' WHERE entry=5858;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5874;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5875;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8583;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8589;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8590;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8630;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8633;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=14062;
UPDATE item_template SET description='Return to the iCoke redemption vendor to receive a virtual prize' WHERE entry=19642;
UPDATE item_template SET description='They look heavily worn, yet still remain razor sharp.' WHERE entry=23687;
UPDATE item_template SET description='Bears the mark of the Shattered Hand.' WHERE entry=23881;
UPDATE item_template SET description='It smells of death and fear.' WHERE entry=23886;
UPDATE item_template SET description='His eyes are full of hatred.' WHERE entry=23901;
UPDATE item_template SET description='Softer than any material found on Azeroth.' WHERE entry=28490;
UPDATE item_template SET description='Also serves as a mining pick.' WHERE entry=30855;
UPDATE item_template SET description='Required by jewelcrafters to transmute mercurial adamantite.' WHERE entry=31080;
UPDATE item_template SET description='Wearing this would be a bad idea, as it would severely hinder your vision.' WHERE entry=31529;
UPDATE item_template SET description='Cut cleanly off at the shoulders.' WHERE entry=31706;
    

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

