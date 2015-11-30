_marker = _this select 0;
_dist = _this select 1;

if(!(count _this isEqualTo 2)) then
{
	_dist = 2000;
};

_nearPlayers = [];
if(typeName _marker isEqualTo "ARRAY" || typeName _marker isEqualTo "OBJECT") then
{
	{
		if(_x distance _marker < _dist) then
		{
			_nearPlayers set[count _nearPlayers,_x];
		};
	} forEach allPlayers;
}
else
{
	{
		if(_x distance (getMarkerPos _marker) < _dist) then
		{
			_nearPlayers set[count _nearPlayers,_x];
		};
	} forEach allPlayers;
};

_nearPlayers;