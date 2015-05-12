# 避難所のマーカをセットする
window.facilitiesSet = (facilities) ->

  disasterName = location.hash.match(/[a-zA-Z]+/)[0]
  window.directionsDisplay = new google.maps.DirectionsRenderer()
  directionsDisplay.setOptions(
    suppressMarkers: true
    draggable: true
  )
  window.marker = new Array()

  # ピンタップ時の説明の吹き出しを作る
  addDescription = (facility , marker) ->
    content = new String()

    if facility.name
      content += "<h4>#{facility.name}</h4>"
    if facility.category
      content += "<span class='category'>#{facility.category}</span><br>"
    if facility.address
      content += "<span class='address'>#{facility.address}</span><br>"
    if facility.target
      targetString = t('information.target') + facility.target
      noteString = ''
      noteString = '( ' + facility.note + ' )' if facility.note
      content += "<span class='target'>#{targetString} <span class='note'>#{noteString}</span></span><br>"
    if facility.capacity
      capacityString = t('information.capacity') + facility.capacity
      content += "<span class='capacity'>#{capacityString}</span> "
    if facility.landslide
      landSlideString = t('information.landslide.' + facility.landslide)
      content += "/ <span class='landslide'>#{landSlideString}</span><br>"
    if facility.description
      content += "#{facility.description}<br>"
    if facility.sealevel
      seaLevelString = t('information.sealevel') + facility.sealevel
      heightString = ''
      heightString = '( ' + t('information.height') + facility.height + 'm )' if facility.height
      content += "<span class='sealevel'>#{seaLevelString}m <span class='height'>#{heightString}</span></span><br>"
    if facility.telephone
      content += "<span class='telephone'>TEL : #{facility.telephone}</span>"
    content += "<div class='navigate-button #{disasterName}' onClick='navigate(#{facility.lat},#{facility.long});'>" + t('information.here') + "</div>"

    google.maps.event.addListener marker, 'click', (event) ->
      new google.maps.InfoWindow(
        content: content
        pixelOffset: new google.maps.Size -23,30
      ).open marker.getMap(), marker

  # ピンを立てる
  do setPins = ->
    data = new Array()
    switch disasterName
      when 'flood','hightide','tsunami','inundation','typhoon'
        heightEdit()
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
      marker[i].height = facilities[i].sealevel - 0
      addDescription facilities[i] , marker[i].marker



  # 現在地の監視
  do currentPosition = ->
    if window.geolocationGetableFlag
      window.currentMarker = null
      watch = navigator.geolocation.watchPosition (position) ->
        window.currentMarker.setMap(null) if currentMarker
        window.currentMarker = new google.maps.Marker
          position: new google.maps.LatLng position.coords.latitude, position.coords.longitude
          map: map
          zIndex: 2
          icon: new google.maps.MarkerImage 'images/currentMarker.png', 
                new google.maps.Size(123,154), 
                new google.maps.Point(0,0), 
                new google.maps.Point(30,62), 
                new google.maps.Size(62,77)