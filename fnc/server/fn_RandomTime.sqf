//by RIP
private ["_hour", "_min"];

_hour = date select 3;
if ((_hour > RIPSUNRISE) && (_hour < RIPSUNSET)) then
	{ _hour = round(random 23); }
else
	{ _hour = round(random (RIPSUNSET - RIPSUNRISE)) + RIPSUNRISE; };
	
_min = round(random 59);

setDate [2018,6,1,_hour,_min];
