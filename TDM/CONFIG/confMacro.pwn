/*
  Advanced Structure OOP Like
  Thanks To Dutheil For All Useful Macro :) 
*/

#define Player::%0( hook OnPlayer%0(
#define GameMode::%0( hook OnGameMode%0(

//-----------------------------

#define ClearChat(%0) for(new c@c_p = 0; c@c_p < 100; c@c_p++) SendClientMessage(%0, -1, "	")

//-----------------------------

#define HOLDING(%0) ((newkeys & (%0)) == (%0))
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
