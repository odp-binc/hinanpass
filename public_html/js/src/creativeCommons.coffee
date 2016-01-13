# ライセンス画面の準備
window.cc = ->
  # 大枠を作る
  do partsReset = ->
    $('#contents').removeClass 'map'
    $('#contents').html '<div id="ccList" class="cc-list"></div>'
    $('#pageNav').slideUp 'fast'

  do ccInsert = ->
    wrapper = $('#ccList')
    wrapper.html t 'cc'
