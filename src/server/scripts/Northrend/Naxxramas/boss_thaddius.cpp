/*
 * Copyright (C) 2008 - 2010 Trinity <http://www.trinitycore.org/>
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
#include "naxxramas.h"

//Stalagg
enum StalaggYells
{
    SAY_STAL_AGGRO          = -1533023,
    SAY_STAL_SLAY           = -1533024,
    SAY_STAL_DEATH          = -1533025
};

enum StalagSpells
{
    SPELL_POWERSURGE        = 28134,
    H_SPELL_POWERSURGE      = 54529,
    SPELL_MAGNETIC_PULL     = 28338,
    SPELL_STALAGG_TESLA     = 28097
};

//Feugen
enum FeugenYells
{
    SAY_FEUG_AGGRO          = -1533026,
    SAY_FEUG_SLAY           = -1533027,
    SAY_FEUG_DEATH          = -1533028
};

enum FeugenSpells
{
    SPELL_STATICFIELD       = 28135,
    H_SPELL_STATICFIELD     = 54528,
    SPELL_FEUGEN_TESLA      = 28109
};

// Thaddius DoAction
enum ThaddiusActions
{
    ACTION_FEUGEN_RESET,
    ACTION_FEUGEN_DIED,
    ACTION_STALAGG_RESET,
    ACTION_STALAGG_DIED
};

//generic
#define C_TESLA_COIL            16218           //the coils (emotes "Tesla Coil overloads!")
#define EMOTE_TESLA "Tesla Coil overloads!"

//Thaddius
enum ThaddiusYells
{
    SAY_GREET               = -1533029, //not used
    SAY_AGGRO_1             = -1533030,
    SAY_AGGRO_2             = -1533031,
    SAY_AGGRO_3             = -1533032,
    SAY_SLAY                = -1533033,
    SAY_ELECT               = -1533034, //not used
    SAY_DEATH               = -1533035,
    SAY_SCREAM1             = -1533036,
    SAY_SCREAM2             = -1533037,
    SAY_SCREAM3             = -1533038,
    SAY_SCREAM4             = -1533039
};

enum ThaddiusSpells
{
    SPELL_POLARITY_SHIFT        = 28089,
    SPELL_BALL_LIGHTNING        = 28299,
    SPELL_CHAIN_LIGHTNING       = 28167,
    H_SPELL_CHAIN_LIGHTNING     = 54531,
    SPELL_BERSERK               = 27680
};

enum Events
{
    EVENT_NONE,
    EVENT_SHIFT,
    EVENT_CHAIN,
    EVENT_BERSERK,
    EVENT_SCREAM,
};

// If Feugen or Stalagg gets too far from the Tesla Coil behind him, the raid will start taking unhealable AoE
#define SPELL_TESLA           32309 // similar spell from Patchwerk

#define TESLA_S_X             3450.45 // Stalagg - Tesla
#define TESLA_S_Y            -2931.42
#define TESLA_S_Z             312.091
#define TESLA_F_X             3508.14 // Feugen - Tesla
#define TESLA_F_Y            -2988.65
#define TESLA_F_Z             312.092

struct boss_thaddiusAI : public BossAI
{
    boss_thaddiusAI(Creature *c) : BossAI(c, BOSS_THADDIUS)
    {
        // init is a bit tricky because thaddius shall track the life of both adds, but not if there was a wipe
        // and, in particular, if there was a crash after both adds were killed (should not respawn)

        // Moreover, the adds may not yet be spawn. So just track down the status if mob is spawn
        // and each mob will send its status at reset (meaning that it is alive)
        checkFeugenAlive = false;
        if (Creature *pFeugen = me->GetCreature(*me, instance->GetData64(DATA_FEUGEN)))
            checkFeugenAlive = pFeugen->isAlive();

        checkStalaggAlive = false;
        if (Creature *pStalagg = me->GetCreature(*me, instance->GetData64(DATA_STALAGG)))
            checkStalaggAlive = pStalagg->isAlive();

        if (!checkFeugenAlive && !checkStalaggAlive)
        {
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
            me->SetReactState(REACT_AGGRESSIVE);
        }
        else
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
            me->SetReactState(REACT_PASSIVE);
        }
    }

    bool checkStalaggAlive;
    bool checkFeugenAlive;
    uint32 uiAddsTimer;

    void KilledUnit(Unit* victim)
    {
        if (!(rand()%5))
            DoScriptText(SAY_SLAY, me);
    }

    void JustDied(Unit* Killer)
    {
        _JustDied();
        DoScriptText(SAY_DEATH, me);
        me->SummonCreature(39000, 3517.93, -2942.52, 303.12, 2.096, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 300000); // Spawn NPC Teleporter, not offylike
    }

    void Reset()
    {
        if (!checkStalaggAlive)
        {
            if (instance)
                if (Creature *pStalagg = me->GetCreature(*me, instance->GetData64(DATA_STALAGG)))
                    pStalagg->Respawn();
        }
        else
        {
            if (instance)
                if (Creature *pFeugen = me->GetCreature(*me, instance->GetData64(DATA_FEUGEN)))
                    pFeugen->Respawn();
        }
        _Reset();
    }

    void DoAction(const int32 action)
    {
        switch(action)
        {
            case ACTION_FEUGEN_RESET:
                checkFeugenAlive = true;
                break;
            case ACTION_FEUGEN_DIED:
                checkFeugenAlive = false;
                break;
            case ACTION_STALAGG_RESET:
                checkStalaggAlive = true;
                break;
            case ACTION_STALAGG_DIED:
                checkStalaggAlive = false;
                break;
        }

        if (!checkFeugenAlive && !checkStalaggAlive)
        {
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
            // REACT_AGGRESSIVE only reset when he takes damage.
            DoZoneInCombat();
        }
        else
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED);
            me->SetReactState(REACT_PASSIVE);
        }
    }

    void EnterCombat(Unit *who)
    {
        _EnterCombat();
        DoScriptText(RAND(SAY_AGGRO_1,SAY_AGGRO_2,SAY_AGGRO_3), me);
        events.ScheduleEvent(EVENT_SHIFT, 30000);
        events.ScheduleEvent(EVENT_CHAIN, urand(10000,20000));
        events.ScheduleEvent(EVENT_BERSERK, 360000);
    }

    void DamageTaken(Unit *pDoneBy, uint32 &uiDamage)
    {
        me->SetReactState(REACT_AGGRESSIVE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (checkFeugenAlive && checkStalaggAlive)
            uiAddsTimer = 0;

        if (checkStalaggAlive != checkFeugenAlive)
        {
            uiAddsTimer += diff;
            if (uiAddsTimer > 5000)
            {
                if (!checkStalaggAlive)
                {
                    if (instance)
                        if (Creature *pStalagg = me->GetCreature(*me, instance->GetData64(DATA_STALAGG)))
                            pStalagg->Respawn();
                }
                else
                {
                    if (instance)
                        if (Creature *pFeugen = me->GetCreature(*me, instance->GetData64(DATA_FEUGEN)))
                            pFeugen->Respawn();
                }
            }
        }

        if (!UpdateVictim())
            return;
        
        events.Update(diff);

        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        while(uint32 eventId = events.ExecuteEvent())
        {
            switch(eventId)
            {
                case EVENT_SHIFT:
                    DoCastAOE(SPELL_POLARITY_SHIFT);
                    events.ScheduleEvent(EVENT_SHIFT, 30000);
                    return;
                case EVENT_CHAIN:
                    DoCast(me->getVictim(), RAID_MODE(SPELL_CHAIN_LIGHTNING, H_SPELL_CHAIN_LIGHTNING));
                    events.ScheduleEvent(EVENT_CHAIN, urand(10000,20000));
                    return;
                case EVENT_BERSERK:
                    DoCast(me, SPELL_BERSERK);
                    return;
                case EVENT_SCREAM:
                    DoScriptText(RAND(SAY_SCREAM1,SAY_SCREAM2,SAY_SCREAM3,SAY_SCREAM4), me);
                    events.ScheduleEvent(EVENT_SCREAM, urand(45000,60000));
                    return;
            }
        }

        if (events.GetTimer() > 15000 && !me->IsWithinMeleeRange(me->getVictim()))
            DoCast(me->getVictim(), SPELL_BALL_LIGHTNING);
        else
            DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_thaddius(Creature* pCreature)
{
    return new boss_thaddiusAI (pCreature);
}

struct mob_stalaggAI : public ScriptedAI
{
    mob_stalaggAI(Creature *c) : ScriptedAI(c) 
    {
        pInstance = c->GetInstanceData();
    }

    ScriptedInstance* pInstance;

    uint32 powerSurgeTimer;
    uint32 magneticPullTimer;

    void Reset()
    {
        if (pInstance)
            if (Creature *pThaddius = me->GetCreature(*me, pInstance->GetData64(DATA_THADDIUS)))
                if (pThaddius->AI())
                    pThaddius->AI()->DoAction(ACTION_STALAGG_RESET);
        powerSurgeTimer = urand(20000,25000);
        magneticPullTimer = 20000;
    }

    void EnterCombat(Unit *pWho)
    {
        DoCast(SPELL_STALAGG_TESLA);
        DoScriptText(SAY_STAL_AGGRO, me);
    }

    void JustDied(Unit *killer)
    {
        if (pInstance)
            if (Creature *pThaddius = me->GetCreature(*me, pInstance->GetData64(DATA_THADDIUS)))
                if (pThaddius->AI())
                    {
                        pThaddius->AI()->DoAction(ACTION_STALAGG_DIED);
                        DoScriptText(SAY_STAL_DEATH, me);
                    }
    }

    void KilledUnit(Unit* victim)
    {
        DoScriptText(SAY_STAL_SLAY, me);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        // Tesla distance check
        if(me->GetDistance(TESLA_S_X, TESLA_S_Y, TESLA_S_Z) >= 25)
        {
            me->MonsterTextEmote(EMOTE_TESLA, 0, true);
            DoCastAOE(SPELL_TESLA);
        }

        if (magneticPullTimer <= uiDiff)
        {
            if (Creature *pFeugen = me->GetCreature(*me, pInstance->GetData64(DATA_FEUGEN)))
            {
                Unit* pStalaggVictim = me->getVictim();
                Unit* pFeugenVictim = pFeugen->getVictim();

                if (pFeugenVictim && pStalaggVictim)
                {
                    // store tank threat before any other change is made
                    int32 threatStalaggVictim = me->getThreatManager().getThreat(pStalaggVictim);
                    int32 threatFeugenVictim = pFeugen->getThreatManager().getThreat(pFeugenVictim);
						
                    // magnetic pull is not working. So just jump.
                    // reset aggro to be sure that feugen will not follow the jump
                    pFeugen->getThreatManager().modifyThreatPercent(pFeugenVictim, -100);
                    me->getThreatManager().modifyThreatPercent(pStalaggVictim, -100);
                    
                    // threat switching between tanks, using the previously stored values
                    pFeugen->getThreatManager().addThreat(pStalaggVictim, threatStalaggVictim);
                    me->getThreatManager().addThreat(pFeugenVictim, threatFeugenVictim);

                    pFeugenVictim->JumpTo(me, 0.3f); 
                    pStalaggVictim->JumpTo(pFeugen, 0.3f);
                }
            }
            magneticPullTimer = 20000;
        }
        else magneticPullTimer -= uiDiff;

        if (powerSurgeTimer <= uiDiff)
        {
            DoCast(me, RAID_MODE(SPELL_POWERSURGE, H_SPELL_POWERSURGE));
            powerSurgeTimer = urand(15000,20000);
        } else powerSurgeTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_stalagg(Creature* pCreature)
{
    return new mob_stalaggAI(pCreature);
}

struct mob_feugenAI : public ScriptedAI
{
    mob_feugenAI(Creature *c) : ScriptedAI(c) 
    {
        pInstance = c->GetInstanceData();
    }

    ScriptedInstance* pInstance;

    uint32 staticFieldTimer;

    void Reset()
    {
        if (pInstance)
            if (Creature *pThaddius = me->GetCreature(*me, pInstance->GetData64(DATA_THADDIUS)))
                if (pThaddius->AI())
                    pThaddius->AI()->DoAction(ACTION_FEUGEN_RESET);
        staticFieldTimer = 5000;
    }

    void EnterCombat(Unit *pWho)
    {
        DoCast(SPELL_FEUGEN_TESLA);
        DoScriptText(SAY_FEUG_AGGRO, me);
    }

    void JustDied(Unit *killer)
    {
        if (pInstance)
            if (Creature *pThaddius = me->GetCreature(*me, pInstance->GetData64(DATA_THADDIUS)))
                if (pThaddius->AI())
                    {
                        DoScriptText(SAY_FEUG_DEATH, me);
                        pThaddius->AI()->DoAction(ACTION_FEUGEN_DIED);
                    }
    }

    void KilledUnit(Unit* victim)
    {
        DoScriptText(SAY_FEUG_SLAY, me);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        // Tesla distance check
        if(me->GetDistance(TESLA_F_X, TESLA_F_Y, TESLA_F_Z) >= 25)
        {
            me->MonsterTextEmote(EMOTE_TESLA, 0, true);
            DoCastAOE(SPELL_TESLA);
        }

        if (staticFieldTimer <= uiDiff)
        {
            DoCast(me, RAID_MODE(SPELL_STATICFIELD, H_SPELL_STATICFIELD));
            staticFieldTimer = 5000;
        } else staticFieldTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_feugen(Creature* pCreature)
{
    return new mob_feugenAI(pCreature);
}

void AddSC_boss_thaddius()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_thaddius";
    newscript->GetAI = &GetAI_boss_thaddius;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_stalagg";
    newscript->GetAI = &GetAI_mob_stalagg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_feugen";
    newscript->GetAI = &GetAI_mob_feugen;
    newscript->RegisterSelf();
}