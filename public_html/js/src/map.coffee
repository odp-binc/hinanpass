# トップページ、ボタンが並んでいる画面の表示
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
      # TODO : 修正が必要
      alert '現在地の取得に失敗しました!'
    

  # 関数が呼び出された時に実行するメソッド
  partsReset()
  mapMake()

