-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
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
    SET @cOldContent = '041';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '042';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix typos in page and quest';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix typos in page and quest text';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

UPDATE page_text SET text='Below is the process and schedule of Defias gold collection from the mines of Elwynn to our headquarters in Westfall.$B$BCollection Schedule:$B$BSunday: 12:30pm$BWednesday: 12:30pm$B$BBy each specified day, gold gained from the Elwynn mines will be gathered at the Brackwell pumpkin patch.  The agent in charge of these gatherings, "The Collector", will be known by the engraved ring he possesses.  A ring I gave him.' WHERE entry=79;
UPDATE page_text SET text='Kegan Darkmar, leader of the small group of undead who came to us in search of asylum from their "brethren", defies our common attitudes toward his kind.  His skin may be rotting and blood may have long stopped flowing through his veins, but he acts very nobly and seems to care more for his compatriots\' safety than his own.$B$BIndeed, there is a humanity within him that, I confess, I sometimes see lacking in the humans around me.' WHERE entry=266;
UPDATE page_text SET text='As I waited for the results of these tests, I spent my time speaking to Kegan.  Although I constantly pressed him for what he knew about bloodstones, he never told me more than what he said the day he gave me his pendant.  And he did not often speak of his time within the fold of what he called "the Forsaken", which is the name he calls his clan of undead. ' WHERE entry=281;

UPDATE quest_template SET Details='Lord Wishock is causing quite a stir amongst the House of Nobles.  He was made aware of our little "establishment" down here and is lobbying for a full investigation.  I have a plan to keep Wishock "preoccupied", but I\'ll need your help. $B$BThere is a flower growing in the Garden of Stalvan on the outskirts of Darkshire.  This small white flower is known as the Tear of Tilloa.  I will also need a Musquash Root, found only at the very base of the falls far beneath the Stonewrought Dam in the Wetlands.' WHERE entry=335;
UPDATE quest_template SET RequestItemsText='You wouldn\'t think it from a guy like my boss Gazlowe, but he always seemed to know the score. "Don\'t be afraid to take that big step", he said.$B$BHarpies won\'t stop bothering us and the caravans won\'t stop being attacked unless we do something about it, eh?' WHERE entry=835;
UPDATE quest_template SET OfferRewardText='You did it?  Well done!$B$BI was chatting with some of my colleagues and when your name came up they said, "You know that $N sure works well under stress!"$B$BBut when I told them I sent you to Uldaman against the obsidian sentinel, they said I was crazy!  They said, "Tabetha, you\'re crazy!  There\'s no way $N could take on that sentinel!"$B$BAnd I said, "We\'ll see", and then they said "Yeah, we\'ll see..."$B$BWell we sure showed them, didn\'t we!' WHERE entry=1956;
UPDATE quest_template SET Details='I have studied many subjects in my time, and my latest fascination is with the snapjaw that occupy the beach in the Hinterlands. There\'s one in particular I\'d like to see, a giant snapjaw named Gammerita. I\'d like to go myself, but my research keeps me here. I think a picture of her would be the next best thing.$B$BTake this letter to Curgle Cranklehop in Tanaris. She has created an invention for me that can capture a picture. She called it a "snapshot", I think...'  WHERE entry=2941;
UPDATE quest_template SET Details='$N, I\'m a scientist, but also a treasure hunter at heart!$B$BLong ago, when trolls used to occupy this land, they created large amounts of ornaments modeled after Gahz\'rilla, a hydra they worshipped as a deity. These ornaments are carved out of an element that I call "Gahz\'ridian", after the hydra god.$B$BI did find some myself, but I\'d like to have some more to study -- maybe you can find some?$B$BI even invented a detector that makes finding the Gahz\'ridian a snap! Just put it on, and the search begins! ' WHERE entry=3161;
UPDATE quest_template SET Details='Five of my best field agents were assigned the Marris case. One returned, only to end up dead in his sleep three days later.$B$BWhat little information we did manage to get out of him was incoherent gibberish. We made out two words: "Nathanos", and "Blightcaller."$B$BI do not have the available manpower to continue this investigation and Ravenholdt will not assist us. We must get to the bottom of this; if only to provide closure to the families of the deceased. Will you help?' WHERE entry=6183;
UPDATE quest_template SET Details='The embrace of death had all but overcome my being when he intervened. He breathed only once upon my maimed body and then waited patiently for the sands of time to cleanse my wounds.$B$B"Forever you will remain if you must", he said, and with those words I was bound as a Watcher.$B$BLook now to the desert. The second war is upon us. You must seek out the resting place of the Bronze. Venture to the Caverns of Time and see if the master has returned. I must be sure before I am able to proceed.' WHERE entry=8286;

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
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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


