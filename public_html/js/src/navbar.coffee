# ナビゲーションバーに関する設定を行う
window.navbarReset = ->
  # メニューバー、メニューのトグル
  $('#navButton').on 'click', ->
    $('#pageNav').slideToggle 'fast'

  # メニューバーの文字の挿入
  $('#navButton').html '<img src="images/setting.png" alt="setting">'
  $('.navbar h1').html t 'navbar.title'
  $('.navbar h1').on 'click', ->
    location.hash = ''
  
  # メニュー項目の追加
  $('nav#pageNav ul').html "
    <li id='aboutThisApp'>#{t 'navbar.nav.aboutThisApp'}</li>
  "

  $('li#aboutThisApp').on 'click', ->
    prev.push location.hash
    location.hash = 'about'
    $('#backButton').html '< ' + t('navbar.back')
    $('#backButton').off 'click'
    $('#backButton').on 'click' , ->
      location.hash = prev.pop()


