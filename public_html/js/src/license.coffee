# ライセンス画面の準備
window.license = ->
  # 大枠を作る
  do partsReset = ->
    $('#contents').html '<div id="licenseList" class="license-list"></div>'
    $('#pageNav').slideUp 'fast'

  licenseListMake = (wrapper,kind) ->
    defineTitles = t 'license.' + kind + '.def.titles'
    defineDescriptions = t 'license.' + kind + '.def.descriptions'
    defineList = new String()
    for i in [0...defineTitles.length]
      defineList += "<dt>#{defineTitles[i]}</dt><dd>#{defineDescriptions[i]}</dd>"
    wrapper.append "
    <h3>#{t 'license.' + kind + '.title'}</h3>
    <p>#{t 'license.' + kind + '.text'}</p>
    <dl>
      #{defineList}
    </dl>"

  do licenseInsert = ->
    wrapper = $('#licenseList')
    licenseListMake wrapper, 'data'
    licenseListMake wrapper, 'library'
