sleep 0.01;
if(vehicle player != player) exitWith {};
_platoon = call ausmd_fnc_platoonMembership;
if(!PatrolBase1Up && (_platoon isEqualTo 7)) then
{
	ctrlShow[160013,false];
};
if(!PatrolBase2Up  && (_platoon isEqualTo 8)) then
{
	ctrlShow [160014,false];
};
if(!PatrolBase3Up && (_platoon isEqualTo 9)) then
{
	ctrlShow [160015,false];
};
if(!CommandBaseUp && (_platoon isEqualTo 10)) then
{
	ctrlShow [160016,false];
};

if(!WeaponsBaseUp && (_platoon isEqualTo 11)) then
{
	ctrlShow [160017,false];
};