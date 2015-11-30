if(vehicle player != player) exitWith {hintSilent "You need to be on foot";};
if(construction_Building) exitWith {hintSilent "You are already building";};
_sel = lbCurSel 15000001;
construction_Selection = _sel;
construction_Building = true;
construction_Object = (construction_Structures select _sel) createVehicle [0,0,0];
construction_Object setVariable ["builder",getPlayerUID player,true];
_obj = construction_Object;
construction_ObjectDir = 0;
construction_ObjectZ = ((boundingBox construction_Object select 1) select 2);
//construction_ObjectY = ((boundingBox construction_Object select 1) select 1) + 3;
construction_Object attachTo [player,[0,((boundingBox construction_Object select 1) select 1) + 5,construction_ObjectZ]];
construction_Object setDir construction_ObjectDir;
construction_Object allowDamage false;
closeDialog 0;
hintC "H - PLACE OBJECT\nB - RAISE OBJECT\nC - LOWER OBJECT\nSHIFT+C - ROTATE \nSHIFT+B - ROTATE ";

[_obj] spawn
{
	_obj = _this select 0;
	waitUntil {!alive player || vehicle player != player};
	detach _obj;
	construction_Object = objNull;
	construction_Building = false;
};