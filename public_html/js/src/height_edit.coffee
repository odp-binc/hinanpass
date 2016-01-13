# 高さ調節
window.heightEdit = ->
  defaultHeight = 15
  maxHeight = 50
  paramater = 'sealevel'
  switch location.hash.match(/[a-zA-Z]+/)[0]
    when 'flood', 'inundation'
      defaultHeight = 5
      maxHeight = 30
      paramater = 'height'
  # FIXME: initializeに処理を書きすぎて頭でっかち…コード量少ないからマシにしてもこれは…
  initialize = ->
    $('#contents').append '<div id="heightEdit" class="height-edit"></div>'
    $('#heightEdit').append '<div id="heightEditInput" class="height-input"></div>'
    $('#heightEdit').append '<div id="heightEditClose" class="close-button"></div>'
    heightVisibility()
    $('#heightEdit').append '
      <div id="heightEditSlider" class="slider">
        <form>
          <input type="range" min="0" max="' + maxHeight + '" value="' + defaultHeight + '">
        </form>
      </div>'

    $('input[type="range"]').bind 'touchmove' , ->
      heightVisibility this.value
      descriptionVisibility this.value
    $('input[type="range"]').bind 'mousemove' , ->
      heightVisibility this.value
      descriptionVisibility this.value

    $('input[type="range"]').bind 'touchend' , ->
      userAgentString = navigator.userAgent.toLowerCase()
      # FIXME: Androidの地図、ピンがキャッシュとして残っちゃうのを防ぐ
      if userAgentString.indexOf('android') >= 0
        map.setZoom 15
        map.setZoom 16

    $('#heightEditClose').on 'click' , ->
      $('#heightEdit').toggleClass 'closed'

  # 高さによって見せる避難所ピンを判定
  heightVisibility = (requestHeight = defaultHeight) ->
    for mark in marker
      if paramater == 'height'
        if mark.information.height >= requestHeight
          mark.marker.icon.url = 'images/facilityMarker.png'
          mark.marker.setVisible true
        else
          mark.marker.icon.url = 'images/facilityMarker-unsuggest.png'
          mark.marker.setVisible true
      else
        if mark.information.sealevel >= requestHeight
          mark.marker.icon.url = 'images/facilityMarker.png'
          mark.marker.setVisible true
        else
          mark.marker.icon.url = 'images/facilityMarker-unsuggest.png'
          mark.marker.setVisible true

    $('#heightEditInput').html t(paramater + 'Description') + " <span>#{requestHeight}m</span>"


  # 高さによって避難所詳細の吹き出しを消す
  descriptionVisibility = (requestHeight = defaultHeight) ->
    if requestHeight >= window.selectedFacilityHeight || !(window.selectedFacilityHeight)
      # 高さが超えたら吹き出しを消す
      window.currentInfoWindow.close() if currentInfoWindow


  initialize()
