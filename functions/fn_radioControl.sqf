/* 

	Example Call: 	[False, "Platoon 1", A11A, 0] call asg_fnc_RadioControl
	Incoming Variable Descriptions:
	Select 0		BOOLEAN		Connect (TRUE), Disconnect (FALSE)
	Select 1		STRING		Channel Name ("Platoon 1")
	Select 2		OBJECT		Target Object (A11A)
	Select 3		SCALAR		Channel Index (0)

 */
 
private ["_connectionStatus","_chanName","_chanTarget","_chanID","_rcData"];
 
_connectionStatus = _this select 0;
_chanName = _this select 1;
_chanTarget = _this select 2;
_chanID = _this select 3;
_hotkey = _chanID + 2;

if (_connectionStatus) then {
	_actionTitle = "Disconnect " + (_chanName);
	_chanAction = format ["[False, ""%1"", player, %2, 1] call asg_fnc_RadioControl;",_chanName, _chanID];
	_rcData = [_actionTitle, [_hotkey], "", -5, [["expression", _chanAction]], "1", "1", ""];
	radio_backupStatus = true;	// for playerRespawn
	radio_backupData pushback [true, _chanName, _chanID];
} else {
	_actionTitle = "Connect " + (_chanName);
	_chanAction = format ["[True, ""%1"", player, %2, 1] call asg_fnc_RadioControl;",_chanName, _chanID];
	_rcData = [_actionTitle, [_hotkey], "", -5, [["expression", _chanAction]], "1", "1", ""];
	radio_backupStatus = false;	// for playerRespawn
};

[_connectionStatus,_chanName,[player]] call RADIO;
RADIO_CONTROL set [(_chanID + 1), _rcData];