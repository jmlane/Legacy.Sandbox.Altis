_text = _this select 0;

if(([name player,_text] call BIS_fnc_inString) isEqualTo true) then
{
	GV_Sand_Balance = GV_Sand_Balance - 15000;
	publicVariable "GV_Sand_Balance";
};

hint _text;