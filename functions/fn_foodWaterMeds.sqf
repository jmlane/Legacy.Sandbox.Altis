_selectedMarker = AUSMD_centerMarkers call BIS_fnc_selectRandom;
scopeName "main";
_locations = nearestLocations [(getMarkerPos _selectedMarker), ["NameCityCapital","NameCity","NameVillage","NameLocal"],10000]; 
_pickedLoc = locationNull;
{ 
	_locPos = locationPosition _x; 
	_locPos set [ 2, 0 ]; 
	
	_nearPlayers = [];
	{
		if(_x distance _locPos < 2000) then
		{
			_nearPlayers set[count _nearPlayers,_x];
		};
	} forEach allPlayers;
	if ( count _nearPlayers isEqualTo 0 && _locPos distance (getMarkerPos "HQ") > 800  &&  _locPos distance (getMarkerPos "respawn_west") > 800  && random 50 > 40) exitWith { 
		_pickedLoc = _x; 
	}; 
} forEach _locations;  

_pickedLocPos = locationPosition _pickedLoc;
_locName = "";
_locName = text _pickedLoc;

_randomID = round(random 2000);

_taskID = format["tskDeliver_%1",_randomID];

_pickedLocPos set[2,90];

_objUnits = [];

{
	_grp = createGroup civilian;
	_civ = _grp createUnit["C_man_polo_1_F",_pickedLocPos,[], 15, "NONE"];
	sleep 0.1;
	_civ disableAI "MOVE";
	_civ disableAI "ANIM";
	_objUnits set[count _objUnits,_civ];
} forEach[1,2,3,4];

for "_i" from 0 to 2 + round(random 1) do
{
	_group = [enemySide,250,_pickedLocPos] call AUSMD_fnc_createGroup;
	//[_group,_pos,100,3] call AUSMD_fnc_Patrol;
	{
		_objUnits set[count _objUnits,_x];
		_x setVariable ["AUSMD_DoNotCache",true,true];
	} forEach units _group;	
};


for "_i" from 0 to 1 + round(random 3) do
{
	_group = [enemySide,500,_pickedLocPos] call AUSMD_fnc_createGroup;
	//[_group,_pos,100,3] call AUSMD_fnc_Patrol;
	{
		_objUnits set[count _objUnits,_x];
		_x setVariable ["AUSMD_DoNotCache",true,true];
	} forEach units _group;
	[_group,getPos leader _group,800,8] call AUSMD_fnc_patrol;	
};

for "_i" from 0 to round(random 2) do
{
	_group = [enemySide,500,_pickedLocPos] call AUSMD_fnc_createGroup;
	{
		_objUnits set[count _objUnits,_x];
		_x setVariable ["AUSMD_DoNotCache",true,true];
	} forEach units _group;
	[_group,getPos leader _group,1200,8] call AUSMD_fnc_patrol;	
};

_vehicle = "B_Truck_01_medical_F" createVehicle (getMarkerPos "AUSMD_vehSpawn");
_vehicle lock 0;

diag_log "SUPPLY MISSION STARTED";

[_taskID,west,[format["Deliver Supplies to %1 <br/> <br/> The truck is located at HQ.",_locName],"Deliver Supplies","DELIVER"],_pickedLocPos,"ASSIGNED",1,True,True] spawn BIS_fnc_setTask;

waitUntil{_vehicle distance _pickedLocPos < 90 || !alive _vehicle};

diag_log "SUPPLY MISSION ENDED";

missionRunning = false;
publicVariable "missionRunning";

if(!alive _vehicle) then
{
	[_taskID,west,[format["Deliver Supplies to %1 <br/> <br/> The supply truck was destroyed! ",_locName],"Deliver Supplies","DELIVER"],_pickedLocPos,"FAILED",1,True,True] spawn BIS_fnc_setTask;
	GV_Sand_Balance = GV_Sand_Balance - 300000;
	if(GV_Sand_Balance < 300000) then 
	{
		GV_Sand_Balance = 0;
	};
	publicVariable "GV_Sand_Balance";
	[[format["$ %1 was spent because the truck was destroyed and compensation had to be given.", "300,000"]],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;
}
else
{
	[["You have made it to the drop off point! Make sure the town (and vicinity) is clear of hostile and stop the truck."],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;
	waitUntil{speed _vehicle < 3};
	{_x action["Eject",vehicle _x];} forEach crew _vehicle;
	_vehicle lock 2;
	waitUntil{{alive _x} count _objUnits < 10};
	_money = round(30 * ((getMarkerPos "HQ") distance _pickedLocPos)) + 25000;
	GV_Sand_Balance = GV_Sand_Balance + _money;
	publicVariable "GV_Sand_Balance";
	[_taskID,west,[format["Deliver Supplies to %1 <br/> <br/> The supply truck was delivered successfully! ",_locName],"Deliver Supplies","DELIVER"],_pickedLocPos,"SUCCEEDED",1,True,True] spawn BIS_fnc_setTask;
	[[format["$ %1 were gained for completion of this mission.", _money]],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;
};

sleep 10800;
deleteVehicle _vehicle;
