# メニュー画面作成
window.menu = ->
  # 大枠を作る
  do partsReset = ->
    $('#backButton').html '< ' + t('navbar.back')
    $('#backButton').off 'click'
    $('#backButton').on 'click' , ->
      location.hash = prev.pop()
    $('#contents').removeClass 'map'
    $('#contents').html '<div id="menuWrapper" class="menu-wrapper"></div>'

  do licenseListMake =  ->
    wrapper = $ '#menuWrapper'
    listContents = t 'menu.list.contents'
    listIdNames = t 'menu.list.idNames'
    lists = new String()
    for i in [0...listContents.length]
      lists += "<li id='#{listIdNames[i]}'>#{listContents[i]}</li>"
    wrapper.append "
    <ul>
      #{lists}
    </ul>"
    for i in [0...listIdNames.length]
      $('#' + listIdNames[i]).on 'click' , ->
        prev.push location.hash
        location.hash = this.id
