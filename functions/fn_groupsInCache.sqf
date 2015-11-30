_groupLook = _this select 0;

_return = objNull;
_occurance = 0;

{
	_group = _x select 2;
	if(_group isEqualTo _groupLook && !((_group getVariable ["AUSMD_groupObject",objNull]) isEqualTo objNull) && _occurance isEqualTo 0) then
	{
		_return = _group getVariable "AUSMD_groupObject";
		_occurance = 1;
	};
} forEach cachedUnits;
if(_return isEqualTo objNull) exitWith {"ERR"};
_return;
