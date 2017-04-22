/*
    Player Index :
                  Function : Load All The player scripts
                  Params : N/A
                  By Jaber
*/

stock _player();

/**----------------------------------------------------**/

#tryinclude "TDM/MYSQL/sqIndex.pwn"

#if !defined _sql
	#error Impossible de Charger le Fichier Mysql , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\playerData.pwn"

#if !defined PlayerData
  #error Impossible de Charger le Fichier playerData il est introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\mapData.pwn"

#if !defined MapData
  #error Impossible de Charger le Fichier mapData il est introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\ACCOUNT\accountIndex.pwn"

#if !defined _compte_
  #error Impossible de Charger le Fichier de Compte , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\fps.pwn"

#if !defined EnableFP
  #error Impossible de Charger le Fichier FPS : introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\TEAM\teamIndex.pwn"

#if !defined _team_
  #error Impossible de Charger le Fichier TEAM , Index introuvable
#endif

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

forward BanCheck(playerid);
forward Connect(playerid);
/**----------------------------------------------------**/

Player::Connect(playerid)
{
  GetPlayerName(playerid, PlayerData[playerid][pName], MAX_PLAYER_NAME);
  GetPlayerIp(playerid, PlayerData[playerid][pIp], 16);
  return 1;
}

/**----------------------------------------------------**/

Player::RequestClass(playerid, classid)
{
  if(!IsPlayerLoged(playerid))
  {
      static
            query[150];
      TogglePlayerSpectating(playerid, true);

      mysql_format(_Connect, query, sizeof(query), "SELECT * FROM `Bans` WHERE `IP` = '%s'", PlayerData[playerid][pIp]);
      mysql_tquery(_Connect, query, "BanCheck", "i", playerid);
  }
  return 1;
}

/**----------------------------------------------------**/

Player::Spawn(playerid)
{
	//EnableFP(playerid);
	GivePlayerWeapon(playerid, 32, 64);
	printf("Inferno : %d", MapData[inferno][players]);
	return 1;
}

/**----------------------------------------------------**/

public BanCheck(playerid)
{
  static
        row, query[128];
  cache_get_row_count(row);

  if(!row) goto noban;

  new
      Ban_Time;
  cache_get_value_name_int(0, "BanTime", Ban_Time);

  if(Ban_Time == -1)
  {
    return Kick(playerid);
  }

  noban:

  mysql_format(_Connect, query, sizeof(query), "SELECT * FROM `Compte` WHERE `Username` = '%s'", PlayerData[playerid][pName]);
  return mysql_tquery(_Connect, query, "Connect", "i", playerid);
}

/**----------------------------------------------------**/

public Connect(playerid)
{
  static
        row;
  cache_get_row_count(row);

  if(row)
  {
    static
          ID;
    cache_get_value_name_int(0, "ID", ID);
    PlayerData[playerid][pIDSql] = ID;
    return Dialog_Show(playerid, Connection, DIALOG_STYLE_PASSWORD, "Connexion","Veuillez insérer votre Mot De Passe pour vous Connecter :)", "Connexion", "Annuler");
  }
  return Dialog_Show(playerid, SignUp, DIALOG_STYLE_INPUT, "Inscription","Veuillez insérer un Mot De Passe pour vous Inscrire :)", "Inscription", "Annuler");
}
