AUSMD_selectedVehicle = cursorTarget; 
hint "Loading Object into selected Vehicle...";

_object = AUSMD_selectedObject;
_vehicle = AUSMD_selectedVehicle;
if(!alive _object || !alive _vehicle) exitWith {hint "Vehicle or object is destroyed.";};

if(_object distance _vehicle > 15) exitWith {hint "Object too far away from vehicle.";};

_vehStuff = _vehicle getVariable ["AUSMD_objects",[]];

if(count _vehStuff > 10) exitWith {hint "Too many things in the vehicle already.";};

_vehicle setVariable ["AUSMD_objects",(_vehStuff + [typeOf _object]),true];

deleteVehicle _object;

hint "Loaded Object into vehicle.";

AUSMD_selectedObject = auslog;
AUSMD_selectedVehicle = auslog;