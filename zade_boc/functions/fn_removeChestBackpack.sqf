/*
 * Author: DerZade
 * Description: Removes the Chest-Backpack of a unit without adding one on his back   
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player] call ZADE_BOC_fnc_removeChestBackpack;
 *
 * Public: No
 */

_caller = _this select 0;

_caller setVariable ["Zade_ChestBackpack",""];
_caller setVariable ["Zade_ChestBackpack_Cargo",[]];
_caller forceWalk false;

_veh = _caller getVariable "Zade_ChestPack";

clearBackpackCargoGlobal _veh; 
detach _veh;
deleteVehicle _veh;
_caller setVariable ["Zade_ChestPack",nil];