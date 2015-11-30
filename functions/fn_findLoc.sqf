

params[
	[ "_centerPos", [], [ objNull, [] ] ],
	[ "_maxDist", 2000, [ 0 ] ],
	[ "_object", "", [ objNull, "" ] ],
	[ "_minDist", 5, [ 0 ] ],
	[ "_blacklistPos", [0,0,0], [ [] ] ],
	[ "_mode", 0, [0]]
];

scopeName "main";

if(typeName _centerPos isEqualTo "OBJECT") then
{
	_centerPos = getPos _centerPos;
};

_loop = 0;

_posNow = [];

_isFlat = [];

for "_i" from 0 to 800 do
{
	scopeName "loop";
	_loop = _loop + 1;
	_posNow = [(_centerPos select 0) + (random _maxDist - random _maxDist),(_centerPos select 1) + (random _maxDist - random _maxDist),0];
		
	if(_object isEqualTo "") then
	{
		_isFlat = _posNow isFlatEmpty 
		[
			5,	//--- Minimal distance from another object
			0,				//--- If 0, just check position. If >0, select new one
			0.7,				//--- Max gradient
			8,	//--- Gradient area
			0,				//--- 0 for restricted water, 2 for required water,
			false,				//--- True if some water can be in 25m radius
			objNull
		];
	}
	else
	{
		_isFlat = _posNow isFlatEmpty 
		[
			(sizeof _object) / 2,	//--- Minimal distance from another object
			0,				//--- If 0, just check position. If >0, select new one
			0.7,				//--- Max gradient
			(sizeof _object),	//--- Gradient area
			0,				//--- 0 for restricted water, 2 for required water,
			false,				//--- True if some water can be in 25m radius
			objNull
		];
	};

	if(_loop > 50) then
	{
		_loop = 0;
		_centerPos set[0,(_centerPos select 0) + (random 800 - random 800)];
		_centerPos set[1,(_centerPos select 1) + (random 800 - random 800)];
	};
	
	_nearPlayers = [];
	{
		if(_x distance _posNow < 1000) then
		{
			_nearPlayers set[count _nearPlayers,_x];
		};
	} forEach allPlayers;
	
	if(_mode isEqualTo 0) then
	{
		_nearFriendlyTile = [_posNow,1000] call AUSMD_fnc_findNearestTileF;
		if(!(_isFlat isEqualTo []) && _nearFriendlyTile isEqualTo "" && _posNow distance _blacklistPos > _minDist && count _nearPlayers isEqualTo 0 && _posNow distance (getMarkerPos "HQ") > 700 && _posNow distance (getMarkerPos "Respawn_West") > 500 && _posNow distance (getMarkerPos "PB1") > 700 && _posNow distance (getMarkerPos "PB2") > 700 && _posNow distance (getMarkerPos "PB3") > 700) then {breakTo "main";};
	}
	else
	{
		if(!(_isFlat isEqualTo []) && _posNow distance _blacklistPos > _minDist && count _nearPlayers isEqualTo 0 && _posNow distance (getMarkerPos "HQ") > 700 && _posNow distance (getMarkerPos "Respawn_West") > 500 && _posNow distance (getMarkerPos "PB1") > 700 && _posNow distance (getMarkerPos "PB2") > 700 && _posNow distance (getMarkerPos "PB3") > 700) then {breakTo "main";};
	};
};

_isFlat;