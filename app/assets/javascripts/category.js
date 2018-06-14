//coucou nouveeau fichier js, toi et moi on va faire des trucs fantastics





$("#add").click(function () {
  if (localisable) {
    navigator.geolocation.getCurrentPosition(getLocation,errorHandler);
  }
  else {
    userLoc = [false,false];
  }
  $.ajax({ 
    url: "/sort_by_tag", data:"tags=" + getId() + "&user=" + userLoc, method: 'POST', datatype: 'JSON', complete: (function(rendu) {
      let place = rendu.responseJSON.data;
      
      let globalDiv = document.createElement("div");
      $(globalDiv).attr('id', 'liste');
      $(globalDiv).appendTo($('body'));
      for (let local of place) {
        let  miniDiv = document.createElement("div");
        $(miniDiv).attr('id', "list_show");
        $(miniDiv).appendTo($(globalDiv));

        if (local[3]) {
          let coeur =  document.createElement("i");
          $(coeur).click(function() {
            favorite(local.id, local[3]);
          });
          $(coeur).addClass("fa");
          $(coeur).addClass("fa-heart");
          $(coeur).attr("id", 'fav');
          $(coeur).appendTo($(miniDiv));
        }
        if (local[0].name) {
          let name =  document.createElement("h3");
          $(name).html(local[0].name);
          $(name).appendTo($(miniDiv));
          let ligne = document.createElement("hr");
          $(ligne).appendTo($(miniDiv));
        }
        if (local[2]) {
          let distance = document.createElement("div");
          $(distance).html(Number(local[2]) * 1000 + "metre");
          $(distance).attr("id", 'distance');
          $(distance).appendTo($(miniDiv)); 
        }
        let adresse = document.createElement("p");
        $(adresse).attr('id', 'addrreeesse');
        $(adresse).html($(local[0].address));
        $(adresse).appendTo($(miniDiv));
        let tagDiv  = document.createElement("div");
        $(tagDiv).appendTo($(miniDiv));
        for (let tag of local[1]) {
          let tagP = document.createElement("p");
          $(tagP).html(tag.name);
          $(tagP).appendTo($(tagDiv));
        }
      }
    }) 
  });
});
