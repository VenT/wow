#include "ScriptedPch.h"
#include "halls_of_reflection.h"
#include "ScriptedEscortAI.h"

struct npc_slyvanas_windrunner_halls_of_reflection_partone : public ScriptedAI
{
    npc_slyvanas_windrunner_halls_of_reflection_partone(Creature *pCreature) : ScriptedAI(pCreature)
    {
        Reset();
		pInstance = pCreature->GetInstanceData();
    }

	ScriptedInstance* pInstance;

    uint64 uiLoralenGUID;
    uint64 uiSlyvanasGUID;
    uint64 uiLichKingGUID;
    uint64 uiMargwynGUID;
    uint64 uiFalricGUID;
	uint64 uiUtherGUID;
    uint64 uiMercGUID[ENCOUNTER_WAVE_MERCANERY];
    uint64 uiFootmanGUID[ENCOUNTER_WAVE_FOOTMAN];
    uint64 uiRifleGUID[ENCOUNTER_WAVE_RIFLEMAN];
    uint64 uiPriestGUID[ENCOUNTER_WAVE_PRIEST];
    uint64 uiMageGUID[ENCOUNTER_WAVE_MAGE];

    bool eventstarted;
    uint32 uiStep;
    uint32 uiPhase_timer;

	void Reset()
	{
            eventstarted = false;
            uiStep = 0;
            uiPhase_timer = 3000;

            me->SetStandState(UNIT_STAND_STATE_STAND);
            me->SetVisibility(VISIBILITY_ON);
            uiLoralenGUID = NULL;
            uiSlyvanasGUID = NULL;
            uiLichKingGUID = NULL;
            uiMargwynGUID = NULL;
            uiFalricGUID = NULL;
			uiUtherGUID = NULL;
    }

   	void JumpToNextStep(uint32 uiTimer)
    {
        uiPhase_timer = uiTimer;
        ++uiStep;
    }

    void UpdateAI(const uint32 diff)
    {

            if (uiPhase_timer <= diff)
            {
                switch (uiStep)
                {
                    case 0:
                            me->RemoveUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
                            me->SendMonsterMove(HallsofReflectionLocs[0].x, HallsofReflectionLocs[0].y, HallsofReflectionLocs[0].z, HallsofReflectionLocs[0].o, 3, 1 );
							me->setDeathState(ALIVE);
							DoScriptText(SAY_SLYVANAS_2, me);
							JumpToNextStep(3000);
						break;
                    case 1:
                        if (Unit* pTemp = me->SummonCreature(NPC_UTHER, HallsofReflectionLocs[3].x, HallsofReflectionLocs[3].y, HallsofReflectionLocs[3].z, HallsofReflectionLocs[3].o, TEMPSUMMON_MANUAL_DESPAWN))
                        {
                            DoScriptText(SAY_UTHER_1, me);
                            pTemp->RemoveUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
                            uiUtherGUID = pTemp->GetGUID();
							JumpToNextStep(3000);
                        }
                        break;
                    case 2:
						if(pInstance)
							pInstance->SetData(DATA_GO_FROSTMOURNE, 0);
						JumpToNextStep(5000);
                        break;
                    case 3:
                        if (Unit* pTemp = me->SummonCreature(NPC_THE_LICH_KING_BOSS, HallsofReflectionLocs[5].x, HallsofReflectionLocs[5].y, HallsofReflectionLocs[5].z, HallsofReflectionLocs[5].o, TEMPSUMMON_MANUAL_DESPAWN))
                        {
                            pTemp->RemoveUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
                            me->SendMonsterMove(HallsofReflectionLocs[6].x, HallsofReflectionLocs[6].y, HallsofReflectionLocs[6].z, HallsofReflectionLocs[6].o, 3, 1 );
							JumpToNextStep(7000);
                        }
                        break;
                    case 4:
                        if (Creature* pTemp = Unit::GetCreature(*me, pInstance->GetData64(NPC_THE_LICH_KING_BOSS)))
                        {
							pTemp->CastSpell(pTemp, 72729, false);
							pTemp->CastSpell(pTemp, 72726, false);
							JumpToNextStep(3000);
                        }
                        break;
				}

        }
    }
};

bool GossipHello_npc_slyvanas_windrunner_halls_of_reflection_partone(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu( pCreature->GetGUID() );

        pPlayer->ADD_GOSSIP_ITEM( 0, "Can you remove the sword?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
	    pPlayer->ADD_GOSSIP_ITEM( 0, "Dark Lady, I think I hear Arthas coming. Whatever you're going to do, do it quickly.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);

    pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_slyvanas_windrunner_halls_of_reflection_partone(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->CLOSE_GOSSIP_MENU();
            CAST_AI(npc_slyvanas_windrunner_halls_of_reflection_partone, pCreature->AI())->uiStep = 1;
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->CLOSE_GOSSIP_MENU();
            CAST_AI(npc_slyvanas_windrunner_halls_of_reflection_partone, pCreature->AI())->uiStep = 1;
            break;
    }
    return true;
}

CreatureAI* GetAI_npc_slyvanas_hallsofreflection_partoneAI(Creature* pCreature)
{
    return new npc_slyvanas_windrunner_halls_of_reflection_partone(pCreature);
}

void AddSC_halls_of_reflection()
{
    Script *newscript;
    newscript = new Script;
	 
    newscript->Name = "npc_slyvanas_hor_start";
    newscript->GetAI = &GetAI_npc_slyvanas_hallsofreflection_partoneAI;
    newscript->pGossipHello =  &GossipHello_npc_slyvanas_windrunner_halls_of_reflection_partone;
    newscript->pGossipSelect = &GossipSelect_npc_slyvanas_windrunner_halls_of_reflection_partone;
    newscript->RegisterSelf();
}