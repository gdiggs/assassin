(function($){
  $('.log-kill-link').live('click', function(){
    $('.log-kill').slideDown(200);
    $(this).slideUp(200);
  });

  $('.log-kill form').live('submit', function(e){
    $form = $(this);
    e.preventDefault();

    $.ajax({
      url: $form.attr('action'),
      type: 'post',
      data: $form.serialize(),
      dataType: 'json',
      success: function(){
        alert("oh yeah");
      }
    });

    return false;
  });



})(jQuery);