//by RIP
private ["_vehtype", "_vehprice", "_money", "_vehicle", "_dist", "_vehname", "_pos", "_subScore"];

RIPBUYVEHICLEPROCESS = true;
_vehtype = lnbData [5921,[(lnbCurSelRow 5921),0]];
_vehprice = lnbValue [5921,[(lnbCurSelRow 5921),1]];
closeDialog 0;

_money = ((getPlayerScores player) select 5);
[(name player),_money,1] remoteExec ["RIP_fnc_ServerLog", 2];
uisleep 0.5;
if (_money < 0) then {_money = 0};
uisleep 0.5;
if (_money < _vehprice) exitWith {["RIP_Notif_Warning",[localize "STR_RIP_HINT_NOTMONEY"]] call BIS_fnc_showNotification;RIPBUYVEHICLEPROCESS = false;};

_subScore = 0 - _vehprice;
[player,_subScore] remoteExec ["addScore", 2];
waitUntil { _money > ((getPlayerScores player) select 5) };

if !(_vehtype in AVAILABLEBACKPACK) then
{
	_dist = (sizeOf _vehtype) + 4;
	_pos = [(getPos player select 0) + _dist*sin (getDir player), (getPos player select 1) + _dist*cos (getDir player)];
	_vehicle = createVehicle [_vehtype, _pos, [], 0, "NONE"];
	_vehicle setDir getDir player;

	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;

	_vehicle lock 2;
	_vehicle addMPEventHandler ["MPKilled", {if (isServer) then {_this spawn RIP_fnc_MPKilledEH}}];
	_vehicle setVariable ["RIP_VehicleName", (getPlayerUID player), true];
	if (RIPANTIATGMSYSTEM == 1) then { if (_vehicle isKindOf "Tank_F") then { [_vehicle] remoteExec ["RIP_fnc_AddEHIncomingMissile", 0, true]; }; };
};
if (_vehtype in AVAILABLEBACKPACK) then
{
	if (backpack player != "") then {removeBackpack player};
	uisleep 0.2;
	player addBackpack _vehtype;
};
if (_vehtype in RIP_ATLAUNCHERS) then
{
	if (secondaryWeapon player != "") then {player removeWeapon (secondaryWeapon player)};
	uisleep 0.2;
	player addWeapon _vehtype;
	uisleep 0.2;
	player addSecondaryWeaponItem (configName(configFile >> "cfgMagazines" >> (getArray(configFile >> "CfgWeapons" >> _vehtype >> "magazines") select 0)  ));
};
[(name player),((getPlayerScores player) select 5),_vehtype,_vehprice] remoteExec ["RIP_fnc_ServerLog", 2];
RIPBUYVEHICLEPROCESS = false;
