if (isNil "BIS_fnc_establishingShot_playing") then {
    private ["_txt","_iconArray", "_colorEast", "_colorWest", "_playerPos", "_angle", "_hight"];

    // create establishing shot
    _colorEast = EAST call BIS_fnc_sideColor;
    _colorWest = WEST call BIS_fnc_sideColor;
    _playerPos = getPos (vehicle player);

    if (side player == EAST) then {
        _txt = "Basis - UDSSR";
        _iconArray = [
            ["\A3\ui_f\data\map\markers\nato\o_hq.paa", _colorEast, getMarkerPos "respawn_east", 1, 1, 0, "UDSSR HQ", 1],
            ["\A3\ui_f\data\map\markers\nato\o_service.paa", _colorEast, getMarkerPos "RIP_LANDSERVICE_MARKERE", 1, 1, 0, "Fahrzeugreperatur", 1],
            ["\A3\ui_f\data\map\markers\nato\o_installation.paa", _colorEast, getPos RIP_BASEFLAGE, 1, 1, 0, "Teleporter", 1],
            ["\A3\ui_f\data\map\markers\nato\o_installation.paa", _colorEast, getPos AmmoBoxE, 1, 1, 0, "Munitionslager", 1],
            ["\A3\ui_f\data\map\markers\nato\o_motor_inf.paa", _colorEast, getPos ECAR1, 1, 1, 0, "CAR 1", 1],
            ["\A3\ui_f\data\map\markers\nato\o_motor_inf.paa", _colorEast, getPos ECAR2, 1, 1, 0, "CAR 2", 1],
            ["\A3\ui_f\data\map\markers\nato\o_mech_inf.paa", _colorEast, getPos EAPC1, 1, 1, 0, "APC 1", 1],
            ["\A3\ui_f\data\map\markers\nato\o_mech_inf.paa", _colorEast, getPos EAPC2, 1, 1, 0, "APC 2", 1],
            ["\A3\ui_f\data\map\markers\nato\o_motor_inf.paa", _colorEast, getPos EMHQ1, 1, 1, 0, "MHQ 1", 1],
            ["\A3\ui_f\data\map\markers\nato\o_motor_inf.paa", _colorEast, getPos EMHQ2, 1, 1, 0, "MHQ 2", 1],
            ["\A3\ui_f\data\map\markers\nato\o_air.paa", _colorEast, getPos ETHELI1, 1, 1, 0, "P-2", 1],
            ["\A3\ui_f\data\map\markers\nato\o_air.paa", _colorEast, getPos ETHELI2, 1, 1, 0, "P-39", 1]
        ];
        _angle = 330;
        _hight = 80;
    } else {
        _txt = "Basis - Wehrmacht";
        _iconArray = [
        ["\A3\ui_f\data\map\markers\nato\b_hq.paa", _colorWest, getMarkerPos "respawn_west", 1, 1, 0, "Wehmacht HQ", 1],
        ["\A3\ui_f\data\map\markers\nato\b_service.paa", _colorWest, getMarkerPos "RIP_LANDSERVICE_MARKERW", 1, 1, 0, "Fahrzeugreperatur", 1],
        ["\A3\ui_f\data\map\markers\nato\b_installation.paa", _colorWest, getPos RIP_BASEFLAGW, 1, 1, 0, "Teleporter", 1],
        ["\A3\ui_f\data\map\markers\nato\b_installation.paa", _colorWest, getPos AmmoBoxW, 1, 1, 0, "Munitionslager", 1],
        ["\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", _colorWest, getPos WCAR1, 1, 1, 0, "CAR 1", 1],
        ["\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", _colorWest, getPos WCAR2, 1, 1, 0, "CAR 2", 1],
        ["\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", _colorWest, getPos WCAR3, 1, 1, 0, "CAR 3", 1],
        ["\A3\ui_f\data\map\markers\nato\b_mech_inf.paa", _colorWest, getPos WAPC1, 1, 1, 0, "APC 1", 1],
        ["\A3\ui_f\data\map\markers\nato\b_mech_inf.paa", _colorWest, getPos WAPC2, 1, 1, 0, "APC 2", 1],
        ["\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", _colorWest, getPos WMHQ1, 1, 1, 0, "MHQ 1", 1],
        ["\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", _colorWest, getPos WMHQ2, 1, 1, 0, "MHQ 2", 1],
        ["\A3\ui_f\data\map\markers\nato\b_air.paa", _colorWest, getPos WTHELI1, 1, 1, 0, "Ju-87", 1],
        ["\A3\ui_f\data\map\markers\nato\b_air.paa", _colorWest, getPos WTHELI2, 1, 1, 0, "FW-190", 1]
        ];
        _angle = 150;
        _hight = 40;
    };

    [_playerPos, _txt, _hight, 100, _angle, 1, _iconArray, 0] spawn BIS_fnc_establishingShot;

    // wait until the establishing shot is over/canceled
    waitUntil {!isnil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing}};
};
