//by RIP
private ["_object", "_type", "_typename", "_time", "_weapon", "_findRecurse", "_i", "_delay"];

_findRecurse = { private ["_root", "_class", "_path", "_currentPath","_result"];
	_root = (_this select 0);
	_path = +(_this select 1);
	_result = [];
	for "_i" from 0 to count _root -1 do {
		_class = _root select _i;
		if (isClass _class) then {
			_currentPath = _path + [_i];
			{ _result pushBack _x; } foreach getArray (_class >> "weapons");
			_class = _class >> "turrets";
			if (isClass _class) then { [_class, _currentPath] call _findRecurse; };
		};
	};
	_result;
};

_object = _this select 0;
if (isNull _object) exitWith {};

RIPSERVICING = true;
_type = typeof _object;
_typename = getText (configFile >> "CfgVehicles" >> _type >> "DisplayName");

if (_object isKindOf "Air") then {_delay = RIPAIRRELOADTIME} else {_delay = RIPLANDRELOADTIME};
_time = _delay / 60;

["RIP_Notif_Info",[format [localize "STR_RIP_HINT_STARTSERVICING",_typename,_time]]] call BIS_fnc_showNotification;

_object setFuel 0;
sleep _delay;

if !(alive _object) exitWith {};

_object setDammage 0;
_weapon = [];
_class = (configFile >> "CfgVehicles" >> _type >> "turrets");
_weapon = [_class, []] call _findRecurse;

_object setVehicleAmmo 1;
if(count _weapon > 1) then {
	for [{_i = 0},{_i < count _weapon},{_i = _i+1}] do {
		sleep 0.1;
		_object setAmmo [_weapon select _i, 10000];
	};
	sleep 0.1;
};

if (!alive _object) exitWith {};
sleep 2;
_object setFuel 1;
if (!alive _object) exitWith {};
["RIP_Notif_Info",[format [localize "STR_RIP_HINT_ENDSERVICING",_typename]]] call BIS_fnc_showNotification;
RIPSERVICING = false;
