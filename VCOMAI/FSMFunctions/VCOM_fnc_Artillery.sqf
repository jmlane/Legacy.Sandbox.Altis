//AI will use artillery/mortars when possible. This script makes it so each AI gets checked if they are arty capable or not
//First hash 6/14/2014
//Modified 8/15/14

//Find unit to be doing check upon.
_Unit = _this select 0;

_Vehicle = (vehicle _Unit);
if (_Vehicle in ArtilleryArray) exitWith {};
//Pull the vehicle the unit is in.

//Get the vehicles class name.
_class = typeOf _Vehicle;
if (isNil ("_class")) exitWith {};
//player sidechat format ["%1",_class];
//Figure out if it is defined as artillery
_ArtyScan = getNumber(configfile/"CfgVehicles"/_class/"artilleryScanner");

//Exit the script if it is not defined as artillery
if (isNil "_ArtyScan") exitWith {

//Check if unit somehow is in the ArtilleryArray and remove them.  This can happen to units who were inside artillery pieces but ejected.
if (_Vehicle in ArtilleryArray) then {
ArtilleryArray = ArtilleryArray - [_Vehicle];
};

};

if (_ArtyScan == 1) then {
//Setup the unit so that the unit is available for artillery calls
_Vehicle setVariable ["VCOM_ISARTILLERY",1,false];
//player sidechat format ["Added Unit to Arty: %1",_Vehicle];
//ArtilleryArray = ArtilleryArray + [_Vehicle];
ArtilleryArray set [count ArtilleryArray,_Vehicle];
//null = [_Unit] execFSM "\VCOM_AI\AIBEHAVIORARTY.fsm";
};