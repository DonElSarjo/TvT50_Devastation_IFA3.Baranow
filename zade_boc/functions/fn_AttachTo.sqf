/*
 * Author: DerZade
 * Description: Attaches a Backpack on the Chest of unit  
 *
 * Arguments:
 * 0: Backpack <STRING>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * ["B_Kitbag_mcamo",player] call ZADE_BOC_fnc_AttachTo;
 *
 * Public: No
 */

_pack = _this select 0;
_caller = _this select 1;
_anim = animationState _caller;

_weapon_holder = createVehicle ["groundWeaponHolder", (getPos _caller) , [], 0, "can_collide"];
_weapon_holder addBackpackCargoGlobal [_pack, 1];
_weapon_holder attachTo [_caller,[-0.1,0.75,-0.4],"pelvis"];
_weapon_holder setVectorDirAndUp [[0,0,-1],[0,1,0]];

if (_anim == "halofreefall_non") then {
	_weapon_holder attachTo [_caller,[-0.1,-0.4,-0.75],"pelvis"];
	_weapon_holder setVectorDirandup [[0,-1,0],[0,0,-1]];
};

_caller setVariable ["Zade_ChestPack",_weapon_holder];

[_pack,_caller,_weapon_holder] execVM "Zade_BOC\HandleVehicle.sqf";