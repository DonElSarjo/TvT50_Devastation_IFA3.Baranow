#include "defines\Define.sqf"

if (isNil "paramsArray") then {
	if (isClass (missionConfigFile/"Params")) then {
		for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
    		_paramName = configName ((missionConfigFile >> "Params") select _i);
    		missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
		};
	};
} else {
	for "_i" from 0 to (count paramsArray - 1) do {
		missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
	};
};

//10 cutText ["","BLACK FADED"];
waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {(local player)};
waitUntil {!(isNil "RIPSERVERREADY")};
waitUntil {RIPSERVERREADY};
waituntil {getClientState != "MISSION RECEIVED" && getClientState != "GAME LOADED"};
[(_this select 0)] remoteExecCall ["RIP_fnc_ChangeSideProtection", 2];

RHSDecalsOff = true;
enableCamShake false;

setViewDistance 3000;
switch (RIPDEFAULTGRASSLAYER) do {
    case 0: {setTerrainGrid 50};
    case 1: {setTerrainGrid 30};
    case 2: {setTerrainGrid 12.5};
    case 3: {setTerrainGrid 3.125};
};

[] execVM "Scripts\Briefing.sqf";

waituntil {!(isNull (findDisplay 46))};

[] execVM "Scripts\PlayerInit.sqf";
