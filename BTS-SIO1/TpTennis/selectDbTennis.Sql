STANISLAS Véronical

-- Question 1 Liste des Joueurs
select * from joueur;
-- Projection (numeroLicence, nomJoueur, prenomJoueur, age, nation, numeroSponsor, classementAtp)


-- Question 2 Liste nomJoueur, prenomJoueur, nation de la Liste des Joueurs
select nomJoueur, prenomJoueur, nation from joueur;
-- Projection (nomJoueur,prenomJoueur,nation)


-- Question 3 Liste nomJoueur, prenomJoueur, classementAtp de la Liste des Joueurs
select nomJoueur, prenomJoueur, classementAtp from joueur where age>21;
-- Restriction (nomJoueur,prenomJoueur,classementAtp,age>21)


-- Question 4 Liste age de la Liste des Joueurs
select age from joueur where nation = 'FRA';
-- Restriction (age, nation='FRA')


-- Question 5 Liste des Joueurs
select * from joueur order by classementAtp;
-- Projection (numeroLicence, nomJoueur, prenomJoueur, age, nation, numeroSponsor, classementAtp)


-- Question 6 Liste nomJoueur de la Liste des Joueurs
select nomJoueur from joueur where nation = 'BEL' OR age = 25;
-- Restriction (nomJoueur, nation='BEL' ou age=18)


-- Question 7 Liste nomJoueur de la Liste des Joueurs
select nomJoueur from joueur where nation = 'BEL' OR nation = 'FRA' AND age =18;
-- Restriction (nomJoueur, nation='BEL' ou nation='FRA' et age=18)


-- Question 8 Empty set
select nomJoueur from joueur where nation = 'USA' AND age >19;
-- Empty set


-- Question 9 Liste nomJoueur, prenomJoueur, age de la Liste des Joueurs
select nomJoueur, prenomJoueur,age from joueur;
-- Projection (joueur, nomJoueur, prenomJoueur, age)


--Question 10 Liste age de la Liste des Joueurs
select * from joueur where age>=21 AND age<=25;
-- Restriction (joueur, age>=21 et age<=25)


-- Question 11 Liste numeroLicence, nomJoueur, prenomJoueur de la Liste des Joueurs
select nomJoueur, numeroLicence, prenomJoueur from joueur;
-- Projection (Joueur, numeroLicence, nomJoueur, prenomJoueur)


-- Question 12 Liste des joueurs européens (nomJoueur,prenomJoueur)
select nomJoueur, prenomJoueur from joueur where nation='SUI' OR nation='FRA' OR nation='BEL' OR nation='ESP';
-- R = Restriction (nomJoueur, prenomJoueur, nation='SUI', 'FRA', 'BEL', 'ESP')
-- Projection (R, nomJoueur, prenomJoueur)


-- Question 13 Liste des Joueurs qui n'habitent pas aux Etats-Unis
select * from joueur where nation='SUI' OR nation='FRA' OR nation='BEL' OR nation='ESP' OR nation='AUS';
-- R1 =  Restriction (joueur, nation= 'SUI','FRA', 'BEL', 'ESP', 'AUS')
-- Projection (R1, numeroLicence, nomJoueur, prenomJoueur, age, nation, numeroSponsor, classementAtp)


-- Question 14 Liste des joueurs (nomJoueur, prenomJoueur, nation) qui habitent en FRANCE et en BELGIQUE
select nomJoueur, prenomJoueur, nation from joueur where nation='FRA' OR nation = 'BEL';
-- R2 = Restriction (nomJoueur, prenomJoueur, nation='FRA', 'BEL')
-- Projection (R2, nomJoueur, prenomJoueur, nation)


-- Question 15 Liste des codes tournois auquel participe le joueur 121
select codeTournoi from participer where numeroLicence=121;
-- R3 = Restriction (codeTournoi, numeroLicence=121)
-- Projection (R3, codeTournoi)


-- Question 16 Liste des noms des tournois auquel participe le joueur 121
select nomTournoi from tournoi inner join participer on tournoi.codeTournoi=participer.codeTournoi where numeroLicence=121;
select nomTournoi from tournoi, participer where numeroLicence=121;




-- Question 17 Liste des noms des tournois auxquels participe FEDERER
select nomTournoi from tournoi inner join participer on tournoi.codeTournoi=participer.codeTournoi where nomJoueur=FEDERER;





-- Question 18 Liste des villes ou jouent des joueurs français






-- Question 19 Liste des tournois ou jouent des joueurs de moins de 21 ans






-- Question 20 Qui joue à Paris






-- Question 21 Qui joue à Rolland Garros





