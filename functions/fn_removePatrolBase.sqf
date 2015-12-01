_base = _this select 0;

switch(_base) do
{
	case 1: 
	{
		{deleteVehicle _x} forEach (nearestObjects[(getMarkerPos "PB1"),["Building"],30]);
		sleep 0.1; 
		"PB1" setMarkerPos [0,0,0];
		"PB1" setMarkerText "";
		"PB1" setMarkerColor "ColorBlack";
		{
			detach _x;
			_x setPos (AUSMD_platoon1Markers select _forEachIndex);
			_x setDir -124.242;
			if(_x isEqualTo RS1) then
			{
				_x attachTo [h9,[0,0,0.4]];
			};
			if(_x isEqualTo RS2) then
			{
				_x attachTo [h8,[0,0,0.4]];
			};
			if(_x isEqualTo RS3) then
			{
				_x attachTo [h7,[0,0,0.4]];
			};
			if(_x isEqualTo RSL1) then
			{
				_x attachTo [h11,[0,0,0.4]];
			};
			if(_x isEqualTo RSE1) then
			{
				_x attachTo [h10,[0,0,0.4]];
			};
			if(_x isEqualTo PHQ1) then
			{
				_x attachTo [h11,[0,0,0.4]];
			};
		} forEach [RS1,RS2,RS3,RSL1,RSE1,PHQ1];
		patrolBase1Up = false;
		publicVariable "patrolBase1Up";
		PB_CONTROL set [1,(["Deploy Plt.1 Base", [2], "", -5, [["expression", "[1,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"])];
		publicVariable "PB_CONTROL";
	};
	case 2: 
	{
		{deleteVehicle _x} forEach (nearestObjects[(getMarkerPos "PB2"),["Building"],30]);
		sleep 0.1; 
		"PB2" setMarkerPos [0,0,0];
		"PB2" setMarkerText "";
		"PB2" setMarkerColor "ColorBlack";
		{
			detach _x;
			_x setPos (AUSMD_platoon2Markers select _forEachIndex);
			_x setDir -124.242;
			if(_x isEqualTo RS4) then
			{
				_x attachTo [h4,[0,0,0.4]];
			};
			if(_x isEqualTo RS5) then
			{
				_x attachTo [h5,[0,0,0.4]];
			};
			if(_x isEqualTo RS6) then
			{
				_x attachTo [h6,[0,0,0.4]];
			};
			if(_x isEqualTo RSL2) then
			{
				_x attachTo [h3,[0,0,0.4]];
			};
			if(_x isEqualTo RSE2) then
			{
				_x attachTo [h2,[0,0,0.4]];
			};
			if(_x isEqualTo PHQ2) then
			{
				_x attachTo [h1,[0,0,0.4]];
			};
		} forEach [RS6,RS5,RS4,RSE2,RSL2,PHQ2];
		patrolBase2Up = false;
		publicVariable "patrolBase2Up";
		PB_CONTROL set [2,(["Deploy Plt.2 Base", [3], "", -5, [["expression", "[2,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"])];
		publicVariable "PB_CONTROL";
	};
	case 3: 
	{
		{deleteVehicle _x} forEach (nearestObjects[(getMarkerPos "PB3"),["Building"],30]);
		sleep 0.1; 
		"PB3" setMarkerPos [0,0,0];
		"PB3" setMarkerText "";
		"PB3" setMarkerColor "ColorBlack";
		{
			detach _x;
			_x setPos (AUSMD_platoon3Markers select _forEachIndex);
			_x setDir -124.242;
			if(_x isEqualTo RS9) then
			{
				_x attachTo [h19,[0,0,0.4]];
			};
			if(_x isEqualTo RS8) then
			{
				_x attachTo [h18,[0,0,0.4]];
			};
			if(_x isEqualTo RS7) then
			{
				_x attachTo [h17,[0,0,0.4]];
			};
			if(_x isEqualTo RSL3) then
			{
				_x attachTo [h16,[0,0,0.4]];
			};
			if(_x isEqualTo RSE3) then
			{
				_x attachTo [h15,[0,0,0.4]];
			};
			if(_x isEqualTo PHQ3) then
			{
				_x attachTo [h14,[0,0,0.4]];
			};
		} forEach [RS9,RS8,RS7,RSL3,RSE3,PHQ3];
		patrolBase3Up = false;
		publicVariable "patrolBase3Up";
		PB_CONTROL set [3,(["Deploy Plt.3 Base", [4], "", -5, [["expression", "[3,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"])];
		publicVariable "PB_CONTROL";
	};
	case 4:
	{
		{deleteVehicle _x} forEach (nearestObjects[(getMarkerPos "CB"),["Building","Land_Communication_F"],30]);
		sleep 0.1; 
		"CB" setMarkerPos [0,0,0];
		"CB" setMarkerText "";
		"CB" setMarkerColor "ColorBlack";
		{
			detach _x;
			_x setPos (AUSMD_platoon4Markers select _forEachIndex);
			_x setDir -33.4184;

			if(_x isEqualTo CHQ) then
			{
				_x attachTo [h20,[0,0,0.5]];
			};
			if(_x isEqualTo CHE) then
			{
				_x attachTo [h21,[0,0,0.5]];
			};
		} forEach [CHQ,CHE];
		CommandBaseUp = false;
		publicVariable "CommandBaseUp";
		PB_CONTROL set [4,(["Deploy Company HQ", [5], "", -5, [["expression", "[4,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"])];
		publicVariable "PB_CONTROL";
	};
	case 5:
	{
		{deleteVehicle _x} forEach (nearestObjects[(getMarkerPos "WS"),["Building","Land_Basket_F","Land_PowerGenerator_F","Land_PortableLight_double_F","Land_PaperBox_closed_F","Land_FieldToilet_F","Land_Sacks_heap_F","Land_Sign_WarningMilitaryArea_F","Land_Sacks_goods_F","Land_BarGate_F","Land_Pallet_MilBoxes_F"],50]);
		sleep 0.1; 
		"WS" setMarkerPos [0,0,0];
		"WS" setMarkerText "";
		"WS" setMarkerColor "ColorBlack";
		{
			detach _x;
			_x setPos (AUSMD_platoon5Markers select _forEachIndex);
			_x setDir -33.4184;

			if(_x isEqualTo CHW) then
			{
				_x attachTo [h22,[0,0,0.5]];
			};
			if(_x isEqualTo CWA) then
			{
				_x attachTo [h23,[0,0,0.5]];
			};
			if(_x isEqualTo CWB) then
			{
				_x attachTo [h24,[0,0,0.5]];
			};
		} forEach [CHW,CWA,CWB];
		WeaponsBaseUp = false;
		publicVariable "WeaponsBaseUp";
		PB_CONTROL set [5,(["Deploy Weapons Base", [6], "", -5, [["expression", "[5,getPos player] spawn AUSMD_fnc_patrolBases;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"])];
		publicVariable "PB_CONTROL";
	};
};

hint "Patrol Base deleted.";