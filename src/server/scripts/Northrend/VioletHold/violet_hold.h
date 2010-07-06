#ifndef DEF_VIOLET_HOLD_H
#define DEF_VIOLET_HOLD_H

enum GameObjects
{
    GO_MAIN_DOOR                                    = 191723,
    GO_XEVOZZ_DOOR                                  = 191556,
    GO_LAVANTHOR_DOOR                               = 191566,
    GO_ICHORON_DOOR                                 = 191722,
    GO_ZURAMAT_DOOR                                 = 191565,
    GO_EREKEM_DOOR                                  = 191564,
    GO_EREKEM_GUARD_1_DOOR                          = 191563,
    GO_EREKEM_GUARD_2_DOOR                          = 191562,
    GO_MORAGG_DOOR                                  = 191606,
    GO_INTRO_ACTIVATION_CRYSTAL                     = 193615,
    GO_ACTIVATION_CRYSTAL                           = 193611
};

enum Creatures
{
    CREATURE_TELEPORTATION_PORTAL                   = 31011,
    CREATURE_PORTAL_GUARDIAN                        = 30660,
    CREATURE_PORTAL_KEEPER                          = 30695,
    CREATURE_XEVOZZ                                 = 29266,
    CREATURE_LAVANTHOR                              = 29312,
    CREATURE_ICHORON                                = 29313,
    CREATURE_ZURAMAT                                = 29314,
    CREATURE_EREKEM                                 = 29315,
    CREATURE_EREKEM_GUARD                           = 29395,
    CREATURE_MORAGG                                 = 29316,
    CREATURE_CYANIGOSA                              = 31134,
    CREATURE_SINCLARI                               = 30658
};

enum Data
{
    DATA_1ST_BOSS_EVENT,
    DATA_2ND_BOSS_EVENT,
    DATA_CYANIGOSA_EVENT,
    DATA_WAVE_COUNT,
    DATA_REMOVE_NPC,
    DATA_DOOR,
        DATA_BOSS_PHASE,
        DATA_LASTBOSS
};

enum Data64
{
    DATA_MORAGG,
    DATA_EREKEM,
    DATA_EREKEM_GUARD_1,
    DATA_EREKEM_GUARD_2,
    DATA_ICHORON,
    DATA_LAVANTHOR,
    DATA_XEVOZZ,
    DATA_ZURAMAT,
    DATA_CYANIGOSA,
    DATA_MORAGG_CELL,
    DATA_EREKEM_CELL,
    DATA_EREKEM_LEFT_GUARD_CELL,
    DATA_EREKEM_RIGHT_GUARD_CELL,
    DATA_ICHORON_CELL,
    DATA_LAVANTHOR_CELL,
    DATA_XEVOZZ_CELL,
    DATA_ZURAMAT_CELL,
    DATA_MAIN_DOOR,
    DATA_SINCLARI,
    DATA_INSTANCE_FAILED
};

enum Bosses
{
    BOSS_NONE,              // 0 used as marker for not yet randomized
    BOSS_MORAGG,
    BOSS_EREKEM,
    BOSS_ICHORON,
    BOSS_LAVANTHOR,
    BOSS_XEVOZZ,
    BOSS_ZURAMAT,
    BOSS_CYANIGOSA
};

enum WorldState
{
    WORLD_STATE_VH              = 3816,
    WORLD_STATE_VH_PRISON_STATE = 3815,
    WORLD_STATE_VH_WAVE_COUNT   = 3810,
};

enum DefenceSystem
{
        SPELL_DEFENSE_SYSTEM_VISUAL                     = 57887,
    SPELL_DEFENSE_SYSTEM_SPAWN                  = 57886,
        SPELL_CONTROL_CRYSTAL_ACTIVATION        = 57804,
        NPC_DEFENSE_SYSTEM                                      = 30837,
    NPC_DEFENSE_DUMMY_TARGET                    = 30857
};

static float fDefenseSystemLoc[4] = {1888.146f, 803.382f, 58.604f, 3.072f};


#endif