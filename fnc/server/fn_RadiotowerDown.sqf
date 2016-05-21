//by RIP
if !(isServer) exitWith {};
private ["_killer", "_sidekiller", "_townscore"];

_killer = _this select 0;

Server setVariable ["RIPRADIOTOWERDOWN",true,true];
_killer addScore RIPDESTROYRADIOTOWERPOINTS;
_sidekiller = getNumber (configFile >> "CfgVehicles" >> (typeOf _killer) >> "side");

switch (_sidekiller) do
{
	case 0:
	{
		_townscore = (Server getVariable "RIPTOWNSCOREEAST");
		_townscore = _townscore + RIPDESTROYRADIOTOWERPOINTS;
		Server setVariable ["RIPTOWNSCOREEAST",_townscore,true];
	};
	case 1:
	{
		_townscore = (Server getVariable "RIPTOWNSCOREWEST");
		_townscore = _townscore + RIPDESTROYRADIOTOWERPOINTS;
		Server setVariable ["RIPTOWNSCOREWEST",_townscore,true];
	};
};
