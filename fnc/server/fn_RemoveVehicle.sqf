//by RIP
params ["_veh"];

uisleep RIPVEHICLEREMOVEDELAY;
if !(isNull _veh) then {deleteVehicle _veh};
