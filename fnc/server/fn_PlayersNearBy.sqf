//by RIP
params ["_pos", "_dist", "_return"];

_return = false;

{
    if (_x distance _pos < _dist) exitWith {
        _return = true
    }
} forEach allPlayers;

_return
