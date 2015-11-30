sleep 0.01;
if(PatrolBase1Up && player distance (getMarkerPos "PB1")  < 40) then
{
	ctrlShow[160018,true];
}
else
{
	ctrlShow[160018,false];
};
if(PatrolBase2Up && player distance (getMarkerPos "PB2" ) < 40) then
{
	ctrlShow[160019,true];
}
else
{
	ctrlShow[160019,false];
};
if(PatrolBase3Up && player distance (getMarkerPos "PB3" ) < 40) then
{
	ctrlShow[160020,true];
}
else
{
	ctrlShow[160020,false];
};
if(CommandBaseUp && player distance (getMarkerPos "CB" ) < 40) then
{
	ctrlShow[160021,true];
}
else
{
	ctrlShow[160021,false];
};
if(WeaponsBaseUp && player distance (getMarkerPos "WS") < 40) then
{
	ctrlShow[160022,true];
}
else
{
	ctrlShow[160022,false];
};