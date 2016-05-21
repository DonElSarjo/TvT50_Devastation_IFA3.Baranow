//by RIP
private ["_mhq"];

_mhq = _this select 0;
if !(isNull attachedTo _mhq) exitWith {};
if (_mhq getVariable "RIP_MHQDEPLOY" != 0) exitWith {};

{[_x,_mhq] remoteExec ["RIP_fnc_EjectFromVehicle", _x, false]} forEach crew _mhq;
sleep 1;
_mhq engineOn false;
_mhq lock 2;
_mhq setVariable ["RIP_MHQDEPLOY",1,true];
