//by RIP
private ["_dialog","_money","_idx"];

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {(local player)};
if (RIPTRANSFERPOINTPROCESS) exitWith {};

_money = ((getPlayerScores player) select 5);
[(name player),player,_money,1] remoteExec ["RIP_fnc_ServerLog", 2];
if (_money <= 0) exitWith {["RIP_Notif_Warning",[localize "STR_RIP_HINT_NOTMONEY"]] call BIS_fnc_showNotification;};

disableSerialization;
_dialog = createDialog "RIP_POINTSTRANSFER";

sliderSetRange [6901, 0, _money];
sliderSetPosition [6901, 0];

lbClear 6921;
{
	if (!isNull _x) then {
		if ((isPlayer _x) && (RIPPLAYERSIDE == getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> "side"))) then {
			if (alive _x) then {
				_idx = lbAdd[6921,(name _x)];
				lbSetData [6921, _idx, (vehicleVarName _x)];
			};
		};
	};
} count (allPlayers - [player]);
lbSetCurSel [6921, 0];

While {dialog} do {
	ctrlSetText[6902,format["%1",round(sliderPosition 6901)]];
	sleep 0.1;
};
