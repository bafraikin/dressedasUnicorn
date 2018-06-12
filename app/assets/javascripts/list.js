// Change the icon-heart color 
$('i#fav').click(function() {
    if (!favcolor) {
        $(this).css("color", 'rgba(103,8,135,1)');
        favcolor = true;
    }
    else {
        $(this).css("color", 'grey');
        favcolor = false;

    }
        
}); 
// Favorise a place
let tamer = function(idplace, userId) {
    console.log("coucou");
    $.ajax({
        url : '/place/favplaces',
        type : 'POST',
        datatype: 'JSON',
        data : 'id=' + idplace + '&iduser=' + userId 
    });
};