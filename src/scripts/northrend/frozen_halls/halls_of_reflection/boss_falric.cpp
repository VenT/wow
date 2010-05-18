#include "ScriptedPch.h"
#include "halls_of_reflection.h"

struct boss_falricAI : public ScriptedAI
{
    boss_falricAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = c->GetInstanceData();
    }
    
    ScriptedInstance* pInstance;

	uint32 Quivering_Strike_Timer;
	uint32 Defiling_Horror_Timer;

    void Reset()
    {
        if (pInstance)
            pInstance->SetData(DATA_KNIGHTS_EVENT, NOT_STARTED);

		Quivering_Strike_Timer = 5000;
		Defiling_Horror_Timer = 15000;
    }

    void EnterCombat(Unit* who)
    {
        if (pInstance)
		{
            pInstance->SetData(DATA_KNIGHTS_EVENT, IN_PROGRESS);
		}
    }
    
    void UpdateAI(const uint32 diff)
    {
         //Return since we have no target
        if (!UpdateVictim())
            return;

		if(Defiling_Horror_Timer < diff)
		{
			if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCast(target, DUNGEON_MODE(72435,72452));

			Defiling_Horror_Timer = 20000;
		} else Defiling_Horror_Timer -= diff;

		if(Quivering_Strike_Timer < diff)
		{
			if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCast(target, DUNGEON_MODE(72422,72453));

			Quivering_Strike_Timer = 9000;
		} else Quivering_Strike_Timer -= diff;

	DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)  
    {
		 if (pInstance && !me->FindNearestCreature(NPC_BOSS_MARGYWN, 200, true))
            pInstance->SetData(DATA_KNIGHTS_EVENT, DONE);
    }
};

CreatureAI* GetAI_boss_falric(Creature* pCreature)
{
    return new boss_falricAI (pCreature);
}

void AddSC_boss_falric()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_falric";
    newscript->GetAI = &GetAI_boss_falric;
    newscript->RegisterSelf();
}