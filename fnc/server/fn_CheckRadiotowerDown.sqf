//by RIP
private ["_timer", "_timemod"];

RIPARMORREINFORCEMENTCREATED 	= false;
RIPINFREINFORCEMENTCREATED 		= false;
_timemod = 60;
if (((count allPlayers) > 4 ) && ((count allPlayers) < 11)) then {timemod = 120};
if (((count allPlayers) > 10) && ((count allPlayers) < 16)) then {timemod = 240};
if (((count allPlayers) > 15) && ((count allPlayers) < 21)) then {timemod = 360};
if (((count allPlayers) > 20) && ((count allPlayers) < 26)) then {timemod = 480};
if (((count allPlayers) > 25) && ((count allPlayers) < 31)) then {timemod = 600};
if (((count allPlayers) > 30) && ((count allPlayers) < 41)) then {timemod = 900};
if  ((count allPlayers) > 40) then {timemod = 1200};
_timer = time + _timemod;

while {!(Server getVariable "RIPRADIOTOWERDOWN")} do {
	if (time > _timer) then {
		if (((count allPlayers) > 4 ) && ((count allPlayers) < 11)) then {timemod = 120};
		if (((count allPlayers) > 10) && ((count allPlayers) < 16)) then {timemod = 240};
		if (((count allPlayers) > 15) && ((count allPlayers) < 21)) then {timemod = 360};
		if (((count allPlayers) > 20) && ((count allPlayers) < 26)) then {timemod = 480};
		if (((count allPlayers) > 25) && ((count allPlayers) < 31)) then {timemod = 600};
		if (((count allPlayers) > 30) && ((count allPlayers) < 41)) then {timemod = 900};
		if  ((count allPlayers) > 40) then {timemod = 1200};
		_timer = time + _timemod;
		if ({alive _x} count RIPMISSIONGUARDMENS < 20) then {
			if !(RIPINFREINFORCEMENTCREATED) then {
				[] spawn RIP_fnc_CreateInfReinforcement;
			};
		};
		if ({canMove _x} count RIPMISSIONGUARDVEHICLES < 4) then {
			if !(RIPARMORREINFORCEMENTCREATED) then {
				[] spawn RIP_fnc_CreateArmorReinforcement;
			};
		};
	};
	sleep 10;
};

[] spawn RIP_fnc_CheckAIDestroyed;
