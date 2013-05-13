#Command 1
{
	:@id => 1,
	:@name => "affections",
	:@french_name => "enchantements",
	:@type => :gestion,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "affections",
	:@help => "Affiche une liste des enchantements et maléfices qui vous affectent.",
},

#Command 2
{
	:@id => 2,
	:@name => "aide",
	:@french_name => "aide",
	:@type => :divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "help (<commande>) OU aide (<commande>)",
	:@help => "Affiche une liste des commandes, ou des détails sur une commande.",
},

#Command 3
{
	:@id => 3,
	:@name => "cast",
	:@french_name => "lancer",
	:@type => :action,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "cast (<puissance>) <sortilège>( on <cible>)",
	:@help => "La puissance par défaut est votre niveau dans le sort indiqué. Vous pouvez choisir de le lancer à plus faible niveau. Utilisez la commande <i><b>spell</i></b> pour plus de détails sur un sort. Certains sorts se lancent sur une cible, qui si non-précisée serait vous (protection), ou votre enemie (violence).",
},

#Command 4
{
	:@id => 4,
	:@name => "chat",
	:@french_name => "tchatter",
	:@type => :communication,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "chat <message>",
	:@help => "Envoie un message à tous les joueurs connectés (voir commande <i><b>who</i></b>. N'hésitez pas à utiliser cette commande, tant que ça ne dérange pas les autres.",
},

#Command 5
{
	:@id => 5,
	:@name => "clone",
	:@french_name => "cloner",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "clone <class> <id>",
	:@help => "Clone l'objet en question et lui attribue un nouvel identifiant.",
},

#Command 6
{
	:@id => 6,
	:@name => "drag",
	:@french_name => "traîner",
	:@type => :action,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "drag <corps> to <direction>",
	:@help => "Permet de déplacer un corps avec soi vers une sortie.",
},

#Command 7
{
	:@id => 7,
	:@name => "drop",
	:@french_name => "déposer",
	:@type => :action,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "drop (<nombre>) <objet>",
	:@help => "Pose un objet de votre inventaire sur le sol. \"drop *\" pour tout poser.",
},

#Command 8
{
	:@id => 8,
	:@name => "dump",
	:@french_name => "afficher",
	:@type => :a_divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "dump <variable>",
	:@help => "Inspecte une variable. Permet aussi d'activer ou désactiver l'affichage sur le terminal des réponses aux commandes.",
},

#Command 9
{
	:@id => 9,
	:@name => "eat",
	:@french_name => "manger",
	:@type => :gestion,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "eat <objet>",
	:@help => "Permet de manger un objet. N'essayez cependant pas de manger des objets en mithril !",
},

#Command 10
{
	:@id => 10,
	:@name => "edit",
	:@french_name => "éditer",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "edit <class> <id>",
	:@help => "Affiche une page d'édition de l'objet en question.",
},

#Command 11
{
	:@id => 11,
	:@name => "equipement",
	:@french_name => "équipement",
	:@type => :gestion,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "equipement",
	:@help => "Liste les objets que vous portez sur le corps.",
},

#Command 12
{
	:@id => 12,
	:@name => "examine",
	:@french_name => "examiner",
	:@type => :divers,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "examine <quelque-chose>",
	:@help => "Permet de scruter un corps ou examiner un objet de votre inventaire.",
},

#Command 13
{
	:@id => 13,
	:@name => "force",
	:@french_name => "forcer",
	:@type => :a_gestion,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "force <someone> to <action>",
	:@help => "Permet de forcer un personnage à faire quelque chose.",
},

#Command 14
{
	:@id => 14,
	:@name => "get",
	:@french_name => "ramasser",
	:@type => :action,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "get (<nombre>) <objet>( from <conteneur>)",
	:@help => "Permet de ramasser un ou plusieurs objets depuis un conteneur, qui peut être un corps ou un coffre. Si le conteneur n'est pas précisé, il s'agira du sol.",
},

#Command 15
{
	:@id => 15,
	:@name => "give",
	:@french_name => "donner",
	:@type => :action,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "give (<nombre>) <objet> to <nom>",
	:@help => "Donne un objet à quelqu'un près de vous (joueur ou créature).",
},

#Command 16
{
	:@id => 16,
	:@name => "giveXp",
	:@french_name => "donnerXp",
	:@type => :a_gestion,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "giveXp <nom> <nombre>",
	:@help => "Confère des points d'expérience au joueur précisé.",
},

#Command 17
{
	:@id => 17,
	:@name => "goto",
	:@french_name => "aller",
	:@type => :a_divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "goto (<salle>) ou goto <numéro de salle>",
	:@help => "Affiche une liste de toutes les salles, filtrée par le paramètre salle.\n\
Ainsi <b>goto jardin</b> affiche la liste des salles correspondant à <b>jardin</b>\n\
et <b>goto jardin 2</b> vous téléporte à la 2ème salle de la liste.\n\
<b>goto 27</b> amène à la salle numéro <b>27</b>",
},

#Command 18
{
	:@id => 18,
	:@name => "help",
	:@french_name => "aide",
	:@type => :divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "help (<commande>) OU aide (<commande>)",
	:@help => "Affiche une liste des commandes, ou des détails sur une commande.",
},

#Command 19
{
	:@id => 19,
	:@name => "load",
	:@french_name => "charger",
	:@type => :a_divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "load <path>",
	:@help => "L'interpréteur tentera de charger ou recharger le fichier précisé.",
},

#Command 20
{
	:@id => 20,
	:@name => "inventory",
	:@french_name => "inventaire",
	:@type => :gestion,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "inventory",
	:@help => "La liste de vos objets.",
},

#Command 21
{
	:@id => 21,
	:@name => "kill",
	:@french_name => "attaquer",
	:@type => :action,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "kill <cible>",
	:@help => "Engage un combat à mort avec la cible.",
},

#Command 22
{
	:@id => 22,
	:@name => "look",
	:@french_name => "observer",
	:@type => :divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "look (<nom>)",
	:@help => "Pour regarder autours de vous, ou une personne ou créature en particulier.",
},

#Command 24
{
	:@id => 24,
	:@name => "olc",
	:@french_name => "eel",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "olc (<class> (<filtre>))",
	:@help => "Affiche la liste des classes ou une liste d'objets de la classe précisée.\nFiltre :\n- non précisé : objets dans un rayon de 5 salles\n- * : tous les objets\n - autre : objets dont le nom contient le filtre",
},

#Command 25
{
	:@id => 25,
	:@name => "olcShow",
	:@french_name => "montrer_eel",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "olc_show <class> <id>",
	:@help => "Affiche les données sur l'objet en question.",
},

#Command 26
{
	:@id => 26,
	:@name => "option",
	:@french_name => "options",
	:@type => :divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "option",
	:@help => "Accède à un panneau permettant de régler différentes options.",
},

#Command 27
{
	:@id => 27,
	:@name => "pray",
	:@french_name => "prier",
	:@type => :communication,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "pray <message>",
	:@help => "Permet de contacter un immortel afin de faire une demande ou signaler un problème quelconque.",
},

#Command 28
{
	:@id => 28,
	:@name => "rcreate",
	:@french_name => "créer_salle",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "rcreate /[nseobh]/",
	:@help => "Exemple : rcreate n pour créer une nouvelle salle au nord et la rejoindre.\r\nLes sorties seront reconfigurées automatiquement.",
},

#Command 29
{
	:@id => 29,
	:@name => "redit",
	:@french_name => "éditer_salle",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "redit",
	:@help => "Affiche l'éditeur de salles.",
},

#Command 30
{
	:@id => 30,
	:@name => "remove",
	:@french_name => "retirer",
	:@type => :gestion,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "remove <objet>",
	:@help => "Remet un objet équipé dans votre sac.",
},

#Command 31
{
	:@id => 31,
	:@name => "reply",
	:@french_name => "répondre",
	:@type => :communication,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "reply <nom>",
	:@help => "Permet de répondre à quelqu'un après qu'il vous ai envoyé un message via la commande tell.",
},

#Command 32
{
	:@id => 32,
	:@name => "ruby",
	:@french_name => "ruby",
	:@type => :a_divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "ruby <code>",
	:@help => "Faire exécuter un code par l'interpréteur, lié à vous.<br><u>Exemple :</u> ruby Save.world; wiz @room.name (sauvegarde le monde et vous envoie le nom de la salle qui vous est liée.)",
},

#Command 33
{
	:@id => 33,
	:@name => "say",
	:@french_name => "dire",
	:@type => :communication,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "say <message>",
	:@help => "Vous dites quelque chose d'une voix à volume normal et ne serez entendu que par des personnes à proximité.",
},

#Command 34
{
	:@id => 34,
	:@name => "score",
	:@french_name => "score",
	:@type => :gestion,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "score",
	:@help => "Affiche diverses informations sur votre personnage.",
},

#Command 35
{
	:@id => 35,
	:@name => "selectAvatar",
	:@french_name => "selectionAvatar",
	:@type => :gestion,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => false,
	:@link => true,
	:@syntax => "selectAvatar",
	:@help => "Il n'y a pas d'aide là-dessus.",
},

#Command 36
{
	:@id => 36,
	:@name => "selectSkin",
	:@french_name => "selectionSkin",
	:@type => :gestion,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => false,
	:@link => true,
	:@syntax => "selectSkin",
	:@help => "Il n'y a pas d'aide là-dessus.",
},

#Command 37
{
	:@id => 37,
	:@name => "set",
	:@french_name => "établir",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "set <class> <id> <variable> <value>",
	:@help => "Attribue une valeur à la variable précisée.",
},

#Command 38
{
	:@id => 38,
	:@name => "shortcut",
	:@french_name => "raccourci",
	:@type => :gestion,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => false,
	:@link => true,
	:@syntax => "shortcut <action> <id>",
	:@help => "Permet de modifier les raccourcis.",
},

#Command 39
{
	:@id => 39,
	:@name => "shout",
	:@french_name => "crier",
	:@type => :communication,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "shout <message>",
	:@help => "Envoie un message aux personnages se trouvant dans votre zone.",
},

#Command 40
{
	:@id => 40,
	:@name => "special",
	:@french_name => "spécial",
	:@type => :divers,
	:@mob => true,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => false,
	:@link => true,
	:@syntax => "non définie",
	:@help => "Il n'y a pas d'aide à ce sujet.",
},

#Command 41
{
	:@id => 41,
	:@name => "spell",
	:@french_name => "sort",
	:@type => :divers,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "spell <sortilège>",
	:@help => "Affiche des informations sur un sort. À ne pas confondre avec la commande spells.",
},

#Command 42
{
	:@id => 42,
	:@name => "spells",
	:@french_name => "sorts",
	:@type => :gestion,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "spells",
	:@help => "Affiche une liste des sortilèges que vous connaissez et votre niveau de maîtrise pour ces sorts. À ne pas confondre avec la commande spell.",
},

#Command 43
{
	:@id => 43,
	:@name => "summonItem",
	:@french_name => "invoquerObjet",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "summonItem (<nombre>) <objet>",
	:@help => "Invoquer un objet dans votre inventaire.",
},

#Command 44
{
	:@id => 44,
	:@name => "tell",
	:@french_name => "envoyer",
	:@type => :communication,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "tell <nom> <message>",
	:@help => "Envoie un message à quelqu'un. Le joueur visé doit être connecté.",
},

#Command 45
{
	:@id => 45,
	:@name => "time",
	:@french_name => "date",
	:@type => :divers,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "time",
	:@help => "Affiche la date et l'heure actuelle, avec une liste des mois de l'année.",
},

#Command 46
{
	:@id => 46,
	:@name => "wear",
	:@french_name => "équiper",
	:@type => :gestion,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "wear <objet>",
	:@help => "Équipe un objet de votre inventaire.",
},

#Command 47
{
	:@id => 47,
	:@name => "who",
	:@french_name => "qui",
	:@type => :divers,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "who (*)",
	:@help => "\"who\" affiche la liste des joueurs connectés. \"who *\" affiche la liste de tous les joueurs.",
},

#Command 148
{
	:@id => 148,
	:@name => "junk",
	:@french_name => "détruire",
	:@type => :gestion,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "junk (<nombre>) <object>",
	:@help => "Permet de détruire un ou plusieurs exemplaires d'un objet de votre inventaire.",
},

#Command 149
{
	:@id => 149,
	:@name => "delete",
	:@french_name => "supprimer",
	:@type => :a_gestion,
	:@mob => false,
	:@ko => false,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "delete <type> <id>",
	:@help => "Procédure de destruction d'objets.\nExemple: delete Room 5\nTypes possibles: room",
},

#Command 152
{
	:@id => 152,
	:@name => "team",
	:@french_name => "équipe",
	:@type => :gestion,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "team <action> (<paramètres>)",
	:@help => "Les équipes sont très dynamiques. Il s'agit d'alliances <b>temporaires</b>.\r\n<font color=#3399CC>team accept &lt;nom&gt;:</font> ajoute un membre à votre équipe à condition qu'il vous suivre, qu'il ne soit pas déjà dans une équipe et que vous êtes meneur de votre équipe. Si vous n'avez pas d'équipe, elle sera créée par la même occasion.<br>\r\n<font color=#3399CC>team leave:</font> quitte votre équipe. Si vous étiez son meneur, un autre vous remplacera.<br>\r\n<font color=#3399CC>team join &lt;nom&gt;:</font> ceci enverra un message à la personne visée indiquant que vous voulez rejoindre son équipe. Vous suivrez cette personne jusqu'à-ce que vous tapiez <font color=orange>follow stop</font>.\r\n<font color=#3399CC>team speak &lt;message&gt;:</font> envoie un message à votre équipe. Identique à la commande <b>ts</b>.\r\n<font color=#3399CC>team switch &lt;nom&gt;:</font> si vous êtes le meneur d'une équipe, vous en donnerez les rênes à la personne désignée.",
},

#Command 151
{
	:@id => 151,
	:@name => "quit",
	:@french_name => "quitter",
	:@type => :gestion,
	:@mob => false,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "quit",
	:@help => "Quitter réellement se fait en fermant la fenêtre de navigation. Cette commande permet juste de vous déconnecter de ce personnage.",
},

#Command 153
{
	:@id => 153,
	:@name => "follow",
	:@french_name => "suivre",
	:@type => :gestion,
	:@mob => true,
	:@ko => true,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "follow <nom>",
	:@help => "Vous suivrez la personne désignée lors de ses mouvements. Cette personne pourra alors vous accepter dans son équipe. Utilisez la commande <font color=orange>team join &lt;nom&gt;</font> pour lui indiquer que vous voulez rejoindre son équipe.",
},

#Command 154
{
	:@id => 154,
	:@name => "ts",
	:@french_name => "team speak",
	:@type => :communication,
	:@mob => true,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "ts <message>",
	:@help => "Raccourci de la commande team speak, pour envoyer un message à votre équipe.",
},

#Command 155
{
	:@id => 155,
	:@name => "read",
	:@french_name => "lire",
	:@type => :communication,
	:@mob => false,
	:@ko => false,
	:@authlevel => 0,
	:@keyboard => true,
	:@link => false,
	:@syntax => "read <objet>",
	:@help => "Permet de lire un objet, si celui ci est lisible (livre, lettre... ).",
},

#Command 156
{
	:@id => 156,
	:@name => "varEdit",
	:@french_name => "Modifier une variable",
	:@type => :a_olc,
	:@mob => false,
	:@ko => true,
	:@authlevel => 1,
	:@keyboard => true,
	:@link => false,
	:@syntax => "Utiliser l'OLC",
	:@help => "C'est une fonction incorporée à l'OLC qui permet de modifier une variable de type particulier comme par exemple l'apparence d'une créature.",
},

