_pack = _this select 0;
_caller = _this select 1;
_weapholder = _this select 2;

waitUntil {sleep 0.5; vehicle _caller != _caller or _pack != _caller getVariable "Zade_ChestBackpack"};

if (_pack != _caller getVariable "Zade_ChestBackpack") exitWith {true};

detach _weapholder;
deleteVehicle _weapholder;

waitUntil {sleep 0.5; vehicle _caller == _caller or _pack != _caller getVariable "Zade_ChestBackpack"};

if (_pack != _caller getVariable "Zade_ChestBackpack") exitWith {true};

[_pack,_caller] call Zade_BOC_fnc_AttachTo;

if (true) exitWith {true};