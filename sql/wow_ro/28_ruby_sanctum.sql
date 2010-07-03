INSERT INTO instance_template VALUES (724, 0, 5690, 3273, 534, 89, NULL, 'instance_ruby_sanctum', 1);
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus' WHERE `entry` = '39751';
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus_clone' WHERE `entry` = '39899';
UPDATE `creature_template` SET `ScriptName` = 'npc_xerestrasza' WHERE `entry` = '40429';
UPDATE `creature_template` SET `ScriptName` = 'boss_zarithrian' WHERE `entry` = '39746';
INSERT INTO access_requirement VALUES
(5690, 80, 80, 0, 0, 0, 0, 0, 0, '', 0, '', 'Ruby Sactum', 15);
INSERT INTO areatrigger_teleport VALUES
(5869, 'Kammer der Aspekte, Rubin Sanktum(Eingang)', 5690, 724, 3267.97, 533.6, 87.65, 3.047),
(5872, 'Kammer der Aspekte, Rubin Sanktum(Ausgang)', 0, 571, 3597.65, 201.19, -115.05, 0);
REPLACE INTO creature_ai_scripts VALUES
( 4041901, 40419, 0, 0, 100, 31, 2000, 2000, 5000, 5000, 11, 15284, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Assaulter Cleave'),
( 4041902, 40419, 0, 0, 100, 11, 5000, 5000, 10000, 10000, 11, 75417, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Assaulter Shockwave 1'),
( 4041903, 40419, 0, 0, 100, 21, 5000, 5000, 10000, 10000, 11, 75418, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Assaulter Shockwave 2'),

( 4042301, 40423, 0, 0, 100, 31, 1000, 1000, 7000, 7000, 11, 13737, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Commander Mortal Strike'),
( 4042302, 40423, 4, 0, 100, 31, 0, 0, 0, 0, 11, 75414, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Commander Rallying Shout'),

( 4041701, 40417, 0, 0, 100, 31, 3000, 3000, 15000, 15000, 11, 75413, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Invoker Flame Wave'),
( 4041702, 40417, 0, 0, 100, 11, 1000, 1000, 5000, 5000, 11, 75412, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Invoker Scorch'),
( 4041703, 40417, 0, 0, 100, 21, 1000, 1000, 5000, 5000, 11, 75419, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Invoker Scorch'),

( 3981401, 39814, 0, 0, 100, 11, 3000, 3000, 5000, 5000, 11, 74394, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Onyx Flamecaller'),
( 3981402, 39814, 0, 0, 100, 11, 10000, 10000, 10000, 10000, 11, 74392, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Onyx Flamecaller'),
( 3981401, 39814, 0, 0, 100, 21, 3000, 3000, 5000, 5000, 11, 74395, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Onyx Flamecaller'),
( 3981403, 39814, 0, 0, 100, 21, 10000, 10000, 10000, 10000, 11, 74393, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Onyx Flamecaller'),

( 4042101, 40421, 0, 0, 100, 31, 1000, 1000, 3000, 3000, 11, 15621, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,'Charscale Elite Skull Crack');
INSERT INTO creature_involvedrelation VALUES
(27990,26012),
(40429,26013),
(27990,26034);
REPLACE INTO creature_model_info
   (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`)
VALUES
   (31952, 3, 5, 2, 0),
   (32105, 1, 3, 2, 0),
   (32179, 1, 3, 2, 0),
   (32104, 1, 3, 2, 0),
   (32106, 1, 3, 2, 0),
   (31962, 1, 3, 2, 0),
   (31577, 1, 3, 2, 0),
   (31761, 1, 3, 2, 0);

-- Hack
UPDATE creature_model_info
SET bounding_radius = 50, combat_reach = 3
WHERE modelid = 12889;
INSERT INTO creature_questrelation VALUES
(16128,26012),
(27990,26013),
(40429,26034);
replace into `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `minlevel`, `maxlevel`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `baseattacktime`, `family`, `type`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `mingold`, `maxgold`, `Health_mod`, `Mana_mod`,`flags_extra`, `unit_class`, `exp`, `type_flags`, `movementId`, `mechanic_immune_mask`) values
('39747', '31577', '0', '0', '0', "Saviana Ragefire", "", '83', '83', '14', '14', '0', '1', '1.14286', '0.99', '1', '1000', '2000', '2000', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '300','1', '33', '1', '2', '76','191', '617299803' ),
('39746', '32179', '0', '0', '0', "General Zarithrian", "", '83', '83', '14', '14', '0', '1', '1.14286', '1.01', '1', '1000', '2000', '2000', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0','297', '1', '33', '1', '2', '76', '144', '617299799'),
('39899', '31761', '0', '0', '0', "Baltharus the Warborn", "", '83', '83', '14', '14', '0', '1', '1.14286', '1.04', '1', '1000', '2000', '2000', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0','250', '1', '33', '1', '2', '76', '171', '617299803'),
('39751', '31761', '0', '0', '0', "Baltharus the Warborn", "", '83', '83', '14', '14', '0', '1', '1.14286', '1.04', '1', '1000', '2000', '2000', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0','250','1', '33', '1', '2', '76', '171', '617299803'),
('39863', '31952', '0', '0', '0', "Halion", "The Twilight Destroyer", '83', '83','14', '14', '0', '1', '1.14286', '1.11', '1', '10000', '10000', '2000', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '800','1','33', '1', '2', '108', '150', '617299803');


replace into `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `minlevel`, `maxlevel`,`faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `baseattacktime`, `family`, `type`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `mingold`, `maxgold`, `Health_mod`, `Mana_mod`, `AIName`, `flags_extra`, `unit_class`, `exp`, `type_flags`, `movementId`) values
('40419', '14308', '0', '0', '0', "Charscale Assaulter", "", '82', '82','14', '14', '0', '1', '1.14286', '1.02', '1', '1000', '2000', '1500', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '50', '1', 'EventAI', '0', '1', '2', '72', '150'),
('40423', '27226', '0', '0', '0', "Charscale Commander", "", '82', '82','14', '14', '0', '1', '1.14286', '1.02', '1', '1000', '2000', '1500', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '80', '1', 'EventAI', '0', '1', '2', '72', '150'),
('40417', '27227', '0', '0', '0', "Charscale Invoker", "", '82', '82','14', '14', '0', '1', '1.14286', '1', '1', '1000', '2000', '1500', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '50', '12', 'EventAI', '0', '8', '2', '72', '150'),
('40421', '12891', '0', '0', '0', "Charscale Elite", "", '82', '82','14', '14', '0', '1', '1.14286', '0.98', '1', '1000', '2000', '1500', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '80', '1', 'EventAI', '0', '1', '2', '72', '150'),
('39814', '12889', '0', '0', '0', "Onyx Flamecaller", "", '82', '82','14', '14', '0', '1', '1.14286', '0.99', '1', '1000', '2000', '1500', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '15', '30', 'EventAI', '0', '8', '2', '72', '144');

replace into `creature_template` (`entry`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `minlevel`, `maxlevel`,`faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `baseattacktime`, `family`, `type`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `mingold`, `maxgold`, `Health_mod`, `Mana_mod`, `AIName`, `flags_extra`, `unit_class`, `exp`, `type_flags`, `movementId`) values
('40429', '31962', '0', '0', '0', "Sanctum Guardian Xerestrasza", "", '80', '80','2013', '2013', '1', '1', '1.14286', '1.11', '1', '1000', '2000', '1500', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '189', '832', '', '0', '1', '2', '4096', '0');

REPLACE INTO creature_template
   (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES
   (39794, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Zarithrian Spawn Stalker', '', NULL, 0, 60, 60, 0, 114, 114, 0, 1, 1.14286, 1, 0, 104, 138, 0, 252, 7.5, 2000, 0, 1, 33555200, 8, 0, 0, 0, 0, 0, 72, 106, 26, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 130, '', 11723);
SET @GUID = 150694;

INSERT INTO gameobject VALUES
(@GUID+1, 202347, 724, 15, 1, 3286.8, 533.392, 98.5718, 0, 0, 0, 0, 0, 100, 100, 1),
(@GUID+2, 202348, 724, 15, 1, 3286.8, 533.392, 98.5718, 0, 0, 0, 0, 0, 100, 100, 1),
(@GUID+3, 202349, 724, 15, 1, 3286.8, 533.392, 98.5718, 0, 0, 0, 0, 0, 100, 100, 1),
(@GUID+4, 202350, 724, 15, 1, 3286.8, 533.392, 98.5718, 0, 0, 0, 0, 0, 100, 100, 1),
(@GUID+5, 202347, 571, 15, 1, 3608.19, 186.17, -100.0, 2.1, 0, 0, 0, 0, 100, 100, 1),
(@GUID+6, 202348, 571, 15, 1, 3608.19, 186.17, -100.0, 2.1, 0, 0, 0, 0, 100, 100, 1),
(@GUID+7, 202349, 571, 15, 1, 3608.19, 186.17, -100.0, 2.1, 0, 0, 0, 0, 100, 100, 1),
(@GUID+8, 202350, 571, 15, 1, 3608.19, 186.17, -100.0, 2.1, 0, 0, 0, 0, 100, 100, 1);
INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (202794, 10, 1327, 'Twilight Portal', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75074, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203003, 10, 7398, 'Red Dragon Egg', '', '', '', 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.5, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203004, 10, 9483, 'Broken Red Dragon Egg', '', '', '',0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.5, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203005, 0, 9484, 'Fire Field', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203006, 0, 9485, 'Flame Walls', '', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203007, 0, 9482, 'Ruby Sanctum Halion Flame Ring', '', '', '', 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.6, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203034, 1, 9490, 'Burning Tree', '', '', '',  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.2, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203035, 1, 9490, 'Burning Tree', '', '', '',  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.2, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203036, 1, 9490, 'Burning Tree', '', '', '',  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.2, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203037, 1, 9490, 'Burning Tree', '', '', '',  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.2, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203079, 10, 7398, 'Red Dragon Egg (Large)', '', '', '',  0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.75, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203080, 10, 9483, 'Broken Red Dragon Egg (Large)', '', '', '',  0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.75, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203624, 0, 9624, 'Halion Twilight Ring', '', '', '',  1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.6, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203959, 31, 9041, 'Doodad_InstancePortal_Green_10Man01', '', '', '', 724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.73945, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203960, 31, 9040, 'Doodad_InstancePortal_Green_10Man_Heroic01', '', '', '',  724, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.73945, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203961, 31, 9042, 'Doodad_InstancePortal_Green_25Man01', '', '', '',  724, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.73945, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (203962, 31, 9043, 'Doodad_InstancePortal_Green_25Man_Heroic01', '', '', '',  724, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.73945, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (204051, 31, 9041, 'Doodad_InstancePortal_Green_10Man01', '', '', '',  724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.59985, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (204052, 31, 9040, 'Doodad_InstancePortal_Green_10Man_Heroic01', '', '', '',  724, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.59985, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (204053, 31, 9042, 'Doodad_InstancePortal_Green_25Man01', '', '', '', 724, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.59985, 0, 0, 0, 0, 0, 0);

INSERT INTO gameobject_template
   (`entry`,`type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`)
VALUES
   (204054, 31, 9043, 'Doodad_InstancePortal_Green_25Man_Heroic01', '', '','', 724, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.59985, 0, 0, 0, 0, 0, 0);
INSERT INTO quest_template
   (`entry`, `Method`, `QuestLevel`, `MinLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `RepObjectiveFaction`, `RepObjectiveValue`, `RepObjectiveFaction2`, `RepObjectiveValue2`, `NextQuestInChain`, `RewXPId`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewHonorAddition`, `RewHonorMultiplier`, `SrcItemId`, `QuestFlags`, `CharTitleId`, `PlayersSlain`, `BonusTalents`, `RewardArenaPoints`, `unk0`, `RewItemId1`, `RewItemCount1`, `RewItemId2`, `RewItemCount2`, `RewItemId3`, `RewItemCount3`, `RewItemId4`, `RewItemCount4`, `RewChoiceItemId1`, `RewChoiceItemCount1`, `RewChoiceItemId2`, `RewChoiceItemCount2`, `RewChoiceItemId3`, `RewChoiceItemCount3`, `RewChoiceItemId4`, `RewChoiceItemCount4`, `RewChoiceItemId5`, `RewChoiceItemCount5`, `RewChoiceItemId6`, `RewChoiceItemCount6`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValueId1`, `RewRepValueId2`, `RewRepValueId3`, `RewRepValueId4`, `RewRepValueId5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `Title`, `Objectives`, `Details`, `EndText`, `CompletedText`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOCount1`, `ReqSourceId1`, `ReqSourceCount1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOCount2`, `ReqSourceId2`, `ReqSourceCount2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOCount3`, `ReqSourceId3`, `ReqSourceCount3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount4`, `ReqSourceId4`, `ReqSourceCount4`, `ReqItemId1`, `ReqItemCount1`, `ReqItemId2`, `ReqItemCount2`, `ReqItemId3`, `ReqItemCount3`, `ReqItemId4`, `ReqItemCount4`, `ReqItemId5`, `ReqItemCount5`, `ReqItemId6`, `ReqItemCount6`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`)
VALUES
   (26012, 2, 82, 80, 4987, 62, 0, 0, 0, 0, 0, 26013, 1, 8000, 13500, 0, 0, 0, 0, 0, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Trouble at Wyrmrest', 'Speak with Krasus at Wyrmrest Temple in Dragonblight.', 'My old friend Krasus sends word of dire happenings at Wyrmrest, in Dragonblight. His missive was brief, but it seems that there has been some sort of attack on the Ruby Sanctum beneath the Temple.$B$BPressing business here in Dalaran keeps me from attending to the matter personally, but I have heard word of your exploits in the Lich King\'s Citadel and you are doubtless up to the task -- perhaps you could assist Krasus in my stead?', '', 'Speak with Krasus at Wyrmrest Temple in Dragonblight.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '');

INSERT INTO quest_template
   (`entry`, `Method`, `QuestLevel`, `MinLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `RepObjectiveFaction`, `RepObjectiveValue`, `RepObjectiveFaction2`, `RepObjectiveValue2`, `NextQuestInChain`, `RewXPId`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewHonorAddition`, `RewHonorMultiplier`, `SrcItemId`, `QuestFlags`, `CharTitleId`, `PlayersSlain`, `BonusTalents`, `RewardArenaPoints`, `unk0`, `RewItemId1`, `RewItemCount1`, `RewItemId2`, `RewItemCount2`, `RewItemId3`, `RewItemCount3`, `RewItemId4`, `RewItemCount4`, `RewChoiceItemId1`, `RewChoiceItemCount1`, `RewChoiceItemId2`, `RewChoiceItemCount2`, `RewChoiceItemId3`, `RewChoiceItemCount3`, `RewChoiceItemId4`, `RewChoiceItemCount4`, `RewChoiceItemId5`, `RewChoiceItemCount5`, `RewChoiceItemId6`, `RewChoiceItemCount6`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValueId1`, `RewRepValueId2`, `RewRepValueId3`, `RewRepValueId4`, `RewRepValueId5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `Title`, `Objectives`, `Details`, `EndText`, `CompletedText`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOCount1`, `ReqSourceId1`, `ReqSourceCount1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOCount2`, `ReqSourceId2`, `ReqSourceCount2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOCount3`, `ReqSourceId3`, `ReqSourceCount3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount4`, `ReqSourceId4`, `ReqSourceCount4`, `ReqItemId1`, `ReqItemCount1`, `ReqItemId2`, `ReqItemCount2`, `ReqItemId3`, `ReqItemCount3`, `ReqItemId4`, `ReqItemCount4`, `ReqItemId5`, `ReqItemCount5`, `ReqItemId6`, `ReqItemCount6`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`)
VALUES
   (26013, 2, 82, 80, 4987, 62, 0, 0, 0, 0, 0, 26034, 5, 80000, 135000, 0, 0, 0, 0, 0, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Assault on the Sanctum', 'Investigate the Ruby Sanctum beneath Wyrmrest Temple.', '$R, something terrible has transpired within the Ruby Sanctum beneath the Temple.$B$BThe entry to the Sanctum is in ruins, and its guardians violently slain. We sent scouts to investigate, but they have not returned. I cannot help but fear the worst.$B$BEnter the Ruby Sanctum and discover what has befallen the home of my flight. Once we have more information, we can plan our next steps accordingly.', '', 'Investigate the Ruby Sanctum beneath Wyrmrest Temple.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '');

INSERT INTO quest_template
   (`entry`, `Method`, `QuestLevel`, `MinLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `RepObjectiveFaction`, `RepObjectiveValue`, `RepObjectiveFaction2`, `RepObjectiveValue2`, `NextQuestInChain`, `RewXPId`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewHonorAddition`, `RewHonorMultiplier`, `SrcItemId`, `QuestFlags`, `CharTitleId`, `PlayersSlain`, `BonusTalents`, `RewardArenaPoints`, `unk0`, `RewItemId1`, `RewItemCount1`, `RewItemId2`, `RewItemCount2`, `RewItemId3`, `RewItemCount3`, `RewItemId4`, `RewItemCount4`, `RewChoiceItemId1`, `RewChoiceItemCount1`, `RewChoiceItemId2`, `RewChoiceItemCount2`, `RewChoiceItemId3`, `RewChoiceItemCount3`, `RewChoiceItemId4`, `RewChoiceItemCount4`, `RewChoiceItemId5`, `RewChoiceItemCount5`, `RewChoiceItemId6`, `RewChoiceItemCount6`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValueId1`, `RewRepValueId2`, `RewRepValueId3`, `RewRepValueId4`, `RewRepValueId5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `Title`, `Objectives`, `Details`, `EndText`, `CompletedText`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOCount1`, `ReqSourceId1`, `ReqSourceCount1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOCount2`, `ReqSourceId2`, `ReqSourceCount2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOCount3`, `ReqSourceId3`, `ReqSourceCount3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount4`, `ReqSourceId4`, `ReqSourceCount4`, `ReqItemId1`, `ReqItemCount1`, `ReqItemId2`, `ReqItemCount2`, `ReqItemId3`, `ReqItemCount3`, `ReqItemId4`, `ReqItemCount4`, `ReqItemId5`, `ReqItemCount5`, `ReqItemId6`, `ReqItemCount6`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`)
VALUES
   (26034, 2, 82, 80, 4987, 62, 0, 0, 0, 0, 0, 0, 7, 240000, 202500, 0, 0, 0, 0, 0, 200, 0, 0, 0, 0, 0, 49426, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Twilight Destroyer', 'Defeat Halion and repel the invasion of the Ruby Sanctum.', 'This was no reckless attack, but rather a carefully orchestrated strike against the heart of the Red Dragonflight.$B$BZarithrian, on the bluff over there, is overseeing the assault, but the true leader of this force is a brash and powerful Twilight dragon named Halion. Not since Dargonax has a full-grown spawn of Sinestra\'s twisted experiments been seen.$B$BSlay him, $N, and then when the invasion has been fully repelled, report to Krasus regarding all you have seen here.', '', 'Report back to Krasus atop Wyrmrest Temple.', 39863, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '');
REPLACE INTO script_texts (`entry`, `content_default`, `npc_entry`, `content_loc3`, `sound`, `type`, `language`) VALUES
( -1752008, "", 0, "Hilfe! Ich bin in diesem Baum gefangen! Helft mir!", 17490, 1, 7),
( -1752009, "", 0, "Danke", 17491, 1, 7),
( -1752010, "", 0, "Wir glaubten das Sanktum ist gut geschätzt, aber auf diese Art von Angriff waren wir nicht vorbereitet...", 17492, 0, 7),
( -1752011, "", 0, "Die Schwarzen Drachkin tauchten aus dem nichts auf und überfielen uns bevor wir reagieren konnten...", 17493, 0, 7),
( -1752012, "", 0, "Wir hatten keine Chance...Während meine Brüder starben, konnte ich mich hier zurückziehen und den Eingang versperren.", 17494, 0, 7),
( -1752013, "", 0, "Sie schlachteten uns mit kalter Effizienzs ab...Doch ihr wares Ziel schienen die Eier zu sein, welche sich im Sanktum befinden.", 17495, 0, 7),
( -1752014, "", 0, "Der Kommandant der Bodentruppen ist eine grausame Bestie namens Zarithrian. Doch ich fürchte größere Mächte sind am Werk...", 17496, 0,7 ),
( -1752015, "", 0, "Ich erblickte bei ihrem Angriff kurz ihren wahren Führer...einen schrecklichen ausgewachsenen Zwielichtdrachen.", 17497, 0, 7),
( -1752016, "", 0, "Ich kenne ihre genauen Pläne nicht, aber eines weiß ich: Sie dürfen keinen Erfolg haben!", 17498, 0, 7),

( -1752001, "Ah, the entertainment has arrived.", 0, "Ahh...Die Unterhaltung ist eingetroffen!", 17520, 1, 7),
( -1752002, "Baltharus leaves nobody alive!", 0, "Baltharus lässt niemanden am Leben!", 17521, 1, 7),
( -1752003, "This world has enough heroes.", 0, "Diese Welt hat genug Helden!", 17522, 1, 7),
( -1752004, "I..don't saw...that coming...", 0, "Das...habe ich...nicht..kommen sehen...", 17523, 1, 7),
( -1752005, "Twice the pain and half the fun.", 0, "Doppelter Schmerz, Halb so viel Spaß!", 17524, 1, 7),
( -1752006, "", 0, "Eure Macht schwindet, Uralte! Balt folgt ihr euren Freunden!", 17525, 1, 7),

( -1752017, "Alexstrasza has chosen capable allies... A pity that I must END YOU!", 0, "Alextrasza hat fähige Verbündete... Zu Schade, dass es hier mit euch ENDET!", 17512, 1, 7),
( -1752018, "You thought you stood a chance?", 0, "Ihr dachtet ihr könntet bestehen?", 17513, 1, 7),
( -1752019, "It's for the best.", 0, "Es ist zu eurem Besten.", 17514, 1, 7),
( -1752020, "HALION! I...", 0, "HALION! Ich...", 17515, 1, 7),
( -1752021, "Turn them to ashes, minions!", 0, "Äschert sie ein, Lakeien!", 17516, 1, 7);