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
            center: new google.maps.LatLng(latitude, longitude)
            zoom: 16
            mapTypeId: google.maps.MapTypeId.ROADMAP
          window.map = new google.maps.Map(document.getElementById("mapCanvas"),mapOptions)

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


  mapMakeWithoutGeo = ->
    window.geolocationGetableFlag = false
    $('#mapCanvas').append '<div id="error" class="error"></div>'
    $('#error').append t 'error.geolocation'
    $('#error').append '<form id="locationSearchForm">
        <input type="text" id="locationNameInput">
        <div id="search"><img src="images/search-button.png" alt="search"></div>
      </form>'

    searchCurrentPosition = ->
      locationName = $('#locationNameInput').val()
      url = 'http://maps.googleapis.com/maps/api/geocode/json?address=' +
             locationName + '&sensor=true'

      $.getJSON url,null
      .success (data) ->
        if data.status == 'OK'
          $('#mapCanvas').html ''
          retrievedLat = data.results[0].geometry.location.lat
          retrievedLong = data.results[0].geometry.location.lng

          mapOptions = 
            center: new google.maps.LatLng(retrievedLat,retrievedLong),
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          window.map = new google.maps.Map(document.getElementById("mapCanvas"),mapOptions)

          window.currentMarker = new google.maps.Marker
            position: new google.maps.LatLng retrievedLat,retrievedLong
            map: map
            icon: new google.maps.MarkerImage 'images/currentMarker.png', 
                  new google.maps.Size(90,120),
                  new google.maps.Point(0,0), 
                  new google.maps.Point(23,53),
                  new google.maps.Size(45,60)

          sendFacilitiesRequest retrievedLat,retrievedLong

        else if data.status == 'ZERO_RESULTS'
          alert t 'error.zeroResults'
        else
          alert t 'error.unknown'

      .error ->
        alert t 'error.traffic'

    $('#search').on 'click' , -> 
      searchCurrentPosition()

    $('#locationSearchForm').submit -> 
      searchCurrentPosition()


