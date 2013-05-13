
function box_append(html){
	el('console').innerHTML+= html
 resize()
 setTimeout(resize, 0)}

function box_clear(){
	el('console').innerHTML= ''}

function div_setHtml(id, html){
	el(id).innerHTML= html}

function enemy_show(name, hp, maxhp){
	clearTimeout(adv_hide_timeout)
	if(el('adv_name').innerHTML != name) el('adv_name').innerHTML= name
	el('adv').style.visibility= 'visible'
	el('adv_v').style.width= Math.round(231* hp/ maxhp)+ 'px'
	el('adv1').style.backgroundColor= 'white'
	el('adv2').style.backgroundColor= 'orange'
	adv_hide_timeout= setTimeout(function(){hide_adv()}, 2200)}

function list_append(name, id, item){
	lists[name].add(id, item)}

function list_display(name){
	lists[name].display()}

function list_show(name, acts){
	lists[name]= new List(name)
	lists[name].acts= acts.split(';')
	lists[name].build()}

function team_append(id, name){
	team.push([id, name])
	if(team.length == 1) el('w_team_content').innerHTML= ''
	el('w_team_content').innerHTML+=
'<table style="margin-top:'+(team.length == 1? 0: 8)+'px" id="team_a'+id+'" cel\
lpadding=0 cellspacing=0><tr><td width=250 bgcolor=orange><span class=centernum\
ber><font color=white>'+name+'</font></span><img style=width:100px;height:16px \
id="v'+id+'" src=design/stats/life.png></td></tr></table>'
	team_show()}

function team_clear(){
	el('w_team_content').innerHTML=
'Pas d\'équipe. <a href="javascript:p(\'aide team\')">Former une équipe</a>'
	team.splice(0, team.length)}

function team_hide(){
	el('w_team').style.display= 'none'
	holding_tw= false
	el('bar').focus()}

function team_remove(id){
	for(i in team)
		if(team[i][0] == id){
			rgn[id]= undefined
			team.splice(i, 1)}
	del_el('team_a'+id)
	if(team.length == 0) team_clear()}

function team_show(){
 windows['team'].show()}

function team_update(teamID, HP, HPM, MP, MPM, HPA, MPA){
	rgn[teamID]= {
		'HP': HP, 'HPM': HPM, 'HPA': HPA,
		'MP': MP, 'MPM': MPM, 'MPA': MPA,
		'active': true, 'start': new Date().getTime()}}

function top_append(s){
	el('top').innerHTML+= s
 windows['top'].show()}

function top_clear(){
	el('top').innerHTML= ''
	el('bar').focus()
 windows['top'].hide()}

function top_show(s){
	el('top').innerHTML= s
 windows['top'].show()}

// begin set_values

function bg_set(bg){
	document.body.style.backgroundImage= 'url("ico/bg/'+bg+'")'}

// end set_values

function shortcuts_show(id, img, cmd){
	// if(!id)
		// el('shortcuts').innerHTML= ''
	shortcuts[id]= cmd
	// el('shortcuts').innerHTML+=
// '<img height=20 onclick="javascript:p(\'!shortcut edit '+id+'\')\" src="ico/sho\
// rtcuts/'+img+'.png" title="'+cmd+' ('+(id+1)+')">'
}

function stats_clear(){
	rgn[0]['active']= false
	el('left_hp_arrows').innerHTML= ''
	el('right_hp_arrows').innerHTML= ''
	el('left_mp_arrows').innerHTML= ''
	el('right_mp_arrows').innerHTML= ''
	el('v0').style.width= 250+ 'px'
	el('hp0').innerHTML= 'vie'
	el('m0').style.width= 250+ 'px'
	el('mp0').innerHTML= 'magie'
}

function stats_update(HP, HPM, MP, MPM, HPA, MPA){
	var i, s= ''
	el('left_hp_arrows').innerHTML= ''
	el('left_mp_arrows').innerHTML= ''
	el('right_hp_arrows').innerHTML= ''
	el('right_mp_arrows').innerHTML= ''
	if(HPA < 0){
		for(i= 0; i > HPA; i--) s+= '&lsaquo;'
		el('left_hp_arrows').innerHTML= s}
	else if(HPA > 0){
		for(i=0; i < HPA; i++) s+= '&rsaquo;'
		el('right_hp_arrows').innerHTML= s}
	s= ''
	if(MPA < 0){
		for(i=0; i > MPA; i--) s+= '&lsaquo;'
		el('left_mp_arrows').innerHTML= s}
	else if(MPA > 0){
		for(i=0; i < MPA; i++) s+= '&rsaquo;'
		el('right_mp_arrows').innerHTML= s}
	rgn[0]= {
		'HP': HP, 'HPM': HPM, 'HPA': HPA,
		'MP': MP, 'MPM': MPM, 'MPA': MPA,
		'active': true, 'start': new Date().getTime()}}

function window_create(name, title, div, content, show, x, y){
	new Window(name, title, div, content, show, x, y)}

function window_edit(name, content){
	windows[name].edit(content)}

function window_hide(name){
	windows[name].hide()}

function window_resize(name, x, y){
 windows[name].resize(x, y)}

function window_set_title(name, title){
	windows[name].set_title(title)}

function window_show(name){
	windows[name].show()}