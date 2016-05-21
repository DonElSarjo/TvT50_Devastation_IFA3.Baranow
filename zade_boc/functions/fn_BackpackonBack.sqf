/*
 * Author: DerZade
 * Description: Removes the Chest-Backpack of a unit and adds a simular with the same items on the Back  
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player] call ZADE_BOC_fnc_BackpackOnBack;
 *
 * Public: No
 */

_caller = _this select 0;

_pack = _caller getVariable ["Zade_ChestBackpack",""];
_cargo = _caller getVariable ["Zade_ChestBackpack_Cargo",[]];

_caller addBackpackGlobal _pack;

{
	_caller addItemToBackpack _x;
} forEach _cargo;

[_caller] call ZADE_BOC_fnc_removeChestBackpack;