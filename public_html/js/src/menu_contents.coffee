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
        # for i in [0...listContents.length]
        #   lists += "<li>#{listContents[i]}</li>"
        # wrapper.append "
        # <h3>#{t 'area.title'}</h3>
        # <p>#{t 'area.description'}</p>
        # <ul>
        #   #{lists}
        # </ul>"
        # break
        url = t 'sparql.url.facilities'

        query = t 'sparql.query.publisher'

        $.jsonp {
          url: url,
          callbackParameter: 'callback',
          cache: false,
          data:
            output: 'json',
            app_name: 'hinankun',
            query: query
          ,
          success: (json, httpStatus) ->
            listContents = new Array()
            for i in [0...json.results.bindings.length]
              listContents[i] = json.results.bindings[i].publisher.value
            lists = new String()
            for i in [0...listContents.length]
              if listContents.indexOf(listContents[i]) >= i
                lists += "<li>#{listContents[i]}</li>"
            wrapper.append "
            <h3>#{t 'area.title'}</h3>
            <p>#{t 'area.description'}</p>
            <ul>
              #{lists}
            </ul>"
          error: (xOptions, textStatus) ->
            # PENDING
            alert t 'error.traffic'
        }
        break
      else
        buttonList()
