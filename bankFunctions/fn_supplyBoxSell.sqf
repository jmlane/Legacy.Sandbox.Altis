_priceTotal = 0;

_gearWeps = getWeaponCargo AUSMD_box select 0;
_gearWepsCount = getWeaponCargo AUSMD_box select 1;

_gearMags = getMagazineCargo AUSMD_box select 0;
_gearMagsCount = getMagazineCargo AUSMD_box select 1;

_gearItems = getItemCargo AUSMD_box select 0;
_gearItemsCount = getItemCargo AUSMD_box select 1;

_gearBags = getBackpackCargo AUSMD_box select 0;
_gearBagsCount = getBackpackCargo AUSMD_box select 1;

if(count _gearWeps isEqualTo 0 && count _gearMags == 0 && count _gearItems == 0 && count _gearBags == 0) exitWith
{
	hint "Nothing to Sell!";
};
 
if(count _gearWeps > 0) then
{
	{
		_arrPath = ([Sand_Weapons,_x] call BIS_fnc_findNestedElement);
		if(!(_arrPath isEqualTo [])) then
		{
			_selectOne = _arrPath select 0;
			_pathPrice = Sand_Weapons select _selectOne select 1;
			//_pathPrice = 5000;
			_price = _pathPrice * (_gearWepsCount select _forEachIndex);
			_price = round(_price / 2);
			GV_Sand_Balance = GV_Sand_Balance + _price;
			_priceTotal = _priceTotal + _price;
			publicVariable "GV_Sand_Balance";
		}
		else
		{
			_pathPrice = 2000;
			_price = _pathPrice * (_gearWepsCount select _forEachIndex);
			_price = round(_price / 2);
			GV_Sand_Balance = GV_Sand_Balance + _price;
			_priceTotal = _priceTotal + _price;
			publicVariable "GV_Sand_Balance";
		};
	} forEach _gearWeps;
};

clearWeaponCargoGlobal AUSMD_box;

if(count _gearMags > 0)then
{
	{
		_arrPath = ([Sand_Magazines,_x] call BIS_fnc_findNestedElement);
		if(!(_arrPath isEqualTo [])) then
		{
			_selectOne = _arrPath select 0;
			_pathPrice = Sand_Magazines select _selectOne select 1;
			//_pathPrice = 5000;
			_price = _pathPrice * (_gearMagsCount select _forEachIndex);
			_price = round(_price / 2);
			GV_Sand_Balance = GV_Sand_Balance + _price;
			_priceTotal = _priceTotal + _price;
			publicVariable "GV_Sand_Balance";
		}
		else
		{
			_pathPrice = 1000;
			_price = _pathPrice * (_gearMagsCount select _forEachIndex);
			_price = round(_price / 2);
			GV_Sand_Balance = GV_Sand_Balance + _price;
			_priceTotal = _priceTotal + _price;
			publicVariable "GV_Sand_Balance";
		};
	} forEach _gearMags;
};


clearMagazineCargoGlobal AUSMD_box;

if(count _gearItems > 0) then
{
	{
		_arrPath = ([Sand_Items,_x] call BIS_fnc_findNestedElement);
		if(!(_arrPath isEqualTo [])) then
		{
			_selectOne = _arrPath select 0;
			_pathPrice = Sand_Items select _selectOne select 1;
			//_pathPrice = 5000;
			_price = _pathPrice * (_gearItemsCount select _forEachIndex);
			_price = round(_price / 2);
			GV_Sand_Balance = GV_Sand_Balance + _price;
			_priceTotal = _priceTotal + _price;
			publicVariable "GV_Sand_Balance";
		}
		else
		{
			_pathPrice = 500;
			_price = _pathPrice * (_gearItemsCount select _forEachIndex);
			_price = round(_price / 2);
			GV_Sand_Balance = GV_Sand_Balance + _price;
			_priceTotal = _priceTotal + _price;
			publicVariable "GV_Sand_Balance";
		};
	} forEach _gearItems;
};

clearItemCargoGlobal AUSMD_box;

if(count _gearBags > 0) then
{
	{
		_arrPath = ([Sand_Backpacks,_x] call BIS_fnc_findNestedElement);
		if(!(_arrPath isEqualTo [])) then
		{
			_selectOne = _arrPath select 0;
			_pathPrice = Sand_Backpacks select _selectOne select 1;
			//_pathPrice = 5000;
			_price = _pathPrice * (_gearBagsCount select _forEachIndex);
			_price = round(_price / 2);
			GV_Sand_Balance = GV_Sand_Balance + _price;
			_priceTotal = _priceTotal + _price;
			publicVariable "GV_Sand_Balance";
		}
		else
		{
			_pathPrice = 1750;
			_price = _pathPrice * (_gearBagsCount select _forEachIndex);
			_price = round(_price / 2);
			GV_Sand_Balance = GV_Sand_Balance + _price;
			_priceTotal = _priceTotal + _price;
			publicVariable "GV_Sand_Balance";
		};
	} forEach _gearBags;
};

hint format ["Sold everything for $ %1  \n\n Company balance: %2",_priceTotal,GV_Sand_Balance];

clearBackpackCargoGlobal AUSMD_box;