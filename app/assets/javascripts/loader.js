var load_timeout = false;
var timeout = false;
var loaded = false;

function load(){
	if(loaded) return;
	refresh()
	new Window('loader', 'Myst', 'loader',
'<div id=loader class=window></div>', false, 0, 0)
	windows['loader'].resize(300, 'auto')
	windows['loader'].centered= true
	load_timeout = setTimeout(function(){
		div_setHtml('loader',
'<p>Flash Player est nécessaire pour établir une connexion \
dynamique au serveur de jeu.</p>\
<p><a target=_blanck href=http://get.adobe.com/fr/flashplayer/>\
Télécharger la dernière version de Flash \Player</a></p>\
<p><input type=button value="Recharger la page" \
onclick="document.location.href=\'\'"></p>')
		windows['loader'].resize(350, 'auto')
		windows['loader'].show()}, 300)
	loaded=true
}

function sock_loaded(){
	if(!loaded) load();
	clearTimeout(load_timeout)
	if(server_online){
		swfobject.getObjectById('myst').connect(host, port)
		windows['loader'].hide()
		load_timeout= setTimeout(function(){
			div_setHtml('loader',
'<p>Status du serveur: <b>actif</b></p>\
<p>Joueurs en ligne: <b>'+online_players+'</b></p>\
<p>Connexion en cours...</p>')
			windows['loader'].show()
			resize()
		}, 500)
		timeout= setTimeout(function(){
			div_setHtml('loader',
'<p align=center>Status du serveur: <b>actif</b></p>\
<p align=center>Joueurs en ligne: <b>'+online_players+'</b></p>\
<p>La connexion aurait déjà du être créée. Vérifiez vos paramètres de connexion\
 et ceux du plugin Flash Player.</p><p align=right><input type="button" \
value="Réessayer" onclick="document.location.href=\'\'"></p>')
			windows['loader'].resize(400, 'auto')
			windows['loader'].show()
			resize()}, 5000)}
	else {
		div_setHtml('loader',
'<p>Status du serveur: <b>fermé</b></p>\
<p align=right><input type="button" \
value="Actualiser" onclick="document.location.href=\'\'"></p>')
		windows['loader'].show()}}

function sock_connected(){
	setTimeout(function(){
		del_el('configuration')}, 2000)
	clearTimeout(load_timeout)
	clearTimeout(timeout)
	windows['loader'].del()
	el('main').style.display= 'block'
	el('bars').style.visibility= 'visible'
	focus()
	resize()
	setTimeout(regen, 150)}

function sock_disconnected(buffer){
	resize()
	stats_clear()}