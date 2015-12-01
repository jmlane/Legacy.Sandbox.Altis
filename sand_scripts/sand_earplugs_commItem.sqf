// Original Code from initPlayerLocal.sqf
// player addAction ["Earplugs In",{1 fadeSound .04; AUSMD_earPlugIn = true;},nil,1,False,True,"",' !AUSMD_earPlugIn '];
// player addAction ["Earplugs Out",{.1 fadeSound 1; AUSMD_earPlugIn = false;},nil,1,False,True,"",' AUSMD_earPlugIn '];
// unit addAction   [title         ,script                                    ,arg,pri,showWindow,hideOnUse,shortcut,condition,positionInModel,radius, radiusView, showIn3D, available, textDefault, textToolTip] 

if (AUSMD_earPlugIn) then {
	.1 fadeSound 1;
	AUSMD_earPlugIn = false;
} else {
	1 fadeSound .04;
	AUSMD_earPlugIn = true;
};
