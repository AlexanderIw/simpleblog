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
//= require bootstrap 
//= require turbolinks

var currentActiveHeaderLink = (function (){
	var url= document.URL.split("/"), i=0
		links= document.getElementsByClassName("header-link");

	function init(){
		if(window.addEventListener){
			links[i].addEventListener('click',currentLink(),false);
		}
	}

	function currentLink(){
		if(url[3]===""){url[3]= links[0].innerHTML.toLowerCase();}

		for(i=0; i<links.length; i++){
			if(url[3]===links[i].innerHTML.toLowerCase()){
				links[i].classList.add('current');
			}
			//console.log(url[3]+"==="+links[i].innerHTML);
		}
 	}

	init();
	
})();

var autoCloseSuccessAlertLink= (function(){
	function init(){
		setTimeout(function() {
				$(".alert-success").alert('close');
			}, 1500);
	}
	//init(); not sure if i want the behavior 
})();
