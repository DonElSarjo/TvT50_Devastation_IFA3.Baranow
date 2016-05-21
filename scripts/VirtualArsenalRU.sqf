/*
[nameOfBox,_type] call RHS_fnc_VirtualAmmoBoxRus
nameOfBox - Object
type - Number, 0: all gear, 1: only ammo

you can use it on whatever you want :)

author: reyhard the grey
*/

private["_ammoBox","_type","_rhs_magazines","_rhs_weapons","_rhs_items","_rhs_backpacks"];
params["_ammoBox","_type"];

_rhs_weapons = [
	"Binocular",
	"rhs_tr8_periscope",
	"rhs_tr8_periscope_pip",
	"rhs_weap_tr8",
	"rhs_pdu4",

	"rhs_weap_aks74u",
	"rhs_weap_aks74u_folded",
	"rhs_weap_aks74un",
	"rhs_weap_aks74un_folded",

	"rhs_weap_ak74m",
	"rhs_weap_ak74m_plummag",
	"rhs_weap_ak74m_camo",
	"rhs_weap_ak74m_desert",
	"rhs_weap_ak74m_gp25",
	"rhs_weap_ak74m_folded",
	"rhs_weap_ak74m_2mag",
	"rhs_weap_ak74m_2mag_camo",
	"rhs_weap_ak74m_npz",
	"rhs_weap_ak74m_plummag_npz",
	"rhs_weap_ak74m_camo_npz",
	"rhs_weap_ak74m_desert_npz",
	"rhs_weap_ak74m_2mag_npz",
	"rhs_weap_ak74m_2mag_camo_npz",
	"rhs_weap_ak74m_gp25_npz",
	"rhs_weap_ak74m_fullplum",
	"rhs_weap_ak74m_npz_fullplum",

	"rhs_weap_asval",
	"rhs_weap_asval_grip",
	"rhs_weap_asval_grip_npz",
	"rhs_weap_asval_npz",
	"rhs_weap_vss",
	"rhs_weap_vss_grip",
	"rhs_weap_vss_grip_npz",
	"rhs_weap_vss_npz",

	"rhs_weap_akm",
	"rhs_weap_akms",

	"rhs_weap_akm_gp25",
	"rhs_weap_akms_gp25",

	"rhs_weap_ak103",
	"rhs_weap_ak103_npz",
	"rhs_weap_ak103_1",
	"rhs_weap_ak103_2",
	"rhs_weap_ak103_gp25",
	"rhs_weap_ak103_gp25_npz",

	"rhs_weap_ak104",
	"rhs_weap_ak104_npz",

	"rhs_weap_ak105",
	"rhs_weap_ak105_npz",

	"rhs_weap_svdp",
	"rhs_weap_svdp_wd",
	"rhs_weap_svds",
	"rhs_weap_svdp_npz",
	"rhs_weap_svdp_wd_npz",
	"rhs_weap_svds_npz",

	"rhs_weap_pkm",
	"rhs_weap_pkp",

	"rhs_weap_rpg26",
	"rhs_weap_rshg2",
	"rhs_weap_rpg7",
	"rhs_weap_igla",
	"rhs_weap_rsp30_white",
	"rhs_weap_rsp30_green",
	"rhs_weap_rsp30_red",


	"rhs_weap_pya",
	"rhs_weap_makarov_pm",
	"rhs_weap_makarov_pmm",
	"rhs_weap_pp2000",
	"rhs_weap_pp2000_folded"


	/*ai variants
	"rhs_weap_ak74m_dtk",
	"rhs_weap_ak74m_pkas",
	"rhs_weap_ak74m_1p63",
	"rhs_weap_ak74m_pso1m2",
	"rhs_weap_ak74m_1p29",
	"rhs_weap_ak74m_camo_dtk",
	"rhs_weap_ak74m_npz_dtk",
	"rhs_weap_ak103_dtk",
	"rhs_weap_ak103_npz_dtk",
	"rhs_weap_ak103_1_dtk",
	"rhs_weap_ak103_2_dtk",
	"rhs_weap_ak74m_folded_dtk",
	"rhs_weap_ak74m_2mag_dtk",
	"rhs_weap_ak74m_2mag_camo_dtk",
	"rhs_weap_ak74m_camo_pkas",
	"rhs_weap_ak74m_camo_1p63",
	"rhs_weap_ak74m_camo_pso1m2",
	"rhs_weap_ak74m_camo_1p29",
	"rhs_weap_ak74m_desert_dtk",
	"rhs_weap_ak74m_plummag_dtk",
	"rhs_weap_ak74m_gp25_dtk",
	"rhs_weap_ak74m_gp25_npz_dtk",
	"rhs_weap_ak74m_gp25_pkas",
	"rhs_weap_ak74m_gp25_1p63",
	"rhs_weap_ak74m_gp25_pso1m2",
	"rhs_weap_ak74m_gp25_1p29",
	"rhs_weap_svdp_pso1",
	"rhs_weap_svds_pso1",
	"rhs_weap_rpg7_pgo"*/

];

_rhs_magazines = [
	"rhs_mag_rgd5",
	"rhs_mag_rdg2_white",
	"rhs_mag_rdg2_black",
	"rhs_mag_nspn_yellow",
	"rhs_mag_nspn_red",
	"rhs_mag_nspn_green",
	"rhs_mag_nspd",
	"rhs_mag_fakel",
	"rhs_mag_fakels",
	"rhs_mag_zarya2",
	"rhs_mag_plamyam",
	"rhs_mag_rgn",
	"rhs_mag_rgo",


//5.45 mags
	"rhs_30Rnd_545x39_AK",
	"rhs_30Rnd_545x39_7N10_AK",
	"rhs_30Rnd_545x39_7N22_AK",
	"rhs_30Rnd_545x39_AK_green",
	"rhs_30Rnd_545x39_7U1_AK",

	"rhs_45Rnd_545x39_AK",
	"rhs_45Rnd_545x39_7N10_AK",
	"rhs_45Rnd_545x39_7N22_AK",
	"rhs_45Rnd_545x39_AK_green",
	"rhs_45Rnd_545x39_7U1_AK",

//GP25 ammo
	"rhs_VOG25",
	"rhs_VOG25p",
	"rhs_vg40tb",
	"rhs_vg40sz",
	"rhs_vg40op_white",
	"rhs_vg40op_green",
	"rhs_vg40op_red",
	"rhs_GRD40_white",
	"rhs_GRD40_green",
	"rhs_GRD40_red",
	"rhs_GDM40",
	"rhs_VG40MD_White",
	"rhs_VG40MD_Green",
	"rhs_VG40MD_Red",

//7.62 mags
	"rhs_30Rnd_762x39mm",
	"rhs_30Rnd_762x39mm_tracer",
	"rhs_30Rnd_762x39mm_89",
	"rhs_30Rnd_762x39mm_U",

	"rhs_10Rnd_762x54mmR_7N1",
	"rhs_100Rnd_762x54mmR",
	"rhs_100Rnd_762x54mmR_green",
	"rhs_100Rnd_762x54mmR_7n13",
	"rhs_100Rnd_762x54mmR_7n26",
	"rhs_100Rnd_762x54mmR_7bz3",

//9mm
	"rhs_20rnd_9x39mm_SP5",
	"rhs_20rnd_9x39mm_SP6",
	"rhs_mag_9x19_17",
	"rhs_mag_9x19mm_7n21_20",
	"rhs_mag_9x19mm_7n31_20",
	"rhs_mag_9x19mm_7n21_44",
	"rhs_mag_9x19mm_7n31_44",
	"rhs_mag_9x18_12_57N181S",
	"rhs_mag_9x18_8_57N181S",

//mines
	"rhs_mine_tm62m_mag",
	"rhs_mine_pmn2_mag",

//rpgs
	"rhs_rpg7_PG7VL_mag",
	"rhs_rpg7_PG7VR_mag",
//	"rhs_rpg7_OG7V_mag",
	"rhs_rpg7_TBG7V_mag",
	"rhs_rpg26_mag",
	"rhs_rshg2_mag",
	"rhs_mag_9k38_rocket"
];

_rhs_items = [
//	"itemRadio",
	"itemMap",
	"itemcompass",
	"itemWatch",
	//misc items
	"toolkit",
//	"medikit",
//	"firstaidkit",
	"MineDetector",

	//uniforms
	"rhs_uniform_flora",
	"rhs_uniform_vdv_emr",
	"rhs_uniform_msv_emr",
	"rhs_uniform_vdv_flora",
	"rhs_uniform_vdv_mflora",
	"rhs_uniform_m88_patchless",
	"rhs_uniform_flora_patchless",
	"rhs_uniform_flora_patchless_alt",
	"rhs_uniform_emr_patchless",
	"rhs_uniform_mflora_patchless",
	"rhs_uniform_df15",
	"rhs_uniform_gorka_r_y",
	"rhs_uniform_gorka_r_g",
	"rhs_uniform_vdv_emr_des",

	//vests
	"rhs_6sh46",
	//6b13 series
	"rhs_6b13",
	"rhs_6b13_crewofficer",
	"rhs_6b13_6sh92",
	"rhs_6b13_6sh92_vog",
	"rhs_6b13_6sh92_headset_mapcase",
	"rhs_6b13_6sh92_radio",
	"rhs_6b13_flora",
	"rhs_6b13_Flora_crewofficer",
	"rhs_6b13_Flora_6sh92",
	"rhs_6b13_Flora_6sh92_vog",
	"rhs_6b13_Flora_6sh92_headset_mapcase",
	"rhs_6b13_Flora_6sh92_radio",
	"rhs_6b13_emr",
	"rhs_6b13_emr_crewofficer",
	"rhs_6b13_emr_6sh92",
	"rhs_6b13_emr_6sh92_vog",
	"rhs_6b13_emr_6sh92_headset_mapcase",
	"rhs_6b13_emr_6sh92_radio",
	//6b23 series
	"rhs_6b23",
	"rhs_6b23_crew",
	"rhs_6b23_crewofficer",
	"rhs_vest_commander",
	"rhs_6b23_engineer",
	"rhs_6b23_medic",
	"rhs_6b23_rifleman",
	"rhs_6b23_sniper",
	"rhs_6b23_6sh92",
	"rhs_6b23_6sh92_vog",
	"rhs_6b23_6sh92_vog_headset",
	"rhs_6b23_6sh92_headset",
	"rhs_6b23_6sh92_headset_mapcase",
	"rhs_6b23_6sh92_radio",
	"rhs_6b23_vydra_3m",
	//vests digi
	"rhs_6b23_digi",
	"rhs_6b23_digi_crew",
	"rhs_6b23_digi_crewofficer",
	"rhs_6b23_digi_engineer",
	"rhs_6b23_digi_medic",
	"rhs_6b23_digi_rifleman",
	"rhs_6b23_digi_sniper",
	"rhs_6b23_digi_6sh92",
	"rhs_6b23_digi_6sh92_vog",
	"rhs_6b23_digi_6sh92_vog_headset",
	"rhs_6b23_digi_6sh92_headset",
	"rhs_6b23_digi_6sh92_headset_mapcase",
	"rhs_6b23_digi_6sh92_radio",
	"rhs_6b23_digi_vydra_3m",
	//6sh116
	"rhs_6b23_6sh116",
	"rhs_6b23_6sh116_flora",
	"rhs_6b23_6sh116_od",
	"rhs_6b23_6sh116_vog",
	"rhs_6b23_6sh116_vog_flora",
	"rhs_6b23_6sh116_vog_od",
	//mountain flora
	"rhs_6b23_ML",
	"rhs_6b23_ML_crew",
	"rhs_6b23_ML_crewofficer",
	"rhs_6b23_ML_engineer",
	"rhs_6b23_ML_medic",
	"rhs_6b23_ML_rifleman",
	"rhs_6b23_ML_sniper",
	"rhs_6b23_ML_6sh92",
	"rhs_6b23_ML_6sh92_vog",
	"rhs_6b23_ML_6sh92_vog_headset",
	"rhs_6b23_ML_6sh92_headset",
	"rhs_6b23_ML_6sh92_headset_mapcase",
	"rhs_6b23_ML_6sh92_radio",
	"rhs_6b23_ML_vydra_3m",

	"rhs_6sh92",
	"rhs_6sh92_vog",
	"rhs_6sh92_vog_headset",
	"rhs_6sh92_headset",
	"rhs_6sh92_radio",
	"rhs_6sh92_digi",
	"rhs_6sh92_digi_vog",
	"rhs_6sh92_digi_vog_headset",
	"rhs_6sh92_digi_headset",
	"rhs_6sh92_digi_radio",


	//other
	"rhs_vydra_3m",
	"rhs_vest_pistol_holster",

	//headgear
	"rhs_fieldcap",
	"rhs_fieldcap_vsr",
	"rhs_fieldcap_khk",
	"rhs_fieldcap_helm",
	"rhs_tsh4",
	"rhs_tsh4_ess",
	"rhs_tsh4_bala",
	"rhs_tsh4_ess_bala",
	"rhs_fieldcap_digi_des",

	"rhs_zsh7a",
	"rhs_zsh7a_mike",
	"rhs_zsh7a_mike_green",
	"rhs_zsh7a_mike_green_alt",
	"rhs_zsh7a_alt",
	"rhs_zsh7a_mike_alt",
	"rhs_zsh12",
	"rhs_zsh12_black",
	"rhs_zsh12_bala",

	"rhs_gssh18",

	"rhs_6b26",
	"rhs_6b26_ess",
	"rhs_6b26_bala",
	"rhs_6b26_ess_bala",

	"rhs_6b7_1m",
	"rhs_6b7_1m_ess",
	"rhs_6b7_1m_ess_bala",
	"rhs_6b7_1m_emr",
	"rhs_6b7_1m_emr_ess",
	"rhs_6b7_1m_emr_ess_bala",
	"rhs_6b7_1m_flora",
	"rhs_6b7_1m_olive",
	"rhs_6b7_1m_bala1",
	"rhs_6b7_1m_bala1_emr",
	"rhs_6b7_1m_bala1_flora",
	"rhs_6b7_1m_bala1_olive",
	"rhs_6b7_1m_bala2",
	"rhs_6b7_1m_bala2_emr",
	"rhs_6b7_1m_bala2_flora",
	"rhs_6b7_1m_bala2_olive",
	"rhs_6b7_1m_flora_ns3",

	"rhs_6b47",
	"rhs_6b47_bala",
	"rhs_6b47_ess",
	"rhs_6b47_ess_bala",

	"rhs_6b26_green",
	"rhs_6b26_ess_green",
	"rhs_6b26_bala_green",
	"rhs_6b26_ess_bala_green",

	"rhs_6b27m",
	"rhs_6b27m_ess",
	"rhs_6b27m_bala",
	"rhs_6b27m_ess_bala",

	"rhs_6b27m_digi",
	"rhs_6b27m_digi_ess",
	"rhs_6b27m_digi_bala",
	"rhs_6b27m_digi_ess_bala",

	"rhs_6b27m_ml",
	"rhs_6b27m_ml_ess",
	"rhs_6b27m_ml_bala",
	"rhs_6b27m_ml_ess_bala",

	"rhs_6b27m_green",
	"rhs_6b27m_green_ess",
	"rhs_6b27m_green_bala",
	"rhs_6b27m_green_ess_bala",

	"rhs_6b28",
	"rhs_6b28_ess",
	"rhs_6b28_bala",
	"rhs_6b28_ess_bala",

	"rhs_6b28_flora",
	"rhs_6b28_flora_ess",
	"rhs_6b28_flora_ess_bala",
	"rhs_6b28_flora_bala",

	"rhs_6b28_green",
	"rhs_6b28_green_ess",
	"rhs_6b28_green_bala",
	"rhs_6b28_green_ess_bala",
	"rhs_ssh68",

	"rhs_Booniehat_digi",
	"rhs_Booniehat_flora",
	"rhs_fieldcap_digi",
	"rhs_fieldcap_digi2",
	"rhs_fieldcap_helm_digi",
	"rhs_fieldcap_ml",
	"rhs_fieldcap_helm_ml",
	"rhs_beanie",
	"rhs_beanie_green",

	// Beret
	"rhs_beret_vdv1",
	"rhs_beret_vdv2",
	"rhs_beret_vdv3",
	"rhs_beret_milp",
	"rhs_beret_mp1",
	"rhs_beret_mp2",

	//facewear
	"rhs_balaclava",
	"rhs_scarf",

	//accesories
	"rhs_1PN138",
	"rhs_acc_npz",
	"rhs_acc_1pn93_1",
	"rhs_acc_1pn93_2",
	"rhs_acc_pso1m2",
	"rhs_acc_pso1m21",
	"rhs_acc_pkas",
	"rhs_acc_pgo7v",
	"rhs_acc_1p29",
	"rhs_acc_1p78",
	"rhs_acc_ekp1",
	"rhs_acc_1p63",
	"rhs_acc_tgpa",
	"rhs_acc_pbs1",
	"rhs_acc_tgpv",
	"rhs_acc_dtk4long",
	"rhs_acc_dtk4short",
	"rhs_acc_dtk4screws",
	"rhs_acc_dtk3",
	"rhs_acc_dtk1",
	"rhs_acc_dtk",
	"rhs_acc_dtk1l",
	"rhs_acc_ak5",
	"rhs_acc_2dpZenit",
	"rhs_acc_2dpZenit_ris",
	"rhs_acc_perst1ik",
	"rhs_acc_perst1ik_ris",
	"rhs_acc_pgs64",
	"rhs_acc_pgs64_74u",
	"rhs_acc_rakurspm",

	"O_UavTerminal"
];

if (isClass(configFile >> "cfgPatches" >> "rhsusf_c_weapons")) then
{
	{_rhs_items pushback _x}foreach (getArray (configFile >> "rhs_western_rifle_scopes_slot" >> "compatibleItems"));
};

_rhs_backpacks = [
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

_ace_items =
[
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

_rhs_items append _ace_items;
//adding stuff

["AmmoboxInit",[_ammoBox]] call rhs_fnc_arsenal;

if(_type == 0)then{
	[_ammoBox,_rhs_weapons,true] call BIS_fnc_addVirtualWeaponCargo;
	[_ammoBox,_rhs_items,true] call rhs_fnc_addVirtualItemCargo;
	[_ammoBox,_rhs_backpacks,true] call BIS_fnc_addVirtualBackPackCargo;
};

[_ammoBox,_rhs_magazines,true] call BIS_fnc_addVirtualMagazineCargo;

//_ammoBox setvariable ["bis_fnc_arsenal_condition",{true},true];
