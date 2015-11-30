class AUSMDDebug
{
	idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
	onLoad = "uiNamespace setVariable ['AUSMDDebug', _this select 0]; [] spawn AUSMD_fnc_adminPanelLoad";
	controls[] =
	{
		lockUnlockBtn,
		tpPlayer,
		RscListbox_150010
	};
	class lockUnlockBtn: RscButton
	{
		idc = 160011;
		text = "Lock"; //--- ToDo: Localize;
		onButtonClick = "[] spawn AUSMD_fnc_lockUnlock";
		x = 0.42125 * safezoneW + safezoneX;
		y = 0.766 * safezoneH + safezoneY;
		w = 0.0853125 * safezoneW;
		h = 0.056 * safezoneH;
	};
	class tpPlayer: RscButton
	{
		idc = 160012;
		text = "Teleport Player"; //--- ToDo: Localize;
		onButtonClick = "[] spawn AUSMD_fnc_teleport";
		x = 0.511805 * safezoneW + safezoneX;
		y = 0.766 * safezoneH + safezoneY;
		w = 0.0984375 * safezoneW;
		h = 0.056 * safezoneH;
	};
	class RscListbox_150010: RscListbox
	{
		idc = 150010;
		x = 0.423874 * safezoneW + safezoneX;
		y = 0.472 * safezoneH + safezoneY;
		w = 0.183748 * safezoneW;
		h = 0.2828 * safezoneH;
	};
};