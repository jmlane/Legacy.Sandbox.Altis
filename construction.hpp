class constructionDialog
{
	idd = -1;
	movingEnable = true;
	moving = 1;
	onLoad = "uiNamespace setVariable ['constructionDialog', _this select 0];[] spawn AUSMD_fnc_constructionDialog;";
	controls[] = {textBar,RscListbox_1500,RscText_1001,buyButton,destroyButton,nearList,Movebutton,nearstuff,snap};
	controlsBackground[] = {IGUIBack_2200};
		
	class textBar: RscText
	{
		idc = 10000001;
		text = "Construction"; //--- ToDo: Localize;
		x = 0.293721 * safezoneW + safezoneX;
		y = 0.225022 * safezoneH + safezoneY;
		w = 0.412558 * safezoneW;
		h = 0.0219982 * safezoneH;
	};
	class RscListbox_1500: RscListbox
	{
		idc = 15000001;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.291017 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.24198 * safezoneH;
	};
	class RscText_1001: RscText
	{
		idc = 1000002;
		text = "Structures"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.269019 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0219982 * safezoneH;
	};
	class buyButton: RscButton
	{
		idc = 16000001;
		onButtonClick = "call AUSMD_fnc_constructionPurchase";
		text = "Purchase"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.554995 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0329973 * safezoneH;
	};
	class IGUIBack_2200: IGUIBack
	{
		idc = 22000001;
		x = 0.293721 * safezoneW + safezoneX;
		y = 0.247062 * safezoneH + safezoneY;
		w = 0.412558 * safezoneW;
		h = 0.681834 * safezoneH;
	};
	class destroyButton: RscButton
	{
		idc = 16100002;
		onButtonClick = "call AUSMD_fnc_constructionRemove";

		text = "Remove Structure"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.862911 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0329972 * safezoneH;
	};
	class nearList: RscListBox
	{
		idc = 15060002;

		x = 0.304035 * safezoneW + safezoneX;
		y = 0.675957 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.109973 * safezoneH;
	};
	class Movebutton: RscButton
	{
		idc = 16090003;
		onButtonClick = "call AUSMD_fnc_constructionMove";

		text = "Move Structure"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.807925 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0329972 * safezoneH;
	};
	class nearstuff: RscText
	{
		idc = 10010003;

		text = "My Structures"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.653962 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0219946 * safezoneH;
	};
	class snap: RscButton
	{
		idc = 1030004;
		onButtonClick = "call AUSMD_fnc_constructionSnap";

		text = "Snap To Terrain (FALSE)"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.609973 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0329972 * safezoneH;
	};
};