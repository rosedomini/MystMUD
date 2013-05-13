TRUNCATE TABLE Area;
INSERT INTO Area VALUES ('1','Le Myst du milieu','-500','-500','-500','500','500','500');
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
INSERT INTO Command VALUES ('2','aide','divers','0','1','0','1','0','aide [commande]','Affiche de l''aide sur la <b>commande</b> ou affiche une liste des commandes');
INSERT INTO Command VALUES ('3','cast','action','1','0','0','1','0','cast [&lt;puissance&gt;] &lt;sortilège&gt; [to &lt;cible&gt;]','La puissance par défaut est votre niveau dans le sort indiqué. Vous pouvez choisir de le lancer à plus faible niveau. Tapez spell &lt;sortilège&gt; pour voir le coût en magie du sort. Certains sorts peuvent être lancés sur une cible, qui doit être présente dans la salle. Lorsque la cible est vous même, il est inutile de le préciser.');
INSERT INTO Command VALUES ('4','chat','communication','0','0','0','1','0','chat message','Envoie un message à tous les joueurs connectés.');
INSERT INTO Command VALUES ('5','clone','a_olc','0','1','1','1','0','clone class id','Clone l''objet de classe <b>class</b> identifié par <b>id</b> et lui attribue un nouvel identifiant');
INSERT INTO Command VALUES ('6','drag','action','1','0','0','1','0','drag &lt;corps&gt; to &lt;direction&gt;','Permet de déplacer un corps avec soi vers une sortie.');
INSERT INTO Command VALUES ('7','drop','action','1','0','0','1','0','drop [nombre] objet','Pose un objet de votre inventaire à votre position. "drop *" pour tout poser.');
INSERT INTO Command VALUES ('8','dump','a_divers','0','1','1','1','0','dump (variable)','Affiche la structure d''une <b>variable</b>.<br><u>Exemple :</u> dump $h















dump tout court permet d''activer/désactiver l''affichage sur le terminal des réponses aux commandes (en html).');
INSERT INTO Command VALUES ('9','eat','gestion','1','0','0','1','0','eat nourriture','exemple : eat cèpe pour manger un cèpe');
INSERT INTO Command VALUES ('10','edit','a_olc','0','1','1','1','0','edit class id','Affiche une page de modification pour l''objet de classe <b>class</b> identifié par <b>id</b>');
INSERT INTO Command VALUES ('11','equipement','gestion','0','0','0','1','0','equipement','Liste les objets que vous portez sur le corps.');
INSERT INTO Command VALUES ('12','examine','divers','0','0','0','1','0','examine quelque-chose','Permet de scruter un corps ou examiner un objet de votre inventaire.');
INSERT INTO Command VALUES ('13','force','a_gestion','0','1','1','1','0','force someone to action','Permet de forcer un personnage à faire quelque chose.');
INSERT INTO Command VALUES ('14','get','action','1','0','0','1','0','get &lt;objet&gt; [from &lt;conteneur&gt;]','Permet de ramasser un ou plusieurs objets depuis un conteneur, qui peut être un corps ou un coffre. Si le conteneur n''est pas précisé, il s''agira du sol.

Pour &lt;objet&gt; :
* -&gt; tous
épée cristalline -&gt; premier objet dont le nom contient épée
2 épée -&gt; s''il y en a plusieur à ramasser
* épée -&gt; toutes

Pour &lt;conteneur&gt; :
pirate -&gt; premier conteneur dont le nom contient pirate
corps 2 -&gt; (2è conteneur dont le nom contient corps)

get 5 épée cristalline from pirate saoul 3
Prélève si possible 5 exemplaires de cette épée depuis le troisième corps d''un pirate saoul que vous apercevez.
get 5 ép from pir 3 devrait donner la même chose s''il n''y a pas d''ambiguïté avec le nom d''un autre objet ou conteneur.');
INSERT INTO Command VALUES ('15','give','action','1','0','0','1','0','give nom [nombre] objet','Donne un objet à quelqu''un près de vous (joueur ou créature).');
INSERT INTO Command VALUES ('16','giveXp','a_gestion','0','1','1','1','0','giveXp player xp','Confère <b>xp</b> points d''expériences à <b>player</b>');
INSERT INTO Command VALUES ('17','goto','a_divers','0','1','1','1','0','goto [zone]','Affiche la liste des zones où déplace vers la zone indiquée');
INSERT INTO Command VALUES ('18','help','a_divers','0','1','1','1','0','help [command]','Affiche de l''aide sur <b>command</b> ou affiche une liste des commandes');
INSERT INTO Command VALUES ('19','include','a_divers','0','1','1','1','0','include path','Tente de charger le fichier indiqué par <b>path</b>. Utiliser avec précaution...');
INSERT INTO Command VALUES ('20','inventory','gestion','0','0','0','1','0','inventory','Liste les objets que vous avez sur vous.');
INSERT INTO Command VALUES ('21','kill','action','1','0','0','1','0','kill cible','Engage un combat à mort avec la cible.');
INSERT INTO Command VALUES ('22','look','divers','0','1','0','1','0','look','Vous regardez autours de vous.');
INSERT INTO Command VALUES ('23','lvUp','a_gestion','0','1','1','1','0','lvUp player','Incrémente le niveau de <b>player</b> sans laisser d''xp au delà');
INSERT INTO Command VALUES ('24','olc','a_olc','0','1','1','1','0','olc [class]','Affiche la liste des classes ainsi que la liste des objets de la classe précisée.');
INSERT INTO Command VALUES ('25','olcShow','a_olc','0','1','1','1','0','olc_show class id','Affiche les données de l''objet de classe <b>class</b> et d''identifiant <b>id</b>');
INSERT INTO Command VALUES ('26','option','divers','0','1','0','1','0','option','Accède à un panneau permettant de régler différentes options.');
INSERT INTO Command VALUES ('27','pray','communication','0','0','0','1','0','pray message','Permet de contacter un admin afin de faire une demande ou signaler un problème quelconque.');
INSERT INTO Command VALUES ('28','rcreate','a_olc','0','1','1','1','0','rcreate [nseobh]','Exemple : rcreate n pour créer une nouvelle salle au nord.







Les sorties sont reconfigurées par la même occasion entre la salle actuelle et la nouvelle salle.







Ceci vous déplacera dans la salle créée.');
INSERT INTO Command VALUES ('29','redit','a_olc','0','1','1','1','0','redit','Affiche l''éditeur des salles');
INSERT INTO Command VALUES ('30','remove','gestion','1','0','0','1','0','remove objet','Remet un objet équipé dans votre sac.');
INSERT INTO Command VALUES ('31','reply','communication','0','0','0','1','0','reply nom','Permet de répondre à quelqu''un après qu''il vous ai envoyé un message via la commande tell.');
INSERT INTO Command VALUES ('32','ruby','a_divers','0','1','1','1','0','ruby <code>','Exécute le <b>code</b>.<br><u>Exemple :</u> ruby Save.world');
INSERT INTO Command VALUES ('33','say','communication','1','0','0','1','0','say message','Vous dites quelque chose à voix normale et  ne serez entendu que par des personnes à proximité.');
INSERT INTO Command VALUES ('34','score','gestion','0','1','0','1','0','score','Affiche diverses informations sur votre personnage.');
INSERT INTO Command VALUES ('35','selectAvatar','gestion','0','0','0','0','1','selectAvatar','Il n''y a pas d''aide là-dessus.');
INSERT INTO Command VALUES ('36','selectSkin','gestion','0','0','0','0','1','selectSkin','Il n''y a pas d''aide là-dessus.');
INSERT INTO Command VALUES ('37','set','a_olc','0','1','1','1','0','set class id variable value','Donne la valeur <b>value</b> à la <b>variable</b> pour l''objet de classe <b>class</b> identifié par <b>id</b>');
INSERT INTO Command VALUES ('38','shortcut','gestion','0','1','0','0','1','shortcut action id','Permet de modifier les raccourcis');
INSERT INTO Command VALUES ('39','shout','communication','1','0','0','1','0','shout message','Envoie un message aux personnages se trouvant dans la zone.');
INSERT INTO Command VALUES ('40','special','divers','1','1','0','0','1','non déclarée','Il n''y a pas d''aide à propos de cette commande.');
INSERT INTO Command VALUES ('41','spell','divers','0','1','0','1','0','spell &lt;sortilège&gt;','Affiche des informations sur un sort. À ne pas confondre avec la commande spells.');
INSERT INTO Command VALUES ('42','spells','gestion','0','1','0','1','0','spells','Affiche une liste des sortilèges que vous connaissez et votre niveau de maîtrise pour ces sorts. À ne pas confondre avec la commande spell.');
INSERT INTO Command VALUES ('43','summonItem','a_olc','0','1','1','1','0','summonItem &lt;nombre&gt; &lt;objet&gt;','Invoquer un objet dans votre inventaire.');
INSERT INTO Command VALUES ('44','tell','communication','0','0','0','1','0','tell nom message','Dit à <b>nom</b>, le <b>message</b>. Sensible à la casse et à l''état du joueur visé.');
INSERT INTO Command VALUES ('45','time','divers','0','0','0','1','0','time','Affiche la date et l''heure actuelle.');
INSERT INTO Command VALUES ('46','wear','gestion','1','0','0','1','0','wear objet','Équipe un objet de votre inventaire.');
INSERT INTO Command VALUES ('47','who','divers','0','0','0','1','0','who','Affiche la liste des joueurs connectés.');
TRUNCATE TABLE Heroe;
INSERT INTO Heroe VALUES ('1','Arsenic','37eff4bfa7d88a6e75c8804ecff8659b','1','{:taille=>1, :haircolor=>1, :hairlength=>1, :eyecolor=>1}','2','26','2','28','28','1000','1000','5','8','5','5','default','default','{$spell[1]=>72, $spell[2]=>100}','{}','{}','[["Weapon 8", "Joyaux 6", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["test", "o", "inventory", "who", "get *", "option", "n", "s", "e", "aide"]]','840');
INSERT INTO Heroe VALUES ('2','Dominic','37eff4bfa7d88a6e75c8804ecff8659b','1','{:taille=>1, :haircolor=>1, :hairlength=>1, :eyecolor=>1}','1','0','1','20','20','10','10','5','5','5','5','default','default','{}','{}','{}','[["Lettre 2", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["option shortcut", "inventory", "who", "get *", "option", "o", "n", "s", "e", "aide"]]','-2580');
INSERT INTO Heroe VALUES ('3','Maxime','b238c13e822536cad3ac57a2280fbf45','1','{:taille=>4, :haircolor=>5, :hairlength=>2, :eyecolor=>3}','1','0','1','20','20','10','10','5','5','5','5','default','default','{}','{}','{}','[["Lettre 2", "Sac 1", "Masque 1", "Skill 5", "Parchemin 1", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Joyaux 6", "Skill 6"], ["option shortcut", "inventory", "who", "get *", "option", "o", "n", "s", "e", "aide"]]','0');
TRUNCATE TABLE Item;
INSERT INTO Item VALUES ('1','une épée en bois de cerisier','nourriture','1','[:bras_gauche, :bras_droit]','Cette épée d''entraînement ne permet de tuer que des rats (et encore)...','{}','{}','{}','0');
INSERT INTO Item VALUES ('2','un petit cèpe','nourriture','1','[]','C''est un champignon appétissant.','{:rassasiment=>240}','{}','{}','20');
INSERT INTO Item VALUES ('3','une pièce d''or','money','0','[]','Ces pièces sont très utilisées dans le commerce.','{}','{}','{}','1');
INSERT INTO Item VALUES ('4','une vesse-de-loup','nourriture','1','[]','Les vesses-de-loup sont des champignons très répandus dans les prés et les bois, facilement reconnaissables à leur couleur blanche ou grisâtre, et au fait que lorsqu''ils sont vieux ils se transforment en sacs remplis d''une poussière brune, véritables petits volcans quand on appuie dessus.','{:rassasiment=>240}','{}','{}','10');
INSERT INTO Item VALUES ('5','un cortinaire violet','nourriture','1','[]','Un champignon assez rare, mais comestible, construit par des lames violettes ventrues, espacées et épaisses, poudrées de brun rouille avec l''âge sous un châpeau cônique puis étalé avec un mamelon obtus, charnu violet foncé. Le tout disposé sur un pied pouvant atteindre 15cm, s''épaississant jusqu''à la base du pied. Il présente des traces fugaces de cortine bleue.','{:rassasiment=>600}','{}','{}','100');
INSERT INTO Item VALUES ('6','un morceau de gelée bleue','nourriture','1','[]','C''est un petit morceau de gelée à manger, d''une couleur bleue et translucide.','{}','{:eat=>[:gain_de_vie, 50, 1000]}','{}','1');
TRUNCATE TABLE Mob;
INSERT INTO Mob VALUES ('1000000','un écureuil roux','2','1','20','20','0','0','5','5','5','5','mob/Small10','mob/default','{}','{}','{}');
TRUNCATE TABLE Room;
INSERT INTO Room VALUES ('1','En pleine forêt','Étant adossé au tronc d''un chêne, vous vous levez en vous grattant la tête. Le sifflement d''une légère brise entre les branchages se fait aussi sentir sur votre peau nue. Peut-être faudrait-il vous trouver de quoi vous habiller. Pour l''instant, un unique chemin s''offre à vous.<br>Tapez <font color=#3399CC>nord</font> entièrement ou partiellement pour l''emprunter.','0','0','0','{}','{}','{:nord=>2}');
INSERT INTO Room VALUES ('2','Premiers pas','Vous vous déplacez avec disgrâce comme si c''était vos premiers pas. Le chant des oiseaux attire votre attention, mais ce qui vous préoccupe le plus à présent est cette bestiole qui se déplace autours de vous en sautillant.<br>Tapez <i><b>look écureuil</b></i> pour le regarder. Aussi n''oubliez pas la commande <i><b>aide</b></i>.','0','1','0','{5=>3, 2=>24, 6=>6}','{}','{:sud=>1, :est=>3}');
INSERT INTO Room VALUES ('3','Le bois d''Aulne','Vous traversez quelques branchages et continuez votre chemin. Vous sentez une odeur particulière à l''est.','1','1','0','{2=>1}','{2=>1}','{:ouest=>2, :est=>4}');
INSERT INTO Room VALUES ('4','Le bois d''Aulne','Une fumée s''échappe de sous vos pieds. Vous venez de marcher sur une vesse-de-loup. Vous vous rendez alors compte de l''énorme amas de champignons présent ici, semés entre la mousse et les fougères.','2','1','0','{4=>5, 5=>2, 2=>11}','{4=>5, 5=>2, 2=>11}','{:ouest=>3}');
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
INSERT INTO System VALUES ('1','world_time','504919');
INSERT INTO System VALUES ('2','time_difference','1274107548');
INSERT INTO System VALUES ('3','pray','[]');
INSERT INTO System VALUES ('4','hack','[]');
TRUNCATE TABLE World;
INSERT INTO World VALUES ('1','Myst','[1]');
