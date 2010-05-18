#include "ScriptedPch.h"
#include "icecrown_citadel.h"

#define LIGHTS_HAMMER 200
#define ORATORY       201
#define RAMPART       202
#define DEATHBRINGER  203
#define CITADEL       204


bool GoHello_icecrown_teleporter( Player *pPlayer, GameObject *pGO )
{
    ScriptedInstance *pInstance = pGO->GetInstanceData();
    if (!pInstance) return true;
    if (pGO->GetGoState() == GO_STATE_READY) return true;

	if(pInstance->GetData(DATA_MARROWGAR_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Light's Hammer", GOSSIP_SENDER_MAIN, LIGHTS_HAMMER);
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Oratory of the Damned", GOSSIP_SENDER_MAIN, ORATORY);
        if(pInstance->GetData(DATA_DEATHWHISPER_EVENT) == DONE)
        {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Rampart of Skulls", GOSSIP_SENDER_MAIN, RAMPART);
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Deathbringer's Rise", GOSSIP_SENDER_MAIN, DEATHBRINGER);
            if(pInstance->GetData(DATA_SAURFANG_EVENT) == DONE)
            {
                pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Icecrown Citadel", GOSSIP_SENDER_MAIN, CITADEL);
            }
	    }
	}
    pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pGO->GetGUID());

    return true;
}

bool GOSelect_icecrown_teleporter( Player *pPlayer, GameObject *pGO, uint32 sender, uint32 action )
{
    if(sender != GOSSIP_SENDER_MAIN) return true;
    if(!pPlayer->getAttackers().empty()) return true;

    switch(action)
    {
    case LIGHTS_HAMMER:
        pPlayer->TeleportTo(631, -17.071068, 2211.468750, 30.054554, 3.12149);
        pPlayer->CLOSE_GOSSIP_MENU();break;
    case ORATORY:
        pPlayer->TeleportTo(631, -503.593414, 2211.468750, 62.762070, 3.139313);
        pPlayer->CLOSE_GOSSIP_MENU();break;
    case RAMPART:
        pPlayer->TeleportTo(631, -615.146118, 2211.471924, 199.908508, 6.26832);
        pPlayer->CLOSE_GOSSIP_MENU();break;
    case DEATHBRINGER:
        pPlayer->TeleportTo(631, -549.073486, 2211.289307, 539.223450, 6.275452);
        pPlayer->CLOSE_GOSSIP_MENU();break;
	case CITADEL:
        pPlayer->TeleportTo(631, 4199.35, 2769.41, 351.00, 3.1415);
        pPlayer->CLOSE_GOSSIP_MENU();break;
    }

    return true;
}

void AddSC_icecrown_teleporter()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "icecrown_teleporter";
    newscript->pGOHello = &GoHello_icecrown_teleporter;
    newscript->pGOSelect = &GOSelect_icecrown_teleporter;
    newscript->RegisterSelf();
}