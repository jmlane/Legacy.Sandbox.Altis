//_selectedMarker = AUSMD_centerMarkers call BIS_fnc_selectRandom;
_possibleMarkers = [];
{ 
	_locPos = getMarkerPos _x;
	_nearPlayers = [];
	{
		if(_x distance _locPos < 2000) then
		{
			_nearPlayers set[count _nearPlayers,_x];
		};
	} forEach allPlayers;
	if ( count _nearPlayers isEqualTo 0) then
	{ 
		_possibleMarkers set[count _possibleMarkers,_x];
	}; 
} forEach AUSMD_townPositions;  

_realMark = _possibleMarkers call BIS_fnc_selectRandom;
_pickedLocc = getMarkerPos _realMark;

_pickedLocc = (nearestLocations[_pickedLoc,["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0;
//_pickedLocPos = locationPosition _pickedLocc;
_locName = "";
_locName = text _pickedLocc;

_randomID = round(random 2000);

_taskID = format["tskOccupation_%1",_randomID];

_objUnits = [];

{
	_grp = createGroup civilian;
	_civ = _grp createUnit["C_man_polo_1_F",_pickedLoc,[], 15, "NONE"];
	sleep 0.1;
	_civ setDamage 1;
} forEach[1,2,3,4];

{
	_grp = createGroup civilian;
	_civ = _grp createUnit["C_man_polo_1_F",_pickedLoc,[], 15, "NONE"];
	sleep 0.1;
	_objUnits set[count _objUnits,_civ];
} forEach[1,2,3,4];


_group = [enemySide,100,_pickedLoc] call AUSMD_fnc_createGroup;
{
	_objUnits set[count _objUnits,_x];
	_x setVariable ["AUSMD_DoNotCache",true,true];
} forEach units _group;
[_group,getPos leader _group,200,6] call AUSMD_fnc_patrol;	

_group = [enemySide,100,_pickedLoc] call AUSMD_fnc_createGroup;
{
	_objUnits set[count _objUnits,_x];
	_x setVariable ["AUSMD_DoNotCache",true,true];
} forEach units _group;
sleep 0.1;	
_wp = _group addWaypoint [(getPos leader _group),0];
[_group,0] setWaypointType "DISMISS";

for "_i" from 0 to 2 do
{
	_group = [enemySide,500,_pickedLoc] call AUSMD_fnc_createGroup;
	{
		_objUnits set[count _objUnits,_x];
		_x setVariable ["AUSMD_DoNotCache",true,true];
	} forEach units _group;
	[_group,getPos leader _group,800,8] call AUSMD_fnc_patrol;
};

[_taskID,west,[format["Rebels have occupied %1, head over there and wipe them out.",_locName],"Free Town from Occupation","CLEAR"],_pickedLoc,"ASSIGNED",1,True,True] spawn BIS_fnc_setTask;

waitUntil{{alive _x} count _objUnits < 8};

[_taskID,west,[format["Rebels have occupied %1, head over there and wipe them out.",_locName],"Free Town from Occupation","CLEAR"],_pickedLoc,"SUCCEEDED",1,True,True] spawn BIS_fnc_setTask;

missionRunning = false;
publicVariable "missionRunning";

_pay = 70000 + round(200 * count _objUnits) + round(random 15000);
GV_Sand_Balance = GV_Sand_Balance + _pay;
publicVariable "GV_Sand_Balance";
[[format["$ %1 for completion of this mission.", _pay]],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;