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

// Affichage de la fenêtre d'ajout d'une boutique
let toggleModal = function() {
    var x = document.getElementById("modal-add-shop");
    if (x.style.display === "none") {
        $(x).slideToggle(400);        
    } else {
      $(x).slideToggle(400);  
    }
}
// Affichage du menu User, qui se cache si on ouvre le menu settings
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
// Affichage du menu Settings, qui se cache si on ouvre le menu User

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
// Bouton pour fermer toutes les modales
function closeModal() {
    var z = document.getElementById("menu-user");
    var y = document.getElementById("settings-user");
    var x = document.getElementById("modal-add-shop");

    if (z.style.display !== "none") {
        $(z).slideToggle(400);       
        }    
    else if (y.style.display !== "none") {
        $(y).slideToggle(400);       
        } 
        else if (x.style.display !== "none") {
        $(x).slideToggle(400);       
        }
}

