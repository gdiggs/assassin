(function($){ 
  $('.log-kill-link').live('click', function(){
    $('.log-kill').slideDown(200);
    $(this).slideUp(200);
  });
})(jQuery);