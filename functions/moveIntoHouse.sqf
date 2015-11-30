_unit = _this select 0;

_loopCount = 0;

_houses = nearestObjects[leader _group,["Building"],50];

if(count _houses isEqualTo 0) exitWith {};

{
	_loopCount = _forEachIndex;
	_houseData = [_x,count units _group] call AUSMD_fnc_buildingEnterable;
	_house = _x;
	if(_houseData select 0 isEqualTo true) exitWith 
	{
		{
			_x doMove (_house buildingPos _forEachIndex);
			[_x] spawn
			{
				_guy = _this select 0;
				waitUntil{unitReady _guy};
				_guy disableAI "MOVE";
			};
		} forEach units _group;
	};
} forEach _houses;