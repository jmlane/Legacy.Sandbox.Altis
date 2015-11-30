if(isServer || !isMultiplayer || !isDedicated && !hasInterface) then
{
	[] spawn
	{
		cachedUnits = [];
		while{true} do
		{
			//delete units and cache
			{
				_unit = leader _x;
				_nearPlayers = [];
				{
					if(_x distance _unit < 2500) then
					{
						_nearPlayers set[count _nearPlayers,_x];
					};
				} forEach allPlayers;
				if(count _nearPlayers isEqualTo 0) then
				{
					if((side leader _x isEqualTo resistance || side leader _x isEqualTo east) && !(_x getVariable ["AUSMD_DoNotCache",false])) then
					{
						_pos = getPos leader _x;
						_ourGroup = [];
						_ourGroup2 = [];
						_object = "Land_ClutterCutter_small_F" createVehicle _pos;
						Zeus addCuratorEditableObjects[[_object],true];
						Zeus2 addCuratorEditableObjects[[_object],true];
						Zeus3 addCuratorEditableObjects[[_object],true];
						_ourGroup set[count _ourGroup,_object];
						_ourGroup set[count _ourGroup,(getPos leader _x)];
						{
							_type = typeOf _x;
							_ourGroup2 set[count _ourGroup2,_type];
						} forEach units _x;
						
						_ourGroup set[count _ourGroup,_ourGroup2];
						cachedUnits set[count cachedUnits,_ourGroup];
						{
							deleteVehicle _x;
						} forEach units _x;
					};
				};
			} forEach allGroups;
			//add units and uncache
			{
				_nearPlayers = [];
				_num = _forEachIndex;
				{
					if(_x distance (cachedUnits select _num select 1) < 2500) then
					{
						_nearPlayers set[count _nearPlayers,_x];
					};
				} forEach allPlayers;
				_num = _num + 1;
				if(count _nearPlayers > 0) then
				{
					_obj = _x select 0;
					_position = _x select 1;
					_groupData = _x select 2;
					_groupNew = createGroup east;
					{
						if(!isNil "_obj") then
						{
							_type = _x;
							_unit = _groupNew createUnit[_type,_position,[],2,"NONE"];
								
							Zeus2 addCuratorEditableObjects [[_unit],true];
							Zeus addCuratorEditableObjects [[_unit],true];
							Zeus3 addCuratorEditableObjects[[_unit],true];
							
							[_unit] spawn IndiGear;
							
							diag_log format["CACHE :: UNCACHE :: %1",_type];
						};
					} forEach _groupData;
					
					deleteVehicle _obj;

					cachedUnits set[_forEachIndex,[]];
				};
			} forEach cachedUnits;
			//remove empty entries
			sleep 22;
			//position update
			{
				_object = _x select 0;
				if(isNull _object) then
				{
					cachedUnits set[_forEachIndex,[]];
				}
				else
				{
					_position = (getPos _object);
					_x set[1,_position];
				};
			} forEach cachedUnits;
			
			_newArr = [];
			{
				if(!(_x isEqualTo [])) then
				{
					_newArr set[count _newArr,_x];
				};
			} forEach cachedUnits;
			cachedUnits = _newArr;
		};
	};
};