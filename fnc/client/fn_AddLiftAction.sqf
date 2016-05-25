//by RIP
private ["_velocity", "_speed", "_return", "_veh", "_list", "_attached", "_attachedname", "_canlift"];

_return = false;
_veh = vehicle player;
if (_veh != player) then {
	if (typeOf _veh in RIP_LIFTHELY) then {
		if (driver _veh == player) then {
			if !(isTouchingGround _veh) then {
				_velocity = velocity _veh;
				_speed = (sqrt ((_velocity select 0)^2 + (_velocity select 1)^2))*3.6;
				if (_speed < 10) then {
					if (count attachedObjects _veh == 0) then {
						_list = nearestObjects [_veh, ["Car", "Tank", "Ship"], 15];
						if (count _list > 0) then {
							{
								if (getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> "side") == RIPPLAYERSIDE) exitWith {_attached = _x;};
							} forEach _list;
							_attachedname = getText (configFile >> "cfgvehicles" >> typeOf _attached >> "displayname");
							if (_attached in [EMHQ1,WMHQ1]) then {_attachedname = localize "STR_RIP_MHQ1"};
							_canlift = false;
							if (_attached getVariable "RIP_MHQDEPLOY" == 0) then {_canlift = true};
							if (isNil {_attached getVariable "RIP_MHQDEPLOY"}) then {_canlift = true};
							if (_canlift) then {
								player setUserActionText [RIP_LIFTACTID, "<t color='#FF0000'>"+format[localize "STR_RIP_LIFTATTACH",_attachedname]+"</t>"];
								_return = true;
							};
						};
					};
				};
			};
		};
	};
};
_return
