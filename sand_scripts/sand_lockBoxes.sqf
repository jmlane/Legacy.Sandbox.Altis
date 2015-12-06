["PHQ1",["PL1","PS1","RO1","CM1","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["PHQ2",["PL2","PS2","RO2","CM2","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["PHQ3",["PL3","PS3","RO3","CM3","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["RSE1",["PL1","PS1","RO1","CM1","A11","A12","A13","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["RSE2",["PL2","PS2","RO2","CM2","A21","A22","A23","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["RSE3",["PL3","PS3","RO3","CM3","A31","A32","A33","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["RSL1",["PL1","PS1","RO1","CM1","A11","A12","A13","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["RSL2",["PL2","PS2","RO2","CM2","A21","A22","A23","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["RSL3",["PL3","PS3","RO3","CM3","A31","A32","A33","HQ6","HQ5","HQ4","OPS"]] call MOSES_fnc_accessInfo;
["RS1",["HQ6","HQ5","HQ4","OPS","PL1","PS1","A11","A11A","A11B","A113","A114","A116","A117"]] call MOSES_fnc_accessInfo;
["RS2",["HQ6","HQ5","HQ4","OPS","PL1","PS1","A12","A12A","A12B","A123","A124","A126","A127"]] call MOSES_fnc_accessInfo;
["RS3",["HQ6","HQ5","HQ4","OPS","PL1","PS1","A13","A13A","A13B","A133","A134","A136","A137"]] call MOSES_fnc_accessInfo;
["RS4",["HQ6","HQ5","HQ4","OPS","PL2","PS2","A21","A21A","A21B","A213","A214","A216","A217"]] call MOSES_fnc_accessInfo;
["RS5",["HQ6","HQ5","HQ4","OPS","PL2","PS2","A22","A22A","A22B","A223","A224","A226","A227"]] call MOSES_fnc_accessInfo;
["RS6",["HQ6","HQ5","HQ4","OPS","PL2","PS2","A23","A23A","A23B","A233","A234","A236","A237"]] call MOSES_fnc_accessInfo;
["RS7",["HQ6","HQ5","HQ4","OPS","PL3","PS3","A31","A31A","A31B","A313","A314","A316","A317"]] call MOSES_fnc_accessInfo;
["RS8",["HQ6","HQ5","HQ4","OPS","PL3","PS3","A32","A32A","A32B","A323","A324","A326","A327"]] call MOSES_fnc_accessInfo;
["RS9",["HQ6","HQ5","HQ4","OPS","PL3","PS3","A33","A33A","A33B","A333","A334","A336","A337"]] call MOSES_fnc_accessInfo;
["CHQ",["HQ6","HQ5","HQ4","OPS","RO6","CM6","HP1","HP2","HP3"]] call MOSES_fnc_accessInfo;
["CHE",["WSL","ASL","WS1","WS2","WS3","WS4","HQ6","HQ5","HQ4","OPS","RO6","CM6"]] call MOSES_fnc_accessInfo;
["CHW",["WSL","ASL","WS1","WS2","WS3","WS4","HQ6","HQ5","HQ4","OPS","RO6","CM6"]] call MOSES_fnc_accessInfo;
["CWB",["WSL","ASL","WS1","WS2","WS3","WS4","HQ6","HQ5","HQ4","OPS","RO6","CM6"]] call MOSES_fnc_accessInfo;
["CWA",["WSL","ASL","WS1","WS2","WS3","WS4","HQ6","HQ5","HQ4","OPS","RO6","CM6"]] call MOSES_fnc_accessInfo;

#define AUSMD_BOX_ACCESS ["PL1","PL2","PL3","PS1","PS2","PS3","OPS","HQ4","HQ5","HQ6"]
["AUSMD_buyBox",AUSMD_BOX_ACCESS] call MOSES_fnc_accessInfo;
["AUSMD_box",AUSMD_BOX_ACCESS] call MOSES_fnc_accessInfo;

player addEventHandler ["InventoryOpened",{
    {
        if !(_x call MOSES_fnc_accessInfo) exitWith {
            hintSilent "You do not have access to this group box";
            TRUE
        };
        FALSE
    } forEach ([_this select 1] + (player nearSupplies 1.5))
}];
