private ["_caller","_position","_target","_is3D","_id"];

diag_log format ["=====MANUAL RADIO DISCONNECT====="];
_caller = _this select 0;
diag_log format ["DEBUG:		_caller: %1",_caller];
_callerStr = (toUpper str _caller);
diag_log format ["DEBUG:		ACTIVE_BACKUPS: %1",ACTIVE_BACKUPS];
_backupIndexSrc = [ACTIVE_BACKUPS, _callerStr] call KK_fnc_findAll;
_backupIndex = [ACTIVE_BACKUPS, _callerStr] call KK_fnc_findAll select 0;
_backupIndex set [1,1];
_channelName = [ACTIVE_BACKUPS,_backupIndex] call KK_fnc_findAllGetPath;
diag_log format ["DEBUG:		_channelName: %1",_channelName];
[false,_channelName,[_caller]] call RADIO;
[format["[RADIO] %1 has left %2",name _caller,_channelName],"systemChat",true] call BIS_fnc_MP;
diag_log format ["DEBUG:		ACTIVE_BACKUPS %1",ACTIVE_BACKUPS];
_backupIndexSrc = _backupIndexSrc select 0 select 0;
diag_log format ["DEBUG:		_backupIndexSrc: %1",_backupIndexSrc];
ACTIVE_BACKUPS deleteAt (_backupIndexSrc);
publicVariable "ACTIVE_BACKUPS";
diag_log format ["DEBUG:		Deleting backup at Index %1",_backupIndexSrc];
diag_log format ["DEBUG:		Remaining Backup(s) %1",ACTIVE_BACKUPS];
diag_log format ["================================="];

// If Manual Disconnect is triggered, and A11 is not present, search for another backup

// [ _this ] call ASG_fnc_netDisconnect;
// TODO: Function it