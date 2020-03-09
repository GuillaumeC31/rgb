-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 05 mars 2020 à 15:41
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
-- Structure de la table `framework`
--

CREATE TABLE `framework` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `langages`
--

CREATE TABLE `langages` (
  `id` int(11) NOT NULL,
  `langage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('20200304145433', '2020-03-04 15:17:13'),
('20200304145759', '2020-03-04 15:17:13'),
('20200304152032', '2020-03-04 15:20:39'),
('20200304152720', '2020-03-04 15:27:29'),
('20200304162051', '2020-03-04 16:20:58'),
('20200304211604', '2020-03-04 21:16:12'),
('20200305093606', '2020-03-05 09:37:05');

-- --------------------------------------------------------

--
-- Structure de la table `naf`
--

CREATE TABLE `naf` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `school`
--

INSERT INTO `school` (`id`, `name`) VALUES
(1, 'WEBFORCE3 TOULOUSE'),
(2, 'WEBFORCE 3 PARIS'),
(3, 'WEBFORCE 3 LYON'),
(4, 'WEBFORCE 3 BORDEAUX'),
(5, 'WEBFORCE 3 MARSEILLE');

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
(1, 'DEVELOPPEUR WEB', '1'),
(5, 'CYBERSECURITE', ''),
(6, 'ADMINISTRATEUR RESEAU', '');

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
  `section_id` int(11) DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `school` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `address`, `zipcode`, `city`, `phone`, `birthdate`, `mark`, `date_registration`, `email`, `password`, `web`, `github`, `identity`, `adress_pro`, `zipcode_pro`, `city_pro`, `phone_pro`, `web_pro`, `siret`, `siren`, `nic`, `ape_code`, `section_id`, `roles`, `school`, `formation`) VALUES
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-04 09:27:19', 'contact@mecagri.com', '$argon2id$v=19$m=65536,t=4,p=1$VHYvZHZLTy5SLlBheEFjOQ$xxDbYuloPrAsZCmYM9/OWfu8PuCCtgWezSyxNa+jLUQ', NULL, NULL, 'MECAGRI MOTOCULTURE', NULL, NULL, NULL, '0600000000', NULL, 45387736700012, NULL, NULL, NULL, NULL, '[\"ROLE_ENTREPRISE\"]', NULL, NULL),
(15, 'Jojo', 'Tartatin', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-04 12:23:02', 'jtartatin@email.fr', '$argon2id$v=19$m=65536,t=4,p=1$VHYvZHZLTy5SLlBheEFjOQ$xxDbYuloPrAsZCmYM9/OWfu8PuCCtgWezSyxNa+jLUQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"ROLE_STUDENT\"]', NULL, NULL),
(16, 'Brigitte', 'LAMAINFROIDE', '12 rue des espions', 6130, 'NICE', '0600010203', '1992-08-23', NULL, '2020-03-04 12:47:48', 'blamainfroide@email.fr', '$argon2id$v=19$m=65536,t=4,p=1$VHYvZHZLTy5SLlBheEFjOQ$xxDbYuloPrAsZCmYM9/OWfu8PuCCtgWezSyxNa+jLUQ', 'https://www.lamainfroide.pan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"ROLE_STUDENT\"]', 'WEBFORCE 3 MARSEILLE', 'CYBERSECURITE'),
(19, 'Guillaume', 'COUGET', '23 rue des Antilles', 31650, 'SAINT ORENS DE GAMEVILLE', '0620006742', '1978-02-04', 1, '2020-03-04 17:22:13', 'guillaume.couget@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$VHYvZHZLTy5SLlBheEFjOQ$xxDbYuloPrAsZCmYM9/OWfu8PuCCtgWezSyxNa+jLUQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '[\"ROLE_STUDENT\"]', 'WEBFORCE3 TOULOUSE', 'DEVELOPPEUR WEB'),
(20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-04 23:58:14', 'contact@mail.com', '$argon2id$v=19$m=65536,t=4,p=1$VHYvZHZLTy5SLlBheEFjOQ$xxDbYuloPrAsZCmYM9/OWfu8PuCCtgWezSyxNa+jLUQ', NULL, NULL, 'NOUVELLE TECHNO', NULL, NULL, NULL, '0610000000', NULL, 52831242400013, NULL, NULL, NULL, NULL, '[\"ROLE_ENTREPRISE\"]', NULL, NULL),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-05 15:24:19', 'contact@bbcinformatique.fr', '$argon2id$v=19$m=65536,t=4,p=1$bDdDSmUzcHFYSkJIS0dJbg$SXFL2kIYdQNWap1zow8PagZgK7V1Kxs1rNPA+UrS9pA', NULL, NULL, 'BBC INFORMATIQUE', NULL, NULL, NULL, '0561000010', NULL, 33077256700047, NULL, NULL, NULL, NULL, '[\"ROLE_ENTREPRISE\"]', NULL, NULL);

--
-- Index pour les tables déchargées
--

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
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36831;

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
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `naf`
--
ALTER TABLE `naf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;

--
-- AUTO_INCREMENT pour la table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
