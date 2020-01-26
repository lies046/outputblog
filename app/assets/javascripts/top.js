$(function() {
  $('.top__logo h1').hover(
    function(){
    $('.top__btn').fadeIn(3000);
    },
    function(){
      $('.top__btn').fadeOut(3000);
    });
  });

  $(function() {
    $('.icon-image').hover(
      function(){
      $('.mypage-edit').fadeIn();
      },
      function(){
        $('.mypage-edit').fadeOut(2000);
      });
    });