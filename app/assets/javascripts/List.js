var lists= {}

function List(name){
	this.name= name
	this.items= {}
	this.acts= {}
	this.last= 0
	this.actions= ''
	this.id= 'list_'+this.name}

List.prototype= {
	translate: {
		moveup: 'permuter vers le haut',
		movedown: 'permuter vers le bas',
		edit: 'modifier',
		olc_edit: 'modifier'},

	build: function(){
		this.actions= '<table class=compact><tr>'
		for(i in this.acts){
			a= this.acts[i].split(',')[0]
			this.actions+= '<td><a href="javascript:lists[\''+this.name+'\'].act(\''+
this.acts[i]+'\')" title="'+this.translate[a]+'"><img class=list-ico src="ico/a\
ctions/'+a+'.png"></a></td>'}
		this.actions+= '</tr></table>'
		this.display()},

	display: function(){
		s= '<table class=list>'
		for(id in this.items){
			s+= '<tr><td onmouseover="lists.'+this.name+'.on('+id+')" onmouseout="lis\
ts.'+this.name+'.off()"><table><tr><td onclick="lists[\''+this.name+'\'].act(\''
+this.acts[0]+'\')\">'+this.items[id]+'</td><th id=act_'+this.name+id+'>'+
this.actions+'</th></tr></table></td></tr>'}
		el(this.id).innerHTML= s+ '</table>'},

	del: function(id){
		if(!this.items[id]) return
		delete this.items[id]
		this.display()},

	add: function(id, item){
		this.items[id]= item},

	on: function(id){
		el('act_'+this.name+id).style.visibility= 'visible'
		this.last= id},

	off: function(){
		el('act_'+this.name+this.last).style.visibility= 'hidden'},
	
	act: function(a){
		switch(a.split(',')[0]){
			case 'moveup': p('!shortcut moveup '+(this.last - 1)); break
			case 'movedown': p('!shortcut movedown '+(this.last - 1)); break
			case 'edit': p('!shortcut edit '+(this.last - 1)); break
			case 'olc_edit': p('edit '+this.name+' '+this.last); break}}}