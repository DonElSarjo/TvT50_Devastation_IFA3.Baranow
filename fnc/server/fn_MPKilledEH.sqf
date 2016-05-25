//by RIP
if !(isServer) exitWith {};
private ["_killer", "_killed", "_killerpoints", "_teampoints", "_townscore", "_dist", "_sidekiller", "_sidekilled", "_driverveh", "_gunnerveh", "_commanderveh"];

_killed = _this select 0;
_killer = _this select 1;

if !(_killed isKindOf "Man") then {[_killed] spawn RIP_fnc_RemoveVehicle};

if (isNull _killer) exitWith {};
if !(isPlayer _killer) exitWith {};

_sidekiller = side (group _killer);
_sidekilled = side (group _killed);

_killerpoints = 0;
_teampoints = 0;
if (_sidekiller != _sidekilled) then {
	if (isPlayer _killed) then {
			if ((isNull _killed) || (isNull _killer)) then {_dist = 500} else {_dist = (_killed distance _killer)};
			if ((_dist < 301) && (_dist > 150)) then {_killerpoints = 1};//151-300 2
			if ((_dist < 151) && (_dist > 50)) then {_killerpoints = 3};//51-150 4
			if ((_dist < 51) && (_dist > 5)) then {_killerpoints = 4};//6-50 5
			if (_dist < 6) then {_killerpoints = 9};//<5 10
			_teampoints = _killerpoints + 1;
	} else {
		if (_killed isKindOf "Man") then {
			_teampoints = 1;
		} else {
			if (_killed isKindOf "Tank_F") then {
				_teampoints = 3;
			} else {
				if (_killed isKindOf "Wheeled_APC_F") then {
					_teampoints = 3;
				} else {
					if (_killed isKindOf "Car") then {
						_teampoints = 2;
					} else {
						if (_killed isKindOf "StaticWeapon") then {
							_teampoints = 1;
						} else {
							if (_killed isKindOf "Air") then {
								_teampoints = 5;
							} else {
								if (_killed isKindOf "Ship") then {
									_teampoints = 2;
								};
							};
						};
					};
				};
			};
		};
	};

	if (vehicle _killer != _killer) then {
		_driverveh = driver vehicle _killer;
		_gunnerveh = gunner vehicle _killer;
		_commanderveh = commander vehicle _killer;

		if (isPlayer _driverveh) then {
			if (_killer != _driverveh) then {
				if (alive _driverveh) then {
					_driverveh addScore _teampoints
				};
			};
		};
		if (isPlayer _gunnerveh) then {
			if (_killer != _gunnerveh) then {
				if (alive _gunnerveh) then {
					_gunnerveh addScore _teampoints
				};
			};
		};
		if (isPlayer _commanderveh) then {
			if (_killer != _commanderveh) then {
				if (alive _commanderveh) then {
					_commanderveh addScore _teampoints
				};
			};
		};
	};

	if !(Server getVariable "RIPMISSIONCOMPLETED") then {
		if (Server getVariable "RIPMISSIONCREATED") then {
			switch (_sidekiller) do {
				case east: {
					_townscore = Server getVariable "RIPTOWNSCOREEAST";
					_townscore = _townscore + _teampoints;
					if (_townscore < 0) then {_townscore = 0};
					Server setVariable ["RIPTOWNSCOREEAST",_townscore,true];
				};
				case west: {
					_townscore = Server getVariable "RIPTOWNSCOREWEST";
					_townscore = _townscore + _teampoints;
					if (_townscore < 0) then {_townscore = 0};
					Server setVariable ["RIPTOWNSCOREWEST",_townscore,true];
				};
			};
		};
	};
};

if (_sidekiller == _sidekilled) then {
	if (isPlayer _killed) then {
		if (_killed != _killer) then {
			if (alive _killer) then {
				[_killer] remoteExec ["RIP_fnc_PunishTeamKiller", _killed];
			};
		};
	};
};

_killer addScore _killerpoints;
