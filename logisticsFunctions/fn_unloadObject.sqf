_selection = lbCurSel 1500000;

if(_selection isEqualTo -1) exitWith {hint "No Selection.";};

_inv = cursorTarget getVariable ["AUSMD_objects",[]];

_object = _inv select _selection;

_object createVehicle (getPos player);

_inv set[_selection,""];

_invNew = [];

{
	if(!(_x isEqualTo "")) then
	{
		_invNew set[count _invNew,_x];
	};
} forEach _inv;

cursorTarget setVariable["AUSMD_objects",_invNew,true];

hint "Unloaded object.";

AUSMD_selectedObject = auslog;
AUSMD_selectedVehicle = auslog;

closeDialog 0;

_veh setVariable["being_searched",false,true];