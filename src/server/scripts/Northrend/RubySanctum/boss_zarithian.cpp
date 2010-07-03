/* Copyright (C) 2010 /dev/rsa for ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "ScriptPCH.h"
#include "ruby_sanctum.h"

enum eSpells
{
	SPELL_CLEAVE_ARMOR = 74367,
	SPELL_INTIMIDATING_ROAR = 74384,
	SPELL_SUMMON_FLAMECALLER = 74398
};

enum eTexts
{
	SAY_AGGRO = -1752017,
	SAY_SLAY1 = -1752018,
	SAY_SLAY2 = -1752019,
	SAY_DEATH = -1752020, 
	SAY_SPECIAL = -1752021
};

struct boss_zarithrianAI : public ScriptedAI
{
	boss_zarithrianAI(Creature *pCreature) : ScriptedAI(pCreature)
	{
		pInstance = me->GetInstanceData();
	}

	InstanceData *pInstance;

	uint32 uiCleaveArmorTimer;
	uint32 uiIntimidatingRoarTimer;
	uint32 uiSummonFlamecallerTimer;

	Creature* Trigger1;
	Creature* Trigger2;

	bool SpawnTargetSpawned;

	void Reset()
	{
		uiCleaveArmorTimer = 5500;
		uiIntimidatingRoarTimer = 10000;
		uiSummonFlamecallerTimer = 25000;

		SpawnTargetSpawned = false;
	}

	void EnterCombat(Unit*)
	{
		pInstance->SetData(DATA_ZARITHRIAN, IN_PROGRESS);
		DoScriptText(SAY_AGGRO, me);
	}

	void UpdateAI(const uint32 diff)
	{
		if(!UpdateVictim())
			return;

		
		if(!SpawnTargetSpawned)
		{
			Trigger1 = me->SummonCreature(NPC_ZARITHRIAN_SPAWN_STALKER,3010.464, 499.45, 89.74, 0.1767, TEMPSUMMON_DEAD_DESPAWN);
			Trigger2 = me->SummonCreature(NPC_ZARITHRIAN_SPAWN_STALKER,3015.58, 556.397, 89.43, 5.667, TEMPSUMMON_DEAD_DESPAWN);
			SpawnTargetSpawned = true;
		}

		if(uiCleaveArmorTimer <= diff)
		{
			DoCastVictim(SPELL_CLEAVE_ARMOR);
			uiCleaveArmorTimer = urand(3500,4500);
		}else uiCleaveArmorTimer -= diff;

		if(uiIntimidatingRoarTimer <= diff)
		{
			DoCast(SPELL_INTIMIDATING_ROAR);
			uiIntimidatingRoarTimer = urand(9500,11000);
		}else uiIntimidatingRoarTimer -= diff;

		if(uiSummonFlamecallerTimer <= diff)
		{
			Trigger1->AI()->DoCast(SPELL_SUMMON_FLAMECALLER);
			Trigger2->AI()->DoCast(SPELL_SUMMON_FLAMECALLER);
			DoScriptText(SAY_SPECIAL, me);
			uiSummonFlamecallerTimer = urand(25000,45000);
		}else uiSummonFlamecallerTimer -= diff;

		DoMeleeAttackIfReady();
	}

	void KilledUnit(Unit *victim)
	{
		if(victim == me)
			return;
		DoScriptText(RAND(SAY_SLAY1, SAY_SLAY2), me);
	}

	void EnterEvadeMode()
	{
		if(Trigger1)
		{
			Trigger1->RemoveAllMinionsByEntry(39814);
			Trigger1->DisappearAndDie();
		}
		if(Trigger2)
		{
			Trigger2->RemoveAllMinionsByEntry(39814);
			Trigger2->DisappearAndDie();
		}
		ScriptedAI::EnterEvadeMode();
	}
	
	void JustDied(Unit*)
	{
		if(!pInstance)
			return;
		if(Trigger1)
		{
			Trigger1->RemoveAllMinionsByEntry(39814);
			Trigger1->DisappearAndDie();
		}
		if(Trigger2)
		{
			Trigger2->RemoveAllMinionsByEntry(39814);
			Trigger2->DisappearAndDie();
		}
		DoScriptText(SAY_DEATH, me);
		pInstance->SetData(DATA_ZARITHRIAN, DONE);
	}
};

CreatureAI* GetAI_boss_zarithrian(Creature *pCreature)
{
	return new boss_zarithrianAI(pCreature);
}

void AddSC_boss_zarithrian()
{
	Script *newscript;
	newscript = new Script;
	newscript->Name = "boss_zarithrian";
	newscript->GetAI = &GetAI_boss_zarithrian;
	newscript->RegisterSelf();
}