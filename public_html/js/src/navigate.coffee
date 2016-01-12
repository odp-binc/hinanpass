# ルート案内表示
window.navigate = (target_lat,target_long) ->

  # ナビを開始したら吹き出しを消す
  window.currentInfoWindow.close() if currentInfoWindow

  do tryNavigate = ->
    if window.currentMarker.position.lat()
      current_lat = currentMarker.position.lat()
      current_long = currentMarker.position.lng()

      target_lat = target_lat - 0
      target_long = target_long - 0

      # 過去のルート案内を消す
      # この変数の初期化はfacility.setで行っている(多分ugly code)
      directionsDisplay.setMap null

      window.currentDestination =
        lat: target_lat
        long: target_long

      request =
        origin: new google.maps.LatLng current_lat, current_long
        destination: new google.maps.LatLng target_lat, target_long
        travelMode: google.maps.TravelMode.WALKING

      directionsService = new google.maps.DirectionsService()
      directionsDisplay.setMap map
      directionsService.route request, (result,status) ->
        console.log status == google.maps.DirectionsStatus.OK
        directionsDisplay.setDirections result if status == google.maps.DirectionsStatus.OK
    else
      setTimeout tryNavigate , 100
