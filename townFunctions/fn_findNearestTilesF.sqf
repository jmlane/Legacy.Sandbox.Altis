_position = _this select 0;
_distance = _this select 1;

_return = [];
_count = 0;
scopeName "main";
{
	if(_position distance (getMarkerPos _x) < _distance) then
	{
		_variableName = format["visit_%1",_x];
		_townVisits = profileNamespace getVariable [_variableName,0];
		if(_townVisits > 5 && !(_count isEqualTo 4)) then
		{
			_return set[count _return,_x];
			diag_log format["NEAREST TILES F :: FOUND %1",_x];
			_count = _count + 1;
		};
		if(_count isEqualTo 4) then
		{
			breakTo "main";
			diag_log "Breaking to Main";
		};
	};
} forEach AUSMD_gridPositions;
hint "testing";
diag_log format["NEAREST TILES F :: %1 - %2",_return,_count];

if(_count != 4) then
{
	diag_log "NEAREST TILES F :: Adding more distance 1";
	_distance = _distance + 1000;
	{
		if(_position distance (getMarkerPos _x) < _distance) then
		{
			_variableName = format["visit_%1",_x];
			_townVisits = profileNamespace getVariable [_variableName,0];
			if(_townVisits > 5 && !(_count isEqualTo 4)) then
			{
				_return set[count _return,_x];
				_count = _count + 1;
			};
			if(_count isEqualTo 4) then
			{
				breakTo "main";
			};
		};
	} forEach AUSMD_gridPositions;
};

if(_count != 4) then
{
	diag_log "NEAREST TILES F :: Adding more distance 2";
	_distance = _distance + 1000;
	{
		if(_position distance (getMarkerPos _x) < _distance) then
		{
			_variableName = format["visit_%1",_x];
			_townVisits = profileNamespace getVariable [_variableName,0];
			if(_townVisits > 5 && !(_count isEqualTo 4)) then
			{
				_return set[count _return,_x];
				_count = _count + 1;
			};
			if(_count isEqualTo 4) then
			{
				breakTo "main";
			};
		};
	} forEach AUSMD_gridPositions;
};

_return;
		