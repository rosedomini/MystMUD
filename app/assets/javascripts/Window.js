var windows= {}, mouseX= 0, mouseY= 0

var isIE= document.all? 1: 0

function mousemove(e){
 e= e || window.event
 mouseX= e.clientX
 mouseY= e.clientY
	for(i in windows)
		if(windows[i].held)
   windows[i].move(
    mouseX- windows[i].mouse_dx,
    mouseY- windows[i].mouse_dy)}

function mousedown(){
	for(name in windows)
		if(windows[name].over)
			windows[name].hold()}

function mouseup(){
	for(name in windows)
			windows[name].held= false}

if(!isIE) document.addEventListener('mousemove', mousemove, true)
// document.addEventListener('mousedown', mousedown, true)
// document.addEventListener('mouseup', mouseup, true)

function Window(name, title, div, content, show, x, y){
 if(typeof windows[name] != 'undefined')
  windows[name].del()
	windows[name]= this
	this.name= name
	this.title= title
	this.id= 'w_'+ name
	this.div= div
	this.title_id= this.id+ '_title'
	this.over= false
	this.held= false
	this.centered= false
	el('windows').innerHTML+=
'<table id="'+this.id+'" class=window>\
	<tr class=window>\
		<td class="w_title" \
				onmouseover="windows[\''+this.name+'\'].over=true" \
				onmouseout="windows[\''+this.name+'\'].over=false">\
			<span id="'+this.title_id+'">'+this.title+'</span>\
		</td><td class=w_hide>\
			<img src="design/close.gif" onclick="windows[\''+this.name+'\'].hide()" />\
		</td>\
	</tr><tr>\
		<td colspan=2 class="w_body">\
			<div id="'+this.id+'_content" class=frame>'+content+'</div>\
		</td>\
	</tr>\
</table>'
	el(this.id).style.zIndex= Object.keys(windows).length
 this.move(x, y)
	if(show) this.show()}

Window.prototype= {
	center: function(){
		if(this.centered && this.held == false)
			this.move(
				Math.round((document.documentElement.clientWidth-
					el(this.id).clientWidth)/ 2),
				Math.round((document.documentElement.clientHeight-
					el(this.id).clientHeight)/ 2))
	},

	del: function(){
		this.show() // important
		delete windows[name]
		del_el(this.id)},

	edit: function(html){
		el(this.id+ '_content').innerHTML= html},

	hide: function(){
		el(this.id).style.display= 'none'
  focus()},

	hold: function(){
		this.held= true
		this.mouse_dx= mouseX- parseInt(el(this.id).offsetLeft)
		this.mouse_dy= mouseY- parseInt(el(this.id).offsetTop)
		/*this.show()*/},

	move: function(x, y){
		if(x < 0) el(this.id).style.right= -x-1+'px'
  else el(this.id).style.left= x+'px'
		if(y < 0) el(this.id).style.bottom= -y-1+'px'
  else el(this.id).style.top= y+'px'},

	resize: function(x, y){
  if(x != 'auto') x= x+ 'px'
  if(y != 'auto') y= y+ 'px'
  el(this.div).style.width= x
  el(this.div).style.height= y
  this.center()},
	
	set_title: function(title){
		el(this.title_el).value= title},
 
 focus: function(){
  for(name in windows)
   if(parseInt(el('w_'+name).style.zIndex) == Object.keys(windows).length)
    el('w_'+name).style.zIndex = parseInt(el(this.id).style.zIndex)
		el(this.id).style.zIndex= Object.keys(windows).length
 },

	show: function(){
		el(this.id).style.display= 'block'
		this.focus()
		resize()}}