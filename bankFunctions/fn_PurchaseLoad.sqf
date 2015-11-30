uiSleep 0.5;

ctrlSetText [1405,"1"];

_count = 0;

{
	lbAdd [1505,format["%1 - $ %2",getText(configFile >> "cfgWeapons" >> (_x select 0) >> "displayName"),(_x select 1)]];
	lbSetData[1505,_forEachIndex,(_x select 0)];
} forEach Sand_Weapons;

_count = _count + count Sand_Weapons;

{
	lbAdd [1505,format["%1 - $ %2",getText(configFile >> "cfgMagazines" >> (_x select 0) >> "displayName"),(_x select 1)]];
	lbSetData[1505,_count + _forEachIndex,(_x select 0)];
} forEach Sand_Magazines;

_count = _count + count Sand_Magazines;

{
	lbAdd [1505,format["%1 - $ %2",getText(configFile >> "cfgWeapons" >> (_x select 0) >> "displayName"),(_x select 1)]];
	lbSetData[1505,_count + _forEachIndex,(_x select 0)];
} forEach Sand_Items;

_count = _count + count Sand_Items;

{
	lbAdd [1505,format["%1 - $ %2",getText(configFile >> "cfgVehicles" >> (_x select 0) >> "displayName"),(_x select 1)]];
	lbSetData[1505,_count + _forEachIndex,(_x select 0)];
} forEach Sand_Backpacks;