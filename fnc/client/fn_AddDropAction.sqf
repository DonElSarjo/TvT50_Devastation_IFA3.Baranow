//by RIP
private ["_attached", "_velocity", "_speed", "_return", "_veh", "_attachedname"];

_return = false;
_veh = vehicle player;
if (_veh != player) then {
	if (typeOf _veh in RIP_LIFTHELY) then {
		if (driver _veh == player) then {
			_velocity = velocity _veh;
			_speed = (sqrt ((_velocity select 0)^2 + (_velocity select 1)^2))*3.6;
			if (_speed < 30) then {
				if (count attachedObjects _veh > 0) then {
					_attached = (attachedObjects _veh) select 0;
					_attachedname = getText (configFile >> "cfgvehicles" >> typeOf _attached >> "displayname");
					if (_attached in [EMHQ1,WMHQ1]) then {_attachedname = localize "STR_RIP_MHQ1";};
					player setUserActionText [RIP_DROPACTID, "<t color='#FF0000'>"+format[localize "STR_RIP_LIFTDROP",_attachedname]+"</t>"];
					_return = true;
				};
			};
		};
	};
};
_return
