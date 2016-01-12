# ページ遷移
window.pageChange = ->
  hash = location.hash

  window.scrollTo 0, 0

  if !hash || hash.match(/[a-zA-Z]+/g) == null
    buttonList()
  else
    if hash.match(/[a-zA-Z]+/g).length == 1
      switch hash.match(/[a-zA-Z]+/)[0]
        when 'earthquake','flood','hightide','tsunami','inundation','eruption','fire','typhoon','landslide'
          guidance()
          break
        when 'all'
          makeMapView()
          break
        when 'license'
          license()
          break
        when 'menu'
          menu()
          break
        when 'description', 'caution', 'area'
          menuContents(hash.match(/[a-zA-Z]+/)[0])
          break
        when 'about'
          aboutThisApp()
          break
        else
          buttonList()
    else if hash.match(/[a-zA-Z]+/g).length == 2
      switch hash.match(/[a-zA-Z]+/)[0]
        when 'earthquake','flood','hightide','tsunami','inundation','eruption','fire','typhoon','landslide'
          makeMapView()
          break
        else
          buttonList()
    else
      buttonList()


$(window).hashchange ->
  pageChange()
