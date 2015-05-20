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
      window.selectedFacilityHeight = facility.sealevel
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

  currentPosition()
