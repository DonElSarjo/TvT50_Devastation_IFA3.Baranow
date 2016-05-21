//by RIP
if (!isServer) exitWith {};
private["_group", "_grpskill", "_unit", "_count", "_i", "_pos", "_arty", "_typarty", "_co", "_dir", "_mortars"];

_mortars = [];
_pos = [];
_count = 1 + ceil(random 3);
_i = 0;

while {_i < _count} do
{
	_typarty = RIPARTYTYPE call BIS_fnc_selectRandom;
	_arty = objNull;
	_pos = [RIP_TargetPosition, 150] call RIP_fnc_GetRandomPos;
	_co = 0;
	while {((count (nearestObjects [_pos, ["StaticWeapon"], 100])) > 0) && (_co < 149)} do
	{
		_pos = [RIP_TargetPosition, 150] call RIP_fnc_GetRandomPos;
		_co = _co + 1;
	};
	_dir = [RIP_TargetPosition, _pos] call BIS_fnc_dirTo;
	_arty = createVehicle [_typarty, _pos, [], 0, "NONE"];
	_arty setDamage 0;
	_arty setDir _dir;
	_arty addMPEventHandler ["MPKilled", {if (isServer) then {_this spawn RIP_fnc_MPKilledEH}}];
	RIPMISSIONOBJ pushBack _arty;
	_mortars pushBack _arty;
	_arty setVariable ["RIPArtyReloadTime", 0];

	[_pos, _dir, "Composition\SandBags.sqf", false] call RIP_fnc_Mapper;

	_group = createGroup Resistance;
	_grpskill = RIPAIDEFAULTSKILL;
	_unit = _group createUnit [RIPPATROLMENS select floor(random count RIPPATROLMENS), _pos, [], 5, "NONE"];
	RIPMISSIONGUARDMENS pushBack _unit;
	_unit addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];

	[_unit] JoinSilent _group;
	_unit moveInGunner _arty;
	_unit setDir _dir;
	_unit setBehaviour "COMBAT";
	_unit setRank "LIEUTENANT";
	(leader _group) setSkill _grpskill;
	_i = _i + 1;
};

sleep 1;
[_mortars] spawn RIP_fnc_ArtyShoot;
