# ページ遷移
window.pageChange = ->
  hash = location.hash
  if !hash
    buttonList()
  else
    if hash.match(/[a-zA-Z]+/g).length == 1
      switch hash.match(/[a-zA-Z]+/)[0]
        when 'earthquake','flood','hightide','tsunami','inundation','eruption','fire','typhoon'
          guidance()
          break
        when 'others'
          makeMapView()
          break
        when 'license'
          license()
          break
        when 'about'
          aboutThisApp()
          break
        else
          buttonList()
    else if hash.match(/[a-zA-Z]+/g).length == 2
      switch hash.match(/[a-zA-Z]+/)[0]
        when 'earthquake','flood','hightide','tsunami','inundation','eruption','fire','typhoon','others'
          makeMapView()
          break
        else
          buttonList()


$(window).hashchange ->
  pageChange()
