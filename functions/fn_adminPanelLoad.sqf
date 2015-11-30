sleep 0.01;

{
	lbAdd[150010,name _x];
} forEach allPlayers;

if(typeOf cursorTarget isKindOf "Car" || typeOf cursorTarget isKindOf "Air" || typeOf cursorTarget isKindOf "Tank") then
{
	switch(locked cursorTarget) do
	{
		case 0: {ctrlSetText[160011,"Lock"];};
		case 1: {ctrlSetText[160011,"UnLock"];};
		case 2: {ctrlSetText[160011,"UnLock"];};
	};
}
else
{
	ctrlShow[160011,false];
};

//hint format ["Server Information \n\n unit count: %1 \n\n dead units: %2 \n\n player id count: %3",count allUnits,count allDead,count AUSMD_uids];