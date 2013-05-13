TRUNCATE TABLE Avatar;
INSERT INTO Avatar VALUES ('1','Bourreau','bourreau1');
INSERT INTO Avatar VALUES ('2','Bourreau','bourreau2');
INSERT INTO Avatar VALUES ('3','Bourreau','bourreau3');
INSERT INTO Avatar VALUES ('4','Chasseur','Chasseur1');
INSERT INTO Avatar VALUES ('5','Chasseur','Chasseur2');
INSERT INTO Avatar VALUES ('6','Chasseur','Chasseur3');
INSERT INTO Avatar VALUES ('7','default','default');
INSERT INTO Avatar VALUES ('8','�p�iste','epeiste1');
INSERT INTO Avatar VALUES ('9','�p�iste','epeiste2');
INSERT INTO Avatar VALUES ('10','�p�iste','epeiste3');
INSERT INTO Avatar VALUES ('11','�p�iste','epeiste4');
INSERT INTO Avatar VALUES ('12','�p�iste','epeiste5');
INSERT INTO Avatar VALUES ('13','�p�iste','epeiste6');
INSERT INTO Avatar VALUES ('14','�p�iste','epeiste7');
INSERT INTO Avatar VALUES ('15','�p�iste','epeiste8');
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
INSERT INTO Avatar VALUES ('29','Pr�tre','pretre1');
INSERT INTO Avatar VALUES ('30','Pr�tre','pretre2');
INSERT INTO Avatar VALUES ('31','Pr�tre','pretre3');
INSERT INTO Avatar VALUES ('32','Pr�tre','pretre4');
INSERT INTO Avatar VALUES ('33','Pr�tre','pretre5');
INSERT INTO Avatar VALUES ('34','Pr�tre','pretre6');
INSERT INTO Avatar VALUES ('35','Pr�tre','pretre7');
INSERT INTO Avatar VALUES ('36','Pr�tre','pretre8');
INSERT INTO Avatar VALUES ('37','Voleur','Voleur1');
INSERT INTO Avatar VALUES ('38','Voleur','Voleur2');
INSERT INTO Avatar VALUES ('39','Voleur','Voleur3');
TRUNCATE TABLE Body;
TRUNCATE TABLE Command;
INSERT INTO Command VALUES ('1','aide','divers','0','1','0','1','0','aide [commande]','Affiche de l''aide sur la <b>commande</b> ou affiche une liste des commandes');
INSERT INTO Command VALUES ('2','cast','action','1','0','0','1','0','cast heuu sort','Lance un sortil�ge.');
INSERT INTO Command VALUES ('3','chat','communication','0','0','0','1','0','chat message','Envoie un message � tous les joueurs connect�s.');
INSERT INTO Command VALUES ('4','clone','a_olc','0','1','1','0','0','clone class id','Clone l''objet de classe <b>class</b> identifi� par <b>id</b> et lui attribue un nouvel identifiant');
INSERT INTO Command VALUES ('5','drop','action','1','0','0','1','0','drop [nombre] objet','Pose un objet de votre inventaire � votre position. "drop *" pour tout poser.');
INSERT INTO Command VALUES ('6','dump','a_divers','0','1','1','0','0','dump (variable)','Affiche la structure d''une <b>variable</b>.<br><u>Exemple :</u> dump $h















dump tout court permet d''activer/d�sactiver l''affichage sur le terminal des r�ponses aux commandes (en html).');
INSERT INTO Command VALUES ('7','edit','a_olc','0','1','1','0','0','edit class id','Affiche une page de modification pour l''objet de classe <b>class</b> identifi� par <b>id</b>');
INSERT INTO Command VALUES ('8','examine','divers','0','0','0','1','0','examine quelque-chose','Permet de scruter un corps ou examiner un objet de votre inventaire.');
INSERT INTO Command VALUES ('9','force','a_gestion','0','1','1','0','0','force someone to action','Permet de forcer un personnage � faire quelque chose.');
INSERT INTO Command VALUES ('10','get','action','1','0','0','1','0','get * ou get objet ou get objet from conteneur','Ramasse un objet pr�sent � votre position.

get * permet de prendre tout ce qu''il y a directement au sol.

get objet permet de prendre un objet.



Exemples pour "objet" :

 - �p�e cristalline

 - cris

 - * pomme (elles seront toutes ramass�es)

 - 2 pomme (au plus 2 seront ramass�es)



get objet from corps permet de prendre un objet depuis un conteneur pr�sent.



Exemples pour "conteneur" :

 - pir

 - pirate saoul

 - corps 2 (2�me corps dont le nom contient corps)



Exemple g�n�ral : get 5 �p�e cristalline from pirate saoul 3

Pr�l�ve si possible 5 exemplaires de cette �p�e depuis le troisi�me corps d''un pirate saoul.

get 5 �p from pir 3 devrait donner la m�me chose s''il n''y a pas d''ambigu�t� avec un autre objet ou conteneur.');
INSERT INTO Command VALUES ('11','give','action','1','0','0','1','0','give nom [nombre] objet','Donne un objet � quelqu''un pr�s de vous (joueur ou cr�ature).');
INSERT INTO Command VALUES ('12','giveXp','a_gestion','0','1','1','0','0','giveXp player xp','Conf�re <b>xp</b> points d''exp�riences � <b>player</b>');
INSERT INTO Command VALUES ('13','goto','a_divers','0','1','1','0','0','goto [zone]','Affiche la liste des zones o� d�place vers la zone indiqu�e');
INSERT INTO Command VALUES ('14','help','a_divers','0','1','1','0','0','help [command]','Affiche de l''aide sur <b>command</b> ou affiche une liste des commandes');
INSERT INTO Command VALUES ('15','inventory','gestion','0','0','0','1','0','inventory','Liste les objets que vous avez sur vous.');
INSERT INTO Command VALUES ('16','kill','action','1','0','0','1','0','kill cible','Engage un combat � mort avec la cible.');
INSERT INTO Command VALUES ('17','look','divers','0','1','0','1','0','look','Vous regardez autours de vous.');
INSERT INTO Command VALUES ('18','lvUp','a_gestion','0','1','1','0','0','lvUp player','Incr�mente le niveau de <b>player</b> sans laisser d''xp au del�');
INSERT INTO Command VALUES ('20','olc','a_olc','0','1','1','0','0','olc [class]','Affiche la liste des classes ainsi que la liste des objets de la classe pr�cis�e.');
INSERT INTO Command VALUES ('21','olcShow','a_olc','0','1','1','0','0','olc_show class id','Affiche les donn�es de l''objet de classe <b>class</b> et d''identifiant <b>id</b>');
INSERT INTO Command VALUES ('22','option','divers','0','1','0','1','0','option','Acc�de � un panneau permettant de r�gler diff�rentes options.');
INSERT INTO Command VALUES ('23','shortcut','gestion','0','1','0','0','1','shortcut action id','Permet de modifier les raccourcis');
INSERT INTO Command VALUES ('25','pray','communication','0','0','0','1','0','pray message','Permet de contacter un admin afin de faire une demande ou signaler un probl�me quelconque.');
INSERT INTO Command VALUES ('26','remove','gestion','1','0','0','1','0','remove objet','Remet un objet �quip� dans votre sac.');
INSERT INTO Command VALUES ('27','ruby','a_divers','0','1','1','0','0','php script_php','Ex�cute <b>script_php</b>.<br><u>Exemple :</u> php save::world();');
INSERT INTO Command VALUES ('28','say','communication','1','0','0','1','0','say message','Vous dites quelque chose � voix normale et  ne serez entendu que par des personnes � proximit�.');
INSERT INTO Command VALUES ('29','selectAvatar','gestion','0','0','0','0','1','selectAvatar','Il n''y a pas d''aide l�-dessus.');
INSERT INTO Command VALUES ('30','selectSkin','gestion','0','0','0','0','1','selectSkin','Il n''y a pas d''aide l�-dessus.');
INSERT INTO Command VALUES ('31','set','a_olc','0','1','1','0','0','set class id variable value','Donne la valeur <b>value</b> � la <b>variable</b> pour l''objet de classe <b>class</b> identifi� par <b>id</b>');
INSERT INTO Command VALUES ('32','shout','communication','1','0','0','1','0','shout message','Envoie un message aux personnages se trouvant dans la zone.');
INSERT INTO Command VALUES ('33','summonItem','a_olc','0','1','1','0','0','summonItem id number','Invoque <b>number</b> objets d''id <b>id</b> dans votre inventaire');
INSERT INTO Command VALUES ('34','tell','communication','0','0','0','1','0','tell nom message','Dit � <b>nom</b>, le <b>message</b>. Sensible � la casse et � l''�tat du joueur vis�.');
INSERT INTO Command VALUES ('35','time','divers','0','0','0','1','0','time','Affiche la date et l''heure actuelle.');
INSERT INTO Command VALUES ('36','wear','gestion','1','0','0','1','0','wear objet','�quipe un objet de votre inventaire.');
INSERT INTO Command VALUES ('37','who','divers','0','0','0','1','0','who','Affiche la liste des joueurs connect�s.');
INSERT INTO Command VALUES ('38','redit','a_olc','0','1','1','0','0','redit','Affiche l''�diteur des salles');
INSERT INTO Command VALUES ('39','rcreate','a_olc','0','1','1','0','0','rcreate [nseobh]','Exemple : rcreate n pour cr�er une nouvelle salle au nord.







Les sorties sont reconfigur�es par la m�me occasion entre la salle actuelle et la nouvelle salle.







Ceci vous d�placera dans la salle cr��e.');
INSERT INTO Command VALUES ('40','eat','gestion','1','0','0','1','0','eat nourriture','exemple : eat c�pe pour manger un c�pe');
INSERT INTO Command VALUES ('41','include','a_divers','0','1','1','0','0','include path','Tente de charger le fichier indiqu� par <b>path</b>. Utiliser avec pr�caution...');
INSERT INTO Command VALUES ('42','special','divers','1','1','0','0','1','non d�clar�e','Il n''y a pas d''aide � propos de cette commande.');
INSERT INTO Command VALUES ('43','equipement','gestion','0','0','0','1','0','equipement','Liste les objets que vous portez sur le corps.');
INSERT INTO Command VALUES ('44','drag','action','1','0','0','1','0','drag corps to direction','Permet de d�placer un <b>corps<b> avec soi vers la <b>direction<b> ou l''endroit voulu.







Exemples pour "corps" :



 - corps



 - �cureuil roux



 - �cu



 - �cu 2 (2�me corps dont le nom contient �cu)







Exemple : drag �cureuil roux 2 to trap (s''il y a une sortie trappe)');
TRUNCATE TABLE God;
INSERT INTO God VALUES ('1');
INSERT INTO God VALUES ('6');
TRUNCATE TABLE Heroe;
TRUNCATE TABLE Item;
INSERT INTO Item VALUES ('1','une �p�e en bois de cerisier','nourriture','1','[:bras_gauche, :bras_droit]','Cette �p�e d''entra�nement ne permet de tuer que des rats (et encore)...','{}','{}','{}','0');
INSERT INTO Item VALUES ('2','un petit c�pe','nourriture','1','[]','C''est un champignon app�tissant.','{:rassasiment=>240}','{}','{}','20');
INSERT INTO Item VALUES ('3','une pi�ce d''or','money','0','[]','Ces pi�ces sont tr�s utilis�es dans le commerce.','{}','{}','{}','1');
TRUNCATE TABLE Mob;
INSERT INTO Mob VALUES ('1000000','un �cureuil roux','2','1','20','20','0','0','5','5','5','5','mob/Small10','mob/default','0','{}','{}','{}');
TRUNCATE TABLE Room;
INSERT INTO Room VALUES ('1','En pleine for�t','�tant adoss� au tronc d''un ch�ne, vous vous levez en vous grattant la t�te. Le sifflement d''une l�g�re brise entre les branchages se fait aussi sentir sur votre peau nue. Peut-�tre faudrait-il vous trouver de quoi vous habiller. Pour l''instant, un unique chemin s''offre � vous.<br>Tapez <font color=#3399CC>nord</font> enti�rement ou partiellement pour l''emprunter.','0','0','0','{}','{}','{:nord=>2}');
INSERT INTO Room VALUES ('2','Premiers pas','Vous vous d�placez avec disgr�ce comme si c''�tait vos premiers pas. Le chant des oiseaux attire votre attention, mais ce qui vous pr�occupe le plus � pr�sent est cette bestiole qui se d�place autours de vous en sautillant.<br>Tapez <i><b>look �cureuil</b></i> pour le regarder. Aussi n''oubliez pas la commande <i><b>aide</b></i>.','0','1','0','{}','{}','{:sud=>1, :est=>3}');
INSERT INTO Room VALUES ('3','La bois d''Aulne','Vous traversez quelques branchages et continuez votre chemin. Vous sentez une odeur particuli�re � l''est.','1','1','0','{2=>1}','{2=>1}','{:ouest=>2}');
TRUNCATE TABLE Shop;
TRUNCATE TABLE Skin;
INSERT INTO Skin VALUES ('1','Skin par d�faut','default');
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
TRUNCATE TABLE System;
INSERT INTO System VALUES ('1','world_time','442796');
INSERT INTO System VALUES ('2','time_difference','1272564013');
INSERT INTO System VALUES ('3','pray','[]');
INSERT INTO System VALUES ('4','hack','[]');
TRUNCATE TABLE World;
INSERT INTO World VALUES ('1','Myst','[1]');
TRUNCATE TABLE Zone;
INSERT INTO Zone VALUES ('1','Le Myst du milieu','-500','-500','-500','500','500','500');
