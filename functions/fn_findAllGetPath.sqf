// [<orig array>,<res path>] call KK_fnc_findAllGetPath
    private "_arr";
    _arr = _this select 0;
    {
        _arr = _arr select _x;
    } forEach (_this select 1);
    if (isNil "_arr") then [{nil},{_arr}]