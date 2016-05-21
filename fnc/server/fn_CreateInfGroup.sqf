//by RIP
if (!isServer) exitWith {};
private["_pos", "_group", "_grpskill", "_unit", "_strength"];

_group = createGroup Resistance;
_grpskill = RIPAIDEFAULTSKILL + (random 0.2);
_strength = 1 + ceil(random 2);
_pos = [RIP_TargetPosition, 200] call RIP_fnc_GetRandomPos;

_unit = _group createunit [(RIPPATROLMENS select 0),_pos,[],10,"None"];
_unit addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];
[_unit] JoinSilent _group;
RIPMISSIONGUARDMENS pushBack _unit;
_unit setRank "LIEUTENANT";

for "_x" from 1 to _strength do
{
	_unit = _group createunit [RIPPATROLMENS select floor(random count RIPPATROLMENS),_pos,[],2,"None"];
	_unit addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];
	[_unit] JoinSilent _group;
	RIPMISSIONGUARDMENS pushBack _unit;
	[_unit] call RIP_fnc_ChangeAIEquipment;
};

(leader _group) setSkill _grpskill;
_group setBehaviour "AWARE";
_group setCombatMode "RED";
[_group, RIP_TargetPosition, 200] call bis_fnc_taskPatrol;
