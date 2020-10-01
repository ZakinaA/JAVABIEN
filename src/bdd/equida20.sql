-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 01 oct. 2020 à 11:22
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `equida20`
--

-- --------------------------------------------------------

--
-- Structure de la table `categvente`
--

DROP TABLE IF EXISTS `categvente`;
CREATE TABLE IF NOT EXISTS `categvente` (
  `code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `libelle` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `categvente`
--

INSERT INTO `categvente` (`code`, `libelle`) VALUES
('AUT', 'Vente d\'automne'),
('ELVG', 'Vente d\'élevage'),
('ETE', 'Vente d\'été'),
('PRTN', 'Vente Printanière'),
('XFEV', 'Vente mixte de février');

-- --------------------------------------------------------

--
-- Structure de la table `cheval`
--

DROP TABLE IF EXISTS `cheval`;
CREATE TABLE IF NOT EXISTS `cheval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `sexe` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `prixDepart` int(10) DEFAULT NULL,
  `vendeur` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `proprietaire` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `SIRE` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_typeChev` int(11) NOT NULL,
  `id_mere` int(11) DEFAULT NULL,
  `id_pere` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_typeChev` (`id_typeChev`),
  KEY `id_mere` (`id_mere`),
  KEY `id_pere` (`id_pere`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `prixDepart`, `vendeur`, `proprietaire`, `SIRE`, `id_typeChev`, `id_mere`, `id_pere`) VALUES
(1, 'Aluliu', 'M', 25600, 'Troubado', 'MARIGNI', NULL, 1, NULL, NULL),
(2, 'Matisi', 'F', 12360, 'Machop', 'MACHOP', NULL, 2, NULL, NULL),
(3, 'Arma', 'F', 15300, 'Est-Horse', 'ANTALOUSIE', NULL, 3, 1, 2),
(4, 'Horsi', 'M', 45020, 'Horse-Sud', 'MERGE', NULL, 4, NULL, 1),
(5, 'Malo', 'M', 9500, 'JLH Gilles', 'BOUDANT', NULL, 5, NULL, NULL),
(6, 'Poulana', 'F', 10300, 'Arnaud Mao', 'ARAGNANT', NULL, 6, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `prenom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `rue` varchar(60) CHARACTER SET latin1 NOT NULL,
  `copos` varchar(5) CHARACTER SET latin1 NOT NULL,
  `ville` varchar(40) CHARACTER SET latin1 NOT NULL,
  `mail` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `codePays` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cli_pays` (`codePays`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `rue`, `copos`, `ville`, `mail`, `codePays`) VALUES
(1, 'Deltour', 'Charles', '4 rue du Pont', '14680', 'Bretteville Sur Laize', 'cdeltour@hotmail.com', 'FRA'),
(2, 'Fime', 'Nadia', '5 rue du Montparnasse', '14220', 'Boulon', '', 'ENG'),
(3, 'Ertau', 'Frank', '4 Avenue du président Wilson', '14190', 'Urville', 'frank.ertau@laposte.net', 'FRA'),
(4, 'Maneur', 'David', '6 rue Charles Péguy', '14220', 'Mutrécy', '', 'FRA'),
(5, 'Berezovski', 'Sylvie', '18 rue du Château', '14680', 'Barbery', '', 'FRA'),
(6, 'Finley', 'Pascale', '25 rue de Tolbiac', '14680', 'Caillouet', 'pascfinley@yahoo.fr', 'FRA'),
(7, 'Vofur', 'Hector', '18 rue Deparcieux', '14190', 'Cauvicourt', 'hvofur@free.fr', 'ENG'),
(8, 'Derzou', 'Fred', '230 avenue de la libert', '14220', 'Espins', 'ouzala@aol.com', 'FRA'),
(9, 'Serty', 'Julie', '23 rue du Calvaire', '14220', 'Fresney le Vieux', '', 'FRA'),
(10, 'Vofur', 'Victor', '18 rue Deparcieux', '14680', 'Bretteville Sur Laize', 'victor.vofur@laposte.net', 'FRA'),
(11, 'Calende', 'Hugo', '22 rue des jardins', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(12, 'Jemba', 'Hubert', '10 rue du 8 mai 1945', '14680', 'Bretteville Sur Laize', 'jaimeba@yahoo.fr', 'FRA'),
(13, 'Morin', 'S?verine', '4 rue du bac', '93000', 'Paris', 'morinsev@hotmail.com', 'FRA'),
(14, 'Benrech', 'Tarek', '79 rue de Caen', '14320', 'May Sur Orne', '', 'FRA'),
(15, 'Nguyen', 'Marc', '53 impasse Tourneur', '14320', 'Fontenay Le Marmion', 'nguyen774@wanadoo.fr', 'FRA'),
(16, 'Louali', 'Karima', '89 avenue Poincar', '14320', 'Saint Martin de Fontenay', 'kloua@caramail.fr', 'FRA'),
(17, 'Paolo', 'Marco', '14 rue du Caire', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(18, 'Map', 'Joanna', '120 boulevard Voltaire', '75012', 'Paris', '', 'FRA'),
(19, 'Kound', 'Fatoumata', '4 Place Carr', '14190', 'Urville', '', 'FRA'),
(20, 'Derissam', 'Bachir', '1 rue des Indes', '14190', 'Urville', '', 'FRA'),
(21, 'Villechalane', 'Louis', '8 rue des Charmes', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(22, 'Andre', 'David', '1 rue Petit', '14220', 'Boulon', '', 'FRA'),
(23, 'Bedos', 'Christian', '1 rue Peranud', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(24, 'Tusseau', 'Louis', '22 rue des Ternes', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(25, 'Bentot', 'Pascal', '11 allée des Cerises', '14220', 'Boulon', '', 'FRA'),
(26, 'Bioret', 'Luc', '1 Avenue gambetta', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(27, 'Bunisset', 'Francis', '10 rue des Perles', '14220', 'Espins', '', 'FRA'),
(28, 'Bunisset', 'Denise', '23 rue Manin', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(29, 'Cacheux', 'Bernard', '114 rue Blanche', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(30, 'Cadic', 'Eric', '123 avenue de la République', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(31, 'Charoze', 'Catherine', '100 rue Petit', '14220', 'Boulon', '', 'FRA'),
(32, 'Clepkens', 'Christophe', '12 allée des Anges', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(33, 'Cottin', 'Vincenne', '36 rue Des Roches', '14220', 'Boulon', '', 'FRA'),
(34, 'Daburon', 'François', '13 rue de Chanzy', '14220', 'Mutrécy', '', 'FRA'),
(35, 'De', 'Philippe', '13 rue Barthes', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(36, 'Debelle', 'Michel', '181 avenue Barbusse', '14220', 'Espins', '', 'FRA'),
(37, 'Debelle', 'Jeanne', '134 allée des Joncs', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(38, 'Debroise', 'Michel', '2 Bld Jourdain', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(39, 'Desmarquest', 'Nathalie', '14 Place d Arc', '14220', 'Boulon', '', 'FRA'),
(40, 'Desnost', 'Pierre', '16 avenue des Cèdres', '14220', 'Mutrécy', '', 'FRA'),
(41, 'Dudouit', 'Frédéric', '18 rue de l église', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(42, 'Duncombe', 'Claude', '19 rue de la tour', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(43, 'Enault-Pascreau', 'Céline', '25 place de la gare', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(44, 'Eynde', 'Valérie', '3 Grand Place', '14220', 'Mutrécy', '', 'FRA'),
(45, 'Finck', 'Jacques', '10 avenue du Prado', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(46, 'Frémont', 'Fernande', '4 route de la mer', '14220', 'Espins', '', 'FRA'),
(47, 'Gest', 'Alain', '30 avenue des terres', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(48, 'Testemale', 'tarek', 'du trek', '14000', 'Tarascon', NULL, 'FRA'),
(49, 'Trieste', 'Thierry', 'du tertre', '14000', 'Tologne', NULL, 'FRA'),
(51, 'CHAUVIN', 'Tom', '20 rue de la rue', '14000', 'Caen', NULL, 'FRA'),
(52, 'MARGARETI', 'Jason', '17 rue de la paix', '75000', 'Paris', NULL, 'FRA');

-- --------------------------------------------------------

--
-- Structure de la table `clientcategvente`
--

DROP TABLE IF EXISTS `clientcategvente`;
CREATE TABLE IF NOT EXISTS `clientcategvente` (
  `codeClient` int(11) NOT NULL,
  `codeCategVente` varchar(5) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`codeClient`,`codeCategVente`),
  KEY `FK_cliCat_Categ` (`codeCategVente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `clientcategvente`
--

INSERT INTO `clientcategvente` (`codeClient`, `codeCategVente`) VALUES
(6, 'AUT'),
(49, 'AUT'),
(1, 'ELVG'),
(51, 'ELVG'),
(1, 'ETE'),
(3, 'ETE'),
(6, 'ETE'),
(7, 'ETE'),
(16, 'ETE'),
(49, 'ETE'),
(50, 'ETE'),
(52, 'PRTN'),
(6, 'XFEV');

-- --------------------------------------------------------

--
-- Structure de la table `concerner`
--

DROP TABLE IF EXISTS `concerner`;
CREATE TABLE IF NOT EXISTS `concerner` (
  `id_TypChev` int(11) NOT NULL,
  `id_vente` int(11) NOT NULL,
  PRIMARY KEY (`id_TypChev`,`id_vente`),
  KEY `id_vente` (`id_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `concerner`
--

INSERT INTO `concerner` (`id_TypChev`, `id_vente`) VALUES
(2, 30917),
(3, 30917),
(4, 210717),
(6, 210817),
(3, 250217);

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
CREATE TABLE IF NOT EXISTS `contenir` (
  `id_pj` int(11) NOT NULL,
  `id_mail` int(11) NOT NULL,
  PRIMARY KEY (`id_pj`,`id_mail`),
  KEY `id_pj` (`id_pj`),
  KEY `id_mail` (`id_mail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `contenir`
--

INSERT INTO `contenir` (`id_pj`, `id_mail`) VALUES
(1, 1),
(1, 2),
(3, 2),
(3, 5),
(4, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `nbBoxes` int(3) DEFAULT NULL,
  `commentaire` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville`, `nbBoxes`, `commentaire`) VALUES
(1, 'Caen', 9, 'Lieu atypique, pouvant accueillir plus de 1000 personnes, l\'intégralité du lieu est accessible aux personnes handicapés.');

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prixDepart` int(20) DEFAULT NULL,
  `idCheval` int(11) DEFAULT NULL,
  `idVente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idVente` (`idVente`),
  KEY `idCheval` (`idCheval`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`id`, `prixDepart`, `idCheval`, `idVente`) VALUES
(1, 25600, 1, 210817),
(2, 12360, 2, 210717),
(3, 15000, 3, 210717),
(4, 40000, 4, 210717),
(5, 6000, 5, 30917),
(6, 9000, 6, 210717),
(7, 13000, 3, 90217),
(8, 6500, 6, 250217);

-- --------------------------------------------------------

--
-- Structure de la table `mail`
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_mail` date DEFAULT NULL,
  `objet` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `corps` text COLLATE utf8mb4_bin,
  `id_vente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_vente` (`id_vente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `mail`
--

INSERT INTO `mail` (`id`, `date_mail`, `objet`, `corps`, `id_vente`) VALUES
(1, '2020-09-02', 'Réunion d\'information', 'Bonjour, je vous préviens de la prochaine réunion de vente prévue pour la prochaine saison de vente. Je vous remercie de votre intérêt. Cordialement;', 90217),
(2, '2020-09-08', 'Sécurisation accès ', 'Monsieur, \r\n\r\nPouvez-vous prévenir le service de sécurité, de la mise en situation d\'exercice incendie avant ce samedi s.v.p\r\n\r\nMerci', 210717),
(3, '2020-09-05', 'Demande d\'informations', 'Bonjour, \r\n\r\nJe voudrais des informations sur le centre équestre le plus proche svp', 210817),
(4, '2020-08-12', 'Restauration sur place', 'Je veux savoir si il y a un service de restauration sur le lieu de la vente merci', 30917),
(5, '2020-07-15', 'Demande de vente', 'Bonjour, pouvez vous me dire si vous avez des pur sang en vente svp', 30917);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `code` varchar(3) CHARACTER SET latin1 NOT NULL,
  `nom` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`code`, `nom`) VALUES
('ENG', 'Angleterre'),
('FRA', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `piecesjointes`
--

DROP TABLE IF EXISTS `piecesjointes`;
CREATE TABLE IF NOT EXISTS `piecesjointes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cheminAcces` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `piecesjointes`
--

INSERT INTO `piecesjointes` (`id`, `cheminAcces`) VALUES
(1, 'https://imgstock/485851.png'),
(2, 'https://imgstock/54564564.png'),
(3, 'https://imgstock/451200.png'),
(4, 'https://imgstock/984255.png'),
(5, 'https://imgstock/99941.png');

-- --------------------------------------------------------

--
-- Structure de la table `typecheval`
--

DROP TABLE IF EXISTS `typecheval`;
CREATE TABLE IF NOT EXISTS `typecheval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `typecheval`
--

INSERT INTO `typecheval` (`id`, `libelle`, `description`) VALUES
(1, 'Pur sang', 'Le Pur-sang, est la plus connue des races de chevaux à sang chaud. C\'est l\'une des races les plus répandues, puisqu\'il court sur les pistes d\'hippodromes lors des courses de galop. '),
(2, 'Frison', 'Le Frison est une race de chevaux de selle et de trait originaire de la Frise, province des Pays-Bas dont il tire son nom. Il porte toujours une robe noire, d\'où son surnom, « la perle noire ».'),
(3, 'Arabe', 'L\'Arabe est une race de chevaux de selle originaire du Moyen-Orient, caractérisée par sa tête au profil concave et son port de queue relevé.'),
(4, 'Shire', 'Le Shire est une race de chevaux de trait britannique originaire du centre de l\'Angleterre. Il est surnommé « gentil géant » grâce à sa docilité et à sa grande taille. Le Shire détient le record du plus grand cheval au monde.'),
(5, 'Morgan', 'Le Morgan est une race de chevaux de selle originaire des États-Unis qui a la particularité d\'être issue d\'un seul étalon, Figure, propriété de l\'éleveur Justin Morgan, à qui elle doit son nom.'),
(6, 'Islandais', 'L\'islandais est un cheval de selle de petite taille qui forme l\'unique race chevaline originaire d\'Islande. Ces animaux sont vraisemblablement les descendants directs des montures amenées en bateau par les Vikings lors de la colonisation de l\'Islande.');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `dateDebut` date NOT NULL,
  `codeCategVente` varchar(5) CHARACTER SET latin1 NOT NULL,
  `id_lieu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codeCategVente` (`codeCategVente`),
  KEY `index_lieu` (`id_lieu`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `nom`, `dateDebut`, `codeCategVente`, `id_lieu`) VALUES
(30917, 'Garibaldi Princess', '2017-03-09', 'ELVG', 1),
(90217, 'Mixing brain', '2017-09-02', 'XFEV', 1),
(210717, 'Rapsberry Sailing', '2017-07-17', 'ETE', 1),
(210817, 'Jelly Bay', '2017-08-17', 'ETE', 1),
(250217, 'Djezair Star', '2017-02-25', 'XFEV', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD CONSTRAINT `cheval_ibfk_1` FOREIGN KEY (`id_typeChev`) REFERENCES `typecheval` (`id`),
  ADD CONSTRAINT `cheval_ibfk_2` FOREIGN KEY (`id_mere`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `cheval_ibfk_3` FOREIGN KEY (`id_pere`) REFERENCES `cheval` (`id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_cli_pays` FOREIGN KEY (`codePays`) REFERENCES `pays` (`code`);

--
-- Contraintes pour la table `clientcategvente`
--
ALTER TABLE `clientcategvente`
  ADD CONSTRAINT `FK_cliCat_Categ` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`),
  ADD CONSTRAINT `FK_cliCat_client` FOREIGN KEY (`codeClient`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD CONSTRAINT `concerner_ibfk_1` FOREIGN KEY (`id_TypChev`) REFERENCES `typecheval` (`id`),
  ADD CONSTRAINT `concerner_ibfk_2` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id`),
  ADD CONSTRAINT `concerner_ibfk_3` FOREIGN KEY (`id_TypChev`) REFERENCES `typecheval` (`id`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`id_mail`) REFERENCES `mail` (`id`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`id_pj`) REFERENCES `piecesjointes` (`id`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`idVente`) REFERENCES `vente` (`id`),
  ADD CONSTRAINT `lot_ibfk_2` FOREIGN KEY (`idCheval`) REFERENCES `cheval` (`id`);

--
-- Contraintes pour la table `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `FK_VENLIE` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`),
  ADD CONSTRAINT `FK_Ven_Categ` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
