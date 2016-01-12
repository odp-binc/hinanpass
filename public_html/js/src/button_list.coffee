# トップページ、ボタンが並んでいる画面の表示
window.buttonList = ->
  # 大枠を作る
  partsReset = ->
    $('#contents').html '<div id="description" class="top-description"></div>'
    $('#contents').append '<div id="buttonWrapper" class="button-wrapper"></div>'
    $('#backButton').html ''
    $('#backButton').off()
    $('#contents').removeClass 'map'
    location.hash = ''

  # ボタンの生成
  disasterButtonMaker = (appendElement,buttonClassName,buttonIdName) ->
    $(appendElement).append '<div id="' + buttonIdName +
                            '" class="button ' + buttonClassName +
                            '"><img src="images/' + buttonClassName +
                            '.png"><p>'+ t('buttonList.buttons.' + buttonIdName) +
                            '</p></div>'
    $('#' + buttonIdName).on 'click' , ->
      # Google Analyticsにて度の災害ボタンがよく押されているかわかるようにするためのコード
      ga('send', 'event', '災害ボタンタップ',
         t('disaster.' + buttonClassName.match(/[a-z]+/g)[1]))

      prev.push ''
      $('#backButton').html '< ' + t('navbar.back')
      # 基本的にはハッシュの値を参照してpage_change.coffeeみたいな感じでページ遷移を管理している
      $('#backButton').on 'click' , ->
        location.hash = prev.pop()
      location.hash = buttonClassName.match(/[a-z]+/g)[1]

  # div#desctiptionに説明を追加
  descriptionCreate = ->
    $('#description').append t('buttonList.description.sentenceBeforeButton') + '<br>'
    $('#description').append '<div class="button button-sample">' + t('buttonList.description.sampleButton') + '</div>'
    $('#description').append t 'buttonList.description.sentenceAfterButton'

  # 災害を選択するボタンを生成
  disasterButtonCreate = ->
    disasterButtonMaker '#buttonWrapper' , 'button-all' , 'allButton'
    disasterButtonMaker '#buttonWrapper' , 'button-earthquake' , 'earthquakeButton'
    disasterButtonMaker '#buttonWrapper' , 'button-flood' , 'floodButton'
    disasterButtonMaker '#buttonWrapper' , 'button-hightide' , 'hightideButton'
    disasterButtonMaker '#buttonWrapper' , 'button-tsunami' , 'tsunamiButton'
    disasterButtonMaker '#buttonWrapper' , 'button-inundation' , 'inundationButton'
    disasterButtonMaker '#buttonWrapper' , 'button-eruption' , 'eruptionButton'
    disasterButtonMaker '#buttonWrapper' , 'button-fire' , 'fireButton'
    # disasterButtonMaker '#buttonWrapper' , 'button-typhoon' , 'typhoonButton'
    disasterButtonMaker '#buttonWrapper' , 'button-landslide' , 'landslideButton'


  # 関数が呼び出された時に実行するメソッド
  partsReset()
  descriptionCreate()
  disasterButtonCreate()
