//by RIP
private ["_money", "_selectpl", "_unit", "_donat", "_subdonat"];

RIPTRANSFERPOINTPROCESS = true;
_selectpl = lbData [6921, (lbCurSel 6921)];
_donat = round(sliderPosition 6901);
closeDialog 0;
if (isNil _selectpl) exitWith {["RIP_Notif_Warning",[localize "STR_RIP_HINT_PLAYERNOTSELECTED"]] call BIS_fnc_showNotification;RIPTRANSFERPOINTPROCESS = false;};

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {(local player)};

_money = ((getPlayerScores player) select 5);
uisleep 0.5;
if (_donat > _money) exitWith {};
if (_money <= 0) exitWith {["RIP_Notif_Warning",[localize "STR_RIP_HINT_NOTMONEY"]] call BIS_fnc_showNotification;RIPTRANSFERPOINTPROCESS = false;};

_subdonat = 0 - _donat;
[player,_subdonat] remoteExec ["addScore", 2];
waitUntil { _money > ((getPlayerScores player) select 5)};

_unit = missionNamespace getVariable _selectpl;
[_unit,_donat] remoteExec ["addScore", 2];
["RIP_Notif_Info",[format [localize "STR_RIP_HINT_TRANSFERPOINTS",_donat,(name _unit)]]] call BIS_fnc_showNotification;
[_unit,_donat] remoteExec ["RIP_fnc_RecivedPointNotif", _unit];

[(name player),((getPlayerScores player) select 5),(name _unit),_donat] remoteExec ["RIP_fnc_ServerLog", 2];
RIPTRANSFERPOINTPROCESS = false;
