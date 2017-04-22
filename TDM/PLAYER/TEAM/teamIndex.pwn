/*
	Script Team :
							Function : Load All Team Script By Indexing file
							Params : N/A
							By Jaber
*/

/*
	pMap :
		0 - N/A
		1 - Inferno
		2 - Dust
*/

stock _team_;

/**----------------------------------------------------**/

#tryinclude "YSI\y_hooks"

#if !defined _INC_y_hooks
	#error Veuillez Télécharger La Lib' YSI | github.com/Misiur/YSI-Includes
#endif

/**----------------------------------------------------**/

#tryinclude "easyDialog"

#if !defined Dialog_Opened
	#error Veuillez Télécharger l'include EasyDialog | github.com/Awsomedude/easyDialog
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\TEAM\teamTero.pwn"

#if !defined _tero_
  #error Impossible de Charger le Dossier TEAM , fichier Tero introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\TEAM\teamAnti.pwn"

#if !defined _anti_
  #error Impossible de Charger le Dossier TEAM , fichier Anti introuvable
#endif
/**----------------------------------------------------**/

#tryinclude "TDM/PLAYER/playerIndex.pwn"

#if !defined _player
	#error Impossible de Charger le Fichier Player , Index introuvable
#endif


/**----------------------------------------------------**/

stock pinferno;

/**----------------------------------------------------**/

Dialog:MapChoice(playerid, response, listitem, inputtext[])
{
  if(response)
  {
    switch(listitem)
    {
      case 0:
      {
      	TogglePlayerSpectating(playerid, false);
      	SpawnPlayer(playerid);
      	SetPlayerPos(playerid, 9435.371094, -8791.102539, 32.757374);
      	MapData[inferno][players]++;
      	PlayerData[playerid][pLogged] = true;
      	PlayerData[playerid][pMap] = 1;
      	printf("Inferno : %d", MapData[inferno][players]);
      }
    }
  }
  return 1;
}

/**----------------------------------------------------**/

Player::Disconnect(playerid, reason)
{
  if(PlayerData[playerid][pLogged] == true)
  {
    PlayerData[playerid][pLogged] = false;
    if(PlayerData[playerid][pMap] == 1)
		{
			PlayerData[playerid][pMap] = 0;
			MapData[inferno][players]--;
		}
	}
  printf("Inferno : %d", MapData[inferno][players]);
  return 1;
}
