1/

	Select NumVol, NomPil, NbPAv
	From Vol
	Inner join Pilote
	On Pilote.NumPil = Vol.NumPilVol
	Inner join Avion
	On Avion.NumAv = Vol.NumPilVol
	Inner join Compagnie
	On Compagnie.NumComp =Avion.NumCompAv
	Where NomComp = (Select NomComp
					From Compagnie
					Where NomComp = 'Air France');
					
+--------+--------+-------+
| NumVol | NomPil | NbPAv |
+--------+--------+-------+
|    101 | Dupont |   150 |
|    109 | Yvon   |   200 |
|    110 | Eric   |   300 |
|    111 | Eric   |   300 |
+--------+--------+-------+

2/
	Select NumAv, NomComp, NbPAv
	From Avion
	Inner join Compagnie
	On Compagnie.NumComp = Avion.NumCompAv
	Where NbPAv = (Select max(NbPAv)
				  from Avion);
				  	  			      
+-------+------------+-------+
| NumAv | NomComp    | NbPAv |
+-------+------------+-------+
|     7 | Air Italia |   600 |
+-------+------------+-------+

3/
	Select NumAv, NomComp
	From Avion
	Inner join Compagnie
	On Compagnie.NumComp = Avion.NumCompAv
	Inner join vol
	On vol.NumAvVol = Avion.NumAv
	Where (HrArVol-HrDepVol) = (select (HrArVol-HrDepVol)
							   from vol);
							   
							   