
//by RIP
private ["_winner", "_townscoreeast", "_townscorewest"];

if (isDedicated) exitWith {};
_winner = _this select 0;
_townscoreeast = _this select 1;
_townscorewest = _this select 2;

if ((RIPPLAYERSIDE == 0) && (_winner == 0)) then {
	RIPTARGETMARKERNAME setMarkerColorLocal "ColorRed";
	RIPTARGETTASK setTaskState "Succeeded";
	["RIP_Notif_MissionComplete",[_townscorewest,_townscoreeast]] call BIS_fnc_showNotification;
};

if ((RIPPLAYERSIDE == 1) && (_winner == 0)) then {
	RIPTARGETMARKERNAME setMarkerColorLocal "ColorRed";
	RIPTARGETTASK setTaskState "Failed";
	["RIP_Notif_MissionFailed",[_townscorewest,_townscoreeast]] call BIS_fnc_showNotification;
};

if ((RIPPLAYERSIDE == 1) && (_winner == 1)) then {
	RIPTARGETMARKERNAME setMarkerColorLocal "ColorBlue";
	RIPTARGETTASK setTaskState "Succeeded";
	["RIP_Notif_MissionComplete",[_townscorewest,_townscoreeast]] call BIS_fnc_showNotification;
};

if ((RIPPLAYERSIDE == 0) && (_winner == 1)) then {
	RIPTARGETMARKERNAME setMarkerColorLocal "ColorBlue";
	RIPTARGETTASK setTaskState "Failed";
	["RIP_Notif_MissionFailed",[_townscorewest,_townscoreeast]] call BIS_fnc_showNotification;
};

if (_winner == 3) then {
	RIPTARGETMARKERNAME setMarkerColorLocal "ColorWhite";
	RIPTARGETTASK setTaskState "Failed";
	["RIP_Notif_MissionFailed",[_townscorewest,_townscoreeast]] call BIS_fnc_showNotification;
};
