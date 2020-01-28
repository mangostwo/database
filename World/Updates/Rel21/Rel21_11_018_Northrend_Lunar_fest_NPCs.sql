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
    SET @cOldStructure = '11'; 
    SET @cOldContent = '017';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '018';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Northrend Lunar fest NPCs';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Northrend Lunar fest NPCs';

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

DELETE FROM `gossip_menu` WHERE `entry` IN (9939,9977,9978);
INSERT INTO `gossip_menu` VALUES
(9939,7935,0,0),
(9977,7933,0,0),
(9978,7935,0,0);
UPDATE `creature_template` SET `MinLevel` = 80, `MaxLevel` = 80, `NpcFlags` = 3, `UnitFlags` = 33024, `UnitClass` = 8, `MinLevelHealth` = 12096, `MaxLevelHealth` = 12096, `MinLevelMana` = 8814, `MaxLevelMana` = 8814, `MinMeleeDmg` = 346, `MaxMeleeDmg` = 499, `MinRangedDmg` = 315, `MaxRangedDmg` = 468, `Armor` = 7822, `MeleeAttackPower` = 287, `GossipMenuId` = 9977 WHERE `Entry` = 30375;
UPDATE `creature_template` SET `MinLevel` = 80, `MaxLevel` = 80, `NpcFlags` = 3, `UnitFlags` = 33024, `UnitClass` = 8, `MinLevelHealth` = 12096, `MaxLevelHealth` = 12096, `MinLevelMana` = 8814, `MaxLevelMana` = 8814, `MinMeleeDmg` = 346, `MaxMeleeDmg` = 499, `MinRangedDmg` = 315, `MaxRangedDmg` = 468, `Armor` = 7822, `MeleeAttackPower` = 287, `GossipMenuId` = 9978 WHERE `Entry` = 30374;
UPDATE `creature_template` SET `NpcFlags` = 3 WHERE `Entry` IN (30348,30358,30364,30362,30367,30369,30370,30357,30359,30360,30365,30368,30363,30372);
UPDATE `creature_template` SET `NpcFlags` = 3, `GossipMenuId` = 9939 WHERE `Entry` IN (30371,30373);

INSERT INTO `quest_relations` VALUES
(0,30348,13012,0),
(0,30348,13012,1),
(0,30358,13014,0),
(0,30358,13014,1),
(0,30364,13033,0),
(0,30364,13033,1),
(0,30362,13018,0),
(0,30362,13018,1),
(0,30367,13025,0),
(0,30367,13025,1),
(0,30369,13027,0),
(0,30369,13027,1),
(0,30370,13028,0),
(0,30370,13028,1),
(0,30371,13029,0),
(0,30371,13029,1),
(0,30373,13031,0),
(0,30373,13031,1),
(0,30357,13013,0),
(0,30357,13013,1),
(0,30359,13015,0),
(0,30359,13015,1),
(0,30360,13016,0),
(0,30360,13016,1),
(0,30365,13024,0),
(0,30365,13024,1),
(0,30368,13026,0),
(0,30368,13026,1),
(0,30363,13019,0),
(0,30363,13019,1),
(0,30375,13020,0),
(0,30375,13020,1),
(0,30372,13030,0),
(0,30372,13030,1),
(0,30374,13032,0),
(0,30374,13032,1);

UPDATE `quest_template` SET `RewMailTemplateId` = 252, `RewMailDelaySecs` = 21600 WHERE `entry` = 13012;
UPDATE `quest_template` SET `RewMailTemplateId` = 238, `RewMailDelaySecs` = 21600 WHERE `entry` = 13014;
UPDATE `quest_template` SET `RewMailTemplateId` = 251, `RewMailDelaySecs` = 21600 WHERE `entry` = 13033;
UPDATE `quest_template` SET `RewMailTemplateId` = 253, `RewMailDelaySecs` = 21600 WHERE `entry` = 13018;
UPDATE `quest_template` SET `RewMailTemplateId` = 243, `RewMailDelaySecs` = 21600 WHERE `entry` = 13025;
UPDATE `quest_template` SET `RewMailTemplateId` = 245, `RewMailDelaySecs` = 21600 WHERE `entry` = 13027;
UPDATE `quest_template` SET `RewMailTemplateId` = 246, `RewMailDelaySecs` = 21600 WHERE `entry` = 13028;
UPDATE `quest_template` SET `RewMailTemplateId` = 247, `RewMailDelaySecs` = 21600 WHERE `entry` = 13029;
UPDATE `quest_template` SET `RewMailTemplateId` = 249, `RewMailDelaySecs` = 21600 WHERE `entry` = 13031;
UPDATE `quest_template` SET `RewMailTemplateId` = 237, `RewMailDelaySecs` = 21600 WHERE `entry` = 13013;
UPDATE `quest_template` SET `RewMailTemplateId` = 239, `RewMailDelaySecs` = 21600 WHERE `entry` = 13015;
UPDATE `quest_template` SET `RewMailTemplateId` = 240, `RewMailDelaySecs` = 21600 WHERE `entry` = 13016;
UPDATE `quest_template` SET `RewMailTemplateId` = 242, `RewMailDelaySecs` = 21600 WHERE `entry` = 13024;
UPDATE `quest_template` SET `RewMailTemplateId` = 244, `RewMailDelaySecs` = 21600 WHERE `entry` = 13026;
UPDATE `quest_template` SET `RewMailTemplateId` = 254, `RewMailDelaySecs` = 21600 WHERE `entry` = 13019;
UPDATE `quest_template` SET `RewMailTemplateId` = 241, `RewMailDelaySecs` = 21600 WHERE `entry` = 13020;
UPDATE `quest_template` SET `RewMailTemplateId` = 248, `RewMailDelaySecs` = 21600 WHERE `entry` = 13030;
UPDATE `quest_template` SET `RewMailTemplateId` = 250, `RewMailDelaySecs` = 21600 WHERE `entry` = 13032;

-- Add missing spawns.
SET @guid := (SELECT MAX(`guid`) FROM `creature`);
DELETE FROM `creature` WHERE `id` IN (30375,30374);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@guid+1,30375,571,1,65535,26966,0,8414.43,-381.994,903.202,3.31613,300,0,0,12096,8814,0,0),
(@guid+2,30374,571,1,65535,26964,0,7763.62,-2752.57,1164.59,6.07375,300,0,0,12096,8814,0,0);

INSERT INTO `game_event_creature` VALUES
(@guid+1,7),
(@guid+2,7);

DELETE FROM `creature_template_addon` WHERE `entry` IN (30375,30374);
INSERT INTO `creature_template_addon` VALUES
(30375,0,0,1,0,0,0,25824),
(30374,0,0,1,0,0,0,25824);
    

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


