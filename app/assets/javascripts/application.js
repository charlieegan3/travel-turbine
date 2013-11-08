// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.

//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprocket-sdirectives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker


//".newpage" is a class for any button that links to a different view (which sometimes takes a while to load on slow Heroku)
/*
$(document).ready(function() {

	// Hide warning/alert backgrounds if they're not actually being displayed
	if ($(".alert").is(':empty')) {
		$(".alert").css("background", "none");
	}
	else {
		$(".alert").css("background", "red");
	}
	// Again for notices
	if ($(".notice").is(':empty')) {
		$(".notice").css("background", "none");
	}
	else {
		$(".notice").css("background", "yellow");
	}	

	// Loading message for buttons (NOT USED atm)
	$(".newpage_btn").click(function() {
			$("body").replaceWith("<h1>LOADING...</h1>");
	})

})
*/

function getURLParameter(name) {
    return decodeURI(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
    );
}
