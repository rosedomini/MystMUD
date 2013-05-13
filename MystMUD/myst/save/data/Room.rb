#Room 1
{
	:@id => 1,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Cour de l'acad\u00E9mie",
	:@desc => "Vous vous trouvez dans une grande cour adjacente \u00E0 l'entr\u00E9e de l'Acad\u00E9mie de l'\u00EEle de Sifnos, le lieu de formation des mages et guerriers de la citadelle de Mira. L'entra\u00EEnement au combat se fait dans les jardins \u00E0 l'ouest. Vous pouvez aussi choisir d'entrer dans l'acad\u00E9mie et voir ce qui vous y attends.",
	:@x => 0,
	:@y => 0,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ouest=>2, :porte=>19},
},

#Room 2
{
	:@id => 2,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Jardins de l'acad\u00E9mie",
	:@desc => "Cet endroit est calme et reposant de part la grandeur des arbres. Les nombreuses odeurs des plantes viennent vous piquer les narines. C'est l'endroit favori du ma\u00EEtre d'armes, et il y passe la plupart de son temps.",
	:@x => -1,
	:@y => 0,
	:@z => 0,
	:@inv => {1=>1},
	:@items => {},
	:@exits => {:est=>1, :chemin=>3, :sud=>17},
},

#Room 3
{
	:@id => 3,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Un chemin bois\u00E9",
	:@desc => "Vous arpentez un chemin \u00E9troitement dissimul\u00E9 dans une for\u00EAt de thuya. Vous apercevez la forge \u00E0 l'ouest. Quelques arbres ont \u00E9t\u00E9 coup\u00E9s, surement pour alimenter les fourneaux de la forge.",
	:@x => -2,
	:@y => 0,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:est=>2, :ouest=>4},
},

#Room 4
{
	:@id => 4,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "La forge de Sifnos",
	:@desc => "Un b\u00E2timent imposant et bruyant se trouve ici. De la fum\u00E9e \u00E0 noirceur variable s'\u00E9chappe de la chemin\u00E9e. La porte est grande ouverte.",
	:@x => -3,
	:@y => 0,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:est=>3, :sud=>5, :porte=>6},
},

#Room 5
{
	:@id => 5,
	:@area => 1,
	:@background => "stone.jpg",
	:@name => "Carri\u00E8re de bauxite",
	:@desc => "Vous \u00EAtes \u00E9bloui par la splendeur de cette exploitation. Une grande couche de bauxite d\u00E9j\u00E0 entam\u00E9e appara\u00EEt ici. Seuls les nains savent l'exploiter de nos jours. Il s'agit d'une roche ici rouge, permettant la production d'aluminium.",
	:@x => -3,
	:@y => -1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:nord=>4},
},

#Room 6
{
	:@id => 6,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "L'int\u00E9rieur de la forge",
	:@desc => "Vos yeux r\u00E9agissent \u00E0 l'intensit\u00E9 lumineuse des fourneaux. L'int\u00E9rieur est d\u00E9cor\u00E9 de t\u00EAtes de gobelin empaill\u00E9es, et de diverses armes dont certaines semblent impossibles \u00E0 porter.",
	:@x => -4,
	:@y => 0,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:porte=>4},
},

#Room 7
{
	:@id => 7,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Votre chambre",
	:@desc => "Vous \u00EAtes dans votre chambre au premier \u00E9tage. Votre lit recouvert d'un drap de soie s'appuie contre le mur gauche. En face de la porte ne se trouve pas de mur, mais une baie vitr\u00E9e donnant sur une infinie for\u00EAt tropicale. Cette vue est votre source d'inspiration, l\u00E0 d'o\u00F9 proviennent vos id\u00E9es les plus brillantes.",
	:@x => -10000,
	:@y => -10000,
	:@z => 1,
	:@inv => {11=>1},
	:@items => {11=>1},
	:@exits => {:porte=>8},
},

#Room 8
{
	:@id => 8,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Cage d'escalier ~ 1er \u00E9tage",
	:@desc => "L'escalier forme une spirale autours d'un ch\u00EAne majestueux. Une porte m\u00E8ne \u00E0 votre chambre, et les marches vous invitent vers le s\u00E9jour.",
	:@x => -10001,
	:@y => -10000,
	:@z => 1,
	:@inv => {9=>7, 8=>1},
	:@items => {},
	:@exits => {:porte=>7, :escalier=>9},
},

#Room 9
{
	:@id => 9,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Le s\u00E9jour",
	:@desc => "Vous \u00EAtes au pied du magnifique ch\u00EAne qui fait vivre la cage d'escalier. Vous apparaissez directement dans votre s\u00E9jour, \u00E9clair\u00E9 de tous c\u00F4t\u00E9s par le Soleil et la Lune. Une table de verre sur pieds d'argent est centr\u00E9e dans la salle, affichant des reflets de feuilles. Une trappe et une \u00E9chelle permettent de sortir ou rentrer dans cette maison en altitude.",
	:@x => -10001,
	:@y => -10000,
	:@z => 0,
	:@inv => {9=>7},
	:@items => {9=>7},
	:@exits => {:escalier=>8, :trappe=>10},
},

#Room 10
{
	:@id => 10,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "La for\u00EAt tropicale",
	:@desc => "Vous \u00EAtes aux pieds de la for\u00EAt. Un unique chemin traverse les arbres. Dirig\u00E9 vers le sud, il m\u00E8ne au fleuve Everdale. Une \u00E9chelle permet de grimper chez vous.",
	:@x => -10001,
	:@y => -10000,
	:@z => -1,
	:@inv => {},
	:@items => {},
	:@exits => {:grimper=>9, :sud=>11},
},

#Room 11
{
	:@id => 11,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "La for\u00EAt tropicale",
	:@desc => "Vous marchez le long du chemin liant votre maison \u00E0 la bordure du fleuve. La for\u00EAt est tr\u00E8s dense, mais vous apercevez enfin le fleuve Everdale au sud.",
	:@x => -10001,
	:@y => -10001,
	:@z => -1,
	:@inv => {},
	:@items => {},
	:@exits => {:nord=>10, :sud=>12},
},

#Room 12
{
	:@id => 12,
	:@area => 1,
	:@background => "everdale.jpg",
	:@name => "Le fleuve Everdale",
	:@desc => "Vous longez le fleuve Everdale. La bordure sud du lit est recouverte de mangrove et de grosses bulles surgissent de l'eau. Le courant est faible \u00E0 cet endroit, mais vous n'\u00EAtes pas tent\u00E9 d'y mette le pied. Le fleuve s'\u00E9tend \u00E0 perte de vue des deux c\u00F4t\u00E9s, cependant vous apercevez un ponton un peu plus en aval.",
	:@x => -10001,
	:@y => -10002,
	:@z => -1,
	:@inv => {},
	:@items => {},
	:@exits => {:nord=>11, :ponton=>13},
},

#Room 13
{
	:@id => 13,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Ponton",
	:@desc => "Vous est sur un ponton dont le bois semble moisi par l'eau et la boue. Vous pouvez regagner la for\u00EAt au nord, ou monter dans la pirogue.",
	:@x => -10001,
	:@y => -10003,
	:@z => -1,
	:@inv => {},
	:@items => {},
	:@exits => {:nord=>12, :pirogue=>14},
},

#Room 14
{
	:@id => 14,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Une pirogue",
	:@desc => "Vous montez sur la pirogue et vous pr\u00E9parez \u00E0 ramer. C'est le d\u00E9but d'une aventure; les jeux sont faits.",
	:@x => -10000,
	:@y => -10003,
	:@z => -1,
	:@inv => {},
	:@items => {},
	:@exits => {:ponton=>13, :ramer=>15},
},

#Room 15
{
	:@id => 15,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Une pirogue",
	:@desc => "Vous voil\u00E0 en route pour l'\u00EEle de Sifnos, situ\u00E9e dans le delta de l'Everdale. Vous sentez la pr\u00E9sence de la vie tout autours et m\u00EAme sous votre embarcation, mais commencerez bient\u00F4t \u00E0 vous y habituer. Vos parents ont laiss\u00E9 ici un sac de riz pour le voyage. Utilisez les commandes <b><i>get</b></i> (prendre) et <b><i>eat</b></i> (manger) si vous avez faim.",
	:@x => -9999,
	:@y => -10003,
	:@z => -1,
	:@inv => {10=>15},
	:@items => {10=>15},
	:@exits => {},
},

#Room 16
{
	:@id => 16,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Ponton de l'\u00EEle de Sifnos",
	:@desc => "Ce ponton est tr\u00E8s grand et couvert d'algues diverses. Vous ne vous \u00EAtes pas tromp\u00E9s d'\u00EEle ! Plusieurs barques et petits bateaux y sont d\u00E9j\u00E0 amarr\u00E9s. Le phare domine sur la vue du delta et vous apercevez les tours de l'Acad\u00E9mie au del\u00E0 de la plage de sable fin.",
	:@x => 0,
	:@y => -1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:plage=>17, :pirogue=>18},
},

#Room 17
{
	:@id => 17,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Une plage de sable fin",
	:@desc => "Vous \u00EAtes entre le ponton et ce qui semble \u00EAtre un jardin \u00E0 moiti\u00E9 cach\u00E9 par de grands arbres.",
	:@x => -1,
	:@y => -1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ponton=>16, :nord=>2},
},

#Room 18
{
	:@id => 18,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Une pirogue sans rames",
	:@desc => "Vous cassez vos rames en emp\u00EAchant la pirogue de heurter violemment le ponton. Vous vous attendiez \u00E0 voir un vrai port, mais la l\u00E9gende raconte qu'au d\u00E9but de l'ann\u00E9e scolaire le niveau de l'eau se met \u00E0 monter, que toutes les embarcations rentrent chez elles et que seules les \u00E9tudes de magie permettent d'en ressortir.",
	:@x => 1,
	:@y => -1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ponton=>16},
},

#Room 19
{
	:@id => 19,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Entr\u00E9e de l'Acad\u00E9mie",
	:@desc => "Vous franchissez la majestueuse porte en bois d'\u00E9b\u00E8ne, sculpt\u00E9e pour accueillir autant la lumi\u00E8re du jour que les \u00E9l\u00E8ves. Vous vous sentiez toujours sur de la terre avant de vous apercevoir que le sol est maintenant une nappe de poudre color\u00E9e. Votre regard est toutefois d\u00E9tourn\u00E9; vous jureriez avoir vu bouger la queue d'une sculpture de serpent \u00E0 t\u00EAte de poisson chat. Votre esprit est en \u00E9veil total, sem\u00E9 de curiosit\u00E9.",
	:@x => 0,
	:@y => 1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:porte=>1, :nord=>20, :est=>21},
},

#Room 20
{
	:@id => 20,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Corridor d'acc\u00E8s \u00E0 la tour Nord",
	:@desc => "Vous longez le corridor vers le nord tout en examinant les divers tableaux suspendus aux les murs. Des chandeliers remplacent peu \u00E0 peu la lumi\u00E8re solaire. La poudre servant de sol semble moins dure par endroits, et vous manquez de tr\u00E9bucher.",
	:@x => 0,
	:@y => 2,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:sud=>19, :nord=>22},
},

#Room 21
{
	:@id => 21,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Couloir ~ Aile Sud",
	:@desc => "Vous empruntez un couloir large et bien \u00E9clair\u00E9 par son ouverture sur une cour et l'entr\u00E9e, ainsi que par les nombreux vitraux qui donnent son charme \u00E0 l'\u00E9tablissement. Le mur nord \u00E9tablit la liaison \u00E0 diff\u00E9rentes salles de classe. Vous entendez le ruissellement d'une fontaine venant de l'est.",
	:@x => 1,
	:@y => 1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ouest=>19, :est=>24},
},

#Room 22
{
	:@id => 22,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Corridor d'acc\u00E8s \u00E0 la tour Nord",
	:@desc => "Le couloir devient de plus en plus sombre mais les chandeliers sont toujours l\u00E0 pour \u00E9clairer les parois du ch\u00E2teau. Une petite porte en bois pourrait vous orienter vers la partie ouest du ch\u00E2teau, mais la poudre \u00E0 proximit\u00E9 de la porte est imbib\u00E9e d'eau.",
	:@x => 0,
	:@y => 3,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:sud=>20, :porte=>23, :nord=>29},
},

#Room 23
{
	:@id => 23,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Une petite salle sombre",
	:@desc => "Vous avez les pieds tremp\u00E9s et vous enfoncez l\u00E9g\u00E8rement dans le sol. La seule source de lumi\u00E8re provient de la porte que vous n'avez pas os\u00E9 refermer. Des traces de pas de dessinent toutes seules sur le sol, \u00E0 croire que vous n'\u00EAtes pas vraiment seul.<br><br/>Quelqu'un dit: Sortez d'ici! Ne remarquez-vous pas l'\u00E9tat du sol? Cet endroit est truff\u00E9 de vers hydromanciens. Vous ne voudriez pas \u00EAtre aspir\u00E9 dans leurs galeries, sous cette poudre dites-moi?",
	:@x => -1,
	:@y => 3,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:porte=>22},
},

#Room 24
{
	:@id => 24,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Couloir ~ Aile Sud",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 2,
	:@y => 1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ouest=>21, :est=>25, :porte=>28},
},

#Room 25
{
	:@id => 25,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Couloir ~ Aile Sud",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 3,
	:@y => 1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ouest=>24, :est=>26, :porte=>27},
},

#Room 26
{
	:@id => 26,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Cour Est de l'acad\u00E9mie",
	:@desc => "Vous d\u00E9bouchez dans une cour carr\u00E9e, baign\u00E9e de soleil et enjoliv\u00E9e par une fontaine constitu\u00E9e d'une piscine ronde en marbre et d'une hydre \u00E0 2 t\u00EAtes sculpt\u00E9e dans un seul bloc de serpentine. L'\u00E9coulement de l'eau n'est pas constant, comme s'il d\u00E9pendait de l'humeur de la cr\u00E9ature, si immobile soit-elle. Le couloir de l'aile sud se trouve \u00E0 l'ouest, mais le couloir au nord est ferm\u00E9. Vous pouvez passer entre les colonnes Sud et Est de la cour pour aborder une petite descente vers les plaines de l'\u00EEle.",
	:@x => 4,
	:@y => 1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ouest=>25, :nord=>30, :est=>31, :sud=>32},
},

#Room 27
{
	:@id => 27,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Nouvelle salle",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 3,
	:@y => 2,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:porte=>25},
},

#Room 28
{
	:@id => 28,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Nouvelle salle",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 2,
	:@y => 2,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:porte=>24},
},

#Room 29
{
	:@id => 29,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Nouvelle salle",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 0,
	:@y => 4,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:sud=>22},
},

#Room 30
{
	:@id => 30,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Couloir ~ Aile Est",
	:@desc => "Une corde est tir\u00E9e entre les deux pans du couloir. Des d\u00E9bris jonchent le sol et le toit est perc\u00E9 d'un trou de 2 m\u00E8tres de diam\u00E8tre. Mieux vaut revenir sur vos pas, quitte \u00E0 faire le tour pour rejoindre l'autre bout du couloir.",
	:@x => 4,
	:@y => 2,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:sud=>26},
},

#Room 31
{
	:@id => 31,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Nouvelle salle",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 5,
	:@y => 1,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ouest=>26, :sud=>33},
},

#Room 32
{
	:@id => 32,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Nouvelle salle",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 4,
	:@y => 0,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:nord=>26, :est=>33, :ouest=>34},
},

#Room 33
{
	:@id => 33,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Nouvelle salle",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 5,
	:@y => 0,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:ouest=>32, :nord=>31},
},

#Room 34
{
	:@id => 34,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Nouvelle salle",
	:@desc => "Cette salle est bien \u00E9clair\u00E9e et sent bon la peinture fra\u00EEche.",
	:@x => 3,
	:@y => 0,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:est=>32},
},

