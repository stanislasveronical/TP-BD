/* script de création de la base de données Cinema */
drop database if exists cinema;
create database cinema;
USE cinema
/* script de création des tables de la base de données cinema */
/* suppression des tables */
DROP TABLE if exists film;
DROP TABLE if exists acteur;
DROP TABLE if exists salle;
DROP TABLE if exists seance;
DROP TABLE if exists jouer;

/* table film */
create table film(idFilm INT auto_increment not null,
titre VARCHAR(50),
directeur varchar(30),
primary key(idFilm))engine= innodb;

/* table acteur */
create table acteur(idActeur INT auto_increment not null,
nom VARCHAR(50),
primary key(idActeur))engine=innodb;

/* table salle */
create table salle(idSalle INT auto_increment not null,
nomSalle VARCHAR(50),
adresse VARCHAR(50),
telephone VARCHAR(15),
primary key(idSalle))engine = innodb;

/* table seance */
create table seance(idFilm INT  not null, idSalle INT  not null,
horaire VARCHAR(10))engine = innodb;

/* table jouer */
create table jouer(idFilm INT not null,
idActeur INT not null)engine=innodb;

/* clés primaires */
alter table jouer  
add constraint PK_jouer primary key(idFilm, idActeur);
alter table seance 
add constraint PK_seance primary key(idFilm, idSalle);

/* clés étrangères */

alter table jouer 
add constraint FK_jouer_film 
foreign key (idFilm) 
references film(idFilm);

alter table jouer 
add constraint FK_jouer_acteur 
foreign key (idActeur) 
references acteur(idActeur);

alter table seance 
add constraint  FK_seance_film 
foreign key(idFilm) 
references film(idFilm);

alter table seance 
add constraint  FK_seance_salle 
foreign key(idSalle) 
references salle(idsalle);

/* insertion des lignes */
insert into film(titre, directeur) values('Mais qui a tué Harry ?', 'Hitchcock');
insert into film(titre, directeur) values('Cris et chuchotements', 'Bergman');
insert into film(titre, directeur) values('Annie Hall', 'Woody Allen');
insert into film(titre, directeur) values('Manhattan', 'Woody Allen');

insert into acteur(nom) value ('Gwen');
insert into acteur(nom) value ('Forsythe');
insert into acteur(nom) value ('MacLaine');
insert into acteur(nom) value ('Hitchcock');
insert into acteur(nom) value ('Anderson');
insert into acteur(nom) value ('Sylwan');
insert into acteur(nom) value ('Thulin');
insert into acteur(nom) value ('Ullman');
insert into acteur(nom) value ('Keaton');
insert into acteur(nom) value ('Roberts');
insert into acteur(nom) value ('Walken');
insert into acteur(nom) value ('Woody Allen');
insert into acteur(nom) value ('Streep');
insert into acteur(nom) value ('Hemingway');


insert into salle(nomSalle, adresse, telephone) values('Gaumont Opera','31 bd des Italiens','01 47 42 60 33');
insert into salle(nomSalle, adresse, telephone) values('St adre des Arts','30 rue St Andre des Arts','01 43 26 48 18');
insert into salle(nomSalle, adresse, telephone) values('Le Champo','51 rue des ecoles','01 47 42 60 33');
insert into salle(nomSalle, adresse, telephone) values('Georges V','144 av des Champs elysees','01 45 62 41 46');
insert into salle(nomSalle, adresse, telephone) values('Les 7 Parnassiens','98 bd du Montparnasse','01 43 20 32 20');


insert into jouer values(1,1);
insert into jouer values(1,2);
insert into jouer values(1,3);
insert into jouer values(1,4);
insert into jouer values(2,5);
insert into jouer values(2,6);
insert into jouer values(2,7);
insert into jouer values(2,8);
insert into jouer values(3,9);
insert into jouer values(3,9);
insert into jouer values(3,10);
insert into jouer values(3,11);
insert into jouer values(3,12);
insert into jouer values(4,12);
insert into jouer values(4,13);
insert into jouer values(4,14);
insert into jouer values(4,9);

insert into seance values(1,2,'20:15');
insert into seance values(2,1,'20:30');
insert into seance values(2,4,'22:15');
insert into seance values(2,5,'20:45');
insert into seance values(3,1,'18:45');
insert into seance values(3,4,'22:15');
insert into seance values(4,1,'21:30');
insert into seance values(4,3,'16:45');
insert into seance values(4,4,'19:45');