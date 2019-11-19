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
    SET @cOldContent = '158';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '159';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Creature AI additions';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Creature AI additions';

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

-- Source: https://github.com/cmangos/wotlk-db/commit/b23a53b
-- Source: https://github.com/cmangos/wotlk-db/commit/6bb673f
-- Source: https://github.com/cmangos/wotlk-db/commit/6bad7d7
-- Source: https://github.com/cmangos/wotlk-db/commit/f433f0b
-- Source: https://github.com/cmangos/wotlk-db/commit/a5c71fd
-- Source: https://github.com/cmangos/wotlk-db/commit/516a69f
-- Source: https://github.com/cmangos/wotlk-db/commit/e75e543
-- Source: https://github.com/cmangos/wotlk-db/commit/b3aad23
-- Source: https://github.com/cmangos/wotlk-db/commit/c2604c7
-- Source: https://github.com/cmangos/wotlk-db/commit/889be11
-- Source: https://github.com/cmangos/wotlk-db/commit/f4af5a0
-- Source: https://github.com/cmangos/wotlk-db/commit/7c05e5d


UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `Entry` IN(21477,21478,20772,20283,18257,18692,21928,22037,22045,22858,23501,18696);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (21477,21478,20772,20283,18257,18692,21928,22037,22045,22858,23501,18696);
INSERT INTO `creature_ai_scripts` VALUES
-- Rocknail Flayer
(2147701,21477,0,0,100,1,4000,8000,15000,19000,11,37937,1,32,0,0,0,0,0,0,0,0,'Rocknail Flayer - Cast Rend Flesh'),
-- Rocknail Ripper
(2147801,21478,0,0,100,1,4000,8000,15000,18000,11,33912,1,0,0,0,0,0,0,0,0,0,'Rocknail Ripper - Cast Rip'),
-- Netherock
(2077201,20772,2,0,100,0,90,0,0,0,12,21323,1,1000,0,0,0,0,0,0,0,0,'Netherock - Summon Netherock Crumbler at 90% HP'),
(2077202,20772,2,0,100,0,60,0,0,0,12,21323,1,1000,0,0,0,0,0,0,0,0,'Netherock - Summon Netherock Crumbler at 60% HP'),
(2077203,20772,2,0,100,0,30,0,0,0,12,21323,1,1000,0,0,0,0,0,0,0,0,'Netherock - Summon Netherock Crumbler at 30% HP'),
-- Marshrock Stomper
(2028301,20283,0,0,100,1,5000,10000,15000,30000,11,12612,0,0,0,0,0,0,0,0,0,0,'Marshrock Stomper - Cast Stomp'),
-- Gutripper
(1825701,18257,0,0,100,1,3000,5000,3000,5000,11,32022,1,32,0,0,0,0,0,0,0,0,'Gutripper - Cast Gut Rip'),
-- Hemathion
(1869201,18692,0,0,100,1,10000,18000,13000,25000,11,9573,1,0,0,0,0,0,0,0,0,0,'Hemathion - Cast Flame Breath'),
(1869202,18692,0,0,100,1,20000,30000,20000,35000,11,14100,0,0,0,0,0,0,0,0,0,0,'Hemathion - Cast Terrifying Roar'),
-- Lothros
(2192801,21928,0,0,100,1,5000,10000,10000,15000,11,38167,1,32,0,0,0,0,0,0,0,0,'Lothros - Cast Curse of Blood'),
(2192802,21928,0,0,100,1,20000,25000,30000,32000,11,38166,0,0,0,0,0,0,0,0,0,0,'Lothros - Cast Frenzy'),
-- Smith Gorlunk
(2203701,22037,0,0,100,1,3000,9000,15000,20000,11,13445,1,0,0,0,0,0,0,0,0,0,'Smith Gorlunk - Cast Rend'),
(2203702,22037,28,0,100,1,13444,5,5000,9000,11,13444,1,0,0,0,0,0,0,0,0,0,'Smith Gorlunk - Cast Sunder Armor on Target Missing Sunder Armor Aura Stack'),
-- Vengeful Husk
(2204501,22045,0,0,100,1,4000,8000,13000,18000,11,38621,1,0,0,0,0,0,0,0,0,0,'Vengeful Husk - Cast Debilitating Strike'),
-- Shadowhoof Assassin
(2285801,22858,0,0,100,1,3500,4000,10000,12000,11,37577,1,0,0,0,0,0,0,0,0,0,'Shadowhoof Assassin - Cast Debilitating Strike'),
(2285802,22858,0,0,100,1,6000,8000,11000,18000,11,14873,1,0,0,0,0,0,0,0,0,0,'Shadowhoof Assassin - Cast Sinister Strike'),
-- Netherwing Ray
(2350101,23501,9,0,100,1,0,20,7000,11000,11,35334,1,0,0,0,0,0,0,0,0,0,'Netherwing Ray - Cast Nether Shock'),
(2350102,23501,9,0,100,1,0,15,6000,9000,11,36659,4,32,0,0,0,0,0,0,0,0,'Netherwing Ray - Cast Tail Sting'),
(2350103,23501,9,0,100,1,0,10,11000,15000,11,17008,4,0,0,0,0,0,0,0,0,0,'Netherwing Ray - Cast Drain Mana'),
-- Kraator
-- (1869601,18696,6,0,100,0,0,0,0,0,28,0,12743,0,0,0,0,0,0,0,0,0,'Kraator - Remove Immolation on Death'), Spell not known 12743
(1869601,18696,0,0,100,1,5000,10000,20000,25000,11,39293,1,0,0,0,0,0,0,0,0,0,'Kraator - Cast Conflagration'),
(1869602,18696,0,0,100,1,15000,15000,15000,30000,11,24670,1,2,0,0,0,0,0,0,0,0,'Kraator - Cast Inferno');
    

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


