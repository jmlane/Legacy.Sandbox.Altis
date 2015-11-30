class patrolBaseAdd
{
	idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
	onLoad = "uiNamespace setVariable ['patrolBaseAdd', _this select 0]; [] spawn AUSMD_fnc_PBAddLoad";
	controls[] =
	{
		PB1Btn,PB2Btn,PB3Btn,CMDPostBtn,WPNSPostBtn
	};
	class PB1Btn: RscButton
	{
		onButtonClick = "[1,getPos player] spawn AUSMD_fnc_patrolBases";
		
		idc = 160023;
		text = "Place PB1"; //--- ToDo: Localize;
		x = 0.440937 * safezoneW + safezoneX;
		y = 0.346 * safezoneH + safezoneY;
		w = 0.105 * safezoneW;
		h = 0.056 * safezoneH;
	};
	
	class PB2Btn: RscButton
	{
		onButtonClick = "[2,getPos player] spawn AUSMD_fnc_patrolBases";
		
		idc = 160014;
		text = "Place PB2"; //--- ToDo: Localize;
		x = 0.440937 * safezoneW + safezoneX;
		y = 0.416 * safezoneH + safezoneY;
		w = 0.105 * safezoneW;
		h = 0.056 * safezoneH;
	};
	class PB3Btn: RscButton
	{
		onButtonClick = "[3,getPos player] spawn AUSMD_fnc_patrolBases";
		idc = 160015;
		text = "Place PB3"; //--- ToDo: Localize;
		x = 0.440937 * safezoneW + safezoneX;
		y = 0.486 * safezoneH + safezoneY;
		w = 0.105 * safezoneW;
		h = 0.056 * safezoneH;
	};
	class CMDPostBtn: RscButton
	{
		onButtonClick = "[4,getPos player] spawn AUSMD_fnc_patrolBases";
		idc = 160016;
		text = "Place Cmd Post"; //--- ToDo: Localize;
		x = 0.440937 * safezoneW + safezoneX;
		y = 0.556 * safezoneH + safezoneY;
		w = 0.105 * safezoneW;
		h = 0.056 * safezoneH;
	};
	class WPNSPostBtn: RscButton
	{
		onButtonClick = "[5,getPos player] spawn AUSMD_fnc_patrolBases";
		idc = 160017;
		text = "Place Wpns Post"; //--- ToDo: Localize;
		x = 0.440937 * safezoneW + safezoneX;
		y = 0.626 * safezoneH + safezoneY;
		w = 0.105 * safezoneW;
		h = 0.056 * safezoneH;
	};
};

class patrolBaseRemove
{
	idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
	onLoad = "uiNamespace setVariable ['patrolBaseRemove', _this select 0]; [] spawn AUSMD_fnc_removeBaseLoad";
	controls[] =
	{
		PB1BtnR,PB2BtnR,PB3BtnR,CMDPostBtnR,WPNSPostBtnR
	};
		class PB1BtnR: RscButton
		{
			onButtonClick = "[1] spawn AUSMD_fnc_removePatrolBase";
			
			idc = 160024;
			text = "Remove PB1"; //--- ToDo: Localize;
			x = 0.440937 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class PB2BtnR: RscButton
		{
			onButtonClick = "[2] spawn AUSMD_fnc_removePatrolBase";
			
			idc = 160019;
			text = "Remove PB2"; //--- ToDo: Localize;
			x = 0.440937 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
		};
		
		class PB3BtnR: RscButton
		{
			onButtonClick = "[3] spawn AUSMD_fnc_removePatrolBase";
			idc = 160020;
			text = "Remove PB3"; //--- ToDo: Localize;
			x = 0.440937 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class CMDPostBtnR: RscButton
		{
			onButtonClick = "[4] spawn AUSMD_fnc_removePatrolBase";
			idc = 160021;
			text = "Remove Cmd Post"; //--- ToDo: Localize;
			x = 0.440937 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class WPNSPostBtnR: RscButton
		{
			onButtonClick = "[5] spawn AUSMD_fnc_removePatrolBase";
			idc = 160022;
			text = "Remove Wpns Post"; //--- ToDo: Localize;
			x = 0.440937 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
		};
};