//by RIP
if (!isServer) exitWith {};
private["_group", "_grpskill", "_unit", "_count", "_i", "_pos", "_mg", "_typemg", "_co", "_dir"];

_group = createGroup Resistance;
_grpskill = RIPAIDEFAULTSKILL;

_pos = [];
_count = 3 + ceil(random 5);
_i = 0;

while {_i < _count} do
{
	_typemg = RIPSTATICTYPE call BIS_fnc_selectRandom;
	_mg = objNull;
	_mg = createVehicle [_typemg, [0,0,0], [], 300, "FLY"];
	_pos = [RIP_TargetPosition, 200] call RIP_fnc_GetRandomPos;
	_co = 0;
	while {((count (nearestObjects [_pos, ["StaticWeapon"], 100])) > 0) && (_co < 149)} do
	{
		_pos = [RIP_TargetPosition, 200] call RIP_fnc_GetRandomPos;
		_co = _co + 1;
	};

	_dir = [RIP_TargetPosition, _pos] call BIS_fnc_dirTo;
	_mg setPos _pos;
	_mg setDamage 0;
	_mg setDir _dir;
	_mg addMPEventHandler ["MPKilled", {if (isServer) then {_this spawn RIP_fnc_MPKilledEH}}];
	RIPMISSIONOBJ pushBack _mg;

	_unit = _group createUnit [RIPPATROLMENS select floor(random count RIPPATROLMENS), _pos, [], 5, "NONE"];
	RIPMISSIONGUARDMENS pushBack _unit;
	_unit addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];
	[_unit] JoinSilent _group;
	_unit moveInGunner _mg;
	_unit setDir _dir;
	_unit setBehaviour "COMBAT";
	_unit setRank "LIEUTENANT";
	_i = _i + 1;
};

(leader _group) setSkill _grpskill;
