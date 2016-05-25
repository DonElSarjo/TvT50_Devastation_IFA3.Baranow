//by RIP
if (!isServer) exitWith {};
private ["_multiplierDay", "_multiplierNight"];

_multiplierDay = RIPFASTTIME;
_multiplierNight = 2*RIPFASTTIME;

while {true} do {
	if (daytime >  RIPSUNRISE && daytime < RIPSUNSET) then {
		if (timeMultiplier != _multiplierDay) then {
			setTimeMultiplier _multiplierDay
		}; 
	} else {
		if (timeMultiplier != _multiplierNight) then {
			setTimeMultiplier _multiplierNight
		};
	};
	uisleep 60;
};
