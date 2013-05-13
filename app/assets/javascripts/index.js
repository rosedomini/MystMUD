var margintop= 0, ss= '', buffer= '<br>', port= 6021, box_updated= false
var m= [], typed= [], typedCurrentId= 0, team= []
var regen_active= false, adv_hide_timeout, height

var rgn= {0: {'active': false}}

function focus(){
 el('bar').focus()}
function scroll(){
	document.body.scrollTop= 90000}

function resize(){
 height= document.documentElement.clientHeight
 for(name in windows)
  windows[name].center()
 focus()
 setTimeout(scroll, 0)}

function refresh(){
	resize()
 //setTimeout(refresh, 1000)
}

function del_el(n){
	if(el(n) != null)
		el(n).parentNode.removeChild(el(n))}

function cut(s){
 if(typeof s != 'undefined')
  while(s.lenght > 0 && s[0] == '!')
   s= s.substring(1, s.length)
	return s}

function c(s){
	p(cut(s))}

function p(s){
	swfobject.getObjectById('myst').write(s)}

function flash_alert(s){
	el('console').innerHTML+= '<i>Debug: '+s+'</i><br>'
	resize()}

function echo(s){
	s= cut(s)
	box_append('<font color=#676767># '+
		(s.length<30? s: cut(s).substring(0, 30)+'...')+'</font><br>')}

function puts(e){
	var s= '!'
	if(e.keyCode == 13){
		if(el('bar').value.length > 0) s= el('bar').value
		c(s); typedCurrentId= typed.length; echo(s)
		if(s != typed[typedCurrentId- 1] && s != '!'){
			typed[typedCurrentId]= s
			typedCurrentId++}
		el('bar').value= ''
		focus()}}

function str_replace(str1, str2, text){
	var new_text= '', arr= text.split(str1)
	for(var i in arr)
		new_text+= arr[i]+ str2
	return new_text}

function replacen(s){
	return s.replace(/\n/g, '<br/>')}

function el(id){
	return document.getElementById(id)}

function elh(id){
	el(id).style.display='none'
	resize()}

function els(id){
	el(id).style.display='block'
	resize()}

function elhh(id){
	el(id).style.display= (el(id).style.display=='none')? 'block': 'none'
	resize()}

function clear_cs(){
	el('console').innerHTML= ''}

function nreplace(s){
	return s.replace(/\n/g, ';')}

function pray_replace(s){
	return s.replace(/\n/g, '<br>')}

function quit(){
	document.location.href= '/'}

function hide_adv(){
	el('adv1').style.backgroundColor= el('adv2').style.backgroundColor= ''
	el('adv').style.visibility= 'hidden'}

function regen(){
	now = new Date().getTime()
	for(i in rgn){
		r= rgn[i]
		if(!r['active']) continue
		var HP, HPM, MP, MPM
		HP= r['HP']+ (now- r['start'])* r['HPA']* r['HPM']/ 100000
		MP= r['MP']+ (now- r['start'])* r['MPA']* r['MPM']/ 100000
		if(HP > (HPM= r['HPM'])) HP= HPM
		if(HP < 0) HP= 0
		if(MP > (MPM= r['MPM'])) MP= MPM
		if(MP < 0) MP= 0
		el('v'+ i).style.width= Math.round(HP/ HPM* 250)+ 'px'
		if(i == 0){
			el('hp'+ i).innerHTML= Math.round(HP)
			el('m'+ i).style.width= Math.round(MP/ MPM* 250)+ 'px'
			el('mp'+ i).innerHTML= Math.round(MP)}}
	setTimeout(regen, 150)}