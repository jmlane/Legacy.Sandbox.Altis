// Sets up the commMenu
// Will be further updated by updates to fn_removePatrolBase.sqf
// Will be further updated by updates to fn_patrolBases.sqf
// vehicle player == player && player in ([HQ4,HQ5,HQ6,OPS,PL1,PS1,PL2,PS2,PL3,PS3,WSL])

if ((toUpper str player) in (["HQ4","HQ5","HQ6","OPS","PL1","PS1","PL2","PS2","PL3","PS3","WSL"])) then {
	comm_pbControl = [player,"pbControl",nil,nil,""] call BIS_fnc_addCommMenuItem;	// Adds Patrol Base menu to the CommMenu.
	
	_pb1 = ["Deploy Plt.1 Base", [2], "", -5, [["expression", "[1,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	_pb2 = ["Deploy Plt.2 Base", [3], "", -5, [["expression", "[2,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	_pb3 = ["Deploy Plt.3 Base", [4], "", -5, [["expression", "[3,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	_pb4 = ["Deploy Company HQ", [5], "", -5, [["expression", "[4,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	_pb5 = ["Deploy Weapons Base", [6], "", -5, [["expression", "[5,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];

	if (PatrolBase1Up) then {
		_pb1 = ["Pack Up Plt.1 Base", [2], "", -5, [["expression", "[1] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};
	if (PatrolBase2Up) then {
		_pb2 = ["Pack Up Plt.2 Base", [3], "", -5, [["expression", "[2] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};
	if (PatrolBase3Up) then {
		_pb3 = ["Pack Up Plt.3 Base", [4], "", -5, [["expression", "[3] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};
	if (CommandBaseUp) then {
		_pb4 = ["Pack Up Company HQ", [5], "", -5, [["expression", "[4] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};
	if (WeaponsBaseUp) then {
		_pb5 = ["Pack Up Weapons Base", [6], "", -5, [["expression", "[5] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};

	PB_CONTROL = 
	[
		["Base Deployment",false],
		_pb1,
		_pb2,
		_pb3,
		_pb4,
		_pb5
	];
	publicVariable "PB_CONTROL";
};

if ((toUpper str player) in (["HQ4","HQ5","HQ6","OPS","PL1","PS1","PL2","PS2","PL3","PS3","WSL"])) then {
	comm_adminPanel = [player,"adminPanel",nil,nil,""] call BIS_fnc_addCommMenuItem;
	_apOption1 = ["Admin Panel", [2], "", -5, [["expression", "createDialog 'AUSMDDebug';"]], "1", "1", ""];
	_apOption2 = ["Tile System Off", [3], "", -5, [["expression", "disableSpawning = true;publicVariable 'disableSpawning';"]], "1", "1", ""];
	_apOption3 = ["Tile System On", [4], "", -5, [["expression", "disableSpawning = false;publicVariable 'disableSpawning';"]], "1", "1", ""];
	ADMIN_CONTROL = 
	[
		["Admin Panel",false],
		_apOption1,
		_apOption2,
		_apOption3
	];
	publicVariable "ADMIN_CONTROL";
};