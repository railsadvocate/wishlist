Wishlist = (function($, Wishlist, window, document, undefined) {
  Wishlist.notepad = {
    setHeightOfRedLines : function() {
      var notepadHeight = $('.notepad').height() - $('.notepad-top').height()-7;
      $('.notepad-vertical-lines > div').height(notepadHeight);
    }
  };

  Wishlist.fillProgressBar = function(fill) {
    var $progressBar = $('.wishlist-progress-bar > ol:nth-child(2)');
    var $progressBubble;
    if (fill === 1) {
      $progressBubble = $progressBar.find('li:first-child');
      $progressBubble.css("background-color", "#0B9444");
      $progressBar.find('li').css("opacity", .2);
    } else if (fill === 2) {
      $progressBar.find('li').css('opacity', .2);
      $progressBar.find('li:first-child').css('opacity', 1);
    } else if (fill === 3) {
      $progressBar.find('li').css('opacity', 1);
      $progressBar.find('li:last-child').css('opacity', .2);
    } else {
      $progressBar.find('li').css('opacity', 1);
    }
  };

  return Wishlist;
})(jQuery, window.Wishlist || {}, this, this.document);

$(document).on('turbolinks:load', function() {
  var $body = $('body');
  var hasGiftLists = $body.hasClass('giftlists');
  var hasGifts = $body.hasClass('gifts');
  if (hasGiftLists && $body.hasClass('show')) {
    Wishlist.notepad.setHeightOfRedLines();
  }
  if (hasGiftLists && $body.hasClass('new')) {
    Wishlist.fillProgressBar(1);
  }
  if (hasGifts && $body.hasClass('new')) {
    Wishlist.fillProgressBar(2);
  }

  $('.wishlist-examples').click(function() {
    $('.example-wishlists > li').fadeToggle();
    var $chevron = $(this).closest('.new-wishlist-form-wrapper').find('.glyphicon-chevron-down');
    if ($chevron.css( "transform" ) == 'none' ){
      $chevron.css("transform","rotate(180deg)");
    } else {
      $chevron.css("transform","");
    }
  });

});