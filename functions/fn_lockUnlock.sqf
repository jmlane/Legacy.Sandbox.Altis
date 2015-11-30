_veh = cursorTarget;
if(!((typeOf _veh isKindOf "Car" || typeOf _veh isKindOf "Air" || typeOf _veh isKindOf "Tank"))) exitWith {hint "No vehicle is set as cursor target.";};

switch(locked _veh) do
{
	case 0: {_veh lock 2;hint "Locked";};
	case 1: {_veh lock 0;hint "Unlocked";};
	case 2: {_veh lock 0;hint "Unlocked";};
};

closeDialog 0;
sleep 0.01;
createDialog "AUSMDDebug";