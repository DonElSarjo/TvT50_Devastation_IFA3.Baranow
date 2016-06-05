//by RIP
private["_handled","_shift","_ctrl","_dikCode"];

_dikCode = (_this select 1);
_shift = (_this select 2);
_ctrl = (_this select 3);
_handled = false;

RIP_MENU_inCommunication = [
	["",false],
	[localize "STR_RIP_MENUOPTIONS", [2], "", -5, [["expression", "[] execVM ""Scripts\DLG_Options.sqf"""]], "1", "1"]
];

if (RIPVEHICLEBUY == 1) then {
	RIP_MENU_inCommunication = RIP_MENU_inCommunication + [
		[localize "STR_RIP_MENUBUYVEHICLE", [3], "", -5, [["expression", "[] execVM ""Scripts\DLG_BuyVehicle.sqf"""]], "1", "1"],
		[localize "STR_RIP_MENUPOINTSTRANSFER", [4], "", -5, [["expression", "[] execVM ""Scripts\DLG_PointsTransfer.sqf"""]], "1", "1"]
	];
};

if (RIP3DPERSONDISABLE == 1) then {
	if (difficultyEnabled "3rdPersonView") then {
		if ((!_shift) && (!_ctrl)) then {
			if (_dikCode in ((ActionKeys "PersonView")+(ActionKeys "TacticalView"))) then {
				if (vehicle player == player) then {
					["RIP_Notif_Info",[localize "STR_RIP_HINT_3DPERSONDISABLE"]] call BIS_fnc_showNotification;
					player switchCamera "Internal";
					_handled = true;
				};
			};
		};
	};
};

switch _dikCode do {
	//LWIN
	case 0xDB:
	{
		if (_ctrl) then
		{
			showCommandingMenu "#USER:RIP_MENU_inCommunication";
			_handled = true;
		};
	};
	/*RWIN
	case 49: {
		if (_ctrl) then {
			showCommandingMenu "#USER:RIP_MENU_inCommunication";
			_handled = true;
		};
	};*/
	//Esc
	case 1: {
		[] spawn RIP_fnc_RespawnButtonDelay;
		_handled = false;
	};
	//F1
	case 0x3B: {
		[-500] call des_fnc_changeViewDistance;
		_handled = true;
	};
	//F2
	case 0x3C: {
		[500] call des_fnc_changeViewDistance;
		_handled = true;
	};
	//F3
	case 0x3D: {
		[-1] call des_fnc_changeSoundVolume;
		_handled = true;
	};
	//F4
	case 0x3E: {
		[1] call des_fnc_changeSoundVolume;
		_handled = true;
	};
	//F5
	case 0x3F: {
		[player] call ZADE_BOC_fnc_CheckState;
		_handled = true;
	}
};

_handled;
