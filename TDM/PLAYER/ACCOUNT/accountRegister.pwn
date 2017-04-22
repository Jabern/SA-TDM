/*
    Player Login :
                  Function : Register player
                  Params : N/A
                  By Jaber
*/

stock _register_;

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

Dialog:SignUp(playerid, response, listitem, inputtext[])
{
  if(!response) return Kick(playerid);

  static
        string[129];
  if(strlen(inputtext) < 5 || strlen(inputtext) > 128)
  {
    return Dialog_Show(playerid, SignUp, DIALOG_STYLE_INPUT, "Inscription", "Erreur: Votre Mot de passe ne respecte pas les parmétres suivant : Minimum 5 caractères , Maximum 128", "Inscription", "Annuler");
  }
  mysql_format(_Connect, string, sizeof(string), "INSERT INTO `compte` (Username, Password, Ip) VALUES ('%s', '%s', '%s')", PlayerData[playerid][pName], inputtext, PlayerData[playerid][pIp]);
  mysql_tquery(_Connect, string);
  return Dialog_Show(playerid, Connection, DIALOG_STYLE_PASSWORD, "Connexion","Compte SAVE : veuillez insérer votre Mot De Passe pour vous Connecter :)", "Connexion", "Annuler");
}
