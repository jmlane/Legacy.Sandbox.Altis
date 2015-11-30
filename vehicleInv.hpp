class vehInventory
{
   idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['vehInventory', _this select 0]; [] spawn AUSMD_fnc_vehicleInventoryLoad";
	class controls
	{

		class vehicleInventoryList: RscListbox
		{
			idc = 1500000;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.308437 * safezoneW;
			h = 0.476 * safezoneH;
		};
		class vehicleInventoryButton: RscButton
		{
			onButtonClick = "[] call AUSMD_fnc_unloadObject;";

			idc = 1600000;
			text = "Take Item Out"; //--- ToDo: Localize;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.308437 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class vehicleInventoryName: RscText
		{
			idc = 1000000;
			text = "Vehicle Name Here"; //--- ToDo: Localize;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.308437 * safezoneW;
			h = 0.042 * safezoneH;
		};
	};
};