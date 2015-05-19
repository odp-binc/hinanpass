# 避難所・現在地のマーカをセットする
window.markerSet = (facilities) ->
  window.currentInfoWindow = null

  disasterName = location.hash.match(/[a-zA-Z]+/)[0]
  window.directionsDisplay = new google.maps.DirectionsRenderer()
  directionsDisplay.setOptions(
    suppressMarkers: true
    draggable: false
  )
  window.marker = new Array()

  # ここにこの処理を書くのは不適切な気がする(現在地へ戻るボタン)
  $('#contents').append "
    <div id='currentBack' class='current-back'>#{t 'currentBack.button'}</div>"
  $('#currentBack').on 'click' , ->
    # 現在地ボタンを押したら吹き出しを消す
    window.currentInfoWindow.close() if currentInfoWindow
    if window.map && window.currentMarker
      alert t('currentBack.ungetableGeoAlert') if !geolocationGetableFlag
      window.map.setCenter new google.maps.LatLng currentLatitude, currentLongitude

  # ピンタップ時の説明の吹き出しを作る
  addDescription = (facility , marker , markerNum) ->
    content = new String()

    if facility.name
      content += "<h4>#{facility.name}</h4>"
    if facility.sealevel
      seaLevelString = t('information.sealevel') + facility.sealevel
      heightString = ''
      heightString = '( ' + t('information.height') + facility.height + 'm )' if facility.height
      content += "<span class='sealevel'>#{seaLevelString}m <span class='height'
                  >#{heightString}</span></span><br>"
    if facility.telephone
      content += "<span class='telephone'>TEL : #{facility.telephone}</span>"
    content += "<div class='navigate-button #{disasterName}'
                onclick='navigate(#{facility.lat},#{facility.long});'>" +
                t('information.here') + "</div>" +
                "<div class='check-button #{disasterName}'
                onclick='checkFacilityInformation(marker[#{markerNum}].information)'>" +
                t('information.check') + "</div>"

    google.maps.event.addListener marker, 'click', (event) ->
      # 高さ調節の箱をしまう
      $('#heightEdit').addClass 'closed'
      # InfoWindowを閉じるのと常にひとつだけ表示するためのもの
      window.currentInfoWindow.close() if currentInfoWindow
      window.currentInfoWindow = new google.maps.InfoWindow(
        content: content
        pixelOffset: new google.maps.Size -23,30
      )
      window.currentInfoWindow.open marker.getMap(), marker

  # ピンを立てる
  do setPins = ->
    data = new Array()
    for i in [0...facilities.length]
      marker[i] = new Object()
      marker[i].marker = new google.maps.Marker
        position: new google.maps.LatLng facilities[i].lat - 0 , facilities[i].long - 0
        map: map
        icon: new google.maps.MarkerImage 'images/facilityMarker.png',
              new google.maps.Size(90,120),
              new google.maps.Point(0,0),
              new google.maps.Point(23,53),
              new google.maps.Size(45,60)
        zIndex: 1
      # PENDING : 詳細表示のために変数に避難所詳細情報を入れた
      marker[i].information = facilities[i]
      addDescription facilities[i] , marker[i].marker, i
    switch disasterName
      when 'flood','hightide','tsunami','inundation','typhoon'
        heightEdit()

  # 現在地の監視
  do currentPosition = ->
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
