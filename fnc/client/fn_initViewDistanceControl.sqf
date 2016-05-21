#define KEY_F1 0x3B
#define KEY_F2 0x3C
#define KEY_F3 0x3D
#define KEY_F4 0x3E
#define KEY_F5 0x3F
#define KEY_F6 0x40

if(!hasInterface)exitWith{};
waitUntil{player == player};

//определим максимальную дальность прорисовки
kbn_max_viewDistance = 3000;
kbn_viewDistanceLast = 0; //для приглушения 50% дальности

//из параметров миссии
kbn_max_viewDistance = "ViewDistance" call BIS_fnc_getParamValue;

//из настроек ACE
if(!isNil 'ACE_viewDistance_limitViewDistance')then
{
	kbn_max_viewDistance = ACE_viewDistance_limitViewDistance;
};

//из Атриума
if(!isNil 'A3A_fnc_Modules_GetSettings')then
{
	private ["_a3a_vd"];
	_a3a_vd = "VIEWDISTANCE" call A3A_fnc_Modules_GetSettings;
	if(_a3a_vd != 0)then
	{
		kbn_max_viewDistance = _a3a_vd;
	};
};

//из Серпа
if(!isNil 'SerP_viewDistance')then
{
	kbn_max_viewDistance = SerP_viewDistance;
};

//по-умолчанию 12000
if(kbn_max_viewDistance == 0)then
{
	kbn_max_viewDistance = 12000;
};

//функция изменения дальности прорисовки
fnc_kbn_changeViewDistance =
{
	params ["_delta"];
	private["_vd", "_ind"];
	//_vd = getObjectViewDistance select 0;
	_vd = viewDistance;
	_vd = kbn_max_viewDistance min (500 max (round (_vd / 500) * 500 + _delta));
	setViewDistance _vd;
	setObjectViewDistance _vd;
	_ind = toArray (" -------------------------" select [0, kbn_max_viewDistance / 500 + 1]);
	_ind set [_vd / 500, 124]; //"|" = 124
	kbn_timeToHideHint = diag_tickTime + 2;
	hintSilent parseText format ["Sichtweite: %1<br /><t color='#ffff00' size='2'>%2</t>", _vd, toString _ind];
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

	//добавим совместимость с Атриумовской системой настройки дальности: "пешком", "в транспорте", "в воздухе"
	if(!isNil 'a3a_var_viewDistance_infantry')then
	{
		_veh = vehicle player;
		if (_veh != player) then
		{
			if (_veh isKindOf "Air") then
			{
				a3a_var_viewDistance_air = _vd;
			}
			else
			{
				if (_veh isKindOf "LandVehicle") then
				{
					a3a_var_viewDistance_vehicle = _vd;
				};
			};
		}
		else
		{
			a3a_var_viewDistance_infantry = _vd;
		};
	};
	kbn_viewDistanceLast = 0;
	true
};

//фцнкция приглушения 50% дальности
fnc_kbn_muteViewDistance =
{
	private["_vd", "_ind"];
	_vd = getObjectViewDistance select 0;
	if(kbn_viewDistanceLast == 0)then
	{
		kbn_viewDistanceLast = _vd;
		_vd = kbn_max_viewDistance min (500 max (round (_vd / 2 / 500) * 500));
	}
	else
	{
		_vd = kbn_max_viewDistance min (500 max kbn_viewDistanceLast);
		kbn_viewDistanceLast = 0;
	};

	setObjectViewDistance _vd;
	setViewDistance _vd;
	_ind = toArray (" -------------------------" select [0, kbn_max_viewDistance / 500 + 1]);
	_ind set [_vd / 500, 124]; //"|" = 124
	kbn_timeToHideHint = diag_tickTime + 2;
	hintSilent parseText format ["Sichtweite: %1<br /><t color='#ffff00' size='2'>%2</t>", _vd, toString _ind];
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

	//добавим совместимость с Атриумовской системой настройки дальности: "пешком", "в транспорте", "в воздухе"
	if(!isNil 'a3a_var_viewDistance_infantry')then
	{
		_veh = vehicle player;
		if (_veh != player) then
		{
			if (_veh isKindOf "Air") then
			{
				a3a_var_viewDistance_air = _vd;
			}
			else
			{
				if (_veh isKindOf "LandVehicle") then
				{
					a3a_var_viewDistance_vehicle = _vd;
				};
			};
		}
		else
		{
			a3a_var_viewDistance_infantry = _vd;
		};
	};
	true
};

//назначим клавиши
["Hotkeys","kbn_decViewDistance_key", "Sichtweite [-]", {[-500] call fnc_kbn_changeViewDistance}, {}, [KEY_F1, [false, false, false]]] call CBA_fnc_addKeybind;

["Hotkeys","kbn_incViewDistance_key", "Sichtweite [+]", {[500] call fnc_kbn_changeViewDistance}, {}, [KEY_F2, [false, false, false]]] call CBA_fnc_addKeybind;

["Hotkeys","kbn_muteViewDistance_key", "Sichtweite [50%] (an/aus)", {call fnc_kbn_muteViewDistance}, {}, [KEY_F1, [false, true, false]]] call CBA_fnc_addKeybind;
