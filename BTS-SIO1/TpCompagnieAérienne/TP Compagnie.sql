1)
select (hrarvol-hrdepvol)
from vol
where numVol=109;
+--------------------+
| (hrarvol-hrdepvol) |
+--------------------+
|              20000 |
+--------------------+

2)
Select NomComp
From compagnie
Where NomComp like "%Air%";
+------------+
| NomComp    |
+------------+
| Air France |
| Air Italia |
| Swiss Air  |
+------------+

3)
select nomPil
from pilote 
where numcompPil=1;
+--------+
| nomPil |
+--------+
| Dupont |
| Yvon   |
| Eric   |
+--------+

4)
select nomComp
from compagnie
inner join pilote 
on pilote.numcompPil = compagnie.numComp
inner join vol
on vol.numPilVol = pilote.numpil 
where numVol = 105;
+-----------+
| nomComp   |
+-----------+
| Swiss Air |
+-----------+

5)
select sum(numCompAv)
from avion 
where numCompAv = 1;

6)
select sum(nbpAv)
from avion
inner join compagnie
on compagnie.NumComp = Avion.NumCompAv
where nomComp = "Quantas";
+----------------+
| sum(numCompAv) |
+----------------+
|              3 |
+----------------+

7) 
select min(salpil), avg(salpil)
from pilote
inner join compagnie
on compagnie.NumComp = Pilote.NumCompPil
where NatComp = "Fr";
+-------------+--------------------+
| min(salpil) | avg(salpil)        |
+-------------+--------------------+
|        1500 | 2166.6666666666665 |
+-------------+--------------------+

8)

select count(*)
from vol
inner join aeroport
on aeroport.NumAero = vol.NumAeroDepVol
where nomAero = "StEx" and DateVol = "2006-06-06";
+----------+
| count(*) |
+----------+
|        2 |
+----------+

9)

select max(salpil)
from pilote
inner join compagnie
on compagnie.NumComp = Pilote.NumCompPil
where NomComp = "Air France" and "2005-01-01"<DateEmbPil<"2006-12-31";

+-------------+
| max(salpil) |
+-------------+
|        3400 |
+-------------+

10)

select nomPil, count(*)
from vol
inner join pilote
on pilote.NumPil = Vol.NumPilVol
group by (nomPil);

+--------+----------+
| nomPil | count(*) |
+--------+----------+
| Dupont |        1 |
| Durand |        1 |
| Eric   |        2 |
| Henri  |        1 |
| Martin |        1 |
| Michel |        1 |
| Pascal |        1 |
| Paul   |        1 |
| Roger  |        1 |
| Yvon   |        1 |
+--------+----------+

11)

select nomComp, count(*), avg(salpil)
from compagnie
inner join pilote
on pilote.numCompPil = compagnie.numComp
group by (nomComp);

+------------+----------+--------------------+
| nomComp    | count(*) | avg(salpil)        |
+------------+----------+--------------------+
| Air France |        3 | 2166.6666666666665 |
| Air Italia |        3 |               2700 |
| Quantas    |        2 |               2500 |
| Swiss Air  |        2 |               3500 |
+------------+----------+--------------------+