//by RIP
private ["_lifter", "_attached", "_list"];

_lifter = vehicle player;
_list = nearestObjects [_lifter, ["Car", "Tank", "Ship"], 15];

{if (getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> "side") == RIPPLAYERSIDE) exitWith {_attached = _x;};} forEach _list;

if (isNil "_attached") exitWith {["RIP_Notif_Warning",[localize "STR_RIP_HINT_CANTLIFT"]] call BIS_fnc_showNotification;};
if(getNumber (configFile >> "CfgVehicles" >> (typeOf _attached) >> "side") != RIPPLAYERSIDE) exitWith {["RIP_Notif_Warning",[localize "STR_RIP_HINT_CANTLIFT"]] call BIS_fnc_showNotification;};
if (count attachedObjects _lifter > 0) exitWith {["RIP_Notif_Warning",[localize "STR_RIP_HINT_CANTLIFT"]] call BIS_fnc_showNotification;};
if (_attached getVariable "RIP_MHQDEPLOY" == 1) exitWith {["RIP_Notif_Warning",[localize "STR_RIP_HINT_CANTLIFTMHQDEPLOYED"]] call BIS_fnc_showNotification;};

{[_x,_attached] remoteExec ["RIP_fnc_EjectFromVehicle", _x, false]} forEach crew _attached;
sleep 0.1;
[_attached,false] remoteExec ["engineOn", _attached];
[_attached,true] remoteExec ["lock", _attached];

_attached attachTo [_lifter, [0,2,-7]];
