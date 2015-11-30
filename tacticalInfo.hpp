class AUSMD_infoBar
{
		idd = -1;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999999999999999999999999999*100;
        fadein       =  0;
        fadeout      =  0;
        name = "AUSMD_infoBar";
		onLoad = "with uiNameSpace do { AUSMD_infoBar = _this select 0 }";
	
	class controls
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 16100;
			x = 0.307146 * safezoneW + safezoneX;
			y = 0.000784132 * safezoneH + safezoneY;
			w = 0.385708 * safezoneW;
			h = 0.0329878 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.2};
		};
		class RscFrame_1800: RscFrame
		{
			idc = 16800;
			x = 0.307146 * safezoneW + safezoneX;
			y = 0.000784132 * safezoneH + safezoneY;
			w = 0.385708 * safezoneW;
			h = 0.0329878 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
		};
	};
};