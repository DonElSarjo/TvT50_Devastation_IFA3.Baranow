//by RIP
if (!difficultyEnabled "3rdPersonView") exitWith {};
while {true} do {
	if (cameraOn == player && cameraView == "External") then {
		player switchCamera "Internal";
		["RIP_Notif_Info",[localize "STR_RIP_HINT_3DPERSONDISABLE"]] call BIS_fnc_showNotification;
	};
	sleep 0.5;
};
