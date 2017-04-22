/*
    Account Index :
                  Function : Load All The Account scripts
                  Params : N/A
                  By Jaber
*/

stock _compte_;

/**----------------------------------------------------**/

#tryinclude "TDM/PLAYER/playerIndex.pwn"

#if !defined _player
	#error Impossible de Charger le Fichier Player , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "easyDialog"

#if !defined Dialog_Opened
	#error Veuillez Télécharger l'include EasyDialog | github.com/Awsomedude/easyDialog
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\ACCOUNT\accountLogin.pwn"

#if !defined _login_
  #error Impossible de Charger le Fichier de Compte , Login introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\ACCOUNT\accountRegister.pwn"

#if !defined _register_
  #error Impossible de Charger le Fichier de Compte , Register introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM\PLAYER\ACCOUNT\accountFunc.pwn"

#if !defined IsPlayerLoged
  #error Impossible de Charger le Fichier de Compte , Fonction introuvable
#endif
