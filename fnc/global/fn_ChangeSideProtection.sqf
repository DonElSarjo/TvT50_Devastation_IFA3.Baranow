//by RIP
if !(isServer) exitWith {};
private ["_pl", "_uid", "_arr", "_plsideold", "_plsidenew", "_pltimeold"];

_pl = _this select 0;
_uid = getPlayerUID _pl;

_arr = ServerPlayerDB getVariable _uid;

if (isNil "_arr") then
{
	_arr = [getNumber (configFile >> "CfgVehicles" >> (typeOf _pl) >> "side"),(serverTime + RIPCHANGESIDE)];
	ServerPlayerDB setVariable [_uid,_arr,false];
};

_plsideold = _arr select 0;
_pltimeold = _arr select 1;
_plsidenew = getNumber (configFile >> "CfgVehicles" >> (typeOf _pl) >> "side");

if (_plsideold == _plsidenew) exitWith {};
//if ((_plsideold != _plsidenew) && (RIPCHANGESIDE == 0)) exitWith {["ChangeSide",false,0] remoteExec ["BIS_fnc_endMission", _pl]};
//if (_pltimeold > serverTime) exitWith {["ChangeSide",false,0] remoteExec ["BIS_fnc_endMission", _pl]};

_arr = [_plsidenew,(serverTime + RIPCHANGESIDE)];
ServerPlayerDB setVariable [_uid,_arr,false];
