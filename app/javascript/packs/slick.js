/* global $*/
$(document).on('turbolinks:load', function(){
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed:2000,
    fade:true,
    arrows: false,
  });

});