window.heightEdit = ->
  initialize = ->
    defaultHeight = 5
    window.currentHeight = defaultHeight
    $('#contents').append '<div id="heightEdit" class="height-edit"></div>'
    $('#heightEdit').append '<div id="heightEditInput">テストテキスト</div>'
    heightVisibility()
    $('#heightEdit').append '<div id="heightEditPlusButton">▲</div>'
    $('#heightEdit').append '<div id="heightEditMinusButton">▼</div>'
    $('#heightEditPlusButton').on 'click' , -> heightVisibility 'high'
    $('#heightEditMinusButton').on 'click' , -> heightVisibility 'low'

  heightVisibility = (elevation = 'stay') ->
    if elevation == 'low' && currentHeight > 0
      currentHeight--
    else if elevation == 'high'
      currentHeight++

    for mark in marker
      if mark.height >= currentHeight
        mark.marker.setVisible true
      else
        mark.marker.setVisible false

    $('#heightEditInput').text t('heightDescription') + " #{currentHeight}m"



  initialize()