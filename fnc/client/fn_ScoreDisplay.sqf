//by RIP
private ["_display", "_ctrlText", "_text", "_townscoreeast", "_townscorewest", "_flag1", "_flag2", "_flag3", "_radio", "_progressbar", "_side", "_min"];

disableSerialization;
_display = _this select 0;
_ctrlText = _display displayCtrl 64437;

waitUntil {!isNil {Server getVariable "RIPTOWNSCOREEAST"}};
waitUntil {!isNil {Server getVariable "RIPTOWNSCOREWEST"}};
waitUntil {!isNil {Server getVariable "RIPRADIOTOWERDOWN"}};
waitUntil {!isNil "RIPSIDEFLAG1"};
waitUntil {!isNil "RIPSIDEFLAG2"};
waitUntil {!isNil "RIPSIDEFLAG3"};
waitUntil {!isNil {Server getVariable "RIPCITYCAPTURINGINPROGRESS"}};
waitUntil {!isNil {Server getVariable "RIPCITYCAPTURINGINPROGRESSMIN"}};

while {true} do
{
	_text = "";
	_townscoreeast = (Server getVariable "RIPTOWNSCOREEAST");
	_townscorewest = (Server getVariable "RIPTOWNSCOREWEST");

	_flag1 = switch (RIPSIDEFLAG1) do
	{
		case 0: { "Pics\HUD\Flag_red.paa" };
		case 1: { "Pics\HUD\Flag_blue.paa" };
		case 2: { "Pics\HUD\Flag_green.paa" };
		default { "Pics\HUD\Flag_green.paa" };
	};
	_flag2 = switch (RIPSIDEFLAG2) do
	{
		case 0: { "Pics\HUD\Flag_red.paa" };
		case 1: { "Pics\HUD\Flag_blue.paa" };
		case 2: { "Pics\HUD\Flag_green.paa" };
		default { "Pics\HUD\Flag_green.paa" };
	};
	_flag3 = switch (RIPSIDEFLAG3) do
	{
		case 0: { "Pics\HUD\Flag_red.paa" };
		case 1: { "Pics\HUD\Flag_blue.paa" };
		case 2: { "Pics\HUD\Flag_green.paa" };
		default { "Pics\HUD\Flag_green.paa" };
	};
	_radio = switch (Server getVariable "RIPRADIOTOWERDOWN") do
	{
		case true: 	{ "Pics\HUD\Radio_dest.paa" };
		case false: { "Pics\HUD\Radio.paa" };
		default 	{ "Pics\HUD\Radio.paa" };
	};

	_progressbar = "Pics\ProgressBar\ProgressBar.paa";
	_side = Server getVariable "RIPCITYCAPTURINGINPROGRESS";
	_min = Server getVariable "RIPCITYCAPTURINGINPROGRESSMIN";

	if (_side == 0) then
	{
		_progressbar = switch (_min) do
		{
			case 0: { "Pics\ProgressBar\ProgressBar0.paa" };
			case 1: { "Pics\ProgressBar\ProgressBar01.paa" };
			case 2: { "Pics\ProgressBar\ProgressBar02.paa" };
			case 3: { "Pics\ProgressBar\ProgressBar03.paa" };
			case 4: { "Pics\ProgressBar\ProgressBar04.paa" };
			case 5: { "Pics\ProgressBar\ProgressBar05.paa" };
		};
	};
	if (_side == 1) then
	{
		_progressbar = switch (_min) do
		{
			case 0: { "Pics\ProgressBar\ProgressBar0.paa" };
			case 1: { "Pics\ProgressBar\ProgressBar11.paa" };
			case 2: { "Pics\ProgressBar\ProgressBar12.paa" };
			case 3: { "Pics\ProgressBar\ProgressBar13.paa" };
			case 4: { "Pics\ProgressBar\ProgressBar14.paa" };
			case 5: { "Pics\ProgressBar\ProgressBar15.paa" };
		};
	};

	_text = format ["<t><img size='2.0' align='center' shadow='0' image='Pics\HUD\ScoreBoard.paa'></t><br /><t size='1.15' color='#07A0FF' align='center'>%1</t>  <t size='1.15' color='#ff0000' align='center'>%2</t><br /><t><img size='1.0' align='center' shadow='0' image='%3'></t><t><img size='1.0' align='center' shadow='0' image='%4'></t><t><img size='1.0' align='center' shadow='0' image='%5'></t><t><img size='1.0' align='center' shadow='0' image='%6'></t><br /><t><img size='0.25' align='left' shadow='0' image='%7'></t>", _townscorewest,_townscoreeast,_radio,_flag1,_flag2,_flag3,_progressbar];

	_ctrlText ctrlSetStructuredText parseText _text;
    uisleep 0.5;
};
