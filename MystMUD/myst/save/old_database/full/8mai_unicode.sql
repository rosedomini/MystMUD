-- phpMyAdmin SQL Dump
-- version 3.3.2
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Sam 08 Mai 2010 à 01:33
-- Version du serveur: 5.0.51
-- Version de PHP: 5.2.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `myst`
--

-- --------------------------------------------------------

--
-- Structure de la table `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) collate utf8_unicode_ci NOT NULL,
  `x1` int(11) NOT NULL default '0',
  `y1` int(11) NOT NULL default '0',
  `z1` int(11) NOT NULL default '0',
  `x2` int(11) NOT NULL default '0',
  `y2` int(11) NOT NULL default '0',
  `z2` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `area`
--

INSERT INTO `area` (`id`, `name`, `x1`, `y1`, `z1`, `x2`, `y2`, `z2`) VALUES
(1, 'Le Myst du milieu', -500, -500, -500, 500, 500, 500);

-- --------------------------------------------------------

--
-- Structure de la table `avatar`
--

CREATE TABLE IF NOT EXISTS `avatar` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `source` varchar(20) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Contenu de la table `avatar`
--

INSERT INTO `avatar` (`id`, `name`, `source`) VALUES
(1, 'Bourreau', 'bourreau1'),
(2, 'Bourreau', 'bourreau2'),
(3, 'Bourreau', 'bourreau3'),
(4, 'Chasseur', 'Chasseur1'),
(5, 'Chasseur', 'Chasseur2'),
(6, 'Chasseur', 'Chasseur3'),
(7, 'default', 'default'),
(8, 'Épéiste', 'epeiste1'),
(9, 'Épéiste', 'epeiste2'),
(10, 'Épéiste', 'epeiste3'),
(11, 'Épéiste', 'epeiste4'),
(12, 'Épéiste', 'epeiste5'),
(13, 'Épéiste', 'epeiste6'),
(14, 'Épéiste', 'epeiste7'),
(15, 'Épéiste', 'epeiste8'),
(16, 'Lancier', 'lancier1'),
(17, 'Lancier', 'lancier2'),
(18, 'Lancier', 'lancier3'),
(19, 'Lancier', 'lancier4'),
(20, 'Mage', 'mage1'),
(21, 'Mage', 'mage2'),
(22, 'Mage', 'mage3'),
(23, 'Mage', 'mage4'),
(24, 'Mage', 'mage5'),
(25, 'Mage', 'mage6'),
(26, 'Mage', 'mage7'),
(27, 'Mage', 'mage8'),
(28, 'Mage', 'mage9'),
(29, 'Prêtre', 'pretre1'),
(30, 'Prêtre', 'pretre2'),
(31, 'Prêtre', 'pretre3'),
(32, 'Prêtre', 'pretre4'),
(33, 'Prêtre', 'pretre5'),
(34, 'Prêtre', 'pretre6'),
(35, 'Prêtre', 'pretre7'),
(36, 'Prêtre', 'pretre8'),
(37, 'Voleur', 'Voleur1'),
(38, 'Voleur', 'Voleur2'),
(39, 'Voleur', 'Voleur3');

-- --------------------------------------------------------

--
-- Structure de la table `body`
--

CREATE TABLE IF NOT EXISTS `body` (
  `id` bigint(20) NOT NULL auto_increment,
  `aid` int(11) NOT NULL,
  `name` text collate utf8_unicode_ci NOT NULL,
  `expire` bigint(20) NOT NULL,
  `inv` text collate utf8_unicode_ci NOT NULL,
  `room` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `body`
--


-- --------------------------------------------------------

--
-- Structure de la table `command`
--

CREATE TABLE IF NOT EXISTS `command` (
  `id` varchar(30) collate utf8_unicode_ci NOT NULL,
  `name` varchar(30) collate utf8_unicode_ci NOT NULL,
  `type` varchar(30) collate utf8_unicode_ci NOT NULL,
  `mob` tinyint(1) NOT NULL,
  `ko` tinyint(1) NOT NULL,
  `authlevel` tinyint(4) NOT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `link` tinyint(4) NOT NULL,
  `syntax` varchar(200) collate utf8_unicode_ci NOT NULL,
  `help` text collate utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `command`
--

INSERT INTO `command` (`id`, `name`, `type`, `mob`, `ko`, `authlevel`, `keyboard`, `link`, `syntax`, `help`) VALUES
('1', 'aide', 'divers', 0, 1, 0, 1, 0, 'aide [commande]', 'Affiche de l''aide sur la <b>commande</b> ou affiche une liste des commandes'),
('2', 'cast', 'action', 1, 0, 0, 1, 0, 'cast heuu sort', 'Lance un sortilège.'),
('3', 'chat', 'communication', 0, 0, 0, 1, 0, 'chat message', 'Envoie un message à tous les joueurs connectés.'),
('4', 'clone', 'a_olc', 0, 1, 1, 1, 0, 'clone class id', 'Clone l''objet de classe <b>class</b> identifié par <b>id</b> et lui attribue un nouvel identifiant'),
('5', 'drop', 'action', 1, 0, 0, 1, 0, 'drop [nombre] objet', 'Pose un objet de votre inventaire à votre position. "drop *" pour tout poser.'),
('6', 'dump', 'a_divers', 0, 1, 1, 1, 0, 'dump (variable)', 'Affiche la structure d''une <b>variable</b>.<br><u>Exemple :</u> dump $h\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\ndump tout court permet d''activer/désactiver l''affichage sur le terminal des réponses aux commandes (en html).'),
('7', 'edit', 'a_olc', 0, 1, 1, 1, 0, 'edit class id', 'Affiche une page de modification pour l''objet de classe <b>class</b> identifié par <b>id</b>'),
('8', 'examine', 'divers', 0, 0, 0, 1, 0, 'examine quelque-chose', 'Permet de scruter un corps ou examiner un objet de votre inventaire.'),
('9', 'force', 'a_gestion', 0, 1, 1, 1, 0, 'force someone to action', 'Permet de forcer un personnage à faire quelque chose.'),
('10', 'get', 'action', 1, 0, 0, 1, 0, 'get * ou get objet ou get objet from conteneur', 'Ramasse un objet présent à votre position.\r\n\r\nget * permet de prendre tout ce qu''il y a directement au sol.\r\n\r\nget objet permet de prendre un objet.\r\n\r\n\r\n\r\nExemples pour "objet" :\r\n\r\n - épée cristalline\r\n\r\n - cris\r\n\r\n - * pomme (elles seront toutes ramassées)\r\n\r\n - 2 pomme (au plus 2 seront ramassées)\r\n\r\n\r\n\r\nget objet from corps permet de prendre un objet depuis un conteneur présent.\r\n\r\n\r\n\r\nExemples pour "conteneur" :\r\n\r\n - pir\r\n\r\n - pirate saoul\r\n\r\n - corps 2 (2ème corps dont le nom contient corps)\r\n\r\n\r\n\r\nExemple général : get 5 épée cristalline from pirate saoul 3\r\n\r\nPrélève si possible 5 exemplaires de cette épée depuis le troisième corps d''un pirate saoul.\r\n\r\nget 5 ép from pir 3 devrait donner la même chose s''il n''y a pas d''ambiguïté avec un autre objet ou conteneur.'),
('11', 'give', 'action', 1, 0, 0, 1, 0, 'give nom [nombre] objet', 'Donne un objet à quelqu''un près de vous (joueur ou créature).'),
('12', 'giveXp', 'a_gestion', 0, 1, 1, 1, 0, 'giveXp player xp', 'Confère <b>xp</b> points d''expériences à <b>player</b>'),
('13', 'goto', 'a_divers', 0, 1, 1, 1, 0, 'goto [zone]', 'Affiche la liste des zones où déplace vers la zone indiquée'),
('14', 'help', 'a_divers', 0, 1, 1, 1, 0, 'help [command]', 'Affiche de l''aide sur <b>command</b> ou affiche une liste des commandes'),
('15', 'inventory', 'gestion', 0, 0, 0, 1, 0, 'inventory', 'Liste les objets que vous avez sur vous.'),
('16', 'kill', 'action', 1, 0, 0, 1, 0, 'kill cible', 'Engage un combat à mort avec la cible.'),
('17', 'look', 'divers', 0, 1, 0, 1, 0, 'look', 'Vous regardez autours de vous.'),
('18', 'lvUp', 'a_gestion', 0, 1, 1, 1, 0, 'lvUp player', 'Incrémente le niveau de <b>player</b> sans laisser d''xp au delà'),
('20', 'olc', 'a_olc', 0, 1, 1, 1, 0, 'olc [class]', 'Affiche la liste des classes ainsi que la liste des objets de la classe précisée.'),
('21', 'olcShow', 'a_olc', 0, 1, 1, 1, 0, 'olc_show class id', 'Affiche les données de l''objet de classe <b>class</b> et d''identifiant <b>id</b>'),
('22', 'option', 'divers', 0, 1, 0, 1, 0, 'option', 'Accède à un panneau permettant de régler différentes options.'),
('23', 'shortcut', 'gestion', 0, 1, 0, 0, 1, 'shortcut action id', 'Permet de modifier les raccourcis'),
('25', 'pray', 'communication', 0, 0, 0, 1, 0, 'pray message', 'Permet de contacter un admin afin de faire une demande ou signaler un problème quelconque.'),
('26', 'remove', 'gestion', 1, 0, 0, 1, 0, 'remove objet', 'Remet un objet équipé dans votre sac.'),
('27', 'ruby', 'a_divers', 0, 1, 1, 1, 0, 'ruby <code>', 'Exécute le <b>code</b>.<br><u>Exemple :</u> ruby Save.world'),
('28', 'say', 'communication', 1, 0, 0, 1, 0, 'say message', 'Vous dites quelque chose à voix normale et  ne serez entendu que par des personnes à proximité.'),
('29', 'selectAvatar', 'gestion', 0, 0, 0, 0, 1, 'selectAvatar', 'Il n''y a pas d''aide là-dessus.'),
('30', 'selectSkin', 'gestion', 0, 0, 0, 0, 1, 'selectSkin', 'Il n''y a pas d''aide là-dessus.'),
('31', 'set', 'a_olc', 0, 1, 1, 1, 0, 'set class id variable value', 'Donne la valeur <b>value</b> à la <b>variable</b> pour l''objet de classe <b>class</b> identifié par <b>id</b>'),
('32', 'shout', 'communication', 1, 0, 0, 1, 0, 'shout message', 'Envoie un message aux personnages se trouvant dans la zone.'),
('33', 'summonItem', 'a_olc', 0, 1, 1, 1, 0, 'summonItem id number', 'Invoque <b>number</b> objets d''id <b>id</b> dans votre inventaire'),
('34', 'tell', 'communication', 0, 0, 0, 1, 0, 'tell nom message', 'Dit à <b>nom</b>, le <b>message</b>. Sensible à la casse et à l''état du joueur visé.'),
('35', 'time', 'divers', 0, 0, 0, 1, 0, 'time', 'Affiche la date et l''heure actuelle.'),
('36', 'wear', 'gestion', 1, 0, 0, 1, 0, 'wear objet', 'Équipe un objet de votre inventaire.'),
('37', 'who', 'divers', 0, 0, 0, 1, 0, 'who', 'Affiche la liste des joueurs connectés.'),
('38', 'redit', 'a_olc', 0, 1, 1, 1, 0, 'redit', 'Affiche l''éditeur des salles'),
('39', 'rcreate', 'a_olc', 0, 1, 1, 1, 0, 'rcreate [nseobh]', 'Exemple : rcreate n pour créer une nouvelle salle au nord.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nLes sorties sont reconfigurées par la même occasion entre la salle actuelle et la nouvelle salle.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nCeci vous déplacera dans la salle créée.'),
('40', 'eat', 'gestion', 1, 0, 0, 1, 0, 'eat nourriture', 'exemple : eat cèpe pour manger un cèpe'),
('41', 'include', 'a_divers', 0, 1, 1, 1, 0, 'include path', 'Tente de charger le fichier indiqué par <b>path</b>. Utiliser avec précaution...'),
('42', 'special', 'divers', 1, 1, 0, 0, 1, 'non déclarée', 'Il n''y a pas d''aide à propos de cette commande.'),
('43', 'equipement', 'gestion', 0, 0, 0, 1, 0, 'equipement', 'Liste les objets que vous portez sur le corps.'),
('44', 'drag', 'action', 1, 0, 0, 1, 0, 'drag corps to direction', 'Permet de déplacer un <b>corps<b> avec soi vers la <b>direction<b> ou l''endroit voulu.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nExemples pour "corps" :\r\n\r\n\r\n\r\n - corps\r\n\r\n\r\n\r\n - écureuil roux\r\n\r\n\r\n\r\n - écu\r\n\r\n\r\n\r\n - écu 2 (2ème corps dont le nom contient écu)\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nExemple : drag écureuil roux 2 to trap (s''il y a une sortie trappe)');

-- --------------------------------------------------------

--
-- Structure de la table `heroe`
--

CREATE TABLE IF NOT EXISTS `heroe` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(10) collate utf8_unicode_ci NOT NULL,
  `password` varchar(120) collate utf8_unicode_ci NOT NULL,
  `authlevel` tinyint(4) NOT NULL,
  `desc` text collate utf8_unicode_ci NOT NULL,
  `room` int(11) NOT NULL default '1',
  `xp` int(11) NOT NULL default '0',
  `level` smallint(6) NOT NULL default '1',
  `hp` int(11) NOT NULL default '1',
  `maxhp` int(11) NOT NULL default '1',
  `mp` int(11) NOT NULL default '1',
  `maxmp` int(11) NOT NULL default '1',
  `str` int(11) NOT NULL,
  `con` int(11) NOT NULL,
  `wis` int(11) NOT NULL,
  `dex` int(11) NOT NULL,
  `skin` varchar(20) collate utf8_unicode_ci NOT NULL default 'default',
  `avatar` varchar(20) collate utf8_unicode_ci NOT NULL default 'default',
  `target` int(11) NOT NULL,
  `spell` text collate utf8_unicode_ci NOT NULL,
  `inv` text collate utf8_unicode_ci NOT NULL,
  `equip` text collate utf8_unicode_ci NOT NULL,
  `shortcut` text collate utf8_unicode_ci NOT NULL,
  `hunger` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `heroe`
--

INSERT INTO `heroe` (`id`, `name`, `password`, `authlevel`, `desc`, `room`, `xp`, `level`, `hp`, `maxhp`, `mp`, `maxmp`, `str`, `con`, `wis`, `dex`, `skin`, `avatar`, `target`, `spell`, `inv`, `equip`, `shortcut`, `hunger`) VALUES
(1, 'Arsenic', '37eff4bfa7d88a6e75c8804ecff8659b', 1, '{:taille=>1, :haircolor=>1, :hairlength=>1, :eyecolor=>1}', 2, 0, 1, 20, 20, 10, 10, 5, 5, 5, 5, 'default', 'default', 0, '{}', '{}', '{}', '[["Lettre 2", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["option shortcut", "inventory", "who", "get *", "option", "o", "n", "s", "e", "aide"]]', -2880),
(2, 'Dominic', '37eff4bfa7d88a6e75c8804ecff8659b', 1, '{:taille=>1, :haircolor=>1, :hairlength=>1, :eyecolor=>1}', 1, 0, 1, 20, 20, 10, 10, 5, 5, 5, 5, 'default', 'default', 0, '{}', '{}', '{}', '[["Lettre 2", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["option shortcut", "inventory", "who", "get *", "option", "o", "n", "s", "e", "aide"]]', -2580);

-- --------------------------------------------------------

--
-- Structure de la table `icon`
--

CREATE TABLE IF NOT EXISTS `icon` (
  `id` int(11) NOT NULL auto_increment,
  `source` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=129 ;

--
-- Contenu de la table `icon`
--

INSERT INTO `icon` (`id`, `source`) VALUES
(1, 'Accessory 1'),
(2, 'Accessory 2'),
(3, 'Accessory 3'),
(4, 'Accessory 4'),
(5, 'Accessory 5'),
(6, 'Algue 1'),
(7, 'Arc 1'),
(8, 'Arme 1'),
(9, 'Arme 2'),
(10, 'Arme 3'),
(11, 'Arme 4'),
(12, 'Armure 1'),
(13, 'Armure 2'),
(14, 'Armure 3'),
(15, 'Armure 4'),
(16, 'Bague 1'),
(17, 'Bague 2'),
(18, 'Bague 3'),
(19, 'Body 1'),
(20, 'Body 2'),
(21, 'Body 3'),
(22, 'Boomerang 1'),
(23, 'Bottes 1'),
(24, 'Bottes 2'),
(25, 'Boucle 1'),
(26, 'Bouclier 1'),
(27, 'Bouclier 2'),
(28, 'Cadeau 1'),
(29, 'Cadeau 2'),
(30, 'Cape 1'),
(31, 'Cape 2'),
(32, 'Cape 3'),
(33, 'Cape 4'),
(34, 'Casque 1'),
(35, 'Ceinture 1'),
(36, 'Ceinture 2'),
(37, 'Chapeau 1'),
(38, 'Chapeau 2'),
(39, 'Couteau 1'),
(40, 'Couteau 2'),
(41, 'Croix 1'),
(42, 'Envelope'),
(43, 'Fusil 1'),
(44, 'Gants 1'),
(45, 'Gants 2'),
(46, 'Head 1'),
(47, 'Head 2'),
(48, 'Head 3'),
(49, 'Herb 1'),
(50, 'Herb 2'),
(51, 'Herb 3'),
(52, 'Herb 4'),
(53, 'Item 1'),
(54, 'Item 3'),
(55, 'Item 4'),
(56, 'Item 5'),
(57, 'Item 6'),
(58, 'Item 7'),
(59, 'Item 8'),
(60, 'Item 9'),
(61, 'Item10'),
(62, 'Item11'),
(63, 'Item12'),
(64, 'Joyaux 1'),
(65, 'Joyaux 10'),
(66, 'Joyaux 11'),
(67, 'Joyaux 12'),
(68, 'Joyaux 2'),
(69, 'Joyaux 3'),
(70, 'Joyaux 4'),
(71, 'Joyaux 5'),
(72, 'Joyaux 6'),
(73, 'Joyaux 7'),
(74, 'Joyaux 8'),
(75, 'Joyaux 9'),
(76, 'Joyaux7'),
(77, 'Key 1'),
(78, 'Key 2'),
(79, 'Key 3'),
(80, 'Lance 1'),
(81, 'Lanterne 1'),
(82, 'Lettre 1'),
(83, 'Lettre 2'),
(84, 'Lettre 3'),
(85, 'Livre 1'),
(86, 'Marteau 1'),
(87, 'Masque 1'),
(88, 'Mirroir 1'),
(89, 'Parchemin 1'),
(90, 'Parchemin 2'),
(91, 'Parchemin 3'),
(92, 'Plume 1'),
(93, 'Plume 2'),
(94, 'Pot 1'),
(95, 'Pot 2'),
(96, 'Pot 3'),
(97, 'Pot 4'),
(98, 'Pot 5'),
(99, 'Pot 6'),
(100, 'Pot 7'),
(101, 'Pot 8'),
(102, 'Potion 1'),
(103, 'Potion 2'),
(104, 'Potion 3'),
(105, 'Potion 4'),
(106, 'Roche 1'),
(107, 'Sable 1'),
(108, 'Sablier 1'),
(109, 'Sac 1'),
(110, 'Sac 2'),
(111, 'Shield 1'),
(112, 'Skill 1'),
(113, 'Skill 2'),
(114, 'Skill 3'),
(115, 'Skill 4'),
(116, 'Skill 5'),
(117, 'Skill 6'),
(118, 'Skill 7'),
(119, 'Squelette'),
(120, 'Trident 1'),
(121, 'Weapon 1'),
(122, 'Weapon 2'),
(123, 'Weapon 3'),
(124, 'Weapon 4'),
(125, 'Weapon 5'),
(126, 'Weapon 6'),
(127, 'Weapon 7'),
(128, 'Weapon 8');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) collate utf8_unicode_ci NOT NULL,
  `type` varchar(25) collate utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `wearon` text collate utf8_unicode_ci NOT NULL,
  `desc` text collate utf8_unicode_ci NOT NULL,
  `stats` text collate utf8_unicode_ci NOT NULL,
  `power` text collate utf8_unicode_ci NOT NULL,
  `required` text collate utf8_unicode_ci NOT NULL,
  `value` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `name`, `type`, `weight`, `wearon`, `desc`, `stats`, `power`, `required`, `value`) VALUES
(1, 'une épée en bois de cerisier', 'nourriture', 1, '[:bras_gauche, :bras_droit]', 'Cette épée d''entraînement ne permet de tuer que des rats (et encore)...', '{}', '{}', '{}', 0),
(2, 'un petit cèpe', 'nourriture', 1, '[]', 'C''est un champignon appétissant.', '{:rassasiment=>240}', '{}', '{}', 20),
(3, 'une pièce d''or', 'money', 0, '[]', 'Ces pièces sont très utilisées dans le commerce.', '{}', '{}', '{}', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mob`
--

CREATE TABLE IF NOT EXISTS `mob` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `room` int(11) NOT NULL default '1',
  `level` smallint(6) NOT NULL default '1',
  `hp` int(11) NOT NULL default '1',
  `maxhp` int(11) NOT NULL default '1',
  `mp` int(11) NOT NULL default '1',
  `maxmp` int(11) NOT NULL default '1',
  `str` int(11) NOT NULL,
  `con` int(11) NOT NULL,
  `wis` int(11) NOT NULL,
  `dex` int(11) NOT NULL,
  `skin` varchar(20) collate utf8_unicode_ci NOT NULL default 'default',
  `avatar` varchar(20) collate utf8_unicode_ci NOT NULL default 'default',
  `target` int(11) NOT NULL default '0',
  `spell` text collate utf8_unicode_ci NOT NULL,
  `inv` text collate utf8_unicode_ci NOT NULL,
  `equip` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1000001 ;

--
-- Contenu de la table `mob`
--

INSERT INTO `mob` (`id`, `name`, `room`, `level`, `hp`, `maxhp`, `mp`, `maxmp`, `str`, `con`, `wis`, `dex`, `skin`, `avatar`, `target`, `spell`, `inv`, `equip`) VALUES
(1000000, 'un écureuil roux', 2, 1, 20, 20, 0, 0, 5, 5, 5, 5, 'mob/Small10', 'mob/default', 0, '{}', '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) collate utf8_unicode_ci NOT NULL,
  `desc` text collate utf8_unicode_ci NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  `inv` text collate utf8_unicode_ci NOT NULL,
  `items` text collate utf8_unicode_ci NOT NULL,
  `exits` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `room`
--

INSERT INTO `room` (`id`, `name`, `desc`, `x`, `y`, `z`, `inv`, `items`, `exits`) VALUES
(1, 'En pleine forêt', 'Étant adossé au tronc d''un chêne, vous vous levez en vous grattant la tête. Le sifflement d''une légère brise entre les branchages se fait aussi sentir sur votre peau nue. Peut-être faudrait-il vous trouver de quoi vous habiller. Pour l''instant, un unique chemin s''offre à vous.<br>Tapez <font color=#3399CC>nord</font> entièrement ou partiellement pour l''emprunter.', 0, 0, 0, '{}', '{}', '{:nord=>2}'),
(2, 'Premiers pas', 'Vous vous déplacez avec disgrâce comme si c''était vos premiers pas. Le chant des oiseaux attire votre attention, mais ce qui vous préoccupe le plus à présent est cette bestiole qui se déplace autours de vous en sautillant.<br>Tapez <i><b>look écureuil</b></i> pour le regarder. Aussi n''oubliez pas la commande <i><b>aide</b></i>.', 0, 1, 0, '{}', '{}', '{:sud=>1, :est=>3}'),
(3, 'La bois d''Aulne', 'Vous traversez quelques branchages et continuez votre chemin. Vous sentez une odeur particulière à l''est.', 1, 1, 0, '{2=>1}', '{2=>1}', '{:ouest=>2}');

-- --------------------------------------------------------

--
-- Structure de la table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) collate utf8_unicode_ci NOT NULL,
  `keeper` int(11) NOT NULL,
  `room` int(11) NOT NULL default '1',
  `inv` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `shop`
--


-- --------------------------------------------------------

--
-- Structure de la table `signal`
--

CREATE TABLE IF NOT EXISTS `signal` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  `text` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `signal`
--


-- --------------------------------------------------------

--
-- Structure de la table `skin`
--

CREATE TABLE IF NOT EXISTS `skin` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `source` varchar(20) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=204 ;

--
-- Contenu de la table `skin`
--

INSERT INTO `skin` (`id`, `name`, `source`) VALUES
(1, 'Skin par défaut', 'default'),
(20, 'Bard01', 'Bard01'),
(21, 'Bartender01', 'Bartender01'),
(31, 'BunnyGirl01', 'BunnyGirl01'),
(32, 'Butler01', 'Butler01'),
(33, 'Captain01', 'Captain01'),
(38, 'Civilian01', 'Civilian01'),
(39, 'Civilian02', 'Civilian02'),
(40, 'Civilian03', 'Civilian03'),
(41, 'Civilian04', 'Civilian04'),
(42, 'Civilian05', 'Civilian05'),
(43, 'Civilian06', 'Civilian06'),
(44, 'Civilian07', 'Civilian07'),
(45, 'Civilian08', 'Civilian08'),
(46, 'Civilian09', 'Civilian09'),
(47, 'Civilian10', 'Civilian10'),
(48, 'Civilian11', 'Civilian11'),
(49, 'Civilian12', 'Civilian12'),
(50, 'Civilian13', 'Civilian13'),
(51, 'Civilian14', 'Civilian14'),
(52, 'Civilian15', 'Civilian15'),
(53, 'Civilian16', 'Civilian16'),
(54, 'Civilian17', 'Civilian17'),
(55, 'Civilian18', 'Civilian18'),
(56, 'Civilian19', 'Civilian19'),
(57, 'Civilian20', 'Civilian20'),
(58, 'Civilian21', 'Civilian21'),
(59, 'Civilian22', 'Civilian22'),
(60, 'Civilian23', 'Civilian23'),
(61, 'Civilian24', 'Civilian24'),
(62, 'Cleric01', 'Cleric01'),
(63, 'Cleric02', 'Cleric02'),
(64, 'Cleric03', 'Cleric03'),
(65, 'Cleric04', 'Cleric04'),
(66, 'Cleric05', 'Cleric05'),
(67, 'Cleric06', 'Cleric06'),
(68, 'Cleric07', 'Cleric07'),
(69, 'Cleric08', 'Cleric08'),
(70, 'Clown01', 'Clown01'),
(71, 'Cook01', 'Cook01'),
(72, 'Dancer01', 'Dancer01'),
(90, 'Farmer01', 'Farmer01'),
(91, 'Farmer02', 'Farmer02'),
(92, 'Fighter01', 'Fighter01'),
(93, 'Fighter02', 'Fighter02'),
(94, 'Fighter03', 'Fighter03'),
(95, 'Fighter04', 'Fighter04'),
(96, 'Fighter05', 'Fighter05'),
(97, 'Fighter06', 'Fighter06'),
(98, 'Fighter07', 'Fighter07'),
(99, 'Fighter08', 'Fighter08'),
(100, 'Fortuneteller01', 'Fortuneteller01'),
(105, 'Grappler01', 'Grappler01'),
(106, 'Grappler02', 'Grappler02'),
(107, 'Gunner01', 'Gunner01'),
(108, 'Gunner02', 'Gunner02'),
(109, 'Hunter01', 'Hunter01'),
(110, 'Hunter02', 'Hunter02'),
(111, 'Hunter03', 'Hunter03'),
(112, 'King01', 'King01'),
(113, 'Lancer01', 'Lancer01'),
(114, 'Lancer02', 'Lancer02'),
(115, 'Lancer03', 'Lancer03'),
(116, 'Lancer04', 'Lancer04'),
(120, 'Mage01', 'Mage01'),
(122, 'Mage03', 'Mage03'),
(123, 'Mage04', 'Mage04'),
(124, 'Mage05', 'Mage05'),
(125, 'Mage06', 'Mage06'),
(126, 'Mage07', 'Mage07'),
(127, 'Mage08', 'Mage08'),
(128, 'Mage09', 'Mage09'),
(129, 'Maid01', 'Maid01'),
(144, 'Noble01', 'Noble01'),
(145, 'Noble02', 'Noble02'),
(146, 'Noble03', 'Noble03'),
(147, 'Noble04', 'Noble04'),
(148, 'Noble05', 'Noble05'),
(149, 'Noble06', 'Noble06'),
(150, 'Noble07', 'Noble07'),
(151, 'Noble08', 'Noble08'),
(152, 'Prisoner01', 'Prisoner01'),
(153, 'Prisoner02', 'Prisoner02'),
(154, 'Queen01', 'Queen01'),
(157, 'Sailor01', 'Sailor01'),
(158, 'Scholar01', 'Scholar01'),
(174, 'Soldier01', 'Soldier01'),
(175, 'Soldier02', 'Soldier02'),
(176, 'Storekeeper01', 'Storekeeper01'),
(177, 'Storekeeper02', 'Storekeeper02'),
(190, 'Thief01', 'Thief01'),
(191, 'Thief02', 'Thief02'),
(192, 'Thief03', 'Thief03'),
(193, 'Thief04', 'Thief04'),
(195, 'Trader01', 'Trader01'),
(201, 'Warrior01', 'Warrior01'),
(202, 'Warrior02', 'Warrior02'),
(203, 'Warrior03', 'Warrior03');

-- --------------------------------------------------------

--
-- Structure de la table `spell`
--

CREATE TABLE IF NOT EXISTS `spell` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_unicode_ci NOT NULL,
  `desc` varchar(300) collate utf8_unicode_ci NOT NULL,
  `min_cost` int(11) NOT NULL,
  `max_cost` int(11) NOT NULL,
  `school` varchar(20) collate utf8_unicode_ci NOT NULL,
  `func` varchar(40) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `spell`
--


-- --------------------------------------------------------

--
-- Structure de la table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `value` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `system`
--

INSERT INTO `system` (`id`, `name`, `value`) VALUES
(1, 'world_time', '461147'),
(2, 'time_difference', '1272810832'),
(3, 'pray', '[]'),
(4, 'hack', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `world`
--

CREATE TABLE IF NOT EXISTS `world` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `zones` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `world`
--

INSERT INTO `world` (`id`, `name`, `zones`) VALUES
(1, 'Myst', '[1]');
