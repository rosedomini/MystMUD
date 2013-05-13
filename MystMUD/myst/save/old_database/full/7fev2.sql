-- phpMyAdmin SQL Dump
-- version 3.2.3-rc1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 07 Février 2010 à 17:16
-- Version du serveur: 5.1.31
-- Version de PHP: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `myst`
--

-- --------------------------------------------------------

--
-- Structure de la table `avatar`
--

CREATE TABLE IF NOT EXISTS `avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `src` varchar(20) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=40 ;

--
-- Contenu de la table `avatar`
--

INSERT INTO `avatar` (`id`, `name`, `src`) VALUES
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` text COLLATE latin1_general_ci NOT NULL,
  `expire` bigint(20) NOT NULL,
  `items` text COLLATE latin1_general_ci NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `zone` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `body`
--


-- --------------------------------------------------------

--
-- Structure de la table `command`
--

CREATE TABLE IF NOT EXISTS `command` (
  `id` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `type` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `mob` tinyint(1) NOT NULL,
  `ko` tinyint(1) NOT NULL,
  `authlevel` tinyint(4) NOT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `syntax` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `help` text COLLATE latin1_general_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `command`
--

INSERT INTO `command` (`id`, `type`, `mob`, `ko`, `authlevel`, `keyboard`, `syntax`, `help`) VALUES
('aide', 'divers', 0, 1, 0, 1, 'aide [commande]', 'Affiche de l''aide sur la <b>commande</b> ou affiche une liste des commandes'),
('cast', 'action', 1, 0, 0, 1, 'cast heuu sort', 'Lance un sortilège.'),
('chat', 'communication', 0, 0, 0, 1, 'chat message', 'Envoie un message à tous les joueurs connectés.'),
('clone', 'a_olc', 0, 1, 1, 0, 'clone class id', 'Clone l''objet de classe <b>class</b> identifié par <b>id</b> et lui attribue un nouvel identifiant'),
('drop', 'action', 1, 0, 0, 1, 'drop [nombre] objet', 'Pose un objet de votre inventaire à votre position. "drop *" pour tout poser.'),
('dump', 'a_divers', 0, 1, 1, 0, 'dump (variable)', 'Affiche la structure d''une <b>variable</b>.<br><u>Exemple :</u> dump $h\r\n\r\n\r\n\r\ndump tout court permet d''activer/désactiver l''affichage sur le terminal des réponses aux commandes (en html).'),
('edit', 'a_olc', 0, 1, 1, 0, 'edit class id', 'Affiche une page de modification pour l''objet de classe <b>class</b> identifié par <b>id</b>'),
('examine', 'divers', 0, 0, 0, 1, 'examine quelque-chose', 'Permet de scruter un corps ou examiner un objet de votre inventaire.'),
('force', 'a_gestion', 0, 1, 1, 0, 'force someone <action>', 'Permet de forcer un personnage à faire quelque chose.'),
('get', 'action', 1, 0, 0, 1, 'get [nombre] [objet] [from corps]', 'Ramasse un objet présent à votre position.</li><li>L''<b>objet</b> entré est recherché alphabétiquement dans une liste d''objets :<br>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n- au sol : <b><i>get * épée</i></b> avec * désignant le nombre d''exemplaires disponibles.<br>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n- dans un conteneur : <b><i>get * épée from souris</b></i>, souris étant le conteneur (dans ce cas le corps d''une souris morte)</li><li>Le nombre d''exemplaires à ramasser est optionnel (1 si non précisé)</li><li>L''objet recherché est optionnel (<b><i>get *</b></i> ramassera tous les objets au sol)'),
('give', 'action', 1, 0, 0, 1, 'give nom [nombre] objet', 'Donne un objet à quelqu''un près de vous (joueur ou créature).'),
('giveXp', 'a_gestion', 0, 1, 1, 0, 'giveXp player xp', 'Confère <b>xp</b> points d''expériences à <b>player</b>'),
('goto', 'a_divers', 0, 1, 1, 0, 'goto [zone]', 'Affiche la liste des zones où déplace vers la zone indiquée'),
('help', 'a_divers', 0, 1, 1, 0, 'help [command]', 'Affiche de l''aide sur <b>command</b> ou affiche une liste des commandes'),
('inventory', 'gestion', 0, 0, 0, 1, 'inventory', 'Liste les objets que vous avez sur vous.'),
('kill', 'action', 1, 0, 0, 1, 'kill cible', 'Engage un combat à mort avec la cible.'),
('layer', 'a_olc', 0, 1, 1, 0, 'layer icon=c00 layer_number=1', 'Change l''icone de la salle ou vous vous trouver par <b>icon</b> sur la couche <b>layer_number</b>'),
('look', 'divers', 0, 1, 0, 1, 'look', 'Vous regardez autours de vous.'),
('lvUp', 'a_gestion', 0, 1, 1, 0, 'lvUp player', 'Incrémente le niveau de <b>player</b> sans laisser d''xp au delà'),
('move', 'action', 1, 0, 0, 0, 'move', ''),
('olc', 'a_olc', 0, 1, 1, 0, 'olc [class]', 'Affiche la liste des classes ainsi que la liste des objets de la classe précisée.'),
('olcShow', 'a_olc', 0, 1, 1, 0, 'olc_show class id', 'Affiche les données de l''objet de classe <b>class</b> et d''identifiant <b>id</b>'),
('option', 'divers', 0, 1, 0, 1, 'option', 'Accède à un panneau permettant de régler différentes options.'),
('shortcut', 'gestion', 0, 1, 0, 0, 'shortcut action id', 'Permet de modifier les raccourcis'),
('playerlist', 'divers', 0, 1, 0, 0, 'playerlist', ''),
('pray', 'communication', 0, 0, 0, 1, 'pray message', 'Permet de contacter un admin afin de faire une demande ou signaler un problème quelconque.'),
('remove', 'gestion', 1, 0, 0, 1, 'remove objet', 'Remet un objet équipé dans votre sac.'),
('ruby', 'a_divers', 0, 1, 1, 0, 'php script_php', 'Exécute <b>script_php</b>.<br><u>Exemple :</u> php save::world();'),
('rwalkable', 'a_olc', 0, 1, 1, 0, 'rwalkable', 'Rends la salle où vous êtes innaccessible aux joueurs ou annule l''effet'),
('say', 'communication', 1, 0, 0, 1, 'say message', 'Vous dites quelque chose à voix normale et  ne serez entendu que par des personnes à proximité.'),
('selectAvatar', 'gestion', 0, 0, 0, 0, 'selectAvatar', 'Il n''y a pas d''aide là-dessus.'),
('selectSkin', 'gestion', 0, 0, 0, 0, 'selectSkin', 'Il n''y a pas d''aide là-dessus.'),
('set', 'a_olc', 0, 1, 1, 0, 'set class id variable value', 'Donne la valeur <b>value</b> à la <b>variable</b> pour l''objet de classe <b>class</b> identifié par <b>id</b>'),
('shout', 'communication', 1, 0, 0, 1, 'shout message', 'Envoie un message aux personnages se trouvant dans la zone.'),
('summonItem', 'a_olc', 0, 1, 1, 0, 'summonItem id number', 'Invoque <b>number</b> objets d''id <b>id</b> dans votre inventaire'),
('tell', 'communication', 0, 0, 0, 1, 'tell nom message', 'Dit à <b>nom</b>, le <b>message</b>. Sensible à la casse et à l''état du joueur visé.'),
('time', 'divers', 0, 0, 0, 1, 'time', 'Affiche la date et l''heure actuelle.'),
('wear', 'gestion', 1, 0, 0, 1, 'wear objet', 'Équipe un objet de votre inventaire.'),
('who', 'divers', 0, 0, 0, 1, 'who', 'Affiche la liste des joueurs connectés.'),
('zcreate', 'a_olc', 0, 1, 1, 0, 'zcreate name', 'Créé une nouvelle zone nommée par <b>name</b>'),
('zedit', 'a_olc', 0, 1, 1, 0, 'zedit', 'Affiche l''éditeur de zone,les changements s''appliqueront en fonction de votre position'),
('zresize', 'a_olc', 0, 1, 1, 0, 'zresize [cols, 25] [rows, 9] [icon, c00]', 'Redimensionne une zone et la remplie avec <b>icon</b>'),
('ztp', 'a_olc', 0, 1, 1, 0, 'ztp bool', 'Configure un point de départ ou créée une téléportation vers un point d''arrivée'),
('zwalkable', 'a_olc', 0, 1, 1, 0, 'zwalkable', 'Permet d''annuler l''effet de <a href="javascript:p(''help.rwalkable'')">rwalkable</a> sur toutes les salles de la zone où vous êtes'),
('include', 'a_divers', 0, 1, 1, 0, 'include path', 'Tente de charger le fichier indiqué par <b>path</b>. Utiliser avec précaution...');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE IF NOT EXISTS `commentaires` (
  `commentaire` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `commentaires`
--

INSERT INTO `commentaires` (`commentaire`) VALUES
('0 => "Cheville gauche",\r\n\r\n\r\n\r\n1 => "Cheville droite",\r\n\r\n\r\n\r\n2 => "Bras gauche",\r\n\r\n\r\n\r\n3 => "Bras droit",\r\n\r\n\r\n\r\n4 => "Dos",\r\n\r\n\r\n\r\n5 => "Torse",\r\n\r\n\r\n\r\n6 => "Oreille gauche",\r\n\r\n\r\n\r\n7 => "Oreille droite",\r\n\r\n\r\n\r\n8 => "Yeux",\r\n\r\n\r\n\r\n9 => "Doigt gauche",\r\n\r\n\r\n\r\n10 => "Doigt droit",\r\n\r\n\r\n\r\n11 => "Pieds",\r\n\r\n\r\n\r\n12 => "Front",\r\n\r\n\r\n\r\n13 => "Gants",\r\n\r\n\r\n\r\n14 => "Tete",\r\n\r\n\r\n\r\n15 => "Jambes",\r\n\r\n\r\n\r\n16 => "Cou",\r\n\r\n\r\n\r\n17 => "Taille",\r\n\r\n\r\n\r\n18 => "Main gauche",\r\n\r\n\r\n\r\n19 => "Main droite",\r\n\r\n\r\n\r\n20 => "Poignet gauche",\r\n\r\n\r\n\r\n21 => "Poignet droit"');

-- --------------------------------------------------------

--
-- Structure de la table `god`
--

CREATE TABLE IF NOT EXISTS `god` (
  `id` int(11) NOT NULL,
  `teleport` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `god`
--

INSERT INTO `god` (`id`, `teleport`) VALUES
(1, 1),
(6, 1);

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

-- --------------------------------------------------------

--
-- Structure de la table `icon`
--

CREATE TABLE IF NOT EXISTS `icon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=129 ;

--
-- Contenu de la table `icon`
--

INSERT INTO `icon` (`id`, `src`) VALUES
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `type` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `wearon` text COLLATE latin1_general_ci NOT NULL,
  `desc` text COLLATE latin1_general_ci NOT NULL,
  `stats` text COLLATE latin1_general_ci NOT NULL,
  `power` text COLLATE latin1_general_ci NOT NULL,
  `required` text COLLATE latin1_general_ci NOT NULL,
  `value` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `name`, `type`, `weight`, `wearon`, `desc`, `stats`, `power`, `required`, `value`) VALUES
(1, 'une épée en bois de cerisier', 'weapon', 1, '[18, 19]', 'Cette épée d''entraînement ne permet de tuer que des rats (et encore)...', '{}', '{}', '{}', 0),
(2, 'un bâton de shaman', 'weapon', 10, '[18, 19]', 'C''est un bâton robuste orné d''une mâchoire de gobelin.', '{}', '{}', '{}', 0),
(3, 'une pièce d''or', 'money', 0, '[]', 'Ces pièces sont très utilisées dans le commerce.', '{}', '{}', '{}', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mob`
--

CREATE TABLE IF NOT EXISTS `mob` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `zone` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
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
  `target` int(11) NOT NULL DEFAULT '0',
  `spells` text COLLATE latin1_general_ci NOT NULL,
  `inv` text COLLATE latin1_general_ci NOT NULL,
  `equip` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1000001 ;

--
-- Contenu de la table `mob`
--

INSERT INTO `mob` (`id`, `name`, `zone`, `x`, `y`, `lv`, `hp`, `maxhp`, `mp`, `maxmp`, `str`, `con`, `wis`, `dex`, `skin`, `avatar`, `status`, `target`, `spells`, `inv`, `equip`) VALUES
(1000000, 'une souris', 1, 0, 0, 1, 50, 50, 100, 100, 5, 5, 5, 5, 'mob/Small04', 'mob/souris', '', 0, '{}', '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE latin1_general_ci NOT NULL,
  `keeper` int(11) NOT NULL,
  `zone` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `items` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `shop`
--


-- --------------------------------------------------------

--
-- Structure de la table `signal`
--

CREATE TABLE IF NOT EXISTS `signal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `text` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `signal`
--


-- --------------------------------------------------------

--
-- Structure de la table `skin`
--

CREATE TABLE IF NOT EXISTS `skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `src` varchar(20) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=204 ;

--
-- Contenu de la table `skin`
--

INSERT INTO `skin` (`id`, `name`, `src`) VALUES
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(300) COLLATE latin1_general_ci NOT NULL,
  `min_cost` int(11) NOT NULL,
  `max_cost` int(11) NOT NULL,
  `school` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `func` varchar(40) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `spell`
--


-- --------------------------------------------------------

--
-- Structure de la table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `value` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `system`
--

INSERT INTO `system` (`id`, `name`, `value`) VALUES
(1, 'world_time', '222003'),
(2, 'time_difference', '1265283147'),
(3, 'pray', '[]'),
(4, 'hack', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `layer1` text COLLATE latin1_general_ci NOT NULL,
  `layer2` text COLLATE latin1_general_ci NOT NULL,
  `layer3` text COLLATE latin1_general_ci NOT NULL,
  `walkable` text COLLATE latin1_general_ci NOT NULL,
  `items` text COLLATE latin1_general_ci NOT NULL,
  `tp` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `zone`
--

INSERT INTO `zone` (`id`, `name`, `x`, `y`, `layer1`, `layer2`, `layer3`, `walkable`, `items`, `tp`) VALUES
(1, 'Le Myst du milieu', 24, 8, 'aw00aw00aw00aw00aw00aw00ts11ts00ts00aw00aw00aw00aw00aw00ts10ts21ts00ts00aw00aw00aw00aw00aw00ts11ts21ts00ts00aw00aw00aw00aw00aw00ts11ts21ts00ts00aw00aw00aw00aw00aw00ts12ts22ts03ts03aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw80aw80aw80aw80aw80aw80aw80aw80aw80aw81aw81aw81aw81aw81aw81aw81aw81aw81aw82aw82aw82aw82aw82aw82aw82aw82aw82aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00aw00', '33aw1523aw1475awf665awf585awf755awf492awb193awc1a3awc2b3awc2c3awc2d3awc3d2awb3c2awb2b2awb2a2awb2h4awa5g4awa4i3aw11j3aw11k2aw11j2aw11j1aw11k1aw11k0aw11j0aw11h3aw11h2aw11g2aw11g3aw11f2aw11e2aw11d4aw13l2awa6m2awa7e5aw13e7aw13d8aw13n7awf5o7awf6m7awf4m6awc7o2aw1605aw1104aw0113aw0103aw0122aw0121aw0131aw0132aw0142aw0152aw0162aw0172aw0182aw0183aw0112aw01', '32aw0522aw0464awe554awe474awe673awd683awd763awd553awd452awc462awc572awc682awc771awb661awb584awe7h3aw95g3aw94g2aw84h2aw85d3aw03d1aw02d0aw1290aw0291aw12m1aw97l1aw94l0aw84m0aw87e6aw03e4aw03d7aw03d6ae01k5awb5l5awb6l6awc6m7awd7m8awe7l8awe6k8awe5j8awe4j7awd4k7awd5l7awd6k6awc5m6awe4j6awc4n6awe5o6awe6m5awd4n5awc5o5awc6o4awc6n4awc5m4awc4n3awb5o3awb6o1aw0677awb587awb698awc788awc578awc568awc4', '23336575a1a0b0b1b3a3a4b8b7b6b5b4a8a7a6a5c8c7c6c5c4c3c1c0l4h4g49190d0d1d8e7e5d4n7o7o215253545464748383736262728181716060708', '{"821"=>{}}', '{"m31"=>"g51"}');
