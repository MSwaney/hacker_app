$(function() {
  $('.click').click(function() {
    $(this).siblings().toggle();
  });
});