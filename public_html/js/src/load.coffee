# 戻るボタンの戻る先
window.prev = new Array()

# 災害の名前が入る変数
window.disasterName = ''

# ロードされた時に呼ばれるメソッドを指定
window.onload = ->
  navbarReset()
  pageChange()
  # ugly code: getCurrentPositionは現在地が変わらないと動いてくれないからとりあえず
  window.currentPositionGotFlag = false;

