_item = lbCurSel 1505;

_itemReal = lbData[1505, _item];

if(_amount isEqualTo "") exitWith {hint "No Amount";};

[[_itemReal,1]] call AUSMD_fnc_supplyBoxPurchase;