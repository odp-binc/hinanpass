# ルート案内表示
window.checkFacilityInformation = (facility) ->

  $('#contents').append '<div id="informationWrapper" class="information-wrapper"></div>'
  $('#informationWrapper').html '<div id="informationBox" class="information-box"></div>'

  box = $ '#informationBox'

  box.append "<h3>#{facility.name}</h3>"
  box.append "<span class='category'>#{facility.category}</span>" if facility.category
  box.append "<div class='address'>#{facility.address}</div>" if facility.address
  box.append "<div id='target' class='target'></div>"
  $('#target').append "<span class='target-sentence'>#{t 'information.target'}
                       #{facility.target}</span>" if facility.target
  $('#target').append "<small class='target-note'>(#{facility.note})</span>" if facility.note
  box.append "<div class='capacity'>#{t 'information.capacity'}
              #{facility.capacity}</div>" if facility.capacity
  box.append "<div class='description'>#{facility.description}</div>" if facility.description
  box.append "<div id='sealevel' class='sealevel'></div>"
  $('#sealevel').append "<span class='sealevel-sealevel'>#{t 'information.sealevel'}
                         #{facility.sealevel}m</span>" if facility.sealevel
  $('#sealevel').append " / <small class='sealevel-height'>#{t 'information.height'}
                         #{facility.height}m</span>" if facility.height
  box.append "<div class='telephone'>TEL : #{facility.telephone}</div>" if facility.telephone
  box.append "<div id='disasters' class='disasters'></div>"

  if location.hash.match(/[a-zA-Z]+/)[0] == 'all'
    $('#disasters').append "<div class='disasters-title'
                            >#{t 'information.disasters'}</div>"

    targetDisasters = new Array()
    if facility.earthquake == 'true'
      targetDisasters.push t('disaster.earthquake')
    if facility.flood == 'true'
      targetDisasters.push t('disaster.flood')
    if facility.hightide == 'true'
      targetDisasters.push t('disaster.hightide')
    if facility.tsunami == 'true'
      targetDisasters.push t('disaster.tsunami')
    if facility.inundation == 'true'
      targetDisasters.push t('disaster.inundation')
    if facility.eruption == 'true'
      targetDisasters.push t('disaster.eruption')
    if facility.fire == 'true'
      targetDisasters.push t('disaster.fire')
    if facility.landslide == 'true'
      targetDisasters.push t('disaster.landslide')
    targetDisasters.push t 'information.unknown' if targetDisasters.length == 0

    for disaster in targetDisasters
      $('#disasters').append "<span>#{disaster}</span>"

  box.append "<div class='close-guidance'>#{t 'information.howToClose'}</div>"

  $('#informationWrapper').on 'click' , ->
    $('#informationWrapper').animate { opacity: 'hide',}, { duration: 350, easing: 'swing', }
    removeWrapper = ->
      $('#informationWrapper').remove()
    setTimeout removeWrapper, 350

