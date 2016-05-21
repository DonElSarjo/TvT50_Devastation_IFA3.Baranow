//by RIP
if (!isServer) exitWith {};
private ["_alltargets", "_dist", "_co"];

if ((Server getvariable "RIPALLTOWNSCOREEAST") == RIPMISSIONCOUNTFORWIN) exitWith {[] remoteExec ["RIP_fnc_EndMission", 0]};
if ((Server getvariable "RIPALLTOWNSCOREWEST") == RIPMISSIONCOUNTFORWIN) exitWith {[] remoteExec ["RIP_fnc_EndMission", 0]};

[RIPMISSIONGUARDMENS,RIPMISSIONOBJ,RIPMISSIONGUARDVEHICLES,RIPTARGETSERVER] spawn RIP_fnc_ClearLastTarget;
RIPMISSIONOBJ = [];
RIPMISSIONGUARDVEHICLES = [];
RIPMISSIONGUARDMENS = [];

RIPTARGETSERVER = RIPTARGETARRAY select floor(random count RIPTARGETARRAY);
_dist = 5000;
_co = 0;
while {RIPTARGETSERVER distance RIPLASTTARGETSERVER < _dist} do {
	RIPTARGETSERVER = RIPTARGETARRAY select floor(random count RIPTARGETARRAY);
	_co = _co + 1;
	if (_co > 299) then {_co = 0;_dist = _dist - 200;};
	sleep 0.1;
};
RIPTARGETARRAY = RIPTARGETARRAY - [RIPTARGETSERVER];
RIPLASTTARGETSERVER = RIPTARGETSERVER;

sleep 10;

RIP_TargetPosition = getPos RIPTARGETSERVER;

RIPTARGETSERVER setVariable ["RIPTARGETSTATE",4,true];
_alltargets = Server getVariable "RIPALLMISSIONTARGETS";
_alltargets pushBack RIPTARGETSERVER;
Server setVariable ["RIPALLMISSIONTARGETS",_alltargets,true];

[] call RIP_fnc_CreateCity;
