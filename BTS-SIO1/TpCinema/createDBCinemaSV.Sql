STANISLAS Véronical

use mysql;

drop DATABASE if exists Cinemasv;

CREATE DATABASE Cinemasv;

use Cinemasv;

CREATE TABLE acteur (
	codeActeur int (10),
	nomActeur varchar (50)
);

CREATE TABLE film (
	codeFilm int (10),
	titreFilm varchar (80),
	anneeSortie int (10),
	note double (3,1),
	nombreVotants int (10),
	codeRealisateur int (10)
);

CREATE TABLE realisateur (
	codeRealisateur int (10),
	nomRealisateur varchar (50)
);

CREATE TABLE distribution (
	codeFilm int (10),
	codeActeur int (10),
	rangActeur int (10)
);

-- Création des contraintes de clés primaires

Alter table acteur
Add constraint pk_acteur
primary key (codeActeur);

Alter table film
Add constraint pk_film
primary key (codeFilm);

Alter table realisateur
Add constraint pk_realisateur
primary key (codeRealisateur);

Alter table distribution
Add constraint pk_distribution
primary key (codeFilm,codeActeur);

-- Création des contraintes de clé étrangères

Alter table film
Add constraint fk_film_codeRealisateur
foreign key (codeRealisateur)
references realisateur(codeRealisateur);

Alter table distribution
Add constraint fk_distribution_codeFilm
foreign key (codeFilm)
references film(codeFilm);

Alter table distribution
Add constraint fk_distribution_codeActeur
foreign key (codeActeur)
references acteur(codeActeur);



1- Distribution mémorise le codeFilm, le codeActeur et le rangActeur : 
Des Entiers.

3- Clé primaire = 4 (soulignés)
Clé étrangères = 3 (#)

6- describe table; 

mysql> describe acteur;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| codeActeur | int(10)     | NO   | PRI | 0       |       |
| nomActeur  | varchar(50) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.05 sec)

mysql> describe film;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| codeFilm        | int(10)     | NO   | PRI | 0       |       |
| titreFilm       | varchar(80) | YES  |     | NULL    |       |
| anneeSortie     | int(10)     | YES  |     | NULL    |       |
| note            | double(3,1) | YES  |     | NULL    |       |
| nombreVotants   | int(10)     | YES  |     | NULL    |       |
| codeRealisateur | int(10)     | YES  | MUL | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
6 rows in set (0.02 sec)

mysql> describe réalisateur;
ERROR 1146 (42S02): Table 'cinemasv.réalisateur' doesn't exist
mysql> describe realisateur;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| codeRealisateur | int(10)     | NO   | PRI | 0       |       |
| nomRealisateur  | varchar(50) | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> describe distribution;
+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| codeFilm   | int(10) | NO   | PRI | 0       |       |
| codeActeur | int(10) | NO   | PRI | 0       |       |
| rangActeur | int(10) | YES  |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
3 rows in set (0.01 sec)


7- 
	a- le script insertActeur.sql lancé 2fois, un message d'erreur s'affiche :
ERROR 1062 (23000): Duplicate entry '5944' for key 'PRIMARY'

Raison : ?

	b- le script insertFilm.sqp lancé, un message d'erreur s'affiche :
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
('cinemasvmasv'.'film', CONSTRAINT 'fk_film_codeRealisateur' FOREIGN KEY
('codeRealisateur') REFERENCES 'realisateur' ('codeRealisateur'))

Comment corriger cette erreur : ?
