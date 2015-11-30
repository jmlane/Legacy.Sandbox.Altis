/*
    Author: Moses

    Description:
    Retuns an objects platoon as a number or the actual member objects of a particular platoon.

    Parameter:
    SCALAR - Will return the member objects of a platoon
    OR
    OBJECT - Will return the platoon of that object as a number where 0 indicates no platoon.

    Returns:
    ARRAY - Array of platoon member objects
    OR
    SCALAR - Platoon number

    Examples:
    hintSilent format["There are %1 active players in Platoon 1",count (1 call getPlatoonInfo)];

    if (cursorTarget call getPlatoonInfo == 2) then {
        hintSilent "They are in platoon 2"
    };
*/

if (isNil 'AUSMD_platoons') then {
    //This array is an array of numbers. It will be populated with numbers only.
    //It is populated based off of defined "AUSMD_platoon*members" arrays.
    //From above defined arrays it "AUSMD_platoons" would be [1,2,3]
    AUSMD_platoons = [];
    for "_i" from 0 to 15 do {
        if !(isNil {missionNamespace getVariable format["AUSMD_platoon%1members",_i]}) then {
            AUSMD_platoons pushBack _i
        }
    };
};

if (typeName _this == "SCALAR") exitWith {
    _members = [];

    {
        if !(isNull (missionNamespace getVariable [_x,objNull])) then {
            _members pushBack (missionNamespace getVariable _x)
        };
    } forEach (missionNamespace getVariable [format["AUSMD_platoon%1members",_this],[]]);

    _members
};

if (missionNamespace getVariable ["AUSMD_platoons",[]] isEqualTo []) exitWith {
    diag_log "getPlatoonInfo: AUSMD_platoons not defined, it is required when getPlatoonInfo is passed an object";
    0
};

if (typeName _this != "OBJECT") then {
    _this = player
};

{
    _platoon = missionNamespace getVariable [format["AUSMD_platoon%1members",_x],[]];
    if (toUpper str _this in _platoon) exitWith {
        _x
    };
    0
} forEach AUSMD_platoons;