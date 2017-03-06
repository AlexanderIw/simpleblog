
function addListeners(){
	var url= document.URL, i=0;
	var a= document.getElementsByClassName("header-link");

	var currentLink= function(){
 		url= url.split("/");
		if(url[3]===""){url[3]= a[0].innerHTML.toLowerCase();}

		for(i=0; i<a.length; i++){
			if(url[3]===a[i].innerHTML.toLowerCase()){
				a[i].classList.add('current');
			}
		}

 	}

	if(window.addEventListener){
		a.addEventListener('click',currentLink(),false);
 	} else if (window.attachEvent){

 	}
}

window.onload =addListeners;