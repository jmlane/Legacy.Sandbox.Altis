_sel = lbCurSel 1506;

_vehData = lbData[1506,_sel];

if(_sel isEqualTo -1) exitWith {hint "No Selection";};

_pricePath = [sand_Vehicles,_vehData] call BIS_fnc_findNestedElement;
_selectOne = _pricePath select 0;
_price = sand_Vehicles select _selectOne select 1;

if(_price > GV_Sand_Balance) exitWith {hint "You can't afford that.";};

_veh = createVehicle [_vehData,(getMarkerPos "AUSMD_vehSpawn"), [], 0, "NONE"];  

if(_vehData isEqualTo "C_Offroad_01_F") then
{
	[
		_veh,
		["beige",1],
		[
			"HideBumper2", 0,
			"HideConstruction", 0,
			"Proxy", 0,
			"Destruct", 0
		]
	] call BIS_fnc_initVehicle;
};

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

GV_Sand_Balance = GV_Sand_Balance - _price;
publicVariable "GV_Sand_Balance";

hint format ["Bought a %1 for $ %2. \n\n Company balance: %3",getText(configFile >> "cfgVehicles" >> _vehData >> "displayName"),_price,GV_Sand_Balance];

_veh lock 0;