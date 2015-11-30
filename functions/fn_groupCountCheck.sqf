_side = _this select 0;

_groups = [];
{
	if(side leader _x isEqualTo _side) then
	{
		_groups set[count _groups,_x];
	};
} forEach allGroups;

_groups;