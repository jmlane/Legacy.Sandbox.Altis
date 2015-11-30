_sel = lbCurSel 150010;
if(_sel == -1) exitWith {hint "No Target";};
_unit = allUnits select _sel;
sleep 0.01;
_unit setPos (getPos player);
hint format["Teleported %1.",name _unit];
//onMapSingleClick {_unit setPos [_pos select 0,_pos select 1,0];hint format["%1 teleported to %2",name (allUnits select _sel),_pos];openMap[false,false]; onMapSingleClick '';  true};
closeDialog 0;