//by RIP
private ["_lifter", "_attached"];

_lifter = vehicle player;

_attached = (attachedObjects _lifter) select 0;
detach _attached;
[_attached,false] remoteExec ["lock", _attached];
[_attached,(velocity _lifter)] remoteExec ["setVelocity", _attached];