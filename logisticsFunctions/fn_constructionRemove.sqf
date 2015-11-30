_sel = lbCurSel 15060002;
if(_sel == -1) exitWith {hint "No selection";};
construction_Object = (construction_NearObjects select _sel);
_arr = myStructures find construction_Object;
myStructures set[_arr,nil];
deleteVehicle construction_Object;
[] call construction_Dialog; //refresh menu
hint "Object deleted.";