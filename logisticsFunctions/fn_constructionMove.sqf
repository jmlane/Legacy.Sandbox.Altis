if(cursorTarget getVariable ["being_moved",false]) exitWith {hint "Already being moved.";};
construction_object = cursorTarget;
construction_Building = true; 

player forceWalk true;

construction_ObjectDir = 0;
construction_ObjectZ = ((boundingBox construction_Object select 1) select 2);
construction_Object attachTo [player,[0,((boundingBox construction_Object select 1) select 1) + 3,construction_ObjectZ]];
construction_Object setDir construction_ObjectDir;

waitUntil{isNull construction_object || !alive player || vehicle player != player};

if(!alive player || vehicle player != player) exitWith
{
	construction_object setVariable ["being_moved",false,true];
	detach construction_Object;
	construction_Building = false;
	construction_Object = objNull;
	hint "Object Dropped because you died or got into a vehicle.";
	player forceWalk false;
};