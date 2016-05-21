//by RIP
private ["_mine", "_pos", "_typemine", "_random_point", "_dir", "_cn", "_alpha", "_dist"];

_random_point = [];
_cn = 0;
_alpha = random 90;
_dir = _alpha;
_dist = 350 + ceil(random 50);
for "_x" from 0 to 39 do
{
	_random_point = [RIP_TargetPosition, _dist, _dir] call BIS_fnc_relPos;
	_typemine = RIPMINESTYPE call BIS_fnc_selectRandom;
	_mine = createMine [_typemine, _random_point, [], 0];
	_mine setdir _dir;
	_mine setPosATL [getPosATL _mine select 0,getPosATL _mine select 1,-0.1];
	RESISTANCE revealMine _mine;
	RIPMISSIONOBJ pushBack _mine;
	_dir = _dir + 5;
	_cn = _cn + 1;
	if (_cn > 9) then {_cn = 0; _dir = _dir + 44;};
};

_cn = 0;
_dir = _alpha + 42;
for "_x" from 0 to 23 do
{
	_random_point = [RIP_TargetPosition, _dist, _dir] call BIS_fnc_relPos;
	_typemine = RIPMINESTYPE call BIS_fnc_selectRandom;
	_mine = createMine [_typemine, _random_point, [], 0];
	_mine setdir _dir;
	_mine setPosATL [getPosATL _mine select 0,getPosATL _mine select 1,-0.1];
	RESISTANCE revealMine _mine;
	RIPMISSIONOBJ pushBack _mine;
	_dir = _dir + 7;
	_cn = _cn + 1;
	if (_cn > 5) then {_cn = 0; _dir = _dir + 44;};
};
