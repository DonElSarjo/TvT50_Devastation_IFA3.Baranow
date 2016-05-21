//by RIP
private["_ctrlRespawn", "_ctrlExit", "_Respawntext", "_Exittext", "_i", "_NewRespawntext", "_NewExittext"];

disableSerialization;

waitUntil {!(isNull (findDisplay 49))};
_ctrlRespawn = (findDisplay 49) displayCtrl 1010;
_Respawntext = ctrlText _ctrlRespawn;
_ctrlRespawn ctrlEnable false;
_ctrlExit = (findDisplay 49) displayCtrl 104;
_Exittext = ctrlText _ctrlExit;
_ctrlExit ctrlEnable false;
if ((player distance RIP_BASEFLAGE < 1000) || (player distance RIP_BASEFLAGW < 1000)) exitWith {_ctrlRespawn ctrlEnable true;_ctrlExit ctrlEnable true;};

_i = 60;
while {!(isNull (findDisplay 49)) && _i > 0} do
{
	_NewRespawntext = _Respawntext + format ["(%1)",_i];
	_ctrlRespawn ctrlSetText _NewRespawntext;
	_NewExittext = _Exittext + format ["(%1)",_i];
	_ctrlExit ctrlSetText _NewExittext;
	_i = _i - 1;
	sleep 1;
};

_ctrlRespawn ctrlSetText _Respawntext;
_ctrlExit ctrlSetText _Exittext;
if (!(isNull (findDisplay 49))) then
{
	_ctrlRespawn ctrlEnable true;
	_ctrlExit ctrlEnable true;
	waitUntil {isNull (findDisplay 49)};
};
