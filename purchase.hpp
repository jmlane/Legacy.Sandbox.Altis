class PurchaseUI
{
   idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "hint format [""Company Balance: %1"",GV_Sand_Balance];uiNamespace setVariable ['PurchaseUI', _this select 0]; [] spawn AUSMD_fnc_purchaseLoad";
	class controls
	{

		class buyList: RscListbox
		{
			idc = 1505;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class buyButton: RscButton
		{
			idc = 1605;
			text = "Purchase"; //--- ToDo: Localize;
			OnButtonClick = "[] call AUSMD_fnc_DialogBuy;";
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class amountBox: RscEdit
		{
			idc = 1405;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class buyFrame: RscFrame
		{
			idc = 1805;
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.364 * safezoneH;
		};
	};
};

class PurchaseUIVeh
{
   idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "hint format [""Company Balance: %1"",GV_Sand_Balance];uiNamespace setVariable ['PurchaseUIVeh', _this select 0]; [] spawn AUSMD_fnc_purchaseLoadVeh";
	class controls
	{
		class vehicleList: RscListbox
		{
			idc = 1506;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.266 * safezoneH;
		};
		class buyVehButton: RscButton
		{
			idc = 1606;
			text = "Buy"; //--- ToDo: Localize;
			onButtonClick = "[] spawn AUSMD_fnc_PurchaseVehicle";
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class vehFrame: RscFrame
		{
			idc = 1806;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.35 * safezoneH;
		};
	};
};

