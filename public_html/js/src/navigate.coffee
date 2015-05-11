# ルート案内表示
window.navigate = (target_lat,target_long) ->


  do currentPosition = ->
    window.currentMarker = null
    watch = navigator.geolocation.watchPosition (position) ->
      window.currentMarker.setMap(null) if currentMarker
      window.currentMarker = new google.maps.Marker
        position: new google.maps.LatLng position.coords.latitude,
                                         position.coords.longitude
        map: map
        icon: new google.maps.MarkerImage 'images/currentMarker.png',
              new google.maps.Size(68,68),
              new google.maps.Point(0,0), 
              new google.maps.Point(11,11), 
              new google.maps.Size(22,22)

  do tryNavigate = ->
    if currentMarker.position.A
      current_lat = currentMarker.position.A
      current_long = currentMarker.position.F

      target_lat = target_lat - 0
      target_long = target_long - 0

      directionsDisplay.setMap null

      request = 
        origin: new google.maps.LatLng current_lat, current_long
        destination: new google.maps.LatLng target_lat, target_long
        travelMode: google.maps.TravelMode.WALKING 

      directionsService = new google.maps.DirectionsService()
      directionsDisplay.setMap map
      directionsService.route request, (result,status) ->
        directionsDisplay.setDirections result if status == google.maps.DirectionsStatus.OK
    else
      setTimeout tryNavigate , 100
