# トップページ、ボタンが並んでいる画面の表示
window.facilitiesSet = (facilities) ->

  disasterName = location.hash.match(/[a-zA-Z]+/)[0]
  window.directionsDisplay = new google.maps.DirectionsRenderer()
  directionsDisplay.setOptions(
    suppressMarkers: true
    draggable: true
  )

  # ピンを立てる
  setPins = ->
    data = new Array()
    console.table facilities
    for facility in facilities
      marker = new google.maps.Marker
        position: new google.maps.LatLng facility.lat - 0 , facility.long - 0
        map: map
      addDescription facility , marker

  # ピンタップ時の説明の吹き出しを作る
  addDescription = (facility , marker) ->
    content = ''

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
    content += "<div class='navigate-button #{disasterName}' onClick='navigate(#{facility.lat},#{facility.long});'>ここへ</div>"

    google.maps.event.addListener marker, 'click', (event) ->
      new google.maps.InfoWindow(
        content: content
      ).open marker.getMap(), marker

  # 現在地の監視
  currentPosition = ->
    window.currentMarker = null
    watch = navigator.geolocation.watchPosition (position) ->
      console.log position.coords.latitude, position.coords.longitude
      window.currentMarker.setMap(null) if currentMarker
      window.currentMarker = new google.maps.Marker
        position: new google.maps.LatLng position.coords.latitude, position.coords.longitude
        map: map
        icon: new google.maps.MarkerImage 'images/currentMarker.png', new google.maps.Size(22,22), new google.maps.Point(0,0), new google.maps.Point(11,11)


  # 関数が呼び出された時に実行するメソッド
  setPins()
  currentPosition()