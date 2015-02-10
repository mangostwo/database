-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_14_missing_spell_scripts';

  -- Set the new revision string
  SET @cNewRev = 'required_20000_15_missing_gossips';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

 
  -- Only Proceed if the old values match
  IF @cThisRev = @cOldRev THEN
    -- Make this all a single transaction
    START TRANSACTION;

    -- Apply the Version Change from Old Version to New Version
    SET @query = CONCAT('ALTER TABLE db_version CHANGE COLUMN ',@cOldRev, ' ' ,@cNewRev,' bit;');
    PREPARE stmt1 FROM @query;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
    -- The Above block is required for making table changes

    -- -- -- -- Normal Update / Insert / Delete statements will go here  -- -- -- -- --
    
DELETE FROM `gossip_menu` WHERE `entry` IN (140, 543, 542, 6030, 2581, 3050, 2985, 4081, 6029, 6121, 6448, 6449, 6450, 6535, 7198, 7570, 7946, 7684, 9942, 7962, 7962, 8036, 8007, 8113, 8115, 8242, 8373, 8671, 8685, 8689, 8690, 8691, 6451, 6561, 6560, 6559, 6600, 8677, 8707, 8709, 8706, 8708, 9374, 9376, 9382, 9365, 9410, 9380, 9395, 9363, 9412, 9361, 9359, 9371, 9355, 9383, 9413, 9373, 9368, 9378, 9396, 9372, 9411, 9381, 9358, 9356, 9353, 9375, 9352, 9366, 9370, 9367, 9393, 9406, 9354, 9386, 9389, 9390, 9391, 9392, 9394, 9397, 9398, 9400, 9402, 9404, 9407, 9414, 10111, 9387, 9360, 10238, 10240, 10230, 10227, 10956, 11091, 9388, 9399, 9405, 9377, 10234, 10233, 10237, 10243);

INSERT INTO `gossip_menu` (`entry`,`text_id`,`script_id`,`condition_id`) 
VALUES 
(140, 68, 0, 0), 
(542, 1059, 0, 0), 
(543, 1060, 0, 0), 
(2581, 3273, 0, 0), 
(2985, 3677, 0, 0), 
(3050, 3273, 0, 0), 
(4081, 4974, 0, 0), 
(6029, 68, 0, 0), 
(6030, 68, 0, 0), 
(6121, 68, 0, 0), 
(6448, 7669, 0, 0), 
(6449, 7670, 0, 0), 
(6450, 7673, 0, 0), 
(6451, 7674, 0, 0), 
(6535, 7737, 0, 1801), 
(6535, 7738, 0, 1802), 
(6559, 7770, 0, 0), 
(6560, 7770, 0, 0), 
(6561, 7770, 0, 0), 
(6600, 68, 0, 0), 
(7198, 8479, 0, 0), 
(7570, 9197, 0, 0), 
(7684, 9373, 0, 0), 
(7946, 9752, 0, 0), 
(7962, 68, 0, 0), 
(8007, 9872, 0, 0), 
(8036, 9922, 0, 0), 
(8036, 10045, 0, 450), 
(8113, 9922, 0, 0), 
(8113, 10045, 0, 452), 
(8115, 9922, 0, 0), 
(8115, 10045, 0, 453), 
(8242, 10257, 0, 0), 
(8373, 10448, 0, 0), 
(8671, 10909, 0, 0), 
(8671, 10951, 0, 382), 
(8677, 10913, 0, 0), 
(8677, 10921, 0, 363), 
(8685, 10931, 0, 0), 
(8685, 10932, 0, 382), 
(8689, 10931, 0, 0), 
(8689, 10932, 0, 382), 
(8690, 10931, 0, 0), 
(8690, 10932, 0, 382), 
(8691, 10931, 0, 0), 
(8691, 10932, 0, 382), 
(8706, 10955, 0, 383), 
(8707, 10955, 0, 383), 
(8708, 10955, 0, 383), 
(8709, 10955, 0, 383), 
(9352, 12377, 0, 0), 
(9353, 12374, 0, 0), 
(9354, 12377, 0, 0), 
(9355, 12374, 0, 0), 
(9356, 12374, 0, 0), 
(9358, 12374, 0, 0), 
(9359, 12374, 0, 0), 
(9360, 12374, 0, 0), 
(9361, 12374, 0, 0), 
(9363, 12374, 0, 0), 
(9365, 12374, 0, 0), 
(9366, 12374, 0, 0), 
(9367, 12374, 0, 0), 
(9368, 12374, 0, 0), 
(9370, 12374, 0, 0), 
(9371, 12374, 0, 0), 
(9372, 12374, 0, 0), 
(9373, 12374, 0, 0), 
(9374, 12374, 0, 0), 
(9375, 12374, 0, 0), 
(9376, 12374, 0, 0), 
(9377, 12374, 0, 0), 
(9378, 12374, 0, 0), 
(9380, 12374, 0, 0), 
(9381, 12374, 0, 0), 
(9382, 12374, 0, 0), 
(9383, 12374, 0, 0), 
(9386, 12377, 0, 0), 
(9387, 12377, 0, 0), 
(9388, 12377, 0, 0), 
(9389, 12377, 0, 0), 
(9390, 12377, 0, 0), 
(9391, 12377, 0, 0), 
(9392, 12377, 0, 0), 
(9393, 12377, 0, 0), 
(9394, 12377, 0, 0), 
(9395, 12377, 0, 0), 
(9396, 12377, 0, 0), 
(9397, 12377, 0, 0), 
(9398, 12377, 0, 0), 
(9399, 12377, 0, 0), 
(9400, 12377, 0, 0), 
(9402, 12377, 0, 0), 
(9404, 12377, 0, 0), 
(9405, 12377, 0, 0), 
(9406, 12377, 0, 0), 
(9407, 12377, 0, 0), 
(9410, 12377, 0, 0), 
(9411, 12377, 0, 0), 
(9412, 12377, 0, 0), 
(9413, 12377, 0, 0), 
(9414, 12657, 0, 0), 
(9942, 68, 0, 0), 
(10111, 13906, 0, 0), 
(10227, 12377, 0, 0), 
(10230, 12377, 0, 0), 
(10233, 12377, 0, 0), 
(10234, 12377, 0, 0), 
(10237, 12377, 0, 0), 
(10238, 12377, 0, 0), 
(10240, 12377, 0, 0), 
(10243, 12377, 0, 0), 
(10956, 15221, 0, 0), 
(11091, 15432, 0, 0);

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    
    -- If we get here ok, commit the changes
    IF bRollback = TRUE THEN
      ROLLBACK;
      SELECT '* UPDATE FAILED *' AS 'Status',@cThisRev AS 'DB is on Version';
    ELSE
      COMMIT;
      SELECT '* UPDATE COMPLETE *' AS 'Status',@cNewRev AS 'DB is now on Version';
    END IF;
  ELSE
    SELECT '* UPDATE SKIPPED *' AS 'Status',@cOldRev AS 'Required Version',@cThisRev AS 'Found Version';
  END IF;

END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;
