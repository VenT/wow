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

#ifndef DEF_ICECROWN_H
#define DEF_ICECROWN_H

#define DATA_KNIGHTS_EVENT                   1
#define DATA_LICHKING_EVENT                  2
#define DATA_GO_FROSTMOURNE					 3

#define NPC_SLYVANAS_PART1             37223
#define NPC_SLYVANAS_PART2             37554
#define NPC_JAINA_PART1                37221
#define NPC_JAINA_PART2                36955
#define NPC_KILARA                     37779 // Actually Loralen, but its copy paste so i dont care to update. Which questions why im taking the time to write this instead of updating it. FFS I should stop typing. Alright.
#define NPC_ELANDRA                    37582 // Same song, same verse, a little big louder, a whole lot worse.


enum lichkingevent
{
    ENCOUNTER_WAVE_MERCANERY     = 6,  // How many mercs there are when we start
    ENCOUNTER_WAVE_FOOTMAN       = 10, // How many footmen there are when we start
    ENCOUNTER_WAVE_RIFLEMAN      = 6,  // How many riflemen there are when we start
    ENCOUNTER_WAVE_PRIEST        = 6,  // How many priests there are when we start
    ENCOUNTER_WAVE_MAGE          = 6,  // How many mages there are when we start

    SAY_SLYVANAS_1               = -1609301,
    SAY_SLYVANAS_2               = -1609302,
    SAY_UTHER_1                  = -1609303,
    SAY_SLYVANAS_3               = -1609304,
    SAY_UTHER_2                  = -1609305,
    SAY_SLYVANAS_4               = -1609306, 
    SAY_UTHER_3                  = -1609307,
    SAY_SLYVANAS_5               = -1609308,
    SAY_UTHER_4                  = -1609309,
	SAY_SLYVANAS_6               = -1609310,
	SAY_UTHER_5                  = -1609311,
	SAY_UTHER_6                  = -1609312,
	SAY_UTHER_7                  = -1609313,
	SAY_SLYVANAS_7               = -1609314,
	SAY_UTHER_8                  = -1609315,
	SAY_LICHKING_1               = -1609316,
	SAY_LICHKING_2               = -1609317,
	SAY_LICHKING_3               = -1609318,
	SAY_FALRIC_1                 = -1609319,
	SAY_MARGWYN_1                = -1609320,
	SAY_FALRIC_2                 = -1609321,
	SAY_SLYVANAS_8               = -1609322,

    GO_FROSTMOURNE               = 202302,
	GO_START_DOOR                = 201976,
	GO_ARTHAS_DOOR               = 197341,
	GO_FROSTMOURNE_ALTAR         = 202236,

	NPC_WAVE_MERCANERY           = 38177,
	NPC_WAVE_FOOTMAN             = 38173,
	NPC_WAVE_RIFLEMAN            = 38176,
	NPC_WAVE_PRIEST              = 38175,
	NPC_WAVE_MAGE                = 38172,

	NPC_UTHER                    = 37225,

	NPC_SLYVANAS                 = 37223,
	NPC_JAINA                    = 37221,

    // Lich King
    NPC_THE_LICH_KING_EVENT      = 37226, // Unarmed
	NPC_THE_LICH_KING_BOSS       = 36954, // BOSS

    NPC_BOSS_FALRIC              = 38112,
	NPC_BOSS_MARGYWN             = 38113
};

struct Locations
{
    float x, y, z, o;
    uint32 id;
};

static Locations HallsofReflectionLocs[]=
{
    {5262.540527, 1949.693726, 707.695007, 0.8087360},     // 0 Slyvanas Beginning Position
    {5307.928711, 1998.495483, 709.342163, 1.302161},     // 1 Slyvanas walks to throne
    {5283.234863, 1990.946777, 707.695679, 0.929097},     // 2 Loralen Follows
    {5308.310059, 2003.857178, 709.341431, 4.650315},    // 3 Uther spawns
    {5362.917480, 2062.307129, 707.695374, 3.945812},    // 5 Lich King Spawns
    {5312.080566, 2009.172119, 709.341431, 3.973301},     // 6 Lich King walks to throne
    {5277.74,2016.88,707.778,5.96903},    // 7 Priest Spawn
    {5295.88,2040.34,707.778,5.07891},    // 7 Priest Spawn
    {5320.37,1980.13,707.778,2.00713},    // 7 Priest Spawn
    {5280.51,1997.84,707.778,0.296706},   // 7 Priest Spawn
    {5302.45,2042.22,707.778,4.90438},    // 7 Priest Spawn
    {5306.57,1977.47,707.778,1.50098},    // 7 Priest Spawn
    {5312.75,2037.12,707.778,4.59022},    // 7 Mage Spawn
    {5309.58,2042.67,707.778,4.69494},    // 7 Mage Spawn
    {5275.08,2008.72,707.778,6.21337},    // 7 Mage Spawn
    {5279.65,2004.66,707.778,0.069813},   // 7 Mage Spawn
    {5275.48,2001.14,707.778,0.174533},   // 7 Mage Spawn
    {5316.7,2041.55,707.778,4.50295},     // 7 Mage Spawn
    {5302.25,1972.41,707.778,1.37881},    // 7 Merc Spawn
    {5311.03,1972.23,707.778,1.64061},    // 7 Merc Spawn
    {5277.36,1993.23,707.778,0.401426},   // 7 Merc Spawn
    {5318.7,2036.11,707.778,4.2237},      // 7 Merc Spawn
    {5335.72,1996.86,707.778,2.74017},    // 7 Merc Spawn
    {5299.43,1979.01,707.778,1.23918},    // 7 Merc Spawn
    {5306.06,2037,707.778,4.81711},       // 7 Foot Spawn
    {5344.15,2007.17,707.778,3.15905},    // 7 Foot Spawn
    {5337.83,2010.06,707.778,3.22886},    // 7 Foot Spawn
    {5343.29,1999.38,707.778,2.9147},     // 7 Foot Spawn
    {5340.84,1992.46,707.778,2.75762},    // 7 Foot Spawn
    {5325.07,1977.6,707.778,2.07694},     // 7 Foot Spawn
    {5336.6,2017.28,707.778,3.47321},     // 7 Foot Spawn
    {5313.82,1978.15,707.778,1.74533},    // 7 Foot Spawn
    {5280.63,2012.16,707.778,6.05629},    // 7 Foot Spawn
    {5322.96,2040.29,707.778,4.34587},    // 7 Foot Spawn
    {5343.47,2015.95,707.778,3.49066},    // 7 Rifle Spawn
    {5337.86,2003.4,707.778,2.98451},     // 7 Rifle Spawn
    {5319.16,1974,707.778,1.91986},       // 7 Rifle Spawn
    {5299.25,2036,707.778,5.02655},       // 7 Rifle Spawn
    {5295.64,1973.76,707.778,1.18682},    // 7 Rifle Spawn
    {5282.9,2019.6,707.778,5.88176},      // 7 Rifle Spawn
    {5342.23,1975.7,709.402,2.3911},      // 7 Marygn Spawn
    {5276.58,2037.45,709.402,5.53269},    // 7 Falric Spawn
	{5400.069824, 2102.7131689, 707.69525, 0.843803},     // 8 Lich King walks away
    {5408.031250, 2102.918213, 707.695251, 0.792756},     // 9 Slyvanas Follows
    {5401.866699, 2110.837402, 707.695251, 0.800610},     // 10 Loralen follows
};

const Position SpawnChest [2] = // Map 668
{
	{5227.31, 1661.08, 784.302, 0.489687}, // 202336
	{5225.65, 1660.18, 784.302, 0.501468}  // 202337
};
#endif