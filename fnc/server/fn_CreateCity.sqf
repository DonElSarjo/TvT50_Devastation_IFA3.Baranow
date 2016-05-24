//by RIP
if (!isServer) exitWith {};
private ["_i", "_count", "_outpostpos", "_outpost", "_radiotowerpos", "_radiotower", "_buildings", "_building", "_roads", "_road", "_radius"];

Server setVariable ["RIPTOWNSCOREWEST",0,true];
Server setVariable ["RIPTOWNSCOREEAST",0,true];
RIPARMORREINFORCEMENTCREATED = false;
RIPLASTARMORREINFORCEMENTPOS = [0,0,0];
RIPINFREINFORCEMENTCREATED = false;
RIPAIDESTROYED = false;
Server setVariable ["RIPRADIOTOWERDOWN",false,true];
RIPSIDEFLAG1 = 2;publicVariable "RIPSIDEFLAG1";
RIPSIDEFLAG2 = 2;publicVariable "RIPSIDEFLAG2";
RIPSIDEFLAG3 = 2;publicVariable "RIPSIDEFLAG3";
Server setVariable ["RIPCITYCAPTURINGINPROGRESS",2,true];
Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",-1,true];

RIPMISSIONROADPOS = [];
_roads = RIP_TargetPosition nearRoads 1500;
_i = 0;
while {_i < (count _roads)} do {
	_road = _roads select _i;
	if ((_road distance RIP_TargetPosition) > 1000) then {
		RIPMISSIONROADPOS pushBack (getPos _road);
	};
	_i = _i + 1;
};

{
	_outpostpos = [RIP_TargetPosition, 300] call RIP_fnc_GetRandomPos;
	_i = 0;
	_radius = 200;
	while {((count (nearestObjects [_outpostpos, ["Land_Cargo_Tower_V1_No1_F", "land_lib_kostel_1"], _radius])) > 0) && (_i < 249)} do {
		_outpostpos = [RIP_TargetPosition, 300] call RIP_fnc_GetRandomPos;
		_i = _i + 1;
		if (_i > 249) then {_i = 0;_radius = _radius - 50;};
	};

	_outpost = createVehicle [_x, _outpostpos, [], 0, "NONE"];
	_outpost addEventHandler ["HandleDamage",{0}];
	if (_x isEqualTo "land_lib_kostel_1") then {
		_outpost setVectorUp [0,0,1];
	};
	switch (_forEachIndex) do {
		case 0: {
			_outpost setPosASL [
				(getPosASL _outpost select 0),
				(getPosASL _outpost select 1),
				(getPosASL _outpost select 2)-1
			];
			RIP_OutpostFlag1 setPosASL [
				(getPosASL _outpost select 0) + 6.2,
				(getPosASL _outpost select 1) - 17.3,
				(getPosASL _outpost select 2) + 18.6
			];
			RIP_OutpostFlag1 setVectorUp [0,0,1];
		};
		case 1: {
			RIP_OutpostFlag2 setPosASL [
				(getPosASL _outpost select 0),
				(getPosASL _outpost select 1),
				(getPosASL _outpost select 2)
			];
		};
		case 2: {
			RIP_OutpostFlag3 setPosASL [
				(getPosASL _outpost select 0),
				(getPosASL _outpost select 1),
				(getPosASL _outpost select 2)
			];
		};
	};
	RIPMISSIONOBJ pushBack _outpost;
	sleep 1;
} forEach ["land_lib_kostel_1","Land_BagBunker_Large_F","Land_BagBunker_Large_F"]; // change buildings to more fitting ones

sleep 1;

{
	_x setFlagTexture "";
} forEach [RIP_OutpostFlag1,RIP_OutpostFlag2,RIP_OutpostFlag3]; //set right texture

sleep 1;

_radiotowerpos = [RIP_TargetPosition, 200] call RIP_fnc_GetRandomPos;
_radiotower = createVehicle ["LIB_Static_zis6_radar", _radiotowerpos, [], 0, "NONE"]; // create right building
/* check eh again
_radiotower addEventHandler
[
	"HandleDamage",
	{
		private ["_tower", "_source"];

		_tower = _this select 0;
		_source = _this select 4;
		hint format ["Source: %1\nTarget: %2\nOther: %3", str _source, str _tower, str(_this select 3)];
		if (_source == "DemoCharge_Remote_Mag" || _source == "SatchelCharge_Remote_Mag" || _source == "rhsusf_m112_mag" || _source == "rhsusf_m112x4_mag") then
			{_tower setDamage 1}
		else
			{_tower setDamage 0}
	}
];
*/
_radiotower addEventHandler ["Killed", {[(_this select 1)] spawn RIP_fnc_RadiotowerDown;}];
RIPMISSIONOBJ pushBack _radiotower;

sleep 1;

[] call RIP_fnc_CreateArty;

sleep 1;

[] call RIP_fnc_CreateStatic;

sleep 1;

if (RIPAILIGHTVEHCOUNT > 0) then {
	if (RIPAILIGHTVEHCOUNT == 1) then {
		_count = 1 + round(random 2);
		for [{_i=0},{_i < _count},{_i=_i+1}] do {
			[] call RIP_fnc_CreateLightArmorGroup;
		};
	};
	if (RIPAILIGHTVEHCOUNT == 2) then {
		_count = 2 + round(random 2);
		for [{_i=0},{_i < _count},{_i=_i+1}] do {
			[] call RIP_fnc_CreateLightArmorGroup;
		};
	};
};

sleep 1;

if (RIPAIHEAVYVEHCOUNT > 0) then {
	if (RIPAIHEAVYVEHCOUNT == 1) then {
		_count = 1 + round(random 2);
		for [{_i=0},{_i < _count},{_i=_i+1}] do {
			[] call RIP_fnc_CreateHardArmorGroup;
		};
	};
	if (RIPAIHEAVYVEHCOUNT == 2) then {
		_count = 2 + round(random 2);
		for [{_i=0},{_i < _count},{_i=_i+1}] do {
			[] call RIP_fnc_CreateHardArmorGroup;
		};
	};
};
sleep 1;

for [{_i=0},{_i < RIPAICOUNT},{_i=_i+1}] do {
	[] call RIP_fnc_CreateInfGroup;
};

sleep 1;

[] call RIP_fnc_CreateMines;

sleep 1;

[] spawn RIP_fnc_CheckRadiotowerDown;

Server setVariable ["RIPMISSIONCOMPLETED",false,true];
Server setVariable ["RIPMISSIONCREATED",true,true];
if (RIPRANDOMTIME == 1) then {
	[] call RIP_fnc_RandomTime
};
if (true) exitWith {};
