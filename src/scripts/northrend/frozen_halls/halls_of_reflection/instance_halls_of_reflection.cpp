/* Copyright (C) 2006 - 2010 TrinityCore <https://www.trinitycore.org/>
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

#include "ScriptedPch.h"
#include "halls_of_reflection.h"
#include "ScriptedEscortAI.h"

#define MAX_ENCOUNTER 3

/* Halls of Reflection encounters:
0- Falric
1- Marwyn
2- The Lich King
*/

struct instance_halls_of_reflection : public ScriptedInstance
{
    instance_halls_of_reflection(Map* pMap) : ScriptedInstance(pMap) {Initialize();};

    uint64 uiFalric;
    uint64 uiMarwyn;
    uint64 uiLichKing;

    uint32 m_auiEncounter[MAX_ENCOUNTER];

    void Initialize()
    {
        uiFalric = 0;
        uiMarwyn = 0;
        uiLichKing = 0;

        for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            m_auiEncounter[i] = NOT_STARTED;
    }

    void OnCreatureCreate(Creature* pCreature, bool /*add*/)
    {
        switch(pCreature->GetEntry())
        {
            case CREATURE_FALRIC:
                uiFalric = pCreature->GetGUID();
                break;
            case CREATURE_MARWYN:
                uiMarwyn = pCreature->GetGUID();
                break;
            case CREATURE_LICHKING:
                uiLichKing = pCreature->GetGUID();
                break;
        }
    }
/*
    void OnGameObjectCreate(GameObject* pGo, bool add)
    {
        switch(pGo->GetEntry())
        {
        }
    }
*/
    void SetData(uint32 type, uint32 data)
    {
        switch(type)
        {
            case DATA_FALRIC_EVENT:
                m_auiEncounter[0] = data;
                break;
            case DATA_MARWYN_EVENT:
                m_auiEncounter[1] = data;
                break;
            case DATA_LICHKING_EVENT:
                m_auiEncounter[2] = data;
                break;
        }

        if (data == DONE)
            SaveToDB();
    }

    uint32 GetData(uint32 type)
    {
        switch(type)
        {
            case DATA_FALRIC_EVENT:         return m_auiEncounter[0];
            case DATA_MARWYN_EVENT:         return m_auiEncounter[1];
            case DATA_LICHKING_EVENT:       return m_auiEncounter[2];
        }

        return 0;
    }
/*
    uint64 GetData64(uint32 identifier)
    {
        switch(identifier)
        {
        }

        return 0;
    }
*/
    std::string GetSaveData()
    {
        OUT_SAVE_INST_DATA;

        std::ostringstream saveStream;
        saveStream << "H R " << m_auiEncounter[0] << " " << m_auiEncounter[1] << m_auiEncounter[2];

        OUT_SAVE_INST_DATA_COMPLETE;
        return saveStream.str();
    }

    void Load(const char* in)
    {
        if (!in)
        {
            OUT_LOAD_INST_DATA_FAIL;
            return;
        }

        OUT_LOAD_INST_DATA(in);

        char dataHead1, dataHead2;
        uint16 data0, data1, data2, data3;

        std::istringstream loadStream(in);
        loadStream >> dataHead1 >> dataHead2 >> data0 >> data1 >> data2 >> data3;

        if (dataHead1 == 'H' && dataHead2 == 'R')
        {
            m_auiEncounter[0] = data0;
            m_auiEncounter[1] = data1;

            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                if (m_auiEncounter[i] == IN_PROGRESS)
                    m_auiEncounter[i] = NOT_STARTED;

        } else OUT_LOAD_INST_DATA_FAIL;

        OUT_LOAD_INST_DATA_COMPLETE;
    }
};

struct npc_slyvanas_windrunner_halls_of_reflection_partone : public ScriptedAI
{
    npc_slyvanas_windrunner_halls_of_reflection_partone(Creature *pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

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

InstanceData* GetInstanceData_instance_halls_of_reflection(Map* pMap)
{
    return new instance_halls_of_reflection(pMap);
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

    newscript->Name = "instance_halls_of_reflection";
    newscript->GetInstanceData = &GetInstanceData_instance_halls_of_reflection;
    newscript->RegisterSelf();
}
