//by RIP
private ["_unit", "_donat"];

_unit = _this select 0;
_donat = _this select 1;

["RIP_Notif_Info",[format [localize "STR_RIP_HINT_RECEIVEDPOINTS",_unit,_donat]]] call BIS_fnc_showNotification;