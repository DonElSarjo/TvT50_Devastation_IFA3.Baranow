//by RIP
if (!isServer) exitWith {};
private["_pos", "_group", "_grpskill", "_create", "_vehicletype", "_vehicle", "_crew", "_dir"];

if ((count RIPMISSIONROADPOS) == 0) exitWith {};
if ((Server getVariable "RIPRADIOTOWERDOWN")) exitWith {};
if (RIPARMORREINFORCEMENTCREATED) exitWith {};
RIPARMORREINFORCEMENTCREATED = true;

_i = 0;
_create = false;
while {(_i < (count RIPMISSIONROADPOS)) && !_create} do {
	_pos = RIPMISSIONROADPOS select _i;
	if !([_pos,200] call RIP_fnc_PlayersNearBy) then {_create = true};
	sleep 0.1;
	_i = _i + 1;
};
if !(_create) exitWith {RIPARMORREINFORCEMENTCREATED = false;};

_group = createGroup Resistance;
_grpskill = RIPAIDEFAULTSKILL + (random 0.2);

_dir = [_pos, RIP_TargetPosition] call BIS_fnc_dirTo;
_vehicletype = RIPPATROLHARDVEHICLES + RIPPATROLLIGHTVEHICLES;
_vehicle = createVehicle [(_vehicletype select floor(random count _vehicletype)), _pos, [], 0, "CAN_COLLIDE"];
_vehicle setDir _dir;
_vehicle setPos _pos;
_vehicle setDamage 0;

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
_vehicle addItemCargoGlobal ["Medikit", 1];
_vehicle addItemCargoGlobal ["ToolKit", 1];
_vehicle addItemCargoGlobal ["FirstAidKit", 5];
RIPMISSIONGUARDVEHICLES pushBack _vehicle;

createVehicleCrew _vehicle;
_crew = crew _vehicle;
_crew joinsilent _group;
_group addVehicle _vehicle;
(leader _group) setSkill _grpskill;

{_x addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];RIPMISSIONGUARDMENS pushBack _x;_x setRank "SERGEANT";} forEach _crew;
_vehicle addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];
_vehicle lock true;

(leader _group) setSkill _grpskill;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";
_group setSpeedMode "FULL";
[_group, RIP_TargetPosition, 200] call bis_fnc_taskPatrol;

RIPARMORREINFORCEMENTCREATED = false;
