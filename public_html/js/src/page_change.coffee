window.pageChange = ->
  hash = location.hash
  if !hash
    buttonList()
  else
    if hash.match(/[a-zA-Z]+/g).length == 1
      switch hash.match(/[a-zA-Z]+/)[0]
        when 'earthquake','flood','hightide','tsunami','inundation','eruption','fire','typhoon','others'
          guidance()
          break
        else
          buttonList()
    else if hash.match(/[a-zA-Z]+/g).length == 2
      switch hash.match(/[a-zA-Z]+/)[0]
        when 'earthquake','flood','hightide','tsunami','inundation','eruption','fire','typhoon','others'
          navigate()
          break
        else
          buttonList()


$(window).hashchange ->
  pageChange()
