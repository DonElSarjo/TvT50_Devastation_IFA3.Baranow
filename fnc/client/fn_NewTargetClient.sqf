//by RIP
private ["_newtargetpos","_townlist","_targetmarker","_newtask","_alltargets"];

if (isDedicated) exitWith {};
waitUntil {!isNull player};
waitUntil {player == player};

_alltargets = Server getVariable "RIPALLMISSIONTARGETS";

{
	_newtargetpos = getPos _x;
	_townlist = nearestLocations [_newtargetpos, ["NameCityCapital","NameCity", "NameVillage", "NameLocal"], 300];
	RIPNEWTARGETNAME = text (_townlist select 0);

	RIPTARGETMARKERNAME = format ["%1Marker",_x];
	if (getMarkerColor RIPTARGETMARKERNAME == "") then {
		_targetmarker = createMarkerLocal [RIPTARGETMARKERNAME, _newtargetpos];
		_targetmarker setMarkerShapeLocal "ELLIPSE";
		RIPTARGETMARKERNAME setMarkerSizeLocal [300, 300];

		RIPTARGETTASK = player createSimpleTask [format[(localize "STR_RIP_HINT_TARGET"),RIPNEWTARGETNAME]];
		RIPTARGETTASK setSimpleTaskDestination _newtargetpos;
		RIPTARGETTASK setSimpleTaskDescription [format[localize "STR_RIP_HINT_MISSIONDESC",RIPNEWTARGETNAME], format[(localize "STR_RIP_HINT_TARGET"),RIPNEWTARGETNAME], localize "STR_RIP_HINT_MISSIONDEST"];
		RIPTARGETTASK setTaskState "Created";

		_state = _x getVariable "RIPTARGETSTATE";
		switch (_state) do {
			case 0: {
				RIPTARGETMARKERNAME setMarkerColorLocal "ColorRed";
				if (side player == EAST) then {
					RIPTARGETTASK setTaskState "Succeeded";
				} else {
					RIPTARGETTASK setTaskState "Failed";
				};
			};
			case 1: {
				RIPTARGETMARKERNAME setMarkerColorLocal "ColorBlue";
				if (side player == EAST) then {
					RIPTARGETTASK setTaskState "Failed";
				} else {
					RIPTARGETTASK setTaskState "Succeeded";
				};
			};
			case 3: {
				RIPTARGETMARKERNAME setMarkerColorLocal "ColorWhite";
				RIPTARGETTASK setTaskState "Failed";
			};
			case 4: {
				RIPTARGETMARKERNAME setMarkerColorLocal "ColorYellow";
				RIPTARGETTASK setTaskState "Assigned";
			};
		};
		RIPTARGETPOS = _newtargetpos;
	};
	sleep 1;
} count _alltargets;

["RIP_Notif_Info",[format [localize "STR_RIP_HINT_NEWMISSION",RIPNEWTARGETNAME]]] call BIS_fnc_showNotification;
