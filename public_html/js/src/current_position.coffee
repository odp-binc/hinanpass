# 現在地の監視
window.currentPosition = ->
  if window.geolocationGetableFlag
    if window.currentMarker
      window.currentMarker.setMap(map)
    else
      window.currentMarker = null
    watch = navigator.geolocation.watchPosition (position) ->
      # getCurrentPositionの位置情報不変時対策
      window.currentLatitude = position.coords.latitude
      window.currentLongitude = position.coords.longitude

      window.currentMarker.setMap(null) if window.currentMarker
      window.currentMarker = new google.maps.Marker
        position: new google.maps.LatLng position.coords.latitude, position.coords.longitude
        map: map
        zIndex: 2
        icon: new google.maps.MarkerImage 'images/currentMarker.png',
              new google.maps.Size(123,154),
              new google.maps.Point(0,0),
              new google.maps.Point(30,62),
              new google.maps.Size(62,77)

  # ここにこの処理を書くのは不適切な気がする(現在地へ戻るボタン)
  $('#contents').append "
    <div id='currentBack' class='current-back'>#{t 'currentBack.button'}</div>"
  $('#currentBack').on 'click' , ->
    # 現在地ボタンを押したら吹き出しを消す
    window.currentInfoWindow.close() if currentInfoWindow
    if window.map && window.currentMarker
      alert t('currentBack.ungetableGeoAlert') if !geolocationGetableFlag
      window.map.setCenter new google.maps.LatLng currentLatitude, currentLongitude

      if window.currentDestination
        navigate currentDestination.lat, currentDestination.long
