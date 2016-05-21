//by RIP
private ["_unit", "_headgear", "_goggles", "_uniform", "_uniformItems", "_vest", "_vestItems", "_backpack", "_backpackItems", "_primaryWeapon", "_primaryWeaponItems", "_primaryWeaponMagazine", "_secondaryWeapon", "_secondaryWeaponItems", "_secondaryWeaponMagazine", "_handgunWeapon", "_handgunItems", "_handgunMagazine", "_assignedItems"];

_unit = _this select 0;

_headgear = headgear _unit;
_goggles = goggles _unit;
_uniform = uniform _unit;
_uniformItems = uniformItems _unit;
_vest = vest _unit;
_vestItems = vestItems _unit;
_backpack = backpack _unit;
_backpackItems = backpackItems _unit;
_primaryWeapon = primaryWeapon _unit;
_primaryWeaponMagazine = primaryWeaponMagazine _unit;
_primaryWeaponItems = primaryWeaponItems _unit;
_secondaryWeapon = secondaryWeapon _unit;
_secondaryWeaponMagazine = secondaryWeaponMagazine _unit;
_secondaryWeaponItems = secondaryWeaponItems _unit;
_handgunWeapon = handgunWeapon _unit;
_handgunMagazine = handgunMagazine _unit;
_handgunItems = handgunItems _unit;
_assignedItems = assignedItems _unit;
_binocular = binocular _unit;

waitUntil {!isNull player};
waitUntil {alive player};

removeAllWeapons player;
removeGoggles player;
removeHeadgear player;
removeVest player;
removeUniform player;
removeAllAssignedItems player;
clearAllItemsFromBackpack player;
removeBackpack player;
sleep 0.5;
if(_headgear != "") then { player addHeadgear _headgear; };
if(_uniform != "") then { player forceAddUniform _uniform; };
if(_vest != "") then { player addVest _vest; };
if(_goggles != "") then { player addGoggles _goggles; };

{player addItemToUniform _x} count _uniformitems;
{player addItemToVest _x} count _vestitems;
if(_backpack != "") then
{
	player addbackpack _backpack;
	clearAllItemsFromBackpack player;
	{player addItemToBackpack _x} count _backpackItems;
};
if (_primaryWeapon != "") then
{
	{player addMagazine _x} count _primaryweaponmagazine;
	player addweapon _primaryWeapon;
	{player addPrimaryWeaponItem _x} count _primaryWeaponItems;
};
if (_secondaryWeapon != "") then
{
	{player addMagazine _x} count _secondaryWeaponMagazine;
	player addweapon _secondaryWeapon;
	{player addSecondaryWeaponItem _x} count _secondaryWeaponItems;
};
if (_handgunWeapon != "") then
{
	{player addMagazine _x} count _handgunMagazine;
	player addweapon _handgunWeapon;
	{player addHandgunItem _x} count _handgunItems;
};

{player linkItem _x} count _assignedItems;

if(_binocular != "") then { player addweapon _binocular; };
if (_primaryWeapon != "") then { player selectweapon _primaryWeapon; };
