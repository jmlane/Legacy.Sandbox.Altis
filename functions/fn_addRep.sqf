_rep = _this select 0;
_town = _this select 1;

_townVar = format["rep_%1",_town];
_townRep = profileNameSpace getVariable [_townVar,0];
profileNameSpace setVariable [_townVar,(_townRep + _rep)];

saveProfileNamespace;