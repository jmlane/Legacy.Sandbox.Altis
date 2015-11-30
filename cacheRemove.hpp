class AUSMDCache
{
	idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
	onLoad = "uiNamespace setVariable ['AUSMDCache', _this select 0]; [] spawn AUSMD_fnc_cacheRemove";
	controls[] =
	{
		cachegroupList,
		removeGroupButton
	};

		class cachegroupList: RscListbox
		{
			idc = 1500;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.462 * safezoneH;
		};
		class removeGroupButton: RscButton
		{
			idc = 1600;
			text = "Remove units in this group from the cache"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.042 * safezoneH;
		};
