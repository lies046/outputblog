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
    $('.icon_image').hover(
      function(){
      $('.mypage_edit').fadeIn();
      },
      function(){
        $('.mypage_edit').fadeOut(2000);
      });
    });