//by RIP
private ["_ctrlMap", "_mhq", "_teleport_marker_name", "_teleport_marker_size", "_mapzoom"];

_mhq = _this select 0;
_teleport_marker_name = _this select 1;

"RIP_TeleportMarkerMHQ1" setMarkerPosLocal [0,0,0];"RIP_TeleportMarkerMHQ1" setMarkerSizeLocal [0,0];
"RIP_TeleportMarkerMHQ2" setMarkerPosLocal [0,0,0];"RIP_TeleportMarkerMHQ2" setMarkerSizeLocal [0,0];

_teleport_marker_size = 10;
_mapzoom = 0.003;
if (_mhq distance RIPTARGETPOS > 350) then {
	_teleport_marker_size = 50;
	_mapzoom = 0.015;
	if (_mhq distance RIPTARGETPOS > 400) then {_teleport_marker_size = 100;_mapzoom = 0.03;};
};

_teleport_marker_name setMarkerPosLocal getPos _mhq;
_teleport_marker_name setMarkerSizeLocal [_teleport_marker_size, _teleport_marker_size];

_ctrlMap = (findDisplay 4900) displayCtrl 4924;
ctrlMapAnimClear _ctrlMap;

_ctrlMap ctrlmapanimadd [0.0, 1, (position player)];
_ctrlMap ctrlmapanimadd [0.5, 1, _mhq];
_ctrlMap ctrlmapanimadd [0.5, _mapzoom, _mhq];
ctrlmapanimcommit _ctrlMap;

((uiNamespace getVariable "RIP_TELEPORTDIAL") displayCtrl 4925) ctrlSetText localize "STR_RIP_DLGTELEPORTTOOLTIP";
