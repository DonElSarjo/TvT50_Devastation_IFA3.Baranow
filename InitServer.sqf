if (!isServer) exitWith {};

#include "defines\Define.sqf"
#include "defines\ServerDefine.sqf"

if (isNil "paramsArray") then
{
    if (isClass (missionConfigFile/"Params")) then {
        for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
            _paramName = configName ((missionConfigFile >> "Params") select _i);
            missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
        };
    };
} else {
    for "_i" from 0 to (count paramsArray - 1) do {
        missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i]
    };
};

_FPSmrk = createMarker ["fpsMarkerHC",[200,250,0]];
_FPSmrk setMarkerShape "ICON";
_FPSmrk setMarkerType "KIA";
_FPSmrk setMarkerColor "ColorBlack";
_FPSmrk setMarkerText "    Server FPS: n/a";

fps_counter = true;
[] spawn {
    while {fps_counter} do {
        "fpsMarkerHC" setMarkerText format ["Server FPS: %1", floor diag_fps];
        sleep 2;
    };
};

RHSDecalsOff = true;
enableCamShake false;

setDate [2018,6,1,RIPDAY,0];
setViewDistance 3000;
switch (RIPDEFAULTGRASSLAYER) do {
    case 0: {setTerrainGrid 50};
    case 1: {setTerrainGrid 30};
    case 2: {setTerrainGrid 12.5};
    case 3: {setTerrainGrid 3.125};
};

[] spawn RIP_fnc_DynamicWeather;

addMissionEventHandler ["HandleDisconnect", {deleteVehicle (_this select 0);false}];

RIPMISSIONOBJ = [];
RIPMISSIONGUARDVEHICLES = [];
RIPMISSIONGUARDMENS = [];
RIPMISSIONROADPOS = [];
RIPLASTTARGETSERVER = [0,0,0];
RIPTARGETSERVER = objNull;
RIPBONUSAIRE = 0;
RIPBONUSAIRW = 0;
RIPBONUSLANDE = 0;
RIPBONUSLANDW = 0;

Server setVariable ["RIPMISSIONCOMPLETED",true,true];
Server setVariable ["RIPMISSIONCREATED",false,true];
Server setVariable ["RIPALLMISSIONTARGETS",[],true];
Server setVariable ["RIPTOWNSCOREWEST",0,true];
Server setVariable ["RIPTOWNSCOREEAST",0,true];
Server setVariable ["RIPALLTOWNSCOREWEST",0,true];
Server setVariable ["RIPALLTOWNSCOREEAST",0,true];
Server setVariable ["RIPRADIOTOWERDOWN",false,true];

RIPSIDEFLAG1 = 2;
RIPSIDEFLAG2 = 2;
RIPSIDEFLAG3 = 2;

"RIPSIDEFLAG1" addPublicVariableEventHandler {[] call RIP_fnc_CheckFlagCaptured};
"RIPSIDEFLAG2" addPublicVariableEventHandler {[] call RIP_fnc_CheckFlagCaptured};
"RIPSIDEFLAG3" addPublicVariableEventHandler {[] call RIP_fnc_CheckFlagCaptured};

publicVariable "RIPSIDEFLAG1";
publicVariable "RIPSIDEFLAG2";
publicVariable "RIPSIDEFLAG3";

Server setVariable ["RIPCITYCAPTURINGINPROGRESS",2,true];
Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",-1,true];

RIPAIDEFAULTSKILL = RIPAISKILL/10;

//WMHQ2 lockTurret [[0],true];
/*
{
	_x setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_fuselage_co.paa"];
	_x setObjectTextureGlobal [1, "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_engine_co.paa"];
} forEach [WTHELI1,WTHELI2,WTHELI3];
*/
{
	_x setVariable ["RIP_MHQDEPLOY",0,true];
	_x enableRopeAttach false;
	_x addEventHandler [
        "GetIn", {
    		private ["_veh", "_unit", "_vehside","_plside"];
    		_veh = _this select 0;
    		_unit = _this select 2;
    		_vehside = getNumber (configFile >> "CfgVehicles" >> (typeOf _veh) >> "side");
    		_plside = getNumber (configFile >> "CfgVehicles" >> (typeOf _unit) >> "side");
    		if (_plside != _vehside) then {_unit setDamage 1};
    	}
    ];
} forEach RIPMHQARRAY;
/*
{
    _x addMPEventHandler [
        "mpkilled", {
            if (isServer) then {
                [(_this select 0)] spawn RIP_fnc_DetachVehicle
            }
        };
    ]
} forEach RIPHELIARAY;
*/
if (RIPDESERTEDVEHICLEDELAY > 0) then {
	{
        _x addEventHandler [
            "GetOut", {
                if (isServer) then {
                    [(_this select 0)] spawn RIP_fnc_DesertedVehicle
                }
            }
        ]
    } forEach RIPDESERTEDVEHICLEARRAY;
};

if (RIPFASTTIME > 0) then {[] spawn RIP_fnc_FastTime};

objNull spawn RIP_fnc_RespawnVehicleLoop;
{createVehicle ["ProtectionZone_Invisible_F", getPos _x, [], 0, "NONE"]} forEach [AmmoboxE,RIP_SERVICEFLAGE,AmmoboxW,RIP_SERVICEFLAGW];
RIPSERVERREADY = true;
publicVariable "RIPSERVERREADY";
