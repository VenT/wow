/*
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * Copyright (C) 2008-2010 Trinity <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "Corpse.h"
#include "Player.h"
#include "Vehicle.h"
#include "SpellAuras.h"
#include "MapManager.h"
#include "Transports.h"
#include "BattleGround.h"
#include "WaypointMovementGenerator.h"
#include "InstanceSaveMgr.h"
#include "ObjectMgr.h"
#include "World.h"

//#define __ANTI_DEBUG__

#ifdef __ANTI_DEBUG__
#include "Chat.h"
std::string FlagsToStr(const uint32 Flags)
{
    std::string Ret="";
    if(Flags==0)
    {
        Ret="None";
        return Ret;
    }
    
    if(Flags & MOVEMENTFLAG_FORWARD)
    {   Ret+="FW "; }
    if(Flags & MOVEMENTFLAG_BACKWARD)
    {   Ret+="BW "; }
    if(Flags & MOVEMENTFLAG_STRAFE_LEFT)
    {   Ret+="STL ";    }
    if(Flags & MOVEMENTFLAG_STRAFE_RIGHT)
    {   Ret+="STR ";    }
    if(Flags & MOVEMENTFLAG_LEFT)
    {   Ret+="LF "; }
    if(Flags & MOVEMENTFLAG_RIGHT)
    {   Ret+="RI "; }
    if(Flags & MOVEMENTFLAG_PITCH_UP)
    {   Ret+="PTUP ";   }
    if(Flags & MOVEMENTFLAG_PITCH_DOWN)
    {   Ret+="PTDW ";   }
    if(Flags & MOVEMENTFLAG_WALK_MODE)
    {   Ret+="WALK ";   }
    if(Flags & MOVEMENTFLAG_ONTRANSPORT)
    {   Ret+="TRANS ";  }
    if(Flags & MOVEMENTFLAG_LEVITATING)
    {   Ret+="LEVI ";   }
    if(Flags & MOVEMENTFLAG_FLY_UNK1)
    {   Ret+="FLYUNK1 ";    }
    if(Flags & MOVEMENTFLAG_JUMPING)
    {   Ret+="JUMP ";   }
    if(Flags & MOVEMENTFLAG_UNK4)
    {   Ret+="UNK4 ";   }
    if(Flags & MOVEMENTFLAG_FALLING)
    {   Ret+="FALL ";   }
    if(Flags & MOVEMENTFLAG_SWIMMING)
    {   Ret+="SWIM ";   }
    if(Flags & MOVEMENTFLAG_FLY_UP)
    {   Ret+="FLYUP ";  }
    if(Flags & MOVEMENTFLAG_CAN_FLY)
    {   Ret+="CFLY ";   }
    if(Flags & MOVEMENTFLAG_FLYING)
    {   Ret+="FLY ";    }
    if(Flags & MOVEMENTFLAG_FLYING2)
    {   Ret+="FLY2 ";   }
    if(Flags & MOVEMENTFLAG_WATERWALKING)
    {   Ret+="WTWALK "; }
    if(Flags & MOVEMENTFLAG_SAFE_FALL)
    {   Ret+="SAFE ";   }
    if(Flags & MOVEMENTFLAG_UNK3)
    {   Ret+="UNK3 ";   }
    if(Flags & MOVEMENTFLAG_SPLINE)
    {   Ret+="SPLINE ";     }
    if(Flags & MOVEMENTFLAG_SPLINE2)
    {   Ret+="SPLINE2 ";    }
    
    return Ret;
}
#endif // __ANTI_DEBUG__

bool WorldSession::Anti__ReportCheat(const char* Reason,float Speed,const char* Op,float Val1,uint32 Val2,MovementInfo* MvInfo)
{
    if(!Reason)
    {
        sLog.outError("Anti__ReportCheat: Missing Reason parameter!");
        return false;
    }
    const char* Player=GetPlayer()->GetName();
    uint32 Acc=GetPlayer()->GetSession()->GetAccountId();
    uint32 Map=GetPlayer()->GetMapId();
    if(!Player)
    {
        sLog.outError("Anti__ReportCheat: Player with no name?!?");
        return false;
    }

    QueryResult_AutoPtr Res=CharacterDatabase.PQuery("SELECT speed,Val1 FROM cheaters WHERE player='%s' AND reason LIKE '%s' AND Map='%u' AND last_date >= NOW()-300",Player,Reason,Map);
    if(Res)
    {
        Field* Fields = Res->Fetch();
        
        std::stringstream Query;
        Query << "UPDATE cheaters SET count=count+1,last_date=NOW()";
        Query.precision(5);
        if(Speed>0.0f && Speed > Fields[0].GetFloat())
        {
            Query << ",speed='";
            Query << std::fixed << Speed;
            Query << "'";
        }

        if(Val1>0.0f && Val1 > Fields[1].GetFloat())
        {
            Query << ",Val1='";
            Query << std::fixed << Val1;
            Query << "'";
        }
        
        Query << " WHERE player='" << Player << "' AND reason='" << Reason << "' AND Map='" << Map << "' AND last_date >= NOW()-300 ORDER BY entry DESC LIMIT 1";
        
        CharacterDatabase.Execute(Query.str().c_str());
    }
    else
    {
        if(!Op)
        {   Op="";  }
        std::stringstream Pos;
        Pos << "OldPos: " << GetPlayer()->GetPositionX() << " " << GetPlayer()->GetPositionY() << " "
            << GetPlayer()->GetPositionZ();
        if(MvInfo)
        {
            Pos << "\nNew: " << MvInfo->x << " " << MvInfo->y << " " << MvInfo->z << "\n"
                << "Flags: " << MvInfo->flags << "\n"
                << "t_guid: " << MvInfo->t_guid << " falltime: " << MvInfo->fallTime;
        }
        CharacterDatabase.PExecute("INSERT INTO cheaters (player,acctid,reason,speed,count,first_date,last_date,`Op`,Val1,Val2,Map,Pos,Level) "
                                   "VALUES ('%s','%u','%s','%f','1',NOW(),NOW(),'%s','%f','%u','%u','%s','%u')",
                                   Player,Acc,Reason,Speed,Op,Val1,Val2,Map,
                                   Pos.str().c_str(),GetPlayer()->getLevel());
    }

    if(sWorld.GetMvAnticheatKill() && GetPlayer()->isAlive())
    {
        GetPlayer()->DealDamage(GetPlayer(), GetPlayer()->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
    }
    if(sWorld.GetMvAnticheatKick())
    {
        GetPlayer()->GetSession()->KickPlayer();
    }
    if(sWorld.GetMvAnticheatBan() & 1)
    {
        sWorld.BanAccount(BAN_CHARACTER,Player,sWorld.GetMvAnticheatBanTime(),"Cheat","Anticheat");
    }
    if(sWorld.GetMvAnticheatBan() & 2)
    {
        QueryResult_AutoPtr result = LoginDatabase.PQuery("SELECT last_ip FROM account WHERE id=%u", Acc);
        if(result)
        {

            Field *fields = result->Fetch();
            std::string LastIP = fields[0].GetCppString();
            if(!LastIP.empty())
            {
                sWorld.BanAccount(BAN_IP,LastIP,sWorld.GetMvAnticheatBanTime(),"Cheat","Anticheat");
            }
        }
    }
    return true;
}

bool WorldSession::Anti__CheatOccurred(uint32 CurTime,const char* Reason,float Speed,const char* Op,
                                float Val1,uint32 Val2,MovementInfo* MvInfo)
{
    if(!Reason)
    {
        sLog.outError("Anti__CheatOccurred: Missing Reason parameter!");
        return false;
    }
    
    GetPlayer()->m_anti_lastalarmtime = CurTime;
    GetPlayer()->m_anti_alarmcount = GetPlayer()->m_anti_alarmcount + 1;

    if (GetPlayer()->m_anti_alarmcount > sWorld.GetMvAnticheatAlarmCount())
    {
        Anti__ReportCheat(Reason,Speed,Op,Val1,Val2,MvInfo);
        return true;
    }
    return false;
}
>>>>>>> 2a294af... Anticheat based on AC-2 and intersected with MaNGOS.:src/game/MovementHandler.cpp

void WorldSession::HandleMoveWorldportAckOpcode(WorldPacket & /*recv_data*/)
{
    sLog.outDebug("WORLD: got MSG_MOVE_WORLDPORT_ACK.");
    HandleMoveWorldportAckOpcode();
}

void WorldSession::HandleMoveWorldportAckOpcode()
{
    // ignore unexpected far teleports
    if (!GetPlayer()->IsBeingTeleportedFar())
        return;

    // get the teleport destination
    WorldLocation &loc = GetPlayer()->GetTeleportDest();

    // possible errors in the coordinate validity check
    if (!MapManager::IsValidMapCoord(loc))
    {
        LogoutPlayer(false);
        return;
    }

    // get the destination map entry, not the current one, this will fix homebind and reset greeting
    MapEntry const* mEntry = sMapStore.LookupEntry(loc.GetMapId());
    InstanceTemplate const* mInstance = objmgr.GetInstanceTemplate(loc.GetMapId());

    // reset instance validity, except if going to an instance inside an instance
    if (GetPlayer()->m_InstanceValid == false && !mInstance)
        GetPlayer()->m_InstanceValid = true;

    GetPlayer()->SetSemaphoreTeleportFar(false);

    Map * oldMap = GetPlayer()->GetMap();
    assert(oldMap);
    if (GetPlayer()->IsInWorld())
    {
        sLog.outCrash("Player is still in world when teleported from map %u! to new map %u", oldMap->GetId(), loc.GetMapId());
        oldMap->Remove(GetPlayer(), false);
    }

    // relocate the player to the teleport destination
    Map * newMap = MapManager::Instance().CreateMap(loc.GetMapId(), GetPlayer(), 0);
    // the CanEnter checks are done in TeleporTo but conditions may change
    // while the player is in transit, for example the map may get full
    if (!newMap || !newMap->CanEnter(GetPlayer()))
    {
        sLog.outError("Map %d could not be created for player %d, porting player to homebind", loc.GetMapId(), GetPlayer()->GetGUIDLow());
        GetPlayer()->TeleportTo(GetPlayer()->m_homebindMapId, GetPlayer()->m_homebindX, GetPlayer()->m_homebindY, GetPlayer()->m_homebindZ, GetPlayer()->GetOrientation());
        return;
    }
    else
        GetPlayer()->Relocate(&loc);

    GetPlayer()->ResetMap();
    GetPlayer()->SetMap(newMap);

    GetPlayer()->SendInitialPacketsBeforeAddToMap();
    if (!GetPlayer()->GetMap()->Add(GetPlayer()))
    {
        sLog.outError("WORLD: failed to teleport player %s (%d) to map %d because of unknown reason!", GetPlayer()->GetName(), GetPlayer()->GetGUIDLow(), loc.GetMapId());
        GetPlayer()->ResetMap();
        GetPlayer()->SetMap(oldMap);
        GetPlayer()->TeleportTo(GetPlayer()->m_homebindMapId, GetPlayer()->m_homebindX, GetPlayer()->m_homebindY, GetPlayer()->m_homebindZ, GetPlayer()->GetOrientation());
        return;
    }

    // battleground state prepare (in case join to BG), at relogin/tele player not invited
    // only add to bg group and object, if the player was invited (else he entered through command)
    if (_player->InBattleGround())
    {
        // cleanup setting if outdated
        if (!mEntry->IsBattleGroundOrArena())
        {
            // We're not in BG
            _player->SetBattleGroundId(0, BATTLEGROUND_TYPE_NONE);
            // reset destination bg team
            _player->SetBGTeam(0);
        }
        // join to bg case
        else if (BattleGround *bg = _player->GetBattleGround())
        {
            if (_player->IsInvitedForBattleGroundInstance(_player->GetBattleGroundId()))
                bg->AddPlayer(_player);
        }
    }

    GetPlayer()->SendInitialPacketsAfterAddToMap();

    // flight fast teleport case
    if (GetPlayer()->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLIGHT_MOTION_TYPE)
    {
        if (!_player->InBattleGround())
        {
            // short preparations to continue flight
            FlightPathMovementGenerator* flight = (FlightPathMovementGenerator*)(GetPlayer()->GetMotionMaster()->top());
            flight->Initialize(*GetPlayer());
            return;
        }

        // battleground state prepare, stop flight
        GetPlayer()->GetMotionMaster()->MovementExpired();
        GetPlayer()->CleanupAfterTaxiFlight();
    }

    // resurrect character at enter into instance where his corpse exist after add to map
    Corpse *corpse = GetPlayer()->GetCorpse();
    if (corpse && corpse->GetType() != CORPSE_BONES && corpse->GetMapId() == GetPlayer()->GetMapId())
    {
        if (mEntry->IsDungeon())
        {
            GetPlayer()->ResurrectPlayer(0.5f,false);
            GetPlayer()->SpawnCorpseBones();
        }
    }

    bool allowMount = !mEntry->IsDungeon() || mEntry->IsBattleGroundOrArena();
    if (mInstance)
    {
        Difficulty diff = GetPlayer()->GetDifficulty(mEntry->IsRaid());
        if (MapDifficulty const* mapDiff = GetMapDifficultyData(mEntry->MapID,diff))
        {
            if (mapDiff->resetTime)
            {
                if (uint32 timeReset = sInstanceSaveManager.GetResetTimeFor(mEntry->MapID,diff))
                {
                    uint32 timeleft = timeReset - time(NULL);
                    GetPlayer()->SendInstanceResetWarning(mEntry->MapID, diff, timeleft);
                }
            }
        }
        allowMount = mInstance->allowMount;
    }

    // mount allow check
    if (!allowMount)
        _player->RemoveAurasByType(SPELL_AURA_MOUNTED);

    // update zone immediately, otherwise leave channel will cause crash in mtmap
    uint32 newzone, newarea;
    GetPlayer()->GetZoneAndAreaId(newzone, newarea);
    GetPlayer()->UpdateZone(newzone, newarea);

    // honorless target
    if (GetPlayer()->pvpInfo.inHostileArea)
        GetPlayer()->CastSpell(GetPlayer(), 2479, true);

    // resummon pet
    GetPlayer()->ResummonPetTemporaryUnSummonedIfAny();

    //lets process all delayed operations on successful teleport
    GetPlayer()->ProcessDelayedOperations();
}

void WorldSession::HandleMoveTeleportAck(WorldPacket& recv_data)
{
    sLog.outDebug("MSG_MOVE_TELEPORT_ACK");
    uint64 guid;

    if (!recv_data.readPackGUID(guid))
        return;

    uint32 flags, time;
    recv_data >> flags >> time;
    DEBUG_LOG("Guid " UI64FMTD, guid);
    DEBUG_LOG("Flags %u, time %u", flags, time/IN_MILISECONDS);

    Unit *mover = _player->m_mover;
    Player *plMover = mover->GetTypeId() == TYPEID_PLAYER ? (Player*)mover : NULL;

    if (!plMover || !plMover->IsBeingTeleportedNear())
        return;

    if (guid != plMover->GetGUID())
        return;

    plMover->SetSemaphoreTeleportNear(false);

    uint32 old_zone = plMover->GetZoneId();

    WorldLocation const& dest = plMover->GetTeleportDest();

    plMover->SetPosition(dest,true);

    uint32 newzone, newarea;
    plMover->GetZoneAndAreaId(newzone, newarea);
    plMover->UpdateZone(newzone, newarea);

    // new zone
    if (old_zone != newzone)
    {
        // honorless target
        if (plMover->pvpInfo.inHostileArea)
            plMover->CastSpell(plMover, 2479, true);
    }

    // resummon pet
    GetPlayer()->ResummonPetTemporaryUnSummonedIfAny();

    //lets process all delayed operations on successful teleport
    GetPlayer()->ProcessDelayedOperations();
}

void WorldSession::HandleMovementOpcodes(WorldPacket & recv_data)
{
    uint16 opcode = recv_data.GetOpcode();
    //sLog.outDebug("WORLD: Recvd %s (%u, 0x%X) opcode", LookupOpcodeName(opcode), opcode, opcode);
    recv_data.hexlike();

    Unit *mover = _player->m_mover;

    assert(mover != NULL);                                  // there must always be a mover

    Player *plMover = mover->GetTypeId() == TYPEID_PLAYER ? (Player*)mover : NULL;

    // ignore, waiting processing in WorldSession::HandleMoveWorldportAckOpcode and WorldSession::HandleMoveTeleportAck
    if (plMover && plMover->IsBeingTeleported())
    {
        recv_data.rpos(recv_data.wpos());                   // prevent warnings spam
        return;
    }

    /* extract packet */
    uint64 guid;

    if (!recv_data.readPackGUID(guid))
        return;

    MovementInfo movementInfo;
    movementInfo.guid = guid;
    ReadMovementInfo(recv_data, &movementInfo);
    /*----------------*/

   /* if (recv_data.size() != recv_data.rpos())
    {
        sLog.outError("MovementHandler: player %s (guid %d, account %u) sent a packet (opcode %u) that is " SIZEFMTD " bytes larger than it should be. Kicked as cheater.", _player->GetName(), _player->GetGUIDLow(), _player->GetSession()->GetAccountId(), recv_data.GetOpcode(), recv_data.size() - recv_data.rpos());
        KickPlayer();*/
        recv_data.rpos(recv_data.wpos());                   // prevent warnings spam
    /*    return;
    }*/

    if (!Trinity::IsValidMapCoord(movementInfo.x, movementInfo.y, movementInfo.z, movementInfo.o))
    {
        recv_data.rpos(recv_data.wpos());                   // prevent warnings spam
        return;
    }

    /* handle special cases */
    if (movementInfo.flags & MOVEMENTFLAG_ONTRANSPORT)
    {
        // transports size limited
        // (also received at zeppelin leave by some reason with t_* as absolute in continent coordinates, can be safely skipped)
        if (movementInfo.t_x > 50 || movementInfo.t_y > 50 || movementInfo.t_z > 50)
        {
            recv_data.rpos(recv_data.wpos());                   // prevent warnings spam
            return;
        }

        if (!Trinity::IsValidMapCoord(movementInfo.x+movementInfo.t_x, movementInfo.y + movementInfo.t_y,
            movementInfo.z + movementInfo.t_z, movementInfo.o + movementInfo.t_o))
        {
            recv_data.rpos(recv_data.wpos());                   // prevent warnings spam
            return;
        }

        // if we boarded a transport, add us to it
        if (plMover && !plMover->GetTransport())
        {
            // elevators also cause the client to send MOVEMENTFLAG_ONTRANSPORT - just unmount if the guid can be found in the transport list
            for (MapManager::TransportSet::const_iterator iter = MapManager::Instance().m_Transports.begin(); iter != MapManager::Instance().m_Transports.end(); ++iter)
            {
                if ((*iter)->GetGUID() == movementInfo.t_guid)
                {
                    plMover->m_transport = (*iter);
                    (*iter)->AddPassenger(plMover);
                    break;
                }
            }
        }

        if (!mover->GetTransport() && !mover->GetVehicle())
        {
            GameObject *go = mover->GetMap()->GetGameObject(movementInfo.t_guid);
            if (!go || go->GetGoType() != GAMEOBJECT_TYPE_TRANSPORT)
                movementInfo.flags &= ~MOVEMENTFLAG_ONTRANSPORT;
        }
    }
    else if (plMover && plMover->GetTransport())                // if we were on a transport, leave
    {
        plMover->m_transport->RemovePassenger(plMover);
        plMover->m_transport = NULL;
        movementInfo.t_x = 0.0f;
        movementInfo.t_y = 0.0f;
        movementInfo.t_z = 0.0f;
        movementInfo.t_o = 0.0f;
        movementInfo.t_time = 0;
        movementInfo.t_seat = -1;
    }

    // fall damage generation (ignore in flight case that can be triggered also at lags in moment teleportation to another map).
    if (opcode == MSG_MOVE_FALL_LAND && plMover && !plMover->isInFlight())
        plMover->HandleFall(movementInfo);

    if (plMover && ((movementInfo.flags & MOVEMENTFLAG_SWIMMING) != 0) != plMover->IsInWater())
    {
        // now client not include swimming flag in case jumping under water
        plMover->SetInWater(!plMover->IsInWater() || plMover->GetBaseMap()->IsUnderWater(movementInfo.x, movementInfo.y, movementInfo.z));
    }

    /*----------------------*/

    /* process position-change */
    WorldPacket data(opcode, recv_data.size());
    movementInfo.time = getMSTime();
    movementInfo.guid = mover->GetGUID();
    WriteMovementInfo(&data, &movementInfo);
    mover->SendMessageToSet(&data, _player);

    mover->m_movementInfo = movementInfo;

    // this is almost never true (not sure why it is sometimes, but it is), normally use mover->IsVehicle()
    if (mover->GetVehicle())
    {
        mover->SetOrientation(movementInfo.o);
        return;
    }

    mover->SetPosition(movementInfo.x, movementInfo.y, movementInfo.z, movementInfo.o);

    if (plMover)                                            // nothing is charmed, or player charmed
    {
        plMover->UpdateFallInformationIfNeed(movementInfo, opcode);

        if (movementInfo.z < -500.0f)
        {
            if (plMover->InBattleGround()
                && plMover->GetBattleGround()
                && plMover->GetBattleGround()->HandlePlayerUnderMap(_player))
            {
                // do nothing, the handle already did if returned true
            }
            else
            {
                // NOTE: this is actually called many times while falling
                // even after the player has been teleported away
                // TODO: discard movement packets after the player is rooted
                if (plMover->isAlive())
                {
                    plMover->EnvironmentalDamage(DAMAGE_FALL_TO_VOID, GetPlayer()->GetMaxHealth());
                    // pl can be alive if GM/etc
                    if (!plMover->isAlive())
                    {
                        // change the death state to CORPSE to prevent the death timer from
                        // starting in the next player update
                        plMover->KillPlayer();
                        plMover->BuildPlayerRepop();
                    }
                }

                // cancel the death timer here if started
                plMover->RepopAtGraveyard();
            }
        }
    }
    /*else                                                    // creature charmed
    {
        if (mover->canFly())
        {
            bool flying = mover->IsFlying();
            if (flying != ((mover->GetByteValue(UNIT_FIELD_BYTES_1, 3) & 0x02) ? true : false))
                mover->SetFlying(flying);
        }
    }*/

    //sLog.outString("Receive Movement Packet %s:", opcodeTable[recv_data.GetOpcode()]);
    //mover->OutMovementInfo();
}

void WorldSession::HandleForceSpeedChangeAck(WorldPacket &recv_data)
{
    uint32 opcode = recv_data.GetOpcode();
    sLog.outDebug("WORLD: Recvd %s (%u, 0x%X) opcode", LookupOpcodeName(opcode), opcode, opcode);

    /* extract packet */
    uint64 guid;
    uint32 unk1;
    float  newspeed;

    if (!recv_data.readPackGUID(guid))
        return;

    // now can skip not our packet
    if (_player->GetGUID() != guid)
    {
        recv_data.rpos(recv_data.wpos());                   // prevent warnings spam
        return;
    }

    // continue parse packet

    recv_data >> unk1;                                      // counter or moveEvent

    MovementInfo movementInfo;
    movementInfo.guid = guid;
    ReadMovementInfo(recv_data, &movementInfo);

    recv_data >> newspeed;
    /*----------------*/

    // client ACK send one packet for mounted/run case and need skip all except last from its
    // in other cases anti-cheat check can be fail in false case
    UnitMoveType move_type;
    UnitMoveType force_move_type;

    static char const* move_type_name[MAX_MOVE_TYPE] = {  "Walk", "Run", "RunBack", "Swim", "SwimBack", "TurnRate", "Flight", "FlightBack", "PitchRate" };

    switch(opcode)
    {
        case CMSG_FORCE_WALK_SPEED_CHANGE_ACK:          move_type = MOVE_WALK;          force_move_type = MOVE_WALK;        break;
        case CMSG_FORCE_RUN_SPEED_CHANGE_ACK:           move_type = MOVE_RUN;           force_move_type = MOVE_RUN;         break;
        case CMSG_FORCE_RUN_BACK_SPEED_CHANGE_ACK:      move_type = MOVE_RUN_BACK;      force_move_type = MOVE_RUN_BACK;    break;
        case CMSG_FORCE_SWIM_SPEED_CHANGE_ACK:          move_type = MOVE_SWIM;          force_move_type = MOVE_SWIM;        break;
        case CMSG_FORCE_SWIM_BACK_SPEED_CHANGE_ACK:     move_type = MOVE_SWIM_BACK;     force_move_type = MOVE_SWIM_BACK;   break;
        case CMSG_FORCE_TURN_RATE_CHANGE_ACK:           move_type = MOVE_TURN_RATE;     force_move_type = MOVE_TURN_RATE;   break;
        case CMSG_FORCE_FLIGHT_SPEED_CHANGE_ACK:        move_type = MOVE_FLIGHT;        force_move_type = MOVE_FLIGHT;      break;
        case CMSG_FORCE_FLIGHT_BACK_SPEED_CHANGE_ACK:   move_type = MOVE_FLIGHT_BACK;   force_move_type = MOVE_FLIGHT_BACK; break;
        case CMSG_FORCE_PITCH_RATE_CHANGE_ACK:          move_type = MOVE_PITCH_RATE;    force_move_type = MOVE_PITCH_RATE;  break;
        default:
            sLog.outError("WorldSession::HandleForceSpeedChangeAck: Unknown move type opcode: %u", opcode);
            return;
    }

    // skip all forced speed changes except last and unexpected
    // in run/mounted case used one ACK and it must be skipped.m_forced_speed_changes[MOVE_RUN} store both.
    if (_player->m_forced_speed_changes[force_move_type] > 0)
    {
        --_player->m_forced_speed_changes[force_move_type];
        if (_player->m_forced_speed_changes[force_move_type] > 0)
            return;
    }

    if (!_player->GetTransport() && fabs(_player->GetSpeed(move_type) - newspeed) > 0.01f)
    {
        if (_player->GetSpeed(move_type) > newspeed)         // must be greater - just correct
        {
            sLog.outError("%sSpeedChange player %s is NOT correct (must be %f instead %f), force set to correct value",
                move_type_name[move_type], _player->GetName(), _player->GetSpeed(move_type), newspeed);
            _player->SetSpeed(move_type,_player->GetSpeedRate(move_type),true);
        }
        else                                                // must be lesser - cheating
        {
            sLog.outBasic("Player %s from account id %u kicked for incorrect speed (must be %f instead %f)",
                _player->GetName(),_player->GetSession()->GetAccountId(),_player->GetSpeed(move_type), newspeed);
            _player->GetSession()->KickPlayer();
        }
    }
}

void WorldSession::HandleSetActiveMoverOpcode(WorldPacket &recv_data)
{
    sLog.outDebug("WORLD: Recvd CMSG_SET_ACTIVE_MOVER");

    uint64 guid;
    recv_data >> guid;

    if (GetPlayer()->IsInWorld())
       if (Unit *mover = ObjectAccessor::GetUnit(*GetPlayer(), guid))
       {
          GetPlayer()->SetMover(mover);
          if (mover != GetPlayer() && mover->canFly())
          {
              WorldPacket data(SMSG_MOVE_SET_CAN_FLY, 12);
              data.append(mover->GetPackGUID());
              data << uint32(0);
              SendPacket(&data);
          }
       }
    else
    {
        sLog.outError("HandleSetActiveMoverOpcode: incorrect mover guid: mover is " UI64FMTD " and should be " UI64FMTD, guid, _player->m_mover->GetGUID());
        GetPlayer()->SetMover(GetPlayer());
    }
}

void WorldSession::HandleMoveNotActiveMover(WorldPacket &recv_data)
{
    sLog.outDebug("WORLD: Recvd CMSG_MOVE_NOT_ACTIVE_MOVER");

    uint64 old_mover_guid;
    if (!recv_data.readPackGUID(old_mover_guid))
        return;

    /*if (_player->m_mover->GetGUID() == old_mover_guid)
    {
        sLog.outError("HandleMoveNotActiveMover: incorrect mover guid: mover is " I64FMT " and should be " I64FMT " instead of " I64FMT, _player->m_mover->GetGUID(), _player->GetGUID(), old_mover_guid);
        recv_data.rpos(recv_data.wpos());                   // prevent warnings spam
        return;
    }*/

    MovementInfo mi;
    mi.guid = old_mover_guid;
    ReadMovementInfo(recv_data, &mi);

    //ReadMovementInfo(recv_data, &_player->m_mover->m_movementInfo);
    _player->m_movementInfo = mi;
}

void WorldSession::HandleDismissControlledVehicle(WorldPacket &recv_data)
{
    sLog.outDebug("WORLD: Recvd CMSG_DISMISS_CONTROLLED_VEHICLE");
    recv_data.hexlike();

    uint64 vehicleGUID = _player->GetCharmGUID();

    if (!vehicleGUID)                                        // something wrong here...
    {
        recv_data.rpos(recv_data.wpos());                   // prevent warnings spam
        return;
    }

    uint64 guid;

    if (!recv_data.readPackGUID(guid))
        return;

    MovementInfo mi;
    mi.guid = guid;
    ReadMovementInfo(recv_data, &mi);

    _player->m_movementInfo = mi;

    /*
    ReadMovementInfo(recv_data, &_player->m_mover->m_movementInfo);*/
    _player->ExitVehicle();
}

void WorldSession::HandleChangeSeatsOnControlledVehicle(WorldPacket &recv_data)
{
    sLog.outDebug("WORLD: Recvd CMSG_CHANGE_SEATS_ON_CONTROLLED_VEHICLE");
    recv_data.hexlike();

    Unit* vehicle_base = GetPlayer()->GetVehicleBase();
    if (!vehicle_base)
        return;

    switch (recv_data.GetOpcode())
    {
    case CMSG_REQUEST_VEHICLE_PREV_SEAT:
        GetPlayer()->ChangeSeat(-1, false);
        break;
    case CMSG_REQUEST_VEHICLE_NEXT_SEAT:
        GetPlayer()->ChangeSeat(-1, true);
        break;
    case CMSG_CHANGE_SEATS_ON_CONTROLLED_VEHICLE:
        {
            uint64 guid;        // current vehicle guid
            if (!recv_data.readPackGUID(guid))
                return;

            ReadMovementInfo(recv_data, &vehicle_base->m_movementInfo);

            uint64 accessory;        //  accessory guid
            if (!recv_data.readPackGUID(accessory))
                return;

            int8 seatId;
            recv_data >> seatId;

            if (vehicle_base->GetGUID() != guid)
                return;

            if (!accessory)
                GetPlayer()->ChangeSeat(-1, seatId > 0); // prev/next
            else if (Unit *vehUnit = Unit::GetUnit(*GetPlayer(), accessory))
            {
                if (Vehicle *vehicle = vehUnit->GetVehicleKit())
                    if (vehicle->HasEmptySeat(seatId))
                        GetPlayer()->EnterVehicle(vehicle, seatId);
            }
        }
        break;
    case CMSG_REQUEST_VEHICLE_SWITCH_SEAT:
        {
            uint64 guid;        // current vehicle guid
            if (!recv_data.readPackGUID(guid))
                return;

            int8 seatId;
            recv_data >> seatId;

            if (vehicle_base->GetGUID() == guid)
                GetPlayer()->ChangeSeat(seatId);
            else if (Unit *vehUnit = Unit::GetUnit(*GetPlayer(), guid))
                if (Vehicle *vehicle = vehUnit->GetVehicleKit())
                    if (vehicle->HasEmptySeat(seatId))
                        GetPlayer()->EnterVehicle(vehicle, seatId);
        }
        break;
    default:
        break;
    }
}

void WorldSession::HandleEnterPlayerVehicle(WorldPacket &data)
{
    // Read guid
    uint64 guid;
    data >> guid;

    if (Player* pl=ObjectAccessor::FindPlayer(guid))
    {
        if (!pl->GetVehicleKit())
            return;
        if (!pl->IsInRaidWith(_player))
            return;
        if (!pl->IsWithinDistInMap(_player,INTERACTION_DISTANCE))
            return;
        _player->EnterVehicle(pl);
    }
}

void WorldSession::HandleEjectPasenger(WorldPacket &data)
{
    if (data.GetOpcode() == CMSG_EJECT_PASSENGER)
    {
        if (Vehicle* Vv= _player->GetVehicleKit())
        {
            uint64 guid;
            data >> guid;
            if (Player* Pl=ObjectAccessor::FindPlayer(guid))
                Pl->ExitVehicle();
        }
    }
}

void WorldSession::HandleRequestVehicleExit(WorldPacket &recv_data)
{
    sLog.outDebug("WORLD: Recvd CMSG_REQUEST_VEHICLE_EXIT");
    recv_data.hexlike();
    GetPlayer()->ExitVehicle();
}

void WorldSession::HandleMountSpecialAnimOpcode(WorldPacket& /*recvdata*/)
{
    //sLog.outDebug("WORLD: Recvd CMSG_MOUNTSPECIAL_ANIM");

    WorldPacket data(SMSG_MOUNTSPECIAL_ANIM, 8);
    data << uint64(GetPlayer()->GetGUID());

    GetPlayer()->SendMessageToSet(&data, false);
}

void WorldSession::HandleMoveKnockBackAck(WorldPacket & recv_data)
{
    sLog.outDebug("CMSG_MOVE_KNOCK_BACK_ACK");

    uint64 guid;                                            // guid - unused
    if (!recv_data.readPackGUID(guid))
        return;

    recv_data.read_skip<uint32>();                          // unk

    MovementInfo movementInfo;
    ReadMovementInfo(recv_data, &movementInfo);
}

void WorldSession::HandleMoveHoverAck(WorldPacket& recv_data)
{
    sLog.outDebug("CMSG_MOVE_HOVER_ACK");

    uint64 guid;                                            // guid - unused
    if (!recv_data.readPackGUID(guid))
        return;

    recv_data.read_skip<uint32>();                          // unk

    MovementInfo movementInfo;
    ReadMovementInfo(recv_data, &movementInfo);

    recv_data.read_skip<uint32>();                          // unk2
}

void WorldSession::HandleMoveWaterWalkAck(WorldPacket& recv_data)
{
    sLog.outDebug("CMSG_MOVE_WATER_WALK_ACK");

    uint64 guid;                                            // guid - unused
    if (!recv_data.readPackGUID(guid))
        return;

    recv_data.read_skip<uint32>();                          // unk

    MovementInfo movementInfo;
    ReadMovementInfo(recv_data, &movementInfo);

    recv_data.read_skip<uint32>();                          // unk2
}

void WorldSession::HandleSummonResponseOpcode(WorldPacket& recv_data)
{
    if (!_player->isAlive() || _player->isInCombat())
        return;

    uint64 summoner_guid;
    bool agree;
    recv_data >> summoner_guid;
    recv_data >> agree;

    _player->SummonIfPossible(agree);
}

