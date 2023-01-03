
$(document).on('turbolinks:load', function () {
  console.log("home.jsを読み込んでいます！");

  $('.flow-image').on("click", function () {
    console.log("画像を表示する");
    $("#flow-gray-display").html($(this).prop("outerHTML"));
    $("#flow-gray-display, #gray-image-contents").fadeIn(200);
  });

  $("#flow-gray-display, #flow-gray-display img, #gray-image-contents").on("click", function () {
    console.log("画像を消す");
    $("#flow-gray-display, #gray-image-contents").fadeOut(200);
  });
  /*
  スクロールボタン
  */
  var $scrollBtn = $('#scroll-btn');
  // var $navbar = $('#scroll-nav');
  $scrollBtn.hide();
  // $navbar.hide();

  $scrollBtn.click(function() {
    $('html, body').animate({
      'scrollTop': '0'
    }, 300);
  });

  $(window).scroll(function () {
    if ($(this).scrollTop() <= 100) {
      // $navbar.hide();
      $scrollBtn.hide();
    // } else if ($(this).scrollTop() <= 1000) {
      // $navbar.show();
      $scrollBtn.fadeOut();
    } else {
      $scrollBtn.fadeIn();
    }
  });
});

$(document).ready(function () {

  $(window).scroll(function () {
    $('.fadein').each(function () {
      var elemPos = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > elemPos - windowHeight + 200) {
        $(this).addClass('scrollin');
      }
    });
  });

  // setInterval(function () {
  //   var $active = $('#slideshow img.active');

  //   if ($active.length == 0) $active = $('#slideshow img:last');

  //   var $next = $active.next().length ? $active.next()
  //     : $('#slideshow img:first');

  //   $active.addClass('last-active');

  //   $next.css({ opacity: 0.0 })
  //     .addClass('active')
  //     .animate({ opacity: 1.0 }, 3000, function () {
  //       $active.removeClass('active last-active');
  //     });
  //   }, 4000);

  // $('a[href^="#"]').click(function () {
  //   var time = 500;
  //   var href = $(this).attr('href');
  //   var target = $(href == '#' ? 'html' : href);
  //   var distance = target.offset().top;
  //   $('html, body').animate({ scrollTop: distance }, time, 'swing');
  //   return false;
  // });
});
