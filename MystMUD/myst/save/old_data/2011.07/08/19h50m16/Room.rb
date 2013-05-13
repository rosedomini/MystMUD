#Room 1
{
	:@id => 1,
	:@area => 1,
	:@background => "forest.jpg",
	:@name => "Cour de l'académie",
	:@desc => "Vous vous trouvez dans une grande cour adjacente à l'entrée de l'Académie de l'île de Sifnos, le lieu de formation des mages et guerriers de la citadelle de Mira. L'entraînement au combat se fait dans les jardins à l'ouest. Vous pouvez aussi choisir d'entrer dans l'académie et voir ce qui vous y attends.",
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
	:@name => "Jardins de l'académie",
	:@desc => "Cet endroit est calme et reposant de part la grandeur des arbres. Les nombreuses odeurs des plantes viennent vous piquer les narines. C'est l'endroit favori du maître d'armes, et il y passe la plupart de son temps.",
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
	:@name => "Un chemin boisé",
	:@desc => "Vous arpentez un chemin étroitement dissimulé dans une forêt de thuya. Vous apercevez la forge à l'ouest. Quelques arbres ont été coupés, surement pour alimenter les fourneaux de la forge.",
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
	:@desc => "Un bâtiment imposant et bruyant se trouve ici. De la fumée à noirceur variable s'échappe de la cheminée. La porte est grande ouverte.",
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
	:@name => "Carrière de bauxite",
	:@desc => "Vous êtes ébloui par la splendeur de cette exploitation. Une grande couche de bauxite déjà entamée apparaît ici. Seuls les nains savent l'exploiter de nos jours. Il s'agit d'une roche ici rouge, permettant la production d'aluminium.",
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
	:@name => "L'intérieur de la forge",
	:@desc => "Vos yeux réagissent à l'intensité lumineuse des fourneaux. L'intérieur est décoré de têtes de gobelin empaillées, et de diverses armes dont certaines semblent impossibles à porter.",
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
	:@desc => "Vous êtes dans votre chambre au premier étage. Votre lit recouvert d'un drap de soie s'appuie contre le mur gauche. En face de la porte ne se trouve pas de mur, mais une baie vitrée donnant sur une infinie forêt tropicale. Cette vue est votre source d'inspiration, là d'où proviennent vos idées les plus brillantes.",
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
	:@name => "Cage d'escalier ~ 1er étage",
	:@desc => "L'escalier forme une spirale autours d'un chêne majestueux. Une porte mène à votre chambre, et les marches vous invitent vers le séjour.",
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
	:@name => "Le séjour",
	:@desc => "Vous êtes au pied du magnifique chêne qui fait vivre la cage d'escalier. Vous apparaissez directement dans votre séjour, éclairé de tous côtés par le Soleil et la Lune. Une table de verre sur pieds d'argent est centrée dans la salle, affichant des reflets de feuilles. Une trappe et une échelle permettent de sortir ou rentrer dans cette maison en altitude.",
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
	:@name => "La forêt tropicale",
	:@desc => "Vous êtes aux pieds de la forêt. Un unique chemin traverse les arbres. Dirigé vers le sud, il mène au fleuve Everdale. Une échelle permet de grimper chez vous.",
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
	:@name => "La forêt tropicale",
	:@desc => "Vous marchez le long du chemin liant votre maison à la bordure du fleuve. La forêt est très dense, mais vous apercevez enfin le fleuve Everdale au sud.",
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
	:@desc => "Vous longez le fleuve Everdale. La bordure sud du lit est recouverte de mangrove et de grosses bulles surgissent de l'eau. Le courant est faible à cet endroit, mais vous n'êtes pas tenté d'y mette le pied. Le fleuve s'étend à perte de vue des deux côtés, cependant vous apercevez un ponton un peu plus en aval.",
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
	:@desc => "Vous est sur un ponton dont le bois semble moisi par l'eau et la boue. Vous pouvez regagner la forêt au nord, ou monter dans la pirogue.",
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
	:@desc => "Vous montez sur la pirogue et vous préparez à ramer. C'est le début d'une aventure; les jeux sont faits.",
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
	:@desc => "Vous voilà en route pour l'île de Sifnos, située dans le delta de l'Everdale. Vous sentez la présence de la vie tout autours et même sous votre embarcation, mais commencerez bientôt à vous y habituer. Vos parents ont laissé ici un sac de riz pour le voyage. Utilisez les commandes <b><i>get</b></i> (prendre) et <b><i>eat</b></i> (manger) si vous avez faim.",
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
	:@name => "Ponton de l'île de Sifnos",
	:@desc => "Ce ponton est très grand et couvert d'algues diverses. Vous ne vous êtes pas trompés d'île ! Plusieurs barques et petits bateaux y sont déjà amarrés. Le phare domine sur la vue du delta et vous apercevez les tours de l'Académie au delà de la plage de sable fin.",
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
	:@desc => "Vous êtes entre le ponton et ce qui semble être un jardin à moitié caché par de grands arbres.",
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
	:@desc => "Vous cassez vos rames en empêchant la pirogue de heurter violemment le ponton. Vous vous attendiez à voir un vrai port, mais la légende raconte qu'au début de l'année scolaire le niveau de l'eau se met à monter, que toutes les embarcations rentrent chez elles et que seules les études de magie permettent d'en ressortir.",
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
	:@name => "Entrée de l'Académie",
	:@desc => "Vous franchissez la majestueuse porte en bois d'ébène, sculptée pour accueillir autant la lumière du jour que les élèves. Vous vous sentiez toujours sur de la terre avant de vous apercevoir que le sol est maintenant une nappe de poudre colorée. Votre regard est toutefois détourné; vous jureriez avoir vu bouger la queue d'une sculpture de serpent à tête de poisson chat. Votre esprit est en éveil total, semé de curiosité.",
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
	:@name => "Corridor d'accès à la tour Nord",
	:@desc => "Vous longez le corridor vers le nord tout en examinant les divers tableaux suspendus aux les murs. Des chandeliers remplacent peu à peu la lumière solaire. La poudre servant de sol semble moins dure par endroits, et vous manquez de trébucher.",
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
	:@desc => "Vous empruntez un couloir large et bien éclairé par son ouverture sur une cour et l'entrée, ainsi que par les nombreux vitraux qui donnent son charme à l'établissement. Le mur nord établit la liaison à différentes salles de classe. Vous entendez le ruissellement d'une fontaine venant de l'est.",
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
	:@name => "Corridor d'accès à la tour Nord",
	:@desc => "Le couloir devient de plus en plus sombre mais les chandeliers sont toujours là pour éclairer les parois du château. Une petite porte en bois pourrait vous orienter vers la partie ouest du château, mais la poudre à proximité de la porte est imbibée d'eau.",
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
	:@desc => "Vous avez les pieds trempés et vous enfoncez légèrement dans le sol. La seule source de lumière provient de la porte que vous n'avez pas osé refermer. Des traces de pas de dessinent toutes seules sur le sol, à croire que vous n'êtes pas vraiment seul.<br><br/>Quelqu'un dit: Sortez d'ici! Ne remarquez-vous pas l'état du sol? Cet endroit est truffé de vers hydromanciens. Vous ne voudriez pas être aspiré dans leurs galeries, sous cette poudre dites-moi?",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
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
	:@name => "Cour Est de l'académie",
	:@desc => "Vous débouchez dans une cour carrée, baignée de soleil et enjolivée par une fontaine constituée d'une piscine ronde en marbre et d'une hydre à 2 têtes sculptée dans un seul bloc de serpentine. L'écoulement de l'eau n'est pas constant, comme s'il dépendait de l'humeur de la créature, si immobile soit-elle. Le couloir de l'aile sud se trouve à l'ouest, mais le couloir au nord est fermé. Vous pouvez passer entre les colonnes Sud et Est de la cour pour aborder une petite descente vers les plaines de l'île.",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
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
	:@desc => "Une corde est tirée entre les deux pans du couloir. Des débris jonchent le sol et le toit est percé d'un trou de 2 mètres de diamètre. Mieux vaut revenir sur vos pas, quitte à faire le tour pour rejoindre l'autre bout du couloir.",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
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
	:@desc => "Cette salle est bien éclairée et sent bon la peinture fraîche.",
	:@x => 3,
	:@y => 0,
	:@z => 0,
	:@inv => {},
	:@items => {},
	:@exits => {:est=>32},
},

