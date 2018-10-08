-- Adding a security group column to the characters table:
-- This column is used to store the character-wide security group (default is 0 for players)
ALTER TABLE `character2`.`characters` 
ADD COLUMN `securitygroup` INT NULL DEFAULT '0' COMMENT 'Character-wide security group (set to 0 for players)' AFTER `playerFlags`;
