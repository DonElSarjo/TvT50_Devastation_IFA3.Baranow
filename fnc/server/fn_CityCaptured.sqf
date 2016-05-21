// by RIP
if (!isServer) exitWith {};
private ["_townscoreeast", "_townscorewest", "_winner", "_townseast", "_townswest"];

Server setVariable ["RIPMISSIONCOMPLETED",true,true];
Server setVariable ["RIPMISSIONCREATED",false,true];

_townscoreeast = (Server getvariable "RIPTOWNSCOREEAST");
_townscorewest = (Server getvariable "RIPTOWNSCOREWEST");

_townseast = (Server getvariable "RIPALLTOWNSCOREEAST");
_townswest = (Server getvariable "RIPALLTOWNSCOREWEST");

_winner = 3;
if ((_townscoreeast > _townscorewest) && (RIPSIDEFLAG1 == 0)) then {
	RIPTARGETSERVER setVariable ["RIPTARGETSTATE",0,true];
	_winner = 0;
	_townseast = _townseast + 1;
	Server setVariable ["RIPALLTOWNSCOREEAST",_townseast,true];
};
if ((_townscoreeast < _townscorewest) && (RIPSIDEFLAG1 == 1)) then {
	RIPTARGETSERVER setVariable ["RIPTARGETSTATE",1,true];
	_winner = 1;
	_townswest = _townswest + 1;
	Server setVariable ["RIPALLTOWNSCOREWEST",_townswest,true];
};
if (_winner == 3) then {
	RIPTARGETSERVER setVariable ["RIPTARGETSTATE",3,true];
};

[_winner,_townscoreeast,_townscorewest] remoteExec ["RIP_fnc_CityCapturedClient", 0, false];
[_winner] spawn RIP_fnc_Bonus;
