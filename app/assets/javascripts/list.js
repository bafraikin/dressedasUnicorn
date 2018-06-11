// Favoriser une boutique
$('i#fav').click(function() {
    if (!favcolor) {
        $(this).css("color", 'rgba(103,8,135,1)');
        favcolor = true;
        // call ajax fav a entrer BDD
    }
    else {
        $(this).css("color", 'grey');
        favcolor = false;
        // call ajax sup de la BDD
    }
});