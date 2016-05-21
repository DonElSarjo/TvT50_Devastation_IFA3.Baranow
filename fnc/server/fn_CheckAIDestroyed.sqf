//by RIP
private ["_exit", "_trgclearcity"];

_trgclearcity = createTrigger["EmptyDetector",RIP_TargetPosition,false];
_trgclearcity setTriggerArea[300,300,0,false];
_trgclearcity setTriggerActivation["GUER","PRESENT",false];
uisleep 10;
_exit = false;

while {!_exit} do {
	if (("Man" countType list _trgclearcity) < 6) then {
		if (("LandVehicle" countType list _trgclearcity) < 1) then {
			_exit = true
		};
	};
	uisleep 5;
};
deleteVehicle _trgclearcity;
RIPAIDESTROYED = true;
[] call RIP_fnc_CheckFlagCaptured;
