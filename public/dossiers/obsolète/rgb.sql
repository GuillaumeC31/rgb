-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 02 mars 2020 à 18:04
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
-- Structure de la table `enterprise`
--

CREATE TABLE `enterprise` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `siret` bigint(20) NOT NULL,
  `siren` bigint(20) NOT NULL,
  `nic` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `naf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `denomination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_registration` datetime NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'SYMFONY'),
(2, 'ANGULAR JS'),
(3, 'REACT JS');

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
(1, 'HTML'),
(2, 'CSS'),
(3, 'JAVASCRIPT'),
(4, 'PHP');

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
('20200302141544', '2020-03-02 14:16:19'),
('20200302153523', '2020-03-02 15:36:33'),
('20200302154009', '2020-03-02 15:40:53'),
('20200302161256', '2020-03-02 16:13:07'),
('20200302161511', '2020-03-02 16:15:29'),
('20200302161845', '2020-03-02 16:18:56'),
('20200302163127', '2020-03-02 16:31:48'),
('20200302164218', '2020-03-02 16:42:31'),
('20200302165709', '2020-03-02 16:57:30'),
('20200302170153', '2020-03-02 17:02:32');

-- --------------------------------------------------------

--
-- Structure de la table `naf`
--

CREATE TABLE `naf` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `naf`
--

INSERT INTO `naf` (`id`, `code`, `content`) VALUES
(1, '0111Z', 'Culture de cereales (a l\'exception du riz), de legumineuses et de graines oleagineuses'),
(2, '0112Z', 'Culture du riz'),
(3, '0113Z', 'Culture de legumes, de melons, de racines et de tubercules'),
(4, '0114Z', 'Culture de la canne a sucre'),
(5, '0115Z', 'Culture du tabac'),
(6, '0116Z', 'Culture de plantes a fibres'),
(7, '0119Z', 'Autres cultures non permanentes'),
(8, '0121Z', 'Culture de la vigne'),
(9, '0122Z', 'Culture de fruits tropicaux et subtropicaux'),
(10, '0123Z', 'Culture d\'agrumes'),
(11, '0124Z', 'Culture de fruits a pepins et a noyau'),
(12, '0125Z', 'Culture d\'autres fruits d\'arbres ou d\'arbustes et de fruits a coque'),
(13, '0126Z', 'Culture de fruits oleagineux'),
(14, '0127Z', 'Culture de plantes a boissons'),
(15, '0128Z', 'Culture de plantes a epices, aromatiques, medicinales et pharmaceutiques'),
(16, '0129Z', 'Autres cultures permanentes'),
(17, '0130Z', 'Reproduction de plantes'),
(18, '0141Z', 'elevage de vaches laitieres'),
(19, '0142Z', 'elevage d\'autres bovins et de buffles'),
(20, '0143Z', 'elevage de chevaux et d\'autres equides'),
(21, '0144Z', 'elevage de chameaux et d\'autres camelides'),
(22, '0145Z', 'elevage d\'ovins et de caprins'),
(23, '0146Z', 'elevage de porcins'),
(24, '0147Z', 'elevage de volailles'),
(25, '0149Z', 'elevage d\'autres animaux'),
(26, '0150Z', 'Culture et elevage associes'),
(27, '0161Z', 'Activites de soutien aux cultures'),
(28, '0162Z', 'Activites de soutien a la production animale'),
(29, '0163Z', 'Traitement primaire des recoltes'),
(30, '0164Z', 'Traitement des semences'),
(31, '0170Z', 'Chasse, piegeage et services annexes'),
(32, '0210Z', 'Sylviculture et autres activites forestieres'),
(33, '0220Z', 'Exploitation forestiere'),
(34, '0230Z', 'Recolte de produits forestiers non ligneux poussant a l\'etat sauvage'),
(35, '0240Z', 'Services de soutien a l\'exploitation forestiere'),
(36, '0311Z', 'Peche en mer'),
(37, '0312Z', 'Peche en eau douce'),
(38, '0321Z', 'Aquaculture en mer'),
(39, '0322Z', 'Aquaculture en eau douce'),
(40, '0510Z', 'Extraction de houille'),
(41, '0520Z', 'Extraction de lignite'),
(42, '0610Z', 'Extraction de petrole brut'),
(43, '0620Z', 'Extraction de gaz naturel'),
(44, '0710Z', 'Extraction de minerais de fer'),
(45, '0721Z', 'Extraction de minerais d\'uranium et de thorium'),
(46, '0729Z', 'Extraction d\'autres minerais de metaux non ferreux'),
(47, '0811Z', 'Extraction de pierres ornementales et de construction, de calcaire industriel, de gypse, de craie et d\'ardoise'),
(48, '0812Z', 'Exploitation de gravieres et sablieres, extraction d?argiles et de kaolin'),
(49, '0891Z', 'Extraction des mineraux chimiques et d\'engrais mineraux '),
(50, '0892Z', 'Extraction de tourbe'),
(51, '0893Z', 'Production de sel '),
(52, '0899Z', 'Autres activites extractives n.c.a.'),
(53, '0910Z', 'Activites de soutien a l\'extraction d\'hydrocarbures'),
(54, '0990Z', 'Activites de soutien aux autres industries extractives '),
(55, '1011Z', 'Transformation et conservation de la viande de boucherie'),
(56, '1012Z', 'Transformation et conservation de la viande de volaille'),
(57, '1020Z', 'Transformation et conservation de poisson, de crustaces et de mollusques'),
(58, '1031Z', 'Transformation et conservation de pommes de terre'),
(59, '1032Z', 'Preparation de jus de fruits et legumes'),
(60, '1042Z', 'Fabrication de margarine et graisses comestibles similaires'),
(61, '1052Z', 'Fabrication de glaces et sorbets'),
(62, '1062Z', 'Fabrication de produits amylaces'),
(63, '1072Z', 'Fabrication de biscuits, biscottes et p?tisseries de conservation'),
(64, '1073Z', 'Fabrication de p?tes alimentaires'),
(65, '1081Z', 'Fabrication de sucre'),
(66, '1082Z', 'Fabrication de cacao, chocolat et de produits de confiserie'),
(67, '1083Z', 'Transformation du the et du cafe'),
(68, '1084Z', 'Fabrication de condiments et assaisonnements'),
(69, '1085Z', 'Fabrication de plats prepares'),
(70, '1086Z', 'Fabrication d\'aliments homogeneises et dietetiques'),
(71, '1089Z', 'Fabrication d\'autres produits alimentaires n.c.a.'),
(72, '1091Z', 'Fabrication d\'aliments pour animaux de ferme'),
(73, '1092Z', 'Fabrication d\'aliments pour animaux de compagnie'),
(74, '1101Z', 'Production de boissons alcooliques distillees'),
(75, '1103Z', 'Fabrication de cidre et de vins de fruits '),
(76, '1104Z', 'Production d\'autres boissons fermentees non distillees'),
(77, '1105Z', 'Fabrication de biere'),
(78, '1106Z', 'Fabrication de malt'),
(79, '1200Z', 'Fabrication de produits a base de tabac'),
(80, '1310Z', 'Preparation de fibres textiles et filature'),
(81, '1320Z', 'Tissage'),
(82, '1330Z', 'Ennoblissement textile'),
(83, '1391Z', 'Fabrication d\'etoffes a mailles'),
(84, '1392Z', 'Fabrication d\'articles textiles, sauf habillement'),
(85, '1393Z', 'Fabrication de tapis et moquettes'),
(86, '1394Z', 'Fabrication de ficelles, cordes et filets'),
(87, '1395Z', 'Fabrication de non-tisses, sauf habillement'),
(88, '1396Z', 'Fabrication d\'autres textiles techniques et industriels'),
(89, '1399Z', 'Fabrication d\'autres textiles n.c.a.'),
(90, '1411Z', 'Fabrication de vetements en cuir'),
(91, '1412Z', 'Fabrication de vetements de travail'),
(92, '1413Z', 'Fabrication de vetements de dessus'),
(93, '1414Z', 'Fabrication de vetements de dessous'),
(94, '1419Z', 'Fabrication d\'autres vetements et accessoires'),
(95, '1420Z', 'Fabrication d\'articles en fourrure'),
(96, '1431Z', 'Fabrication d\'articles chaussants a mailles'),
(97, '1439Z', 'Fabrication d\'autres articles a mailles'),
(98, '1511Z', 'Appret et tannage des cuirs ; preparation et teinture des fourrures'),
(99, '1512Z', 'Fabrication d\'articles de voyage, de maroquinerie et de sellerie'),
(100, '1520Z', 'Fabrication de chaussures'),
(101, '1621Z', 'Fabrication de placage et de panneaux de bois'),
(102, '1622Z', 'Fabrication de parquets assembles'),
(103, '1623Z', 'Fabrication de charpentes et d\'autres menuiseries'),
(104, '1624Z', 'Fabrication d\'emballages en bois'),
(105, '1629Z', 'Fabrication d\'objets divers en bois ; fabrication d\'objets en liege, vannerie et sparterie'),
(106, '1711Z', 'Fabrication de p?te a papier'),
(107, '1712Z', 'Fabrication de papier et de carton'),
(108, '1722Z', 'Fabrication d\'articles en papier a usage sanitaire ou domestique'),
(109, '1723Z', 'Fabrication d\'articles de papeterie'),
(110, '1724Z', 'Fabrication de papiers peints'),
(111, '1729Z', 'Fabrication d\'autres articles en papier ou en carton'),
(112, '1811Z', 'Imprimerie de journaux'),
(113, '1812Z', 'Autre imprimerie (labeur)'),
(114, '1813Z', 'Activites de pre-presse '),
(115, '1814Z', 'Reliure et activites connexes'),
(116, '1820Z', 'Reproduction d\'enregistrements'),
(117, '1910Z', 'Cokefaction'),
(118, '1920Z', 'Raffinage du petrole'),
(119, '2011Z', 'Fabrication de gaz industriels'),
(120, '2012Z', 'Fabrication de colorants et de pigments'),
(121, '2014Z', 'Fabrication d\'autres produits chimiques organiques de base'),
(122, '2015Z', 'Fabrication de produits azotes et d\'engrais'),
(123, '2016Z', 'Fabrication de matieres plastiques de base'),
(124, '2017Z', 'Fabrication de caoutchouc synthetique'),
(125, '2020Z', 'Fabrication de pesticides et d?autres produits agrochimiques'),
(126, '2030Z', 'Fabrication de peintures, vernis, encres et mastics'),
(127, '2041Z', 'Fabrication de savons, detergents et produits d\'entretien'),
(128, '2042Z', 'Fabrication de parfums et de produits pour la toilette'),
(129, '2051Z', 'Fabrication de produits explosifs'),
(130, '2052Z', 'Fabrication de colles'),
(131, '2053Z', 'Fabrication d\'huiles essentielles'),
(132, '2059Z', 'Fabrication d\'autres produits chimiques n.c.a.'),
(133, '2060Z', 'Fabrication de fibres artificielles ou synthetiques'),
(134, '2110Z', 'Fabrication de produits pharmaceutiques de base'),
(135, '2120Z', 'Fabrication de preparations pharmaceutiques'),
(136, '2211Z', 'Fabrication et rechapage de pneumatiques'),
(137, '2219Z', 'Fabrication d\'autres articles en caoutchouc'),
(138, '2221Z', 'Fabrication de plaques, feuilles, tubes et profiles en matieres plastiques'),
(139, '2222Z', 'Fabrication d\'emballages en matieres plastiques'),
(140, '2223Z', 'Fabrication d\'elements en matieres plastiques pour la construction'),
(141, '2311Z', 'Fabrication de verre plat'),
(142, '2312Z', 'Fa?onnage et transformation du verre plat'),
(143, '2313Z', 'Fabrication de verre creux'),
(144, '2314Z', 'Fabrication de fibres de verre'),
(145, '2319Z', 'Fabrication et fa?onnage d\'autres articles en verre, y compris verre technique'),
(146, '2320Z', 'Fabrication de produits refractaires'),
(147, '2331Z', 'Fabrication de carreaux en ceramique'),
(148, '2332Z', 'Fabrication de briques, tuiles et produits de construction, en terre cuite'),
(149, '2341Z', 'Fabrication d\'articles ceramiques a usage domestique ou ornemental'),
(150, '2342Z', 'Fabrication d\'appareils sanitaires en ceramique'),
(151, '2343Z', 'Fabrication d\'isolateurs et pieces isolantes en ceramique'),
(152, '2344Z', 'Fabrication d\'autres produits ceramiques a usage technique'),
(153, '2349Z', 'Fabrication d\'autres produits ceramiques'),
(154, '2351Z', 'Fabrication de ciment'),
(155, '2352Z', 'Fabrication de chaux et pl?tre'),
(156, '2361Z', 'Fabrication d\'elements en beton pour la construction'),
(157, '2362Z', 'Fabrication d\'elements en pl?tre pour la construction'),
(158, '2363Z', 'Fabrication de beton pret a l\'emploi'),
(159, '2364Z', 'Fabrication de mortiers et betons secs'),
(160, '2365Z', 'Fabrication d\'ouvrages en fibre-ciment'),
(161, '2369Z', 'Fabrication d\'autres ouvrages en beton, en ciment ou en pl?tre'),
(162, '2370Z', 'Taille, fa?onnage et finissage de pierres'),
(163, '2391Z', 'Fabrication de produits abrasifs'),
(164, '2399Z', 'Fabrication d\'autres produits mineraux non metalliques n.c.a.'),
(165, '2410Z', 'Siderurgie'),
(166, '2420Z', 'Fabrication de tubes, tuyaux, profiles creux et accessoires correspondants en acier '),
(167, '2431Z', 'etirage a froid de barres'),
(168, '2432Z', 'Laminage a froid de feuillards'),
(169, '2433Z', 'Profilage a froid par formage ou pliage'),
(170, '2434Z', 'Trefilage a froid'),
(171, '2441Z', 'Production de metaux precieux'),
(172, '2442Z', 'Metallurgie de l\'aluminium'),
(173, '2443Z', 'Metallurgie du plomb, du zinc ou de l\'etain'),
(174, '2444Z', 'Metallurgie du cuivre'),
(175, '2445Z', 'Metallurgie des autres metaux non ferreux'),
(176, '2446Z', 'elaboration et transformation de matieres nucleaires'),
(177, '2451Z', 'Fonderie de fonte'),
(178, '2452Z', 'Fonderie d\'acier'),
(179, '2453Z', 'Fonderie de metaux legers'),
(180, '2454Z', 'Fonderie d\'autres metaux non ferreux'),
(181, '2511Z', 'Fabrication de structures metalliques et de parties de structures'),
(182, '2512Z', 'Fabrication de portes et fenetres en metal'),
(183, '2521Z', 'Fabrication de radiateurs et de chaudieres pour le chauffage central'),
(184, '2529Z', 'Fabrication d\'autres reservoirs, citernes et conteneurs metalliques'),
(185, '2530Z', 'Fabrication de generateurs de vapeur, a l\'exception des chaudieres pour le chauffage central'),
(186, '2540Z', 'Fabrication d\'armes et de munitions'),
(187, '2561Z', 'Traitement et revetement des metaux'),
(188, '2571Z', 'Fabrication de coutellerie'),
(189, '2572Z', 'Fabrication de serrures et de ferrures'),
(190, '2591Z', 'Fabrication de f?ts et emballages metalliques similaires'),
(191, '2592Z', 'Fabrication d\'emballages metalliques legers'),
(192, '2593Z', 'Fabrication d\'articles en fils metalliques, de cha?nes et de ressorts'),
(193, '2594Z', 'Fabrication de vis et de boulons'),
(194, '2611Z', 'Fabrication de composants electroniques'),
(195, '2612Z', 'Fabrication de cartes electroniques assemblees'),
(196, '2620Z', 'Fabrication d\'ordinateurs et d\'equipements peripheriques'),
(197, '2630Z', 'Fabrication d\'equipements de communication '),
(198, '2640Z', 'Fabrication de produits electroniques grand public'),
(199, '2652Z', 'Horlogerie'),
(200, '2660Z', 'Fabrication d\'equipements d\'irradiation medicale, d\'equipements electromedicaux et electrotherapeutiques '),
(201, '2670Z', 'Fabrication de materiels optique et photographique'),
(202, '2680Z', 'Fabrication de supports magnetiques et optiques'),
(203, '2711Z', 'Fabrication de moteurs, generatrices et transformateurs electriques'),
(204, '2712Z', 'Fabrication de materiel de distribution et de commande electrique'),
(205, '2720Z', 'Fabrication de piles et d\'accumulateurs electriques'),
(206, '2731Z', 'Fabrication de c?bles de fibres optiques'),
(207, '2732Z', 'Fabrication d\'autres fils et c?bles electroniques ou electriques'),
(208, '2733Z', 'Fabrication de materiel d\'installation electrique'),
(209, '2740Z', 'Fabrication d\'appareils d\'eclairage electrique'),
(210, '2751Z', 'Fabrication d\'appareils electromenagers'),
(211, '2752Z', 'Fabrication d\'appareils menagers non electriques'),
(212, '2790Z', 'Fabrication d\'autres materiels electriques'),
(213, '2811Z', 'Fabrication de moteurs et turbines, a l\'exception des moteurs d?avions et de vehicules'),
(214, '2812Z', 'Fabrication d\'equipements hydrauliques et pneumatiques'),
(215, '2813Z', 'Fabrication d\'autres pompes et compresseurs'),
(216, '2814Z', 'Fabrication d\'autres articles de robinetterie'),
(217, '2815Z', 'Fabrication d\'engrenages et d\'organes mecaniques de transmission'),
(218, '2821Z', 'Fabrication de fours et br?leurs'),
(219, '2822Z', 'Fabrication de materiel de levage et de manutention'),
(220, '2823Z', 'Fabrication de machines et d\'equipements de bureau (a l\'exception des ordinateurs et equipements peripheriques)'),
(221, '2824Z', 'Fabrication d\'outillage portatif a moteur incorpore'),
(222, '2825Z', 'Fabrication d\'equipements aerauliques et frigorifiques industriels'),
(223, '2830Z', 'Fabrication de machines agricoles et forestieres'),
(224, '2841Z', 'Fabrication de machines-outils pour le travail des metaux'),
(225, '2849Z', 'Fabrication d\'autres machines-outils '),
(226, '2891Z', 'Fabrication de machines pour la metallurgie'),
(227, '2892Z', 'Fabrication de machines pour l\'extraction ou la construction'),
(228, '2893Z', 'Fabrication de machines pour l\'industrie agro-alimentaire'),
(229, '2894Z', 'Fabrication de machines pour les industries textiles'),
(230, '2895Z', 'Fabrication de machines pour les industries du papier et du carton'),
(231, '2896Z', 'Fabrication de machines pour le travail du caoutchouc ou des plastiques'),
(232, '2910Z', 'Construction de vehicules automobiles'),
(233, '2920Z', 'Fabrication de carrosseries et remorques'),
(234, '2931Z', 'Fabrication d\'equipements electriques et electroniques automobiles'),
(235, '2932Z', 'Fabrication d\'autres equipements automobiles'),
(236, '3011Z', 'Construction de navires et de structures flottantes'),
(237, '3012Z', 'Construction de bateaux de plaisance'),
(238, '3020Z', 'Construction de locomotives et d\'autre materiel ferroviaire roulant '),
(239, '3030Z', 'Construction aeronautique et spatiale '),
(240, '3040Z', 'Construction de vehicules militaires de combat '),
(241, '3091Z', 'Fabrication de motocycles'),
(242, '3092Z', 'Fabrication de bicyclettes et de vehicules pour invalides'),
(243, '3099Z', 'Fabrication d?autres equipements de transport n.c.a.'),
(244, '3101Z', 'Fabrication de meubles de bureau et de magasin'),
(245, '3102Z', 'Fabrication de meubles de cuisine '),
(246, '3103Z', 'Fabrication de matelas'),
(247, '3211Z', 'Frappe de monnaie'),
(248, '3212Z', 'Fabrication d?articles de joaillerie et bijouterie'),
(249, '3213Z', 'Fabrication d?articles de bijouterie fantaisie et articles similaires'),
(250, '3220Z', 'Fabrication d\'instruments de musique'),
(251, '3230Z', 'Fabrication d\'articles de sport'),
(252, '3240Z', 'Fabrication de jeux et jouets'),
(253, '3291Z', 'Fabrication d?articles de brosserie'),
(254, '3299Z', 'Autres activites manufacturieres n.c.a. '),
(255, '3311Z', 'Reparation d\'ouvrages en metaux'),
(256, '3312Z', 'Reparation de machines et equipements mecaniques'),
(257, '3313Z', 'Reparation de materiels electroniques et optiques'),
(258, '3314Z', 'Reparation d\'equipements electriques'),
(259, '3315Z', 'Reparation et maintenance navale'),
(260, '3316Z', 'Reparation et maintenance d\'aeronefs et d\'engins spatiaux '),
(261, '3317Z', 'Reparation et maintenance d\'autres equipements de transport'),
(262, '3319Z', 'Reparation d\'autres equipements'),
(263, '3511Z', 'Production d\'electricite'),
(264, '3512Z', 'Transport d\'electricite'),
(265, '3513Z', 'Distribution d\'electricite'),
(266, '3514Z', 'Commerce d\'electricite'),
(267, '3521Z', 'Production de combustibles gazeux'),
(268, '3522Z', 'Distribution de combustibles gazeux par conduites'),
(269, '3523Z', 'Commerce de combustibles gazeux par conduites'),
(270, '3530Z', 'Production et distribution de vapeur et d\'air conditionne '),
(271, '3600Z', 'Captage, traitement et distribution d\'eau'),
(272, '3700Z', 'Collecte et traitement des eaux usees'),
(273, '3811Z', 'Collecte des dechets non dangereux'),
(274, '3812Z', 'Collecte des dechets dangereux'),
(275, '3821Z', 'Traitement et elimination des dechets non dangereux'),
(276, '3822Z', 'Traitement et elimination des dechets dangereux'),
(277, '3831Z', 'Demantelement d\'epaves'),
(278, '3832Z', 'Recuperation de dechets tries'),
(279, '3900Z', 'Depollution et autres services de gestion des dechets'),
(280, '4211Z', 'Construction de routes et autoroutes'),
(281, '4212Z', 'Construction de voies ferrees de surface et souterraines'),
(282, '4221Z', 'Construction de reseaux pour fluides'),
(283, '4222Z', 'Construction de reseaux electriques et de telecommunications'),
(284, '4291Z', 'Construction d\'ouvrages maritimes et fluviaux'),
(285, '4299Z', 'Construction d\'autres ouvrages de genie civil n.c.a.'),
(286, '4311Z', 'Travaux de demolition'),
(287, '4313Z', 'Forages et sondages'),
(288, '4331Z', 'Travaux de pl?trerie'),
(289, '4333Z', 'Travaux de revetement des sols et des murs'),
(290, '4334Z', 'Travaux de peinture et vitrerie'),
(291, '4339Z', 'Autres travaux de finition'),
(292, '4511Z', 'Commerce de voitures et de vehicules automobiles legers'),
(293, '4519Z', 'Commerce d\'autres vehicules automobiles'),
(294, '4531Z', 'Commerce de gros d\'equipements automobiles'),
(295, '4532Z', 'Commerce de detail d\'equipements automobiles'),
(296, '4540Z', 'Commerce et reparation de motocycles'),
(297, '4611Z', 'Intermediaires du commerce en matieres premieres agricoles, animaux vivants, matieres premieres textiles et produits semi-finis'),
(298, '4613Z', 'Intermediaires du commerce en bois et materiaux de construction'),
(299, '4614Z', 'Intermediaires du commerce en machines, equipements industriels, navires et avions'),
(300, '4615Z', 'Intermediaires du commerce en meubles, articles de menage et quincaillerie'),
(301, '4616Z', 'Intermediaires du commerce en textiles, habillement, fourrures, chaussures et articles en cuir'),
(302, '4618Z', 'Intermediaires specialises dans le commerce d\'autres produits specifiques'),
(303, '4621Z', 'Commerce de gros (commerce interentreprises) de cereales, de tabac non manufacture, de semences et d\'aliments pour le betail '),
(304, '4622Z', 'Commerce de gros (commerce interentreprises) de fleurs et plantes'),
(305, '4623Z', 'Commerce de gros (commerce interentreprises) d\'animaux vivants'),
(306, '4624Z', 'Commerce de gros (commerce interentreprises) de cuirs et peaux'),
(307, '4631Z', 'Commerce de gros (commerce interentreprises) de fruits et legumes'),
(308, '4633Z', 'Commerce de gros (commerce interentreprises) de produits laitiers, ?ufs, huiles et matieres grasses comestibles'),
(309, '4634Z', 'Commerce de gros (commerce interentreprises) de boissons'),
(310, '4635Z', 'Commerce de gros (commerce interentreprises) de produits a base de tabac'),
(311, '4636Z', 'Commerce de gros (commerce interentreprises) de sucre, chocolat et confiserie'),
(312, '4637Z', 'Commerce de gros (commerce interentreprises) de cafe, the, cacao et epices'),
(313, '4641Z', 'Commerce de gros (commerce interentreprises) de textiles'),
(314, '4642Z', 'Commerce de gros (commerce interentreprises) d\'habillement et de chaussures'),
(315, '4643Z', 'Commerce de gros (commerce interentreprises) d\'appareils electromenagers'),
(316, '4644Z', 'Commerce de gros (commerce interentreprises) de vaisselle, verrerie et produits d\'entretien'),
(317, '4645Z', 'Commerce de gros (commerce interentreprises) de parfumerie et de produits de beaute'),
(318, '4646Z', 'Commerce de gros (commerce interentreprises) de produits pharmaceutiques'),
(319, '4647Z', 'Commerce de gros (commerce interentreprises) de meubles, de tapis et d\'appareils d\'eclairage '),
(320, '4648Z', 'Commerce de gros (commerce interentreprises) d\'articles d\'horlogerie et de bijouterie'),
(321, '4649Z', 'Commerce de gros (commerce interentreprises) d\'autres biens domestiques '),
(322, '4651Z', 'Commerce de gros (commerce interentreprises) d\'ordinateurs, d\'equipements informatiques peripheriques et de logiciels'),
(323, '4652Z', 'Commerce de gros (commerce interentreprises) de composants et d\'equipements electroniques et de telecommunication'),
(324, '4661Z', 'Commerce de gros (commerce interentreprises) de materiel agricole'),
(325, '4662Z', 'Commerce de gros (commerce interentreprises) de machines-outils'),
(326, '4663Z', 'Commerce de gros (commerce interentreprises) de machines pour l\'extraction, la construction et le genie civil '),
(327, '4664Z', 'Commerce de gros (commerce interentreprises) de machines pour l\'industrie textile et l\'habillement'),
(328, '4665Z', 'Commerce de gros (commerce interentreprises) de mobilier de bureau'),
(329, '4666Z', 'Commerce de gros (commerce interentreprises) d\'autres machines et equipements de bureau '),
(330, '4671Z', 'Commerce de gros (commerce interentreprises) de combustibles et de produits annexes'),
(331, '4672Z', 'Commerce de gros (commerce interentreprises) de minerais et metaux'),
(332, '4675Z', 'Commerce de gros (commerce interentreprises) de produits chimiques'),
(333, '4676Z', 'Commerce de gros (commerce interentreprises) d\'autres produits intermediaires'),
(334, '4677Z', 'Commerce de gros (commerce interentreprises) de dechets et debris'),
(335, '4690Z', 'Commerce de gros (commerce interentreprises) non specialise'),
(336, '4721Z', 'Commerce de detail de fruits et legumes en magasin specialise'),
(337, '4722Z', 'Commerce de detail de viandes et de produits a base de viande en magasin specialise'),
(338, '4723Z', 'Commerce de detail de poissons, crustaces et mollusques en magasin specialise'),
(339, '4724Z', 'Commerce de detail de pain, p?tisserie et confiserie en magasin specialise'),
(340, '4725Z', 'Commerce de detail de boissons en magasin specialise'),
(341, '4726Z', 'Commerce de detail de produits a base de tabac en magasin specialise'),
(342, '4729Z', 'Autres commerces de detail alimentaires en magasin specialise '),
(343, '4730Z', 'Commerce de detail de carburants en magasin specialise'),
(344, '4741Z', 'Commerce de detail d\'ordinateurs, d\'unites peripheriques et de logiciels en magasin specialise'),
(345, '4742Z', 'Commerce de detail de materiels de telecommunication en magasin specialise'),
(346, '4743Z', 'Commerce de detail de materiels audio et video en magasin specialise'),
(347, '4751Z', 'Commerce de detail de textiles en magasin specialise'),
(348, '4753Z', 'Commerce de detail de tapis, moquettes et revetements de murs et de sols en magasin specialise'),
(349, '4754Z', 'Commerce de detail d\'appareils electromenagers en magasin specialise'),
(350, '4761Z', 'Commerce de detail de livres en magasin specialise'),
(351, '4762Z', 'Commerce de detail de journaux et papeterie en magasin specialise'),
(352, '4763Z', 'Commerce de detail d\'enregistrements musicaux et video en magasin specialise'),
(353, '4764Z', 'Commerce de detail d\'articles de sport en magasin specialise'),
(354, '4765Z', 'Commerce de detail de jeux et jouets en magasin specialise'),
(355, '4771Z', 'Commerce de detail d\'habillement en magasin specialise'),
(356, '4773Z', 'Commerce de detail de produits pharmaceutiques en magasin specialise'),
(357, '4774Z', 'Commerce de detail d\'articles medicaux et orthopediques en magasin specialise'),
(358, '4775Z', 'Commerce de detail de parfumerie et de produits de beaute en magasin specialise'),
(359, '4776Z', 'Commerce de detail de fleurs, plantes, graines, engrais, animaux de compagnie et aliments pour ces animaux en magasin specialise'),
(360, '4777Z', 'Commerce de detail d\'articles d\'horlogerie et de bijouterie en magasin specialise'),
(361, '4779Z', 'Commerce de detail de biens d\'occasion en magasin'),
(362, '4781Z', 'Commerce de detail alimentaire sur eventaires et marches'),
(363, '4782Z', 'Commerce de detail de textiles, d\'habillement et de chaussures sur eventaires et marches'),
(364, '4789Z', 'Autres commerces de detail sur eventaires et marches'),
(365, '4910Z', 'Transport ferroviaire interurbain de voyageurs'),
(366, '4920Z', 'Transports ferroviaires de fret '),
(367, '4931Z', 'Transports urbains et suburbains de voyageurs'),
(368, '4932Z', 'Transports de voyageurs par taxis'),
(369, '4942Z', 'Services de demenagement'),
(370, '4950Z', 'Transports par conduites'),
(371, '5010Z', 'Transports maritimes et c?tiers de passagers'),
(372, '5020Z', 'Transports maritimes et c?tiers de fret'),
(373, '5030Z', 'Transports fluviaux de passagers'),
(374, '5040Z', 'Transports fluviaux de fret '),
(375, '5110Z', 'Transports aeriens de passagers'),
(376, '5121Z', 'Transports aeriens de fret'),
(377, '5122Z', 'Transports spatiaux'),
(378, '5221Z', 'Services auxiliaires des transports terrestres'),
(379, '5222Z', 'Services auxiliaires des transports par eau'),
(380, '5223Z', 'Services auxiliaires des transports aeriens'),
(381, '5310Z', 'Activites de poste dans le cadre d\'une obligation de service universel '),
(382, '5320Z', 'Autres activites de poste et de courrier'),
(383, '5510Z', 'H?tels et hebergement similaire '),
(384, '5520Z', 'Hebergement touristique et autre hebergement de courte duree '),
(385, '5530Z', 'Terrains de camping et parcs pour caravanes ou vehicules de loisirs'),
(386, '5590Z', 'Autres hebergements '),
(387, '5621Z', 'Services des traiteurs '),
(388, '5630Z', 'Debits de boissons'),
(389, '5811Z', 'edition de livres'),
(390, '5812Z', 'edition de repertoires et de fichiers d\'adresses'),
(391, '5813Z', 'edition de journaux'),
(392, '5814Z', 'edition de revues et periodiques'),
(393, '5819Z', 'Autres activites d\'edition'),
(394, '5821Z', 'edition de jeux electroniques'),
(395, '5912Z', 'Post-production de films cinematographiques, de video et de programmes de television'),
(396, '5914Z', 'Projection de films cinematographiques'),
(397, '5920Z', 'Enregistrement sonore et edition musicale '),
(398, '6010Z', 'edition et diffusion de programmes radio'),
(399, '6110Z', 'Telecommunications filaires'),
(400, '6120Z', 'Telecommunications sans fil '),
(401, '6130Z', 'Telecommunications par satellite'),
(402, '6190Z', 'Autres activites de telecommunication '),
(403, '6201Z', 'Programmation informatique'),
(404, '6203Z', 'Gestion d\'installations informatiques'),
(405, '6209Z', 'Autres activites informatiques'),
(406, '6311Z', 'Traitement de donnees, hebergement et activites connexes'),
(407, '6312Z', 'Portails Internet'),
(408, '6391Z', 'Activites des agences de presse'),
(409, '6399Z', 'Autres services d\'information n.c.a.'),
(410, '6411Z', 'Activites de banque centrale'),
(411, '6419Z', 'Autres intermediations monetaires'),
(412, '6420Z', 'Activites des societes holding'),
(413, '6430Z', 'Fonds de placement et entites financieres similaires'),
(414, '6491Z', 'Credit-bail '),
(415, '6492Z', 'Autre distribution de credit'),
(416, '6499Z', 'Autres activites des services financiers, hors assurance et caisses de retraite, n.c.a.'),
(417, '6511Z', 'Assurance vie'),
(418, '6512Z', 'Autres assurances'),
(419, '6520Z', 'Reassurance'),
(420, '6530Z', 'Caisses de retraite'),
(421, '6611Z', 'Administration de marches financiers'),
(422, '6612Z', 'Courtage de valeurs mobilieres et de marchandises'),
(423, '6621Z', 'evaluation des risques et dommages'),
(424, '6622Z', 'Activites des agents et courtiers d\'assurances'),
(425, '6629Z', 'Autres activites auxiliaires d\'assurance et de caisses de retraite'),
(426, '6630Z', 'Gestion de fonds'),
(427, '6810Z', 'Activites des marchands de biens immobiliers'),
(428, '6831Z', 'Agences immobilieres'),
(429, '6910Z', 'Activites juridiques'),
(430, '6920Z', 'Activites comptables'),
(431, '7010Z', 'Activites des sieges sociaux'),
(432, '7021Z', 'Conseil en relations publiques et communication'),
(433, '7022Z', 'Conseil pour les affaires et autres conseils de gestion'),
(434, '7111Z', 'Activites d\'architecture '),
(435, '7211Z', 'Recherche-developpement en biotechnologie'),
(436, '7219Z', 'Recherche-developpement en autres sciences physiques et naturelles'),
(437, '7220Z', 'Recherche-developpement en sciences humaines et sociales'),
(438, '7311Z', 'Activites des agences de publicite'),
(439, '7312Z', 'Regie publicitaire de medias'),
(440, '7320Z', 'etudes de marche et sondages'),
(441, '7410Z', 'Activites specialisees de design'),
(442, '7420Z', 'Activites photographiques'),
(443, '7430Z', 'Traduction et interpretation'),
(444, '7500Z', 'Activites veterinaires'),
(445, '7712Z', 'Location et location-bail de camions'),
(446, '7721Z', 'Location et location-bail d\'articles de loisirs et de sport '),
(447, '7722Z', 'Location de videocassettes et disques video'),
(448, '7729Z', 'Location et location-bail d\'autres biens personnels et domestiques'),
(449, '7731Z', 'Location et location-bail de machines et equipements agricoles'),
(450, '7732Z', 'Location et location-bail de machines et equipements pour la construction'),
(451, '7733Z', 'Location et location-bail de machines de bureau et de materiel informatique'),
(452, '7734Z', 'Location et location-bail de materiels de transport par eau'),
(453, '7735Z', 'Location et location-bail de materiels de transport aerien'),
(454, '7739Z', 'Location et location-bail d\'autres machines, equipements et biens materiels n.c.a. '),
(455, '7740Z', 'Location-bail de propriete intellectuelle et de produits similaires, a l\'exception des ?uvres soumises a copyright'),
(456, '7810Z', 'Activites des agences de placement de main-d\'?uvre '),
(457, '7820Z', 'Activites des agences de travail temporaire '),
(458, '7830Z', 'Autre mise a disposition de ressources humaines'),
(459, '7911Z', 'Activites des agences de voyage'),
(460, '7912Z', 'Activites des voyagistes'),
(461, '7990Z', 'Autres services de reservation et activites connexes'),
(462, '8010Z', 'Activites de securite privee '),
(463, '8020Z', 'Activites liees aux systemes de securite '),
(464, '8030Z', 'Activites d\'enquete'),
(465, '8110Z', 'Activites combinees de soutien lie aux b?timents '),
(466, '8121Z', 'Nettoyage courant des b?timents'),
(467, '8122Z', 'Autres activites de nettoyage des b?timents et nettoyage industriel'),
(468, '8130Z', 'Services d\'amenagement paysager '),
(469, '8211Z', 'Services administratifs combines de bureau'),
(470, '8219Z', 'Photocopie, preparation de documents et autres activites specialisees de soutien de bureau'),
(471, '8220Z', 'Activites de centres d\'appels'),
(472, '8230Z', 'Organisation de foires, salons professionnels et congres'),
(473, '8291Z', 'Activites des agences de recouvrement de factures et des societes d\'information financiere sur la clientele'),
(474, '8292Z', 'Activites de conditionnement'),
(475, '8299Z', 'Autres activites de soutien aux entreprises n.c.a.'),
(476, '8411Z', 'Administration publique generale'),
(477, '8412Z', 'Administration publique (tutelle) de la sante, de la formation, de la culture et des services sociaux, autre que securite sociale '),
(478, '8413Z', 'Administration publique (tutelle) des activites economiques'),
(479, '8421Z', 'Affaires etrangeres'),
(480, '8422Z', 'Defense'),
(481, '8423Z', 'Justice'),
(482, '8424Z', 'Activites d?ordre public et de securite'),
(483, '8425Z', 'Services du feu et de secours'),
(484, '8510Z', 'Enseignement pre-primaire'),
(485, '8520Z', 'Enseignement primaire'),
(486, '8531Z', 'Enseignement secondaire general'),
(487, '8532Z', 'Enseignement secondaire technique ou professionnel'),
(488, '8541Z', 'Enseignement post-secondaire non superieur'),
(489, '8542Z', 'Enseignement superieur'),
(490, '8551Z', 'Enseignement de disciplines sportives et d\'activites de loisirs'),
(491, '8552Z', 'Enseignement culturel'),
(492, '8553Z', 'Enseignement de la conduite'),
(493, '8560Z', 'Activites de soutien a l\'enseignement'),
(494, '8610Z', 'Activites hospitalieres'),
(495, '8621Z', 'Activite des medecins generalistes'),
(496, '8623Z', 'Pratique dentaire'),
(497, '9001Z', 'Arts du spectacle vivant'),
(498, '9002Z', 'Activites de soutien au spectacle vivant'),
(499, '9004Z', 'Gestion de salles de spectacles'),
(500, '9101Z', 'Gestion des bibliotheques et des archives'),
(501, '9102Z', 'Gestion des musees'),
(502, '9103Z', 'Gestion des sites et monuments historiques et des attractions touristiques similaires'),
(503, '9104Z', 'Gestion des jardins botaniques et zoologiques et des reserves naturelles'),
(504, '9200Z', 'Organisation de jeux de hasard et d\'argent'),
(505, '9311Z', 'Gestion d\'installations sportives'),
(506, '9312Z', 'Activites de clubs de sports'),
(507, '9313Z', 'Activites des centres de culture physique'),
(508, '9319Z', 'Autres activites liees au sport'),
(509, '9321Z', 'Activites des parcs d\'attractions et parcs a themes'),
(510, '9329Z', 'Autres activites recreatives et de loisirs'),
(511, '9411Z', 'Activites des organisations patronales et consulaires'),
(512, '9412Z', 'Activites des organisations professionnelles'),
(513, '9420Z', 'Activites des syndicats de salaries'),
(514, '9491Z', 'Activites des organisations religieuses'),
(515, '9492Z', 'Activites des organisations politiques'),
(516, '9499Z', 'Autres organisations fonctionnant par adhesion volontaire'),
(517, '9511Z', 'Reparation d\'ordinateurs et d\'equipements peripheriques'),
(518, '9512Z', 'Reparation d\'equipements de communication'),
(519, '9521Z', 'Reparation de produits electroniques grand public'),
(520, '9522Z', 'Reparation d\'appareils electromenagers et d\'equipements pour la maison et le jardin'),
(521, '9523Z', 'Reparation de chaussures et d\'articles en cuir'),
(522, '9524Z', 'Reparation de meubles et d\'equipements du foyer'),
(523, '9525Z', 'Reparation d\'articles d\'horlogerie et de bijouterie'),
(524, '9529Z', 'Reparation d\'autres biens personnels et domestiques'),
(525, '9603Z', 'Services funeraires'),
(526, '9604Z', 'Entretien corporel'),
(527, '9609Z', 'Autres services personnels n.c.a.'),
(528, '9700Z', 'Activites des menages en tant qu\'employeurs de personnel domestique'),
(529, '9810Z', 'Activites indifferenciees des menages en tant que producteurs de biens pour usage propre'),
(530, '9820Z', 'Activites indifferenciees des menages en tant que producteurs de services pour usage propre'),
(531, '9900Z', 'Activites des organisations et organismes extraterritoriaux');

-- --------------------------------------------------------

--
-- Structure de la table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `school`
--

INSERT INTO `school` (`id`, `name`, `address`, `zipcode`, `city`, `phone`, `email`, `password`) VALUES
(1, 'WebForce 3', '244 route de SEYSSES', '31100', 'TOULOUSE', 0, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_registration` datetime NOT NULL,
  `id_section` int(11) NOT NULL,
  `id_school` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `enterprise`
--
ALTER TABLE `enterprise`
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
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `naf`
--
ALTER TABLE `naf`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `enterprise`
--
ALTER TABLE `enterprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `framework`
--
ALTER TABLE `framework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `langages`
--
ALTER TABLE `langages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `naf`
--
ALTER TABLE `naf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;

--
-- AUTO_INCREMENT pour la table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
