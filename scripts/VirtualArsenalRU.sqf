/*
[nameOfBox,_type] call RHS_fnc_VirtualAmmoBoxRus
nameOfBox - Object
type - Number, 0: all gear, 1: only ammo

you can use it on whatever you want :)
/* && (((configname _entry) splitstring "_") select 2) == "GER"*
author: reyhard the grey
*/
private ["_return", "_path","_entry"];
_return = [];
_path = configfile >> "cfgWeapons";
for "_i" from 0 to (count(configfile >> "cfgWeapons"))-1 do {
	_entry = _path select _x;
	if (getNumber (_entry >> "scope") == 2) then {
		_return pushback  configname _entry
	};
};
copytoclipboard str _return
[]

private["_ammoBox","_type","_lib_magazines","_lib_weapons","_lib_items","_lib_backpacks"];
params["_ammoBox","_type"];

_lib_weapons = [
	"Binocular",
	"LIB_P38",
	"LIB_M1908",
	"LIB_FLARE_PISTOL",
	"LIB_MP40",
	"LIB_K98",
	"LIB_K98ZF39",
	"LIB_MP44",
	"LIB_G43",
	"LIB_MG42",
	"LIB_MLMG42",
	"LIB_PzFaust_30m",
	"LIB_RPzB"
];
_lib_magazines = [
	"lib_8Rnd_9x19",
	"lib_1Rnd_flare_white",
	"lib_1Rnd_flare_red",
	"lib_1Rnd_flare_green",
	"lib_1Rnd_flare_yellow",
	"LIB_32Rnd_9x19",
	"lib_5Rnd_792x57",
	"lib_30Rnd_792x33",
	"lib_10Rnd_792x57",
	"lib_50Rnd_792x57",
	"lib_250Rnd_792x57",
	"1Rnd_LIB_PzFaust_30m",
	"LIB_1Rnd_RPzB"
];

_lib_items = [
//	"itemRadio",
	"itemMap",
	"itemcompass",
	"itemWatch",
	//misc items
	"toolkit",
	"medikit",
	"firstaidkit",
	"LIB_Binocular_SU",
	"LIB_w"
	//uniforms
	V_LIB_GER_VestG43
V_LIB_GER_VestKar98
V_LIB_GER_VestMG
V_LIB_GER_VestMP40
V_LIB_GER_VestSTG
	//vests

	//headgear

	// Beret


	//facewear


	//accesories

];

if (isClass(configFile >> "cfgPatches" >> "rhsusf_c_weapons")) then
{
	{_lib_items pushback _x}foreach (getArray (configFile >> "rhs_western_rifle_scopes_slot" >> "compatibleItems"));
};

_lib_backpacks = [
	"rhs_assault_umbts",
//	"rhs_assault_umbts_engineer",
	"rhs_assault_umbts_engineer_empty",
//	"rhs_assault_umbts_medic",
//	"rhs_rpg",
	"rhs_rpg_empty",
	"rhs_sidor"
/*	"rhs_sidorMG",
	"RHS_NSV_Gun_Bag",
	"RHS_NSV_Tripod_Bag",
	"RHS_DShkM_Gun_Bag",
	"RHS_DShkM_TripodHigh_Bag",
	"RHS_DShkM_TripodLow_Bag",
	"RHS_Kord_Gun_Bag",
	"RHS_Kord_Tripod_Bag",
	"RHS_Metis_Gun_Bag",
	"RHS_Metis_Tripod_Bag",
	"RHS_Kornet_Gun_Bag",
	"RHS_Kornet_Tripod_Bag",
	"RHS_AGS30_Gun_Bag",
	"RHS_AGS30_Tripod_Bag",
	"RHS_SPG9_Gun_Bag",
	"RHS_SPG9_Tripod_Bag",
	"RHS_Podnos_Gun_Bag",
	"RHS_Podnos_Bipod_Bag"*/
];

//adding stuff

["AmmoboxInit",[_ammoBox]] call rhs_fnc_arsenal;

if(_type == 0)then{
	[_ammoBox,_lib_weapons,true] call BIS_fnc_addVirtualWeaponCargo;
	[_ammoBox,_lib_items,true] call rhs_fnc_addVirtualItemCargo;
	[_ammoBox,_lib_backpacks,true] call BIS_fnc_addVirtualBackPackCargo;
};

[_ammoBox,_lib_magazines,true] call BIS_fnc_addVirtualMagazineCargo;

//_ammoBox setvariable ["bis_fnc_arsenal_condition",{true},true];
