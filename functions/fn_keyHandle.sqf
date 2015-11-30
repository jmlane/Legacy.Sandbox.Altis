private ["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
_ctrl = _this select 0;
_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;
 switch(_dikCode) do
 {
	case 46:
	{
		if(construction_Building && !isNull construction_Object) exitWith
		{
			if(_shift) then
			{
				construction_ObjectDir = construction_ObjectDir - 2;
				construction_Object setDir construction_ObjectDir;
			}
			else
			{
				construction_ObjectZ = construction_ObjectZ - 0.05;
				construction_Object attachTo [player,[0,((boundingBox construction_Object select 1) select 1) + 5,construction_ObjectZ]];
			};
		};
		_handled = true;
	};
	
	case 48:
	{
		if(construction_Building && !isNull construction_Object) exitWith
		{
			if(_shift) then
			{
				construction_ObjectDir = construction_ObjectDir + 2;
				construction_Object setDir construction_ObjectDir;
			}
			else
			{
				construction_ObjectZ = construction_ObjectZ + 0.05;
				construction_Object attachTo [player,[0,((boundingBox construction_Object select 1) select 1) + 5,construction_ObjectZ]];
			};
		};
		_handled = true;
	};
	case 35:
	{
		if(construction_Building && !isNull construction_Object) then
		{
			detach construction_Object;
			construction_object setVariable ["being_moved",false,true];
			construction_Building = false;
			construction_Object = objNull;
			hint "Object Placed.";
			
			player forceWalk false;
		};
		_handled = true;
	};
};
_handled;