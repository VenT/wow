DELETE FROM `gameobject` WHERE `guid` = 913334;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(913334, 202244, 631, 3, 1, -209.5, 2211.91, 199.97, 3.07661, 0, 0, 0.999472, 0.0324833, 0, 0, 1);

UPDATE `gameobject_template` SET `flags` = 0, `ScriptName` = 'go_icecrown_teleporter' WHERE `entry`  IN (202242,202243,202244,202245,202235,202223,202246);
UPDATE `gameobject` SET `phaseMask` = 1 WHERE `id`  IN (202242,202243,202244,202245,202235,202223,202246);
DELETE FROM `areatrigger_teleport` WHERE `id` = 5718 AND `target_map` = 631;

DELETE FROM `creature` WHERE `id` = 99322;
DELETE FROM `creature_template` WHERE `entry` = 99322;
DELETE FROM `locales_npc_text` WHERE `entry` = 99322;
DELETE FROM `npc_text` WHERE `ID` = 99322;
DELETE FROM `locales_npc_text` WHERE `entry` = 99323;
DELETE FROM `npc_text` WHERE `ID` = 99323;
DELETE FROM `gameobject` WHERE `guid` IN (913334);

UPDATE `instance_template` SET `script`='instance_icecrown_spire' WHERE `map`=631;

-- The Lich King script
UPDATE `creature_template` SET ScriptName='boss_the_lich_king' WHERE `entry`=36597;
UPDATE `creature_template` SET ScriptName='boss_the_lich_king' WHERE `entry`=37226;

UPDATE creature_template SET dmg_multiplier=120 where entry=37226;
UPDATE creature_template SET dmg_multiplier=120 where entry=36597;
UPDATE creature_template SET unit_flags=0 where entry=37226;
UPDATE creature_template SET unit_flags=0 where entry=36597;

UPDATE creature_template SET faction_a=14 where entry=36597;
UPDATE creature_template SET faction_h=14 where entry=36597;
UPDATE creature_template SET faction_a=14 where entry=37226;
UPDATE creature_template SET faction_h=14 where entry=37226;

-- Tirion NPC
UPDATE `creature_template` SET ScriptName='npc_tirion_guide' WHERE `entry`=38995;
UPDATE creature_template SET unit_flags=0 where entry=38995;

-- Saurfang
UPDATE `creature_template` SET `ScriptName`='boss_deathbringer_saurfang' WHERE `entry`=37813;
DELETE FROM `gameobject` WHERE `guid` IN (913383, 913385, 913395, 913397);
DELETE FROM `gameobject_template` WHERE `entry` IN (902241,902242);

-- Deathwhisper
UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwhisper' WHERE `entry`=36855;
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14,`ScriptName`='mob_vengeful_shade', `AIName`='' WHERE `entry`= 38222;
-- UPDATE `gameobject` SET `spawntimesecs` = -25, `state` = 1 WHERE `id` = 202220;

-- Marrowgar
UPDATE `creature_template` SET `ScriptName`='boss_lord_marrowgar' WHERE `entry`= 36612;
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201910,201911);
UPDATE `gameobject` SET `state` = '1' WHERE `guid` IN (72526,72525);
UPDATE `creature_template` SET `ScriptName`='mob_coldflame', `minlevel` = 82, `maxlevel` = 82 WHERE `entry`= 36672;
UPDATE `creature_template` SET `ScriptName`='mob_bone_spike' WHERE `entry`= 38711;

-- Gunship battle
UPDATE `creature_template` SET `ScriptName`='mob_spire_frostwyrm', `AIName`='' WHERE `entry`= 37230;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 37230;
UPDATE `creature_template` SET `ScriptName`='mob_frost_giant', `AIName`='' WHERE `entry` IN (38490, 38494) ;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (38490, 38494);

-- Gunship armory (override)
DELETE FROM `gameobject` WHERE `id` IN (201872,201873,201874,201875,202177,202178,202179,202180);
UPDATE `gameobject_template` SET `flags` = 0 WHERE `gameobject_template`.`entry` IN (201872,201873,201874,201875,202177,202178,202179,202180);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(972541, 201872, 631, 1, 1, -428.141, 2421.34, 191.233, 3.10389, 0, 0, 0.999822, 0.0188489, -604800, 100, 1),
(972543, 201873, 631, 2, 1, -428.141, 2421.34, 191.233, 3.10389, 0, 0, 0.999822, 0.0188489, -604800, 100, 1),
(972545, 201874, 631, 4, 1, -428.141, 2421.34, 191.233, 3.10389, 0, 0, 0.999822, 0.0188489, -604800, 100, 1),
(972547, 201875, 631, 8, 1, -428.141, 2421.34, 191.233, 3.10389, 0, 0, 0.999822, 0.0188489, -604800, 100, 1),
(972551, 202177, 631, 1, 1, -447.493, 2003.5, 191.235, 0.153939, 0, 0, 0.0768933, 0.997039, -604800, 100, 1),
(972553, 202178, 631, 2, 1, -447.493, 2003.5, 191.235, 0.153939, 0, 0, 0.0768933, 0.997039, -604800, 100, 1),
(972555, 202179, 631, 4, 1, -447.493, 2003.5, 191.235, 0.153939, 0, 0, 0.0768933, 0.997039, -604800, 100, 1),
(972557, 202180, 631, 8, 1, -447.493, 2003.5, 191.235, 0.153939, 0, 0, 0.0768933, 0.997039, -604800, 100, 1);

-- Plague wing
-- Rotface
UPDATE `creature_template` SET `ScriptName`='boss_rotface', `AIName`=''  WHERE `entry`= 36627;
UPDATE `gameobject_template` SET `faction` = '114' WHERE `gameobject_template`.`entry` IN (201370);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201370);
-- Festergut
UPDATE `creature_template` SET `ScriptName`='boss_festergut', `AIName`=''  WHERE `entry`= 36626;
UPDATE `gameobject_template` SET `faction` = '114' WHERE `gameobject_template`.`entry` IN (201371);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201371);

-- Professor putricide
UPDATE `creature_template` SET `ScriptName`='boss_proffesor_putricide', `AIName`='' WHERE `entry`= 36678;
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201372,201614,201613, 201612);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201612,201614,201613);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201372);
UPDATE `creature_template` SET `ScriptName`='mob_icc_gas_cloud', `AIName`='' WHERE `entry`= 37562;
UPDATE `creature_template` SET `ScriptName`='mob_icc_volatile_ooze', `AIName`='' WHERE `entry`= 37697;
UPDATE `gameobject_template` SET `faction` = '0', `ScriptName` = 'go_plague_sigil' WHERE `gameobject_template`.`entry` IN (202182);

-- Blood wing
UPDATE `gameobject_template` SET `faction` = '0', `ScriptName` = 'go_bloodwing_sigil' WHERE `gameobject_template`.`entry` IN (202181);
-- Taldaram
UPDATE `creature_template` SET `ScriptName`='boss_taldaram_icc', `AIName`='' WHERE `entry`= 37973;
-- Valanar
UPDATE `creature_template` SET `ScriptName`='boss_valanar_icc', `AIName`='' WHERE `entry`= 37970;
-- Keleseth
UPDATE `creature_template` SET `ScriptName`='boss_keleseth_icc', `AIName`='' WHERE `entry`= 37972;

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201920,201377,201378);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201920,201377,201378);
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201376);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201376);

-- Qween Lana'thel
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lanathel', `AIName`='' WHERE `entry`= 37955;

-- Valithria dreamwalker
-- UPDATE `creature_template` SET `ScriptName`='boss_valithria' WHERE `entry`= 36789;
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201374,201375,201369);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201374,201375,201369);
UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (201380,201381,201382,201383);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201380,201381,201382,201383);

-- Sindragosa
-- UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE `entry`= 37755;
-- Lich King
-- UPDATE `creature_template` SET `ScriptName`='boss_lich_king' WHERE `entry`= 29983;

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1631200 AND -1631000;
INSERT INTO `script_texts` (`entry`,`content_loc8`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1631000','??? ?????? ? ?????, ????????. ????? ?? ????? ????? ? ????!','This is the beginning AND the end, mortals. None may enter the master\'s sanctum!','16950','6','0','0','marrowgar SAY_INTRO'),
('-1631001','????????? ????? ???? ?????? ? ??????????!','The Scourge will wash over this world as a swarm of death and destruction!','16941','6','0','0','marrowgar SAY_AGGRO'),
('-1631002','????? ??????!','BONE STORM!','16946','3','0','0','marrowgar SAY_BONESTORM'),
('-1631003','???????? ??????!','Bound by bone!','16947','3','0','0','marrowgar SAY_BONESPIKE1'),
('-1631004','????? ??????!','Stick Around!','16948','3','0','0','marrowgar SAY_BONESPIKE2'),
('-1631005','????? - ?????? ??????!','The only escape is death!','16949','6','0','0','marrowgar SAY_BONESPIKE3'),
('-1631006','?????? ??????!','More bones for the offering!','16942','6','0','0','marrowgar SAY_KILL1'),
('-1631007','?????? ????????!','Languish in damnation!','16943','6','0','0','marrowgar SAY_KILL2'),
('-1631008','?????? ??????? ????? ????? ????!','THE MASTER\'S RAGE COURSES THROUGH ME!','16945','3','0','0','marrowgar SAY_ENRAGE'),
('-1631009','? ????... ?????? ????...','I see... only darkness...','16944','6','0','0','marrowgar SAY_DEATH'),
('-1631020','????????? ?? ???? ?????? ????! ?????????, ????, ?????! ??? ????????! ????????? ??????! ????? ????????? ?? ?????? ??????????! ??? ?????? ?? ??????? ??? ????? - ??? ??????, ??? ?????? ?? ??????? ?????????? ???? ????????!','Fix your eyes upon your crude hands! The sinew, the soft meat, the dark blood coursing within! It is a weakness! A crippling flaw! A joke played by the creators upon their own creations! The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it!','16878','6','0','0','deathwhisper SAY_INTRO1'),
('-1631021','????? ?????? ??????? ??? ????????! ??? ???? ?? ????? ???????, ? ??? ???? ???????????! ??, ??? ?????? ???? ????? ??????????! ? ??, ??? ??????, ??????? ??????????? ?????????, ??????????????, ? ??????????? ???????????? ??? ? ????? ?????????!','Through our master all things are possible! His power is without limit, and his will unbending! Those who oppose him will be destroyed utterly! And those who serve, who serve wholly, unquestioningly, with utter devotion of mind and soul? Elevated! To heights beyond your ken!','16879','6','0','0','deathwhisper SAY_INTRO2'),
('-1631022','?? ????? ???? ???? ?????, ?????? ??? ?? ???????????? ? ????? ???????? ????????? ???????? ???????? ????, ?????????? ????????! ?? ?????? ?????? ?????? ?????, ??? ????? ??? ???? ?????, ??? ?????, ? ??????, ??? ???????? ???? ???!','You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness! You can see through the fog that hangs over this world like a shroud and grasp where true power lies!','16880','6','0','0','deathwhisper SAY_INTRO3'),
('-1631023','??? ??? ?? ???????????! ?? ?????? ?????? ?? ???? ????????? ?????? ??? ??? ? ????? ?????????? ?????????!','What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.','16868','6','0','0','deathwhisper SAY_AGGRO'),
('-1631024','??????! ? ???? ??? ???? ????? ???? ? ???? ????.','Enough! I see I must take matters into my own hands!','16877','6','0','0','deathwhisper SAY_PHASE2'),
('-1631025','?? ????? ? ????????? ?????? ????!','You are weak, powerless to resist my will!','16876','6','0','0','deathwhisper SAY_DOMINATEMIND'),
('-1631026','???????? ??? ????????????? ? ???????? ???? ??????????????? ??? ???? ??????!','Take this blessing and show these intruders a taste of our master\'s power.','16873','6','0','0','deathwhisper SAY_DARKEMPOWERMENT'),
('-1631027','??? ?????! ? ?????????? ??? ?? ????????? ?????!','Loyal adherent! I release you from the curse of flesh!','16874','6','0','0','deathwhisper SAY_DARKTRANSFORMATION'),
('-1631028','?????? ? ????????? ? ???????? ????!','Arise and exalt in your pure form!','16875','6','0','0','deathwhisper SAY_ANIMATEDEAD'),
('-1631029','?? ??? ?? ???????? ????????????? ????? ?????????','Do you yet grasp of the futility of your actions?','16869','6','0','0','deathwhisper SAY_KILL1'),
('-1631030','????? ????! ???? ?????...','Embrace the darkness... Darkness eternal!','16870','6','0','0','deathwhisper SAY_KILL2'),
('-1631031','??? ???? ???????????? ??????? ?????!','This charade has gone on long enough.','16872','3','0','0','deathwhisper SAY_BERSERK'),
('-1631032','??? - ????? ????? ???????! ??? ????? ?????????...','All part of the masters plan! Your end is... inevitable!','16871','6','0','0','deathwhisper SAY_DEATH'),
('-1631100','?? ??? ??????-????!','BY THE MIGHT OF THE LICH KING!','16694','6','0','0','saurfang SAY_AGGRO'),
('-1631101','????? ?????? ??????? ?? ????? ?????!','The ground runs red with your blood!','16699','6','0','0','saurfang SAY_FALLENCHAMPION'),
('-1631102','????, ??? ??????!','Feast, my minions!','16700','3','0','0','saurfang SAY_BLOODBEASTS'),
('-1631103','?? ?????!','You are nothing!','16695','6','0','0','saurfang SAY_KILL1'),
('-1631104','???? ???? ?? ?????? ????? ??????????!','Your soul will find no redemption here!','16696','6','0','0','saurfang SAY_KILL2'),
('-1631105','? ???? ??????????? ??????!','I have become... death!','16698','3','0','0','saurfang SAY_BERSERK'),
('-1631106','?... ???????????...','I... Am... Released.','16697','6','0','0','saurfang SAY_DEATH');
