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
    SET @cOldContent = '162';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '10';
    SET @cNewContent = '163';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Quest Of Keys and Cages';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Quest Of Keys and Cages';

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

-- Source: https://github.com/unified-db/Database/commit/4b56fe6
-- Quest 'Of Keys and Cages'
-- 11265 - Horde
-- 11231 - Alliance

-- Flag corrected.
UPDATE `gameobject_template` SET `flags` = 0 WHERE `entry` = 186494;
-- Cage spawn time corrected.
-- Gjalerbron Prisoner.
UPDATE `creature` SET `spawntimesecs` = 110 WHERE `id` = 24035;

-- Large Gjalerbron Cage
DELETE FROM `db_scripts` WHERE `id` = 186490;
INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(7,186490,1,0,0,0,24035,117706,7 | 0x10,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186490,1,0,0,0,24035,117707,7 | 0x10,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186490,1,0,0,0,24035,117709,7 | 0x10,2000000805,2000000809,2000000807,2000000812,0,0,0,0,''),
(7,186490,1,0,0,0,24035,117711,7 | 0x10,2000000809,2000000806,2000000811,2000000808,0,0,0,0,''),
(7,186490,1,0,0,0,24035,117712,7 | 0x10,2000000812,2000000811,2000000805,2000000806,0,0,0,0,''),
(7,186490,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'1st - q. credit'),
(7,186490,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'2nd - q. credit'),
(7,186490,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'3rd - q. credit'),
(7,186490,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'4th - q. credit'),
(7,186490,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'5th - q. credit'),
(7,186490,5,18,5000,0,24035,117706,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(7,186490,5,18,5000,0,24035,117707,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(7,186490,5,18,5000,0,24035,117709,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(7,186490,5,18,5000,0,24035,117711,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(7,186490,5,18,5000,0,24035,117712,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(7,186490,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset');

-- Gjalerbron Cage
DELETE FROM `db_scripts` WHERE `id` BETWEEN 186491 AND 186505;
DELETE FROM `db_scripts` WHERE `id` BETWEEN 186507 AND 186518;
INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
-- 186491
(7,186491,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186491,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186491,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186491,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
-- 186492
(7,186492,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186492,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186492,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186492,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186492,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186493
(7,186493,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186493,2,0,0,0,24035,117703,7 | 0x10,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186493,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186493,5,18,5000,0,24035,117703,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(7,186493,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186494
(7,186494,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186494,2,0,0,0,24035,117702,7 | 0x10,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186494,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186494,5,18,5000,0,24035,117702,7 | 0x10,0,0,0,0,0,0,0,0,'desp'),
(7,186494,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186495
(7,186495,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186495,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186495,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186495,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186495,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186496
(7,186496,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186496,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186496,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186496,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186496,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186497
(7,186497,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186497,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186497,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186497,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186497,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186498
(7,186498,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186498,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186498,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186498,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186498,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186499
(7,186499,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186499,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186499,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186499,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186499,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186500
(7,186500,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186500,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186500,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186500,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186500,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186501
(7,186501,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186501,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186501,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186501,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186501,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186502
(7,186502,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186502,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186502,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186502,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186502,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186503
(7,186503,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186503,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186503,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186503,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186503,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186504
(7,186504,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186504,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186504,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186504,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186504,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186505
(7,186505,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186505,2,0,0,0,24035,5,7,2000000805,2000000806,2000000807,2000000808,0,0,0,0,''),
(7,186505,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186505,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186505,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186507
(7,186507,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186507,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186507,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186507,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186507,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186508
(7,186508,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186508,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186508,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186508,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186508,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186509
(7,186509,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186509,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186509,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186509,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186509,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186510
(7,186510,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186510,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186510,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186510,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186510,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186511
(7,186511,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186511,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186511,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186511,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186511,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186512
(7,186512,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186512,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186512,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186512,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186512,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186513
(7,186513,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186513,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186513,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186513,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186513,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186514
(7,186514,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186514,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186514,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186514,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186514,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186515
(7,186515,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186515,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186515,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186515,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186515,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186516
(7,186516,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186516,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186516,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186516,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186516,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186517
(7,186517,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186517,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186517,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186517,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186517,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset'),
-- 186518
(7,186518,1,31,24035,5,0,0,0,0,0,0,0,0,0,0,0,'search for 24035'),
(7,186518,2,0,0,0,24035,5,7,2000000809,2000000810,2000000811,2000000812,0,0,0,0,''),
(7,186518,3,8,24035,1,0,0,0,0,0,0,0,0,0,0,0,'q. credit'),
(7,186518,5,18,5000,0,24035,5,7,0,0,0,0,0,0,0,0,'desp'),
(7,186518,119,43,0,0,0,0,0,0,0,0,0,0,0,0,0,'reset');
DELETE FROM `db_script_string` WHERE `entry` BETWEEN 2000000805 AND 2000000812;
INSERT INTO `db_script_string` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(2000000805, 'Thank you. I will not forget this!', 0, 0, 0, 0, NULL),
(2000000806, 'You have to put a stop to this madness before it\'s too late!', 0, 0, 0, 0, NULL),
(2000000807, 'My thanks to you, hero!', 0, 0, 0, 0, NULL),
(2000000808, 'Oh, thank you, thank you!', 0, 0, 0, 0, NULL),
(2000000809, 'Avenge my friends who have already been sacrificed!', 0, 0, 0, 0, NULL),
(2000000810, 'Thank goodness for you!', 0, 0, 0, 0, NULL),
(2000000811, 'The vrykul are evil and must be destroyed!', 0, 0, 0, 0, NULL),
(2000000812, 'You saved my life!', 0, 0, 0, 0, NULL);    

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


