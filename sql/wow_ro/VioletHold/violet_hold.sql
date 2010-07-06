-- Inserting the new mobtype which will be spawned due the PreEvent fight with the Guards (4 different models = 4 "different" mobs)
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`, `trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(310100,0,0,0,0,0,24910,27219,25247,27220,'Azure Prisoner','','',0,80,80,2,1720,1720,0,1,1.14286,1,0,142,255,0,192,4,1500,0,1,0,8,0,0,0,0,0,295,438,68,1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'EventAI',0,3,0.5,0.5,0.5,0,0,0,0,0,0,0,0,1,0,0,0,'mob_azure_prisoner',11723);

-- Editing Violet Hold Guards to Attack Mobs but not Players
UPDATE `creature_template` SET `faction_A`='2115',`faction_H`='2115',`AIName`='GuardAI' WHERE `entry`=30659; -- Violet Hold Guard

-- My Mob ScriptName
UPDATE `creature_template` SET `scriptname`='mob_azure_saboteur' WHERE `entry`=31079; -- Azure Saboteur

-- PivoNRoll's original Faction fixes (without touching AIName)
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=30661; -- Azure Invader
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=30662; -- Azure Spellbreaker
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=30663; -- Azure Binder
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=30664; -- Azure Mage Slayer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=31487; -- Azure Invader (heroic)
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=31494; -- Azure Spellbreaker (heroic)
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=31483; -- Azure Binder (heroic)
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=31497; -- Azure Mage Slayer (heroic)
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=30962; -- Azure Spellbreaker
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=30963; -- Azure Mage Slayer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=31495; -- Azure Spellbreaker (heroic)
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=31498; -- Azure Mage Slayer (heroic)


-- The MySQL data below is already content of sql updates delivered by the latest core rev (8638_world_scriptname.sql)
-- This shouldn't do you any harm if it is overwritten.

-- PivoNRoll's original Mob ScriptNames
UPDATE `creature_template` SET `scriptname`='mob_azure_invader' WHERE `entry`=30661; -- Azure Invader 1
UPDATE `creature_template` SET `scriptname`='mob_azure_spellbreaker' WHERE `entry`=30662; -- Azure Spellbreaker 
UPDATE `creature_template` SET `scriptname`='mob_azure_binder' WHERE `entry`=30663; -- Azure Binder 1
UPDATE `creature_template` SET `scriptname`='mob_azure_mage_slayer' WHERE `entry`=30664; -- Azure Mage Slayer 1
UPDATE `creature_template` SET `scriptname`='mob_azure_captain' WHERE `entry`=30666; -- Azure Captain
UPDATE `creature_template` SET `scriptname`='mob_azure_sorceror' WHERE `entry`=30667; -- Azure Sorceror
UPDATE `creature_template` SET `scriptname`='mob_azure_raider' WHERE `entry`=30668; -- Azure Raider
UPDATE `creature_template` SET `scriptname`='mob_azure_stalker' WHERE `entry`=32191; -- Azure Stalker
UPDATE `creature_template` SET `scriptname`='mob_azure_invader' WHERE `entry`=30961; -- Azure Invader 2
UPDATE `creature_template` SET `scriptname`='mob_azure_spellbreaker' WHERE `entry`=30962; -- Azure Spellbreaker 
UPDATE `creature_template` SET `scriptname`='mob_azure_binder' WHERE `entry`=30918; -- Azure Binder 2
UPDATE `creature_template` SET `scriptname`='mob_azure_mage_slayer' WHERE `entry`=30963; -- Azure Mage Sl
