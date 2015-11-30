0 setOvercast random 1;
sleep 0.1;
if(overcast > 0.7) then
{
	0 setRain 0.875;
	0 setWaves 0.8;
	0 setWindStr 0.8;
};
if(overcast > 0.6) then
{
	0 setFog 0.15 + random 0.4;
};
skipTime 6;
diag_log format["WEATHER START :: %1 - %2 - %3 - %4 - %5",overcast,rain,waves,wind,fog];

while{true} do
{
	sleep 12400;
	
	if(overcast > 0.8) then
	{
		7500 setOvercast 0;
		6500 setRain 0;
		6700 setWaves 0;
		7000 setWindStr 0;
		5000 setFog 0;
	};
	
	if(overcast > 0.2 && overcast < 0.8) then
	{
		_random = random 1;
		7500 setOvercast _random;
		if(_random > 0.8) then
		{
			7200 setRain 1;
			if(random 10 > 8) then
			{
				7350 setFog 0.7 + random 0.3;
			}
			else
			{
				7350 setFog 0.3 + random 0.2;
			};
			7000 setWaves 0.7 + random 0.3;
			7000 setWindStr 0.5 + random 0.35;
		};
		if(_random > 0.5 && _random < 0.8) then
		{
			if(random 5 > 4) then 
			{
				7200 setRain 0.3;
			};
			if(random 10 > 6) then
			{
				7350 setFog 0.3 + random 0.3;
			}
			else
			{
				7350 setFog 0.1 + random 0.1;
			};
			7000 setWaves 0.3 + random 0.3;
			7000 setWindStr 0.3 + random 0.35;	
		};
		if(_random < 0.5) then
		{
			7200 setRain 0;
			7350 setFog 0;
			7000 setWaves 0;
			7000 setWindStr 0;	
		};
	};
	diag_log format["WEATHER UPDATE:: %1 - %2 - %3 - %4 - %5",overcast,rain,waves,wind,fog];
};
		