//by RIP
private ["_display", "_crew", "_vehicle", "_name", "_text", "_ctrlText", "_check"];

disableSerialization;
_display = _this select 0;
_ctrlText = _display displayCtrl 64436;
_check = 0;
while {true} do {
	if(vehicle player != player) then {
		_crew = crew (vehicle player);
		_vehicle = vehicle player;
		_text = "";
		_name = getText (configFile >> "CfgVehicles" >> (typeOf vehicle player) >> "DisplayName");
		_text = format ["<t shadow='true'>%1</t><br/>", _name];

		{
			if (!isNull _x) then {
				if (alive _x) then {
					if(!(format["%1", name _x] == "") and !(format["%1", name _x] == "Error: No unit")) then {
						_role = assignedVehicleRole _x;
						switch (_x) do {
							case commander _vehicle: {
								_text = _text+format ["<t><img image='a3\ui_f\data\IGUI\Cfg\CommandBar\imagecommander_ca.paa'></t> <t shadow='true'>%1</t><br/>", name _x];
							};
							case gunner _vehicle: {
								_text = _text+format ["<t><img image='a3\ui_f\data\IGUI\Cfg\CommandBar\imagegunner_ca.paa'></t> <t shadow='true'>%1</t><br/>", name _x];
							};
							case driver _vehicle: {
								_text = _text+format ["<t><img image='a3\ui_f\data\IGUI\Cfg\CommandBar\imagedriver_ca.paa'></t> <t shadow='true'>%1</t><br/>", name _x];
							};
							default {
								if(format["%1", (_role select 0)] != "Turret") then {
									_text = _text + format ["<t><img image='a3\ui_f\data\IGUI\Cfg\CommandBar\imagecargo_ca.paa'></t> <t shadow='true'>%1</t><br/>", name _x];
								} else {
									_text = _text + format ["<t><img image='a3\ui_f\data\IGUI\Cfg\CommandBar\imagegunner_ca.paa'></t> <t shadow='true'>%1</t><br/>", name _x];
								};
							};
						};
					};
				};
			};
		} count _crew;

		_ctrlText ctrlSetStructuredText parseText _text;
		_check = 1;

	};

	if ((vehicle player == player) && (_check == 1)) then {
		_text = "";
		_ctrlText ctrlSetStructuredText parseText _text;
		_check = 0;
	};
	uisleep 0.5;
};
