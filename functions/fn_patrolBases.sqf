_platoon = _this select 0;
_position = _this select 1;

_centerPos = _position;

if(_centerPos distance (getMarkerPos "HQ") < 200) exitWith {hint "Too close to base to deploy a patrol base.";};

if(_platoon isEqualTo 1 && _centerPos distance getMarkerPos "PB2" < 30 || _centerPos distance getMarkerPos "PB3" < 30) exitWith {"PB1" setMarkerPos [0,0,0];"PB1" setMarkerColor "ColorBlack";"PB1" SetMarkerText ""; hint "Too close to another patrol base.";};
if(_platoon isEqualTo 2 && _centerPos distance getMarkerPos "PB3" < 30 || _centerPos distance getMarkerPos "PB1" < 30) exitWith {"PB2" setMarkerPos [0,0,0];"PB2" setMarkerColor "ColorBlack";"PB2" SetMarkerText "";hint "Too close to another patrol base.";};
if(_platoon isEqualTo 3 && _centerPos distance getMarkerPos "PB2" < 30 || _centerPos distance getMarkerPos "PB1" < 30) exitWith {"PB3" setMarkerPos [0,0,0];"PB3" setMarkerColor "ColorBlack";"PB3" SetMarkerText ""; hint "Too close to another patrol base.";};
_centerPos set[2,0];

switch(_platoon) do
{
	case 1: 
	{
		"PB1" SetMarkerPos _centerPos;
		"PB1" SetMarkerType "mil_flag";
		"PB1" SetMarkerColor "ColorRed";
		"PB1" SetMarkerText "Platoon 1 Patrol Base";
		
		patrolBase1Up = true;
		publicVariable "patrolBase1Up";
	};
	case 2:
	{
		"PB2" SetMarkerPos _centerPos;
		"PB2" SetMarkerType "mil_flag";
		"PB2" SetMarkerColor "ColorGreen";
		"PB2" SetMarkerText "Platoon 2 Patrol Base";
		
		patrolBase2Up = true;
		publicVariable "patrolBase2Up";
	};
	case 3:
	{
		"PB3" SetMarkerPos _centerPos;
		"PB3" SetMarkerType "mil_flag";
		"PB3" SetMarkerColor "ColorBlue";
		"PB3" SetMarkerText "Platoon 3 Patrol Base";
		patrolBase3Up = true;
		publicVariable "patrolBase3Up";
	};
	case 4:
	{
		"CB" SetMarkerPos _centerPos;
		"CB" SetMarkerType "mil_flag";
		"CB" SetMarkerColor "ColorUNKNOWN";
		"CB" SetMarkerText "Company HQ Base";
		commandBaseUp = true;
		publicVariable "commandBaseUp";
	};
	case 5:
	{
		"WS" SetMarkerPos _centerPos;
		"WS" SetMarkerType "mil_flag";
		"WS" SetMarkerColor "ColorUNKNOWN";
		"WS" SetMarkerText "Weapons Squad Base";
		WeaponsBaseUp = true;
		publicVariable "WeaponsBaseUp";
	};
};

sleep 1;

switch(_platoon) do
{
	case 1: 
	{
		_objObjects = [_centerPos,getDir player,[
		["Land_ClutterCutter_small_F",[-2.87207,0.0136719,0],0,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[0.0537109,-2.91309,0],360,1,0,[0,0],"","",true,false], 
		["CamoNet_BLUFOR_big_F",[0.983398,2.96777,0],30,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[0.158203,3.77637,0],0,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[3.81641,-0.301758,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-4.84082,3.05762,-5.72205e-006],300.722,1,0,[-0.0390356,0.0656747],"","",true,false], 
		["Land_BagFence_Long_F",[5.16309,2.87207,-7.62939e-006],60.7215,1,0,[7.25374e-008,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[-5.10156,-2.98242,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-2.95996,-5.60059,0],180.721,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-6.37598,0.467773,-7.62939e-006],300.722,1,0,[-0.0390394,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[-3.30566,5.63379,5.72205e-006],300.722,1,0,[0.026632,0.104703],"","",true,false], 
		["Land_BagFence_Long_F",[3.17285,-5.75879,1.90735e-005],180.721,1,0,[0.0773462,-0.0754283],"","",true,false], 
		["Land_ClutterCutter_small_F",[5.7666,-3.19238,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[3.67871,5.53613,-1.33514e-005],60.7216,1,0,[-0.0373616,-0.0666368],"","",true,false], 
		["Land_BagFence_Long_F",[6.64746,0.276367,0],60.7215,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-7.8916,-2.12207,-9.53674e-006],300.722,1,0,[-0.0390394,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[-6.01855,-5.5498,0],180.722,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-1.76074,8.20996,3.8147e-006],300.722,1,0,[-0.0390398,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[2.19434,8.16602,-1.33514e-005],60.7216,1,0,[-0.0373616,-0.0666368],"","",true,false], 
		["Land_BagFence_Long_F",[8.13965,-2.36035,0],60.7215,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[6.18262,-5.81543,7.62939e-006],180.721,1,0,[0.0773478,-0.0754282],"","",true,false], 
		["Land_BagFence_Round_F",[-8.47168,-4.64551,7.62939e-005],60,1,0,[-0.0373792,0],"","",true,false], 
		["Land_BagFence_Round_F",[0.24707,9.90723,-0.000429153],180,1,0,[0.152674,4.31073e-008],"","",true,false], 
		["Land_BagFence_Round_F",[8.67285,-4.99316,0],300,1,0,[0,0],"","",true,false]
	]] call BIS_fnc_objectsMapper;

	sleep 1;

	_boxHolders = nearestObjects[_centerPos,["Land_ClutterCutter_small_F"],20];

	_box1 = _boxHolders select 0;
	_box2 = _boxHolders select 1;
	_box3 = _boxHolders select 2;
	_box4 = _boxHolders select 3;
	_box5 = _boxholders select 4;
	_box6 = _boxHolders select 5;
	
	{
		detach _x;
	} forEach [RSE1,RSL1,PHQ1,RS1,RS2,RS3];
	RSE1 attachTo[_box1,[0,0,0.2]];
	RSL1 attachTo[_box2,[0,0,0.2]];
	PHQ1 attachTo[_box3,[0,0,0.2]];
	RS1 attachTo[_box4,[0,0,0.2]];
	RS2 attachTo[_box5,[0,0,0.2]];
	RS3 attachTo[_box6,[0,0,0.2]];
	{_x setVectorUp (surfaceNormal position _x);} forEach _objObjects;
	};
	case 2:
	{

		_objObjects = [_centerPos,getDir player,[
		["Land_ClutterCutter_small_F",[-2.87207,0.0136719,0],0,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[0.0537109,-2.91309,0],360,1,0,[0,0],"","",true,false], 
		["CamoNet_BLUFOR_big_F",[0.983398,2.96777,0],30,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[0.158203,3.77637,0],0,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[3.81641,-0.301758,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-4.84082,3.05762,-5.72205e-006],300.722,1,0,[-0.0390356,0.0656747],"","",true,false], 
		["Land_BagFence_Long_F",[5.16309,2.87207,-7.62939e-006],60.7215,1,0,[7.25374e-008,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[-5.10156,-2.98242,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-2.95996,-5.60059,0],180.721,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-6.37598,0.467773,-7.62939e-006],300.722,1,0,[-0.0390394,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[-3.30566,5.63379,5.72205e-006],300.722,1,0,[0.026632,0.104703],"","",true,false], 
		["Land_BagFence_Long_F",[3.17285,-5.75879,1.90735e-005],180.721,1,0,[0.0773462,-0.0754283],"","",true,false], 
		["Land_ClutterCutter_small_F",[5.7666,-3.19238,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[3.67871,5.53613,-1.33514e-005],60.7216,1,0,[-0.0373616,-0.0666368],"","",true,false], 
		["Land_BagFence_Long_F",[6.64746,0.276367,0],60.7215,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-7.8916,-2.12207,-9.53674e-006],300.722,1,0,[-0.0390394,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[-6.01855,-5.5498,0],180.722,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-1.76074,8.20996,3.8147e-006],300.722,1,0,[-0.0390398,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[2.19434,8.16602,-1.33514e-005],60.7216,1,0,[-0.0373616,-0.0666368],"","",true,false], 
		["Land_BagFence_Long_F",[8.13965,-2.36035,0],60.7215,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[6.18262,-5.81543,7.62939e-006],180.721,1,0,[0.0773478,-0.0754282],"","",true,false], 
		["Land_BagFence_Round_F",[-8.47168,-4.64551,7.62939e-005],60,1,0,[-0.0373792,0],"","",true,false], 
		["Land_BagFence_Round_F",[0.24707,9.90723,-0.000429153],180,1,0,[0.152674,4.31073e-008],"","",true,false], 
		["Land_BagFence_Round_F",[8.67285,-4.99316,0],300,1,0,[0,0],"","",true,false]
	]] call BIS_fnc_objectsMapper;

	sleep 1;

	_boxHolders = nearestObjects[_centerPos,["Land_ClutterCutter_small_F"],20];

	_box1 = _boxHolders select 0;
	_box2 = _boxHolders select 1;
	_box3 = _boxHolders select 2;
	_box4 = _boxHolders select 3;
	_box5 = _boxholders select 4;
	_box6 = _boxHolders select 5;

	{
		detach _x;
	} forEach [RSE2,RSL2,PHQ2,RS4,RS5,RS6];
	RSE2 attachTo[_box1,[0,0,0.2]];
	RSL2 attachTo[_box2,[0,0,0.2]];
	PHQ2 attachTo[_box3,[0,0,0.2]];
	RS4 attachTo[_box4,[0,0,0.2]];
	RS5 attachTo[_box5,[0,0,0.2]];
	RS6 attachTo[_box6,[0,0,0.2]];
	{_x setVectorUp (surfaceNormal position _x);} forEach _objObjects;
	};
	case 3:
	{
		_objObjects = [_centerPos,getDir player,[
		["Land_ClutterCutter_small_F",[-2.87207,0.0136719,0],0,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[0.0537109,-2.91309,0],360,1,0,[0,0],"","",true,false], 
		["CamoNet_BLUFOR_big_F",[0.983398,2.96777,0],30,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[0.158203,3.77637,0],0,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[3.81641,-0.301758,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-4.84082,3.05762,-5.72205e-006],300.722,1,0,[-0.0390356,0.0656747],"","",true,false], 
		["Land_BagFence_Long_F",[5.16309,2.87207,-7.62939e-006],60.7215,1,0,[7.25374e-008,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[-5.10156,-2.98242,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-2.95996,-5.60059,0],180.721,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-6.37598,0.467773,-7.62939e-006],300.722,1,0,[-0.0390394,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[-3.30566,5.63379,5.72205e-006],300.722,1,0,[0.026632,0.104703],"","",true,false], 
		["Land_BagFence_Long_F",[3.17285,-5.75879,1.90735e-005],180.721,1,0,[0.0773462,-0.0754283],"","",true,false], 
		["Land_ClutterCutter_small_F",[5.7666,-3.19238,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[3.67871,5.53613,-1.33514e-005],60.7216,1,0,[-0.0373616,-0.0666368],"","",true,false], 
		["Land_BagFence_Long_F",[6.64746,0.276367,0],60.7215,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-7.8916,-2.12207,-9.53674e-006],300.722,1,0,[-0.0390394,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[-6.01855,-5.5498,0],180.722,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-1.76074,8.20996,3.8147e-006],300.722,1,0,[-0.0390398,0.0656748],"","",true,false], 
		["Land_BagFence_Long_F",[2.19434,8.16602,-1.33514e-005],60.7216,1,0,[-0.0373616,-0.0666368],"","",true,false], 
		["Land_BagFence_Long_F",[8.13965,-2.36035,0],60.7215,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[6.18262,-5.81543,7.62939e-006],180.721,1,0,[0.0773478,-0.0754282],"","",true,false], 
		["Land_BagFence_Round_F",[-8.47168,-4.64551,7.62939e-005],60,1,0,[-0.0373792,0],"","",true,false], 
		["Land_BagFence_Round_F",[0.24707,9.90723,-0.000429153],180,1,0,[0.152674,4.31073e-008],"","",true,false], 
		["Land_BagFence_Round_F",[8.67285,-4.99316,0],300,1,0,[0,0],"","",true,false]
	]] call BIS_fnc_objectsMapper;

	sleep 1;

	_boxHolders = nearestObjects[_centerPos,["Land_ClutterCutter_small_F"],20];

	_box1 = _boxHolders select 0;
	_box2 = _boxHolders select 1;
	_box3 = _boxHolders select 2;
	_box4 = _boxHolders select 3;
	_box5 = _boxholders select 4;
	_box6 = _boxHolders select 5;
	
	{
		detach _x;
	} forEach [RSE3,RSL3,PHQ3,RS7,RS8,RS9];
	RSE3 attachTo[_box1,[0,0,0.2]];
	RSL3 attachTo[_box2,[0,0,0.2]];
	PHQ3 attachTo[_box3,[0,0,0.2]];
	RS7 attachTo[_box4,[0,0,0.2]];
	RS8 attachTo[_box5,[0,0,0.2]];
	RS9 attachTo[_box6,[0,0,0.2]];
	{_x setVectorUp (surfaceNormal position _x);} forEach _objObjects;
	};
	case 4:
	{
	_objObjects = [_centerPos,getDir player,[
	["Land_ClutterCutter_small_F",[-2.23633,-1.97656,0],0,1,0,[0,0],"","",true,false], 
	["Land_ClutterCutter_small_F",[-0.536133,-3.67578,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-3.93652,0.724609,0],44.2515,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-1.23633,4.125,0.000886917],44.2361,1,0,[-0.907362,0.822398],"","",true,false], 
	["Land_ClutterCutter_small_F",[2.36426,4.125,0],359.996,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-4.83594,-0.275391,0],44.2515,1,0,[0,0],"","",true,false], 
	["Land_ClutterCutter_small_F",[4.76367,1.52344,0],359.948,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-3.53613,-3.67578,0.000371933],44.2416,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-4.23633,-3.07617,0],44.2415,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-2.93652,-4.375,0.000680923],44.2466,1,0,[-0.766096,-0.746211],"","",true,false], 
	["Land_HBarrier_1_F",[-0.236328,5.32422,0.000867844],44.2361,1,0,[-0.907362,0.822398],"","",true,false], 
	["Land_HBarrier_1_F",[-2.03613,-5.07617,0.000679016],44.2466,1,0,[-0.766096,-0.746211],"","",true,false], 
	["Land_HBarrier_1_F",[-5.03613,-2.27539,0],44.2515,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-1.33594,-5.77539,0.000644684],44.2466,1,0,[-0.766096,-0.746211],"","",true,false], 
	["Land_HBarrier_1_F",[-5.73633,-1.47656,0],44.2515,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[0.364258,6.02344,0.000867844],44.2361,1,0,[-0.907362,0.822398],"","",true,false], 
	["Land_HBarrier_1_F",[-0.536133,-6.47656,0.000646591],44.2466,1,0,[-0.766096,-0.746211],"","",true,false], 
	["Land_HBarrier_1_F",[1.36426,7.02344,0.000869751],44.2361,1,0,[-0.907362,0.822398],"","",true,false], 
	["Land_HBarrier_Big_F",[-6.33594,3.625,0],314.565,1,0,[0,0],"","",true,false], 
	["Land_ClutterCutter_small_F",[7.46387,-1.17578,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[8.46387,2.72461,-0.000577927],225.768,1,0,[2.36369,0.896014],"","",true,false], 
	["Land_HBarrier_Big_F",[2.46387,8.625,-0.00108337],225.741,1,0,[0.712622,-0.801084],"","",true,false], 
	["Land_ClutterCutter_small_F",[5.26367,-7.97656,0],0,1,0,[0,0],"","",true,false], 
	["Land_Cargo_House_V3_F",[9.26367,-5.57617,0],133.641,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[-11.8359,-2.375,0],314.565,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[5.06348,-11.375,-0.000205994],223.621,1,0,[0.331824,0.316224],"","",true,false], 
	["Land_ClutterCutter_small_F",[7.56348,-10.375,0],359.96,1,0,[0,0],"","",true,false], 
	["Land_Communication_F",[-12.6357,-6.17578,0.00131226],0,1,0,[-0.534743,0],"","",true,false], 
	["Land_HBarrier_Big_F",[14.1641,-2.875,-0.000576019],225.768,1,0,[2.36369,0.896014],"","",true,false], 
	["Land_HBarrier_Big_F",[-12.7363,-8.375,0.00175858],224.983,1,0,[-0.378012,0.378239],"","",true,false], 
	["Land_HBarrier_Big_F",[13.2637,-8.47656,0],314.565,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[7.86426,-14.375,0.000804901],314.588,1,0,[0.657501,1.29155],"","",true,false], 
	["Land_BarGate_F",[-5.93652,-17.7754,0.184792],41.1023,1,0,[-1.71061,-0.478994],"","",true,false], 
	["Land_HBarrier_Big_F",[-1.43652,-17.9766,0.000734329],223.765,1,0,[0.115002,0.321714],"","",true,false], 
	["Land_HBarrier_Big_F",[3.76367,-18.875,-0.000642776],314.587,1,0,[0.320202,-0.5425],"","",true,false]
	]] call BIS_fnc_objectsMapper;

	sleep 1;

	_boxHolders = nearestObjects[_centerPos,["Land_ClutterCutter_small_F"],20];

	_box1 = _boxHolders select 0;
	_box2 = _boxHolders select 1;
	_box3 = _boxHolders select 2;
	_box4 = _boxHolders select 3;
	_box5 = _boxholders select 4;
	_box6 = _boxHolders select 5;
	{
		detach _x;
	} forEach [CHQ,CHE];
	CHQ attachTo[_box1,[0,0,0.2]];
	CHE attachTo[_box2,[0,0,0.2]];
	{_x setVectorUp (surfaceNormal position _x);} forEach _objObjects;
	};
	case 5:
	{
		_objObjects = [_centerPos,getDir player,[
		["Land_HBarrier_1_F",[-2.43848,5.74219,0.000120163],313.317,1,0,[0.4685,-0.608211],"","",true,false], 
		["Land_HBarrier_1_F",[-1.63867,6.54297,0.000461578],218.432,1,0,[-0.645896,-0.415005],"","",true,false], 
		["Land_HBarrier_1_F",[-3.33887,6.54297,0.00012207],313.317,1,0,[0.4685,-0.608211],"","",true,false], 
		["Land_PortableLight_double_F",[6.26172,-4.35742,0.0048027],62.297,1,0,[1.43524,-1.70242],"","",true,false], 
		["Land_HBarrier_1_F",[-0.638672,7.64258,0.0025425],218.373,1,0,[-1.87869,1.14271],"","",true,false], 
		["Land_BarGate_F",[1.76172,-9.95703,0.0624943],35.477,1,0,[-0.551299,-0.674323],"","",true,false], 
		["Land_HBarrier_1_F",[-4.23828,7.3418,0.000146866],313.317,1,0,[0.4685,-0.608211],"","",true,false], 
		["Land_HBarrier_Big_F",[-8.03906,-2.35742,0.00581169],222.038,1,0,[-1.3289,0.447389],"","",true,false], 
		["Land_Sign_WarningMilitaryArea_F",[-6.73828,-5.25781,0.000499725],42.6476,1,0,[1.33358,-0.433235],"","",true,false], 
		["Land_Sacks_goods_F",[-2.83887,8.24219,0.000518799],359.998,1,0,[0.763899,-0.0764229],"","",true,false], 
		["Land_HBarrier_1_F",[0.361328,8.74219,0.000535965],218.433,1,0,[-0.37797,0.967805],"","",true,false], 
		["Land_Cargo_Patrol_V3_F",[9.86133,-0.757813,-0.0214825],310.821,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[1.06152,9.64258,0.000572205],218.426,1,0,[-0.61721,0.777987],"","",true,false], 
		["Land_HBarrier_1_F",[-5.23828,8.24219,0.000144958],313.317,1,0,[0.4685,-0.608211],"","",true,false], 
		["Land_Sacks_goods_F",[-4.43848,9.54297,4.95911e-005],19.7532,1,0,[0.0977202,-0.0460812],"","",true,false], 
		["Land_HBarrier_Big_F",[9.56152,-4.45703,0.00487518],133.201,1,0,[-1.09525,-2.18042],"","",true,false], 
		["Land_HBarrier_Big_F",[5.66113,-8.95703,0.00469589],130.646,1,0,[0.934465,2.3113],"","",true,false], 
		["Land_HBarrier_1_F",[-6.03906,8.94336,0.00012207],313.317,1,0,[0.4685,-0.608211],"","",true,false], 
		["Land_HBarrier_1_F",[1.96094,10.7422,0.000572205],218.426,1,0,[-0.61721,0.777987],"","",true,false], 
		["Land_Pallet_MilBoxes_F",[-2.13867,10.6426,0],43.7031,1,0,[0,0],"","",true,false], 
		["Land_PortableLight_double_F",[11.3613,3.04297,0.0371838],202.336,1,0,[0.427797,-0.237177],"","",true,false], 
		["Land_HBarrier_1_F",[-7.13867,9.74219,5.72205e-006],313.321,1,0,[-0.00316562,-0.107994],"","",true,false], 
		["Land_HBarrier_1_F",[2.96094,11.8418,0.000572205],218.426,1,0,[-0.61721,0.777987],"","",true,false], 
		["Land_Sacks_heap_F",[-6.23828,10.8418,3.8147e-006],322.215,1,0,[0.013569,-0.107185],"","",true,false], 
		["Land_FieldToilet_F",[12.7695,2.34766,0.000112534],222.8,1,0,[0.482819,-0.0735614],"","",true,false], 
		["Land_HBarrier_1_F",[-8.13867,10.7422,3.8147e-006],313.321,1,0,[-0.00316562,-0.107994],"","",true,false], 
		["Land_PaperBox_closed_F",[-4.43848,12.8418,0],0,1,0,[0,0],"","",true,false], 
		["Land_Cargo_House_V3_F",[-2.03906,13.043,0],224.425,1,0,[0,0],"","",true,false], 
		["Land_Basket_F",[-7.63867,11.9434,4.00543e-005],359.895,1,0,[0.0845183,-0.0644661],"","",true,false], 
		["Land_Basket_F",[-6.83887,12.543,4.00543e-005],359.788,1,0,[0.0840743,-0.0646953],"","",true,false], 
		["Land_HBarrier_Big_F",[14.2617,1.04297,0.00591469],133.219,1,0,[-1.45582,0.0993339],"","",true,false], 
		["Land_Basket_F",[-7.63867,12.8418,3.8147e-005],359.806,1,0,[0.0841264,-0.0647241],"","",true,false], 
		["Land_HBarrier_1_F",[-9.23828,11.7422,-3.8147e-006],313.321,1,0,[0.0524142,-0.0555798],"","",true,false], 
		["Land_HBarrier_Big_F",[-14.6387,3.04297,-0.00038147],222.063,1,0,[0.142483,-0.385933],"","",true,false], 
		["Land_HBarrier_1_F",[11.7617,10.043,0.000581741],44.6372,1,0,[-0.491975,-0.915148],"","",true,false], 
		["Land_HBarrier_1_F",[6.56152,15.1426,0.000612259],44.6372,1,0,[-0.491975,-0.915148],"","",true,false], 
		["Land_HBarrier_1_F",[12.7617,10.8418,0.000991821],44.6449,1,0,[-0.923918,-0.912536],"","",true,false], 
		["Land_HBarrier_1_F",[7.26172,15.8418,0.00094986],44.6449,1,0,[-0.923918,-0.912536],"","",true,false], 
		["Land_HBarrier_1_F",[13.7617,11.8418,0.00094986],44.6449,1,0,[-0.923918,-0.912536],"","",true,false], 
		["Land_ClutterCutter_small_F",[5.86133,17.2422,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[8.16113,16.7422,0],44.6418,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[14.6611,12.7422,0.00113106],44.6441,1,0,[-1.19225,-0.640812],"","",true,false], 
		["Land_ClutterCutter_small_F",[3.06152,19.543,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[9.16113,17.6426,0],44.6418,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-10.4385,16.9434,1.90735e-006],312.916,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[19.2617,6.64258,0.000810623],133.213,1,0,[-0.330688,-0.205857],"","",true,false], 
		["Land_ClutterCutter_small_F",[8.26172,18.8418,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[15.7617,13.7422,0.00111961],44.6441,1,0,[-1.19225,-0.640812],"","",true,false], 
		["Land_HBarrier_1_F",[10.1611,18.6426,0],44.6285,1,0,[0,0],"","",true,false], 
		["Land_ClutterCutter_small_F",[5.46094,21.043,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[13.4609,17.4434,0],44.6267,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[14.2617,16.9434,2.86102e-005],44.6276,1,0,[0.321994,-0.326207],"","",true,false], 
		["Land_HBarrier_1_F",[12.7617,18.1426,0],44.6285,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[15.9609,15.4434,0.000183105],44.6304,1,0,[-0.00419238,-0.648191],"","",true,false], 
		["Land_HBarrier_1_F",[15.1611,16.2422,0.000152588],44.6304,1,0,[-0.00419238,-0.648191],"","",true,false], 
		["Land_HBarrier_1_F",[16.7617,14.7422,0.000139236],44.6304,1,0,[-0.00419238,-0.648191],"","",true,false], 
		["Land_ClutterCutter_small_F",[-0.838867,22.3418,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-14.8389,16.7422,1.90735e-006],221.285,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[11.9609,18.9434,0],44.6285,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[11.2617,19.543,0],44.6285,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-21.0391,8.74219,0.000226974],222.065,1,0,[-0.11342,-0.102357],"","",true,false], 
		["Land_HBarrier_Big_F",[20.2617,12.1426,0.00102425],222.485,1,0,[0.0284553,0.64758],"","",true,false], 
		["Land_ClutterCutter_small_F",[2.96094,23.3418,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-12.9385,20.043,0],311.212,1,0,[0,-0],"","",true,false], 
		["Land_PortableLight_double_F",[-21.9229,9.5332,-0.110714],17.7121,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[7.66113,22.8418,1.90735e-006],222.481,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-12.3389,20.6426,0],311.212,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-11.5391,21.4434,0],311.212,1,0,[0,0],"","",true,false], 
		["Land_PortableLight_double_F",[-22.4209,9.83984,-0.12158],143.034,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-11.0391,22.1426,0],311.212,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-10.2383,23.1426,0],311.212,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-18.9385,16.8418,7.62939e-006],311.212,1,0,[-0.00713777,-0.107804],"","",true,false], 
		["Land_HBarrier_1_F",[-19.6387,16.043,3.8147e-006],311.212,1,0,[-0.00713777,-0.107804],"","",true,false], 
		["Land_HBarrier_1_F",[-18.3389,17.543,9.53674e-006],311.212,1,0,[-0.00713777,-0.107804],"","",true,false], 
		["Land_HBarrier_1_F",[-20.3389,15.2422,3.8147e-006],311.212,1,0,[-0.00713777,-0.107804],"","",true,false], 
		["Land_ClutterCutter_small_F",[0.460938,25.4434,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-20.9385,14.543,5.72205e-006],311.212,1,0,[-0.00713777,-0.107804],"","",true,false], 
		["Land_HBarrier_1_F",[-21.7383,13.7422,0],311.212,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_1_F",[-22.3389,13.043,0],311.212,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_1_F",[-23.0391,12.2422,0],311.212,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_1_F",[-16.4385,20.3418,0],311.212,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-15.7383,21.043,0],311.212,1,0,[0,-0],"","",true,false], 
		["Land_PowerGenerator_F",[-9.83887,24.4434,0],310.437,1,0,[0,-0],"","",true,false], 
		["Land_PortableLight_double_F",[-11.3252,23.9395,-0.0433064],148.199,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_1_F",[-15.2383,21.7422,0],311.212,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_1_F",[-11.3389,24.043,0],311.212,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-14.6387,22.3418,0],311.212,1,0,[0,-0],"","",true,false], 
		["Land_Cargo_Patrol_V3_F",[-6.83887,27.8418,0],129.482,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[1.56152,28.2422,1.90735e-006],222.481,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-10.3389,27.6426,1.90735e-006],312.917,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-2.23828,31.9434,1.90735e-006],222.481,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-6.83887,31.8418,1.90735e-006],132.166,1,0,[0,0],"","",true,false]
	]] call BIS_fnc_objectsMapper;
	
	sleep 1;

	_boxHolders = nearestObjects[_centerPos,["Land_ClutterCutter_small_F"],40];

	_box1 = _boxHolders select 0;
	_box2 = _boxHolders select 1;
	_box3 = _boxHolders select 2;
	_box4 = _boxHolders select 3;
	_box5 = _boxholders select 4;
	_box6 = _boxHolders select 5;
	
	{
		detach _x;
	} forEach [CHW,CWB,CWA];
	CHW attachTo[_box1,[0,0,0.2]];
	CWB attachTo[_box2,[0,0,0.2]];
	CWA attachTo[_box3,[0,0,0.2]];
	{_x setVectorUp (surfaceNormal position _x);} forEach _objObjects;
	};
};

sleep 1;

hint "Patrol Base Created";