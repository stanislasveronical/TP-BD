/* script de création de la base de données Gestion du Personnel */
drop database if exists gesper;
create database gesper;
USE gesper
/* script de création des tables de la base de données Gestion du Personnel */
/* suppression des tables */
DROP TABLE if exists Posseder;
DROP TABLE if exists Diplome;
DROP TABLE if exists Employe;
DROP TABLE if exists Service;

/* table diplome */
create table Diplome(dip_id INT auto_increment not null,
dip_libelle VARCHAR(50),primary key(dip_id))engine= innodb;

/* table Service */
create table Service(ser_id INT auto_increment not null,
ser_designation VARCHAR(50),
ser_type VARCHAR(1),
ser_produit VARCHAR(50),
ser_capacite INT,
ser_budget decimal(15,2),
primary key(ser_id))engine=innodb;

/* table Employe */
create table Employe(emp_id INT auto_increment not null,
emp_nom VARCHAR(50),
emp_prenom VARCHAR(50),
emp_sexe VARCHAR(1),
emp_cadre BIT,
emp_salaire decimal(10,2),
emp_service INT,
primary key(emp_id))engine = innodb;

/* table Posseder */
create table Posseder(pos_diplome INT not null,
pos_employe INT not null,
primary key(pos_diplome,pos_employe))engine=innodb;

/* clés étrangères */

alter table Employe add constraint FK_employe_service foreign key (emp_service) references Service(ser_id);
alter table Posseder add constraint FK_posseder_diplome foreign key (pos_diplome) references Diplome(dip_id);
alter table Posseder add constraint  FK_posseder_employe foreign key(pos_employe) references Employe(emp_id);

insert into Diplome(dip_libelle) values('Bac');
insert into Diplome(dip_libelle) value ('Bts');
insert into Diplome(dip_libelle) values('Licence');

insert into Service(ser_designation,ser_type,ser_produit,ser_capacite,ser_budget) values('Atelier A','P','Chaise',10000,null);
insert into Service(ser_designation,ser_type,ser_produit,ser_capacite,ser_budget) values('Atelier B','P','Armoire',2000,null);
insert into Service(ser_designation,ser_type,ser_produit,ser_capacite,ser_budget) values('Comptabilité','A',null,null,2000);
insert into Service(ser_designation,ser_type,ser_produit,ser_capacite,ser_budget) values('Commercial','A',null,null,5000);
insert into Service(ser_designation,ser_type,ser_produit,ser_capacite,ser_budget) values('Atelier C','P','Table',3500,null);


insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Dupont','Alain','M',1,3500,1);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Durand','Pauline','F',0,2500,1);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Dubois','Laurent','M',0,2200,1);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Louvel','Martine','F',1,5000,2);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Guerdon','Patrick','M',0,2500,2);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Poulard','Aline','F',0,3000,2);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Lecomte','Josiane','F',1,3500,3);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Dupuis','Jean','M',0,3000,3);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Franard','Paul','M',1,6000,4);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Augustin','Marcel','M',0,3600,4);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Mauret','Bernard','M',0,2400,5);
insert into Employe(emp_nom,emp_prenom,emp_sexe,emp_cadre,emp_salaire,emp_service) values('Joule','Christine','F',1,4000,5);


insert into Posseder(pos_diplome,pos_employe) values(1,1);
insert into Posseder(pos_diplome,pos_employe) values(1,3);
insert into Posseder(pos_diplome,pos_employe) values(1,5);
insert into Posseder(pos_diplome,pos_employe) values(1,7);
insert into Posseder(pos_diplome,pos_employe) values(1,9);
insert into Posseder(pos_diplome,pos_employe) values(1,11);
insert into Posseder(pos_diplome,pos_employe) values(2,1);
insert into Posseder(pos_diplome,pos_employe) values(2,2);
insert into Posseder(pos_diplome,pos_employe) values(2,8);
insert into Posseder(pos_diplome,pos_employe) values(2,9);
insert into Posseder(pos_diplome,pos_employe) values(2,10);
insert into Posseder(pos_diplome,pos_employe) values(3,1);
insert into Posseder(pos_diplome,pos_employe) values(3,6);
insert into Posseder(pos_diplome,pos_employe) values(3,7);
insert into Posseder(pos_diplome,pos_employe) values(3,12);

delimiter |
drop procedure if exists remiseAZero|
 CREATE PROCEDURE remiseAZero ()
begin
delete from posseder;
delete from employe;
delete from diplome;
delete from service;
ALTER TABLE employe AUTO_INCREMENT = 1;
ALTER TABLE service AUTO_INCREMENT = 1;
ALTER TABLE diplome AUTO_INCREMENT = 1;
end |
delimiter ;

insert into Service(ser_id,ser_designation,ser_type,ser_produit,ser_capacite,ser_budget) values(1,'Atelier A','P','Chaise',10000,null);

create user 'root'@'%' identified by 'siojjr';

--2--
delimiter |
drop procedure if exists salaireMoyEmploye|
CREATE PROCEDURE salaireMoyEmploye (numser int, out salMoy decimal)
BEGIN
   select avg(e.emp_salaire) into salMoy from employe e 
   where e.emp_service=numser;
END |
delimiter ;
call salaireMoyEmploye(5,@salMoy);
select @salMoy;

--3--
select avg(s.ser_budget) from service s;

--4--
select e.emp_id,e.emp_nom,e.emp_prenom, count(p.pos_diplome) from employe e, posseder p
where e.emp_id=p.pos_employe group by e.emp_id,e.emp_nom,e.emp_prenom;

--> service qui ont le + de 2 employe
delimiter |
drop procedure if exists countseremp|
CREATE PROCEDURE countseremp (nbPersonnes int)
BEGIN
	select emp_id,emp_nom,emp_prenom, count(*) as nbDiplomes from employe e inner join posseder p
    on e.emp_id=p.pos_employe where emp_service in (select emp_service from employe group by emp_service having count(*)>@nbPersonnes) 
    group by emp_id, emp_nom,emp_prenom;
END |
delimiter ;
call countseremp(5000);
