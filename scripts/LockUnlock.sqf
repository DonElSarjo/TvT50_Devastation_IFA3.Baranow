//by RIP
private ["_vehicle", "_locked"];

_vehicle = _this select 0;
_locked = locked _vehicle;

if (_locked == 2) then {
	_vehicle lock 0;
	["RIP_Notif_Info",[localize "STR_RIP_HINT_VEHICLEUNLOCK"]] call BIS_fnc_showNotification;
} else {
	{[_x,_vehicle] remoteExec ["RIP_fnc_EjectFromVehicle", _x, false]} forEach crew _vehicle;
	sleep 0.1;
	_vehicle lock 2;
	["RIP_Notif_Info",[localize "STR_RIP_HINT_VEHICLELOCK"]] call BIS_fnc_showNotification;
};
