# 地図画面の準備
window.makeMapView = ->
  # 大枠を作る
  partsReset = ->
    $('#contents').addClass 'map'
    $('#contents').html '<div id="map_canvas" style="width:100%; height:100%"></div>'
  
  # 地図を作る・初期化
  mapMake = ->
    navigator.geolocation.getCurrentPosition (position) ->

        latitude = position.coords.latitude
        longitude = position.coords.longitude

        mapOptions = 
          center: new google.maps.LatLng(latitude, longitude),
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        window.map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions)
        getCityNames latitude, longitude

      , ->
        alert t 'error.geolocation'
      ,
        maximumAge: 0
    

  # 関数が呼び出された時に実行するメソッド
  partsReset()
  mapMake()

