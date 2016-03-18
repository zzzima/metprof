function initialize() {     
    var myLatlng = new google.maps.LatLng(56.613997, 47.865264);
    var myOptions = {
            zoom: 15,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions); 

    var contentString = "<div id='content'><b>МетАллекс</b><br>г. Йошкар-Ола, ул. Строителей, д.94</div>";
    
    var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h6 id="firstHeading" class="firstHeading">МетАллекс</h6>'+
      '<div id="bodyContent">'+
      '<p>Металлоизделия на заказ по типовым и индивидуальным проектам</p>'+      
      '<p><strong>г. Йошкар-Ола, ул. Строителей, д.94</strong></p>'+
      '</div>'+
      '</div>';    
    
    var infowindow = new google.maps.InfoWindow({
            content: contentString
    });

    var widgetDiv = document.getElementById('save-widget');
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(widgetDiv);    
    

    // Append a Save Control to the existing save-widget div.
    var saveWidget = new google.maps.SaveWidget(widgetDiv, {
      place: {
        // ChIJN1t_tDeuEmsRUsoyG83frY4 is the place Id for Google Sydney.
        placeId: 'ChIJN1t_tDeuEmsRUsoyG83frY4',
        location: {lat: 56.613997, lng: 47.865264}
      },
      attribution: {
        source: 'Google Maps JavaScript API',
        webUrl: 'https://developers.google.com/maps/'
      }
    });
    
    var marker = new google.maps.Marker({
            //position: myLatlng,
            position: saveWidget.getPlace().location,
            map: map,
            title: 'МетАллекс, металлоизделия'
    });
    google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker);
    });      
    
    
}


function initMap() {
  var map = new google.maps.Map(document.getElementById('map_canvas'), {
    zoom: 15,
    center: {lat: 56.613997, lng: 47.865264},
    mapTypeControlOptions: {
      mapTypeIds: [
        google.maps.MapTypeId.ROADMAP,
        google.maps.MapTypeId.SATELLITE
      ],
      position: google.maps.ControlPosition.BOTTOM_LEFT
    }
  });

    //var contentString = "<div id='content'><b>МетАллекс</b><br>г. Йошкар-Ола, ул. Строителей, д.94</div>";

    var contentString = '<div id="content">'+
      '<h6 id="firstHeading">МетАллекс</h6>'+
      '<div id="bodyContent">'+
      '<p><strong>г. Йошкар-Ола, ул. Строителей, д.94</strong></p>'+
      '</div>'+
      '</div>';    

    var infowindow = new google.maps.InfoWindow({
            content: contentString
    });
    
      var widgetDiv = document.getElementById('save-widget');
      map.controls[google.maps.ControlPosition.TOP_LEFT].push(widgetDiv);

      // Append a Save Control to the existing save-widget div.
      var saveWidget = new google.maps.SaveWidget(widgetDiv, {
        place: {
          // ChIJN1t_tDeuEmsRUsoyG83frY4 is the place Id for Google Sydney.
          placeId: 'ChIJN1t_tDeuEmsRUsoyG83frY4',
          location: {lat: 56.613997, lng: 47.865264}
        },
        attribution: {
          source: 'Google Maps JavaScript API',
          webUrl: 'https://developers.google.com/maps/'
        }
      });

  var marker = new google.maps.Marker({
    map: map,
    position: saveWidget.getPlace().location,
    title: 'МетАллекс, металлоизделия'
  });
  
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
    });   
}

$(function(){
    
    //initialize();
    initMap();
    
});
