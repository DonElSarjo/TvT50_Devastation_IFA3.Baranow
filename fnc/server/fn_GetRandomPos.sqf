//by RIP
params ["_center", "_radius", "_NewPos"];

_NewPos = [_center, 1, _radius, 5, 0, 1, 0] call BIS_fnc_findSafePos;

while {(_center distance _NewPos) > _radius} do {
	for "_x" from 0 to 499 do {
		_NewPos = [_center, 1, _radius, 5, 0, 1, 0] call BIS_fnc_findSafePos;
		if !((_center distance _NewPos) > _radius) exitWith {};
	};
	_radius = _radius + 50;
};

_NewPos
