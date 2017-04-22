
stock isfp[MAX_PLAYERS];
stock FPOBJ[MAX_PLAYERS];

stock EnableFP(playerid)
{
  isfp[playerid] = 0;
  switch(isfp[playerid])
  {
    case 1:
    {
      SetCameraBehindPlayer(playerid);
      DestroyObject(FPOBJ[playerid]);
      isfp[playerid] = 0;
    }
    case 0:
    {
      FPOBJ[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
      AttachObjectToPlayer(FPOBJ[playerid],playerid, 0.0, 0.12, 0.7, 0.0, 0.0, 0.0);
      AttachCameraToObject(playerid, FPOBJ[playerid]);
      SetTimer("updatefp", 250, true);
      isfp[playerid] = 1;
    }
  }
  return 1;
}

/*Player::Update(playerid)
{
  new Keys,ud,lr;
  GetPlayerKeys(playerid,Keys,ud,lr);

  if(ud == KEY_UP) AttachObjectToPlayer(FPOBJ[playerid],playerid, 0.0, 0.14, 0.7, 0.0, 0.0, 0.0);
  else if(ud == KEY_DOWN) AttachObjectToPlayer(FPOBJ[playerid],playerid, 0.0, 0.14, 0.7, 0.0, 0.0, 0.0);
  return 1;
}*/
