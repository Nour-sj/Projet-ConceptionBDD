--
-- Insertion des données de la table `Artiste`
--

INSERT INTO `Artiste` (`idArtiste`, `Nom`, `Description`) VALUES
(1, 'Parker Lane', 'Eum vero quo sunt. Voluptates suscipit iusto.'),
(2, 'Graham Summit', 'Neque nesciunt voluptatem amet.'),
(3, 'Delores Freeway', 'Est aliquam eum perspiciatis ut.'),
(4, 'Bailey Loaf', 'Duis lacinia sapien a tempus sodales.'),
(5, 'Jared Gardens', 'Nulla et faucibus urna.'),
(6, 'Hilpert Unions', 'Donec ex erat, laoreet imperdiet ligula.'),
(7, 'Alexandrea Highway', 'Ut qui ab in labore rem dolorem ra.'),
(8, 'Drake Garden', 'Sed aliquam ultricies tellus quis tempor.'),
(9, 'Schuster Ford', 'Laborum at nam facere et aliquid.'),
(10, 'Leslie Points', 'Vel quia laborum sunt doloribus quae qui.');

-- --------------------------------------------------------

--
-- Insertion des données de la table `Tarif`
--

INSERT INTO `Tarif` (`NomTarif`, `PrixTarif`) VALUES
('Benevole', 7.5),
('Enfant', 7),
('Réduit', 10.2),
('Senior', 10.5),
('Standard', 15.5);

-- --------------------------------------------------------

--
-- Insertion des données de la table `Salle`
--

INSERT INTO `Salle` (`IdSalle`, `capacite`) VALUES
(1, 300),
(2, 100),
(3, 50);

-- --------------------------------------------------------

--
-- Insertion des données de la table `Personne`
--

INSERT INTO `Personne` (`IdPersonne`, `Responsable`, `Nom`, `Prenom`, `DateNaissance`, `Adresse`, `Telephone`, `Email`, `Job`) VALUES
(1, NULL, 'Kihn', 'Vaughn', '1985-07-17', '18661 Chloe Falls, North Retha', 904425241, 'kihnv@example.net', 'technicien'),
(2, NULL, 'Tremblay', 'Rosa', '1973-01-31', '95528 Bednar Extensions, West Troybury', 588230156, 'tremblayr@example.net', 'bénévole'),
(3, NULL, 'Howell', 'Curtis', '1980-09-06', '80 Marcelle Village Apt. 222, East Forrestlan', 589489418, 'howellc@example.net', 'bénévole'),
(4, 1, 'Hauck', 'Olaf', '2002-02-24', '4247 Shaylee Course, Armstrongshire', 512589485, 'haucko@example.net', 'technicien'),
(5, NULL, 'Rodriguez', 'Maximilian', '1987-07-11', '7445 Avery Bridge, Mertiehaven', 478953578, 'rodriguezm@example.net', 'membre de la présidence'),
(6, NULL, 'Schmidt', 'Gina', '1998-10-07', '28728 Celia Inlet, Lake Thad', 786514238, 'schmidtg@example.net', ' bénévole'),
(7, 1, 'Beahan', 'Kane', '1991-08-20', '92908 Cordelia Branch Suite 687', 851396485, 'beahank@example.net', 'technicien'),
(8, NULL, 'Pagac', 'Freddie', '1980-11-30', '860 Rodriguez Greens, South Oriestad', 854253970, 'pagacf@example.net', 'bénévole'),
(9, 5, 'Bosco', 'Vallie', '1991-03-21', '523 Jayce Shoal, Elodytown', 845279513, 'boscov@example.net', 'administratif'),
(10, NULL, 'Terry', 'Jamison', '1999-08-14', '594 Ruthe Isle, East Orentown', 578651812, 'terryj@example.net', 'bénévole'),
(11, 9, 'Cartwright', 'Andre', '1990-11-24', '64063 Mike Common, East Lilian', 942365187, 'cartwrighta@example.net', 'administratif'),
(12, NULL, 'Gaylord', 'Marisol', '1995-05-07', '0731 Bethany Inlet, South Molly', 254786123, 'gaylordm@example.net', 'bénévole'),
(13, 11, 'Treutel', 'Maximilian', '1994-10-26', '6452 Martina Rue, Manteborough', 152698435, 'treutelm@example.net', 'administratif'),
(14, NULL, 'McClure', 'Alexanne', '1994-08-09', '5167 Adelbert Freeway', 354789651, 'mcclurea@example.net', 'sécurité'),
(15, 5, 'Zieme', 'Ole', '1981-04-16', '9370 Schinner Hills, East Zachariahp', 658423659, 'ziemeo@example.net', 'membre de la présidence');

-- --------------------------------------------------------

--
-- Insertion des données de la table `Evenement`
--

INSERT INTO `Evenement` (`IdEvenement`, `NomEvent`, `TypeEvent`, `DateDebEvent`, `DateFinEvent`, `HeureDebEvent`, `HeureFinEvent`, `EtatEvent`) VALUES
(1, 'Deserunt sit eum ratione esse excepturi.', 'Commun', '2017-03-12', '2017-03-18', '06:45:00', '22:45:00', 'maintenu'),
(2, 'Doloremque ad eum sunt hic.', 'Festival', '1998-02-11', '1998-05-24', '06:33:00', '03:37:45', 'annulé'),
(3, 'Eaque nostrum qui ad blanditiis.', 'Festival', '2006-12-25', '2007-02-25', '06:50:34', '22:30:00', 'maintenu'),
(4, 'Ea autem quis pariatur.', 'Commun', '2013-09-01', '2013-09-22', '23:58:02', '09:55:00', 'annulé'),
(5, 'Ullam harum ut tempore iure quis.', 'Festival', '2013-05-14', '2013-08-16', '03:22:16', '01:27:00', 'maintenu'),
(6, 'Sint aperiam velit alias culpa.', 'Festival', '2019-06-11', '2019-09-25', '05:02:13', '01:16:00', 'maintenu'),
(7, 'Voluptas odio ea et quia aspernatur.', 'Commun', '1992-01-05', '1992-03-30', '19:34:30', '18:07:00', 'maintenu'),
(8, 'Nam suscipit dolor repellat tempora adipisci.', 'Festival', '1987-11-10', '1988-01-04', '04:14:10', '23:59:00', 'annulé'),
(9, 'Autem commodi saepe quam ipsa.', 'Commun', '2002-09-26', '2002-10-14', '01:21:37', '03:42:00', 'maintenu'),
(10, 'Qui voluptatem quaerat.', 'Commun', '1978-11-20', '1979-01-05', '18:10:50', '09:14:00', 'annulé'),
(11, 'Ea illo sunt quia maiores.', 'Festival', '2004-03-18', '2004-08-18', '03:30:01', '14:08:00', 'annulé'),
(12, 'Sint accusamus consectetur.', 'Festival', '1974-01-17', '1974-12-11', '09:57:01', '05:57:00', 'annulé'),
(13, 'Quis omnis laborum illo.', 'Festival', '1980-03-10', '1980-07-09', '14:49:38', '03:42:00', 'maintenu'),
(14, 'Molestiae qui esse molestiae.', 'Commun', '1990-10-01', '1991-02-21', '05:53:32', '06:23:00', 'annulé'),
(15, 'Voluptatibus quod sequi labore.', 'Festival', '2018-09-23', '2018-12-20', '12:19:55', '18:24:00', 'annulé'),
(16, 'Eos beatae qui quasi ratione at.', 'Festival', '2004-01-24', '2004-05-18', '09:01:39', '18:28:00', 'maintenu'),
(17, 'Tenetur dignissimos suscipit in molestiae.', 'Festival', '1987-01-01', '1987-12-18', '07:26:40', '07:53:00', 'maintenu'),
(18, 'Placeat doloremque quisquam non.', 'Commun', '2014-11-08', '2015-03-18', '00:41:22', '05:54:00', 'annulé'),
(19, 'Quaerat et nostrum veniam.', 'Festival', '2003-10-16', '2004-01-01', '11:51:37', '14:58:00', 'maintenu'),
(20, 'Neque enim nostrum dolore.', 'Festival', '1973-11-29', '1974-02-12', '18:32:00', '04:28:00', 'maintenu');

-- --------------------------------------------------------

--
-- Insertion des données de la table `Spectacle`
--

INSERT INTO `Spectacle` (`IdSpectacle`, `IdEvenement`, `IdSalle`, `IdArtiste`, `NomSpectacle`, `DateSpectacle`, `HeureDebut`, `HeureFin`, `TypeSpectacle`) VALUES
(1, 9, 2, 6, 'Voluptates', '2002-09-27', '00:00:02', '03:30:00', 'théatre'),
(2, 4, 1, 8, ' laborum', '2013-09-01', '23:59:05', '04:25:00', 'stand up'),
(3, 13, 2, 6, 'Ullam', '1980-06-07', '15:00:00', '16:38:07', 'cinéma'),
(4, 1, 2, 7, 'ratione', '2017-03-12', '09:00:00', '10:27:00', 'concert'),
(5, 4, 2, 2, 'quasi ', '2013-09-09', '22:10:00', '00:25:00', 'stand up'),
(6, 1, 3, 6, 'Voluptates', '2017-03-18', '18:50:00', '22:44:57', 'concert'),
(7, 2, 1, 7, ' illo', '1998-02-11', '04:35:45', '05:00:00', 'théatre'),
(8, 13, 1, 2, 'hic', '1980-04-11', '04:00:00', '06:15:00', 'cinéma'),
(9, 2, 3, 9, 'Doloremque', '1998-04-22', '03:45:00', '04:10:00', 'stand up'),
(10, 5, 2, 8, ' tempore', '2013-05-14', '03:30:05', '05:00:00', 'cinéma');

-- --------------------------------------------------------

--
-- Insertion des données de la table `InscriptionBenevole`
--

INSERT INTO `InscriptionBenevole` (`IdInscription`, `IdPersonne`, `IdEvenement`) VALUES
(1, 2, 13),
(2, 3, 9),
(3, 3, 4),
(4, 6, 5),
(5, 6, 2),
(6, 6, 4),
(7, 2, 13),
(8, 8, 1),
(9, 3, 4);

-- --------------------------------------------------------

--
-- Insertion des données de la table `Reservation`
--

INSERT INTO `Reservation` (`IdReservation`, `IdSpectacle`, `Compte`, `DateReservation`) VALUES
(1, 9, 'JJJJ', '1998-02-02'),
(2, 8, 'BBBB', '1998-02-05'),
(3, 7, 'QQQQ', '1998-02-04'),
(4, 5, 'WWWW', '2013-08-30'),
(5, 5, 'WWWW', '2013-08-30'),
(6, 6, 'LLLL', '1987-02-12'),
(7, 4, 'SSSS', '1987-03-09'),
(8, 3, 'SANS', '1980-01-01'),
(9, 5, 'WUWU', '2013-08-05'),
(10, 3, 'SANSAN', '1980-01-10'),
(11, 10, 'SHISHI', '2013-04-14'),
(12, 2, 'ERER', '2013-08-22'),
(13, 1, 'YIYI', '2002-08-09'),
(14, 1, 'UNUN', '2002-09-01'),
(15, 1, 'YSHGS', '2002-07-22');

-- --------------------------------------------------------

--
-- Insertion des données de la table `Paiement`
--

INSERT INTO `Paiement` (`IdPaiement`, `IdReservation`, `NomTarif`, `LieuPaiement`, `HeurePaiement`, `DatePaiement`, `IdSpectacle`) VALUES
(1, 1, 'Enfant', 'En ligne', '01:41:41', '1998-02-02', 9),
(2, 2, 'Réduit', 'En ligne', '02:42:56', '1998-02-01', 8),
(3, 3, 'Réduit', 'En ligne', '01:44:05', '1998-02-01', 9),
(4, NULL, 'Standard', 'Sur Place', '23:42:13', '2002-09-06', 1),
(5, NULL, 'Senior', 'Sur place', '02:47:12', '2013-09-01', 2),
(6, NULL, 'Réduit', 'Sur place', '00:48:19', '2013-09-01', 2),
(7, 4, 'Réduit', 'En ligne', '03:36:24', '1998-02-05', 8),
(8, 5, 'Standard', 'En ligne', '09:53:18', '1998-02-05', 8),
(9, 6, 'Standard', 'En ligne ', '15:54:00', '1998-02-04', 7),
(10, NULL, 'Standard', 'Sur place', '15:54:51', '2013-08-30', 5),
(11, 9, 'Standard', 'En ligne', '10:56:13', '2013-08-30', 5),
(12, 10, 'Réduit', 'En ligne', '10:05:35', '1987-02-12', 6),
(13, NULL, 'Standard', 'Sur place', '12:05:35', '1987-03-09', 4),
(14, 12, 'Senior', 'En ligne', '11:07:01', '1980-01-01', 3),
(15, 13, 'Standard', 'En ligne', '04:09:02', '2013-08-05', 5),
(16, 14, 'Standard', 'En ligne', '09:10:31', '1987-02-09', 4),
(17, 15, 'Standard', 'En ligne', '22:10:31', '1980-01-10', 3),
(19, NULL, 'Standard', 'Sur place', '12:19:36', '2013-04-14', 10);

-- --------------------------------------------------------

--
-- Insertion des données de la table `Participation`
--

INSERT INTO `Participation` (`IdParticipation`, `IdInscription`, `Responsable`) VALUES
(1, 2, 1),
(2, 3, 5),
(3, 6, NULL),
(4, 8, 9);

-- --------------------------------------------------------

--
-- Insertion des données de la table `Remboursement`
--

INSERT INTO `Remboursement` (`IdPaiement`, `IdEvenement`, `EtatRemboursement`) VALUES
(1, 2, 'Remboursé'),
(3, 2, 'Remboursé'),
(5, 4, 'Non remboursé'),
(6, 4, 'Non remboursé'),
(9, 2, 'Remboursé'),
(10, 4, 'Remboursé'),
(11, 4, 'Remboursé'),
(15, 4, 'Non remboursé');

-- --------------------------------------------------------

--
-- Insertion des données de la table `Salaire`
--

INSERT INTO `Salaire` (`IdPersonne`, `AnneeSalaire`, `Salaire`) VALUES
(1, 2015, 15600),
(1, 2016, 16200),
(4, 2015, 14400),
(4, 2016, 14400.3),
(7, 2015, 15000),
(7, 2016, 15600.2),
(9, 2015, 21600),
(9, 2016, 22800.2),
(11, 2015, 22200),
(11, 2016, 21600),
(13, 2015, 22800.9),
(13, 2016, 22800.9),
(14, 2015, 16200.6),
(14, 2016, 16800.6);

-- --------------------------------------------------------

--
-- Insertion des données de la table `Specifique`
--

INSERT INTO `Specifique` (`idSpecifique`, `IdPersonne`, `Fonction`, `Responsable`) VALUES
(1, 10, 'Sécurité', 12),
(2, 12, 'Programmation', NULL);

-- --------------------------------------------------------

--
-- Insertion des données de la table `Cachet`
--

INSERT INTO `Cachet` (`IdCachet`, `IdArtiste`, `IdSpectacle`, `DateCachet`, `EtatCachet`, `MontantCachet`) VALUES
(1, 6, 1, '2002-09-28', 'payé', 3000),
(2, 8, 2, '2013-09-01', 'non payé', 2500),
(3, 6, 3, '1980-09-09', 'payé', 2800),
(4, 2, 5, '2013-09-01', 'non payé', 2500),
(5, 6, 6, '2017-03-20', 'payé', 3200),
(6, 7, 7, '1998-02-11', 'non payé', 2500),
(7, 2, 8, '1980-04-11', 'payé', 3500),
(8, 9, 9, '1998-02-11', 'non payé', 2800),
(9, 8, 10, '2013-05-14', 'payé', 3000),
(10, 7, 1, '1987-03-12', 'non payé', 2500);

-- --------------------------------------------------------

