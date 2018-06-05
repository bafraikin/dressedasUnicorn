// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



a = document.createElement('button')
$(a).click(function() {
  center = mymap.getCenter;
  $.ajax({url: "/", type: 'POST', data: 'lati=' + center.lat + "&long=" + center.lat   , dataType: 'JSON', body: 'rendu', complete: ( function(data) {
    let local = data.responseJSON.rendu
    let place = new L.latLng(local.latitude, local.longitude );
    let myIcon = new L.icon({ iconUrl: "<%= asset_path("douge.png") %>" , iconSize: [45, 50] });
    let marker = new L.Marker(place, {icon: myIcon, autoPan: true});
    marker.addTo(mymap);
  })
  });})


