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
//= require activestorage


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
let favorite;             // ajoute la boutique au favoris




favorite = (idplace, userId) => {
  $.ajax({
    url : '/place/favplaces',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    type : 'POST',
    datatype: 'JSON',
    data : 'id=' + idplace + '&iduser=' + userId 
  });
} 

// recupere les id des tags validé
let getId = () => {
  let a = $("div.control-group").children();
  let tab = new Array;
  let count = 0;
  for( b of a ) {
    if ($(b)[0].control.checked == true)  { 
      tab.push($(b).children().attr('id'));
    }
  }
  return (tab);
}

// Affichage de la fenêtre d'ajout d'une boutique
let toggleModal = function() {
  var x = document.getElementById("modal-add-shop");
  if (x.style.display === "none") {
    $(x).slideToggle(400);        
  } else {
    $(x).slideToggle(400);  
  }
}

/* Ouverture de la sidebar */
function openNav() {
  if ($(window).width() < 960) {
    document.getElementById("mySidenav").style.width = "110%";
    document.getElementById("mySidenav").style.marginTop = "0px";
 }
 else {
  document.getElementById("mySidenav").style.width = "30%";
 }
  
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

// Affichage du menu User, qui se cache si on ouvre le menu settings
let toggleUserMenu = () => {
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

let getLocationApp = (position) => {
  localisable = true;
  userLoc = new Array;
  userLoc.push(parseFloat(position.coords.latitude));
  userLoc.push(parseFloat(position.coords.longitude));
}

let errorHandla = () => {
  alert("pas de geolocalisation, le site ne fonctionnera pas optimalement");
}

$(document).ready(function() {
  if(navigator.geolocation) {
    localisable = true;
    navigator.geolocation.getCurrentPosition(getLocationApp, errorHandla);
  }
});


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

var $htmlOrBody = $('html, body'); // scrollTop works on <body> for some browsers, <html> for others
  scrollTopPadding = 8;

$('textarea').on('focus', function() {
  document.body.scrollTop = $(this).offset().top;
});
$('text-field').on('focus', function() {
  document.body.scrollTop = $(this).offset().top;
});

// Gestion des tabs page administrateurs
function openPage(pageName,elmnt,color,font,border,bg_color) {
  var i, tabcontent, tablinks, accordion;
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
  accordion = document.getElementsByClassName("accordion"); // Par défaut
  for (i = 0; i < accordion.length; i++) {
    accordion[i].style.backgroundColor = bg_color;
    accordion[i].style.color = "white";
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
     beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
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
  }, 500);
});

$(document).ready(function(){
  setTimeout(function(){
    $('#alert_wrapper').fadeOut("Slow",function(){
      $(this).remove();
    })
  }, 500);
});
