# トップページ、ボタンが並んでいる画面の表示
window.navigate = (facilities) ->

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
      content += "<span class='telephone'>#{facility.telephone}</span>"

    google.maps.event.addListener marker, 'click', (event) ->
      new google.maps.InfoWindow(
        content: content
      ).open marker.getMap(), marker


  # 関数が呼び出された時に実行するメソッド
  setPins()
