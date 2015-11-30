_chance = _this select 0;
_unit = _this select 1;
_pos = getPos _unit;

_spawnPos = [_pos,3500] call AUSMD_fnc_findLoc;

sleep 5;

_groupCount = switch(_chance) do
{
	case 0.3: {20};
	case 0.5: {25};
	case 0.75: {30};
	case 1: {35};
};

_attackUnits = [];
_attackGroups = [];
_enemyType = ([resistance,east] call BIS_fnc_selectRandom);
[["A large enemy presence has been spotted in the area. Recommend extreme caution."],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;
for "_i" from 0 to _groupCount do
{
	if(random 2 > _chance) then
	{
		_emptyPos = _spawnPos;
		_grp = [_enemyType,200,_emptyPos] call AUSMD_fnc_createGroup;
		sleep 5;
		_attackGroups set[count _attackGroups,_grp];
		sleep 5;
		Zeus addCuratorEditableObjects[units _grp,true];
		Zeus2 addCuratorEditableObjects[units _grp,true];
		sleep 0.2;
		[_grp,_pos] call BIS_fnc_taskAttack;	
		{
			_attackUnits set[count _attackUnits,_x];
		} forEach units _grp;
	};
};
//continue pursuit for some time
for "_i" from 0 to 2 + round(random 3) do
{
	if(getPos _unit distance (getMarkerPos "HQ") > 500) then
	{
		_pos = getPos _unit;
		{
			[_x,_pos] call BIS_fnc_taskAttack;	
		} forEach _attackGroups;
		sleep 500;
	};
};

if(count allUnits > 500) then
{
	diag_log "MEGA ATTACK :: Needed to delete some units, way too many active.";
	{
		if(random 1 > 0.75) then
		{
			deleteVehicle _x;
		};
	} forEach _attackUnits;
};

sleep 2530;


diag_log "MEGA ATTACK :: Dispersing Units... ending script";
{
	_wp = _x addWaypoint[(getPos leader _x),0];
	_wp setWaypointType "DISMISS";
} forEach _attackGroups;