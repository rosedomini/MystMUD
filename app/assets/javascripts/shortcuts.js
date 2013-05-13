var shortcuts= {}
// document.addEventListener('keydown', keydown, true)
// document.addEventListener('help', help, false)

function keydown(e){
 e= e || window.event
 var propagate= true
 var ele= e.target || e.srcElement
 if(ele.nodeType == 3) ele= ele.parentNode
 var code= e.keyCode || e.which
 var input= (ele.tagName == 'INPUT' || ele.tagName == 'TEXTAREA')
 if(code >= 112 && code <= 123){ // F1-12
  shortcut_call(code-112)
  propagate= false
 } else if(code == 32 && !input){ // space
  el('bar').select()
  propagate= false
 } else if(ele.id == 'bar'){ // up and down
  if(code == 38) backCmd()
  else if(code == 40) nextCmd()}
 if(!propagate){
  e.cancelBubble= true; e.returnValue= false
  if(e.stopPropagation)
   {e.stopPropagation(); e.preventDefault()}
  return false}}

function help(e){
 e= e || window.event
 e.cancelBubble= true
 e.returnValue= false
 if(e.stopPropagation){
  e.stopPropagation()
  e.preventDefault()}
 return false}

function backCmd(){
	typedCurrentId--
	if(typeof typed[typedCurrentId] == 'undefined')
		typedCurrentId++
	else {
		el('bar').value= typed[typedCurrentId]
  setTimeout(function(){
   el('bar').select()}, 0)}}

function nextCmd(){
	typedCurrentId++
	if(typeof typed[typedCurrentId] == 'undefined'){
		typedCurrentId= typed.length
		el('bar').value= ''}
	else {
		el('bar').value= typed[typedCurrentId]
  setTimeout(function(){
   el('bar').select()}, 0)}}

function shortcut_call(n){
 var s= shortcuts[n]; echo(s);	c(s)}