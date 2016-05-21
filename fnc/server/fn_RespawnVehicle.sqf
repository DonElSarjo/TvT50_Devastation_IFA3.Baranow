//by RIP
if !(isServer) exitWith {};

private ["_veh", "_varname", "_type", "_dir", "_pos", "_newveh"];

_veh = _this select 0;
uisleep RIPMHQRESPAWNDELAY;
_varname = vehicleVarName _veh;
_type = typeof _veh;
_dir = (_veh getVariable "RIP_RESPAWNVEHICLEPARAMS") select 0;
_pos = (_veh getVariable "RIP_RESPAWNVEHICLEPARAMS") select 1;

deleteVehicle _veh;
{deleteVehicle _x} forEach nearestObjects [_pos, ["CraterLong","CraterLong_small"], 15];
uisleep 10;
_newveh = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
_newveh setDir _dir;
uisleep 1;
_newveh setDamage 0;
uisleep 1;
_newveh setFuel 1;
uisleep 1;
clearWeaponCargoGlobal _newveh;
clearMagazineCargoGlobal _newveh;
clearBackpackCargoGlobal _newveh;
clearItemCargoGlobal _newveh;
_newveh disableTIEquipment true;
uisleep 1;
_newveh addItemCargoGlobal ["Medikit", 1];
_newveh addItemCargoGlobal ["ToolKit", 1];
_newveh addItemCargoGlobal ["FirstAidKit", 5];
if (_varname in ["EMHQ1","EMHQ2","WMHQ1","WMHQ2"]) then
{
	_newveh setVariable ["RIP_MHQDEPLOY",0,true];
	_newveh enableRopeAttach false;
	_newveh addEventHandler
	[
		"GetIn",
		{
			private ["_veh", "_unit", "_vehside","_plside"];
			_veh = _this select 0;
			_unit = _this select 2;
			_vehside = getNumber (configFile >> "CfgVehicles" >> (typeOf _veh) >> "side");
			_plside = getNumber (configFile >> "CfgVehicles" >> (typeOf _unit) >> "side");
			if (_plside != _vehside) then {_unit setDamage 1};
		}
	];
	if (RIPANTIATGMSYSTEM == 1) then
		{ [_newveh] remoteExec ["RIP_fnc_AddEHIncomingMissile", 0, true]; };
};

if (_varname == "WMHQ2") then {_newveh  lockTurret [[0],true]};
if (_varname == "EMHQ2") then {_newveh  lockTurret [[0],true]};

if (_varname in ["WTHELI1","WTHELI2","WTHELI3"]) then
{
	_newveh setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_fuselage_co.paa"];
	_newveh setObjectTextureGlobal [1, "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_engine_co.paa"];
};

if (_varname in ["ETHELI1","ETHELI2","ETHELI3","WTHELI1","WTHELI2","WTHELI3"]) then
{
	_newveh addMPEventHandler ["mpkilled", {if (isServer) then {[(_this select 0)] spawn RIP_fnc_DetachVehicle}}];
	_newveh addEventHandler ["GetOut",{if (isServer) then {[(_this select 0)] spawn RIP_fnc_DesertedVehicle}}];
};

_newveh setVehicleVarName _varname;
[_newveh,_varname] call BIS_fnc_objectVar;

uisleep 1;

_newveh setVariable ["RIP_RESPAWNVEHICLEPARAMS",[(getDir _newveh),(getPosATL _newveh)],false];
RIPRESPAWNVEHICLEARRAY pushBack _newveh;
