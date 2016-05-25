//by RIP
private ["_veh"];

if ((typeOf player) in RIP_PILOTTYPE) exitWith {};

while {true} do {
	if (vehicle player != player) then {
		_veh = vehicle player;
		if ((_veh isKindOf "Plane") || (_veh isKindOf "Helicopter")) then {
			if !(_veh isKindOf "ParachuteBase") then {
				if (driver _veh == player) then {player action ["GetOut", _veh];
				["RIP_Notif_Warning",[localize "STR_RIP_HINT_CHECKPILOT"]] call BIS_fnc_showNotification;};
			};
		};
	};
	sleep 0.5;
};
