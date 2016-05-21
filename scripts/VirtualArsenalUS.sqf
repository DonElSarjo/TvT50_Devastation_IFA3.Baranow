/*
[nameOfBox,_type] call RHS_fnc_VirtualAmmoBoxUSA
nameOfBox - Object
type - Number, 0: all gear, 1: only ammo

you can use it on whatever you want :)

author: reyhard
*/

private["_ammoBox","_type","_rhs_magazines","_rhs_weapons","_rhs_items","_rhs_backpacks"];
_ammoBox = _this select 0;
_type = _this select 1;

_rhs_weapons =
[

	"Binocular",


	"rhs_weap_m4",
	"rhs_weap_m4_m203",
	"rhs_weap_m4_grip",
	"rhs_weap_m4_grip2",
	"rhs_weap_m4_grip3",
	"rhs_weap_m4_bipod",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_carryhandle_pmag",
	"rhs_weap_m4_m320",

	"rhs_weap_m4a1_m320",
	"rhs_weap_m4a1_m203",
	"rhs_weap_m4a1_carryhandle_m203",
	"rhs_weap_m4a1",
	"rhs_weap_m4a1_grip",
	"rhs_weap_m4a1_grip2",
	"rhs_weap_m4a1_bipod",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_grip",
	"rhs_weap_m4a1_carryhandle_grip2",
	"rhs_weap_m4a1_carryhandle_grip3",
	"rhs_weap_m4a1_carryhandle_bipod",

	"rhs_weap_m4a1_d",
	"rhs_weap_m4a1_d_grip",
	"rhs_weap_m4a1_d_grip2",
	"rhs_weap_m4a1_d_grip3",
	"rhs_weap_m4a1_d_mstock",
	"rhs_weap_m4a1_d_mstock_grip",
	"rhs_weap_m4a1_d_mstock_grip2",
	"rhs_weap_m4a1_d_mstock_grip3",

	"rhs_weap_m4a1_m203s",
	"rhs_weap_m4a1_m203s_wd",
	"rhs_weap_m4a1_m203s_d",
	"rhs_weap_m4a1_m203s_sa",

	"rhs_weap_hk416d10",
	"rhs_weap_hk416d10_grip",
	"rhs_weap_hk416d10_grip2",
	"rhs_weap_hk416d10_grip3",

	"rhs_weap_hk416d145",
	"rhs_weap_hk416d145_grip",
	"rhs_weap_hk416d145_grip2",
	"rhs_weap_hk416d145_grip3",

	"rhs_weap_m16a4",
	"rhs_weap_m16a4_grip",
	"rhs_weap_m16a4_grip2",
	"rhs_weap_m16a4_bipod",
	"rhs_weap_m16a4_carryhandle",
	"rhs_weap_m16a4_carryhandle_M203",
	"rhs_weap_m16a4_carryhandle_pmag",
	"rhs_weap_m16a4_carryhandle_grip",
	"rhs_weap_m16a4_carryhandle_grip2",
	"rhs_weap_m16a4_carryhandle_grip_pmag",
	"rhs_weap_m16a4_carryhandle_grip2_pmag",
	"rhs_weap_m16a4_carryhandle_bipod",

	"rhs_weap_m27iar",
	"rhs_weap_m27iar_grip",

	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_pip_S_vfg",
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L_vfg",

	"rhs_weap_m240B",
	"rhs_weap_m240B_CAP",
	"rhs_weap_m240G",

	"rhs_weap_m14ebrri",
	"rhs_weap_sr25",
	"rhs_weap_sr25_ec",

	"rhs_weap_m39",
	"rhs_weap_XM2010",
	"rhs_weap_XM2010_d",
	"rhs_weap_XM2010_wd",
	"rhs_weap_XM2010_sa",

	//"rhs_weap_m32",

	"rhsusf_weap_MP7A1_base_f",
	"rhsusf_weap_MP7A1_winter",
	"rhsusf_weap_MP7A1_desert",
	"rhsusf_weap_MP7A1_aor1",
	/*
	"rhs_weap_M107",
	"rhs_weap_M107_w",
	"rhs_weap_M107_d",
	"rhs_weap_M107_lc",
	*/
	"rhs_weap_M320",

	"rhsusf_weap_m1911a1",
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m9",

	"rhs_weap_m72a7",
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"rhs_weap_smaw",
	"rhs_weap_smaw_green",
	"rhs_weap_fim92",
	"rhs_weap_fgm148",
	"rhs_weap_mk40_sraw",
	"rhs_weap_mk41_sraw",

	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD"

	/* Weap AI

	"rhs_m4_compm4",
	"rhs_m4_acog",
	"rhs_m4_acog2",
	"rhs_m4_acog3",
	"rhs_m4_grip_compm4",
	"rhs_m4_grip_acog",
	"rhs_m4_grip_acog2",
	"rhs_m4_grip_acog3",
	"rhs_m4_m320_compm4",
	"rhs_m4_m320_acog",
	"rhs_m4_m320_acog2",
	"rhs_m4_m320_acog3"
*/
];

_rhs_magazines = [
// Grenades
	"rhs_mag_m67",
	"rhs_mag_m69",
	"rhs_mag_mk84",
	"rhs_mag_an_m8hc",
	"rhs_mag_an_m14_th3",
	"rhs_mag_m7a3_cs",
	"rhs_mag_mk3a2",
	"rhs_mag_m18_green",
	"rhs_mag_m18_purple",
	"rhs_mag_m18_red",
	"rhs_mag_m18_yellow",

	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",

//5.56 mags
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"rhs_mag_30Rnd_556x45_Mk262_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",
	"rhs_mag_30Rnd_556x45_M200_Stanag",

	"rhs_mag_smaw_SR",

// Pistol Mags
	"rhsusf_mag_7x45acp_MHP",
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_17Rnd_9x19_FMJ",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_FMJ",

//M320 ammo (we lack M651 CS Gas)
	"rhs_mag_M441_HE",
	"rhs_mag_M433_HEDP",
	"rhs_mag_M781_Practice",
	"rhs_mag_M4009",
	"rhs_mag_m576", // Buckshot
	"rhs_mag_M585_white", // Flares
	"rhs_mag_M661_green",
	"rhs_mag_M662_red",
	"rhs_mag_M713_red", // Smoke
	"rhs_mag_M714_white",
	"rhs_mag_M715_green",
	"rhs_mag_M716_yellow",

	"rhsusf_mag_6Rnd_M433_HEDP",
	"rhsusf_mag_6Rnd_M781_Practice",
	"rhsusf_mag_6Rnd_M576_Buckshot",
	"rhsusf_mag_6Rnd_M441_HE",
//M249 mag
	"rhsusf_100Rnd_556x45_soft_pouch",
	"rhsusf_100Rnd_556x45_M200_soft_pouch",
	"rhsusf_200Rnd_556x45_soft_pouch",

//M240 mag
	"rhsusf_50Rnd_762x51",
	"rhsusf_50Rnd_762x51_m61_ap",
	"rhsusf_50Rnd_762x51_m62_tracer",
	"rhsusf_50Rnd_762x51_m80a1epr",
	"rhsusf_50Rnd_762x51_m82_blank",

	"rhsusf_100Rnd_762x51",
	"rhsusf_100Rnd_762x51_m61_ap",
	"rhsusf_100Rnd_762x51_m62_tracer",
	"rhsusf_100Rnd_762x51_m80a1epr",
	"rhsusf_100Rnd_762x51_m82_blank",

//M14 mag
	"rhsusf_20Rnd_762x51_m118_special_Mag",
	"rhsusf_20Rnd_762x51_m993_Mag",

//xm2010
	"rhsusf_5Rnd_300winmag_xm2010",

/*m107
	"rhsusf_mag_10Rnd_STD_50BMG_M33",
	"rhsusf_mag_10Rnd_STD_50BMG_mk211",
*/
//mp7
	"rhsusf_mag_40Rnd_46x30_FMJ",
	"rhsusf_mag_40Rnd_46x30_JHP",
	"rhsusf_mag_40Rnd_46x30_AP",

/*annihilator
	"rhsusf_5Rnd_00Buck",
	"rhsusf_8Rnd_00Buck",
	"rhsusf_5Rnd_Slug",
	"rhsusf_8Rnd_Slug",
	"rhsusf_5Rnd_HE",
	"rhsusf_8Rnd_HE",
	"rhsusf_5Rnd_FRAG",
	"rhsusf_8Rnd_FRAG",
*/
//rockets
	"rhs_m72a7_mag",
	"rhs_m136_mag",
	"rhs_m136_hedp_mag",
	"rhs_m136_hp_mag",
	"rhs_mag_smaw_HEAA",
	"rhs_mag_smaw_HEDP",
	"rhs_weap_smaw_SR",

//missiles
	"rhs_fim92_mag",
	"rhs_fgm148_magazine_AT",
	"rhs_fgm172a_magazine_AT",
	"rhs_fgm172b_magazine_MPV",

//explosives
	"rhsusf_m112_mag",
	"rhsusf_m112x4_mag",

//mines
	"rhs_mine_M19_mag"
];

_rhs_items = [

	//misc items
//	"itemRadio",
	"itemMap",
	"itemcompass",
	"itemWatch",
	"Binocular",
	"toolkit",
//	"medikit",
//	"firstaidkit",
	"MineDetector",
	"lerca_1200_black",
	"lerca_1200_tan",
	"Leupold_Mk4",
	//nvg
	"rhsusf_ANPVS_14",
	"rhsusf_ANPVS_15",

	//- Uniforms

	// G3 Uniform
	"rhs_uniform_g3_mc",
	"rhs_uniform_g3_m81",
	"rhs_uniform_g3_tan",
	"rhs_uniform_g3_rgr",
	"rhs_uniform_g3_blk",

	// FROG
	"rhs_uniform_FROG01_d",
	"rhs_uniform_FROG01_wd",

	// Combat Uniform
	"rhs_uniform_cu_ocp",
	"rhs_uniform_cu_ucp",
	"rhs_uniform_cu_ocp_82nd",
	"rhs_uniform_cu_ocp_101st",
	"rhs_uniform_cu_ocp_10th",
	"rhs_uniform_cu_ucp_82nd",
	"rhs_uniform_cu_ucp_101st",
	"rhs_uniform_cu_ucp_10th",
	"rhs_uniform_cu_ocp_patchless",
	"rhs_uniform_cu_ucp_patchless",

	//- Vests

	//IOTV
	"rhsusf_iotv_ocp",
	"rhsusf_iotv_ocp_Grenadier",
	"rhsusf_iotv_ocp_Medic",
	"rhsusf_iotv_ocp_Repair",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ocp_SAW",
	"rhsusf_iotv_ocp_Squadleader",
	"rhsusf_iotv_ocp_teamleader",

	"rhsusf_iotv_ucp",
	"rhsusf_iotv_ucp_Grenadier",
	"rhsusf_iotv_ucp_Medic",
	"rhsusf_iotv_ucp_Repair",
	"rhsusf_iotv_ucp_Rifleman",
	"rhsusf_iotv_ucp_SAW",
	"rhsusf_iotv_ucp_Squadleader",
	"rhsusf_iotv_ucp_teamleader",

	//SPC
	"rhsusf_spc",
	"rhsusf_spc_rifleman",
	"rhsusf_spc_iar",
	"rhsusf_spc_corpsman",
	"rhsusf_spc_crewman",
	"rhsusf_spc_light",
	"rhsusf_spc_marksman",
	"rhsusf_spc_mg",
	"rhsusf_spc_squadleader",
	"rhsusf_spc_teamleader",


	//- Optic gear
	"rhs_googles_black",
	"rhs_googles_clear",
	"rhs_googles_yellow",
	"rhs_googles_orange",

	//- Headgear

	// Patrol Caps
	"rhsusf_patrolcap_ocp",
	"rhsusf_patrolcap_ucp",

	"rhs_8point_marpatd",
	"rhs_8point_marpatwd",

	// Boonie hats
	"rhs_Booniehat_ocp",
	"rhs_Booniehat_ucp",
	"rhs_Booniehat_marpatd",
	"rhs_Booniehat_marpatwd",
	"rhs_Booniehat_m81",

	"rhs_booniehat2_marpatd",
	"rhs_booniehat2_marpatwd",

	// Caps
	"rhsusf_Bowman",
	"rhsusf_Bowman_cap",


	// ACH
	"rhsusf_ach_helmet_ocp",
	"rhsusf_ach_helmet_ucp",
	"rhsusf_ach_helmet_m81",
	"rhsusf_ach_helmet_camo_ocp",
	"rhsusf_ach_helmet_headset_ocp",
	"rhsusf_ach_helmet_headset_ucp",
	"rhsusf_ach_helmet_ess_ocp",
	"rhsusf_ach_helmet_ess_ucp",
	"rhsusf_ach_helmet_headset_ess_ocp",
	"rhsusf_ach_helmet_headset_ess_ucp",
	"rhsusf_ach_helmet_ocp_norotos",
	"rhsusf_ach_helmet_ucp_norotos",
	"rhsusf_ach_bare",
	"rhsusf_ach_bare_ess",
	"rhsusf_ach_bare_headset",
	"rhsusf_ach_bare_headset_ess",
	"rhsusf_ach_bare_tan",
	"rhsusf_ach_bare_tan_ess",
	"rhsusf_ach_bare_tan_headset",
	"rhsusf_ach_bare_tan_headset_ess",
	"rhsusf_ach_bare_wood",
	"rhsusf_ach_bare_wood_ess",
	"rhsusf_ach_bare_wood_headset",
	"rhsusf_ach_bare_wood_headset_ess",
	"rhsusf_ach_bare_des",
	"rhsusf_ach_bare_des_ess",
	"rhsusf_ach_bare_des_headset",
	"rhsusf_ach_bare_des_headset_ess",
	"rhsusf_ach_bare_semi",
	"rhsusf_ach_bare_semi_ess",
	"rhsusf_ach_bare_semi_headset",
	"rhsusf_ach_bare_semi_headset_ess",


	// Opscore
	"rhsusf_opscore_fg",
	"rhsusf_opscore_fg_pelt",
	"rhsusf_opscore_fg_pelt_nsw",
	"rhsusf_opscore_fg_pelt_cam",
	"rhsusf_opscore_ut",
	"rhsusf_opscore_ut_pelt",
	"rhsusf_opscore_ut_pelt_cam",
	"rhsusf_opscore_ut_pelt_nsw",
	"rhsusf_opscore_ut_pelt_nsw_cam",
	"rhsusf_opscore_bk",
	"rhsusf_opscore_bk_pelt",
	"rhsusf_opscore_mc",
	"rhsusf_opscore_mc_pelt",
	"rhsusf_opscore_mc_pelt_nsw",
	"rhsusf_opscore_aor1",
	"rhsusf_opscore_aor1_pelt",
	"rhsusf_opscore_aor1_pelt_nsw",
	"rhsusf_opscore_aor2",
	"rhsusf_opscore_aor2_pelt",
	"rhsusf_opscore_aor2_pelt_nsw",
	"rhsusf_opscore_paint",
	"rhsusf_opscore_paint_pelt",
	"rhsusf_opscore_paint_pelt_nsw",
	"rhsusf_opscore_paint_pelt_nsw_cam",
	"rhsusf_opscore_mc_cover",
	"rhsusf_opscore_mc_cover_pelt",
	"rhsusf_opscore_mc_cover_pelt_nsw",
	"rhsusf_opscore_mc_cover_pelt_cam",
	"rhsusf_opscore_rg_cover",
	"rhsusf_opscore_rg_cover_pelt",
	"rhsusf_opscore_coy_cover",
	"rhsusf_opscore_coy_cover_pelt",

	// CVC
	"rhsusf_cvc_helmet",
	"rhsusf_cvc_ess",
	"rhsusf_cvc_green_helmet",
	"rhsusf_cvc_green_ess",

	// HGU56p
	"rhsusf_hgu56p",
	"rhsusf_hgu56p_mask",

	// USMC LWH
	"rhsusf_lwh_helmet_marpatd",
	"rhsusf_lwh_helmet_marpatd_ess",
	"rhsusf_lwh_helmet_marpatd_headset",
	"rhsusf_lwh_helmet_marpatwd",
	"rhsusf_lwh_helmet_marpatwd_ess",
	"rhsusf_lwh_helmet_marpatwd_headset",

	// USMC MICH 2000
	"rhsusf_mich_helmet_marpatwd",
	"rhsusf_mich_helmet_marpatwd_headset",
	"rhsusf_mich_helmet_marpatd",
	"rhsusf_mich_helmet_marpatd_headset",
	"rhsusf_mich_helmet_marpatwd_alt",
	"rhsusf_mich_helmet_marpatwd_alt_headset",
	"rhsusf_mich_helmet_marpatd_alt",
	"rhsusf_mich_helmet_marpatd_alt_headset",
	"rhsusf_mich_helmet_marpatwd_norotos",
	"rhsusf_mich_helmet_marpatwd_norotos_headset",
	"rhsusf_mich_helmet_marpatd_norotos",
	"rhsusf_mich_helmet_marpatd_norotos_headset",
	"rhsusf_mich_helmet_marpatwd_norotos_arc",
	"rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
	"rhsusf_mich_helmet_marpatd_norotos_arc",
	"rhsusf_mich_helmet_marpatd_norotos_arc_headset",
	"rhsusf_mich_bare",
	"rhsusf_mich_bare_headset",
	"rhsusf_mich_bare_alt",
	"rhsusf_mich_bare_norotos_alt",
	"rhsusf_mich_bare_norotos_alt_headset",
	"rhsusf_mich_bare_norotos_arc_alt",
	"rhsusf_mich_bare_norotos_arc_alt_headset",
	"rhsusf_mich_bare_norotos",
	"rhsusf_mich_bare_norotos_headset",
	"rhsusf_mich_bare_norotos_arc",
	"rhsusf_mich_bare_norotos_arc_headset",
	"rhsusf_mich_bare_tan",
	"rhsusf_mich_bare_tan_headset",
	"rhsusf_mich_bare_alt_tan",
	"rhsusf_mich_bare_norotos_tan",
	"rhsusf_mich_bare_norotos_tan_headset",
	"rhsusf_mich_bare_norotos_alt_tan",
	"rhsusf_mich_bare_norotos_alt_tan_headset",
	"rhsusf_mich_bare_norotos_arc_tan",
	"rhsusf_mich_bare_norotos_arc_tan_headset",
	"rhsusf_mich_bare_norotos_arc_alt_tan",
	"rhsusf_mich_bare_norotos_arc_alt_tan_headset",
	"rhsusf_mich_bare_semi",
	"rhsusf_mich_bare_semi_headset",
	"rhsusf_mich_bare_alt_semi",
	"rhsusf_mich_bare_norotos_semi",
	"rhsusf_mich_bare_norotos_semi_headset",
	"rhsusf_mich_bare_norotos_alt_semi",
	"rhsusf_mich_bare_norotos_alt_semi_headset",
	"rhsusf_mich_bare_norotos_arc_semi",
	"rhsusf_mich_bare_norotos_arc_semi_headset",
	"rhsusf_mich_bare_norotos_arc_alt_semi",
	"rhsusf_mich_bare_norotos_arc_alt_semi_headset",

	//accesories
	"rhs_weap_optic_smaw",

	"rhsusf_acc_compm4",

	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_LEUPOLDMK4_2",

	"rhsusf_acc_premier",

	"rhsusf_acc_HAMR",

	"rhsusf_acc_EOTECH",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_eotech_552_d",

	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ELCAN_PIP",
	"rhsusf_acc_ELCAN_ard",

	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG_PIP",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ACOG2_USMC",
	"rhsusf_acc_ACOG3_USMC",
	"rhsusf_acc_ACOG_d",
	"rhsusf_acc_SpecterDR",
	"rhsusf_acc_SpecterDR_A",
	"rhsusf_acc_SpecterDR_3d",
	"rhsusf_acc_SpecterDR_A_3d",
	"rhsusf_acc_SpecterDR_CX_3D",
	"rhsusf_acc_M2010S",
	"rhsusf_acc_SR25S",

	"rhsusf_acc_M952V",
	"rhsusf_acc_wmx",

	"rhsusf_acc_anpeq15",
	"rhsusf_acc_anpeq15_top",
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_anpeq15A",

	"rhsusf_acc_anpeq15_wmx",
	"rhsusf_acc_anpeq15_wmx_light",

	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_rotex5_tan",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_SFMB556",
	"rhsusf_acc_M2A1",

	"rhsusf_acc_harris_bipod",

	"rhsusf_acc_grip1",
	"rhsusf_acc_grip2",
	"rhsusf_acc_grip2_tan",
	"rhsusf_acc_grip3",
	"rhsusf_acc_grip3_tan"

];

_rhs_backpacks =
[
	"rhsusf_assault_eagleaiii_ucp",
	"rhsusf_assault_eagleaiii_ocp",
	"rhsusf_assault_eagleaiii_coy",
	"rhsusf_falconii"

	/*weapon bags
	"B_rhsusf_B_BACKPACK",
	"RHS_M2_Gun_Bag",
	"RHS_M2_Tripod_Bag",
	"RHS_M2_MiniTripod_Bag",
	"RHS_Mk19_Gun_Bag",
	"RHS_Mk19_Tripod_Bag",
	"rhs_Tow_Gun_Bag",
	"rhs_TOW_Tripod_Bag",
	"rhs_M252_Gun_Bag",
	"rhs_M252_Bipod_Bag"
*/
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
