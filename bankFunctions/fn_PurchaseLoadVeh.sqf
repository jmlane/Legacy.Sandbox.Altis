uiSleep 0.5;

{
	lbAdd [1506,format["%1 - $ %2",getText(configFile >> "cfgVehicles" >> (_x select 0) >> "displayName"),(_x select 1)]];
	lbSetData[1506,_forEachIndex,(_x select 0)];
} forEach Sand_Vehicles;