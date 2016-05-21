//by RIP
if (!isServer) exitWith {};
private["_mortars", "_targets", "_delay", "_chosenTarget", "_shots", "_chosenTargetPos", "_reloadTime", "_shotRadius"];

_mortars = _this select 0;

while {({alive gunner _x} count _mortars) > 0} do {
	if (({_x getVariable "RIPArtyReloadTime" >= 0} count _mortars) > 0) then {
		_targets = [];
		{
			if (side _x in [east,west]) then {
				if (alive _x) then {
					if (RIP_TargetPosition distance _x < 1500) then {
						if (independent knowsAbout _x > 1) then {
							_targets pushBack _x;
						};
					};
				};
			};
		} forEach allPlayers;

		if (count _targets > 0) then {
			{
				if (count _targets > 0) then {
					if (alive gunner _x) then {
						_reloadTime = _x getVariable "RIPArtyReloadTime";
						if (_reloadTime > 0) then {
							_reloadTime = _reloadTime - 30;
							_x setVariable ["RIPArtyReloadTime", _reloadTime];
						} else {
							_delay = 120 + round(random 90);
							_x setVariable ["RIPArtyReloadTime", _delay];
							_chosenTarget = _targets select (floor (random (count _targets)));
							_targets = _targets - [_chosenTarget];
							_shots = 5 + round(random 5);
							_shotRadius = 200;
							if ((independent knowsAbout _x >= 2) && (independent knowsAbout _x < 3)) then {_shotRadius = 100 + round(random 100)};
							if ((independent knowsAbout _x >= 3) && (independent knowsAbout _x < 4)) then {_shotRadius = 50 + round(random 100)};
							if (independent knowsAbout _x >= 4) then {_shotRadius = 50 + round(random 50)};
							_chosenTargetPos = [(getPos _chosenTarget), _shotRadius, (random 360)] call BIS_fnc_relPos;
							_x doArtilleryFire [_chosenTargetPos, (magazines _x) select 0,  _shots];
						};
					};
				};
				sleep 0.5;
			} forEach _mortars;
		};
	};
	sleep 30;
};
