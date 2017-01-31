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
    SET @cOldStructure = '03'; 
    SET @cOldContent = '030';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '031';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'q.11008_Fires_Over_Skettis';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'q.11008_Fires_Over_Skettis';

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
		
	
-- Add Missing Game Objects
DELETE FROM `gameobject` WHERE `guid` IN (300003, 300004, 300005, 300006, 300007, 300008, 300009, 300010, 300011, 300012, 300013, 300014);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('300003','185549','530','1','1','-3800.8','3789.62','314','6.0912','0','0','-0.0436197','0.999048','180','100','1'),
('300004','185549','530','1','1','-3799.02','3788.06','314.158','3.19395','0','0','0.993572','0.113203','180','100','1'),
('300005','185549','530','1','1','-3798.91','3790.61','313.852','3.63029','0','0','-0.0610485','0.998135','180','100','1'),
('300006','185549','530','1','1','-3641.79','3754.52','310.101','1.45284','0','0','-0.0663218','0.997798','180','100','1'), -- Start missing targets here
('300007','185549','530','1','1','-3645.24','3757.79','310.388','0.207979','0','0','0.103802','0.994598','180','100','1'),
('300008','185549','530','1','1','-3644.38','3760.09','310.156','6.016','0','0','0.133196','-0.99109','180','100','1'),
('300009','185549','530','1','1','-3712.25','3792.24','310.142','2.55553','0','0','-0.0663218','0.997798','180','100','1'),
('300010','185549','530','1','1','-3712.3','3796.46','310.15','3.62367','0','0','0.97109','-0.238712','180','100','1'),
('300011','185549','530','1','1','-3715.01','3796.77','310.24','5.29264','0','0','0.475274','-0.879838','180','100','1'),
('300012','185549','530','1','1','-3871.6','3780.4','348.89','4.27005','0','0','-0.756802','-0.653644','180','100','1'),
('300013','185549','530','1','1','-3875.84','3780.98','348.881','3.86949','0','0','-0.0663218','0.997798','180','100','1'),
('300014','185549','530','1','1','-3875.44','3765.05','348.977','2.10235','0','0','-0.262375','0.964966','180','100','1');

-- Add kill credit markers
DELETE FROM `creature` WHERE `guid` IN (151046, 151047, 151048, 151049, 151050, 151051, 151052, 151053, 151054);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('151046','22991','530','1','1','0','0','-3641.79','3754.52','310.101','1.45284','180','0','0','4120','0','0','0'),
('151047','22991','530','1','1','0','0','-3645.24','3757.79','310.388','0.207979','180','0','0','4120','0','0','0'),
('151048','22991','530','1','1','0','0','-3644.38','3760.09','310.156','6.016','180','0','0','4120','0','0','0'),
('151049','22991','530','1','1','0','0','-3712.25','3792.24','310.142','2.55553','180','0','0','4120','0','0','0'),
('151050','22991','530','1','1','0','0','-3712.3','3796.46','310.15','3.62367','180','0','0','4120','0','0','0'),
('151051','22991','530','1','1','0','0','-3715.01','3796.77','310.24','5.29264','180','0','0','4120','0','0','0'),
('151052','22991','530','1','1','0','0','-3871.6','3780.4','348.89','4.27005','180','0','0','4120','0','0','0'),
('151053','22991','530','1','1','0','0','-3875.84','3780.98','348.881','3.86949','180','0','0','4120','0','0','0'),
('151054','22991','530','1','1','0','0','-3875.44','3765.05','348.977','2.10235','180','0','0','4120','0','0','0');
 
    
    

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

