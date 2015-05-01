# ルート案内表示
window.navigate = (target_lat,target_long) ->

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
