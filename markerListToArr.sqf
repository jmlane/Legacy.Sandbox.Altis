_markers = allMapMarkers;


_yourArray = [];
{
	if(["Rural",_x] call BIS_fnc_inString isEqualTo true) then
	{
		_yourArray set[count _yourArray,_x];
	}
} forEach _markers;

_str = format["%1",_yourArray];

copyToClipboard _str;