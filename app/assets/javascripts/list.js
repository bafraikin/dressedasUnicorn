// Favoriser une boutique
let tamer = (idplace, userId) => {
  $.ajax({
    url : '/place/favplaces',
    type : 'POST',
    datatype: 'JSON',
    data : 'id=' + idplace + '&iduser=' + userId 
  });
}; 
    // Changement de couleur de l'icone
$('i#fav').click(function() {
  if ($(this).css("color") == "rgb(128, 128, 128)") {
    $(this).css("color", 'red');
  }
  else {
    $(this).css("color", 'grey');
  }
});

// Ajouter un tag
$('input#tag').click(function() {
  });

let tagit
  