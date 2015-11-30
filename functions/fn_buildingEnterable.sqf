_building 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_min		= [_this, 1, 1, [0]] call BIS_fnc_param;

//Get available positions of the building
private "_availablePositions";
_availablePositions = [_building, _min] call BIS_fnc_buildingPositions;

//Does this building have at least one position defined?
private "_isEnterable";
_isEnterable = count _availablePositions >= _min;

//Return
[_isEnterable,_availablePositions];
