$(document).on('turbolinks:load', function(){
  $('.dropdown-menu li a').click(function(){
    $('#book-index-dropdown-header').text($(this).text());
  });

  $('.datepicker').datepicker({
    dateFormat: 'yy-mm-dd',
    autoclose: true,
    weekStart: 1
  });

  $('#index-clear').click(function(){
    $('#index-title').val('');
    $('#index-author').val('');
    $('#index-from').val('');
    $('#index-to').val('');
  });
});
