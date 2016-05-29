#define KEY_F3 0x3D
#define KEY_F4 0x3E

if(!hasInterface) exitWith {};
waitUntil {player == player};

des_soundVolumeArray = [0.001, 0.0035, 0.005, 0.0076, 0.01, 0.016, 0.02, 0.038, 0.05, 0.065, 0.08, 0.18, 0.3, 0.7, 1];
des_global_soundCount = count des_soundVolumeArray;
des_global_soundIndex = des_global_soundCount - 1;
des_global_soundVolume = des_soundVolumeArray select des_global_soundIndex;
des_global_soundLast = 0;

des_fnc_changeSoundVolume = {
	params["_delta"];
	private["_ind"];
	des_global_soundIndex = 0 max round((des_global_soundCount - 1) min (des_global_soundIndex + _delta));
	des_global_soundVolume = 1 min (0.001 max (des_soundVolumeArray select des_global_soundIndex));
	1 fadeSound des_global_soundVolume;
	_ind = toArray ("-------------------------" select [0, des_global_soundCount]);
	_ind set [des_global_soundIndex, 124];
	des_timeToHideHint = diag_tickTime + 2;
	hintSilent parseText format ["Umgebungsgeräusche: %1<br /><t color='#00ff00' size='2'>%2</t>", des_global_soundIndex, toString _ind];
	if(isNil 'des_handler_hintHider' || {scriptDone des_handler_hintHider})then {
		des_handler_hintHider = [] spawn {
			waitUntil {
				sleep 0.3;
				diag_tickTime > des_timeToHideHint
			};
			hintSilent "";
			des_handler_hintHider = nil;};
	};
	des_global_soundLast = 0;
	true
};

["Hotkeys","des_decSoundVolume_key", "Umgebungsgeräusche [-]", {[-1] call des_fnc_changeSoundVolume}, {}, [KEY_F3, [false, false, false]]] call CBA_fnc_addKeybind;

["Hotkeys","des_incSoundVolume_key", "Umgebungsgeräusche [+]", {[1] call des_fnc_changeSoundVolume}, {}, [KEY_F4, [false, false, false]]] call CBA_fnc_addKeybind;