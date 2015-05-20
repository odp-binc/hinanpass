# ナビゲーションバーに関する設定を行う
window.navbarReset = ->
  # メニューバー、メニューの表示
  $('#navButton').on 'click', ->
    prev.push location.hash if location.hash != '#menu'
    location.hash = 'menu'
    $('#backButton').html '< ' + t('navbar.back')
    $('#backButton').off 'click'
    $('#backButton').on 'click' , ->
      location.hash = prev.pop()
  # メニューバーの文字の挿入
  $('#navButton').html '<img src="images/setting.png" alt="setting">'
  $('.navbar h1').html t 'navbar.title'
  $('.navbar h1').on 'click', ->
    location.hash = ''
