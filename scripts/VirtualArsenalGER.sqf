/*
[nameOfBox,_type] call RHS_fnc_VirtualAmmoBoxUSA
nameOfBox - Object
type - Number, 0: all gear, 1: only ammo

you can use it on whatever you want :)

author: reyhard
*/

private["_ammoBox","_type","_ifa3_magazines","_ifa3_weapons","_ifa3_items","_ifa3_backpacks"];
_ammoBox = _this select 0;
_type = _this select 1;

_ifa3_weapons = [
	"LIB_MP40",
	"LIB_G43",
	"LIB_M1908",
	"LIB_K98",
	"LIB_MG42",
	"LIB_RPzB",
	"LIB_MP44",
	"LIB_K98ZF39",
	"LIB_FLARE_PISTOL"
];

_ifa3_magazines = [
	// Magazines
	"lib_10Rnd_792x57",
	"lib_5Rnd_792x57",
	"lib_5Rnd_792x57_t",
	"lib_5Rnd_792x57_sS",
	"lib_5Rnd_792x57_SMK",
	"lib_10Rnd_792x57_T",
	"lib_10Rnd_792x57_T2",
	"lib_10Rnd_792x57_sS",
	"lib_10Rnd_792x57_SMK",

	"lib_50Rnd_792x57",
	"lib_50Rnd_792x57_SMK",
	"lib_50Rnd_792x57_sS",


	"LIB_32Rnd_9x19",
	"lib_8Rnd_9x19",

	"LIB_1Rnd_RPzB",

	"LIB_1Rnd_flare_yellow",
	"LIB_1Rnd_flare_green",
	"LIB_1Rnd_flare_red",
	"LIB_1Rnd_flare_white",
	//HE ammo
	"lib_pwm",
	"lib_m39",
	"lib_shg24",
	"lib_shg24x7",
	"lib_nb39",
	"lib_f1",
	"lib_rg42",
	"lib_rpg6",
	//rockets
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

_ifa3_items = [

	//misc items

	"itemMap",
	"itemcompass",
	"itemWatch",
	"Binocular",
	"toolkit",
	"medikit",
	"firstaidkit",
	"LIB_w",

	//- Uniforms
	"U_LIB_GER_Soldier_camo",
	"U_LIB_GER_Pionier",
	"U_LIB_GER_LW_pilot",
	"U_LIB_GER_Officer_camo",
	"U_LIB_GER_Funker",
	"U_LIB_GER_Schutze",
	"U_LIB_GER_Art_schutze",
	"U_LIB_GER_Oberschutze",
	"U_LIB_GER_Gefreiter",
	"U_LIB_GER_Unterofficer",
	"U_LIB_GER_Art_unterofficer",
	"U_LIB_GER_Recruit",
	"U_LIB_GER_Medic",
	"U_LIB_GER_Leutnant",
	"U_LIB_GER_Art_leutnant",
	"U_LIB_GER_Oberleutnant",
	"U_LIB_GER_Hauptmann",
	"U_LIB_GER_Oberst",
	"U_LIB_GER_Scharfschutze",
	"U_LIB_GER_MG_schutze",
	"H_LIB_GER_HelmetCamo",
	"H_LIB_GER_Helmet",
	"H_LIB_GER_OfficerCap",
	"H_LIB_GER_Cap",
	"H_LIB_GER_LW_PilotHelmet",
	"V_LIB_GER_VestMP40",
	"V_LIB_GER_VestSTG",
	"V_LIB_GER_VestKar98",
	"V_LIB_GER_VestG43",
	"V_LIB_GER_SniperBelt",
	"V_LIB_GER_VestMG",
	"V_LIB_GER_VestUnterofficer",
	"V_LIB_GER_FieldOfficer",
	"V_LIB_GER_OfficerVest",
	"V_LIB_GER_OfficerBelt",
	"V_LIB_GER_PrivateBelt",
	"U_LIB_GER_Tank_crew_private",
	"U_LIB_GER_Tank_crew_unterofficer",
	"U_LIB_GER_Tank_crew_leutnant",
	"U_LIB_GER_Spg_crew_private",
	"U_LIB_GER_Spg_crew_unterofficer",
	"U_LIB_GER_Spg_crew_leutnant",
	"H_LIB_GER_TankOfficerCap",
	"H_LIB_GER_TankPrivateCap",
	"H_LIB_GER_SPGPrivateCap",
	"V_LIB_GER_TankPrivateBelt"


];

_ifa3_backpacks = [
	"B_LIB_GER_A_frame",
	"B_LIB_GER_A_frame_AT",
	"B_LIB_GER_A_frame_Gef",
	"B_LIB_GER_Radio",
	"B_LIB_GER_SapperBackpack",
	"B_LIB_GER_SapperBackpack2",
	"B_LIB_GER_MedicBackpack",
	"B_LIB_GER_LW_Paradrop",
	"B_LIB_GER_Panzer"
];
/*
_ace_items = [
	"ACE_CableTie",
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"ACE_DeadManSwitch",
	"ACE_Cellphone",
	"ACE_EarPlugs",
	"ACE_UAVBattery",
	"ACE_wirecutter",
	"ACE_MapTools",
	"ACE_atropine",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_quikclot",
	"ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_bloodIV_250",
	"ACE_bodyBag",
	"ACE_bodyBagObject",
	"ACE_epinephrine",
	"ACE_morphine",
	"ACE_packingBandage",
	"ACE_personalAidKit",
	"ACE_plasmaIV",
	"ACE_plasmaIV_500",
	"ACE_plasmaIV_250",
	"ACE_salineIV",
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_surgicalKit",
	"ACE_tourniquet",
	"ACE_Sandbag_empty",
	"ACE_SpottingScope",
	"ACE_TacticalLadder_Pack"
];

_ifa3_items append _ace_items;
*/
//adding stuff

["AmmoboxInit",[_ammoBox]] call BIS_fnc_arsenal;

if(_type == 0)then{
	[_ammoBox,_ifa3_weapons,true] call BIS_fnc_addVirtualWeaponCargo;
	[_ammoBox,_ifa3_items,true] call BIS_fnc_addVirtualItemCargo;
	[_ammoBox,_ifa3_backpacks,true] call BIS_fnc_addVirtualBackPackCargo;
};

[_ammoBox,_ifa3_magazines,true] call BIS_fnc_addVirtualMagazineCargo;


//_ammoBox setvariable ["bis_fnc_arsenal_condition",{true},true];
