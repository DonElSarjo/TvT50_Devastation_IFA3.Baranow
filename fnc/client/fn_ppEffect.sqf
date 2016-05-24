params ["_case"];

switch (_case) do {
    //Day
    case 1: {
        "colorCorrections" ppEffectAdjust[ 1,1,0,[0,0,0,0],[2.09,1.73,0.81,1.29],[0.23,-1.03,0.62,0]];
        "colorCorrections" ppEffectCommit 1;
        "colorCorrections" ppEffectEnable true;
    };

    //Morning Evening
    case 2: {
        "colorCorrections" ppEffectAdjust[ 1,1,0,[-0.29,0.07,0.12,0],[-3.94,0.16,0.52,1.11],[0.42,1.62,-1.03,-1.23]];
        "colorCorrections" ppEffectCommit 1;
        "colorCorrections" ppEffectEnable true;
    };
    //Morning Evening 2
    case 3: {
        "colorCorrections" ppEffectAdjust [ 1,1,0,[0,0,0,0],[1.95,-0.26,0.45,1.51],[-0.06,-0.66,0.33,0]];
        "colorCorrections" ppEffectCommit 1;
        "colorCorrections" ppEffectEnable true;
    };
    //Cold Day
    case 4: {
        "colorCorrections" ppEffectAdjust[ 1,1,0,[0,0,0,0],[2.09,1.73,1.92,1.29],[-0.14,-1.03,0.62,0]];
        "colorCorrections" ppEffectCommit 1;
        "colorCorrections" ppEffectEnable true;
    };
    //Universal Braun Module
    case 5: {
        "colorCorrections" ppEffectAdjust[ 1,1,0,[0,0,0,-0.26],[1.68,0.72,0.42,0.82],[0.72,1.91,-1.19,0.12]];
        "colorCorrections" ppEffectCommit 1;
        "colorCorrections" ppEffectEnable true;
    };
    //Movie
    case 6: {
        "colorCorrections" ppEffectAdjust[ 1,1,0,[1.52,-0.82,-1.05,0],[1.22,0.98,1.12,0.7],[0.43,0.94,-0.24,0.82]];
        "colorCorrections" ppEffectCommit 1;
        "colorCorrections" ppEffectEnable true;
    };
};
