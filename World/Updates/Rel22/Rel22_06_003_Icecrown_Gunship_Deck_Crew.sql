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
    SET @cOldStructure = '06';
    SET @cOldContent = '002';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '06';
    SET @cNewContent = '003';
                            -- DESCRIPTION IS 30 Characters MAX
    SET @cNewDescription = 'Icecrown_Gunship_Deck_Crew';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Crew of Orgrim''s Hammer (map 622) and The Skybreaker (map 623), with the faction, civilian, selectable and waypoint flags corrected.';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @oldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @newResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @oldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

    -- THE CREW OF THE TWO ICECROWN GUNSHIPS, on the vessels' own maps.
    --
    -- 622 is Map.dbc directory `Transport192241` (Orgrim's Hammer, Horde) and 623 is
    -- `Transport192242` (The Skybreaker, Alliance) -- Blizzard rows, not ids this core mints,
    -- so they need no widened `map` column. A vessel WITHOUT such a row gets an id of
    -- 1000000 + gameobject entry, which is why Rel22_06_001 had to run before this file.
    --
    -- The coordinates are DECK-LOCAL and that is not a detail of the format: a deck is a map,
    -- so these ARE the creatures' real coordinates on it. Nothing here is an offset to be
    -- composed with the hull's world position, which the server only ever estimates.

    -- By map, never by guid range: guid 153527 sits inside this block and belongs to another
    -- vessel's deck (map 588), so a BETWEEN would take it with them.
    DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `map` IN (622,623));
    DELETE FROM `creature_movement` WHERE `id` IN (SELECT `guid` FROM `creature` WHERE `map` IN (622,623));
    DELETE FROM `creature` WHERE `map` IN (622,623);

    INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
    (153407,30344,623,1,1,0,0,43.4612,0.019921,25.1395,3.22113,120,0,0,21368,0,0,0),
    (153408,32777,623,1,1,0,0,43.8352,5.08165,25.1089,3.86517,120,0,0,126000,0,0,0),
    (153409,30833,623,1,1,0,0,6.93334,0.014709,20.5705,6.27633,120,0,0,17096,3994,0,0),
    (153410,30754,622,1,1,0,0,-7.69647,-0.02255,86.0904,3.14808,120,0,0,5342,0,0,0),
    (153411,30753,622,1,1,0,0,16.0735,-0.223265,86.0904,3.14022,120,0,0,5342,0,0,0),
    (153412,30755,622,1,1,0,0,8.76648,4.12372,84.7137,3.97667,120,0,0,16026,0,0,0),
    (153413,30755,622,1,1,0,0,7.94864,-4.37775,84.7137,2.18989,120,0,0,16026,0,0,0),
    (153414,30755,622,1,1,0,0,29.4484,-30.5936,89.7685,2.90458,120,0,0,16026,0,0,0),
    (153415,30754,622,1,1,0,0,-14.2587,-28.0798,89.9514,3.20696,120,0,0,5342,0,0,0),
    (153416,30755,622,1,1,0,0,-19.8707,28.182,89.9697,6.11686,120,0,0,16026,0,0,0),
    (153417,30754,622,1,1,0,0,27.5586,30.8479,89.7784,0.136055,120,0,0,5342,0,0,0),
    (153418,30755,622,1,1,0,0,8.3467,-5.8522,34.4351,2.22126,120,0,0,16026,0,0,0),
    (153419,30755,622,1,1,0,0,8.03542,5.77003,34.4315,3.57999,120,0,0,16026,0,0,0),
    (153420,30755,622,1,1,0,0,37.2723,8.20737,30.0955,5.45316,120,0,0,16026,0,0,0),
    (153421,30755,622,1,1,0,0,37.6672,-8.92249,30.0955,1.25129,120,0,0,16026,0,0,0),
    (153422,30824,622,1,1,0,0,56,-0.154377,30.6955,3.11428,120,0,0,21368,0,0,0),
    (153423,30754,622,1,1,0,0,38.4306,-13.0135,30.0946,0.803593,120,0,0,5342,0,0,0),
    (153424,31088,622,1,1,0,0,45.403,6.9463,30.0955,5.03296,120,0,0,2489500,0,0,0),
    (153425,30827,622,1,1,0,0,45.7089,-9.13039,30.0955,1.07062,120,0,0,5342,0,0,0),
    (153426,30755,622,1,1,0,0,-3.36531,28.1387,34.2854,4.75021,120,0,0,16026,0,0,0),
    (153427,30755,622,1,1,0,0,-3.61499,-28.7566,34.2671,1.46332,120,0,0,16026,0,0,0),
    (153428,30752,622,1,1,0,0,8.34611,-21.385,34.8791,1.80888,120,0,0,5342,0,0,0),
    (153429,30752,622,1,1,0,0,7.5972,23.9118,34.9485,4.61668,120,0,0,5342,0,0,0),
    (153430,30866,622,1,1,0,0,18.887,-25.7358,35.6101,5.09579,120,0,0,3739,8814,0,0),
    (153431,30866,622,1,1,0,0,17.028,27.1657,35.5755,1.24341,120,0,0,3739,8814,0,0),
    (153432,30826,622,1,1,0,0,41.2821,0.072804,48.6078,3.2226,120,0,0,5342,0,0,0),
    (153433,30754,622,1,1,0,0,-53.5051,-13.8934,34.4215,3.30899,120,0,0,5342,0,0,0),
    (153434,30753,622,1,1,0,0,-27.1752,-10.1067,35.6728,1.45545,120,0,0,5342,0,0,0),
    (153435,30866,622,1,1,0,0,-36.1394,-22.6812,33.9892,3.89409,120,0,0,3739,8814,0,0),
    (153436,30866,622,1,1,0,0,-35.7436,23.4934,33.9445,2.21726,120,0,0,3739,8814,0,0),
    (153437,30754,622,1,1,0,0,-53.6748,13.9227,34.4245,2.81416,120,0,0,5342,0,0,0),
    (153438,30753,622,1,1,0,0,-27.4607,10.293,35.6695,5.00151,120,0,0,5342,0,0,0),
    (153439,30755,622,1,1,0,0,-58.0021,2.96164,13.3236,6.15997,120,0,0,16026,0,0,0),
    (153440,30755,622,1,1,0,0,-57.3107,-2.91721,13.2603,6.26993,120,0,0,16026,0,0,0),
    (153441,30755,622,1,1,0,0,-26.1127,-6.78766,9.38619,3.14011,120,0,0,16026,0,0,0),
    (153442,30755,622,1,1,0,0,-25.5464,7.82482,9.40164,3.28933,120,0,0,16026,0,0,0),
    (153443,30753,622,1,1,0,0,-35.1646,-10.8361,11.4042,4.56561,120,0,0,5342,0,0,0),
    (153444,30753,622,1,1,0,0,-35.6587,12.2964,11.707,1.30228,120,0,0,5342,0,0,0),
    (153445,30755,622,1,1,0,0,-20.4642,7.06669,6.96321,0.112402,120,0,0,16026,0,0,0),
    (153446,30755,622,1,1,0,0,-21.1141,-7.14228,6.96227,6.27385,120,0,0,16026,0,0,0),
    (153447,30755,622,1,1,0,0,24.52,-6.95192,7.07946,3.06157,120,0,0,16026,0,0,0),
    (153448,30755,622,1,1,0,0,24.9343,6.96341,7.08284,3.05372,120,0,0,16026,0,0,0),
    (153449,30825,622,1,1,0,0,39.1568,-0.145606,10.2058,3.15563,120,0,0,5342,0,0,0),
    (153450,30753,622,1,1,0,0,46.7347,-7.71531,10.4047,2.21315,120,0,0,5342,0,0,0),
    (153451,30753,622,1,1,0,0,46.5655,7.62736,10.402,3.85856,120,0,0,5342,0,0,0),
    (153452,30755,622,1,1,0,0,9.00317,-17.3021,8.70631,1.49057,120,0,0,16026,0,0,0),
    (153453,30755,622,1,1,0,0,-4.59011,-17.3654,8.62614,1.41203,120,0,0,16026,0,0,0),
    (153454,30755,622,1,1,0,0,-4.26925,18.0665,8.62584,4.54185,120,0,0,16026,0,0,0),
    (153455,30755,622,1,1,0,0,8.99744,17.3264,8.70616,4.534,120,0,0,16026,0,0,0),
    (153456,30753,622,1,1,0,0,2.17364,16.4824,9.16447,1.61232,120,0,0,5342,0,0,0),
    (153457,30753,622,1,1,0,0,1.91521,-17.7509,9.1608,4.7382,120,0,0,5342,0,0,0),
    (153458,30752,622,1,1,0,0,2.35335,-28.5809,9.33565,4.73035,120,0,0,5342,0,0,0),
    (153459,30752,622,1,1,0,0,15.3232,-27.7927,9.91327,4.7814,120,0,0,5342,0,0,0),
    (153460,30752,622,1,1,0,0,-10.9141,-27.4005,9.8897,4.75783,120,0,0,5342,0,0,0),
    (153461,30752,622,1,1,0,0,-11.2245,27.6701,9.91686,1.55341,120,0,0,5342,0,0,0),
    (153462,30752,622,1,1,0,0,2.07595,27.3623,9.33565,1.57697,120,0,0,5342,0,0,0),
    (153463,30752,622,1,1,0,0,15.6023,27.9848,9.93769,1.5966,120,0,0,5342,0,0,0),
    (153464,31261,622,1,1,0,0,1.11785,-0.205796,34.1886,6.2815,120,5,0,37800,31952,0,1),
    (153465,32301,622,1,1,0,0,-18.4184,-0.10189,7.03871,0.002254,120,5,0,630000,0,0,1),
    (153466,30351,623,1,1,0,0,-31.945,-5.01545,20.7842,3.14956,120,0,0,5342,0,0,0),
    (153467,30351,623,1,1,0,0,-36.6755,7.10274,20.4472,4.67323,120,0,0,5342,0,0,0),
    (153468,30351,623,1,1,0,0,-36.5129,-7.71922,20.4481,1.5395,120,0,0,5342,0,0,0),
    (153469,30867,623,1,1,0,0,-29.476,-22.2416,22.565,4.4769,120,0,0,5342,0,0,0),
    (153470,30867,623,1,1,0,0,-30.018,21.9686,22.5683,1.61805,120,0,0,5342,0,0,0),
    (153471,30350,623,1,1,0,0,16.8728,-4.70226,20.4346,2.59194,120,0,0,5342,0,0,0),
    (153472,30352,623,1,1,0,0,17.0009,3.95529,20.4323,3.23596,120,0,0,16026,0,0,0),
    (153473,30351,623,1,1,0,0,1.56664,9.57584,20.4556,3.17312,120,0,0,5342,0,0,0),
    (153474,30351,623,1,1,0,0,1.16191,-9.45579,20.4568,3.07102,120,0,0,5342,0,0,0),
    (153475,30394,623,1,1,0,0,-62.098,-0.254698,23.4884,0.459574,120,0,0,5342,0,0,0),
    (153476,30352,623,1,1,0,0,-47.8648,-0.104596,20.6339,6.27543,120,0,0,16026,0,0,0),
    (153477,30352,623,1,1,0,0,-17.1342,-4.01418,20.7687,2.92178,120,0,0,16026,0,0,0),
    (153478,30352,623,1,1,0,0,-16.5217,3.9859,20.7829,3.09457,120,0,0,16026,0,0,0),
    (153479,30867,623,1,1,0,0,-6.87133,22.4252,22.524,1.35884,120,0,0,5342,0,0,0),
    (153480,30351,623,1,1,0,0,1.40575,23.0633,22.5525,6.10264,120,0,0,5342,0,0,0),
    (153481,30351,623,1,1,0,0,1.40227,-23.2486,22.5526,0.055067,120,0,0,5342,0,0,0),
    (153482,30867,623,1,1,0,0,-7.9294,-22.3601,22.5202,4.8774,120,0,0,5342,0,0,0),
    (153483,30352,623,1,1,0,0,49.8828,8.60312,40.0818,4.32015,120,0,0,16026,0,0,0),
    (153484,30352,623,1,1,0,0,49.8828,8.60312,40.0818,4.32015,120,0,0,16026,0,0,0),
    (153485,30352,623,1,1,0,0,49.5377,-7.38294,40.0845,1.94825,120,0,0,16026,0,0,0),
    (153486,32302,623,1,1,0,0,49.6152,-1.34142,40.0945,3.7034,120,10,0,630000,0,0,1),
    (153487,30867,623,1,1,0,0,35.5758,44.3212,25.0329,1.91291,120,0,0,5342,0,0,0),
    (153488,30867,623,1,1,0,0,36.7385,-44.9935,25.0326,4.28089,120,0,0,5342,0,0,0),
    (153489,26170,623,1,1,0,0,37.207,-39.3427,25.0298,3.03995,120,0,0,67270,0,0,0),
    (153490,32566,623,1,1,0,0,36.8718,-41.3867,25.0309,3.02818,120,0,0,11770,0,0,0),
    (153491,31259,623,1,1,0,0,16.6813,-13.752,20.5199,1.97966,120,5,0,37800,31952,0,1),
    (153492,30347,623,1,1,0,0,29.1375,-7.26651,23.288,0.118276,120,0,0,5342,0,0,0),
    (153493,30392,623,1,1,0,0,30.1036,6.61515,23.2861,6.16977,120,0,0,5342,0,0,0),
    (153494,30346,623,1,1,0,0,29.9213,-0.217027,9.62258,3.16169,120,0,0,5342,0,0,0),
    (153495,30352,623,1,1,0,0,37.0984,6.30038,9.60565,3.19703,120,0,0,16026,0,0,0),
    (153496,30352,623,1,1,0,0,37.4227,-5.96055,9.59258,3.15457,120,0,0,16026,0,0,0),
    (153497,30380,623,1,1,0,0,3.53705,-20.3023,9.66894,1.55921,120,0,0,5342,0,0,0),
    (153498,30380,623,1,1,0,0,-7.10628,-22.6815,9.67523,1.81054,120,0,0,5342,0,0,0),
    (153499,30380,623,1,1,0,0,-18.0806,-22.9059,9.601,1.38642,120,0,0,5342,0,0,0),
    (153500,30380,623,1,1,0,0,-31.4418,-22.5505,9.59326,1.17044,120,0,0,5342,0,0,0),
    (153501,30380,623,1,1,0,0,-38.3693,-20.4609,9.59894,0.93482,120,0,0,5342,0,0,0),
    (153502,30380,623,1,1,0,0,-37.7436,20.5686,9.59836,4.52409,120,0,0,5342,0,0,0),
    (153503,30380,623,1,1,0,0,-30.0375,22.7326,9.59489,4.61441,120,0,0,5342,0,0,0),
    (153504,30380,623,1,1,0,0,-16.8329,23.0386,9.59832,4.59871,120,0,0,5342,0,0,0),
    (153505,30380,623,1,1,0,0,-7.33633,22.6992,9.67359,4.63013,120,0,0,5342,0,0,0),
    (153506,30380,623,1,1,0,0,4.6713,21.3725,9.67875,4.45734,120,0,0,5342,0,0,0),
    (153507,30394,623,1,1,0,0,-12.5894,22.9441,9.59159,1.52781,120,0,0,5342,0,0,0),
    (153508,30394,623,1,1,0,0,-12.5505,-23.065,9.59128,4.66155,120,0,0,5342,0,0,0),
    (153509,30380,623,1,1,0,0,-8.13769,-30.136,0.101368,1.53799,120,0,0,5342,0,0,0),
    (153510,30380,623,1,1,0,0,2.6101,-28.7377,0.101369,1.65767,120,0,0,5342,0,0,0),
    (153511,30380,623,1,1,0,0,-25.8563,-30.0764,0.101368,1.56419,120,0,0,5342,0,0,0),
    (153512,30380,623,1,1,0,0,-40.9053,-26.4484,0.827996,1.15185,120,0,0,5342,0,0,0),
    (153513,30380,623,1,1,0,0,-40.6165,26.0796,1.20385,5.18488,120,0,0,5342,0,0,0),
    (153514,30380,623,1,1,0,0,-25.4608,30.2181,-0.157759,4.76077,120,0,0,5342,0,0,0),
    (153515,30380,623,1,1,0,0,-8.10089,30.0367,-0.157759,4.65867,120,0,0,5342,0,0,0),
    (153516,30380,623,1,1,0,0,2.65506,28.7625,0.101368,4.46624,120,0,0,5342,0,0,0),
    (153517,30394,623,1,1,0,0,-14.5606,-23.1029,-5.24973,0.083719,120,0,0,5342,0,0,0),
    (153519,30345,623,1,1,0,0,-47.4528,-0.006912,-4.97648,3.11535,120,0,0,5342,0,0,0),
    (153520,30352,623,1,1,0,0,-60.768,0.235038,-5.26887,6.13913,120,0,0,16026,0,0,0),
    (153521,30394,623,1,1,0,0,-47.4534,-2.85825,-5.21807,3.17032,120,0,0,5342,0,0,0),
    (153522,30352,623,1,1,0,0,46.3236,13.2156,-2.06747,3.9086,120,0,0,16026,0,0,0),
    (153523,30352,623,1,1,0,0,46.3406,-13.1696,-2.06743,2.45059,120,0,0,16026,0,0,0),
    (153529,30394,623,1,1,0,361,-14.8317,24.2015,-5.25375,6.06453,25,0,0,5342,0,0,0);

    -- Four of the crew stand at an emote; the `creature` table has no column for it.
    INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
    (153434,0,0,1,0,173,0,''),
    (153438,0,0,1,0,173,0,''),
    (153443,0,0,1,0,173,0,''),
    (153444,0,0,1,0,173,0,'');

    -- FRIENDLY TO EVERYONE. FactionTemplate.dbc row 35 has no faction group of its own, is
    -- friendly to `Player` -- Alliance AND Horde alike -- and hostile to nobody. Blizzard
    -- could afford that because these two gunships are unboardable on retail; here they are
    -- boardable, so a Horde boarder walked onto the Skybreaker and found the whole crew green.
    --
    -- 1978 (Horde, hostile to Alliance) and 1973 (Alliance, hostile to Horde) are what every
    -- other crew member on those same two decks already uses.
    --
    -- THIS IS A DELIBERATE DIVERGENCE FROM BLIZZARD DATA, not a repair -- the 5.4.8 databases
    -- carry 35 for these entries too. A creature_template refresh will revert it; re-apply.
    UPDATE `creature_template` SET `FactionAlliance` = 1978, `FactionHorde` = 1978 WHERE `Entry` = 30755;  -- Kor'kron Reaver
    UPDATE `creature_template` SET `FactionAlliance` = 1973, `FactionHorde` = 1973 WHERE `Entry` = 30352;  -- Skybreaker Marine

    -- Absalan the Pious is the Alliance mirror of Brother Keltan (31261) on the Horde deck:
    -- a chaplain, and 2070 is Keltan's faction -- no group, no friends, no enemies. Neutral to
    -- everyone is not the same thing as friendly to everyone, which is what 35 was.
    UPDATE `creature_template` SET `FactionAlliance` = 2070, `FactionHorde` = 2070 WHERE `Entry` = 31259;

    -- ExtraFlags bit 2 is CREATURE_FLAG_EXTRA_CIVILIAN, "not aggro (ignore faction/reputation
    -- hostility)" -- a second and independent reason these never fought. Faction alone would
    -- have left the crew standing while boarders cut them down.
    UPDATE `creature_template` SET `ExtraFlags` = `ExtraFlags` & ~2 WHERE `Entry` IN (30755, 30352);

    -- 0x02000000 UNIT_FLAG_NOT_SELECTABLE on a named officer with a model, standing on a deck:
    -- nobody could target him. The 5.4.8 databases carry 0 for this entry and every other
    -- Skybreaker officer here is 0 or 768, so this one IS local corruption, unlike the above.
    UPDATE `creature_template` SET `UnitFlags` = 0 WHERE `Entry` = 30392;  -- Navigator Anderlain

    -- WAYPOINT MOVEMENT WITH NO WAYPOINTS. Both carried MovementType 2 with not one row in
    -- `creature_movement`, which is an empty path: the core logs an error and falls back to
    -- idle. The values below are what the crew roster they were authored from actually says --
    -- 1 (random, 5 yd) for the priest, 0 (idle) for the galley chief. They are already correct
    -- in the INSERT above; these guard a database whose rows were edited by hand.
    UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5 WHERE `guid` = 153491 AND `map` = 623;
    UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 153494 AND `map` = 623;

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
            SET @newResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@newResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @newResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@oldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @oldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@oldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@oldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
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
