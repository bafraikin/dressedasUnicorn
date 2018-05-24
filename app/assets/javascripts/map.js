//= require jquery


var map;
function myMap() {
  var mapProp= {
    center:new google.maps.LatLng(51.508742,-0.120850),
    zoom:5,
  };

  map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
}

let verif = function() {

  let index = 0;
  let length = $('#input')[0].childNodes.length - 1
  let bool = true;
  while (index < length ) {
    if ( $('#input')[0].childNodes[index].childNodes[0].value == "" )
      bool = false;
    index++;
  }

  if (bool)
    return (1);
  else {
    alert('Il manque un/des parametres pour ajouter le marqueur');
    return (0);
  }
}


let index = 0;
let ids = ['latitude', 'longitude', 'message', 'bouton'];
let type = ['input', 'input', 'input' , 'button'];

a = document.createElement('div');
$(a).addClass("Map")
  .appendTo($('body'))

b = document.createElement('ul');
$(b).addClass("Map")
  .attr('id', 'input')
  .appendTo($(a))

c = document.createElement('div')
$(c).appendTo($(a))
  .attr('id', 'googleMap')
  .height('400px')
  .width('100%')
  .position('relative')

while (index < ids.length)
{
  a = document.createElement('li');
  $(a).appendTo($(b));

  c = document.createElement(type[index])
  $(c).appendTo($(a))
    .attr('id', ids[index])

  if (type[index] === 'input' )
    $(c)[0].placeholder = ids[index];

  index++;
}

$('#bouton:eq(0)')[0].innerHTML = "Ajout marqueur";
$('#bouton:eq(0)').click(function() {
  if (verif()) {
    let latitude = $('#input')[0].childNodes[0].childNodes[0].value;
    let longitude = $('#input')[0].childNodes[1].childNodes[0].value;
    var place = new google.maps.LatLng(latitude, longitude);
    var marker = new google.maps.Marker({position: place});
    var infowindow = new google.maps.InfoWindow({
      content: longitude = $('#input')[0].childNodes[2].childNodes[0].value });
    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map,marker);
    }); 
    marker.setMap(map);
  }
});
