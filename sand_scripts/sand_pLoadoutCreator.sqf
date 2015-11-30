_unit = _this select 0;
_type = typeof _unit;
if (!(local _unit)) exitwith {};
{
	if (side _unit == West) then 
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		_unit forceAddUniform "U_BG_Guerrilla_6_1";
		_unit addVest "V_TacVestIR_blk";
		_unit addHeadgear "H_HelmetB_black";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		switch (_type) do 
		{
			default {};
			case "B_Helipilot_F" :
			{
				_unit forceAddUniform "U_C_Driver_4";
				_unit addVest "V_TacVest_blk";
				_unit addHeadgear "H_CrewHelmetHeli_B";
			};
		};
	};
} foreach allunits;