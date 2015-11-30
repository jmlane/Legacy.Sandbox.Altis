class AUSMDMissions
{
	idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['AUSMDMissions', _this select 0]; [] spawn AUSMD_fnc_missionLoad";
	controls[]=
	{
		missionAccept,
		RscFrame_1800,
		missionList
	};

	class missionAccept: RscButton
	{
		idc = 1608;
		text = "Accept Mission"; //--- ToDo: Localize;
		onButtonClick = "[] call AUSMD_fnc_missionAccept";
		x = 0.381875 * safezoneW + safezoneX;
		y = 0.64 * safezoneH + safezoneY;
		w = 0.111562 * safezoneW;
		h = 0.056 * safezoneH;
	};
	class RscFrame_1800: RscFrame
	{
		idc = 1808;
		x = 0.36875 * safezoneW + safezoneX;
		y = 0.346 * safezoneH + safezoneY;
		w = 0.21 * safezoneW;
		h = 0.364 * safezoneH;
	};
	class missionList: RscListbox
	{
		idc = 1508;
		x = 0.381875 * safezoneW + safezoneX;
		y = 0.346 * safezoneH + safezoneY;
		w = 0.18375 * safezoneW;
		h = 0.28 * safezoneH;
	};
};

