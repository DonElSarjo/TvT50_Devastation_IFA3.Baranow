//by RIP
if (alive player && player isKindOf "Man") then
{
	player addAction ["<t color='#FF0000'>"+localize "STR_RIP_TELEPORT"+"</t>", {call RIP_fnc_PlayerActions}, ["action_teleport"], 9, false, true, "", "call RIP_fnc_AddTeleportAction"];
	player addAction ["<t color='#FF0000'>"+localize "STR_RIP_HEALONMHQ"+"</t>", {call RIP_fnc_PlayerActions}, ["action_healonmhq"], 9, false, true, "", "call RIP_fnc_AddTeleportAction"];
	RIP_LIFTACTID = player addAction ["", {call RIP_fnc_PlayerActions}, ["action_lift"], 9, false, true, "", "call RIP_fnc_AddLiftAction"];
	RIP_DROPACTID = player addAction ["", {call RIP_fnc_PlayerActions}, ["action_drop"], 9, false, true, "", "call RIP_fnc_AddDropAction"];
	player addAction ["<t color='#FF0000'>"+localize "STR_RIP_UNDEPLOYMHQ"+"</t>", {call RIP_fnc_PlayerActions}, ["action_undeploymhq"], 9, false, true, "", "call RIP_fnc_AddTeleportAction"];
	player addAction ["<t color='#FF0000'>"+localize "STR_RIP_DEPLOYMHQ"+"</t>", {call RIP_fnc_PlayerActions}, ["action_deploymhq"], 9, false, true, "", "call RIP_fnc_AddDeployMHQAction"];
	player addAction ["<t color='#FF0000'>"+localize "STR_RIP_SERVICE"+"</t>", {call RIP_fnc_PlayerActions}, ["action_service"], 9, false, true, "", "call RIP_fnc_AddServiceAction"];
	player addAction ["<t color='#FF0000'>"+localize "STR_RIP_LOCKUNLOCK"+"</t>", {call RIP_fnc_PlayerActions}, ["action_unlock"], 9, false, true, "", "call RIP_fnc_AddLockUnlockAction"];
	if (vehicleVarName player in RIP_ENGINEERSLOTS) then
	{
		RIP_REPAIRACTID = player addAction ["", {call RIP_fnc_PlayerActions}, ["action_repair"], 9, false, true, "", "call RIP_fnc_AddRepairAction"];
		RIP_UNFLIPACTID = player addAction ["", {call RIP_fnc_PlayerActions}, ["action_unflip"], 9, false, true, "", "call RIP_fnc_AddRepairAction"];
	};
};
