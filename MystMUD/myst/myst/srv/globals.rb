
ExtCmd = Command::Client

Lightblue = '#3399CC'

Server_policy = "<?xml version=\"1.0\"?> 
<!DOCTYPE cross-domain-policy SYSTEM \"http://www.adobe.com/xml/dtds/cross-domain-policy.dtd\"> 
<cross-domain-policy>  
<allow-access-from domain=\"*\" to-ports=\"*\" />
</cross-domain-policy>"

s = '<pre style=font-size:12pt;font-family:monospace;color:#3E6FB1>
 __  __           _
|  \\\\/  |_   _ ___| |_
| |\\\\/| | | | / __| __|
| |  | | |_| \\\\__ \\\\ |_
|_|  |_|\\\\__, |___/\\\\__|
        |___/</pre>Entrez votre nom: '

s.insert 0, [s.bytesize].pack('n')
Server_MOTD = [s.bytesize].pack('n') << ExtCmd[:box_append] << s

Syntax_words = {
	'commande' => 'Le nom d\'une commande : <b>help</b>, <b>who</b>, <b>get</b>, etc.',
	'puissance' => 'Un nombre entre 1 et votre niveau maîtrise de la compétence concernée.',
	'sortilège' => 'Le nom ou une partie du nom d\'un sortilège parmis la liste de tous les sorts ou de ceux que vous connaissez.',
	'cible' => 'Le nom ou une partie du nom d\'un personnage ou créature que vous voulez atteindre. Ce paramètre est souvent optionnel et sa valeur par défaut serait vous (protection) ou une cible que vous combattez (violence). Les accents (éèàî...) doivent être respectés.',
	'message' => 'Un court message écrit de façon <b><u><i>respectable</i></u></b>.',
	'corps' => 'Le nom ou une partie du nom d\'un corps dans votre champs de vision. S\'il y a deux corps de pirate, alors tapez pirate2 ou corps2 pour cibler le deuxième. Les accents (éèàî...) doivent être respectés.',
	'direction' => 'Le nom ou une partie du nom d\'une sortie que vous voyez. Si vous ne la voyez pas mais qu\'elle est présente, vous devrez l\'entrer entièrement. Les accents (éèàî...) doivent être respectés.',
	'quelque-chose' => 'Varie selon la commande. Pour la commande <b>examine</b>, il faut que ce soit un <a class=syntax href="javascript:p(\'aide syntax corps\')">corps</a> ou un <a class=syntax href="javascript:p(\'aide syntax objet\')">objet</b>.',
	'conteneur' => 'Le nom ou une partie du nom d\'un coffre ou d\'un corps que vous voyez. Les accents (éèàî...) doivent être respectés.',
	'nombre' => 'Un nombre entier positif ou "<b>*</b>" (le maximum).',
	'nom' => 'Le nom ou une partie du nom d\'un personnage ou d\'une créature. Les accents (éèàî...) doivent être respectés.',
	'objet' => 'Le nom ou une partie du nom d\'un objet. Une lettre suffit parfois, par exemple : <b>d</b> pour <b>un drapeau noir</b> si c\'est le seul objet candidat contenant un <b>d</b>. La liste des objets candidats dépend de la commande. Pour la commande <b>remove</b> (retirer), les objets concernés sont ceux de votre équipement. S\'il y a deux épées différentes, alors pour selectionner la deuxième vous pouvez taper <b>épée2</b>. Les accents (éèàî...) doivent être respectés.'
}

$dump    = false
$refresh = 0  # refresh counter
$str     = {}
$task    = nil
Map      = {} # both set with
OLC      = {} # Dat.define

