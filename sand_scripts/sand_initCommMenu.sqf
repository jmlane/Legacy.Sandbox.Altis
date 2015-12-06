// Base Deployment and Repack
// commMenu
private ["_pb1","_pb2","_pb3","_pb4","_pb5"];
_pb1 = [];
_pb2 = [];
_pb3 = [];
_pb4 = [];
_pb5 = [];

if ((toUpper str player) in (["HQ4","HQ5","HQ6","OPS","PL1","PS1","PL2","PS2","PL3","PS3","WSL"])) then {
	comm_pbControl = [player,"pbControl",nil,nil,""] call BIS_fnc_addCommMenuItem;
	if ((toUpper str player) in (["PL1","PS1"])) then {
		_pb1 = ["Deploy Plt.1 Base", [2], "", -5, [["expression", "[1,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	};
	if ((toUpper str player) in (["PL2","PS2"])) then {
		_pb2 = ["Deploy Plt.2 Base", [3], "", -5, [["expression", "[2,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	};
	if ((toUpper str player) in (["PL3","PS3"])) then {
		_pb3 = ["Deploy Plt.3 Base", [4], "", -5, [["expression", "[3,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	};
	if ((toUpper str player) in (["HQ4", "HQ5", "HQ6"])) then {
		_pb4 = ["Deploy Company HQ", [5], "", -5, [["expression", "[4,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	};
	if ((toUpper str player) in (["WSL", "ASL"])) then {
		_pb5 = ["Deploy Weapons Base", [6], "", -5, [["expression", "[5,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	};
	
	if (PatrolBase1Up && (toUpper str player) in (["PL1","PS1"])) then {
		_pb1 = ["Pack Up Plt.1 Base", [2], "", -5, [["expression", "[1] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};
	if (PatrolBase2Up && (toUpper str player) in (["PL2","PS2"])) then {
		_pb2 = ["Pack Up Plt.2 Base", [3], "", -5, [["expression", "[2] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};
	if (PatrolBase3Up && (toUpper str player) in (["PL3","PS3"])) then {
		_pb3 = ["Pack Up Plt.3 Base", [4], "", -5, [["expression", "[3] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};
	if (CommandBaseUp && (toUpper str player) in (["HQ4", "HQ5", "HQ6"])) then {
		_pb4 = ["Pack Up Company HQ", [5], "", -5, [["expression", "[4] spawn AUSMD_fnc_removePatrolBase;"]], "1", "1", ""];
	};
	if (WeaponsBaseUp && (toUpper str player) in (["WSL", "ASL"])) then {
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

// Admin Panel
// commMenu
// Tile System Status
_tileSystemStatus = format ["
	if (disableSpawning) then {
		disableSpawning = false;
		publicVariable 'disableSpawning';
		hint 'Tile System: Enabled';
	} else {
		disableSpawning = true;
		publicVariable 'disableSpawning';
		hint 'Tile System: Disabled';
	};
"];
private ["_apOption1","_apOption2"];
if ((toUpper str player) in (["OPS","BOS","ROS","A11","A12","A13","A21","A22","A23","A31","A32","A33","PS1","PS2","PS3","WSL","HQ5","BFS","RSM","PL1","PL2","PL3","HP2","HP3","HP1","HQ6","BXO","BPO","BLO","RXO","RCO"])) then {
	comm_adminPanel = [player,"adminPanel",nil,nil,""] call BIS_fnc_addCommMenuItem;
	if ((toUpper str player) in (["OPS","BOS","ROS","A11","A12","A13","A21","A22","A23","A31","A32","A33","PS1","PS2","PS3","WSL","HQ5","BFS","RSM","PL1","PL2","PL3","HP2","HP3","HP1","HQ6","BXO","BPO","BLO","RXO","RCO"])) then {
		_apOption1 = ["Vehicle Lock", [2], "", -5, [["expression", "[] spawn AUSMD_fnc_lockUnlock;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"];
	} else {_apOption1 = []};
	if ((toUpper str player) in (["OPS","BOS","ROS"])) then {
		_apOption2 = ["Tile System Toggle", [3], "", -5, [["expression", _tileSystemStatus]], "1", "1", ""];
	} else {_apOption2 = []};
	ADMIN_CONTROL = 
	[
		["Admin Panel",false],
		_apOption1,
		_apOption2
	];
	publicVariable "ADMIN_CONTROL";
};

// Radio Control --for Backups only
_backupData = ([CHANNEL_BACKUPS, (str player)] call kk_fnc_findAll);
if (!(count _backupData == 0)) then {
	comm_radioControl = [player,"radioControl",nil,nil,""] call BIS_fnc_addCommMenuItem;
	RADIO_CONTROL = [["Radio Control",false], [], [], [], [], []];
	{ // forEach entry in the _backupData array:
		_x deleteAt 2;	// Delete the last, and 2nd last index
		_x deleteAt 1;
		_chanName = ([CHANNELS, _x] call kk_fnc_findAllGetPath) select 0;	// Gets name of channel
		[false, _chanName, player, (_x select 0)] call asg_fnc_RadioControl;	// exec radioControl function
	} forEach _backupData;
};