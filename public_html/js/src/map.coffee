# 地図画面の準備
window.makeMapView = ->
  window.geolocationGetableFlag = true;
  # 大枠を作る
  do partsReset = ->
    $('#contents').addClass 'map'
    $('#contents').html '<div id="map_canvas" style="width:100%; height:100%"></div>'
  
  # 地図を作る・初期化
  do mapMake = ->
    navigator.geolocation.getCurrentPosition (position) ->

        latitude = position.coords.latitude
        longitude = position.coords.longitude

        mapOptions = 
          center: new google.maps.LatLng(latitude, longitude),
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        window.map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions)

        sendFacilitiesRequest latitude, longitude

      , ->
        mapMakeWithoutGeo()
      ,
        maximumAge: 0


  mapMakeWithoutGeo = ->
    window.geolocationGetableFlag = false
    $('#map_canvas').append '<div id="error" class="error"></div>'
    $('#error').append t 'error.geolocation'
    $('#error').append '<form>
        <input type="text" id="locationNameInput">
        <div id="search">Go</div>
      </form>'

    $('#search').on 'click' , ->
      locationName = $('#locationNameInput').val()
      url = 'http://maps.googleapis.com/maps/api/geocode/json?address=' +
             locationName + '&sensor=true'

      $.getJSON url,null
      .success (data) ->
        if data.status == 'OK'
          $('#map_canvas').html ''
          retrievedLat = data.results[0].geometry.location.lat
          retrievedLong = data.results[0].geometry.location.lng

          mapOptions = 
            center: new google.maps.LatLng(retrievedLat,retrievedLong),
            zoom: 15,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          window.map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions)

          window.currentMarker = new google.maps.Marker
            position: new google.maps.LatLng retrievedLat,retrievedLong
            map: map
            icon: new google.maps.MarkerImage 'images/currentMarker.png',
                  new google.maps.Size(68,68),
                  new google.maps.Point(0,0), 
                  new google.maps.Point(11,11), 
                  new google.maps.Size(22,22)

          debugger

          sendFacilitiesRequest retrievedLat,retrievedLong

        else if data.status == 'ZERO_RESULTS'
          alert t 'error.zeroResults'
        else
          alert t 'error.unknown'

      .error ->
        alert t 'error.traffic'


