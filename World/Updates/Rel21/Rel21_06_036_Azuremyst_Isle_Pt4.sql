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
    SET @cOldContent = '035';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '06';
    SET @cNewContent = '036';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Azuremyst_Isle_Pt4';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Azuremyst_Isle_Pt4';

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

 -- Azuremyst Isle Pt.4

-- Duplicates
DELETE FROM creature WHERE guid IN (61301,61226,61307,61312,61310,61309,61236,61275,61228,61233,61235,61234,61271,61276,61247,61273,61240,61245,61242,61308,61251,61304,61239,61302,61237,61265,62030,62028,
62038,62032,62034,61692,61267,61262,61284,61263,61266,61253,61268,61280,61252,61270,61259,61254,61289,61258,61298,61297,61261,61300,61296,61257,61295,60858,60816,60906,60818,60873,60861,60903,60907,60875,
60865,60821,60876,60838,60869,60867,60878,60840,60911,60825,60904,86511);
DELETE FROM creature_addon WHERE guid IN (61301,61226,61307,61312,61310,61309,61236,61275,61228,61233,61235,61234,61271,61276,61247,61273,61240,61245,61242,61308,61251,61304,61239,61302,61237,61265,62030,62028,
62038,62032,62034,61692,61267,61262,61284,61263,61266,61253,61268,61280,61252,61270,61259,61254,61289,61258,61298,61297,61261,61300,61296,61257,6129560858,60816,60906,60818,60873,60861,60903,60907,60875,60865,
60821,60876,60838,60869,60867,60878,60840,60911,60825,60904,86511);
DELETE FROM creature_movement WHERE id IN (61301,61226,61307,61312,61310,61309,61236,61275,61228,61233,61235,61234,61271,61276,61247,61273,61240,61245,61242,61308,61251,61304,61239,61302,61237,61265,62030,62028,
62038,62032,62034,61692,61267,61262,61284,61263,61266,61253,61268,61280,61252,61270,61259,61254,61289,61258,61298,61297,61261,61300,61296,61257,61295,60858,60816,60906,60818,60873,60861,60903,60907,60875,60865,60821,
60876,60838,60869,60867,60878,60840,60911,60825,60904,86511);
DELETE FROM game_event_creature WHERE guid IN (61301,61226,61307,61312,61310,61309,61236,61275,61228,61233,61235,61234,61271,61276,61247,61273,61240,61245,61242,61308,61251,61304,61239,61302,61237,61265,62030,62028,
62038,62032,62034,61692,61267,61262,61284,61263,61266,61253,61268,61280,61252,61270,61259,61254,61289,61258,61298,61297,61261,61300,61296,61257,61295,60858,60816,60906,60818,60873,60861,60903,60907,60875,60865,60821,
60876,60838,60869,60867,60878,60840,60911,60825,60904,86511);
DELETE FROM game_event_creature_data WHERE guid IN (61301,61226,61307,61312,61310,61309,61236,61275,61228,61233,61235,61234,61271,61276,61247,61273,61240,61245,61242,61308,61251,61304,61239,61302,61237,61265,62030,62028,
62038,62032,62034,61692,61267,61262,61284,61263,61266,61253,61268,61280,61252,61270,61259,61254,61289,61258,61298,61297,61261,61300,61296,61257,61295,60858,60816,60906,60818,60873,60861,60903,60907,60875,60865,60821,
60876,60838,60869,60867,60878,60840,60911,60825,60904,86511);
DELETE FROM creature_battleground WHERE guid IN (61301,61226,61307,61312,61310,61309,61236,61275,61228,61233,61235,61234,61271,61276,61247,61273,61240,61245,61242,61308,61251,61304,61239,61302,61237,61265,62030,62028,
62038,62032,62034,61692,61267,61262,61284,61263,61266,61253,61268,61280,61252,61270,61259,61254,61289,61258,61298,61297,61261,61300,61296,61257,61295,60858,60816,60906,60818,60873,60861,60903,60907,60875,60865,60821,
60876,60838,60869,60867,60878,60840,60911,60825,60904,86511);
DELETE FROM creature_linking WHERE guid IN (61301,61226,61307,61312,61310,61309,61236,61275,61228,61233,61235,61234,61271,61276,61247,61273,61240,61245,61242,61308,61251,61304,61239,61302,61237,61265,62030,62028,
62038,62032,62034,61692,61267,61262,61284,61263,61266,61253,61268,61280,61252,61270,61259,61254,61289,61258,61298,61297,61261,61300,61296,61257,61295,60858,60816,60906,60818,60873,60861,60903,60907,60875,60865,
60821,60876,60838,60869,60867,60878,60840,60911,60825,60904,86511)
OR master_guid IN (61301,61226,61307,61312,61310,61309,61236,61275,61228,61233,61235,61234,61271,61276,61247,61273,61240,61245,61242,61308,61251,61304,61239,61302,61237,61265,62030,62028,
62038,62032,62034,61692,61267,61262,61284,61263,61266,61253,61268,61280,61252,61270,61259,61254,61289,61258,61298,61297,61261,61300,61296,61257,61295,60858,60816,60906,60818,60873,60861,60903,
60907,60875,60865,60821,60876,60838,60869,60867,60878,60840,60911,60825,60904,86511);

-- Temper
-- possition corrected
UPDATE creature SET position_x = -3281.537598, position_y = -12928.379883, position_z = 9.883272, orientation = 1.213798 WHERE guid = 61720;

-- Siltfin Murlocks
UPDATE creature SET position_x = -3111.356445, position_y = -11948.715820, position_z = 1.786047 WHERE guid = 60815;
UPDATE creature SET position_x = -3191.357910, position_y = -11908.882813, position_z = 2.184604 WHERE guid = 60817;
UPDATE creature SET position_x = -3206.681885, position_y = -11889.676758, position_z = 1.547595 WHERE guid = 60860;
UPDATE creature SET position_x = -3309.920410, position_y = -11880.355469, position_z = 1.236242 WHERE guid = 60833;
UPDATE creature SET position_x = -3435.718750, position_y = -11912.351563, position_z = 1.454054 WHERE guid = 60836;

-- Murgurgula
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 62989;
DELETE FROM creature_movement WHERE id = 62989;
UPDATE creature_template SET MovementType = 2 WHERE entry = 17475;
DELETE FROM creature_movement_template WHERE entry = 17475;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17475,1,-3378.02,-11918.5,3.35502, 0, 0,0.833669, 0, 0),
(17475,2,-3364.13,-11897,1.79093, 0, 0,0.679731, 0, 0),
(17475,3,-3352.22,-11887.8,0.884004, 0, 0,0.518724, 0, 0),
(17475,4,-3338.67,-11882.7,1.38813, 0, 0,0.169222, 0, 0),
(17475,5,-3305.63,-11883.2,1.41506, 0, 0,6.25606, 0, 0),
(17475,6,-3263.73,-11885.8,1.17472, 0, 0,6.2325, 0, 0),
(17475,7,-3217.82,-11888.1,1.40486, 0, 0,6.07149, 0, 0),
(17475,8,-3189.26,-11896.8,1.29253, 0, 0,5.97725, 0, 0),
(17475,9,-3155.32,-11909.5,1.94541, 0, 0,5.92227, 0, 0),
(17475,10,-3136.6,-11918.9,1.80227, 0, 0,5.77697, 0, 0),
(17475,11,-3116.09,-11939.1,1.79153, 0, 0,5.3725, 0, 0),
(17475,12,-3135.78,-11919.7,1.86409, 0, 0,2.61182, 0, 0),
(17475,13,-3175.88,-11900.5,1.37822, 0, 0,2.84351, 0, 0),
(17475,14,-3219.13,-11889,1.46368, 0, 0,3.08699, 0, 0),
(17475,15,-3247.34,-11886.3,0.87759, 0, 0,3.07913, 0, 0),
(17475,16,-3284.99,-11884.3,1.18204, 0, 0,3.10662, 0, 0),
(17475,17,-3323.19,-11881.6,1.0721, 0, 0,3.10662, 0, 0),
(17475,18,-3341.64,-11884.6,1.31528, 0, 0,3.49932, 0, 0),
(17475,19,-3362.57,-11895.2,1.58993, 0, 0,3.91558, 0, 0),
(17475,20,-3371.74,-11907,2.66572, 0, 0,4.1944, 0, 0),
(17475,21,-3378.06,-11917.9,3.24772, 0, 0,3.81505, 0, 0),
(17475,22,-3385.01,-11923,3.56976, 0, 0,3.54094, 0, 0),
(17475,23,-3401.84,-11925.1,3.55565, 0, 0,2.9566, 0, 0),
(17475,24,-3435.23,-11911.2,1.31628, 0, 0,2.71313, 0, 0),
(17475,25,-3467.63,-11891,0.611871, 0, 0,2.74847, 0, 0),
(17475,26,-3487.55,-11884.3,0.907164, 0, 0,2.96446, 0, 0),
(17475,27,-3512.39,-11875.5,1.29932, 0, 0,2.41546, 0, 0),
(17475,28,-3524.65,-11862.9,1.37204, 0, 0,2.23875, 0, 0),
(17475,29,-3529.55,-11851,0.80154, 0, 0,1.80678, 0, 0),
(17475,30,-3527.16,-11837.8,0.298753, 0, 0,1.24129, 0, 0),
(17475,31,-3529.07,-11853.1,1.00535, 0, 0,4.92088, 0, 0),
(17475,32,-3521.42,-11868.3,1.61523, 0, 0,5.48558, 0, 0),
(17475,33,-3507.08,-11879.1,1.48146, 0, 0,5.80131, 0, 0),
(17475,34,-3477.28,-11887.3,0.681661, 0, 0,5.8822, 0, 0),
(17475,35,-3460.58,-11895.2,0.81699, 0, 0,5.72041, 0, 0),
(17475,36,-3435.67,-11910.5,1.26091, 0, 0,5.89319, 0, 0),
(17475,37,-3392.72,-11924.6,3.91311, 0, 0,6.17986, 0, 0);

-- Blood Crystal
-- correct size
UPDATE gameobject_template SET size = 3 WHERE entry = 181748;  
    

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

