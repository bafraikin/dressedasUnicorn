// Favoriser une boutique


let tamer = (idplace, userId) => {
  $.ajax({
    url : '/place/favplaces',
    type : 'POST',
    datatype: 'JSON',
    data : 'id=' + idplace + '&iduser=' + userId 
  });
}; 

$('i#fav').click(function() {
  if ($(this).css("color") == "rgb(128, 128, 128)") {
    $(this).css("color", 'red');
    // call ajax fav a entrer BDD
  }
  else {
    $(this).css("color", 'grey');
    // call ajax sup de la BDD
  }
});
