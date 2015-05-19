# 地図画面の準備
window.makeMapView = ->
  window.geolocationGetableFlag = true
  # 大枠を作る
  do partsReset = ->
    $('#contents').addClass 'map'
    $('#pageNav').slideUp 'fast'
    $('#contents').html '
      <div id="mapCanvas" class="map-camvas" style="width:100%; height:100%"></div>'
    $('#backButton').html '< ' + t('navbar.back')
    $('#backButton').off 'click'
    $('#backButton').on 'click' , ->
      location.hash = '' if location.hash.match(/[a-zA-Z]+/)[0] == 'all'
      location.hash = location.hash.match(/[a-zA-Z]+/)[0]

  # 地図を作る・初期化
  do mapMake = ->
    if !(window.currentPositionGotFlag)
      navigator.geolocation.getCurrentPosition (position) ->
          window.currentPositionGotFlag = true
          window.currentLatitude = position.coords.latitude
          window.currentLongitude = position.coords.longitude

          latitude = window.currentLatitude
          longitude = window.currentLongitude

          mapOptions =
            center: new google.maps.LatLng latitude, longitude
            zoom: 16
            mapTypeId: google.maps.MapTypeId.ROADMAP
          window.map = new google.maps.Map document.getElementById("mapCanvas"),mapOptions

          sendFacilitiesRequest latitude, longitude

        , ->
          mapMakeWithoutGeo()
        ,
          maximumAge: 0
    else
      latitude = window.currentLatitude
      longitude = window.currentLongitude
      mapOptions =
        center: new google.maps.LatLng(latitude, longitude),
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      window.map = new google.maps.Map(document.getElementById("mapCanvas"),mapOptions)
      sendFacilitiesRequest latitude, longitude
