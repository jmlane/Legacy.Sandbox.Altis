class passwordAUSMD
{
	idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
	controls[] =
	{
		class passwordBar: RscEdit
		{
			idc = 140008;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class submitButton: RscButton
		{
			idc = 160009;
			text = "Submit"; //--- ToDo: Localize;
			onButtonClick = "[] call AUSMD_fnc_passwordCorrect";
			x = 0.506562 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class passwordFrame: RscFrame
		{
			idc = 180009;
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.098 * safezoneH;
		};
	};
};
