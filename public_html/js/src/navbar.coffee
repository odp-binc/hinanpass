# ナビゲーションバーに関する設定を行う
window.navbarReset = ->
  # メニューバー、メニューのトグル
  $('#navButton').on 'click', ->
    $('#pageNav').slideToggle 'fast'

  # メニューバーの文字の挿入
  $('#navButton').text t 'navbar.menu'
  $('.navbar h1').text t 'navbar.title'
  
  # メニュー項目の追加
  $('nav#pageNav ul').html "
    <li><a href='#{window.location.origin}'>#{t 'navbar.nav.top'}</a></li>
    <li><a href='#{window.location.origin}/\#license'>#{t 'navbar.nav.license'}</a></li>
  "
