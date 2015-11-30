_nearPlayers = [];
_foundLoc = false;
while{!_foundLoc} do
{
	{
		if(getMarkerPos _marker distance _x < 2000) then
		{
			_nearPlayers set[count _nearPlayers,_x];
		};
	} forEach allPlayers;
	if(count _nearPlayers isEqualTo 0) then
	{
		_foundLoc = true;
	}
	else
	{
		_marker = AUSMD_staticLocs call BIS_fnc_selectRandom;
	};
	sleep 0.01;
};

_vehType = [AUSMD_armorTypes,AUSMD_armorTypeValues] call BIS_fnc_selectRandomWeighted;

_veh = _vehType createVehicle (getMarkerPos _marker);
createVehicleCrew _veh;
sleep 0.01;
[group driver _veh,getMarkerPos _marker,2800,8] call AUSMD_fnc_patrol;

if(random 5 > 3) then
{
	_group = [resistance,30,getPos _veh] call AUSMD_fnc_createGroup;
	sleep 1;
	units _group join group driver _veh;
};


Zeus2 addCuratorEditableObjects [units group driver _veh,true]; 
Zeus addCuratorEditableObjects [units group driver _veh,true]; 
Zeus2 addCuratorEditableObjects [[_veh],true]; 
Zeus addCuratorEditableObjects [[_veh],true]; 


