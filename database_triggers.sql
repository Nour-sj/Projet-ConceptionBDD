-- En cas d'erreur, changer le délimiteur par |

-- ----------------------------------------------------------

-- Requête 1 : Un événement peut-être annulé, mais il ne peut pas être supprimé de la base de données, et un ticket vendu peut-être remboursé, mais pas supprimé

-- On crée une procédure qu'on appelle au lieu de faire un delete, cette procédure va annuler l'événement
DELIMITER |
CREATE PROCEDURE `delete_event`(IN `id_event` INT)
BEGIN
UPDATE Evenement
SET EtatEvent = "annulé"
WHERE IdEvenement = id_event;
END|
DELIMITER ;

-- On crée une procédure qu'on appelle au lieu de faire un delete, cette procédure va ajouter les paiements pour l'événement dans les remboursements
DELIMITER |
CREATE PROCEDURE `delete_paiement`(IN `id_del` INT)
BEGIN
INSERT INTO Remboursement (IdPaiement, IdEvenement, EtatRemboursement)
SELECT IdPaiement, Spectacle.IdEvenement, "non remboursé"
FROM Spectacle
JOIN Paiement ON Paiement.IdSpectacle = Spectacle.IdSpectacle
JOIN Evenement ON Evenement.IdEvenement = Spectacle.IdEvenement
WHERE Evenement.IdEvenement = id_del;
END|
DELIMITER ;

-- On crée une procédure qui appelle les deux autres
DELIMITER |
CREATE PROCEDURE `delete_event_add_remboursement`(IN `eventid` INT)
BEGIN
SET @id = eventid;
CALL delete_event(@id);
CALL delete_paiement(@id);
END|
DELIMITER ;

-- Requête 2 : Vérifier qu’un événement ou un spectacle ne peut pas être créé si un autre événement ou spectacle utilise déjà une des salles sur le même créneau

-- On vérifie que le nouvel horaire ne chevauche pas une horaire déjà existante

DELIMITER |

CREATE TRIGGER `before_insert_spectacle` BEFORE INSERT ON `Spectacle` 
FOR EACH ROW
BEGIN
IF EXISTS (
    SELECT DateSpectacle, IdSalle, HeureDebut, HeureFin
    FROM Spectacle
    WHERE (DateSpectacle = NEW.DateSpectacle) AND (IdSalle = NEW.IdSalle) AND
    (((NEW.HeureDebut < HeureDebut) AND (NEW.HeureFin < HeureFin)) OR
     ((NEW.HeureDebut > HeureDebut) AND (NEW.HeureFin < HeureFin)) OR
     ((NEW.HeureDebut > HeureDebut) AND (NEW.HeureFin > HeureFin)))
)
THEN
SIGNAL SQLSTATE 'BINST' SET MESSAGE_TEXT = 'Ce spectacle est sur le même créneau qu’un autre pour la même salle';
END IF;
END |
DELIMITER ;

-- Requête 4 : On ne peut pas vendre plus de tickets que disponible pour un événement par rapport aux capacités des salles utilisées

-- On crée un trigger qui envoie un messag d'erreur si le nombre de place disponible pour un événement est égale à 0
DELIMITER |

CREATE TRIGGER `before_insert_reservation` BEFORE INSERT ON `Reservation`
 FOR EACH ROW BEGIN
IF ((
SELECT SUM(Capacite) - SUM(Ticket) AS "capacite"
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
WHERE IdEvenement = event)) = 0)
THEN
SIGNAL SQLSTATE "HY000" SET MESSAGE_TEXT = 'L\'événement est complet'; 
-- ELSE
-- 	SELECT "ITS WORK" AS ' ';
END IF;
END|
DELIMITER ;

-- Requête 5 : Les tickets réservés mais non payés doivent redevenir disponibles 15min avant le début d’un événement

DELIMITER |
CREATE PROCEDURE `devient_disponible`()
BEGIN
IF ((SELECT Spectacle.DateSpectacle FROM Spectacle) >= CURRENT_DATE)
	THEN IF (SELECT SUBTIME(Spectacle.HeureDebut, '00:15:00'), Spectacle.HeureDebut
		FROM Reservation
		JOIN Spectacle ON Reservation.IdSpectacle = Spectacle.IdSpectacle)
	
	     THEN 
	        DELETE FROM Reservation
        	WHERE Reservation.IdReservation IN (SELECT Reservation.IdReservation
        					     FROM  Reservation
        					     WHERE Reservation.IdReservation NOT IN (SELECT Paiement.IdReservation FROM Paiement));
            END IF;
END IF;
END|
DELIMITER ;
