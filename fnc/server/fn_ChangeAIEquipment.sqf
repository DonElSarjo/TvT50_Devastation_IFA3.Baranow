//by RIP
// needed?
if (true) exitWith {};

private ["_unit"];

_unit = _this select 0;

if !(typeOf _unit in ["rhs_g_Soldier_AA_F","rhs_g_Soldier_AT_F","rhs_g_Soldier_GL_F","rhs_g_Soldier_F","rhs_g_Soldier_F2","rhs_g_Soldier_SL_F","rhs_g_Soldier_M_F","rhs_g_Soldier_TL_F","rhs_g_Soldier_AR_F"]) exitWith {};

if ((random 1) < 0.3) exitWith {};

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;

_unit addItemToUniform "FirstAidKit";

switch (typeOf _unit) do {
	case "rhs_g_Soldier_AA_F": {
		_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
		_unit addWeapon "rhs_weap_m16a4_carryhandle";
		_unit addWeapon "rhs_weap_fim92";
	};
	case "rhs_g_Soldier_AT_F": {
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
		_unit addItemToVest "rhs_mag_nspn_red";
		_unit addWeapon "rhs_weap_m16a4_grip";
		_unit addWeapon "Chemlight_red";
	};
	case "rhs_g_Soldier_GL_F": {
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
		_unit addItemToVest "rhs_mag_M714_white";
		_unit addItemToVest "rhs_mag_m18_yellow";
		_unit addWeapon "rhs_weap_m4_m203";
	};
	case "rhs_g_Soldier_F": {
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
		_unit addItemToVest "rhs_mag_m18_yellow";
		_unit addWeapon "rhs_weap_m16a4_carryhandle_grip_pmag";
	};
	case "rhs_g_Soldier_F2": {
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
		for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
		_unit addItemToVest "rhs_mag_m18_yellow";
		_unit addWeapon "rhs_weap_m16a4_carryhandle_grip";
	};
	case "rhs_g_Soldier_SL_F": {
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
		_unit addItemToVest "rhs_mag_an_m14_th3";
		_unit addWeapon "rhs_weap_m4a1_grip";
	};
	case "rhs_g_Soldier_M_F": {
		for "_i" from 1 to 6 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m993_Mag";};
		_unit addItemToVest "rhs_mag_m18_yellow";
		_unit addWeapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
	};
	case "rhs_g_Soldier_TL_F": {
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M441_HE";};
		_unit addItemToVest "rhs_mag_M585_white";
		_unit addItemToVest "rhs_mag_mk3a2";
		_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
	};
	case "rhs_g_Soldier_AR_F": {
		removeBackpack _unit;
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addItemToUniform "rhs_mag_m18_yellow";
		_unit addBackpack "rhsusf_assault_eagleaiii_coy";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51";};
		_unit addWeapon "rhs_weap_m240B";
	};
};

_unit addWeapon "Binocular";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
