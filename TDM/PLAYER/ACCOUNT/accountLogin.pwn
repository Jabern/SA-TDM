/*
    Player Login :
                  Function : Log player
                  Params : N/A
                  By Jaber
*/

stock _login_;

/**----------------------------------------------------**/

#tryinclude "TDM/MYSQL/sqIndex.pwn"

#if !defined _sql
	#error Impossible de Charger le Fichier Mysql , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "easyDialog"

#if !defined Dialog_Opened
	#error Veuillez Télécharger l'include EasyDialog | github.com/Awsomedude/easyDialog
#endif

/**----------------------------------------------------**/

forward CheckPass(playerid);

/**----------------------------------------------------**/

Dialog:Connection(playerid, response, listitem, inputtext[])
{
	if(!response) return Kick(playerid);

	static
      	string[129];
	if(strlen(inputtext) < 5 || strlen(inputtext) > 128)
	{
  	return Dialog_Show(playerid, Connection, DIALOG_STYLE_PASSWORD, "Connexion", "Erreur: Votre Mot de passe ne respecte pas les parmétres suivant : Minimum 5 caractères , Maximum 128", "Connexion", "Annuler");
	}

	format(PlayerData[playerid][pPassword], 129, inputtext);

	mysql_format(_Connect, string, sizeof(string), "SELECT * FROM `compte` WHERE `Username` = '%s'", PlayerData[playerid][pName]);
	return mysql_tquery(_Connect, string, "CheckPass", "i", playerid);
}

/**----------------------------------------------------**/

public CheckPass(playerid)
{
	static
				pass[129];
	cache_get_value_name(0, "Password", pass);

	if(strcmp(pass, PlayerData[playerid][pPassword], true) == 0)
	{
		static
					string[128];
		format(string, sizeof(string), "Map\tJoueurs\n\
																		Inferno\t%d\n\
																		Dust\t%d\n\
																		{FF0000}Bots Match", MapData[inferno][players], MapData[dust][players]);
		Dialog_Show(playerid, MapChoice, DIALOG_STYLE_TABLIST_HEADERS, "Map", string, "Spawn", "Annuler");
	}
	else return Dialog_Show(playerid, Connection, DIALOG_STYLE_PASSWORD, "Connexion","Erreur :( MDP Incorrect : Veuillez insérer votre Mot De Passe pour vous Connecter :)", "Connexion", "Annuler");

	return 1;
}
