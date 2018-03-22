-----Modifier la valeur du sexe en le mettant à null-----
Delimiter |
Drop Trigger if exists before_insert_animal |
Create trigger before_insert_animal 
Before Insert On animal For Each Row 
Begin
	if new.sexe is not null
		and new.sexe != 'F'
		and new.sexe != 'M'
	then
		set new.sexe = null;
  	end if;
end |
Delimiter ;

-----Insert pour tester-----
INSERT INTO animal  
VALUES (63,'E','2010-02-20 05:55:00','BoBo','BoBo a faim !',4,NULL,NULL,NULL);

INSERT INTO animal  
VALUES (64,'V','2010-02-20 05:55:00','PoPo','PoPo est petit !',4,NULL,NULL,NULL);

-----Provoquer une erreur qui empêchera l'insetion/la modification-----
CREATE TABLE Erreur (

    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    erreur VARCHAR(255) UNIQUE);

INSERT INTO Erreur (erreur) VALUES ('Erreur : sexe doit valoir "M", "F" ou NULL.');

DELIMITER |
Drop Trigger if exists before_insert_animal |
CREATE TRIGGER before_insert_animal BEFORE INSERT
ON Animal FOR EACH ROW
BEGIN
    IF NEW.sexe IS NOT NULL   -- le sexe n'est ni NULL
    AND NEW.sexe != 'M'       -- ni "M"
    AND NEW.sexe != 'F'       -- ni "F"
      THEN
        INSERT INTO Erreur (erreur) VALUES ('Erreur : sexe doit valoir "M", "F" ou NULL.');
    END IF;
END |
DELIMITER ;

-----Insert pour tester-----
INSERT INTO animal  
VALUES (65,'X','2010-02-20 05:55:00','DoDo','DoDo a envie de dormir !',4,NULL,NULL,NULL);

-----Verification du booléen dans Adoption-----
INSERT INTO Erreur (erreur) VALUES ('Erreur : paye doit valoir TRUE (1) ou FALSE (0).');

DELIMITER |
Drop Trigger if exists before_insert_adoption |
CREATE TRIGGER before_insert_adoption BEFORE INSERT
ON Adoption FOR EACH ROW
BEGIN
    IF NEW.paye != TRUE      
    AND NEW.paye != FALSE    
      THEN
        INSERT INTO Erreur (erreur) VALUES ('Erreur : paye doit valoir TRUE (1) ou FALSE (0).');
    END IF;
END |
DELIMITER ;

-----Verification de la date d'adoption-----
INSERT INTO Erreur (erreur) VALUES ('Erreur : date_adoption doit être postérieure ou égale date_reservation.');

DELIMITER |
Drop Trigger if exists before_insert_adoption |
CREATE TRIGGER before_insert_adoption BEFORE INSERT
ON Adoption FOR EACH ROW
BEGIN
    IF NEW.paye != TRUE      
    AND NEW.paye != FALSE    
      THEN
        INSERT INTO Erreur (erreur) VALUES ('Erreur : date_adoption doit être postérieure ou égale date_reservation.');
    END IF;
END |
DELIMITER ;
