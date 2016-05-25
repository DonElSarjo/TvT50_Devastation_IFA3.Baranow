//by RIP
if !(isServer) exitWith {};

{
	_x setVariable ["RIP_RESPAWNVEHICLEPARAMS",[(getDir _x),(getPosATL _x)],false];

	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearBackpackCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x disableTIEquipment true;
	uisleep 1;
	_x addItemCargoGlobal ["Medikit", 1];
	_x addItemCargoGlobal ["ToolKit", 1];
	_x addItemCargoGlobal ["FirstAidKit", 5];

} forEach RIPRESPAWNVEHICLEARRAY;

while {true} do {
	{
		if (underwater _x) then {_x setDamage 1};
		if (_x in [EMHQ1,EMHQ2]) then {
			if (_x distance2D RIP_BASEFLAGW < 1000) then {
				_x setDamage 1
			}; 
		};
		if (_x in [WMHQ1,WMHQ2]) then {
			if (_x distance2D RIP_BASEFLAGE < 1000) then {
				_x setDamage 1
			};
		};
		if !(alive _x) then {
			RIPRESPAWNVEHICLEARRAY = RIPRESPAWNVEHICLEARRAY - [_x];
			[_x] spawn RIP_fnc_RespawnVehicle;
		};
	} forEach RIPRESPAWNVEHICLEARRAY;
	uisleep 30;
};
