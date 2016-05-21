//by RIP
private ["_target", "_return", "_targetname"];

_return = false;
_target = cursorTarget;

if (vehicle player == player) then
{
	if ("ToolKit" in (items player)) then
	{
		if (_target distance player < 7) then
		{
			if (_target isKindOf "LandVehicle" || _target isKindOf "Air" || _target isKindOf "Tank" || _target isKindOf "Car") then
			{
				_targetname = getText (configFile >> "cfgvehicles" >> typeOf _target >> "displayname");
				if (_target in [EMHQ1,WMHQ1]) then {_targetname = localize "STR_RIP_MHQ1"};
				if (_target in [EMHQ2,WMHQ2]) then {_targetname = localize "STR_RIP_MHQ2"};
				player setUserActionText [RIP_REPAIRACTID, "<t color='#FF0000'>"+format[localize "STR_RIP_FULLREPAIR",_targetname]+"</t>"];
				player setUserActionText [RIP_UNFLIPACTID, "<t color='#FF0000'>"+format[localize "STR_RIP_UNFLIP",(getText (configFile >> "cfgvehicles" >> typeOf _target >> "displayname"))]+"</t>"];
				_return = true;
			};
		};
	};
};

_return
