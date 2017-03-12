// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap 


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
		a[i].addEventListener('click',currentLink(),false);
 	} else if (window.attachEvent){

 	}
}

window.onload =addListeners();