if((nearestObjects[sellPad,["Car_F","Air"],5]) isEqualTo []) exitWith {hint "Nothing to sell";};

_vehicle = (nearestObjects[sellPad,["Car_F","Air"],5]) select 0;

if(!alive _vehicle || count crew _vehicle > 0) exitWith {hint "Vehicle is still occupied or destroyed!";};

_price = 0;

_pricePath = [Sand_Vehicles,typeOf(_vehicle)] call BIS_fnc_findNestedElement;

if(!(_pricePath isEqualTo [])) then
{
	_pricePathReal = _pricePath select 0;
	_price = Sand_Vehicles select _pricePathReal select 1;
	_price = round(_price / 2);
}
else
{
	_price = 35000;
};

GV_Sand_Balance = GV_Sand_Balance + _price;
publicVariable "GV_Sand_Balance";

hint format ["%1 sold for $ %2",getText(configFile >> "cfgVehicles" >> (typeOf(_vehicle)) >> "displayName"),_price];

deleteVehicle _vehicle;

//diag_log format ["VEHICLE SELLING :: A %1 Was sold by %2 (player id: %3)",getText(configFile >> "cfgVehicles" >> (typeOf(_vehicle)) >> "displayName"),name player,getPlayerUID player];

