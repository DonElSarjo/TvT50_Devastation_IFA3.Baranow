//by RIP
if (!isServer) exitWith {};
private["_grpskill", "_vehicletype", "_vehicle", "_pos", "_group", "_crew"];

_group = createGroup Resistance;
_grpskill = RIPAIDEFAULTSKILL + (random 0.2);

_vehicletype = RIPPATROLLIGHTVEHICLES select floor(random count RIPPATROLLIGHTVEHICLES);
_pos = [RIP_TargetPosition, 300] call RIP_fnc_GetRandomPos;
_vehicle = createVehicle [_vehicletype, _pos, [], 0, "NONE"];
_vehicle setDamage 0;

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
_vehicle addItemCargoGlobal ["Medikit", 1];
_vehicle addItemCargoGlobal ["ToolKit", 1];
_vehicle addItemCargoGlobal ["FirstAidKit", 2];
RIPMISSIONGUARDVEHICLES pushBack _vehicle;

createVehicleCrew _vehicle;
_crew = crew _vehicle;
_crew joinsilent _group;
_group addVehicle _vehicle;
(leader _group) setSkill _grpskill;

{_x addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];RIPMISSIONGUARDMENS pushBack _x;_x setRank "SERGEANT";} forEach _crew;
_vehicle addEventHandler ["Killed", {_this spawn RIP_fnc_MPKilledEH}];
_vehicle lock true;

[_group, RIP_TargetPosition, 200] call bis_fnc_taskPatrol;
