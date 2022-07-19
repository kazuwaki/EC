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

$(document).on('turbolinks:load', function(){
  $('.slick-track').slick({
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
    autoplay: true, //自動再生
    autoplaySpeed: 600,
    arrows: false,//再生スピード
  })
});