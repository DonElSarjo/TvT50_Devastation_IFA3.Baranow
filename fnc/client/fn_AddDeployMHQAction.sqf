//by RIP
private ["_target", "_return"];

_return = false;
_target = cursorTarget;

if (_target in [EMHQ1,EMHQ2,WMHQ1,WMHQ2]) then {
	if (RIPPLAYERSIDE == getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> "side")) then {
		if (isNull attachedTo _target) then {
			if (_target getVariable "RIP_MHQDEPLOY" == 0) then {
				if ((_target distance player) < 7) then {
					if (alive player) then {
						if (alive _target) then {
							_return = true;
						};
					};
				};
			};
		};
	};
};
_return
