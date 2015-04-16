# トップページ、ボタンが並んでいる画面の表示
window.buttonList = ->
  # 大枠を作る
  partsReset = ->
    $('#contents').html '<div id="description" class="top-description"></div>'
    $('#contents').append '<div id="buttonWrapper"></div>'

  # ボタンの生成
  buttonMaker = (appendElement,buttonClassName,buttonIdName) ->
    $(appendElement).append '<div id="' + buttonIdName + '" class="button ' + buttonClassName + '"><p>'+ t('buttonList.buttons.' + buttonIdName) + '</p></div>'
    $('#' + buttonIdName).on 'click' , ->
      console.log 'clicked'

  # div#desctiptionにボタンを追加
  descriptionCreate = ->
    $('#description').append t('buttonList.description.sentenceBeforeButton') + '<br>'
    $('#description').append '<div class="button button-sample">' + t('buttonList.description.sampleButton') + '</div>'
    $('#description').append t 'buttonList.description.sentenceAfterButton'

  # 災害を選択するボタンを生成
  disasterButtonCreate = ->
    buttonMaker '#buttonWrapper' , 'button-earthquake' , 'earthquakeButton'
    buttonMaker '#buttonWrapper' , 'button-flood' , 'floodButton'
    buttonMaker '#buttonWrapper' , 'button-high-tide' , 'highTideButton'
    buttonMaker '#buttonWrapper' , 'button-tsunami' , 'tsunamiButton'
    buttonMaker '#buttonWrapper' , 'button-inundation' , 'inundationButton'
    buttonMaker '#buttonWrapper' , 'button-eruption' , 'eruptionButton'
    buttonMaker '#buttonWrapper' , 'button-fire' , 'fireButton'
    buttonMaker '#buttonWrapper' , 'button-typhoon' , 'typhoonButton'
    buttonMaker '#buttonWrapper' , 'button-others' , 'othersButton'


  # 関数が呼び出された時に実行するメソッド
  partsReset()
  descriptionCreate()
  disasterButtonCreate()