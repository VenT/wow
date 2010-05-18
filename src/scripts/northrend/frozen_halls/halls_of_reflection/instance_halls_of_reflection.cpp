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

// Spirit Wave Count...
/*
void UpdateWorldState(Map *map, uint32 id, uint32 state)
{
    Map::PlayerList const& players = map->GetPlayers();

    if (!players.isEmpty())
    {
        for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
        {
            if (Player* pPlayer = itr->getSource())
                pPlayer->SendUpdateWorldState(id,state);
        }
    }
}
*/

struct instance_halls_of_reflection : public ScriptedInstance
{
    instance_halls_of_reflection(Map* pMap) : ScriptedInstance(pMap) {Initialize();};

	uint64 uiFrostmourne;
    uint64 uiFrostmournealtar;
    uint64 uiArthasdoor;
    uint64 uiFrontdoor;
	uint64 uiArthasevent;
    uint64 m_uiMargwyn;
	uint64 m_uiLichKing;

	uint32 m_auiEncounter[MAX_ENCOUNTER];
	std::string str_data;

    void Initialize()
    {
        uiFrostmourne = 0;
        uiFrostmournealtar = 0;
        uiArthasdoor = 0;
        uiFrontdoor = 0;
		uiArthasevent = 0;
		m_uiLichKing = 0;
		m_uiMargwyn = 0;
	};

    bool IsEncounterInProgress() const
    {
        for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            if (m_auiEncounter[i] == IN_PROGRESS) return true;

        return false;
    }
	
	void OnGameObjectCreate(GameObject* pGo, bool add)
    {
        switch(pGo->GetEntry())
        {
            case GO_FROSTMOURNE:
                uiFrostmourne = pGo->GetGUID();
                break;
            case GO_START_DOOR:
                uiFrontdoor = pGo->GetGUID();
                break;
            case GO_ARTHAS_DOOR:
                uiArthasdoor = pGo->GetGUID();
                break;
            case GO_FROSTMOURNE_ALTAR:
                uiFrostmournealtar = pGo->GetGUID();
                break;
        }
		
        if (GameObject* pFrontDoor = instance->GetGameObject(uiFrontdoor))
                    pFrontDoor->SetGoState(GO_STATE_ACTIVE);
        if (GameObject* pArthasDoor = instance->GetGameObject(uiArthasdoor))
                   pArthasDoor->SetGoState(GO_STATE_READY);
        if (GameObject* pFrostmourne = instance->GetGameObject(uiFrostmourne))
                    pFrostmourne->SetGoState(GO_STATE_READY);
       if (GameObject* pAltar = instance->GetGameObject(uiFrostmournealtar))
                    pAltar->SetGoState(GO_STATE_READY);
	}

    void OnCreatureCreate(Creature* pCreature, bool add)
    {
        Map::PlayerList const &players = instance->GetPlayers();
        uint32 TeamInInstance = 0;

        if (!players.isEmpty())
        {
            if (Player* pPlayer = players.begin()->getSource())
                TeamInInstance = pPlayer->GetTeam();
        }

        switch(pCreature->GetEntry())
        {
           case NPC_JAINA_PART1:
                if (TeamInInstance == HORDE)
                   pCreature->UpdateEntry(NPC_SLYVANAS_PART1, HORDE);
				break;
            case NPC_KILARA:
                if (TeamInInstance == ALLIANCE)
                   pCreature->UpdateEntry(NPC_ELANDRA, ALLIANCE);
            case 38113:    m_uiMargwyn = pCreature->GetGUID();        break;
			case 36954:    m_uiLichKing = pCreature->GetGUID();        break;
        }
    }

	void OnPlayerEnter(Player * m_player)
	{
		if(m_player)
		{
			AchievementEntry const *Achiev1 = GetAchievementStore()->LookupEntry(4517);
			AchievementEntry const *Achiev2 = GetAchievementStore()->LookupEntry(4520);
			//if(m_player->isCompleteAchievement(Achiev1) || m_player->isCompleteAchievement(Achiev2) || m_player->isGameMaster())
			//	return;
			//else
			//{
			//	m_player->TeleportTo(571, 5641.00f, 2028.78f, 798.27f, 3.05f);
			//	m_player->Say("You need complete Pit of Saron", 0);
			//}
		}
	}



    uint64 GetData64(uint32 identifier)
	{
        switch(identifier)
        {
            case DATA_KNIGHTS_EVENT:			   return m_uiMargwyn;
			case DATA_LICHKING_EVENT:              return m_uiLichKing;
			case NPC_THE_LICH_KING_BOSS:           return m_uiLichKing;
        }
		
		return 0;
    }

    void SetData(uint32 type, uint32 data)
    {
        switch(type)
        {
        	case DATA_KNIGHTS_EVENT:
         	   m_auiEncounter[0] = data; break;
       		case DATA_LICHKING_EVENT:
            	m_auiEncounter[1] = data; break;
        	case DATA_GO_FROSTMOURNE:
            	if (GameObject* pFrostmourne = instance->GetGameObject(uiFrostmourne))
                	pFrostmourne->SetGoState(GO_STATE_ACTIVE);
            	break;
        }

        if (data == DONE)
		{
            SaveToDB();
		}
    }

    uint32 GetData(uint32 type)
    {
        switch(type)
        {
            case DATA_KNIGHTS_EVENT:			 return m_auiEncounter[0];
			case DATA_LICHKING_EVENT:   return m_auiEncounter[1];
        }

        return 0;
    }

    std::string GetSaveData()
    {
        OUT_SAVE_INST_DATA;

        std::ostringstream saveStream;
        saveStream << "H R " << m_auiEncounter[0] << " " << m_auiEncounter[1];

        str_data = saveStream.str();

        OUT_SAVE_INST_DATA_COMPLETE;
        return str_data;
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

InstanceData* GetInstanceData_instance_halls_of_reflection(Map* pMap)
{
    return new instance_halls_of_reflection(pMap);
}

void AddSC_instance_halls_of_reflection()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_halls_of_reflection";
    newscript->GetInstanceData = &GetInstanceData_instance_halls_of_reflection;
    newscript->RegisterSelf();
}