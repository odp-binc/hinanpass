# トップページ、ボタンが並んでいる画面の表示
window.buttonList = ->
  # 大枠を作る
  partsReset = ->
    $('#contents').html '<div id="description" class="top-description"></div>'
    $('#contents').append '<div id="buttonWrapper"></div>'

  # ボタンの生成
  disasterButtonMaker = (appendElement,buttonClassName,buttonIdName) ->
    $(appendElement).append '<div id="' + buttonIdName + '" class="button ' + buttonClassName + '"><p>'+ t('buttonList.buttons.' + buttonIdName) + '</p></div>'
    $('#' + buttonIdName).on 'click' , ->
      window.prev = buttonList
      $('#backButton').text '< ' + t 'navbar.back'
      guidance(buttonClassName)

  # div#desctiptionに説明を追加
  descriptionCreate = ->
    $('#description').append t('buttonList.description.sentenceBeforeButton') + '<br>'
    $('#description').append '<div class="button button-sample">' + t('buttonList.description.sampleButton') + '</div>'
    $('#description').append t 'buttonList.description.sentenceAfterButton'

  # 災害を選択するボタンを生成
  disasterButtonCreate = ->
    disasterButtonMaker '#buttonWrapper' , 'button-earthquake' , 'earthquakeButton'
    disasterButtonMaker '#buttonWrapper' , 'button-flood' , 'floodButton'
    disasterButtonMaker '#buttonWrapper' , 'button-high-tide' , 'highTideButton'
    disasterButtonMaker '#buttonWrapper' , 'button-tsunami' , 'tsunamiButton'
    disasterButtonMaker '#buttonWrapper' , 'button-inundation' , 'inundationButton'
    disasterButtonMaker '#buttonWrapper' , 'button-eruption' , 'eruptionButton'
    disasterButtonMaker '#buttonWrapper' , 'button-fire' , 'fireButton'
    disasterButtonMaker '#buttonWrapper' , 'button-typhoon' , 'typhoonButton'
    disasterButtonMaker '#buttonWrapper' , 'button-others' , 'othersButton'


  # 関数が呼び出された時に実行するメソッド
  partsReset()
  descriptionCreate()
  disasterButtonCreate()