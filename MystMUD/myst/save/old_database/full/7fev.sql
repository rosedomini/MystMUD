-- phpMyAdmin SQL Dump
-- version 3.2.3-rc1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 07 Février 2010 à 10:28
-- Version du serveur: 5.1.31
-- Version de PHP: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `myst`
--

-- --------------------------------------------------------

--
-- Structure de la table `heroe`
--

CREATE TABLE IF NOT EXISTS `heroe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(120) COLLATE latin1_general_ci NOT NULL,
  `god` tinyint(4) NOT NULL,
  `zone` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `xp` int(11) NOT NULL DEFAULT '0',
  `lv` smallint(6) NOT NULL DEFAULT '1',
  `hp` int(11) NOT NULL DEFAULT '1',
  `maxhp` int(11) NOT NULL DEFAULT '1',
  `mp` int(11) NOT NULL DEFAULT '1',
  `maxmp` int(11) NOT NULL DEFAULT '1',
  `str` int(11) NOT NULL,
  `con` int(11) NOT NULL,
  `wis` int(11) NOT NULL,
  `dex` int(11) NOT NULL,
  `skin` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'default',
  `avatar` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'default',
  `status` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `target` int(11) NOT NULL,
  `spells` text COLLATE latin1_general_ci NOT NULL,
  `inv` text COLLATE latin1_general_ci NOT NULL,
  `equip` text COLLATE latin1_general_ci NOT NULL,
  `shortcuts` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `heroe`
--

INSERT INTO `heroe` (`id`, `name`, `password`, `god`, `zone`, `x`, `y`, `xp`, `lv`, `hp`, `maxhp`, `mp`, `maxmp`, `str`, `con`, `wis`, `dex`, `skin`, `avatar`, `status`, `target`, `spells`, `inv`, `equip`, `shortcuts`) VALUES
(1, 'Arsenic', '37eff4bfa7d88a6e75c8804ecff8659b', 1, 1, 16, 5, 0, 1, 42, 120, 10, 10, 5, 5, 5, 5, 'Queen01', 'epeiste2', '', 0, '{}', '{1=>5, 2=>4}', '{}', '[["Item 9", "olc"], ["Sac 1", "inventory"], ["Masque 1", "who"], ["Skill 5", "get *"], ["Parchemin 1", "option"], ["Joyaux 6", "o"], ["Joyaux 6", "n"], ["Joyaux 6", "s"], ["Joyaux 6", "e"], ["Skill 6", "aide"]]'),
(6, 'Conap', 'b7a616d4e7c1c12289c6bf3885f62f1a', 1, 1, 1, 1, 1514, 1, 46, 70, 10, 10, 8, 5, 5, 5, 'default', 'default', '', 0, '{}', '{3=>1000}', '{}', '[["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"]]'),
(8, 'Maxime', 'b238c13e822536cad3ac57a2280fbf45', 0, 1, 0, 0, 0, 1, 60, 60, 10, 10, 5, 5, 5, 5, 'default', 'default', '', 0, '{}', '{}', '{}', '[["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"], ["Lettre 2", "option shortcut"]]');
