/*
[nameOfBox,_type] call RHS_fnc_VirtualAmmoBoxRus
nameOfBox - Object
type - Number, 0: all gear, 1: only ammo

you can use it on whatever you want :)

author: reyhard the grey
*/

private["_ammoBox","_type","_lib_magazines","_lib_weapons","_lib_items","_lib_backpacks"];
params["_ammoBox","_type"];

_lib_weapons = [
	"Binocular",
	"LIB_TT33",
	"LIB_M1895",
	"LIB_PPSh41_d",
	"LIB_PPSh41_m",
	"LIB_M9130",
	"LIB_DP28",
	"LIB_RPzB",
	"LIB_M9130PU",
//	"LIB_DT_OPTIC",
	"LIB_DT",
	"LIB_SVT_40",
	"LIB_FLARE_PISTOL"
];
_lib_magazines = [

	"LIB_1Rnd_flare_yellow",
	"LIB_1Rnd_flare_green",
	"LIB_1Rnd_flare_red",
	"LIB_1Rnd_flare_white",

	"lib_63Rnd_762x54d",
	"lib_63Rnd_762x54",

	"lib_5Rnd_762x54",
	"lib_5Rnd_762x54_t46",
	"lib_5Rnd_762x54_t30",
	"lib_5Rnd_762x54_D",

	"lib_8Rnd_762x25",

	"lib_47Rnd_762x54",
	"lib_47Rnd_762x54d",
	"LIB_1Rnd_RPzB",

	"lib_35Rnd_762x25",
	"lib_35Rnd_762x25_t",
	"lib_35Rnd_762x25_t2",
	"lib_35Rnd_762x25_ap",

	"lib_71Rnd_762x25",
	"lib_71Rnd_762x25_t",
	"lib_71Rnd_762x25_t2",
	"lib_71Rnd_762x25_ap",

	"lib_10Rnd_762x54",

	"lib_7Rnd_762x38",

	"lib_10Rnd_762x54_t46",
	"lib_10Rnd_762x54_t30",
	"lib_10Rnd_762x54_t462",
	"lib_10Rnd_762x54_t302",
	"lib_10Rnd_762x54_d",

	"lib_pwm",
	"lib_m39",
	"lib_shg24",
	"lib_shg24x7",
	"lib_nb39",
	"lib_f1",
	"lib_rg42",
	"lib_rpg6",

	"LIB_Ladung_PM_MINE_mag",
	"LIB_PM_Provod_100",
	"LIB_PM_Provod_50",
	"LIB_PM_Provod_75",
	"LIB_shumine_42_MINE_mag",
	"LIB_SMI_35_MINE_mag",
	"LIB_SMI_35_1_MINE_mag",
	"LIB_Ladung_Small_MINE_mag",
	"LIB_Ladung_Big_MINE_mag",
	"LIB_STMI_MINE_mag",
	"LIB_TMI_42_MINE_mag",
	"LIB_M3_MINE_mag",
	"LIB_PMD6_MINE_mag",
	"LIB_pomzec_MINE_mag",
	"LIB_TM44_MINE_mag"
];

_lib_items = [
	"itemMap",
	"itemcompass",
	"itemWatch",
	"toolkit",
	"medikit",
	"firstaidkit",
	"LIB_Binocular_SU",
	"LIB_w",

	"U_LIB_SOV_Strelok",
	"U_LIB_SOV_Strelokart",
	"U_LIB_SOV_Tank_private_field",
	"U_LIB_SOV_Starshina",
	"U_LIB_SOV_Efreitor",
	"U_LIB_SOV_Sergeant",
	"U_LIB_SOV_Sergeant_inset_pocket",
	"U_LIB_SOV_Stsergeant",
	"U_LIB_SOV_Leutenant",
	"U_LIB_SOV_Pilot",
	"U_LIB_SOV_Leutenant_inset_pocket",
	"U_LIB_SOV_Artleutenant",
	"U_LIB_SOV_Stleutenant",
	"U_LIB_SOV_Kapitan",
	"U_LIB_SOV_Razvedchik_am",
	"U_LIB_SOV_Razvedchik_lis",
	"U_LIB_SOV_Razvedchik_mix",
	"U_LIB_SOV_Sniper",
	"U_LIB_SOV_Tank_ryadovoi",
	"U_LIB_SOV_Tank_sergeant",
	"U_LIB_SOV_Tank_leutenant",
	"U_LIB_SOV_Tank_kapitan",
	"H_LIB_SOV_RA_PrivateCap",
	"H_LIB_SOV_RA_OfficerCap",
	"H_LIB_SOV_RA_Helmet",
	"H_LIB_SOV_TankHelmet",
	"H_LIB_SOV_PilotHelmet",
	"V_LIB_SOV_IShBrVestMG",
	"V_LIB_SOV_IShBrVestPPShMag",
	"V_LIB_SOV_IShBrVestPPShDisc",
	"V_LIB_SOV_RA_OfficerVest",
	"V_LIB_SOV_RA_SniperVest",
	"V_LIB_SOV_RA_Belt",
	"V_LIB_SOV_RA_TankOfficerSet",
	"V_LIB_SOV_RA_PPShBelt",
	"V_LIB_SOV_RA_MosinBelt",
	"V_LIB_SOV_RA_SVTBelt",
	"V_LIB_SOV_RA_MGBelt",
	"V_LIB_SOV_RAZV_SVTBelt",
	"V_LIB_SOV_RAZV_OfficerVest",
	"V_LIB_SOV_RAZV_MGBelt",
	"V_LIB_SOV_RAZV_PPShBelt"
];

_lib_backpacks = [
	"B_LIB_SOV_RA_GasBag",
	"B_LIB_SOV_RA_Paradrop",
	"B_LIB_SOV_RA_MedicalBag",
	"B_LIB_SOV_RA_Radio",
	"B_LIB_SOV_RA_Rucksack",
	"B_LIB_SOV_RA_RucksackMines",
	"B_LIB_SOV_RA_RucksackMines2",
	"B_LIB_SOV_RA_MGAmmoBag"
];

//adding stuff

["AmmoboxInit",[_ammoBox]] call BIS_fnc_arsenal;

if(_type == 0)then{
	[_ammoBox,_lib_weapons,true] call BIS_fnc_addVirtualWeaponCargo;
	[_ammoBox,_lib_items,true] call BIS_fnc_addVirtualItemCargo;
	[_ammoBox,_lib_backpacks,true] call BIS_fnc_addVirtualBackPackCargo;
};

[_ammoBox,_lib_magazines,true] call BIS_fnc_addVirtualMagazineCargo;

//_ammoBox setvariable ["bis_fnc_arsenal_condition",{true},true];
