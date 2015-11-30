private "_town";

_town = _this select 0;

if(time < 30) exitWith {};

_pos = getMarkerPos _town;

_townUnits = [];
_enemyTownUnits = [];

_grp = createGroup civilian;

for "_i" from 0 to 1 + round(random 4) do
{
	_civType = AUSMD_civTypes call BIS_fnc_selectRandom;
	_civ = _grp createUnit[_civType,_pos,[], 50, "NONE"];
	_townUnits set[count _townUnits,_civ];
};

_townVar = format["rep_%1",_town];
_townRep = profileNameSpace getVariable [_townVar,0];

/*
if(_townRep > 15 && random 30 > 15) then
{
	_box = "B_supplyCrate_F" createVehicle _pos;
	for "_i" from 0 to round(random 3) do
	{
		_randomItem = AUSMD_items call BIS_fnc_selectRandom;
		_box addItemCargoGlobal[_randomItem,round(random 2)];
	};
};
*/

if(!disableSpawning && _townRep < 15) then
{
	for "_i" from 0 to round(random 2) do
	{
		_group = [enemySide,50,_pos] call AUSMD_fnc_createGroup;
		{
			_enemyTownUnits set[count _enemyTownUnits,_x];
			_x setVariable ["assignedTown",_town];
			[_x] call IndiGear;
			_x addEventHandler["Killed",{_town = _x getVariable ["assignedTown","t1"]; [[1,_town],"AUSMD_fnc_addRep",false,false,false] spawn BIS_fnc_MP;}];
		} forEach units _group;
		Zeus addCuratorEditableObjects[units _group,true];
		Zeus2 addCuratorEditableObjects[units _group,true];
		Zeus3 addCuratorEditableObjects[units _group,true];
		if(random 10 > 4) then
		{
			[leader _group] call AUSMD_fnc_moveIntoHouse;
		}
		else
		{
			[_group,(getPos leader _group),400,5] call AUSMD_fnc_Patrol;
	};
};

if(!disableSpawning && _townRep < 25 && _townRep > 14) then
{
	for "_i" from 0 to round(random 1) do
	{
		_group = [enemySide,50,_pos] call AUSMD_fnc_createGroup;
		{
			_enemyTownUnits set[count _enemyTownUnits,_x];
			_x setVariable ["assignedTown",_town];
			[_x] call IndiGear;
			_x addEventHandler["Killed",{_town = _x getVariable ["assignedTown","t1"]; [[1,_town],"AUSMD_fnc_addRep",false,false,false] spawn BIS_fnc_MP;}];
		} forEach units _group;
		Zeus addCuratorEditableObjects[units _group,true];
		Zeus2 addCuratorEditableObjects[units _group,true];
		Zeus3 addCuratorEditableObjects[units _group,true];
		if(random 10 > 4) then
		{
			[leader _group] call AUSMD_fnc_moveIntoHouse;
		}
		else
		{
			[_group,(getPos leader _group),400,5] call AUSMD_fnc_Patrol;
	};
};

Zeus addCuratorEditableObjects[_townUnits,true];
Zeus2 addCuratorEditableObjects[_townUnits,true];
Zeus3 addCuratorEditableObjects[_townUnits,true];

_nearUnits = [];
_nearUnits = [_town,2200] call AUSMD_fnc_nearUnits;
while{!(_nearUnits isEqualTo [])} do
{
	_nearUnits = [_town,2200] call AUSMD_fnc_nearUnits;
	sleep 30;
};

if({alive _x} count _enemyTownUnits < 5) then
{
	_townVar = format["jobsDone_%1",_town];
	_jobsDone = profileNamespace getVariable [_townVar,0];
	profileNamespace setVariable[_townVar,_jobsDone + 1];
	saveProfileNamespace;
};

{deleteVehicle _x} forEach _townUnits;
{deleteVehicle _x} forEach _enemyTownUnits;