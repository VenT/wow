/*
* Copyright (C) 2009 - 2010 TrinityCore <http://www.trinitycore.org/>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/
#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum Yells
{
    SAY_AGGRO        =    -1666025,
    SAY_AIRLOCK      =    -1666026,    
    SAY_PHASE_HC     =    -1666027,
    SAY_TRANSFORM_1  =    -1666028,
    SAY_TRANSFORM_2  =    -1666029,
    SAY_KILL_1       =    -1666030,
    SAY_KILL_2       =    -1666031,
    SAY_BERSERK      =    -1666032,
    SAY_DEATH        =    -1666033,
};

enum ProfessorSpells
{
	SPELL_UNBOUND_PLAGUE           =    72856,
	SPELL_SLIME_PUDDLE             =    70346, //work around since it would take too long to actually make it work:Lavi - yeah lazy, so what?
    SPELL_UNSTABLE_EXPERIMENT      =    71968,
    SPELL_TEAR_GAS                 =    71617,
    SPELL_CREATE_CONCOTION         =    71621,
    SPELL_GUZZLE_POTIONS           =    73122,
    SPELL_MALLEABLE_GOO_10_NORMAL  =    72296,
    SPELL_MALLEABLE_GOO_25_NORMAL  =    70852,
	SPELL_MALLEABLE_GOO_10_HEROIC  =    70852,
	SPELL_MALLEABLE_GOO_25_HEROIC  =    72874,
    SPELL_MUTATED_STRENGTH         =    71603,
    SPELL_MUTATED_PLAGUE           =    72672,
    SPELL_OOZE_ERUPTION            =    70492,
    SPELL_OOZE_ADHESIV             =    70447,
	SPELL_CHOKING_GAS_PROC         =    71255,
    SPELL_CHOKING_GAS_10_NORMAL    =    71278,
	SPELL_CHOKING_GAS_25_NORMAL    =    72619,
	SPELL_CHOKING_GAS_10_HEROIC    =    72619,
	SPELL_CHOKING_GAS_25_HEROIC    =    72620,
    SPELL_CHOKING_GAS_EXPLOSION    =    71279,
};

enum Summons
{
    SUMMON_GASCLOUD         =    37562,
    SUMMON_VOLATILE_OOZE    =    37697,
	SUMMON_CHOKE            =    38159,
};

#define EMOTE_UNSTABLE_EXPERIMENT "Professor Putricide begins unstable experiment!"

struct boss_professor_putricideAI : public ScriptedAI
{
    boss_professor_putricideAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiPhase;
    uint32 m_uiUnstableExperimentTimer;
    uint32 m_uiAddSpawnTimer;
    uint32 m_uiGooTimer;
    uint32 m_uiBombtimer;

    void Reset()
    {
        m_uiPhase = 1;
        m_uiUnstableExperimentTimer = 10000;
        m_uiAddSpawnTimer = 60000;

        if (m_pInstance)
            m_pInstance->SetData(DATA_PROFESSOR_PUTRICIDE_EVENT, NOT_STARTED);
    }

    void EnterCombat(Unit* who)
    {
        DoScriptText(SAY_AGGRO, me);

        if (m_pInstance)
            m_pInstance->SetData(DATA_PROFESSOR_PUTRICIDE_EVENT, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {  
        DoScriptText(SAY_DEATH, me);

        if (m_pInstance)
            m_pInstance->SetData(DATA_PROFESSOR_PUTRICIDE_EVENT, DONE);
    }

    void KilledUnit(Unit *victim)
    {
        DoScriptText(RAND(SAY_KILL_1,SAY_KILL_2), me);
    }

    void JustReachedHome()
    {
        if(m_pInstance)
            m_pInstance->SetData(DATA_PROFESSOR_PUTRICIDE_EVENT, FAIL);  
    }

    void JustSummoned(Creature* pSummoned)
    {
        Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
        pSummoned->AI()->AttackStart(pTarget);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        if (m_uiUnstableExperimentTimer < uiDiff)
        {
            DoCast(me, SPELL_UNSTABLE_EXPERIMENT);
            me->MonsterTextEmote(EMOTE_UNSTABLE_EXPERIMENT,NULL);
            m_uiUnstableExperimentTimer = 40000;
            m_uiAddSpawnTimer = 10000;
        } else m_uiUnstableExperimentTimer -= uiDiff;

        if (m_uiAddSpawnTimer < uiDiff)
        {
			switch(urand(0, 1))
			{
			case 0:
				me->SummonCreature(SUMMON_GASCLOUD, me->GetPositionX()-35, me->GetPositionY()+35, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 9999999);
				break;
			case 1:
				me->SummonCreature(SUMMON_VOLATILE_OOZE, me->GetPositionX()+35, me->GetPositionY()+35, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 9999999);
				break;
			}
            m_uiAddSpawnTimer = 60000;
        } else m_uiAddSpawnTimer -= uiDiff;

		if(m_uiPhase == 1 && me->GetHealth()*100 / me->GetMaxHealth() < 81)
        {
                DoScriptText(SAY_TRANSFORM_1, me);
                DoCast(me, SPELL_TEAR_GAS);
				DoCast(me, SPELL_CREATE_CONCOTION);
                m_uiPhase = 2;
		        m_uiGooTimer = 35000;
		        m_uiBombtimer = 28000;
				m_uiUnstableExperimentTimer = 40000;
				m_uiAddSpawnTimer = 55000;
		} 

        if (m_uiPhase == 2)
        {
			if (m_uiUnstableExperimentTimer < uiDiff)
			{
						DoCast(me, SPELL_UNSTABLE_EXPERIMENT);
						me->MonsterTextEmote(EMOTE_UNSTABLE_EXPERIMENT,NULL);
						m_uiUnstableExperimentTimer = 40000;
						m_uiAddSpawnTimer = 10000;
			}
			} else m_uiUnstableExperimentTimer -= uiDiff;
			
			if (m_uiAddSpawnTimer < uiDiff)
			{
				switch(urand(0, 1))
				{
				case 0:
					me->SummonCreature(SUMMON_GASCLOUD, me->GetPositionX()-35, me->GetPositionY()+35, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 9999999);
					break;
				case 1:
					me->SummonCreature(SUMMON_VOLATILE_OOZE, me->GetPositionX()+35, me->GetPositionY()+35, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 9999999);
					break;
					m_uiAddSpawnTimer = 60000;
				} else m_uiAddSpawnTimer -= uiDiff;
			}

			if (m_uiBombtimer < uiDiff)
			{
				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
                DoCast(pTarget, SPELL_CHOKING_GAS_PROC);
				switch(urand(0, 1))
				{
				case 0:
                    me->SummonCreature(SUMMON_CHOKE, me->GetPositionX()+10, me->GetPositionY()+10, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 21000);
                    me->SummonCreature(SUMMON_CHOKE, me->GetPositionX()-15, me->GetPositionY()+10, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 21000);
                    me->SummonCreature(SUMMON_CHOKE, me->GetPositionX()+20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 21000);
					m_uiBombtimer = 26000;
					break;
				case 1:
					me->SummonCreature(SUMMON_CHOKE, me->GetPositionX()-10, me->GetPositionY()-10, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 21000);
                    me->SummonCreature(SUMMON_CHOKE, me->GetPositionX()+15, me->GetPositionY()-10, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 21000);
                    me->SummonCreature(SUMMON_CHOKE, me->GetPositionX()-20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 21000);
					m_uiBombtimer = 26000;
					break;
				)
            } else m_uiBombtimer -= uiDiff;

			if (m_uiGooTimer < uiDiff)
			{
				DoScriptText(SAY_AIRLOCK, me);
				uint32 count = RAID_MODE(1,2,1,2);
				for (uint8 i = 1; i <= count; i++)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
					DoCast(pTarget, RAID_MODE(SPELL_MALLEABLE_GOO_10_NORMAL,SPELL_MALLEABLE_GOO_25_NORMAL,SPELL_MALLEABLE_GOO_10_HEROIC,SPELL_MALLEABLE_GOO_25_HEROIC));
					m_uiGooTimer = 23000;
				}
			} else m_uiGooTimer -= uiDiff;
		}

		if(m_uiPhase == 2 && me->GetHealth()*100 / me->GetMaxHealth() < 36)
        {
                DoScriptText(SAY_TRANSFORM_2, me);
                DoCast(me, SPELL_TEAR_GAS);
				DoCast(me, SPELL_GUZZLE_POTIONS);
				DoCast(me, SPELL_MUTATED_STRENGTH);
				m_uiPhase = 3;
				m_uiPuddleTimer = 8000;
                m_uiUnboundPlague = 51000;
		}

		if (m_uiPhase == 3)
		{
			if (m_uiPuddleTimer < uiDiff)
			{
				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
                DoCast(pTarget, SPELL_SLIME_PUDDLE);
			} else m_uiPuddleTimer -= uiDiff;

			if (m_uiUnboundPlague <= uiDiff)
			{
				DoCast(me, SPELL_SLIME_PUDDLE);
				if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
				{
					Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
					DoCast(pTarget, SPELL_UNBOUND_PLAGUE);
				}
				DoScriptText(SAY_PHASE_HC, me);
				m_uiUnboundPlague = 48000;
			} else m_uiUnboundPlague -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

struct npc_volatile_oozeAI : public ScriptedAI
{
    npc_volatile_oozeAI(Creature *pCreature) : ScriptedAI(pCreature) 
    {
        me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_OOZE_ADHESIV, true);
    }

    uint64 TargetGUID;

    uint32 OozeAdhesivTimer;
    uint32 OozeExplosion;
    uint32 MovechaseTimer;

    void EnterCombat(Unit *who) 
    {
        DoZoneInCombat();
    }

    void Reset()
    {
        TargetGUID = 0;
        OozeAdhesivTimer = 35000;
        OozeExplosion = 30000;
        MovechaseTimer = 999999;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim()) 
            return;

        if (!me->HasAura(SPELL_OOZE_ADHESIV))
        {
            if (OozeAdhesivTimer < diff)
            {
                uint32 count = RAID_MODE(1,3,1,3);
                for (uint8 i = 1; i <= count; i++)
                {
                    DoCast(me, SPELL_OOZE_ADHESIV);
                    OozeAdhesivTimer = 999999;
                    MovechaseTimer = 10000;
                }
            } else OozeAdhesivTimer -= diff;
        }

        if (MovechaseTimer < diff)
        {
            MovechaseTimer = 2000;
        }
        else MovechaseTimer -= diff;


        if (OozeAdhesivTimer < diff)
        {
            if (me->IsWithinDistInMap(me, 3))
                DoCast(me, SPELL_OOZE_ERUPTION);
            OozeAdhesivTimer = 10000;
        } else OozeAdhesivTimer -= diff;
    }
};
struct npc_choke_bombAI : public ScriptedAI
{
    npc_choke_bombAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = pCreature->GetInstanceData();
    }
    ScriptedInstance* m_pInstance;
    uint32 m_uiChokeTimer;
    uint32 m_uiExplodeDespawn;
    void Reset()
    {
        float x, y, z;
        me->GetNearPoint(me, x, y, z, 1, 50, M_PI*2*rand_norm());
        me->GetMotionMaster()->MovePoint(0, x, y, z);
        me->SetVisibility(VISIBILITY_OFF);
        DoCast(me, RAID_MODE(SPELL_CHOKING_GAS_10_NORMAL,SPELL_CHOKING_GAS_25_NORMAL,SPELL_CHOKING_GAS_10_HEROIC,SPELL_CHOKING_GAS_25_HEROIC));
        me->SetReactState(REACT_PASSIVE);
        me->SetSpeed(MOVE_WALK, 1.5f, true);
        m_uiChokeTimer = 1000;
        m_uiExplodeDespawn = 20000;
    }
    void UpdateAI(const uint32 uiDiff)
    {
        if(m_uiChokeTimer <= uiDiff)
        {
            DoCast(me, RAID_MODE(SPELL_CHOKING_GAS_10_NORMAL,SPELL_CHOKING_GAS_25_NORMAL,SPELL_CHOKING_GAS_10_HEROIC,SPELL_CHOKING_GAS_25_HEROIC));
            m_uiChokeTimer = 15000;
        } else m_uiChokeTimer -= uiDiff;

        if(m_uiExplodeDespawn <= uiDiff)
        {
            DoCast(me, SPELL_CHOKING_GAS_EXPLOSION);
            me->ForcedDespawn();
        } m_uiExplodeDespawn -= uiDiff;
    }
};
CreatureAI* GetAI_npc_choke_bomb(Creature* pCreature)
{
    return new npc_choke_bombAI(pCreature);
}
CreatureAI* GetAI_npc_volatile_ooze(Creature* pCreature)
{
    return new npc_volatile_oozeAI(pCreature);
}

CreatureAI* GetAI_boss_professor_putricide(Creature* pCreature)
{
    return new boss_professor_putricideAI(pCreature);
}

void AddSC_boss_professor_putricide()
{
    Script *NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_professor_putricide";
    NewScript->GetAI = &GetAI_boss_professor_putricide;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "npc_volatile_ooze";
    NewScript->GetAI = &GetAI_npc_volatile_ooze;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "npc_choke_bomb";
    NewScript->GetAI = &GetAI_npc_choke_bomb;
    NewScript->RegisterSelf(); 
}