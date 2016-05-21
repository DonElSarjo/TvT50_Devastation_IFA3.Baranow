//by RIP

if (!isServer) exitWith {};
if !(RIPAIDESTROYED) exitWith {};

if (RIPSIDEFLAG1 == 2) exitWith {
	if ((Server getVariable "RIPCITYCAPTURINGINPROGRESS") != 2) then {
		Server setVariable ["RIPCITYCAPTURINGINPROGRESS",2,true];
		Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",-1,true];
		terminate RIPCITYCAPTUREDTIMERHANDLE;
	};
};
if (RIPSIDEFLAG1 != RIPSIDEFLAG2) exitWith {
	if ((Server getVariable "RIPCITYCAPTURINGINPROGRESS") != 2) then {
		Server setVariable ["RIPCITYCAPTURINGINPROGRESS",2,true];
		Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",-1,true];
		terminate RIPCITYCAPTUREDTIMERHANDLE;
	};
};
if (RIPSIDEFLAG2 != RIPSIDEFLAG3) exitWith {
	if ((Server getVariable "RIPCITYCAPTURINGINPROGRESS") != 2) then {
		Server setVariable ["RIPCITYCAPTURINGINPROGRESS",2,true];
		Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",-1,true];
		terminate RIPCITYCAPTUREDTIMERHANDLE;
	};
};
RIPCITYCAPTUREDTIMERHANDLE = [RIPSIDEFLAG1] spawn RIP_fnc_CityCapturedTimer;
