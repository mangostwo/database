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
    SET @cOldContent = '029';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '030';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Add many creature ai scripts';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Add many creature ai scripts';

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

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (17158,18290,19744,18205,18203,17135,17152,17137,10198,14491,16959,17084,17131,16952,15552,17128,17130,17151,17159,17160,18065,19765,21123,21004,20773,20465,19801,19784,19824,15242,19443, 18334,18289,21802,22966,10204);
-- Dust Howler
-- Tusker
-- Dreadwarden 
-- Clefthoof
-- Murkblood Raider
-- Boulderfist Mystic
-- Felguard Legionnaire
-- Boulderfist Mage
-- Kashoch the Reaver
-- Kurmokk
-- Dread Tactician
-- Avruu
-- Talbuk Thorngrazer
-- Anger Guard
-- Doctor Weavil
-- Windroc
-- Talbuk Stag
-- Gan'arg Tinkerer
-- Storm Rager
-- Living Cyclone
-- Warmaul Brute
-- Coilskar Myrmidon
-- Felsworn Scalewing
-- Lesser Nether Drake
-- Barbscale Crocolisk
-- Underbog Frenzy 
-- Illidari Agonizer
-- Coilskar Cobra
-- Son of Corok
-- Bat Rider Guard
-- Tagar Spinebreaker
-- Add scripts for
-- Bull Elekk
-- Wild Elekk
-- Elekk Demolisher
-- Lightsworn Elekk Rider
-- Misha
INSERT INTO creature_ai_scripts VALUES 
(1715801,17158,9,0,100,1,0,5,10000,20000,11,32017,1,32,0,0,0,0,0,0,0,0,'Dust Howler - Cast Howling Dust'),
(1829001,18290,0,0,100,1,0,7000,10000,18000,11,32019,1,0,0,0,0,0,0,0,0,0,'Tusker - Cast Gore'),
(1829002,18290,0,0,100,1,5000,20000,20000,30000,11,12612,0,0,0,0,0,0,0,0,0,0,'Tusker - Cast Stomp'),
(1829003,18290,0,0,100,1,2000,6000,7000,15000,11,15550,0,0,0,0,0,0,0,0,0,0,'Tusker - Cast Trample'),
(1974401,19744,9,0,100,1,0,5,6000,12000,11,32736,1,0,0,0,0,0,0,0,0,0,'Dreadwarden - Cast Mortal Strike'),
(1974402,19744,9,0,100,1,0,30,10000,12000,11,11443,4,32,0,0,0,0,0,0,0,0,'Dreadwarden - Cast Cripple'),
(1820501,18205,0,0,100,1,6000,18000,20000,28000,11,32023,0,0,0,0,0,0,0,0,0,0,'Clefthoof - Cast Hoof Stomp'),
(1820301,18203,4,0,100,2,0,0,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Murkblood Raider - Set Phase 1 on Aggro'),
(1820302,18203,9,5,100,3,0,5,5000,9000,11,11971,1,0,0,0,0,0,0,0,0,0,'Murkblood Raider - Cast Sunder Armor (Phase 1)'),
(1820303,18203,24,5,100,3,11971,5,5000,5000,22,2,0,0,0,0,0,0,0,0,0,0,'Murkblood Raider - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)'),
(1820304,18203,28,3,100,3,11971,1,5000,5000,22,1,0,0,0,0,0,0,0,0,0,0,'Murkblood Raider - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)'),
(1820305,18203,0,0,100,1,3500,4000,10000,11000,11,15496,1,0,0,0,0,0,0,0,0,0,'Murkblood Raider - Cast Cleave'),
(1713506,17135,9,0,100,1,0,40,3800,5200,11,9532,1,0,0,0,0,0,0,0,0,0,'Boulderfist Mystic - Cast Lightning Bolt'),
(1713507,17135,9,0,100,1,0,20,8000,12000,11,13281,1,0,0,0,0,0,0,0,0,0,'Boulderfist Mystic - Cast Earth Shock'),
(1713508,17135,2,0,100,1,50,0,15300,22900,11,11431,0,0,0,0,0,0,0,0,0,0,'Boulderfist Mystic - Cast Healing Touch When Below 50% HP'),
(1715201,17152,0,0,100,1,3000,3000,10000,12000,11,15496,1,0,0,0,0,0,0,0,0,0,'Felguard Legionnaire - Cast Cleave'),
(1715202,17152,0,0,100,1,6000,6000,14000,16000,11,32009,1,0,0,0,0,0,0,0,0,0,'Felguard Legionnaire - Cast Cutdown'),
(1713706,17137,9,0,100,1,0,40,3800,5200,11,9672,1,0,0,0,0,0,0,0,0,0,'Boulderfist Mage - Cast Frostbolt'),
(1713707,17137,0,0,100,1,3200,8000,30500,45200,11,6742,0,0,0,0,0,0,0,0,0,0,'Boulderfist Mage - Cast Bloodlust'),
(1713708,17137,0,0,100,1,5000,9000,9000,12000,11,20795,1,0,0,0,0,0,0,0,0,0,'Boulderfist Mage - Cast Fire Blast'),
(1019801,10198,11,0,100,0,0,0,0,0,11,8876,0,2,0,0,0,0,0,0,0,0,'Kashoch the Reaver - Cast Thrash on Spawn'),
(1019802,10198,9,0,100,1,0,5,6000,9000,11,40504,1,0,0,0,0,0,0,0,0,0,'Kashoch the Reaver - Cast Cleave'),
(1449101,14491,2,0,100,1,20,0,180000,180000,11,8599,0,0,0,0,0,0,0,0,0,0,'Kurmokk - Cast Enrage at 20% HP'),
(1695901,16959,9,0,100,1,0,20,8000,12000,11,33678,1,0,0,0,0,0,0,0,0,0,'Dread Tactician - Cast Carrion Swarm'),
(1695902,16959,0,0,100,1,5000,5000,15000,20000,11,33679,1,0,0,0,0,0,0,0,0,0,'Dread Tactician - Cast Inferno'),
(1695903,16959,9,0,100,1,0,30,10500,17000,11,12098,4,32,0,0,0,0,0,0,0,0,'Dread Tactician - Cast Sleep'),
(1708401,17084,9,0,100,1,0,5,8000,10000,11,34112,1,32,0,0,0,0,0,0,0,0,'Avruu - Cast Judgement of Darkness'),
(1708402,17084,2,0,100,1,50,0,8000,8000,11,16588,0,0,0,0,0,0,0,0,0,0,'Avruu - Cast Dark Mending at 50% HP'),
(1713101,17131,0,0,100,1,6000,12000,19000,26000,11,32019,1,0,0,0,0,0,0,0,0,0,'Talbuk Thorngrazer - Cast Gore'),
(1713102,17131,0,0,100,1,9200,17400,20200,28000,11,32020,1,0,0,0,0,0,0,0,0,0,'Talbuk Thorngrazer - Cast Talbuk Strike'),
(1695201,16952,0,0,100,1,3500,5500,10000,11000,11,15496,1,0,0,0,0,0,0,0,0,0,'Anger Guard - Cast Cleave'),
(1555201,15552,0,0,100,1,15000,15000,121000,121000,11,25772,1,0,0,0,0,0,0,0,0,0,'Doctor Weavil - Cast Mental Domination'),
(1555202,15552,0,0,100,1,15000,25000,25000,30000,11,25774,4,0,0,0,0,0,0,0,0,0,'Doctor Weavil - Cast Mind Shatter'),
(1712801,17128,0,0,100,1,5000,10000,10000,20000,11,30285,1,32,0,0,0,0,0,0,0,0,'Windroc - Cast Eagle Claw'),
(1713001,17130,0,0,100,1,6000,12000,19000,26000,11,32019,1,0,0,0,0,0,0,0,0,0,'Talbuk Thorngrazer - Cast Gore'),
(1715101,17151,0,0,100,1,7500,7500,14000,16000,11,32003,1,0,0,0,0,0,0,0,0,0,'Gan\arg Tinkerer - Cast Power Burn'),
(1715901,17159,0,0,100,1,4000,8000,8000,12000,11,32018,1,0,0,0,0,0,0,0,0,0,'Storm Rager - Cast Call Lightning'),
(1716001,17160,9,0,100,0,35,40,0,0,11,31705,1,0,0,0,0,0,0,0,0,0,'Living Cyclone - Cast Magnetic Pull'),
(1806501,18065,0,0,100,1,3500,5500,10000,12000,11,10966,1,0,0,0,0,0,0,0,0,0,'Warmaul Brute - Cast Uppercut'),
(1976501,19765,9,0,100,1,0,20,11500,13000,11,38027,1,32,0,0,0,0,0,0,0,0,'Coilskar Myrmidon - Cast Boiling Blood'),
(2112301,21123,9,0,100,1,0,30,14000,15000,11,32093,1,0,0,0,0,0,0,0,0,0,'Felsworn Scalewing - Cast Poison Spit'),
(2100401,21004,0,0,100,1,4000,8000,12000,16000,11,36513,0,0,0,0,0,0,0,0,0,0,'Lesser Nether Drake - Cast Intangible Presence'),
(2077301,20773,9,0,100,1,0,5,20000,20000,11,3604,1,0,0,0,0,0,0,0,0,0,'Barbscale Crocolisk - Cast Tendon Rip'),
(2046501,20465,9,0,100,7,0,5,10000,20000,11,12097,1,0,0,0,0,0,0,0,0,0,'Underbog Frenzy - Cast Pierce Armor'),
(1980101,19801,9,0,100,1,0,30,2400,4200,11,36227,1,0,0,0,0,0,0,0,0,0,'Illidari Agonizer - Cast Firebolt'),
(1978401,19784,9,0,100,1,5,30,10000,12000,11,38030,1,0,0,0,0,0,0,0,0,0,'Coilskar Cobra - Cast Poison Spit'),
(1982401,19824,9,0,100,1,0,5,9500,18000,11,12612,0,0,0,0,0,0,0,0,0,0,'Son of Corok  - Cast Stomp'),
(1524201,15242,11,0,100,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,0,0,'Bat Rider Guard - Prevent Combat Movement on Spawn'),
(1524202,15242,0,0,100,1,0,5,12000,18000,11,38066,1,0,0,0,0,0,0,0,0,0,'Bat Rider Guard - Cast Unstable Concoction'),
(1944301,19443,0,0,100,1,0,10000,20500,36500,11,34108,1,0,0,0,0,0,0,0,0,0,'Tagar Spinebreaker - Cast Spine Break'),
(1944302,19443,0,0,100,1,10000,20000,29000,41500,11,34109,0,0,0,0,0,0,0,0,0,0,'Tagar Spinebreaker - Cast Whirlwind Knockback'),
(1828901,18289,0,0,100,1,4500,9600,18200,27100,11,15550,0,0,0,0,0,0,0,0,0,0,'Bull Elekk - Cast Trample'),
(1833401,18334,0,0,100,1,5000,10000,10000,20000,11,32019,1,32,0,0,0,0,0,0,0,0,'Wild Elekk - Cast Gore'),
(2180201,21802,9,0,100,1,0,5,15000,30000,11,38045,0,0,0,0,0,0,0,0,0,0,'Elekk Demolisher - Cast Rampaging Stomp'),
(2296601,22966,6,0,100,0,0,0,0,0,43,0,0,0,11,39782,0,0,0,0,0,0,'Lightsworn Elekk Rider - Dismount and Cast Summon Lightsworn Elekk on Death'),
(1020401,10204,1,6,100,1,120000,240000,120000,240000,30,1,2,0,47,3,0,0,4,478,0,0,'Misha - Set Random Phase 1/2, Set Stand State to Sleep and Play Sound ID 478 OOC'),
(1020402,10204,1,5,100,1,120000,240000,120000,240000,30,0,2,0,47,1,0,0,4,478,0,0,'Misha - Set Random Phase 0/2, Set Stand State to Sit and Play Sound ID 478 OOC'),
(1020403,10204,1,3,100,1,120000,240000,120000,240000,30,0,1,0,47,0,0,0,4,478,0,0,'Misha - Set Random Phase 0/1, Set Stand State to Stand and Play Sound ID 478 OOC');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` IN (17158,18290,19744,18205,18203,17135,17152,17137,10198,14491,16959,17084,17131,16952,15552,17128,17130,17151,17159,17160,18065,19765,21123,21004,20773,20465,19801,19784,19824,15242,19443, 18334,18289,21802,22966,10204);

-- Add Missing Fel Reaver Sound
UPDATE `creature_template_addon` SET `auras`='34623' WHERE `entry` IN (18733);
-- Update comment to match rest of script.
UPDATE `creature_ai_scripts` SET `comment` = 'Twilight Marauder Morna - Cast Piercing Howl';


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


