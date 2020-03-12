-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 mars 2020 à 13:41
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
(17, 'profil_picture', '1583771068-product3.jpg', '2020-03-09 17:24:28', 2),
(18, 'profil_picture', '1583831537-product2.jpg', '2020-03-10 10:12:17', 7),
(19, 'profil_picture', '1583835023-e-e-acceeent--.jpg', '2020-03-10 11:10:23', 5),
(20, 'Nouveau fichier de Rashid', '1584004051-maquette.png1584004051-maquette-png', '2020-03-12 10:07:31', 7),
(21, '123456', '1584004078-product2.jpg1584004078-product2-jpg', '2020-03-12 10:07:58', 5),
(22, 'sethesthethethetqh', '1584004185-product2.jpg1584004185-product2-jpg', '2020-03-12 10:09:45', 5),
(23, 'profil_picture', '1584005851-logo.png', '2020-03-12 10:37:31', 5),
(24, 'profil_picture', '1584005874-the.jpg', '2020-03-12 10:37:54', 5),
(25, 'Fichier test', '1584007862-WebForce.png1584007862-webforce-png', '2020-03-12 11:11:02', 7),
(26, 'Fichier test', '1584008007-WebForce.png1584008007-webforce-png', '2020-03-12 11:13:27', 7),
(27, 'Fichier test', '1584008144-WebForce.png1584008144-webforce-png', '2020-03-12 11:15:44', 7),
(28, '123456', '1584010539-e-e-png', '2020-03-12 11:55:39', 5),
(29, 'trgtrevf', '1584010572-accueil-jpg', '2020-03-12 11:56:12', 5),
(30, 'profil_picture', '1584014415-(\'(-(e-e(-.png', '2020-03-12 13:00:15', 7),
(31, '1010101010', '1584015004-e-e-png', '2020-03-12 13:10:04', 5),
(32, 'profil_picture', '1584015025-Rashididentite.png', '2020-03-12 13:10:25', 5),
(33, 'Fichier test', '1584015788-cv-rashid-tamboura-dev-web-pdf', '2020-03-12 13:23:08', 5),
(34, 'Fichier test', '1584015828-e-e-png', '2020-03-12 13:23:48', 5),
(35, '03030303030330', '1584015934-controle-29-01-2020-pdf', '2020-03-12 13:25:34', 5),
(36, 'Fichier test 1111', '1584016020-controle-29-01-2020-pdf', '2020-03-12 13:27:00', 5),
(37, '1010101010', '1584016141-listes-des-competences-dwwm-pour-recherche-de-stage-pdf', '2020-03-12 13:29:01', 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
