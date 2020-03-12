-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 11 mars 2020 à 18:26
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rgb`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `roles`) VALUES
(10, 'Guillaume', 'guillaume.couget@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$Mzg2dEVFelVXT0NHOTVFdw$AWdRy62D3ILX1ucqdB4oAieHpYFXA3/4eeHBiDU4HxA', '[\"ROLE_ADMIN\"]');

-- --------------------------------------------------------

--
-- Structure de la table `ape`
--

CREATE TABLE `ape` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ape`
--

INSERT INTO `ape` (`id`, `code`, `name`) VALUES
(1, '01.11', 'Culture de cereales (a l\'exception du riz), de legumineuses et de graines oleagineuses'),
(2, '01.11Z', 'Culture de cereales (a l\'exception du riz), de legumineuses et de graines oleagineuses'),
(3, '01.12', 'Culture du riz'),
(4, '01.12Z', 'Culture du riz'),
(5, '01.13', 'Culture de legumes, de melons, de racines et de tubercules'),
(6, '01.13Z', 'Culture de legumes, de melons, de racines et de tubercules'),
(7, '01.14', 'Culture de la canne a sucre'),
(8, '01.14Z', 'Culture de la canne a sucre'),
(9, '01.15', 'Culture du tabac'),
(10, '01.15Z', 'Culture du tabac'),
(11, '01.16', 'Culture de plantes a fibres'),
(12, '01.16Z', 'Culture de plantes a fibres'),
(13, '01.19', 'Autres cultures non permanentes'),
(14, '01.19Z', 'Autres cultures non permanentes'),
(15, '01.21', 'Culture de la vigne'),
(16, '01.21Z', 'Culture de la vigne'),
(17, '01.22', 'Culture de fruits tropicaux et subtropicaux'),
(18, '01.22Z', 'Culture de fruits tropicaux et subtropicaux'),
(19, '01.23', 'Culture d\'agrumes'),
(20, '01.23Z', 'Culture d\'agrumes'),
(21, '01.24', 'Culture de fruits a pepins et a noyau'),
(22, '01.24Z', 'Culture de fruits a pepins et a noyau'),
(23, '01.25', 'Culture d\'autres fruits d\'arbres ou d\'arbustes et de fruits a coque'),
(24, '01.25Z', 'Culture d\'autres fruits d\'arbres ou d\'arbustes et de fruits a coque'),
(25, '01.26', 'Culture de fruits oleagineux'),
(26, '01.26Z', 'Culture de fruits oleagineux'),
(27, '01.27', 'Culture de plantes a boissons'),
(28, '01.27Z', 'Culture de plantes a boissons'),
(29, '01.28', 'Culture de plantes a epices, aromatiques, medicinales et pharmaceutiques'),
(30, '01.28Z', 'Culture de plantes a epices, aromatiques, medicinales et pharmaceutiques'),
(31, '01.29', 'Autres cultures permanentes'),
(32, '01.29Z', 'Autres cultures permanentes'),
(33, '01.30', 'Reproduction de plantes'),
(34, '01.30Z', 'Reproduction de plantes'),
(35, '01.41', 'elevage de vaches laitieres'),
(36, '01.41Z', 'elevage de vaches laitieres'),
(37, '01.42', 'elevage d\'autres bovins et de buffles'),
(38, '01.42Z', 'elevage d\'autres bovins et de buffles'),
(39, '01.43', 'elevage de chevaux et d\'autres equides'),
(40, '01.43Z', 'elevage de chevaux et d\'autres equides'),
(41, '01.44', 'elevage de chameaux et d\'autres camelides'),
(42, '01.44Z', 'elevage de chameaux et d\'autres camelides'),
(43, '01.45', 'elevage d\'ovins et de caprins'),
(44, '01.45Z', 'elevage d\'ovins et de caprins'),
(45, '01.46', 'elevage de porcins'),
(46, '01.46Z', 'elevage de porcins'),
(47, '01.47', 'elevage de volailles'),
(48, '01.47Z', 'elevage de volailles'),
(49, '01.49', 'elevage d\'autres animaux'),
(50, '01.49Z', 'elevage d\'autres animaux'),
(51, '01.50', 'Culture et elevage associes'),
(52, '01.50Z', 'Culture et elevage associes'),
(53, '01.61', 'Activites de soutien aux cultures'),
(54, '01.61Z', 'Activites de soutien aux cultures'),
(55, '01.62', 'Activites de soutien a la production animale'),
(56, '01.62Z', 'Activites de soutien a la production animale'),
(57, '01.63', 'Traitement primaire des recoltes'),
(58, '01.63Z', 'Traitement primaire des recoltes'),
(59, '01.64', 'Traitement des semences'),
(60, '01.64Z', 'Traitement des semences'),
(61, '01.70', 'Chasse, piegeage et services annexes'),
(62, '01.70Z', 'Chasse, piegeage et services annexes'),
(63, '02.10', 'Sylviculture et autres activites forestieres'),
(64, '02.10Z', 'Sylviculture et autres activites forestieres'),
(65, '02.20', 'Exploitation forestiere'),
(66, '02.20Z', 'Exploitation forestiere'),
(67, '02.30', 'Recolte de produits forestiers non ligneux poussant a l\'etat sauvage'),
(68, '02.30Z', 'Recolte de produits forestiers non ligneux poussant a l\'etat sauvage'),
(69, '02.40', 'Services de soutien a l\'exploitation forestiere'),
(70, '02.40Z', 'Services de soutien a l\'exploitation forestiere'),
(71, '03.11', 'Peche en mer'),
(72, '03.11Z', 'Peche en mer'),
(73, '03.12', 'Peche en eau douce'),
(74, '03.12Z', 'Peche en eau douce'),
(75, '03.21', 'Aquaculture en mer'),
(76, '03.21Z', 'Aquaculture en mer'),
(77, '03.22', 'Aquaculture en eau douce'),
(78, '03.22Z', 'Aquaculture en eau douce'),
(79, '05.10', 'Extraction de houille'),
(80, '05.10Z', 'Extraction de houille'),
(81, '05.20', 'Extraction de lignite'),
(82, '05.20Z', 'Extraction de lignite'),
(83, '06.10', 'Extraction de petrole brut'),
(84, '06.10Z', 'Extraction de petrole brut'),
(85, '06.20', 'Extraction de gaz naturel'),
(86, '06.20Z', 'Extraction de gaz naturel'),
(87, '07.10', 'Extraction de minerais de fer'),
(88, '07.10Z', 'Extraction de minerais de fer'),
(89, '07.21', 'Extraction de minerais d\'uranium et de thorium'),
(90, '07.21Z', 'Extraction de minerais d\'uranium et de thorium'),
(91, '07.29', 'Extraction d\'autres minerais de metaux non ferreux'),
(92, '07.29Z', 'Extraction d\'autres minerais de metaux non ferreux'),
(93, '08.11', 'Extraction de pierres ornementales et de construction, de calcaire industriel, de gypse, de craie et d\'ardoise'),
(94, '08.11Z', 'Extraction de pierres ornementales et de construction, de calcaire industriel, de gypse, de craie et d\'ardoise'),
(95, '08.12', 'Exploitation de gravieres et sablieres, extraction d?argiles et de kaolin'),
(96, '08.12Z', 'Exploitation de gravieres et sablieres, extraction d?argiles et de kaolin'),
(97, '08.91', 'Extraction des mineraux chimiques et d\'engrais mineraux '),
(98, '08.91Z', 'Extraction des mineraux chimiques et d\'engrais mineraux '),
(99, '08.92', 'Extraction de tourbe'),
(100, '08.92Z', 'Extraction de tourbe'),
(101, '08.93', 'Production de sel '),
(102, '08.93Z', 'Production de sel '),
(103, '08.99', 'Autres activites extractives n.c.a.'),
(104, '08.99Z', 'Autres activites extractives n.c.a.'),
(105, '09.10', 'Activites de soutien a l\'extraction d\'hydrocarbures'),
(106, '09.10Z', 'Activites de soutien a l\'extraction d\'hydrocarbures'),
(107, '09.90', 'Activites de soutien aux autres industries extractives '),
(108, '09.90Z', 'Activites de soutien aux autres industries extractives '),
(109, '10.11', 'Transformation et conservation de la viande de boucherie'),
(110, '10.11Z', 'Transformation et conservation de la viande de boucherie'),
(111, '10.12', 'Transformation et conservation de la viande de volaille'),
(112, '10.12Z', 'Transformation et conservation de la viande de volaille'),
(113, '10.13', 'Preparation de produits a base de viande'),
(114, '10.13A', 'Preparation industrielle de produits a base de viande'),
(115, '10.13B', 'Charcuterie'),
(116, '10.20', 'Transformation et conservation de poisson, de crustaces et de mollusques'),
(117, '10.20Z', 'Transformation et conservation de poisson, de crustaces et de mollusques'),
(118, '10.31', 'Transformation et conservation de pommes de terre'),
(119, '10.31Z', 'Transformation et conservation de pommes de terre'),
(120, '10.32', 'Preparation de jus de fruits et legumes'),
(121, '10.32Z', 'Preparation de jus de fruits et legumes'),
(122, '10.39', 'Autre transformation et conservation de fruits et legumes'),
(123, '10.39A', 'Autre transformation et conservation de legumes'),
(124, '10.39B', 'Transformation et conservation de fruits'),
(125, '10.41', 'Fabrication d\'huiles et graisses'),
(126, '10.41A', 'Fabrication d\'huiles et graisses brutes'),
(127, '10.41B', 'Fabrication d\'huiles et graisses raffinees'),
(128, '10.42', 'Fabrication de margarine et graisses comestibles similaires'),
(129, '10.42Z', 'Fabrication de margarine et graisses comestibles similaires'),
(130, '10.51', 'Exploitation de laiteries et fabrication de fromage'),
(131, '10.51A', 'Fabrication de lait liquide et de produits frais'),
(132, '10.51B', 'Fabrication de beurre'),
(133, '10.51C', 'Fabrication de fromage'),
(134, '10.51D', 'Fabrication d\'autres produits laitiers'),
(135, '10.52', 'Fabrication de glaces et sorbets'),
(136, '10.52Z', 'Fabrication de glaces et sorbets'),
(137, '10.61', 'Travail des grains'),
(138, '10.61A', 'Meunerie'),
(139, '10.61B', 'Autres activites du travail des grains'),
(140, '10.62', 'Fabrication de produits amylaces'),
(141, '10.62Z', 'Fabrication de produits amylaces'),
(142, '10.71', 'Fabrication de pain et de patisserie fra?che'),
(143, '10.71A', 'Fabrication industrielle de pain et de patisserie fra?che'),
(144, '10.71B', 'Cuisson de produits de boulangerie'),
(145, '10.71C', 'Boulangerie et boulangerie-patisserie'),
(146, '10.71D', 'Patisserie'),
(147, '10.72', 'Fabrication de biscuits, biscottes et patisseries de conservation'),
(148, '10.72Z', 'Fabrication de biscuits, biscottes et patisseries de conservation'),
(149, '10.73', 'Fabrication de pates alimentaires'),
(150, '10.73Z', 'Fabrication de pates alimentaires'),
(151, '10.81', 'Fabrication de sucre'),
(152, '10.81Z', 'Fabrication de sucre'),
(153, '10.82', 'Fabrication de cacao, chocolat et de produits de confiserie'),
(154, '10.82Z', 'Fabrication de cacao, chocolat et de produits de confiserie'),
(155, '10.83', 'Transformation du the et du cafe'),
(156, '10.83Z', 'Transformation du the et du cafe'),
(157, '10.84', 'Fabrication de condiments et assaisonnements'),
(158, '10.84Z', 'Fabrication de condiments et assaisonnements'),
(159, '10.85', 'Fabrication de plats prepares'),
(160, '10.85Z', 'Fabrication de plats prepares'),
(161, '10.86', 'Fabrication d\'aliments homogeneises et dietetiques'),
(162, '10.86Z', 'Fabrication d\'aliments homogeneises et dietetiques'),
(163, '10.89', 'Fabrication d\'autres produits alimentaires n.c.a.'),
(164, '10.89Z', 'Fabrication d\'autres produits alimentaires n.c.a.'),
(165, '10.91', 'Fabrication d\'aliments pour animaux de ferme'),
(166, '10.91Z', 'Fabrication d\'aliments pour animaux de ferme'),
(167, '10.92', 'Fabrication d\'aliments pour animaux de compagnie'),
(168, '10.92Z', 'Fabrication d\'aliments pour animaux de compagnie'),
(169, '11.01', 'Production de boissons alcooliques distillees'),
(170, '11.01Z', 'Production de boissons alcooliques distillees'),
(171, '11.02', 'Production de vin (de raisin)'),
(172, '11.02A', 'Fabrication de vins effervescents'),
(173, '11.02B', 'Vinification'),
(174, '11.03', 'Fabrication de cidre et de vins de fruits  '),
(175, '11.03Z', 'Fabrication de cidre et de vins de fruits '),
(176, '11.04', 'Production d\'autres boissons fermentees non distillees'),
(177, '11.04Z', 'Production d\'autres boissons fermentees non distillees'),
(178, '11.05', 'Fabrication de biere'),
(179, '11.05Z', 'Fabrication de biere'),
(180, '11.06', 'Fabrication de malt'),
(181, '11.06Z', 'Fabrication de malt'),
(182, '11.07', 'Industrie des eaux minerales et autres eaux embouteillees et des boissons rafra?chissantes'),
(183, '11.07A', 'Industrie des eaux de table'),
(184, '11.07B', 'Production de boissons rafra?chissantes'),
(185, '12.00', 'Fabrication de produits a base de tabac'),
(186, '12.00Z', 'Fabrication de produits a base de tabac'),
(187, '13.10', 'Preparation de fibres textiles et filature'),
(188, '13.10Z', 'Preparation de fibres textiles et filature'),
(189, '13.20', 'Tissage'),
(190, '13.20Z', 'Tissage'),
(191, '13.30', 'Ennoblissement textile'),
(192, '13.30Z', 'Ennoblissement textile'),
(193, '13.91', 'Fabrication d\'etoffes a mailles'),
(194, '13.91Z', 'Fabrication d\'etoffes a mailles'),
(195, '13.92', 'Fabrication d\'articles textiles, sauf habillement'),
(196, '13.92Z', 'Fabrication d\'articles textiles, sauf habillement'),
(197, '13.93', 'Fabrication de tapis et moquettes'),
(198, '13.93Z', 'Fabrication de tapis et moquettes'),
(199, '13.94', 'Fabrication de ficelles, cordes et filets'),
(200, '13.94Z', 'Fabrication de ficelles, cordes et filets'),
(201, '13.95', 'Fabrication de non-tisses, sauf habillement'),
(202, '13.95Z', 'Fabrication de non-tisses, sauf habillement'),
(203, '13.96', 'Fabrication d\'autres textiles techniques et industriels'),
(204, '13.96Z', 'Fabrication d\'autres textiles techniques et industriels'),
(205, '13.99', 'Fabrication d\'autres textiles n.c.a.'),
(206, '13.99Z', 'Fabrication d\'autres textiles n.c.a.'),
(207, '14.11', 'Fabrication de vetements en cuir'),
(208, '14.11Z', 'Fabrication de vetements en cuir'),
(209, '14.12', 'Fabrication de vetements de travail'),
(210, '14.12Z', 'Fabrication de vetements de travail'),
(211, '14.13', 'Fabrication de vetements de dessus'),
(212, '14.13Z', 'Fabrication de vetements de dessus'),
(213, '14.14', 'Fabrication de vetements de dessous'),
(214, '14.14Z', 'Fabrication de vetements de dessous'),
(215, '14.19', 'Fabrication d\'autres vetements et accessoires'),
(216, '14.19Z', 'Fabrication d\'autres vetements et accessoires'),
(217, '14.20', 'Fabrication d\'articles en fourrure'),
(218, '14.20Z', 'Fabrication d\'articles en fourrure'),
(219, '14.31', 'Fabrication d\'articles chaussants a mailles'),
(220, '14.31Z', 'Fabrication d\'articles chaussants a mailles'),
(221, '14.39', 'Fabrication d\'autres articles a mailles'),
(222, '14.39Z', 'Fabrication d\'autres articles a mailles'),
(223, '15.11', 'Appret et tannage des cuirs ; preparation et teinture des fourrures'),
(224, '15.11Z', 'Appret et tannage des cuirs ; preparation et teinture des fourrures'),
(225, '15.12', 'Fabrication d\'articles de voyage, de maroquinerie et de sellerie'),
(226, '15.12Z', 'Fabrication d\'articles de voyage, de maroquinerie et de sellerie'),
(227, '15.20', 'Fabrication de chaussures'),
(228, '15.20Z', 'Fabrication de chaussures'),
(229, '16.10', 'Sciage et rabotage du bois'),
(230, '16.10A', 'Sciage et rabotage du bois, hors impregnation'),
(231, '16.10B', 'Impregnation du bois'),
(232, '16.21', 'Fabrication de placage et de panneaux de bois'),
(233, '16.21Z', 'Fabrication de placage et de panneaux de bois'),
(234, '16.22', 'Fabrication de parquets assembles'),
(235, '16.22Z', 'Fabrication de parquets assembles'),
(236, '16.23', 'Fabrication de charpentes et d\'autres menuiseries'),
(237, '16.23Z', 'Fabrication de charpentes et d\'autres menuiseries'),
(238, '16.24', 'Fabrication d\'emballages en bois'),
(239, '16.24Z', 'Fabrication d\'emballages en bois'),
(240, '16.29', 'Fabrication d\'objets divers en bois ; fabrication d\'objets en liege, vannerie et sparterie'),
(241, '16.29Z', 'Fabrication d\'objets divers en bois ; fabrication d\'objets en liege, vannerie et sparterie'),
(242, '17.11', 'Fabrication de pate a papier'),
(243, '17.11Z', 'Fabrication de pate a papier'),
(244, '17.12', 'Fabrication de papier et de carton'),
(245, '17.12Z', 'Fabrication de papier et de carton'),
(246, '17.21', 'Fabrication de papier et carton ondules et d\'emballages en papier ou en carton'),
(247, '17.21A', 'Fabrication de carton ondule'),
(248, '17.21B', 'Fabrication de cartonnages '),
(249, '17.21C', 'Fabrication d\'emballages en papier'),
(250, '17.22', 'Fabrication d\'articles en papier a usage sanitaire ou domestique'),
(251, '17.22Z', 'Fabrication d\'articles en papier a usage sanitaire ou domestique'),
(252, '17.23', 'Fabrication d\'articles de papeterie'),
(253, '17.23Z', 'Fabrication d\'articles de papeterie'),
(254, '17.24', 'Fabrication de papiers peints'),
(255, '17.24Z', 'Fabrication de papiers peints'),
(256, '17.29', 'Fabrication d\'autres articles en papier ou en carton'),
(257, '17.29Z', 'Fabrication d\'autres articles en papier ou en carton'),
(258, '18.11', 'Imprimerie de journaux'),
(259, '18.11Z', 'Imprimerie de journaux'),
(260, '18.12', 'Autre imprimerie (labeur)'),
(261, '18.12Z', 'Autre imprimerie (labeur)'),
(262, '18.13', 'Activites de pre-presse '),
(263, '18.13Z', 'Activites de pre-presse '),
(264, '18.14', 'Reliure et activites connexes'),
(265, '18.14Z', 'Reliure et activites connexes'),
(266, '18.20', 'Reproduction d\'enregistrements'),
(267, '18.20Z', 'Reproduction d\'enregistrements'),
(268, '19.10', 'Cokefaction'),
(269, '19.10Z', 'Cokefaction'),
(270, '19.20', 'Raffinage du petrole'),
(271, '19.20Z', 'Raffinage du petrole'),
(272, '20.11', 'Fabrication de gaz industriels'),
(273, '20.11Z', 'Fabrication de gaz industriels'),
(274, '20.12', 'Fabrication de colorants et de pigments'),
(275, '20.12Z', 'Fabrication de colorants et de pigments'),
(276, '20.13', 'Fabrication d\'autres produits chimiques inorganiques de base'),
(277, '20.13A', 'Enrichissement et  retraitement de matieres nucleaires'),
(278, '20.13B', 'Fabrication d\'autres produits chimiques inorganiques de base n.c.a.'),
(279, '20.14', 'Fabrication d\'autres produits chimiques organiques de base'),
(280, '20.14Z', 'Fabrication d\'autres produits chimiques organiques de base'),
(281, '20.15', 'Fabrication de produits azotes et d\'engrais'),
(282, '20.15Z', 'Fabrication de produits azotes et d\'engrais'),
(283, '20.16', 'Fabrication de matieres plastiques de base'),
(284, '20.16Z', 'Fabrication de matieres plastiques de base'),
(285, '20.17', 'Fabrication de caoutchouc synthetique'),
(286, '20.17Z', 'Fabrication de caoutchouc synthetique'),
(287, '20.20', 'Fabrication de pesticides et d?autres produits agrochimiques'),
(288, '20.20Z', 'Fabrication de pesticides et d?autres produits agrochimiques'),
(289, '20.30', 'Fabrication de peintures, vernis, encres et mastics'),
(290, '20.30Z', 'Fabrication de peintures, vernis, encres et mastics'),
(291, '20.41', 'Fabrication de savons, detergents et produits d\'entretien'),
(292, '20.41Z', 'Fabrication de savons, detergents et produits d\'entretien'),
(293, '20.42', 'Fabrication de parfums et de produits pour la toilette'),
(294, '20.42Z', 'Fabrication de parfums et de produits pour la toilette'),
(295, '20.51', 'Fabrication de produits explosifs'),
(296, '20.51Z', 'Fabrication de produits explosifs'),
(297, '20.52', 'Fabrication de colles'),
(298, '20.52Z', 'Fabrication de colles'),
(299, '20.53', 'Fabrication d\'huiles essentielles'),
(300, '20.53Z', 'Fabrication d\'huiles essentielles'),
(301, '20.59', 'Fabrication d\'autres produits chimiques n.c.a.'),
(302, '20.59Z', 'Fabrication d\'autres produits chimiques n.c.a.'),
(303, '20.60', 'Fabrication de fibres artificielles ou synthetiques'),
(304, '20.60Z', 'Fabrication de fibres artificielles ou synthetiques'),
(305, '21.10', 'Fabrication de produits pharmaceutiques de base'),
(306, '21.10Z', 'Fabrication de produits pharmaceutiques de base'),
(307, '21.20', 'Fabrication de preparations pharmaceutiques'),
(308, '21.20Z', 'Fabrication de preparations pharmaceutiques'),
(309, '22.11', 'Fabrication et rechapage de pneumatiques'),
(310, '22.11Z', 'Fabrication et rechapage de pneumatiques'),
(311, '22.19', 'Fabrication d\'autres articles en caoutchouc'),
(312, '22.19Z', 'Fabrication d\'autres articles en caoutchouc'),
(313, '22.21', 'Fabrication de plaques, feuilles, tubes et profiles en matieres plastiques'),
(314, '22.21Z', 'Fabrication de plaques, feuilles, tubes et profiles en matieres plastiques'),
(315, '22.22', 'Fabrication d\'emballages en matieres plastiques'),
(316, '22.22Z', 'Fabrication d\'emballages en matieres plastiques'),
(317, '22.23', 'Fabrication d\'elements en matieres plastiques pour la construction'),
(318, '22.23Z', 'Fabrication d\'elements en matieres plastiques pour la construction'),
(319, '22.29', 'Fabrication d\'autres articles en matieres plastiques'),
(320, '22.29A', 'Fabrication de pieces techniques a base de matieres plastiques'),
(321, '22.29B', 'Fabrication de produits de consommation courante en matieres plastiques'),
(322, '23.11', 'Fabrication de verre plat'),
(323, '23.11Z', 'Fabrication de verre plat'),
(324, '23.12', 'Fa?onnage et transformation du verre plat'),
(325, '23.12Z', 'Fa?onnage et transformation du verre plat'),
(326, '23.13', 'Fabrication de verre creux'),
(327, '23.13Z', 'Fabrication de verre creux'),
(328, '23.14', 'Fabrication de fibres de verre'),
(329, '23.14Z', 'Fabrication de fibres de verre'),
(330, '23.19', 'Fabrication et fa?onnage d\'autres articles en verre, y compris verre technique'),
(331, '23.19Z', 'Fabrication et fa?onnage d\'autres articles en verre, y compris verre technique'),
(332, '23.20', 'Fabrication de produits refractaires'),
(333, '23.20Z', 'Fabrication de produits refractaires'),
(334, '23.31', 'Fabrication de carreaux en ceramique'),
(335, '23.31Z', 'Fabrication de carreaux en ceramique'),
(336, '23.32', 'Fabrication de briques, tuiles et produits de construction, en terre cuite'),
(337, '23.32Z', 'Fabrication de briques, tuiles et produits de construction, en terre cuite'),
(338, '23.41', 'Fabrication d\'articles ceramiques a usage domestique ou ornemental'),
(339, '23.41Z', 'Fabrication d\'articles ceramiques a usage domestique ou ornemental'),
(340, '23.42', 'Fabrication d\'appareils sanitaires en ceramique'),
(341, '23.42Z', 'Fabrication d\'appareils sanitaires en ceramique'),
(342, '23.43', 'Fabrication d\'isolateurs et pieces isolantes en ceramique'),
(343, '23.43Z', 'Fabrication d\'isolateurs et pieces isolantes en ceramique'),
(344, '23.44', 'Fabrication d\'autres produits ceramiques a usage technique'),
(345, '23.44Z', 'Fabrication d\'autres produits ceramiques a usage technique'),
(346, '23.49', 'Fabrication d\'autres produits ceramiques '),
(347, '23.49Z', 'Fabrication d\'autres produits ceramiques'),
(348, '23.51', 'Fabrication de ciment'),
(349, '23.51Z', 'Fabrication de ciment'),
(350, '23.52', 'Fabrication de chaux et platre'),
(351, '23.52Z', 'Fabrication de chaux et platre'),
(352, '23.61', 'Fabrication d\'elements en beton pour la construction'),
(353, '23.61Z', 'Fabrication d\'elements en beton pour la construction'),
(354, '23.62', 'Fabrication d\'elements en platre pour la construction'),
(355, '23.62Z', 'Fabrication d\'elements en platre pour la construction'),
(356, '23.63', 'Fabrication de beton pret a l\'emploi'),
(357, '23.63Z', 'Fabrication de beton pret a l\'emploi'),
(358, '23.64', 'Fabrication de mortiers et betons secs'),
(359, '23.64Z', 'Fabrication de mortiers et betons secs'),
(360, '23.65', 'Fabrication d\'ouvrages en fibre-ciment'),
(361, '23.65Z', 'Fabrication d\'ouvrages en fibre-ciment'),
(362, '23.69', 'Fabrication d\'autres ouvrages en beton, en ciment ou en platre'),
(363, '23.69Z', 'Fabrication d\'autres ouvrages en beton, en ciment ou en platre'),
(364, '23.70', 'Taille, fa?onnage et finissage de pierres'),
(365, '23.70Z', 'Taille, fa?onnage et finissage de pierres'),
(366, '23.91', 'Fabrication de produits abrasifs'),
(367, '23.91Z', 'Fabrication de produits abrasifs'),
(368, '23.99', 'Fabrication d\'autres produits mineraux non metalliques n.c.a.'),
(369, '23.99Z', 'Fabrication d\'autres produits mineraux non metalliques n.c.a.'),
(370, '24.10', 'Siderurgie'),
(371, '24.10Z', 'Siderurgie'),
(372, '24.20', 'Fabrication de tubes, tuyaux, profiles creux et accessoires correspondants en acier '),
(373, '24.20Z', 'Fabrication de tubes, tuyaux, profiles creux et accessoires correspondants en acier '),
(374, '24.31', 'etirage a froid de barres'),
(375, '24.31Z', 'etirage a froid de barres'),
(376, '24.32', 'Laminage a froid de feuillards'),
(377, '24.32Z', 'Laminage a froid de feuillards'),
(378, '24.33', 'Profilage a froid par formage ou pliage'),
(379, '24.33Z', 'Profilage a froid par formage ou pliage'),
(380, '24.34', 'Trefilage a froid'),
(381, '24.34Z', 'Trefilage a froid'),
(382, '24.41', 'Production de metaux precieux'),
(383, '24.41Z', 'Production de metaux precieux'),
(384, '24.42', 'Metallurgie de l\'aluminium'),
(385, '24.42Z', 'Metallurgie de l\'aluminium'),
(386, '24.43', 'Metallurgie du plomb, du zinc ou de l\'etain'),
(387, '24.43Z', 'Metallurgie du plomb, du zinc ou de l\'etain'),
(388, '24.44', 'Metallurgie du cuivre'),
(389, '24.44Z', 'Metallurgie du cuivre'),
(390, '24.45', 'Metallurgie des autres metaux non ferreux'),
(391, '24.45Z', 'Metallurgie des autres metaux non ferreux'),
(392, '24.46', 'elaboration et transformation de matieres nucleaires'),
(393, '24.46Z', 'elaboration et transformation de matieres nucleaires'),
(394, '24.51', 'Fonderie de fonte'),
(395, '24.51Z', 'Fonderie de fonte'),
(396, '24.52', 'Fonderie d\'acier'),
(397, '24.52Z', 'Fonderie d\'acier'),
(398, '24.53', 'Fonderie de metaux legers'),
(399, '24.53Z', 'Fonderie de metaux legers'),
(400, '24.54', 'Fonderie d\'autres metaux non ferreux'),
(401, '24.54Z', 'Fonderie d\'autres metaux non ferreux'),
(402, '25.11', 'Fabrication de structures metalliques et de parties de structures'),
(403, '25.11Z', 'Fabrication de structures metalliques et de parties de structures'),
(404, '25.12', 'Fabrication de portes et fenetres en metal'),
(405, '25.12Z', 'Fabrication de portes et fenetres en metal'),
(406, '25.21', 'Fabrication de radiateurs et de chaudieres pour le chauffage central'),
(407, '25.21Z', 'Fabrication de radiateurs et de chaudieres pour le chauffage central'),
(408, '25.29', 'Fabrication d\'autres reservoirs, citernes et conteneurs metalliques'),
(409, '25.29Z', 'Fabrication d\'autres reservoirs, citernes et conteneurs metalliques'),
(410, '25.30', 'Fabrication de generateurs de vapeur, a l\'exception des chaudieres pour le chauffage central'),
(411, '25.30Z', 'Fabrication de generateurs de vapeur, a l\'exception des chaudieres pour le chauffage central'),
(412, '25.40', 'Fabrication d\'armes et de munitions'),
(413, '25.40Z', 'Fabrication d\'armes et de munitions'),
(414, '25.50', 'Forge, emboutissage, estampage ; metallurgie des poudres'),
(415, '25.50A', 'Forge, estampage, matri?age ; metallurgie des poudres'),
(416, '25.50B', 'Decoupage, emboutissage'),
(417, '25.61', 'Traitement et revetement des metaux'),
(418, '25.61Z', 'Traitement et revetement des metaux'),
(419, '25.62', 'Usinage'),
(420, '25.62A', 'Decolletage'),
(421, '25.62B', 'Mecanique industrielle'),
(422, '25.71', 'Fabrication de coutellerie'),
(423, '25.71Z', 'Fabrication de coutellerie'),
(424, '25.72', 'Fabrication de serrures et de ferrures'),
(425, '25.72Z', 'Fabrication de serrures et de ferrures'),
(426, '25.73', 'Fabrication d\'outillage'),
(427, '25.73A', 'Fabrication de moules et modeles'),
(428, '25.73B', 'Fabrication d\'autres outillages'),
(429, '25.91', 'Fabrication de f?ts et emballages metalliques similaires'),
(430, '25.91Z', 'Fabrication de f?ts et emballages metalliques similaires'),
(431, '25.92', 'Fabrication d\'emballages metalliques legers'),
(432, '25.92Z', 'Fabrication d\'emballages metalliques legers'),
(433, '25.93', 'Fabrication d\'articles en fils metalliques, de cha?nes et de ressorts'),
(434, '25.93Z', 'Fabrication d\'articles en fils metalliques, de cha?nes et de ressorts'),
(435, '25.94', 'Fabrication de vis et de boulons'),
(436, '25.94Z', 'Fabrication de vis et de boulons'),
(437, '25.99', 'Fabrication d\'autres produits metalliques n.c.a.'),
(438, '25.99A', 'Fabrication d\'articles metalliques menagers'),
(439, '25.99B', 'Fabrication d\'autres articles metalliques'),
(440, '26.11', 'Fabrication de composants electroniques'),
(441, '26.11Z', 'Fabrication de composants electroniques'),
(442, '26.12', 'Fabrication de cartes electroniques assemblees'),
(443, '26.12Z', 'Fabrication de cartes electroniques assemblees'),
(444, '26.20', 'Fabrication d\'ordinateurs et d\'equipements peripheriques'),
(445, '26.20Z', 'Fabrication d\'ordinateurs et d\'equipements peripheriques'),
(446, '26.30', 'Fabrication d\'equipements de communication '),
(447, '26.30Z', 'Fabrication d\'equipements de communication '),
(448, '26.40', 'Fabrication de produits electroniques grand public'),
(449, '26.40Z', 'Fabrication de produits electroniques grand public'),
(450, '26.51', 'Fabrication d\'instruments et d\'appareils de mesure, d\'essai et de navigation'),
(451, '26.51A', 'Fabrication d\'equipements d\'aide a la navigation'),
(452, '26.51B', 'Fabrication d\'instrumentation scientifique et technique'),
(453, '26.52', 'Horlogerie'),
(454, '26.52Z', 'Horlogerie'),
(455, '26.60', 'Fabrication d\'equipements d\'irradiation medicale, d\'equipements electromedicaux et electrotherapeutiques '),
(456, '26.60Z', 'Fabrication d\'equipements d\'irradiation medicale, d\'equipements electromedicaux et electrotherapeutiques '),
(457, '26.70', 'Fabrication de materiels optique et photographique'),
(458, '26.70Z', 'Fabrication de materiels optique et photographique'),
(459, '26.80', 'Fabrication de supports magnetiques et optiques'),
(460, '26.80Z', 'Fabrication de supports magnetiques et optiques'),
(461, '27.11', 'Fabrication de moteurs, generatrices et transformateurs electriques'),
(462, '27.11Z', 'Fabrication de moteurs, generatrices et transformateurs electriques'),
(463, '27.12', 'Fabrication de materiel de distribution et de commande electrique'),
(464, '27.12Z', 'Fabrication de materiel de distribution et de commande electrique'),
(465, '27.20', 'Fabrication de piles et d\'accumulateurs electriques'),
(466, '27.20Z', 'Fabrication de piles et d\'accumulateurs electriques'),
(467, '27.31', 'Fabrication de cables de fibres optiques'),
(468, '27.31Z', 'Fabrication de cables de fibres optiques'),
(469, '27.32', 'Fabrication d\'autres fils et cables electroniques ou electriques'),
(470, '27.32Z', 'Fabrication d\'autres fils et cables electroniques ou electriques'),
(471, '27.33', 'Fabrication de materiel d\'installation electrique'),
(472, '27.33Z', 'Fabrication de materiel d\'installation electrique'),
(473, '27.40', 'Fabrication d\'appareils d\'eclairage electrique'),
(474, '27.40Z', 'Fabrication d\'appareils d\'eclairage electrique'),
(475, '27.51', 'Fabrication d\'appareils electromenagers'),
(476, '27.51Z', 'Fabrication d\'appareils electromenagers'),
(477, '27.52', 'Fabrication d\'appareils menagers non electriques'),
(478, '27.52Z', 'Fabrication d\'appareils menagers non electriques'),
(479, '27.90', 'Fabrication d\'autres materiels electriques'),
(480, '27.90Z', 'Fabrication d\'autres materiels electriques'),
(481, '28.11', 'Fabrication de moteurs et turbines, a l\'exception des moteurs d?avions et de vehicules'),
(482, '28.11Z', 'Fabrication de moteurs et turbines, a l\'exception des moteurs d?avions et de vehicules'),
(483, '28.12', 'Fabrication d\'equipements hydrauliques et pneumatiques'),
(484, '28.12Z', 'Fabrication d\'equipements hydrauliques et pneumatiques'),
(485, '28.13', 'Fabrication d\'autres pompes et compresseurs'),
(486, '28.13Z', 'Fabrication d\'autres pompes et compresseurs'),
(487, '28.14', 'Fabrication d\'autres articles de robinetterie'),
(488, '28.14Z', 'Fabrication d\'autres articles de robinetterie'),
(489, '28.15', 'Fabrication d\'engrenages et d\'organes mecaniques de transmission'),
(490, '28.15Z', 'Fabrication d\'engrenages et d\'organes mecaniques de transmission'),
(491, '28.21', 'Fabrication de fours et br?leurs'),
(492, '28.21Z', 'Fabrication de fours et br?leurs'),
(493, '28.22', 'Fabrication de materiel de levage et de manutention'),
(494, '28.22Z', 'Fabrication de materiel de levage et de manutention'),
(495, '28.23', 'Fabrication de machines et d\'equipements de bureau (a l\'exception des ordinateurs et equipements peripheriques)'),
(496, '28.23Z', 'Fabrication de machines et d\'equipements de bureau (a l\'exception des ordinateurs et equipements peripheriques)'),
(497, '28.24', 'Fabrication d\'outillage portatif a moteur incorpore'),
(498, '28.24Z', 'Fabrication d\'outillage portatif a moteur incorpore'),
(499, '28.25', 'Fabrication d\'equipements aerauliques et frigorifiques industriels'),
(500, '28.25Z', 'Fabrication d\'equipements aerauliques et frigorifiques industriels'),
(501, '28.29', 'Fabrication de machines diverses d\'usage general'),
(502, '28.29A', 'Fabrication d\'equipements d\'emballage, de conditionnement et de pesage '),
(503, '28.29B', 'Fabrication d\'autres machines d\'usage general'),
(504, '28.30', 'Fabrication de machines agricoles et forestieres'),
(505, '28.30Z', 'Fabrication de machines agricoles et forestieres'),
(506, '28.41', 'Fabrication de machines de formage des metaux'),
(507, '28.41Z', 'Fabrication de machines-outils pour le travail des metaux'),
(508, '28.49', 'Fabrication d\'autres machines-outils '),
(509, '28.49Z', 'Fabrication d\'autres machines-outils '),
(510, '28.91', 'Fabrication de machines pour la metallurgie'),
(511, '28.91Z', 'Fabrication de machines pour la metallurgie'),
(512, '28.92', 'Fabrication de machines pour l\'extraction ou la construction'),
(513, '28.92Z', 'Fabrication de machines pour l\'extraction ou la construction'),
(514, '28.93', 'Fabrication de machines pour l\'industrie agro-alimentaire'),
(515, '28.93Z', 'Fabrication de machines pour l\'industrie agro-alimentaire'),
(516, '28.94', 'Fabrication de machines pour les industries textiles'),
(517, '28.94Z', 'Fabrication de machines pour les industries textiles'),
(518, '28.95', 'Fabrication de machines pour les industries du papier et du carton'),
(519, '28.95Z', 'Fabrication de machines pour les industries du papier et du carton'),
(520, '28.96', 'Fabrication de machines pour le travail du caoutchouc ou des plastiques'),
(521, '28.96Z', 'Fabrication de machines pour le travail du caoutchouc ou des plastiques'),
(522, '28.99', 'Fabrication d\'autres machines d\'usage specifique n.c.a.'),
(523, '28.99A', 'Fabrication de machines d\'imprimerie'),
(524, '28.99B', 'Fabrication d\'autres machines specialisees'),
(525, '29.10', 'Construction de vehicules automobiles'),
(526, '29.10Z', 'Construction de vehicules automobiles'),
(527, '29.20', 'Fabrication de carrosseries et remorques'),
(528, '29.20Z', 'Fabrication de carrosseries et remorques'),
(529, '29.31', 'Fabrication d\'equipements electriques et electroniques automobiles'),
(530, '29.31Z', 'Fabrication d\'equipements electriques et electroniques automobiles'),
(531, '29.32', 'Fabrication d\'autres equipements automobiles'),
(532, '29.32Z', 'Fabrication d\'autres equipements automobiles'),
(533, '30.11', 'Construction de navires et de structures flottantes'),
(534, '30.11Z', 'Construction de navires et de structures flottantes'),
(535, '30.12', 'Construction de bateaux de plaisance'),
(536, '30.12Z', 'Construction de bateaux de plaisance'),
(537, '30.20', 'Construction de locomotives et d\'autre materiel ferroviaire roulant '),
(538, '30.20Z', 'Construction de locomotives et d\'autre materiel ferroviaire roulant '),
(539, '30.30', 'Construction aeronautique et spatiale '),
(540, '30.30Z', 'Construction aeronautique et spatiale '),
(541, '30.40', 'Construction de vehicules militaires de combat '),
(542, '30.40Z', 'Construction de vehicules militaires de combat '),
(543, '30.91', 'Fabrication de motocycles'),
(544, '30.91Z', 'Fabrication de motocycles'),
(545, '30.92', 'Fabrication de bicyclettes et de vehicules pour invalides'),
(546, '30.92Z', 'Fabrication de bicyclettes et de vehicules pour invalides'),
(547, '30.99', 'Fabrication d?autres equipements de transport n.c.a.'),
(548, '30.99Z', 'Fabrication d?autres equipements de transport n.c.a.'),
(549, '31.01', 'Fabrication de meubles de bureau et de magasin'),
(550, '31.01Z', 'Fabrication de meubles de bureau et de magasin'),
(551, '31.02', 'Fabrication de meubles de cuisine '),
(552, '31.02Z', 'Fabrication de meubles de cuisine '),
(553, '31.03', 'Fabrication de matelas'),
(554, '31.03Z', 'Fabrication de matelas'),
(555, '31.09', 'Fabrication d\'autres meubles'),
(556, '31.09A', 'Fabrication de sieges d\'ameublement d\'interieur'),
(557, '31.09B', 'Fabrication d?autres meubles et industries connexes de l?ameublement'),
(558, '32.11', 'Frappe de monnaie'),
(559, '32.11Z', 'Frappe de monnaie'),
(560, '32.12', 'Fabrication d?articles de joaillerie et bijouterie'),
(561, '32.12Z', 'Fabrication d?articles de joaillerie et bijouterie'),
(562, '32.13', 'Fabrication d?articles de bijouterie fantaisie et articles similaires'),
(563, '32.13Z', 'Fabrication d?articles de bijouterie fantaisie et articles similaires'),
(564, '32.20', 'Fabrication d\'instruments de musique'),
(565, '32.20Z', 'Fabrication d\'instruments de musique'),
(566, '32.30', 'Fabrication d\'articles de sport'),
(567, '32.30Z', 'Fabrication d\'articles de sport'),
(568, '32.40', 'Fabrication de jeux et jouets'),
(569, '32.40Z', 'Fabrication de jeux et jouets'),
(570, '32.50', 'Fabrication d\'instruments et de fournitures a usage medical et dentaire '),
(571, '32.50A', 'Fabrication de materiel medico-chirurgical et dentaire'),
(572, '32.50B', 'Fabrication de lunettes'),
(573, '32.91', 'Fabrication d?articles de brosserie'),
(574, '32.91Z', 'Fabrication d?articles de brosserie'),
(575, '32.99', 'Autres activites manufacturieres n.c.a. '),
(576, '32.99Z', 'Autres activites manufacturieres n.c.a. '),
(577, '33.11', 'Reparation d\'ouvrages en metaux'),
(578, '33.11Z', 'Reparation d\'ouvrages en metaux'),
(579, '33.12', 'Reparation de machines et equipements mecaniques'),
(580, '33.12Z', 'Reparation de machines et equipements mecaniques'),
(581, '33.13', 'Reparation de materiels electroniques et optiques'),
(582, '33.13Z', 'Reparation de materiels electroniques et optiques'),
(583, '33.14', 'Reparation d\'equipements electriques'),
(584, '33.14Z', 'Reparation d\'equipements electriques'),
(585, '33.15', 'Reparation et maintenance navale'),
(586, '33.15Z', 'Reparation et maintenance navale'),
(587, '33.16', 'Reparation et maintenance d\'aeronefs et d\'engins spatiaux '),
(588, '33.16Z', 'Reparation et maintenance d\'aeronefs et d\'engins spatiaux '),
(589, '33.17', 'Reparation et maintenance d\'autres equipements de transport'),
(590, '33.17Z', 'Reparation et maintenance d\'autres equipements de transport'),
(591, '33.19', 'Reparation d\'autres equipements'),
(592, '33.19Z', 'Reparation d\'autres equipements'),
(593, '33.20', 'Installation de machines et d\'equipements industriels'),
(594, '33.20A', 'Installation de structures metalliques, chaudronnees et de tuyauterie'),
(595, '33.20B', 'Installation de machines et equipements mecaniques'),
(596, '33.20C', 'Conception d\'ensemble et assemblage sur site industriel d\'equipements de contr?le des processus industriels '),
(597, '33.20D', 'Installation d\'equipements electriques, de materiels electroniques et optiques ou d\'autres materiels'),
(598, '35.11', 'Production d\'electricite'),
(599, '35.11Z', 'Production d\'electricite'),
(600, '35.12', 'Transport d\'electricite'),
(601, '35.12Z', 'Transport d\'electricite'),
(602, '35.13', 'Distribution d\'electricite'),
(603, '35.13Z', 'Distribution d\'electricite'),
(604, '35.14', 'Commerce d\'electricite'),
(605, '35.14Z', 'Commerce d\'electricite'),
(606, '35.21', 'Production de combustibles gazeux'),
(607, '35.21Z', 'Production de combustibles gazeux'),
(608, '35.22', 'Distribution de combustibles gazeux par conduites'),
(609, '35.22Z', 'Distribution de combustibles gazeux par conduites'),
(610, '35.23', 'Commerce de combustibles gazeux par conduites'),
(611, '35.23Z', 'Commerce de combustibles gazeux par conduites'),
(612, '35.30', 'Production et distribution de vapeur et d\'air conditionne '),
(613, '35.30Z', 'Production et distribution de vapeur et d\'air conditionne '),
(614, '36.00', 'Captage, traitement et distribution d\'eau'),
(615, '36.00Z', 'Captage, traitement et distribution d\'eau'),
(616, '37.00', 'Collecte et traitement des eaux usees'),
(617, '37.00Z', 'Collecte et traitement des eaux usees'),
(618, '38.11', 'Collecte des dechets non dangereux'),
(619, '38.11Z', 'Collecte des dechets non dangereux'),
(620, '38.12', 'Collecte des dechets dangereux'),
(621, '38.12Z', 'Collecte des dechets dangereux'),
(622, '38.21', 'Traitement et elimination des dechets non dangereux'),
(623, '38.21Z', 'Traitement et elimination des dechets non dangereux'),
(624, '38.22', 'Traitement et elimination des dechets dangereux'),
(625, '38.22Z', 'Traitement et elimination des dechets dangereux'),
(626, '38.31', 'Demantelement d\'epaves'),
(627, '38.31Z', 'Demantelement d\'epaves'),
(628, '38.32', 'Recuperation de dechets tries'),
(629, '38.32Z', 'Recuperation de dechets tries'),
(630, '39.00', 'Depollution et autres services de gestion des dechets'),
(631, '39.00Z', 'Depollution et autres services de gestion des dechets'),
(632, '41.10', 'Promotion immobiliere'),
(633, '41.10A', 'Promotion immobiliere de logements'),
(634, '41.10B', 'Promotion immobiliere de bureaux'),
(635, '41.10C', 'Promotion immobiliere d\'autres batiments'),
(636, '41.10D', 'Supports juridiques de programmes'),
(637, '41.20', 'Construction de batiments residentiels et non residentiels'),
(638, '41.20A', 'Construction de maisons individuelles'),
(639, '41.20B', 'Construction d\'autres batiments'),
(640, '42.11', 'Construction de routes et autoroutes'),
(641, '42.11Z', 'Construction de routes et autoroutes'),
(642, '42.12', 'Construction de voies ferrees de surface et souterraines'),
(643, '42.12Z', 'Construction de voies ferrees de surface et souterraines'),
(644, '42.13', 'Construction de ponts et tunnels'),
(645, '42.13A', 'Construction d\'ouvrages d\'art'),
(646, '42.13B', 'Construction et entretien de tunnels'),
(647, '42.21', 'Construction de reseaux pour fluides'),
(648, '42.21Z', 'Construction de reseaux pour fluides'),
(649, '42.22', 'Construction de reseaux electriques et de telecommunications'),
(650, '42.22Z', 'Construction de reseaux electriques et de telecommunications'),
(651, '42.91', 'Construction d\'ouvrages maritimes et fluviaux'),
(652, '42.91Z', 'Construction d\'ouvrages maritimes et fluviaux'),
(653, '42.99', 'Construction d\'autres ouvrages de genie civil n.c.a.'),
(654, '42.99Z', 'Construction d\'autres ouvrages de genie civil n.c.a.'),
(655, '43.11', 'Travaux de demolition'),
(656, '43.11Z', 'Travaux de demolition'),
(657, '43.12', 'Travaux de preparation des sites'),
(658, '43.12A', 'Travaux de terrassement courants et travaux preparatoires'),
(659, '43.12B', 'Travaux de terrassement specialises ou de grande masse'),
(660, '43.13', 'Forages et sondages'),
(661, '43.13Z', 'Forages et sondages'),
(662, '43.21', 'Installation electrique'),
(663, '43.21A', 'Travaux d\'installation electrique dans tous locaux'),
(664, '43.21B', 'Travaux d\'installation electrique sur la voie publique'),
(665, '43.22', 'Travaux de plomberie et installation de chauffage et de conditionnement d\'air'),
(666, '43.22A', 'Travaux d\'installation d\'eau et de gaz en tous locaux'),
(667, '43.22B', 'Travaux d\'installation d\'equipements thermiques et de climatisation'),
(668, '43.29', 'Autres travaux d\'installation'),
(669, '43.29A', 'Travaux d\'isolation'),
(670, '43.29B', 'Autres travaux d\'installation n.c.a.'),
(671, '43.31', 'Travaux de platrerie'),
(672, '43.31Z', 'Travaux de platrerie'),
(673, '43.32', 'Travaux de menuiserie'),
(674, '43.32A', 'Travaux de menuiserie bois et PVC'),
(675, '43.32B', 'Travaux de menuiserie metallique et serrurerie'),
(676, '43.32C', 'Agencement de lieux de vente'),
(677, '43.33', 'Travaux de revetement des sols et des murs'),
(678, '43.33Z', 'Travaux de revetement des sols et des murs'),
(679, '43.34', 'Travaux de peinture et vitrerie'),
(680, '43.34Z', 'Travaux de peinture et vitrerie'),
(681, '43.39', 'Autres travaux de finition'),
(682, '43.39Z', 'Autres travaux de finition'),
(683, '43.91', 'Travaux de couverture'),
(684, '43.91A', 'Travaux de charpente'),
(685, '43.91B', 'Travaux de couverture par elements'),
(686, '43.99', 'Autres travaux de construction specialises?n.c.a.'),
(687, '43.99A', 'Travaux d\'etancheification'),
(688, '43.99B', 'Travaux de montage de structures metalliques'),
(689, '43.99C', 'Travaux de ma?onnerie generale et gros ?uvre de batiment'),
(690, '43.99D', 'Autres travaux specialises de construction'),
(691, '43.99E', 'Location avec operateur de materiel de construction'),
(692, '45.11', 'Commerce de voitures et de vehicules automobiles legers'),
(693, '45.11Z', 'Commerce de voitures et de vehicules automobiles legers'),
(694, '45.19', 'Commerce d\'autres vehicules automobiles'),
(695, '45.19Z', 'Commerce d\'autres vehicules automobiles'),
(696, '45.20', 'Entretien et reparation de vehicules automobiles'),
(697, '45.20A', 'Entretien et reparation de vehicules automobiles legers'),
(698, '45.20B', 'Entretien et reparation d\'autres vehicules automobiles'),
(699, '45.31', 'Commerce de gros d\'equipements automobiles'),
(700, '45.31Z', 'Commerce de gros d\'equipements automobiles'),
(701, '45.32', 'Commerce de detail d\'equipements automobiles'),
(702, '45.32Z', 'Commerce de detail d\'equipements automobiles'),
(703, '45.40', 'Commerce et reparation de motocycles'),
(704, '45.40Z', 'Commerce et reparation de motocycles'),
(705, '46.11', 'Intermediaires du commerce en matieres premieres agricoles, animaux vivants, matieres premieres textiles et produits semi-finis'),
(706, '46.11Z', 'Intermediaires du commerce en matieres premieres agricoles, animaux vivants, matieres premieres textiles et produits semi-finis'),
(707, '46.12', 'Intermediaires du commerce en combustibles, metaux, mineraux et produits chimiques'),
(708, '46.12A', 'Centrales d\'achat de carburant'),
(709, '46.12B', 'Autres intermediaires du commerce en combustibles, metaux, mineraux et produits chimiques'),
(710, '46.13', 'Intermediaires du commerce en bois et materiaux de construction'),
(711, '46.13Z', 'Intermediaires du commerce en bois et materiaux de construction'),
(712, '46.14', 'Intermediaires du commerce en machines, equipements industriels, navires et avions'),
(713, '46.14Z', 'Intermediaires du commerce en machines, equipements industriels, navires et avions'),
(714, '46.15', 'Intermediaires du commerce en meubles, articles de menage et quincaillerie'),
(715, '46.15Z', 'Intermediaires du commerce en meubles, articles de menage et quincaillerie'),
(716, '46.16', 'Intermediaires du commerce en textiles, habillement, fourrures, chaussures et articles en cuir'),
(717, '46.16Z', 'Intermediaires du commerce en textiles, habillement, fourrures, chaussures et articles en cuir'),
(718, '46.17', 'Intermediaires du commerce en denrees, boissons et tabac'),
(719, '46.17A', 'Centrales d\'achat alimentaires'),
(720, '46.17B', 'Autres intermediaires du commerce en denrees, boissons et tabac'),
(721, '46.18', 'Intermediaires specialises dans le commerce d\'autres produits specifiques'),
(722, '46.18Z', 'Intermediaires specialises dans le commerce d\'autres produits specifiques'),
(723, '46.19', 'Intermediaires du commerce en produits divers'),
(724, '46.19A', 'Centrales d\'achat non alimentaires'),
(725, '46.19B', 'Autres intermediaires du commerce en produits divers'),
(726, '46.21', 'Commerce de gros de cereales, de tabac non manufacture, de semences et d\'aliments pour le betail '),
(727, '46.21Z', 'Commerce de gros (commerce interentreprises) de cereales, de tabac non manufacture, de semences et d\'aliments pour le betail '),
(728, '46.22', 'Commerce de gros de fleurs et plantes'),
(729, '46.22Z', 'Commerce de gros (commerce interentreprises) de fleurs et plantes'),
(730, '46.23', 'Commerce de gros d\'animaux vivants'),
(731, '46.23Z', 'Commerce de gros (commerce interentreprises) d\'animaux vivants'),
(732, '46.24', 'Commerce de gros de cuirs et peaux'),
(733, '46.24Z', 'Commerce de gros (commerce interentreprises) de cuirs et peaux'),
(734, '46.31', 'Commerce de gros de fruits et legumes'),
(735, '46.31Z', 'Commerce de gros (commerce interentreprises) de fruits et legumes'),
(736, '46.32', 'Commerce de gros de viandes et de produits a base de viande'),
(737, '46.32A', 'Commerce de gros (commerce interentreprises) de viandes de boucherie'),
(738, '46.32B', 'Commerce de gros (commerce interentreprises) de produits a base de viande'),
(739, '46.32C', 'Commerce de gros (commerce interentreprises) de volailles et gibier'),
(740, '46.33', 'Commerce de gros de produits laitiers, ?ufs, huiles et matieres grasses comestibles'),
(741, '46.33Z', 'Commerce de gros (commerce interentreprises) de produits laitiers, ?ufs, huiles et matieres grasses comestibles'),
(742, '46.34', 'Commerce de gros de boissons'),
(743, '46.34Z', 'Commerce de gros (commerce interentreprises) de boissons'),
(744, '46.35', 'Commerce de gros de produits a base de tabac'),
(745, '46.35Z', 'Commerce de gros (commerce interentreprises) de produits a base de tabac'),
(746, '46.36', 'Commerce de gros de sucre, chocolat et confiserie'),
(747, '46.36Z', 'Commerce de gros (commerce interentreprises) de sucre, chocolat et confiserie'),
(748, '46.37', 'Commerce de gros de cafe, the, cacao et epices'),
(749, '46.37Z', 'Commerce de gros (commerce interentreprises) de cafe, the, cacao et epices'),
(750, '46.38', 'Commerce de gros d\'autres produits alimentaires, y compris poissons, crustaces et mollusques'),
(751, '46.38A', 'Commerce de gros (commerce interentreprises) de poissons, crustaces et mollusques'),
(752, '46.38B', 'Commerce de gros (commerce interentreprises) alimentaire specialise divers'),
(753, '46.39', 'Commerce de gros non specialise de denrees, boissons et tabac'),
(754, '46.39A', 'Commerce de gros (commerce interentreprises) de produits surgeles'),
(755, '46.39B', 'Commerce de gros (commerce interentreprises) alimentaire non specialise'),
(756, '46.41', 'Commerce de gros de textiles'),
(757, '46.41Z', 'Commerce de gros (commerce interentreprises) de textiles'),
(758, '46.42', 'Commerce de gros d\'habillement et de chaussures'),
(759, '46.42Z', 'Commerce de gros (commerce interentreprises) d\'habillement et de chaussures'),
(760, '46.43', 'Commerce de gros d\'appareils electromenagers'),
(761, '46.43Z', 'Commerce de gros (commerce interentreprises) d\'appareils electromenagers'),
(762, '46.44', 'Commerce de gros de vaisselle, verrerie et produits d\'entretien'),
(763, '46.44Z', 'Commerce de gros (commerce interentreprises) de vaisselle, verrerie et produits d\'entretien'),
(764, '46.45', 'Commerce de gros de parfumerie et de produits de beaute'),
(765, '46.45Z', 'Commerce de gros (commerce interentreprises) de parfumerie et de produits de beaute'),
(766, '46.46', 'Commerce de gros de produits pharmaceutiques'),
(767, '46.46Z', 'Commerce de gros (commerce interentreprises) de produits pharmaceutiques'),
(768, '46.47', 'Commerce de gros de meubles, de tapis et d\'appareils d\'eclairage '),
(769, '46.47Z', 'Commerce de gros (commerce interentreprises) de meubles, de tapis et d\'appareils d\'eclairage '),
(770, '46.48', 'Commerce de gros d\'articles d\'horlogerie et de bijouterie'),
(771, '46.48Z', 'Commerce de gros (commerce interentreprises) d\'articles d\'horlogerie et de bijouterie'),
(772, '46.49', 'Commerce de gros d\'autres biens domestiques'),
(773, '46.49Z', 'Commerce de gros (commerce interentreprises) d\'autres biens domestiques '),
(774, '46.5', 'Commerce de gros d\'equipements de l\'information et de la communication '),
(775, '46.51', 'Commerce de gros d\'ordinateurs, d\'equipements informatiques peripheriques et de logiciels'),
(776, '46.51Z', 'Commerce de gros (commerce interentreprises) d\'ordinateurs, d\'equipements informatiques peripheriques et de logiciels'),
(777, '46.52', 'Commerce de gros de composants et d\'equipements electroniques et de telecommunication'),
(778, '46.52Z', 'Commerce de gros (commerce interentreprises) de composants et d\'equipements electroniques et de telecommunication'),
(779, '46.61', 'Commerce de gros de materiel agricole'),
(780, '46.61Z', 'Commerce de gros (commerce interentreprises) de materiel agricole'),
(781, '46.62', 'Commerce de gros de machines-outils'),
(782, '46.62Z', 'Commerce de gros (commerce interentreprises) de machines-outils'),
(783, '46.63', 'Commerce de gros de machines pour l\'extraction, la construction et le genie civil '),
(784, '46.63Z', 'Commerce de gros (commerce interentreprises) de machines pour l\'extraction, la construction et le genie civil '),
(785, '46.64', 'Commerce de gros de machines pour l\'industrie textile et l\'habillement');
INSERT INTO `ape` (`id`, `code`, `name`) VALUES
(786, '46.64Z', 'Commerce de gros (commerce interentreprises) de machines pour l\'industrie textile et l\'habillement'),
(787, '46.65', 'Commerce de gros de mobilier de bureau'),
(788, '46.65Z', 'Commerce de gros (commerce interentreprises) de mobilier de bureau'),
(789, '46.66', 'Commerce de gros d\'autres machines et equipements de bureau '),
(790, '46.66Z', 'Commerce de gros (commerce interentreprises) d\'autres machines et equipements de bureau '),
(791, '46.69', 'Commerce de gros d\'autres machines et equipements'),
(792, '46.69A', 'Commerce de gros (commerce interentreprises) de materiel electrique'),
(793, '46.69B', 'Commerce de gros (commerce interentreprises) de fournitures et equipements industriels divers'),
(794, '46.69C', 'Commerce de gros (commerce interentreprises) de fournitures et equipements divers pour le commerce et les services'),
(795, '46.71', 'Commerce de gros de combustibles et de produits annexes'),
(796, '46.71Z', 'Commerce de gros (commerce interentreprises) de combustibles et de produits annexes'),
(797, '46.72', 'Commerce de gros de minerais et metaux'),
(798, '46.72Z', 'Commerce de gros (commerce interentreprises) de minerais et metaux'),
(799, '46.73', 'Commerce de gros de bois, de materiaux de construction et d\'appareils sanitaires '),
(800, '46.73A', 'Commerce de gros (commerce interentreprises) de bois et de materiaux de construction '),
(801, '46.73B', 'Commerce de gros (commerce interentreprises) d\'appareils sanitaires et de produits de decoration'),
(802, '46.74', 'Commerce de gros de quincaillerie et fournitures pour plomberie et chauffage'),
(803, '46.74A', 'Commerce de gros (commerce interentreprises) de quincaillerie'),
(804, '46.74B', 'Commerce de gros (commerce interentreprises) de fournitures pour la plomberie et le chauffage'),
(805, '46.75', 'Commerce de gros de produits chimiques'),
(806, '46.75Z', 'Commerce de gros (commerce interentreprises) de produits chimiques'),
(807, '46.76', 'Commerce de gros d\'autres produits intermediaires'),
(808, '46.76Z', 'Commerce de gros (commerce interentreprises) d\'autres produits intermediaires'),
(809, '46.77', 'Commerce de gros de dechets et debris'),
(810, '46.77Z', 'Commerce de gros (commerce interentreprises) de dechets et debris'),
(811, '46.90', 'Commerce de gros non specialise'),
(812, '46.90Z', 'Commerce de gros (commerce interentreprises) non specialise'),
(813, '47.11', 'Commerce de detail en magasin non specialise a predominance alimentaire'),
(814, '47.11A', 'Commerce de detail de produits surgeles'),
(815, '47.11B', 'Commerce d\'alimentation generale'),
(816, '47.11C', 'Superettes'),
(817, '47.11D', 'Supermarches'),
(818, '47.11E', 'Magasins multi-commerces'),
(819, '47.11F', 'Hypermarches'),
(820, '47.19', 'Autre commerce de detail en magasin non specialise'),
(821, '47.19A', 'Grands magasins'),
(822, '47.19B', 'Autres commerces de detail en magasin non specialise'),
(823, '47.21', 'Commerce de detail de fruits et legumes en magasin specialise'),
(824, '47.21Z', 'Commerce de detail de fruits et legumes en magasin specialise'),
(825, '47.22', 'Commerce de detail de viandes et de produits a base de viande en magasin specialise'),
(826, '47.22Z', 'Commerce de detail de viandes et de produits a base de viande en magasin specialise'),
(827, '47.23', 'Commerce de detail de poissons, crustaces et mollusques en magasin specialise'),
(828, '47.23Z', 'Commerce de detail de poissons, crustaces et mollusques en magasin specialise'),
(829, '47.24', 'Commerce de detail de pain, patisserie et confiserie en magasin specialise'),
(830, '47.24Z', 'Commerce de detail de pain, patisserie et confiserie en magasin specialise'),
(831, '47.25', 'Commerce de detail de boissons en magasin specialise'),
(832, '47.25Z', 'Commerce de detail de boissons en magasin specialise'),
(833, '47.26', 'Commerce de detail de produits a base de tabac en magasin specialise'),
(834, '47.26Z', 'Commerce de detail de produits a base de tabac en magasin specialise'),
(835, '47.29', 'Autres commerces de detail alimentaires en magasin specialise '),
(836, '47.29Z', 'Autres commerces de detail alimentaires en magasin specialise '),
(837, '47.30', 'Commerce de detail de carburants en magasin specialise'),
(838, '47.30Z', 'Commerce de detail de carburants en magasin specialise'),
(839, '47.41', 'Commerce de detail d\'ordinateurs, d\'unites peripheriques et de logiciels en magasin specialise'),
(840, '47.41Z', 'Commerce de detail d\'ordinateurs, d\'unites peripheriques et de logiciels en magasin specialise'),
(841, '47.42', 'Commerce de detail de materiels de telecommunication en magasin specialise'),
(842, '47.42Z', 'Commerce de detail de materiels de telecommunication en magasin specialise'),
(843, '47.43', 'Commerce de detail de materiels audio/video en magasin specialise'),
(844, '47.43Z', 'Commerce de detail de materiels audio et video en magasin specialise'),
(845, '47.51', 'Commerce de detail de textiles en magasin specialise'),
(846, '47.51Z', 'Commerce de detail de textiles en magasin specialise'),
(847, '47.52', 'Commerce de detail de quincaillerie, peintures et verres en magasin specialise'),
(848, '47.52A', 'Commerce de detail de quincaillerie, peintures et verres en petites surfaces (moins de 400 m2)'),
(849, '47.52B', 'Commerce de detail de quincaillerie, peintures et verres en grandes surfaces (400 m2et plus)'),
(850, '47.53', 'Commerce de detail de tapis, moquettes et revetements de murs et de sols en magasin specialise'),
(851, '47.53Z', 'Commerce de detail de tapis, moquettes et revetements de murs et de sols en magasin specialise'),
(852, '47.54', 'Commerce de detail d\'appareils electromenagers en magasin specialise'),
(853, '47.54Z', 'Commerce de detail d\'appareils electromenagers en magasin specialise'),
(854, '47.59', 'Commerce de detail de meubles, appareils d\'eclairage et autres articles de menage en magasin specialise'),
(855, '47.59A', 'Commerce de detail de meubles'),
(856, '47.59B', 'Commerce de detail d\'autres equipements du foyer'),
(857, '47.61', 'Commerce de detail de livres en magasin specialise'),
(858, '47.61Z', 'Commerce de detail de livres en magasin specialise'),
(859, '47.62', 'Commerce de detail de journaux et papeterie en magasin specialise'),
(860, '47.62Z', 'Commerce de detail de journaux et papeterie en magasin specialise'),
(861, '47.63', 'Commerce de detail d\'enregistrements musicaux et video en magasin specialise'),
(862, '47.63Z', 'Commerce de detail d\'enregistrements musicaux et video en magasin specialise'),
(863, '47.64', 'Commerce de detail d\'articles de sport en magasin specialise'),
(864, '47.64Z', 'Commerce de detail d\'articles de sport en magasin specialise'),
(865, '47.65', 'Commerce de detail de jeux et jouets en magasin specialise'),
(866, '47.65Z', 'Commerce de detail de jeux et jouets en magasin specialise'),
(867, '47.71', 'Commerce de detail d\'habillement en magasin specialise'),
(868, '47.71Z', 'Commerce de detail d\'habillement en magasin specialise'),
(869, '47.72', 'Commerce de detail de chaussures et d\'articles en cuir en magasin specialise'),
(870, '47.72A', 'Commerce de detail de la chaussure'),
(871, '47.72B', 'Commerce de detail de maroquinerie et d\'articles de voyage'),
(872, '47.73', 'Commerce de detail de produits pharmaceutiques en magasin specialise'),
(873, '47.73Z', 'Commerce de detail de produits pharmaceutiques en magasin specialise'),
(874, '47.74', 'Commerce de detail d\'articles medicaux et orthopediques en magasin specialise'),
(875, '47.74Z', 'Commerce de detail d\'articles medicaux et orthopediques en magasin specialise'),
(876, '47.75', 'Commerce de detail de parfumerie et de produits de beaute en magasin specialise'),
(877, '47.75Z', 'Commerce de detail de parfumerie et de produits de beaute en magasin specialise'),
(878, '47.76', 'Commerce de detail de fleurs, plantes, graines, engrais, animaux de compagnie et aliments pour ces animaux en magasin specialise'),
(879, '47.76Z', 'Commerce de detail de fleurs, plantes, graines, engrais, animaux de compagnie et aliments pour ces animaux en magasin specialise'),
(880, '47.77', 'Commerce de detail d\'articles d\'horlogerie et de bijouterie en magasin specialise'),
(881, '47.77Z', 'Commerce de detail d\'articles d\'horlogerie et de bijouterie en magasin specialise'),
(882, '47.78', 'Autre commerce de detail de biens neufs en magasin specialise'),
(883, '47.78A', 'Commerces de detail d\'optique'),
(884, '47.78B', 'Commerces de detail de charbons et combustibles'),
(885, '47.78C', 'Autres commerces de detail specialises divers'),
(886, '47.79', 'Commerce de detail de biens d\'occasion en magasin'),
(887, '47.79Z', 'Commerce de detail de biens d\'occasion en magasin'),
(888, '47.81', 'Commerce de detail alimentaire sur eventaires et marches'),
(889, '47.81Z', 'Commerce de detail alimentaire sur eventaires et marches'),
(890, '47.82', 'Commerce de detail de textiles, d\'habillement et de chaussures sur eventaires et marches'),
(891, '47.82Z', 'Commerce de detail de textiles, d\'habillement et de chaussures sur eventaires et marches'),
(892, '47.89', 'Autres commerces de detail sur eventaires et marches'),
(893, '47.89Z', 'Autres commerces de detail sur eventaires et marches'),
(894, '47.91', 'Vente a distance'),
(895, '47.91A', 'Vente a distance sur catalogue general'),
(896, '47.91B', 'Vente a distance sur catalogue specialise'),
(897, '47.99', 'Autres commerces de detail hors magasin, eventaires ou marches'),
(898, '47.99A', 'Vente a domicile'),
(899, '47.99B', 'Vente par automates et autres commerces de detail hors magasin, eventaires ou marches n.c.a.'),
(900, '49.10', 'Transport ferroviaire interurbain de voyageurs'),
(901, '49.10Z', 'Transport ferroviaire interurbain de voyageurs'),
(902, '49.20', 'Transports ferroviaires de fret '),
(903, '49.20Z', 'Transports ferroviaires de fret '),
(904, '49.31', 'Transports urbains et suburbains de voyageurs'),
(905, '49.31Z', 'Transports urbains et suburbains de voyageurs'),
(906, '49.32', 'Transports de voyageurs par taxis'),
(907, '49.32Z', 'Transports de voyageurs par taxis'),
(908, '49.39', 'Autres transports terrestres de voyageurs n.c.a.'),
(909, '49.39A', 'Transports routiers reguliers de voyageurs'),
(910, '49.39B', 'Autres transports routiers de voyageurs '),
(911, '49.39C', 'Telepheriques et remontees mecaniques'),
(912, '49.41', 'Transports routiers de fret'),
(913, '49.41A', 'Transports routiers de fret interurbains'),
(914, '49.41B', 'Transports routiers de fret de proximite'),
(915, '49.41C', 'Location de camions avec chauffeur'),
(916, '49.42', 'Services de demenagement'),
(917, '49.42Z', 'Services de demenagement'),
(918, '49.50', 'Transports par conduites'),
(919, '49.50Z', 'Transports par conduites'),
(920, '50.10', 'Transports maritimes et c?tiers de passagers'),
(921, '50.10Z', 'Transports maritimes et c?tiers de passagers'),
(922, '50.20', 'Transports maritimes et c?tiers de fret'),
(923, '50.20Z', 'Transports maritimes et c?tiers de fret'),
(924, '50.30', 'Transports fluviaux de passagers'),
(925, '50.30Z', 'Transports fluviaux de passagers'),
(926, '50.40', 'Transports fluviaux de fret '),
(927, '50.40Z', 'Transports fluviaux de fret '),
(928, '51.10', 'Transports aeriens de passagers'),
(929, '51.10Z', 'Transports aeriens de passagers'),
(930, '51.21', 'Transports aeriens de fret'),
(931, '51.21Z', 'Transports aeriens de fret'),
(932, '51.22', 'Transports spatiaux'),
(933, '51.22Z', 'Transports spatiaux'),
(934, '52.10', 'Entreposage et stockage'),
(935, '52.10A', 'Entreposage et stockage frigorifique'),
(936, '52.10B', 'Entreposage et stockage non frigorifique'),
(937, '52.21', 'Services auxiliaires des transports terrestres'),
(938, '52.21Z', 'Services auxiliaires des transports terrestres'),
(939, '52.22', 'Services auxiliaires des transports par eau'),
(940, '52.22Z', 'Services auxiliaires des transports par eau'),
(941, '52.23', 'Services auxiliaires des transports aeriens'),
(942, '52.23Z', 'Services auxiliaires des transports aeriens'),
(943, '52.24', 'Manutention'),
(944, '52.24A', 'Manutention portuaire'),
(945, '52.24B', 'Manutention non portuaire'),
(946, '52.29', 'Autres services auxiliaires des transports '),
(947, '52.29A', 'Messagerie, fret express'),
(948, '52.29B', 'Affretement et organisation des transports '),
(949, '53.10', 'Activites de poste dans le cadre d\'une obligation de service universel '),
(950, '53.10Z', 'Activites de poste dans le cadre d\'une obligation de service universel '),
(951, '53.20', 'Autres activites de poste et de courrier'),
(952, '53.20Z', 'Autres activites de poste et de courrier'),
(953, '55.10', 'H?tels et hebergement similaire '),
(954, '55.10Z', 'H?tels et hebergement similaire '),
(955, '55.20', 'Hebergement touristique et autre hebergement de courte duree '),
(956, '55.20Z', 'Hebergement touristique et autre hebergement de courte duree '),
(957, '55.30', 'Terrains de camping et parcs pour caravanes ou vehicules de loisirs'),
(958, '55.30Z', 'Terrains de camping et parcs pour caravanes ou vehicules de loisirs'),
(959, '55.90', 'Autres hebergements '),
(960, '55.90Z', 'Autres hebergements '),
(961, '56.10', 'Restaurants et services de restauration mobile'),
(962, '56.10A', 'Restauration traditionnelle'),
(963, '56.10B', 'Cafeterias et autres libres-services'),
(964, '56.10C', 'Restauration de type rapide'),
(965, '56.21', 'Services des traiteurs '),
(966, '56.21Z', 'Services des traiteurs '),
(967, '56.29', 'Autres services de restauration '),
(968, '56.29A', 'Restauration collective sous contrat'),
(969, '56.29B', 'Autres services de restauration n.c.a.'),
(970, '56.30', 'Debits de boissons'),
(971, '56.30Z', 'Debits de boissons'),
(972, '58.11', 'edition de livres'),
(973, '58.11Z', 'edition de livres'),
(974, '58.12', 'edition de repertoires et de fichiers d\'adresses'),
(975, '58.12Z', 'edition de repertoires et de fichiers d\'adresses'),
(976, '58.13', 'edition de journaux'),
(977, '58.13Z', 'edition de journaux'),
(978, '58.14', 'edition de revues et periodiques'),
(979, '58.14Z', 'edition de revues et periodiques'),
(980, '58.19', 'Autres activites d\'edition'),
(981, '58.19Z', 'Autres activites d\'edition'),
(982, '58.21', 'edition de jeux electroniques'),
(983, '58.21Z', 'edition de jeux electroniques'),
(984, '58.29', 'edition d\'autres logiciels'),
(985, '58.29A', 'edition de logiciels systeme et de reseau'),
(986, '58.29B', 'Edition de logiciels outils de developpement et de langages'),
(987, '58.29C', 'Edition de logiciels applicatifs'),
(988, '59.11', 'Production de films cinematographiques, de video et de programmes de television '),
(989, '59.11A', 'Production de films et de programmes pour la television '),
(990, '59.11B', 'Production de films institutionnels et publicitaires'),
(991, '59.11C', 'Production de films pour le cinema'),
(992, '59.12', 'Post-production de films cinematographiques, de video et de programmes de television'),
(993, '59.12Z', 'Post-production de films cinematographiques, de video et de programmes de television'),
(994, '59.13', 'Distribution de films cinematographiques, de video et de programmes de television '),
(995, '59.13A', 'Distribution de films cinematographiques'),
(996, '59.13B', 'Edition et distribution video'),
(997, '59.14', 'Projection de films cinematographiques'),
(998, '59.14Z', 'Projection de films cinematographiques'),
(999, '59.20', 'Enregistrement sonore et edition musicale '),
(1000, '59.20Z', 'Enregistrement sonore et edition musicale '),
(1001, '60.10', 'edition et diffusion de programmes radio'),
(1002, '60.10Z', 'edition et diffusion de programmes radio'),
(1003, '60.20', 'Programmation de television et telediffusion'),
(1004, '60.20A', 'Edition de cha?nes generalistes'),
(1005, '60.20B', 'Edition de cha?nes thematiques'),
(1006, '61.10', 'Telecommunications filaires'),
(1007, '61.10Z', 'Telecommunications filaires'),
(1008, '61.20', 'Telecommunications sans fil '),
(1009, '61.20Z', 'Telecommunications sans fil '),
(1010, '61.30', 'Telecommunications par satellite'),
(1011, '61.30Z', 'Telecommunications par satellite'),
(1012, '61.90', 'Autres activites de telecommunication '),
(1013, '61.90Z', 'Autres activites de telecommunication '),
(1014, '62.01', 'Programmation informatique'),
(1015, '62.01Z', 'Programmation informatique'),
(1016, '62.02', 'Conseil informatique '),
(1017, '62.02A', 'Conseil en systemes et logiciels informatiques'),
(1018, '62.02B', 'Tierce maintenance de systemes et d?applications informatiques'),
(1019, '62.03', 'Gestion d\'installations informatiques'),
(1020, '62.03Z', 'Gestion d\'installations informatiques'),
(1021, '62.09', 'Autres activites informatiques'),
(1022, '62.09Z', 'Autres activites informatiques'),
(1023, '63.11', 'Traitement de donnees, hebergement et activites connexes'),
(1024, '63.11Z', 'Traitement de donnees, hebergement et activites connexes'),
(1025, '63.12', 'Portails Internet'),
(1026, '63.12Z', 'Portails Internet'),
(1027, '63.91', 'Activites des agences de presse'),
(1028, '63.91Z', 'Activites des agences de presse'),
(1029, '63.99', 'Autres services d\'information n.c.a.'),
(1030, '63.99Z', 'Autres services d\'information n.c.a.'),
(1031, '64.11', 'Activites de banque centrale'),
(1032, '64.11Z', 'Activites de banque centrale'),
(1033, '64.19', 'Autres intermediations monetaires'),
(1034, '64.19Z', 'Autres intermediations monetaires'),
(1035, '64.20', 'Activites des societes holding'),
(1036, '64.20Z', 'Activites des societes holding'),
(1037, '64.30', 'Fonds de placement et entites financieres similaires'),
(1038, '64.30Z', 'Fonds de placement et entites financieres similaires'),
(1039, '64.91', 'Credit-bail '),
(1040, '64.91Z', 'Credit-bail '),
(1041, '64.92', 'Autre distribution de credit'),
(1042, '64.92Z', 'Autre distribution de credit'),
(1043, '64.99', 'Autres activites des services financiers, hors assurance et caisses de retraite, n.c.a.'),
(1044, '64.99Z', 'Autres activites des services financiers, hors assurance et caisses de retraite, n.c.a.'),
(1045, '65.11', 'Assurance vie '),
(1046, '65.11Z', 'Assurance vie'),
(1047, '65.12', 'Autres assurances'),
(1048, '65.12Z', 'Autres assurances'),
(1049, '65.20', 'Reassurance'),
(1050, '65.20Z', 'Reassurance'),
(1051, '65.30', 'Caisses de retraite'),
(1052, '65.30Z', 'Caisses de retraite'),
(1053, '66.11', 'Administration de marches financiers'),
(1054, '66.11Z', 'Administration de marches financiers'),
(1055, '66.12', 'Courtage de valeurs mobilieres et de marchandises'),
(1056, '66.12Z', 'Courtage de valeurs mobilieres et de marchandises'),
(1057, '66.19', 'Autres activites auxiliaires de services financiers, hors assurance et caisses de retraite'),
(1058, '66.19A', 'Supports juridiques de gestion de patrimoine mobilier'),
(1059, '66.19B', 'Autres activites auxiliaires de services financiers, hors assurance et caisses de retraite, n.c.a.'),
(1060, '66.21', 'evaluation des risques et dommages'),
(1061, '66.21Z', 'evaluation des risques et dommages'),
(1062, '66.22', 'Activites des agents et courtiers d\'assurances'),
(1063, '66.22Z', 'Activites des agents et courtiers d\'assurances'),
(1064, '66.29', 'Autres activites auxiliaires d\'assurance et de caisses de retraite'),
(1065, '66.29Z', 'Autres activites auxiliaires d\'assurance et de caisses de retraite'),
(1066, '66.30', 'Gestion de fonds'),
(1067, '66.30Z', 'Gestion de fonds'),
(1068, '68.10', 'Activites des marchands de biens immobiliers'),
(1069, '68.10Z', 'Activites des marchands de biens immobiliers'),
(1070, '68.20', 'Location et exploitation de biens immobiliers propres ou loues '),
(1071, '68.20A', 'Location de logements'),
(1072, '68.20B', 'Location de terrains et d\'autres biens immobiliers'),
(1073, '68.31', 'Agences immobilieres'),
(1074, '68.31Z', 'Agences immobilieres'),
(1075, '68.32', 'Administration de biens immobiliers'),
(1076, '68.32A', 'Administration d\'immeubles et autres biens immobiliers'),
(1077, '68.32B', 'Supports juridiques de gestion de patrimoine immobilier'),
(1078, '69.10', 'Activites juridiques'),
(1079, '69.10Z', 'Activites juridiques'),
(1080, '69.20', 'Activites comptables'),
(1081, '69.20Z', 'Activites comptables'),
(1082, '70.10', 'Activites des sieges sociaux'),
(1083, '70.10Z', 'Activites des sieges sociaux'),
(1084, '70.21', 'Conseil en relations publiques et communication'),
(1085, '70.21Z', 'Conseil en relations publiques et communication'),
(1086, '70.22', 'Conseil pour les affaires et autres conseils de gestion'),
(1087, '70.22Z', 'Conseil pour les affaires et autres conseils de gestion'),
(1088, '71.11', 'Activites d\'architecture '),
(1089, '71.11Z', 'Activites d\'architecture '),
(1090, '71.12', 'Activites d\'ingenierie'),
(1091, '71.12A', 'Activite des geometres'),
(1092, '71.12B', 'Ingenierie, etudes techniques'),
(1093, '71.20', 'Activites de contr?le et analyses techniques'),
(1094, '71.20A', 'Contr?le technique automobile'),
(1095, '71.20B', 'Analyses, essais et inspections techniques'),
(1096, '72.11', 'Recherche-developpement en biotechnologie'),
(1097, '72.11Z', 'Recherche-developpement en biotechnologie'),
(1098, '72.19', 'Recherche-developpement en autres sciences physiques et naturelles'),
(1099, '72.19Z', 'Recherche-developpement en autres sciences physiques et naturelles'),
(1100, '72.20', 'Recherche-developpement en sciences humaines et sociales'),
(1101, '72.20Z', 'Recherche-developpement en sciences humaines et sociales'),
(1102, '73.11', 'Activites des agences de publicite'),
(1103, '73.11Z', 'Activites des agences de publicite'),
(1104, '73.12', 'Regie publicitaire de medias'),
(1105, '73.12Z', 'Regie publicitaire de medias'),
(1106, '73.20', 'etudes de marche et sondages'),
(1107, '73.20Z', 'etudes de marche et sondages'),
(1108, '74.10', 'Activites specialisees de design'),
(1109, '74.10Z', 'Activites specialisees de design'),
(1110, '74.20', 'Activites photographiques'),
(1111, '74.20Z', 'Activites photographiques'),
(1112, '74.30', 'Traduction et interpretation'),
(1113, '74.30Z', 'Traduction et interpretation'),
(1114, '74.90', 'Autres activites specialisees, scientifiques et techniques n.c.a.'),
(1115, '74.90A', 'Activite des economistes de la construction'),
(1116, '74.90B', 'Activites specialisees, scientifiques et techniques diverses'),
(1117, '75.00', 'Activites veterinaires'),
(1118, '75.00Z', 'Activites veterinaires'),
(1119, '77.11', 'Location et location-bail de voitures et de vehicules automobiles legers'),
(1120, '77.11A', 'Location de courte duree de voitures et de vehicules automobiles legers'),
(1121, '77.11B', 'Location de longue duree de voitures et de vehicules automobiles legers'),
(1122, '77.12', 'Location et location-bail de camions'),
(1123, '77.12Z', 'Location et location-bail de camions'),
(1124, '77.21', 'Location et location-bail d\'articles de loisirs et de sport '),
(1125, '77.21Z', 'Location et location-bail d\'articles de loisirs et de sport '),
(1126, '77.22', 'Location de videocassettes et disques video'),
(1127, '77.22Z', 'Location de videocassettes et disques video'),
(1128, '77.29', 'Location et location-bail d\'autres biens personnels et domestiques'),
(1129, '77.29Z', 'Location et location-bail d\'autres biens personnels et domestiques'),
(1130, '77.31', 'Location et location-bail de machines et equipements agricoles'),
(1131, '77.31Z', 'Location et location-bail de machines et equipements agricoles'),
(1132, '77.32', 'Location et location-bail de machines et equipements pour la construction'),
(1133, '77.32Z', 'Location et location-bail de machines et equipements pour la construction'),
(1134, '77.33', 'Location et location-bail de machines de bureau et de materiel informatique'),
(1135, '77.33Z', 'Location et location-bail de machines de bureau et de materiel informatique'),
(1136, '77.34', 'Location et location-bail de materiels de transport par eau'),
(1137, '77.34Z', 'Location et location-bail de materiels de transport par eau'),
(1138, '77.35', 'Location et location-bail de materiels de transport aerien'),
(1139, '77.35Z', 'Location et location-bail de materiels de transport aerien'),
(1140, '77.39', 'Location et location-bail d\'autres machines, equipements et biens materiels n.c.a. '),
(1141, '77.39Z', 'Location et location-bail d\'autres machines, equipements et biens materiels n.c.a. '),
(1142, '77.40', 'Location-bail de propriete intellectuelle et de produits similaires, a l\'exception des ?uvres soumises a copyright'),
(1143, '77.40Z', 'Location-bail de propriete intellectuelle et de produits similaires, a l\'exception des ?uvres soumises a copyright'),
(1144, '78.10', 'Activites des agences de placement de main-d\'?uvre '),
(1145, '78.10Z', 'Activites des agences de placement de main-d\'?uvre '),
(1146, '78.20', 'Activites des agences de travail temporaire '),
(1147, '78.20Z', 'Activites des agences de travail temporaire '),
(1148, '78.30', 'Autre mise a disposition de ressources humaines'),
(1149, '78.30Z', 'Autre mise a disposition de ressources humaines'),
(1150, '79.11', 'Activites des agences de voyage'),
(1151, '79.11Z', 'Activites des agences de voyage'),
(1152, '79.12', 'Activites des voyagistes'),
(1153, '79.12Z', 'Activites des voyagistes'),
(1154, '79.90', 'Autres services de reservation et activites connexes'),
(1155, '79.90Z', 'Autres services de reservation et activites connexes'),
(1156, '80.10', 'Activites de securite privee '),
(1157, '80.10Z', 'Activites de securite privee '),
(1158, '80.20', 'Activites liees aux systemes de securite '),
(1159, '80.20Z', 'Activites liees aux systemes de securite '),
(1160, '80.30', 'Activites d\'enquete'),
(1161, '80.30Z', 'Activites d\'enquete'),
(1162, '81.10', 'Activites combinees de soutien lie aux batiments '),
(1163, '81.10Z', 'Activites combinees de soutien lie aux batiments '),
(1164, '81.21', 'Nettoyage courant des batiments'),
(1165, '81.21Z', 'Nettoyage courant des batiments'),
(1166, '81.22', 'Autres activites de nettoyage des batiments et nettoyage industriel'),
(1167, '81.22Z', 'Autres activites de nettoyage des batiments et nettoyage industriel'),
(1168, '81.29', 'Autres activites de nettoyage'),
(1169, '81.29A', 'Desinfection, desinsectisation, deratisation'),
(1170, '81.29B', 'Autres activites de nettoyage n.c.a.'),
(1171, '81.30', 'Services d\'amenagement paysager '),
(1172, '81.30Z', 'Services d\'amenagement paysager '),
(1173, '82.11', 'Services administratifs combines de bureau'),
(1174, '82.11Z', 'Services administratifs combines de bureau'),
(1175, '82.19', 'Photocopie, preparation de documents et autres activites specialisees de soutien de bureau'),
(1176, '82.19Z', 'Photocopie, preparation de documents et autres activites specialisees de soutien de bureau'),
(1177, '82.20', 'Activites de centres d\'appels'),
(1178, '82.20Z', 'Activites de centres d\'appels'),
(1179, '82.30', 'Organisation de salons professionnels et congres'),
(1180, '82.30Z', 'Organisation de foires, salons professionnels et congres'),
(1181, '82.91', 'Activites des agences de recouvrement de factures et des societes d\'information financiere sur la clientele'),
(1182, '82.91Z', 'Activites des agences de recouvrement de factures et des societes d\'information financiere sur la clientele'),
(1183, '82.92', 'Activites de conditionnement'),
(1184, '82.92Z', 'Activites de conditionnement'),
(1185, '82.99', 'Autres activites de soutien aux entreprises n.c.a.'),
(1186, '82.99Z', 'Autres activites de soutien aux entreprises n.c.a.'),
(1187, '84.11', 'Administration publique generale'),
(1188, '84.11Z', 'Administration publique generale'),
(1189, '84.12', 'Administration publique (tutelle) de la sante, de la formation, de la culture et des services sociaux, autre que securite sociale '),
(1190, '84.12Z', 'Administration publique (tutelle) de la sante, de la formation, de la culture et des services sociaux, autre que securite sociale '),
(1191, '84.13', 'Administration publique (tutelle) des activites economiques'),
(1192, '84.13Z', 'Administration publique (tutelle) des activites economiques'),
(1193, '84.21', 'Affaires etrangeres'),
(1194, '84.21Z', 'Affaires etrangeres'),
(1195, '84.22', 'Defense'),
(1196, '84.22Z', 'Defense'),
(1197, '84.23', 'Justice'),
(1198, '84.23Z', 'Justice'),
(1199, '84.24', 'Activites d?ordre public et de securite'),
(1200, '84.24Z', 'Activites d?ordre public et de securite'),
(1201, '84.25', 'Services du feu et de secours'),
(1202, '84.25Z', 'Services du feu et de secours'),
(1203, '84.30', 'Securite sociale obligatoire'),
(1204, '84.30A', 'Activites generales de securite sociale'),
(1205, '84.30B', 'Gestion des retraites complementaires'),
(1206, '84.30C', 'Distribution sociale de revenus'),
(1207, '85.10', 'Enseignement pre-primaire'),
(1208, '85.10Z', 'Enseignement pre-primaire'),
(1209, '85.20', 'Enseignement primaire'),
(1210, '85.20Z', 'Enseignement primaire'),
(1211, '85.31', 'Enseignement secondaire general'),
(1212, '85.31Z', 'Enseignement secondaire general'),
(1213, '85.32', 'Enseignement secondaire technique ou professionnel'),
(1214, '85.32Z', 'Enseignement secondaire technique ou professionnel'),
(1215, '85.41', 'Enseignement post-secondaire non superieur'),
(1216, '85.41Z', 'Enseignement post-secondaire non superieur'),
(1217, '85.42', 'Enseignement superieur'),
(1218, '85.42Z', 'Enseignement superieur'),
(1219, '85.51', 'Enseignement de disciplines sportives et d\'activites de loisirs'),
(1220, '85.51Z', 'Enseignement de disciplines sportives et d\'activites de loisirs'),
(1221, '85.52', 'Enseignement culturel'),
(1222, '85.52Z', 'Enseignement culturel'),
(1223, '85.53', 'Enseignement de la conduite'),
(1224, '85.53Z', 'Enseignement de la conduite'),
(1225, '85.59', 'Enseignements divers'),
(1226, '85.59A', 'Formation continue d\'adultes'),
(1227, '85.59B', 'Autres enseignements'),
(1228, '85.60', 'Activites de soutien a l\'enseignement'),
(1229, '85.60Z', 'Activites de soutien a l\'enseignement'),
(1230, '86.10', 'Activites hospitalieres'),
(1231, '86.10Z', 'Activites hospitalieres'),
(1232, '86.21', 'Activite des medecins generalistes'),
(1233, '86.21Z', 'Activite des medecins generalistes'),
(1234, '86.22', 'Activite des medecins specialistes'),
(1235, '86.22A', 'Activites de radiodiagnostic et de radiotherapie'),
(1236, '86.22B', 'Activites chirurgicales'),
(1237, '86.22C', 'Autres activites des medecins specialistes'),
(1238, '86.23', 'Pratique dentaire'),
(1239, '86.23Z', 'Pratique dentaire'),
(1240, '86.90', 'Autres activites pour la sante humaine'),
(1241, '86.90A', 'Ambulances'),
(1242, '86.90B', 'Laboratoires d\'analyses medicales'),
(1243, '86.90C', 'Centres de collecte et banques d\'organes'),
(1244, '86.90D', 'Activites des infirmiers et des sages-femmes'),
(1245, '86.90E', 'Activites des professionnels de la reeducation, de l?appareillage et des pedicures-podologues'),
(1246, '86.90F', 'Activites de sante humaine non classees ailleurs'),
(1247, '87.10', 'Hebergement medicalise'),
(1248, '87.10A', 'Hebergement medicalise pour personnes agees'),
(1249, '87.10B', 'Hebergement medicalise pour enfants handicapes '),
(1250, '87.10C', 'Hebergement medicalise pour adultes handicapes et autre hebergement medicalise \n'),
(1251, '87.20', 'Hebergement social pour personnes handicapees mentales, malades mentales et toxicomanes'),
(1252, '87.20A', 'Hebergement social pour handicapes mentaux et malades mentaux '),
(1253, '87.20B', 'Hebergement social pour toxicomanes'),
(1254, '87.30', 'Hebergement social pour personnes agees ou handicapees physiques '),
(1255, '87.30A', 'Hebergement social pour personnes agees'),
(1256, '87.30B', 'Hebergement social pour handicapes  physiques'),
(1257, '87.90', 'Autres activites d?hebergement social '),
(1258, '87.90A', 'Hebergement social pour enfants en difficultes '),
(1259, '87.90B', 'Hebergement social pour adultes et familles en difficultes et autre hebergement social '),
(1260, '88.10', 'Action sociale sans hebergement pour personnes agees et pour personnes handicapees '),
(1261, '88.10A', 'Aide a domicile  '),
(1262, '88.10B', 'Accueil ou accompagnement sans hebergement d?adultes handicapes ou de  personnes agees'),
(1263, '88.10C', 'Aide par le travail '),
(1264, '88.91', 'Action sociale sans hebergement pour jeunes enfants'),
(1265, '88.91A', 'Accueil de jeunes enfants'),
(1266, '88.91B', 'Accueil ou accompagnement sans hebergement d?enfants handicapes'),
(1267, '88.99', 'Autre action sociale sans hebergement n.c.a.'),
(1268, '88.99A', 'Autre accueil ou accompagnement sans hebergement d?enfants\n et d?adolescents\n'),
(1269, '88.99B', 'Action sociale sans hebergement n.c.a.'),
(1270, '90.01', 'Arts du spectacle vivant'),
(1271, '90.01Z', 'Arts du spectacle vivant'),
(1272, '90.02', 'Activites de soutien au spectacle vivant'),
(1273, '90.02Z', 'Activites de soutien au spectacle vivant'),
(1274, '90.03', 'Creation artistique'),
(1275, '90.03A', 'Creation artistique relevant des arts plastiques'),
(1276, '90.03B', 'Autre creation artistique'),
(1277, '90.04', 'Gestion de salles de spectacles'),
(1278, '90.04Z', 'Gestion de salles de spectacles'),
(1279, '91.01', 'Gestion des bibliotheques et des archives'),
(1280, '91.01Z', 'Gestion des bibliotheques et des archives'),
(1281, '91.02', 'Gestion des musees'),
(1282, '91.02Z', 'Gestion des musees'),
(1283, '91.03', 'Gestion des sites et monuments historiques et des attractions touristiques similaires'),
(1284, '91.03Z', 'Gestion des sites et monuments historiques et des attractions touristiques similaires'),
(1285, '91.04', 'Gestion des jardins botaniques et zoologiques et des reserves naturelles'),
(1286, '91.04Z', 'Gestion des jardins botaniques et zoologiques et des reserves naturelles'),
(1287, '92.00', 'Organisation de jeux de hasard et d\'argent'),
(1288, '92.00Z', 'Organisation de jeux de hasard et d\'argent'),
(1289, '93.11', 'Gestion d\'installations sportives'),
(1290, '93.11Z', 'Gestion d\'installations sportives'),
(1291, '93.12', 'Activites de clubs de sports'),
(1292, '93.12Z', 'Activites de clubs de sports'),
(1293, '93.13', 'Activites des centres de culture physique'),
(1294, '93.13Z', 'Activites des centres de culture physique'),
(1295, '93.19', 'Autres activites liees au sport'),
(1296, '93.19Z', 'Autres activites liees au sport'),
(1297, '93.21', 'Activites des parcs d\'attractions et parcs a themes'),
(1298, '93.21Z', 'Activites des parcs d\'attractions et parcs a themes'),
(1299, '93.29', 'Autres activites recreatives et de loisirs '),
(1300, '93.29Z', 'Autres activites recreatives et de loisirs'),
(1301, '94.11', 'Activites des organisations patronales et consulaires'),
(1302, '94.11Z', 'Activites des organisations patronales et consulaires'),
(1303, '94.12', 'Activites des organisations professionnelles'),
(1304, '94.12Z', 'Activites des organisations professionnelles'),
(1305, '94.20', 'Activites des syndicats de salaries'),
(1306, '94.20Z', 'Activites des syndicats de salaries'),
(1307, '94.91', 'Activites des organisations religieuses'),
(1308, '94.91Z', 'Activites des organisations religieuses'),
(1309, '94.92', 'Activites des organisations politiques'),
(1310, '94.92Z', 'Activites des organisations politiques'),
(1311, '94.99', 'Activites des organisations associatives n.c.a.'),
(1312, '94.99Z', 'Autres organisations fonctionnant par adhesion volontaire'),
(1313, '95.11', 'Reparation d\'ordinateurs et d\'equipements peripheriques'),
(1314, '95.11Z', 'Reparation d\'ordinateurs et d\'equipements peripheriques'),
(1315, '95.12', 'Reparation d\'equipements de communication'),
(1316, '95.12Z', 'Reparation d\'equipements de communication'),
(1317, '95.21', 'Reparation de produits electroniques grand public'),
(1318, '95.21Z', 'Reparation de produits electroniques grand public'),
(1319, '95.22', 'Reparation d\'appareils electromenagers et d\'equipements pour la maison et le jardin'),
(1320, '95.22Z', 'Reparation d\'appareils electromenagers et d\'equipements pour la maison et le jardin'),
(1321, '95.23', 'Reparation de chaussures et d\'articles en cuir'),
(1322, '95.23Z', 'Reparation de chaussures et d\'articles en cuir'),
(1323, '95.24', 'Reparation de meubles et d\'equipements du foyer'),
(1324, '95.24Z', 'Reparation de meubles et d\'equipements du foyer'),
(1325, '95.25', 'Reparation d\'articles d\'horlogerie et de bijouterie'),
(1326, '95.25Z', 'Reparation d\'articles d\'horlogerie et de bijouterie'),
(1327, '95.29', 'Reparation d\'autres biens personnels et domestiques'),
(1328, '95.29Z', 'Reparation d\'autres biens personnels et domestiques'),
(1329, '96.01', 'Blanchisserie-teinturerie'),
(1330, '96.01A', 'Blanchisserie-teinturerie de gros'),
(1331, '96.01B', 'Blanchisserie-teinturerie de detail'),
(1332, '96.02', 'Coiffure et soins de beaute'),
(1333, '96.02A', 'Coiffure'),
(1334, '96.02B', 'Soins de beaute'),
(1335, '96.03', 'Services funeraires'),
(1336, '96.03Z', 'Services funeraires'),
(1337, '96.04', 'Entretien corporel'),
(1338, '96.04Z', 'Entretien corporel'),
(1339, '96.09', 'Autres services personnels n.c.a.'),
(1340, '96.09Z', 'Autres services personnels n.c.a.'),
(1341, '97.00', 'Activites des menages en tant qu\'employeurs de personnel domestique'),
(1342, '97.00Z', 'Activites des menages en tant qu\'employeurs de personnel domestique'),
(1343, '98.10', 'Activites indifferenciees des menages en tant que producteurs de biens pour usage propre'),
(1344, '98.10Z', 'Activites indifferenciees des menages en tant que producteurs de biens pour usage propre'),
(1345, '98.20', 'Activites indifferenciees des menages en tant que producteurs de services pour usage propre'),
(1346, '98.20Z', 'Activites indifferenciees des menages en tant que producteurs de services pour usage propre'),
(1347, '99.00', 'Activites des organisations et organismes extraterritoriaux'),
(1348, '99.00Z', 'Activites des organisations et organismes extraterritoriaux');

-- --------------------------------------------------------

--
-- Structure de la table `apeschool`
--

CREATE TABLE `apeschool` (
  `id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameape` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `apeschool`
--

INSERT INTO `apeschool` (`id`, `school_id`, `code`, `nameape`) VALUES
(1, 0, '62.01', 'Programmation informatique'),
(2, 0, '62.01Z', 'Programmation informatique');

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enterprise`
--

CREATE TABLE `enterprise` (
  `id` int(11) NOT NULL,
  `identity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ent_stud_accept`
--

CREATE TABLE `ent_stud_accept` (
  `id` int(11) NOT NULL,
  `ent_id` int(11) DEFAULT NULL,
  `stud_id` int(11) DEFAULT NULL,
  `accept` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ent_stud_accept`
--

INSERT INTO `ent_stud_accept` (`id`, `ent_id`, `stud_id`, `accept`) VALUES
(8, 1, 10, 'false'),
(9, 1, 4, 'true'),
(10, 38, 4, 'true'),
(11, 38, 10, 'true');

-- --------------------------------------------------------

--
-- Structure de la table `framework`
--

CREATE TABLE `framework` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `framework`
--

INSERT INTO `framework` (`id`, `name`) VALUES
(1, 'Bootstrap'),
(2, 'Jquery'),
(4, 'Angular'),
(5, 'React'),
(6, 'Symfony'),
(7, 'Laravel');

-- --------------------------------------------------------

--
-- Structure de la table `langages`
--

CREATE TABLE `langages` (
  `id` int(11) NOT NULL,
  `langage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `langages`
--

INSERT INTO `langages` (`id`, `langage`) VALUES
(1, 'HTML5'),
(2, 'CSS3'),
(4, 'JAVASCRIPT'),
(5, 'JQUERY'),
(6, 'PHP'),
(7, 'POO'),
(8, 'AJAX');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `title`, `content`, `user_id`, `created_at`) VALUES
(1, '', '', 1, '2020-03-09 14:14:56'),
(2, '', '', 1, '2020-03-09 14:15:27'),
(3, '', '', 1, '2020-03-09 14:16:30'),
(4, '', '', 1, '2020-03-09 14:19:52'),
(5, '', '', 1, '2020-03-09 14:20:15'),
(6, '', '', 1, '2020-03-09 14:23:15'),
(7, '', '', 1, '2020-03-09 14:25:09'),
(8, 'Message 09032020', 'zefzefzef', 1, '2020-03-09 14:28:08'),
(9, 'Message de l\'user 3', 'messaaaaaage', 3, '2020-03-09 14:29:47'),
(10, 'Message de l\'user 3', 'messaaaaaage', 3, '2020-03-09 14:33:42'),
(11, 'Message de l\'user 3', 'messaaaaaage', 3, '2020-03-09 14:35:34'),
(12, 'Message de l\'user 3', 'messaaaaaage', 3, '2020-03-09 14:35:48'),
(13, 'Message de l\'user 3', 'messaaaaaage', 3, '2020-03-09 14:36:06'),
(14, 'Message de l\'user 3', 'messaaaaaage', 3, '2020-03-09 14:36:16'),
(15, 'Message de l\'user 3', 'messaaaaaage', 3, '2020-03-09 14:36:28'),
(16, 'Message de l\'user 3', 'messaaaaaage', 3, '2020-03-09 14:37:38'),
(17, '', '', 3, '2020-03-09 14:38:42'),
(18, '', '', 3, '2020-03-09 14:39:04'),
(19, '', '', 3, '2020-03-09 14:39:17'),
(20, '', '', 3, '2020-03-09 14:40:31'),
(21, '', '', 3, '2020-03-09 14:40:51'),
(22, '', '', 3, '2020-03-09 14:41:11'),
(23, '', '', 3, '2020-03-09 14:41:34'),
(24, '', '', 3, '2020-03-09 14:41:54'),
(25, '', '', 3, '2020-03-09 14:42:10'),
(26, '', '', 3, '2020-03-09 14:45:00'),
(27, '', '', 3, '2020-03-09 14:45:34'),
(28, '', '', 3, '2020-03-09 14:46:29'),
(29, '', '', 3, '2020-03-09 14:46:53'),
(30, '', '', 3, '2020-03-09 14:47:01'),
(31, '', '', 3, '2020-03-09 14:47:08'),
(32, '', '', 3, '2020-03-09 14:47:15'),
(33, '', '', 3, '2020-03-09 14:47:25'),
(34, '', '', 3, '2020-03-09 14:47:32'),
(35, '', '', 3, '2020-03-09 14:48:57'),
(36, '', '', 3, '2020-03-09 14:49:11'),
(37, '', '', 3, '2020-03-09 14:53:59'),
(38, '', '', 3, '2020-03-09 14:55:06'),
(39, '', '', 3, '2020-03-09 15:00:00'),
(40, '', '', 3, '2020-03-09 15:08:41'),
(41, '', '', 3, '2020-03-09 15:20:38'),
(42, '', '', 3, '2020-03-09 15:21:22'),
(43, '', '', 3, '2020-03-09 15:24:11'),
(44, '10 03 2020', 'hfch,cjhcj;', 5, '2020-03-10 12:14:46'),
(45, '10 03 2020', 'hfch,cjhcj;', 5, '2020-03-10 12:17:13'),
(46, '10 030 2020', 'uyfyukeqbfujzf', 5, '2020-03-10 12:17:26'),
(47, '10 030 2020', 'uyfyukeqbfujzf', 5, '2020-03-10 12:19:02'),
(48, '10 030 2020', 'uyfyukeqbfujzf', 5, '2020-03-10 12:20:31'),
(49, '10 030 2020', 'uyfyukeqbfujzf', 5, '2020-03-10 12:20:36'),
(50, '10 030 2020', 'uyfyukeqbfujzf', 5, '2020-03-10 12:21:09'),
(51, '10 030 2020', 'uyfyukeqbfujzf', 5, '2020-03-10 12:21:38'),
(52, '10 030 2020', 'uyfyukeqbfujzf', 5, '2020-03-10 12:26:58'),
(53, 'Bonjour', 'Je suis le content', 5, '2020-03-10 12:38:51'),
(54, 'Email', 'Je suis le content', 5, '2020-03-10 12:39:40'),
(55, 'Email', 'Content email', 5, '2020-03-10 12:41:15'),
(56, 'Email', 'Content email', 5, '2020-03-10 12:42:16'),
(57, 'Email', 'Content email', 5, '2020-03-10 12:42:55'),
(58, 'Entretien 12 12 2020', 'J\'aimerai vous rencontrer dans les plus bref délais afin de ne plus me eprmettre de', 5, '2020-03-10 12:47:37'),
(59, 'Heeeeey', 'Rendez-vous le 13 Avril pourune mise en attente', 5, '2020-03-10 12:48:51'),
(60, 'Heeeeey', 'Rendez-vous le 13 Avril pourune mise en attente', 5, '2020-03-10 12:49:41'),
(61, '10 03 2020', 'Rendez-vous le 13 Avril pour une belle mise en bouche !!!!!!', 5, '2020-03-10 12:56:37'),
(62, '10 03 2020', 'Rendez-vous le 13 Avril pour une belle mise en bouche !!!!!!', 5, '2020-03-10 12:57:02'),
(63, '10 03 2020', 'Rendez-vous le 13 Avril pour une belle mise en bouche !!!!!!', 5, '2020-03-10 12:57:32'),
(64, '10 03 2020', 'Rendez-vous le 13 Avril pour une belle mise en bouche !!!!!!', 5, '2020-03-10 12:59:45'),
(65, '10 03 2020', 'Rendez-vous le 13 Avril pour une belle mise en bouche !!!!!!', 5, '2020-03-10 13:00:21'),
(66, '10 03 2020', 'Rendez-vous le 13 Avril pour une belle mise en bouche !!!!!!', 5, '2020-03-10 13:00:55'),
(67, '10 03 2020', 'Rendez-vous le 13 Avril pour une belle mise en bouche !!!!!!', 5, '2020-03-10 13:02:42'),
(68, '10 03 2020', 'Rendez-vous le 13 Avril pour une belle mise en bouche !!!!!!', 5, '2020-03-10 13:04:10'),
(69, 'Bonjour de chez JB', 'Bonjouuuuuuur de chez JB !', 7, '2020-03-10 14:48:16'),
(70, 'JORIIIIIIIS', 'JORIIIIIIISJORIIIIIIIS', 7, '2020-03-10 15:01:36'),
(71, 'JORIIIIIIIS', 'JORIIIIIIISJORIIIIIIIS', 7, '2020-03-10 15:01:42'),
(72, 'JORIIIIIIIS', 'JORIIIIIIISJORIIIIIIIS', 7, '2020-03-10 15:02:44'),
(73, 'JORIIIIIIIS', 'JORIIIIIIISJORIIIIIIIS', 7, '2020-03-10 15:03:11'),
(74, 'JORIIIIIIIS', 'JORIIIIIIISJORIIIIIIIS', 7, '2020-03-10 15:03:59'),
(75, 'Je suis le message', 'message 4', 5, '2020-03-11 17:59:18'),
(76, 'Je suis le message', 'message 4', 5, '2020-03-11 18:02:23'),
(77, '10 03 2020', 'yjfjghc yjh g', 5, '2020-03-11 18:04:58'),
(78, '10 03 2020', 'yjfjghc yjh g', 5, '2020-03-11 18:05:39'),
(79, '10 03 2020', 'yjfjghc yjh g', 5, '2020-03-11 18:06:22'),
(80, 'Message à JB', 'fzrgzerzegerggzr', 5, '2020-03-11 18:09:48'),
(81, 'Message à JB', 'fzrgzerzegerggzr', 5, '2020-03-11 18:11:06'),
(82, 'Message à JB', 'zefzrgrgrger 3333', 5, '2020-03-11 18:13:01'),
(83, 'Message à JB', 'zefzrgrgrger 3333', 5, '2020-03-11 18:20:38'),
(84, 'Message à JB', 'zefzrgrgrger 3333', 5, '2020-03-11 18:21:01'),
(85, 'Message à JB', 'zefzrgrgrger 3333', 5, '2020-03-11 18:22:33');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200309105342', '2020-03-09 10:53:50'),
('20200309130545', '2020-03-09 13:05:49'),
('20200309160155', '2020-03-09 16:02:01'),
('20200311135432', '2020-03-11 16:04:40');

-- --------------------------------------------------------

--
-- Structure de la table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `section`
--

INSERT INTO `section` (`id`, `name`, `id_school`) VALUES
(1, 'Developpeur_Web', ''),
(2, 'Cybersecurite', ''),
(3, 'Administrateur_Reseau', ''),
(4, 'Referent_digital', '');

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `uploads`
--

INSERT INTO `uploads` (`id`, `title`, `file_path`, `created_at`, `user_id`) VALUES
(1, 'Titre 1', '1583699947-Rashid-identité.png', '2020-03-03 14:47:56', 1),
(2, 'Titre 2', 'accueil.jpg', '2020-03-11 14:48:30', 2),
(3, '03030303030330', '1583764120-maquette.png', '2020-03-09 15:28:40', 4),
(4, 'Fichier test 1111', '1583764172-product2.jpg', '2020-03-09 15:29:32', 4),
(5, 'Fichier test 1111', '1583764217-maquette.png', '2020-03-09 15:30:17', 4),
(6, 'Fichier test 333333', '1583764255-the.jpg', '2020-03-09 15:30:55', 4),
(7, 'Fichier test 444', '1583764307-2.jpg', '2020-03-09 15:31:47', 4),
(8, '123456', '1583764355-product2.jpg', '2020-03-09 15:32:35', 4),
(9, 'Fichier test 6666666666', '1583764370-1.jpg', '2020-03-09 15:32:50', 4),
(10, '123456', '1583764384-product3.jpg', '2020-03-09 15:33:04', 4),
(11, '123456', '1583764405-product1.jpg', '2020-03-09 15:33:25', 4),
(12, '99999999', '1583764455-product2.jpg', '2020-03-09 15:34:15', 4),
(13, '123456', '1583766052-product1.jpg', '2020-03-09 16:00:52', 4),
(14, '8888888', '1583766229-product1.jpg', '2020-03-09 16:03:49', 4),
(15, '9999999', '1583766252-product3.jpg', '2020-03-09 16:04:12', 4),
(16, '123456', '1583766271-product3.jpg', '2020-03-09 16:04:31', 4),
(17, 'Photo profil de rashid', '1583771068-product3.jpg', '2020-03-09 17:24:28', 2),
(18, 'Photo de profil de Rashid', '1583831537-product2.jpg', '2020-03-10 10:12:17', 5),
(19, 'Photo de profil de Rashid', '1583835023-e-e-acceeent--.jpg', '2020-03-10 11:10:23', 5);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `date_registration` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `identity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress_pro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode_pro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_pro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_pro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_pro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siret` bigint(20) DEFAULT NULL,
  `siren` bigint(20) DEFAULT NULL,
  `nic` int(11) DEFAULT NULL,
  `ape_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_pro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connect` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_departement` int(11) DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ape_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `photo_profile_id` int(11) NOT NULL,
  `langages` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `framework` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `address`, `zipcode`, `city`, `phone`, `birthdate`, `mark`, `date_registration`, `email`, `password`, `web`, `github`, `roles`, `identity`, `adress_pro`, `zipcode_pro`, `city_pro`, `phone_pro`, `web_pro`, `siret`, `siren`, `nic`, `ape_code`, `section_id`, `school`, `formation`, `email_pro`, `connect`, `departement`, `code_departement`, `region`, `activite`, `ape_name`, `user_id`, `photo_profile_id`, `langages`, `framework`) VALUES
(1, 'Christophe', 'LAFFONT', NULL, NULL, NULL, '0123456789', NULL, NULL, '2020-03-09 11:59:43', 'contact@mecagri.fr', '$argon2id$v=19$m=65536,t=4,p=1$ZFZqcGlnL1FGQ3gwZ0NNcA$yNKh2OJ1Gu6TcVAMkyJMejy0jADBiY2XRbRwNBOp2/o', NULL, NULL, '[\"ROLE_ENTREPRISE\"]', 'MECAGRI MOTOCULTURE', '24 AV DE LA MOUYSSAGUESE', '31280', 'DREMIL LAFAGE', '0123456789', 'www.mecagri.fr', 45387736700020, 453877367, 20, '52.10B', NULL, NULL, NULL, 'contact@mecagri.fr', NULL, 'HAUTE-GARONNE', NULL, 'Commerce de detail d\'autres equipements du foyer en magasin specialise', NULL, 'Commerce de detail de quincaillerie, peintures et verres en petites surfaces (moins de 400 m²)', 0, 0, NULL, NULL),
(2, 'rashid', 'rashid', 'jzhzegfjagz', 31400, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 'rashid@rashid.fr', '$argon2id$v=19$m=65536,t=4,p=1$dGgvbzhMSWdNY1lUQ2lIaA$mQvG2Qbs6ELiWPZJqW7yaXf1JUoRasnZTTpL12+Bx+A', 'fqzregf', 'arzg', '[\"ROLE_STUDENT\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL),
(3, 'rashid', 'rashid', 'dczazef', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 'rashid@rashid.fr', '$argon2id$v=19$m=65536,t=4,p=1$dGgvbzhMSWdNY1lUQ2lIaA$mQvG2Qbs6ELiWPZJqW7yaXf1JUoRasnZTTpL12+Bx+A', NULL, NULL, '[\"ROLE-STUDENT\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL),
(4, 'rashid', 'rashid', 'dczazef', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 'rashid@rashid.fr', '$argon2id$v=19$m=65536,t=4,p=1$dGgvbzhMSWdNY1lUQ2lIaA$mQvG2Qbs6ELiWPZJqW7yaXf1JUoRasnZTTpL12+Bx+A', NULL, NULL, '[\"ROLE-STUDENT\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', 1, 2, NULL, NULL),
(5, 'Rashid', 'Tamb', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 'rashid@tamboura.fr', '$argon2id$v=19$m=65536,t=4,p=1$OXBwR3F5cWwzVTlhLzJ4Ng$wzgUIgKwHidrrZyM9sDooiQobHlvjYHLXPLmvQYweIU', NULL, NULL, '[\"ROLE_STUDENT\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(6, 'Rashid', 'Tamb', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-12 00:00:00', 'rashid@tamboura.fr', '$argon2id$v=19$m=65536,t=4,p=1$OXBwR3F5cWwzVTlhLzJ4Ng$wzgUIgKwHidrrZyM9sDooiQobHlvjYHLXPLmvQYweIU', NULL, NULL, '[\"ROLE_STUDENT\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL),
(7, 'Bob', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-19 14:25:08', 'bob@bob.fr', '$argon2id$v=19$m=65536,t=4,p=1$em5rRFV1WUNmcWk1UVJZNQ$Yihq7acrWO+NsGcKnccdsGbfXszd7/AP99WOIQSvbtk', NULL, NULL, '[\"ROLE_SCHOOL\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 30, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ape`
--
ALTER TABLE `ape`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `apeschool`
--
ALTER TABLE `apeschool`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enterprise`
--
ALTER TABLE `enterprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ent_stud_accept`
--
ALTER TABLE `ent_stud_accept`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `framework`
--
ALTER TABLE `framework`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `langages`
--
ALTER TABLE `langages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `ape`
--
ALTER TABLE `ape`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1349;

--
-- AUTO_INCREMENT pour la table `apeschool`
--
ALTER TABLE `apeschool`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enterprise`
--
ALTER TABLE `enterprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ent_stud_accept`
--
ALTER TABLE `ent_stud_accept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `framework`
--
ALTER TABLE `framework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `langages`
--
ALTER TABLE `langages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT pour la table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
