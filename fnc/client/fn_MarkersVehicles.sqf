//by RIP
private ["_markerveh", "_markers"];

_CreateVehMarker = {
	private ["_veh","_markername","_position","_marker","_markercolor","_markertext"];

	_veh = _this select 0;

	_markername = format ["%1Marker",_veh];
	_position = getPos _veh;
	_marker = createMarkerLocal [_markername, _position];
	_marker setMarkerShapeLocal "ICON";
	_markername setMarkerTypeLocal "mil_triangle";
	_markername setMarkerSizeLocal [0.75,0.75];
	_markername setMarkerDirLocal 180;
	if ((damage _veh) < 0.8) then {_markercolor = "ColorOrange";} else {_markercolor = "colorBLACK";};
	_markername setMarkerColorLocal _markercolor;
	_markertext = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "DisplayName");

	if (_veh in [EMHQ1,WMHQ1]) then {
		if (_veh getVariable "RIP_MHQDEPLOY" == 1) then {
			_markertext = localize "STR_RIP_MHQ1DEPLOY"
		} else {
			_markertext = localize "STR_RIP_MHQ1"
		};
	};
	if (_veh in [EMHQ2,WMHQ2]) then {
		if (_veh getVariable "RIP_MHQDEPLOY" == 1) then {
			_markertext = localize "STR_RIP_MHQ2DEPLOY"
		} else {
			_markertext = localize "STR_RIP_MHQ2"
		};
	};
	_markername setMarkerTextLocal _markertext;
	_markername
};

RIP_VEHICLESMARKERSON = true;

while {RIP_VEHICLESMARKERSON} do {
	_markers = [];
	{
		if (getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> "side") == RIPPLAYERSIDE) then {
			if (alive _x) then {
				if !(_x iskindof "ParachuteBase") then {
					if ((_x isKindOf "Tank") || (_x isKindOf "Car") || (_x isKindOf "Air")) then {
						if (RIPPLAYERMARKER == 1) then {
							if (!(isPlayer (driver _x)) && !(isPlayer (gunner _x)) && !(isPlayer (commander _x))) then {
								_markerveh = [_x] call _CreateVehMarker;
								_markers = _markers + [_markerveh];
							};
						};
						if (RIPPLAYERMARKER == 2) then {
							_markerveh = [_x] call _CreateVehMarker;
							_markers = _markers + [_markerveh];
						};
					};
				};
			};
		};
	} count vehicles;
	uisleep 5;
	{deleteMarkerLocal _x;} count _markers;
};

{deleteMarkerLocal _x;} count _markers;
