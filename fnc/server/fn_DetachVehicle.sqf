//by RIP
if !(isServer) exitWith {};
params ["_veh", "_attached"];

if (count attachedObjects _veh > 0) then
{
	_attached = (attachedObjects _veh) select 0;
	detach _attached;
	[_attached,false] remoteExec ["lock", _attached];
	[_attached,(velocity _veh)] remoteExec ["setVelocity", _attached];
};
