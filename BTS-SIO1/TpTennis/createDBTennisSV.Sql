use mysql;

drop DATABASE if exists TENNISsv;

CREATE DATABASE TENNISsv;

use tennissv;

CREATE TABLE joueur (
	numeroLicence int(5),
	nomJoueur char(10),
	prenomJoueur char(10),
	age int(3),
	nation char(3),
	numeroSponsor int(2),
	classementAtp int(3)
);
CREATE TABLE tournoi (
	codeTournoi char(2),
	nomTournoi char(40),
	villeTournoi char(20)
);
CREATE TABLE participer (
	numeroLicence int(5),
	codeTournoi char(2)
);