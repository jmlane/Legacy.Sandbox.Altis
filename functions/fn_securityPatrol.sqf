missionRunning = true;

scopeName "securityMain";

_selectedMarker = AUSMD_centerMarkers call BIS_fnc_selectRandom;
_unit = (getMarkerPos _selectedMarker);
_pos = [];
_pos = [_unit,6000] call AUSMD_fnc_findLoc;

_missionMarkers = [];

for "_i" from 0 to 2 + round(random 3) do
{
	_newPos = [_pos,3500,"",350,_pos,1] call AUSMD_fnc_findLoc;
	
	_random = round(random 5000);
	_text = format["SECPAT_%1",_random];
	_marker = createMarker[_text,_newPos];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_dot";
	_marker setMarkerText _text;
	_missionMarkers set[count _missionMarkers,_marker];
	if(random 50 > 30) then
	{
		for "_i" from 0 to 1 + round(random 2) do
		{
			_group = [enemySide,300,_newPos] call AUSMD_fnc_createGroup;
			[_group,_pos,800,5] call AUSMD_fnc_Patrol;
			{
				_x setVariable ["AUSMD_doNotCache",true];
			} forEach units _group;
		};
	};
};

while{missionRunning} do
{
	scopeName "SecurityoutsideCheckLoop";
	
	{
		_nearby = [_x,110] call AUSMD_fnc_nearUnitsBool;
		if(_nearby) then 
		{
			_missionMarkers = _missionMarkers - [_x];
			deleteMarker _x;
			[[format["SECURITY PATROL \n\n\n Sector %1 has been cleared.",_text]],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;
		};
	} forEach _missionMarkers;
	if(_missionMarkers isEqualTo []) exitWith
	{
		_money = 0;
		_money = 500 * count allPlayers;
		_money = _money + 75000 + round(random 25000);
		missionRunning = false;
		publicVariable "missionRunning";
		GV_Sand_Balance = GV_Sand_Balance + _money;
		publicVariable "GV_Sand_Balance";
		[[format["SECURITY PATROL \n\n\n All sectors have been cleared \n\n\n $ %1 awarded",_money]],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;
	};
	sleep 5;
};
	
	
	
	