private ["_ctrlText","_nameTarget","_tagcolor","_target"];

if (isDedicated) exitWith {};

disableSerialization;
_tagcolor = getArray (configFile/'CfgInGameUI'/'SideColors'/'colorFriendly');
10 cutRsc ["RIP_PLAYERTAG", "PLAIN"];
_ctrlText = (uiNamespace getVariable 'RIP_PLAYERTAG_TEXT') displayCtrl 64435;

while {true} do {
	_ctrlText ctrlSetStructuredText parseText "";
	_target = cursorTarget;
	if !(visibleMap) then {
		if (_target isKindOf "Man") then {
			if (!isNull _target) then {
				if (alive _target) then {
					if (RIPPLAYERSIDE == getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> "side")) then {
						if ((_target distance player) < 50) then {
							_nameTarget = format["<t size='1' color=_tagcolor shadow='1'>%1</t>",(name _target)];
							_ctrlText ctrlSetStructuredText parseText _nameTarget;
						};
					};
				};
			};
		};
	};
	sleep 0.2;
};
