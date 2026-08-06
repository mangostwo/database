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
    SET @cOldContent = '003';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '06';
    SET @cNewContent = '004';
                            -- DESCRIPTION IS 30 Characters MAX
    SET @cNewDescription = 'Icecrown_Gunship_Deck_Crew_pt2';

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

    -- By map, never by a fixed guid range: other vessels' deck spawns can sit
    -- inside a contiguous guid block (map 588), so a BETWEEN would take them too.
    DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `map` IN (622,623));
    DELETE FROM `creature_movement` WHERE `id` IN (SELECT `guid` FROM `creature` WHERE `map` IN (622,623));
    DELETE FROM `creature` WHERE `map` IN (622,623);

    SET @guid := (SELECT MAX(`guid`) FROM `creature`);

    INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
    (@guid+1,30344,623,1,1,0,0,43.4612159729,0.019920999184,25.13948059082,3.221132993698,120,0,0,21368,0,0,0),
    (@guid+2,32777,623,1,1,0,0,43.835178375244,5.081649780273,25.108865737915,3.865166902542,120,0,0,126000,0,0,0),
    (@guid+3,30833,623,1,1,0,0,6.933340072632,0.014708999544,20.570547103882,6.276334762573,120,0,0,17096,3994,0,0),
    (@guid+4,30754,622,1,1,0,0,-7.696469783783,-0.022549999878,86.090370178223,3.148077011108,120,0,0,5342,0,0,0),
    (@guid+5,30753,622,1,1,0,0,16.073543548584,-0.223265007138,86.090370178223,3.140221118927,120,0,0,5342,0,0,0),
    (@guid+6,30755,622,1,1,0,0,8.766478538513,4.123724937439,84.713714599609,3.976669073105,120,0,0,16026,0,0,0),
    (@guid+7,30755,622,1,1,0,0,7.948635101318,-4.37774515152,84.713714599609,2.189887046814,120,0,0,16026,0,0,0),
    (@guid+8,30755,622,1,1,0,0,29.448404312134,-30.593647003174,89.768463134766,2.904582977295,120,0,0,16026,0,0,0),
    (@guid+9,30754,622,1,1,0,0,-14.258745193481,-28.07977104187,89.951431274414,3.206962108612,120,0,0,5342,0,0,0),
    (@guid+10,30755,622,1,1,0,0,-19.870670318604,28.181964874268,89.969665527344,6.116864204407,120,0,0,16026,0,0,0),
    (@guid+11,30754,622,1,1,0,0,27.558584213257,30.847900390625,89.778388977051,0.136054992676,120,0,0,5342,0,0,0),
    (@guid+12,30755,622,1,1,0,0,8.346697807312,-5.852203845978,34.435131072998,2.221261024475,120,0,0,16026,0,0,0),
    (@guid+13,30755,622,1,1,0,0,8.035417556763,5.770029067993,34.431537628174,3.579988002777,120,0,0,16026,0,0,0),
    (@guid+14,30755,622,1,1,0,0,37.272312164307,8.207367897034,30.095474243164,5.453163146973,120,0,0,16026,0,0,0),
    (@guid+15,30755,622,1,1,0,0,37.667224884033,-8.922486305237,30.095470428467,1.251291036606,120,0,0,16026,0,0,0),
    (@guid+16,30824,622,1,1,0,0,56,-0.154376998544,30.695499420166,3.114275932312,120,0,0,21368,0,0,0),
    (@guid+17,30754,622,1,1,0,0,38.430587768555,-13.013534545898,30.094615936279,0.803592979908,120,0,0,5342,0,0,0),
    (@guid+18,31088,622,1,1,0,0,45.402961730957,6.946300029755,30.095478057861,5.032959938049,120,0,0,2489500,0,0,0),
    (@guid+19,30827,622,1,1,0,0,45.708881378174,-9.130389213562,30.095474243164,1.070621013641,120,0,0,5342,0,0,0),
    (@guid+20,30755,622,1,1,0,0,-3.365305900574,28.138746261597,34.285358428955,4.75021314621,120,0,0,16026,0,0,0),
    (@guid+21,30755,622,1,1,0,0,-3.614989995956,-28.756616592407,34.267105102539,1.463318943977,120,0,0,16026,0,0,0),
    (@guid+22,30752,622,1,1,0,0,8.346105575562,-21.385011672974,34.879055023193,1.808884978294,120,0,0,5342,0,0,0),
    (@guid+23,30752,622,1,1,0,0,7.597195148468,23.91180229187,34.948516845703,4.616682052612,120,0,0,5342,0,0,0),
    (@guid+24,30866,622,1,1,0,0,18.887044906616,-25.735752105713,35.61011505127,5.095786094666,120,0,0,3739,8814,0,0),
    (@guid+25,30866,622,1,1,0,0,17.02801322937,27.165676116943,35.575485229492,1.243406057358,120,0,0,3739,8814,0,0),
    (@guid+26,30826,622,1,1,0,0,41.282115936279,0.072803996503,48.607776641846,3.222599983215,120,0,0,5342,0,0,0),
    (@guid+27,30754,622,1,1,0,0,-53.505146026611,-13.893359184265,34.421474456787,3.308994054794,120,0,0,5342,0,0,0),
    (@guid+28,30753,622,1,1,0,0,-27.175184249878,-10.106663703918,35.672813415527,1.45545399189,120,0,0,5342,0,0,0),
    (@guid+29,30866,622,1,1,0,0,-36.13939666748,-22.681232452393,33.989192962646,3.894090890884,120,0,0,3739,8814,0,0),
    (@guid+30,30866,622,1,1,0,0,-35.743640899658,23.493360519409,33.944507598877,2.217259883881,120,0,0,3739,8814,0,0),
    (@guid+31,30754,622,1,1,0,0,-53.6748046875,13.922702789307,34.424507141113,2.814162015915,120,0,0,5342,0,0,0),
    (@guid+32,30753,622,1,1,0,0,-27.460668563843,10.293045043945,35.669513702393,5.00150680542,120,0,0,5342,0,0,0),
    (@guid+33,30755,622,1,1,0,0,-58.002056121826,2.961635112762,13.323576927185,6.159971237183,120,0,0,16026,0,0,0),
    (@guid+34,30755,622,1,1,0,0,-57.310726165771,-2.917208909988,13.260328292847,6.269926071167,120,0,0,16026,0,0,0),
    (@guid+35,30755,622,1,1,0,0,-26.112699508667,-6.787655830383,9.386194229126,3.140105962753,120,0,0,16026,0,0,0),
    (@guid+36,30755,622,1,1,0,0,-25.546413421631,7.824817180634,9.401642799377,3.289331912994,120,0,0,16026,0,0,0),
    (@guid+37,30753,622,1,1,0,0,-35.164573669434,-10.836072921753,11.404159545898,4.56561088562,120,0,0,5342,0,0,0),
    (@guid+38,30753,622,1,1,0,0,-35.65869140625,12.296438217163,11.706951141357,1.30228304863,120,0,0,5342,0,0,0),
    (@guid+39,30755,622,1,1,0,0,-20.464151382446,7.06668806076,6.963214874268,0.112401999533,120,0,0,16026,0,0,0),
    (@guid+40,30755,622,1,1,0,0,-21.114074707031,-7.14228105545,6.962265014648,6.273849010468,120,0,0,16026,0,0,0),
    (@guid+41,30755,622,1,1,0,0,24.520029067993,-6.951923847198,7.079463005066,3.061569929123,120,0,0,16026,0,0,0),
    (@guid+42,30755,622,1,1,0,0,24.93430519104,6.963407039642,7.082840919495,3.053716897964,120,0,0,16026,0,0,0),
    (@guid+43,30825,622,1,1,0,0,39.156848907471,-0.145605996251,10.20581817627,3.155633926392,120,0,0,5342,0,0,0),
    (@guid+44,30753,622,1,1,0,0,46.734657287598,-7.715307235718,10.404733657837,2.213150978088,120,0,0,5342,0,0,0),
    (@guid+45,30753,622,1,1,0,0,46.565547943115,7.62736082077,10.402039527893,3.858561038971,120,0,0,5342,0,0,0),
    (@guid+46,30755,622,1,1,0,0,9.003170013428,-17.30212020874,8.70630645752,1.49057495594,120,0,0,16026,0,0,0),
    (@guid+47,30755,622,1,1,0,0,-4.590106964111,-17.365396499634,8.626135826111,1.412034988403,120,0,0,16026,0,0,0),
    (@guid+48,30755,622,1,1,0,0,-4.269248008728,18.066486358643,8.625839233398,4.541850090027,120,0,0,16026,0,0,0),
    (@guid+49,30755,622,1,1,0,0,8.997440338135,17.326356887817,8.706160545349,4.533996105194,120,0,0,16026,0,0,0),
    (@guid+50,30753,622,1,1,0,0,2.173635005951,16.482437133789,9.164468765259,1.612315058708,120,0,0,5342,0,0,0),
    (@guid+51,30753,622,1,1,0,0,1.915212988853,-17.750877380371,9.160799980164,4.738199234009,120,0,0,5342,0,0,0),
    (@guid+52,30752,622,1,1,0,0,2.353353977203,-28.580904006958,9.335652351379,4.730348110199,120,0,0,5342,0,0,0),
    (@guid+53,30752,622,1,1,0,0,15.323180198669,-27.79273223877,9.913268089294,4.781401157379,120,0,0,5342,0,0,0),
    (@guid+54,30752,622,1,1,0,0,-10.914065361023,-27.400468826294,9.889699935913,4.757833957672,120,0,0,5342,0,0,0),
    (@guid+55,30752,622,1,1,0,0,-11.22449016571,27.670135498047,9.916858673096,1.553410053253,120,0,0,5342,0,0,0),
    (@guid+56,30752,622,1,1,0,0,2.075949907303,27.362276077271,9.335652351379,1.576967954636,120,0,0,5342,0,0,0),
    (@guid+57,30752,622,1,1,0,0,15.602286338806,27.984838485718,9.937685966492,1.596603035927,120,0,0,5342,0,0,0),
    (@guid+58,31261,622,1,1,0,0,1.117851018906,-0.205796003342,34.188625335693,6.281500816345,120,5,0,37800,31952,0,1),
    (@guid+59,32301,622,1,1,0,0,-18.418416976929,-0.101889997721,7.038712978363,0.002253999934,120,5,0,630000,0,0,1),
    (@guid+60,30351,623,1,1,0,0,-31.944978713989,-5.015450000763,20.784225463867,3.149561882019,120,0,0,5342,0,0,0),
    (@guid+61,30351,623,1,1,0,0,-36.675506591797,7.102739810944,20.447175979614,4.673229217529,120,0,0,5342,0,0,0),
    (@guid+62,30351,623,1,1,0,0,-36.512866973877,-7.719221115112,20.44811630249,1.539495944977,120,0,0,5342,0,0,0),
    (@guid+63,30867,623,1,1,0,0,-29.476020812988,-22.241590499878,22.565013885498,4.476902008057,120,0,0,5342,0,0,0),
    (@guid+64,30867,623,1,1,0,0,-30.017967224121,21.968641281128,22.568344116211,1.618052005768,120,0,0,5342,0,0,0),
    (@guid+65,30350,623,1,1,0,0,16.872840881348,-4.702257156372,20.4345703125,2.591938018799,120,0,0,5342,0,0,0),
    (@guid+66,30352,623,1,1,0,0,17.000909805298,3.955290079117,20.432283401489,3.235956907272,120,0,0,16026,0,0,0),
    (@guid+67,30351,623,1,1,0,0,1.566637039185,9.575836181641,20.455598831177,3.173124074936,120,0,0,5342,0,0,0),
    (@guid+68,30351,623,1,1,0,0,1.161906003952,-9.455794334412,20.456811904907,3.07102394104,120,0,0,5342,0,0,0),
    (@guid+69,30394,623,1,1,0,0,-62.097999572754,-0.254698008299,23.488361358643,0.459574013948,120,0,0,5342,0,0,0),
    (@guid+70,30352,623,1,1,0,0,-47.864753723145,-0.104595996439,20.633947372437,6.275434017181,120,0,0,16026,0,0,0),
    (@guid+71,30352,623,1,1,0,0,-17.134172439575,-4.014180183411,20.768703460693,2.92178106308,120,0,0,16026,0,0,0),
    (@guid+72,30352,623,1,1,0,0,-16.521732330322,3.985899925232,20.782850265503,3.094571113586,120,0,0,16026,0,0,0),
    (@guid+73,30867,623,1,1,0,0,-6.87132692337,22.425216674805,22.523990631104,1.358836054802,120,0,0,5342,0,0,0),
    (@guid+74,30351,623,1,1,0,0,1.405750989914,23.063282012939,22.552534103394,6.102642059326,120,0,0,5342,0,0,0),
    (@guid+75,30351,623,1,1,0,0,1.402271032333,-23.248649597168,22.552570343018,0.055066999048,120,0,0,5342,0,0,0),
    (@guid+76,30867,623,1,1,0,0,-7.929400920868,-22.360090255737,22.52024269104,4.877404212952,120,0,0,5342,0,0,0),
    (@guid+77,30352,623,1,1,0,0,49.882793426514,8.603118896484,40.081760406494,4.320153236389,120,0,0,16026,0,0,0),
    (@guid+78,30352,623,1,1,0,0,49.882793426514,8.603118896484,40.081760406494,4.320153236389,120,0,0,16026,0,0,0),
    (@guid+79,30352,623,1,1,0,0,49.537719726563,-7.38293504715,40.084545135498,1.948251962662,120,0,0,16026,0,0,0),
    (@guid+80,32302,623,1,1,0,0,49.615154266357,-1.341423034668,40.094509124756,3.703396081924,120,10,0,630000,0,0,1),
    (@guid+81,30867,623,1,1,0,0,35.575820922852,44.321231842041,25.032867431641,1.912909030914,120,0,0,5342,0,0,0),
    (@guid+82,30867,623,1,1,0,0,36.738540649414,-44.99348449707,25.032600402832,4.280885219574,120,0,0,5342,0,0,0),
    (@guid+83,26170,623,1,1,0,0,37.206974029541,-39.342662811279,25.029821395874,3.039954900742,120,0,0,67270,0,0,0),
    (@guid+84,32566,623,1,1,0,0,36.871784210205,-41.386714935303,25.030906677246,3.028175115585,120,0,0,11770,0,0,0),
    (@guid+85,31259,623,1,1,0,0,16.681299209595,-13.751999855042,20.519899368286,1.97966003418,120,5,0,37800,31952,0,1),
    (@guid+86,30347,623,1,1,0,0,29.137517929077,-7.266510009766,23.287969589233,0.118276000023,120,0,0,5342,0,0,0),
    (@guid+87,30392,623,1,1,0,0,30.103567123413,6.615145206451,23.286149978638,6.169766902924,120,0,0,5342,0,0,0),
    (@guid+88,30346,623,1,1,0,0,29.921300888062,-0.217026993632,9.622579574585,3.161689996719,120,0,0,5342,0,0,0),
    (@guid+89,30352,623,1,1,0,0,37.098373413086,6.300375938416,9.605645179749,3.19702911377,120,0,0,16026,0,0,0),
    (@guid+90,30352,623,1,1,0,0,37.42272567749,-5.96054983139,9.592584609985,3.154566049576,120,0,0,16026,0,0,0),
    (@guid+91,30380,623,1,1,0,0,3.537045001984,-20.302345275879,9.668937683105,1.559211015701,120,0,0,5342,0,0,0),
    (@guid+92,30380,623,1,1,0,0,-7.106276988983,-22.681499481201,9.675230026245,1.810539007187,120,0,0,5342,0,0,0),
    (@guid+93,30380,623,1,1,0,0,-18.080644607544,-22.905908584595,9.600997924805,1.386423945427,120,0,0,5342,0,0,0),
    (@guid+94,30380,623,1,1,0,0,-31.441848754883,-22.550535202026,9.593263626099,1.170439004898,120,0,0,5342,0,0,0),
    (@guid+95,30380,623,1,1,0,0,-38.369316101074,-20.460920333862,9.598937988281,0.934819996357,120,0,0,5342,0,0,0),
    (@guid+96,30380,623,1,1,0,0,-37.743618011475,20.568614959717,9.598355293274,4.524092197418,120,0,0,5342,0,0,0),
    (@guid+97,30380,623,1,1,0,0,-30.037464141846,22.732587814331,9.594893455505,4.614414215088,120,0,0,5342,0,0,0),
    (@guid+98,30380,623,1,1,0,0,-16.832860946655,23.03861618042,9.598322868347,4.598714828491,120,0,0,5342,0,0,0),
    (@guid+99,30380,623,1,1,0,0,-7.336326122284,22.699150085449,9.673589706421,4.630132198334,120,0,0,5342,0,0,0),
    (@guid+100,30380,623,1,1,0,0,4.671295166016,21.37247467041,9.678754806519,4.457344055176,120,0,0,5342,0,0,0),
    (@guid+101,30394,623,1,1,0,0,-12.58939743042,22.944141387939,9.591585159302,1.527811050415,120,0,0,5342,0,0,0),
    (@guid+102,30394,623,1,1,0,0,-12.550476074219,-23.064985275269,9.591282844543,4.661549091339,120,0,0,5342,0,0,0),
    (@guid+103,30380,623,1,1,0,0,-8.137690544128,-30.136011123657,0.101368002594,1.537986040115,120,0,0,5342,0,0,0),
    (@guid+104,30380,623,1,1,0,0,2.610099077225,-28.737651824951,0.101369000971,1.657668948174,120,0,0,5342,0,0,0),
    (@guid+105,30380,623,1,1,0,0,-25.856252670288,-30.076417922974,0.101368002594,1.564188957214,120,0,0,5342,0,0,0),
    (@guid+106,30380,623,1,1,0,0,-40.905303955078,-26.448431015015,0.827996015549,1.151854038239,120,0,0,5342,0,0,0),
    (@guid+107,30380,623,1,1,0,0,-40.616519927979,26.079559326172,1.203852057457,5.184881210327,120,0,0,5342,0,0,0),
    (@guid+108,30380,623,1,1,0,0,-25.460792541504,30.218050003052,-0.157758995891,4.760770797729,120,0,0,5342,0,0,0),
    (@guid+109,30380,623,1,1,0,0,-8.100893974304,30.036712646484,-0.157758995891,4.658668041229,120,0,0,5342,0,0,0),
    (@guid+110,30380,623,1,1,0,0,2.655055046082,28.762521743774,0.101368002594,4.466239929199,120,0,0,5342,0,0,0),
    (@guid+111,30394,623,1,1,0,0,-14.560642242432,-23.102851867676,-5.249726772308,0.08371900022,120,0,0,5342,0,0,0),
    (@guid+112,30345,623,1,1,0,0,-47.452793121338,-0.006912000012,-4.976480960846,3.115345954895,120,0,0,5342,0,0,0),
    (@guid+113,30352,623,1,1,0,0,-60.767959594727,0.235037997365,-5.268869876862,6.139129161835,120,0,0,16026,0,0,0),
    (@guid+114,30394,623,1,1,0,0,-47.45336151123,-2.858251094818,-5.218072891235,3.170324087143,120,0,0,5342,0,0,0),
    (@guid+115,30352,623,1,1,0,0,46.323638916016,13.215608596802,-2.067471027374,3.908602952957,120,0,0,16026,0,0,0),
    (@guid+116,30352,623,1,1,0,0,46.340564727783,-13.169553756714,-2.067434072495,2.45059299469,120,0,0,16026,0,0,0),
    (@guid+117,30394,623,1,1,0,361,-14.831734657288,24.201463699341,-5.253747940063,6.064527988434,25,0,0,5342,0,0,0);

    -- Four of the crew stand at an emote; the `creature` table has no column for it.
    INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
    (@guid+28,0,0,1,0,173,0,''),
    (@guid+32,0,0,1,0,173,0,''),
    (@guid+37,0,0,1,0,173,0,''),
    (@guid+38,0,0,1,0,173,0,'');

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
    UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5 WHERE `guid` = @guid+85 AND `map` = 623;
    UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` = @guid+88 AND `map` = 623;

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
