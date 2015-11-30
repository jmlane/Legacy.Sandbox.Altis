_selectedMarker = AUSMD_centerMarkers call BIS_fnc_selectRandom;
_unit = (getMarkerPos _selectedMarker);
_pos = [];
_pos = [_unit,6000] call AUSMD_fnc_findLoc;

sleep 5;

_tower = "Land_TTowerBig_2_F" createVehicle _pos;

_tower setVectorUp (surfaceNormal position _tower);

for "_i" from 0 to 2 do
{
	_group = [enemySide,50,_pos] call AUSMD_fnc_createGroup;
	[_group,_pos,100,3] call AUSMD_fnc_Patrol;
};

for "_i" from 0 to 2 do
{
	_group = [enemySide,200,_pos] call AUSMD_fnc_createGroup;
	[_group,_pos,800,6] call AUSMD_fnc_Patrol;
};

_random = round(random 2000);

_tskName = format["tskRadioTower_%1",_random];

[_tskName,friendlySide,[format["Task ID %1 <br/><br/><br/> Destroy the radio tower to damage enemy communications in the area.",_random],"Destroy Radio Tower","DESTROY"],(getPos _tower),"ASSIGNED",1,True,True] spawn BIS_fnc_setTask;

waitUntil{!alive _tower};

GV_Sand_Balance = GV_Sand_Balance + 55000;
publicVariable "GV_Sand_Balance";

missionRunning = false;
publicVariable "misionRunning";

[[format["$ %1 received for completion of this mission","55000"]],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;


[_tskName,friendlySide,[format["Task ID %1 <br/><br/><br/> Destroy the radio tower to damage enemy communications in the area. <br/><br/> $55000 was received for the completion of this mission.",_random],"Destroy Radio Tower","DESTROY"],(getPos _tower),"SUCCEEDED",1,True,True] spawn BIS_fnc_setTask;

sleep 10800;

deleteVehicle _tower;
