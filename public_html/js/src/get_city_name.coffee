# 周辺の市の名前を取得
window.getCityNames = (latitude, longitude) ->
  # 何キロ程度までの範囲の避難所を取得するか
  distanceThreshold = 3

  latdelta = distanceThreshold * 360 / 40076.5
  lngdelta = distanceThreshold * 360 / 40008.6 / Math.cos(latitude * Math.PI / 180)
  localities = new Array()

  $.getJSON 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + latitude + ',' + longitude + '&sensor=true' , (data) ->
    localities.push perseLocality data.results[0].address_components

  $.getJSON 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + (latitude + latdelta) + ',' + longitude + '&sensor=true' , (data) ->
    localities.push perseLocality data.results[0].address_components

  $.getJSON 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + (latitude - latdelta) + ',' + longitude + '&sensor=true' , (data) ->
    localities.push perseLocality data.results[0].address_components

  $.getJSON 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + latitude + ',' + (longitude + lngdelta) + '&sensor=true' , (data) ->
    localities.push perseLocality data.results[0].address_components

  $.getJSON 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + latitude + ',' + (longitude - lngdelta) + '&sensor=true' , (data) ->
    localities.push perseLocality data.results[0].address_components

  areacodes = new Array()

  do tryGetAreaCodes = ->
    if localities.length >= 5
      sendAreacodeRequest localities
    else
      setTimeout tryGetAreaCodes,50

  # 地名データの市町村名へのパース
  perseLocality = (data) -> 
    result = ''
    for cell in data
      result = cell.long_name + result if  cell.types.indexOf('locality') >= 0
    result