removeAllWeapons player;
removeGoggles player;
removeHeadgear player;
removeVest player;
removeUniform player;
removeAllAssignedItems player;
clearAllItemsFromBackpack player;
removeBackpack player;
if (RIPPLAYERSIDE == 0) then {
	player forceAddUniform "U_LIB_SOV_Strelok";
	player addHeadgear "H_LIB_SOV_RA_PrivateCap";
} else {
	player forceAddUniform "U_LIB_GER_Soldier_camo";
	player addHeadgear "H_LIB_GER_HelmetCamo";
};
{player addWeapon _x} count ["ItemMap","ItemWatch","ItemCompass"];
