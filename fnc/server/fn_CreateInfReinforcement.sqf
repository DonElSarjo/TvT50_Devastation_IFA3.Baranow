//by RIP
if (!isServer) exitWith {};
private["_pos", "_group", "_grpskill", "_strength", "_unit", "_create"];

if ((Server getVariable "RIPRADIOTOWERDOWN")) exitWith {};
if (RIPINFREINFORCEMENTCREATED) exitWith {};
RIPINFREINFORCEMENTCREATED = true;

_i = 0;
_create = false;
while {!_create && (_i < 299)} do {
	_pos = [RIP_TargetPosition, 500, (random 360)] call BIS_fnc_relPos;
	if !([_pos,200] call RIP_fnc_PlayersNearBy) then {_create = true};
	_i = _i + 1;
};
if !(_create) exitWith {
	RIPINFREINFORCEMENTCREATED = false;
};

_group = createGroup Resistance;
_grpskill = RIPAIDEFAULTSKILL + (random 0.4);
_strength = 1 + ceil(random 2);

_unit = _group createunit [(RIPPATROLMENS select 0),_pos,[],10,"None"];
_unit addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];
[_unit] JoinSilent _group;
RIPMISSIONGUARDMENS pushBack _unit;
_unit setRank "LIEUTENANT";

for "_x" from 1 to _strength do {
	_unit = _group createunit [RIPPATROLMENS select floor(random count RIPPATROLMENS),_pos,[],2,"None"];
	_unit addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];
	[_unit] JoinSilent _group;
	RIPMISSIONGUARDMENS pushBack _unit;
	[_unit] call RIP_fnc_ChangeAIEquipment;
};

(leader _group) setSkill _grpskill;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";
_group setSpeedMode "FULL";
[_group, RIP_TargetPosition, 200] call bis_fnc_taskPatrol;

RIPINFREINFORCEMENTCREATED = false;
