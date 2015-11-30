_selectedMarker = AUSMD_centerMarkers call BIS_fnc_selectRandom;
_centerPos = (getMarkerPos _selectedMarker);
_pos = [];
_pos = [_centerPos,10000] call AUSMD_fnc_findLoc;

_group = [friendlySide,50,_pos] call AUSMD_fnc_createGroup;



