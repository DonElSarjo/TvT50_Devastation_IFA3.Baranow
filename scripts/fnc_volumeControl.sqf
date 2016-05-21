#define KEY_F1 0x3B
#define KEY_F2 0x3C
#define KEY_F3 0x3D
#define KEY_F4 0x3E
#define KEY_F5 0x3F
#define KEY_F6 0x40

if(!hasInterface)exitWith{};
waitUntil{player == player};

kbn_soundVolumeArray = [0.001, 0.0035, 0.005, 0.0076, 0.01, 0.016, 0.02, 0.038, 0.05, 0.065, 0.08, 0.18, 0.3, 0.7, 1];
kbn_global_soundCount = count kbn_soundVolumeArray;
kbn_global_soundIndex = kbn_global_soundCount - 1;
kbn_global_soundVolume = kbn_soundVolumeArray select kbn_global_soundIndex;
kbn_global_soundLast = 0;



fnc_kbn_changeSoundVolume =
{
	params["_delta"];
	private["_ind"];
	kbn_global_soundIndex = 0 max round((kbn_global_soundCount - 1) min (kbn_global_soundIndex + _delta));
	kbn_global_soundVolume = 1 min (0.001 max (kbn_soundVolumeArray select kbn_global_soundIndex));
	[true] call ace_hearing_fnc_updateVolume_New;
	_ind = toArray ("-------------------------" select [0, kbn_global_soundCount]);
	_ind set [kbn_global_soundIndex, 124];
	kbn_timeToHideHint = diag_tickTime + 2;
	hintSilent parseText format ["Umgebungsgeräusche: %1<br /><t color='#00ff00' size='2'>%2</t>", kbn_global_soundIndex, toString _ind];
	if(isNil 'kbn_handler_hintHider' || {scriptDone kbn_handler_hintHider})then
	{
		kbn_handler_hintHider = [] spawn
		{
			waitUntil
			{
				sleep 0.3;
				diag_tickTime > kbn_timeToHideHint
			};
			hintSilent "";
			kbn_handler_hintHider = nil;};
	};
	kbn_global_soundLast = 0;
	true
};


fnc_kbn_muteSoundVolume =
{
	if(kbn_global_soundLast == 0)then
	{
		kbn_global_soundLast = kbn_global_soundIndex;
		kbn_global_soundIndex = 0 max round((kbn_global_soundCount - 1) min (kbn_global_soundIndex / 2));
	}
	else
	{
		kbn_global_soundIndex = kbn_global_soundLast;
		kbn_global_soundLast = 0;
	};
	kbn_global_soundVolume = 1 min (0.001 max (kbn_soundVolumeArray select kbn_global_soundIndex));
	[true] call ace_hearing_fnc_updateVolume_New;
	_ind = toArray ("-------------------------" select [0, kbn_global_soundCount]);
	_ind set [kbn_global_soundIndex, 124]; //"|" = 124
	kbn_timeToHideHint = diag_tickTime + 2;
	hintSilent parseText format ["Umgebungsgeräusche: %1<br /><t color='#00ff00' size='2'>%2</t>", kbn_global_soundIndex, toString _ind];
	if(isNil 'kbn_handler_hintHider' || {scriptDone kbn_handler_hintHider})then
	{
		kbn_handler_hintHider = [] spawn
		{
			waitUntil
			{
				sleep 0.3;
				diag_tickTime > kbn_timeToHideHint
			};
			hintSilent "";
			kbn_handler_hintHider = nil;};
	};
	true
};


["Hotkeys","kbn_decSoundVolume_key", "Umgebungsgeräusche [-]", {[-1] call fnc_kbn_changeSoundVolume}, {}, [KEY_F3, [false, false, false]]] call CBA_fnc_addKeybind;

["Hotkeys","kbn_incSoundVolume_key", "Umgebungsgeräusche [+]", {[1] call fnc_kbn_changeSoundVolume}, {}, [KEY_F4, [false, false, false]]] call CBA_fnc_addKeybind;

["Hotkeys","kbn_muteSoundVolume_key", "Umgebungsgeräusche [50%] (an/aus)", {call fnc_kbn_muteSoundVolume}, {}, [KEY_F3, [false, true, false]]] call CBA_fnc_addKeybind;


_fnc_findHandler =
{
	private["_found", "_search"];
	_found = -1;
	_search = str(ace_hearing_fnc_updateVolume);
	{
		if(str(_x select 0) == _search)exitWith
		{
			_found = _x select 5;
		};
	} count cba_common_perFrameHandlerArray;
	_found
};

private["_handle"];
waitUntil{_handle = call _fnc_findHandler; _handle >= 0};

[_handle] call CBA_fnc_removePerFrameHandler;


ace_hearing_fnc_updateVolume_New =
{
	(_this select 0) params ["_justUpdateVolume"];

	ace_hearing_deafnessDV = (ace_hearing_deafnessDV min 20) max 0;
	ace_hearing_volume = (1 -  (ace_hearing_deafnessDV / 20)) max 0.05;
	;

	ace_hearing_volume = ace_hearing_volume * kbn_global_soundVolume;

	if (!_justUpdateVolume) then {

		if (ace_hearing_deafnessDV - ace_hearing_deafnessPrior > 1 ||
		ace_hearing_deafnessDV > 10) then {

		if (ACE_time - ace_hearing_time3 < 3) exitWith {};
		ace_hearing_time3 = ACE_time;

		if (ace_hearing_deafnessDV > 19.75) then {
		playSound (["ACE_Combat_Deafness_Heavy", "ACE_Combat_Deafness_Heavy_NoRing"] select ace_hearing_DisableEarRinging);
		} else {
		playSound (["ACE_Combat_Deafness_Medium", "ACE_Combat_Deafness_Medium_NoRing"] select ace_hearing_DisableEarRinging);
		};
	};
	ace_hearing_deafnessPrior = ace_hearing_deafnessDV;


	ace_hearing_deafnessDV =  (ace_hearing_deafnessDV - (0.5 * (ace_hearing_volume max 0.1))) max 0;
	};

	if (missionNameSpace getVariable ["ace_hearing_disableVolumeUpdate", false]) exitWith {};

	private _volume = ace_hearing_volume;


	_volume = _volume * ace_hearing_volumeAttenuation;

	_volumeForRadio = _volume / kbn_global_soundVolume;

	if (ACE_player getVariable ["ACE_isUnconscious", false]) then {
		_volume = _volume * ace_hearing_UnconsciousnessVolume;
		_volumeForRadio = _volumeForRadio 	* ace_hearing_UnconsciousnessVolume;
	};

	private _soundTransitionTime = if (_justUpdateVolume) then {0.1} else {1};

	_soundTransitionTime fadeSound _volume;
	_soundTransitionTime fadeSpeech _volume;
	ACE_player setVariable ["tf_globalVolume", _volumeForRadio];
	if (!isNil "acre_api_fnc_setGlobalVolume") then {[_volumeForRadio^(0.33)] call acre_api_fnc_setGlobalVolume;};
};

[ace_hearing_fnc_updateVolume_New, 1, [false]] call CBA_fnc_addPerFrameHandler;
