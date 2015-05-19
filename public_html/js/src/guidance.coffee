# 避難方法の表示画面
window.guidance = ->

  disasterName = location.hash.match(/[a-zA-Z]+/)[0]

  # 大枠を作る
  partsReset = ->
    # ugly code : クラス名糞だなあ
    $('#contents').html '<div id="description" class="guidance-description"></div>'
    $('#contents').append '<div id="guideWrapper" class="guide-wrapper"></div>'
    $('#contents').append '<div id="bottomButtonWrapper"
                           class="guidance-description"></div>'
    $('#contents').removeClass 'map'
    $('#pageNav').slideUp 'fast'
    $('#backButton').html '< ' + t('navbar.back')
    $('#backButton').off 'click'
    $('#backButton').on 'click' , ->
      location.hash = prev.pop()
  # div#desctiptionにボタンを追加
  descriptionCreate = ->
    disasterClassName = 'button-' + disasterName
    $('#description').append '<div id="nextButtonTop" class="button-next ' +
                              disasterClassName + '">' + t('guidance.goToNext') +
                              '</div>'

    $('#nextButtonTop').on 'click' , ->
      location.hash = disasterName + '-map'


    $('#bottomButtonWrapper').append '<div id="nextButtonBottom" class="button-next ' +
                              disasterClassName + '">' + t('guidance.goToNext') +
                              '</div>'

    $('#nextButtonBottom').on 'click' , ->
      location.hash = disasterName + '-map'

  # 避難方法を表示する
  guideInsert = ->
    $('#guideWrapper').append t 'guidance.' + disasterName


  # 関数が呼び出された時に実行するメソッド
  partsReset()
  descriptionCreate()
  guideInsert()
