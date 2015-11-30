//AUSMD Interaction
//change bis_curatorUnit to what your zeus controller is named (a physical unit or the name of the virtual zeus entity)
//ONLY run on a single client otherwise it may cause unwanted behaviour
//also change bis_curator to what the curator module is called
if(getPlayerUID player isEqualTo 76561198031485127 || !isMultiplayer) then
{
	ZeusUnit = player;
	[Zeus2] execVM "AUSMD_init.sqf";
};
enemySide = east; //change this to west if you want nato as hostiles.
friendlySide = west; //opposite of the above (this side will receive side objective tasks from captives)

AUSMD_holstileSayings = ["I will only tell you my name, rank, and serial number.","I won't tell you fuck all you scumbag."];