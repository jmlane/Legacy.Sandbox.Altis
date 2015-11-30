_possibleMarkers = [];
{ 
	_locPos = getMarkerPos _x;
	_nearPlayers = [];
	{
		if(_x distance _locPos < 2000 || _x distance _locPos > 7500) then
		{
			_nearPlayers set[count _nearPlayers,_x];
		};
	} forEach allPlayers;
	if ( count _nearPlayers isEqualTo 0) exitWith
	{ 
		_possibleMarkers set[count _possibleMarkers,_x];
	}; 
} forEach AUSMD_staticLocs;  

_realMark = _possibleMarkers call BIS_fnc_selectRandom;
_pickedLoc = (nearestLocations[_pickedLoc,["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0;
_pickedLocPos = getMarkerPos _realMark;
_locName = "";
_locName = text _pickedLoc;

_randomID = round(random 2000);

_taskID = format["tskDeliver_%1",_randomID];

_grp = createGroup civilian;
_civ = _grp createUnit["C_man_polo_1_F",_pickedLocPos,[], 10, "NONE"];
_civ setVariable ["AUSMD_DoNotCache",true,true];
_civ allowDamage false;
sleep 2;
_civ disableAI "MOVE";
_civ disableAI "ANIM";
_civ disableAI "FSM";


_unitNear = false;

[[format["Go talk to the local cop in %1",_locName]],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;

_random = round(random 5000);

[format["tskCop_%1",_random],west,["Talk to the cop at the location marked on the map.","Talk to Cop","TALK"],getPos _civ,"ASSIGNED",1,True,True] spawn BIS_fnc_setTask;

while{!_unitNear} do
{
	sleep 5;
	{
		if(_x distance _civ < 10) then
		{
			_unitNear = true;
		};
	} forEach allPlayers;
};
[[getPos _civ],"AUSMD_fnc_talkCopGoods",false,false,false] spawn BIS_fnc_MP;

[format["tskCop_%1",_random],west,["Talk to the cop at the location marked on the map.","Talk to Cop","TALK"],getPos _civ,"SUCCEEDED",1,True,True] spawn BIS_fnc_setTask;

sleep 10800;

deleteVehicle _civ;