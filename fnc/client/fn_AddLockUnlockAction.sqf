//by RIP
private ["_target", "_return"];

_return = false;
_target = cursorTarget;

if (player == vehicle player) then {
	if ((_target isKindOf "LandVehicle") || (_target isKindOf "Air")) then {
		if ((_target distance player) < 8) then {
			if (alive _target) then {
				if (alive player) then {
					if !(isNil {_target getVariable "RIP_VehicleName"}) then {
						if (_target getVariable "RIP_VehicleName" == getPlayerUID player) then {
							_return = true;
						};
					};
				};
			};
		};
	};
};
_return
