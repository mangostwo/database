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
    SET @cOldContent = '029';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '030';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'game_tele Northrend';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'game_tele Northrend';

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

-- Dump all Map 571 locations.
-- Add New game_tele location list.
-- Last part replaces current game_tele locations.

DELETE FROM `game_tele` WHERE `map` = 571;
INSERT INTO `game_tele` (`position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES
-- Dragonblight.
(3237.95,-692.443,166.896,1.427653,571,'Venomspite'),
(2866.742,-359.042,112.4631,5.8887,571,'NewHearthglen'),
(3143.49,1329.604,158.572,2.513843,571,'InduleVillage'),
(3492.6,2005.3599,64.862297,3.88753,571,'Starsrest'),
(3840.807,1524.62,90.787399,1.637359,571,'AgmarsHammer'),
(3975.474,2231.8144,153.5486,0.478894,571,'Icemistvillage'),
(3323.215,2717.2622,36.4676,5.184215,571,'MoonrestGardens'),
(4592.793,-1068.3724,165.4830,4.775457,571,'Lightstrust'),
(3707.2832,-856.4422,162.7807,2.307855,571,'Wintergardekeep'),
(4968.175,1230.611,228.446,5.822510,571,'Korkronvanguard'),
(4596.8837,1404.984,194.2768,2.18295,571,'FordragonHold'),
-- Howling Fjord.
(480.271,-5914.1674,308.6502,5.056108,571,'Explorersleagueoutpost'),
(-145.698,-3544.917,2.528925,1.890010,571,'Scalawagpoint'),
(1042.1105,-3832.71,163.078,0.118936,571,'EmberClutch'),
(1770.83,-4120.286,255.2787,0.046324,571,'Skorn'),
(2432.7128,-5114.053,275.999,0.470954,571,'Fortwildriver'),
(2707.594,-3638.5808,232.7227,2.293071,571,'Gjalerbron'),
(2112.659,-2977.0805,148.4772,0.592526,571,'ApothecaryCamp'),
(2041.080,-3171.68,139.483,4.814974,571,'SteelGate'),
(2340.59,-3266.16,154.199,5.799860,571,'Rivenwood'),
-- Grizzly Hills.
(2958.620,-2635.264,95.4534,2.918082,571,'Voldrune'),
(3257.54,-2305.1201,107.542,4.660030,571,'ConquestHold'),
(3456.469,-2778.559,200.4446,3.281723,571,'AmberpineLodge'),
(3840.65,-1963.9288,208.4755,0.371815,571,'GraniteSprings'),
(2759.889,-1920.025,4.42107,5.393435,571,'VentureBay'),
(4246.665,-2008.4881,223.9461,1.457028,571,'Zebhalak'),
(4312.553,-2491.3237,238.6372,3.807053,571,'Silverbrook'),
(4236.3452,-3199.462,305.8511,1.599981,571,'BlueSkyLogging'),
(4704.3813,-3835.2016,328.414,3.950681,571,'Ursoc\'sDen'),
(4022.585,-3820.9094,114.62,0.079648,571,'Grizzlemaw'),
(3853.892,-4550.9399,209.3157,1.684029,571,'CampOnewah'),
(4531.831,-5471.979,2.0825,5.377759,571,'BloodmoonIsle'),
(3598.969,-5055.09,193.409,5.567834,571,'DunArgol'),
(3505.741,-4486.5219,225.798737,2.505582,571,'HeartsBloodShrine'),
(3569.9611,-3769.549,254.6365,2.804032,571,'RageFangShrine'),
-- Zul'Drak.
(6516.999,-3981.098,484.899,1.237134,571,'Zol\'MazStronghold'),
(6367.126,-3241.909,388.769,5.805500,571,'AlterofRhunok'),
(5782.516,-3556.295,386.5,3.906403,571,'Zim\'Torga'),
(5338.164,-3791.649,371.346,2.225653,571,'AlterofHarkoa'),
(4976.161,-3376.074,289.436,5.249427,571,'Kolramas'),
(5795.289,-3018.495,286.301,1.950752,571,'AmphitheaterofAnguish'),
(6117.24,-2676.457,290.9238,0.303785,571,'AlterofSseratus'),
(5450.140,-2630.71,306.253,1.387983,571,'TheArgentStand'),
(4733.366,-2494.598,232.647,0.123486,571,'RavenclawLake'),
(5148.509,-2182.61,236.621,0.977384,571,'LightsBreach'),
(5198.49,-1590.623,239.231,4.388188,571,'ReliquaryofAngony'),
(5194.56,-1654.28,413.588,3.7153580,571,'Zeramus'),
(5217.323,-1321.978,241.942,5.901645,571,'EbonWatch'),
(5762.463,-1406.876,244.577,3.788933,571,'ThrymsEnd'),
-- Crytalsong Forest.
(5605.301,-694.586,206.624,2.724711,571,'SunreaversCommand'),
(5725.0405,306.3488,181.5932,5.552141,571,'ForlornWoods'),
(5744.091,1017.528,174.4798,3.386013,571,'VioletStand'),
(5744.091,1017.528,174.4798,3.386013,571,'TheDecrepitFlow'),
(5035.725,-5193.2967,225.39,5.199493,571,'WindrunnersOverlook'),
-- The Storm Peaks.
(6677.285,-231.62,945.4721,5.820759,571,'Frosthold'),
(7366.229,-3.3952,779.256,5.915788,571,'Valkyrion'),
(7421.3867,-528.345,1896.85,6.053215,571,'TempleofStorms'),
(6721.143,-1033.4495,799.291,0.337101,571,'SifreldarVillage'),
(6908.3242,-1592.2645,819.978,5.394274,571,'BrunnhildarVillage'),
(7474.012,-1896.394,1473.615,0.366149,571,'TempleofWinter'),
(7201.7661,-2721.1582,764.167,0.311956,571,'DunNiffelem'),
(7826.285,-2958.238,1258.928,3.496872,571,'CampTunka\'lo'),
(8287.3398,-2919.662,1062.8204,2.970651,571,'TheHowlingHollow'),
(7960.886,-2739.832,1137.5443,3.045943,571,'TempleofLife'),
(7800.804,-1720.3594,1275.280,5.680945,571,'TerraceoftheMakers'),
(7859.8305,-729.8622,1176.695,5.513652,571,'GromarshCrashSite'),
(7969.82,-170.293,866.0866,5.348719,571,'SnowdriftFlains'),
(7975.001,105.576,1028.021,4.414096,571,'Nidaverli'),
(8472.683,-333.842,906.484,2.957199,571,'BoldercragsRefude'),
(8586.987,-602.886,925.558,2.398780,571,'TempleofWisdom'),
(7991.81,-827.67,968.26,2.897250,571,'TheInventorsLibrary'),
(8469.52,-333.89,906.807,5.537899,571,'BouldergragsRefuge'),
-- Icecrown.
(6490.022,3427.728,595.7471,0.637728,571,'TheFleshwerks'),
(7060.033,4256.764,676.8793,4.512866,571,'BalargardeFortress'),
(7841.911,4689.507,0.2415,2.317675,571,'OnslaughtHarbor'),
(7924.5888,3559.592,631.583,1.485146,571,'Jotunheim'),
(8050.744,1962.278,500.312,1.299011,571,'Aldurthar'),
(9956.429,1233.411,67.512,5.155306,571,'HrothgarsLanding'),
(7253.64,1644.78,433.68,4.83412,571,'Ymirheim'),
(7855.27,2936.36,517.91,5.806416,571,'WeepingQuarry'),
-- Wintergrasp.
(5413.488,2857.156,418.675,5.408060,571,'WintergraspFortress'),
-- Sholazar Basin.
(5501.807,4748.947,-194.433,5.668952,571,'LakesideLanding'),
(5670.828,4561.297,-136.508,1.160767,571,'RainspeakerCanopy'),
(5576.896,4030.4531,0.9277,1.329627,571,'TheLifebloodPiller'),
(5747.81,3071.27,287.773,4.812870,571,'MakersOverlook'),
(5270.281,4525.28,-83.50,3.470609,571,'FrenzyheartHill'),
(4964.5,4575.338,148.899,1.154465,571,'TheSkyreachPillar'),
(5096.347,5326.8632,211.56,1.708156,571,'TheMosslightPillar'),
(4909.812,5848.6723,-59.58,0.412248,571,'KartaksHold'),
(5595.097,5831.576,-67.51,4.349476,571,'NesingwaryBaseCamp'),
(5774.686,5476.279,202.498,5.339066,571,'TheSuntouchedPillar'),
(6246.427,5804.016,-6.13,4.109919,571,'TheMakersPerch'),
(6203.647,5252.58,-97.61,3.293102,571,'BittertideLake'),
(5784.888,4933.435,-133.037,3.285251,571,'WildgrowthMangal'),
(6103.83,4515.8691,-79.095,1.0021000,571,'DeathsHandEncampment'),
(6197.096,4724.062,226.128,2.488044,571,'TheGlimmeringPillar'),
(6187.414,4986.884,-96.536,2.712669,571,'MistwhisperRefuge'),
(6534.378,4955.380,-55.88,4.521441,571,'TheSavageThicket'),
(6713.163,5136.073,-19.427,4.228496,571,'SpearbornEncampment'),
(6230.312,5869.204,52.79,4.138172,571,'TheStormwrightsShelf'),
(6434.785,4481.115,-58.298,5.846407,571,'TheBonefields'),
(5866.907,4121.496,-86.335,5.003681,571,'RainspeakerRapids'),
(6120.395,3882.953,25.192,5.620218,571,'TheAvalanche'),
-- Borean Tundra. 
(3587.252,6661.45,195.411,0.191750,571,'TransitusShield'),
(3851.617,6630.324,166.28,2.379080,571,'Coldarra'),
(4382.029,6105.600,0.353,4.138360,571,'WinterfinRetreat'),
(4132.647,6259.019,29.101,0.227078,571,'WinterfinCaverns'),
(4585.649,6354.24,33.589,3.015232,571,'GlimmerBay'),
(4591.88,5850.54,57.924,2.296605,571,'RuinsofEldra\'nath'),
(4516.59,5246.01,74.22,2.711502,571,'Magmoth'),
(3486.39,4562.41,-12.983,0.694596,571,'TheGeyserFields'),
(4312.39,4606.049,26.857,5.768273,571,'Talramas'),
(4233.29,4266.713,72.226,3.081402,571,'TheDensofDying'),
(3720.51,3707.33,47.249,5.736302,571,'TempleCityofEn\'kilah'),
(3764.45,3559.303,294.039,6.105443,571,'Naxxanar'),
(3807.63,3458.33,82.955,4.157660,571,'SpireofPain'),
(4031.47,3529.83,105.546,5.818791,571,'SpireofBlood'),
(4070.38,3718.668,92.6807,0.375981,571,'SpireofDecay'),
(3522.29,3261.066,24.97,1.997826,571,'Transborea'),
(3328.13,3689.65,32.435,0.095582,571,'TheWailingZiggurat'),
(3077.97,4553.02,37.29,2.227939,571,'TheFloodPlains'),
(2642.41,5387.61,32.862,4.179652,571,'Farshire'),
(1338.07,5523.17,5.325,5.930317,571,'RiplashRuins'),
(1989.24,5815.41,21.25,3.491656,571,'RiplashStrand'),
(2089.41,6436.65,20.883,5.832494,571,'EchoCove'),
(2542.36,6785.63,3.47,1.367927,571,'Palea'),
(2788.205,7006.245,5.039,4.445899,571,'WarsongJetty'),
(2922.43,6888.501,1.62,3.614890,571,'GarroshsLanding'),
(3323.19,6162.069,75.123,6.275856,571,'BerylPoint'),
(3585.97,5945.23,136.026,0.939073,571,'AmberLedge'),
(3963.65,5614.27,42.67,2.266397,571,'SteeljawsCaravan'),
(3954.89,5478.45,35.701,4.398230,571,'KawsRoost'),
(3641.45,5582.95,32.937,4.203970,571,'ColdrockQuarry'),
(3269.62,5595.64,49.35,3.469625,571,'LakeKum\'uya'),
(3203.57,5292.058,47.384,3.908662,571,'DEHTAEncampment'),
(2838.35,5651.31,45.65,5.369487,571,'BloodsporePlains');

-- Reapply current game_tele locations.
INSERT INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES
(455,3707.86,2150.23,36.76,3.22,571,'AzjolNerub'),
(655,3668.72,-1262.46,243.622,4.785,571,'Naxxramas'),
(1381,564.401,-4944.94,18.5962,5.36544,571,'Valgarde'),
(1382,424.405,-4548.76,245.652,5.37325,571,'NewAgamand'),
(1383,774.043,-2940.65,7.36477,1.41719,571,'Kamagua'),
(1384,1391.04,-3284.63,163.929,1.59391,571,'WestguardKeep'),
(1385,1942.86,-6167.11,23.724,2.64258,571,'VengeanceLanding'),
(1386,2469.09,-5086.4,282.921,2.07711,571,'FortWildervar'),
(1387,2649.82,-4362.69,276.885,5.15979,571,'CampWinterhoof'),
(1388,1259.33,-4852.02,215.763,3.48293,571,'UtgardePinnacle'),
(1389,1219.72,-4865.28,41.2479,0.313228,571,'UtgardeKeep'),
(1390,2213.95,5273.15,11.2565,5.89294,571,'ValianceKeep'),
(1391,2741.29,6097.16,76.9055,0.731543,571,'WarsongHold'),
(1392,4147.98,5278.79,24.7334,0.150308,571,'FizzcrankAirstrip'),
(1393,3781.81,6953.65,104.82,0.467432,571,'TheNexus'),
(1394,4488.76,5736.18,80.0769,5.45078,571,'Bor\'gorokOutpost'),
(1395,3071.85,4791.19,1.13476,5.76654,571,'Kaskala'),
(1396,2925.02,4065.63,1.46737,3.56739,571,'Unu\'pe'),
(1397,3464.17,4087.16,17.0561,2.02607,571,'Taunka\'leVillage'),
(1398,5804.15,624.771,647.767,1.64,571,'Dalaran'),
(1399,4103.36,264.478,50.5019,3.09349,571,'Dragonblight'),
(1400,3256.57,5278.23,40.8046,0.246367,571,'BoreanTundra'),
(1401,1902.15,-4883.91,171.363,3.11537,571,'HowlingFjord'),
(1402,4391.73,-3587.92,238.531,3.57526,571,'GrizzlyHills'),
(1403,5560.23,-3211.66,371.709,5.55055,571,'Zul\'Drak'),
(1404,6898.72,-4584.94,451.12,2.34455,571,'Gundrak'),
(1405,7527.14,-1260.89,919.049,2.0696,571,'StormPeaks'),
(1406,9049.37,-1282.35,1060.19,5.8395,571,'Ulduar'),
(1407,7253.64,1644.78,433.68,4.83412,571,'Icecrown'),
(1410,5453.72,2840.79,421.28,0,571,'VaultOfArchavon'),
(1411,4774.6,-2032.92,229.15,1.59,571,'DrakTharonKeep'),
(1412,4760.7,2143.7,423,1.13,571,'Wintergrasp'),
(1413,5323,4942,-133.5,2.17,571,'SholazarBasin'),
(1414,3516.96,270.17,-114.04,3.24,571,'TheObsidianSanctum'),
(1415,5696.73,507.4,652.97,4.03,571,'TheVioletHold'),
(1416,3604.33,192.201,-110.843,5.34857,571,'RubySanctum'),
(1417,3604.33,192.201,-110.843,5.34857,571,'TheRubySanctum'),
(1418,8374.07,794.042,547.921,6.22349,571,'ArgentTournamnetGrounds'),
(1419,5872.16,2108.36,636.042,3.27275,571,'IcecrownCitadel'),
(1420,8515.63,714.174,558.248,1.57298,571,'TrialOfTheCrusader'),
(1421,8588.42,791.888,558.236,3.23819,571,'TrialOfTheChampion'),
(1422,8447.44,2698.09,656.783,2.8392,571,'Shadowvault'),
(1423,8447.44,2698.09,656.783,2.8392,571,'Theshadowvault'),
(1424,6122.16,-1061.5,402.568,4.77853,571,'k3'),
(1426,5632.48,2016.71,798.27,4.73,571,'frozenhalls'),
(1427,2853.8,881.47,17.9317,2.49659,571,'MoakiHarbor');
    

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


