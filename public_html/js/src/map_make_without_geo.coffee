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
        console.log data
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

        locality = perseLocality data.results[0].address_components
        $('#contents').append "<div id='searchResult' class='search-result'>#{
          locality}</div>"

        removeSearchResult = ->
          $('#searchResult').animate { opacity: 'hide',}, { duration: 350, easing: 'swing', }
          removeWrapper = ->
            $('#searchResult').remove()
          setTimeout removeWrapper, 350

        setTimeout removeSearchResult, 3000

      else if data.status == 'ZERO_RESULTS'
        $('#locationNameInput').blur()
        alert t 'error.zeroResults'
      else
        $('#locationNameInput').blur()
        alert t 'error.unknown'

    .error ->
      $('#locationNameInput').blur()
      alert t 'error.traffic'

  $('#search').on 'click' , ->
    searchCurrentPosition()

  $('#locationSearchForm').submit ->
    searchCurrentPosition()

  perseLocality = (data) ->
    result = ''
    for cell in data
      result = cell.long_name + result if cell.types.indexOf('locality') >= 0 ||
                                          cell.types.indexOf('sublocality_level_1') >= 0 ||
                                          cell.types.indexOf('administrative_area_level_1') >= 0 ||
                                          cell.types.indexOf('establishment') >= 0
    result
