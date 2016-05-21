//by RIP
private ["_dialog", "_rdialog", "_mhq", "_teleportmarker"];

_mhq = _this select 0;

if !(getMarkerColor "RIP_TeleportMarkerMHQ1" == "") then {deleteMarkerLocal "RIP_TeleportMarkerMHQ1"};
if !(getMarkerColor "RIP_TeleportMarkerMHQ2" == "") then {deleteMarkerLocal "RIP_TeleportMarkerMHQ2"};
disableSerialization;
_dialog = createDialog "RIP_TELEPORT";
_rdialog = uiNamespace getVariable "RIP_TELEPORTDIAL";

_teleportmarker = createMarkerLocal ["RIP_TeleportMarkerMHQ1", [0,0,0]];
_teleportmarker setMarkerShapeLocal "ELLIPSE";
"RIP_TeleportMarkerMHQ1" setMarkerSizeLocal [0,0];
"RIP_TeleportMarkerMHQ1" setMarkerColorLocal "ColorGreen";
"RIP_TeleportMarkerMHQ1" setMarkerBrushLocal "DiagGrid";

_teleportmarker = createMarkerLocal ["RIP_TeleportMarkerMHQ2", [0,0,0]];
_teleportmarker setMarkerShapeLocal "ELLIPSE";
"RIP_TeleportMarkerMHQ2" setMarkerSizeLocal [0,0];
"RIP_TeleportMarkerMHQ2" setMarkerColorLocal "ColorGreen";
"RIP_TeleportMarkerMHQ2" setMarkerBrushLocal "DiagGrid";

ctrlEnable [4920, false];
ctrlEnable [4921, false];
ctrlEnable [4922, false];

While {dialog} do
{
	if (RIPTELEPORTTOBASE == 1) then
		{ if !(_mhq in [RIP_BASEFLAGE,RIP_BASEFLAGW]) then {ctrlEnable [4920, true]} else {ctrlEnable [4920, false]}; };

	if (RIPTELEPORTTOMHQ == 1) then
	{
		if (RIPPLAYERSIDE == 0) then
		{
			if !(_mhq == EMHQ1) then
			{
				ctrlEnable [4921, false];
				if (alive EMHQ1) then
				{
					if (EMHQ1 getVariable "RIP_MHQDEPLOY" == 1) then
					{
						if (isNull attachedTo EMHQ1) then
						{
							ctrlEnable [4921, true];
							(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGTELEPORTMHQ1";
						};
					};
				};
				if (!(ctrlEnabled 4921)) then
				{
					"RIP_TeleportMarkerMHQ1" setMarkerPosLocal [0,0,0];
					"RIP_TeleportMarkerMHQ1" setMarkerSizeLocal [0,0];
					if (EMHQ1 getVariable "RIP_MHQDEPLOY" == 0) then {(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGMHQ1UNDEPLOY"};
					if !(isNull attachedTo EMHQ1) then {(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGMHQ1UNDEPLOY"};
					if (locked EMHQ1 != 2) then {(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGMHQ1UNDEPLOY"};
					if !(alive EMHQ1) then {(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGMHQ1DESTROY"};
				};
			};

			if !(_mhq == EMHQ2) then
			{
				ctrlEnable [4922, false];
				if (alive EMHQ2) then
				{
					if (EMHQ2 getVariable "RIP_MHQDEPLOY" == 1) then
					{
						if (isNull attachedTo EMHQ2) then
						{
							ctrlEnable [4922, true];
							(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGTELEPORTMHQ2";
						};
					};
				};
				if (!(ctrlEnabled 4922)) then
				{
					"RIP_TeleportMarkerMHQ2" setMarkerPosLocal [0,0,0];
					"RIP_TeleportMarkerMHQ2" setMarkerSizeLocal [0,0];
					if (EMHQ2 getVariable "RIP_MHQDEPLOY" == 0) then {(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGMHQ2UNDEPLOY"};
					if !(isNull attachedTo EMHQ2) then {(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGMHQ2UNDEPLOY"};
					if (locked EMHQ2 != 2) then {(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGMHQ2UNDEPLOY"};
					if !(alive EMHQ2) then {(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGMHQ2DESTROY"};
				};
			};
		};

		if (RIPPLAYERSIDE == 1) then
		{
			if !(_mhq == WMHQ1) then
			{
				ctrlEnable [4921, false];
				if (alive WMHQ1) then
				{
					if (WMHQ1 getVariable "RIP_MHQDEPLOY" == 1) then
					{
						if (isNull attachedTo WMHQ1) then
						{
							ctrlEnable [4921, true];
							(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGTELEPORTMHQ1";
						};
					};
				};
				if (!(ctrlEnabled 4921)) then
				{
					"RIP_TeleportMarkerMHQ1" setMarkerPosLocal [0,0,0];
					"RIP_TeleportMarkerMHQ1" setMarkerSizeLocal [0,0];
					if (WMHQ1 getVariable "RIP_MHQDEPLOY" == 0) then {(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGMHQ1UNDEPLOY"};
					if !(isNull attachedTo WMHQ1) then {(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGMHQ1UNDEPLOY"};
					if (locked WMHQ1 != 2) then {(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGMHQ1UNDEPLOY"};
					if !(alive WMHQ1) then {(_rdialog displayCtrl 4921) ctrlSetText localize "STR_RIP_DLGMHQ1DESTROY"};
				};
			};

			if !(_mhq == WMHQ2) then
			{
				ctrlEnable [4922, false];
				if (alive WMHQ2) then
				{
					if (WMHQ2 getVariable "RIP_MHQDEPLOY" == 1) then
					{
						if (isNull attachedTo WMHQ2) then
						{
							ctrlEnable [4922, true];
							(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGTELEPORTMHQ2";
						};
					};
				};
				if (!(ctrlEnabled 4922)) then
				{
					"RIP_TeleportMarkerMHQ2" setMarkerPosLocal [0,0,0];
					"RIP_TeleportMarkerMHQ2" setMarkerSizeLocal [0,0];
					if (WMHQ2 getVariable "RIP_MHQDEPLOY" == 0) then {(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGMHQ2UNDEPLOY"};
					if !(isNull attachedTo WMHQ2) then {(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGMHQ2UNDEPLOY"};
					if (locked WMHQ2 != 2) then {(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGMHQ2UNDEPLOY"};
					if !(alive WMHQ2) then {(_rdialog displayCtrl 4922) ctrlSetText localize "STR_RIP_DLGMHQ2DESTROY"};
				};
			};
		};
	};
	sleep 0.03;
};
deleteMarkerLocal "RIP_TeleportMarkerMHQ1";
deleteMarkerLocal "RIP_TeleportMarkerMHQ2";
