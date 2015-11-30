_position = _this select 0;
_distance = _this select 1;

_return = "";
scopeName "main";
{
	scopeName "loop";
	if(_position distance (getMarkerPos _x) < _distance) then
	{
		_variableName = format["visit_%1",_x];
		_townVisits = profileNamespace getVariable [_variableName,0];
		if(_townVisits > 5) then
		{
			_return = _x;
			breakTo "main";
		};
	};
} forEach AUSMD_gridPositions;

_return;
		