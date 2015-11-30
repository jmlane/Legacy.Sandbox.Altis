private["_ctrl","_dikCode","_handled"];
_ctrl = _this select 0;
_dikCode = _this select 1;
_handled = false;
hint format ["%1",_dikCode];
if(_dikCode isEqualTo 20) then
{
	_groups = curatorSelected select 1;
	if(!(_groups isEqualTo [])) then
	{
		if(count _groups > 1) then
		{
			{
				_group = _x;
				_wp = _group addWaypoint [(getPos leader _group),0];
				_wp setWaypointType "HOLD";
			} forEach _groups;
		}
		else
		{
			_group = _groups select 0;
			_wp = _group addWaypoint [(getPos leader _group),0];
			_wp setWaypointType "HOLD";
		};
		hint "Group Will Garrison";
		_handled = true;
	};
};
if(_dikCode isEqualTo 22) then
{
	_groups = curatorSelected select 1;
	if(!(_groups isEqualTo [])) then
	{
		if(count _groups > 1) then
		{
			{
				_group = _x;
				[_group,(getPos leader _group),500,3 + round(random 3)] call AUSMD_fnc_Patrol;
			} forEach _groups;
		}
		else
		{
			_group = _groups select 0;
			[_group,(getPos leader _group),500,3 + round(random 3)] call AUSMD_fnc_Patrol;
		};
		hint "Group patrolling";
		_handled = true;
	};
};

if(_dikCode isEqualTo 25) then
{
	_groups = curatorSelected select 1;
	if(!(_groups isEqualTo [])) then
	{
		if(count _groups > 1) then
		{
			{
				_group = _x;
				_wp = _group addWaypoint [(getPos leader _group),0];
				_wp setWaypointType "DISMISS";
			} forEach _groups;
		}
		else
		{
			_group = _groups select 0;
			_wp = _group addWaypoint [(getPos leader _group),0];
			_wp setWaypointType "DISMISS";
		};
		hint "Group Will Disperse";
		_handled = true;
	};
};

_handled;  