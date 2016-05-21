//by RIP
private ["_veh"];

_veh = _this select 0;

player playMove "Acts_carFixingWheel";
sleep 1;
waituntil {animationState player !="acts_carfixingwheel"};
if!(alive player) exitwith {};
_veh setdamage 0;
sleep 1;
[_veh,1] remoteExec ["setFuel", _veh];
player removeItem "ToolKit";