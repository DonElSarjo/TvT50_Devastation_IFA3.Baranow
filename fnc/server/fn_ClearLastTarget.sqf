//by RIP
if (!isServer) exitWith {};
private ["_guards", "_obj", "_veh", "_target"];

_guards = _this select 0;
_obj = _this select 1;
_veh = _this select 2;
_target = _this select 3;

if (isNull _target) exitWith {};

uisleep 600;
{deleteVehicle _x} count (_guards + _veh + _obj); 
uisleep 1;
{if (count units _x == 0) then {deleteGroup _x}} forEach allGroups;
uisleep 1;
{deleteVehicle _x} count (allMissionObjects "CraterLong");
uisleep 1;
{deleteVehicle _x} count (allMissionObjects "CraterLong_small");
uisleep 1;
{if (_x distance _target < 800) then {deleteVehicle _x}} count (allMissionObjects "StaticWeapon");
uisleep 1;
{if (_x distance _target < 800) then {deleteVehicle _x}} count (allMissionObjects "WeaponHolder");
uisleep 1;
{if (_x distance _target < 800) then {deleteVehicle _x}} count (allMissionObjects "GroundWeaponHolder");
uisleep 1;
{if (_x distance _target < 800) then {deleteVehicle _x}} count (allMissionObjects "Ruins");
uisleep 1;
{if (_x distance _target < 800) then {deleteVehicle _x}} count allMines;