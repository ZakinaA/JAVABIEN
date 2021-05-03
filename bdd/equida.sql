-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 03 mai 2021 à 17:48
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `equida`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
CREATE TABLE IF NOT EXISTS `appartenir` (
  `id_client` int(11) NOT NULL,
  `id_cheval` int(11) NOT NULL,
  PRIMARY KEY (`id_client`,`id_cheval`),
  KEY `id_cheval` (`id_cheval`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `appartenir`
--

INSERT INTO `appartenir` (`id_client`, `id_cheval`) VALUES
(1, 5),
(2, 5),
(4, 6),
(5, 1),
(7, 5),
(23, 3),
(35, 4),
(43, 2),
(49, 6);

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
('HAL', 'Vente d\'Halloween'),
('LUX', 'Vente de luxe'),
('PRTN', 'Vente Printanière'),
('TESTO', 'Testa'),
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
  `chemin_image` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `SIRE` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `id_typeChev` int(11) NOT NULL,
  `id_mere` int(11) DEFAULT NULL,
  `id_pere` int(11) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id_typeChev` (`id_typeChev`),
  KEY `id_mere` (`id_mere`),
  KEY `id_pere` (`id_pere`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `prixDepart`, `chemin_image`, `SIRE`, `id_typeChev`, `id_mere`, `id_pere`, `archive`) VALUES
(1, 'Aluliu', 'M', 25600, '../vues/image/Aluliu.jpg', '7854120', 1, NULL, NULL, 0),
(2, 'Matisi', 'F', 12360, '../vues/image/Matisi.jpg', '7854128', 2, NULL, NULL, 0),
(3, 'Arma', 'F', 15300, '../vues/image/Arma.jpg', '7854147', 3, 1, 2, 0),
(4, 'Horsi', 'M', 45020, '../vues/image/Horsi.jpg', '9854120', 4, NULL, 1, 0),
(5, 'Malo', 'M', 9500, '../vues/image/Malo.jpg', '7856120', 5, NULL, NULL, 0),
(6, 'Poulana', 'F', 10300, '../vues/image/Poulana.jpg', '7854874', 6, 2, NULL, 0),
(8, 'Tom', 'F', 5200, NULL, '4584', 10, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_uti` int(11) DEFAULT NULL,
  `nom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `prenom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `rue` varchar(60) CHARACTER SET latin1 NOT NULL,
  `copos` varchar(5) CHARACTER SET latin1 NOT NULL,
  `ville` varchar(40) CHARACTER SET latin1 NOT NULL,
  `mail` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `codePays` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cli_pays` (`codePays`),
  KEY `id_uti` (`id_uti`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `id_uti`, `nom`, `prenom`, `rue`, `copos`, `ville`, `mail`, `codePays`) VALUES
(1, NULL, 'Deltour', 'Charles', '4 rue du Pont', '14680', 'Bretteville Sur Laize', 'cdeltour@hotmail.com', 'FRA'),
(2, NULL, 'Fime', 'Nadia', '5 rue du Montparnasse', '14220', 'Boulon', '', 'ENG'),
(3, NULL, 'Ertau', 'Frank', '4 Avenue du président Wilson', '14190', 'Urville', 'frank.ertau@laposte.net', 'FRA'),
(4, NULL, 'Maneur', 'David', '6 rue Charles Péguy', '14220', 'Mutrécy', '', 'FRA'),
(5, NULL, 'Berezovski', 'Sylvie', '18 rue du Château', '14680', 'Barbery', '', 'FRA'),
(6, NULL, 'Finley', 'Pascale', '25 rue de Tolbiac', '14680', 'Caillouet', 'pascfinley@yahoo.fr', 'FRA'),
(7, NULL, 'Vofur', 'Hector', '18 rue Deparcieux', '14190', 'Cauvicourt', 'hvofur@free.fr', 'ENG'),
(8, NULL, 'Derzou', 'Fred', '230 avenue de la libert', '14220', 'Espins', 'ouzala@aol.com', 'FRA'),
(9, NULL, 'Serty', 'Julie', '23 rue du Calvaire', '14220', 'Fresney le Vieux', '', 'FRA'),
(10, NULL, 'Vofur', 'Victor', '18 rue Deparcieux', '14680', 'Bretteville Sur Laize', 'victor.vofur@laposte.net', 'FRA'),
(11, NULL, 'Calende', 'Hugo', '22 rue des jardins', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(12, NULL, 'Jemba', 'Hubert', '10 rue du 8 mai 1945', '14680', 'Bretteville Sur Laize', 'jaimeba@yahoo.fr', 'FRA'),
(13, NULL, 'Morin', 'S?verine', '4 rue du bac', '93000', 'Paris', 'morinsev@hotmail.com', 'FRA'),
(14, NULL, 'Benrech', 'Tarek', '79 rue de Caen', '14320', 'May Sur Orne', '', 'FRA'),
(15, NULL, 'Nguyen', 'Marc', '53 impasse Tourneur', '14320', 'Fontenay Le Marmion', 'nguyen774@wanadoo.fr', 'FRA'),
(16, NULL, 'Louali', 'Karima', '89 avenue Poincar', '14320', 'Saint Martin de Fontenay', 'kloua@caramail.fr', 'FRA'),
(17, NULL, 'Paolo', 'Marco', '14 rue du Caire', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(18, NULL, 'Map', 'Joanna', '120 boulevard Voltaire', '75012', 'Paris', '', 'FRA'),
(19, NULL, 'Kound', 'Fatoumata', '4 Place Carr', '14190', 'Urville', '', 'FRA'),
(20, NULL, 'Derissam', 'Bachir', '1 rue des Indes', '14190', 'Urville', '', 'FRA'),
(21, NULL, 'Villechalane', 'Louis', '8 rue des Charmes', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(22, NULL, 'Andre', 'David', '1 rue Petit', '14220', 'Boulon', '', 'FRA'),
(23, NULL, 'Bedos', 'Christian', '1 rue Peranud', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(24, NULL, 'Tusseau', 'Louis', '22 rue des Ternes', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(25, NULL, 'Bentot', 'Pascal', '11 allée des Cerises', '14220', 'Boulon', '', 'FRA'),
(26, NULL, 'Bioret', 'Luc', '1 Avenue gambetta', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(27, NULL, 'Bunisset', 'Francis', '10 rue des Perles', '14220', 'Espins', '', 'FRA'),
(28, NULL, 'Bunisset', 'Denise', '23 rue Manin', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(29, NULL, 'Cacheux', 'Bernard', '114 rue Blanche', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(30, NULL, 'Cadic', 'Eric', '123 avenue de la République', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(31, NULL, 'Charoze', 'Catherine', '100 rue Petit', '14220', 'Boulon', '', 'FRA'),
(32, NULL, 'Clepkens', 'Christophe', '12 allée des Anges', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(33, NULL, 'Cottin', 'Vincenne', '36 rue Des Roches', '14220', 'Boulon', '', 'FRA'),
(34, NULL, 'Daburon', 'François', '13 rue de Chanzy', '14220', 'Mutrécy', '', 'FRA'),
(35, NULL, 'De', 'Philippe', '13 rue Barthes', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(36, NULL, 'Debelle', 'Michel', '181 avenue Barbusse', '14220', 'Espins', '', 'FRA'),
(37, NULL, 'Debelle', 'Jeanne', '134 allée des Joncs', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(38, NULL, 'Debroise', 'Michel', '2 Bld Jourdain', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(39, NULL, 'Desmarquest', 'Nathalie', '14 Place d Arc', '14220', 'Boulon', '', 'FRA'),
(40, NULL, 'Desnost', 'Pierre', '16 avenue des Cèdres', '14220', 'Mutrécy', '', 'FRA'),
(41, NULL, 'Dudouit', 'Frédéric', '18 rue de l église', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(42, NULL, 'Duncombe', 'Claude', '19 rue de la tour', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(43, NULL, 'Enault-Pascreau', 'Céline', '25 place de la gare', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(44, NULL, 'Eynde', 'Valérie', '3 Grand Place', '14220', 'Mutrécy', '', 'FRA'),
(45, NULL, 'Finck', 'Jacques', '10 avenue du Prado', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(46, NULL, 'Frémont', 'Fernande', '4 route de la mer', '14220', 'Espins', '', 'FRA'),
(47, NULL, 'Gest', 'Alain', '30 avenue des terres', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(48, NULL, 'Testemale', 'tarek', '27 avenue de la Concorde', '68540', 'Tarascon', '', 'FRA'),
(49, NULL, 'Trieste', 'Thierry', '128 bis rue Marcel Paul', '32000', 'Tologne', '', 'FRA'),
(50, NULL, 'Noel', 'clara', '29 Rue caponiere', '14430', 'Danestal', '', 'FRA'),
(51, NULL, 'Tristan', 'Leo', '17 rue de la Crié', '14160', 'Dives sur mer', '', 'FRA'),
(52, NULL, 'Albert', 'Michel', '2 rue de la paix', '14160', 'Dives sur mer', '', 'FRA'),
(53, NULL, 'Zani', 'Fanny', '1258 Avenue des Champs Elysée', '14000', 'Caen', '', 'FRA'),
(54, NULL, 'Oh', 'Juliette', '25 rue Charlemagne', '14000', 'Caen', '', 'FRA'),
(55, NULL, 'Carama', 'Gouma', '20 rue Zellige', '69320', 'Fagnon sur Rhône', '', 'FRA'),
(56, NULL, 'Hervé', 'Jean', 'Un test je t\'ai dit', '45200', 'Hagnan', '', 'FRA'),
(57, NULL, 'Trouma', 'Noëlla', '1 rue Charles de Gaulles', '03548', 'Juanita', '', 'FRA'),
(58, NULL, 'Stepinard', 'Noémie', 'Place de la Résistance', '65230', 'Victor en puit', '', 'FRA'),
(59, NULL, 'Zokano', 'Victor', '55 ter rue Docteur Eniault', '78540', 'Marie sur Yveline', '', 'FRA'),
(60, NULL, 'Sini', 'Théo', '12 rue Simone Veil', '75000', 'Paris', '', 'FRA'),
(61, NULL, 'Dupont', 'Yanis', '99 avenue du Rock', '95602', 'Juno', '', 'FRA'),
(62, NULL, 'Gabriel', 'Kristophe', '74 Avenue Freddy Mercury', '14560', 'Villers-Bocage', '', 'FRA'),
(63, NULL, 'Tronchant', 'Hector', '9 chemin de l\'Eglise', '14470', 'Courseulles-sur-mer', '', 'FRA'),
(64, NULL, 'Hache', 'Valérie', '3 rue du centre-ville', '61850', 'Attena sur Vire', '', 'FRA'),
(65, NULL, 'Epicier', 'Nadége', '107 Grande Avenue', '50000', 'Saint-Lô', '', 'FRA'),
(66, NULL, 'De Monaco', 'Abdel', '14 rue Guillaume Le Conquérant', '29600', 'Magnant', '', 'FRA');

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
(3, 'XFEV'),
(4, 'XFEV'),
(10, 'ELVG'),
(11, 'ETE'),
(19, 'PRTN'),
(30, 'AUT'),
(41, 'ELVG'),
(50, 'ETE'),
(51, 'ELVG'),
(51, 'ETE'),
(52, 'ELVG'),
(52, 'ETE'),
(53, 'ELVG'),
(53, 'ETE'),
(54, 'ELVG'),
(54, 'ETE'),
(55, 'ELVG'),
(55, 'ETE'),
(56, 'ELVG'),
(56, 'ETE'),
(57, 'ELVG'),
(57, 'ETE'),
(58, 'ELVG'),
(58, 'ETE'),
(59, 'ELVG'),
(59, 'ETE'),
(60, 'ELVG'),
(60, 'ETE'),
(61, 'ELVG'),
(61, 'ETE'),
(62, 'ELVG'),
(62, 'ETE'),
(63, 'ELVG'),
(63, 'ETE'),
(64, 'ELVG'),
(64, 'ETE'),
(65, 'ELVG'),
(65, 'ETE'),
(66, 'ELVG'),
(66, 'ETE');

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
(3, 250217),
(4, 210717),
(4, 250217),
(6, 210817);

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
-- Structure de la table `enchere`
--

DROP TABLE IF EXISTS `enchere`;
CREATE TABLE IF NOT EXISTS `enchere` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `montant` float(15,2) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_lot` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `id_client` (`id_client`),
  KEY `id_lot` (`id_lot`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `enchere`
--

INSERT INTO `enchere` (`numero`, `montant`, `id_client`, `id_lot`) VALUES
(1, 15200.00, 3, 5),
(2, 16300.00, 41, 8),
(3, 13600.00, 46, 8),
(4, 9950.00, 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `nbBoxes` int(3) DEFAULT NULL,
  `commentaire` text COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville`, `nbBoxes`, `commentaire`) VALUES
(1, 'Caen', 9, 'Lieu atypique, pouvant accueillir plus de 1000 personnes, l\'intégralité du lieu est accessible aux personnes handicapés.'),
(2, 'Falaise', 28, 'L\'un des plus grands haras du Calvados, à rayonnement national, familiale et conviviale. '),
(3, 'Saint-Martin-de-Fontenay', 21, 'Magnifique lieu pour nos chevaux.'),
(4, 'Le Pin-au-Haras', 2, 'Petit mais soigné, idéal pour des chevaux de compétition.');

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
(6, 9000, 6, 30917),
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
  `corps` text COLLATE utf8mb4_bin DEFAULT NULL,
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
('ABW', 'Aruba'),
('AFG', 'Afghanistan'),
('AGO', 'Angola'),
('AIA', 'Anguilla'),
('ALA', 'Îles Åland'),
('ALB', 'Albanie'),
('AND', 'Andorre'),
('ANT', 'Antilles Néerlandaises'),
('ARE', 'Émirats Arabes Unis'),
('ARG', 'Argentine'),
('ARM', 'Arménie'),
('ASM', 'Samoa Américaines'),
('ATA', 'Antarctique'),
('ATF', 'Terres Australes Françaises'),
('ATG', 'Antigua-et-Barbuda'),
('AUS', 'Australie'),
('AUT', 'Autriche'),
('AZE', 'Azerbaïdjan'),
('BDI', 'Burundi'),
('BEL', 'Belgique'),
('BEN', 'Bénin'),
('BFA', 'Burkina Faso'),
('BGD', 'Bangladesh'),
('BGR', 'Bulgarie'),
('BHR', 'Bahreïn'),
('BHS', 'Bahamas'),
('BIH', 'Bosnie-Herzégovine'),
('BLR', 'Bélarus'),
('BLZ', 'Belize'),
('BMU', 'Bermudes'),
('BOL', 'Bolivie'),
('BRA', 'Brésil'),
('BRB', 'Barbade'),
('BRN', 'Brunéi Darussalam'),
('BTN', 'Bhoutan'),
('BVT', 'Île Bouvet'),
('BWA', 'Botswana'),
('CAF', 'République Centrafricaine'),
('CAN', 'Canada'),
('CCK', 'Îles Cocos (Keeling)'),
('CHE', 'Suisse'),
('CHL', 'Chili'),
('CHN', 'Chine'),
('CIV', 'Côte d\'Ivoire'),
('CMR', 'Cameroun'),
('COD', 'République Démocratique du Con'),
('COG', 'République du Congo'),
('COK', 'Îles Cook'),
('COL', 'Colombie'),
('COM', 'Comores'),
('CPV', 'Cap-vert'),
('CRI', 'Costa Rica'),
('CUB', 'Cuba'),
('CXR', 'Île Christmas'),
('CYM', 'Îles Caïmanes'),
('CYP', 'Chypre'),
('CZE', 'République Tchèque'),
('DEU', 'Allemagne'),
('DJI', 'Djibouti'),
('DMA', 'Dominique'),
('DNK', 'Danemark'),
('DOM', 'République Dominicaine'),
('DZA', 'Algérie'),
('ECU', 'Équateur'),
('EGY', 'Égypte'),
('ENG', 'Angleterre'),
('ERI', 'Érythrée'),
('ESH', 'Sahara Occidental'),
('ESP', 'Espagne'),
('EST', 'Estonie'),
('ETH', 'Éthiopie'),
('FIN', 'Finlande'),
('FJI', 'Fidji'),
('FLK', 'Îles (malvinas) Falkland'),
('FRA', 'France'),
('FRO', 'Îles Féroé'),
('FSM', 'États Fédérés de Micronésie'),
('GAB', 'Gabon'),
('GBR', 'Royaume-Uni'),
('GEO', 'Géorgie'),
('GHA', 'Ghana'),
('GIB', 'Gibraltar'),
('GIN', 'Guinée'),
('GLP', 'Guadeloupe'),
('GMB', 'Gambie'),
('GNB', 'Guinée-Bissau'),
('GNQ', 'Guinée Équatoriale'),
('GRC', 'Grèce'),
('GRD', 'Grenade'),
('GRL', 'Groenland'),
('GTM', 'Guatemala'),
('GUF', 'Guyane Française'),
('GUM', 'Guam'),
('GUY', 'Guyana'),
('HKG', 'Hong-Kong'),
('HMD', 'Îles Heard et Mcdonald'),
('HND', 'Honduras'),
('HRV', 'Croatie'),
('HTI', 'Haïti'),
('HUN', 'Hongrie'),
('IDN', 'Indonésie'),
('IMN', 'Île de Man'),
('IND', 'Inde'),
('IOT', 'Territoire Britannique de l\'Oc'),
('IRL', 'Irlande'),
('IRN', 'République Islamique d\'Iran'),
('IRQ', 'Iraq'),
('ISL', 'Islande'),
('ISR', 'Israël'),
('ITA', 'Italie'),
('JAM', 'Jamaïque'),
('JOR', 'Jordanie'),
('JPN', 'Japon'),
('KAZ', 'Kazakhstan'),
('KEN', 'Kenya'),
('KGZ', 'Kirghizistan'),
('KHM', 'Cambodge'),
('KIR', 'Kiribati'),
('KNA', 'Saint-Kitts-et-Nevis'),
('KOR', 'République de Corée'),
('KWT', 'Koweït'),
('LAO', 'République Démocratique Popula'),
('LBN', 'Liban'),
('LBR', 'Libéria'),
('LBY', 'Jamahiriya Arabe Libyenne'),
('LCA', 'Sainte-Lucie'),
('LIE', 'Liechtenstein'),
('LKA', 'Sri Lanka'),
('LSO', 'Lesotho'),
('LTU', 'Lituanie'),
('LUX', 'Luxembourg'),
('LVA', 'Lettonie'),
('MAC', 'Macao'),
('MAR', 'Maroc'),
('MCO', 'Monaco'),
('MDA', 'République de Moldova'),
('MDG', 'Madagascar'),
('MDV', 'Maldives'),
('MEX', 'Mexique'),
('MHL', 'Îles Marshall'),
('MKD', 'L\'ex-République Yougoslave de '),
('MLI', 'Mali'),
('MLT', 'Malte'),
('MMR', 'Myanmar'),
('MNG', 'Mongolie'),
('MNP', 'Îles Mariannes du Nord'),
('MOZ', 'Mozambique'),
('MRT', 'Mauritanie'),
('MSR', 'Montserrat'),
('MTQ', 'Martinique'),
('MUS', 'Maurice'),
('MWI', 'Malawi'),
('MYS', 'Malaisie'),
('MYT', 'Mayotte'),
('NAM', 'Namibie'),
('NCL', 'Nouvelle-Calédonie'),
('NER', 'Niger'),
('NFK', 'Île Norfolk'),
('NGA', 'Nigéria'),
('NIC', 'Nicaragua'),
('NIU', 'Niué'),
('NLD', 'Pays-Bas'),
('NOR', 'Norvège'),
('NPL', 'Népal'),
('NRU', 'Nauru'),
('NZL', 'Nouvelle-Zélande'),
('OMN', 'Oman'),
('PAK', 'Pakistan'),
('PAN', 'Panama'),
('PCN', 'Pitcairn'),
('PER', 'Pérou'),
('PHL', 'Philippines'),
('PLW', 'Palaos'),
('PNG', 'Papouasie-Nouvelle-Guinée'),
('POL', 'Pologne'),
('PRI', 'Porto Rico'),
('PRK', 'République Populaire Démocrati'),
('PRT', 'Portugal'),
('PRY', 'Paraguay'),
('PSE', 'Territoire Palestinien Occupé'),
('PYF', 'Polynésie Française'),
('QAT', 'Qatar'),
('REU', 'Réunion'),
('ROU', 'Roumanie'),
('RUS', 'Fédération de Russie'),
('RWA', 'Rwanda'),
('SAU', 'Arabie Saoudite'),
('SCG', 'Serbie-et-Monténégro'),
('SDN', 'Soudan'),
('SEN', 'Sénégal'),
('SGP', 'Singapour'),
('SGS', 'Géorgie du Sud et les Îles San'),
('SHN', 'Sainte-Hélène'),
('SJM', 'Svalbard etÎle Jan Mayen'),
('SLB', 'Îles Salomon'),
('SLE', 'Sierra Leone'),
('SLV', 'El Salvador'),
('SMR', 'Saint-Marin'),
('SOM', 'Somalie'),
('SPM', 'Saint-Pierre-et-Miquelon'),
('STP', 'Sao Tomé-et-Principe'),
('SUR', 'Suriname'),
('SVK', 'Slovaquie'),
('SVN', 'Slovénie'),
('SWE', 'Suède'),
('SWZ', 'Swaziland'),
('SYC', 'Seychelles'),
('SYR', 'République Arabe Syrienne'),
('TCA', 'Îles Turks et Caïques'),
('TCD', 'Tchad'),
('TGO', 'Togo'),
('THA', 'Thaïlande'),
('TJK', 'Tadjikistan'),
('TKL', 'Tokelau'),
('TKM', 'Turkménistan'),
('TLS', 'Timor-Leste'),
('TON', 'Tonga'),
('TTO', 'Trinité-et-Tobago'),
('TUN', 'Tunisie'),
('TUR', 'Turquie'),
('TUV', 'Tuvalu'),
('TWN', 'Taïwan'),
('TZA', 'République-Unie de Tanzanie'),
('UGA', 'Ouganda'),
('UKR', 'Ukraine'),
('UMI', 'Îles Mineures Éloignées des Ét'),
('URY', 'Uruguay'),
('USA', 'États-Unis'),
('UZB', 'Ouzbékistan'),
('VAT', 'Saint-Siège (état de la Cité d'),
('VCT', 'Saint-Vincent-et-les Grenadine'),
('VEN', 'Venezuela'),
('VGB', 'Îles Vierges Britanniques'),
('VIR', 'Îles Vierges des États-Unis'),
('VNM', 'Viet Nam'),
('VUT', 'Vanuatu'),
('WLF', 'Wallis et Futuna'),
('WSM', 'Samoa'),
('YEM', 'Yémen'),
('ZAF', 'Afrique du Sud'),
('ZMB', 'Zambie'),
('ZWE', 'Zimbabwe');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `typecheval`
--

INSERT INTO `typecheval` (`id`, `libelle`, `description`) VALUES
(1, 'Pur sang', 'Le Pur-sang, est la plus connue des races de chevaux à sang chaud. C\'est l\'une des races les plus répandues, puisqu\'il court sur les pistes d\'hippodromes lors des courses de galop. '),
(2, 'Frison', 'Le Frison est une race de chevaux de selle et de trait originaire de la Frise, province des Pays-Bas dont il tire son nom. Il porte toujours une robe noire, d\'où son surnom, « la perle noire ».'),
(3, 'Arabe', 'L\'Arabe est une race de chevaux de selle originaire du Moyen-Orient, caractérisée par sa tête au profil concave et son port de queue relevé.'),
(4, 'Shire', 'Le Shire est une race de chevaux de trait britannique originaire du centre de l\'Angleterre. Il est surnommé « gentil géant » grâce à sa docilité et à sa grande taille. Le Shire détient le record du plus grand cheval au monde.'),
(5, 'Morgan', 'Le Morgan est une race de chevaux de selle originaire des États-Unis qui a la particularité d\'être issue d\'un seul étalon, Figure, propriété de l\'éleveur Justin Morgan, à qui elle doit son nom.'),
(6, 'Islandais', 'L\'islandais est un cheval de selle de petite taille qui forme l\'unique race chevaline originaire d\'Islande. Ces animaux sont vraisemblablement les descendants directs des montures amenées en bateau par les Vikings lors de la colonisation de l\'Islande.'),
(7, 'Trait belge', 'Le Trait belge, parfois encore nommé Brabant ou Brabançon, est une race de chevaux de trait originaire de Belgique.'),
(8, 'Lipizzan', 'Le lipizzan est une race de chevaux originaire de Slovénie, culturellement liée à l\'École espagnole de Vienne en Autriche.'),
(9, 'Dartmoor', 'Le Dartmoor est l\'une des neuf principales races de poneys britanniques.'),
(10, 'Finlandais', 'Le finlandais ou cheval finnois est une race chevaline à la fois de selle et de trait.');

-- --------------------------------------------------------

--
-- Structure de la table `type_utilisateur`
--

DROP TABLE IF EXISTS `type_utilisateur`;
CREATE TABLE IF NOT EXISTS `type_utilisateur` (
  `code` varchar(3) NOT NULL,
  `libelle` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `type_uti` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_uti` (`type_uti`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `dateDebut` date NOT NULL,
  `codeCategVente` varchar(5) CHARACTER SET latin1 NOT NULL,
  `id_lieu` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codeCategVente` (`codeCategVente`),
  KEY `index_lieu` (`id_lieu`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=250297 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `nom`, `dateDebut`, `codeCategVente`, `id_lieu`) VALUES
(30917, 'Garibaldi Princess', '2017-03-09', 'ELVG', 2),
(90217, 'Mixing brain', '2017-09-02', 'XFEV', 1),
(210717, 'Rapsberry Sailing', '2017-07-17', 'ETE', 3),
(210817, 'Jelly Bay', '2017-08-17', 'ETE', 1),
(250217, 'Djezair Star', '2017-02-25', 'XFEV', 4),
(250295, 'Juno\'chere', '2021-03-28', 'PRTN', 4),
(250296, 'Testato', '2000-05-24', 'LUX', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `appartenir_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `appartenir_ibfk_2` FOREIGN KEY (`id_cheval`) REFERENCES `cheval` (`id`);

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
  ADD CONSTRAINT `FK_cli_pays` FOREIGN KEY (`codePays`) REFERENCES `pays` (`code`),
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`codePays`) REFERENCES `pays` (`code`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`codePays`) REFERENCES `pays` (`code`),
  ADD CONSTRAINT `client_ibfk_3` FOREIGN KEY (`id_uti`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `clientcategvente`
--
ALTER TABLE `clientcategvente`
  ADD CONSTRAINT `clientcategvente_ibfk_1` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`),
  ADD CONSTRAINT `clientcategvente_ibfk_2` FOREIGN KEY (`codeClient`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD CONSTRAINT `concerner_ibfk_1` FOREIGN KEY (`id_TypChev`) REFERENCES `typecheval` (`id`),
  ADD CONSTRAINT `concerner_ibfk_2` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`id_pj`) REFERENCES `piecesjointes` (`id`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`id_mail`) REFERENCES `mail` (`id`);

--
-- Contraintes pour la table `enchere`
--
ALTER TABLE `enchere`
  ADD CONSTRAINT `enchere_ibfk_1` FOREIGN KEY (`id_lot`) REFERENCES `lot` (`id`),
  ADD CONSTRAINT `enchere_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`idCheval`) REFERENCES `cheval` (`id`),
  ADD CONSTRAINT `lot_ibfk_2` FOREIGN KEY (`idVente`) REFERENCES `vente` (`id`);

--
-- Contraintes pour la table `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`type_uti`) REFERENCES `type_utilisateur` (`code`),
  ADD CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`type_uti`) REFERENCES `type_utilisateur` (`code`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
