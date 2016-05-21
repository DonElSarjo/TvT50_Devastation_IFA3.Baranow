//by RIP
private ["_dest", "_teleporttobase", "_pos", "_dir", "_teleportmessage", "_canteleport"];

_dest = _this select 0;

_teleporttobase = true;
_canteleport = false;
if (typename _dest != "SCALAR") then {_teleporttobase = false};

if (_teleporttobase) then
{
	_teleportmessage = localize "RIP_STR_TELEPORTTOBASE";
	if (RIPPLAYERSIDE == 0) then {_pos = getPos ERIPBASESPAWN;_dir = getDir ERIPBASESPAWN;} else {_pos = getPos WRIPBASESPAWN;_dir = getDir WRIPBASESPAWN;};
	player setDamage 0;
	_canteleport = true;
}
else
{
	_teleportmessage = localize "RIP_STR_TELEPORTTOMHQ";
	_pos = (_dest select 0) ctrlMapScreenToWorld [_dest select 2,_dest select 3];
	_dir = [_pos,RIPTARGETPOS] call BIS_fnc_dirTo;

	if ((["RIP_TeleportMarkerMHQ1", _pos] call BIS_fnc_inTrigger) || (["RIP_TeleportMarkerMHQ2", _pos] call BIS_fnc_inTrigger)) then {_canteleport = true};
};

if !(_canteleport) exitWith {};
closeDialog 0;
cutText ["","BLACK FADED",1];
["<t size='1.0' color='#ffffff'>"+_teleportmessage+"</t>",0,0.4,0.3,0.3] spawn bis_fnc_dynamictext;
sleep 1;
cutText ["", "BLACK IN", 1];
player setDir _dir;
player setPos _pos;
player setFatigue 0;
