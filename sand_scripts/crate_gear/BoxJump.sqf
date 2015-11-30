if !(isServer) exitWith {};
clearmagazinecargoglobal _this;
clearweaponcargoglobal _this;
clearitemcargoglobal _this;
clearbackpackcargoglobal _this;
_this allowDamage false;
sleep 5;
if(!((profileNameSpace getVariable ["#AUSMD#Boxes",[]]) isEqualTo [])) exitWith {};
_this addBackpackcargoglobal ["B_Parachute", 90];