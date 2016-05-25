//by RIP
if (!isServer) exitWith {};
private["_rain", "_fog", "_wind", "_overcast", "_timeforecast", "_weatherTemplates", "_weatherUpdateForecasts", "_current_weather", "_next_weather"];

if !(RIPWEATHER == 4) then {
	_weatherTemplates = [
		[0],
		[1],
		[2,3],
		[2,3,4],
		[3,4],
		[5,6],
		[5,6,7],
		[5,6]
	];
} else {
	_weatherTemplates = [
		[0,1],
		[0,1,2,3],
		[0,1,3,5],
		[1,4],
		[0,1,5],
		[0,1,6],
		[0,1],
		[0,1,6]
	];
};

//0	clear
//1	Overcast
//2	Light Rain
//3	Medium Rain
//4	Rainstorm
//5	Light Fog
//6	Medium Fog
//7	Dense Fog

switch (RIPWEATHER) do {
	case 0: {
		_current_weather = 0;
	};
	case 1: {
		_current_weather = 1;
	};
	case 2: {
		_current_weather = 2 + (floor (random 3));
	};
	case 3: {
		_current_weather = 5 + (floor (random 3));
	};
	case 4: {
		_current_weather = 1;
	};
};

while {true} do {

	_weatherUpdateForecasts = _weatherTemplates select _current_weather;
	_next_weather = _weatherUpdateForecasts select floor(random(count(_weatherUpdateForecasts)));

	switch (_next_weather) do {
		case 0: {
			_overcast = random 0.2;_rain = 0;
			_fog = 0;
			_wind = [random 1, random 1, true];
		};
		case 1: {
			_overcast = 0.2 + random 0.4;_rain = 0;
			_fog = 0;
			_wind = [random 5, random 5, true];
		};
		case 2: {
			_overcast = 0.4 + random 0.2;
			_rain = 0.2 + random 0.1;_fog = 0.05;
			_wind = [random 5, random 5, true];
		};
		case 3: {
			_overcast = 0.5 + random 0.2;
			_rain = 0.4 + random 0.1;
			_fog = 0.05;
			_wind = [random 5, random 5, true];
		};
		case 4: {
			_overcast = 0.7 + random 0.1;
			_rain = 0.8 + random 0.1;
			_fog = 0.1;
			_wind = [random 9, random 9, true];
		};
		case 5: {
			_overcast = 0.2 + random 0.2;
			_rain = 0;_fog = [0.2,0.01,10];
			_wind = [0, 0, true];
		};
		case 6: {
			_overcast = 0.2 + random 0.2;
			_rain = 0;
			_fog = [0.4,0.005,20];
			_wind = [0, 0, true];
		};
		case 7: {
			_overcast = 0.3 + random 0.2;
			_rain = 0;
			_fog = [0.4,0.0025,30];
			_wind = [0, 0, true];
		};
	};

	RIPNEWWEATHER = [_overcast, _rain, _fog, _wind];
	publicvariable "RIPNEWWEATHER";
	60 setRain (RIPNEWWEATHER select 1);
	60 setFog (RIPNEWWEATHER select 2);
	60 setOvercast (RIPNEWWEATHER select 0);
	setwind (RIPNEWWEATHER select 3);
	_current_weather = _next_weather;

	_timeforecast = 900 + random (300);
	sleep _timeforecast;
};
