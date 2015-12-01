waitUntil {time > 5 && !isNil "GV_Sand_Balance"};
[player] execVM "sand_scripts\sand_pLoadoutCreator.sqf";
[player] execVM "sand_scripts\sand_lockBoxes.sqf";

player forceWalk false;
enableSentences false;
enableRadio false;
showHUD [true,true,true,true,true,true,false,true];

if(time > 30 && player distance (getMarkerPos "Respawn_West") < 100 && myDeaths > 3) then
{
	myDeaths = 0;
	GV_Sand_Balance = GV_Sand_Balance - sand_param_deathCost;
	publicVariable "GV_Sand_Balance";
};

if(time > 30) then
{
	player addAction ["Earplugs In",{1 fadeSound .04; AUSMD_earPlugIn = true;},nil,1,False,True,"",' !AUSMD_earPlugIn '];
	player addAction ["Earplugs Out",{.1 fadeSound 1; AUSMD_earPlugIn = false;},nil,1,False,True,"",' AUSMD_earPlugIn '];
	player addAction ["Build Menu",{createDialog "PatrolBaseAdd";},nil,0.5,False,True,"",' vehicle player == player && player in ([HQ4,HQ5,HQ6,OPS,PL1,PS1,PL2,PS2,PL3,PS3,WSL]) '];
	player addAction ["Remove Menu",{createDialog "patrolBaseRemove";},nil,0.5,False,True,"",' vehicle player == player && player in ([HQ4,HQ5,HQ6,OPS,PL1,PS1,PL2,PS2,PL3,PS3,WSL]) '];
	player addAction ["Select Object",{AUSMD_selectedObject = cursorTarget; AUSMD_selectedObject setVariable["being_loaded",true,true]; hint "Now select the vehicle you want to load this into.";},nil,0.45,False,True,"",' !(cursorTarget getVariable ["being_loaded",false]) && alive player && vehicle player == player && typeOf cursorTarget in AUSMD_acceptedObjects && player distance cursortarget < 10'];
	player addAction ["Select Vehicle",{AUSMD_selectedVehicle = cursorTarget; hint "Loading Object into selected Vehicle..."; [] call AUSMD_fnc_loadObject;},nil,0.35,False,True,"",' AUSMD_selectedObject != auslog && alive player && vehicle player == player && typeOf cursorTarget in AUSMD_acceptedVehicles && player distance cursortarget < 10'];
	player addAction ["Vehicle Inventory",{createDialog "vehInventory"},nil,0.25,False,True,"",' alive player && vehicle player == player && alive cursorTarget && typeOf cursorTarget in AUSMD_acceptedVehicles && player distance cursorTarget < 10'];
	player addAction ["Move Object",{[] call AUSMD_fnc_constructionMove;},nil,0.15,False,True,"",' alive player && vehicle player == player && typeOf cursorTarget in AUSMD_acceptedObjects && !construction_building'];
	player addAction ["Drop Object",{construction_object setVariable ["being_moved",false,true];detach construction_Object;construction_Building = false;construction_Object = objNull;hint "Object Placed.";player forceWalk false;},nil,0.15,False,True,"",' construction_building && alive player && vehicle player == player && typeOf cursorTarget in AUSMD_acceptedObjects'];			

	if(getPlayerUID player isEqualTo  76561198031485127 || getPlayerUID player isEqualTo 76561198076263154) then
	{
		player addAction ["Admin Menu",{createDialog "AUSMDDebug";},nil,0.4,False,True,"", ' alive player '];
		player addAction ["TILE SYSTEM OFF",{disableSpawning = true;publicVariable "disableSpawning";},nil,0.4,False,True,"", ' alive player && !disableSpawning'];
		player addAction ["TILE SYSTEM ON",{disableSpawning = true;publicVariable "disableSpawning";},nil,0.4,False,True,"", ' alive player && disableSpawning '];
	};
};