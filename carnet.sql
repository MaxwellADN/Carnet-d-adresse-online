-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 29 Septembre 2015 à 01:04
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `carnet`
--

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE IF NOT EXISTS `membre` (
`id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `siteweb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `email`, `adresse`, `tel`, `siteweb`, `utilisateur_id`) VALUES
(4, 'nomtest', 'prenomtest', 'email@test.fr', '45 boulevard chilpéric\r\nApp 506', '06235215487', 'personumericable.fr/admaxwell', 8),
(5, 'nomtest--2', 'prenomtest2', 'email2@test.fr', '45 boulevard chilpéric\r\nApp 506', '0777968320', 'personumericable.fr/admaxwell', 6),
(6, 'examplemembre', 'prenomexample', 'mail@mail.fr', '45 boulevard chilpéric', '0777968320', 'personumericable.fr/admaxwell', 6),
(7, 'nomtest4', 'prenomtest4', 'maxwellbigmax@yahoo.fr', '45 boulevard chilpéric\r\nApp 506', '0777968320', 'personumericable.fr/admaxwell', 6),
(8, 'nomtest5', 'prenomtest6', 'mail@mail.fr', '45 boulevard chilpéric\r\nApp 506', '06235215487', 'personumericable.fr/admaxwell', 6);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
`id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(5, 'test', 'test', 'test@mail.fr', 'test@mail.fr', 1, 'poln8vb8wb48844sgg044c0kocsg00g', 'passwordtest{poln8vb8wb48844sgg044c0kocsg00g}', '2015-08-20 02:51:42', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(6, 'admintest', 'admintest', 'admin@mail.fr', 'admin@mail.fr', 1, 'jax0onn0vq8g4csgk4kgk0wg0wkkok8', 'passwordadmin{jax0onn0vq8g4csgk4kgk0wg0wkkok8}', '2015-09-28 22:44:47', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(7, 'test3', 'test3', 'test3@mail.fr', 'test3@mail.fr', 1, 'czm5j9au5dwgwcwww0gc0gw88kogs8o', 'pass3{czm5j9au5dwgwcwww0gc0gw88kogs8o}', '2015-08-22 05:44:40', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(8, 'test4', 'test4', 'test4@mail.fr', 'test4@mail.fr', 1, 'o31ytpk09o0s4k00wk8c8c04wckww0s', 'pass4{o31ytpk09o0s4k00wk8c8c04wckww0s}', '2015-08-22 07:54:39', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(9, 'test5', 'test5', 'test5@mail.fr', 'test5@mail.fr', 1, 'nxkfeoe8yb4oscs0k0wow0g4gscgcs8', 'pass5{nxkfeoe8yb4oscs0k0wow0g4gscgcs8}', '2015-08-23 22:48:32', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_F6B4FB29FB88E14F` (`utilisateur_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_1D1C63B392FC23A8` (`username_canonical`), ADD UNIQUE KEY `UNIQ_1D1C63B3A0D96FBF` (`email_canonical`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `membre`
--
ALTER TABLE `membre`
ADD CONSTRAINT `FK_F6B4FB29FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
