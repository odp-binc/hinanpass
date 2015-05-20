# ライセンス画面の準備
window.aboutThisApp = ->
  # 大枠を作る
  do partsReset = ->
    $('#backButton').html '< ' + t('navbar.back')
    $('#backButton').off 'click'
    $('#backButton').on 'click' , ->
      location.hash = prev.pop()
    $('#contents').removeClass 'map'
    $('#contents').html '<div id="aboutWrapper" class="about-wrapper"></div>'
    $('#pageNav').slideUp 'fast'

  do aboutListMake =  ->
    wrapper = $ '#aboutWrapper'
    listContents = t 'about.list.contents'
    listIdNames = t 'about.list.idNames'
    listHrefs = t 'about.list.hrefs'
    lists = new String()
    for i in [0...listContents.length]
      lists += "<li id='#{listIdNames[i]}'>#{listContents[i]}</li>"
    wrapper.append "
    <h3>#{t 'about.title'}</h3>
    <img src='#{t 'about.imagePath'}' alt=''>
    <ul>
      #{lists}
    </ul>"
    for i in [0...listIdNames.length]
      $('#' + listIdNames[i]).on 'click' , ->
        prev.push location.hash
        switch this.id
          when 'terms', 'privacy'
            location.href = listHrefs[this.id]
          else
            location.hash = this.id
