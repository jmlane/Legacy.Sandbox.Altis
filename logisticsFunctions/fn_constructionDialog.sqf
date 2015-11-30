sleep 0.01;
if(construction_Building) exitWith {hintSilent "You are already building something";closeDialog 0;};
if(vehicle player != player) exitWith {hintSilent "You need to be on foot"; closeDialog 0;};
if(construction_SnapToggle) then {ctrlSetText [1030004,"Snap To Terrain (TRUE)"];} else {ctrlSetText [1030004,"Snap To Terrain (FALSE)"];};
hint "starting";
{
	lbAdd [15060002,_x];
} forEach construction_Structures;


construction_NearObjects = nearestObjects [player,construction_Structures,20];
{
	_name = getText(configFile >> "cfgVehicles" >> (typeOf _x) >> "displayName");
	_dist = round(_x distance player);
	lbAdd [15060002,(format["%1 (Distance: %2m)",_name,_dist])];
} forEach construction_NearObjects;