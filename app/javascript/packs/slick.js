/* global $*/
$(document).on('turbolinks:load', function(){
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed:2000,
    fade:true,
    arrows: false,
  });

});

$(document).on('turbolinks:load', function(){
  $('.slider-top').slick({
    centerMode: true,
    centerPadding: '25%',
    arrows: false,
    autoplay: true, //自動再生
    autoplaySpeed: 4000, //再生スピード
  });

});

