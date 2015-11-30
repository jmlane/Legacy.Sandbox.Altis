_marker = AUSMD_staticLocs call BIS_fnc_selectRandom;
_unit = (getMarkerPos _marker);
_pos = [];
_pos = [_unit,10000] call AUSMD_fnc_findLoc;

sleep 5;

if(random 30 > 15) then
{
	_objObjects = [_pos,random 360,[
	["Land_HBarrier_1_F",[-1.69336,1.25684,2.09808e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_HBarrier_1_F",[-0.923828,2.125,5.72205e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[0.0878906,3.20801,5.72205e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[1.12695,4.21387,5.72205e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_Garbage_square5_F",[3.49414,-2.89551,-4.3869e-005],89.8478,1,0,[-0.0765987,0],"","",true,false], 
	["Land_HBarrier_1_F",[-3.92285,-3.44238,5.72205e-006],315.823,1,0,[0,-0],"","",true,false], 
	["Land_Pallet_MilBoxes_F",[3.61035,3.79395,0.000169754],89.8478,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[1.87988,5.0498,5.72205e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-4.92676,-2.56543,5.72205e-006],315.823,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_1_F",[-4.40137,3.54297,2.28882e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_HBarrier_1_F",[-3.22266,-4.66309,5.72205e-006],45.5341,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-3.4707,4.5293,2.09808e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_HBarrier_1_F",[-5.3623,2.64648,2.09808e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_HBarrier_1_F",[-6.0127,-1.49316,5.72205e-006],315.823,1,0,[0,-0],"","",true,false], 
	["CamoNet_BLUFOR_open_Curator_F",[6.89063,-1.8877,0.000303268],300.548,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_1_F",[-6.39551,1.60449,2.09808e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_HBarrier_1_F",[2.875,6.01367,2.28882e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_Scrap_MRAP_01_F",[5.24121,-4.25488,-0.000293732],89.8478,1,0,[0,0],"","",true,false], 
	["Land_Garbage_square5_F",[6.7832,1.41309,0],89.8478,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-6.84277,-0.617188,5.72205e-006],315.823,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_1_F",[-4.21973,-5.625,5.72205e-006],45.5341,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-7.4043,0.557617,5.72205e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[3.99121,7.16309,2.28882e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_HBarrier_1_F",[-5.14746,-6.47656,5.72205e-006],45.5341,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[4.58301,7.82227,2.28882e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_Cargo_Patrol_V3_F",[-1.8877,-10.0117,0.00121307],46.6848,1,0,[0,0],"","",true,false], 
	["CargoNet_01_barrels_F",[-2.33594,9.48633,5.72205e-006],299.065,1,0,[-0.000313736,-0.000204391],"","",true,false], 
	["Land_PaperBox_closed_F",[10.1943,-2.17676,0],316.783,1,0,[0,-0],"","",true,false], 
	["Land_CncWall4_F",[8.50488,-7.08594,0.00143814],132.597,1,0,[0,-0],"","",true,false], 
	["CargoNet_01_barrels_F",[-3.63867,10.7881,5.72205e-006],234.774,1,0,[-0.000316475,-0.000353021],"","",true,false], 
	["Land_PaperBox_closed_F",[11.5918,-0.671875,-1.71661e-005],89.8478,1,0,[-0.0765987,-0.0761929],"","",true,false], 
	["Land_CncWall4_F",[5.02148,-10.6895,0.00115395],132.99,1,0,[-0.0558818,-0.0520921],"","",true,false], 
	["Land_CncWall4_F",[-9.08789,-8.43262,0],45.9919,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[11.7979,-3.37598,0.00190735],132.204,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-5.88086,-11.7207,0],45.9919,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-11.8271,5.76465,5.14984e-005],136.954,1,0,[0.00368473,-0.107977],"","",true,false], 
	["Land_CncWall4_F",[-12.4063,-4.83594,0],45.9919,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[-3.34277,13.3838,4.95911e-005],136.954,1,0,[0.00368473,-0.107977],"","",true,false], 
	["MetalBarrel_burning_F",[13.7813,2.23145,1.90735e-006],89.8478,1,0,[-0.0765987,-0.0761929],"","",true,false], 
	["Land_HBarrier_1_F",[-3.94922,13.8818,2.09808e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_CncWall4_F",[1.625,-14.4023,0.00152588],132.623,1,0,[-0.00448133,-0.107947],"","",true,false], 
	["Land_CncWall4_F",[1.625,-14.4023,0.00152588],132.623,1,0,[-0.00448133,-0.107947],"","",true,false], 
	["Land_CncWall4_F",[-2.39551,-15.0859,0],45.9919,1,0,[0,0],"","",true,false], 
	["MetalBarrel_burning_F",[-15.2363,0.420898,1.90735e-006],89.8478,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[15.1885,0.336914,0.0069313],131.811,1,0,[-0.00601069,-0.107873],"","",true,false], 
	["Land_HBarrier_1_F",[-4.75098,14.6865,2.67029e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_CncWall4_F",[-15.5107,2.28125,0],136.955,1,0,[0,-0],"","",true,false], 
	["Land_CncWall4_F",[-15.71,-1.34375,0],45.9919,1,0,[0,0],"","",true,false], 
	["Land_CampingChair_V2_F",[13.5625,8.33203,-0.0250092],215.065,1,0,[0.00316411,-0.00463425],"","",true,false], 
	["Land_CampingChair_V2_F",[12.7617,9.52441,-0.0250092],225.69,1,0,[0.00342182,-0.00443556],"","",true,false], 
	["Land_Cargo_HQ_V3_F",[11.5527,12.2256,-0.000234604],45.6178,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-5.45117,15.4805,2.28882e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_CncWall1_F",[-0.523438,-16.6953,0.00143814],132.623,1,0,[0,0],"","",true,false], 
	["Land_TableDesk_F",[13.9629,9.83105,-0.0249996],46.0207,1,0,[0.00349227,0.00138769],"","",true,false], 
	["Land_OfficeChair_01_F",[14.9541,10.5371,-0.0250034],43.1244,1,0,[-0.00400188,-0.00769753],"","",true,false], 
	["Land_HBarrier_1_F",[-2.46191,18.2861,2.47955e-005],44.4958,1,0,[-0.108036,0.000950735],"","",true,false], 
	["Land_PlasticCase_01_large_F",[16.4688,8.44043,-0.0249672],44.5221,1,0,[0.00194752,0.0122749],"","",true,false], 
	["Land_HBarrier_1_F",[1.23828,18.6992,7.62939e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[18.5771,4.04004,0.0114346],131.418,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-1.46582,19.293,5.72205e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[0.438477,19.499,3.8147e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[3.23438,19.5,0],136.955,1,0,[0,0],"","",true,false], 
	["Land_PlasticCase_01_large_F",[17.6543,9.54688,-0.0249825],44.4492,1,0,[0.0977103,-0.176542],"","",true,false], 
	["Land_HBarrier_1_F",[-0.365234,20.293,7.62939e-006],44.4958,1,0,[0,0],"","",true,false], 
	["Land_OfficeCabinet_01_F",[16.8496,13.8389,-0.0249615],44.2138,1,0,[-0.00709399,0.00431161],"","",true,false], 
	["Land_OfficeCabinet_01_F",[17.5537,13.1396,-0.0249615],44.2147,1,0,[-0.00708133,0.00437594],"","",true,false], 
	["Land_JunkPile_F",[15.2432,15.6348,0.000570297],89.8478,1,0,[-0.0765987,-0.0761929],"","",true,false], 
	["Land_ShelvesWooden_F",[18.4639,12.1455,-0.0261116],309.831,1,0,[-0.124834,0.0112584],"","",true,false], 
	["Land_CncWall4_F",[21.8711,7.85156,0.0115337],131.025,1,0,[-0.0074899,-0.10778],"","",true,false], 
	["Land_CncWall4_F",[17.7285,15.9385,0.0114346],224.116,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[6.83105,22.8154,5.14984e-005],136.954,1,0,[0.00368473,-0.107977],"","",true,false], 
	["Land_CncWall4_F",[14.1963,19.4961,0.00655556],224.509,1,0,[0.054481,0.0535555],"","",true,false], 
	["Land_CncWall4_F",[21.3877,12.4678,0.0114326],223.723,1,0,[0,0],"","",true,false], 
	["Land_CncWall4_F",[10.6436,23.0596,0.00140572],224.902,1,0,[0.10804,-0.000184596],"","",true,false], 
	["Land_CncWall1_F",[23.2646,10.6279,0.00143814],223.723,1,0,[0,0],"","",true,false], 
	["Land_CncWall1_F",[23.5918,9.98633,0.00143814],132.623,1,0,[0,-0],"","",true,false]
	]] call BIS_fnc_objectsMapper;
}
else
{
	_objObjects = [_pos,random 360,[
	["Land_ClutterCutter_large_F",[-0.466797,-2.90527,3],53.7615,1,0,[0,0],"","",true,false], 
	["Land_ClutterCutter_large_F",[5.33301,1.29492,3],53.8371,1,0,[0,0],"","",true,false], 
	["Land_CampingChair_V2_F",[-5.36621,-2.10547,4.00543e-005],56.8886,1,0,[-0.0618199,0.0388541],"","",true,false], 
	["Land_CampingChair_V2_F",[-6.16602,-1.10547,3.8147e-005],32.0607,1,0,[-0.0383605,0.0622005],"","",true,false], 
	["Land_CampingTable_F",[-6.46582,-2.10449,0.000301361],53.7587,1,0,[-0.13724,0.0369933],"","",true,false], 
	["Land_MetalCase_01_large_F",[-3.76563,-5.70508,4.57764e-005],233.984,1,0,[0.117529,-0.0636193],"","",true,false], 
	["Land_MetalCase_01_large_F",[-1.61035,-6.86133,-2.09808e-005],321.192,1,0,[-0.00121594,0.00169186],"","",true,false], 
	["Land_CratesWooden_F",[-2.7666,-6.90527,-0.663994],52.8833,1,1,[0,0],"","",true,false], 
	["Land_TentA_F",[-0.966797,7.39453,0.100698],359.462,1,0,[0,-0],"","",true,false], 
	["Land_BagFence_Short_F",[3.83301,-6.50488,0.0494785],324.616,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[2.5332,7.39453,0.100225],359.463,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[6.13281,-3.80566,0.027216],320.942,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-1.4668,-9.60547,0.122688],322.592,1,0,[0,-0],"","",true,false], 
	["Land_GasTank_01_khaki_F",[-1.4668,-8.20508,1.52588e-005],51.1172,1,0,[-0.0115348,-0.0167188],"","",true,false], 
	["Land_MetalCase_01_small_F",[-2.46484,-8.10449,-1.33514e-005],263.642,1,0,[0.000184321,0.000261377],"","",true,false], 
	["Land_GasTank_01_khaki_F",[-1.9668,-8.30566,1.52588e-005],96.1366,1,0,[-0.011591,-0.0176423],"","",true,false], 
	["Land_TentA_F",[-4.36719,7.39453,0.100632],359.466,1,0,[0.000712007,0.0763928],"","",true,false], 
	["Land_CampingChair_V2_F",[-7.86621,3.59473,4.00543e-005],238.784,1,0,[0.0676784,-0.0425859],"","",true,false], 
	["Land_GasTank_01_khaki_F",[-2.06641,-8.60547,1.52588e-005],51.1024,1,0,[-0.0116002,-0.0166968],"","",true,false], 
	["Land_TentA_F",[9.33301,1.89453,0.102695],51.1856,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[6.0332,7.59473,0.100256],359.464,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-1.06641,9.99512,0],359.993,1,0,[0,-0],"","",true,false], 
	["Land_BagBunker_Tower_F",[-7.2666,-7.20508,0.00120544],325.141,1,0,[0.0873295,0.125375],"","",true,false], 
	["Land_HBarrier_5_F",[-6.2666,9.99512,0.0383587],360,1,0,[-0.076396,0.0763962],"","",true,false], 
	["Land_PaperBox_open_full_F",[-10.667,-2.60547,0.000530243],53.8694,1,0,[-0.168451,0.0283874],"","",true,false], 
	["Land_Pallet_F",[-11.4893,-1.37402,0.000141144],54.0057,1,0,[-0.23368,0.0497168],"","",true,false], 
	["Land_HBarrier_5_F",[10.1328,-0.405273,0.175524],320.627,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[4.2334,9.99512,0],359.999,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-5.4668,-12.9043,0.00331116],322.588,1,0,[0.0321474,0.167774],"","",true,false], 
	["Land_PaperBox_closed_F",[-11.9668,-3.60547,0.00104332],53.8538,1,0,[-0.230122,0.0734866],"","",true,false], 
	["Land_HBarrierTower_F",[11.5332,5.99512,0.0116329],230.505,1,0,[0,0],"","",true,false], 
	["Land_PaperBox_open_empty_F",[-12.8672,-2.20508,0.000574112],326.018,1,0,[0.064744,0.232733],"","",true,false], 
	["Land_BagFence_Short_F",[-6.66699,11.4951,1.14441e-005],253.649,1,0,[0.0948112,0.0517992],"","",true,false], 
	["Land_HBarrier_5_F",[-12.5664,-5.90527,0.00341797],55.4013,1,0,[-0.125759,0.0867509],"","",true,false], 
	["Land_Pallet_vertical_F",[-13.7578,-1.30273,5.34058e-005],324.292,1,0,[0.0823014,0.251897],"","",true,false], 
	["Land_Pallet_vertical_F",[-13.8398,-1.18848,0.000179291],324.4,1,0,[0.088987,0.327869],"","",true,false], 
	["Land_HBarrier_5_F",[-7.2666,-14.2051,0.00658417],322.575,1,0,[0.0321855,0.167767],"","",true,false], 
	["Land_BagBunker_Tower_F",[-13.7666,2.89453,0.000249863],55.9297,1,0,[-0.189836,0.128385],"","",true,false], 
	["Land_BagFence_Short_F",[-7.56641,11.9951,0.000694275],344.215,1,0,[-0.05274,0.0942973],"","",true,false], 
	["Land_HBarrier_5_F",[8.33301,9.99512,0],359.999,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-15.4668,-1.60547,0.00341797],55.4019,1,0,[-0.12576,0.0867496],"","",true,false], 
	["Land_HBarrier_5_F",[-9.66699,-10.2051,0.00341606],55.4134,1,0,[-0.125789,0.0867326],"","",true,false], 
	["Land_BagFence_Long_F",[-12.4668,9.09473,0.101952],58.7618,1,0,[-0.195947,0.118849],"","",true,false], 
	["Land_HBarrier_5_F",[13.5332,2.39453,0],320.612,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[15.833,5.39453,0],229.234,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[-12.2666,10.5947,4.76837e-005],331.8,1,0,[0.0409434,0.238075],"","",true,false], 
	["Land_HBarrier_5_F",[-18.3711,2.39746,0.0114708],326.259,1,0,[-0.233003,0.0637642],"","",true,false], 
	["Land_HBarrier_5_F",[-18.5693,2.69727,0.0131855],55.4108,1,0,[-0.0672067,-0.232034],"","",true,false], 
	["Land_CncBarrier_F",[16.1328,11.4951,6.10352e-005],351.694,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrier_F",[18.7334,6.49512,0.000244141],315.413,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[19.2334,9.99512,0.0565605],53.8069,1,0,[0,0],"","",true,false], 
	["Land_CncBarrier_F",[19.4336,11.8945,0.00106049],351.661,1,0,[0,-0],"","",true,false], 
	["Land_CncBarrier_F",[21.1328,8.89453,0.000593185],315.44,1,0,[0,0],"","",true,false]
	]] call BIS_fnc_objectsMapper;
};

{_x setVectorUp (surfaceNormal position _x);} forEach _objObjects;

_objUnits = [];

for "_i" from 0 to 2 do
{
	_group = [enemySide,20,_pos] call AUSMD_fnc_createGroup;
	//[_group,_pos,100,3] call AUSMD_fnc_Patrol;
	_objUnits = _objUnits + units _group;
};


for "_i" from 0 to round(random 3) + 1 do
{
	_group = [enemySide,200,_pos] call AUSMD_fnc_createGroup;
	[_group,_pos,800,8] call AUSMD_fnc_Patrol;
	_objUnits = _objUnits + units _group;
};

_random = round(random 2000);

_tskName = format["tskEnemyFort_%1",_random];

[_tskName,friendlySide,[format["Task ID: %1<br/><br/><br/>Eliminate all hostiles located at the enemy base.",_random],"Eliminate all hostiles","CLEAR"],(getPos (_objUnits select 0)),"ASSIGNED",1,True,True] spawn BIS_fnc_setTask;

waitUntil{{alive _x}  count _objUnits < 5};

_money = 100000 + round(150 * count _objUnits);
GV_Sand_Balance = GV_Sand_Balance + _money;
publicVariable "GV_Sand_Balance";

[[format["$ %1 received for completion of this mission",_money]],"AUSMD_fnc_globalMessage",true,false,false] spawn BIS_fnc_MP;

missionRunning = false;
publicVariable "misionRunning";

[_tskName,friendlySide,[format["Task ID: %1<br/><br/><br/> Eliminate all hostile's located at the enemy base. <br/> $ %2 was received for the completion of this mission.",_random,_money],"Eliminate all Hostile's","CLEAR"],(getPos (_objUnits select 0)),"SUCCEEDED",1,True,True] spawn BIS_fnc_setTask;

sleep 10800;

{deleteVehicle _x} forEach _objObjects;

