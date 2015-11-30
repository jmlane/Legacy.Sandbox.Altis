AUSMD_selectedObject = cursorTarget; 
AUSMD_selectedObject setVariable["being_loaded",true,true];
 hint "Now select the vehicle you want to load this into.";
 
 waitUntil{AUSMD_selectedVehicle != auslog || !alive player || player distance AUSMD_selectedObject > 15};
 
 if(!alive player || player distance AUSMD_selectedObject > 15) exitWith
 {
	AUSMD_selectedObject setVariable["being_loaded",false,true];
	AUSMD_selectedObject = auslog;
	hint "Cancelled selected object.";
};