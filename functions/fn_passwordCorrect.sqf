_pw = ctrlText 140008;

if(_pw isEqualTo "") exitWith {hint "No password entered";};

if(_pw isEqualTo "Athena2" && player in  [RCO, RXO, RSM, ROS, BCO, BXO, BFS, BOS, BPO, BLO, HQ4, HQ5, HQ6, OPS]) exitWith {hint "Succeeded";};
if(_pw isEqualTo "Falcon1" && player in  [HP1, HP2, HP3]) exitWith {hint "Succeeded";};
if(_pw isEqualTo "Athena1" && player in [PL1, PS1, PL2, PS2, PL3, PS3]) exitWith {hint "Succeeded";};
if(_pw isEqualTo "Athena3" && player in  [A11, A12, A13, A21, A22, A23, A31, A32, A33, WSL, ASL]) exitWith {hint "Succeeded";};
hint "Wrong Password";
endMission "END1";