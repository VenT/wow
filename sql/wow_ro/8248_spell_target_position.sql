-- insert spell target position for Urom`s teleport spells
DELETE FROM `spell_target_position` WHERE `id` IN (50476,50495,50496,51112);
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(50476,578,968.66,1042.53,527.32,0.077),
(50495,578,1164.02,1170.85,527.321,3.66),
(50496,578,1118.31,1080.377,508.361,4.250),
(51112,578,1103.69,1048.76,512.279,1.16);