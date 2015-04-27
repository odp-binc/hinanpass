# トップページ、ボタンが並んでいる画面の表示
window.navigate = ->
  # 大枠を作る
  partsReset = ->
    $('#contents').addClass 'map'
    $('#contents').html '<div id="map_canvas" style="width:100%; height:100%"></div>'
  
  # 地図を作る・初期化
  mapMake = ->
    mapOptions = 
      center: new google.maps.LatLng(35.942604, 136.198037),
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions)
  

  # 関数が呼び出された時に実行するメソッド
  partsReset()
  mapMake()