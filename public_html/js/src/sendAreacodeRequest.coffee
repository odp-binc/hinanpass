window.sendAreacodeRequest = (cityNames) ->
  url = t 'sparql.url.areacode'
  queryParts = t 'sparql.query.areacode'

  requestCityNames = new Array()
  for cityName in cityNames
    requestCityNames.push cityName if requestCityNames.indexOf(cityName) < 0

  
  results = new Array()
  endRequestNumber = 0

  for cityName in requestCityNames
    query = queryParts[0] + cityName + queryParts[1]
    $.jsonp {
      url: url,
      callbackParameter: 'callback',
      cache: false,
      data: 
        output: 'json',
        app_name: 'hinankun',
        query: query
      ,
      success: (json, httpStatus) ->
        results.push json.results.bindings[0].areacode.value
        endRequestNumber++
      ,
      error: (xOptions, textStatus) ->
        # 要修正
        console.log textStatus
    }

  do returnFunc = ->
    if endRequestNumber >= requestCityNames.length
      sendFacilitiesRequest results
    else
      setTimeout returnFunc , 50

