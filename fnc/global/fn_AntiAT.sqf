//by RIP
private["_target", "_ammo", "_ammotype", "_shooter", "_dist", "_mindist", "_misschance", "_hitchance"];

_target = _this select 0;
_ammotype = _this select 1;
_shooter = _this select 2;
_mindist = _this select 3;

if (!local _target) exitWith {};
if !(_ammotype in RIP_ATGMMISSILE) exitWith {};

_ammo = nearestObject [_shooter,_ammotype];
_dist = _shooter distance _target;

if (_dist > _mindist) then {
	_misschance = (_mindist/_dist)*0.6;
	_hitchance = random 1;
	if (_hitchance >= _misschance) then {	
		waitUntil{((_ammo distance _target) <= 100) || (isNull _ammo)};
		"SmallSecondary" createVehicle getPosASL _ammo;
		deleteVehicle _ammo;
	};
};
