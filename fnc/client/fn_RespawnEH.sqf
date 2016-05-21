//by RIP
private ["_corpse"];

_corpse = _this select 0;
deleteVehicle _corpse;

player allowDamage true;
player setcaptive false;
RIPSERVICING = false;
RIPTRANSFERPOINTPROCESS = false;
RIPBUYVEHICLEPROCESS = false;
[] spawn RIP_fnc_AddPlayerActions;
[] spawn RIP_fnc_ClearBase;
RIPPLAYERSIDE = getNumber (configFile >> "CfgVehicles" >> (typeOf player) >> "side");
if (RIP3DPERSONDISABLE == 1) then {player switchCamera "Internal";};
player setCustomAimCoef 0.4;
