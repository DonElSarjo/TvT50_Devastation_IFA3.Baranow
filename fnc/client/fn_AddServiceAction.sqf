//by RIP
private ["_veh", "_return"];

_return = false;
_veh = vehicle player;

if (_veh != player) then
{
	if (driver _veh == player) then
	{
		if ((_veh distance RIP_SERVICEFLAGE < 30) || (_veh distance RIP_SERVICEFLAGW < 30)) then
		{
			if (alive _veh) then
			{
				if (alive player) then
					{ if !(RIPSERVICING) then { _return = true; }; };
			};
		};
	};
};
_return
