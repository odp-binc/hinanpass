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
  # FIXME: 現在地非取得時のsubmit失敗対策
  reg = new RegExp(/\?/)
  window.location.search = '' if !reg.test window.location.href
