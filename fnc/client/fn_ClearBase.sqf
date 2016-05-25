//by RIP
private ["_objs"];

_objs = nearestObjects [player, ["Man","WeaponHolder","GroundWeaponHolder","CraterLong","CraterLong_small"], 500];

{
	if !(isNull _x) then {
		if (_x isKindOf "Man" ) then {
			if !(isPlayer _x) then {deleteVehicle _x};
		} else {
			deleteVehicle _x
		};
	};
} forEach _objs;
