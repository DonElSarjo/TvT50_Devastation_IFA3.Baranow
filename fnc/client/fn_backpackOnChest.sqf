#define KEY_F5 0x3F

ZADE_BOC_fnc_addChestBackpack = {
    _caller = _this select 0;
    _pack = _this select 1;
    _cargo = _this select 2;
    _force = _this select 3;
    _added = false;

    if (isNil "_force") then {
    	_force = false;
    };

    if (_caller getVariable ["Zade_ChestBackpack",""] != "" and _force) then {
    	[_caller] call ZADE_BOC_fnc_removeChestBackpack;
    };

    if (_caller getVariable ["Zade_ChestBackpack",""] == "") then {

    	_caller setVariable ["Zade_ChestBackpack",_pack];
    	_caller setVariable ["Zade_ChestBackpack_Cargo",_cargo];
    	_caller forceWalk true;

    	[_pack,_caller] call Zade_BOC_fnc_AttachTo;
    	_added = true;

    };

    _added
};

ZADE_BOC_fnc_AttachTo = {
    _pack = _this select 0;
    _caller = _this select 1;
    _anim = animationState _caller;

    _weapon_holder = createVehicle ["groundWeaponHolder", (getPos _caller) , [], 0, "can_collide"];
    _weapon_holder addBackpackCargoGlobal [_pack, 1];
    _weapon_holder attachTo [_caller,[-0.1,0.75,-0.4],"pelvis"];
    _weapon_holder setVectorDirAndUp [[0,0,-1],[0,1,0]];

    if (_anim == "halofreefall_non") then {
    	_weapon_holder attachTo [_caller,[-0.1,-0.4,-0.75],"pelvis"];
    	_weapon_holder setVectorDirandup [[0,-1,0],[0,0,-1]];
    };

    _caller setVariable ["Zade_ChestPack",_weapon_holder];

    [_pack,_caller,_weapon_holder] spawn Zade_BOC_fnc_HandleVehicle;
};

ZADE_BOC_fnc_BackpackonBack = {
    if ((_this select 0) getVariable ["Zade_ChestBackpack",""] != "" and backpack (_this select 0) == "") then {
    	_caller = player;

    	_pack = _caller getVariable ["Zade_ChestBackpack",""];
    	_cargo = _caller getVariable ["Zade_ChestBackpack_Cargo",[]];

    	_caller addBackpackGlobal _pack;

    	{
    	_caller addItemToBackpack _x;
    	} forEach _cargo;

    	[_caller] call ZADE_BOC_fnc_removeChestBackpack;
    }
};

ZADE_BOC_fnc_BackpackonChest = {
    _caller = _this select 0;
    _pack = backpack _caller;
    _cargo = backpackItems _caller;

    removeBackpackGlobal _caller;

    [_caller,_pack,_cargo,true] call ZADE_BOC_fnc_AddChestBackpack;
};
des_fnc_hint = {
    params["_state"];
    private ["_icon","_Bckpcktxt"];

    _icon = "pics\backpack.paa";
    _icon = parseText format ["<br/><img size = '3' image = '%1'/><br/>", _icon];
    switch (_state) do {
        case 0: {
            _Bckpcktxt = parseText "<t font='TahomaB'>Backpack on Chest</t>";
        };
        case 1: {
            _Bckpcktxt = parseText "<t font='TahomaB'>Backpack on Back</t>";
        };
        case -1: {
            _Bckpcktxt = parseText "<t font='TahomaB'>No Backpack</t>";
        }
    };
    _txt = composeText [_icon, lineBreak, _Bckpcktxt];
    hintSilent _txt;
};
ZADE_BOC_fnc_checkState = {
    if (backpack (_this select 0) == "" && (_this select 0) getVariable ["Zade_ChestBackpack",""] == "") exitWith {[-1] call des_fnc_hint};

    if ((_this select 0) getVariable ["Zade_ChestBackpack",""] == "" and backpack (_this select 0) != "") then {
        [player] call ZADE_BOC_fnc_BackpackOnChest;
        [0] call des_fnc_hint;
    } else {
        [player] call ZADE_BOC_fnc_BackpackOnBack;
        [1] call des_fnc_hint;
    };
};

ZADE_BOC_fnc_removeChestBackpack = {
    _caller = _this select 0;

    _caller setVariable ["Zade_ChestBackpack",""];
    _caller setVariable ["Zade_ChestBackpack_Cargo",[]];
    _caller forceWalk false;

    _veh = _caller getVariable "Zade_ChestPack";

    clearBackpackCargoGlobal _veh;
    detach _veh;
    deleteVehicle _veh;
    _caller setVariable ["Zade_ChestPack",nil];
};

ZADE_BOC_fnc_handleVehicle = {
    _pack = _this select 0;
    _caller = _this select 1;
    _weapholder = _this select 2;

    waitUntil {sleep 0.5; vehicle _caller != _caller or _pack != _caller getVariable "Zade_ChestBackpack"};

    if (_pack != _caller getVariable "Zade_ChestBackpack") exitWith {true};

    detach _weapholder;
    deleteVehicle _weapholder;

    waitUntil {sleep 0.5; vehicle _caller == _caller or _pack != _caller getVariable "Zade_ChestBackpack"};

    if (_pack != _caller getVariable "Zade_ChestBackpack") exitWith {true};

    [_pack,_caller] call Zade_BOC_fnc_AttachTo;

    if (true) exitWith {true};
};

if(!hasInterface) exitWith {};
waitUntil {player == player;};


["des_Hotkeys","des_backpackOnChest", "Backpack", {[player] call ZADE_BOC_fnc_CheckState}, {}, [KEY_F5, [false, false, true]]] call CBA_fnc_addKeybind;
