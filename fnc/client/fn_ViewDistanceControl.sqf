des_max_viewDistance = paramsArray select 3;
des_viewDistanceLast = 0;

des_fnc_changeViewDistance = {
	params ["_delta"];
	private["_vd", "_ind","_icon"];

	_vd = viewDistance;
	_vd = des_max_viewDistance min (500 max (round (_vd / 500) * 500 + _delta));
	setViewDistance _vd;
	setObjectViewDistance _vd;
	_ind = toArray (" -------------------------" select [0, des_max_viewDistance / 500 + 1]);
	_ind set [_vd / 500, 124];
	if (_delta == 500) then {
		_icon = "pics\ArrowUP.paa";
	} else {
		_icon = "pics\ArrowDown.paa";
	};
	_icon = parseText format ["<br/><img size = '4' image = '%1'/><br/>", _icon];
	_sndTxt = parseText format ["<t font='TahomaB'>Sichtweite: %1m</t>", _vd];
	_sndBr = parseText format ["<t size='2'>%1</t>", toString _ind];
	_txt = composeText [_icon, lineBreak, _sndTxt, linebreak, _sndBr];
	hintSilent _txt;
	des_timeToHideHint = diag_tickTime + 2;
	if(isNil 'des_handler_hintHider' || {scriptDone des_handler_hintHider})then {
		des_handler_hintHider = [] spawn {
			waitUntil {
				sleep 0.3;
				diag_tickTime > des_timeToHideHint
			};
			hintSilent "";
			des_handler_hintHider = nil;
		};
	};
	des_viewDistanceLast = 0;
	true
};


/*
["Hotkeys","des_decViewDistance_key", "Sichtweite [-]", {[-500] call des_fncchangeViewDistance}, {}, [KEY_F1, [false, false, false]]] call CBA_fnc_addKeybind;

["Hotkeys","des_incViewDistance_key", "Sichtweite [+]", {[500] call des_fncchangeViewDistance}, {}, [KEY_F2, [false, false, false]]] call CBA_fnc_addKeybind;
