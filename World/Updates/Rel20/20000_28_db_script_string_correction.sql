-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_27_Terl_Arakor_Wetlands_gossip_text'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_28_db_script_string_correction';

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

    
    -- ============ Records changed in order to tie in with Zero and One ============ --
    
    -- remove original entries 2000000011, 2000000012, and 2000000013 (these entry values are in use already on Zero)
    DELETE FROM db_script_string WHERE entry IN (2000000011, 2000000012, 2000000013, 2000000404, 2000000405, 2000000406);
    -- set to new entry values: 2000000404, 2000000405, 2000000406 as per MaNGOS One
    INSERT INTO db_script_string (entry, content_default, sound, type, language, emote) VALUES 
    ('2000000404', 'Did you find something fun to chase around, Twinkle? I bet you did!', '0', '0', '0', '1');
    ('2000000405', 'It\'s just you and me, Twinkle. Daddy\'s not going to be coming home.', '0', '0', '0', '1');
    ('2000000406', 'I wonder how far this would launch that white cat...', '0', '0', '0', '0');

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