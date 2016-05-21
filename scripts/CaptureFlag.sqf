//by RIP
private ["_flag","_sideflag","_flagtexture", "_townscore", "_points", "_flagname"];

_flag = _this select 0;
_flagname = vehicleVarName _flag;

_sideflag = switch (_flagname) do
{
    case "RIP_OutpostFlag1": { RIPSIDEFLAG1 };
    case "RIP_OutpostFlag2": { RIPSIDEFLAG2 };
    case "RIP_OutpostFlag3": { RIPSIDEFLAG3 };
};

switch (RIPPLAYERSIDE) do
{
    case 0: { _flagtexture = "\rhsafrf\addons\rhs_main\data\Flag_rus_CO.paa"; };
    case 1: { _flagtexture = "\A3\Data_F\Flags\Flag_us_CO.paa"; };
};

if (_sideflag == RIPPLAYERSIDE) exitWith {};
if !(_sideflag == 2) then
    { _points = RIPRECAPTUREFLAGPOINTS; }
else
    { _points = RIPCAPTUREFLAGPOINTS; };

switch (RIPPLAYERSIDE) do
{
	case 0:
    {
		_townscore = Server getVariable "RIPTOWNSCOREEAST";
		_townscore = _townscore + _points;
		Server setVariable ["RIPTOWNSCOREEAST",_townscore,true];
	};
	case 1:
    {
		_townscore = Server getVariable "RIPTOWNSCOREWEST";
		_townscore = _townscore + _points;
		Server setVariable ["RIPTOWNSCOREWEST",_townscore,true];
	};
};

[player,_points] remoteExec ["addScore", 2];
[_flag,_flagtexture] remoteExec ["setFlagTexture", 2];

switch (_flagname) do
{
    case "RIP_OutpostFlag1": { RIPSIDEFLAG1 = RIPPLAYERSIDE;publicVariable "RIPSIDEFLAG1"; };
    case "RIP_OutpostFlag2": { RIPSIDEFLAG2 = RIPPLAYERSIDE;publicVariable "RIPSIDEFLAG2"; };
    case "RIP_OutpostFlag3": { RIPSIDEFLAG3 = RIPPLAYERSIDE;publicVariable "RIPSIDEFLAG3"; };
};
