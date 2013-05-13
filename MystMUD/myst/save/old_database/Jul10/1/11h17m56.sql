TRUNCATE TABLE Area;
INSERT INTO Area VALUES ('1','L''Académie de Mira');
TRUNCATE TABLE Avatar;
INSERT INTO Avatar VALUES ('1','Bourreau','bourreau1');
INSERT INTO Avatar VALUES ('2','Bourreau','bourreau2');
INSERT INTO Avatar VALUES ('3','Bourreau','bourreau3');
INSERT INTO Avatar VALUES ('4','Chasseur','Chasseur1');
INSERT INTO Avatar VALUES ('5','Chasseur','Chasseur2');
INSERT INTO Avatar VALUES ('6','Chasseur','Chasseur3');
INSERT INTO Avatar VALUES ('7','default','default');
INSERT INTO Avatar VALUES ('8','Épéiste','epeiste1');
INSERT INTO Avatar VALUES ('9','Épéiste','epeiste2');
INSERT INTO Avatar VALUES ('10','Épéiste','epeiste3');
INSERT INTO Avatar VALUES ('11','Épéiste','epeiste4');
INSERT INTO Avatar VALUES ('12','Épéiste','epeiste5');
INSERT INTO Avatar VALUES ('13','Épéiste','epeiste6');
INSERT INTO Avatar VALUES ('14','Épéiste','epeiste7');
INSERT INTO Avatar VALUES ('15','Épéiste','epeiste8');
INSERT INTO Avatar VALUES ('16','Lancier','lancier1');
INSERT INTO Avatar VALUES ('17','Lancier','lancier2');
INSERT INTO Avatar VALUES ('18','Lancier','lancier3');
INSERT INTO Avatar VALUES ('19','Lancier','lancier4');
INSERT INTO Avatar VALUES ('20','Mage','mage1');
INSERT INTO Avatar VALUES ('21','Mage','mage2');
INSERT INTO Avatar VALUES ('22','Mage','mage3');
INSERT INTO Avatar VALUES ('23','Mage','mage4');
INSERT INTO Avatar VALUES ('24','Mage','mage5');
INSERT INTO Avatar VALUES ('25','Mage','mage6');
INSERT INTO Avatar VALUES ('26','Mage','mage7');
INSERT INTO Avatar VALUES ('27','Mage','mage8');
INSERT INTO Avatar VALUES ('28','Mage','mage9');
INSERT INTO Avatar VALUES ('29','Prêtre','pretre1');
INSERT INTO Avatar VALUES ('30','Prêtre','pretre2');
INSERT INTO Avatar VALUES ('31','Prêtre','pretre3');
INSERT INTO Avatar VALUES ('32','Prêtre','pretre4');
INSERT INTO Avatar VALUES ('33','Prêtre','pretre5');
INSERT INTO Avatar VALUES ('34','Prêtre','pretre6');
INSERT INTO Avatar VALUES ('35','Prêtre','pretre7');
INSERT INTO Avatar VALUES ('36','Prêtre','pretre8');
INSERT INTO Avatar VALUES ('37','Voleur','Voleur1');
INSERT INTO Avatar VALUES ('38','Voleur','Voleur2');
INSERT INTO Avatar VALUES ('39','Voleur','Voleur3');
TRUNCATE TABLE Body;
TRUNCATE TABLE Command;
INSERT INTO Command VALUES ('1','affections','gestion','0','1','0','1','0','affections','Affiche une liste des enchantements et maléfices qui vous affectent.');
INSERT INTO Command VALUES ('2','aide','divers','0','1','0','1','0','aide [&lt;commande&gt;]','Affiche une liste des commandes, ou des détails sur une commande.');
INSERT INTO Command VALUES ('3','cast','action','1','0','0','1','0','cast [&lt;puissance&gt;] &lt;sortilège&gt; [to &lt;cible&gt;]','La puissance par défaut est votre niveau dans le sort indiqué. Vous pouvez choisir de le lancer à plus faible niveau. Tapez spell &lt;sortilège&gt; pour voir le coût en magie du sort. Certains sorts peuvent être lancés sur une cible, qui doit être présente dans la salle. Lorsque la cible est vous même, il est inutile de le préciser.');
INSERT INTO Command VALUES ('4','chat','communication','0','0','0','1','0','chat &lt;message&gt;','Envoie un message à tous les joueurs connectés.');
INSERT INTO Command VALUES ('5','clone','a_olc','0','1','1','1','0','clone &lt;class&gt; &lt;id&gt;','Clone l''objet en question et lui attribue un nouvel identifiant.');
INSERT INTO Command VALUES ('6','drag','action','1','0','0','1','0','drag &lt;corps&gt; to &lt;direction&gt;','Permet de déplacer un corps avec soi vers une sortie.');
INSERT INTO Command VALUES ('7','drop','action','1','0','0','1','0','drop [&lt;nombre&gt;] &lt;objet&gt;','Pose un objet de votre inventaire sur le sol. "drop *" pour tout poser.');
INSERT INTO Command VALUES ('8','dump','a_divers','0','1','1','1','0','dump &lt;variable&gt;','Inspecte une variable. Permet aussi d''activer ou désactiver l''affichage sur le terminal des réponses aux commandes.');
INSERT INTO Command VALUES ('9','eat','gestion','1','0','0','1','0','eat &lt;object&gt;','Permet de manger un objet. N''essayez cependant pas de manger des objets en mithril !');
INSERT INTO Command VALUES ('10','edit','a_olc','0','1','1','1','0','edit &lt;class&gt; &lt;id&gt;','Affiche une page d''édition de l''objet en question.');
INSERT INTO Command VALUES ('11','equipement','gestion','0','0','0','1','0','equipement','Liste les objets que vous portez sur le corps.');
INSERT INTO Command VALUES ('12','examine','divers','0','0','0','1','0','examine &lt;quelque-chose&gt;','Permet de scruter un corps ou examiner un objet de votre inventaire.');
INSERT INTO Command VALUES ('13','force','a_gestion','0','1','1','1','0','force &lt;someone&gt; to &lt;action&gt;','Permet de forcer un personnage à faire quelque chose.');
INSERT INTO Command VALUES ('14','get','action','1','0','0','1','0','get [&lt;nombre&gt;] &lt;objet&gt; [from &lt;conteneur&gt;]','Permet de ramasser un ou plusieurs objets depuis un conteneur, qui peut être un corps ou un coffre. Si le conteneur n''est pas précisé, il s''agira du sol.');
INSERT INTO Command VALUES ('15','give','action','1','0','0','1','0','give &lt;nom&gt; [&lt;nombre&gt;] &lt;objet&gt;','Donne un objet à quelqu''un près de vous (joueur ou créature).');
INSERT INTO Command VALUES ('16','giveXp','a_gestion','0','1','1','1','0','giveXp &lt;nom&gt; &lt;nombre&gt;','Confère des points d''expérience au joueur précisé.');
INSERT INTO Command VALUES ('17','goto','a_divers','0','1','1','1','0','goto [&lt;zone&gt;]','Affiche une liste des zones ou permet de se déplacer vers la zone indiquée.');
INSERT INTO Command VALUES ('18','help','a_divers','0','1','1','1','0','help [&lt;commande&gt;]','Autre version de l''aide mais pour les immortels.');
INSERT INTO Command VALUES ('19','include','a_divers','0','1','1','1','0','include &lt;path&gt;','L''interpréteur tentera de charger ou recharger le fichier précisé.');
INSERT INTO Command VALUES ('20','inventory','gestion','0','0','0','1','0','inventory','La liste de vos objets.');
INSERT INTO Command VALUES ('21','kill','action','1','0','0','1','0','kill &lt;cible&gt;','Engage un combat à mort avec la cible.');
INSERT INTO Command VALUES ('22','look','divers','0','1','0','1','0','look [&lt;nom&gt;]','Pour regarder autours de vous, ou une personne ou créature en particulier.');
INSERT INTO Command VALUES ('23','lvUp','a_gestion','0','1','1','1','0','lvUp &lt;nom&gt;','Incrémente le niveau du joueur en mettant son expérience pour ce niveau à zéro.');
INSERT INTO Command VALUES ('24','olc','a_olc','0','1','1','1','0','olc [&lt;class&gt;]','Affiche la liste des classes ainsi que la liste des objets de la classe précisée si précisée.');
INSERT INTO Command VALUES ('25','olcShow','a_olc','0','1','1','1','0','olc_show &lt;class&gt; &lt;id&gt;','Affiche les données sur l''objet en question.');
INSERT INTO Command VALUES ('26','option','divers','0','1','0','1','0','option','Accède à un panneau permettant de régler différentes options.');
INSERT INTO Command VALUES ('27','pray','communication','0','0','0','1','0','pray &lt;message&gt;','Permet de contacter un immortel afin de faire une demande ou signaler un problème quelconque.');
INSERT INTO Command VALUES ('28','rcreate','a_olc','0','1','1','1','0','rcreate /[nseobh]/','Exemple : rcreate n pour créer une nouvelle salle au nord et la rejoindre.
Les sorties seront reconfigurées automatiquement.');
INSERT INTO Command VALUES ('29','redit','a_olc','0','1','1','1','0','redit','Affiche l''éditeur de salles.');
INSERT INTO Command VALUES ('30','remove','gestion','1','0','0','1','0','remove &lt;objet&gt;','Remet un objet équipé dans votre sac.');
INSERT INTO Command VALUES ('31','reply','communication','0','0','0','1','0','reply &lt;nom&gt;','Permet de répondre à quelqu''un après qu''il vous ai envoyé un message via la commande tell.');
INSERT INTO Command VALUES ('32','ruby','a_divers','0','1','1','1','0','ruby &lt;code&gt;','Faire exécuter un code par l''interpréteur, lié à vous.<br><u>Exemple : ruby Save.world; wiz @room.name (sauvegarde le monde ; vous envoi le nom de la salle qui vous est liée.)');
INSERT INTO Command VALUES ('33','say','communication','1','0','0','1','0','say &lt;message&gt;','Vous dites quelque chose d''une voix à volume normal et ne serez entendu que par des personnes à proximité.');
INSERT INTO Command VALUES ('34','score','gestion','0','1','0','1','0','score','Affiche diverses informations sur votre personnage.');
INSERT INTO Command VALUES ('35','selectAvatar','gestion','0','0','0','0','1','selectAvatar','Il n''y a pas d''aide là-dessus.');
INSERT INTO Command VALUES ('36','selectSkin','gestion','0','0','0','0','1','selectSkin','Il n''y a pas d''aide là-dessus.');
INSERT INTO Command VALUES ('37','set','a_olc','0','1','1','1','0','set &lt;class&gt; &lt;id&gt; &lt;variable&gt; &lt;value&gt;','Attribue une valeur à la variable précisée.');
INSERT INTO Command VALUES ('38','shortcut','gestion','0','1','0','0','1','shortcut &lt;action&gt; &lt;id&gt;','Permet de modifier les raccourcis.');
INSERT INTO Command VALUES ('39','shout','communication','1','0','0','1','0','shout &lt;message&gt;','Envoie un message aux personnages se trouvant dans votre zone.');
INSERT INTO Command VALUES ('40','special','divers','1','1','0','0','1','non définie','Il n''y a pas d''aide à ce sujet.');
INSERT INTO Command VALUES ('41','spell','divers','0','1','0','1','0','spell &lt;sortilège&gt;','Affiche des informations sur un sort. À ne pas confondre avec la commande spells.');
INSERT INTO Command VALUES ('42','spells','gestion','0','1','0','1','0','spells','Affiche une liste des sortilèges que vous connaissez et votre niveau de maîtrise pour ces sorts. À ne pas confondre avec la commande spell.');
INSERT INTO Command VALUES ('43','summonItem','a_olc','0','1','1','1','0','summonItem [&lt;nombre&gt;] &lt;objet&gt;','Invoquer un objet dans votre inventaire.');
INSERT INTO Command VALUES ('44','tell','communication','0','0','0','1','0','tell &lt;nom&gt; &lt;message&gt;','Envoie un message à quelqu''un. Le joueur visé doit être connecté.');
INSERT INTO Command VALUES ('45','time','divers','0','0','0','1','0','time','Affiche la date et l''heure actuelle, avec une liste des mois de l''année.');
INSERT INTO Command VALUES ('46','wear','gestion','1','0','0','1','0','wear &lt;objet&gt;','Équipe un objet de votre inventaire.');
INSERT INTO Command VALUES ('47','who','divers','0','0','0','1','0','who [*]','"who" affiche la liste des joueurs connectés. "who *" affiche la liste de tous les joueurs.');
INSERT INTO Command VALUES ('148','junk','gestion','1','0','0','1','0','junk [&lt;nombre&gt;] &lt;object&gt;','Permet de détruire un ou plusieurs exemplaires d''un objet de votre inventaire.');
INSERT INTO Command VALUES ('149','delete','a_gestion','0','0','1','1','0','delete &lt;type&gt; &lt;id&gt;','Procédure de destruction d''''objets. Exemple: delete room 5\r\n\r\nTypes possibles: room');
INSERT INTO Command VALUES ('150','download','a_divers','0','1','1','1','0','download &lt;file&gt; [&lt;captchacode&gt; &lt;megavar&gt; &lt;captcha&gt;]','Fichier de la forme "...clef" par exemple
http://www.megaupload.com/?d=DLAB5E6 ou juste DLAB5E6. Les valeurs optionnelles sont gérées automatiquement.');
TRUNCATE TABLE Heroe;
INSERT INTO Heroe VALUES ('1','Arsenic','37eff4bfa7d88a6e75c8804ecff8659b','1','{:taille=>1, :haircolor=>1, :hairlength=>1, :eyecolor=>1}','1','30','2','28','28','1000','1000','5','8','5','5','default','default','{1=>72, 2=>100}','{2=>5}','{}','[["Weapon 8", "Joyaux 6", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["test", "o", "inventory", "who", "get *", "option", "n", "s", "e", "aide"]]','-4260');
INSERT INTO Heroe VALUES ('2','Dominic','37eff4bfa7d88a6e75c8804ecff8659b','1','{:taille=>1, :haircolor=>1, :hairlength=>1, :eyecolor=>1}','1','0','1','20','20','10','10','5','5','5','5','default','default','{}','{}','{}','[["Lettre 2", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["option shortcut", "inventory", "who", "get *", "option", "o", "n", "s", "e", "aide"]]','-2820');
INSERT INTO Heroe VALUES ('3','Maxime','b238c13e822536cad3ac57a2280fbf45','1','{:taille=>4, :haircolor=>5, :hairlength=>2, :eyecolor=>3}','1','0','1','20','20','10','10','5','5','5','5','default','default','{}','{}','{}','[["Lettre 2", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["option shortcut", "inventory", "who", "get *", "option", "o", "n", "s", "e", "aide"]]','0');
TRUNCATE TABLE Item;
INSERT INTO Item VALUES ('1','une épée en bois de cerisier','nourriture','1','[:bras_gauche, :bras_droit]','Cette épée d''entraînement ne permet de tuer que des rats (et encore)...','{}','{}','{}','0');
INSERT INTO Item VALUES ('2','un petit cèpe','nourriture','1','[]','C''est un champignon appétissant.','{:rassasiment=>240}','{}','{}','20');
INSERT INTO Item VALUES ('3','une pièce d''or','money','0','[]','Ces pièces sont très utilisées dans le commerce.','{}','{}','{}','1');
INSERT INTO Item VALUES ('4','une vesse-de-loup','nourriture','1','[]','Les vesses-de-loup sont des champignons très répandus dans les prés et les bois, facilement reconnaissables à leur couleur blanche ou grisâtre, et au fait que lorsqu''ils sont vieux ils se transforment en sacs remplis d''une poussière brune, véritables petits volcans quand on appuie dessus.','{:rassasiment=>240}','{}','{}','10');
INSERT INTO Item VALUES ('5','un cortinaire violet','nourriture','1','[]','Un champignon assez rare, mais comestible, construit par des lames violettes ventrues, espacées et épaisses, poudrées de brun rouille avec l''âge sous un châpeau cônique puis étalé avec un mamelon obtus, charnu violet foncé. Le tout disposé sur un pied pouvant atteindre 15cm, s''épaississant jusqu''à la base du pied. Il présente des traces fugaces de cortine bleue.','{:rassasiment=>600}','{}','{}','100');
INSERT INTO Item VALUES ('6','un morceau de gelée bleue','nourriture','1','[]','C''est un petit morceau de gelée à manger, d''une couleur bleue et translucide.','{}','{:eat=>[:gain_de_vie, 50, 1000]}','{}','1');
TRUNCATE TABLE Mob;
INSERT INTO Mob VALUES ('1000000','Casimir le maître des armes','2','20','100','100','1','100','5','5','5','5','Warrior01','epeiste4','{}','{}','{}');
TRUNCATE TABLE Room;
INSERT INTO Room VALUES ('1','1','Cour de l''académie','Vous vous trouvez dans une grande cour adjacente à l''entrée de l''Académie de Mira, le lieu de formation des mages et guerriers de votre ville natale. L''entraînement au combat se fait dans les jardins à l''ouest. Tapez <font color=orange><b>o</b></font> ou <font color=orange><b>ouest</b></font> pour vous y aventurer. Vous pouvez aussi choisir d''entrer dans l''académie et voir ce qui vous y attends.','0','0','0','{}','{}','{:ouest=>2}');
INSERT INTO Room VALUES ('2','1','Jardins de l''académie','Cet endroit est calme et reposant de part la grandeur des arbres. Les nombreuses odeurs des plantes viennent vous piquer les narines. C''est l''endroit favori du maître d''armes, et il y passe la plupart de son temps.','-1','0','0','{}','{}','{:est=>1}');
TRUNCATE TABLE Shop;
TRUNCATE TABLE Skin;
INSERT INTO Skin VALUES ('1','Skin par défaut','default');
INSERT INTO Skin VALUES ('20','Bard01','Bard01');
INSERT INTO Skin VALUES ('21','Bartender01','Bartender01');
INSERT INTO Skin VALUES ('31','BunnyGirl01','BunnyGirl01');
INSERT INTO Skin VALUES ('32','Butler01','Butler01');
INSERT INTO Skin VALUES ('33','Captain01','Captain01');
INSERT INTO Skin VALUES ('38','Civilian01','Civilian01');
INSERT INTO Skin VALUES ('39','Civilian02','Civilian02');
INSERT INTO Skin VALUES ('40','Civilian03','Civilian03');
INSERT INTO Skin VALUES ('41','Civilian04','Civilian04');
INSERT INTO Skin VALUES ('42','Civilian05','Civilian05');
INSERT INTO Skin VALUES ('43','Civilian06','Civilian06');
INSERT INTO Skin VALUES ('44','Civilian07','Civilian07');
INSERT INTO Skin VALUES ('45','Civilian08','Civilian08');
INSERT INTO Skin VALUES ('46','Civilian09','Civilian09');
INSERT INTO Skin VALUES ('47','Civilian10','Civilian10');
INSERT INTO Skin VALUES ('48','Civilian11','Civilian11');
INSERT INTO Skin VALUES ('49','Civilian12','Civilian12');
INSERT INTO Skin VALUES ('50','Civilian13','Civilian13');
INSERT INTO Skin VALUES ('51','Civilian14','Civilian14');
INSERT INTO Skin VALUES ('52','Civilian15','Civilian15');
INSERT INTO Skin VALUES ('53','Civilian16','Civilian16');
INSERT INTO Skin VALUES ('54','Civilian17','Civilian17');
INSERT INTO Skin VALUES ('55','Civilian18','Civilian18');
INSERT INTO Skin VALUES ('56','Civilian19','Civilian19');
INSERT INTO Skin VALUES ('57','Civilian20','Civilian20');
INSERT INTO Skin VALUES ('58','Civilian21','Civilian21');
INSERT INTO Skin VALUES ('59','Civilian22','Civilian22');
INSERT INTO Skin VALUES ('60','Civilian23','Civilian23');
INSERT INTO Skin VALUES ('61','Civilian24','Civilian24');
INSERT INTO Skin VALUES ('62','Cleric01','Cleric01');
INSERT INTO Skin VALUES ('63','Cleric02','Cleric02');
INSERT INTO Skin VALUES ('64','Cleric03','Cleric03');
INSERT INTO Skin VALUES ('65','Cleric04','Cleric04');
INSERT INTO Skin VALUES ('66','Cleric05','Cleric05');
INSERT INTO Skin VALUES ('67','Cleric06','Cleric06');
INSERT INTO Skin VALUES ('68','Cleric07','Cleric07');
INSERT INTO Skin VALUES ('69','Cleric08','Cleric08');
INSERT INTO Skin VALUES ('70','Clown01','Clown01');
INSERT INTO Skin VALUES ('71','Cook01','Cook01');
INSERT INTO Skin VALUES ('72','Dancer01','Dancer01');
INSERT INTO Skin VALUES ('90','Farmer01','Farmer01');
INSERT INTO Skin VALUES ('91','Farmer02','Farmer02');
INSERT INTO Skin VALUES ('92','Fighter01','Fighter01');
INSERT INTO Skin VALUES ('93','Fighter02','Fighter02');
INSERT INTO Skin VALUES ('94','Fighter03','Fighter03');
INSERT INTO Skin VALUES ('95','Fighter04','Fighter04');
INSERT INTO Skin VALUES ('96','Fighter05','Fighter05');
INSERT INTO Skin VALUES ('97','Fighter06','Fighter06');
INSERT INTO Skin VALUES ('98','Fighter07','Fighter07');
INSERT INTO Skin VALUES ('99','Fighter08','Fighter08');
INSERT INTO Skin VALUES ('100','Fortuneteller01','Fortuneteller01');
INSERT INTO Skin VALUES ('105','Grappler01','Grappler01');
INSERT INTO Skin VALUES ('106','Grappler02','Grappler02');
INSERT INTO Skin VALUES ('107','Gunner01','Gunner01');
INSERT INTO Skin VALUES ('108','Gunner02','Gunner02');
INSERT INTO Skin VALUES ('109','Hunter01','Hunter01');
INSERT INTO Skin VALUES ('110','Hunter02','Hunter02');
INSERT INTO Skin VALUES ('111','Hunter03','Hunter03');
INSERT INTO Skin VALUES ('112','King01','King01');
INSERT INTO Skin VALUES ('113','Lancer01','Lancer01');
INSERT INTO Skin VALUES ('114','Lancer02','Lancer02');
INSERT INTO Skin VALUES ('115','Lancer03','Lancer03');
INSERT INTO Skin VALUES ('116','Lancer04','Lancer04');
INSERT INTO Skin VALUES ('120','Mage01','Mage01');
INSERT INTO Skin VALUES ('122','Mage03','Mage03');
INSERT INTO Skin VALUES ('123','Mage04','Mage04');
INSERT INTO Skin VALUES ('124','Mage05','Mage05');
INSERT INTO Skin VALUES ('125','Mage06','Mage06');
INSERT INTO Skin VALUES ('126','Mage07','Mage07');
INSERT INTO Skin VALUES ('127','Mage08','Mage08');
INSERT INTO Skin VALUES ('128','Mage09','Mage09');
INSERT INTO Skin VALUES ('129','Maid01','Maid01');
INSERT INTO Skin VALUES ('144','Noble01','Noble01');
INSERT INTO Skin VALUES ('145','Noble02','Noble02');
INSERT INTO Skin VALUES ('146','Noble03','Noble03');
INSERT INTO Skin VALUES ('147','Noble04','Noble04');
INSERT INTO Skin VALUES ('148','Noble05','Noble05');
INSERT INTO Skin VALUES ('149','Noble06','Noble06');
INSERT INTO Skin VALUES ('150','Noble07','Noble07');
INSERT INTO Skin VALUES ('151','Noble08','Noble08');
INSERT INTO Skin VALUES ('152','Prisoner01','Prisoner01');
INSERT INTO Skin VALUES ('153','Prisoner02','Prisoner02');
INSERT INTO Skin VALUES ('154','Queen01','Queen01');
INSERT INTO Skin VALUES ('157','Sailor01','Sailor01');
INSERT INTO Skin VALUES ('158','Scholar01','Scholar01');
INSERT INTO Skin VALUES ('174','Soldier01','Soldier01');
INSERT INTO Skin VALUES ('175','Soldier02','Soldier02');
INSERT INTO Skin VALUES ('176','Storekeeper01','Storekeeper01');
INSERT INTO Skin VALUES ('177','Storekeeper02','Storekeeper02');
INSERT INTO Skin VALUES ('190','Thief01','Thief01');
INSERT INTO Skin VALUES ('191','Thief02','Thief02');
INSERT INTO Skin VALUES ('192','Thief03','Thief03');
INSERT INTO Skin VALUES ('193','Thief04','Thief04');
INSERT INTO Skin VALUES ('195','Trader01','Trader01');
INSERT INTO Skin VALUES ('201','Warrior01','Warrior01');
INSERT INTO Skin VALUES ('202','Warrior02','Warrior02');
INSERT INTO Skin VALUES ('203','Warrior03','Warrior03');
TRUNCATE TABLE Spell;
INSERT INTO Spell VALUES ('1','boule de feu','Envoie une boule de feu sur l''adversaire.','1','20','violence','cast_boule_de_feu','1');
INSERT INTO Spell VALUES ('2','bouclier','Invoque un bouclier magique de couleur nacre autours de la cible.','10','30','protection','cast_bouclier','1');
TRUNCATE TABLE System;
INSERT INTO System VALUES ('1','world_time','1208002');
INSERT INTO System VALUES ('2','time_difference','1276767801');
INSERT INTO System VALUES ('3','pray','[]');
INSERT INTO System VALUES ('4','hack','[]');
TRUNCATE TABLE World;
INSERT INTO World VALUES ('1','Myst','[1]');
