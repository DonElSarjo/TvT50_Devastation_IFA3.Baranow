//by RIP
private ["_markername", "_marker", "_markernametext", "_markercolor", "_veh", "_markers"];


RIP_PLAYERSMARKERSON = true;

while {RIP_PLAYERSMARKERSON} do {
	_markers = [];
	{
		if (!isNull _x) then {
			if (alive _x) then {
				if (RIPPLAYERSIDE == getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> "side")) then {
					_markername = format["%1Marker",(vehicleVarName _x)];
					_marker = createMarkerLocal [_markername, [0,0]];
					_marker setMarkerShapeLocal "ICON";
					_markers pushBack _marker;
					if (vehicle _x == _x) then {
						_markername setMarkerTypeLocal "mil_dot";
						_markername setMarkerSizeLocal [0.75,0.75];
						_markername setMarkerDirLocal 180;

						_markernametext = (name _x);
						if (_x in (units(group player))) then {
							_markercolor = "colorGREEN"
						} else {
							_markercolor = "colorBLUE"
						};
					} else {
						_veh = vehicle _x;
						_markername setMarkerTypeLocal "mil_triangle";
						_markername setMarkerSizeLocal [0.75,0.75];
						_markername setMarkerDirLocal 180;

						_markernametext = format ["%1(%2)",(name _x),(getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "DisplayName"))];
						if (_veh in [EMHQ1,WMHQ1]) then {_markernametext = format ["%1(%2)",(name _x),localize "STR_RIP_MHQ1"];};
						if (_veh in [EMHQ2,WMHQ2]) then {_markernametext = format ["%1(%2)",(name _x),localize "STR_RIP_MHQ2"];};

						if (_x in (units(group player))) then {_markercolor="colorGREEN"}
						else {_markercolor="colorBLUE"};
					};
					_markername setMarkerColorLocal _markercolor;
					_markername setMarkerTextLocal _markernametext;
					_markername setMarkerPosLocal getPos _x;
				};
			};
		};
	} forEach allPlayers;
	uisleep 1;
	{deleteMarkerLocal _x} forEach _markers;
};

{deleteMarkerLocal _x} forEach _markers;
