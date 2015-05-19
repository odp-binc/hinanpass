window.heightEdit = ->
  defaultHeight = 15
  initialize = ->
    $('#contents').append '<div id="heightEdit" class="height-edit"></div>'
    $('#heightEdit').append '<div id="heightEditInput" class="height-input"></div>'
    $('#heightEdit').append '<div id="heightEditClose" class="close-button"></div>'
    heightVisibility()
    $('#heightEdit').append '
    <div id="heightEditSlider" class="slider">
      <form>
        <input type="range" min="0" max="50" value="' + defaultHeight + '">
      </form>
    </div>'
    $('input[type="range"]').bind 'touchmove' , ->
      heightVisibility this.value
    $('input[type="range"]').bind 'mousemove' , ->
      heightVisibility this.value
    $('#heightEditClose').on 'click' , ->
      $('#heightEdit').toggleClass 'closed'


  heightVisibility = (requestHeight = defaultHeight) ->

    for mark in marker
      if mark.information.sealevel >= requestHeight
        mark.marker.setVisible true
      else
        mark.marker.setVisible false

    $('#heightEditInput').html t('heightDescription') + " <span>#{requestHeight}m</span>"



  initialize()