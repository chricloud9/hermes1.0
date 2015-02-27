function gmap_show(drop) {
  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}},
  if ((drop.latitude == null) || (drop.longitude == null) ) {    // validation check if coordinates are there
    return 0;
  }

  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([    // put marker method
      {
        "latitude": drop.latitude,    // coordinates from parameter drop
        "longitude": drop.longitude,
        "picture": {    // setup marker icon
          "url": 'http://www.clker.com/cliparts/m/I/n/1/T/P/orange-dot-md.png',
          "width":  32,
          "height": 32
        },
        "infowindow": "<b>" + drop.name + "</b> " + drop.address + ", " + drop.postal_code + " " + drop.city
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);    // set the default zoom of the map
  });
}

 var markerOnMap;

  function placeMarker(location) {    // simply method for put new marker on map
    if (markerOnMap) {
      markerOnMap.setPosition(location);
    }
    else {
      markerOnMap = new google.maps.Marker({
        position: location,
        map: handler.getMap()
      });
    }
  }

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
    placeMarker(event.latLng);
    document.getElementById("map_latitude").value = event.latLng.latitude();
    document.getElementById("map_longitude").value = event.latLng.longitude();
  });
}