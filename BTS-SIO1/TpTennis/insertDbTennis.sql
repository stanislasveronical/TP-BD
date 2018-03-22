insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(121,	"FEDERER",	"Roger", 	21,	"SUI",	3,3);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(252,	"BLAKE",	"James",    19,	"USA",	2,55);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(368,	"GROSJEAN",	"Sébastien",25,	"FRA",	5,99);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(489,	"ROCHUS",	"Olivier",  22,	"BEL",	1,45);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(534,	"SANTORO",	"Fabrice", 	23,	"FRA",	2,35);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(697,	"MOYA",		"Carlos", 	25,	"ESP",	5,5);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(755,	"HEWITT",	"Lleyton", 	23,	"AUS",	3,1);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(866,	"CLEMENT",	"Arnaud",	31,	"FRA",	6,16);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(999,	"GOLDSTEIN","Paul",		18,	"USA",	2,36);
insert into joueur(numeroLicence,nomJoueur,prenomJoueur,age,nation,numeroSponsor,classementAtp) values(1001,"BENNETEAU","Julien",	25,	"FRA",	3,125);

insert into tournoi(codeTournoi,nomTournoi,villeTournoi) values("RG","Rolland Garros","Paris");
insert into tournoi(codeTournoi,nomTournoi,villeTournoi) values("FM","Flushing Meadow","New York");
insert into tournoi(codeTournoi,nomTournoi,villeTournoi) values("WI","Wimbledon","Londres");
insert into tournoi(codeTournoi,nomTournoi,villeTournoi) values("IA","Internationaux Australie","Melbourne");
insert into tournoi(codeTournoi,nomTournoi,villeTournoi) values("BE","Tournoi international de Paris Bercy","Paris");

insert into participer(numeroLicence,codeTournoi) values (121,"RG");
insert into participer(numeroLicence,codeTournoi) values (121,"FM");
insert into participer(numeroLicence,codeTournoi) values (121,"WI");
insert into participer(numeroLicence,codeTournoi) values (121,"IA");
insert into participer(numeroLicence,codeTournoi) values (534,"RG");
insert into participer(numeroLicence,codeTournoi) values (534,"IA");
insert into participer(numeroLicence,codeTournoi) values (755,"IA");
insert into participer(numeroLicence,codeTournoi) values (252,"WI");
insert into participer(numeroLicence,codeTournoi) values (999,"FM");
insert into participer(numeroLicence,codeTournoi) values (368,"BE");
-- compléter les insert into de participer
-- quel est la signification de participer 

