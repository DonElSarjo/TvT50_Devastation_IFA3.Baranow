//by RIP
waitUntil {!isNil "paramsArray"};

RIPPLAYERSIDE = getNumber (configFile >> "CfgVehicles" >> (typeOf player) >> "side");
RIPTARGETPOS = [0,0,0];
RIPMAXVIEWDISTANCE = RIPMAXDISTANCE;
RIPSERVICING = false;
RIPTRANSFERPOINTPROCESS = false;
RIPBUYVEHICLEPROCESS = false;
enableSaving [false,false];

{
	if !(isPlayer _x) then {
		deleteVehicle _x
	}
} forEach units group player;

[] execVM "Scripts\RemoveAll.sqf";
[] spawn RIP_fnc_AddPlayerActions;

(findDisplay 46) displayAddEventHandler ["keyDown","_this call RIP_fnc_CheckKey"];
//(findDisplay 46) displayAddEventHandler ["KeyDown", {if (_this select 1 == KEY_F1) then {[-500] call des_fnc_changeViewDistance;}}];
//(findDisplay 46) displayAddEventHandler ["KeyDown", {if (_this select 1 == KEY_F2) then {[500] call des_fnc_changeViewDistance}}];
//(findDisplay 46) displayAddEventHandler ["KeyDown", {if (_this select 1 == KEY_F3) then {[-1] call des_fnc_changeSoundVolume}}];
//(findDisplay 46) displayAddEventHandler ["KeyDown", {if (_this select 1 == KEY_F4) then {[1] call des_fnc_changeSoundVolume}}];

player addEventHandler ["Respawn", {[(_this select 1)] spawn RIP_fnc_RespawnEH}];
player addEventHandler ["killed", {[(_this select 0)] spawn RIP_fnc_SaveGear}];
player addMPEventHandler ["mpkilled", {if (isServer) then {_this spawn RIP_fnc_MPKilledEH}}];
player addEventHandler ["HandleRating", {0}];
player addEventHandler ["InventoryClosed", {[] spawn RIP_fnc_ChangeEquipment}];

if (RIP3DPLAYERMARKER == 1) then {
	RIP3DMARKERMODE = 2;
	addMissionEventHandler ["Draw3D",{ [] call RIP_fnc_Player3DTags; }];
} else {
	RIP_PLAYERSTAGSHANDLE = [] spawn RIP_fnc_PlayerTags;
};
if (RIPPILOTCHECK == 1) then {[] spawn RIP_fnc_PilotCheck};
if (RIPPLAYERMARKER == 1) then {[] spawn RIP_fnc_MarkersPlayer};
if (RIPVEHICLEMARKER == 1) then {[] spawn RIP_fnc_MarkersVehicles};
if (RIP3DPERSONDISABLE == 1) then {player switchCamera "Internal";[] spawn RIP_fnc_3DPersonDisable;};
if (RIPDISABLETI > 0) then {[] spawn RIP_fnc_DisableTI};
player setCustomAimCoef 0.4;

"RIPNEWWEATHER" addPublicVariableEventHandler {
	60 setRain (RIPNEWWEATHER select 1);
	60 setFog (RIPNEWWEATHER select 2);
	60 setOvercast (RIPNEWWEATHER select 0);
};

20 cutRsc ["RIP_VEHICLECREW","PLAIN"];
21 cutRsc ["RIP_SCOREDISPLAY","PLAIN"];
10 cutText ["","BLACK IN",0];
[format[localize "STR_RIP_INTROTEXT",(name player)],0,0.5,25,0] spawn BIS_fnc_dynamicText;

waitUntil {!isNil "des_ppEffect"};
if (paramsArray select 28 == 1) then {
	[des_ppEffect] call RIP_fnc_ppEffect; //too lazy to change the tag :P
};
