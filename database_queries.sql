-- Requete 1 : Liste des bénévoles et de leur âge, ainsi que les événements auxquels ils ont participés

SELECT Personne.Nom, Personne.Prenom, YEAR(CURRENT_DATE) - YEAR(Personne.DateNaissance) AS Age, Evenement.IdEvenement
FROM InscriptionBenevole
JOIN Personne ON InscriptionBenevole.IdPersonne = Personne.IdPersonne
JOIN Participation ON Participation.IdInscription = InscriptionBenevole.IdInscription
JOIN Evenement ON InscriptionBenevole.IdEvenement = Evenement.IdEvenement
Where Personne.Job = 'bénévole';

-- Requete 2 : Montant des prestations réglées aux artistes entre deux dates données

SELECT SUM(MontantCachet) AS "Prestations réglées"
FROM Cachet
WHERE EtatCachet = "payé" AND (DateCachet > "2010-01-01" AND DateCachet < "2021-02-12");

-- Requete 3 : Afficher le nombre de places disponibles pour un événement

SELECT SUM(Capacite) - SUM(Ticket) AS "Place restante evenement"
FROM(
    SELECT Paiement.IdSpectacle, COUNT(IdPaiement) AS Ticket, Salle.capacite AS Capacite
    FROM Spectacle
    JOIN Salle ON Salle.IdSalle = Spectacle.IdSalle
    JOIN Paiement ON Spectacle.IdSpectacle = Paiement.IdSpectacle
    GROUP BY Paiement.IdSpectacle
    UNION ALL
    SELECT Reservation.IdSpectacle, COUNT(IdReservation) AS Ticket, Salle.capacite AS Capacite
    FROM Spectacle
    JOIN Salle ON Salle.IdSalle = Spectacle.IdSalle
    JOIN Reservation ON Spectacle.IdSpectacle = Reservation.IdSpectacle
    GROUP BY Reservation.IdSpectacle
) AS U
WHERE IdSpectacle IN (SELECT IdSpectacle
FROM Spectacle
WHERE IdEvenement = "13");

-- Requete 4 : Afficher le nombre de minutes, d’heures, de jours, de mois et d’années avant le début d’un événement

SELECT DAY(DateDebEvent) - DAY(CURRENT_TIMESTAMP) AS jour,
TIMESTAMPDIFF(MONTH, CAST(CONCAT(DateDebEvent, ' ', HeureDebEvent) AS DATETIME), CURRENT_TIMESTAMP) % 12 AS mois,
TIMESTAMPDIFF(YEAR, CAST(CONCAT(DateDebEvent, ' ', HeureDebEvent) AS DATETIME), CURRENT_TIMESTAMP) % 100 AS annee,
TIMESTAMPDIFF(HOUR, CAST(CONCAT(DateDebEvent, ' ', HeureDebEvent) AS DATETIME), CURRENT_TIMESTAMP) % 24 AS heures,
TIMESTAMPDIFF(MINUTE, CAST(CONCAT(DateDebEvent, ' ', HeureDebEvent) AS DATETIME), CURRENT_TIMESTAMP) % 60 AS minutes,
TIMESTAMPDIFF(SECOND, CAST(CONCAT(DateDebEvent, ' ', HeureDebEvent) AS DATETIME), CURRENT_TIMESTAMP) % 60 AS secondes
FROM Evenement;

-- Requete 5 : Afficher les événements par ordre de meilleures ventes, avec les sommes collectées au total d’une part, et le bénéfice réalisé d’autre part (après paiement des artistes)

SELECT Evenement.NomEvent, COUNT(*) AS Nombre_de_ticket_vendus, ROUND(SUM(Tarif.PrixTarif),2) AS somme_collectée, SUM(Cachet.MontantCachet) AS  paiement_des_artistes, (ROUND(SUM(Tarif.PrixTarif), 2) - SUM(Cachet.MontantCachet)) AS benefice
FROM Paiement
JOIN Spectacle ON Paiement.IdSpectacle = Spectacle.IdSpectacle
JOIN Tarif ON Tarif.NomTarif = Paiement.NomTarif
JOIN Cachet ON Cachet.IdSpectacle = Paiement.IdSpectacle
Join Evenement ON Spectacle.IdEvenement = Evenement.IdEvenement
WHERE Evenement.EtatEvent = "maintenu"
GROUP BY Evenement.NomEvent
ORDER BY Nombre_de_ticket_vendus DESC;

-- Requete 6 : Proposer une requête d’insertion d’un événement composé de 7 spectacles qui utilisent les 3 salles.
INSERT INTO `Evenement` ( `NomEvent`, `TypeEvent`, `DateDebEvent`, `DateFinEvent`, `HeureDebEvent`, `HeureFinEvent`, `EtatEvent`) VALUES ( 'Evenement inséré ', 'Festival', '2019-03-27', '2019-03-29', '14:30:00', '19:00:00', 'maintenu');

INSERT INTO `Spectacle` (`IdEvenement`, `IdSalle`, `IdArtiste`, `NomSpectacle`, `DateSpectacle`, `HeureDebut`, `HeureFin`, `TypeSpectacle`) VALUES ( '21', '1', '7', 'spectacle inséré 1', '2019-03-27', '14:30:00', '15:30:00', 'théatre'), 
('21', '2', '4', 'spectacle inséré 2', '2019-03-27', '15:00:00', '17:00:00', 'cinéma'), 
('21', '3', '8', 'spectacle inséré 3', '2019-03-27', '18:00:00', '22:00:00', 'cinéma'), 
('21', '1', '9', 'spectacle inséré 4', '2019-03-28', '17:00:00', '19:00:00', 'stand up'), 
('21', '1', '3', 'spectacle inséré 5', '2019-03-28', '20:00:00', '23:00:00', 'concert'), 
('21', '3', '2', 'spectacle inséré 6', '2019-03-29', '13:00:00', '15:00:00', 'théatre'), 
( '21', '2', '1', 'spectacle inséré 7', '2019-03-29', '16:30:00', '19:00:00', 'cinéma');

-- Requete 7 : Les salaires annuels des salariés pour une année donnée

SELECT Personne.nom, Personne.Prenom, Salaire.Salaire 
FROM Personne, Salaire 
WHERE Personne.IdPersonne = Salaire.IdPersonne AND Salaire.AnneeSalaire = "2016" AND Personne.IdPersonne NOT IN (
SELECT Personne.IdPersonne
FROM Personne
WHERE Personne.Job = "bénévole" OR Personne.Job = "membre de la présidence"
);

-- Requete 8 : Les ventes d’un événements classées par tarifs (tarifs plein, jeune, etc.)

SELECT E.IdEvenement, P.NomTarif, COUNT(P.NomTarif) AS Type_Billet_Vendu
FROM Evenement AS E
JOIN Spectacle AS S ON E.IdEvenement = S.IdEvenement
JOIN Paiement AS P ON P.IdSpectacle = S.IdSpectacle
GROUP BY E.IdEvenement, P.NomTarif
ORDER BY Type_Billet_Vendu;

-- Requete 9 : Les pourcentages de types de spectacle pour une année donnée

SELECT S.TypeSpectacle, ROUND(COUNT(S.TypeSpectacle) / (
SELECT COUNT(S.TypeSpectacle)
FROM Spectacle AS S 
WHERE YEAR(S.DateSpectacle) = "2017") * 100 ,1)  AS Pourcentage  
FROM Spectacle AS S
WHERE YEAR(S.DateSpectacle) = "2017"
GROUP BY S.TypeSpectacle;

-- Requete 10 : Les événements annulés ainsi que le montant des tickets remboursés

SELECT R.IdEvenement, SUM(T.PrixTarif) AS Montant_Rembourse_eventAnnule
FROM Remboursement R
JOIN Paiement AS P ON R.IdPaiement = P.IdPaiement
JOIN Tarif AS T ON T.NomTarif = P.NomTarif
WHERE R.EtatRemboursement = "Remboursé"
GROUP BY R.IdEvenement;
