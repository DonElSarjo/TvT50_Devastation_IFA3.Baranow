//by RIP
private ["_items"];

switch (side player) do
{
	case east: { _items = [AmmoBoxE] call BIS_fnc_getVirtualItemCargo; };
	case west: { _items = [AmmoBoxW] call BIS_fnc_getVirtualItemCargo; };
};

if !(vest player in _items) then {removeVest player};
if !(headgear player in _items) then {removeHeadgear player};
if !(uniform player in _items) then {removeUniform player};
