_side = _this select 0;
_units = _this select 1;
_position = _this select 2;

_position set[2,0];
_amount = _this select 3;
_grp = createGroup _side;
_position = [(_position select 0) + (random _amount - random _amount),(_position select 1) + (random _amount - random _amount),_position select 2];

sleep 0.1;
{

	_x createUnit [_position, _grp,"uni = this;",(0.2 + random 0.5)];
	if(side uni == east || side uni == resistance) then
	{
		uni setVariable ["AUSMD_interact_tiedUp",false];
		uni setVariable ["AUSMD_interact_arrested",false];
		uni setVariable ["AUSMD_interact_beingInterrogated",false];
		uni setVariable ["AUSMD_interact_gaveInfo",false];
		[uni] spawn Fnc_AdjustUnitGear;
	};
} forEach _units;

_grp;