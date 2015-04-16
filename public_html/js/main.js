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
    }
  });

}).call(this);

(function() {
  window.buttonList = function() {
    var buttonMaker, descriptionCreate, disasterButtonCreate, partsReset;
    partsReset = function() {
      $('#contents').html('<div id="description" class="top-description"></div>');
      return $('#contents').append('<div id="buttonWrapper"></div>');
    };
    buttonMaker = function(appendElement, buttonClassName, buttonIdName) {
      $(appendElement).append('<div id="' + buttonIdName + '" class="button ' + buttonClassName + '"><p>' + t('buttonList.buttons.' + buttonIdName) + '</p></div>');
      return $('#' + buttonIdName).on('click', function() {
        return console.log('clicked');
      });
    };
    descriptionCreate = function() {
      $('#description').append(t('buttonList.description.sentenceBeforeButton') + '<br>');
      $('#description').append('<div class="button button-sample">' + t('buttonList.description.sampleButton') + '</div>');
      return $('#description').append(t('buttonList.description.sentenceAfterButton'));
    };
    disasterButtonCreate = function() {
      buttonMaker('#buttonWrapper', 'button-earthquake', 'earthquakeButton');
      buttonMaker('#buttonWrapper', 'button-flood', 'floodButton');
      buttonMaker('#buttonWrapper', 'button-high-tide', 'highTideButton');
      buttonMaker('#buttonWrapper', 'button-tsunami', 'tsunamiButton');
      buttonMaker('#buttonWrapper', 'button-inundation', 'inundationButton');
      buttonMaker('#buttonWrapper', 'button-eruption', 'eruptionButton');
      buttonMaker('#buttonWrapper', 'button-fire', 'fireButton');
      buttonMaker('#buttonWrapper', 'button-typhoon', 'typhoonButton');
      return buttonMaker('#buttonWrapper', 'button-others', 'othersButton');
    };
    partsReset();
    descriptionCreate();
    return disasterButtonCreate();
  };

}).call(this);

(function() {


}).call(this);

(function() {
  window.onload = function() {
    navbarReset();
    return buttonList();
  };

}).call(this);

(function() {
  window.navbarReset = function() {
    $('#navButton').on('click', function() {
      return $('#pageNav').slideToggle('fast');
    });
    $('#backButton').text('< ' + t('navbar.back'));
    $('#navButton').text(t('navbar.menu'));
    $('.navbar h1').text(t('navbar.title'));
    return $('nav#pageNav ul').html('<li>koumoku</li>');
  };

}).call(this);
