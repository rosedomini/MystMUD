﻿-- phpMyAdmin SQL Dump
-- version 2.11.3deb1ubuntu1.3
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Jeu 03 Juin 2010 à 17:02
-- Version du serveur: 5.0.51
-- Version de PHP: 5.2.4-2ubuntu5.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `myst`
--

-- --------------------------------------------------------

--
-- Structure de la table `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `area`
--

INSERT INTO `area` (`id`, `name`) VALUES
(1, 'L''Académie de Mira');

-- --------------------------------------------------------

--
-- Structure de la table `avatar`
--

CREATE TABLE IF NOT EXISTS `avatar` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `source` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

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
  `name` text NOT NULL,
  `expire` bigint(20) NOT NULL,
  `inv` text NOT NULL,
  `room` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `body`
--


-- --------------------------------------------------------

--
-- Structure de la table `command`
--

CREATE TABLE IF NOT EXISTS `command` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `mob` tinyint(1) NOT NULL,
  `ko` tinyint(1) NOT NULL,
  `authlevel` tinyint(4) NOT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `link` tinyint(4) NOT NULL,
  `syntax` varchar(200) NOT NULL,
  `help` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

--
-- Contenu de la table `command`
--

INSERT INTO `command` (`id`, `name`, `type`, `mob`, `ko`, `authlevel`, `keyboard`, `link`, `syntax`, `help`) VALUES
(1, 'affections', 'gestion', 0, 1, 0, 1, 0, 'affections', 'Affiche une liste des enchantements et maléfices qui vous affectent.'),
(2, 'aide', 'divers', 0, 1, 0, 1, 0, 'aide [&lt;commande&gt;]', 'Affiche une liste des commandes, ou des détails sur une commande.'),
(3, 'cast', 'action', 1, 0, 0, 1, 0, 'cast [&lt;puissance&gt;] &lt;sortilège&gt; [to &lt;cible&gt;]', 'La puissance par défaut est votre niveau dans le sort indiqué. Vous pouvez choisir de le lancer à plus faible niveau. Tapez spell &lt;sortilège&gt; pour voir le coût en magie du sort. Certains sorts peuvent être lancés sur une cible, qui doit être présente dans la salle. Lorsque la cible est vous même, il est inutile de le préciser.'),
(4, 'chat', 'communication', 0, 0, 0, 1, 0, 'chat &lt;message&gt;', 'Envoie un message à tous les joueurs connectés.'),
(5, 'clone', 'a_olc', 0, 1, 1, 1, 0, 'clone &lt;class&gt; &lt;id&gt;', 'Clone l''objet en question et lui attribue un nouvel identifiant.'),
(6, 'drag', 'action', 1, 0, 0, 1, 0, 'drag &lt;corps&gt; to &lt;direction&gt;', 'Permet de déplacer un corps avec soi vers une sortie.'),
(7, 'drop', 'action', 1, 0, 0, 1, 0, 'drop [&lt;nombre&gt;] &lt;objet&gt;', 'Pose un objet de votre inventaire sur le sol. "drop *" pour tout poser.'),
(8, 'dump', 'a_divers', 0, 1, 1, 1, 0, 'dump &lt;variable&gt;', 'Inspecte une variable. Permet aussi d''activer ou désactiver l''affichage sur le terminal des réponses aux commandes.'),
(9, 'eat', 'gestion', 1, 0, 0, 1, 0, 'eat &lt;object&gt;', 'Permet de manger un objet. N''essayez cependant pas de manger des objets en mithril !'),
(10, 'edit', 'a_olc', 0, 1, 1, 1, 0, 'edit &lt;class&gt; &lt;id&gt;', 'Affiche une page d''édition de l''objet en question.'),
(11, 'equipement', 'gestion', 0, 0, 0, 1, 0, 'equipement', 'Liste les objets que vous portez sur le corps.'),
(12, 'examine', 'divers', 0, 0, 0, 1, 0, 'examine &lt;quelque-chose&gt;', 'Permet de scruter un corps ou examiner un objet de votre inventaire.'),
(13, 'force', 'a_gestion', 0, 1, 1, 1, 0, 'force &lt;someone&gt; to &lt;action&gt;', 'Permet de forcer un personnage à faire quelque chose.'),
(14, 'get', 'action', 1, 0, 0, 1, 0, 'get [&lt;nombre&gt;] &lt;objet&gt; [from &lt;conteneur&gt;]', 'Permet de ramasser un ou plusieurs objets depuis un conteneur, qui peut être un corps ou un coffre. Si le conteneur n''est pas précisé, il s''agira du sol.'),
(15, 'give', 'action', 1, 0, 0, 1, 0, 'give &lt;nom&gt; [&lt;nombre&gt;] &lt;objet&gt;', 'Donne un objet à quelqu''un près de vous (joueur ou créature).'),
(16, 'giveXp', 'a_gestion', 0, 1, 1, 1, 0, 'giveXp &lt;nom&gt; &lt;nombre&gt;', 'Confère des points d''expérience au joueur précisé.'),
(17, 'goto', 'a_divers', 0, 1, 1, 1, 0, 'goto [&lt;zone&gt;]', 'Affiche une liste des zones ou permet de se déplacer vers la zone indiquée.'),
(18, 'help', 'a_divers', 0, 1, 1, 1, 0, 'help [&lt;commande&gt;]', 'Autre version de l''aide mais pour les immortels.'),
(19, 'include', 'a_divers', 0, 1, 1, 1, 0, 'include &lt;path&gt;', 'L''interpréteur tentera de charger ou recharger le fichier précisé.'),
(20, 'inventory', 'gestion', 0, 0, 0, 1, 0, 'inventory', 'La liste de vos objets.'),
(21, 'kill', 'action', 1, 0, 0, 1, 0, 'kill &lt;cible&gt;', 'Engage un combat à mort avec la cible.'),
(22, 'look', 'divers', 0, 1, 0, 1, 0, 'look [&lt;nom&gt;]', 'Pour regarder autours de vous, ou une personne ou créature en particulier.'),
(23, 'lvUp', 'a_gestion', 0, 1, 1, 1, 0, 'lvUp &lt;nom&gt;', 'Incrémente le niveau du joueur en mettant son expérience pour ce niveau à zéro.'),
(24, 'olc', 'a_olc', 0, 1, 1, 1, 0, 'olc [&lt;class&gt;]', 'Affiche la liste des classes ainsi que la liste des objets de la classe précisée si précisée.'),
(25, 'olcShow', 'a_olc', 0, 1, 1, 1, 0, 'olc_show &lt;class&gt; &lt;id&gt;', 'Affiche les données sur l''objet en question.'),
(26, 'option', 'divers', 0, 1, 0, 1, 0, 'option', 'Accède à un panneau permettant de régler différentes options.'),
(27, 'pray', 'communication', 0, 0, 0, 1, 0, 'pray &lt;message&gt;', 'Permet de contacter un immortel afin de faire une demande ou signaler un problème quelconque.'),
(28, 'rcreate', 'a_olc', 0, 1, 1, 1, 0, 'rcreate /[nseobh]/', 'Exemple : rcreate n pour créer une nouvelle salle au nord et la rejoindre.\r\nLes sorties seront reconfigurées automatiquement.'),
(29, 'redit', 'a_olc', 0, 1, 1, 1, 0, 'redit', 'Affiche l''éditeur de salles.'),
(30, 'remove', 'gestion', 1, 0, 0, 1, 0, 'remove &lt;objet&gt;', 'Remet un objet équipé dans votre sac.'),
(31, 'reply', 'communication', 0, 0, 0, 1, 0, 'reply &lt;nom&gt;', 'Permet de répondre à quelqu''un après qu''il vous ai envoyé un message via la commande tell.'),
(32, 'ruby', 'a_divers', 0, 1, 1, 1, 0, 'ruby &lt;code&gt;', 'Faire exécuter un code par l''interpréteur, lié à vous.<br><u>Exemple : ruby Save.world; wiz @room.name (sauvegarde le monde ; vous envoi le nom de la salle qui vous est liée.)'),
(33, 'say', 'communication', 1, 0, 0, 1, 0, 'say &lt;message&gt;', 'Vous dites quelque chose d''une voix à volume normal et ne serez entendu que par des personnes à proximité.'),
(34, 'score', 'gestion', 0, 1, 0, 1, 0, 'score', 'Affiche diverses informations sur votre personnage.'),
(35, 'selectAvatar', 'gestion', 0, 0, 0, 0, 1, 'selectAvatar', 'Il n''y a pas d''aide là-dessus.'),
(36, 'selectSkin', 'gestion', 0, 0, 0, 0, 1, 'selectSkin', 'Il n''y a pas d''aide là-dessus.'),
(37, 'set', 'a_olc', 0, 1, 1, 1, 0, 'set &lt;class&gt; &lt;id&gt; &lt;variable&gt; &lt;value&gt;', 'Attribue une valeur à la variable précisée.'),
(38, 'shortcut', 'gestion', 0, 1, 0, 0, 1, 'shortcut &lt;action&gt; &lt;id&gt;', 'Permet de modifier les raccourcis.'),
(39, 'shout', 'communication', 1, 0, 0, 1, 0, 'shout &lt;message&gt;', 'Envoie un message aux personnages se trouvant dans votre zone.'),
(40, 'special', 'divers', 1, 1, 0, 0, 1, 'non définie', 'Il n''y a pas d''aide à ce sujet.'),
(41, 'spell', 'divers', 0, 1, 0, 1, 0, 'spell &lt;sortilège&gt;', 'Affiche des informations sur un sort. À ne pas confondre avec la commande spells.'),
(42, 'spells', 'gestion', 0, 1, 0, 1, 0, 'spells', 'Affiche une liste des sortilèges que vous connaissez et votre niveau de maîtrise pour ces sorts. À ne pas confondre avec la commande spell.'),
(43, 'summonItem', 'a_olc', 0, 1, 1, 1, 0, 'summonItem [&lt;nombre&gt;] &lt;objet&gt;', 'Invoquer un objet dans votre inventaire.'),
(44, 'tell', 'communication', 0, 0, 0, 1, 0, 'tell &lt;nom&gt; &lt;message&gt;', 'Envoie un message à quelqu''un. Le joueur visé doit être connecté.'),
(45, 'time', 'divers', 0, 0, 0, 1, 0, 'time', 'Affiche la date et l''heure actuelle, avec une liste des mois de l''année.'),
(46, 'wear', 'gestion', 1, 0, 0, 1, 0, 'wear &lt;objet&gt;', 'Équipe un objet de votre inventaire.'),
(47, 'who', 'divers', 0, 0, 0, 1, 0, 'who [*]', '"who" affiche la liste des joueurs connectés. "who *" affiche la liste de tous les joueurs.'),
(148, 'junk', 'gestion', 1, 0, 0, 1, 0, 'junk [&lt;nombre&gt;] &lt;object&gt;', 'Permet de détruire un ou plusieurs exemplaires d''un objet de votre inventaire.'),
(149, 'delete', 'a_gestion', 0, 0, 1, 1, 0, 'delete &lt;type&gt; &lt;id&gt;', 'Procédure de destruction d''''objets. Exemple: delete room 5\\r\\n\\r\\nTypes possibles: room');

-- --------------------------------------------------------

--
-- Structure de la table `heroe`
--

CREATE TABLE IF NOT EXISTS `heroe` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(10) NOT NULL,
  `password` varchar(120) NOT NULL,
  `authlevel` tinyint(4) NOT NULL,
  `desc` text NOT NULL,
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
  `skin` varchar(20) NOT NULL default 'default',
  `avatar` varchar(20) NOT NULL default 'default',
  `spell` text NOT NULL,
  `inv` text NOT NULL,
  `equip` text NOT NULL,
  `shortcut` text NOT NULL,
  `hunger` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `heroe`
--

INSERT INTO `heroe` (`id`, `name`, `password`, `authlevel`, `desc`, `room`, `xp`, `level`, `hp`, `maxhp`, `mp`, `maxmp`, `str`, `con`, `wis`, `dex`, `skin`, `avatar`, `spell`, `inv`, `equip`, `shortcut`, `hunger`) VALUES
(1, 'Arsenic', '37eff4bfa7d88a6e75c8804ecff8659b', 1, '{:taille=>1, :haircolor=>1, :hairlength=>1, :eyecolor=>1}', 2, 26, 2, 28, 28, 1000, 1000, 5, 8, 5, 5, 'default', 'default', '{1=>72, 2=>100}', '{2=>5}', '{}', '[["Weapon 8", "Joyaux 6", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["test", "o", "inventory", "who", "get *", "option", "n", "s", "e", "aide"]]', -1920),
(2, 'Dominic', '37eff4bfa7d88a6e75c8804ecff8659b', 1, '{:taille=>1, :haircolor=>1, :hairlength=>1, :eyecolor=>1}', 1, 0, 1, 20, 20, 10, 10, 5, 5, 5, 5, 'default', 'default', '{}', '{}', '{}', '[["Lettre 2", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["option shortcut", "inventory", "who", "get *", "option", "o", "n", "s", "e", "aide"]]', -2580),
(3, 'Maxime', 'b238c13e822536cad3ac57a2280fbf45', 1, '{:taille=>4, :haircolor=>5, :hairlength=>2, :eyecolor=>3}', 1, 0, 1, 20, 20, 10, 10, 5, 5, 5, 5, 'default', 'default', '{}', '{}', '{}', '[["Lettre 2", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["option shortcut", "inventory", "who", "get *", "option", "o", "n", "s", "e", "aide"]]', 0);

-- --------------------------------------------------------

--
-- Structure de la table `icon`
--

CREATE TABLE IF NOT EXISTS `icon` (
  `id` int(11) NOT NULL auto_increment,
  `source` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

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
  `name` varchar(80) NOT NULL,
  `type` varchar(25) NOT NULL,
  `weight` int(11) NOT NULL,
  `wearon` text NOT NULL,
  `desc` text NOT NULL,
  `stats` text NOT NULL,
  `power` text NOT NULL,
  `required` text NOT NULL,
  `value` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `name`, `type`, `weight`, `wearon`, `desc`, `stats`, `power`, `required`, `value`) VALUES
(1, 'une épée en bois de cerisier', 'nourriture', 1, '[:bras_gauche, :bras_droit]', 'Cette épée d''entraînement ne permet de tuer que des rats (et encore)...', '{}', '{}', '{}', 0),
(2, 'un petit cèpe', 'nourriture', 1, '[]', 'C''est un champignon appétissant.', '{:rassasiment=>240}', '{}', '{}', 20),
(3, 'une pièce d''or', 'money', 0, '[]', 'Ces pièces sont très utilisées dans le commerce.', '{}', '{}', '{}', 1),
(4, 'une vesse-de-loup', 'nourriture', 1, '[]', 'Les vesses-de-loup sont des champignons très répandus dans les prés et les bois, facilement reconnaissables à leur couleur blanche ou grisâtre, et au fait que lorsqu''ils sont vieux ils se transforment en sacs remplis d''une poussière brune, véritables petits volcans quand on appuie dessus.', '{:rassasiment=>240}', '{}', '{}', 10),
(5, 'un cortinaire violet', 'nourriture', 1, '[]', 'Un champignon assez rare, mais comestible, construit par des lames violettes ventrues, espacées et épaisses, poudrées de brun rouille avec l''âge sous un châpeau cônique puis étalé avec un mamelon obtus, charnu violet foncé. Le tout disposé sur un pied pouvant atteindre 15cm, s''épaississant jusqu''à la base du pied. Il présente des traces fugaces de cortine bleue.', '{:rassasiment=>600}', '{}', '{}', 100),
(6, 'un morceau de gelée bleue', 'nourriture', 1, '[]', 'C''est un petit morceau de gelée à manger, d''une couleur bleue et translucide.', '{}', '{:eat=>[:gain_de_vie, 50, 1000]}', '{}', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mob`
--

CREATE TABLE IF NOT EXISTS `mob` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
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
  `skin` varchar(20) NOT NULL default 'default',
  `avatar` varchar(20) NOT NULL default 'default',
  `spell` text NOT NULL,
  `inv` text NOT NULL,
  `equip` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `mob`
--


-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL auto_increment,
  `area` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `desc` text NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  `inv` text NOT NULL,
  `items` text NOT NULL,
  `exits` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `room`
--

INSERT INTO `room` (`id`, `area`, `name`, `desc`, `x`, `y`, `z`, `inv`, `items`, `exits`) VALUES
(1, 1, 'Cour de l''académie', 'Vous vous trouvez dans une grande cour adjacente à l''entrée de l''Académie de Mira, le lieu de formation des mages et guerriers de votre ville natale. L''entraînement au combat se fait dans les jardins à l''ouest. Tapez <font color=orange><b>o</b></font> ou <font color=orange><b>ouest</b></font> pour vous y aventurer. Vous pouvez aussi choisir d''entrer dans l''académie et voir ce qui vous y attends.', 0, 0, 0, '{}', '{}', '{:ouest=>2}'),
(2, 1, 'Jardins de l''académie', 'Cet endroit est calme et reposant de part la grandeur des arbres. Les nombreuses odeurs des plantes viennent vous piquer les narines. C''est l''endroit favori du maître d''armes, et il y passe la plupart de son temps.', -1, 0, 0, '{}', '{}', '{:est=>1}');

-- --------------------------------------------------------

--
-- Structure de la table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL,
  `keeper` int(11) NOT NULL,
  `room` int(11) NOT NULL default '1',
  `inv` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `shop`
--


-- --------------------------------------------------------

--
-- Structure de la table `signal`
--

CREATE TABLE IF NOT EXISTS `signal` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `signal`
--


-- --------------------------------------------------------

--
-- Structure de la table `skin`
--

CREATE TABLE IF NOT EXISTS `skin` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `source` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=204 ;

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
  `name` varchar(40) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `min_cost` int(11) NOT NULL,
  `max_cost` int(11) NOT NULL,
  `school` varchar(20) NOT NULL,
  `func` varchar(40) NOT NULL,
  `arg_target` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `spell`
--

INSERT INTO `spell` (`id`, `name`, `desc`, `min_cost`, `max_cost`, `school`, `func`, `arg_target`) VALUES
(1, 'boule de feu', 'Envoie une boule de feu sur l''adversaire.', 1, 20, 'violence', 'cast_boule_de_feu', 1),
(2, 'bouclier', 'Invoque un bouclier magique de couleur nacre autours de la cible.', 10, 30, 'protection', 'cast_bouclier', 1);

-- --------------------------------------------------------

--
-- Structure de la table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `system`
--

INSERT INTO `system` (`id`, `name`, `value`) VALUES
(1, 'world_time', '945081'),
(2, 'time_difference', '1274625761'),
(3, 'pray', '[]'),
(4, 'hack', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `world`
--

CREATE TABLE IF NOT EXISTS `world` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `areas` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `world`
--

INSERT INTO `world` (`id`, `name`, `areas`) VALUES
(1, 'Myst', '[1]');
