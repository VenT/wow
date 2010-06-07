-- Temp fix for some quests

-- Death Knight Starting Zone
-- Into the Realm of Shadows
UPDATE `quest_template` SET `method`='0' WHERE `entry`='12687';
-- Behind Scarlet Lines
UPDATE `quest_template` SET `PrevQuestId`='-12720'  WHERE `entry`='12723';

