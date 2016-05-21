//by RIP
private ["_vehicle"];

_vehicle = _this select 0;

if !(alive _vehicle) exitWith {};
_vehicle addEventHandler ["IncomingMissile", {[_this select 0,_this select 1,_this select 2,500] spawn RIP_fnc_AntiAT}];
