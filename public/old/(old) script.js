var margintop = 0, ss = '', buffer = '<br>', port = 6021, box_updated = false
var m = [], typed = [], typedCurrentId = 0, shortcuts = [], lists = [], team = []
var regen_active = false, adv_hide_timeout, holding_tw = false, tw_dx, tw_dy, mouseX, mouseY
var speed_check, sc_a = [], usual_speed = 0

var rgn = {0:{'active':false}}

var isIE = document.all ? true : false
if(!isIE) document.addEventListener('mousemove', getMousePosition, true)

function getMousePosition(mp) {
	if(isIE){ 
		mouseX = event.clientX + document.body.scrollLeft
		mouseY = event.clientY + document.body.scrollTop
	} else { mouseX = mp.pageX; mouseY = mp.pageY }
	if(holding_tw){
		el('team_w').style.left = mouseX-tw_dx+'px'
		el('team_w').style.top = mouseY-tw_dy+'px'
	}
}

function load(){ refresh() }

function scroll(){ el('console').scrollTop = 90000 }

function resize(){
	var h1 = (document.documentElement.clientHeight - 200)+'px'
	var h2 = (document.documentElement.clientHeight - el('main').clientHeight - 54)+'px'
	if(el('main').style.maxHeight != h1) el('main').style.maxHeight = h1
	if(el('console').style.height != h2) el('console').style.height = h2
	setTimeout(scroll, 0)
}

function refresh(){
	resize()
	setTimeout(refresh, 1000)
}

function del_el(n){ if(el(n) != null) el(n).parentNode.removeChild(el(n)) }

function cut(s){ while(s[0] == '!') s = s.substring(1, s.length); return s}
function c(s){ p(cut(s)) }
function p(s){ swfobject.getObjectById('myst').write(s) }

function flash_alert(s){
	el('console').innerHTML += '<i>Debug: '+s+'</i><br>'
	resize()
}

function sock_loaded(){
	swfobject.getObjectById('myst').connect(host, port)
	top_show(true, serverInfo); resize()
}

function sock_connected(){
	el('console').style.visibility='visible'
	top_clear()
	el('bar').focus()
	shortcut.add('space', function(){ el('bar').focus() }, {'disable_in_input':true})
	shortcut.add('Up', backCmd); shortcut.add('Down', nextCmd)
	resize()
	setTimeout(regen, 150)
}

function sock_disconnected(buffer){
	resize()
	stats_clear()
}

function backCmd(){
	typedCurrentId--
	if(typeof typed[typedCurrentId] == 'undefined') typedCurrentId++
	else el('bar').value = typed[typedCurrentId]
}

function nextCmd(){
	typedCurrentId++
	if(typeof typed[typedCurrentId] == 'undefined'){ typedCurrentId = typed.length ; el('bar').value = '' }
	else el('bar').value = typed[typedCurrentId]
}

function echo(s){
		box_append('<font color=#676767># '+
			cut(s).substring(0, 30)+"</font><br/>")
}

function puts(e){
	var s ='!'
	if(e.keyCode == 13){
		if(el('bar').value.length > 0) s = el('bar').value
		c(s); typedCurrentId = typed.length; echo(s)
		if(s != typed[typedCurrentId - 1] && s != '!'){
			typed[typedCurrentId] = s; typedCurrentId++ }
		el('bar').value = ''; el('bar').focus()
	}
	else if(el('bar').value.length == 0){
		switch(e.keyCode == 0 ? e.which : e.keyCode){
			case 38: n = 1; break
			case 233: n = 2; break
			case 34: n = 3; break
			case 39: n = 4; break
			case 40: n = 5; break
			case 45: n = 6; break
			case 232: n = 7; break
			case 95: n = 8; break
			case 231: n = 9; break
			case 224: n = 10; break
			default: n = 0
		}
		if(n != 0){ echo(s = shortcuts[n]); c(s); setTimeout(function(){ el('bar').value = '' }, 0) }
	}
}

function str_replace(str1, str2, text){
	var new_text = '', arr = text.split(str1)
	for(var i in arr) new_text += arr[i] + str2
	return new_text
}

function replacen(s){ return s.replace(/\n/g, '<br/>') }
function el(id){ return document.getElementById(id) }
function elh(ele){ el(ele).style.display='none'; resize() }
function els(ele){ el(ele).style.display='block'; resize() }
function elhh(ele){ el(ele).style.display = (el(ele).style.display=='none') ? 'block' : 'none'; resize() }

function box_append(html){
	speed_check = new Date().getTime()
	el('console').innerHTML += html; resize()
	setTimeout(function(){
		speed = new Date().getTime() - speed_check
		if(usual_speed > 0 && speed > (2*usual_speed)){
			el('console').innerHTML = el('console').innerHTML.substring(Math.round(el('console').innerHTML.length/3))
			if((i = el('console').innerHTML.indexOf("<font color=green>Sorties :</font>")) > 0)
				el('console').innerHTML = el('console').innerHTML.substring(i)
			resize()
		} else {
			sc_a.push(speed)
			if(sc_a.length == 22) usual_speed = sc_a.sort(function(x, y){return x-y})[16]
		}
	}, 0)
}

function clear_cs(){ el('console').innerHTML = ''}

function div_setHtml(div, html){
	el(div).innerHTML = html
}

function bg_set(bg){
	document.body.style.backgroundImage = 'url("ico/bg/'+bg+'")'
}

function box_clear(){
	el('console').innerHTML = ''
}

function tw_down(){
	holding_tw = true
	tw_dx = mouseX - parseInt(el('team_w').style.left)
	tw_dy = mouseY - parseInt(el('team_w').style.top)
}

function tw_up(){
	holding_tw = false
}

function nreplace(s){ return s.replace(/\n/g, ';') }
function pray_replace(s){ return s.replace(/\n/g, '<br>') }
function quit(){ document.location.href = 'index.php' }

function team_append(id, name){
	team.push([id, name])
	if(team.length == 1) el('team_w_content').innerHTML = ''
	el('team_w_content').innerHTML += '<table style="margin-top:'+(team.length == 1 ? 0 : 8)+'px" id="team_a'+id+'" cellpadding=0 cellspacing=0><tr><td width=250 bgcolor=orange><span class=centernumber><font color=white>'+name+'</font></span><img style=width:100px;height:16px id="v'+id+'" src=design/stats/life.png></td></tr></table>'
	team_show()
}

function team_remove(id){
	for(i in team) if(team[i][0] == id){ rgn[id] = undefined; team.splice(i, 1)}
	del_el('team_a'+id)
	if(team.length == 0) team_clear()
}

function team_update(teamID, HP, HPM, MP, MPM, HPA, MPA){
	rgn[teamID] = {
		'HP':HP, 'HPM':HPM, 'HPA':HPA, 'MP':MP, 'MPM':MPM, 'MPA':MPA,
		'active':true, 'start':new Date().getTime()
	}
}

function team_clear(){
	el('team_w_content').innerHTML = 'Pas d\'équipe. <a href="javascript:p(\'aide team\')">Former une équipe</a>'
	team.splice(0, team.length)
}

function team_hide(){
	el('team_w').style.display='none'; holding_tw = false; el('bar').focus()
}

function team_show(){
	el('team_w').style.display = 'block'
}

function enemy_show(name, hp, maxhp){
	clearTimeout(adv_hide_timeout)
	if(el('adv_name').innerHTML != name) el('adv_name').innerHTML=name
	el('adv').style.visibility='visible'
	el('adv_v').style.width=Math.round(231*hp/maxhp)+'px'
	el('adv1').style.backgroundColor='white'
	el('adv2').style.backgroundColor='orange'
	adv_hide_timeout = setTimeout(function(){hide_adv()}, 2200)
}

function hide_adv(){
	el('adv1').style.backgroundColor=el('adv2').style.backgroundColor=''
	el('adv').style.visibility='hidden'
}

function shortcuts_show(id, img, cmd){
	if(!id) el('shortcuts').innerHTML=''
	shortcuts[id+1] = cmd
	el('shortcuts').innerHTML += '<img height=20 onclick="javascript:p(\'!shortcut edit '+id+'\')\" src="ico/shortcuts/'+img+'.png" title="'+cmd+' ('+(id+1)+')">'
}

function top_clear(){ top_show(true, ''); el('bar').focus() }
function top_show(is1, s){ el('main'+(is1?'':2)).innerHTML = s}
function top_append(is1, s){ el('main'+(is1?'':2)).innerHTML += s}

function stats_clear(){
	rgn[0]['active'] = false
	el('left_hp_arrows').innerHTML=''
	el('right_hp_arrows').innerHTML=''
	el('left_mp_arrows').innerHTML=''
	el('right_mp_arrows').innerHTML=''
	el('v0').style.width = 250+'px'
	el('hp0').innerHTML = 'vie'
	el('m0').style.width = 250+'px'
	el('mp0').innerHTML = 'magie'
}

function regen(){
	now = new Date().getTime()
	for(i in rgn){
		r = rgn[i]
		if(!r['active']) continue; var HP, HPM, MP, MPM
		HP = r['HP']+(now-r['start'])*r['HPA']*r['HPM']/100000
		MP = r['MP']+(now-r['start'])*r['MPA']*r['MPM']/100000
		if(HP>(HPM=r['HPM'])) HP=HPM; if(HP<0) HP=0
		if(MP>(MPM=r['MPM'])) MP=MPM; if(MP<0) MP=0
		el('v'+i).style.width=Math.round(HP/HPM*250)+'px'
		if(i == 0){
			el('hp'+i).innerHTML=Math.round(HP)
			el('m'+i).style.width=Math.round(MP/MPM*250)+'px'
			el('mp'+i).innerHTML=Math.round(MP)
		}
	}
	setTimeout(regen, 150)
}

function stats_show(HP, HPM, MP, MPM, HPA, MPA){
	var i, s = ''
	el('left_hp_arrows').innerHTML=''
	el('left_mp_arrows').innerHTML=''
	el('right_hp_arrows').innerHTML=''
	el('right_mp_arrows').innerHTML=''
	if(HPA < 0){
		for(i=0; i > HPA; i--) s+= '&lsaquo;'
		el('left_hp_arrows').innerHTML = s
	} else if(HPA > 0){
		for(i=0; i < HPA; i++) s+= '&rsaquo;'
		el('right_hp_arrows').innerHTML = s
	}
	s = ''
	if(MPA < 0){
		for(i=0; i > MPA; i--) s+= '&lsaquo;'
		el('left_mp_arrows').innerHTML = s
	} else if(MPA > 0){
		for(i=0; i < MPA; i++) s+= '&rsaquo;'
		el('right_mp_arrows').innerHTML = s
	}
	rgn[0] = {
		'HP':HP, 'HPM':HPM, 'HPA':HPA, 'MP':MP, 'MPM':MPM, 'MPA':MPA,
		'active':true, 'start':new Date().getTime()
	}
}

function list_show(name, acts){
	lists[name] = new list(name)
	lists[name].acts = acts.split(';')
	lists[name].build()
}

function list_append(name, id, item){ lists[name].add(id, item)}

function list_display(name){ lists[name].display()}

var list = function(name){
	this.name = name
	this.items = []
	this.acts = []
	this.last = 0
	this.actions = ''
	this.div = 'list_'+this.name
}

list.prototype = {
	translate: {moveup: 'permuter vers le haut', movedown: 'permuter vers le bas', edit: 'modifier', olc_edit: 'modifier'},

	build: function(){
		this.actions = '<table class=compact><tr>'
		for(i in this.acts){
			a = this.acts[i].split(',')[0]
			this.actions += '<td><a href="javascript:lists[\''+this.name+'\'].act(\''+this.acts[i]+'\')" title="'+this.translate[a]+'"><img class=list-ico src="ico/actions/'+a+'.png"></a></td>'
		}
		this.actions += '</tr></table>'
		this.display()
	},
	
	display: function(){
		s = '<table class=list>'
		for(id in this.items){
			s += '<tr><td onmouseover="lists.'+this.name+'.on('+id+')" onmouseout="lists.'+this.name+'.off()"><table><tr><td onclick="lists[\''+this.name+'\'].act(\''+this.acts[0]+'\')\">'+this.items[id]+'</td><th id=act_'+this.name+id+'>'+this.actions+'</th></tr></table></td></tr>'
		}
		el(this.div).innerHTML = s+'</table>'
	},
	
	del: function(id){ if(!this.items[id]) return ; delete this.items[id] ; this.display() },
	add: function(id, item){ this.items[id] = item },
	on: function(id){ el('act_'+this.name+id).style.visibility = 'visible'; this.last = id },
	off: function(){ el('act_'+this.name+this.last).style.visibility = 'hidden' },
	
	act: function(a){
		switch(a.split(',')[0]){
			case 'moveup': p('!shortcut moveup '+(this.last - 1)) ; break
			case 'movedown': p('!shortcut movedown '+(this.last - 1)) ; break
			case 'edit': p('!shortcut edit '+(this.last - 1)) ; break
			case 'olc_edit': p('edit '+this.name+' '+this.last); break
		}
	}
}

