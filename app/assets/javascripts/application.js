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
//


//declaration de certaine variable ici pour que la carte se recharge quand on clique sur l'onglet carte.
let callDeux;             // fonction de l'ajout definitif d'une addresse par addresse   
let callUn;               // fonction de la 1ere phase d'ajout par addresse
let userLoc = new Array;  // localité de l'utilisateur
let localisable = false;  // geocalisation de l'utilisateur
let markerTmp;            // sert de jonction entre callUn et callDeux pour le marqueur draggable  
let mymap;                // la map
let timestamp;            // tableau qui accueille tout les lieux chargé par l'user
let masuperfonction;      // fonction qui charge les lieux renseignés
let getLocation;          // fonction récuperer la localisation de l'utilisateur 
let errorHandler;         // fonction n'a pas pu recuperer la localisation de l'utilisateur
let favcolor;             // boolean pour changement couleur fav boutique

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

var $htmlOrBody = $('html, body'), // scrollTop works on <body> for some browsers, <html> for others
    scrollTopPadding = 8;

    $('textarea').on('focus', function() {
        document.body.scrollTop = $(this).offset().top;
    });
    $('text-field').on('focus', function() {
        document.body.scrollTop = $(this).offset().top;
    });

// Gestion des tabs page administrateurs
function openPage(pageName,elmnt,color,font,border) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink"); // Par défaut
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
        tablinks[i].style.color = "";
        tablinks[i].style.border = "none";
    }
    document.getElementById(pageName).style.display = "block"; // Actif
    elmnt.style.backgroundColor = color;
    elmnt.style.color = font;
        elmnt.style.borderBottom = border;

}


// Fonction pour changer le rôle d'un USER vers Admin et inverse
let admin = function(id){
   $.ajax({
            type    : "POST",
            url     : "/pages/AdminRole", 
            dataType: 'script',
            data    : 'id=' + id  
           
    });
    location.reload();

       
};
/* FADE OUT DES ALERTES ET NOTICES */
$(document).ready(function(){
    setTimeout(function(){
        $('#notice_wrapper').fadeOut("Slow",function(){
            $(this).remove();
        })
    }, 3500);
    
    });
    
    $(document).ready(function(){
        setTimeout(function(){
            $('#alert_wrapper').fadeOut("Slow",function(){
                $(this).remove();
            })
        }, 3500);
        
        });
        



