-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
CREATE PROCEDURE `update_mangos`()
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
    SET @cOldContent = '015';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '03';
    SET @cNewContent = '016';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'creature_addon_Startup';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix_creature_addon_Startup_errors: has spell xxxx defined in `auras` field in `creature_addon, but spell is no self-only spell`.';

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

UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=1344; -- has spell 19834 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=3218; -- has spell 467 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=4488; -- has spell 8907 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=4606; -- has spell 8118 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=4625; -- has spell 7083 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=5043; -- has spell 10032 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=5743; -- has spell 7670 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=6747; -- has spell 5232 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=7158; -- has spell 13585 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=7439; -- has spell 13585 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=8914; -- has spell 15288 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=9024; -- has spell 15288 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=11455; -- has spell 22418 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=11487; -- has spell 21157 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=11492; -- has spell 22128 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=11492; -- has spell 21157 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=11672; -- has spell 20553 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=12467; -- has spell 22440 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=13142; -- has spell 21337 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=14507; -- has spell 21157 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=16224; -- has spell 8099 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=17847; -- has spell 31324 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=17947; -- has spell 31515 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=18424; -- has spell 32423 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=18437; -- has spell 32423 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=18450; -- has spell 32924 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=18453; -- has spell 32924 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=18480; -- has spell 32423 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=18490; -- has spell 32423 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=18560; -- has spell 32573 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=18660; -- has spell 32623 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=19296; -- has spell 10938 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=19415; -- has spell 13864 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=19668; -- has spell 34429 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=20115; -- has spell 34871 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=20397; -- has spell 34062 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=20431; -- has spell 35190 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=20904; -- has spell 36852 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=21440; -- has spell 36852 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=21737; -- has spell 37248 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=21757; -- has spell 37248 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=22093; -- has spell 37119 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=22139; -- has spell 38469 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=22214; -- has spell 13864 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=22267; -- has spell 38721 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=24229; -- has spell 42617 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=24235; -- has spell 42617 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=24954; -- has spell 45797 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=25171; -- has spell 63413 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=25596; -- has spell 32423 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=25781; -- has spell 35357 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=25783; -- has spell 34427 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=25962; -- has spell 46322 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=25994; -- has spell 46322 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=27355; -- has spell 48685 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=27962; -- has spell 51776 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=28586; -- has spell 52097 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=28945; -- has spell 51714 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=28996; -- has spell 34427 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=29240; -- has spell 52097 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=29720; -- has spell 43161 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=30288; -- has spell 56571 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=30849; -- has spell 42617 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=31786; -- has spell 35357 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=33455; -- has spell 61894 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=34852; -- has spell 35356 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=34888; -- has spell 37119 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=35324; -- has spell 35356 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=37016; -- has spell 69926 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=37027; -- has spell 69882 defined in `auras` field in `creature_template_addon`
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=37027; -- has spell 69898 defined in `auras` field in `creature_template_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=46; -- has spell 1244 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133; -- has spell 1243 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=1676; -- has spell 184 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2069; -- has spell 184 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2160; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2161; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2165; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2176; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2372; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2375; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2380; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2488; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=2491; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=3275; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=3276; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=3277; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=3278; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=3279; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=6854; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=14449; -- has spell 23014 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27106; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27107; -- has spell 8788 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27625; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27626; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27627; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27675; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27681; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27683; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27684; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=27685; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30207; -- has spell 10348 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30232; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30234; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30236; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30323; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30388; -- has spell 10348 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30504; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30712; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=30909; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31113; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31114; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31125; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31126; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31202; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31206; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31208; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31210; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31211; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31214; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31215; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31222; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31226; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31336; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31338; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31339; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31351; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31353; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31360; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31364; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31365; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31369; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31385; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31387; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31390; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31391; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31393; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31458; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31459; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31463; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31464; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31465; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31466; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31470; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31472; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31473; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31487; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31488; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31492; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31493; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31497; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31521; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31522; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31523; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31525; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31542; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31606; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31607; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31608; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31610; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31611; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31615; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31616; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31617; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31618; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31619; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31620; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31621; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31622; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31623; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31625; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31626; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31627; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31628; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31729; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=31731; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=33685; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=33762; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=33904; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=34008; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=34012; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=34016; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=34018; -- has spell 18968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=39680; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=40438; -- has spell 8699 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=40659; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=40661; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=40665; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45350; -- has spell 17175 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45845; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45846; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45847; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45848; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45849; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45852; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45853; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45854; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45855; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45856; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45862; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45863; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45864; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45865; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45866; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45869; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45870; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45871; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45872; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45874; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45875; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45876; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45877; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45878; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45879; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45880; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45881; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45882; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45883; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=45884; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=46760; -- has spell 17175 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=46762; -- has spell 17175 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47634; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47641; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47643; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47644; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47645; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47649; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47650; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47652; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47653; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47676; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47677; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47678; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47679; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47680; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47681; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47682; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47683; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47684; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47685; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47686; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47687; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47688; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47689; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47690; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47691; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47692; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47693; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47694; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47695; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47696; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47697; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47698; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47699; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47700; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47701; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47702; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47734; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47735; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47739; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47740; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47749; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47750; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47751; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47758; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47759; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47760; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47762; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47765; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47766; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47772; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47781; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47782; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47783; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47784; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47785; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47786; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47787; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47788; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47789; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47790; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47799; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47800; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47801; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47802; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=47803; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48784; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48790; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48792; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48952; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48968; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48969; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48972; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48973; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=48974; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53246; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53247; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53249; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53255; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53273; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53274; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53277; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53282; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53283; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53284; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53285; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53286; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=53287; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=54146; -- has spell 17150 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=54168; -- has spell 17150 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=54170; -- has spell 17150 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=54174; -- has spell 17150 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=54647; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=55823; -- has spell 1243 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=57763; -- has spell 35782 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=57764; -- has spell 35782 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=57765; -- has spell 35782 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=57766; -- has spell 35782 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59071; -- has spell 38966 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59072; -- has spell 38966 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59073; -- has spell 38966 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59351; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59352; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59362; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59365; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59370; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59390; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59393; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=59412; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=61856; -- has spell 31271 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=61928; -- has spell 31271 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=61931; -- has spell 31271 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=61940; -- has spell 31271 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=63582; -- has spell 31411 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=63583; -- has spell 31412 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=63584; -- has spell 31413 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=63585; -- has spell 31414 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=63692; -- has spell 31628 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=63696; -- has spell 31631 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=63933; -- has spell 34871 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=63934; -- has spell 34871 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=65960; -- has spell 32924 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=65966; -- has spell 32924 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=65967; -- has spell 32924 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=65968; -- has spell 32924 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=65972; -- has spell 32924 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=65973; -- has spell 32924 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=66526; -- has spell 3149 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=66819; -- has spell 33332 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67190; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67194; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67195; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67196; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67199; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67200; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67201; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67205; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67211; -- has spell 34086 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=67527; -- has spell 36004 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=69916; -- has spell 34303 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=71670; -- has spell 34062 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=75234; -- has spell 37067 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=75259; -- has spell 37067 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=75289; -- has spell 37067 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=75295; -- has spell 37067 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=77144; -- has spell 35190 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=77145; -- has spell 35190 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=77150; -- has spell 35190 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=77151; -- has spell 35190 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=77152; -- has spell 35190 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=77153; -- has spell 35190 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=77815; -- has spell 36241 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=78218; -- has spell 36241 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=89285; -- has spell 42350 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90624; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90625; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90626; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90627; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90628; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90629; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90631; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90632; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90633; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90635; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90641; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90642; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90643; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90644; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90645; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90647; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90648; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90649; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90653; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90654; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90655; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90656; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90657; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90658; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90659; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90660; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90661; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90662; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90667; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90668; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90669; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90670; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90671; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90676; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90677; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90678; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90679; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90680; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90681; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90682; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90683; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90684; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90818; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90819; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90820; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90822; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90823; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90824; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90826; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90830; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90831; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90833; -- has spell 15288 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90839; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90840; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90841; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90842; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=90843; -- has spell 13864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=91329; -- has spell 12380 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=91336; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=91337; -- has spell 17151 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=97057; -- has spell 44864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=97058; -- has spell 44864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=97059; -- has spell 44864 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=118458; -- has spell 71252 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=118497; -- has spell 71252 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=118500; -- has spell 71252 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=118502; -- has spell 71252 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=118503; -- has spell 71252 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=118504; -- has spell 71252 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=120676; -- has spell 69882 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=120676; -- has spell 69898 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=120678; -- has spell 69926 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=120680; -- has spell 69926 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=120698; -- has spell 69906 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=120698; -- has spell 69910 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=120699; -- has spell 69906 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126491; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126498; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126539; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126542; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126553; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126556; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126562; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126564; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126567; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126568; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126569; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126572; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126574; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126579; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126582; -- has spell 33832 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126746; -- has spell 50627 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126749; -- has spell 50645 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126750; -- has spell 50646 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126917; -- has spell 52097 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126919; -- has spell 52097 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126940; -- has spell 52097 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127067; -- has spell 16172 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127213; -- has spell 54988 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127479; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127480; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127481; -- has spell 49555 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127482; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127483; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127484; -- has spell 49555 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127485; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127486; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127487; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127488; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127518; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127519; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127520; -- has spell 49555 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127521; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127522; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127523; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127524; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127525; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127526; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127527; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127528; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127529; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127530; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127531; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127532; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127533; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127534; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127535; -- has spell 49555 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127536; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127537; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127538; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127539; -- has spell 49406 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127994; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127995; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127996; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127997; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=127998; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128028; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128029; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128030; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128462; -- has spell 53570 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128464; -- has spell 53570 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128584; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128764; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128767; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128778; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128868; -- has spell 52414 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128869; -- has spell 52414 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128873; -- has spell 52414 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128874; -- has spell 52414 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128925; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=128927; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129253; -- has spell 20549 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129256; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129314; -- has spell 51767 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129641; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129642; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129651; -- has spell 34809 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129652; -- has spell 34809 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129654; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129688; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129698; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129700; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129701; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129703; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129705; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129706; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129707; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129708; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129713; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129716; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129718; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129720; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129721; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129730; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129732; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129733; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129736; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129749; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129750; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129754; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129755; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129756; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129764; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129771; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129774; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129775; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129783; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129785; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129786; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129787; -- has spell 20549 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129788; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129800; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129801; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129808; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129809; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129810; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129811; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129812; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129819; -- has spell 53570 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129820; -- has spell 53570 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=129821; -- has spell 53570 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130005; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130007; -- has spell 34809 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130010; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130012; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130015; -- has spell 51714 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130018; -- has spell 34809 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130030; -- has spell 34809 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130040; -- has spell 51767 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130041; -- has spell 51767 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130077; -- has spell 52632 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130090; -- has spell 52632 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130098; -- has spell 52632 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130109; -- has spell 52632 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130400; -- has spell 53466 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130494; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130497; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130499; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130509; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130510; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130518; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130520; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130523; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130525; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130529; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130530; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130538; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130539; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130540; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130907; -- has spell 51767 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=130908; -- has spell 51767 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131075; -- has spell 55838 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131077; -- has spell 55824 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131219; -- has spell 16244 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131250; -- has spell 49517 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131253; -- has spell 49515 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131452; -- has spell 46968 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131518; -- has spell 10890 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131542; -- has spell 10890 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131648; -- has spell 61840 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131816; -- has spell 48508 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131819; -- has spell 48508 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131832; -- has spell 47257 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131833; -- has spell 47257 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=131834; -- has spell 47257 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132566; -- has spell 51735 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132911; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132912; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132913; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132915; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132916; -- has spell 46221 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132918; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132919; -- has spell 46221 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132921; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132922; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132923; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132924; -- has spell 27187 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132925; -- has spell 46221 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=132926; -- has spell 32019 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133004; -- has spell 52908 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133027; -- has spell 51270 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133229; -- has spell 32595 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133280; -- has spell 62312 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133282; -- has spell 62312 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133288; -- has spell 62312 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133290; -- has spell 62312 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133291; -- has spell 62312 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133293; -- has spell 62312 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133294; -- has spell 62312 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133298; -- has spell 62312 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133310; -- has spell 49099 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133313; -- has spell 49099 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133321; -- has spell 49099 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133323; -- has spell 49099 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133378; -- has spell 31732 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133422; -- has spell 16244 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133423; -- has spell 16244 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133424; -- has spell 16244 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133425; -- has spell 16244 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133426; -- has spell 16244 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133492; -- has spell 60053 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133505; -- has spell 55095 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133522; -- has spell 55078 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=133681; -- has spell 60053 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134897; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134900; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134901; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134902; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134903; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134904; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134906; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134908; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134909; -- has spell 21157 defined in `auras` field in `creature_addon`
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=134910; -- has spell 21157 defined in `auras` field in `creature_addon`

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


