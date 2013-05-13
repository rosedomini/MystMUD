-- phpMyAdmin SQL Dump
-- version 3.2.3-rc1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 15 Novembre 2009 à 20:27
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
  `name` varchar(50) NOT NULL,
  `src` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

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
  `name` text NOT NULL,
  `expire` bigint(20) NOT NULL,
  `items` text NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `zone` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `body`
--


-- --------------------------------------------------------

--
-- Structure de la table `command`
--

CREATE TABLE IF NOT EXISTS `command` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `mob` tinyint(1) NOT NULL,
  `ko` tinyint(1) NOT NULL,
  `authlevel` tinyint(4) NOT NULL,
  `min_args` tinyint(4) NOT NULL,
  `arg` varchar(100) NOT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `syntax` varchar(200) NOT NULL,
  `help` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `command`
--

INSERT INTO `command` (`id`, `name`, `type`, `mob`, `ko`, `authlevel`, `min_args`, `arg`, `keyboard`, `syntax`, `help`) VALUES
('aide', 'aide', 'divers', 0, 1, 0, 0, '', 1, 'aide [commande]', 'Affiche de l''aide sur la <b>commande</b> ou affiche une liste des commandes'),
('cast', 'cast', 'action', 1, 0, 0, 2, '2,ID', 1, 'cast heuu sort', 'Lance un sortilège.'),
('chat', 'chat', 'communication', 0, 0, 0, 1, '1,INPUT', 1, 'chat message', 'Envoie un message à tous les joueurs connectés.'),
('clone', 'clown', 'G.OLC', 0, 1, 1, 2, '', 0, 'clone class id', 'Clone l''objet de classe <b>class</b> identifié par <b>id</b> et lui attribue un nouvel identifiant'),
('drop', 'drop', 'action', 1, 0, 0, 2, '1,NB_ALL;2,ID', 1, 'drop [nombre] objet', 'Pose un objet de votre inventaire à votre position. "drop *" pour tout poser.'),
('dump', 'dump', 'G.divers', 0, 1, 1, 1, '', 0, 'dump variable', 'Affiche la structure d''une <b>variable</b>.<br><u>Exemple :</u> dump commands'),
('edit', 'edit', 'G.OLC', 0, 1, 1, 2, '', 0, 'edit class id', 'Affiche une page de modification pour l''objet de classe <b>class</b> identifié par <b>id</b>'),
('examine', 'examine', 'divers', 0, 0, 0, 2, '2,ID', 1, 'examine quelque-chose', 'Permet de scruter un corps ou examiner un objet de votre inventaire.'),
('force', 'force', 'G.gestion', 0, 1, 1, 2, '2,INPUT', 0, 'force someone <action>', 'Permet de forcer un personnage à faire quelque chose.'),
('get', 'get', 'action', 1, 0, 0, 2, '1,NB_ALL;2,ID', 1, 'get [nombre] [objet] [from corps]', 'Ramasse un objet présent à votre position.</li><li>L''<b>objet</b> entré est recherché alphabétiquement dans une liste d''objets :<br>\r\n- au sol : <b><i>get * épée</i></b> avec * désignant le nombre d''exemplaires disponibles.<br>\r\n- dans un conteneur : <b><i>get * épée from souris</b></i>, souris étant le conteneur (dans ce cas le corps d''une souris morte)</li><li>Le nombre d''exemplaires à ramasser est optionnel (1 si non précisé)</li><li>L''objet recherché est optionnel (<b><i>get *</b></i> ramassera tous les objets au sol)'),
('give', 'give', 'action', 1, 0, 0, 2, '2,NB_ALL;3,ID', 1, 'give nom [nombre] objet', 'Donne un objet à quelqu''un près de vous (joueur ou créature).'),
('giveXp', 'giveXp', 'G.gestion', 0, 1, 1, 2, '', 0, 'giveXp player xp', 'Confère <b>xp</b> points d''expériences à <b>player</b>'),
('goto', 'gowto', 'G.divers', 0, 1, 1, 0, '', 0, 'goto [zone]', 'Affiche la liste des zones où déplace vers la zone indiquée'),
('help', 'help', 'G.divers', 0, 1, 1, 0, '', 0, 'help [command]', 'Affiche de l''aide sur <b>command</b> ou affiche une liste des commandes'),
('inventory', 'inventory', 'gestion', 0, 0, 0, 0, '', 1, 'inventory', 'Liste les objets que vous avez sur vous.'),
('kill', 'kill', 'action', 1, 0, 0, 1, '1,ID', 1, 'kill cible', 'Engage un combat à mort avec la cible.'),
('layer', 'layer', 'G.OLC', 0, 1, 1, 0, '', 0, 'layer icon=c00 layer_number=1', 'Change l''icone de la salle ou vous vous trouver par <b>icon</b> sur la couche <b>layer_number</b>'),
('look', 'look', 'divers', 0, 1, 0, 0, '1,INPUT', 1, 'look', 'Vous regardez autours de vous.'),
('lvUp', 'lvUp', 'G.gestion', 0, 1, 1, 1, '', 0, 'lvUp player', 'Incrémente le niveau de <b>player</b> sans laisser d''xp au delà'),
('move', 'move', 'action', 1, 0, 0, 1, '', 0, 'move', ''),
('olc', 'olc', 'G.OLC', 0, 1, 1, 0, '', 0, 'olc [class]', 'Affiche la liste des classes ainsi que la liste des objets de la classe précisée.'),
('olcShow', 'olcShow', 'G.OLC', 0, 1, 1, 2, '', 0, 'olc_show class id', 'Affiche les données de l''objet de classe <b>class</b> et d''identifiant <b>id</b>'),
('option', 'option', 'divers', 0, 1, 0, 0, '', 1, 'option', 'Accède à un panneau permettant de régler différentes options.'),
('optionSignal', 'optionSignal', 'divers', 0, 1, 0, 0, '', 0, 'optionSignal', 'Il n''y a pas d''aide là-dessus.'),
('optionSkin', 'optionSkin', 'divers', 0, 0, 0, 0, '', 0, 'optionSkin', 'Il n''y a pas d''aide là-dessus.'),
('php', 'php', 'G.divers', 0, 1, 1, 1, '1,PHP_INPUT', 0, 'php script_php', 'Exécute <b>script_php</b>.<br><u>Exemple :</u> php save::world();'),
('playerlist', 'playerlist', 'divers', 0, 1, 0, 0, '', 0, 'playerlist', ''),
('pray', 'pray', 'communication', 0, 0, 0, 1, '1,INPUT', 1, 'pray message', 'Permet de contacter un admin afin de faire une demande ou signaler un problème quelconque.'),
('remove', 'remove', 'gestion', 1, 0, 0, 0, '1,WEARON', 1, 'remove objet', 'Remet un objet équipé dans votre sac.'),
('rwalkable', 'rwalkable', 'G.OLC', 0, 1, 1, 0, '', 0, 'rwalkable', 'Rends la salle où vous êtes innaccessible aux joueurs ou annule l''effet'),
('say', 'say', 'communication', 1, 0, 0, 1, '1,INPUT', 1, 'say message', 'Vous dites quelque chose à voix normale et  ne serez entendu que par des personnes à proximité.'),
('selectAvatar', 'selectAvatar', 'gestion', 0, 0, 0, 1, '1,ID', 0, 'selectAvatar', 'Il n''y a pas d''aide là-dessus.'),
('selectSkin', 'selectSkin', 'gestion', 0, 0, 0, 1, '1,ID', 0, 'selectSkin', 'Il n''y a pas d''aide là-dessus.'),
('set', 'set', 'G.OLC', 0, 1, 1, 4, '4,HTML_INPUT', 0, 'set class id variable value', 'Donne la valeur <b>value</b> à la <b>variable</b> pour l''objet de classe <b>class</b> identifié par <b>id</b>'),
('shop', 'shop', 'divers', 0, 0, 0, 0, '', 0, 'shop', 'Affiche l''inventaire des objets à vendre dans un magasin s''il y en a un à votre position.'),
('shout', 'shout', 'communication', 1, 0, 0, 1, '1,INPUT', 1, 'shout message', 'Envoie un message aux personnages se trouvant dans la zone.'),
('summonItem', 'summonItem', 'G.OLC', 0, 1, 1, 1, '', 0, 'summonItem id number', 'Invoque <b>number</b> objets d''id <b>id</b> dans votre inventaire'),
('tell', 'tell', 'communication', 0, 0, 0, 2, '2,INPUT', 1, 'tell nom message', 'Dit à <b>nom</b>, le <b>message</b>. Sensible à la casse et à l''état du joueur visé.'),
('time', 'time', 'divers', 0, 0, 0, 0, '', 1, 'time', 'Affiche la date et l''heure actuelle.'),
('wear', 'wear', 'gestion', 1, 0, 0, 1, '1,WEARON', 1, 'wear objet', 'Équipe un objet de votre inventaire.'),
('who', 'who', 'divers', 0, 0, 0, 0, '', 1, 'who', 'Affiche la liste des joueurs connectés.'),
('zcreate', 'zcreate', 'G.OLC', 0, 1, 1, 1, '1,INPUT', 0, 'zcreate name', 'Créé une nouvelle zone nommée par <b>name</b>'),
('zedit', 'zedit', 'G.OLC', 0, 1, 1, 0, '', 0, 'zedit', 'Affiche l''éditeur de zone,les changements s''appliqueront en fonction de votre position'),
('zresize', 'zresize', 'G.OLC', 0, 1, 1, 0, '', 0, 'zresize [cols, 25] [rows, 9] [icon, c00]', 'Redimensionne une zone et la remplie avec <b>icon</b>'),
('ztp', 'ztp', 'G.OLC', 0, 1, 1, 1, '', 0, 'ztp bool', 'Configure un point de départ ou créée une téléportation vers un point d''arrivée'),
('zwalkable', 'zwalkable', 'G.OLC', 0, 1, 1, 0, '', 0, 'zwalkable', 'Permet d''annuler l''effet de <a href="javascript:p(''help.rwalkable'')">rwalkable</a> sur toutes les salles de la zone où vous êtes');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE IF NOT EXISTS `commentaires` (
  `commentaire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commentaires`
--

INSERT INTO `commentaires` (`commentaire`) VALUES
('0 => "Cheville gauche",\r\n1 => "Cheville droite",\r\n2 => "Bras gauche",\r\n3 => "Bras droit",\r\n4 => "Dos",\r\n5 => "Torse",\r\n6 => "Oreille gauche",\r\n7 => "Oreille droite",\r\n8 => "Yeux",\r\n9 => "Doigt gauche",\r\n10 => "Doigt droit",\r\n11 => "Pieds",\r\n12 => "Front",\r\n13 => "Gants",\r\n14 => "Tete",\r\n15 => "Jambes",\r\n16 => "Cou",\r\n17 => "Taille",\r\n18 => "Main gauche",\r\n19 => "Main droite",\r\n20 => "Poignet gauche",\r\n21 => "Poignet droit"');

-- --------------------------------------------------------

--
-- Structure de la table `god`
--

CREATE TABLE IF NOT EXISTS `god` (
  `id` int(11) NOT NULL,
  `teleport` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `name` varchar(10) CHARACTER SET utf8 NOT NULL,
  `password` varchar(120) CHARACTER SET utf8 NOT NULL,
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
  `skin` varchar(20) COLLATE latin1_german2_ci NOT NULL DEFAULT 'default',
  `avatar` varchar(20) COLLATE latin1_german2_ci NOT NULL DEFAULT 'default',
  `status` varchar(30) COLLATE latin1_german2_ci NOT NULL,
  `whom` int(11) NOT NULL,
  `spells` text COLLATE latin1_german2_ci NOT NULL,
  `inv` text COLLATE latin1_german2_ci NOT NULL,
  `equip` text COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `heroe`
--

INSERT INTO `heroe` (`id`, `name`, `password`, `god`, `zone`, `x`, `y`, `xp`, `lv`, `hp`, `maxhp`, `mp`, `maxmp`, `str`, `con`, `wis`, `dex`, `skin`, `avatar`, `status`, `whom`, `spells`, `inv`, `equip`) VALUES
(1, 'Arsenic', '37eff4bfa7d88a6e75c8804ecff8659b', 1, 1, 0, 0, 0, 1, 42, 120, 10, 10, 5, 5, 5, 5, 'Queen01', 'epeiste2', '', 0, 'a:0:{}', 'a:3:{i:2;i:18;i:1;i:14;i:3;i:100;}', 'a:1:{i:18;i:1;}'),
(6, 'Conap', 'b7a616d4e7c1c12289c6bf3885f62f1a', 1, 1, 5, 5, 1514, 1, 46, 70, 10, 10, 8, 5, 5, 5, 'default', 'default', '', 0, 'a:0:{}', 'a:0:{}', 'a:0:{}'),
(8, 'Maxime', 'b238c13e822536cad3ac57a2280fbf45', 0, 1, 0, 0, 0, 1, 60, 60, 10, 10, 5, 5, 5, 5, 'default', 'default', '', 0, 'a:0:{}', 'a:0:{}', 'a:0:{}');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 NOT NULL,
  `weight` int(11) NOT NULL,
  `wearon` text COLLATE latin1_german2_ci NOT NULL,
  `desc` text COLLATE latin1_german2_ci NOT NULL,
  `stats` text CHARACTER SET utf8 NOT NULL,
  `power` text COLLATE latin1_german2_ci NOT NULL,
  `required` text COLLATE latin1_german2_ci NOT NULL,
  `value` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `name`, `type`, `weight`, `wearon`, `desc`, `stats`, `power`, `required`, `value`) VALUES
(1, 'une épée en bois de cerisier', 'weapon', 1, 'a:2:{i:0;i:18;i:1;i:19;}', 'Cette épée d''entraînement ne permet de tuer que des rats (et encore)...', 'a:2:{s:6:"damage";i:25;s:11:"damage_type";s:9:"tranchant";}', '', 'a:1:{s:3:"lvl";i:1;}', 0),
(2, 'un bâton de shaman', 'weapon', 10, 'a:2:{i:0;i:18;i:1;i:19;}', 'C''est un bâton robuste orné d''une mâchoire de gobelin.', 'a:2:{s:6:"damage";i:25;s:11:"damage_type";s:9:"tranchant";}', '', 'a:1:{s:3:"lvl";i:1;}', 0),
(3, 'une pièce d''or', 'money', 0, 'a:0:{}', 'Ces pièces sont très utilisées dans le commerce.', 'a:0:{}', '', 'a:0:{}', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mob`
--

CREATE TABLE IF NOT EXISTS `mob` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 NOT NULL,
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
  `skin` varchar(20) COLLATE latin1_german2_ci NOT NULL DEFAULT 'default',
  `avatar` varchar(20) COLLATE latin1_german2_ci NOT NULL DEFAULT 'default',
  `status` varchar(30) COLLATE latin1_german2_ci NOT NULL,
  `whom` int(11) NOT NULL DEFAULT '0',
  `spells` text COLLATE latin1_german2_ci NOT NULL,
  `inv` text COLLATE latin1_german2_ci NOT NULL,
  `equip` text COLLATE latin1_german2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci AUTO_INCREMENT=1000001 ;

--
-- Contenu de la table `mob`
--

INSERT INTO `mob` (`id`, `name`, `zone`, `x`, `y`, `xp`, `lv`, `hp`, `maxhp`, `mp`, `maxmp`, `str`, `con`, `wis`, `dex`, `skin`, `avatar`, `status`, `whom`, `spells`, `inv`, `equip`) VALUES
(1000000, 'une souris', 1, 0, 0, 0, 1, 50, 50, 100, 100, 5, 5, 5, 5, 'mob/souris', 'mob/souris', '', 0, 'a:0:{}', 'a:0:{}', 'a:0:{}');

-- --------------------------------------------------------

--
-- Structure de la table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `keeper` int(11) NOT NULL,
  `zone` varchar(80) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `items` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `shop`
--


-- --------------------------------------------------------

--
-- Structure de la table `signal`
--

CREATE TABLE IF NOT EXISTS `signal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `signal`
--


-- --------------------------------------------------------

--
-- Structure de la table `skin`
--

CREATE TABLE IF NOT EXISTS `skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `src` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=204 ;

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
  `name` varchar(40) NOT NULL,
  `description` varchar(300) NOT NULL,
  `min_cost` int(11) NOT NULL,
  `max_cost` int(11) NOT NULL,
  `school` varchar(20) NOT NULL,
  `func` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `spell`
--


-- --------------------------------------------------------

--
-- Structure de la table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `id` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `system`
--

INSERT INTO `system` (`id`, `value`) VALUES
('world_time', '194192.52146077');

-- --------------------------------------------------------

--
-- Structure de la table `umob`
--

CREATE TABLE IF NOT EXISTS `umob` (
  `id` bigint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE latin1_german2_ci NOT NULL,
  `zone` int(11) NOT NULL DEFAULT '1',
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `xp` int(11) NOT NULL DEFAULT '0',
  `lv` smallint(6) NOT NULL DEFAULT '1',
  `hp` int(11) NOT NULL DEFAULT '10',
  `mp` int(11) NOT NULL DEFAULT '10',
  `str` int(11) NOT NULL DEFAULT '5',
  `con` int(11) NOT NULL DEFAULT '5',
  `wis` int(11) NOT NULL DEFAULT '5',
  `dex` int(11) NOT NULL DEFAULT '5',
  `skin` varchar(20) COLLATE latin1_german2_ci NOT NULL DEFAULT 'default',
  `avatar` varchar(20) COLLATE latin1_german2_ci NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci AUTO_INCREMENT=1000002 ;

--
-- Contenu de la table `umob`
--

INSERT INTO `umob` (`id`, `name`, `zone`, `x`, `y`, `xp`, `lv`, `hp`, `mp`, `str`, `con`, `wis`, `dex`, `skin`, `avatar`) VALUES
(1000001, 'une souris', 1, 0, 0, 0, 1, 100, 10, 5, 5, 5, 5, 'mob/souris', 'mob/souris');

-- --------------------------------------------------------

--
-- Structure de la table `unitem`
--

CREATE TABLE IF NOT EXISTS `unitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isin` varchar(10) CHARACTER SET utf8 NOT NULL,
  `owner` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `number` int(11) NOT NULL,
  `cstat` text CHARACTER SET utf8 NOT NULL,
  `cpower` text COLLATE latin1_german2_ci NOT NULL,
  `color` text CHARACTER SET utf8 NOT NULL,
  `iid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `unitem`
--

INSERT INTO `unitem` (`id`, `isin`, `owner`, `number`, `cstat`, `cpower`, `color`, `iid`) VALUES
(1, 'room', '001', 3, '', '', '', 1),
(2, 'inv', '1', 2, '', '', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `layer1` text NOT NULL,
  `layer2` text NOT NULL,
  `layer3` text NOT NULL,
  `walkable` text NOT NULL,
  `items` text NOT NULL,
  `tp` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `zone`
--

INSERT INTO `zone` (`id`, `name`, `x`, `y`, `layer1`, `layer2`, `layer3`, `walkable`, `items`, `tp`) VALUES
(1, 'Le Myst du milieu', 24, 8, 'c00c00c00c00c00c00e42e00e00c00c00c00c00c00e24e10e00e00c00c00c00c00c00e42e00e00e00c00c00c00c00c00e42e00e00e00c00c00c00c00c00e44e03e03e03c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c80c80c80c80c80c80c80c80c80c81c81c81c81c81c81c81c81c81c82c82c82c82c82c82c82c82c82c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00c00', '33c1523c1475cf665cf585cf755cf492cb193cc1a3cc2b3cc2c3cc2d3cc3d2cb3c2cb2b2cb2a2cb2h4ca5g4ca4i3c11j3c11k2c11j2c11j1c11k1c11k0c11j0c11h3c11h2c11g2c11g3c11f2c11e2c11d4c13l2ca6m2ca7e5c13e7c13d8c13n7cf5o7cf6m7cf4m6cc7o2c1605c1104c0113c0103c0122c0121c0131c0132c0142c0152c0162c0172c0182c0183c0112c01', '32c0522c0464ce554ce474ce673cd683cd763cd553cd452cc462cc572cc682cc771cb661cb584ce7h3c95g3c94g2c84h2c85d3c03d1c02d0c1290c0291c12m1c97l1c94l0c84m0c87e6c03e4c03d7c03d6v01k5cb5l5cb6l6cc6m7cd7m8ce7l8ce6k8ce5j8ce4j7cd4k7cd5l7cd6k6cc5m6ce4j6cc4n6ce5o6ce6m5cd4n5cc5o5cc6o4cc6n4cc5m4cc4n3cb5o3cb6o1c0677cb587cb698cc788cc578cc568cc4', '23336575a1a0b0b1b3a3a4b8b7b6b5b4a8a7a6a5c8c7c6c5c4c3c1c0l4h4g49190d0d1d8e7e5d4n7o7o215253545464748383736262728181716060708', 'a:1:{s:3:"001";N;}', 'a:2:{s:3:"j01";s:3:"i72";s:3:"k01";s:3:"j72";}'),
(2, 'Le Port de Melte', 59, 19, 'e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e40e03e03e03e20e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e40e03e64c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00e24e02e10e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e43c00c00c00e42e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e01e02e02e02e10e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00e00', 'o9ce2n9ce1nacf1oacf2pacf3p9ce3', 'o8cd2', 'paoanan9o9n8o8p8', 'a:0:{}', 'a:2:{s:3:"i82";s:3:"j11";s:3:"j82";s:3:"k11";}');
