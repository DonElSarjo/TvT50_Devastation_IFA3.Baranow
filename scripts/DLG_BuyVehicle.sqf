//by RIP
private ["_dialog","_idx","_vehname","_picture","_vehlist","_money","_cfg", "_canbuy", "_vehicle"];

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {(local player)};
waitUntil {!(isNil "AVAILABLEVEHICLEE")};
waitUntil {!(isNil "AVAILABLEVEHICLEW")};
if (RIPBUYVEHICLEPROCESS) exitWith {};

_money = ((getPlayerScores player) select 5);
[(name player),player,_money,0] remoteExec ["RIP_fnc_ServerLog", 2];
if (_money <= 0) exitWith {
	["RIP_Notif_Warning",[localize "STR_RIP_HINT_NOTMONEY"]] call BIS_fnc_showNotification;
};

if (((player distance RIP_BASEFLAGW) > 800) && ((player distance RIP_BASEFLAGE) > 800)) exitWith {
	["RIP_Notif_Info",[localize "STR_RIP_HINT_BUYVEHICLEONLYBASE"]] call BIS_fnc_showNotification;
};

if (((player distance WRIPBASESPAWN) < 30) || ((player distance ERIPBASESPAWN) < 30)) exitWith {
	["RIP_Notif_Info",[localize "STR_RIP_HINT_BUYVEHICLEINHANGAR"]] call BIS_fnc_showNotification;
};
_canbuy = true;
{
	_vehname = _x getVariable "RIP_VehicleName";
	if !(isNil "_vehname") then {
		if (_vehname == (getPlayerUID player)) then {
			if (alive _x) then {
				_canbuy = false;
				_vehicle = _x;
			};
		};
	};
} count vehicles;

if !(_canbuy) exitWith {
	["RIP_Notif_Info",[format [localize "STR_RIP_HINT_ALREADYBUY",getText (configFile >> "cfgvehicles" >> (typeOf _vehicle) >> "displayname")]]] call BIS_fnc_showNotification;
};

if (RIPPLAYERSIDE == 0) then {
	_vehlist = AVAILABLEVEHICLEE
} else {
	_vehlist = AVAILABLEVEHICLEW
};

disableSerialization;
_dialog = createDialog "RIP_BUYVEHICLE";

lbClear 5921;
ctrlSetText [5923, format[localize "STR_RIP_DLGMONEY",_money]];
{
	_cfg = switch (true) do {
		case (isClass(configFile >> "CfgWeapons" >> (_x select 0))): {
			configFile >> "CfgWeapons" >> (_x select 0)
		};
		case (isClass(configFile >> "CfgMagazines" >> (_x select 0))): {
			configFile >> "CfgMagazines" >> (_x select 0)
		};
		case (isClass(configFile >> "CfgVehicles" >> (_x select 0))): {
			configFile >> "CfgVehicles" >> (_x select 0)
		};
	};
	_picture = getText (_cfg >> "picture");
	_vehname = getText (_cfg >> "displayName");

	_idx = lnbAddRow [5921,[_vehname,str(_x select 1)]];
	lnbSetPicture [5921,[_idx,0],_picture];
	lnbSetData [5921,[_idx,0],(_x select 0)];
	lnbSetValue [5921,[_idx,1],(_x select 1)];
} forEach _vehlist;
