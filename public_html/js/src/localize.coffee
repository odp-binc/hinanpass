x18n.register 'ja',
  navbar: 
    title: 'ヒナンくん',
    back: '戻る',
    menu: 'メニュー'
    nav:
      top: 'トップへ戻る'
      license: 'ライセンス情報'
  buttonList: 
    description: 
      sentenceBeforeButton: '対応する災害の',
      sampleButton: 'ボタン',
      sentenceAfterButton: 'をタッチ'
    buttons: 
      earthquakeButton: '地震',
      floodButton: '洪水',
      hightideButton: '高潮',
      tsunamiButton: '津波',
      inundationButton: '浸水',
      eruptionButton: '噴火',
      fireButton: '火事',
      typhoonButton: '風水<br>被害',
      othersButton: 'その<br>ほか'

  guidance: 
    goToNext: '次に進む',
    linkToDetail: '詳しくはこちら',
    earthquake: '
    <ul>
    <li><strong>火</strong>を消す</li>
    <li><strong>落下物</strong>や<strong>足元</strong>に注意</li>
    <li><strong>暖房器具</strong>を消す</li>
    <li><strong>ブレーカー</strong>を切る</li>
    <li>下敷きになったら大声で<strong>助けを呼ぶ</strong></li>
    <li>火災が起きたら<strong>消火器</strong>で初期消火を</li>
    <li>消化も下敷きも<strong>みんなで</strong>協力して救助</li>
    </ul>',
    flood: '
    <ul>
    <li>水深がひざ丈まである場合は<strong>無理に避難せず</strong>建物内の高所へ</li>
    <li>山などの<strong>斜面で異変</strong>があればすみやかに離れる</li>
    <li><strong>頭を守るもの</strong>をつける</li>
    <li>長靴ではなく<strong>いつもの靴</strong>を使う</li>
    <li><strong>複数人</strong>で避難する</li>
    <li>できるだけ<strong>明るい時間</strong>に避難を</li>
    <li><strong>頑丈な建物</strong>に避難するのも手段</li>
    </ul>',
    hightide: '
    <ul>
    <li>避難は<strong>徒歩</strong>でする</li>
    <li><strong>河川</strong>の周辺は避ける</li>
    <li><strong>木造の建物</strong>は避ける</li>
    <li><strong>鉄筋コンクリート造</strong>の建物の高所へ</li>
    </ul>',
    tsunami: '
    <ul>
    <li>避難は<strong>徒歩</strong>でする</li>
    <li><strong>河川</strong>の周辺は避ける</li>
    <li><strong>木造の建物</strong>は避ける</li>
    <li><strong>鉄筋コンクリート造</strong>の建物の高所へ</li>
    </ul>',
    inundation: '
    <ul>
    <li>水深がひざ丈まである場合は<strong>無理に避難せず</strong>建物内の高所へ</li>
    <li>山などの<strong>斜面で異変</strong>があればすみやかに離れる</li>
    <li><strong>頭を守るもの</strong>をつける</li>
    <li>長靴ではなく<strong>いつもの靴</strong>を使う</li>
    <li><strong>複数人</strong>で避難する</li>
    <li>できるだけ<strong>明るい時間</strong>に避難を</li>
    <li><strong>頑丈な建物</strong>に避難するのも手段</li>
    </ul>',
    eruption: '
    <ul>
    <li><strong>ヘルメット</strong>や<strong>マスク</strong>の着用</li>
    <li><strong>噴煙は谷沿いを流れる</strong>ため避ける</li>
    <li><strong>火山性ガスは窪地</strong>にたまりやすいため避ける</li>
    <li>間に合わなければ<strong>一番近い建物</strong>へ</li>
    <li>建物がなければ<strong>物陰</strong>へ</li>
    <li>視界が悪い時は<strong>大きく動かず</strong>その場で頭部を守る</li>
    </ul>',
    fire: '
    <ul>
    <li>タオルやハンカチで<strong>口を覆う</strong></li>
    <li>できるだけ<strong>姿勢を低く</strong></li>
    <li>燃えている部屋の<strong>ドアは閉める</strong></li>
    <li>鼻から吸って口から吐く</li>
    <li><strong>下の階へ</strong>避難する</li>
    <li>エレベーターは<strong>利用しない</strong></li>
    </ul>',
    typhoon: '
    <ul>
    <li>竜巻の場合は<strong>窓際は避け</strong>、できるだけ<strong>窓のない部屋</strong>へ</li>
    <li>屋外では<strong>物陰やくぼみ</strong>に隠れ、<strong>身を小さく</strong>する</li>
    <li>戸建ての場合はなるべく<strong>1階</strong>へ</li>
    <li>台風の場合は<strong>外へ出ない</strong></li>
    <li>台風は<strong>より高い場所</strong>へ避難する</li>
    <li>流れている<strong>水</strong>に近づかない</li>
    <li><strong>複数人</strong>で行動する</li>
    <li><strong>頭を保護</strong>する</li>
    </ul>',
    earthquakeLink: 'http://google.com',
    floodLink: 'http://google.com',
    hightideLink: 'http://google.com',
    tsunamiLink: 'http://google.com',
    inundationLink: 'http://google.com',
    eruptionLink: 'http://google.com',
    fireLink: 'http://google.com',
    typhoonLink: 'http://google.com'

  sparql:
    url:
      areacode: 'http://statdb.nstac.go.jp/lod/sparql',
      facilities: 'http://54.65.46.57/api/v1/sparql',
    query:
      areacode: [
        'select distinct ?areacode {?s rdfs:label "'
        '"@ja; dcterms:identifier ?areacode.}'],
      baseFacilities: [
        'prefix rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>' + 
        'prefix rdfs:<http://www.w3.org/2000/01/rdf-schema#>' + 
        'prefix odp:<http://odp.jig.jp/odp/1.0#>' + 
        'prefix sac:<http://statdb.nstac.go.jp/lod/sac/C>' + 
        'prefix schema:<http://schema.org/>' + 
        'prefix jrrk:<http://purl.org/jrrk#>' + 
        'prefix geo:<http://www.w3.org/2003/01/geo/wgs84_pos#>' + 
        'prefix imi:<http://imi.ipa.go.jp/ns/core/rdf#>' + 
        'select distinct ?lat ?long ' + 
        '?address ?category ?name ' + 
        '?description ?capacity ?target ' + 
        '?note ?landslide ?sealevel ?height ?telephone {' + 
        '?s rdf:type jrrk:EmergencyFacility;' + 
        'jrrk:refArea sac:' , 
        '; geo:lat ?lat;' + 
        'geo:long ?long.' , 
        'optional {' + 
        '?s imi:住所 ?addressNode.' + 
        '?addressNode imi:表記 ?address.' + 
        '}' + 
        'optional { ?s imi:種別 ?category. }' + 
        'optional { ?s imi:説明 ?description. }' + 
        'optional { ?s odp:capacity ?capacity. }' + 
        'optional {' + 
        '?s odp:target ?targetNode.' + 
        '?targetNode rdfs:label ?target.' + 
        '}' + 
        'optional { ?s schema:telephone ?telephone. }' + 
        'optional { ?s jrrk:notesAboutTarget ?note. }' + 
        'optional { ?s odp:supportLandslide ?landslide. }' + 
        'optional { ?s odp:aboveSeaLevel ?sealevel. }' + 
        'optional { ?s odp:height ?height. }' + 
        'optional {' + 
        '?s imi:名称 ?nameNode.' + 
        '?nameNode imi:表記 ?name.' + 
        '}' + 
        '}' 
      ]
      kind:
        earthquake: '?s odp:supportEarthquake true.'
        flood: '?s odp:supportFlood true.'
        hightide: '?s odp:supportHighTide true.'
        tsunami: '?s odp:supportTsunami true.'
        inundation: '?s odp:supportInundation true.'
        eruption: '?s odp:supportVolcanic true.'
        fire: '?s odp:supportLargeFire true.'
        typhoon: ''
        others: ''

  information:
    capacity: '収容人数 : '
    target: '対象地区 : '
    landslide:
      true: '土砂災害○'
      false: '土砂災害×'
    sealevel: '海抜 : '
    height: '建物の高さ : '
    here: 'ここへ避難する'

  heightDescription: '避難高度'

  error: 
    geolocation: '現在地の取得に失敗しました。位置情報の使用を許可してください。'

  license:
    data:
      title: 'オープンデータ'
      text: 'このアプリは以下のオープンデータを利用しています'
      def:
        titles: [
          '避難所データ'
          '自治体コード'
        ]
        descriptions: [
          'powered by <a href="http://odp.jig.jp/" about="_blank">オープンデータプラットフォーム</a>'
          '<a href="http://statdb.nstac.go.jp/" about="_blank">次世代統計利用システム</a>
          <small>このサービスは、次世代統計利用システムのAPI機能を使用していますが、' +
          'サービスの内容は総務省統計局又は独立行政法人統計センターによって' +
          '保証されたものではありません。</small>'
        ]
    library:
      title: 'ライブラリ'
      text: 'このアプリは以下のライブラリを利用しています'
      def:
        titles: [
          'jQuery v1.10.2'
          'jquery.jsonp 2.4.0'
          '<a href="https://github.com/js-coder/x18n" about="_blank">x18n</a>'
          '<a href="http://benalman.com/about/license/" about="_blank">jQuery hashchange event v1.3</a>'
        ]
        descriptions: [
          '(c) 2005, 2013 jQuery Foundation, Inc.'
          '(c) 2012 Julian Aubourg'
          '(c) 2012 Florian H.'
          '(c) 2010 "Cowboy" Ben AlmanDual licensed under the MIT and GPL licenses.'
        ]


