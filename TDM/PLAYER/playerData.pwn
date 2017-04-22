/*
    Player Data :
                  Function : All The player Data
                  Params : N/A
                  By Jaber
*/

enum _pdata
{
  pIDSql,
  pIp[16],
  pName[MAX_PLAYER_NAME],
  pPassword[129],

  bool:pStaff,

  pScore,
  pLevel,
  pXp,

  pDeath,
  pKill,

  pMap,

  bool:pLogged
}
stock PlayerData[MAX_PLAYERS][_pdata];
