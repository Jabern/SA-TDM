/*
    Fichier Index De configuration Serveur By Jaber
    V0.1
*/

stock _conf();

/**----------------------------------------------------**/

#tryinclude "streamer"

#if !defined CreateDynamicObject
	#error Veuillez Télécharger L'include streamer | github.com/samp-incognito/samp-streamer-plugin/releases
#endif

/**----------------------------------------------------**/

#tryinclude "TDM/CONFIG/confServer.pwn"

#if !defined SERVER_ENVIRONMENT
	#error Impossible de Charger le Fichier de configuration , Fichier Serveur introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM/CONFIG/confMacro.pwn"

#if !defined ClearChat
	#error Impossible de Charger le Fichier de configuration , Macro introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "TDM/CONFIG/map.pwn"

#if !defined LoadMap
	#error Impossible de Charger le Fichier de configuration , Fichier Map introuvable
#endif
