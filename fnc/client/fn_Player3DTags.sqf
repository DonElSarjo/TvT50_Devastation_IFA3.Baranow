//by RIP
private ["_color", "_scale", "_dist", "_pos", "_size"];

RIP_3DMARKERSON = true;
if !(isNil "RIP_PLAYERSTAGSHANDLE") then { terminate RIP_PLAYERSTAGSHANDLE;
	((uiNamespace getVariable 'RIP_PLAYERTAG_TEXT') displayCtrl 64435) ctrlSetStructuredText parseText "";
};

_color = getArray (configFile/'CfgInGameUI'/'SideColors'/'colorFriendly');
_scale = (0.55 / (getResolution select 5)) * 0.75;
{
	if !(visibleMap) then {
		if (RIPPLAYERSIDE == getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> "side")) then {
			_dist = [(vehicle player), _x] call BIS_fnc_distance2D;
			if (_dist < 2000) then {
				if (!isNull _x) then {
					if (alive _x) then {
						_dist = _x distance positionCameraToWorld [0,0,0];
						_pos = _x modelToWorldVisual [0, 0, 2];
						_size = (1 - ((_dist / 2000) * 0.7)) * _scale;
						switch RIP3DMARKERMODE do {
							case 1: {
								drawIcon3D
								[
									'\a3\ui_f\data\map\Markers\Military\dot_ca.paa',
									_color,
									_pos,
									_size,
									_size,
									0,
									"",
									1,
									0.02,
									'PuristaMedium'
								];
							};
							case 2: {
								drawIcon3D
								[
									'',
									_color,
									_pos,
									0,
									0,
									0,
									name _x,
									1,
									0.02,
									'PuristaMedium'
								];
							};
						};
					};
				};
			};
		};
	};
} forEach allPlayers - [player];
