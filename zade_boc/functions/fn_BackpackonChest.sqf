/*
 * Author: DerZade
 * Description: Removes the Backpack of a unit and adds a simular with the same items on the Chest  
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player] call ZADE_BOC_fnc_BackpackOnChest;
 *
 * Public: No
 */

_caller = _this select 0;
_pack = backpack _caller;
_cargo = backpackItems _caller;

removeBackpackGlobal _caller;

[_caller,_pack,_cargo,true] call ZADE_BOC_fnc_AddChestBackpack;