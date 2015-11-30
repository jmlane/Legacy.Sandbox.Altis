waitUntil { !isNull player };

_unit = _this select 0;

haloed = true;
openMap true;
hintSilent "Click on map to mark position for halo insertion.";
onMapSingleClick "player setPos [(_pos select 0), (_pos select 1), 800]; haloed = false;hint 'Halo insertion initialized. Remember to open parachute.'";
waitUntil{!haloed || !visibleMap};
onMapSingleClick "";
openMap false;

if (isDedicated || !visibleMap) exitWith {};

_pack = typeof (unitBackpack _unit);
_loadout = [player, [missionnamespace, "myLoadout"]] call bis_fnc_saveInventory;
removeBackpack player;

_unit addBackpack "B_Parachute";

_nil = [_unit,_pack, _loadout] spawn {
	_unit = _this select 0;
	_pack = _this select 1;
	_loadout = _this select 2;
	
	waitUntil {animationState _unit == "para_pilot"}; 

	waitUntil {isTouchingGround _unit || (getPosASL _unit) select 2 < 0.1};

	_loadout = [player, [missionNamespace, "myLoadout"]] call BIS_fnc_loadInventory;
};

if (true) exitWith {};