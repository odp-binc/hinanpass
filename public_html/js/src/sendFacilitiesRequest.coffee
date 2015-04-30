window.sendFacilitiesRequest = (areaCodes) ->
  url = t 'sparql.url.facilities'
  queryParts = t 'sparql.query.baseFacilities'
  disasterName = location.hash.match(/[a-zA-Z]+/)[0]

  results = new Array()
  endRequestNumber = 0


  for areaCode in areaCodes
    query = queryParts[0] + areaCode + queryParts[1] + t('sparql.query.kind.' + disasterName) + queryParts[2]
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
        results = results.concat dataParse json.results.bindings
        endRequestNumber++
      ,
      error: (xOptions, textStatus) ->
        # 要修正
        console.log textStatus
    }

  do returnFunc = ->
    if endRequestNumber >= areaCodes.length
      navigate results
    else
      setTimeout returnFunc , 50

  dataParse = (data) ->
    parsedData = new Array()
    for datum in data
      parsedDatum = 
        lat: datum.lat.value
        long: datum.long.value
      if datum.address
        parsedDatum.address = datum.address.value
      if datum.category
        parsedDatum.category = datum.category.value
      if datum.name
        parsedDatum.name = datum.name.value
      if datum.description
        parsedDatum.description = datum.description.value
      if datum.capacity
        parsedDatum.capacity = datum.capacity.value
      if datum.target
        parsedDatum.target = datum.target.value
      if datum.note
        parsedDatum.note = datum.note.value
      if datum.landslide
        parsedDatum.landslide = datum.landslide.value
      if datum.sealevel
        parsedDatum.sealevel = datum.sealevel.value
      if datum.height
        parsedDatum.height = datum.height.value
      if datum.telephone
        parsedDatum.telephone = datum.telephone.value
      parsedData.push parsedDatum

    return parsedData



