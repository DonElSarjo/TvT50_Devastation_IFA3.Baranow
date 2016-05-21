private ["_info_arr", "_i", "_pos", "_log_briefing"];

_log_briefing = player createDiaryRecord ["Diary", [localize "STR_RIP_AUTHOR", localize "STR_RIP_AUTHORTEXT"]];
_log_briefing = player createDiaryRecord ["Diary", [localize "STR_RIP_CREDITS", localize "STR_RIP_CREDITSTEXT"]];
_log_briefing = player createDiaryRecord ["Diary", [localize "STR_RIP_HINT_RULES", localize "STR_RIP_HINT_RULES_STR"]];

_info_arr = "";
for "_i" from 0 to ((count (missionConfigFile >> "params")) - 1) do {
	_pos = (getarray (((missionConfigFile >> "params") select _i) >> "values")) find (paramsArray select _i);
	_info_arr = _info_arr + format ["<font color = '#60A344' size='8'>%1:</font>  <font color = '#FF0000' size='8'>%2</font><br/>", (gettext ((missionConfigFile >> "params") select _i >> "title")),((getarray (((missionConfigFile >> "params") select _i) >> "texts")) select _pos)];
};
_log_briefing = player createDiaryRecord ["Diary", [localize "STR_RIP_MISSIONPARAMS", _info_arr]];

_log_briefing = player createDiaryRecord ["Diary", [localize "STR_RIP_MISSIONINFO", localize "STR_RIP_MISSIONINFOTEXT"]];

if (side player == EAST) then {
	"RIP_LANDSERVICE_MARKERE" setMarkerTextLocal localize "STR_RIP_MARKER_SERVICEPOINT";
	"RIP_TELEPORT_MARKERE" setMarkerTextLocal localize "STR_RIP_MARKER_TELEPORT";
	deleteMarkerLocal "RIP_LANDSERVICE_MARKERW";
	deleteMarkerLocal "RIP_TELEPORT_MARKERW";
} else {
	"RIP_LANDSERVICE_MARKERW" setMarkerTextLocal localize "STR_RIP_MARKER_SERVICEPOINT";
	"RIP_TELEPORT_MARKERW" setMarkerTextLocal localize "STR_RIP_MARKER_TELEPORT";
	deleteMarkerLocal "RIP_LANDSERVICE_MARKERE";
	deleteMarkerLocal "RIP_TELEPORT_MARKERE";
};

"RIP_FORUM_MARKER" setMarkerTextLocal localize "STR_RIP_MARKER_FORUM";
"RIP_TS_MARKER" setMarkerTextLocal localize "STR_RIP_MARKER_TS";