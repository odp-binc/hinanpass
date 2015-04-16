(function() {
  x18n.register('ja', {
    navbar: {
      title: 'ヒナンくん',
      back: '戻る',
      menu: 'メニュー'
    },
    buttonList: {
      description: {
        sentenceBeforeButton: '対応する災害の',
        sampleButton: 'ボタン',
        sentenceAfterButton: 'をタッチ'
      },
      buttons: {
        earthquakeButton: '地震',
        floodButton: '洪水',
        highTideButton: '高潮',
        tsunamiButton: '津波',
        inundationButton: '浸水',
        eruptionButton: '噴火',
        fireButton: '火事',
        typhoonButton: '風水<br>被害',
        othersButton: 'その<br>ほか'
      }
    },
    guidance: {
      goToNext: '次に進む',
      linkToDetail: '詳しくはこちら',
      earthquake: '<ul> <li><strong>火</strong>を消す</li> <li><strong>落下物</strong>や<strong>足元</strong>に注意</li> <li><strong>暖房器具</strong>を消す</li> <li><strong>ブレーカー</strong>を切る</li> <li>下敷きになったら大声で<strong>助けを呼ぶ</strong></li> <li>火災が起きたら<strong>消火器</strong>で初期消火を</li> <li>消化も下敷きも<strong>みんなで</strong>協力して救助</li> </ul>',
      earthquakeLink: 'http://google.com'
    }
  });

}).call(this);

(function() {
  window.buttonList = function() {
    var descriptionCreate, disasterButtonCreate, disasterButtonMaker, partsReset;
    partsReset = function() {
      $('#contents').html('<div id="description" class="top-description"></div>');
      return $('#contents').append('<div id="buttonWrapper"></div>');
    };
    disasterButtonMaker = function(appendElement, buttonClassName, buttonIdName) {
      $(appendElement).append('<div id="' + buttonIdName + '" class="button ' + buttonClassName + '"><p>' + t('buttonList.buttons.' + buttonIdName) + '</p></div>');
      return $('#' + buttonIdName).on('click', function() {
        window.prev = buttonList;
        $('#backButton').text('< ' + t('navbar.back'));
        return guidance(buttonClassName);
      });
    };
    descriptionCreate = function() {
      $('#description').append(t('buttonList.description.sentenceBeforeButton') + '<br>');
      $('#description').append('<div class="button button-sample">' + t('buttonList.description.sampleButton') + '</div>');
      return $('#description').append(t('buttonList.description.sentenceAfterButton'));
    };
    disasterButtonCreate = function() {
      disasterButtonMaker('#buttonWrapper', 'button-earthquake', 'earthquakeButton');
      disasterButtonMaker('#buttonWrapper', 'button-flood', 'floodButton');
      disasterButtonMaker('#buttonWrapper', 'button-high-tide', 'highTideButton');
      disasterButtonMaker('#buttonWrapper', 'button-tsunami', 'tsunamiButton');
      disasterButtonMaker('#buttonWrapper', 'button-inundation', 'inundationButton');
      disasterButtonMaker('#buttonWrapper', 'button-eruption', 'eruptionButton');
      disasterButtonMaker('#buttonWrapper', 'button-fire', 'fireButton');
      disasterButtonMaker('#buttonWrapper', 'button-typhoon', 'typhoonButton');
      return disasterButtonMaker('#buttonWrapper', 'button-others', 'othersButton');
    };
    partsReset();
    descriptionCreate();
    return disasterButtonCreate();
  };

}).call(this);

(function() {
  window.guidance = function(disasterClassName) {
    var descriptionCreate, guideInsert, partsReset;
    if (disasterClassName == null) {
      disasterClassName = 'button-earthquake';
    }
    partsReset = function() {
      $('#contents').html('<div id="description" class="guidance-description"></div>');
      $('#contents').append('<div id="guideWrapper" class="guide-wrapper"></div>');
      return window.desasterName = disasterClassName.match(/[a-z]+/g)[1];
    };
    descriptionCreate = function() {
      $('#description').append('<div id="nextButton" class="button-next ' + disasterClassName + '">' + t('guidance.goToNext') + '</div>');
      return $('#nextButton').on('click', function() {
        return console.log('clicked');
      });
    };
    guideInsert = function() {
      $('#guideWrapper').append(t('guidance.' + desasterName));
      return $('#guideWrapper').append('<a href="' + t('guidance.' + desasterName + 'Link') + '" class="link-to-detail link-' + desasterName + '" target="_blank">' + t('guidance.linkToDetail') + '</a>');
    };
    partsReset();
    descriptionCreate();
    return guideInsert();
  };

}).call(this);

(function() {
  window.onload = function() {
    navbarReset();
    return guidance();
  };

}).call(this);

(function() {
  window.navbarReset = function() {
    $('#navButton').on('click', function() {
      return $('#pageNav').slideToggle('fast');
    });
    $('#navButton').text(t('navbar.menu'));
    $('.navbar h1').text(t('navbar.title'));
    return $('nav#pageNav ul').html('<li>koumoku</li>');
  };

}).call(this);
