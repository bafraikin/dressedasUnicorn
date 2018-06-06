// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require leaflet/dist/leaflet.js

function toggleModal() {
    var x = document.getElementById("modal-add-shop");
    if (x.style.display === "none") {
        $(x).show(700);        
    } else {
      $(x).hide(700);  
    }
}
function toggleUserMenu() {
    var z = document.getElementById("menu-user");
    var y = document.getElementById("settings-user");
    if (z.style.display === "none") {
        $(z).slideToggle(400);   
            if(y.style.display != "none") {
                $(y).slideToggle(400);       
            }    
    } else {
      $(z).slideToggle(400);  
    }
}
function toggleSettingsMenu() {
    var z = document.getElementById("menu-user");
    var y = document.getElementById("settings-user");
    if (y.style.display === "none") {
        $(y).slideToggle(400);   
            if(z.style.display != "none") {
                $(z).slideToggle(400);       
            }    
    } else {
      $(y).slideToggle(400);  
    }
}


