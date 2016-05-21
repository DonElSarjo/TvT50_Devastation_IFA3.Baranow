//by RIP
if !(isServer) exitWith {};
params ["_veh", "_pos", "_dir"];

if ({alive _x} count crew _veh > 0) exitWith {};
uisleep RIPDESERTEDVEHICLEDELAY;
if ({alive _x} count crew _veh > 0) exitWith {};
if !(alive _veh) exitWith {};

_dir = (_veh getVariable "RIP_RESPAWNVEHICLEPARAMS") select 0;
_pos = (_veh getVariable "RIP_RESPAWNVEHICLEPARAMS") select 1;
_veh setDir _dir;
_veh setPosATL _pos;

uisleep 0.1;

_veh setDamage 0;

uisleep 0.1;

[_veh,1] remoteExec ["setFuel", _veh, false];
