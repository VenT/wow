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

#define GOSSIP_START_EVENT "We are ready, Tirion!"

enum Yells
{
    SAY_INTRO_1_KING            =    -1810001,
    SAY_INTRO_2_TIRION          =    -1810002,
    SAY_INTRO_3_KING            =    -1810003,
    SAY_INTRO_4_TIRION          =    -1810004,
    SAY_INTRO_5_KING            =    -1810005,
    SAY_AGGRO_KING              =    -1810006,
    SAY_REMORSELESS_WINTER      =    -1810007,
    SAY_RANDOM_1                =    -1810008,
    SAY_RANDOM_2                =    -1810009,
    SAY_KILL_1                  =    -1810010,
    SAY_KILL_2                  =    -1810011,
    SAY_BERSERK                 =    -1810012,
    SAY_ENDING_1_KING           =    -1810013,
    SAY_ENDING_2_KING           =    -1810014,
    SAY_ENDING_3_KING           =    -1810015,
    SAY_ENDING_4_KING           =    -1810016,
    SAY_ENDING_5_TIRION         =    -1810017,
    SAY_ENDING_6_KING           =    -1810018,
    SAY_ENDING_7_KING           =    -1810019,
    SAY_ENDING_8_TIRION         =    -1810020,
    SAY_ENDING_9_FATHER         =    -1810021,
    SAY_ENDING_10_TIRION        =    -1810022,
    SAY_ENDING_11_FATHER        =    -1810023,
    SAY_ENDING_12_KING          =    -1810024,
    SAY_DEATH_KING              =    -1810025,    
    SAY_ESCAPE_FROSTMOURNE      =    -1810026,
    SAY_HARVEST_SOUL            =    -1810027,
    SAY_DEVOURED_FROSTMOURNE    =    -1810028,
    SAY_SUMMON_VALKYR           =    -1810029,
    SAY_BROKEN_ARENA            =    -1810030,
    SAY_10_PROZENT              =    -1810031, 
};

enum Creatures
{    
    CREATURE_TIRION_ICC           =    38995,    
    CREAUTRE_MENETHIL             =    38579,
    CREATURE_FROSTMOURNE_TRIGGER  =    38584,
    CREATURE_ICE_SPHERE           =    36633,
    CREATURE_VALKYR               =    36609,
    CREATURE_DEFILE               =    38757,
    CREATURE_RAGING_SPIRIT        =    36701,
    CREATURE_TRIGGER              =    30494,
};

enum Models
{
    MODEL_INVISIBLE               =    11686,
};

enum Spells
{
    SPELL_SUMMON_SHAMBLING_HORROR    =    70372,
    SPELL_SUMMON_DRUDGE_GHOULS       =    70358,
    SPELL_INFEST                     =    70541,
    SPELL_NECROTIC_PLAGUE            =    70337,
    SPELL_PLAGUE_SIPHON              =    74074,
    SPELL_REMORSELES_WINTER          =    68981,
    SPELL_PAIN_AND_SUFFERING         =    72133,
    SPELL_SUMMON_ICE_SPEHERE         =    69104,
    SPELL_SUMMON_RAGING_SPIRIT       =    69200,
    SPELL_SUMMON_VALKYR              =    69037,
    SPELL_SOUL_REAPER                =    69409,
    SPELL_SUMMON_DEFILE              =    72754,
    SPELL_HARVEST_SOUL_TELEPORT      =    71372,
    SPELL_SUMMON_VILE_SPIRIT         =    70498,
    SPELL_HARVEST_SOULS              =    74325,
    SPELL_QUAKE                      =    72262,
    SPELL_CHANNEL_KING               =    71769,
    SPELL_BROKEN_FROSTMOURNE         =    72398,
    SPELL_BOOM_VISUAL                =    72726,
    SPELL_ICEBLOCK_TRIGGER           =    71614,
    SPELL_TIRION_LIGHT               =    71797,
    SPELL_FROSTMOURNE_TRIGGER        =    72405,
    SPELL_SUMMON_BROKEN_FROSTMOURNE  =    72406,
    SPELL_DISENGAGE                  =    61508,
    SPELL_FURY_OF_FROSTMOURNE        =    70063,
    SPELL_REVIVE_VISUAL              =    37755,
    SPELL_REVIVE                     =    51918,
    SPELL_CLONE_PLAYER               =    57507,
    SPELL_BERSERK                    =    26662,
    SPELL_RAGING_SPIRIT_VISUAL       =    69198,
    SPELL_DAMAGE_DEFILE              =    72743,
    SPELL_SPAWN_DEFILE               =    72762,
    SPELL_ICE_SPHERE_VISUAL          =    69090,
    SPELL_ICE_PULSE                  =    69091,
    SPELL_ICE_BURST                  =    69108,
};

enum DefileDamage
{
    DEFILE_N_10_DAMAGE    =    3000,
    DEFILE_N_25_DAMAGE    =    5000,
};

#define MOVIE_ID_ARTHAS_DEATH    14

const Position MovePosition = {461.792633, -2125.855957, 1040.860107};
const Position MoveEndingPosition = {503.156525, -2124.516602, 1040.860107};
const Position MoveTirionFrostmourne = {490.110779, -2124.989014, 1040.860352};
const Position MoveTirionAttack = {478.333466, -2124.618652, 1040.859863}; 
const Position ValkyrMoveMent = {498.004486, 2201.573486, 1046.093872};

struct Locations
{
    float x,y,z;
};

static Locations TeleportPoint[]=
{
    {959.996, 212.576, 193.843},
    {932.537, 231.813, 193.838},
    {958.675, 254.767, 193.822},
    {946.955, 201.316, 192.535},
    {944.294, 149.676, 197.551},
    {930.548, 284.888, 193.367},
    {965.997, 278.398, 195.777}
};

Creature* pLichKing;
Creature* pTirion;
Creature* pFather;
Creature* pFrostmourne;
Creature* pSafeZone;

struct boss_lich_kingAI : public ScriptedAI
{
    boss_lich_kingAI(Creature* pCreature) : ScriptedAI(pCreature), summons(me) 
    {
        m_pInstance = pCreature->GetInstanceData();
        pLichKing = me;
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiEndingTimer;
    uint32 m_uiEndingPhase;
    uint32 m_uiPhase;
    uint32 m_uiTirionSpawnTimer;
    uint32 m_uiSummonShamblingHorrorTimer;
    uint32 m_uiSummonDrudgeGhoulsTimer;
    uint32 m_uiInfestTimer;
    uint32 m_uiNecroticPlagueTimer;
    uint32 m_uiPlagueSiphonTimer;
    uint32 m_uiBerserkTimer;
    uint32 m_uiSummonValkyrTimer;
    uint32 m_uiSoulReaperTimer;
    uint32 m_uiDefileTimer;
    uint32 m_uiHarvestSoulTimer;
    uint32 m_uiSummonVileSpiritTimer;
    uint32 m_uiFrostGramPortTimer;
    uint32 m_uiRemorselesWinterTimer;
    uint32 m_uiPainandSufferingTimer;
    uint32 m_uiQuakeTimer;
    uint32 m_uiIcePulsSummonTimer;
    uint32 m_uiSummonSpiritTimer;
    uint32 m_uiRandomSpeechTimer;

    bool m_bIsDeathPhase;
    bool m_bIsTirionSpawned;
    bool m_bIsTriggerSpawned;
    bool m_bIsBerserk;
    bool m_bIsSwitchPhase1;
    bool m_bIsSwitchPhase2;

    SummonList summons;

    void Reset()
    {
        me->SetReactState(REACT_PASSIVE);

        m_uiPhase = 0;
        m_uiRandomSpeechTimer = 33000; 
        m_uiBerserkTimer = 900000;
        m_uiSummonShamblingHorrorTimer = 20000;
        m_uiSummonDrudgeGhoulsTimer = 20000;
        m_uiInfestTimer = 30000;
        m_uiNecroticPlagueTimer = 30000;
        m_uiPlagueSiphonTimer = 5000;
        m_uiTirionSpawnTimer = 5000;
        m_uiRemorselesWinterTimer = 5000;
        m_uiQuakeTimer = 70000;
        m_uiIcePulsSummonTimer = 10000;
        m_uiPainandSufferingTimer = 10000;
        m_uiSummonSpiritTimer = 18000;
        m_uiSummonValkyrTimer = 20000;
        m_uiSoulReaperTimer = 15000;
        m_uiDefileTimer = 25000;
        m_uiInfestTimer = 40000;
        m_uiSummonVileSpiritTimer = 30000;
        m_uiHarvestSoulTimer = 70000;
        m_uiFrostGramPortTimer = 900000;

        m_bIsDeathPhase = false;
        m_bIsTirionSpawned = false;
        m_bIsTriggerSpawned = false;
        m_bIsBerserk = false;
        m_bIsSwitchPhase1 = false;
        m_bIsSwitchPhase2 = false;

        if(m_pInstance)
            m_pInstance->SetData(DATA_LICH_KING_EVENT, NOT_STARTED);  

        summons.DespawnAll();

        me->SetSpeed(MOVE_RUN, 1.8f);

        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISARMED);
    }

    void EnterCombat(Unit* pWho)
    {
        DoScriptText(SAY_AGGRO_KING, me);
        m_uiPhase = 1;
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH_KING, me);

        Map::PlayerList const &PlList = me->GetMap()->GetPlayers();

        if (PlList.isEmpty())
            return;

        for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
        {
            if (Player* pPlayer = i->getSource())
            {
                pPlayer->SendMovieStart(16);
            }
        }

        if(m_pInstance)
            m_pInstance->SetData(DATA_LICH_KING_EVENT, DONE);  
    }

    void JustReachedHome()
    {
        if(m_pInstance)
            m_pInstance->SetData(DATA_LICH_KING_EVENT, FAIL);  
    }

    void KilledUnit(Unit *victim)
    {
        if(!m_bIsDeathPhase)
            DoScriptText(RAND(SAY_KILL_1,SAY_KILL_2), me);
    }

    void SummonedCreatureDespawn(Creature *pSummoned) 
    {
        summons.Despawn(pSummoned);
    }

    void JustSummoned(Creature *pSummoned) 
    {
        if (pSummoned->GetEntry() == CREATURE_ICE_SPHERE)

            if(Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
            {
                pSummoned->AI()->AttackStart(pTarget);
            }
    }

    void SetEnding()
    {
        m_uiEndingTimer    = 4000;
        m_uiEndingPhase    = 1;
        EndingPhase();
    }

    void Phasenswitch()
    {
        me->SetReactState(REACT_PASSIVE);
        me->AttackStop();
        me->GetMotionMaster()->MovePoint(0, MoveEndingPosition);
    }

    void KingEnding(uint32 uiTimer)
    {
        m_uiEndingTimer = uiTimer;
        ++m_uiEndingPhase;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiTirionSpawnTimer < uiDiff && !m_bIsTirionSpawned)
        {
            me->SummonCreature(CREATURE_TIRION_ICC, 528.552002, -2124.620117, 1040.859985, 3.183670, TEMPSUMMON_CORPSE_DESPAWN, 5000);
            m_bIsTirionSpawned = true;
        } else m_uiTirionSpawnTimer -= uiDiff;

        if(!UpdateVictim())
            return;

        if(!m_bIsDeathPhase)
        {
            if (m_uiRandomSpeechTimer < uiDiff)
            {
                DoScriptText(RAND(SAY_RANDOM_1,SAY_RANDOM_2), me);
                m_uiRandomSpeechTimer = 33000;
            } else m_uiRandomSpeechTimer -= uiDiff;
        }


        if (m_uiBerserkTimer < uiDiff && !m_bIsBerserk)
        {
            DoScriptText(SAY_BERSERK, me);
            DoCast(me, SPELL_BERSERK);
            m_bIsBerserk = true;
        }
        else m_uiBerserkTimer -= uiDiff;

        if(m_uiPhase == 1)
        {
            if (m_uiInfestTimer < uiDiff)
            {
                DoCast(me, SPELL_INFEST);
                m_uiInfestTimer = 30000;
            } else m_uiInfestTimer -= uiDiff;

            if (m_uiPlagueSiphonTimer < uiDiff)
            {
                DoCast(me, SPELL_PLAGUE_SIPHON);
                m_uiPlagueSiphonTimer = 30000;
            } else m_uiPlagueSiphonTimer -= uiDiff;

            if (m_uiSummonDrudgeGhoulsTimer < uiDiff)
            {
                DoCast(me, SPELL_SUMMON_DRUDGE_GHOULS);
                m_uiSummonDrudgeGhoulsTimer = 20000;
            } else m_uiSummonDrudgeGhoulsTimer -= uiDiff;

            if (m_uiSummonShamblingHorrorTimer < uiDiff)
            {
                DoCast(me, SPELL_SUMMON_SHAMBLING_HORROR);
                m_uiSummonShamblingHorrorTimer = 60000;
            } else m_uiSummonShamblingHorrorTimer -= uiDiff;

            if (m_uiNecroticPlagueTimer < uiDiff)
            {
                Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
                DoCast(pTarget, SPELL_NECROTIC_PLAGUE);
                m_uiNecroticPlagueTimer = 5000;
            } else m_uiNecroticPlagueTimer -= uiDiff;
        }

        if(m_uiPhase == 2)
        {
            if (m_uiRemorselesWinterTimer < uiDiff)
            {
                DoScriptText(SAY_REMORSELESS_WINTER, me);
                DoCast(me, SPELL_REMORSELES_WINTER);
                m_uiRemorselesWinterTimer = 90000;
            } else m_uiRemorselesWinterTimer -= uiDiff;

            if (m_uiSummonSpiritTimer < uiDiff)
            {
                Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
                DoCast(pTarget, SPELL_SUMMON_RAGING_SPIRIT);
                m_uiSummonSpiritTimer    = 16000;
            } else m_uiSummonSpiritTimer -= uiDiff;

            if (m_uiIcePulsSummonTimer < uiDiff)
            {
                DoCast(me, SPELL_SUMMON_ICE_SPEHERE);
                m_uiIcePulsSummonTimer    = 15000;
            } else m_uiIcePulsSummonTimer -= uiDiff;

            if (m_uiPainandSufferingTimer < uiDiff)
            {
                Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
                DoCast(pTarget, SPELL_PAIN_AND_SUFFERING);
                m_uiPainandSufferingTimer = 2000;
            } else m_uiPainandSufferingTimer -= uiDiff;

            if (m_uiQuakeTimer < uiDiff)
            {
                DoScriptText(SAY_BROKEN_ARENA, me);
                DoCast(me, SPELL_QUAKE);
                me->SetReactState(REACT_AGGRESSIVE);
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveChase(me->getVictim());
                m_uiPhase = 3;

            } else m_uiQuakeTimer -= uiDiff;
        }

        if(m_uiPhase == 3)
        {
            if (m_uiDefileTimer < uiDiff)
            {
                Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
                DoCast(pTarget, SPELL_SPAWN_DEFILE);
                m_uiDefileTimer = 20000;
            } else m_uiDefileTimer -= uiDiff;

            if (m_uiSummonValkyrTimer < uiDiff)
            {
                DoScriptText(SAY_SUMMON_VALKYR, me);
                me->SummonCreature(CREATURE_VALKYR, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()+10, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 99999999);
                //DoCast(me, SPELL_SUMMON_VALKYR);
                m_uiSummonValkyrTimer = 20000;
            } else m_uiSummonValkyrTimer -= uiDiff;

            if (m_uiSoulReaperTimer < uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SOUL_REAPER);
                m_uiSoulReaperTimer = 20000;
            } else m_uiSoulReaperTimer -= uiDiff;

            if (m_uiInfestTimer < uiDiff)
            {
                DoCast(me, SPELL_INFEST);
                m_uiInfestTimer = 30000;
            } else m_uiInfestTimer -= uiDiff;
        }

        if(m_uiPhase == 4)
        {
            if (m_uiRemorselesWinterTimer < uiDiff)
            {
                DoScriptText(SAY_REMORSELESS_WINTER, me);
                DoCast(me, SPELL_REMORSELES_WINTER);
                m_uiRemorselesWinterTimer = 90000;
            } else m_uiRemorselesWinterTimer -= uiDiff;

            if (m_uiSummonSpiritTimer < uiDiff)
            {
                Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
                DoCast(pTarget, SPELL_SUMMON_RAGING_SPIRIT);
                m_uiSummonSpiritTimer = 16000;
            } else m_uiSummonSpiritTimer -= uiDiff;

            if (m_uiIcePulsSummonTimer < uiDiff)
            {
                DoCast(me, SPELL_SUMMON_ICE_SPEHERE);
                m_uiIcePulsSummonTimer    = 15000;
            } else m_uiIcePulsSummonTimer -= uiDiff;

            if (m_uiPainandSufferingTimer < uiDiff)
            {
                Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
                DoCast(pTarget, SPELL_PAIN_AND_SUFFERING);
                m_uiPainandSufferingTimer = 3000;
            } else m_uiPainandSufferingTimer -= uiDiff;

            if (m_uiQuakeTimer < uiDiff)
            {
                DoScriptText(SAY_BROKEN_ARENA, me);
                DoCast(me, SPELL_QUAKE);
                me->SetReactState(REACT_AGGRESSIVE);
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveChase(me->getVictim());
                m_uiPhase = 5;
            } else m_uiQuakeTimer -= uiDiff;
        }

        if(m_uiPhase == 5)
        {
            if (m_uiSummonVileSpiritTimer < uiDiff)
            {
                DoCast(me, SPELL_SUMMON_VILE_SPIRIT);
                m_uiSummonVileSpiritTimer = 30000;
            } else m_uiSummonVileSpiritTimer -= uiDiff;

            if (m_uiHarvestSoulTimer < uiDiff)
            {
                DoScriptText(SAY_HARVEST_SOUL, me);
                Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
                DoCast(pTarget, SPELL_HARVEST_SOULS);
                m_uiHarvestSoulTimer = 70000;
            } else m_uiHarvestSoulTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();

        if (m_uiEndingTimer <= uiDiff)
            EndingPhase();
        else m_uiEndingTimer -= uiDiff;

        if (HealthBelowPct(70) && !m_bIsSwitchPhase1)
        {
            m_uiPhase = 2;
            Phasenswitch();
            m_bIsSwitchPhase1 = true;
        }
        else
            if (HealthBelowPct(40) && !m_bIsSwitchPhase2)
            {
                m_uiPhase = 4;
                m_uiRemorselesWinterTimer = 5000;
                m_uiQuakeTimer = 70000;
                m_uiIcePulsSummonTimer    = 10000;
                m_uiPainandSufferingTimer = 10000;
                m_uiSummonSpiritTimer = 18000;
                Phasenswitch();
                m_bIsSwitchPhase2 = true;
            }
            else 
                if (HealthBelowPct(11) && !m_bIsTriggerSpawned)
                {
                    pSafeZone = me->SummonCreature(CREATURE_TRIGGER, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_CORPSE_DESPAWN, 360000);
                    pSafeZone->AI()->AttackStart(me);
                    pSafeZone->SetDisplayId(MODEL_INVISIBLE);
                    m_bIsTriggerSpawned = true;
                }
                else 
                    if (HealthBelowPct(10) && !m_bIsDeathPhase)
                    {
                        m_uiPhase = 6;
                        m_bIsDeathPhase = true;
                        SetEnding();
                    }
    }

    void ReviveCinematic()
    {
        Map::PlayerList const &PlList = pFather->GetMap()->GetPlayers();

        if (PlList.isEmpty())
            return;

        for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
        {
            if (Player* pPlayer = i->getSource())
            {
                if (pPlayer && pPlayer->isDead())
                {
                    pFather->CastSpell(pPlayer, 26687, true);
                    pPlayer->ResurrectPlayer(100, false);
                }
            }
        }
    }

    void EndingPhase()
    {
        if( m_uiEndingTimer )
        {
            switch(m_uiEndingPhase)
            {
            case 1: 
                me->GetMotionMaster()->MoveIdle();
                me->SetReactState(REACT_PASSIVE);
                me->AttackStop();
                me->CastStop();
                DoResetThreat();
                DoScriptText(SAY_10_PROZENT, me);
                DoCastAOE(SPELL_FURY_OF_FROSTMOURNE);
                KingEnding(5000);
                break;
            case 2:
                KingEnding(10000);
                break;
            case 3: 
                DoScriptText(SAY_ENDING_1_KING, me);
                KingEnding(24000);
                break;
            case 4: 
                DoScriptText(SAY_ENDING_2_KING, me);
                KingEnding(25000);
                break;
            case 5:
                me->GetMotionMaster()->MovePoint(0, MoveEndingPosition);
                KingEnding(4000);
                break;
            case 6: 
                DoCastAOE(SPELL_CHANNEL_KING);
                DoScriptText(SAY_ENDING_3_KING, me);
                KingEnding(26000);
                break;
            case 7: 
                DoScriptText(SAY_ENDING_4_KING, me);
                KingEnding(9000);
                break;
            case 8: 
                DoScriptText(SAY_ENDING_5_TIRION, pTirion);
                KingEnding(9000);
                break;
            case 9:
                DoCast(pTirion, SPELL_TIRION_LIGHT);
                KingEnding(5000);
                break;
            case 10:
                pTirion->RemoveAurasDueToSpell(SPELL_ICEBLOCK_TRIGGER);
                KingEnding(2000);
                break;
            case 11:
                pTirion->GetMotionMaster()->MovePoint(0, MoveTirionFrostmourne);
                KingEnding(1000);
                break;
            case 12:
                pTirion->GetMotionMaster()->MoveJump(517.482910, -2124.905762, 1040.861328, 10.0f, 15.0f); //pTirion->JumpTo(pFrostmourne, 15.0f);
                pTirion->SetUInt32Value(UNIT_NPC_EMOTESTATE, 375);
                KingEnding(1000);
                break;
            case 13:
                me->RemoveAura(SPELL_CHANNEL_KING);
                me->CastSpell(me, SPELL_BOOM_VISUAL, false);
                KingEnding(300);
                break;
            case 14:
                me->CastSpell(me, SPELL_SUMMON_BROKEN_FROSTMOURNE, false);
                KingEnding(3000);
                break;
            case 15:
                me->CastSpell(me, 73017, false);
                KingEnding(1000);
                break;
            case 16:
                DoScriptText(SAY_ENDING_6_KING, me);
                KingEnding(3000);
                break;
            case 17:
                pFrostmourne = me->SummonCreature(27880, me->GetPositionX()+2, me->GetPositionY()+2, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 99999999);
                pFrostmourne->CastSpell(pFrostmourne, SPELL_BROKEN_FROSTMOURNE, false);
                pFrostmourne->CastSpell(pFrostmourne, SPELL_FROSTMOURNE_TRIGGER, false);
                pFrostmourne->GetMotionMaster()->MoveChase(me);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISARMED);
                //pTirion->CastSpell(pTirion, SPELL_DISENGAGE, false);
                KingEnding(2000);
                break;
            case 18:
                me->RemoveAllAuras();
                me->RemoveAura(SPELL_SUMMON_BROKEN_FROSTMOURNE);
                DoScriptText(SAY_ENDING_7_KING, me);
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 473);
                KingEnding(5000);
                break;
            case 19:
                DoScriptText(SAY_ENDING_8_TIRION, pTirion);
                KingEnding(6000);
                break;
            case 20:
                pFather = me->SummonCreature(CREAUTRE_MENETHIL, me->GetPositionX()+5, me->GetPositionY()+5, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 9999999);
                DoScriptText(SAY_ENDING_9_FATHER, pFather);
                ReviveCinematic();
                KingEnding(6000);
                break;
            case 21:
                DoScriptText(SAY_ENDING_11_FATHER, pFather);
                pFather->CastSpell(pFather, SPELL_REVIVE_VISUAL, false);
                KingEnding(6000);
                break;
            case 22:
                DoScriptText(SAY_ENDING_10_TIRION, pTirion);
                KingEnding(5000);
                break;
            case 23:
                DoScriptText(SAY_ENDING_12_KING, me);
                //pTirion->SetReactState(REACT_AGGRESSIVE);
                //pTirion->AI()->AttackStart(me);
                //pFather->AI()->AttackStart(me);
                KingEnding(5000);
                break;
            }
        }
    }
};

struct npc_tirion_citadell_iccAI : public ScriptedAI
{
    npc_tirion_citadell_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        pTirion = me;
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiIntroTimer;
    uint32 m_uiIntroPhase;

    void Reset()
    {
        m_uiIntroTimer    = 0;
        m_uiIntroPhase    = 0;

        me->SetReactState(REACT_PASSIVE);
        me->SetSpeed(MOVE_RUN, 1.8f);
        me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
    }

    void StartEvent()
    {
        m_uiIntroTimer = 1000;
        m_uiIntroPhase = 1;
        Intro(); 
    }

    void KingIntro(uint32 uiTimer)
    {
        m_uiIntroTimer = uiTimer;
        ++m_uiIntroPhase;
    }

    void Intro()
    {
        if( m_uiIntroTimer )
        {
            switch( m_uiIntroPhase )
            {
            case 1:
                if(m_pInstance)
                    m_pInstance->SetData(DATA_LICH_KING_EVENT, IN_PROGRESS);
                pLichKing->SetStandState(UNIT_STAND_STATE_STAND);
                pLichKing->AddUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
                pLichKing->SetSpeed(MOVE_WALK, 1.2f);
                pLichKing->GetMotionMaster()->MovePoint(0, MovePosition);
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 375);
                KingIntro(3000);
                break;
            case 2: 
                pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 1);
                DoScriptText(SAY_INTRO_1_KING, pLichKing);
                KingIntro(14000);
                break;
            case 3:
                pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
                DoScriptText(SAY_INTRO_2_TIRION, me);
                KingIntro(9000);
                break;
            case 4:
                DoScriptText(SAY_INTRO_3_KING, pLichKing);
                pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 392);
                KingIntro(3000);
                break;
            case 5:
                pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 397);
                KingIntro(2000);
                break;
            case 6:
                pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
                KingIntro(21000);
                break;
            case 7:
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 397);
                DoScriptText(SAY_INTRO_4_TIRION, me);
                KingIntro(1000);
                break;
            case 8:
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
                me->GetMotionMaster()->MovePoint(0, MoveTirionAttack);
                KingIntro(4000);
                break;
            case 9:
                me->CastSpell(pLichKing, SPELL_ICEBLOCK_TRIGGER, false);
                KingIntro(2000);
                break;
            case 10:
                pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 1);
                DoScriptText(SAY_INTRO_5_KING, pLichKing);
                KingIntro(12000);
                break;
            case 11:
                pLichKing->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
                pLichKing->SetReactState(REACT_AGGRESSIVE);
                KingIntro(6000);
                break;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiIntroTimer <= uiDiff)
            Intro();
        else m_uiIntroTimer -= uiDiff;

        if (m_pInstance)
            if(m_pInstance->GetData(DATA_LICH_KING_EVENT) != NOT_STARTED)
            {
                me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }
    }
};

struct npc_ice_puls_iccAI : public ScriptedAI
{
    npc_ice_puls_iccAI(Creature *pCreature) : ScriptedAI(pCreature) 
    {
        DoCast(me, SPELL_ICE_SPHERE_VISUAL);
    }

    uint32 m_uiIcePulseTimer;
    uint32 m_uiIceBurstCheckTimer;

    void Reset()
    {
        m_uiIcePulseTimer    = 2000;
        m_uiIceBurstCheckTimer    = 2000;
    }

    void EnterCombat(Unit *who) 
    {
        DoZoneInCombat();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim()) 
            return;

        if (me->getVictim()->GetTypeId() != TYPEID_PLAYER) 
            return; 

        if (m_uiIcePulseTimer < uiDiff)
        {
            DoCast(me, SPELL_ICE_PULSE);
        } else m_uiIcePulseTimer -= uiDiff;

        if (m_uiIceBurstCheckTimer < uiDiff)
        {
            if (me->IsWithinDistInMap(me->getVictim(), 3))
                DoCast(me, SPELL_ICE_BURST);
            m_uiIceBurstCheckTimer = 2000;
        } else m_uiIceBurstCheckTimer -= uiDiff;
    }
};

struct npc_valkyr_iccAI : public ScriptedAI
{
    npc_valkyr_iccAI(Creature *pCreature) : ScriptedAI(pCreature), vehicle(me->GetVehicleKit())
    {
        assert(vehicle);
    }

    uint32 m_uiGrabTimer;
    uint32 m_uiMovementTimer;
    uint32 m_uiFallPlayerTimer;

	bool InVehicle;
	bool OutVehicle;

    Vehicle *vehicle;

    void Reset()
    {
        me->SetFlying(true);
        m_uiGrabTimer = 2000;
        m_uiMovementTimer = 3000;
        m_uiFallPlayerTimer = 10000;

		InVehicle = false;
		OutVehicle = false;
    }

    void EnterCombat(Unit *who) 
    {
        DoZoneInCombat();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim()) 
            return;

        if (m_uiGrabTimer < uiDiff)
        {
			if(!InVehicle)
			{
                Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0);
                pTarget->EnterVehicle(vehicle);
			    InVehicle = true;
			}
            m_uiGrabTimer = 120000;
        } else m_uiGrabTimer -= uiDiff;

        if (m_uiMovementTimer < uiDiff)
        {
            me->GetMotionMaster()->MovePoint(0, ValkyrMoveMent);
            m_uiMovementTimer = 120000;
        } else m_uiMovementTimer -= uiDiff;

        if (m_uiFallPlayerTimer < uiDiff)
        {
			if(!OutVehicle)
			{
                vehicle->RemoveAllPassengers();
				OutVehicle = true;
			}
            m_uiFallPlayerTimer = 120000;
        } else m_uiFallPlayerTimer -= uiDiff;
    }
};

struct npc_ghoul_iccAI : public ScriptedAI
{
    npc_ghoul_iccAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
    }

    uint32 m_uiLifeTimer;
    uint32 m_uiAggroTimer;

    bool m_bIsLife;
    bool m_bIsAggroTimer;

    void Reset()
    {
        m_uiLifeTimer = 1000;
        m_uiAggroTimer = 4000;
        m_bIsLife = false;
        m_bIsAggroTimer = false;
    }

    void EnterCombat(Unit *who) 
    {
        DoZoneInCombat();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim()) 
            return;

        if (m_uiLifeTimer < uiDiff && !m_bIsLife)
        {
            me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 449);
            m_bIsLife = true;
        } else m_uiLifeTimer -= uiDiff;

        if (m_uiAggroTimer < uiDiff && !m_bIsAggroTimer)
        {
            me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
            m_bIsAggroTimer = true;
        } else m_uiAggroTimer -= uiDiff;
    }
};

struct npc_defile_iccAI : public Scripted_NoMovementAI
{
    npc_defile_iccAI(Creature *pCreature) : Scripted_NoMovementAI(pCreature)
    {
        m_pInstance = pCreature->GetInstanceData();
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiDefileTimer;
    uint32 m_uiDefileDamageTimer;
    uint32 m_uiDespawnTimer;

    bool m_bIsDefile;
    bool m_bIsDespawnd;

    void Reset()
    {
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
        //me->SetReactState(REACT_PASSIVE);
        m_uiDefileTimer    = 1000;
        m_uiDefileDamageTimer = 1000;
        m_uiDespawnTimer = 60000;
        m_bIsDefile = false;
        m_bIsDespawnd = false;
    }

    // Hack Damage Buggt :/
    void DefileDamage()
    {
        Map* pMap = me->GetMap();
        if (pMap && pMap->IsDungeon())
        {
            Map::PlayerList const &PlayerList = pMap->GetPlayers();
            for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            {
                if (i->getSource() && i->getSource()->GetDistance2d(me) <= 20)
                {
                    int32 damage = RAID_MODE(DEFILE_N_10_DAMAGE, DEFILE_N_25_DAMAGE);
                    me->DealDamage(i->getSource(), damage, NULL, SPELL_DIRECT_DAMAGE, SPELL_SCHOOL_MASK_SHADOW);
                }
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiDefileTimer < uiDiff && !m_bIsDefile)
        {
            DoCast(me, SPELL_DAMAGE_DEFILE);
            m_bIsDefile = true;
        }
        else m_uiDefileTimer -= uiDiff;

        if (m_uiDefileDamageTimer < uiDiff)
        {
            DefileDamage();
            m_uiDefileDamageTimer = 1000;
        } else m_uiDefileDamageTimer -= uiDiff;

        if (m_uiDespawnTimer < uiDiff && !m_bIsDespawnd)
        {
            me->SetVisibility(VISIBILITY_OFF);
            me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE,SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            m_bIsDespawnd = true;
        } else m_uiDespawnTimer -= uiDiff;
    }
};

struct npc_raging_spirit_iccAI : public ScriptedAI
{
    npc_raging_spirit_iccAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
    }

    void Reset()
    {
        DoCast(me, SPELL_RAGING_SPIRIT_VISUAL);
    }

    void EnterCombat(Unit *who) 
    {
        DoZoneInCombat();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim()) 
            return;
    }
};

CreatureAI* GetAI_npc_raging_spirit_icc(Creature* pCreature)
{
    return new npc_raging_spirit_iccAI (pCreature);
}

CreatureAI* GetAI_npc_defile_icc(Creature* pCreature)
{
    return new npc_defile_iccAI (pCreature);
}

CreatureAI* GetAI_npc_ghoul_icc(Creature* pCreature)
{
    return new npc_ghoul_iccAI(pCreature);
}

CreatureAI* GetAI_npc_valkyr_icc(Creature* pCreature)
{
    return new npc_valkyr_iccAI(pCreature);
}

CreatureAI* GetAI_npc_ice_puls_icc(Creature* pCreature)
{
    return new npc_ice_puls_iccAI(pCreature);
}

CreatureAI* GetAI_npc_tirion_citadell_icc(Creature* pCreature)
{
    return new npc_tirion_citadell_iccAI(pCreature);
}

CreatureAI* GetAI_boss_lich_king(Creature* pCreature)
{
    return new boss_lich_kingAI(pCreature);
}

bool GossipHello_tirion_icc(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_START_EVENT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    pPlayer->SEND_GOSSIP_MENU(10600, pCreature->GetGUID());
    return true;
}

bool GossipSelect_tirion_icc(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pCreature->RemoveFlag(UNIT_NPC_FLAGS,UNIT_NPC_FLAG_GOSSIP);
        pPlayer->CLOSE_GOSSIP_MENU();
        ((npc_tirion_citadell_iccAI*)pCreature->AI())->StartEvent();
    }
    return true;
}

void AddSC_boss_lichking()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_the_lich_king";
    newscript->GetAI = &GetAI_boss_lich_king;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_tirion_icc";
    newscript->pGossipHello = &GossipHello_tirion_icc;
    newscript->pGossipSelect = &GossipSelect_tirion_icc;
    newscript->GetAI = &GetAI_npc_tirion_citadell_icc;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ice_puls_icc";
    newscript->GetAI = &GetAI_npc_ice_puls_icc;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_valkyr_icc";
    newscript->GetAI = &GetAI_npc_valkyr_icc;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ghoul_icc";
    newscript->GetAI = &GetAI_npc_ghoul_icc;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_defile_icc";
    newscript->GetAI = &GetAI_npc_defile_icc;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_raging_spirit_icc";
    newscript->GetAI = &GetAI_npc_raging_spirit_icc;
    newscript->RegisterSelf();
}