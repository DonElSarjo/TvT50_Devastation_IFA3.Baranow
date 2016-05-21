//by RIP
private ["_TIon", "_lastViewDistance", "_newViewDistance"];

_TIon = false;
_lastViewDistance = viewDistance;
if (vehicle player != player) then {_newViewDistance = 2.2*RIPDISABLETI} else {_newViewDistance = RIPDISABLETI};

while {true} do
{
	if (currentVisionMode player == 2) then
	{
		if (viewDistance > _newViewDistance) then
		{
			_TIon = true;
			_lastViewDistance = viewDistance;
			if (vehicle player != player) then
				{_newViewDistance = 2.2*RIPDISABLETI}
			else
				{_newViewDistance = RIPDISABLETI};
			setViewDistance _newViewDistance;
		};
	};
	if ((currentVisionMode player != 2) && _TIon) then
	{
		setViewDistance _lastViewDistance;
		_TIon = false
	};
	sleep 0.5;
};
