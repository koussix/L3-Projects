/*1- Retourner la date et heure départ et d'arrrivée des vol à distination de paris */
SELECT V.num_vol,A.type_avion,V.date_heure_dep, V.date_heure_arv ,Lv.Aeroport_depart, Lv.Aeroport_arrivee
FROM Vol V, Ligne_vol Lv, Avion A
WHERE V.num_ligne = Lv.num_ligne
    AND Lv.Aeroport_arrivee LIKE '%Paris'
    AND V.num_avion = A.num_avion
ORDER BY V.num_vol

/*2- Afficher les nom,prenom des clients habitant à tizi ouzou et ayant pris au moins un vol à destination
 de CDG-Paris */
SELECT Cl.nom, Cl.prenom
FROM Client Cl, Billet B, Vol V, Ligne_vol Lv
WHERE Cl.num_passeport = B.num_passeport
    AND B.num_vol = V.num_vol
    AND Lv.num_ligne = V.num_ligne
    AND Lv.Aeroport_arrivee LIKE "CDG-Paris"
    AND Cl.adresse LIKE 'Tizi Ouzou'
GROUP BY Cl.nom , Cl.prenom

/*3- Retourner les clients qui voyageront entre le 1/5/2021 et 1/12/2021 */
SELECT cl.nom, cl.prenom
FROM Client cl, Billet b, Vol V
WHERE cl.num_passeport = b.num_passeport
	AND b.num_vol = V.num_vol
    AND date(V.date_heure_dep) BETWEEN date('2021-05-01') AND date('2021-12-01')


/*4- Retourner les clients qui ont reserver ou voyager dans au moins 2 vol */

SELECT CL.nom, CL.prenom, COUNT(*) AS nb_vol
FROM Client CL, Billet B
WHERE CL.num_passeport = B.num_passeport
GROUP BY CL.num_passeport
HAVING COUNT(*) > 1

/* METHODE 2 */
SELECT cl.nom, cl.prenom
FROM Client cl
    WHERE cl.num_passeport IN (SELECT c2.num_passeport
                             FROM Client c2, Billet b2
                             WHERE c2.num_passeport = b2.num_passeport
                             GROUP BY c2.num_passeport
                             HAVING COUNT(c2.num_passeport) >= 2
                            )
GROUP BY cl.num_passeport

/*5- Afficher num vol, le nom de la compagnie , le nom du client et son prenom dont le nombre de kg
 dépasse le seuil autorisé */
SELECT CL.nom, CL.prenom , B.nom_compagnie, B.num_vol, SUM(Bag1.poids)AS Poids_en_kg, B.nb_kg_autorisees
FROM Client CL, Billet B, Bagages Bag1
WHERE CL.num_passeport = B.num_passeport
	AND Bag1.num_passeport = CL.num_passeport
    AND Bag1.num_reservation = B.num_reservation
    AND CL.num_passeport IN( SELECT c2.num_passeport
                             FROM Client c2, Bagages Bag
                             WHERE c2.num_passeport= Bag.num_passeport
                             AND Bag.num_reservation = B.num_reservation
                             GROUP BY c2.num_passeport
                             HAVING SUM(Bag.poids)> B.nb_kg_autorisees)
GROUP BY CL.num_passeport, B.num_reservation

/*6- Nom prenom des membre de l'equipage Air France qui ne sont pas encore affecter à un vol */
SELECT ME.nom, ME.prenom
FROM Membres_equipages ME
WHERE ME.nom_compagnie LIKE "Air France"
AND ME.num_employe NOT IN (SELECT M2.num_employe
                          FROM Membres_equipages M2, Affecter A
                          WHERE M2.num_employe = A.num_employe
                          )
GROUP BY ME.nom , ME.prenom


/*7- Le nom,prenom,le num vol ainsi que le prix du billet de la personne ayant acheter le billet le plus cher*/
SELECT Cl.nom, Cl.prenom,B.num_vol, B.prix
FROM Client Cl, Billet B
WHERE Cl.num_passeport =B.num_passeport
GROUP BY Cl.num_passeport, B.prix
HAVING B.prix = (SELECT MAX(Billet.prix)
                FROM Billet)

/*8- Pour chaque vol afficher le nom et le prenom le numero du vol de la personne ayant acheter le billet le plus cher*/
SELECT Cl.nom, Cl.prenom ,B.num_vol,  B.prix
FROM Client Cl, Billet B
WHERE  Cl.num_passeport =B.num_passeport
    AND NOT EXISTS (SELECT b1.prix
                     FROM Billet b1
                     WHERE b1.num_vol = B.num_vol
                     AND b1.prix > B.prix)
                     
GROUP BY Cl.num_passeport


/*9- Afficher pour chaque pilote le nombre de vol, auxquels il a été affecté y compris quand le nombre est 0,
     ici on calcule au lieu d'utiliser l'attribut nombre de vol*/
SELECT M.nom,M.prenom , COUNT(Pv.num_pilote)
FROM Membres_equipages M,  (Pilote P LEFT OUTER JOIN Piloter Pv ON Pv.num_pilote = P.num_pilote)
WHERE M.num_employe = P.num_pilote
GROUP BY M.nom,M.prenom

/*10- Pour chaque vol afficher le type de l'avion l'iteneraire, la ligne de vol et le nombre de personne,
    y compris quand il n'y a aucune reservation */
SELECT Lv.Aeroport_depart, Lv.Aeroport_arrivee, V.date_heure_dep, V.date_heure_arv, A.type_avion, COUNT(B.num_reservation) 
                                                                                                    AS nb_reservations
FROM Vol V, Avion A, Ligne_vol Lv, Billet B
WHERE Lv.num_ligne = V.num_ligne
  AND V.num_avion = A.num_avion
  AND B.num_vol = V.num_vol
GROUP BY V.num_vol
UNION 
SELECT DISTINCT Lv.Aeroport_depart, Lv.Aeroport_arrivee, V.date_heure_dep, V.date_heure_arv, A.type_avion,0 AS nb_reservations
FROM Vol V, Avion A, Ligne_vol Lv
WHERE Lv.num_ligne = V.num_ligne
    AND V.num_avion = A.num_avion
    AND NOT EXISTS (SELECT *
                    FROM Billet B
                    WHERE B.num_vol = V.num_vol)




/*############  Creation des vu   ######################*/

/*II- 1 Creer une vue sur les client habitant à tizi ouzou, en stockant le nom le prenom le numpasseport, et l'adresse de chacun d'eux*/
CREATE VIEW Client_tizi_ouzou
AS SELECT Client.nom , Client.prenom, Client.num_passeport, Client.adresse
FROM Client 
WHERE adresse LIKE 'Tizi Ouzou'

/*II- 2 Creer une vue sur les Vol d'air algérie contenant les num_vol,nom_compagnie,type_avion,date_heure_dep,date_heure_arv,
        Aeroport_depart,Aeroport_arrivee
*/
CREATE VIEW Vol_air_algerie
AS SELECT V.num_vol,A.nom_compagnie, A.type_avion, V.date_heure_dep, V.date_heure_arv, Lv.Aeroport_depart, Lv.Aeroport_arrivee
FROM Vol V, Avion A,Ligne_vol Lv
WHERE V.num_avion = A.num_avion
    AND V.num_ligne = Lv.num_ligne
    AND A.nom_compagnie LIKE 'Air Algerie'

/*II- 3 Faire de même pour les vol d'air france
*/
CREATE VIEW Vol_air_france
AS SELECT V.num_vol,A.nom_compagnie, A.type_avion, V.date_heure_dep, V.date_heure_arv, Lv.Aeroport_depart, Lv.Aeroport_arrivee
FROM Vol V, Avion A,Ligne_vol Lv
WHERE V.num_avion = A.num_avion
    AND V.num_ligne = Lv.num_ligne
    AND A.nom_compagnie LIKE 'Air France'


/* Creer une vue sur les membre de l'equipage air france, qui doit stocker num_employe,nom, prenom,
    date_embauche, nom_compagnie ,num_pilote s'il existe sinon mettre un 0
*/
CREATE VIEW Membres_equipages_air_france
AS SELECT M.num_employe,M.nom, M.prenom ,M.date_embauche, M.nom_compagnie ,P.num_pilote AS num_pilote_if_exist
FROM Membres_equipages M, Pilote P
    WHERE M.num_employe = P.num_pilote
    AND M.nom_compagnie LIKE 'Air France'
GROUP BY M.num_employe
UNION 
    SELECT DISTINCT M.num_employe,M.nom, M.prenom ,M.date_embauche,M.nom_compagnie ,0 AS num_pilote_if_exist
    FROM Membres_equipages M
    WHERE M.nom_compagnie LIKE 'Air France'
        AND M.num_employe not in (SELECT P.num_pilote
                                FROM Pilote P)
                    



/*#####    II-B Requete Avec les vues ####  */

/*En utilisant les vues définies ci dessus, afficher tout les clients habitant a tizi ouzou et ayant pris un vol d'air algérie, 
  tout en affichant le prix du billet,le type ,et les horraires de vol et les destination.*/ 
SELECT C.nom, C.prenom, C.adresse, V.nom_compagnie, B.prix,B.date_reservation,V.Aeroport_depart, V.Aeroport_arrivee
FROM Vol_air_algerie V, Client_tizi_ouzou C, Billet B
WHERE V.nom_compagnie = B.nom_compagnie
    AND C.num_passeport = B.num_passeport
    AND V.num_vol = B.num_vol
ORDER BY C.num_passeport

/* On peut alors facilement retrouver les passager d'une region donnée et les information de leurs vols !*/
SELECT C.nom, C.prenom, C.adresse, V.nom_compagnie, B.prix,B.date_reservation,V.Aeroport_depart, V.Aeroport_arrivee
FROM Vol_air_france V, Client_tizi_ouzou C, Billet B
WHERE V.nom_compagnie = B.nom_compagnie
    AND C.num_passeport = B.num_passeport
    AND V.num_vol = B.num_vol
ORDER BY C.num_passeport

/*Grâce aux vues définies plus haut, afficher le num_employe, nom prenom,num_pilote,
     des membres de l'equipage Air france qui ne sont affectés à aucun Vol
     (servira à faciliter l'affectation aux planifieurs de vols) */
SELECT M.num_employe, M.nom, M.prenom, M.num_pilote_if_exist , M.nom_compagnie
FROM Membres_equipages_air_france M
WHERE M.num_employe not in ( SELECT A.num_employe
                             FROM Affecter A
                            )
GROUP BY M.num_employe


/*########  III- PARTIE DROITS D'ACCÉS #######*/
/*III-1 En tant que root créer un admin qui servira de root sur la bdd */
CREATE USER 'PeleAdmin'@'localhost' identified by 'Pele1234';
GRANT ALL ON Gestion_Vol_Compagnies.* to 'PeleAdmin'@'localhost' WITH GRANT OPTION 

/*III-2 En tant que root creer les 3 utilisateurs suivants */
CREATE USER 'PDGCompagnieFrance'@'localhost' identified by 'PDGC1234';
CREATE USER 'ClientBarbenoire'@'localhost' identified by 'Client1234';
CREATE USER 'ChefDeBordFrance'@'localhost' identified by 'Chefbord1234';

/*III-3 On se connecte en tant que 'PeleAdmin' pour faire un scénario réaliste où l'administrateur
    donne les accés aux utilisateurs*/
/*a- On donne les droits aux clients*/
GRANT SELECT ON Gestion_Vol_Compagnies.Avion to 'ClientBarbenoire'@'localhost'
GRANT SELECT ON Gestion_Vol_Compagnies.Compagnie to 'ClientBarbenoire'@'localhost' 
GRANT SELECT ON Gestion_Vol_Compagnies.Vol to 'ClientBarbenoire'@'localhost';
GRANT SELECT ON Gestion_Vol_Compagnies.Ligne_vol to 'ClientBarbenoire'@'localhost';

/* Avant de donner les droits au PDGcompagnieFrance on définie une vue MembreAirFr necessaire
 pour qu'il puisse supprimer des membre par exemple qui ont démissionné*/
 CREATE VIEW MembreAirFr
 AS SELECT M.num_employe, M.nom,M.prenom , M.date_embauche
 FROM Membres_equipages M
 WHERE M.nom_compagnie LIKE 'Air France'

/*b- On donne les droits au PDGCompagnieFrance*/
GRANT SELECT ON Gestion_Vol_Compagnies.Compagnie to 'PDGCompagnieFrance'@'localhost' ;
GRANT SELECT,DELETE,INSERT ON Gestion_Vol_Compagnies.MembreAirFr to 'PDGCompagnieFrance'@'localhost'; 
GRANT SELECT ON Gestion_Vol_Compagnies.Ligne_vol to 'PDGCompagnieFrance'@'localhost' ;
GRANT SELECT ON Gestion_Vol_Compagnies.Avion to 'PDGCompagnieFrance'@'localhost' ;
GRANT SELECT ON Gestion_Vol_Compagnies.Membres_equipages_air_france to 'PDGCompagnieFrance'@'localhost' ;


/* Avant de donner les droits au ChefBordAirFrance on définie une vue ClientAirFr necessaire
 pour qu'il puisse supprimer des membre par exemple qui ont desisté ou voir ceux qui sont presents*/
 CREATE VIEW ClientAirFr
 AS SELECT Cl.num_passeport, Cl.nom,Cl.prenom, B.num_reservation
 FROM Client Cl, Billet B
 WHERE Cl.num_passeport = B.num_passeport
    AND B.nom_compagnie LIKE 'Air France'
 
/*c - On donne les droits au chef de bord d'Air France */
GRANT SELECT,INSERT,DELETE ON Gestion_Vol_Compagnies.ClientAirFr to 'ChefDeBordFrance'@'localhost';
GRANT SELECT ON Gestion_Vol_Compagnies.MembreAirFr to 'ChefDeBordFrance'@'localhost'; 
GRANT SELECT ON Gestion_Vol_Compagnies.Ligne_vol to 'ChefDeBordFrance'@'localhost' ;
GRANT SELECT ON Gestion_Vol_Compagnies.Avion to 'ChefDeBordFrance'@'localhost' ;
GRANT SELECT ON Gestion_Vol_Compagnies.Membres_equipages_air_france to 'ChefDeBordFrance'@'localhost' ;

