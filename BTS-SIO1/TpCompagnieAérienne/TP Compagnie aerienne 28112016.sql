SERIE 1 :

1)
	Select hour(HrArVol-HrDepVol)
	From vol
	Where numVol = 109;
	
2)
	Select NomComp
	From compagnie
	Where NomComp like "%Air%";
	
3)
	Select NomPil
	From pilote
	Inner join compagnie
	On compagnie.NumComp = pilote.NumCompPil
	Where NumComp =1; 
	
4)
	Select NomComp
	From compagnie
	Inner join pilote
	On compagnie.NumComp=pilote.NumCompPil
	Inner join vol
	On pilote.NumPil = Vol.NumPilVol
	Where NumVol = 105;
	

SERIE 2 :

5)//
	Select Count ()
	From Avion
	Inner join compagnie
	On Avion.NumCompAv = compagnie.NumComp
	Where NumComp = 1;
	
6)//
	Select Sum (nbpav)
	From avion
	Inner join compagnie
	On avion.NumCompAv = compagnie.NumComp
	Where NumCompAv =3;
	
	
7)//
	Select Min (SalPil)
	From pilote
	Inner join compagnie
	On compagnie.NumComp = pilote.NumCompPil
	Where NatComp = 'Fr';
	
	Select compagnie.NumComp, pilote.NumCompPil, Min (SalPil)
	From pilote
	Inner join compagnie On compagnie.NumComp, pilote.NumCompPil
	Group by compagnie.NumComp, pilote.NumCompPil;
	

8)//
	Select 
	Where DateVol='2006-06-06';
	
	
	
	
	
	