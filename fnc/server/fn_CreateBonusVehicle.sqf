//by RIP
if (!isServer) exitWith {};
private ["_pos", "_marker", "_dir", "_vehicle", "_vehtype"];

_marker = _this select 0;
_vehtype = _this select 1;

_pos = markerPos _marker;
_dir = MarkerDir _marker;
_vehicle = createVehicle [_vehtype, _pos, [], 0, "CAN_COLLIDE"];
_vehicle setDir _dir;
_vehicle setDamage 0;
sleep 0.1;
_vehicle setFuel 1;
sleep 1;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
_vehicle addItemCargoGlobal ["Medikit", 1];
_vehicle addItemCargoGlobal ["ToolKit", 1];
_vehicle addItemCargoGlobal ["FirstAidKit", 5];

_vehicle addMPEventHandler ["MPKilled", {if (isServer) then {_this spawn RIP_fnc_MPKilledEH}}];
if (RIPANTIATGMSYSTEM == 1) then
	{ if (_vehicle isKindOf "Tank_F") then { [_vehicle] remoteExec ["RIP_fnc_AddEHIncomingMissile", 0, true]; }; };
