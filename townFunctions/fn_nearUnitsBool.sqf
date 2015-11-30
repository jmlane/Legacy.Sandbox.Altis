_marker = _this select 0;
_dist = _this select 1;

if(!(count _this isEqualTo 2)) then
{
	_dist = 2000;
};

_nearPlayers = [_marker,_dist] call AUSMD_fnc_nearUnits;

if(count _nearPlayers > 0) then
{
	_return = true;
}
else
{
	_return = false;
};

_return;