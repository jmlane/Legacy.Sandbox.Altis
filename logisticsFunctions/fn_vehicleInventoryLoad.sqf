sleep 0.01;
_veh = cursorTarget;
if(_veh getVariable ["being_searched",false]) exitWith {closeDialog 0; hint "Somebody is already looking inside this vehicle.";};
_veh setVariable ["being_searched",true,true];
_inventory = _veh getVariable ["AUSMD_objects",[]];

if(_inventory isEqualTo []) exitWith {hint "Nothing in this vehicle.";closeDialog 0;};

{
	lbAdd[1500000,_x];
} forEach _inventory;

ctrlSetText[1000000,"Vehicle Inventory For: " + getText(configFile >> "cfgVehicles" >> (typeOf cursorTarget) >> "displayName")];

waitUntil{speed player > 0 || !alive player};

_veh setVariable["being_searched",false,true];



