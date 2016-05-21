//by RIP
private ["_params", "_action"];

_params = _this select 3;
_action = _params select 0;

switch (_action) do
{
    case "action_teleport":     { [cursorTarget] execVM "Scripts\DLG_Teleport.sqf"; };
    case "action_healonmhq":    { [] execVM "Scripts\Heal.sqf"; };
    case "action_lift":         { [] execVM "Scripts\Lift.sqf"; };
    case "action_drop":         { [] execVM "Scripts\Drop.sqf"; };
    case "action_undeploymhq":  { [cursorTarget] remoteExec ["RIP_fnc_UnDeployMHQ", cursorTarget]; };
    case "action_deploymhq":    { [cursorTarget] remoteExec ["RIP_fnc_DeployMHQ", cursorTarget]; };
    case "action_repair":       { [cursorTarget] execVM "Scripts\RepairVehicle.sqf"; };
    case "action_unflip":       { [cursorTarget] execVM "Scripts\UnflipVehicle.sqf"; };
    case "action_service":      { [vehicle player] execVM "Scripts\Service.sqf"; };
    case "action_unlock":       { [cursorTarget] execVM "Scripts\LockUnlock.sqf"; };
};
