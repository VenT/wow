UPDATE `creature_template` SET `VehicleId` = 0 WHERE `entry` = 33214;
-- Ulduar crash fixes
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=33142;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=33139;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=34111;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=34224;

-- Leviathan Torret 33139
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry`=33139;
-- Leviathan Torret 33142
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry`=33142;
UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` = 33118;

DELETE FROM gameobject WHERE id = '194905';
INSERT INTO gameobject VALUES 
( 150248, 194905, 603, 1,1,148.011, 53, 410.73, 3.1415, 0, 0, 0.999666, 0.0258449, 300, 0, 1),
( 150249, 194905, 603, 1,1,148.011, 13.09, 410.73, 3.1415, 0, 0, 0.999666, 0.0258449, 300, 0, 1),
( 150250, 194905, 603, 1,1,148.011, -16.9589, 410.73, 3.1415, 0, 0, 0.999998, -0.00203387, 300, 0, 1),
( 150251, 194905, 603, 1,1,148.011, -56.8689, 410.73, 3.1415, 0, 0, 0.999998, -0.00203387, 300, 0, 1),
( 150252, 194905, 603, 1,1,148.011, -86.031, 410.73, 3.1415, 0, 0, 0.999978, 0.00660518, 300, 0, 1),
( 150253, 194905, 603, 1,1,148.011, -125.941, 410.73, 3.1415, 0, 0, 0.999978, 0.00660518, 300, 0, 1);
DELETE FROM `creature_template` WHERE `entry` IN (33115);
INSERT INTO `creature_template` VALUES
('33115','0','0','0','0','0','13069','0','0','0','Leviathan trigger','',NULL,'0','83','83','2','16','16','0','2','2','1','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','flame_leviathan_trigger','0');

DELETE FROM creature WHERE `id` IN (33115, 33060, 33062, 33109);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES (33115,603,1,1,0,0,-784.969,-135.608,429.774,0.351076,480000,0,0,3458360,279750,0,0);
DELETE FROM `creature_template` WHERE `entry` IN (33240);
DELETE FROM `creature` WHERE `guid` IN (137479, 137480);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES('33240','33240','0','0','0','0','28517','0','0','0','Ulduar Colossus','','','0','80','80','2','1692','1692','0','1.2','1.14286','1','1','422','586','0','642','7.5','2000','0','1','32832','0','0','0','0','0','0','345','509','103','5','524352','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','125','1','1','0','0','0','0','0','0','0','124','1','0','0','0','mob_colossus','11403');

DELETE FROM `creature` WHERE `id`=33113;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33113, 603, 1, 1, 0, 0, 435.89, -8.417, 409.886, 3.12723, 480000, 0, 0, 23009250, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33685510, `type_flags` = 0 WHERE `entry` = 34286;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_watcher' WHERE `entry` = 33453;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_sentinel' WHERE `entry` = 33846;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_guardian' WHERE `entry` = 33388;
UPDATE `creature_template` SET `ScriptName` = 'mob_devouring_flame' WHERE `entry` = 34188;
UPDATE `creature_template` SET `ScriptName` = 'npc_expedition_commander_ulduar' WHERE `entry` = 33210;
UPDATE `creature_template` SET `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;
UPDATE `creature_template` SET `unit_flags` = 33685506 WHERE `entry` IN (33245,33233);
DELETE FROM `creature` WHERE `id`=33186;
DELETE FROM `creature` WHERE `guid` IN (137582, 136768, 136769, 136055, 136056) OR `id` IN (33632, 33802);
UPDATE `creature_template` SET `unit_flags` = 33685510 WHERE `entry` = 33809;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33661;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `ScriptName` = 'mob_focused_eyebeam' WHERE `entry` IN (33632, 33802);
UPDATE `creature_template` SET `ScriptName` = 'mob_left_arm' WHERE `entry` = 32933;
UPDATE `creature_template` SET `ScriptName` = 'mob_right_arm' WHERE `entry` = 32934;
UPDATE `creature_template` SET `ScriptName` = 'boss_steelbreaker' WHERE `entry` = 32867;
UPDATE `creature_template` SET `ScriptName` = 'boss_runemaster_molgeim' WHERE `entry` = 32927;
UPDATE `creature_template` SET `ScriptName` = 'boss_stormcaller_brundir' WHERE `entry` = 32857;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33051, 33691, 33689);
UPDATE creature_template SET faction_A=16, faction_H=16, scriptname='mob_rune_of_power' WHERE entry = 33705;
UPDATE creature_template SET faction_A=16, faction_H=16, scriptname='mob_lightning_elemental', difficulty_entry_1 = 33689 WHERE entry = 32958;
UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'npc_keeper_norgannon' WHERE `entry` = 33686;
DELETE FROM `creature_template` WHERE `entry`=33115;
DELETE FROM creature WHERE `id`=33115;
DELETE FROM `creature` WHERE `id`=33186;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33186, 603, 1, 1, 0, 0, 587.073, -203.205, 441.237, 1.60532, 604800, 0, 0, 3555975, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33554438 WHERE `entry` = 33184;
UPDATE `creature_template` SET `ScriptName` = 'boss_freya' WHERE `entry` =32906;
UPDATE `creature_template` SET `unit_flags` = 393220, `ScriptName` = 'creature_eonars_gift' WHERE `entry` =33228;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33685508, `ScriptName` = 'creature_nature_bomb' WHERE `entry` =34129;
UPDATE `creature_template` SET `unit_class` = 2, `ScriptName` = 'creature_detonating_lasher' WHERE `entry` =32918;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_conservator' WHERE `entry` =33203;
UPDATE `creature_template` SET `unit_flags` = 33686022, `ScriptName` = 'creature_healthy_spore' WHERE `entry` =33215;
UPDATE `creature_template` SET `ScriptName` = 'creature_storm_lasher' WHERE `entry` =32919;
UPDATE `creature_template` SET `ScriptName` = 'creature_snaplasher' WHERE `entry` =32916;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_water_spirit' WHERE `entry` =33202;

DELETE FROM `creature` WHERE `map` = 136607;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62532;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(64321, -62532, 1, 'Potent Pheromones ward off the Conservator''s Grip'),
(62619, -62532, 1, 'Pheromones ward off the Conservator''s Grip');
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33686022, `ScriptName` = 'creature_unstable_sun_beam' WHERE `entry` = 33050;
DELETE FROM `gameobject` WHERE `id` = '194905';
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('35528','194905','603','1','1','401.308','-13.8236','409.524','3.14159','0','0','0','1','180','255','0');

UPDATE `creature_template` SET `speed_walk` = 0.5 WHERE `entry` = 33113;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 8, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;


UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32882, 32908, 32885, 33110);
UPDATE `creature_template` SET `unit_flags` = 0, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875);

UPDATE `creature` SET `spawndist` = 0 WHERE `guid` = 136384;
UPDATE `creature` SET `position_x` = 2135.078, `position_y` = -298.758, `orientation` = 1.61 WHERE `guid` = 136384;

DELETE FROM `creature` WHERE `id` IN (32882, 32908, 32885, 32879, 33140, 33141);
DELETE FROM `creature` WHERE `guid` IN (136490, 136695, 137584, 136434, 137585, 136433, 137583, 137586, 136435, 136274, 136436, 136816, 136725);

UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (32892, 32879, 32780, 33140, 33141);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

UPDATE `creature_template` SET `unit_flags` = 33686020 WHERE `entry` = 33378;

DELETE FROM `creature` WHERE `id` IN (33378, 32892);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136409, 33378, 603, 1, 1, 16925, 0, 2104.99, -233.484, 433.573, 5.49779, 604800, 0, 0, 12600, 0, 0, 1),
(136410, 33378, 603, 1, 1, 16925, 0, 2092.64, -262.594, 433.576, 6.26573, 604800, 0, 0, 12600, 0, 0, 1),
(136411, 33378, 603, 1, 1, 16925, 0, 2104.76, -292.719, 433.181, 0.785398, 604800, 0, 0, 12600, 0, 0, 1),
(136416, 33378, 603, 1, 1, 16925, 0, 2164.97, -293.375, 433.526, 2.35619, 604800, 0, 0, 12600, 0, 0, 1),
(136417, 33378, 603, 1, 1, 16925, 0, 2164.58, -233.333, 433.892, 3.90954, 604800, 0, 0, 12600, 0, 0, 1),
(136418, 33378, 603, 1, 1, 16925, 0, 2145.8, -222.196, 433.293, 4.45059, 604800, 0, 0, 12600, 0, 0, 1),
(136419, 33378, 603, 1, 1, 16925, 0, 2123.91, -222.443, 433.375, 4.97419, 604800, 0, 0, 12600, 0, 0, 1);

DELETE FROM `spell_script_target` WHERE `entry`=62016;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('62016','1','33378');

UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'mob_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'mob_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `ScriptName` = 'thorim_trap_bunny' WHERE `entry` IN (33725, 33282);
UPDATE `creature_template` SET `flags_extra` = 0, `ScriptName` = 'thorim_energy_source' WHERE `entry` = 32892;
UPDATE `creature_template` SET `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;

UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `flags_extra` = 2, `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33245;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33282;

UPDATE `creature_template` SET `vehicleId` = 336 WHERE `entry` = 33432; -- Leviathan Mk II
DELETE FROM creature WHERE id = 34071;
DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 7, 1, 'Leviathan Mk II turret');
UPDATE creature_template SET ScriptName = 'boss_mimiron' WHERE entry = 33350;
UPDATE creature_template SET ScriptName = 'boss_leviathan_mk' WHERE entry = 33432;
UPDATE creature_template SET ScriptName = 'boss_leviathan_mk_turret' WHERE entry = 34071;
UPDATE creature_template SET ScriptName = 'mob_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);



DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62475;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62475','9032','2','System Shutdown');

DELETE FROM areatrigger_scripts WHERE entry IN (5369, 5423);
INSERT INTO areatrigger_scripts VALUES
(5369,'at_RX_214_repair_o_matic_station'),
(5423,'at_RX_214_repair_o_matic_station');

UPDATE `gameobject` SET `position_x` = 130.553 WHERE `guid` = 55126;

-- Dalaran Teleport (Ulduar)
UPDATE `gameobject_template` SET `type` = 22, `data0` = 53141, `data2` = 1, `data3` = 1 WHERE `entry` = 194481;

DELETE FROM `creature` WHERE `id`=33672 AND guid IN (136552, 136553);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136553, 33672, 603, 1, 1, 28935, 0, -815.68, -197.498, 429.925, 5.525, 180, 0, 0, 9416, 8459, 0, 0);

-- Achievement The Antechamber of Ulduar
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10578, 10579, 10580, 10581);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(10578, 12, 0, 0),
(10580, 12, 0, 0),
(10579, 12, 1, 0),
(10581, 12, 1, 0);

UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` = 33686;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33779;
DELETE FROM `creature_template` WHERE entry = 33115;
DELETE FROM creature WHERE id = 33115;

-- Emblem of Valor
UPDATE creature_loot_template SET item = 40753 WHERE entry IN (33113, 33186, 33118, 33293, 32927, 32857, 33515, 33271) AND item = 45624;
UPDATE gameobject_loot_template SET item = 40753 WHERE entry IN (27061, 26963, 27078, 27081, 26955, 26946, 27068) AND item = 40752;

-- Flame Leviathan
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` = 33113;

-- XT-002 Hardmode loot

DELETE FROM `creature_loot_template` WHERE `entry`=33293;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('33293','40753','100','1','0','1','1','0','0','0'),
('33293','1','100','1','0','-34121','2','0','0','0'),
('33293','45867','0','2','2','1','1','0','0','0'),
('33293','45868','0','2','2','1','1','0','0','0'),
('33293','45869','0','2','2','1','1','0','0','0'),
('33293','45870','0','2','2','1','1','0','0','0'),
('33293','45871','0','2','2','1','1','0','0','0');

DELETE FROM `reference_loot_template` WHERE `entry`=34121;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34121','45675','0','1','1','1','1','0','0','0'),
('34121','45676','0','1','1','1','1','0','0','0'),
('34121','45677','0','1','1','1','1','0','0','0'),
('34121','45679','0','1','1','1','1','0','0','0'),
('34121','45680','0','1','1','1','1','0','0','0'),
('34121','45682','0','1','1','1','1','0','0','0'),
('34121','45685','0','1','1','1','1','0','0','0'),
('34121','45686','0','1','1','1','1','0','0','0'),
('34121','45687','0','1','1','1','1','0','0','0'),
('34121','45694','0','1','1','1','1','0','0','0');

-- Assembly of Iron Hardmode loot

DELETE FROM `creature_loot_template` WHERE `entry` IN (32857, 32927, 32867);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('32857','40753','100','1','0','1','1','0','0','0'),
('32857','1','100','1','0','-34122','2','0','0','0'),
('32927','40753','100','1','0','2','2','0','0','0'),
('32927','1','100','1','0','-34122','3','0','0','0'),
('32867','45624','100','1','0','1','1','0','0','0'),
('32867','1','100','1','0','-34122','2','0','0','0'),
('32867','45447','0','2','2','1','1','0','0','0'),
('32867','45448','0','2','2','1','1','0','0','0'),
('32867','45449','0','2','2','1','1','0','0','0'),
('32867','45455','0','2','2','1','1','0','0','0'),
('32867','45456','0','2','2','1','1','0','0','0');

DELETE FROM `reference_loot_template` WHERE `entry`=34122;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34122','45322','0','1','1','1','1','0','0','0'),
('34122','45324','0','1','1','1','1','0','0','0'),
('34122','45329','0','1','1','1','1','0','0','0'),
('34122','45330','0','1','1','1','1','0','0','0'),
('34122','45331','0','1','1','1','1','0','0','0'),
('34122','45332','0','1','1','1','1','0','0','0'),
('34122','45333','0','1','1','1','1','0','0','0'),
('34122','45378','0','1','1','1','1','0','0','0'),
('34122','45418','0','1','1','1','1','0','0','0'),
('34122','45423','0','1','1','1','1','0','0','0');

-- Freya Hardmode loot

UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979  WHERE `entry` = 33203;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33215;
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (27078, 27079, 27080, 27081);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27078','1','100','1','0','-34125','1','0','0','0'),
('27078','2','100','1','0','-34105','1','0','0','0'),
('27078','40753','100','1','0','1','1','0','0','0'),
('27078','45087','100','1','0','1','1','0','0','0'),
('27078','45644','0','1','1','1','1','0','0','0'),
('27078','45645','0','1','1','1','1','0','0','0'),
('27078','45646','0','1','1','1','1','0','0','0'),
('27078','46110','100','1','0','1','1','7','171','425'),
('27079','1','100','1','0','-34125','2','0','0','0'),
('27079','2','100','1','0','-34105','1','0','0','0'),
('27079','40753','100','1','0','1','1','0','0','0'),
('27079','45087','100','1','0','1','1','0','0','0'),
('27079','45644','0','1','1','1','1','0','0','0'),
('27079','45645','0','1','1','1','1','0','0','0'),
('27079','45646','0','1','1','1','1','0','0','0'),
('27079','46110','100','1','0','1','1','7','171','425'),
('27080','1','100','1','0','-34125','2','0','0','0'),
('27080','2','100','1','0','-34105','1','0','0','0'),
('27080','40753','100','1','0','2','2','0','0','0'),
('27080','45087','100','1','0','1','1','0','0','0'),
('27080','45644','0','1','1','1','1','0','0','0'),
('27080','45645','0','1','1','1','1','0','0','0'),
('27080','45646','0','1','1','1','1','0','0','0'),
('27080','46110','100','1','0','1','1','7','171','425'),
('27081','1','100','1','0','-34125','1','0','0','0'),
('27081','2','100','1','0','-34105','1','0','0','0'),
('27081','45943','0','1','2','1','1','0','0','0'),
('27081','45945','0','1','2','1','1','0','0','0'),
('27081','45946','0','1','2','1','1','0','0','0'),
('27081','45294','0','1','2','1','1','0','0','0'),
('27081','45947','0','1','2','1','1','0','0','0'),
('27081','45624','100','1','0','1','1','0','0','0'),
('27081','45087','100','1','0','1','1','0','0','0'),
('27081','45644','0','1','1','1','1','0','0','0'),
('27081','45645','0','1','1','1','1','0','0','0'),
('27081','45646','0','1','1','1','1','0','0','0'),
('27081','45788','-100','1','0','1','1','9','13606','0'),
('27081','46110','100','1','0','1','1','7','171','425');

DELETE FROM `gameobject_template` WHERE entry = 194326;
INSERT INTO `gameobject_template` VALUES('194326','3','8628','Freya\'s Gift','','','','0','0','2','0','0','0','0','0','0','1634','27080','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11159');

DELETE FROM `reference_loot_template` WHERE `entry`=34125;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34125','45934','0','1','1','1','1','0','0','0'),
('34125','45935','0','1','1','1','1','0','0','0'),
('34125','45936','0','1','1','1','1','0','0','0'),
('34125','45940','0','1','1','1','1','0','0','0'),
('34125','45941','0','1','1','1','1','0','0','0');

-- Hodir Harmode loot

UPDATE script_texts SET `type` = 2 WHERE entry = -1603218;
DELETE FROM `gameobject` WHERE `id`=194200;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(194200, 603, 1, 1, 2038.29, -200.702, 432.687, 3.12232, 0, 0, 1, 0, 300, 0, 1);

DELETE FROM `gameobject_loot_template` WHERE entry=27069;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27069','45624','100','1','0','1','1','0','0','0'),
('27069','45888','0','1','1','1','1','0','0','0'),
('27069','45886','0','1','1','1','1','0','0','0'),
('27069','45887','0','1','1','1','1','0','0','0'),
('27069','45877','0','1','1','1','1','0','0','0'),
('27069','45876','0','1','1','1','1','0','0','0'),
('27069','45786','-100','1','0','1','1','9','13609','0');

-- Thorim Hardmode loot

DELETE FROM `gameobject` WHERE `id`=194314;
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 0 WHERE `entry` IN (194312, 194313);

DELETE FROM `gameobject_loot_template` WHERE entry IN (27073, 27074);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27073','40753','100','1','0','1','1','0','0','0'),
('27073','1','100','1','0','-34130','1','0','0','0'),
('27073','45659','0','1','1','1','1','0','0','0'),
('27073','45660','0','1','1','1','1','0','0','0'),
('27073','45661','0','1','1','1','1','0','0','0'),
('27074','45624','100','1','0','1','1','0','0','0'),
('27074','1','100','1','0','-34130','1','0','0','0'),
('27074','45928','0','1','2','1','1','0','0','0'),
('27074','45929','0','1','2','1','1','0','0','0'),
('27074','45930','0','1','2','1','1','0','0','0'),
('27074','45931','0','1','2','1','1','0','0','0'),
('27074','45933','0','1','2','1','1','0','0','0'),
('27074','45659','0','1','1','1','1','0','0','0'),
('27074','45660','0','1','1','1','1','0','0','0'),
('27074','45661','0','1','1','1','1','0','0','0'),
('27074','45784','-100','3','0','1','1','9','13611','0');

DELETE FROM `reference_loot_template` WHERE entry = 34130;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34130','45892','0','1','1','1','1','0','0','0'),
('34130','45893','0','1','1','1','1','0','0','0'),
('34130','45894','0','1','1','1','1','0','0','0'),
('34130','45895','0','1','1','1','1','0','0','0'),
('34130','45927','0','1','1','1','1','0','0','0');

-- Mimiron Hardmode loot

DELETE FROM `gameobject` WHERE `id`=194956;
DELETE FROM `gameobject_template` WHERE entry = 194790;
INSERT INTO `gameobject_template` VALUES ('194790','3','8686','Cache of Innovation','','','','0','0','1.5','0','0','0','0','0','0','1634','27086','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11159');

DELETE FROM `gameobject_loot_template` WHERE entry IN (27085, 27086);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27085','40753','100','1','0','1','1','0','0','0'),
('27085','1','100','1','0','-34129','1','0','0','0'),
('27085','45647','0','1','1','1','1','0','0','0'),
('27085','45648','0','1','1','1','1','0','0','0'),
('27085','45649','0','1','1','1','1','0','0','0'),
('27086','45624','100','1','0','1','1','0','0','0'),
('27086','1','100','1','0','-34129','1','0','0','0'),
('27086','45982','0','1','2','1','1','0','0','0'),
('27086','45988','0','1','2','1','1','0','0','0'),
('27086','45989','0','1','2','1','1','0','0','0'),
('27086','45990','0','1','2','1','1','0','0','0'),
('27086','45993','0','1','2','1','1','0','0','0'),
('27086','45647','0','1','1','1','1','0','0','0'),
('27086','45648','0','1','1','1','1','0','0','0'),
('27086','45649','0','1','1','1','1','0','0','0'),
('27086','45787','-100','1','0','1','1','9','13611','0');

DELETE FROM `reference_loot_template` WHERE entry = 34129;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34129','45972','0','1','1','1','1','0','0','0'),
('34129','45973','0','1','1','1','1','0','0','0'),
('34129','45974','0','1','1','1','1','0','0','0'),
('34129','45975','0','1','1','1','1','0','0','0'),
('34129','45976','0','1','1','1','1','0','0','0');

-- General Vezax Hardmode loot

DELETE FROM `creature_loot_template` WHERE entry = 33271;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('33271','40753','100','1','0','1','1','0','0','0'),
('33271','1','100','1','0','-34131','2','0','0','0'),
('33271','46032','0','2','2','1','1','0','0','0'),
('33271','46033','0','2','2','1','1','0','0','0'),
('33271','46034','0','2','2','1','1','0','0','0'),
('33271','46035','0','2','2','1','1','0','0','0'),
('33271','46036','0','2','2','1','1','0','0','0');

DELETE FROM `reference_loot_template` WHERE entry = 34131;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34131','45996','0','1','1','1','1','0','0','0'),
('34131','45997','0','1','1','1','1','0','0','0'),
('34131','46008','0','1','1','1','1','0','0','0'),
('34131','46009','0','1','1','1','1','0','0','0'),
('34131','46010','0','1','1','1','1','0','0','0'),
('34131','46011','0','1','1','1','1','0','0','0'),
('34131','46012','0','1','1','1','1','0','0','0'),
('34131','46013','0','1','1','1','1','0','0','0'),
('34131','46014','0','1','1','1','1','0','0','0'),
('34131','46015','0','1','1','1','1','0','0','0');
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `flags_extra` = 257, `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'mob_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'mob_saronite_animus' WHERE `entry` = 33524;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0, 0, 2, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33856, 34143, 34050);
UPDATE `creature_template` SET `unit_flags` = 33686018 WHERE `entry` = 34050;
UPDATE `creature` SET `position_x` = 2736.92, `position_y` = 2572.30, `orientation` = 5.723 WHERE `guid` = 137630;
UPDATE `creature_template` SET `ScriptName` = 'boss_vx_001', `unit_flags` = 0, `vehicleid` = 371, `Health_mod` = 375 WHERE `entry` = 33651;
UPDATE `creature_template` SET `ScriptName` = 'boss_aerial_unit', `unit_flags` = 0, `vehicleid` = 388, `Health_mod` = 250 WHERE `entry` = 33670;
UPDATE `creature_template` SET `vehicleid` = 370, `Health_mod` = 156.185 WHERE `entry` = 33432;
UPDATE `creature_template` SET `Health_mod` = 156.185 WHERE `entry` = 34071;

DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret');
UPDATE `creature_template` SET `modelid1` = 17188, `modelid2` = 0 WHERE `entry` = 25171;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5, `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;

DELETE FROM `creature` WHERE `id`=33651;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33651, 603, 1, 1, 28841, 0, 2744.65, 2569.46, 364.397, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2, `ScriptName` = 'rocket_strike' WHERE `entry` = 34047;

DELETE FROM `creature` WHERE `id`=33670;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33670, 603, 1, 1, 28979, 0, 2744.65, 2569.46, 380.040, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33686020, `type_flags` = 0, `flags_extra` = 2, `ScriptName` = 'magnetic_core' WHERE `entry` = 34068;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10598, 10599, 10559, 10444, 10563, 10455, 10558, 10438, 10561, 10454, 10408, 10560, 10453, 10562);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Freya
(10559, 12, 0, 0),
(10444, 12, 0, 0),
(10563, 12, 1, 0),
(10455, 12, 1, 0),
-- Thorim
(10558, 12, 0, 0),
(10438, 12, 0, 0),
(10561, 12, 1, 0),
(10454, 12, 1, 0),
-- Hodir
(10408, 12, 0, 0),
(10560, 12, 0, 0),
(10453, 12, 1, 0),
(10562, 12, 1, 0);