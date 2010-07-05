#include "ScriptedPch.h"
#include "violet_hold.h"

#define GOSSIP_START_EVENT  "Get your people to safety, we'll keep the Blue Dragonflight's forces at bay."
#define GOSSIP_ITEM_1       "Activate the crystals when we get in trouble, right"
#define SPAWN_TIME          20000

enum PortalCreatures
{
    CREATURE_AZURE_INVADER            = 30661,
    CREATURE_AZURE_SPELLBREAKER       = 30662,
    CREATURE_AZURE_BINDER             = 30663,
    CREATURE_AZURE_MAGE_SLAYER        = 30664,
    CREATURE_AZURE_CAPTAIN            = 30666,
    CREATURE_AZURE_SORCEROR           = 30667,
    CREATURE_AZURE_RAIDER             = 30668,
    CREATURE_AZURE_STALKER            = 32191,
    CREATURE_AZURE_SABOTEUR           = 31079 //this one open cells
};

struct Locations {
	float x,y,z;
};

static Locations BossLoc[]=
{
    {0,0,0},					 // none
    {1892.737, 744.589, 47.666}, // Moragg
	{1876.100, 857.079, 43.333}, // Erekem
    {1931.305, 762.541, 35.204}, // Ichoron
	{1857.125, 763.295, 38.654}, // Lavanthor
    {1905.364, 840.607, 38.670}, // Xevozz
    {1925.480, 849.981, 47.174}, // Zuramat
};

enum portal_creatures_spells
{
	//Portal Guardian
	SPELL_AGONIZING_STRIKE			= 58504,
	SPELL_SIDE_SWIPE				= 58508,

	//Portal Keeper
	SPELL_ARCANE_MISSILE			= 58531,
	SPELL_ARCANE_MISSILE_H			= 61593,
	SPELL_DEEP_FREEZE				= 58534,
	SPELL_FROSTBOLT_VOLLEY			= 58532,
	SPELL_FROSTBOLT_VOLLEY_H		= 61594
};

enum dragon_spells
{
    SPELL_TELEPORT_INSIDE                 = 62139,
    SPELL_SHIELD_DISRUPTION               = 58291,

    //DRAGONS SPELLS
    //Azure Captain
    SPELL_MORTAL_STRIKE                   = 32736,
    SPELL_WHIRLWIND                       = 41057,

    //Azure Raider
    SPELL_CONCUSSION_BLOW                 = 52719,
    SPELL_MAGIC_REFLECTION                = 60158,

    //Azure Sorceror
    SPELL_ARCANE_STREAM                   = 60181,
    SPELL_ARCANE_STREAM_H                 = 60204,
    SPELL_MANA_DETONATION                 = 60182,
    SPELL_MANA_DETONATION_H               = 60205,

    //Azure stalker
    SPELL_BACKSTAB                        = 58471,
    SPELL_TACTICAL_BLINK                  = 58470,

	//Azure Invader
	SPELL_CLEAVE						  = 15496,
	SPELL_IMPALE						  = 58459,
	SPELL_IMPALE_H						  = 59256,

	//Azure Binder
	SPELL_ARCANE_BARRAGE				  = 58456,
	SPELL_ARCANE_BARRAGE_H				  = 59248,
	SPELL_ARCANE_EXPLOSION				  = 58455,
	SPELL_ARCANE_EXPLOSION_H			  = 59245,

	//Azure Mage Slayer
	SPELL_ARCANE_EMPOWERMENT			  = 58469,

	//Azure Spellbreaker
	SPELL_ARCANE_BLAST					  = 58462,
	SPELL_ARCANE_BLAST_H				  = 59257,
	SPELL_SLOW							  = 25603

};

enum Spells
{
    SPELL_PORTAL_CHANNEL              = 58012,
    SPELL_CORRUPT                     = 58040
};

enum eSinclari
{
    NPC_VIOLET_HOLD_GUARD             = 30659,

    SAY_SINCLARI_1                    = -1608045,
    EMOTE_SINCLARY_FAIL				  = -1703065
};

const Position DoorPosition = { 1828.300049, 797.309021, 46.135502, 1.48353};
const Position MovePosition = { 1806.955566, 803.851807, 44.363323};

struct npc_sinclariAI : public ScriptedAI
{
    npc_sinclariAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
       pInstance = pCreature->GetInstanceData();
    }

    ScriptedInstance* pInstance;

    uint8  uiPhase;
    uint32 uiTimer;
    bool yelled_failure;

    void Reset()
    {
        uiPhase = 0;
        uiTimer = 0;
        yelled_failure = false;

        m_creature->SetVisibility(VISIBILITY_ON);
        m_creature->SetReactState(REACT_AGGRESSIVE);

        std::list<Creature*> GuardList;
        m_creature->GetCreatureListWithEntryInGrid(GuardList, NPC_VIOLET_HOLD_GUARD, 40.0f);
        if (!GuardList.empty())
        {
            for (std::list<Creature*>::const_iterator itr = GuardList.begin(); itr != GuardList.end(); ++itr)
            {
                if (Creature* pGuard = *itr)
                {
                    pGuard->DisappearAndDie();
                    pGuard->Respawn();
                    pGuard->SetVisibility(VISIBILITY_ON);
                    pGuard->SetReactState(REACT_AGGRESSIVE);
                }
            }
        }
    }

    void MovementInform(uint32 uiType, uint32 uiId)
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        if (pInstance)
        {
            pInstance->SetData(DATA_WAVE_COUNT,1);
            pInstance->SetData(DATA_REMOVE_NPC,0); // might not have been reset after a wipe on a boss.
        }

        //She should not be despawned, she will be used by the instance to summon some npcs
        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->SetReactState(REACT_PASSIVE);
    }
    void ProcessActivationCrystalIntro()
	{
		if (Creature* pSummon = m_creature->SummonCreature(NPC_DEFENSE_SYSTEM, fDefenseSystemLoc[0], fDefenseSystemLoc[1], fDefenseSystemLoc[2], fDefenseSystemLoc[3], TEMPSUMMON_TIMED_DESPAWN, 10000))
		{
			pSummon->CastSpell(pSummon, SPELL_DEFENSE_SYSTEM_VISUAL, true);

			// TODO: figure out how the rest work
			// NPC's NPC_DEFENSE_DUMMY_TARGET are probably channeling some spell to the defense system
		}
			//DoUseDoorOrButton(m_uiIntroCrystalGUID);

		// else, kill (and despawn?) certain trash mobs. Also boss affected, but not killed.
	}

    void UpdateAI(const uint32 uiDiff)
    {
        ScriptedAI::UpdateAI(uiDiff);
        if(!yelled_failure && (bool)pInstance->GetData(DATA_INSTANCE_FAILED) == true )
		{
			//m_creature->MonsterYell("Containment Failed!", LANG_UNIVERSAL, 0);
			DoScriptText(EMOTE_SINCLARY_FAIL,m_creature);
			yelled_failure=true;
		}

        if (uiPhase)
        {
            if (uiTimer <= uiDiff)
            {
                switch(uiPhase)
                {
                    case 1:
                       DoScriptText(SAY_SINCLARI_1, m_creature);
                       uiTimer = 4000;
                       uiPhase = 2;
                       break;
                    case 2:
                    {
                        std::list<Creature*> GuardList;
                        m_creature->GetCreatureListWithEntryInGrid(GuardList, NPC_VIOLET_HOLD_GUARD, 40.0f);
                        if (!GuardList.empty())
                            for (std::list<Creature*>::const_iterator itr = GuardList.begin(); itr != GuardList.end(); ++itr)
                            {
                                if (Creature* pGuard = *itr)
                                {
                                    pGuard->RemoveUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
                                    pGuard->GetMotionMaster()->MovePoint(0, MovePosition);
                                }
                            }
                        uiTimer = 6000;
                        uiPhase = 3;
                        break;
                    }
                    case 3:
                    {
                        std::list<Creature*> GuardList;
                        m_creature->GetCreatureListWithEntryInGrid(GuardList, NPC_VIOLET_HOLD_GUARD, 40.0f);
                        if (!GuardList.empty())
                            for (std::list<Creature*>::const_iterator itr = GuardList.begin(); itr != GuardList.end(); ++itr)
                            {
                                if (Creature* pGuard = *itr)
                                {
                                    pGuard->SetVisibility(VISIBILITY_OFF);
                                    pGuard->SetReactState(REACT_PASSIVE);
                                }
                            }
                        uiTimer = 2000;
                        uiPhase = 4;
                        break;
                    }
                    case 4:
                        m_creature->GetMotionMaster()->MovePoint(0, MovePosition);
                        uiTimer = 0;
                        uiPhase = 0;
                        break;
                }
            }
            else uiTimer -= uiDiff;
        }

        if (!UpdateVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_sinclari(Creature* pCreature)
{
    return new npc_sinclariAI(pCreature);
}
/*######
## mob_vh_dragons
## This script is for ALL mobs which are spawned from portals,
## they have to be scripted in SD2 because in EventAI you cant
## check for distance from door seal :/
## (Intro not implented yet)
######*/
struct mob_vh_dragonsAI : public ScriptedAI
{
    mob_vh_dragonsAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegular = m_pInstance->instance->IsHeroic();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegular;
    uint32 creatureEntry;

	//corrupt seal timer
    uint32 m_ui_CorruptSeal_Timer;

    //Azure Captain
    uint32 m_uiMortalStrike_Timer;
    uint32 m_uiWhirlwind_Timer;

    //Azure Raider
    uint32 m_uiConcussionBlow_Timer;
    uint32 m_uiMagicReflection_Timer;

    //Azure Sorceror
    uint32 m_uiArcaneStream_Timer;
    uint32 m_uiManaDetonation_Timer;

    //Azure Stalker
    uint32 m_uiBackstab_Timer;
    uint32 m_uiBlink_Timer;

	//Azure Invader
	uint32 m_uiCleave_Timer;
	uint32 m_uiImpale_Timer;

	//Azure Binder
	uint32 m_uiArcaneBarrage_Timer;
	uint32 m_uiArcaneExplosion_Timer;
	
	//Azure Mage Slayer
	uint32 m_uiArcaneEmpowerment_Timer;

	//Azure Spellbreaker
	uint32 m_uiArcaneBlast_Timer;
	uint32 m_uiSlow_Timer;

	//Portal Guardian
	uint32 m_uiAgonizingStrike_Timer;
	uint32 m_uiSideWipe_Timer;

	//Portal Keeper
	uint32 m_uiArcaneMissile_Timer;
	uint32 m_uiDeepFreeze_Timer;
	uint32 m_uiFrostBoltVolley_Timer;

    void Reset(){
        creatureEntry = m_creature->GetEntry();

		//corrupt seal timer
		m_ui_CorruptSeal_Timer = 3000;

        //Azure Captain
        m_uiMortalStrike_Timer = 3000;
        m_uiWhirlwind_Timer = 5000;

        //Azure Raider
        m_uiConcussionBlow_Timer = 3000;
        m_uiMagicReflection_Timer = 10000;

        //Azure Sorceror
        m_uiArcaneStream_Timer = 5000;
        m_uiManaDetonation_Timer = 3000;

        //Azure Stalker
        m_uiBackstab_Timer = 7100;
        m_uiBlink_Timer = 7000;

		//Azure Invader
	    m_uiCleave_Timer = 6000;
	    m_uiImpale_Timer = 5000;

		//Azure Binder
		m_uiArcaneBarrage_Timer = 8000;
		m_uiArcaneExplosion_Timer = 6000;
		
		//Azure Mage Slayer
		m_uiArcaneEmpowerment_Timer = 10000;

		//Azure Spellbreaker
		m_uiArcaneBlast_Timer = 7000;
		m_uiSlow_Timer = 5000;

		//Portal Guardian
		m_uiAgonizingStrike_Timer = 10000;
		m_uiSideWipe_Timer = 8000;

		//Portal Keeper
		m_uiArcaneMissile_Timer = 10000;
		m_uiDeepFreeze_Timer = 5000;
		m_uiFrostBoltVolley_Timer = 15000;
    }
    
    
    void UpdateAI(const uint32 uiDiff){

		if( (bool)m_pInstance->GetData(DATA_INSTANCE_FAILED) == true )
			m_creature->DisappearAndDie();

        creatureEntry = m_creature->GetEntry();

		if (creatureEntry != CREATURE_PORTAL_GUARDIAN &&  creatureEntry != CREATURE_PORTAL_KEEPER && m_ui_CorruptSeal_Timer <= uiDiff)
        {
    
			//Corrupt Seal
			GameObject* pMainDoor = m_pInstance->instance->GetGameObject(m_pInstance->GetData64(DATA_MAIN_DOOR));
			if(pMainDoor && !m_creature->isInCombat()){
				if(m_creature->IsWithinDist(pMainDoor, 27.0f, false))
				{
					m_creature->GetMotionMaster()->Clear();
					DoCast(m_creature,SPELL_CORRUPT);
					m_pInstance->SetData(DATA_DOOR,SPECIAL);
				}
			}
			m_ui_CorruptSeal_Timer = 5000;
		}
		else
			m_ui_CorruptSeal_Timer -= uiDiff;

        
        //Return since we have no target
        if (!UpdateVictim())
            return;

        switch(creatureEntry)
        {
            case CREATURE_AZURE_CAPTAIN:
                AzureCaptain_UpdateAI(uiDiff);
                break;
            case CREATURE_AZURE_RAIDER:
                AzureRaider_UpdateAI(uiDiff);
                break;
            case CREATURE_AZURE_SORCEROR:
                AzureSorceror_UpdateAI(uiDiff);
                break;
            case CREATURE_AZURE_STALKER:
                AzureStalker_UpdateAI(uiDiff);
                break;
            case CREATURE_AZURE_BINDER:
				AzureBinder_UpdateAI(uiDiff);
				break;
            case CREATURE_AZURE_INVADER:
				AzureInvader_UpdateAI(uiDiff);
				break;
            case CREATURE_AZURE_MAGE_SLAYER:
				AzureMageSlayer_UpdateAI(uiDiff);
				break;
            case CREATURE_AZURE_SPELLBREAKER:
				AzureSpellBreaker_UpdateAI(uiDiff);
                break;
			case CREATURE_PORTAL_KEEPER:
				PortalKeeper_UpdateAI(uiDiff);
				break;
			case CREATURE_PORTAL_GUARDIAN:
				PortalGuardian_UpdateAI(uiDiff);
				break;
            default:
                debug_log("SD2: The Violet Hold: Unhandled dragon entry %u!", m_creature->GetEntry());
                break;
        }
        DoMeleeAttackIfReady();
    }
	//Portal Keeper
    void PortalKeeper_UpdateAI(const uint32 uiDiff)
    {
        //Arcane Missile
        if (m_uiArcaneMissile_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), m_bIsRegular ? SPELL_ARCANE_MISSILE : SPELL_ARCANE_MISSILE_H);
            m_uiArcaneMissile_Timer = 10000;
        }else m_uiArcaneMissile_Timer -= uiDiff;

        //Deep Freeze 
        if (m_uiDeepFreeze_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_DEEP_FREEZE);
            m_uiDeepFreeze_Timer = 8000;
        }else m_uiDeepFreeze_Timer -= uiDiff;

		//FrostBoltVolley
        if (m_uiFrostBoltVolley_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), m_bIsRegular ? SPELL_FROSTBOLT_VOLLEY : SPELL_FROSTBOLT_VOLLEY_H);
            m_uiFrostBoltVolley_Timer = 15000;
        }else m_uiFrostBoltVolley_Timer -= uiDiff;
    }
	//Portal Guardian
    void PortalGuardian_UpdateAI(const uint32 uiDiff)
    {
        //Agonizing Strike
        if (m_uiAgonizingStrike_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_AGONIZING_STRIKE);
            m_uiAgonizingStrike_Timer = 10000;
        }else m_uiAgonizingStrike_Timer -= uiDiff;

        //Side Wipe
        if (m_uiSideWipe_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_SIDE_SWIPE);
            m_uiSideWipe_Timer = 8000;
        }else m_uiSideWipe_Timer -= uiDiff;
    }
    //Azure Captain
    void AzureCaptain_UpdateAI(const uint32 uiDiff)
    {
        //Mortal Strike
        if (m_uiMortalStrike_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_MORTAL_STRIKE);
            m_uiMortalStrike_Timer = 6000;
        }else m_uiMortalStrike_Timer -= uiDiff;

        //Whirlwind
        if (m_uiWhirlwind_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_WHIRLWIND);
            m_uiWhirlwind_Timer = 15000;
        }else m_uiWhirlwind_Timer -= uiDiff;
    }
    //Azure Raider
    void AzureRaider_UpdateAI(const uint32 uiDiff)
    {
        //Concusion Blow
        if (m_uiConcussionBlow_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_CONCUSSION_BLOW);
            m_uiMortalStrike_Timer = 7000;
        }else m_uiConcussionBlow_Timer -= uiDiff;

        //Magic reflection
        if (m_uiMagicReflection_Timer <= uiDiff)
        {
            DoCast(m_creature, SPELL_MAGIC_REFLECTION);
            m_uiMagicReflection_Timer = 30000;
        }else m_uiMagicReflection_Timer -= uiDiff;
    }
    //Azure Sorceror
    void AzureSorceror_UpdateAI(const uint32 uiDiff)
    {
        //Arcane Stream
        if (m_uiArcaneStream_Timer <= uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, m_bIsRegular ? SPELL_ARCANE_STREAM : SPELL_ARCANE_STREAM_H);
            m_uiArcaneStream_Timer = 7000;
        }else m_uiArcaneStream_Timer -= uiDiff;

        //Mana Detonation
        if (m_uiManaDetonation_Timer <= uiDiff)
        {
            DoCast(m_creature, m_bIsRegular ? SPELL_MANA_DETONATION : SPELL_MANA_DETONATION_H);
            m_uiManaDetonation_Timer = 18000;
        }else m_uiManaDetonation_Timer -= uiDiff;
    }
    //Azure Stalker
    void AzureStalker_UpdateAI(const uint32 uiDiff)
    {
        //Backstab
        if (m_uiBackstab_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_BACKSTAB);
            m_uiBackstab_Timer = 15100;
        }else m_uiBackstab_Timer -= uiDiff;

        //Tactical blink
        if (m_uiBlink_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_TACTICAL_BLINK);
            m_uiBlink_Timer = 15000;
        }else m_uiBlink_Timer -= uiDiff;
    }
	//Azure Invader
    void AzureInvader_UpdateAI(const uint32 uiDiff)
    {
        //Cleave
        if (m_uiCleave_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_CLEAVE);
            m_uiCleave_Timer = 8000;
        }else m_uiCleave_Timer -= uiDiff;

        //Impale
        if (m_uiImpale_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), m_bIsRegular ? SPELL_IMPALE : SPELL_IMPALE_H);
            m_uiImpale_Timer = 10000;
        }else m_uiImpale_Timer -= uiDiff;
    }
	//Azure Binder
	void AzureBinder_UpdateAI(const uint32 uiDiff)
    {
        //Arcane Barrage
        if (m_uiArcaneBarrage_Timer <= uiDiff)
        {
            DoCast(m_creature->getVictim(), m_bIsRegular ? SPELL_ARCANE_BARRAGE : SPELL_ARCANE_BARRAGE_H);
            m_uiArcaneBarrage_Timer = 8000;
        }else m_uiArcaneBarrage_Timer -= uiDiff;

        //Arcane Explosion
        if (m_uiArcaneExplosion_Timer <= uiDiff)
        {
            DoCast(m_creature, m_bIsRegular ? SPELL_ARCANE_EXPLOSION : SPELL_ARCANE_EXPLOSION_H);
            m_uiArcaneExplosion_Timer = 10000;
        }else m_uiArcaneExplosion_Timer -= uiDiff;
    }
	//Azure Mage Slayer
	void AzureMageSlayer_UpdateAI(const uint32 uiDiff)
    {
        //Arcane Empowerment
        if (m_uiArcaneEmpowerment_Timer <= uiDiff)
        {
            DoCast(m_creature, SPELL_ARCANE_EMPOWERMENT);
            m_uiArcaneEmpowerment_Timer = 10000;
        }else m_uiArcaneEmpowerment_Timer -= uiDiff;
    }
	//Azure Spellbreaker
	void AzureSpellBreaker_UpdateAI(const uint32 uiDiff)
    {
        //Arcane Blast
        if (m_uiArcaneBlast_Timer <= uiDiff)
        {
            DoCast(m_creature, m_bIsRegular ? SPELL_ARCANE_BLAST : SPELL_ARCANE_BLAST_H);
            m_uiArcaneBlast_Timer = 7000;
        }else m_uiArcaneBlast_Timer -= uiDiff;

        //Slow
        if (m_uiSlow_Timer <= uiDiff)
        {
			DoCast(m_creature->getVictim(), SPELL_SLOW);
            m_uiSlow_Timer = 10000;
        }else m_uiSlow_Timer -= uiDiff;
    }
};

bool GossipHello_npc_sinclari(Player* pPlayer, Creature* pCreature)
{
    ScriptedInstance* pInstance = pCreature->GetInstanceData();
    if (pInstance && pInstance->GetData(DATA_CYANIGOSA_EVENT) != DONE && pInstance->GetData(DATA_WAVE_COUNT) == 0 && pPlayer)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,GOSSIP_ITEM_1,GOSSIP_SENDER_MAIN,GOSSIP_ACTION_INFO_DEF+2);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,GOSSIP_START_EVENT,GOSSIP_SENDER_MAIN,GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->SEND_GOSSIP_MENU(13853, pCreature->GetGUID());
    }else
        pPlayer->SEND_GOSSIP_MENU(13910, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_sinclari(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            if (pPlayer)
                pPlayer->CLOSE_GOSSIP_MENU();
            CAST_AI(npc_sinclariAI, (pCreature->AI()))->uiPhase = 1;
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->SEND_GOSSIP_MENU(13854, pCreature->GetGUID());
            break;
    }
    return true;
}

struct npc_teleportation_portalAI : public ScriptedAI
{
    npc_teleportation_portalAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = c->GetInstanceData();
    }

    uint32 uiSpawnTimer;
    bool bPortalGuardianOrKeeperSpawn;

    ScriptedInstance *pInstance;

    void Reset()
    {
        uiSpawnTimer = 10000;
        bPortalGuardianOrKeeperSpawn = false;
    }

    void EnterCombat(Unit *who) {}
    void MoveInLineOfSight(Unit *who) {}

    void UpdateAI(const uint32 diff)
    {
        if (pInstance && pInstance->GetData(DATA_REMOVE_NPC) == 1)
        {
            m_creature->ForcedDespawn();
            pInstance->SetData(DATA_REMOVE_NPC, 0);
        }

        if (uiSpawnTimer <= diff)
        {
            if (bPortalGuardianOrKeeperSpawn)
            {
                uint8 k = pInstance->GetData(DATA_WAVE_COUNT) < 12 ? 2 : 3;
                for (uint8 i = 0; i < k; ++i)
                {
                    uint32 entry = RAND(CREATURE_AZURE_INVADER,CREATURE_AZURE_SPELLBREAKER,CREATURE_AZURE_BINDER,CREATURE_AZURE_MAGE_SLAYER,CREATURE_AZURE_CAPTAIN,CREATURE_AZURE_SORCEROR,CREATURE_AZURE_RAIDER,CREATURE_AZURE_STALKER);
                    if (Creature* pSummon = DoSummon(entry, m_creature, 2.0f, 30000, TEMPSUMMON_DEAD_DESPAWN/*TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT*/))
                        pSummon->GetMotionMaster()->MovePoint(0, DoorPosition);
                }
            }
            else
            {
                bPortalGuardianOrKeeperSpawn = true;
                uint32 entry = RAND(CREATURE_PORTAL_GUARDIAN, CREATURE_PORTAL_KEEPER);
                if (Creature *pPortalKeeper = DoSummon(entry, m_creature, 2.0f, 0, TEMPSUMMON_DEAD_DESPAWN))
                    m_creature->CastSpell(pPortalKeeper, SPELL_PORTAL_CHANNEL, false);
            }
            uiSpawnTimer = SPAWN_TIME;
        } else uiSpawnTimer -= diff;

        if (bPortalGuardianOrKeeperSpawn && !m_creature->IsNonMeleeSpellCasted(false))
        {
            m_creature->Kill(m_creature, false);
            m_creature->RemoveCorpse();
            return;
        }
    }

    void JustDied(Unit* killer)
    {
        if (pInstance)
        {
            pInstance->SetData(DATA_WAVE_COUNT,pInstance->GetData(DATA_WAVE_COUNT)+1);
            if(pInstance->GetData(DATA_WAVE_COUNT) == 6 || pInstance->GetData(DATA_WAVE_COUNT) == 12)
                Creature* pSummon = DoSummon(CREATURE_AZURE_SABOTEUR, m_creature, 2.0f, 30000, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
        }
    }
};

/*######
## npc_azure_saboteur
######*/
struct npc_azure_saboteurAI : public ScriptedAI
{
    npc_azure_saboteurAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }
    ScriptedInstance *m_pInstance;

    uint32 m_uiDisruption_Timer;

    uint64 m_uiDoorGUID;
	uint8 m_uiBossID;
	bool started;
    
    void AttackStart(Unit* pWho)
    {
        return;
    }

    void Reset()
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_uiDoorGUID = 0;
		m_uiBossID = 0;
		started = false;
    }

    void UpdateAI(const uint32 uiDiff)
    {
		if (m_pInstance && !started)
        {
            m_uiBossID = m_pInstance->GetData(DATA_LASTBOSS);			
			if(m_uiBossID > 0){
				switch (m_uiBossID)
				{
					case BOSS_LAVANTHOR:
						m_uiDoorGUID = m_pInstance->GetData64(DATA_LAVANTHOR_CELL);
						break;
					case BOSS_ZURAMAT:
						m_uiDoorGUID = m_pInstance->GetData64(DATA_ZURAMAT_CELL);
						break;
					case BOSS_MORAGG:
						m_uiDoorGUID = m_pInstance->GetData64(DATA_MORAGG_CELL);
						break;
					case BOSS_EREKEM:
						m_uiDoorGUID = m_pInstance->GetData64(DATA_EREKEM_CELL);
						break;
					case BOSS_ICHORON:
						m_uiDoorGUID = m_pInstance->GetData64(DATA_ICHORON_CELL);
						break;
					case BOSS_XEVOZZ:
						m_uiDoorGUID = m_pInstance->GetData64(DATA_XEVOZZ_CELL);
						break;
				}
				started = true;
				m_pInstance->SetData(DATA_LASTBOSS,0);
				m_creature->GetMotionMaster()->MovePoint(0, BossLoc[m_uiBossID].x,  BossLoc[m_uiBossID].y,  BossLoc[m_uiBossID].z);
			}

        }

		GameObject* dest_Door = m_pInstance->instance->GetGameObject(m_uiDoorGUID);
        if(dest_Door){
			if(m_creature->IsWithinDist(dest_Door, 27.0f, false))
				{
					m_creature->GetMotionMaster()->Clear();
					DoCast(m_creature, SPELL_SHIELD_DISRUPTION);
					m_pInstance->SetData(DATA_BOSS_PHASE,1);
					m_creature->DisappearAndDie();
				}
			}
    }
};

CreatureAI* GetAI_mob_vh_dragons(Creature* pCreature)
{
    return new mob_vh_dragonsAI(pCreature);
}

CreatureAI* GetAI_npc_azure_saboteur(Creature* pCreature)
{
    return new npc_azure_saboteurAI (pCreature);
}

CreatureAI* GetAI_npc_teleportation_portal(Creature *pCreature)
{
    return new npc_teleportation_portalAI(pCreature);
}

void AddSC_violet_hold()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_sinclari_vh";
    newscript->GetAI = &GetAI_npc_sinclari;
    newscript->pGossipHello = &GossipHello_npc_sinclari;
    newscript->pGossipSelect = &GossipSelect_npc_sinclari;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_dragons_vh";
    newscript->GetAI = &GetAI_mob_vh_dragons;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "npc_azure_saboteur_vh";
    newscript->GetAI = &GetAI_npc_azure_saboteur;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_teleportation_portal_vh";
    newscript->GetAI = &GetAI_npc_teleportation_portal;
    newscript->RegisterSelf();
}
