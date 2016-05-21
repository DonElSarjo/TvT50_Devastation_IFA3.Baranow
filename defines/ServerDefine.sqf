//by RIP

switch (worldName) do
{
	case "Chernarus": {
		RIPTARGETARRAY 	= [RTown1,RTown2,RTown3,RTown4,RTown5,RTown6,RTown7,RTown8,RTown9,RTown10,RTown11,RTown12,RTown13,RTown14,RTown15,RTown16,RTown17,RTown18,RTown19,RTown20,RTown21,RTown22,RTown23,RTown24,RTown25,RTown26,RTown27,RTown28,RTown29,RTown30];
		RIPSUNRISE 		= 4.5;
		RIPSUNSET 		= 19.5;
	};
	case "Takistan": {
		RIPTARGETARRAY 	= [RTown1,RTown2,RTown3,RTown4,RTown5,RTown6,RTown7,RTown8,RTown9,RTown10,RTown11,RTown12,RTown13,RTown14,RTown15,RTown16,RTown17,RTown18,RTown19,RTown20];
		RIPSUNRISE 		= 4.5;
		RIPSUNSET 		= 19.5;
	};
	case "Sara": {
		RIPTARGETARRAY 	= [RTown1,RTown2,RTown3,RTown4,RTown5,RTown6,RTown7,RTown8,RTown9,RTown10,RTown11,RTown12,RTown13,RTown14,RTown15,RTown16,RTown17,RTown18,RTown19,RTown20];
		RIPSUNRISE 		= 4.5;
		RIPSUNSET 		= 19.5;
	};
	case "Woodland_ACR": {
		RIPTARGETARRAY 	= [RTown1,RTown2,RTown3,RTown4,RTown5,RTown6,RTown7,RTown8,RTown9,RTown10,RTown11,RTown12,RTown13,RTown14,RTown15];
		RIPSUNRISE 		= 4.5;
		RIPSUNSET 		= 19.5;
	};
	default {
		RIPTARGETARRAY 	= [RTown1,RTown2,RTown3,RTown4,RTown5,RTown6,RTown7,RTown8,RTown9,RTown10,RTown11,RTown12,RTown13,RTown14,RTown15];
		RIPSUNRISE 		= 4.5;
		RIPSUNSET 		= 19.5;
	};
	/*default {
		RIPTARGETARRAY 	= [RTown1,RTown2,RTown3,RTown4,RTown5,RTown6,RTown7,RTown8,RTown9,RTown10,RTown11,RTown12,RTown13,RTown14,RTown15,RTown16,RTown17,RTown18,RTown19,RTown20];
		RIPSUNRISE 		= 4.5;
		RIPSUNSET 		= 19.5;
	};*/
};

RIPMHQARRAY = [
	EMHQ1,
	EMHQ2,
	WMHQ1,
	WMHQ2
];

RIPHELIARAY = [
	ETHELI1,
	WTHELI1
];

RIPRESPAWNVEHICLEARRAY = [
	EMHQ1,
	EMHQ2,
	WCAR1,
	WCAR2,
	WCAR3,
	WAPC1,
	WAPC2,
	ECAR1,
	ECAR2,
	EAPC1,
	EAPC2,
	ETHELI1,
	EFUEL1,
	WMHQ1,
	WMHQ2,
	WTHELI1,
	WFUEL1
];

RIPDESERTEDVEHICLEARRAY = [
	WCAR1,
	WCAR2,
	WCAR3,
	WAPC1,
	WAPC2,
	ECAR1,
	ECAR2,
	EAPC1,
	EAPC2
];

RIPPATROLMENS = [
	//insurgents
	"rhsgref_ins_g_specialist_aa",
	"rhsgref_ins_g_grenadier_rpg",
	"rhsgref_ins_g_sniper",
	"rhsgref_ins_g_commander",
	"rhsgref_ins_g_medic",
	"rhsgref_ins_g_engineer",
	"rhsgref_ins_g_crew",
	"rhsgref_ins_g_machinegunner",
	"rhsgref_ins_g_militiaman_mosin",
	"rhsgref_ins_g_squadleader",
	"rhsgref_ins_g_rifleman",
	"rhsgref_ins_g_rifleman_akm",
	"rhsgref_ins_g_rifleman_aksu",
	"rhsgref_ins_g_grenadier",
	"rhsgref_ins_g_rifleman_RPG26",
	"rhsgref_ins_g_saboteur",
	//CDF Ground Forces
	"rhsgref_cdf_reg_specialist_aa",
	"rhsgref_cdf_reg_grenadier_rpg",
	"rhsgref_cdf_reg_crew",
	"rhsgref_cdf_reg_engineer",
	"rhsgref_cdf_reg_general",
	"rhsgref_cdf_reg_machinegunner",
	"rhsgref_cdf_reg_marksman",
	"rhsgref_cdf_reg_medic",
	"rhsgref_cdf_reg_officer",
	"rhsgref_cdf_reg_rifleman",
	"rhsgref_cdf_reg_grenadier",
	"rhsgref_cdf_reg_rifleman_lite",
	"rhsgref_cdf_reg_rifleman_m70",
	"rhsgref_cdf_reg_squadleader",
	//CDF National Guard
	"rhsgref_cdf_ngd_grenadier_rpg",
	"rhsgref_cdf_ngd_engineer",
	"rhsgref_cdf_ngd_machinegunner",
	"rhsgref_cdf_ngd_medic",
	"rhsgref_cdf_ngd_officer",
	"rhsgref_cdf_ngd_rifleman",
	"rhsgref_cdf_ngd_rifleman_m92",
	"rhsgref_cdf_ngd_grenadier",
	"rhsgref_cdf_ngd_rifleman_lite",
	"rhsgref_cdf_ngd_squadleader",
	//Nationalist Troops Militia
	"rhsgref_nat_specialist_aa",
	"rhsgref_nat_grenadier_rpg",
	"rhsgref_nat_hunter",
	"rhsgref_nat_machinegunner",
	"rhsgref_nat_medic",
	"rhsgref_nat_militiaman_kar98k",
	"rhsgref_nat_rifleman_akms",
	"rhsgref_nat_grenadier",
	"rhsgref_nat_rifleman_m92",
	"rhsgref_nat_saboteur",
	"rhsgref_nat_scout",
	"rhsgref_nat_warlord",
	"rhsgref_nat_rifleman",
	//Nationalist Troops Paramilitia
	"rhsgref_nat_pmil_specialist_aa",
	"rhsgref_nat_pmil_hunter",
	"rhsgref_nat_pmil_machinegunner",
	"rhsgref_nat_pmil_medic",
	"rhsgref_nat_pmil_rifleman_aksu",
	"rhsgref_nat_pmil_grenadier",
	"rhsgref_nat_pmil_rifleman",
	"rhsgref_nat_pmil_scout",
	"rhsgref_nat_pmil_grenadier_rpg",
	"rhsgref_nat_pmil_rifleman_m92",
	"rhsgref_nat_pmil_saboteur"
];

RIPPATROLLIGHTVEHICLES = [
	"rhsgref_ins_g_btr60",
	"rhsgref_BRDM2_HQ",
	"rhsgref_ins_g_btr70",
	"rhsgref_ins_g_uaz",
	"rhsgref_ins_g_uaz_ags",
	"rhsgref_ins_g_uaz_spg9",
	"rhsgref_BRDM2UM_ins_g",
	"rhsgref_ins_g_uaz_dshkm_chdkz",
	"rhsgref_BRDM2_HQ_ins_g",
	"rhsgref_ins_g_uaz_open",
	"rhsgref_BRDM2_ins_g",
	"rhsgref_BRDM2_ATGM_ins_g",
	"rhsgref_ins_g_gaz66_zu23",
	"rhsgref_ins_g_ural_Zu23",
	"rhsgref_cdf_btr60",
	"rhsgref_cdf_btr70",
	"rhsgref_cdf_gaz66_zu23",
	"rhsgref_cdf_ural_Zu23",
	"rhsgref_nat_btr70",
	"rhsgref_cdf_reg_uaz",
	"rhsgref_cdf_reg_uaz_ags",
	"rhsgref_cdf_reg_uaz_dshkm",
	"rhsgref_cdf_reg_uaz_open",
	"rhsgref_cdf_reg_uaz_spg9",
	"rhsgref_BRDM2",
	"rhsgref_BRDM2_ATGM",
	"rhsgref_BRDM2UM",
	"rhsgref_nat_uaz",
	"rhsgref_nat_uaz_ags",
	"rhsgref_nat_uaz_dshkm",
	"rhsgref_nat_uaz_open",
	"rhsgref_nat_uaz_spg9",
	"rhsgref_nat_ural_Zu23"
];

RIPPATROLHARDVEHICLES = [
	"rhsgref_ins_g_zsu234",
	"rhsgref_ins_g_bmd1",
	"rhsgref_ins_g_bmd1p",
	"rhsgref_ins_g_bmd2",
	"rhsgref_ins_g_bmp1",
	"rhsgref_ins_g_bmp1d",
	"rhsgref_ins_g_bmp1k",
	"rhsgref_cdf_bmp2",
	"rhsgref_ins_g_bmp1p",
	"rhsgref_ins_g_bmp2e",
	"rhsgref_ins_g_bmp2",
	"rhsgref_ins_g_bmp2d",
	"rhsgref_ins_g_bmp2k",
	"rhsgref_cdf_zsu234",
	"rhsgref_cdf_bmd1",
	"rhsgref_cdf_bmd1k",
	"rhsgref_cdf_bmd1p",
	"rhsgref_cdf_bmd1pk",
	"rhsgref_cdf_bmp2d",
	"rhsgref_cdf_bmp2k",
	"rhsgref_cdf_bmd2",
	"rhsgref_cdf_bmd2k",
	"rhsgref_cdf_bmp1",
	"rhsgref_cdf_bmp1d",
	"rhsgref_cdf_bmp1k",
	"rhsgref_cdf_bmp1p",
	"rhsgref_cdf_bmp2e",
	"rhs_bmd1_chdkz",
	"rhs_bmd2_chdkz"
];

RIPBONUSEAST = [
	"rhs_bmp3m_msv",
	"rhs_bmp3_msv",
	"rhs_bmp3mera_msv",
	"rhs_t72bd_tv",
	"rhs_t80bk",
	"rhs_t80u",
	"rhs_t80ue1",
	"rhs_t90a_tv",
	"rhs_t80u45m"
];

RIPBONUSWEST = [
	"RHS_M2A2_wd",
	"RHS_M2A2_BUSKI_WD",
	"RHS_M2A3_wd",
	"rhsusf_m1a1aimwd_usarmy",
	"rhsusf_m1a1fep_od",
	"rhsusf_m1a1fep_wd",
	"rhsusf_m1a2sep1wd_usarmy",
	"rhsusf_m1a1aim_tuski_wd",
	"rhsusf_m1a2sep1tuskiwd_usarmy"
];

RIPMINESTYPE = [
	"LIB_MINE_SMi35_obj",
	"LIB_MINE_SMi35_1_obj",
	"LIB_Mine_PMD6_obj",
	"LIB_MINE_M3_obj",
	"LIB_MINE_US_M3_obj"
];

RIPSTATICTYPE = [
	"lib_maxim_m30_base",
	"LIB_MG42_Lafette"
];

RIPARTYTYPE = [
	"LIB_BM37",
	"LIB_GrWr34"
];
