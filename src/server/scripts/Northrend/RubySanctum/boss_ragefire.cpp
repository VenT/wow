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

enum eTexts
{
	SAY_AGGRO = -1752022,
	SAY_SLAY1 = -1752023,
	SAY_SLAY2 = -1752024,
	SAY_DEATH = -1752025,
	SAY_SPECIAL = -1752026
};

enum eSpells
{
	SPELL_ENRAGE = 78722,
	SPELL_FLAME_BREATH = 74403,
	SPELL_FLAME_BREATH_25 = 74404,
	SPELL_FIRE_NOVA = 78723,
	SPELL_CONFLAGRATION = 74452
};

struct boss_ragefireAI : public ScriptedAI
{
	boss_ragefireAI(Creature *pCreature) : ScriptedAI(pCreature)
	{
		pInstance = me->GetInstanceData();
	}

	InstanceData* pInstance;

	uint32 uiFlameBreathTimer;

	void Reset()
	{
		uiFlameBreathTimer = 10000;
	}

	void EnterCombat(Unit*)
	{
		pInstance->SetData(DATA_RAGEFIRE_EVENT, IN_PROGRESS);
		DoScriptText(SAY_AGGRO, me);
	}

	void UpdateAI(const uint32 diff)
	{
		if(!UpdateVictim())
			return;

		if(uiFlameBreathTimer <= diff)
		{
			DoCast((pInstance->instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC || pInstance->instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL) ? SPELL_FLAME_BREATH_25 : SPELL_FLAME_BREATH);
			uiFlameBreathTimer = urand(10000, 15000);
		} else uiFlameBreathTimer -= diff;

		DoMeleeAttackIfReady();
	}

	void KilledUnit(Unit *victim)
	{
		if(victim == me)
			return;
		DoScriptText(RAND(SAY_SLAY1, SAY_SLAY2), me);
	}

	void JustDied(Unit*)
	{
		pInstance->SetData(DATA_RAGEFIRE_EVENT, DONE);
		DoScriptText(SAY_DEATH, me);
	}
};

CreatureAI* GetAI_boss_ragefire(Creature *pCreature)
{
	return new boss_ragefireAI(pCreature);
}

void AddSC_boss_ragefire()
{
	Script* newscript;

	newscript = new Script;
	newscript->Name = "boss_ragefire";
	newscript->GetAI = &GetAI_boss_ragefire;
	newscript->RegisterSelf();
}