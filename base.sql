CREATE TABLE IF NOT EXISTS `Compte` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Ip` varchar(16) NOT NULL,
  `Staff` tinyint(1) NOT NULL DEFAULT '0',
  `Username` varchar(24) NOT NULL,
  `Password` varchar(130) NOT NULL,
  `Level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Xp` int(11) unsigned NOT NULL DEFAULT '0',
  `Kills` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Deaths` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `Bans` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(15) NOT NULL,
  `RaisonBan` varchar(144) NOT NULL,
  `BanPar` varchar(24) NOT NULL,
  `BanTime` int(11) NOT NULL,
  `HeureBan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
