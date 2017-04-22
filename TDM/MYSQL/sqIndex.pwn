/*
      Mysql System With R40 Plugins
      All Credits To Madinator & Team
*/

#tryinclude "a_mysql"

#if !defined mysql_connect_file
	#error Veuillez Télécharger L'include Mysql R40 | github.com/pBlueG/SA-MP-MySQL/releases
#endif

#tryinclude "TDM/MYSQL/sqConnect.pwn"

#if !defined _Connect
	#error Impossible de Charger le Fichier Mysql , sqConnect introuvable
#endif

#tryinclude "TDM/MYSQL/sqFunction.pwn"

#if !defined GetData
	#error Impossible de Charger le Fichier Mysql , sqFunction introuvable
#endif

stock _sql();
