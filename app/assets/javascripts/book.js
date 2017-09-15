$(document).on('turbolinks:load', function(){
  $('.dropdown-menu li a').click(function(){
    $('#book-index-dropdown-header').text($(this).text());
  });
});
