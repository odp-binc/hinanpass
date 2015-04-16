# トップページ、ボタンが並んでいる画面の表示
window.guidance = (disasterClassName = 'button-earthquake') ->

  # 大枠を作る
  partsReset = ->
    $('#contents').html '<div id="description" class="guidance-description"></div>'
    $('#contents').append '<div id="guideWrapper" class="guide-wrapper"></div>'
    window.desasterName = disasterClassName.match(/[a-z]+/g)[1]

  # div#desctiptionにボタンを追加
  descriptionCreate = ->
    $('#description').append '<div id="nextButton" class="button-next ' + disasterClassName + '">' + t('guidance.goToNext') + '</div>'
    $('#nextButton').on 'click' , ->
      console.log 'clicked'

  # 避難方法を表示する
  guideInsert = ->
    $('#guideWrapper').append t 'guidance.' + desasterName
    $('#guideWrapper').append '<a href="' + t('guidance.' + desasterName + 'Link') + '" class="link-to-detail link-' + desasterName + '" target="_blank">' + t('guidance.linkToDetail') + '</a>'

  # 関数が呼び出された時に実行するメソッド
  partsReset()
  descriptionCreate()
  guideInsert()