//by RIP
private ["_killer"];

_killer = _this select 0;

waitUntil {alive player};
if ( [ format[localize "STR_RIP_HINT_TEAMKILLPUNISH", (name _killer)], "", localize "STR_RIP_YES", localize "STR_RIP_NO" ] call BIS_fnc_guiMessage ) then {
    [_killer,-30] remoteExec ["addScore", 2]
};
