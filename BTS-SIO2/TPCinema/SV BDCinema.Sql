Use mysql;

Drop DATABASE if exists SVCinema;

CREATE DATABASE SVCinema;

Use SVCinema;

CREATE TABLE Film(
	IdFilm int not null auto_increment primary key, 
	Titre char(100),
	Directeur char(50)
)Engine=InnoDB;

CREATE TABLE Salle(
	IdSalle int not null auto_increment primary key, 
	NomSalle varchar(80),
	Adresse varchar(50),
	Telephone char(20)
)Engine=InnoDB;

CREATE TABLE Seance(
	IdFilm int not null,
	IdSalle int not null,
	Horaire char(10)
)Engine=InnoDB;

CREATE TABLE Jouer(
	IdFilm int not null,
	IdActeur int not null
)Engine=InnoDB;

CREATE TABLE Acteur(
	IdActeur int not null auto_increment primary key,
	Nom char(50)
)Engine=InnoDB;

alter table Seance
Add constraint fk_IdFilm
Foreign Key (IdFilm)
References Film(IdFilm);

alter table Seance
Add constraint fk_IdSalle
Foreign Key (IdSalle)
References Salle(IdSalle);

alter table Jouer
Add constraint fk_IdActeur
Foreign Key (IdActeur)
References Acteur(IdActeur);

alter table Jouer
Add constraint fk_IdFilm
Foreign Key (IdFilm)
References Film(IdFilm);

insert into Film (Titre,Directeur) values ("Mais qui a tué Harry?","Hitchcock");
insert into Film (Titre,Directeur) values ("Cris et chuchotements","Bergman");

insert into Salle (NomSalle,Adresse,Telephone) values ("Gaumont Opéra","31, bd des Italiens","01 47 42 60 33");
insert into Salle (NomSalle,Adresse,Telephone) values ("Saint André des Arts","30, rue Saint André des Arts","01 43 26 48 18");
insert into Salle (NomSalle,Adresse,Telephone) values ("Le Champo","51, rue des Ecoles","01 43 54 51 60");
insert into Salle (NomSalle,Adresse,Telephone) values ("Georges V","144, av. des Champs Elysées","01 45 62 41 46");
insert into Salle (NomSalle,Adresse,Telephone) values ("Les 7 Parnassiens","98, bd du Montparnasse","01 43 20 32 20");

insert into Seance values (2,1,"20:30");
insert into Seance values (1,2,"20:15");
insert into Seance values (2,4,"22:15");
insert into Seance values (2,5,"20:45");

insert into Acteur (Nom) values ("Gwenn");
insert into Acteur (Nom) values ("Forsythe");
insert into Acteur (Nom) values ("MacLaine");
insert into Acteur (Nom) values ("Hitchcock");
insert into Acteur (Nom) values ("Andersson");
insert into Acteur (Nom) values ("Sylwan");
insert into Acteur (Nom) values ("Thulin");
insert into Acteur (Nom) values ("Ullman");

insert into Jouer values (1,1);
insert into Jouer values (1,2);
insert into Jouer values (1,3);
insert into Jouer values (1,4);
insert into Jouer values (2,5);
insert into Jouer values (2,6);
insert into Jouer values (2,7);	
insert into Jouer values (2,8);


