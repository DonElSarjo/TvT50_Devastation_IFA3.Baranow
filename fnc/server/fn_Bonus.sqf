//by RIP
if (!isServer) exitWith {};
private ["_winner", "_bonusvehtype", "_bonusmarker", "_bonusindex"];

_winner = _this select 0;

_bonusindex = floor(random count RIPBONUSEAST);
if (_winner == 0 || _winner == 3) then {
	_bonusvehtype = RIPBONUSEAST select _bonusindex;
	if (_bonusvehtype isKindOf "Air") then {
		RIPBONUSAIRE = RIPBONUSAIRE + 1;
		_bonusmarker = format["RIP_BONUSAIRE_%1",RIPBONUSAIRE];
	} else {
		RIPBONUSLANDE = RIPBONUSLANDE + 1;
		_bonusmarker = format["RIP_BONUSLANDE_%1",RIPBONUSLANDE];
	};
	{
		if (side _x == EAST) then {
			_x addScore 10
		}
	} forEach allPlayers;
	[_bonusmarker, _bonusvehtype] spawn RIP_fnc_CreateBonusVehicle;
};

if (_winner == 1 || _winner == 3) then {
	_bonusvehtype = RIPBONUSWEST select _bonusindex;
	if (_bonusvehtype isKindOf "Air") then {
		RIPBONUSAIRW = RIPBONUSAIRW + 1;
		_bonusmarker = format["RIP_BONUSAIRW_%1",RIPBONUSAIRW];
	} else {
		RIPBONUSLANDW = RIPBONUSLANDW + 1;
		_bonusmarker = format["RIP_BONUSLANDW_%1",RIPBONUSLANDW];
	};
	{
		if (side _x == WEST) then {
			_x addScore 10
		}
	} forEach allPlayers;
	[_bonusmarker, _bonusvehtype] spawn RIP_fnc_CreateBonusVehicle;
};
