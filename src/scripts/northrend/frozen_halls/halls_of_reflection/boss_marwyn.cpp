#include "ScriptedPch.h"
#include "halls_of_reflection.h"

struct boss_marwynAI : public ScriptedAI
{
    boss_marwynAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = c->GetInstanceData();
    }
    
    ScriptedInstance* pInstance;

	uint32 Corrupted_Flesh_Timer;
	uint32 Shared_Suffering_Timer;
	uint32 Obliterate_Timer;

    void Reset()
    {
        if (pInstance)
            pInstance->SetData(DATA_KNIGHTS_EVENT, NOT_STARTED);

		Corrupted_Flesh_Timer = 30000;
		Shared_Suffering_Timer = 20000;
		Obliterate_Timer = 30000;
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

		if(Corrupted_Flesh_Timer < diff)
		{
			if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCast(target, DUNGEON_MODE(72363,72436));

			Corrupted_Flesh_Timer = 30000;
		} else Corrupted_Flesh_Timer -= diff;

		if(Shared_Suffering_Timer < diff)
		{
			if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCast(target, DUNGEON_MODE(72368,72369));

			Shared_Suffering_Timer = 20000;
		} else Shared_Suffering_Timer -= diff;

		if(Obliterate_Timer < diff)
		{
			if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCast(target, DUNGEON_MODE(72360,72434));

			Obliterate_Timer = 30000;
		} else Obliterate_Timer -= diff;

	DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)  
    {
		 if (pInstance && !me->FindNearestCreature(NPC_BOSS_FALRIC, 200, true))
            pInstance->SetData(DATA_KNIGHTS_EVENT, DONE);
    }
};

CreatureAI* GetAI_boss_marwyn(Creature* pCreature)
{
    return new boss_marwynAI (pCreature);
}

void AddSC_boss_marwyn()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_marwyn";
    newscript->GetAI = &GetAI_boss_marwyn;
    newscript->RegisterSelf();
}