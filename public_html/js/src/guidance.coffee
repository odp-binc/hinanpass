# トップページ、ボタンが並んでいる画面の表示
window.guidance = ->

  disasterName = location.hash.match(/[a-zA-Z]+/)[0]

  # 大枠を作る
  partsReset = ->
    $('#contents').html '<div id="description" class="guidance-description"></div>'
    $('#contents').append '<div id="guideWrapper" class="guide-wrapper"></div>'
    $('#contents').removeClass 'map'
  # div#desctiptionにボタンを追加
  descriptionCreate = ->
    disasterClassName = 'button-' + disasterName 
    $('#description').append '<div id="nextButton" class="button-next ' + disasterClassName + '">' + t('guidance.goToNext') + '</div>'
    $('#nextButton').on 'click' , ->
      prev.push location.hash
      location.hash = disasterName + '-map'

  # 避難方法を表示する
  guideInsert = ->
    $('#guideWrapper').append t 'guidance.' + disasterName
    $('#guideWrapper').append '<a href="' + t('guidance.' + disasterName + 'Link') + '" class="link-to-detail link-' + disasterName + '" target="_blank">' + t('guidance.linkToDetail') + '</a>'

  # 関数が呼び出された時に実行するメソッド
  partsReset()
  descriptionCreate()
  guideInsert()