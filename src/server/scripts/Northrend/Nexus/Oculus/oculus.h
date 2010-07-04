#ifndef DEF_OCULUS_H
#define DEF_OCULUS_H

enum Data
{
    DATA_DRAKOS_EVENT,
    DATA_VAROS_EVENT,
    DATA_UROM_EVENT,
    DATA_EREGOS_EVENT,
    DATA_CENTRIFUGE_CONSTRUCT_EVENT
};

enum Data64
{
    DATA_DRAKOS,
    DATA_VAROS,
    DATA_UROM,
    DATA_EREGOS
};

enum Bosses
{
    CREATURE_DRAKOS			= 27654,
    CREATURE_VAROS			= 27447,
    CREATURE_UROM			= 27655,
    CREATURE_EREGOS			= 27656, 
    CREATURE_AZURE_GUARDIAN	        = 27638,
 
    NPC_VERDISA                                   = 27657,
    NPC_BELGARISTRASZ                             = 27658,
    NPC_ETERNOS                                   = 27659
};

enum GameObjects
{
	GO_CACHE_OF_ERAGOS	   = 191349,
	GO_CACHE_OF_ERAGOS_H	   = 193603,
	GO_DRAGON_CAGE_DOOR        = 193995
};

#endif
