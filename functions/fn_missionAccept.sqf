_sel = lbCurSel 1508;
if(_sel isEqualTo -1) exitWith {hint "No Selection";};
if(missionRunning) exitWith {hint "Mission already active";};

missionRunning = true;
publicVariable "misionRunning";

switch(_sel) do
{
	case 0: {[[],"AUSMD_fnc_securityPatrol",false,false,false] spawn BIS_fnc_MP;};
};

