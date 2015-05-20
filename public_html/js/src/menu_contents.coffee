# メニューのコンテンツ
window.menuContents = (contents_name) ->
  # 大枠を作る
  do partsReset = ->
    $('#backButton').html '< ' + t('navbar.back')
    $('#backButton').off 'click'
    $('#backButton').on 'click' , ->
      location.hash = prev.pop()
    $('#contents').removeClass 'map'
    $('#contents').html '<div id="menuContentsWrapper" class="menu-contents-wrapper"></div>'

  # 内容の挿入
  do Insert = ->
    wrapper = $ '#menuContentsWrapper'
    switch contents_name
      when 'description', 'caution'
        wrapper.append "
          <h3>#{t contents_name + '.title'}</h3>
          #{t contents_name + '.contents'}"
        break
      when 'area'
        listContents = t 'area.list'
        lists = new String()
        for i in [0...listContents.length]
          lists += "<li>#{listContents[i]}</li>"
        wrapper.append "
        <h3>#{t 'area.title'}</h3>
        <p>#{t 'area.description'}</p>
        <ul>
          #{lists}
        </ul>"
        break
      else
        buttonList()
