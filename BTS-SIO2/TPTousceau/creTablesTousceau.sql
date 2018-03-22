/*
**  Ce script créé les tables de la base TOUSCEAU
SOUSCRIT     (NUM, NOM, VILLE, TOTAL)
VERSE           (#NUM, DATE, MONTANT)
ABONNE       (#NUM, #CODE-R, DATE-D, DUREE)
REVUE          (CODE-R, NOM-R, PRIX)



(TOTAL : total des sommes versées l'année précédente)


 */

/* création de la database */
 
 
drop database if exists Tousceau;
create database Tousceau;
USE Tousceau;

/* création des tables */

/* table SOUSCRIT */

drop table if exists SOUSCRIT;
CREATE TABLE SOUSCRIT
(num int not null ,
 nom char(20),
 ville char(20),
 total decimal(10.2)
 )engine = innodb;

describe SOUSCRIT;

/* table REVUE */

drop table if exists REVUE;
CREATE TABLE REVUE
(coder char(3)  NOT NULL ,
 nomr char(30)  NOT NULL ,
 prix decimal(8.2) 
 )engine = innodb;

describe revue; 
 
 /* table VERSE */

drop table if exists VERSE;
CREATE TABLE VERSE
(
 num int  NOT NULL ,
 datev  date  NOT NULL , 
  montant decimal(10.2) 
  )engine = innodb;
 
 describe verse;

 /* table ABONNE */

drop table if exists ABONNE;
CREATE TABLE abonne
(
 num int  NOT NULL ,
 coder char(3)  NOT NULL  ,
 dateDebut date  noT NULL ,
 duree int 
 )engine = innodb;
 
describe abonne;

/* création des clés primaires */

alter table souscrit
add constraint pk_souscrit PRIMARY KEY (num);

alter table revue
add constraint pk_revue PRIMARY KEY (coder);

alter table verse
add constraint pk_verse PRIMARY KEY (num, datev);

alter table abonne
add constraint pk_abonne PRIMARY KEY (num, coder);

/* creation des clés étrangères */

alter table verse
add constraint fk_verse_num FOREIGN KEY (num) REFERENCES souscrit(num);
alter table abonne
add constraint fk_abonne_num FOREIGN KEY (num) REFERENCES souscrit(num);
alter table abonne
add constraint fk_abonne_coder FOREIGN KEY (coder) REFERENCES revue(coder);

/* insertion des lignes */

delete from souscrit;




INSERT souscrit VALUES (1,  'Dupond'  , 'Paris',7000   );
INSERT souscrit VALUES (2,'Durand'  , 'Lyon',12000   );
INSERT souscrit VALUES (3,'Martin'  , 'Marseille',5000   );
INSERT souscrit VALUES (4,'Petit'  , 'Rouen',20000   );
INSERT souscrit VALUES (5,'Thomas'  , 'Lille',15000   );
INSERT souscrit VALUES (6,'Legendre'  , 'Metz',25000   );
INSERT souscrit VALUES (7,'Loisel'  , 'Lille',6000   );


SELECT * FROM souscrit;

delete from verse;

INSERT verse VALUES (  1,'2017/01/31',50   );
INSERT verse VALUES (  2,'2017/02/28',200   );
INSERT verse VALUES (  3,'2017/02/15',8750  );
INSERT verse VALUES (  4,'2016/08/28',800  );
INSERT verse VALUES (  5,'2016/05/03',1000  );
INSERT verse VALUES (  6,'2016/07/14',30  );
INSERT verse VALUES (  1,'2016/10/18',600);
INSERT verse VALUES (  1,'2016/12/24',400);
INSERT verse VALUES (  3,'2016/11/30',80);
INSERT verse VALUES (  7,'2016/09/20',9000);



SELECT * FROM verse;

delete from revue;

INSERT revue VALUES (  'r10','talypso',250 );
INSERT revue VALUES (  'r20','match',180 );
INSERT revue VALUES (  'r30','svm',200 );
INSERT revue VALUES (  'r40','01info',350 );
INSERT revue VALUES (  'r50','closer',40 );

SELECT * FROM revue;

delete from abonne;

INSERT abonne VALUES (  1,'r10','2017/01/01',12 );
INSERT abonne VALUES (  1,'r30','2016/03/01',6 );
INSERT abonne VALUES (  2,'r10','2016/06/01',6 );
INSERT abonne VALUES (  2,'r20','2016/08/01',18 );
INSERT abonne VALUES (  2,'r30','2016/10/01',12 );
INSERT abonne VALUES (  2,'r40','2017/02/01',12 );
INSERT abonne VALUES (  3,'r40','2016/03/01',6 );
INSERT abonne VALUES (  4,'r30','2016/09/15',6 );


SELECT * FROM abonne;


/* Procédure Utilisateur de Création d'un nouveau souscripteur*/

delimiter |
drop procedure if exists ajoutSouscrit |
create procedure ajoutSouscrit
(num integer,nom char(20), ville char(20),total decimal(10,0))
begin
	insert into souscrit 
	values (num,nom, ville,total);
End |
delimiter ;
call ajoutSouscrit(8,"Brogniart","Paris", 100000);
select * from souscrit;
show create procedure ajoutSouscrit;

/* Procédure Utilisateur qui donne la liste des souscripteurs ayant fait au moins un versement
d'un montant supérieur à une borne inférieure et un versement d'un montant inférieur à une borne inférieure*/

R1=Selection(verse,montant<100)
R2=Selection(Verse,montant>500)
R3=Projection(R1,num)
R4=Projection(R2,num)
R5=Intersection(R3,R4)
R6=Jointure(R5,souscrit,R5.num=s.num)
R7=Projection(R6,num,nom,ville)

delimiter |
drop procedure if exists listeSouscrit |
create procedure listeSouscrit
(bornSup integer, bornInf integer)
begin
	select distinct s.num, nom from souscrit s, verse v
	where s.num=v.num and montant > bornInf
	and s.num in (select s.num from souscrit s, verse v
	where s.num=v.num	
	and montant < bornSup);
End |
delimiter ;
call listeSouscrit(100,500);

/* Procédure stockée qui permet de déterminer les souscripteur qui seront encore abonnée en février 2017*/

delimiter |
drop procedure if exists abonneSouscrit |
create procedure abonneSouscrit
(echeance date)
begin
	select distinct s.num, nom
	from souscrit s
	inner join abonne a
	on s.num=a.num
	where date_add(dateDebut, interval duree month) > echeance;
End |
delimiter ;
call abonneSouscrit("2017/11/01");

/* Procédure stockée qui permet de mettre à jour le versement d'un souscripteur et reçoit en paramètre le nom du souscripteur et le pourcentage d'augmentation*/

R1=Cumul(Verse,num,montant)
R2=Max(R1,R1.CumulMax)
R3=Selection(R1,CumulMax=R2.Max)
R4=Projection(R3,num)

create view versementTotaux as
	Select num, sum(montant) as total from verse
	group by num;

show create view versementTotaux;

select*from versementTotaux;

delimiter |
drop procedure if exists mettreAJourSouscrit |
create procedure mettreAJourSouscrit
(nom char(20))
begin
	update verse set montant= montant + montant;

End |
delimiter ;
call mettreAJourSouscrit( );


Select max(MtTotal) from versementTotaux;
select num from versementTotaux where MtTotal = Select max(MtTotal) from versementTotaux);