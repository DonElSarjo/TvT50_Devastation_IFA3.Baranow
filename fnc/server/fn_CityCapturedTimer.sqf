//by RIP
if (!isServer) exitWith {};

if ((west countSide playableUnits) < 5) exitWith {[] call RIP_fnc_CityCaptured};
if ((east countSide playableUnits) < 5) exitWith {[] call RIP_fnc_CityCaptured};

Server setVariable ["RIPCITYCAPTURINGINPROGRESS",(_this select 0),true];
Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",0,true];
uisleep 60;
Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",1,true];
uisleep 60;
Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",2,true];
uisleep 60;
Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",3,true];
uisleep 60;
Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",4,true];
uisleep 60;
Server setVariable ["RIPCITYCAPTURINGINPROGRESSMIN",5,true];

[] call RIP_fnc_CityCaptured;
