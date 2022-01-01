
function openTab(evt, tabName){
	//declare variables
	var i, tabcontent, tablinks;
	
	tabcontent = document.getElementsByClassName("tabcontent");
	
	//hide all tabs
	for(i = 0; i < tabcontent.length; i++){
		tabcontent[i].style.display = "none";
	}
	
	//remove class " active"
	tablinks = document.getElementsByClassName("tablinks");
	
	for(i = 0; i < tablinks.length; i++){
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	
	document.getElementById(tabName).style.display = "block";
	evt.currentTarget.className += " active";
}