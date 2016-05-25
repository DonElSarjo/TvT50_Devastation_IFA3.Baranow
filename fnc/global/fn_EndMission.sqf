//by RIP
private ["_winner", "_line1", "_line2", "_line3"];

if ((Server getvariable "RIPALLTOWNSCOREWEST") < (Server getvariable "RIPALLTOWNSCOREEAST")) then {_winner = 0} else {_winner = 1};
if ((Server getvariable "RIPALLTOWNSCOREWEST") == (Server getvariable "RIPALLTOWNSCOREEAST")) then {_winner = 3};
hint "";
cutText ["","BLACK FADED",999,true];

if ((RIPPLAYERSIDE == 0) && (_winner == 0)) then { _line1 = parseText format["<t size='1.5' color='#BE0C0C'>%1</t>",localize "STR_RIP_HINT_MISSIONWIN"]; };

if ((RIPPLAYERSIDE == 1) && (_winner == 0)) then { _line1 = parseText format["<t size='1.5' color='#BE0C0C'>%1</t>",localize "STR_RIP_HINT_MISSIONLOST"]; };

if ((RIPPLAYERSIDE == 1) && (_winner == 1)) then { _line1 = parseText format["<t size='1.5' color='#BE0C0C'>%1</t>",localize "STR_RIP_HINT_MISSIONWIN"]; };

if ((RIPPLAYERSIDE == 0) && (_winner == 1)) then { _line1 = parseText format["<t size='1.5' color='#BE0C0C'>%1</t>",localize "STR_RIP_HINT_MISSIONLOST"]; };

if (_winner == 3) then { _line1 = parseText format["<t size='1.5' color='#BE0C0C'>%1</t>",localize "STR_RIP_HINT_MISSIONDRAW"]; };

_line2 = parseText format["<t size='1.1' color='#FF973D'>" + localize "STR_RIP_HINT_REDTOWNCOUNT" + "</t>", (Server getvariable "RIPALLTOWNSCOREEAST")];
_line3 = parseText format["<t size='1.1' color='#FF973D'>" + localize "STR_RIP_HINT_BLUETOWNCOUNT" + "</t>", (Server getvariable "RIPALLTOWNSCOREWEST")];
[composeText [_line1, lineBreak, _line2, lineBreak, _line3],0,0.2,7,2] spawn bis_fnc_dynamictext;
playMusic "BackgroundTrack02_F";
sleep 10;

switch (_winner) do {
	case 0: { ["RedTeamWin",true,true] call BIS_fnc_endMission };
	case 1: { ["BlueTeamWin",true,true] call BIS_fnc_endMission };
	case 3: { ["Draw",true,true] call BIS_fnc_endMission };
};
