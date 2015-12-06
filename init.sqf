titleText["Please Wait...","BLACK OUT",0];

westGroups = [["B_Soldier_SL_F","B_soldier_AR_F","B_HeavyGunner_F","B_soldier_AAR_F","B_soldier_M_F","B_Sharpshooter_F","B_soldier_LAT_F","B_medic_F"],["B_Soldier_TL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"],["B_soldier_SL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_LAT_F"]];
eastGroups = [["I_Soldier_SL_F","I_Soldier_AR_F","I_soldier_M_F","I_Soldier_LAT_F","I_Soldier_TL_F","I_Soldier_TL_F","I_medic_F"],["I_Soldier_TL_F","I_Soldier_AT_F","I_Soldier_AT_F","I_Soldier_AAT_F"],["I_soldier_SL_F","I_soldier_F","I_soldier_LAT_F","I_soldier_M_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F"],["I_soldier_F","I_soldier_F","I_soldier_F"]];

AUSMD_acceptedObjects = 
[
	"Land_BarGate_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Short_F",
	"Land_BagFence_Round_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_CncBarrier_stripes_F",
	"Land_CncBarrier_F",
	"Land_HBarrier_1_F",
	"Land_Razorwire_F"
];
AUSMD_acceptedVehicles = ["C_Offroad_01_F","I_MRAP_03_F","O_MRAP_02_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_02_transport_F","B_MRAP_01_F","B_Truck_01_covered_F","O_Heli_Light_02_v2_F","O_Heli_Transport_04_F","B_Heli_Transport_01_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F","B_Heli_Light_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Heli_Light_01_civil_F"];

construction_Selection = 0;
construction_NearObjects = [];
myStructures = [];
construction_Building = false;
construction_Object = objNull;
construction_SnapToggle = false;

construction_Structures = [
	"Land_BarGate_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Short_F",
	"Land_BagFence_Round_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F"
];

if(isNil "GV_Sand_Balance") then
{
	GV_Sand_Balance = 500000;
};

sand_param_deathCost = 25000;

setViewDistance 2000;

if(isServer) then
{
	[false,30,false,true,30,3,true,[]] execVM "WerthlesHeadless.sqf";
};

myDeaths = 0;
AUSMD_earPlugIn = false;
stopCapturing = false;

AUSMD_centerMarkers = ["HQ","centerAltis","lowerAltis"];
AUSMD_platoon1Members = ["PL1","PS1", "CM1","RO1","A11","A11A","A11B","A113","A114","A116","A117","A12","A12A","A12B","A123","A124","A126","A127","A13","A13A","A13B","A133","A134","A136","A137"];
AUSMD_platoon2Members = ["PL2","PS2", "CM2","RO2","A21","A21A","A21B","A213","A214","A216","A217","A22","A22A","A22B","A223","A224","A226","A227","A23","A23A","A23B","A233","A234","A236","A237"];
AUSMD_platoon3Members = ["PL3","PS3", "CM3","RO3","A31","A31A","A31B","A313","A314","A316","A317","A32","A32A","A32B","A323","A324","A326","A327","A33","A33A","A33B","A333","A334","A336","A337"]; 
AUSMD_platoon4Members = ["SRO", "SCM", "OPS", "HQ4", "HQ5", "HQ6"];
AUSMD_platoon5Members = ["WS1","WS2","WS3","WS4", "WSL","ASL"];
AUSMD_platoon6Members = ["OPS"];
AUSMD_platoon7Members = ["HQ4","OPS","PL1","PS1"];
AUSMD_platoon8Members = ["HQ4","OPS","PL2","PS2"];
AUSMD_platoon9Members = ["HQ4","OPS","PL3","PS3"];
AUSMD_platoon10Members = ["OPS","HQ4","HQ5","HQ6"];
AUSMD_platoon11Members = ["OPS","HQ4","HQ5","HQ6","WSL"];
AUSMD_platoon12Members = ["OPS","HQ4","HQ5","HQ6","WSL","SRO", "SCM","PL1","PS1","PL2","PS2","PL3","PS3","A11","A12","A13","A23","A33","A21","A22","A31","A32","A33"];
AUSMD_platoon1Markers = [[9236.01,21559.9,0.000207901],[9235.23,21559.3,0.00891113],[9234.42,21558.8,0.00020179],[9237.61,21561.1,0.000236511],[9236.81,21560.5,0.000202179],[9238.43,21561.7,0.00209236]];
AUSMD_platoon2Markers = [[9260.89,21578.4,0.00062561],[9261.87,21579,0.000110626],[9262.63,21579.6,0.000436783],[9263.44,21580.2,6.86646e-005],[9264.21,21580.7,9.91821e-005],[9265.05,21581.3,3.43323e-005]];
AUSMD_platoon3Markers = [[9149.18,21614.7,0.00179768],[9148.37,21614.1,0.0140781],[9147.5,21613.6,0.00744247],[9145.92,21612.5,0.0168886],[9146.69,21613,0.0212688],[9145.16,21611.9,0.00319958]];
AUSMD_platoon4Markers = [[9155.74,21647.4,-0.025003],[9155.08,21648.2,-0.0250063]];
AUSMD_platoon5Markers = [[9156.57,21646.4,-0.024642],[9157.13,21645.6,-0.0247278],[9157.7,21644.7,-0.0217018]];
AUSMD_gridPositions = ["G0222","G0209","G0321","G0320","G0319","G0318","G0422","G0420","G0419","G0418","G0417","G0416","G0414","G0413","G0412","G0411","G0410","G0315","G0521","G0520","G0519","G0518","G0517","G0516","G0515","G0514","G0513","G0512","G0511","G0510","G0622","G0621","G0620","G0619","G0618","G0617","G0616","G0615","G0614","G0613","G0612","G0611","G0722","G0721","G0720","G0719","G0718","G0717","G0715","G0714","G0713","G0712","G0711","G0823","G0822","G0821","G0820","G0819","G0817","G0816","G0815","G0814","G0813","G0812","G0811","G0810","G0716","G0921","G0919","G0918","G0917","G0916","G0915","G0914","G0913","G0912","G0908","G0907","G1021","G1020","G1019","G1018","G1017","G1016","G1015","G1014","G1011","G1009","G1008","G1007","G1122","G1121","G1120","G1119","G1118","G1117","G1116","G1115","G1114","G1113","G1112","G1109","G1108","G1107","G1222","G1221","G1220","G1219","G1218","G1217","G1213","G1208","G1207","G1209","G1322","G1321","G1320","G1319","G1318","G1317","G1316","G1315","G1306","G1422","G1421","G1420","G1419","G1418","G1521","G1520","G1519","G1518","G1517","G1620","G1619","G1618","G1617","G1616","G1615","G1717","G1716","G1715","G1714","G1611","G1610","G1609","G1613","G1711","G1710","G1709","G1817","G1814","G1813","G1812","G1811","G1810","G1809","G1808","G1807","G1906","G1907","G1908","G1909","G1910","G1911","G1912","G1914","G1916","G1917","G1918","G2018","G2015","G2014","G2013","G2012","G2010","G2009","G2007","G2005","G2113","G2106","G2105","G2111","G2322","G2323","G2423","G2422","G2421","G2420","G2419","G2522","G2520","G2519","G2623","G2624","G2724","G2723","G2622","G2621","G2620","G2207","G2213","G2316","G2722","G2721","G1915","G2017","G2016","G2118","G2117","G2115","G2108","G2221","G2220","G2219","G2218","G2217","G2216","G2319","G2320","G2321"];
AUSMD_basePositions = ["SofiaBase","DelfinakiBase","FeresBase","PafkasBayBase","SelekanoBase","PyrgosBase","AnthrakiaBase","TelosBase","AirbaseRunway","AirbaseNorth","AirbaseBarracks","AirbaseSouth","ZarosBase","StavrosBase","LakkaBase","AthiraBase","FriniBase","Pyrsos","GalatiBase","Magos","Thronos"];
AUSMD_ruralPositions = ["RuralKonstantinos1","RuralOreokastro1","RuralOreokastro2","RuralOreokastro3","RuralOreokastro4","RuralKonstantinos2","RuralNegades1","RuralNegades2","RuralNegades3","RuralNegades4","RuralNegades5","RuralKonstantinos3","RuralPlant","RuralDump1","RuralDump2","RuralAthanos","RuralAggelo1","RuralAggelo2","RuralStadium1","RuralStadium2","RuralMolos1","RuralMolos2","RuralPanochori","RuralKalochori"];
AUSMD_townPositions = ["Oreokastro1","Oreokastro2","Oreokastro3","Konstantinos1","Konstantinos2","Konstantinos3","Konstantinos4","Negades1","Negades2","Negades3","Aggelo1","Aggelo2","Aggelo3","Aggelo4","Aggelo5","Aggelo6","Aggelo7","Aggelo8","Kavala1","Kavala2","Kavala3","Kavala4","Kavala5","Kavala6","Kavala7","Kavala8","Kavala9","Nari1","Nari2","Nari3","Nari4","Nari5","Athanos1","Athanos2","Panochori1","Panochori2","Panochori3","Panochori4","Panochori5","Kore1","Kore2","Kore3","Kore4","Syrta1","Syrta2","Syrta3","Abdera1","Abdera2","Abdera3","Galati1","Galati2","Galati3","Orino","Dionysios1","Dionysios2","Dionysios3","Dionysios4","Dionysios5","Dionysios6","Zaros1","Zaros2","Zaros3","Zaros4","Zaros5","Zaros6","Zaros7","Zaros8","Edessa","Therisa1","Therisa2","Therisa3","Poliakko1","Poliakko2","Poliakko3","Katalaki","Alikampos1","Alikampos2","Alikampos3","Lakka1","Lakka2","Neochori1","Neochori2","Neochori3","Neochori4","Neochori5","Neochori6","Stavros1","Stavros2","Gravia1","Gravia2","Gravia3","Athira1","Athira2","Athira3","Athira4","Athira5","Athira6","Frini","Telos1","Telos2","Telos3","Telos4","Telos5","Anthrakia1","Anthrakia2","Anthrakia3","Kalithea","Rodopoli1","Rodopoli2","Rodopoli3","Rodopoli4","Charkia1","Charkia2","Charkia3","Charkia4","Charkia5","Charkia6","Charkia7","Pyrgos1","Pyrgos2","Pyrgos3","Pyrgos4","Pyrgos5","Pyrgos6","Pyrgos7","Pyrgos8","Pyrgos9","Dorida1","Dorida2","Dorida3","Chalkeia1","Chalkeia2","Chalkeia3","Chalkeia4","Panagia1","Panagia2","Panagia3","Feres1","Feres2","Feres3","Selakano1","Selakano2","Paros1","Paros2","Paros3","Kalochori1","Kalochori2","AgiosGeorgios","Loanina1","Loannina2","Delfinaki","Nidasos1","Nidasos2","Nidasos3","Sofia1","Sofia2","Sofia3","Sofia4","Gatolia","Molos1","Molos2","Molos3","Molos4"];
AUSMD_civTypes = ["C_man_1","C_man_polo_1_F","C_man_polo_3_F","C_man_polo_2_F","C_man_polo_4_F","C_man_1_2_F","C_man_shorts_1_F","C_man_hunter_1_F"];

{
	_str = format["grid_%1",_x];
	missionNameSpace setVariable[_str,false];
} forEach AUSMD_gridPositions;

{
	missionNameSpace setVariable[_x,false];
} forEach AUSMD_townPositions;

platoon1Holders = [h7,h8,h9,h10,h11,h13];
platoon2Holders = [h1,h2,h3,h4,h5,h6];
platoon3Holders = [h14,h15,h16,h17,h18,h19];
// ==========================================
// PRE-INIT CALLS

{_x disableTIequipment true;} forEach (allMissionObjects "All");
enableEngineArtillery false;
enableSaving [false,false];
enableRadio false;
enableSentences false;

// for patrolBase commMenu.
PB_CONTROL = [];
publicVariable "PB_CONTROL";

// for Adminpanel
ADMIN_CONTROL = [];
publicVariable "ADMIN_CONTROL";

// for radioControl
// RADIO_CONTROL = [];
// publicVariable "RADIO_CONTROL";

// disable squad Menu HUD
showHUD [true,true,true,true,true,true,false,true];

// ==========================================
// GLOBAL EXECUTION
[] execVM "sand_scripts\sand_radio.sqf";
[] execVM "sand_scripts\zlt_fieldrepair.sqf";
[] execVM "sand_scripts\sand_loadoutCreator.sqf";
[] execVM "sand_scripts\sand_pTagInit.sqf";
[] execVM "sand_scripts\greek_gear\IndiGear.sqf";
[] execVM "sand_scripts\sand_NPCinteraction.sqf";
[] execVM "sand_scripts\sand_prices.sqf";

if(isServer || !isMultiplayer) then
{
	[] execVM "sand_scripts\sand_serverPersist.sqf";
	[] execVM "sand_scripts\sand_weather.sqf";
};	
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";

// ==========================================

waitUntil{!isNil "GV_Sand_Balance" && !isNil "AUSMD_uids" || time > 15};

sleep 5;

if(!(getPlayerUID player in AUSMD_uids)) then
{
	AUSMD_uids set[count AUSMD_uids,getPlayerUID player];
	GV_Sand_Balance = GV_Sand_Balance + 200;
	publicVariable "AUSMD_uids";
	publicVariable "GV_Sand_Balance";
	hint "The company has made $200 today for your service.";
}
else
{
	hint "The company has already been paid for your service today.";
};

AUSMD_keyHandlerPlayer = (findDisplay 46) displayAddEventHandler ["KeyDown",{[_this] call AUSMD_fnc_keyHandle;}];

titleText["","BLACK IN",3.5];