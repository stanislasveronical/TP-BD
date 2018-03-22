-- Serveur: localhost
-- Généré le : Mardi 17 Juillet 2007 à 19:50
-- Version du serveur: 4.1.9
-- Version de PHP: 4.3.10
-- --------------------------------------------------------

-- 
-- Structure de la table `aeroport`
-- 
use mysql;
drop database if exists compagnie;
create database compagnie;
use compagnie;


CREATE TABLE `aeroport` (
  `NumAero` int(11) NOT NULL default '0',
  `NomAero` varchar(20) NOT NULL default '',
  `VilleAero` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`NumAero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `aeroport`
-- 

INSERT INTO `aeroport` VALUES (1, 'StEx', 'Lyon');
INSERT INTO `aeroport` VALUES (2, 'CDG', 'Paris');
INSERT INTO `aeroport` VALUES (3, 'Cointrain', 'Geneve');
INSERT INTO `aeroport` VALUES (4, 'JFK', 'NewYork');

-- --------------------------------------------------------

-- 
-- Structure de la table `avion`
-- 

CREATE TABLE `avion` (
  `NumAv` int(11) NOT NULL default '0',
  `DMSrvAv` date NOT NULL default '0000-00-00',
  `NbPAv` int(11) NOT NULL default '0',
  `NumCompAv` int(20) NOT NULL default '0',
  PRIMARY KEY  (`NumAv`),
  KEY `NumCompAv` (`NumCompAv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `avion`
-- 

INSERT INTO `avion` VALUES (1, '2000-01-01', 150, 1);
INSERT INTO `avion` VALUES (2, '2001-05-06', 200, 2);
INSERT INTO `avion` VALUES (3, '2002-04-03', 250, 3);
INSERT INTO `avion` VALUES (4, '2005-06-09', 300, 4);
INSERT INTO `avion` VALUES (5, '2004-08-09', 400, 4);
INSERT INTO `avion` VALUES (6, '2001-05-09', 450, 3);
INSERT INTO `avion` VALUES (7, '2003-08-07', 600, 2);
INSERT INTO `avion` VALUES (8, '2005-06-09', 350, 2);
INSERT INTO `avion` VALUES (9, '2000-04-09', 200, 1);
INSERT INTO `avion` VALUES (10,'2003-05-06', 300, 1);

-- --------------------------------------------------------

-- 
-- Structure de la table `compagnie`
-- 

CREATE TABLE `compagnie` (
  `NumComp` int(11) NOT NULL default '0',
  `NomComp` varchar(20) NOT NULL default '',
  `NatComp` varchar(5) NOT NULL default '',
  PRIMARY KEY  (`NumComp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `compagnie`
-- 

INSERT INTO `compagnie` VALUES (1, 'Air France', 'Fr');
INSERT INTO `compagnie` VALUES (2, 'Air Italia', 'It');
INSERT INTO `compagnie` VALUES (3, 'Quantas', 'Aust');
INSERT INTO `compagnie` VALUES (4, 'Swiss Air', 'Suis');

-- --------------------------------------------------------

-- 
-- Structure de la table `pilote`
-- 

CREATE TABLE `pilote` (
  `NumPil` int(11) NOT NULL default '0',
  `NomPil` varchar(20) NOT NULL default '',
  `SalPil` double NOT NULL default '0',
  `DateEmbPil` date NOT NULL default '0000-00-00',
  `NumCompPil` int(11) default '0',
  PRIMARY KEY  (`NumPil`),
  KEY `NumCompPil` (`NumCompPil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `pilote`
-- 

INSERT INTO `pilote` VALUES (1, 'Dupont', 1500, '2006-01-01', 1);
INSERT INTO `pilote` VALUES (2, 'Durand', 2000, '2005-07-03', 2);
INSERT INTO `pilote` VALUES (3, 'Martin', 2500, '2004-02-02', 3);
INSERT INTO `pilote` VALUES (4, 'Roger', 3000, '2000-01-05', 4);
INSERT INTO `pilote` VALUES (5, 'Paul', 4000, '2001-05-09', 4);
INSERT INTO `pilote` VALUES (6, 'Pascal', 2500, '2006-05-05', 3);
INSERT INTO `pilote` VALUES (7, 'Michel', 3500, '2003-06-04', 2);
INSERT INTO `pilote` VALUES (8, 'Henri', 2600, '2004-09-01', 2);
INSERT INTO `pilote` VALUES (9, 'Yvon', 3400, '2005-08-07', 1);
INSERT INTO `pilote` VALUES (10, 'Eric', 1600, '2003-01-08', 1);

-- --------------------------------------------------------

-- 
-- Structure de la table `vol`
-- 

CREATE TABLE `vol` (
  `NumVol` int(11) NOT NULL default '0',
  `DateVol` date NOT NULL default '0000-00-00',
  `HrDepVol` time NOT NULL default '00:00:00',
  `HrArVol` time NOT NULL default '00:00:00',
  `NumAeroDepVol` int(11) NOT NULL default '0',
  `NumAeroArVol` int(11) NOT NULL default '0',
  `NumPilVol` int(11) NOT NULL default '0',
  `NumAvVol` int(11) NOT NULL default '0',
  PRIMARY KEY  (`NumVol`),
  KEY `NumAeroDep` (`NumAeroDepVol`,`NumAeroArVol`,`NumAvVol`),
  KEY `NumAeroArVol` (`NumAeroArVol`),
  KEY `NumPilVol` (`NumPilVol`),
  KEY `NumAvVol` (`NumAvVol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contenu de la table `vol`
-- 

INSERT INTO `vol` VALUES (101, '2006-06-06', '10:00:00', '11:00:00', 1, 2, 1, 1);
INSERT INTO `vol` VALUES (102, '2006-06-07', '08:00:00', '10:00:00', 2, 3, 2, 2);
INSERT INTO `vol` VALUES (103, '2006-06-10', '14:00:00', '19:00:00', 3, 4, 3, 3);
INSERT INTO `vol` VALUES (104, '2006-06-11', '19:00:00', '22:00:00', 4, 1, 4, 4);
INSERT INTO `vol` VALUES (105, '2006-06-15', '10:00:00', '11:00:00', 1, 3, 5, 5);
INSERT INTO `vol` VALUES (106, '2006-06-17', '07:00:00', '08:00:00', 4, 3, 6, 6);
INSERT INTO `vol` VALUES (107, '2006-06-18', '18:00:00', '19:00:00', 2, 4, 7, 7);
INSERT INTO `vol` VALUES (108, '2006-06-06', '18:00:00', '19:00:00', 1, 2, 8, 8);
INSERT INTO `vol` VALUES (109, '2006-06-23', '14:00:00', '16:00:00', 4, 1, 9, 9);
INSERT INTO `vol` VALUES (110, '2006-06-06', '22:00:00', '23:00:00', 3, 2, 10, 10);
INSERT INTO `vol` VALUES (111, '2007-07-25', '15:00:00', '16:00:00', 3, 2, 10, 10);

-- 
-- Contraintes pour les tables exportées
-- 

-- 
-- Contraintes pour la table `avion`
-- 
ALTER TABLE `avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`NumCompAv`) REFERENCES `compagnie` (`NumComp`);

-- 
-- Contraintes pour la table `pilote`
-- 
ALTER TABLE `pilote`
  ADD CONSTRAINT `pilote_ibfk_1` FOREIGN KEY (`NumCompPil`) REFERENCES `compagnie` (`NumComp`);

-- 
-- Contraintes pour la table `vol`
-- 
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_3` FOREIGN KEY (`NumAeroDepVol`) REFERENCES `aeroport` (`NumAero`);
ALTER TABLE `vol`  
  ADD CONSTRAINT `vol_ibfk_4` FOREIGN KEY (`NumAeroArVol`) REFERENCES `aeroport` (`NumAero`);
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_5` FOREIGN KEY (`NumPilVol`) REFERENCES `pilote` (`NumPil`);
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_6` FOREIGN KEY (`NumAvVol`) REFERENCES `avion` (`NumAv`);
