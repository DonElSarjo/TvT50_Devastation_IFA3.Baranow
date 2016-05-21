//by RIP
private ["_dialog","_PlayerViewDistance"];

disableSerialization;
_dialog = createDialog "RIP_OPTIONS";

_PlayerViewDistance = ViewDistance;
sliderSetRange [2901, 100, RIPMAXVIEWDISTANCE];
sliderSetPosition [2901, _PlayerViewDistance];
((findDisplay 2900) displayCtrl 2901) sliderSetSpeed [100,100,100];
ctrlSetText[2902,format["%1",round(_PlayerViewDistance)]];

if (RIPDISABLEGRASSPLAYER == 0) then
{
	ctrlEnable [2903, false];
	ctrlEnable [2904, false];
	ctrlEnable [2905, false];
	ctrlEnable [2906, false];
};

if (RIP3DPLAYERMARKER == 2) then
{
	ctrlEnable [2907, false];
	ctrlEnable [2908, false];
	ctrlEnable [2909, false];
};

if (RIPPLAYERMARKER == 2) then
{
	ctrlEnable [2910, false];
	ctrlEnable [2911, false];
};

if (RIPVEHICLEMARKER == 2) then
{
	ctrlEnable [2912, false];
	ctrlEnable [2913, false];
};

While {dialog} do
{
	_PlayerViewDistance = sliderPosition 2901;
	ctrlSetText[2902,format["%1",round(_PlayerViewDistance)]];
	SetViewDistance _PlayerViewDistance;
	sleep 0.5;
};
SetViewDistance _PlayerViewDistance;
setObjectViewDistance _PlayerViewDistance;
