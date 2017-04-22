/*
	Script INIT :
							Function : Load All TMD fodlers Script By Indexing file
							Params : N/A
							By Jaber
*/

stock _init_();

/**----------------------------------------------------**/

#tryinclude "TDM/CONFIG/confIndex.pwn"

#if !defined _conf
	#error Impossible de Charger le Fichier de configuration , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM/MYSQL/sqIndex.pwn"

#if !defined _sql
	#error Impossible de Charger le Fichier Mysql , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM/PLAYER/playerIndex.pwn"

#if !defined _player
	#error Impossible de Charger le Fichier Player , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM/IA/iaIndex.pwn"

#if !defined _ia
	#error Impossible de Charger le Fichier IA , Index introuvable
#endif
