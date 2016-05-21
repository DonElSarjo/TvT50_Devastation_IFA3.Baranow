//by RIP
private ["_unit", "_veh"];

_unit = _this select 0;
_veh = _this select 1;	
_unit action ["Eject", _veh];
unassignVehicle _unit;