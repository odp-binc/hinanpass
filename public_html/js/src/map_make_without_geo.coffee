window.mapMakeWithoutGeo = ->
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

          window.currentLatitude = retrievedLat
          window.currentLongitude = retrievedLong

          mapOptions = 
            center: new google.maps.LatLng(retrievedLat,retrievedLong),
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          window.map = new google.maps.Map(document.getElementById("mapCanvas"),mapOptions)

          window.currentMarker = new google.maps.Marker
            position: new google.maps.LatLng retrievedLat,retrievedLong
            map: map
            icon: new google.maps.MarkerImage 'images/currentMarker.png', 
                  new google.maps.Size(123,154), 
                  new google.maps.Point(0,0), 
                  new google.maps.Point(30,62), 
                  new google.maps.Size(62,77)
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