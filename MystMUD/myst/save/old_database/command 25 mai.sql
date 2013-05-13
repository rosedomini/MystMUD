-- phpMyAdmin SQL Dump
-- version 2.11.3deb1ubuntu1.3
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 25 Mai 2010 à 11:53
-- Version du serveur: 5.0.51
-- Version de PHP: 5.2.4-2ubuntu5.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `myst`
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=148 ;

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
(14, 'get', 'action', 1, 0, 0, 1, 0, 'get &lt;objet&gt; [from &lt;conteneur&gt;]', 'Permet de ramasser un ou plusieurs objets depuis un conteneur, qui peut être un corps ou un coffre. Si le conteneur n''est pas précisé, il s''agira du sol.'),
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
(43, 'summonItem', 'a_olc', 0, 1, 1, 1, 0, 'summonItem &lt;nombre&gt; &lt;objet&gt;', 'Invoquer un objet dans votre inventaire.'),
(44, 'tell', 'communication', 0, 0, 0, 1, 0, 'tell &lt;nom&gt; &lt;message&gt;', 'Envoie un message à quelqu''un. Le joueur visé doit être connecté.'),
(45, 'time', 'divers', 0, 0, 0, 1, 0, 'time', 'Affiche la date et l''heure actuelle, avec une liste des mois de l''année.'),
(46, 'wear', 'gestion', 1, 0, 0, 1, 0, 'wear &lt;objet&gt;', 'Équipe un objet de votre inventaire.'),
(47, 'who', 'divers', 0, 0, 0, 1, 0, 'who [*]', '"who" affiche la liste des joueurs connectés. "who *" affiche la liste de tous les joueurs.');
