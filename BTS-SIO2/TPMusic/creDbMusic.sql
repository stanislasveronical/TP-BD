drop database if exists music;
create database music;
use music;

DROP TABLE if exists inscriptions;
DROP TABLE if exists eleves;
DROP TABLE if exists responsables;
DROP TABLE if exists cours;
DROP TABLE if exists instruments;
DROP TABLE if exists tarif;
DROP TABLE if exists tranches;
DROP TABLE if exists typeCours;

CREATE TABLE typeCours
(
id INTEGER NOT NULL AUTO_INCREMENT ,
libelle VARCHAR(50),
primary key (id) )engine=innodb;

CREATE TABLE tranches
(
id char(1)NOT NULL ,
quotientMin integer(11),
primary key (id))engine=innodb;

CREATE TABLE tarif
(
idTypeCours INTEGER NOT NULL ,
idTranche char(1) NOT NULL ,
montant integer(11) )engine=innodb;

CREATE TABLE instruments
(
id INTEGER NOT NULL auto_increment,
intitule varchar(50),
primary key (id) )engine=innodb;

CREATE TABLE cours
(
id INTEGER NOT NULL AUTO_INCREMENT ,
libelle VARCHAR(50) NOT NULL  ,
agemini INTEGER(11) NOT NULL ,
agemaxi INTEGER(11) NULL ,
nbplaces INTEGER(11) NULL ,
idInstrument INTEGER(11) NULL,
idTypeCours INTEGER(11) NOT NULL,
primary key (id))engine=innodb;

CREATE TABLE responsables
(
id INTEGER(11) NOT NULL AUTO_INCREMENT ,
nom varchar(50) ,
prenom varchar(50) ,
adresse varchar(50) ,
ville varchar(50) ,
CP char(5)  ,
email varchar(50)  ,
quotient integer(11)  ,
tel1 char(10)  ,
tel2 char(10)  ,
tel3 char(10),
primary key (id))engine=innodb;


CREATE TABLE eleves
(
id INTEGER(11) NOT NULL AUTO_INCREMENT ,
nom varchar(50) NOT NULL ,
prenom varchar(50) NOT NULL ,
dateNaiss date NOT NULL  ,
idResponsable  INTEGER(11) NOT NULL,
primary key (id) )engine=innodb;



CREATE TABLE inscriptions
(
id INTEGER(11) NOT NULL AUTO_INCREMENT ,
nombreDePaiements INTEGER(11) NOT NULL ,
idEleve INTEGER(11) NOT NULL  ,
idCours INTEGER(11) NOT NULL,
primary key (id) )engine=innodb;


/* clés primaires  */

alter table tarif
add constraint primary key (idTypeCours, idTranche);

/* clés  étrangères */
alter table eleves
add constraint FK_eleves_responsable 
foreign key (idResponsable) references responsables(id);

alter table inscriptions
add constraint FK_inscriptions_eleves
FOREIGN KEY (idEleve) REFERENCES eleves (id) ;

alter table inscriptions
add constraint FK_inscriptions_cours
FOREIGN KEY (idCours) REFERENCES cours (id);

alter table cours
add constraint FK_cours_instrument
FOREIGN KEY (idInstrument) REFERENCES instruments (id);

alter table cours
add constraint FK_cours_typeCours
FOREIGN KEY (idTypeCours) REFERENCES typeCours (id);

alter table tarif
add constraint FK_tarif_typeCours
FOREIGN KEY (idTypeCours) REFERENCES typeCours (id);
alter table tarif
add constraint FK_tarif_tranche
FOREIGN KEY (idTranche) REFERENCES tranches (id);

CREATE TABLE Erreur (id TINYINT unsigned AUTO_INCREMENT PRIMARY KEY,
libErreur VARCHAR(255) UNIQUE);
-- Insertion de l'erreur qui nous intéresse
INSERT INTO Erreur (liberreur) VALUES ("Erreur : insertion impossible") ;


drop trigger before_insert_inscriptions;
DELIMITER |
CREATE TRIGGER before_insert_inscriptions BEFORE INSERT 
ON inscriptions FOR EACH ROW 
BEGIN
		IF new.nombreDePaiements < 1 or new.nombreDePaiements > 3
	THEN
	INSERT INTO Erreur (liberreur) VALUES ("Erreur : insertion impossible") ;
 	end IF;
END|
delimiter ;








INSERT INTO instruments (intitule) values 
('Batterie'),
('Guitare'),
('Flute'),
('Saxophone'),
('Violon'),
('Piano');

INSERT INTO typeCours (libelle)values
('individuel'),
('collectif');

INSERT INTO cours (libelle, agemini, agemaxi,nbplaces,idInstrument,idTypeCours) VALUES 
('batterie_débutant', 6,12, 10,1,2),
( 'piano_confirmé', 8,14, 20,6,1),
( 'guitare_expert', 12,20, 8, 2, 1);

INSERT INTO tranches VALUES
('A',0),('B', 251),('C', 426),('D', 681),('E', 935),('F', 1801),('X', 9999);

insert into tarif values
(1,'A',60),
(2,'A',30),
(1,'B',96),
(2,'B',48),
(1,'C',126),
(2,'C',63),
(1,'D',192),
(2,'D',96),
(1,'E',282),
(2,'E',141),
(1,'F',330),
(2,'F',165),
(1,'X',417),
(2,'X',209);
INSERT INTO responsables (nom, prenom, adresse,ville,CP,quotient) VALUES
('Dupond','Eric','20 rue de Jaigny','Montmorency','95160',750),
('Durand','Luc','15 rue Emile','Enghien','95380',220),
('Petit','Alain','2 avenue Foch','Soisy','95560',1902);

INSERT INTO eleves (nom, prenom, datenaiss,idResponsable) VALUES
('Dupond','Théo','2007-01-15',1),
('Durand','Alex','2003-04-25',2),
('Petit','Hugo','2009-11-7',3);


insert into inscriptions (nombreDePaiements,idEleve,idCours ) VALUES
(1,1,1),
(2,2,2);
(2,1,2);
(2,1,3);

select nom from eleves e
inner join inscriptions i 
on e.id=i.idEleve
Group by idEleve, nom
Having count (*) > 2;

select nom from eleves e 
inner join inscriptions i 
on e.id=i.idEleve
inner join cours c
on c.id=i.idCours
where c.libelle="piano_confirmé"
And e.id in (Select idEleve 
				From inscriptions i2
				Inner join cours c2
				On i2.idCours=c2.id
				Where c2.libelle="guitare_expert");

-- Quels sont les éléves qui suivent le plus de cours --

create view statCours(id,nom,nbCours)
as Select e.id,e.nom,count(*)
from eleves e
inner join inscriptions i
on e.id=i.idEleve
group by e.id,e.nom;

select * from statCours;

select id, nom from statCours
Where nbCours = (select max(nbCours) from statCours);

-- Quels sont les éléves qui suivent tous les cours du conservatoire --

R1= projection(inscriptions,idEleve,idCours)
R2= projection(cours,id)
R3= division (R1,R2)
R4= jointure(R3,eleves,R3.idEleve=eleves.id)
R5= projection (R4, nom)

select idEleve count (distinct idCours)
from inscriptions
group by idEleve
having count (distinct idCours)= (select * from cours);


