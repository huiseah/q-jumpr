

  var map;
    var canvas;
    var infowindow;

    var offers = [];

    var styles = [{

        stylers: [{
            hue: '#666088'
        }, {
            weight: 1.8
        }]
    }, {
        elementType: "labels.icon",
        stylers: [{
            visibility: "on"
        }, {
            invert_lightness: true
        }, {
            color: "#ce454c"
        }]
    }, {
        elementType: "labels.text.fill",
        stylers: [{
            color: "#fa963d"
        }]
    }, {}];

  var initialize = function(lat, long, zoom) {


    var myLatlng = new google.maps.LatLng(-33.8736063,151.2236821); 

    var mapOptions = {
            center: new google.maps.LatLng(lat, long),
            zoom: zoom,
            styles: styles,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

      canvas = $('#map_canvas')[0];

        if (!canvas)
            return; // I QUIT

        map = new google.maps.Map(canvas, mapOptions);


    var image = '/images/coffee.png';
    var latlng = new google.maps.LatLng(lat, long);
    var marker = new google.maps.Marker({
            position: latlng,
            icon: image,
            map: map,
            title: name
          });

  };


  var add_marker = function (lat, long, name, address) {
        var image = '/images/coffee.png';
        var latlng = new google.maps.LatLng(lat, long);
        var marker = new google.maps.Marker({
            position: latlng,
            icon: image,
            map: map,
            title: name
          });

          contentString =
          "<div class='popup'>" +
          "<h4 class='titlename'>" + name + "</h4>"
          + "<p>" + address + "</p>" + "</div>";

        var infowindow = new google.maps.InfoWindow({
        content: contentString,
        maxWidth: 320//,
        //boxstyles: popup
         });

         google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map,marker);
          });

  };

$(document).ready(function () {
      initialize(-33.8649688, 151.2116847, 14);
});
