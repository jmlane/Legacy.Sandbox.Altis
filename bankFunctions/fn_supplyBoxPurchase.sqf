_gear = _this select 0;
_crate = AUSMD_buyBox;
if(_gear select 0 isEqualTo "---------------") exitWith {hint "No selection.";};
_hasRun = false;

_isWep = isClass (configFile >> "CfgWeapons" >> (_gear select 0));

if(_isWep && "ItemCore" in ([(configFile >> "CfgWeapons" >> (_gear select 0)),true] call BIS_fnc_returnParents) || _isWep && "DetectorCore" in ([(configFile >> "CfgWeapons" >> (_gear select 0)),true] call BIS_fnc_returnParents) || _isWep && "Uniform_Base" in ([(configFile >> "CfgWeapons" >> (_gear select 0)),true] call BIS_fnc_returnParents)) then
{
	_isWep = false;
	_isItem = true;
};

if (_isWep) then 
{
	_arrPath = ([Sand_Weapons,(_gear select 0)] call BIS_fnc_findNestedElement);
	_selectOne = _arrPath select 0;
	//hint format ["weps %1 \n\n %2",_arrPath,_selectOne];
	_pathPrice = Sand_Weapons select _selectOne select 1;
	_price = _pathPrice;
	if(_price > GV_Sand_Balance) exitWith {hint "You cannot afford Weapons!";};
	GV_Sand_Balance = GV_Sand_Balance - _price;
	publicVariable "GV_Sand_Balance";
	_crate addWeaponCargoGlobal [(_gear select 0), (_gear select 1)];
	hint format ["Purchased for $ %1 \n\n Company balance: %2",_price,GV_Sand_Balance];
	_hasRun = true;
};

_isMag = isClass (configFile >> "CfgMagazines" >> (_gear select 0));

if(_isMag && !_hasRun) then
{
	_arrPath = ([Sand_Magazines,(_gear select 0)]) call BIS_fnc_findNestedElement;
	_selectOne = _arrPath select 0;
	//hint format ["mags %1 \n\n %2",_arrPath,_selectOne];
	_pathPrice = Sand_Magazines select _selectOne select 1;
	_price = _pathPrice;
	if(_price > GV_Sand_Balance) exitWith {hint "You cannot afford Mags!";};
	GV_Sand_Balance = GV_Sand_Balance - _price;
	publicVariable "GV_Sand_Balance";
	_crate addMagazineCargoGlobal [(_gear select 0), (_gear select 1)];
	hint format ["Purchased for $ %1 \n\n Company balance: %2",_price,GV_Sand_Balance];
	_hasRun = true;
};

_isItem = isClass (configFile >> "CfgWeapons" >> (_gear select 0));


if(_isItem && !_hasRun) then
{
	_arrPath = ([Sand_Items,(_gear select 0)]) call BIS_fnc_findNestedElement;
	_selectOne = _arrPath select 0;
	//hint format ["items %1 \n\n %2",_arrPath,_selectOne];
	_pathPrice = Sand_Items select _selectOne select 1;
	_price = _pathPrice;
	if(_price > GV_Sand_Balance) exitWith {hint "You cannot afford Items!";};
	GV_Sand_Balance = GV_Sand_Balance - _price;
	publicVariable "GV_Sand_Balance";
	_crate addItemCargoGlobal [(_gear select 0), (_gear select 1)];
	hint format ["Purchased for $ %1 \n\n Company balance: %2",_price,GV_Sand_Balance];
	_hasRun = true;
};

_isBag = isClass (configFile >> "CfgVehicles" >> (_gear select 0));

if(_isBag && !_hasRun) then
{
	_arrPath = ([Sand_Backpacks,(_gear select 0)]) call BIS_fnc_findNestedElement;
	_selectOne = _arrPath select 0;
	//hint format ["backpacks %1 \n\n %2",_arrPath,_selectOne];
	_pathPrice = Sand_Backpacks select _selectOne select 1;
	_price = _pathPrice;
	if(_price > GV_Sand_Balance) exitWith {hint "You cannot afford Items!";};
	GV_Sand_Balance = GV_Sand_Balance - _price;
	publicVariable "GV_Sand_Balance";
	_crate addBackpackCargoGlobal [(_gear select 0), (_gear select 1)];
	hint format ["Purchased for $ %1  \n\n Company balance: %2",_price,GV_Sand_Balance];
	_hasRun = true;
};

//hint format["%1 \n\n %2 \n\n %3 \n\n %4",_isWep,_isMag,_isItem,_isBag];

if(GV_Sand_Balance < 0 || isNil "GV_Sand_Balance") then
{
	GV_Sand_Balance = 0;
	publicVariable "GV_Sand_Balance";
};